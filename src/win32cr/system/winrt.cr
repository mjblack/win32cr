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

  IAgileReference_GUID = LibC::GUID.new("c03f6a43-65a4-9818-987e-e0b810d2a6f2")
  CLSID_IAgileReference = "c03f6a43-65a4-9818-987e-e0b810d2a6f2"
  struct IAgileReference
    lpVtbl : IAgileReferenceVTbl*
  end

  struct IApartmentShutdownVTbl
    query_interface : Proc(IApartmentShutdown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApartmentShutdown*, UInt32)
    release : Proc(IApartmentShutdown*, UInt32)
    on_uninitialize : Proc(IApartmentShutdown*, UInt64, Void)
  end

  IApartmentShutdown_GUID = LibC::GUID.new("a2f05a09-27a2-42b5-bc0e-ac163ef49d9b")
  CLSID_IApartmentShutdown = "a2f05a09-27a2-42b5-bc0e-ac163ef49d9b"
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

  ISpatialInteractionManagerInterop_GUID = LibC::GUID.new("5c4ee536-6a98-4b86-a170-587013d6fd4b")
  CLSID_ISpatialInteractionManagerInterop = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
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

  IHolographicSpaceInterop_GUID = LibC::GUID.new("5c4ee536-6a98-4b86-a170-587013d6fd4b")
  CLSID_IHolographicSpaceInterop = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
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

  IInspectable_GUID = LibC::GUID.new("af86e2e0-b12d-4c6a-9c5a-d7aa65101e90")
  CLSID_IInspectable = "af86e2e0-b12d-4c6a-9c5a-d7aa65101e90"
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

  IAccountsSettingsPaneInterop_GUID = LibC::GUID.new("d3ee12ad-3865-4362-9746-b75a682df0e6")
  CLSID_IAccountsSettingsPaneInterop = "d3ee12ad-3865-4362-9746-b75a682df0e6"
  struct IAccountsSettingsPaneInterop
    lpVtbl : IAccountsSettingsPaneInteropVTbl*
  end

  struct IAppServiceConnectionExtendedExecutionVTbl
    query_interface : Proc(IAppServiceConnectionExtendedExecution*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppServiceConnectionExtendedExecution*, UInt32)
    release : Proc(IAppServiceConnectionExtendedExecution*, UInt32)
    open_for_extended_execution_async : Proc(IAppServiceConnectionExtendedExecution*, Guid*, Void**, HRESULT)
  end

  IAppServiceConnectionExtendedExecution_GUID = LibC::GUID.new("65219584-f9cb-4ae3-81f9-a28a6ca450d9")
  CLSID_IAppServiceConnectionExtendedExecution = "65219584-f9cb-4ae3-81f9-a28a6ca450d9"
  struct IAppServiceConnectionExtendedExecution
    lpVtbl : IAppServiceConnectionExtendedExecutionVTbl*
  end

  struct ICorrelationVectorSourceVTbl
    query_interface : Proc(ICorrelationVectorSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICorrelationVectorSource*, UInt32)
    release : Proc(ICorrelationVectorSource*, UInt32)
    get_correlation_vector : Proc(ICorrelationVectorSource*, HSTRING*, HRESULT)
  end

  ICorrelationVectorSource_GUID = LibC::GUID.new("152b8a3b-b9b9-4685-b56e-974847bc7545")
  CLSID_ICorrelationVectorSource = "152b8a3b-b9b9-4685-b56e-974847bc7545"
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

  ICastingEventHandler_GUID = LibC::GUID.new("c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc")
  CLSID_ICastingEventHandler = "c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc"
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

  ICastingController_GUID = LibC::GUID.new("f0a56423-a664-4fbd-8b43-409a45e8d9a1")
  CLSID_ICastingController = "f0a56423-a664-4fbd-8b43-409a45e8d9a1"
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

  ICastingSourceInfo_GUID = LibC::GUID.new("45101ab7-7c3a-4bce-9500-12c09024b298")
  CLSID_ICastingSourceInfo = "45101ab7-7c3a-4bce-9500-12c09024b298"
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

  IDragDropManagerInterop_GUID = LibC::GUID.new("5ad8cba7-4c01-4dac-9074-827894292d63")
  CLSID_IDragDropManagerInterop = "5ad8cba7-4c01-4dac-9074-827894292d63"
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

  IInputPaneInterop_GUID = LibC::GUID.new("75cf2c57-9195-4931-8332-f0b409e916af")
  CLSID_IInputPaneInterop = "75cf2c57-9195-4931-8332-f0b409e916af"
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

  IPlayToManagerInterop_GUID = LibC::GUID.new("24394699-1f2c-4eb3-8cd7-0ec1da42a540")
  CLSID_IPlayToManagerInterop = "24394699-1f2c-4eb3-8cd7-0ec1da42a540"
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

  ICorrelationVectorInformation_GUID = LibC::GUID.new("83c78b3c-d88b-4950-aa6e-22b8d22aabd3")
  CLSID_ICorrelationVectorInformation = "83c78b3c-d88b-4950-aa6e-22b8d22aabd3"
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

  IUIViewSettingsInterop_GUID = LibC::GUID.new("3694dbf9-8f68-44be-8ff5-195c98ede8a6")
  CLSID_IUIViewSettingsInterop = "3694dbf9-8f68-44be-8ff5-195c98ede8a6"
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

  IUserActivityInterop_GUID = LibC::GUID.new("1ade314d-0e0a-40d9-824c-9a088a50059f")
  CLSID_IUserActivityInterop = "1ade314d-0e0a-40d9-824c-9a088a50059f"
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

  IUserActivitySourceHostInterop_GUID = LibC::GUID.new("c15df8bc-8844-487a-b85b-7578e0f61419")
  CLSID_IUserActivitySourceHostInterop = "c15df8bc-8844-487a-b85b-7578e0f61419"
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

  IUserActivityRequestManagerInterop_GUID = LibC::GUID.new("dd69f876-9699-4715-9095-e37ea30dfa1b")
  CLSID_IUserActivityRequestManagerInterop = "dd69f876-9699-4715-9095-e37ea30dfa1b"
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

  IUserConsentVerifierInterop_GUID = LibC::GUID.new("39e050c3-4e74-441a-8dc0-b81104df949c")
  CLSID_IUserConsentVerifierInterop = "39e050c3-4e74-441a-8dc0-b81104df949c"
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

  IWebAuthenticationCoreManagerInterop_GUID = LibC::GUID.new("f4b8e804-811e-4436-b69c-44cb67b72084")
  CLSID_IWebAuthenticationCoreManagerInterop = "f4b8e804-811e-4436-b69c-44cb67b72084"
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

  IRestrictedErrorInfo_GUID = LibC::GUID.new("82ba7092-4c88-427d-a7bc-16dd93feb67e")
  CLSID_IRestrictedErrorInfo = "82ba7092-4c88-427d-a7bc-16dd93feb67e"
  struct IRestrictedErrorInfo
    lpVtbl : IRestrictedErrorInfoVTbl*
  end

  struct ILanguageExceptionErrorInfoVTbl
    query_interface : Proc(ILanguageExceptionErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionErrorInfo*, UInt32)
    release : Proc(ILanguageExceptionErrorInfo*, UInt32)
    get_language_exception : Proc(ILanguageExceptionErrorInfo*, IUnknown*, HRESULT)
  end

  ILanguageExceptionErrorInfo_GUID = LibC::GUID.new("04a2dbf3-df83-116c-0946-0812abf6e07d")
  CLSID_ILanguageExceptionErrorInfo = "04a2dbf3-df83-116c-0946-0812abf6e07d"
  struct ILanguageExceptionErrorInfo
    lpVtbl : ILanguageExceptionErrorInfoVTbl*
  end

  struct ILanguageExceptionTransformVTbl
    query_interface : Proc(ILanguageExceptionTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionTransform*, UInt32)
    release : Proc(ILanguageExceptionTransform*, UInt32)
    get_transformed_restricted_error_info : Proc(ILanguageExceptionTransform*, IRestrictedErrorInfo*, HRESULT)
  end

  ILanguageExceptionTransform_GUID = LibC::GUID.new("feb5a271-a6cd-45ce-880a-696706badc65")
  CLSID_ILanguageExceptionTransform = "feb5a271-a6cd-45ce-880a-696706badc65"
  struct ILanguageExceptionTransform
    lpVtbl : ILanguageExceptionTransformVTbl*
  end

  struct ILanguageExceptionStackBackTraceVTbl
    query_interface : Proc(ILanguageExceptionStackBackTrace*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILanguageExceptionStackBackTrace*, UInt32)
    release : Proc(ILanguageExceptionStackBackTrace*, UInt32)
    get_stack_back_trace : Proc(ILanguageExceptionStackBackTrace*, UInt32, LibC::UINT_PTR*, UInt32*, HRESULT)
  end

  ILanguageExceptionStackBackTrace_GUID = LibC::GUID.new("cbe53fb5-f967-4258-8d34-42f5e25833de")
  CLSID_ILanguageExceptionStackBackTrace = "cbe53fb5-f967-4258-8d34-42f5e25833de"
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

  ILanguageExceptionErrorInfo2_GUID = LibC::GUID.new("5746e5c4-5b97-424c-b620-2822915734dd")
  CLSID_ILanguageExceptionErrorInfo2 = "5746e5c4-5b97-424c-b620-2822915734dd"
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

  IActivationFactory_GUID = LibC::GUID.new("00000035-0000-0000-c000-000000000046")
  CLSID_IActivationFactory = "00000035-0000-0000-c000-000000000046"
  struct IActivationFactory
    lpVtbl : IActivationFactoryVTbl*
  end

  struct IBufferByteAccessVTbl
    query_interface : Proc(IBufferByteAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBufferByteAccess*, UInt32)
    release : Proc(IBufferByteAccess*, UInt32)
    buffer : Proc(IBufferByteAccess*, UInt8**, HRESULT)
  end

  IBufferByteAccess_GUID = LibC::GUID.new("905a0fef-bc53-11df-8c49-001e4fc686da")
  CLSID_IBufferByteAccess = "905a0fef-bc53-11df-8c49-001e4fc686da"
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

  IMemoryBufferByteAccess_GUID = LibC::GUID.new("5b0d3235-4dba-4d44-865e-8f1d0e4fd04d")
  CLSID_IMemoryBufferByteAccess = "5b0d3235-4dba-4d44-865e-8f1d0e4fd04d"
  struct IMemoryBufferByteAccess
    lpVtbl : IMemoryBufferByteAccessVTbl*
  end

  struct IWeakReferenceVTbl
    query_interface : Proc(IWeakReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWeakReference*, UInt32)
    release : Proc(IWeakReference*, UInt32)
    resolve : Proc(IWeakReference*, Guid*, Void**, HRESULT)
  end

  IWeakReference_GUID = LibC::GUID.new("00000037-0000-0000-c000-000000000046")
  CLSID_IWeakReference = "00000037-0000-0000-c000-000000000046"
  struct IWeakReference
    lpVtbl : IWeakReferenceVTbl*
  end

  struct IWeakReferenceSourceVTbl
    query_interface : Proc(IWeakReferenceSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWeakReferenceSource*, UInt32)
    release : Proc(IWeakReferenceSource*, UInt32)
    get_weak_reference : Proc(IWeakReferenceSource*, IWeakReference*, HRESULT)
  end

  IWeakReferenceSource_GUID = LibC::GUID.new("00000038-0000-0000-c000-000000000046")
  CLSID_IWeakReferenceSource = "00000038-0000-0000-c000-000000000046"
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

  ISystemMediaTransportControlsInterop_GUID = LibC::GUID.new("ddb0472d-c911-4a1f-86d9-dc3d71a95f5a")
  CLSID_ISystemMediaTransportControlsInterop = "ddb0472d-c911-4a1f-86d9-dc3d71a95f5a"
  struct ISystemMediaTransportControlsInterop
    lpVtbl : ISystemMediaTransportControlsInteropVTbl*
  end

  struct IShareWindowCommandEventArgsInteropVTbl
    query_interface : Proc(IShareWindowCommandEventArgsInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IShareWindowCommandEventArgsInterop*, UInt32)
    release : Proc(IShareWindowCommandEventArgsInterop*, UInt32)
    get_window : Proc(IShareWindowCommandEventArgsInterop*, HANDLE*, HRESULT)
  end

  IShareWindowCommandEventArgsInterop_GUID = LibC::GUID.new("6571a721-643d-43d4-aca4-6b6f5f30f1ad")
  CLSID_IShareWindowCommandEventArgsInterop = "6571a721-643d-43d4-aca4-6b6f5f30f1ad"
  struct IShareWindowCommandEventArgsInterop
    lpVtbl : IShareWindowCommandEventArgsInteropVTbl*
  end

  struct IShareWindowCommandSourceInteropVTbl
    query_interface : Proc(IShareWindowCommandSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IShareWindowCommandSourceInterop*, UInt32)
    release : Proc(IShareWindowCommandSourceInterop*, UInt32)
    get_for_window : Proc(IShareWindowCommandSourceInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IShareWindowCommandSourceInterop_GUID = LibC::GUID.new("461a191f-8424-43a6-a0fa-3451a22f56ab")
  CLSID_IShareWindowCommandSourceInterop = "461a191f-8424-43a6-a0fa-3451a22f56ab"
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

  IMessageDispatcher_GUID = LibC::GUID.new("f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d")
  CLSID_IMessageDispatcher = "f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d"
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
  fun HSTRING_UserFree(param0 : UInt32*, param1 : HSTRING*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HSTRING* [In]
  fun HSTRING_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HSTRING*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HSTRING* [In]
  fun HSTRING_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HSTRING*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HSTRING* [In]
  fun HSTRING_UserFree64(param0 : UInt32*, param1 : HSTRING*)

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
  fun RoUninitialize

  # Params # activatableclassid : HSTRING [In],instance : IInspectable* [In]
  fun RoActivateInstance(activatableclassid : HSTRING, instance : IInspectable*) : HRESULT

  # Params # activatableclassids : HSTRING* [In],activationfactorycallbacks : LibC::IntPtrT* [In],count : UInt32 [In],cookie : LibC::IntPtrT* [In]
  fun RoRegisterActivationFactories(activatableclassids : HSTRING*, activationfactorycallbacks : LibC::IntPtrT*, count : UInt32, cookie : LibC::IntPtrT*) : HRESULT

  # Params # cookie : LibC::IntPtrT [In]
  fun RoRevokeActivationFactories(cookie : LibC::IntPtrT)

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
  fun RoFailFastWithErrorContext(hrerror : HRESULT)

  # Params # error : HRESULT [In],message : HSTRING [In],languageexception : IUnknown [In]
  fun RoOriginateLanguageException(error : HRESULT, message : HSTRING, languageexception : IUnknown) : LibC::BOOL

  # Params # 
  fun RoClearError

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
  fun RoFreeParameterizedTypeExtra(extra : ROPARAMIIDHANDLE)

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
