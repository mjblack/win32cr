require "../system/com.cr"
require "../foundation.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/marshal.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
@[Link(ldflags: "/DELAYLOAD:strmbase.dll")]
@[Link(ldflags: "/DELAYLOAD:coremessaging.dll")]
@[Link(ldflags: "/DELAYLOAD:rometadata.dll")]
@[Link(ldflags: "/DELAYLOAD:shcore.dll")]
{% else %}
@[Link("ole32")]
@[Link("strmbase")]
@[Link("coremessaging")]
@[Link("rometadata")]
@[Link("shcore")]
{% end %}
lib LibWin32
  alias HSTRING = LibC::IntPtrT
  alias HSTRING_BUFFER = LibC::IntPtrT
  alias ROPARAMIIDHANDLE = LibC::IntPtrT
  alias APARTMENT_SHUTDOWN_REGISTRATION_COOKIE = LibC::IntPtrT

  MAX_ERROR_MESSAGE_CHARS = 512_u32
  CastingSourceInfo_Property_PreferredSourceUriScheme = "PreferredSourceUriScheme"
  CastingSourceInfo_Property_CastingTypes = "CastingTypes"
  CastingSourceInfo_Property_ProtectedMedia = "ProtectedMedia"

  type RO_REGISTRATION_COOKIE = Void

  alias PINSPECT_HSTRING_CALLBACK = Proc(Void*, LibC::UINT_PTR, UInt32, UInt8*, HRESULT)
  alias PINSPECT_HSTRING_CALLBACK2 = Proc(Void*, UInt64, UInt32, UInt8*, HRESULT)
  alias PINSPECT_MEMORY_CALLBACK = Proc(Void*, LibC::UINT_PTR, UInt32, UInt8*, HRESULT)


  enum ACTIVATIONTYPE : Int32
    ACTIVATIONTYPE_UNCATEGORIZED = 0
    ACTIVATIONTYPE_FROM_MONIKER = 1
    ACTIVATIONTYPE_FROM_DATA = 2
    ACTIVATIONTYPE_FROM_STORAGE = 4
    ACTIVATIONTYPE_FROM_STREAM = 8
    ACTIVATIONTYPE_FROM_FILE = 16
  end

  enum AgileReferenceOptions : Int32
    AGILEREFERENCE_DEFAULT = 0
    AGILEREFERENCE_DELAYEDMARSHAL = 1
  end

  enum TrustLevel : Int32
    BaseTrust = 0
    PartialTrust = 1
    FullTrust = 2
  end

  enum DISPATCHERQUEUE_THREAD_APARTMENTTYPE : Int32
    DQTAT_COM_NONE = 0
    DQTAT_COM_ASTA = 1
    DQTAT_COM_STA = 2
  end

  enum DISPATCHERQUEUE_THREAD_TYPE : Int32
    DQTYPE_THREAD_DEDICATED = 1
    DQTYPE_THREAD_CURRENT = 2
  end

  enum CASTING_CONNECTION_ERROR_STATUS : Int32
    CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED = 0
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND = 1
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR = 2
    CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED = 3
    CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED = 4
    CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE = 5
    CASTING_CONNECTION_ERROR_STATUS_UNKNOWN = 6
  end

  enum CASTING_CONNECTION_STATE : Int32
    CASTING_CONNECTION_STATE_DISCONNECTED = 0
    CASTING_CONNECTION_STATE_CONNECTED = 1
    CASTING_CONNECTION_STATE_RENDERING = 2
    CASTING_CONNECTION_STATE_DISCONNECTING = 3
    CASTING_CONNECTION_STATE_CONNECTING = 4
  end

  enum RO_INIT_TYPE : Int32
    RO_INIT_SINGLETHREADED = 0
    RO_INIT_MULTITHREADED = 1
  end

  enum RO_ERROR_REPORTING_FLAGS : UInt32
    RO_ERROR_REPORTING_NONE = 0
    RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS = 1
    RO_ERROR_REPORTING_FORCEEXCEPTIONS = 2
    RO_ERROR_REPORTING_USESETERRORINFO = 4
    RO_ERROR_REPORTING_SUPPRESSSETERRORINFO = 8
  end

  enum BSOS_OPTIONS : Int32
    BSOS_DEFAULT = 0
    BSOS_PREFERDESTINATIONSTREAM = 1
  end

  union HSTRING_HEADER_Reserved_e__Union
    reserved1 : Void*
    reserved2 : CHAR[24]*
  end

  struct EventRegistrationToken
    value : Int64
  end
  struct ServerInformation
    dw_server_pid : UInt32
    dw_server_tid : UInt32
    ui64_server_address : UInt64
  end
  struct HSTRING_HEADER
    reserved : HSTRING_HEADER_Reserved_e__Union
  end
  struct DispatcherQueueOptions
    dw_size : UInt32
    thread_type : DISPATCHERQUEUE_THREAD_TYPE
    apartment_type : DISPATCHERQUEUE_THREAD_APARTMENTTYPE
  end


  struct IAgileReferenceVTbl
    query_interface : Proc(IAgileReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAgileReference*, UInt32)
    release : Proc(IAgileReference*, UInt32)
    resolve : Proc(IAgileReference*, Guid*, Void**, HRESULT)
  end

  IAgileReference_GUID = "c03f6a43-65a4-9818-987e-e0b810d2a6f2"
  IID_IAgileReference = LibC::GUID.new(0xc03f6a43_u32, 0x65a4_u16, 0x9818_u16, StaticArray[0x98_u8, 0x7e_u8, 0xe0_u8, 0xb8_u8, 0x10_u8, 0xd2_u8, 0xa6_u8, 0xf2_u8])
  struct IAgileReference
    lpVtbl : IAgileReferenceVTbl*
  end

  struct IApartmentShutdownVTbl
    query_interface : Proc(IApartmentShutdown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApartmentShutdown*, UInt32)
    release : Proc(IApartmentShutdown*, UInt32)
    on_uninitialize : Proc(IApartmentShutdown*, UInt64, Void)
  end

  IApartmentShutdown_GUID = "a2f05a09-27a2-42b5-bc0e-ac163ef49d9b"
  IID_IApartmentShutdown = LibC::GUID.new(0xa2f05a09_u32, 0x27a2_u16, 0x42b5_u16, StaticArray[0xbc_u8, 0xe_u8, 0xac_u8, 0x16_u8, 0x3e_u8, 0xf4_u8, 0x9d_u8, 0x9b_u8])
  struct IApartmentShutdown
    lpVtbl : IApartmentShutdownVTbl*
  end

  struct ISpatialInteractionManagerInteropVTbl
    query_interface : Proc(ISpatialInteractionManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpatialInteractionManagerInterop*, UInt32)
    release : Proc(ISpatialInteractionManagerInterop*, UInt32)
    get_iids : Proc(ISpatialInteractionManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ISpatialInteractionManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(ISpatialInteractionManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(ISpatialInteractionManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  ISpatialInteractionManagerInterop_GUID = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
  IID_ISpatialInteractionManagerInterop = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
  struct ISpatialInteractionManagerInterop
    lpVtbl : ISpatialInteractionManagerInteropVTbl*
  end

  struct IHolographicSpaceInteropVTbl
    query_interface : Proc(IHolographicSpaceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolographicSpaceInterop*, UInt32)
    release : Proc(IHolographicSpaceInterop*, UInt32)
    get_iids : Proc(IHolographicSpaceInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IHolographicSpaceInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IHolographicSpaceInterop*, TrustLevel*, HRESULT)
    create_for_window : Proc(IHolographicSpaceInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IHolographicSpaceInterop_GUID = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
  IID_IHolographicSpaceInterop = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
  struct IHolographicSpaceInterop
    lpVtbl : IHolographicSpaceInteropVTbl*
  end

  struct IInspectableVTbl
    query_interface : Proc(IInspectable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInspectable*, UInt32)
    release : Proc(IInspectable*, UInt32)
    get_iids : Proc(IInspectable*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IInspectable*, HSTRING*, HRESULT)
    get_trust_level : Proc(IInspectable*, TrustLevel*, HRESULT)
  end

  IInspectable_GUID = "af86e2e0-b12d-4c6a-9c5a-d7aa65101e90"
  IID_IInspectable = LibC::GUID.new(0xaf86e2e0_u32, 0xb12d_u16, 0x4c6a_u16, StaticArray[0x9c_u8, 0x5a_u8, 0xd7_u8, 0xaa_u8, 0x65_u8, 0x10_u8, 0x1e_u8, 0x90_u8])
  struct IInspectable
    lpVtbl : IInspectableVTbl*
  end

  struct IAccountsSettingsPaneInteropVTbl
    query_interface : Proc(IAccountsSettingsPaneInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccountsSettingsPaneInterop*, UInt32)
    release : Proc(IAccountsSettingsPaneInterop*, UInt32)
    get_iids : Proc(IAccountsSettingsPaneInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IAccountsSettingsPaneInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IAccountsSettingsPaneInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IAccountsSettingsPaneInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    show_manage_accounts_for_window_async : Proc(IAccountsSettingsPaneInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    show_add_account_for_window_async : Proc(IAccountsSettingsPaneInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IAccountsSettingsPaneInterop_GUID = "d3ee12ad-3865-4362-9746-b75a682df0e6"
  IID_IAccountsSettingsPaneInterop = LibC::GUID.new(0xd3ee12ad_u32, 0x3865_u16, 0x4362_u16, StaticArray[0x97_u8, 0x46_u8, 0xb7_u8, 0x5a_u8, 0x68_u8, 0x2d_u8, 0xf0_u8, 0xe6_u8])
  struct IAccountsSettingsPaneInterop
    lpVtbl : IAccountsSettingsPaneInteropVTbl*
  end

  struct IAppServiceConnectionExtendedExecutionVTbl
    query_interface : Proc(IAppServiceConnectionExtendedExecution*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppServiceConnectionExtendedExecution*, UInt32)
    release : Proc(IAppServiceConnectionExtendedExecution*, UInt32)
    open_for_extended_execution_async : Proc(IAppServiceConnectionExtendedExecution*, Guid*, Void**, HRESULT)
  end

  IAppServiceConnectionExtendedExecution_GUID = "65219584-f9cb-4ae3-81f9-a28a6ca450d9"
  IID_IAppServiceConnectionExtendedExecution = LibC::GUID.new(0x65219584_u32, 0xf9cb_u16, 0x4ae3_u16, StaticArray[0x81_u8, 0xf9_u8, 0xa2_u8, 0x8a_u8, 0x6c_u8, 0xa4_u8, 0x50_u8, 0xd9_u8])
  struct IAppServiceConnectionExtendedExecution
    lpVtbl : IAppServiceConnectionExtendedExecutionVTbl*
  end

  struct ICorrelationVectorSourceVTbl
    query_interface : Proc(ICorrelationVectorSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICorrelationVectorSource*, UInt32)
    release : Proc(ICorrelationVectorSource*, UInt32)
    get_correlation_vector : Proc(ICorrelationVectorSource*, HSTRING*, HRESULT)
  end

  ICorrelationVectorSource_GUID = "152b8a3b-b9b9-4685-b56e-974847bc7545"
  IID_ICorrelationVectorSource = LibC::GUID.new(0x152b8a3b_u32, 0xb9b9_u16, 0x4685_u16, StaticArray[0xb5_u8, 0x6e_u8, 0x97_u8, 0x48_u8, 0x47_u8, 0xbc_u8, 0x75_u8, 0x45_u8])
  struct ICorrelationVectorSource
    lpVtbl : ICorrelationVectorSourceVTbl*
  end

  struct ICastingEventHandlerVTbl
    query_interface : Proc(ICastingEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICastingEventHandler*, UInt32)
    release : Proc(ICastingEventHandler*, UInt32)
    on_state_changed : Proc(ICastingEventHandler*, CASTING_CONNECTION_STATE, HRESULT)
    on_error : Proc(ICastingEventHandler*, CASTING_CONNECTION_ERROR_STATUS, LibC::LPWSTR, HRESULT)
  end

  ICastingEventHandler_GUID = "c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc"
  IID_ICastingEventHandler = LibC::GUID.new(0xc79a6cb7_u32, 0xbebd_u16, 0x47a6_u16, StaticArray[0xa2_u8, 0xad_u8, 0x4d_u8, 0x45_u8, 0xad_u8, 0x79_u8, 0xc7_u8, 0xbc_u8])
  struct ICastingEventHandler
    lpVtbl : ICastingEventHandlerVTbl*
  end

  struct ICastingControllerVTbl
    query_interface : Proc(ICastingController*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICastingController*, UInt32)
    release : Proc(ICastingController*, UInt32)
    initialize : Proc(ICastingController*, IUnknown, IUnknown, HRESULT)
    connect : Proc(ICastingController*, HRESULT)
    disconnect : Proc(ICastingController*, HRESULT)
    advise : Proc(ICastingController*, ICastingEventHandler, UInt32*, HRESULT)
    un_advise : Proc(ICastingController*, UInt32, HRESULT)
  end

  ICastingController_GUID = "f0a56423-a664-4fbd-8b43-409a45e8d9a1"
  IID_ICastingController = LibC::GUID.new(0xf0a56423_u32, 0xa664_u16, 0x4fbd_u16, StaticArray[0x8b_u8, 0x43_u8, 0x40_u8, 0x9a_u8, 0x45_u8, 0xe8_u8, 0xd9_u8, 0xa1_u8])
  struct ICastingController
    lpVtbl : ICastingControllerVTbl*
  end

  struct ICastingSourceInfoVTbl
    query_interface : Proc(ICastingSourceInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICastingSourceInfo*, UInt32)
    release : Proc(ICastingSourceInfo*, UInt32)
    get_controller : Proc(ICastingSourceInfo*, ICastingController*, HRESULT)
    get_properties : Proc(ICastingSourceInfo*, INamedPropertyStore*, HRESULT)
  end

  ICastingSourceInfo_GUID = "45101ab7-7c3a-4bce-9500-12c09024b298"
  IID_ICastingSourceInfo = LibC::GUID.new(0x45101ab7_u32, 0x7c3a_u16, 0x4bce_u16, StaticArray[0x95_u8, 0x0_u8, 0x12_u8, 0xc0_u8, 0x90_u8, 0x24_u8, 0xb2_u8, 0x98_u8])
  struct ICastingSourceInfo
    lpVtbl : ICastingSourceInfoVTbl*
  end

  struct IDragDropManagerInteropVTbl
    query_interface : Proc(IDragDropManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDragDropManagerInterop*, UInt32)
    release : Proc(IDragDropManagerInterop*, UInt32)
    get_iids : Proc(IDragDropManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IDragDropManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IDragDropManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IDragDropManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IDragDropManagerInterop_GUID = "5ad8cba7-4c01-4dac-9074-827894292d63"
  IID_IDragDropManagerInterop = LibC::GUID.new(0x5ad8cba7_u32, 0x4c01_u16, 0x4dac_u16, StaticArray[0x90_u8, 0x74_u8, 0x82_u8, 0x78_u8, 0x94_u8, 0x29_u8, 0x2d_u8, 0x63_u8])
  struct IDragDropManagerInterop
    lpVtbl : IDragDropManagerInteropVTbl*
  end

  struct IInputPaneInteropVTbl
    query_interface : Proc(IInputPaneInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInputPaneInterop*, UInt32)
    release : Proc(IInputPaneInterop*, UInt32)
    get_iids : Proc(IInputPaneInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IInputPaneInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IInputPaneInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IInputPaneInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IInputPaneInterop_GUID = "75cf2c57-9195-4931-8332-f0b409e916af"
  IID_IInputPaneInterop = LibC::GUID.new(0x75cf2c57_u32, 0x9195_u16, 0x4931_u16, StaticArray[0x83_u8, 0x32_u8, 0xf0_u8, 0xb4_u8, 0x9_u8, 0xe9_u8, 0x16_u8, 0xaf_u8])
  struct IInputPaneInterop
    lpVtbl : IInputPaneInteropVTbl*
  end

  struct IPlayToManagerInteropVTbl
    query_interface : Proc(IPlayToManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPlayToManagerInterop*, UInt32)
    release : Proc(IPlayToManagerInterop*, UInt32)
    get_iids : Proc(IPlayToManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IPlayToManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IPlayToManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IPlayToManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    show_play_to_ui_for_window : Proc(IPlayToManagerInterop*, LibC::HANDLE, HRESULT)
  end

  IPlayToManagerInterop_GUID = "24394699-1f2c-4eb3-8cd7-0ec1da42a540"
  IID_IPlayToManagerInterop = LibC::GUID.new(0x24394699_u32, 0x1f2c_u16, 0x4eb3_u16, StaticArray[0x8c_u8, 0xd7_u8, 0xe_u8, 0xc1_u8, 0xda_u8, 0x42_u8, 0xa5_u8, 0x40_u8])
  struct IPlayToManagerInterop
    lpVtbl : IPlayToManagerInteropVTbl*
  end

  struct ICorrelationVectorInformationVTbl
    query_interface : Proc(ICorrelationVectorInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICorrelationVectorInformation*, UInt32)
    release : Proc(ICorrelationVectorInformation*, UInt32)
    get_iids : Proc(ICorrelationVectorInformation*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ICorrelationVectorInformation*, HSTRING*, HRESULT)
    get_trust_level : Proc(ICorrelationVectorInformation*, TrustLevel*, HRESULT)
    get_last_correlation_vector_for_thread : Proc(ICorrelationVectorInformation*, HSTRING*, HRESULT)
    get_next_correlation_vector_for_thread : Proc(ICorrelationVectorInformation*, HSTRING*, HRESULT)
    put_next_correlation_vector_for_thread : Proc(ICorrelationVectorInformation*, HSTRING, HRESULT)
  end

  ICorrelationVectorInformation_GUID = "83c78b3c-d88b-4950-aa6e-22b8d22aabd3"
  IID_ICorrelationVectorInformation = LibC::GUID.new(0x83c78b3c_u32, 0xd88b_u16, 0x4950_u16, StaticArray[0xaa_u8, 0x6e_u8, 0x22_u8, 0xb8_u8, 0xd2_u8, 0x2a_u8, 0xab_u8, 0xd3_u8])
  struct ICorrelationVectorInformation
    lpVtbl : ICorrelationVectorInformationVTbl*
  end

  struct IUIViewSettingsInteropVTbl
    query_interface : Proc(IUIViewSettingsInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIViewSettingsInterop*, UInt32)
    release : Proc(IUIViewSettingsInterop*, UInt32)
    get_iids : Proc(IUIViewSettingsInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IUIViewSettingsInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IUIViewSettingsInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IUIViewSettingsInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IUIViewSettingsInterop_GUID = "3694dbf9-8f68-44be-8ff5-195c98ede8a6"
  IID_IUIViewSettingsInterop = LibC::GUID.new(0x3694dbf9_u32, 0x8f68_u16, 0x44be_u16, StaticArray[0x8f_u8, 0xf5_u8, 0x19_u8, 0x5c_u8, 0x98_u8, 0xed_u8, 0xe8_u8, 0xa6_u8])
  struct IUIViewSettingsInterop
    lpVtbl : IUIViewSettingsInteropVTbl*
  end

  struct IUserActivityInteropVTbl
    query_interface : Proc(IUserActivityInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUserActivityInterop*, UInt32)
    release : Proc(IUserActivityInterop*, UInt32)
    get_iids : Proc(IUserActivityInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IUserActivityInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IUserActivityInterop*, TrustLevel*, HRESULT)
    create_session_for_window : Proc(IUserActivityInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IUserActivityInterop_GUID = "1ade314d-0e0a-40d9-824c-9a088a50059f"
  IID_IUserActivityInterop = LibC::GUID.new(0x1ade314d_u32, 0xe0a_u16, 0x40d9_u16, StaticArray[0x82_u8, 0x4c_u8, 0x9a_u8, 0x8_u8, 0x8a_u8, 0x50_u8, 0x5_u8, 0x9f_u8])
  struct IUserActivityInterop
    lpVtbl : IUserActivityInteropVTbl*
  end

  struct IUserActivitySourceHostInteropVTbl
    query_interface : Proc(IUserActivitySourceHostInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUserActivitySourceHostInterop*, UInt32)
    release : Proc(IUserActivitySourceHostInterop*, UInt32)
    get_iids : Proc(IUserActivitySourceHostInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IUserActivitySourceHostInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IUserActivitySourceHostInterop*, TrustLevel*, HRESULT)
    set_activity_source_host : Proc(IUserActivitySourceHostInterop*, HSTRING, HRESULT)
  end

  IUserActivitySourceHostInterop_GUID = "c15df8bc-8844-487a-b85b-7578e0f61419"
  IID_IUserActivitySourceHostInterop = LibC::GUID.new(0xc15df8bc_u32, 0x8844_u16, 0x487a_u16, StaticArray[0xb8_u8, 0x5b_u8, 0x75_u8, 0x78_u8, 0xe0_u8, 0xf6_u8, 0x14_u8, 0x19_u8])
  struct IUserActivitySourceHostInterop
    lpVtbl : IUserActivitySourceHostInteropVTbl*
  end

  struct IUserActivityRequestManagerInteropVTbl
    query_interface : Proc(IUserActivityRequestManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUserActivityRequestManagerInterop*, UInt32)
    release : Proc(IUserActivityRequestManagerInterop*, UInt32)
    get_iids : Proc(IUserActivityRequestManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IUserActivityRequestManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IUserActivityRequestManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IUserActivityRequestManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IUserActivityRequestManagerInterop_GUID = "dd69f876-9699-4715-9095-e37ea30dfa1b"
  IID_IUserActivityRequestManagerInterop = LibC::GUID.new(0xdd69f876_u32, 0x9699_u16, 0x4715_u16, StaticArray[0x90_u8, 0x95_u8, 0xe3_u8, 0x7e_u8, 0xa3_u8, 0xd_u8, 0xfa_u8, 0x1b_u8])
  struct IUserActivityRequestManagerInterop
    lpVtbl : IUserActivityRequestManagerInteropVTbl*
  end

  struct IUserConsentVerifierInteropVTbl
    query_interface : Proc(IUserConsentVerifierInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUserConsentVerifierInterop*, UInt32)
    release : Proc(IUserConsentVerifierInterop*, UInt32)
    get_iids : Proc(IUserConsentVerifierInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IUserConsentVerifierInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IUserConsentVerifierInterop*, TrustLevel*, HRESULT)
    request_verification_for_window_async : Proc(IUserConsentVerifierInterop*, LibC::HANDLE, HSTRING, Guid*, Void**, HRESULT)
  end

  IUserConsentVerifierInterop_GUID = "39e050c3-4e74-441a-8dc0-b81104df949c"
  IID_IUserConsentVerifierInterop = LibC::GUID.new(0x39e050c3_u32, 0x4e74_u16, 0x441a_u16, StaticArray[0x8d_u8, 0xc0_u8, 0xb8_u8, 0x11_u8, 0x4_u8, 0xdf_u8, 0x94_u8, 0x9c_u8])
  struct IUserConsentVerifierInterop
    lpVtbl : IUserConsentVerifierInteropVTbl*
  end

  struct IWebAuthenticationCoreManagerInteropVTbl
    query_interface : Proc(IWebAuthenticationCoreManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebAuthenticationCoreManagerInterop*, UInt32)
    release : Proc(IWebAuthenticationCoreManagerInterop*, UInt32)
    get_iids : Proc(IWebAuthenticationCoreManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IWebAuthenticationCoreManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IWebAuthenticationCoreManagerInterop*, TrustLevel*, HRESULT)
    request_token_for_window_async : Proc(IWebAuthenticationCoreManagerInterop*, LibC::HANDLE, IInspectable, Guid*, Void**, HRESULT)
    request_token_with_web_account_for_window_async : Proc(IWebAuthenticationCoreManagerInterop*, LibC::HANDLE, IInspectable, IInspectable, Guid*, Void**, HRESULT)
  end

  IWebAuthenticationCoreManagerInterop_GUID = "f4b8e804-811e-4436-b69c-44cb67b72084"
  IID_IWebAuthenticationCoreManagerInterop = LibC::GUID.new(0xf4b8e804_u32, 0x811e_u16, 0x4436_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x44_u8, 0xcb_u8, 0x67_u8, 0xb7_u8, 0x20_u8, 0x84_u8])
  struct IWebAuthenticationCoreManagerInterop
    lpVtbl : IWebAuthenticationCoreManagerInteropVTbl*
  end

  struct IRestrictedErrorInfoVTbl
    query_interface : Proc(IRestrictedErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRestrictedErrorInfo*, UInt32)
    release : Proc(IRestrictedErrorInfo*, UInt32)
    get_error_details : Proc(IRestrictedErrorInfo*, UInt8**, HRESULT*, UInt8**, UInt8**, HRESULT)
    get_reference : Proc(IRestrictedErrorInfo*, UInt8**, HRESULT)
  end

  IRestrictedErrorInfo_GUID = "82ba7092-4c88-427d-a7bc-16dd93feb67e"
  IID_IRestrictedErrorInfo = LibC::GUID.new(0x82ba7092_u32, 0x4c88_u16, 0x427d_u16, StaticArray[0xa7_u8, 0xbc_u8, 0x16_u8, 0xdd_u8, 0x93_u8, 0xfe_u8, 0xb6_u8, 0x7e_u8])
  struct IRestrictedErrorInfo
    lpVtbl : IRestrictedErrorInfoVTbl*
  end

  struct ILanguageExceptionErrorInfoVTbl
    query_interface : Proc(ILanguageExceptionErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionErrorInfo*, UInt32)
    release : Proc(ILanguageExceptionErrorInfo*, UInt32)
    get_language_exception : Proc(ILanguageExceptionErrorInfo*, IUnknown*, HRESULT)
  end

  ILanguageExceptionErrorInfo_GUID = "04a2dbf3-df83-116c-0946-0812abf6e07d"
  IID_ILanguageExceptionErrorInfo = LibC::GUID.new(0x4a2dbf3_u32, 0xdf83_u16, 0x116c_u16, StaticArray[0x9_u8, 0x46_u8, 0x8_u8, 0x12_u8, 0xab_u8, 0xf6_u8, 0xe0_u8, 0x7d_u8])
  struct ILanguageExceptionErrorInfo
    lpVtbl : ILanguageExceptionErrorInfoVTbl*
  end

  struct ILanguageExceptionTransformVTbl
    query_interface : Proc(ILanguageExceptionTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionTransform*, UInt32)
    release : Proc(ILanguageExceptionTransform*, UInt32)
    get_transformed_restricted_error_info : Proc(ILanguageExceptionTransform*, IRestrictedErrorInfo*, HRESULT)
  end

  ILanguageExceptionTransform_GUID = "feb5a271-a6cd-45ce-880a-696706badc65"
  IID_ILanguageExceptionTransform = LibC::GUID.new(0xfeb5a271_u32, 0xa6cd_u16, 0x45ce_u16, StaticArray[0x88_u8, 0xa_u8, 0x69_u8, 0x67_u8, 0x6_u8, 0xba_u8, 0xdc_u8, 0x65_u8])
  struct ILanguageExceptionTransform
    lpVtbl : ILanguageExceptionTransformVTbl*
  end

  struct ILanguageExceptionStackBackTraceVTbl
    query_interface : Proc(ILanguageExceptionStackBackTrace*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionStackBackTrace*, UInt32)
    release : Proc(ILanguageExceptionStackBackTrace*, UInt32)
    get_stack_back_trace : Proc(ILanguageExceptionStackBackTrace*, UInt32, LibC::UINT_PTR*, UInt32*, HRESULT)
  end

  ILanguageExceptionStackBackTrace_GUID = "cbe53fb5-f967-4258-8d34-42f5e25833de"
  IID_ILanguageExceptionStackBackTrace = LibC::GUID.new(0xcbe53fb5_u32, 0xf967_u16, 0x4258_u16, StaticArray[0x8d_u8, 0x34_u8, 0x42_u8, 0xf5_u8, 0xe2_u8, 0x58_u8, 0x33_u8, 0xde_u8])
  struct ILanguageExceptionStackBackTrace
    lpVtbl : ILanguageExceptionStackBackTraceVTbl*
  end

  struct ILanguageExceptionErrorInfo2VTbl
    query_interface : Proc(ILanguageExceptionErrorInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionErrorInfo2*, UInt32)
    release : Proc(ILanguageExceptionErrorInfo2*, UInt32)
    get_language_exception : Proc(ILanguageExceptionErrorInfo2*, IUnknown*, HRESULT)
    get_previous_language_exception_error_info : Proc(ILanguageExceptionErrorInfo2*, ILanguageExceptionErrorInfo2*, HRESULT)
    capture_propagation_context : Proc(ILanguageExceptionErrorInfo2*, IUnknown, HRESULT)
    get_propagation_context_head : Proc(ILanguageExceptionErrorInfo2*, ILanguageExceptionErrorInfo2*, HRESULT)
  end

  ILanguageExceptionErrorInfo2_GUID = "5746e5c4-5b97-424c-b620-2822915734dd"
  IID_ILanguageExceptionErrorInfo2 = LibC::GUID.new(0x5746e5c4_u32, 0x5b97_u16, 0x424c_u16, StaticArray[0xb6_u8, 0x20_u8, 0x28_u8, 0x22_u8, 0x91_u8, 0x57_u8, 0x34_u8, 0xdd_u8])
  struct ILanguageExceptionErrorInfo2
    lpVtbl : ILanguageExceptionErrorInfo2VTbl*
  end

  struct IActivationFactoryVTbl
    query_interface : Proc(IActivationFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActivationFactory*, UInt32)
    release : Proc(IActivationFactory*, UInt32)
    get_iids : Proc(IActivationFactory*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IActivationFactory*, HSTRING*, HRESULT)
    get_trust_level : Proc(IActivationFactory*, TrustLevel*, HRESULT)
    activate_instance : Proc(IActivationFactory*, IInspectable*, HRESULT)
  end

  IActivationFactory_GUID = "00000035-0000-0000-c000-000000000046"
  IID_IActivationFactory = LibC::GUID.new(0x35_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IActivationFactory
    lpVtbl : IActivationFactoryVTbl*
  end

  struct IBufferByteAccessVTbl
    query_interface : Proc(IBufferByteAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBufferByteAccess*, UInt32)
    release : Proc(IBufferByteAccess*, UInt32)
    buffer : Proc(IBufferByteAccess*, UInt8**, HRESULT)
  end

  IBufferByteAccess_GUID = "905a0fef-bc53-11df-8c49-001e4fc686da"
  IID_IBufferByteAccess = LibC::GUID.new(0x905a0fef_u32, 0xbc53_u16, 0x11df_u16, StaticArray[0x8c_u8, 0x49_u8, 0x0_u8, 0x1e_u8, 0x4f_u8, 0xc6_u8, 0x86_u8, 0xda_u8])
  struct IBufferByteAccess
    lpVtbl : IBufferByteAccessVTbl*
  end

  struct IRoSimpleMetaDataBuilderVTbl
    set_win_rt_interface : Proc(IRoSimpleMetaDataBuilder*, Guid, HRESULT)
    set_delegate : Proc(IRoSimpleMetaDataBuilder*, Guid, HRESULT)
    set_interface_group_simple_default : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)
    set_interface_group_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
    set_runtime_class_simple_default : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)
    set_runtime_class_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
    set_struct : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
    set_enum : Proc(IRoSimpleMetaDataBuilder*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_parameterized_interface : Proc(IRoSimpleMetaDataBuilder*, Guid, UInt32, HRESULT)
    set_parameterized_delegate : Proc(IRoSimpleMetaDataBuilder*, Guid, UInt32, HRESULT)
  end

  struct IRoSimpleMetaDataBuilder
    lpVtbl : IRoSimpleMetaDataBuilderVTbl*
  end

  struct IRoMetaDataLocatorVTbl
    locate : Proc(IRoMetaDataLocator*, LibC::LPWSTR, IRoSimpleMetaDataBuilder, HRESULT)
  end

  struct IRoMetaDataLocator
    lpVtbl : IRoMetaDataLocatorVTbl*
  end

  struct IMemoryBufferByteAccessVTbl
    query_interface : Proc(IMemoryBufferByteAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMemoryBufferByteAccess*, UInt32)
    release : Proc(IMemoryBufferByteAccess*, UInt32)
    get_buffer : Proc(IMemoryBufferByteAccess*, UInt8**, UInt32*, HRESULT)
  end

  IMemoryBufferByteAccess_GUID = "5b0d3235-4dba-4d44-865e-8f1d0e4fd04d"
  IID_IMemoryBufferByteAccess = LibC::GUID.new(0x5b0d3235_u32, 0x4dba_u16, 0x4d44_u16, StaticArray[0x86_u8, 0x5e_u8, 0x8f_u8, 0x1d_u8, 0xe_u8, 0x4f_u8, 0xd0_u8, 0x4d_u8])
  struct IMemoryBufferByteAccess
    lpVtbl : IMemoryBufferByteAccessVTbl*
  end

  struct IWeakReferenceVTbl
    query_interface : Proc(IWeakReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWeakReference*, UInt32)
    release : Proc(IWeakReference*, UInt32)
    resolve : Proc(IWeakReference*, Guid*, Void**, HRESULT)
  end

  IWeakReference_GUID = "00000037-0000-0000-c000-000000000046"
  IID_IWeakReference = LibC::GUID.new(0x37_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWeakReference
    lpVtbl : IWeakReferenceVTbl*
  end

  struct IWeakReferenceSourceVTbl
    query_interface : Proc(IWeakReferenceSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWeakReferenceSource*, UInt32)
    release : Proc(IWeakReferenceSource*, UInt32)
    get_weak_reference : Proc(IWeakReferenceSource*, IWeakReference*, HRESULT)
  end

  IWeakReferenceSource_GUID = "00000038-0000-0000-c000-000000000046"
  IID_IWeakReferenceSource = LibC::GUID.new(0x38_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWeakReferenceSource
    lpVtbl : IWeakReferenceSourceVTbl*
  end

  struct ISystemMediaTransportControlsInteropVTbl
    query_interface : Proc(ISystemMediaTransportControlsInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemMediaTransportControlsInterop*, UInt32)
    release : Proc(ISystemMediaTransportControlsInterop*, UInt32)
    get_iids : Proc(ISystemMediaTransportControlsInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ISystemMediaTransportControlsInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(ISystemMediaTransportControlsInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(ISystemMediaTransportControlsInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  ISystemMediaTransportControlsInterop_GUID = "ddb0472d-c911-4a1f-86d9-dc3d71a95f5a"
  IID_ISystemMediaTransportControlsInterop = LibC::GUID.new(0xddb0472d_u32, 0xc911_u16, 0x4a1f_u16, StaticArray[0x86_u8, 0xd9_u8, 0xdc_u8, 0x3d_u8, 0x71_u8, 0xa9_u8, 0x5f_u8, 0x5a_u8])
  struct ISystemMediaTransportControlsInterop
    lpVtbl : ISystemMediaTransportControlsInteropVTbl*
  end

  struct IShareWindowCommandEventArgsInteropVTbl
    query_interface : Proc(IShareWindowCommandEventArgsInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IShareWindowCommandEventArgsInterop*, UInt32)
    release : Proc(IShareWindowCommandEventArgsInterop*, UInt32)
    get_window : Proc(IShareWindowCommandEventArgsInterop*, HANDLE*, HRESULT)
  end

  IShareWindowCommandEventArgsInterop_GUID = "6571a721-643d-43d4-aca4-6b6f5f30f1ad"
  IID_IShareWindowCommandEventArgsInterop = LibC::GUID.new(0x6571a721_u32, 0x643d_u16, 0x43d4_u16, StaticArray[0xac_u8, 0xa4_u8, 0x6b_u8, 0x6f_u8, 0x5f_u8, 0x30_u8, 0xf1_u8, 0xad_u8])
  struct IShareWindowCommandEventArgsInterop
    lpVtbl : IShareWindowCommandEventArgsInteropVTbl*
  end

  struct IShareWindowCommandSourceInteropVTbl
    query_interface : Proc(IShareWindowCommandSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IShareWindowCommandSourceInterop*, UInt32)
    release : Proc(IShareWindowCommandSourceInterop*, UInt32)
    get_for_window : Proc(IShareWindowCommandSourceInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IShareWindowCommandSourceInterop_GUID = "461a191f-8424-43a6-a0fa-3451a22f56ab"
  IID_IShareWindowCommandSourceInterop = LibC::GUID.new(0x461a191f_u32, 0x8424_u16, 0x43a6_u16, StaticArray[0xa0_u8, 0xfa_u8, 0x34_u8, 0x51_u8, 0xa2_u8, 0x2f_u8, 0x56_u8, 0xab_u8])
  struct IShareWindowCommandSourceInterop
    lpVtbl : IShareWindowCommandSourceInteropVTbl*
  end

  struct IMessageDispatcherVTbl
    query_interface : Proc(IMessageDispatcher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMessageDispatcher*, UInt32)
    release : Proc(IMessageDispatcher*, UInt32)
    get_iids : Proc(IMessageDispatcher*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IMessageDispatcher*, HSTRING*, HRESULT)
    get_trust_level : Proc(IMessageDispatcher*, TrustLevel*, HRESULT)
    pump_messages : Proc(IMessageDispatcher*, HRESULT)
  end

  IMessageDispatcher_GUID = "f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d"
  IID_IMessageDispatcher = LibC::GUID.new(0xf5f84c8f_u32, 0xcfd0_u16, 0x4cd6_u16, StaticArray[0xb6_u8, 0x6b_u8, 0xc5_u8, 0xd2_u8, 0x6f_u8, 0xf1_u8, 0x68_u8, 0x9d_u8])
  struct IMessageDispatcher
    lpVtbl : IMessageDispatcherVTbl*
  end


  # Params # dwclientpid : UInt32 [In],ui64proxyaddress : UInt64 [In],pserverinformation : ServerInformation* [In]
  fun CoDecodeProxy(dwclientpid : UInt32, ui64proxyaddress : UInt64, pserverinformation : ServerInformation*) : HRESULT

  # Params # options : AgileReferenceOptions [In],riid : Guid* [In],punk : IUnknown [In],ppagilereference : IAgileReference* [In]
  fun RoGetAgileReference(options : AgileReferenceOptions, riid : Guid*, punk : IUnknown, ppagilereference : IAgileReference*) : HRESULT

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HSTRING* [In]
  fun HSTRING_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HSTRING*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HSTRING* [In]
  fun HSTRING_UserFree(param0 : UInt32*, param1 : HSTRING*) : Void

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HSTRING* [In]
  fun HSTRING_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HSTRING*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HSTRING* [In]
  fun HSTRING_UserFree64(param0 : UInt32*, param1 : HSTRING*) : Void

  # Params # sourcestring : Char* [In],length : UInt32 [In],string : HSTRING* [In]
  fun WindowsCreateString(sourcestring : Char*, length : UInt32, string : HSTRING*) : HRESULT

  # Params # sourcestring : LibC::LPWSTR [In],length : UInt32 [In],hstringheader : HSTRING_HEADER* [In],string : HSTRING* [In]
  fun WindowsCreateStringReference(sourcestring : LibC::LPWSTR, length : UInt32, hstringheader : HSTRING_HEADER*, string : HSTRING*) : HRESULT

  # Params # string : HSTRING [In]
  fun WindowsDeleteString(string : HSTRING) : HRESULT

  # Params # string : HSTRING [In],newstring : HSTRING* [In]
  fun WindowsDuplicateString(string : HSTRING, newstring : HSTRING*) : HRESULT

  # Params # string : HSTRING [In]
  fun WindowsGetStringLen(string : HSTRING) : UInt32

  # Params # string : HSTRING [In],length : UInt32* [In]
  fun WindowsGetStringRawBuffer(string : HSTRING, length : UInt32*) : LibC::LPWSTR

  # Params # string : HSTRING [In]
  fun WindowsIsStringEmpty(string : HSTRING) : LibC::BOOL

  # Params # string : HSTRING [In],hasembednull : LibC::BOOL* [In]
  fun WindowsStringHasEmbeddedNull(string : HSTRING, hasembednull : LibC::BOOL*) : HRESULT

  # Params # string1 : HSTRING [In],string2 : HSTRING [In],result : Int32* [In]
  fun WindowsCompareStringOrdinal(string1 : HSTRING, string2 : HSTRING, result : Int32*) : HRESULT

  # Params # string : HSTRING [In],startindex : UInt32 [In],newstring : HSTRING* [In]
  fun WindowsSubstring(string : HSTRING, startindex : UInt32, newstring : HSTRING*) : HRESULT

  # Params # string : HSTRING [In],startindex : UInt32 [In],length : UInt32 [In],newstring : HSTRING* [In]
  fun WindowsSubstringWithSpecifiedLength(string : HSTRING, startindex : UInt32, length : UInt32, newstring : HSTRING*) : HRESULT

  # Params # string1 : HSTRING [In],string2 : HSTRING [In],newstring : HSTRING* [In]
  fun WindowsConcatString(string1 : HSTRING, string2 : HSTRING, newstring : HSTRING*) : HRESULT

  # Params # string : HSTRING [In],stringreplaced : HSTRING [In],stringreplacewith : HSTRING [In],newstring : HSTRING* [In]
  fun WindowsReplaceString(string : HSTRING, stringreplaced : HSTRING, stringreplacewith : HSTRING, newstring : HSTRING*) : HRESULT

  # Params # string : HSTRING [In],trimstring : HSTRING [In],newstring : HSTRING* [In]
  fun WindowsTrimStringStart(string : HSTRING, trimstring : HSTRING, newstring : HSTRING*) : HRESULT

  # Params # string : HSTRING [In],trimstring : HSTRING [In],newstring : HSTRING* [In]
  fun WindowsTrimStringEnd(string : HSTRING, trimstring : HSTRING, newstring : HSTRING*) : HRESULT

  # Params # length : UInt32 [In],charbuffer : UInt16** [In],bufferhandle : HSTRING_BUFFER* [In]
  fun WindowsPreallocateStringBuffer(length : UInt32, charbuffer : UInt16**, bufferhandle : HSTRING_BUFFER*) : HRESULT

  # Params # bufferhandle : HSTRING_BUFFER [In],string : HSTRING* [In]
  fun WindowsPromoteStringBuffer(bufferhandle : HSTRING_BUFFER, string : HSTRING*) : HRESULT

  # Params # bufferhandle : HSTRING_BUFFER [In]
  fun WindowsDeleteStringBuffer(bufferhandle : HSTRING_BUFFER) : HRESULT

  # Params # targethstring : LibC::UINT_PTR [In],machine : UInt16 [In],callback : PINSPECT_HSTRING_CALLBACK [In],context : Void* [In],length : UInt32* [In],targetstringaddress : LibC::UINT_PTR* [In]
  fun WindowsInspectString(targethstring : LibC::UINT_PTR, machine : UInt16, callback : PINSPECT_HSTRING_CALLBACK, context : Void*, length : UInt32*, targetstringaddress : LibC::UINT_PTR*) : HRESULT

  # Params # targethstring : UInt64 [In],machine : UInt16 [In],callback : PINSPECT_HSTRING_CALLBACK2 [In],context : Void* [In],length : UInt32* [In],targetstringaddress : UInt64* [In]
  fun WindowsInspectString2(targethstring : UInt64, machine : UInt16, callback : PINSPECT_HSTRING_CALLBACK2, context : Void*, length : UInt32*, targetstringaddress : UInt64*) : HRESULT

  # Params # options : DispatcherQueueOptions [In],dispatcherqueuecontroller : Void* [In]
  fun CreateDispatcherQueueController(options : DispatcherQueueOptions, dispatcherqueuecontroller : Void*) : HRESULT

  # Params # inittype : RO_INIT_TYPE [In]
  fun RoInitialize(inittype : RO_INIT_TYPE) : HRESULT

  # Params # 
  fun RoUninitialize : Void

  # Params # activatableclassid : HSTRING [In],instance : IInspectable* [In]
  fun RoActivateInstance(activatableclassid : HSTRING, instance : IInspectable*) : HRESULT

  # Params # activatableclassids : HSTRING* [In],activationfactorycallbacks : LibC::IntPtrT* [In],count : UInt32 [In],cookie : LibC::IntPtrT* [In]
  fun RoRegisterActivationFactories(activatableclassids : HSTRING*, activationfactorycallbacks : LibC::IntPtrT*, count : UInt32, cookie : LibC::IntPtrT*) : HRESULT

  # Params # cookie : LibC::IntPtrT [In]
  fun RoRevokeActivationFactories(cookie : LibC::IntPtrT) : Void

  # Params # activatableclassid : HSTRING [In],iid : Guid* [In],factory : Void** [In]
  fun RoGetActivationFactory(activatableclassid : HSTRING, iid : Guid*, factory : Void**) : HRESULT

  # Params # callbackobject : IApartmentShutdown [In],apartmentidentifier : UInt64* [In],regcookie : APARTMENT_SHUTDOWN_REGISTRATION_COOKIE* [In]
  fun RoRegisterForApartmentShutdown(callbackobject : IApartmentShutdown, apartmentidentifier : UInt64*, regcookie : APARTMENT_SHUTDOWN_REGISTRATION_COOKIE*) : HRESULT

  # Params # regcookie : APARTMENT_SHUTDOWN_REGISTRATION_COOKIE [In]
  fun RoUnregisterForApartmentShutdown(regcookie : APARTMENT_SHUTDOWN_REGISTRATION_COOKIE) : HRESULT

  # Params # apartmentidentifier : UInt64* [In]
  fun RoGetApartmentIdentifier(apartmentidentifier : UInt64*) : HRESULT

  # Params # buffermarshaler : IMarshal* [In]
  fun RoGetBufferMarshaler(buffermarshaler : IMarshal*) : HRESULT

  # Params # pflags : UInt32* [In]
  fun RoGetErrorReportingFlags(pflags : UInt32*) : HRESULT

  # Params # flags : UInt32 [In]
  fun RoSetErrorReportingFlags(flags : UInt32) : HRESULT

  # Params # reference : LibC::LPWSTR [In],pprestrictederrorinfo : IRestrictedErrorInfo* [In]
  fun RoResolveRestrictedErrorInfoReference(reference : LibC::LPWSTR, pprestrictederrorinfo : IRestrictedErrorInfo*) : HRESULT

  # Params # prestrictederrorinfo : IRestrictedErrorInfo [In]
  fun SetRestrictedErrorInfo(prestrictederrorinfo : IRestrictedErrorInfo) : HRESULT

  # Params # pprestrictederrorinfo : IRestrictedErrorInfo* [In]
  fun GetRestrictedErrorInfo(pprestrictederrorinfo : IRestrictedErrorInfo*) : HRESULT

  # Params # error : HRESULT [In],cchmax : UInt32 [In],message : Char* [In]
  fun RoOriginateErrorW(error : HRESULT, cchmax : UInt32, message : Char*) : LibC::BOOL

  # Params # error : HRESULT [In],message : HSTRING [In]
  fun RoOriginateError(error : HRESULT, message : HSTRING) : LibC::BOOL

  # Params # olderror : HRESULT [In],newerror : HRESULT [In],cchmax : UInt32 [In],message : Char* [In]
  fun RoTransformErrorW(olderror : HRESULT, newerror : HRESULT, cchmax : UInt32, message : Char*) : LibC::BOOL

  # Params # olderror : HRESULT [In],newerror : HRESULT [In],message : HSTRING [In]
  fun RoTransformError(olderror : HRESULT, newerror : HRESULT, message : HSTRING) : LibC::BOOL

  # Params # hr : HRESULT [In]
  fun RoCaptureErrorContext(hr : HRESULT) : HRESULT

  # Params # hrerror : HRESULT [In]
  fun RoFailFastWithErrorContext(hrerror : HRESULT) : Void

  # Params # error : HRESULT [In],message : HSTRING [In],languageexception : IUnknown [In]
  fun RoOriginateLanguageException(error : HRESULT, message : HSTRING, languageexception : IUnknown) : LibC::BOOL

  # Params # 
  fun RoClearError : Void

  # Params # prestrictederrorinfo : IRestrictedErrorInfo [In]
  fun RoReportUnhandledError(prestrictederrorinfo : IRestrictedErrorInfo) : HRESULT

  # Params # targettebaddress : LibC::UINT_PTR [In],machine : UInt16 [In],readmemorycallback : PINSPECT_MEMORY_CALLBACK [In],context : Void* [In],targeterrorinfoaddress : LibC::UINT_PTR* [In]
  fun RoInspectThreadErrorInfo(targettebaddress : LibC::UINT_PTR, machine : UInt16, readmemorycallback : PINSPECT_MEMORY_CALLBACK, context : Void*, targeterrorinfoaddress : LibC::UINT_PTR*) : HRESULT

  # Params # targeterrorinfoaddress : LibC::UINT_PTR [In],machine : UInt16 [In],readmemorycallback : PINSPECT_MEMORY_CALLBACK [In],context : Void* [In],framecount : UInt32* [In],targetbacktraceaddress : LibC::UINT_PTR* [In]
  fun RoInspectCapturedStackBackTrace(targeterrorinfoaddress : LibC::UINT_PTR, machine : UInt16, readmemorycallback : PINSPECT_MEMORY_CALLBACK, context : Void*, framecount : UInt32*, targetbacktraceaddress : LibC::UINT_PTR*) : HRESULT

  # Params # hrin : HRESULT [In],pprestrictederrorinfo : IRestrictedErrorInfo* [In]
  fun RoGetMatchingRestrictedErrorInfo(hrin : HRESULT, pprestrictederrorinfo : IRestrictedErrorInfo*) : HRESULT

  # Params # punkdelegate : IUnknown [In],prestrictederrorinfo : IRestrictedErrorInfo [In]
  fun RoReportFailedDelegate(punkdelegate : IUnknown, prestrictederrorinfo : IRestrictedErrorInfo) : HRESULT

  # Params # 
  fun IsErrorPropagationEnabled : LibC::BOOL

  # Params # rclsid : Guid* [In],riid : Guid* [In],ppv : Void** [In]
  fun MetaDataGetDispenser(rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # nameelementcount : UInt32 [In],nameelements : LibC::LPWSTR* [In],metadatalocator : IRoMetaDataLocator [In],iid : Guid* [In],pextra : ROPARAMIIDHANDLE* [In]
  fun RoGetParameterizedTypeInstanceIID(nameelementcount : UInt32, nameelements : LibC::LPWSTR*, metadatalocator : IRoMetaDataLocator, iid : Guid*, pextra : ROPARAMIIDHANDLE*) : HRESULT

  # Params # extra : ROPARAMIIDHANDLE [In]
  fun RoFreeParameterizedTypeExtra(extra : ROPARAMIIDHANDLE) : Void

  # Params # extra : ROPARAMIIDHANDLE [In]
  fun RoParameterizedTypeExtraGetTypeSignature(extra : ROPARAMIIDHANDLE) : PSTR

  # Params # servername : HSTRING [In],activatableclassids : HSTRING** [In],count : UInt32* [In]
  fun RoGetServerActivatableClasses(servername : HSTRING, activatableclassids : HSTRING**, count : UInt32*) : HRESULT

  # Params # filepath : LibC::LPWSTR [In],accessmode : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun CreateRandomAccessStreamOnFile(filepath : LibC::LPWSTR, accessmode : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # stream : IStream [In],options : BSOS_OPTIONS [In],riid : Guid* [In],ppv : Void** [In]
  fun CreateRandomAccessStreamOverStream(stream : IStream, options : BSOS_OPTIONS, riid : Guid*, ppv : Void**) : HRESULT

  # Params # randomaccessstream : IUnknown [In],riid : Guid* [In],ppv : Void** [In]
  fun CreateStreamOverRandomAccessStream(randomaccessstream : IUnknown, riid : Guid*, ppv : Void**) : HRESULT
end
struct LibWin32::IAgileReference
  def query_interface(this : IAgileReference*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAgileReference*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAgileReference*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def resolve(this : IAgileReference*, riid : Guid*, ppvobjectreference : Void**) : HRESULT
    @lpVtbl.value.resolve.call(this, riid, ppvobjectreference)
  end
end
struct LibWin32::IApartmentShutdown
  def query_interface(this : IApartmentShutdown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IApartmentShutdown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IApartmentShutdown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_uninitialize(this : IApartmentShutdown*, ui64apartmentidentifier : UInt64) : Void
    @lpVtbl.value.on_uninitialize.call(this, ui64apartmentidentifier)
  end
end
struct LibWin32::ISpatialInteractionManagerInterop
  def query_interface(this : ISpatialInteractionManagerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISpatialInteractionManagerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISpatialInteractionManagerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : ISpatialInteractionManagerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : ISpatialInteractionManagerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : ISpatialInteractionManagerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : ISpatialInteractionManagerInterop*, window : LibC::HANDLE, riid : Guid*, spatialinteractionmanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, window, riid, spatialinteractionmanager)
  end
end
struct LibWin32::IHolographicSpaceInterop
  def query_interface(this : IHolographicSpaceInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolographicSpaceInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolographicSpaceInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IHolographicSpaceInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IHolographicSpaceInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IHolographicSpaceInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def create_for_window(this : IHolographicSpaceInterop*, window : LibC::HANDLE, riid : Guid*, holographicspace : Void**) : HRESULT
    @lpVtbl.value.create_for_window.call(this, window, riid, holographicspace)
  end
end
struct LibWin32::IInspectable
  def query_interface(this : IInspectable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInspectable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInspectable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IInspectable*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IInspectable*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IInspectable*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
end
struct LibWin32::IAccountsSettingsPaneInterop
  def query_interface(this : IAccountsSettingsPaneInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccountsSettingsPaneInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccountsSettingsPaneInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IAccountsSettingsPaneInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IAccountsSettingsPaneInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IAccountsSettingsPaneInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IAccountsSettingsPaneInterop*, appwindow : LibC::HANDLE, riid : Guid*, accountssettingspane : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, appwindow, riid, accountssettingspane)
  end
  def show_manage_accounts_for_window_async(this : IAccountsSettingsPaneInterop*, appwindow : LibC::HANDLE, riid : Guid*, asyncaction : Void**) : HRESULT
    @lpVtbl.value.show_manage_accounts_for_window_async.call(this, appwindow, riid, asyncaction)
  end
  def show_add_account_for_window_async(this : IAccountsSettingsPaneInterop*, appwindow : LibC::HANDLE, riid : Guid*, asyncaction : Void**) : HRESULT
    @lpVtbl.value.show_add_account_for_window_async.call(this, appwindow, riid, asyncaction)
  end
end
struct LibWin32::IAppServiceConnectionExtendedExecution
  def query_interface(this : IAppServiceConnectionExtendedExecution*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAppServiceConnectionExtendedExecution*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAppServiceConnectionExtendedExecution*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open_for_extended_execution_async(this : IAppServiceConnectionExtendedExecution*, riid : Guid*, operation : Void**) : HRESULT
    @lpVtbl.value.open_for_extended_execution_async.call(this, riid, operation)
  end
end
struct LibWin32::ICorrelationVectorSource
  def query_interface(this : ICorrelationVectorSource*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICorrelationVectorSource*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICorrelationVectorSource*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_correlation_vector(this : ICorrelationVectorSource*, cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_correlation_vector.call(this, cv)
  end
end
struct LibWin32::ICastingEventHandler
  def query_interface(this : ICastingEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICastingEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICastingEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_state_changed(this : ICastingEventHandler*, newstate : CASTING_CONNECTION_STATE) : HRESULT
    @lpVtbl.value.on_state_changed.call(this, newstate)
  end
  def on_error(this : ICastingEventHandler*, errorstatus : CASTING_CONNECTION_ERROR_STATUS, errormessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_error.call(this, errorstatus, errormessage)
  end
end
struct LibWin32::ICastingController
  def query_interface(this : ICastingController*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICastingController*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICastingController*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ICastingController*, castingengine : IUnknown, castingsource : IUnknown) : HRESULT
    @lpVtbl.value.initialize.call(this, castingengine, castingsource)
  end
  def connect(this : ICastingController*) : HRESULT
    @lpVtbl.value.connect.call(this)
  end
  def disconnect(this : ICastingController*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def advise(this : ICastingController*, eventhandler : ICastingEventHandler, cookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.call(this, eventhandler, cookie)
  end
  def un_advise(this : ICastingController*, cookie : UInt32) : HRESULT
    @lpVtbl.value.un_advise.call(this, cookie)
  end
end
struct LibWin32::ICastingSourceInfo
  def query_interface(this : ICastingSourceInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICastingSourceInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICastingSourceInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_controller(this : ICastingSourceInfo*, controller : ICastingController*) : HRESULT
    @lpVtbl.value.get_controller.call(this, controller)
  end
  def get_properties(this : ICastingSourceInfo*, props : INamedPropertyStore*) : HRESULT
    @lpVtbl.value.get_properties.call(this, props)
  end
end
struct LibWin32::IDragDropManagerInterop
  def query_interface(this : IDragDropManagerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDragDropManagerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDragDropManagerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IDragDropManagerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IDragDropManagerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IDragDropManagerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IDragDropManagerInterop*, hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, hwnd, riid, ppv)
  end
end
struct LibWin32::IInputPaneInterop
  def query_interface(this : IInputPaneInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInputPaneInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInputPaneInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IInputPaneInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IInputPaneInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IInputPaneInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IInputPaneInterop*, appwindow : LibC::HANDLE, riid : Guid*, inputpane : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, appwindow, riid, inputpane)
  end
end
struct LibWin32::IPlayToManagerInterop
  def query_interface(this : IPlayToManagerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPlayToManagerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPlayToManagerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IPlayToManagerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IPlayToManagerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IPlayToManagerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IPlayToManagerInterop*, appwindow : LibC::HANDLE, riid : Guid*, playtomanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, appwindow, riid, playtomanager)
  end
  def show_play_to_ui_for_window(this : IPlayToManagerInterop*, appwindow : LibC::HANDLE) : HRESULT
    @lpVtbl.value.show_play_to_ui_for_window.call(this, appwindow)
  end
end
struct LibWin32::ICorrelationVectorInformation
  def query_interface(this : ICorrelationVectorInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICorrelationVectorInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICorrelationVectorInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : ICorrelationVectorInformation*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : ICorrelationVectorInformation*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : ICorrelationVectorInformation*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_last_correlation_vector_for_thread(this : ICorrelationVectorInformation*, cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_last_correlation_vector_for_thread.call(this, cv)
  end
  def get_next_correlation_vector_for_thread(this : ICorrelationVectorInformation*, cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_next_correlation_vector_for_thread.call(this, cv)
  end
  def put_next_correlation_vector_for_thread(this : ICorrelationVectorInformation*, cv : HSTRING) : HRESULT
    @lpVtbl.value.put_next_correlation_vector_for_thread.call(this, cv)
  end
end
struct LibWin32::IUIViewSettingsInterop
  def query_interface(this : IUIViewSettingsInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIViewSettingsInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIViewSettingsInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IUIViewSettingsInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IUIViewSettingsInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IUIViewSettingsInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IUIViewSettingsInterop*, hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, hwnd, riid, ppv)
  end
end
struct LibWin32::IUserActivityInterop
  def query_interface(this : IUserActivityInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUserActivityInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUserActivityInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IUserActivityInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IUserActivityInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IUserActivityInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def create_session_for_window(this : IUserActivityInterop*, window : LibC::HANDLE, iid : Guid*, value : Void**) : HRESULT
    @lpVtbl.value.create_session_for_window.call(this, window, iid, value)
  end
end
struct LibWin32::IUserActivitySourceHostInterop
  def query_interface(this : IUserActivitySourceHostInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUserActivitySourceHostInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUserActivitySourceHostInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IUserActivitySourceHostInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IUserActivitySourceHostInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IUserActivitySourceHostInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def set_activity_source_host(this : IUserActivitySourceHostInterop*, activitysourcehost : HSTRING) : HRESULT
    @lpVtbl.value.set_activity_source_host.call(this, activitysourcehost)
  end
end
struct LibWin32::IUserActivityRequestManagerInterop
  def query_interface(this : IUserActivityRequestManagerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUserActivityRequestManagerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUserActivityRequestManagerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IUserActivityRequestManagerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IUserActivityRequestManagerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IUserActivityRequestManagerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : IUserActivityRequestManagerInterop*, window : LibC::HANDLE, iid : Guid*, value : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, window, iid, value)
  end
end
struct LibWin32::IUserConsentVerifierInterop
  def query_interface(this : IUserConsentVerifierInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUserConsentVerifierInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUserConsentVerifierInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IUserConsentVerifierInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IUserConsentVerifierInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IUserConsentVerifierInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def request_verification_for_window_async(this : IUserConsentVerifierInterop*, appwindow : LibC::HANDLE, message : HSTRING, riid : Guid*, asyncoperation : Void**) : HRESULT
    @lpVtbl.value.request_verification_for_window_async.call(this, appwindow, message, riid, asyncoperation)
  end
end
struct LibWin32::IWebAuthenticationCoreManagerInterop
  def query_interface(this : IWebAuthenticationCoreManagerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebAuthenticationCoreManagerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebAuthenticationCoreManagerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IWebAuthenticationCoreManagerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IWebAuthenticationCoreManagerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IWebAuthenticationCoreManagerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def request_token_for_window_async(this : IWebAuthenticationCoreManagerInterop*, appwindow : LibC::HANDLE, request : IInspectable, riid : Guid*, asyncinfo : Void**) : HRESULT
    @lpVtbl.value.request_token_for_window_async.call(this, appwindow, request, riid, asyncinfo)
  end
  def request_token_with_web_account_for_window_async(this : IWebAuthenticationCoreManagerInterop*, appwindow : LibC::HANDLE, request : IInspectable, webaccount : IInspectable, riid : Guid*, asyncinfo : Void**) : HRESULT
    @lpVtbl.value.request_token_with_web_account_for_window_async.call(this, appwindow, request, webaccount, riid, asyncinfo)
  end
end
struct LibWin32::IRestrictedErrorInfo
  def query_interface(this : IRestrictedErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRestrictedErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRestrictedErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_error_details(this : IRestrictedErrorInfo*, description : UInt8**, error : HRESULT*, restricteddescription : UInt8**, capabilitysid : UInt8**) : HRESULT
    @lpVtbl.value.get_error_details.call(this, description, error, restricteddescription, capabilitysid)
  end
  def get_reference(this : IRestrictedErrorInfo*, reference : UInt8**) : HRESULT
    @lpVtbl.value.get_reference.call(this, reference)
  end
end
struct LibWin32::ILanguageExceptionErrorInfo
  def query_interface(this : ILanguageExceptionErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILanguageExceptionErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILanguageExceptionErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_language_exception(this : ILanguageExceptionErrorInfo*, languageexception : IUnknown*) : HRESULT
    @lpVtbl.value.get_language_exception.call(this, languageexception)
  end
end
struct LibWin32::ILanguageExceptionTransform
  def query_interface(this : ILanguageExceptionTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILanguageExceptionTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILanguageExceptionTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_transformed_restricted_error_info(this : ILanguageExceptionTransform*, restrictederrorinfo : IRestrictedErrorInfo*) : HRESULT
    @lpVtbl.value.get_transformed_restricted_error_info.call(this, restrictederrorinfo)
  end
end
struct LibWin32::ILanguageExceptionStackBackTrace
  def query_interface(this : ILanguageExceptionStackBackTrace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILanguageExceptionStackBackTrace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILanguageExceptionStackBackTrace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_stack_back_trace(this : ILanguageExceptionStackBackTrace*, maxframestocapture : UInt32, stackbacktrace : LibC::UINT_PTR*, framescaptured : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_back_trace.call(this, maxframestocapture, stackbacktrace, framescaptured)
  end
end
struct LibWin32::ILanguageExceptionErrorInfo2
  def query_interface(this : ILanguageExceptionErrorInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILanguageExceptionErrorInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILanguageExceptionErrorInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_language_exception(this : ILanguageExceptionErrorInfo2*, languageexception : IUnknown*) : HRESULT
    @lpVtbl.value.get_language_exception.call(this, languageexception)
  end
  def get_previous_language_exception_error_info(this : ILanguageExceptionErrorInfo2*, previouslanguageexceptionerrorinfo : ILanguageExceptionErrorInfo2*) : HRESULT
    @lpVtbl.value.get_previous_language_exception_error_info.call(this, previouslanguageexceptionerrorinfo)
  end
  def capture_propagation_context(this : ILanguageExceptionErrorInfo2*, languageexception : IUnknown) : HRESULT
    @lpVtbl.value.capture_propagation_context.call(this, languageexception)
  end
  def get_propagation_context_head(this : ILanguageExceptionErrorInfo2*, propagatedlanguageexceptionerrorinfohead : ILanguageExceptionErrorInfo2*) : HRESULT
    @lpVtbl.value.get_propagation_context_head.call(this, propagatedlanguageexceptionerrorinfohead)
  end
end
struct LibWin32::IActivationFactory
  def query_interface(this : IActivationFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IActivationFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IActivationFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IActivationFactory*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IActivationFactory*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IActivationFactory*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def activate_instance(this : IActivationFactory*, instance : IInspectable*) : HRESULT
    @lpVtbl.value.activate_instance.call(this, instance)
  end
end
struct LibWin32::IBufferByteAccess
  def query_interface(this : IBufferByteAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBufferByteAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBufferByteAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def buffer(this : IBufferByteAccess*, value : UInt8**) : HRESULT
    @lpVtbl.value.buffer.call(this, value)
  end
end
struct LibWin32::IRoSimpleMetaDataBuilder
  def set_win_rt_interface(this : IRoSimpleMetaDataBuilder*, iid : Guid) : HRESULT
    @lpVtbl.value.set_win_rt_interface.call(this, iid)
  end
  def set_delegate(this : IRoSimpleMetaDataBuilder*, iid : Guid) : HRESULT
    @lpVtbl.value.set_delegate.call(this, iid)
  end
  def set_interface_group_simple_default(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, defaultinterfacename : LibC::LPWSTR, defaultinterfaceiid : Guid*) : HRESULT
    @lpVtbl.value.set_interface_group_simple_default.call(this, name, defaultinterfacename, defaultinterfaceiid)
  end
  def set_interface_group_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, elementcount : UInt32, defaultinterfacenameelements : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_interface_group_parameterized_default.call(this, name, elementcount, defaultinterfacenameelements)
  end
  def set_runtime_class_simple_default(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, defaultinterfacename : LibC::LPWSTR, defaultinterfaceiid : Guid*) : HRESULT
    @lpVtbl.value.set_runtime_class_simple_default.call(this, name, defaultinterfacename, defaultinterfaceiid)
  end
  def set_runtime_class_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, elementcount : UInt32, defaultinterfacenameelements : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_runtime_class_parameterized_default.call(this, name, elementcount, defaultinterfacenameelements)
  end
  def set_struct(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, numfields : UInt32, fieldtypenames : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_struct.call(this, name, numfields, fieldtypenames)
  end
  def set_enum(this : IRoSimpleMetaDataBuilder*, name : LibC::LPWSTR, basetype : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_enum.call(this, name, basetype)
  end
  def set_parameterized_interface(this : IRoSimpleMetaDataBuilder*, piid : Guid, numargs : UInt32) : HRESULT
    @lpVtbl.value.set_parameterized_interface.call(this, piid, numargs)
  end
  def set_parameterized_delegate(this : IRoSimpleMetaDataBuilder*, piid : Guid, numargs : UInt32) : HRESULT
    @lpVtbl.value.set_parameterized_delegate.call(this, piid, numargs)
  end
end
struct LibWin32::IRoMetaDataLocator
  def locate(this : IRoMetaDataLocator*, nameelement : LibC::LPWSTR, metadatadestination : IRoSimpleMetaDataBuilder) : HRESULT
    @lpVtbl.value.locate.call(this, nameelement, metadatadestination)
  end
end
struct LibWin32::IMemoryBufferByteAccess
  def query_interface(this : IMemoryBufferByteAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMemoryBufferByteAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMemoryBufferByteAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IMemoryBufferByteAccess*, value : UInt8**, capacity : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, value, capacity)
  end
end
struct LibWin32::IWeakReference
  def query_interface(this : IWeakReference*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWeakReference*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWeakReference*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def resolve(this : IWeakReference*, riid : Guid*, objectreference : Void**) : HRESULT
    @lpVtbl.value.resolve.call(this, riid, objectreference)
  end
end
struct LibWin32::IWeakReferenceSource
  def query_interface(this : IWeakReferenceSource*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWeakReferenceSource*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWeakReferenceSource*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_weak_reference(this : IWeakReferenceSource*, weakreference : IWeakReference*) : HRESULT
    @lpVtbl.value.get_weak_reference.call(this, weakreference)
  end
end
struct LibWin32::ISystemMediaTransportControlsInterop
  def query_interface(this : ISystemMediaTransportControlsInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISystemMediaTransportControlsInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISystemMediaTransportControlsInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : ISystemMediaTransportControlsInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : ISystemMediaTransportControlsInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : ISystemMediaTransportControlsInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_for_window(this : ISystemMediaTransportControlsInterop*, appwindow : LibC::HANDLE, riid : Guid*, mediatransportcontrol : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, appwindow, riid, mediatransportcontrol)
  end
end
struct LibWin32::IShareWindowCommandEventArgsInterop
  def query_interface(this : IShareWindowCommandEventArgsInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IShareWindowCommandEventArgsInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IShareWindowCommandEventArgsInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_window(this : IShareWindowCommandEventArgsInterop*, value : HANDLE*) : HRESULT
    @lpVtbl.value.get_window.call(this, value)
  end
end
struct LibWin32::IShareWindowCommandSourceInterop
  def query_interface(this : IShareWindowCommandSourceInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IShareWindowCommandSourceInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IShareWindowCommandSourceInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_for_window(this : IShareWindowCommandSourceInterop*, appwindow : LibC::HANDLE, riid : Guid*, sharewindowcommandsource : Void**) : HRESULT
    @lpVtbl.value.get_for_window.call(this, appwindow, riid, sharewindowcommandsource)
  end
end
struct LibWin32::IMessageDispatcher
  def query_interface(this : IMessageDispatcher*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMessageDispatcher*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMessageDispatcher*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IMessageDispatcher*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IMessageDispatcher*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IMessageDispatcher*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def pump_messages(this : IMessageDispatcher*) : HRESULT
    @lpVtbl.value.pump_messages.call(this)
  end
end
