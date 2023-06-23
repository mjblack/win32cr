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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    resolve : UInt64
  end

  IAgileReference_GUID = "c03f6a43-65a4-9818-987e-e0b810d2a6f2"
  IID_IAgileReference = LibC::GUID.new(0xc03f6a43_u32, 0x65a4_u16, 0x9818_u16, StaticArray[0x98_u8, 0x7e_u8, 0xe0_u8, 0xb8_u8, 0x10_u8, 0xd2_u8, 0xa6_u8, 0xf2_u8])
  struct IAgileReference
    lpVtbl : IAgileReferenceVTbl*
  end

  struct IApartmentShutdownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_uninitialize : UInt64
  end

  IApartmentShutdown_GUID = "a2f05a09-27a2-42b5-bc0e-ac163ef49d9b"
  IID_IApartmentShutdown = LibC::GUID.new(0xa2f05a09_u32, 0x27a2_u16, 0x42b5_u16, StaticArray[0xbc_u8, 0xe_u8, 0xac_u8, 0x16_u8, 0x3e_u8, 0xf4_u8, 0x9d_u8, 0x9b_u8])
  struct IApartmentShutdown
    lpVtbl : IApartmentShutdownVTbl*
  end

  struct ISpatialInteractionManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  ISpatialInteractionManagerInterop_GUID = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
  IID_ISpatialInteractionManagerInterop = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
  struct ISpatialInteractionManagerInterop
    lpVtbl : ISpatialInteractionManagerInteropVTbl*
  end

  struct IHolographicSpaceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_for_window : UInt64
  end

  IHolographicSpaceInterop_GUID = "5c4ee536-6a98-4b86-a170-587013d6fd4b"
  IID_IHolographicSpaceInterop = LibC::GUID.new(0x5c4ee536_u32, 0x6a98_u16, 0x4b86_u16, StaticArray[0xa1_u8, 0x70_u8, 0x58_u8, 0x70_u8, 0x13_u8, 0xd6_u8, 0xfd_u8, 0x4b_u8])
  struct IHolographicSpaceInterop
    lpVtbl : IHolographicSpaceInteropVTbl*
  end

  struct IInspectableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
  end

  IInspectable_GUID = "af86e2e0-b12d-4c6a-9c5a-d7aa65101e90"
  IID_IInspectable = LibC::GUID.new(0xaf86e2e0_u32, 0xb12d_u16, 0x4c6a_u16, StaticArray[0x9c_u8, 0x5a_u8, 0xd7_u8, 0xaa_u8, 0x65_u8, 0x10_u8, 0x1e_u8, 0x90_u8])
  struct IInspectable
    lpVtbl : IInspectableVTbl*
  end

  struct IAccountsSettingsPaneInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
    show_manage_accounts_for_window_async : UInt64
    show_add_account_for_window_async : UInt64
  end

  IAccountsSettingsPaneInterop_GUID = "d3ee12ad-3865-4362-9746-b75a682df0e6"
  IID_IAccountsSettingsPaneInterop = LibC::GUID.new(0xd3ee12ad_u32, 0x3865_u16, 0x4362_u16, StaticArray[0x97_u8, 0x46_u8, 0xb7_u8, 0x5a_u8, 0x68_u8, 0x2d_u8, 0xf0_u8, 0xe6_u8])
  struct IAccountsSettingsPaneInterop
    lpVtbl : IAccountsSettingsPaneInteropVTbl*
  end

  struct IAppServiceConnectionExtendedExecutionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open_for_extended_execution_async : UInt64
  end

  IAppServiceConnectionExtendedExecution_GUID = "65219584-f9cb-4ae3-81f9-a28a6ca450d9"
  IID_IAppServiceConnectionExtendedExecution = LibC::GUID.new(0x65219584_u32, 0xf9cb_u16, 0x4ae3_u16, StaticArray[0x81_u8, 0xf9_u8, 0xa2_u8, 0x8a_u8, 0x6c_u8, 0xa4_u8, 0x50_u8, 0xd9_u8])
  struct IAppServiceConnectionExtendedExecution
    lpVtbl : IAppServiceConnectionExtendedExecutionVTbl*
  end

  struct ICorrelationVectorSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_correlation_vector : UInt64
  end

  ICorrelationVectorSource_GUID = "152b8a3b-b9b9-4685-b56e-974847bc7545"
  IID_ICorrelationVectorSource = LibC::GUID.new(0x152b8a3b_u32, 0xb9b9_u16, 0x4685_u16, StaticArray[0xb5_u8, 0x6e_u8, 0x97_u8, 0x48_u8, 0x47_u8, 0xbc_u8, 0x75_u8, 0x45_u8])
  struct ICorrelationVectorSource
    lpVtbl : ICorrelationVectorSourceVTbl*
  end

  struct ICastingEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_state_changed : UInt64
    on_error : UInt64
  end

  ICastingEventHandler_GUID = "c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc"
  IID_ICastingEventHandler = LibC::GUID.new(0xc79a6cb7_u32, 0xbebd_u16, 0x47a6_u16, StaticArray[0xa2_u8, 0xad_u8, 0x4d_u8, 0x45_u8, 0xad_u8, 0x79_u8, 0xc7_u8, 0xbc_u8])
  struct ICastingEventHandler
    lpVtbl : ICastingEventHandlerVTbl*
  end

  struct ICastingControllerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    connect : UInt64
    disconnect : UInt64
    advise : UInt64
    un_advise : UInt64
  end

  ICastingController_GUID = "f0a56423-a664-4fbd-8b43-409a45e8d9a1"
  IID_ICastingController = LibC::GUID.new(0xf0a56423_u32, 0xa664_u16, 0x4fbd_u16, StaticArray[0x8b_u8, 0x43_u8, 0x40_u8, 0x9a_u8, 0x45_u8, 0xe8_u8, 0xd9_u8, 0xa1_u8])
  struct ICastingController
    lpVtbl : ICastingControllerVTbl*
  end

  struct ICastingSourceInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_controller : UInt64
    get_properties : UInt64
  end

  ICastingSourceInfo_GUID = "45101ab7-7c3a-4bce-9500-12c09024b298"
  IID_ICastingSourceInfo = LibC::GUID.new(0x45101ab7_u32, 0x7c3a_u16, 0x4bce_u16, StaticArray[0x95_u8, 0x0_u8, 0x12_u8, 0xc0_u8, 0x90_u8, 0x24_u8, 0xb2_u8, 0x98_u8])
  struct ICastingSourceInfo
    lpVtbl : ICastingSourceInfoVTbl*
  end

  struct IDragDropManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  IDragDropManagerInterop_GUID = "5ad8cba7-4c01-4dac-9074-827894292d63"
  IID_IDragDropManagerInterop = LibC::GUID.new(0x5ad8cba7_u32, 0x4c01_u16, 0x4dac_u16, StaticArray[0x90_u8, 0x74_u8, 0x82_u8, 0x78_u8, 0x94_u8, 0x29_u8, 0x2d_u8, 0x63_u8])
  struct IDragDropManagerInterop
    lpVtbl : IDragDropManagerInteropVTbl*
  end

  struct IInputPaneInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  IInputPaneInterop_GUID = "75cf2c57-9195-4931-8332-f0b409e916af"
  IID_IInputPaneInterop = LibC::GUID.new(0x75cf2c57_u32, 0x9195_u16, 0x4931_u16, StaticArray[0x83_u8, 0x32_u8, 0xf0_u8, 0xb4_u8, 0x9_u8, 0xe9_u8, 0x16_u8, 0xaf_u8])
  struct IInputPaneInterop
    lpVtbl : IInputPaneInteropVTbl*
  end

  struct IPlayToManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
    show_play_to_ui_for_window : UInt64
  end

  IPlayToManagerInterop_GUID = "24394699-1f2c-4eb3-8cd7-0ec1da42a540"
  IID_IPlayToManagerInterop = LibC::GUID.new(0x24394699_u32, 0x1f2c_u16, 0x4eb3_u16, StaticArray[0x8c_u8, 0xd7_u8, 0xe_u8, 0xc1_u8, 0xda_u8, 0x42_u8, 0xa5_u8, 0x40_u8])
  struct IPlayToManagerInterop
    lpVtbl : IPlayToManagerInteropVTbl*
  end

  struct ICorrelationVectorInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_last_correlation_vector_for_thread : UInt64
    get_next_correlation_vector_for_thread : UInt64
    put_next_correlation_vector_for_thread : UInt64
  end

  ICorrelationVectorInformation_GUID = "83c78b3c-d88b-4950-aa6e-22b8d22aabd3"
  IID_ICorrelationVectorInformation = LibC::GUID.new(0x83c78b3c_u32, 0xd88b_u16, 0x4950_u16, StaticArray[0xaa_u8, 0x6e_u8, 0x22_u8, 0xb8_u8, 0xd2_u8, 0x2a_u8, 0xab_u8, 0xd3_u8])
  struct ICorrelationVectorInformation
    lpVtbl : ICorrelationVectorInformationVTbl*
  end

  struct IUIViewSettingsInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  IUIViewSettingsInterop_GUID = "3694dbf9-8f68-44be-8ff5-195c98ede8a6"
  IID_IUIViewSettingsInterop = LibC::GUID.new(0x3694dbf9_u32, 0x8f68_u16, 0x44be_u16, StaticArray[0x8f_u8, 0xf5_u8, 0x19_u8, 0x5c_u8, 0x98_u8, 0xed_u8, 0xe8_u8, 0xa6_u8])
  struct IUIViewSettingsInterop
    lpVtbl : IUIViewSettingsInteropVTbl*
  end

  struct IUserActivityInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_session_for_window : UInt64
  end

  IUserActivityInterop_GUID = "1ade314d-0e0a-40d9-824c-9a088a50059f"
  IID_IUserActivityInterop = LibC::GUID.new(0x1ade314d_u32, 0xe0a_u16, 0x40d9_u16, StaticArray[0x82_u8, 0x4c_u8, 0x9a_u8, 0x8_u8, 0x8a_u8, 0x50_u8, 0x5_u8, 0x9f_u8])
  struct IUserActivityInterop
    lpVtbl : IUserActivityInteropVTbl*
  end

  struct IUserActivitySourceHostInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    set_activity_source_host : UInt64
  end

  IUserActivitySourceHostInterop_GUID = "c15df8bc-8844-487a-b85b-7578e0f61419"
  IID_IUserActivitySourceHostInterop = LibC::GUID.new(0xc15df8bc_u32, 0x8844_u16, 0x487a_u16, StaticArray[0xb8_u8, 0x5b_u8, 0x75_u8, 0x78_u8, 0xe0_u8, 0xf6_u8, 0x14_u8, 0x19_u8])
  struct IUserActivitySourceHostInterop
    lpVtbl : IUserActivitySourceHostInteropVTbl*
  end

  struct IUserActivityRequestManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  IUserActivityRequestManagerInterop_GUID = "dd69f876-9699-4715-9095-e37ea30dfa1b"
  IID_IUserActivityRequestManagerInterop = LibC::GUID.new(0xdd69f876_u32, 0x9699_u16, 0x4715_u16, StaticArray[0x90_u8, 0x95_u8, 0xe3_u8, 0x7e_u8, 0xa3_u8, 0xd_u8, 0xfa_u8, 0x1b_u8])
  struct IUserActivityRequestManagerInterop
    lpVtbl : IUserActivityRequestManagerInteropVTbl*
  end

  struct IUserConsentVerifierInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    request_verification_for_window_async : UInt64
  end

  IUserConsentVerifierInterop_GUID = "39e050c3-4e74-441a-8dc0-b81104df949c"
  IID_IUserConsentVerifierInterop = LibC::GUID.new(0x39e050c3_u32, 0x4e74_u16, 0x441a_u16, StaticArray[0x8d_u8, 0xc0_u8, 0xb8_u8, 0x11_u8, 0x4_u8, 0xdf_u8, 0x94_u8, 0x9c_u8])
  struct IUserConsentVerifierInterop
    lpVtbl : IUserConsentVerifierInteropVTbl*
  end

  struct IWebAuthenticationCoreManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    request_token_for_window_async : UInt64
    request_token_with_web_account_for_window_async : UInt64
  end

  IWebAuthenticationCoreManagerInterop_GUID = "f4b8e804-811e-4436-b69c-44cb67b72084"
  IID_IWebAuthenticationCoreManagerInterop = LibC::GUID.new(0xf4b8e804_u32, 0x811e_u16, 0x4436_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x44_u8, 0xcb_u8, 0x67_u8, 0xb7_u8, 0x20_u8, 0x84_u8])
  struct IWebAuthenticationCoreManagerInterop
    lpVtbl : IWebAuthenticationCoreManagerInteropVTbl*
  end

  struct IRestrictedErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_error_details : UInt64
    get_reference : UInt64
  end

  IRestrictedErrorInfo_GUID = "82ba7092-4c88-427d-a7bc-16dd93feb67e"
  IID_IRestrictedErrorInfo = LibC::GUID.new(0x82ba7092_u32, 0x4c88_u16, 0x427d_u16, StaticArray[0xa7_u8, 0xbc_u8, 0x16_u8, 0xdd_u8, 0x93_u8, 0xfe_u8, 0xb6_u8, 0x7e_u8])
  struct IRestrictedErrorInfo
    lpVtbl : IRestrictedErrorInfoVTbl*
  end

  struct ILanguageExceptionErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_language_exception : UInt64
  end

  ILanguageExceptionErrorInfo_GUID = "04a2dbf3-df83-116c-0946-0812abf6e07d"
  IID_ILanguageExceptionErrorInfo = LibC::GUID.new(0x4a2dbf3_u32, 0xdf83_u16, 0x116c_u16, StaticArray[0x9_u8, 0x46_u8, 0x8_u8, 0x12_u8, 0xab_u8, 0xf6_u8, 0xe0_u8, 0x7d_u8])
  struct ILanguageExceptionErrorInfo
    lpVtbl : ILanguageExceptionErrorInfoVTbl*
  end

  struct ILanguageExceptionTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_transformed_restricted_error_info : UInt64
  end

  ILanguageExceptionTransform_GUID = "feb5a271-a6cd-45ce-880a-696706badc65"
  IID_ILanguageExceptionTransform = LibC::GUID.new(0xfeb5a271_u32, 0xa6cd_u16, 0x45ce_u16, StaticArray[0x88_u8, 0xa_u8, 0x69_u8, 0x67_u8, 0x6_u8, 0xba_u8, 0xdc_u8, 0x65_u8])
  struct ILanguageExceptionTransform
    lpVtbl : ILanguageExceptionTransformVTbl*
  end

  struct ILanguageExceptionStackBackTraceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_stack_back_trace : UInt64
  end

  ILanguageExceptionStackBackTrace_GUID = "cbe53fb5-f967-4258-8d34-42f5e25833de"
  IID_ILanguageExceptionStackBackTrace = LibC::GUID.new(0xcbe53fb5_u32, 0xf967_u16, 0x4258_u16, StaticArray[0x8d_u8, 0x34_u8, 0x42_u8, 0xf5_u8, 0xe2_u8, 0x58_u8, 0x33_u8, 0xde_u8])
  struct ILanguageExceptionStackBackTrace
    lpVtbl : ILanguageExceptionStackBackTraceVTbl*
  end

  struct ILanguageExceptionErrorInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_language_exception : UInt64
    get_previous_language_exception_error_info : UInt64
    capture_propagation_context : UInt64
    get_propagation_context_head : UInt64
  end

  ILanguageExceptionErrorInfo2_GUID = "5746e5c4-5b97-424c-b620-2822915734dd"
  IID_ILanguageExceptionErrorInfo2 = LibC::GUID.new(0x5746e5c4_u32, 0x5b97_u16, 0x424c_u16, StaticArray[0xb6_u8, 0x20_u8, 0x28_u8, 0x22_u8, 0x91_u8, 0x57_u8, 0x34_u8, 0xdd_u8])
  struct ILanguageExceptionErrorInfo2
    lpVtbl : ILanguageExceptionErrorInfo2VTbl*
  end

  struct IActivationFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    activate_instance : UInt64
  end

  IActivationFactory_GUID = "00000035-0000-0000-c000-000000000046"
  IID_IActivationFactory = LibC::GUID.new(0x35_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IActivationFactory
    lpVtbl : IActivationFactoryVTbl*
  end

  struct IBufferByteAccessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    buffer : UInt64
  end

  IBufferByteAccess_GUID = "905a0fef-bc53-11df-8c49-001e4fc686da"
  IID_IBufferByteAccess = LibC::GUID.new(0x905a0fef_u32, 0xbc53_u16, 0x11df_u16, StaticArray[0x8c_u8, 0x49_u8, 0x0_u8, 0x1e_u8, 0x4f_u8, 0xc6_u8, 0x86_u8, 0xda_u8])
  struct IBufferByteAccess
    lpVtbl : IBufferByteAccessVTbl*
  end

  struct IRoSimpleMetaDataBuilderVTbl
    set_win_rt_interface : UInt64
    set_delegate : UInt64
    set_interface_group_simple_default : UInt64
    set_interface_group_parameterized_default : UInt64
    set_runtime_class_simple_default : UInt64
    set_runtime_class_parameterized_default : UInt64
    set_struct : UInt64
    set_enum : UInt64
    set_parameterized_interface : UInt64
    set_parameterized_delegate : UInt64
  end

  struct IRoSimpleMetaDataBuilder
    lpVtbl : IRoSimpleMetaDataBuilderVTbl*
  end

  struct IRoMetaDataLocatorVTbl
    locate : UInt64
  end

  struct IRoMetaDataLocator
    lpVtbl : IRoMetaDataLocatorVTbl*
  end

  struct IMemoryBufferByteAccessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
  end

  IMemoryBufferByteAccess_GUID = "5b0d3235-4dba-4d44-865e-8f1d0e4fd04d"
  IID_IMemoryBufferByteAccess = LibC::GUID.new(0x5b0d3235_u32, 0x4dba_u16, 0x4d44_u16, StaticArray[0x86_u8, 0x5e_u8, 0x8f_u8, 0x1d_u8, 0xe_u8, 0x4f_u8, 0xd0_u8, 0x4d_u8])
  struct IMemoryBufferByteAccess
    lpVtbl : IMemoryBufferByteAccessVTbl*
  end

  struct IWeakReferenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    resolve : UInt64
  end

  IWeakReference_GUID = "00000037-0000-0000-c000-000000000046"
  IID_IWeakReference = LibC::GUID.new(0x37_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWeakReference
    lpVtbl : IWeakReferenceVTbl*
  end

  struct IWeakReferenceSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_weak_reference : UInt64
  end

  IWeakReferenceSource_GUID = "00000038-0000-0000-c000-000000000046"
  IID_IWeakReferenceSource = LibC::GUID.new(0x38_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWeakReferenceSource
    lpVtbl : IWeakReferenceSourceVTbl*
  end

  struct ISystemMediaTransportControlsInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
  end

  ISystemMediaTransportControlsInterop_GUID = "ddb0472d-c911-4a1f-86d9-dc3d71a95f5a"
  IID_ISystemMediaTransportControlsInterop = LibC::GUID.new(0xddb0472d_u32, 0xc911_u16, 0x4a1f_u16, StaticArray[0x86_u8, 0xd9_u8, 0xdc_u8, 0x3d_u8, 0x71_u8, 0xa9_u8, 0x5f_u8, 0x5a_u8])
  struct ISystemMediaTransportControlsInterop
    lpVtbl : ISystemMediaTransportControlsInteropVTbl*
  end

  struct IShareWindowCommandEventArgsInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_window : UInt64
  end

  IShareWindowCommandEventArgsInterop_GUID = "6571a721-643d-43d4-aca4-6b6f5f30f1ad"
  IID_IShareWindowCommandEventArgsInterop = LibC::GUID.new(0x6571a721_u32, 0x643d_u16, 0x43d4_u16, StaticArray[0xac_u8, 0xa4_u8, 0x6b_u8, 0x6f_u8, 0x5f_u8, 0x30_u8, 0xf1_u8, 0xad_u8])
  struct IShareWindowCommandEventArgsInterop
    lpVtbl : IShareWindowCommandEventArgsInteropVTbl*
  end

  struct IShareWindowCommandSourceInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_for_window : UInt64
  end

  IShareWindowCommandSourceInterop_GUID = "461a191f-8424-43a6-a0fa-3451a22f56ab"
  IID_IShareWindowCommandSourceInterop = LibC::GUID.new(0x461a191f_u32, 0x8424_u16, 0x43a6_u16, StaticArray[0xa0_u8, 0xfa_u8, 0x34_u8, 0x51_u8, 0xa2_u8, 0x2f_u8, 0x56_u8, 0xab_u8])
  struct IShareWindowCommandSourceInterop
    lpVtbl : IShareWindowCommandSourceInteropVTbl*
  end

  struct IMessageDispatcherVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    pump_messages : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def resolve(riid : Guid*, ppvobjectreference : Void**) : HRESULT
    @lpVtbl.value.resolve.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobjectreference)
  end
end
struct LibWin32::IApartmentShutdown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_uninitialize(ui64apartmentidentifier : UInt64) : Void
    @lpVtbl.value.on_uninitialize.unsafe_as(Proc(UInt64, Void)).call(ui64apartmentidentifier)
  end
end
struct LibWin32::ISpatialInteractionManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(window : LibC::HANDLE, riid : Guid*, spatialinteractionmanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(window, riid, spatialinteractionmanager)
  end
end
struct LibWin32::IHolographicSpaceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_for_window(window : LibC::HANDLE, riid : Guid*, holographicspace : Void**) : HRESULT
    @lpVtbl.value.create_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(window, riid, holographicspace)
  end
end
struct LibWin32::IInspectable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
end
struct LibWin32::IAccountsSettingsPaneInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, accountssettingspane : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, accountssettingspane)
  end
  def show_manage_accounts_for_window_async(appwindow : LibC::HANDLE, riid : Guid*, asyncaction : Void**) : HRESULT
    @lpVtbl.value.show_manage_accounts_for_window_async.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, asyncaction)
  end
  def show_add_account_for_window_async(appwindow : LibC::HANDLE, riid : Guid*, asyncaction : Void**) : HRESULT
    @lpVtbl.value.show_add_account_for_window_async.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, asyncaction)
  end
