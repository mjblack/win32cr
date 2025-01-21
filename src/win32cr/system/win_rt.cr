require "./com.cr"
require "./../foundation.cr"
require "./../ui/shell/properties_system.cr"
require "./com/marshal.cr"

module Win32cr::System::WinRT
  alias HSTRING = LibC::IntPtrT
  alias HSTRING_BUFFER = LibC::IntPtrT
  alias ROPARAMIIDHANDLE = LibC::IntPtrT
  alias APARTMENT_SHUTDOWN_REGISTRATION_COOKIE = LibC::IntPtrT
  alias PINSPECT_HSTRING_CALLBACK = Proc(Void*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT)*

  alias PINSPECT_HSTRING_CALLBACK2 = Proc(Void*, UInt64, UInt32, UInt8*, Win32cr::Foundation::HRESULT)*

  alias PINSPECT_MEMORY_CALLBACK = Proc(Void*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT)*

  MAX_ERROR_MESSAGE_CHARS = 512_u32
  CastingSourceInfo_Property_PreferredSourceUriScheme = "PreferredSourceUriScheme"
  CastingSourceInfo_Property_CastingTypes = "CastingTypes"
  CastingSourceInfo_Property_ProtectedMedia = "ProtectedMedia"

  enum ACTIVATIONTYPE
    ACTIVATIONTYPE_UNCATEGORIZED = 0_i32
    ACTIVATIONTYPE_FROM_MONIKER = 1_i32
    ACTIVATIONTYPE_FROM_DATA = 2_i32
    ACTIVATIONTYPE_FROM_STORAGE = 4_i32
    ACTIVATIONTYPE_FROM_STREAM = 8_i32
    ACTIVATIONTYPE_FROM_FILE = 16_i32
  end
  enum AgileReferenceOptions
    AGILEREFERENCE_DEFAULT = 0_i32
    AGILEREFERENCE_DELAYEDMARSHAL = 1_i32
  end
  enum TrustLevel
    BaseTrust = 0_i32
    PartialTrust = 1_i32
    FullTrust = 2_i32
  end
  enum DISPATCHERQUEUE_THREAD_APARTMENTTYPE
    DQTAT_COM_NONE = 0_i32
    DQTAT_COM_ASTA = 1_i32
    DQTAT_COM_STA = 2_i32
  end
  enum DISPATCHERQUEUE_THREAD_TYPE
    DQTYPE_THREAD_DEDICATED = 1_i32
    DQTYPE_THREAD_CURRENT = 2_i32
  end
  enum CASTING_CONNECTION_ERROR_STATUS
    CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED = 0_i32
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND = 1_i32
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR = 2_i32
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED = 3_i32
    CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED = 4_i32
    CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE = 5_i32
    CASTING_CONNECTION_ERROR_STATUS_UNKNOWN = 6_i32
  end
  enum CASTING_CONNECTION_STATE
    CASTING_CONNECTION_STATE_DISCONNECTED = 0_i32
    CASTING_CONNECTION_STATE_CONNECTED = 1_i32
    CASTING_CONNECTION_STATE_RENDERING = 2_i32
    CASTING_CONNECTION_STATE_DISCONNECTING = 3_i32
    CASTING_CONNECTION_STATE_CONNECTING = 4_i32
  end
  enum RO_INIT_TYPE
    RO_INIT_SINGLETHREADED = 0_i32
    RO_INIT_MULTITHREADED = 1_i32
  end
  @[Flags]
  enum RO_ERROR_REPORTING_FLAGS : UInt32
    RO_ERROR_REPORTING_NONE = 0_u32
    RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS = 1_u32
    RO_ERROR_REPORTING_FORCEEXCEPTIONS = 2_u32
    RO_ERROR_REPORTING_USESETERRORINFO = 4_u32
    RO_ERROR_REPORTING_SUPPRESSSETERRORINFO = 8_u32
  end
  enum BSOS_OPTIONS
    BSOS_DEFAULT = 0_i32
    BSOS_PREFERDESTINATIONSTREAM = 1_i32
  end

  @[Extern]
  record EventRegistrationToken,
    value : Int64

  @[Extern]
  record HSTRING_HEADER,
    flags : UInt32,
    length : UInt32,
    padding1 : UInt32,
    padding2 : UInt32,
    data : LibC::IntPtrT

  @[Extern]
  record ServerInformation,
    dwServerPid : UInt32,
    dwServerTid : UInt32,
    ui64ServerAddress : UInt64

  @[Extern]
  record DispatcherQueueOptions,
    dwSize : UInt32,
    threadType : Win32cr::System::WinRT::DISPATCHERQUEUE_THREAD_TYPE,
    apartmentType : Win32cr::System::WinRT::DISPATCHERQUEUE_THREAD_APARTMENTTYPE

  @[Extern]
  record RO_REGISTRATION_COOKIE_
  @[Extern]
  record IAgileReferenceVtbl,
    query_interface : Proc(IAgileReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAgileReference*, UInt32),
    release : Proc(IAgileReference*, UInt32),
    resolve : Proc(IAgileReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c03f6a43-65a4-9818-987e-e0b810d2a6f2")]
  record IAgileReference, lpVtbl : IAgileReferenceVtbl* do
    GUID = LibC::GUID.new(0xc03f6a43_u32, 0x65a4_u16, 0x9818_u16, StaticArray[0x98_u8, 0x7e_u8, 0xe0_u8, 0xb8_u8, 0x10_u8, 0xd2_u8, 0xa6_u8, 0xf2_u8])
    def query_interface(this : IAgileReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAgileReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAgileReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resolve(this : IAgileReference*, riid : LibC::GUID*, ppvObjectReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve.call(this, riid, ppvObjectReference)
    end

  end

  @[Extern]
  record IApartmentShutdownVtbl,
    query_interface : Proc(IApartmentShutdown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApartmentShutdown*, UInt32),
    release : Proc(IApartmentShutdown*, UInt32),
    on_uninitialize : Proc(IApartmentShutdown*, UInt64, Void)


  @[Extern]
  #@[Com("a2f05a09-27a2-42b5-bc0e-ac163ef49d9b")]
  record IApartmentShutdown, lpVtbl : IApartmentShutdownVtbl* do
    GUID = LibC::GUID.new(0xa2f05a09_u32, 0x27a2_u16, 0x42b5_u16, StaticArray[0xbc_u8, 0xe_u8, 0xac_u8, 0x16_u8, 0x3e_u8, 0xf4_u8, 0x9d_u8, 0x9b_u8])
    def query_interface(this : IApartmentShutdown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApartmentShutdown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApartmentShutdown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_uninitialize(this : IApartmentShutdown*, ui64ApartmentIdentifier : UInt64) : Void
      @lpVtbl.try &.value.on_uninitialize.call(this, ui64ApartmentIdentifier)
    end

  end

  @[Extern]
  record ISpatialInteractionManagerInteropVtbl,
    query_interface : Proc(ISpatialInteractionManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpatialInteractionManagerInterop*, UInt32),
    release : Proc(ISpatialInteractionManagerInterop*, UInt32),
    get_iids : Proc(ISpatialInteractionManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ISpatialInteractionManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ISpatialInteractionManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(ISpatialInteractionManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c4ee536-6a98-4b86-a170-587013d6fd4b")]
  record ISpatialInteractionManagerInterop, lpVtbl : ISpatialInteractionManagerInteropVtbl* do
    GUID = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
    def query_interface(this : ISpatialInteractionManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpatialInteractionManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpatialInteractionManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ISpatialInteractionManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ISpatialInteractionManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ISpatialInteractionManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : ISpatialInteractionManagerInterop*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, spatialInteractionManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, window, riid, spatialInteractionManager)
    end

  end

  @[Extern]
  record IHolographicSpaceInteropVtbl,
    query_interface : Proc(IHolographicSpaceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolographicSpaceInterop*, UInt32),
    release : Proc(IHolographicSpaceInterop*, UInt32),
    get_iids : Proc(IHolographicSpaceInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IHolographicSpaceInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IHolographicSpaceInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_for_window : Proc(IHolographicSpaceInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c4ee536-6a98-4b86-a170-587013d6fd4b")]
  record IHolographicSpaceInterop, lpVtbl : IHolographicSpaceInteropVtbl* do
    GUID = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
    def query_interface(this : IHolographicSpaceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolographicSpaceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolographicSpaceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IHolographicSpaceInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IHolographicSpaceInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IHolographicSpaceInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_for_window(this : IHolographicSpaceInterop*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, holographicSpace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_for_window.call(this, window, riid, holographicSpace)
    end

  end

  @[Extern]
  record IInspectableVtbl,
    query_interface : Proc(IInspectable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInspectable*, UInt32),
    release : Proc(IInspectable*, UInt32),
    get_iids : Proc(IInspectable*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IInspectable*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IInspectable*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("af86e2e0-b12d-4c6a-9c5a-d7aa65101e90")]
  record IInspectable, lpVtbl : IInspectableVtbl* do
    GUID = LibC::GUID.new(0xaf86e2e0_u32, 0xb12d_u16, 0x4c6a_u16, StaticArray[0x9c_u8, 0x5a_u8, 0xd7_u8, 0xaa_u8, 0x65_u8, 0x10_u8, 0x1e_u8, 0x90_u8])
    def query_interface(this : IInspectable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInspectable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInspectable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IInspectable*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IInspectable*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IInspectable*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end

  end

  @[Extern]
  record IAccountsSettingsPaneInteropVtbl,
    query_interface : Proc(IAccountsSettingsPaneInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccountsSettingsPaneInterop*, UInt32),
    release : Proc(IAccountsSettingsPaneInterop*, UInt32),
    get_iids : Proc(IAccountsSettingsPaneInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IAccountsSettingsPaneInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IAccountsSettingsPaneInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IAccountsSettingsPaneInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    show_manage_accounts_for_window_async : Proc(IAccountsSettingsPaneInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    show_add_account_for_window_async : Proc(IAccountsSettingsPaneInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d3ee12ad-3865-4362-9746-b75a682df0e6")]
  record IAccountsSettingsPaneInterop, lpVtbl : IAccountsSettingsPaneInteropVtbl* do
    GUID = LibC::GUID.new(0xd3ee12ad_u32, 0x3865_u16, 0x4362_u16, StaticArray[0x97_u8, 0x46_u8, 0xb7_u8, 0x5a_u8, 0x68_u8, 0x2d_u8, 0xf0_u8, 0xe6_u8])
    def query_interface(this : IAccountsSettingsPaneInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccountsSettingsPaneInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccountsSettingsPaneInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IAccountsSettingsPaneInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IAccountsSettingsPaneInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IAccountsSettingsPaneInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IAccountsSettingsPaneInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, accountsSettingsPane : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, accountsSettingsPane)
    end
    def show_manage_accounts_for_window_async(this : IAccountsSettingsPaneInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, asyncAction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_manage_accounts_for_window_async.call(this, appWindow, riid, asyncAction)
    end
    def show_add_account_for_window_async(this : IAccountsSettingsPaneInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, asyncAction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_add_account_for_window_async.call(this, appWindow, riid, asyncAction)
    end

  end

  @[Extern]
  record IAppServiceConnectionExtendedExecutionVtbl,
    query_interface : Proc(IAppServiceConnectionExtendedExecution*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppServiceConnectionExtendedExecution*, UInt32),
    release : Proc(IAppServiceConnectionExtendedExecution*, UInt32),
    open_for_extended_execution_async : Proc(IAppServiceConnectionExtendedExecution*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("65219584-f9cb-4ae3-81f9-a28a6ca450d9")]
  record IAppServiceConnectionExtendedExecution, lpVtbl : IAppServiceConnectionExtendedExecutionVtbl* do
    GUID = LibC::GUID.new(0x65219584_u32, 0xf9cb_u16, 0x4ae3_u16, StaticArray[0x81_u8, 0xf9_u8, 0xa2_u8, 0x8a_u8, 0x6c_u8, 0xa4_u8, 0x50_u8, 0xd9_u8])
    def query_interface(this : IAppServiceConnectionExtendedExecution*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppServiceConnectionExtendedExecution*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppServiceConnectionExtendedExecution*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_for_extended_execution_async(this : IAppServiceConnectionExtendedExecution*, riid : LibC::GUID*, operation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_for_extended_execution_async.call(this, riid, operation)
    end

  end

  @[Extern]
  record ICorrelationVectorSourceVtbl,
    query_interface : Proc(ICorrelationVectorSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorrelationVectorSource*, UInt32),
    release : Proc(ICorrelationVectorSource*, UInt32),
    get_CorrelationVector : Proc(ICorrelationVectorSource*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("152b8a3b-b9b9-4685-b56e-974847bc7545")]
  record ICorrelationVectorSource, lpVtbl : ICorrelationVectorSourceVtbl* do
    GUID = LibC::GUID.new(0x152b8a3b_u32, 0xb9b9_u16, 0x4685_u16, StaticArray[0xb5_u8, 0x6e_u8, 0x97_u8, 0x48_u8, 0x47_u8, 0xbc_u8, 0x75_u8, 0x45_u8])
    def query_interface(this : ICorrelationVectorSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorrelationVectorSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorrelationVectorSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CorrelationVector(this : ICorrelationVectorSource*, cv : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CorrelationVector.call(this, cv)
    end

  end

  @[Extern]
  record ICastingEventHandlerVtbl,
    query_interface : Proc(ICastingEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICastingEventHandler*, UInt32),
    release : Proc(ICastingEventHandler*, UInt32),
    on_state_changed : Proc(ICastingEventHandler*, Win32cr::System::WinRT::CASTING_CONNECTION_STATE, Win32cr::Foundation::HRESULT),
    on_error : Proc(ICastingEventHandler*, Win32cr::System::WinRT::CASTING_CONNECTION_ERROR_STATUS, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc")]
  record ICastingEventHandler, lpVtbl : ICastingEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xc79a6cb7_u32, 0xbebd_u16, 0x47a6_u16, StaticArray[0xa2_u8, 0xad_u8, 0x4d_u8, 0x45_u8, 0xad_u8, 0x79_u8, 0xc7_u8, 0xbc_u8])
    def query_interface(this : ICastingEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICastingEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICastingEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_state_changed(this : ICastingEventHandler*, newState : Win32cr::System::WinRT::CASTING_CONNECTION_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_state_changed.call(this, newState)
    end
    def on_error(this : ICastingEventHandler*, errorStatus : Win32cr::System::WinRT::CASTING_CONNECTION_ERROR_STATUS, errorMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, errorStatus, errorMessage)
    end

  end

  @[Extern]
  record ICastingControllerVtbl,
    query_interface : Proc(ICastingController*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICastingController*, UInt32),
    release : Proc(ICastingController*, UInt32),
    initialize__ : Proc(ICastingController*, Void*, Void*, Win32cr::Foundation::HRESULT),
    connect : Proc(ICastingController*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(ICastingController*, Win32cr::Foundation::HRESULT),
    advise : Proc(ICastingController*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    un_advise : Proc(ICastingController*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0a56423-a664-4fbd-8b43-409a45e8d9a1")]
  record ICastingController, lpVtbl : ICastingControllerVtbl* do
    GUID = LibC::GUID.new(0xf0a56423_u32, 0xa664_u16, 0x4fbd_u16, StaticArray[0x8b_u8, 0x43_u8, 0x40_u8, 0x9a_u8, 0x45_u8, 0xe8_u8, 0xd9_u8, 0xa1_u8])
    def query_interface(this : ICastingController*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICastingController*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICastingController*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICastingController*, castingEngine : Void*, castingSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, castingEngine, castingSource)
    end
    def connect(this : ICastingController*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this)
    end
    def disconnect(this : ICastingController*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def advise(this : ICastingController*, eventHandler : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, eventHandler, cookie)
    end
    def un_advise(this : ICastingController*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_advise.call(this, cookie)
    end

  end

  @[Extern]
  record ICastingSourceInfoVtbl,
    query_interface : Proc(ICastingSourceInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICastingSourceInfo*, UInt32),
    release : Proc(ICastingSourceInfo*, UInt32),
    get_controller : Proc(ICastingSourceInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(ICastingSourceInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45101ab7-7c3a-4bce-9500-12c09024b298")]
  record ICastingSourceInfo, lpVtbl : ICastingSourceInfoVtbl* do
    GUID = LibC::GUID.new(0x45101ab7_u32, 0x7c3a_u16, 0x4bce_u16, StaticArray[0x95_u8, 0x0_u8, 0x12_u8, 0xc0_u8, 0x90_u8, 0x24_u8, 0xb2_u8, 0x98_u8])
    def query_interface(this : ICastingSourceInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICastingSourceInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICastingSourceInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_controller(this : ICastingSourceInfo*, controller : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_controller.call(this, controller)
    end
    def get_properties(this : ICastingSourceInfo*, props : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, props)
    end

  end

  @[Extern]
  record IDragDropManagerInteropVtbl,
    query_interface : Proc(IDragDropManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDragDropManagerInterop*, UInt32),
    release : Proc(IDragDropManagerInterop*, UInt32),
    get_iids : Proc(IDragDropManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IDragDropManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IDragDropManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IDragDropManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5ad8cba7-4c01-4dac-9074-827894292d63")]
  record IDragDropManagerInterop, lpVtbl : IDragDropManagerInteropVtbl* do
    GUID = LibC::GUID.new(0x5ad8cba7_u32, 0x4c01_u16, 0x4dac_u16, StaticArray[0x90_u8, 0x74_u8, 0x82_u8, 0x78_u8, 0x94_u8, 0x29_u8, 0x2d_u8, 0x63_u8])
    def query_interface(this : IDragDropManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDragDropManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDragDropManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IDragDropManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IDragDropManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IDragDropManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IDragDropManagerInterop*, hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, hwnd, riid, ppv)
    end

  end

  @[Extern]
  record IInputPaneInteropVtbl,
    query_interface : Proc(IInputPaneInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInputPaneInterop*, UInt32),
    release : Proc(IInputPaneInterop*, UInt32),
    get_iids : Proc(IInputPaneInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IInputPaneInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IInputPaneInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IInputPaneInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("75cf2c57-9195-4931-8332-f0b409e916af")]
  record IInputPaneInterop, lpVtbl : IInputPaneInteropVtbl* do
    GUID = LibC::GUID.new(0x75cf2c57_u32, 0x9195_u16, 0x4931_u16, StaticArray[0x83_u8, 0x32_u8, 0xf0_u8, 0xb4_u8, 0x9_u8, 0xe9_u8, 0x16_u8, 0xaf_u8])
    def query_interface(this : IInputPaneInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInputPaneInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInputPaneInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IInputPaneInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IInputPaneInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IInputPaneInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IInputPaneInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, inputPane : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, inputPane)
    end

  end

  @[Extern]
  record IPlayToManagerInteropVtbl,
    query_interface : Proc(IPlayToManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPlayToManagerInterop*, UInt32),
    release : Proc(IPlayToManagerInterop*, UInt32),
    get_iids : Proc(IPlayToManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IPlayToManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IPlayToManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IPlayToManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    show_play_to_ui_for_window : Proc(IPlayToManagerInterop*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("24394699-1f2c-4eb3-8cd7-0ec1da42a540")]
  record IPlayToManagerInterop, lpVtbl : IPlayToManagerInteropVtbl* do
    GUID = LibC::GUID.new(0x24394699_u32, 0x1f2c_u16, 0x4eb3_u16, StaticArray[0x8c_u8, 0xd7_u8, 0xe_u8, 0xc1_u8, 0xda_u8, 0x42_u8, 0xa5_u8, 0x40_u8])
    def query_interface(this : IPlayToManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPlayToManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPlayToManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IPlayToManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IPlayToManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IPlayToManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IPlayToManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, playToManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, playToManager)
    end
    def show_play_to_ui_for_window(this : IPlayToManagerInterop*, appWindow : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_play_to_ui_for_window.call(this, appWindow)
    end

  end

  @[Extern]
  record ICorrelationVectorInformationVtbl,
    query_interface : Proc(ICorrelationVectorInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorrelationVectorInformation*, UInt32),
    release : Proc(ICorrelationVectorInformation*, UInt32),
    get_iids : Proc(ICorrelationVectorInformation*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ICorrelationVectorInformation*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ICorrelationVectorInformation*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_LastCorrelationVectorForThread : Proc(ICorrelationVectorInformation*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_NextCorrelationVectorForThread : Proc(ICorrelationVectorInformation*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    put_NextCorrelationVectorForThread : Proc(ICorrelationVectorInformation*, Win32cr::System::WinRT::HSTRING, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("83c78b3c-d88b-4950-aa6e-22b8d22aabd3")]
  record ICorrelationVectorInformation, lpVtbl : ICorrelationVectorInformationVtbl* do
    GUID = LibC::GUID.new(0x83c78b3c_u32, 0xd88b_u16, 0x4950_u16, StaticArray[0xaa_u8, 0x6e_u8, 0x22_u8, 0xb8_u8, 0xd2_u8, 0x2a_u8, 0xab_u8, 0xd3_u8])
    def query_interface(this : ICorrelationVectorInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorrelationVectorInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorrelationVectorInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ICorrelationVectorInformation*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ICorrelationVectorInformation*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ICorrelationVectorInformation*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_LastCorrelationVectorForThread(this : ICorrelationVectorInformation*, cv : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastCorrelationVectorForThread.call(this, cv)
    end
    def get_NextCorrelationVectorForThread(this : ICorrelationVectorInformation*, cv : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NextCorrelationVectorForThread.call(this, cv)
    end
    def put_NextCorrelationVectorForThread(this : ICorrelationVectorInformation*, cv : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NextCorrelationVectorForThread.call(this, cv)
    end

  end

  @[Extern]
  record IUIViewSettingsInteropVtbl,
    query_interface : Proc(IUIViewSettingsInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIViewSettingsInterop*, UInt32),
    release : Proc(IUIViewSettingsInterop*, UInt32),
    get_iids : Proc(IUIViewSettingsInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IUIViewSettingsInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IUIViewSettingsInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IUIViewSettingsInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3694dbf9-8f68-44be-8ff5-195c98ede8a6")]
  record IUIViewSettingsInterop, lpVtbl : IUIViewSettingsInteropVtbl* do
    GUID = LibC::GUID.new(0x3694dbf9_u32, 0x8f68_u16, 0x44be_u16, StaticArray[0x8f_u8, 0xf5_u8, 0x19_u8, 0x5c_u8, 0x98_u8, 0xed_u8, 0xe8_u8, 0xa6_u8])
    def query_interface(this : IUIViewSettingsInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIViewSettingsInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIViewSettingsInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IUIViewSettingsInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IUIViewSettingsInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IUIViewSettingsInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IUIViewSettingsInterop*, hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, hwnd, riid, ppv)
    end

  end

  @[Extern]
  record IUserActivityInteropVtbl,
    query_interface : Proc(IUserActivityInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUserActivityInterop*, UInt32),
    release : Proc(IUserActivityInterop*, UInt32),
    get_iids : Proc(IUserActivityInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IUserActivityInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IUserActivityInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_session_for_window : Proc(IUserActivityInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1ade314d-0e0a-40d9-824c-9a088a50059f")]
  record IUserActivityInterop, lpVtbl : IUserActivityInteropVtbl* do
    GUID = LibC::GUID.new(0x1ade314d_u32, 0xe0a_u16, 0x40d9_u16, StaticArray[0x82_u8, 0x4c_u8, 0x9a_u8, 0x8_u8, 0x8a_u8, 0x50_u8, 0x5_u8, 0x9f_u8])
    def query_interface(this : IUserActivityInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUserActivityInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUserActivityInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IUserActivityInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IUserActivityInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IUserActivityInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_session_for_window(this : IUserActivityInterop*, window : Win32cr::Foundation::HWND, iid : LibC::GUID*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_session_for_window.call(this, window, iid, value)
    end

  end

  @[Extern]
  record IUserActivitySourceHostInteropVtbl,
    query_interface : Proc(IUserActivitySourceHostInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUserActivitySourceHostInterop*, UInt32),
    release : Proc(IUserActivitySourceHostInterop*, UInt32),
    get_iids : Proc(IUserActivitySourceHostInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IUserActivitySourceHostInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IUserActivitySourceHostInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    set_activity_source_host : Proc(IUserActivitySourceHostInterop*, Win32cr::System::WinRT::HSTRING, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c15df8bc-8844-487a-b85b-7578e0f61419")]
  record IUserActivitySourceHostInterop, lpVtbl : IUserActivitySourceHostInteropVtbl* do
    GUID = LibC::GUID.new(0xc15df8bc_u32, 0x8844_u16, 0x487a_u16, StaticArray[0xb8_u8, 0x5b_u8, 0x75_u8, 0x78_u8, 0xe0_u8, 0xf6_u8, 0x14_u8, 0x19_u8])
    def query_interface(this : IUserActivitySourceHostInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUserActivitySourceHostInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUserActivitySourceHostInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IUserActivitySourceHostInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IUserActivitySourceHostInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IUserActivitySourceHostInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def set_activity_source_host(this : IUserActivitySourceHostInterop*, activitySourceHost : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_source_host.call(this, activitySourceHost)
    end

  end

  @[Extern]
  record IUserActivityRequestManagerInteropVtbl,
    query_interface : Proc(IUserActivityRequestManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUserActivityRequestManagerInterop*, UInt32),
    release : Proc(IUserActivityRequestManagerInterop*, UInt32),
    get_iids : Proc(IUserActivityRequestManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IUserActivityRequestManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IUserActivityRequestManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IUserActivityRequestManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dd69f876-9699-4715-9095-e37ea30dfa1b")]
  record IUserActivityRequestManagerInterop, lpVtbl : IUserActivityRequestManagerInteropVtbl* do
    GUID = LibC::GUID.new(0xdd69f876_u32, 0x9699_u16, 0x4715_u16, StaticArray[0x90_u8, 0x95_u8, 0xe3_u8, 0x7e_u8, 0xa3_u8, 0xd_u8, 0xfa_u8, 0x1b_u8])
    def query_interface(this : IUserActivityRequestManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUserActivityRequestManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUserActivityRequestManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IUserActivityRequestManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IUserActivityRequestManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IUserActivityRequestManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IUserActivityRequestManagerInterop*, window : Win32cr::Foundation::HWND, iid : LibC::GUID*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, window, iid, value)
    end

  end

  @[Extern]
  record IUserConsentVerifierInteropVtbl,
    query_interface : Proc(IUserConsentVerifierInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUserConsentVerifierInterop*, UInt32),
    release : Proc(IUserConsentVerifierInterop*, UInt32),
    get_iids : Proc(IUserConsentVerifierInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IUserConsentVerifierInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IUserConsentVerifierInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    request_verification_for_window_async : Proc(IUserConsentVerifierInterop*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("39e050c3-4e74-441a-8dc0-b81104df949c")]
  record IUserConsentVerifierInterop, lpVtbl : IUserConsentVerifierInteropVtbl* do
    GUID = LibC::GUID.new(0x39e050c3_u32, 0x4e74_u16, 0x441a_u16, StaticArray[0x8d_u8, 0xc0_u8, 0xb8_u8, 0x11_u8, 0x4_u8, 0xdf_u8, 0x94_u8, 0x9c_u8])
    def query_interface(this : IUserConsentVerifierInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUserConsentVerifierInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUserConsentVerifierInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IUserConsentVerifierInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IUserConsentVerifierInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IUserConsentVerifierInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def request_verification_for_window_async(this : IUserConsentVerifierInterop*, appWindow : Win32cr::Foundation::HWND, message : Win32cr::System::WinRT::HSTRING, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_verification_for_window_async.call(this, appWindow, message, riid, asyncOperation)
    end

  end

  @[Extern]
  record IWebAuthenticationCoreManagerInteropVtbl,
    query_interface : Proc(IWebAuthenticationCoreManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebAuthenticationCoreManagerInterop*, UInt32),
    release : Proc(IWebAuthenticationCoreManagerInterop*, UInt32),
    get_iids : Proc(IWebAuthenticationCoreManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IWebAuthenticationCoreManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IWebAuthenticationCoreManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    request_token_for_window_async : Proc(IWebAuthenticationCoreManagerInterop*, Win32cr::Foundation::HWND, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_token_with_web_account_for_window_async : Proc(IWebAuthenticationCoreManagerInterop*, Win32cr::Foundation::HWND, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4b8e804-811e-4436-b69c-44cb67b72084")]
  record IWebAuthenticationCoreManagerInterop, lpVtbl : IWebAuthenticationCoreManagerInteropVtbl* do
    GUID = LibC::GUID.new(0xf4b8e804_u32, 0x811e_u16, 0x4436_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x44_u8, 0xcb_u8, 0x67_u8, 0xb7_u8, 0x20_u8, 0x84_u8])
    def query_interface(this : IWebAuthenticationCoreManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebAuthenticationCoreManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebAuthenticationCoreManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IWebAuthenticationCoreManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IWebAuthenticationCoreManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IWebAuthenticationCoreManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def request_token_for_window_async(this : IWebAuthenticationCoreManagerInterop*, appWindow : Win32cr::Foundation::HWND, request : Void*, riid : LibC::GUID*, asyncInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_token_for_window_async.call(this, appWindow, request, riid, asyncInfo)
    end
    def request_token_with_web_account_for_window_async(this : IWebAuthenticationCoreManagerInterop*, appWindow : Win32cr::Foundation::HWND, request : Void*, webAccount : Void*, riid : LibC::GUID*, asyncInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_token_with_web_account_for_window_async.call(this, appWindow, request, webAccount, riid, asyncInfo)
    end

  end

  @[Extern]
  record IRestrictedErrorInfoVtbl,
    query_interface : Proc(IRestrictedErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRestrictedErrorInfo*, UInt32),
    release : Proc(IRestrictedErrorInfo*, UInt32),
    get_error_details : Proc(IRestrictedErrorInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_reference : Proc(IRestrictedErrorInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("82ba7092-4c88-427d-a7bc-16dd93feb67e")]
  record IRestrictedErrorInfo, lpVtbl : IRestrictedErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x82ba7092_u32, 0x4c88_u16, 0x427d_u16, StaticArray[0xa7_u8, 0xbc_u8, 0x16_u8, 0xdd_u8, 0x93_u8, 0xfe_u8, 0xb6_u8, 0x7e_u8])
    def query_interface(this : IRestrictedErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRestrictedErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRestrictedErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_error_details(this : IRestrictedErrorInfo*, description : Win32cr::Foundation::BSTR*, error : Win32cr::Foundation::HRESULT*, restrictedDescription : Win32cr::Foundation::BSTR*, capabilitySid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_details.call(this, description, error, restrictedDescription, capabilitySid)
    end
    def get_reference(this : IRestrictedErrorInfo*, reference : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reference.call(this, reference)
    end

  end

  @[Extern]
  record ILanguageExceptionErrorInfoVtbl,
    query_interface : Proc(ILanguageExceptionErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILanguageExceptionErrorInfo*, UInt32),
    release : Proc(ILanguageExceptionErrorInfo*, UInt32),
    get_language_exception : Proc(ILanguageExceptionErrorInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("04a2dbf3-df83-116c-0946-0812abf6e07d")]
  record ILanguageExceptionErrorInfo, lpVtbl : ILanguageExceptionErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x4a2dbf3_u32, 0xdf83_u16, 0x116c_u16, StaticArray[0x9_u8, 0x46_u8, 0x8_u8, 0x12_u8, 0xab_u8, 0xf6_u8, 0xe0_u8, 0x7d_u8])
    def query_interface(this : ILanguageExceptionErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILanguageExceptionErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILanguageExceptionErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_language_exception(this : ILanguageExceptionErrorInfo*, languageException : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_exception.call(this, languageException)
    end

  end

  @[Extern]
  record ILanguageExceptionTransformVtbl,
    query_interface : Proc(ILanguageExceptionTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILanguageExceptionTransform*, UInt32),
    release : Proc(ILanguageExceptionTransform*, UInt32),
    get_transformed_restricted_error_info : Proc(ILanguageExceptionTransform*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("feb5a271-a6cd-45ce-880a-696706badc65")]
  record ILanguageExceptionTransform, lpVtbl : ILanguageExceptionTransformVtbl* do
    GUID = LibC::GUID.new(0xfeb5a271_u32, 0xa6cd_u16, 0x45ce_u16, StaticArray[0x88_u8, 0xa_u8, 0x69_u8, 0x67_u8, 0x6_u8, 0xba_u8, 0xdc_u8, 0x65_u8])
    def query_interface(this : ILanguageExceptionTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILanguageExceptionTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILanguageExceptionTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_transformed_restricted_error_info(this : ILanguageExceptionTransform*, restrictedErrorInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transformed_restricted_error_info.call(this, restrictedErrorInfo)
    end

  end

  @[Extern]
  record ILanguageExceptionStackBackTraceVtbl,
    query_interface : Proc(ILanguageExceptionStackBackTrace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILanguageExceptionStackBackTrace*, UInt32),
    release : Proc(ILanguageExceptionStackBackTrace*, UInt32),
    get_stack_back_trace : Proc(ILanguageExceptionStackBackTrace*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cbe53fb5-f967-4258-8d34-42f5e25833de")]
  record ILanguageExceptionStackBackTrace, lpVtbl : ILanguageExceptionStackBackTraceVtbl* do
    GUID = LibC::GUID.new(0xcbe53fb5_u32, 0xf967_u16, 0x4258_u16, StaticArray[0x8d_u8, 0x34_u8, 0x42_u8, 0xf5_u8, 0xe2_u8, 0x58_u8, 0x33_u8, 0xde_u8])
    def query_interface(this : ILanguageExceptionStackBackTrace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILanguageExceptionStackBackTrace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILanguageExceptionStackBackTrace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stack_back_trace(this : ILanguageExceptionStackBackTrace*, maxFramesToCapture : UInt32, stackBackTrace : LibC::UIntPtrT*, framesCaptured : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_back_trace.call(this, maxFramesToCapture, stackBackTrace, framesCaptured)
    end

  end

  @[Extern]
  record ILanguageExceptionErrorInfo2Vtbl,
    query_interface : Proc(ILanguageExceptionErrorInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILanguageExceptionErrorInfo2*, UInt32),
    release : Proc(ILanguageExceptionErrorInfo2*, UInt32),
    get_language_exception : Proc(ILanguageExceptionErrorInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_previous_language_exception_error_info : Proc(ILanguageExceptionErrorInfo2*, Void**, Win32cr::Foundation::HRESULT),
    capture_propagation_context : Proc(ILanguageExceptionErrorInfo2*, Void*, Win32cr::Foundation::HRESULT),
    get_propagation_context_head : Proc(ILanguageExceptionErrorInfo2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5746e5c4-5b97-424c-b620-2822915734dd")]
  record ILanguageExceptionErrorInfo2, lpVtbl : ILanguageExceptionErrorInfo2Vtbl* do
    GUID = LibC::GUID.new(0x5746e5c4_u32, 0x5b97_u16, 0x424c_u16, StaticArray[0xb6_u8, 0x20_u8, 0x28_u8, 0x22_u8, 0x91_u8, 0x57_u8, 0x34_u8, 0xdd_u8])
    def query_interface(this : ILanguageExceptionErrorInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILanguageExceptionErrorInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILanguageExceptionErrorInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_language_exception(this : ILanguageExceptionErrorInfo2*, languageException : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_exception.call(this, languageException)
    end
    def get_previous_language_exception_error_info(this : ILanguageExceptionErrorInfo2*, previousLanguageExceptionErrorInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_language_exception_error_info.call(this, previousLanguageExceptionErrorInfo)
    end
    def capture_propagation_context(this : ILanguageExceptionErrorInfo2*, languageException : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.capture_propagation_context.call(this, languageException)
    end
    def get_propagation_context_head(this : ILanguageExceptionErrorInfo2*, propagatedLanguageExceptionErrorInfoHead : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_propagation_context_head.call(this, propagatedLanguageExceptionErrorInfoHead)
    end

  end

  @[Extern]
  record IActivationFactoryVtbl,
    query_interface : Proc(IActivationFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActivationFactory*, UInt32),
    release : Proc(IActivationFactory*, UInt32),
    get_iids : Proc(IActivationFactory*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IActivationFactory*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IActivationFactory*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    activate_instance : Proc(IActivationFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000035-0000-0000-c000-000000000046")]
  record IActivationFactory, lpVtbl : IActivationFactoryVtbl* do
    GUID = LibC::GUID.new(0x35_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IActivationFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActivationFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActivationFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IActivationFactory*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IActivationFactory*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IActivationFactory*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def activate_instance(this : IActivationFactory*, instance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_instance.call(this, instance)
    end

  end

  @[Extern]
  record IBufferByteAccessVtbl,
    query_interface : Proc(IBufferByteAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBufferByteAccess*, UInt32),
    release : Proc(IBufferByteAccess*, UInt32),
    buffer : Proc(IBufferByteAccess*, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("905a0fef-bc53-11df-8c49-001e4fc686da")]
  record IBufferByteAccess, lpVtbl : IBufferByteAccessVtbl* do
    GUID = LibC::GUID.new(0x905a0fef_u32, 0xbc53_u16, 0x11df_u16, StaticArray[0x8c_u8, 0x49_u8, 0x0_u8, 0x1e_u8, 0x4f_u8, 0xc6_u8, 0x86_u8, 0xda_u8])
    def query_interface(this : IBufferByteAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBufferByteAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBufferByteAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def buffer(this : IBufferByteAccess*, value : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.buffer.call(this, value)
    end

  end

  @[Extern]
  record IRoSimpleMetaDataBuilderVtbl,
    set_win_rt_interface : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, Win32cr::Foundation::HRESULT),
    set_delegate : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, Win32cr::Foundation::HRESULT),
    set_interface_group_simple_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_interface_group_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_runtime_class_simple_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_runtime_class_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_struct : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_enum : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_parameterized_interface : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT),
    set_parameterized_delegate : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRoSimpleMetaDataBuilder, lpVtbl : IRoSimpleMetaDataBuilderVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def set_win_rt_interface(this : IRoSimpleMetaDataBuilder*, iid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_win_rt_interface.call(this, iid)
    end
    def set_delegate(this : IRoSimpleMetaDataBuilder*, iid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_delegate.call(this, iid)
    end
    def set_interface_group_simple_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, defaultInterfaceName : Win32cr::Foundation::PWSTR, defaultInterfaceIID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interface_group_simple_default.call(this, name, defaultInterfaceName, defaultInterfaceIID)
    end
    def set_interface_group_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, elementCount : UInt32, defaultInterfaceNameElements : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interface_group_parameterized_default.call(this, name, elementCount, defaultInterfaceNameElements)
    end
    def set_runtime_class_simple_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, defaultInterfaceName : Win32cr::Foundation::PWSTR, defaultInterfaceIID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_runtime_class_simple_default.call(this, name, defaultInterfaceName, defaultInterfaceIID)
    end
    def set_runtime_class_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, elementCount : UInt32, defaultInterfaceNameElements : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_runtime_class_parameterized_default.call(this, name, elementCount, defaultInterfaceNameElements)
    end
    def set_struct(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, numFields : UInt32, fieldTypeNames : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_struct.call(this, name, numFields, fieldTypeNames)
    end
    def set_enum(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, baseType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enum.call(this, name, baseType)
    end
    def set_parameterized_interface(this : IRoSimpleMetaDataBuilder*, piid : LibC::GUID, numArgs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameterized_interface.call(this, piid, numArgs)
    end
    def set_parameterized_delegate(this : IRoSimpleMetaDataBuilder*, piid : LibC::GUID, numArgs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameterized_delegate.call(this, piid, numArgs)
    end

  end

  @[Extern]
  record IRoMetaDataLocatorVtbl,
    locate : Proc(IRoMetaDataLocator*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRoMetaDataLocator, lpVtbl : IRoMetaDataLocatorVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def locate(this : IRoMetaDataLocator*, nameElement : Win32cr::Foundation::PWSTR, metaDataDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locate.call(this, nameElement, metaDataDestination)
    end

  end

  @[Extern]
  record IMemoryBufferByteAccessVtbl,
    query_interface : Proc(IMemoryBufferByteAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMemoryBufferByteAccess*, UInt32),
    release : Proc(IMemoryBufferByteAccess*, UInt32),
    get_buffer : Proc(IMemoryBufferByteAccess*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5b0d3235-4dba-4d44-865e-8f1d0e4fd04d")]
  record IMemoryBufferByteAccess, lpVtbl : IMemoryBufferByteAccessVtbl* do
    GUID = LibC::GUID.new(0x5b0d3235_u32, 0x4dba_u16, 0x4d44_u16, StaticArray[0x86_u8, 0x5e_u8, 0x8f_u8, 0x1d_u8, 0xe_u8, 0x4f_u8, 0xd0_u8, 0x4d_u8])
    def query_interface(this : IMemoryBufferByteAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMemoryBufferByteAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMemoryBufferByteAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IMemoryBufferByteAccess*, value : UInt8**, capacity : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, value, capacity)
    end

  end

  @[Extern]
  record IWeakReferenceVtbl,
    query_interface : Proc(IWeakReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWeakReference*, UInt32),
    release : Proc(IWeakReference*, UInt32),
    resolve : Proc(IWeakReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000037-0000-0000-c000-000000000046")]
  record IWeakReference, lpVtbl : IWeakReferenceVtbl* do
    GUID = LibC::GUID.new(0x37_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IWeakReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWeakReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWeakReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resolve(this : IWeakReference*, riid : LibC::GUID*, objectReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve.call(this, riid, objectReference)
    end

  end

  @[Extern]
  record IWeakReferenceSourceVtbl,
    query_interface : Proc(IWeakReferenceSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWeakReferenceSource*, UInt32),
    release : Proc(IWeakReferenceSource*, UInt32),
    get_weak_reference : Proc(IWeakReferenceSource*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000038-0000-0000-c000-000000000046")]
  record IWeakReferenceSource, lpVtbl : IWeakReferenceSourceVtbl* do
    GUID = LibC::GUID.new(0x38_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IWeakReferenceSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWeakReferenceSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWeakReferenceSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_weak_reference(this : IWeakReferenceSource*, weakReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_weak_reference.call(this, weakReference)
    end

  end

  @[Extern]
  record ISystemMediaTransportControlsInteropVtbl,
    query_interface : Proc(ISystemMediaTransportControlsInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemMediaTransportControlsInterop*, UInt32),
    release : Proc(ISystemMediaTransportControlsInterop*, UInt32),
    get_iids : Proc(ISystemMediaTransportControlsInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ISystemMediaTransportControlsInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ISystemMediaTransportControlsInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(ISystemMediaTransportControlsInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ddb0472d-c911-4a1f-86d9-dc3d71a95f5a")]
  record ISystemMediaTransportControlsInterop, lpVtbl : ISystemMediaTransportControlsInteropVtbl* do
    GUID = LibC::GUID.new(0xddb0472d_u32, 0xc911_u16, 0x4a1f_u16, StaticArray[0x86_u8, 0xd9_u8, 0xdc_u8, 0x3d_u8, 0x71_u8, 0xa9_u8, 0x5f_u8, 0x5a_u8])
    def query_interface(this : ISystemMediaTransportControlsInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemMediaTransportControlsInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemMediaTransportControlsInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ISystemMediaTransportControlsInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ISystemMediaTransportControlsInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ISystemMediaTransportControlsInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : ISystemMediaTransportControlsInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, mediaTransportControl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, mediaTransportControl)
    end

  end

  @[Extern]
  record IShareWindowCommandEventArgsInteropVtbl,
    query_interface : Proc(IShareWindowCommandEventArgsInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IShareWindowCommandEventArgsInterop*, UInt32),
    release : Proc(IShareWindowCommandEventArgsInterop*, UInt32),
    get_window : Proc(IShareWindowCommandEventArgsInterop*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6571a721-643d-43d4-aca4-6b6f5f30f1ad")]
  record IShareWindowCommandEventArgsInterop, lpVtbl : IShareWindowCommandEventArgsInteropVtbl* do
    GUID = LibC::GUID.new(0x6571a721_u32, 0x643d_u16, 0x43d4_u16, StaticArray[0xac_u8, 0xa4_u8, 0x6b_u8, 0x6f_u8, 0x5f_u8, 0x30_u8, 0xf1_u8, 0xad_u8])
    def query_interface(this : IShareWindowCommandEventArgsInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IShareWindowCommandEventArgsInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IShareWindowCommandEventArgsInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_window(this : IShareWindowCommandEventArgsInterop*, value : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, value)
    end

  end

  @[Extern]
  record IShareWindowCommandSourceInteropVtbl,
    query_interface : Proc(IShareWindowCommandSourceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IShareWindowCommandSourceInterop*, UInt32),
    release : Proc(IShareWindowCommandSourceInterop*, UInt32),
    get_for_window : Proc(IShareWindowCommandSourceInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("461a191f-8424-43a6-a0fa-3451a22f56ab")]
  record IShareWindowCommandSourceInterop, lpVtbl : IShareWindowCommandSourceInteropVtbl* do
    GUID = LibC::GUID.new(0x461a191f_u32, 0x8424_u16, 0x43a6_u16, StaticArray[0xa0_u8, 0xfa_u8, 0x34_u8, 0x51_u8, 0xa2_u8, 0x2f_u8, 0x56_u8, 0xab_u8])
    def query_interface(this : IShareWindowCommandSourceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IShareWindowCommandSourceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IShareWindowCommandSourceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_for_window(this : IShareWindowCommandSourceInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, shareWindowCommandSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, shareWindowCommandSource)
    end

  end

  @[Extern]
  record IMessageDispatcherVtbl,
    query_interface : Proc(IMessageDispatcher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMessageDispatcher*, UInt32),
    release : Proc(IMessageDispatcher*, UInt32),
    get_iids : Proc(IMessageDispatcher*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IMessageDispatcher*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IMessageDispatcher*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    pump_messages : Proc(IMessageDispatcher*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d")]
  record IMessageDispatcher, lpVtbl : IMessageDispatcherVtbl* do
    GUID = LibC::GUID.new(0xf5f84c8f_u32, 0xcfd0_u16, 0x4cd6_u16, StaticArray[0xb6_u8, 0x6b_u8, 0xc5_u8, 0xd2_u8, 0x6f_u8, 0xf1_u8, 0x68_u8, 0x9d_u8])
    def query_interface(this : IMessageDispatcher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMessageDispatcher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMessageDispatcher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IMessageDispatcher*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IMessageDispatcher*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IMessageDispatcher*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def pump_messages(this : IMessageDispatcher*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pump_messages.call(this)
    end

  end

  @[Extern]
  record ICoreWindowInteropVtbl,
    query_interface : Proc(ICoreWindowInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreWindowInterop*, UInt32),
    release : Proc(ICoreWindowInterop*, UInt32),
    get_WindowHandle : Proc(ICoreWindowInterop*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_MessageHandled : Proc(ICoreWindowInterop*, UInt8, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45d64a29-a63e-4cb6-b498-5781d298cb4f")]
  record ICoreWindowInterop, lpVtbl : ICoreWindowInteropVtbl* do
    GUID = LibC::GUID.new(0x45d64a29_u32, 0xa63e_u16, 0x4cb6_u16, StaticArray[0xb4_u8, 0x98_u8, 0x57_u8, 0x81_u8, 0xd2_u8, 0x98_u8, 0xcb_u8, 0x4f_u8])
    def query_interface(this : ICoreWindowInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreWindowInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreWindowInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_WindowHandle(this : ICoreWindowInterop*, hwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowHandle.call(this, hwnd)
    end
    def put_MessageHandled(this : ICoreWindowInterop*, value : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageHandled.call(this, value)
    end

  end

  @[Extern]
  record ICoreInputInteropVtbl,
    query_interface : Proc(ICoreInputInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreInputInterop*, UInt32),
    release : Proc(ICoreInputInterop*, UInt32),
    set_input_source : Proc(ICoreInputInterop*, Void*, Win32cr::Foundation::HRESULT),
    put_MessageHandled : Proc(ICoreInputInterop*, UInt8, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("40bfe3e3-b75a-4479-ac96-475365749bb8")]
  record ICoreInputInterop, lpVtbl : ICoreInputInteropVtbl* do
    GUID = LibC::GUID.new(0x40bfe3e3_u32, 0xb75a_u16, 0x4479_u16, StaticArray[0xac_u8, 0x96_u8, 0x47_u8, 0x53_u8, 0x65_u8, 0x74_u8, 0x9b_u8, 0xb8_u8])
    def query_interface(this : ICoreInputInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreInputInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreInputInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input_source(this : ICoreInputInterop*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_source.call(this, value)
    end
    def put_MessageHandled(this : ICoreInputInterop*, value : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageHandled.call(this, value)
    end

  end

  @[Extern]
  record ICoreWindowComponentInteropVtbl,
    query_interface : Proc(ICoreWindowComponentInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreWindowComponentInterop*, UInt32),
    release : Proc(ICoreWindowComponentInterop*, UInt32),
    configure_component_input : Proc(ICoreWindowComponentInterop*, UInt32, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::HRESULT),
    get_view_instance_id : Proc(ICoreWindowComponentInterop*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0576ab31-a310-4c40-ba31-fd37e0298dfa")]
  record ICoreWindowComponentInterop, lpVtbl : ICoreWindowComponentInteropVtbl* do
    GUID = LibC::GUID.new(0x576ab31_u32, 0xa310_u16, 0x4c40_u16, StaticArray[0xba_u8, 0x31_u8, 0xfd_u8, 0x37_u8, 0xe0_u8, 0x29_u8, 0x8d_u8, 0xfa_u8])
    def query_interface(this : ICoreWindowComponentInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreWindowComponentInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreWindowComponentInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def configure_component_input(this : ICoreWindowComponentInterop*, hostViewInstanceId : UInt32, hwndHost : Win32cr::Foundation::HWND, inputSourceVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_component_input.call(this, hostViewInstanceId, hwndHost, inputSourceVisual)
    end
    def get_view_instance_id(this : ICoreWindowComponentInterop*, componentViewInstanceId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_instance_id.call(this, componentViewInstanceId)
    end

  end

  @[Extern]
  record ICoreWindowAdapterInteropVtbl,
    query_interface : Proc(ICoreWindowAdapterInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreWindowAdapterInterop*, UInt32),
    release : Proc(ICoreWindowAdapterInterop*, UInt32),
    get_iids : Proc(ICoreWindowAdapterInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ICoreWindowAdapterInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ICoreWindowAdapterInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_AppActivationClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_ApplicationViewClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_CoreApplicationViewClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_HoloViewClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_PositionerClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_SystemNavigationClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    get_TitleBarClientAdapter : Proc(ICoreWindowAdapterInterop*, Void**, Win32cr::Foundation::HRESULT),
    set_window_client_adapter : Proc(ICoreWindowAdapterInterop*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7a5b6fd1-cd73-4b6c-9cf4-2e869eaf470a")]
  record ICoreWindowAdapterInterop, lpVtbl : ICoreWindowAdapterInteropVtbl* do
    GUID = LibC::GUID.new(0x7a5b6fd1_u32, 0xcd73_u16, 0x4b6c_u16, StaticArray[0x9c_u8, 0xf4_u8, 0x2e_u8, 0x86_u8, 0x9e_u8, 0xaf_u8, 0x47_u8, 0xa_u8])
    def query_interface(this : ICoreWindowAdapterInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreWindowAdapterInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreWindowAdapterInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ICoreWindowAdapterInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ICoreWindowAdapterInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ICoreWindowAdapterInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_AppActivationClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppActivationClientAdapter.call(this, value)
    end
    def get_ApplicationViewClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationViewClientAdapter.call(this, value)
    end
    def get_CoreApplicationViewClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoreApplicationViewClientAdapter.call(this, value)
    end
    def get_HoloViewClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HoloViewClientAdapter.call(this, value)
    end
    def get_PositionerClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PositionerClientAdapter.call(this, value)
    end
    def get_SystemNavigationClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SystemNavigationClientAdapter.call(this, value)
    end
    def get_TitleBarClientAdapter(this : ICoreWindowAdapterInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TitleBarClientAdapter.call(this, value)
    end
    def set_window_client_adapter(this : ICoreWindowAdapterInterop*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_window_client_adapter.call(this, value)
    end

  end

  @[Link("ole32")]
  @[Link("api-ms-win-core-winrt-string-l1-1-0")]
  @[Link("api-ms-win-core-winrt-string-l1-1-1")]
  @[Link("coremessaging")]
  @[Link("api-ms-win-core-winrt-l1-1-0")]
  @[Link("api-ms-win-core-winrt-robuffer-l1-1-0")]
  @[Link("api-ms-win-core-winrt-error-l1-1-0")]
  @[Link("api-ms-win-core-winrt-error-l1-1-1")]
  @[Link("rometadata")]
  @[Link("api-ms-win-core-winrt-roparameterizediid-l1-1-0")]
  @[Link("api-ms-win-core-winrt-registration-l1-1-0")]
  @[Link("api-ms-win-shcore-stream-winrt-l1-1-0")]
  @[Link("windows.ui")]
  lib C
    fun CoDecodeProxy(dwClientPid : UInt32, ui64ProxyAddress : UInt64, pServerInformation : Win32cr::System::WinRT::ServerInformation*) : Win32cr::Foundation::HRESULT

    fun RoGetAgileReference(options : Win32cr::System::WinRT::AgileReferenceOptions, riid : LibC::GUID*, pUnk : Void*, ppAgileReference : Void**) : Win32cr::Foundation::HRESULT

    fun HSTRING_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::WinRT::HSTRING*) : UInt32

    fun HSTRING_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::WinRT::HSTRING*) : UInt8*

    fun HSTRING_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::WinRT::HSTRING*) : UInt8*

    fun HSTRING_UserFree(param0 : UInt32*, param1 : Win32cr::System::WinRT::HSTRING*) : Void

    fun HSTRING_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::WinRT::HSTRING*) : UInt32

    fun HSTRING_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::WinRT::HSTRING*) : UInt8*

    fun HSTRING_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::WinRT::HSTRING*) : UInt8*

    fun HSTRING_UserFree64(param0 : UInt32*, param1 : Win32cr::System::WinRT::HSTRING*) : Void

    fun WindowsCreateString(sourceString : UInt16*, length : UInt32, string : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsCreateStringReference(sourceString : Win32cr::Foundation::PWSTR, length : UInt32, hstringHeader : Win32cr::System::WinRT::HSTRING_HEADER*, string : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsDeleteString(string : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::HRESULT

    fun WindowsDuplicateString(string : Win32cr::System::WinRT::HSTRING, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsGetStringLen(string : Win32cr::System::WinRT::HSTRING) : UInt32

    fun WindowsGetStringRawBuffer(string : Win32cr::System::WinRT::HSTRING, length : UInt32*) : Win32cr::Foundation::PWSTR

    fun WindowsIsStringEmpty(string : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::BOOL

    fun WindowsStringHasEmbeddedNull(string : Win32cr::System::WinRT::HSTRING, hasEmbedNull : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun WindowsCompareStringOrdinal(string1 : Win32cr::System::WinRT::HSTRING, string2 : Win32cr::System::WinRT::HSTRING, result : Int32*) : Win32cr::Foundation::HRESULT

    fun WindowsSubstring(string : Win32cr::System::WinRT::HSTRING, startIndex : UInt32, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsSubstringWithSpecifiedLength(string : Win32cr::System::WinRT::HSTRING, startIndex : UInt32, length : UInt32, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsConcatString(string1 : Win32cr::System::WinRT::HSTRING, string2 : Win32cr::System::WinRT::HSTRING, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsReplaceString(string : Win32cr::System::WinRT::HSTRING, stringReplaced : Win32cr::System::WinRT::HSTRING, stringReplaceWith : Win32cr::System::WinRT::HSTRING, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsTrimStringStart(string : Win32cr::System::WinRT::HSTRING, trimString : Win32cr::System::WinRT::HSTRING, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsTrimStringEnd(string : Win32cr::System::WinRT::HSTRING, trimString : Win32cr::System::WinRT::HSTRING, newString : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsPreallocateStringBuffer(length : UInt32, charBuffer : UInt16**, bufferHandle : Win32cr::System::WinRT::HSTRING_BUFFER*) : Win32cr::Foundation::HRESULT

    fun WindowsPromoteStringBuffer(bufferHandle : Win32cr::System::WinRT::HSTRING_BUFFER, string : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT

    fun WindowsDeleteStringBuffer(bufferHandle : Win32cr::System::WinRT::HSTRING_BUFFER) : Win32cr::Foundation::HRESULT

    fun WindowsInspectString(targetHString : LibC::UIntPtrT, machine : UInt16, callback : Win32cr::System::WinRT::PINSPECT_HSTRING_CALLBACK, context : Void*, length : UInt32*, targetStringAddress : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WindowsInspectString2(targetHString : UInt64, machine : UInt16, callback : Win32cr::System::WinRT::PINSPECT_HSTRING_CALLBACK2, context : Void*, length : UInt32*, targetStringAddress : UInt64*) : Win32cr::Foundation::HRESULT

    fun CreateDispatcherQueueController(options : Win32cr::System::WinRT::DispatcherQueueOptions, dispatcherQueueController : Void**) : Win32cr::Foundation::HRESULT

    fun RoInitialize(initType : Win32cr::System::WinRT::RO_INIT_TYPE) : Win32cr::Foundation::HRESULT

    fun RoUninitialize : Void

    fun RoActivateInstance(activatableClassId : Win32cr::System::WinRT::HSTRING, instance : Void**) : Win32cr::Foundation::HRESULT

    fun RoRegisterActivationFactories(activatableClassIds : Win32cr::System::WinRT::HSTRING*, activationFactoryCallbacks : LibC::IntPtrT*, count : UInt32, cookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT

    fun RoRevokeActivationFactories(cookie : LibC::IntPtrT) : Void

    fun RoGetActivationFactory(activatableClassId : Win32cr::System::WinRT::HSTRING, iid : LibC::GUID*, factory : Void**) : Win32cr::Foundation::HRESULT

    fun RoRegisterForApartmentShutdown(callbackObject : Void*, apartmentIdentifier : UInt64*, regCookie : Win32cr::System::WinRT::APARTMENT_SHUTDOWN_REGISTRATION_COOKIE*) : Win32cr::Foundation::HRESULT

    fun RoUnregisterForApartmentShutdown(regCookie : Win32cr::System::WinRT::APARTMENT_SHUTDOWN_REGISTRATION_COOKIE) : Win32cr::Foundation::HRESULT

    fun RoGetApartmentIdentifier(apartmentIdentifier : UInt64*) : Win32cr::Foundation::HRESULT

    fun RoGetBufferMarshaler(bufferMarshaler : Void**) : Win32cr::Foundation::HRESULT

    fun RoGetErrorReportingFlags(pflags : UInt32*) : Win32cr::Foundation::HRESULT

    fun RoSetErrorReportingFlags(flags : UInt32) : Win32cr::Foundation::HRESULT

    fun RoResolveRestrictedErrorInfoReference(reference : Win32cr::Foundation::PWSTR, ppRestrictedErrorInfo : Void**) : Win32cr::Foundation::HRESULT

    fun SetRestrictedErrorInfo(pRestrictedErrorInfo : Void*) : Win32cr::Foundation::HRESULT

    fun GetRestrictedErrorInfo(ppRestrictedErrorInfo : Void**) : Win32cr::Foundation::HRESULT

    fun RoOriginateErrorW(error : Win32cr::Foundation::HRESULT, cchMax : UInt32, message : UInt16*) : Win32cr::Foundation::BOOL

    fun RoOriginateError(error : Win32cr::Foundation::HRESULT, message : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::BOOL

    fun RoTransformErrorW(oldError : Win32cr::Foundation::HRESULT, newError : Win32cr::Foundation::HRESULT, cchMax : UInt32, message : UInt16*) : Win32cr::Foundation::BOOL

    fun RoTransformError(oldError : Win32cr::Foundation::HRESULT, newError : Win32cr::Foundation::HRESULT, message : Win32cr::System::WinRT::HSTRING) : Win32cr::Foundation::BOOL

    fun RoCaptureErrorContext(hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    fun RoFailFastWithErrorContext(hrError : Win32cr::Foundation::HRESULT) : Void

    fun RoOriginateLanguageException(error : Win32cr::Foundation::HRESULT, message : Win32cr::System::WinRT::HSTRING, languageException : Void*) : Win32cr::Foundation::BOOL

    fun RoClearError : Void

    fun RoReportUnhandledError(pRestrictedErrorInfo : Void*) : Win32cr::Foundation::HRESULT

    fun RoInspectThreadErrorInfo(targetTebAddress : LibC::UIntPtrT, machine : UInt16, readMemoryCallback : Win32cr::System::WinRT::PINSPECT_MEMORY_CALLBACK, context : Void*, targetErrorInfoAddress : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun RoInspectCapturedStackBackTrace(targetErrorInfoAddress : LibC::UIntPtrT, machine : UInt16, readMemoryCallback : Win32cr::System::WinRT::PINSPECT_MEMORY_CALLBACK, context : Void*, frameCount : UInt32*, targetBackTraceAddress : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun RoGetMatchingRestrictedErrorInfo(hrIn : Win32cr::Foundation::HRESULT, ppRestrictedErrorInfo : Void**) : Win32cr::Foundation::HRESULT

    fun RoReportFailedDelegate(punkDelegate : Void*, pRestrictedErrorInfo : Void*) : Win32cr::Foundation::HRESULT

    fun IsErrorPropagationEnabled : Win32cr::Foundation::BOOL

    fun MetaDataGetDispenser(rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun RoGetParameterizedTypeInstanceIID(nameElementCount : UInt32, nameElements : Win32cr::Foundation::PWSTR*, metaDataLocator : Void*, iid : LibC::GUID*, pExtra : Win32cr::System::WinRT::ROPARAMIIDHANDLE*) : Win32cr::Foundation::HRESULT

    fun RoFreeParameterizedTypeExtra(extra : Win32cr::System::WinRT::ROPARAMIIDHANDLE) : Void

    fun RoParameterizedTypeExtraGetTypeSignature(extra : Win32cr::System::WinRT::ROPARAMIIDHANDLE) : Win32cr::Foundation::PSTR

    fun RoGetServerActivatableClasses(serverName : Win32cr::System::WinRT::HSTRING, activatableClassIds : Win32cr::System::WinRT::HSTRING**, count : UInt32*) : Win32cr::Foundation::HRESULT

    fun CreateRandomAccessStreamOnFile(filePath : Win32cr::Foundation::PWSTR, accessMode : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CreateRandomAccessStreamOverStream(stream : Void*, options : Win32cr::System::WinRT::BSOS_OPTIONS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CreateStreamOverRandomAccessStream(randomAccessStream : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CreateControlInput(riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CreateControlInputEx(pCoreWindow : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

  end
end