end
struct LibWin32::IAppServiceConnectionExtendedExecution
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open_for_extended_execution_async(riid : Guid*, operation : Void**) : HRESULT
    @lpVtbl.value.open_for_extended_execution_async.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, operation)
  end
end
struct LibWin32::ICorrelationVectorSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_correlation_vector(cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_correlation_vector.unsafe_as(Proc(HSTRING*, HRESULT)).call(cv)
  end
end
struct LibWin32::ICastingEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_state_changed(newstate : CASTING_CONNECTION_STATE) : HRESULT
    @lpVtbl.value.on_state_changed.unsafe_as(Proc(CASTING_CONNECTION_STATE, HRESULT)).call(newstate)
  end
  def on_error(errorstatus : CASTING_CONNECTION_ERROR_STATUS, errormessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_error.unsafe_as(Proc(CASTING_CONNECTION_ERROR_STATUS, LibC::LPWSTR, HRESULT)).call(errorstatus, errormessage)
  end
end
struct LibWin32::ICastingController
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(castingengine : IUnknown, castingsource : IUnknown) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, IUnknown, HRESULT)).call(castingengine, castingsource)
  end
  def connect : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(HRESULT)).call
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def advise(eventhandler : ICastingEventHandler, cookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(ICastingEventHandler, UInt32*, HRESULT)).call(eventhandler, cookie)
  end
  def un_advise(cookie : UInt32) : HRESULT
    @lpVtbl.value.un_advise.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
end
struct LibWin32::ICastingSourceInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_controller(controller : ICastingController*) : HRESULT
    @lpVtbl.value.get_controller.unsafe_as(Proc(ICastingController*, HRESULT)).call(controller)
  end
  def get_properties(props : INamedPropertyStore*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(INamedPropertyStore*, HRESULT)).call(props)
  end
end
struct LibWin32::IDragDropManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(hwnd, riid, ppv)
  end
end
struct LibWin32::IInputPaneInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, inputpane : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, inputpane)
  end
end
struct LibWin32::IPlayToManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, playtomanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, playtomanager)
  end
  def show_play_to_ui_for_window(appwindow : LibC::HANDLE) : HRESULT
    @lpVtbl.value.show_play_to_ui_for_window.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(appwindow)
  end
end
struct LibWin32::ICorrelationVectorInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_last_correlation_vector_for_thread(cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_last_correlation_vector_for_thread.unsafe_as(Proc(HSTRING*, HRESULT)).call(cv)
  end
  def get_next_correlation_vector_for_thread(cv : HSTRING*) : HRESULT
    @lpVtbl.value.get_next_correlation_vector_for_thread.unsafe_as(Proc(HSTRING*, HRESULT)).call(cv)
  end
  def put_next_correlation_vector_for_thread(cv : HSTRING) : HRESULT
    @lpVtbl.value.put_next_correlation_vector_for_thread.unsafe_as(Proc(HSTRING, HRESULT)).call(cv)
  end
end
struct LibWin32::IUIViewSettingsInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(hwnd, riid, ppv)
  end
end
struct LibWin32::IUserActivityInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_session_for_window(window : LibC::HANDLE, iid : Guid*, value : Void**) : HRESULT
    @lpVtbl.value.create_session_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(window, iid, value)
  end
end
struct LibWin32::IUserActivitySourceHostInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def set_activity_source_host(activitysourcehost : HSTRING) : HRESULT
    @lpVtbl.value.set_activity_source_host.unsafe_as(Proc(HSTRING, HRESULT)).call(activitysourcehost)
  end
end
struct LibWin32::IUserActivityRequestManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(window : LibC::HANDLE, iid : Guid*, value : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(window, iid, value)
  end
end
struct LibWin32::IUserConsentVerifierInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def request_verification_for_window_async(appwindow : LibC::HANDLE, message : HSTRING, riid : Guid*, asyncoperation : Void**) : HRESULT
    @lpVtbl.value.request_verification_for_window_async.unsafe_as(Proc(LibC::HANDLE, HSTRING, Guid*, Void**, HRESULT)).call(appwindow, message, riid, asyncoperation)
  end
end
struct LibWin32::IWebAuthenticationCoreManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def request_token_for_window_async(appwindow : LibC::HANDLE, request : IInspectable, riid : Guid*, asyncinfo : Void**) : HRESULT
    @lpVtbl.value.request_token_for_window_async.unsafe_as(Proc(LibC::HANDLE, IInspectable, Guid*, Void**, HRESULT)).call(appwindow, request, riid, asyncinfo)
  end
  def request_token_with_web_account_for_window_async(appwindow : LibC::HANDLE, request : IInspectable, webaccount : IInspectable, riid : Guid*, asyncinfo : Void**) : HRESULT
    @lpVtbl.value.request_token_with_web_account_for_window_async.unsafe_as(Proc(LibC::HANDLE, IInspectable, IInspectable, Guid*, Void**, HRESULT)).call(appwindow, request, webaccount, riid, asyncinfo)
  end
end
struct LibWin32::IRestrictedErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_error_details(description : UInt8**, error : HRESULT*, restricteddescription : UInt8**, capabilitysid : UInt8**) : HRESULT
    @lpVtbl.value.get_error_details.unsafe_as(Proc(UInt8**, HRESULT*, UInt8**, UInt8**, HRESULT)).call(description, error, restricteddescription, capabilitysid)
  end
  def get_reference(reference : UInt8**) : HRESULT
    @lpVtbl.value.get_reference.unsafe_as(Proc(UInt8**, HRESULT)).call(reference)
  end
end
struct LibWin32::ILanguageExceptionErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_language_exception(languageexception : IUnknown*) : HRESULT
    @lpVtbl.value.get_language_exception.unsafe_as(Proc(IUnknown*, HRESULT)).call(languageexception)
  end
end
struct LibWin32::ILanguageExceptionTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_transformed_restricted_error_info(restrictederrorinfo : IRestrictedErrorInfo*) : HRESULT
    @lpVtbl.value.get_transformed_restricted_error_info.unsafe_as(Proc(IRestrictedErrorInfo*, HRESULT)).call(restrictederrorinfo)
  end
end
struct LibWin32::ILanguageExceptionStackBackTrace
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_stack_back_trace(maxframestocapture : UInt32, stackbacktrace : LibC::UINT_PTR*, framescaptured : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_back_trace.unsafe_as(Proc(UInt32, LibC::UINT_PTR*, UInt32*, HRESULT)).call(maxframestocapture, stackbacktrace, framescaptured)
  end
end
struct LibWin32::ILanguageExceptionErrorInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_language_exception(languageexception : IUnknown*) : HRESULT
    @lpVtbl.value.get_language_exception.unsafe_as(Proc(IUnknown*, HRESULT)).call(languageexception)
  end
  def get_previous_language_exception_error_info(previouslanguageexceptionerrorinfo : ILanguageExceptionErrorInfo2*) : HRESULT
    @lpVtbl.value.get_previous_language_exception_error_info.unsafe_as(Proc(ILanguageExceptionErrorInfo2*, HRESULT)).call(previouslanguageexceptionerrorinfo)
  end
  def capture_propagation_context(languageexception : IUnknown) : HRESULT
    @lpVtbl.value.capture_propagation_context.unsafe_as(Proc(IUnknown, HRESULT)).call(languageexception)
  end
  def get_propagation_context_head(propagatedlanguageexceptionerrorinfohead : ILanguageExceptionErrorInfo2*) : HRESULT
    @lpVtbl.value.get_propagation_context_head.unsafe_as(Proc(ILanguageExceptionErrorInfo2*, HRESULT)).call(propagatedlanguageexceptionerrorinfohead)
  end
end
struct LibWin32::IActivationFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def activate_instance(instance : IInspectable*) : HRESULT
    @lpVtbl.value.activate_instance.unsafe_as(Proc(IInspectable*, HRESULT)).call(instance)
  end
end
struct LibWin32::IBufferByteAccess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def buffer(value : UInt8**) : HRESULT
    @lpVtbl.value.buffer.unsafe_as(Proc(UInt8**, HRESULT)).call(value)
  end
end
struct LibWin32::IRoSimpleMetaDataBuilder
  def set_win_rt_interface(iid : Guid) : HRESULT
    @lpVtbl.value.set_win_rt_interface.unsafe_as(Proc(Guid, HRESULT)).call(iid)
  end
  def set_delegate(iid : Guid) : HRESULT
    @lpVtbl.value.set_delegate.unsafe_as(Proc(Guid, HRESULT)).call(iid)
  end
  def set_interface_group_simple_default(name : LibC::LPWSTR, defaultinterfacename : LibC::LPWSTR, defaultinterfaceiid : Guid*) : HRESULT
    @lpVtbl.value.set_interface_group_simple_default.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)).call(name, defaultinterfacename, defaultinterfaceiid)
  end
  def set_interface_group_parameterized_default(name : LibC::LPWSTR, elementcount : UInt32, defaultinterfacenameelements : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_interface_group_parameterized_default.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(name, elementcount, defaultinterfacenameelements)
  end
  def set_runtime_class_simple_default(name : LibC::LPWSTR, defaultinterfacename : LibC::LPWSTR, defaultinterfaceiid : Guid*) : HRESULT
    @lpVtbl.value.set_runtime_class_simple_default.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)).call(name, defaultinterfacename, defaultinterfaceiid)
  end
  def set_runtime_class_parameterized_default(name : LibC::LPWSTR, elementcount : UInt32, defaultinterfacenameelements : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_runtime_class_parameterized_default.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(name, elementcount, defaultinterfacenameelements)
  end
  def set_struct(name : LibC::LPWSTR, numfields : UInt32, fieldtypenames : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_struct.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(name, numfields, fieldtypenames)
  end
  def set_enum(name : LibC::LPWSTR, basetype : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_enum.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(name, basetype)
  end
  def set_parameterized_interface(piid : Guid, numargs : UInt32) : HRESULT
    @lpVtbl.value.set_parameterized_interface.unsafe_as(Proc(Guid, UInt32, HRESULT)).call(piid, numargs)
  end
  def set_parameterized_delegate(piid : Guid, numargs : UInt32) : HRESULT
    @lpVtbl.value.set_parameterized_delegate.unsafe_as(Proc(Guid, UInt32, HRESULT)).call(piid, numargs)
  end
end
struct LibWin32::IRoMetaDataLocator
  def locate(nameelement : LibC::LPWSTR, metadatadestination : IRoSimpleMetaDataBuilder) : HRESULT
    @lpVtbl.value.locate.unsafe_as(Proc(LibC::LPWSTR, IRoSimpleMetaDataBuilder, HRESULT)).call(nameelement, metadatadestination)
  end
end
struct LibWin32::IMemoryBufferByteAccess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(value : UInt8**, capacity : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(value, capacity)
  end
end
struct LibWin32::IWeakReference
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def resolve(riid : Guid*, objectreference : Void**) : HRESULT
    @lpVtbl.value.resolve.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, objectreference)
  end
end
struct LibWin32::IWeakReferenceSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_weak_reference(weakreference : IWeakReference*) : HRESULT
    @lpVtbl.value.get_weak_reference.unsafe_as(Proc(IWeakReference*, HRESULT)).call(weakreference)
  end
end
struct LibWin32::ISystemMediaTransportControlsInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, mediatransportcontrol : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, mediatransportcontrol)
  end
end
struct LibWin32::IShareWindowCommandEventArgsInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_window(value : HANDLE*) : HRESULT
    @lpVtbl.value.get_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(value)
  end
end
struct LibWin32::IShareWindowCommandSourceInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, sharewindowcommandsource : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, sharewindowcommandsource)
  end
end
struct LibWin32::IMessageDispatcher
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def pump_messages : HRESULT
    @lpVtbl.value.pump_messages.unsafe_as(Proc(HRESULT)).call
  end
end
