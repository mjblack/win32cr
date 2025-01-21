require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../audio.cr"
require "./../../ui/shell/properties_system.cr"

module Win32cr::Media::Audio::Apo
  alias FNAPONOTIFICATIONCALLBACK = Proc(Win32cr::Media::Audio::Apo::APO_REG_PROPERTIES*, Void*, Win32cr::Foundation::HRESULT)*

  APOERR_ALREADY_INITIALIZED = -2005073919_i32
  APOERR_NOT_INITIALIZED = -2005073918_i32
  APOERR_FORMAT_NOT_SUPPORTED = -2005073917_i32
  APOERR_INVALID_APO_CLSID = -2005073916_i32
  APOERR_BUFFERS_OVERLAP = -2005073915_i32
  APOERR_ALREADY_UNLOCKED = -2005073914_i32
  APOERR_NUM_CONNECTIONS_INVALID = -2005073913_i32
  APOERR_INVALID_OUTPUT_MAXFRAMECOUNT = -2005073912_i32
  APOERR_INVALID_CONNECTION_FORMAT = -2005073911_i32
  APOERR_APO_LOCKED = -2005073910_i32
  APOERR_INVALID_COEFFCOUNT = -2005073909_i32
  APOERR_INVALID_COEFFICIENT = -2005073908_i32
  APOERR_INVALID_CURVE_PARAM = -2005073907_i32
  APOERR_INVALID_INPUTID = -2005073906_i32
  AUDIO_MIN_FRAMERATE = 10
  AUDIO_MAX_FRAMERATE = 384000
  AUDIO_MIN_CHANNELS = 1_u32
  AUDIO_MAX_CHANNELS = 4096_u32
  PKEY_FX_Association = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 0_u32)
  PKEY_FX_PreMixEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 1_u32)
  PKEY_FX_PostMixEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 2_u32)
  PKEY_FX_UserInterfaceClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 3_u32)
  PKEY_FX_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 4_u32)
  PKEY_FX_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 5_u32)
  PKEY_FX_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 6_u32)
  PKEY_FX_EndpointEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 7_u32)
  PKEY_FX_KeywordDetector_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 8_u32)
  PKEY_FX_KeywordDetector_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 9_u32)
  PKEY_FX_KeywordDetector_EndpointEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 10_u32)
  PKEY_FX_Offload_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 11_u32)
  PKEY_FX_Offload_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 12_u32)
  PKEY_CompositeFX_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 13_u32)
  PKEY_CompositeFX_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 14_u32)
  PKEY_CompositeFX_EndpointEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 15_u32)
  PKEY_CompositeFX_KeywordDetector_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 16_u32)
  PKEY_CompositeFX_KeywordDetector_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 17_u32)
  PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 18_u32)
  PKEY_CompositeFX_Offload_StreamEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 19_u32)
  PKEY_CompositeFX_Offload_ModeEffectClsid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 20_u32)
  PKEY_SFX_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 5_u32)
  PKEY_MFX_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 6_u32)
  PKEY_EFX_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 7_u32)
  PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 8_u32)
  PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 9_u32)
  PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 10_u32)
  PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 11_u32)
  PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 12_u32)
  PKEY_APO_SWFallback_ProcessingModes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 13_u32)
  SID_AudioProcessingObjectRTQueue = "458c1a1f-6899-4c12-99ac-e2e6ac253104"
  SID_AudioProcessingObjectLoggingService = "8b8008af-09f9-456e-a173-bdb58499bce7"
  AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES = 2_u32
  AUDIOMEDIATYPE_EQUAL_FORMAT_DATA = 4_u32
  AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA = 8_u32

  enum APO_BUFFER_FLAGS
    BUFFER_INVALID = 0_i32
    BUFFER_VALID = 1_i32
    BUFFER_SILENT = 2_i32
  end
  enum APO_CONNECTION_BUFFER_TYPE
    APO_CONNECTION_BUFFER_TYPE_ALLOCATED = 0_i32
    APO_CONNECTION_BUFFER_TYPE_EXTERNAL = 1_i32
    APO_CONNECTION_BUFFER_TYPE_DEPENDANT = 2_i32
  end
  enum APO_FLAG
    APO_FLAG_NONE = 0_i32
    APO_FLAG_INPLACE = 1_i32
    APO_FLAG_SAMPLESPERFRAME_MUST_MATCH = 2_i32
    APO_FLAG_FRAMESPERSECOND_MUST_MATCH = 4_i32
    APO_FLAG_BITSPERSAMPLE_MUST_MATCH = 8_i32
    APO_FLAG_MIXER = 16_i32
    APO_FLAG_DEFAULT = 14_i32
  end
  enum AUDIO_FLOW_TYPE
    AUDIO_FLOW_PULL = 0_i32
    AUDIO_FLOW_PUSH = 1_i32
  end
  enum EAudioConstriction
    Eaudioconstrictionoff = 0_i32
    Eaudioconstriction48_16 = 1_i32
    Eaudioconstriction44_16 = 2_i32
    Eaudioconstriction14_14 = 3_i32
    Eaudioconstrictionmute = 4_i32
  end
  enum AUDIO_SYSTEMEFFECT_STATE
    AUDIO_SYSTEMEFFECT_STATE_OFF = 0_i32
    AUDIO_SYSTEMEFFECT_STATE_ON = 1_i32
  end
  enum APO_LOG_LEVEL
    APO_LOG_LEVEL_ALWAYS = 0_i32
    APO_LOG_LEVEL_CRITICAL = 1_i32
    APO_LOG_LEVEL_ERROR = 2_i32
    APO_LOG_LEVEL_WARNING = 3_i32
    APO_LOG_LEVEL_INFO = 4_i32
    APO_LOG_LEVEL_VERBOSE = 5_i32
  end
  enum APO_NOTIFICATION_TYPE
    APO_NOTIFICATION_TYPE_NONE = 0_i32
    APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME = 1_i32
    APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE = 2_i32
    APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE = 3_i32
  end

  @[Extern]
  record UNCOMPRESSEDAUDIOFORMAT,
    guidFormatType : LibC::GUID,
    dwSamplesPerFrame : UInt32,
    dwBytesPerSampleContainer : UInt32,
    dwValidBitsPerSample : UInt32,
    fFramesPerSecond : Float32,
    dwChannelMask : UInt32

  @[Extern]
  record APO_CONNECTION_PROPERTY,
    pBuffer : LibC::UIntPtrT,
    u32ValidFrameCount : UInt32,
    u32BufferFlags : Win32cr::Media::Audio::Apo::APO_BUFFER_FLAGS,
    u32Signature : UInt32

  @[Extern]
  record APO_CONNECTION_PROPERTY_V2,
    property : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY,
    u64QPCTime : UInt64

  @[Extern]
  record APO_CONNECTION_DESCRIPTOR,
    type__ : Win32cr::Media::Audio::Apo::APO_CONNECTION_BUFFER_TYPE,
    pBuffer : LibC::UIntPtrT,
    u32MaxFrameCount : UInt32,
    pFormat : Void*,
    u32Signature : UInt32

  @[Extern]
  record APO_REG_PROPERTIES,
    clsid : LibC::GUID,
    flags : Win32cr::Media::Audio::Apo::APO_FLAG,
    szFriendlyName : UInt16[256],
    szCopyrightInfo : UInt16[256],
    u32MajorVersion : UInt32,
    u32MinorVersion : UInt32,
    u32MinInputConnections : UInt32,
    u32MaxInputConnections : UInt32,
    u32MinOutputConnections : UInt32,
    u32MaxOutputConnections : UInt32,
    u32MaxInstances : UInt32,
    u32NumAPOInterfaces : UInt32,
    iidAPOInterfaceList : LibC::GUID*

  @[Extern]
  record APOInitBaseStruct,
    cbSize : UInt32,
    clsid : LibC::GUID

  @[Extern]
  record APOInitSystemEffects,
    apo_init : Win32cr::Media::Audio::Apo::APOInitBaseStruct,
    pAPOEndpointProperties : Void*,
    pAPOSystemEffectsProperties : Void*,
    pReserved : Void*,
    pDeviceCollection : Void*

  @[Extern]
  record APOInitSystemEffects2,
    apo_init : Win32cr::Media::Audio::Apo::APOInitBaseStruct,
    pAPOEndpointProperties : Void*,
    pAPOSystemEffectsProperties : Void*,
    pReserved : Void*,
    pDeviceCollection : Void*,
    nSoftwareIoDeviceInCollection : UInt32,
    nSoftwareIoConnectorIndex : UInt32,
    audio_processing_mode : LibC::GUID,
    initialize_for_discovery_only : Win32cr::Foundation::BOOL

  @[Extern]
  record AudioFXExtensionParams,
    add_page_param : Win32cr::Foundation::LPARAM,
    pwstrEndpointID : Win32cr::Foundation::PWSTR,
    pFxProperties : Void*

  @[Extern]
  record AUDIO_SYSTEMEFFECT,
    id : LibC::GUID,
    canSetState : Win32cr::Foundation::BOOL,
    state : Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECT_STATE

  @[Extern]
  record APOInitSystemEffects3,
    apo_init : Win32cr::Media::Audio::Apo::APOInitBaseStruct,
    pAPOEndpointProperties : Void*,
    pServiceProvider : Void*,
    pDeviceCollection : Void*,
    nSoftwareIoDeviceInCollection : UInt32,
    nSoftwareIoConnectorIndex : UInt32,
    audio_processing_mode : LibC::GUID,
    initialize_for_discovery_only : Win32cr::Foundation::BOOL

  @[Extern]
  record AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION,
    endpoint : Void*,
    volume : Win32cr::Media::Audio::AUDIO_VOLUME_NOTIFICATION_DATA*

  @[Extern]
  record AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION,
    endpoint : Void*,
    propertyStore : Void*,
    propertyKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY

  @[Extern]
  record AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION,
    endpoint : Void*,
    propertyStoreContext : LibC::GUID,
    propertyStoreType : Win32cr::Media::Audio::AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE,
    propertyStore : Void*,
    propertyKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY

  @[Extern]
  record APO_NOTIFICATION,
    type__ : Win32cr::Media::Audio::Apo::APO_NOTIFICATION_TYPE,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      audioEndpointVolumeChange : Win32cr::Media::Audio::Apo::AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION,
      audioEndpointPropertyChange : Win32cr::Media::Audio::Apo::AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION,
      audioSystemEffectsPropertyChange : Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION

  end

  @[Extern]
  record AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR,
    device : Void*

  @[Extern]
  record AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR,
    device : Void*

  @[Extern]
  record AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR,
    device : Void*,
    propertyStoreContext : LibC::GUID

  @[Extern]
  record APO_NOTIFICATION_DESCRIPTOR,
    type__ : Win32cr::Media::Audio::Apo::APO_NOTIFICATION_TYPE,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      audioEndpointVolume : Win32cr::Media::Audio::Apo::AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR,
      audioEndpointPropertyChange : Win32cr::Media::Audio::Apo::AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR,
      audioSystemEffectsPropertyChange : Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR

  end

  @[Extern]
  record IAudioMediaTypeVtbl,
    query_interface : Proc(IAudioMediaType*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioMediaType*, UInt32),
    release : Proc(IAudioMediaType*, UInt32),
    is_compressed_format : Proc(IAudioMediaType*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IAudioMediaType*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_audio_format : Proc(IAudioMediaType*, Win32cr::Media::Audio::WAVEFORMATEX*),
    get_uncompressed_audio_format : Proc(IAudioMediaType*, Win32cr::Media::Audio::Apo::UNCOMPRESSEDAUDIOFORMAT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4e997f73-b71f-4798-873b-ed7dfcf15b4d")]
  record IAudioMediaType, lpVtbl : IAudioMediaTypeVtbl* do
    GUID = LibC::GUID.new(0x4e997f73_u32, 0xb71f_u16, 0x4798_u16, StaticArray[0x87_u8, 0x3b_u8, 0xed_u8, 0x7d_u8, 0xfc_u8, 0xf1_u8, 0x5b_u8, 0x4d_u8])
    def query_interface(this : IAudioMediaType*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioMediaType*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioMediaType*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_compressed_format(this : IAudioMediaType*, pfCompressed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_compressed_format.call(this, pfCompressed)
    end
    def is_equal(this : IAudioMediaType*, pIAudioType : Void*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pIAudioType, pdwFlags)
    end
    def get_audio_format(this : IAudioMediaType*) : Win32cr::Media::Audio::WAVEFORMATEX*
      @lpVtbl.try &.value.get_audio_format.call(this)
    end
    def get_uncompressed_audio_format(this : IAudioMediaType*, pUncompressedAudioFormat : Win32cr::Media::Audio::Apo::UNCOMPRESSEDAUDIOFORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_uncompressed_audio_format.call(this, pUncompressedAudioFormat)
    end

  end

  @[Extern]
  record IAudioProcessingObjectRTVtbl,
    query_interface : Proc(IAudioProcessingObjectRT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectRT*, UInt32),
    release : Proc(IAudioProcessingObjectRT*, UInt32),
    apo_process : Proc(IAudioProcessingObjectRT*, UInt32, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY**, UInt32, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY**, Void),
    calc_input_frames : Proc(IAudioProcessingObjectRT*, UInt32, UInt32),
    calc_output_frames : Proc(IAudioProcessingObjectRT*, UInt32, UInt32)


  @[Extern]
  #@[Com("9e1d6a6d-ddbc-4e95-a4c7-ad64ba37846c")]
  record IAudioProcessingObjectRT, lpVtbl : IAudioProcessingObjectRTVtbl* do
    GUID = LibC::GUID.new(0x9e1d6a6d_u32, 0xddbc_u16, 0x4e95_u16, StaticArray[0xa4_u8, 0xc7_u8, 0xad_u8, 0x64_u8, 0xba_u8, 0x37_u8, 0x84_u8, 0x6c_u8])
    def query_interface(this : IAudioProcessingObjectRT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectRT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectRT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def apo_process(this : IAudioProcessingObjectRT*, u32NumInputConnections : UInt32, ppInputConnections : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY**, u32NumOutputConnections : UInt32, ppOutputConnections : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY**) : Void
      @lpVtbl.try &.value.apo_process.call(this, u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections)
    end
    def calc_input_frames(this : IAudioProcessingObjectRT*, u32OutputFrameCount : UInt32) : UInt32
      @lpVtbl.try &.value.calc_input_frames.call(this, u32OutputFrameCount)
    end
    def calc_output_frames(this : IAudioProcessingObjectRT*, u32InputFrameCount : UInt32) : UInt32
      @lpVtbl.try &.value.calc_output_frames.call(this, u32InputFrameCount)
    end

  end

  @[Extern]
  record IAudioProcessingObjectVBRVtbl,
    query_interface : Proc(IAudioProcessingObjectVBR*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectVBR*, UInt32),
    release : Proc(IAudioProcessingObjectVBR*, UInt32),
    calc_max_input_frames : Proc(IAudioProcessingObjectVBR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    calc_max_output_frames : Proc(IAudioProcessingObjectVBR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7ba1db8f-78ad-49cd-9591-f79d80a17c81")]
  record IAudioProcessingObjectVBR, lpVtbl : IAudioProcessingObjectVBRVtbl* do
    GUID = LibC::GUID.new(0x7ba1db8f_u32, 0x78ad_u16, 0x49cd_u16, StaticArray[0x95_u8, 0x91_u8, 0xf7_u8, 0x9d_u8, 0x80_u8, 0xa1_u8, 0x7c_u8, 0x81_u8])
    def query_interface(this : IAudioProcessingObjectVBR*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectVBR*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectVBR*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def calc_max_input_frames(this : IAudioProcessingObjectVBR*, u32MaxOutputFrameCount : UInt32, pu32InputFrameCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.calc_max_input_frames.call(this, u32MaxOutputFrameCount, pu32InputFrameCount)
    end
    def calc_max_output_frames(this : IAudioProcessingObjectVBR*, u32MaxInputFrameCount : UInt32, pu32OutputFrameCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.calc_max_output_frames.call(this, u32MaxInputFrameCount, pu32OutputFrameCount)
    end

  end

  @[Extern]
  record IAudioProcessingObjectConfigurationVtbl,
    query_interface : Proc(IAudioProcessingObjectConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectConfiguration*, UInt32),
    release : Proc(IAudioProcessingObjectConfiguration*, UInt32),
    lock_for_process : Proc(IAudioProcessingObjectConfiguration*, UInt32, Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR**, UInt32, Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR**, Win32cr::Foundation::HRESULT),
    unlock_for_process : Proc(IAudioProcessingObjectConfiguration*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0e5ed805-aba6-49c3-8f9a-2b8c889c4fa8")]
  record IAudioProcessingObjectConfiguration, lpVtbl : IAudioProcessingObjectConfigurationVtbl* do
    GUID = LibC::GUID.new(0xe5ed805_u32, 0xaba6_u16, 0x49c3_u16, StaticArray[0x8f_u8, 0x9a_u8, 0x2b_u8, 0x8c_u8, 0x88_u8, 0x9c_u8, 0x4f_u8, 0xa8_u8])
    def query_interface(this : IAudioProcessingObjectConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lock_for_process(this : IAudioProcessingObjectConfiguration*, u32NumInputConnections : UInt32, ppInputConnections : Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR**, u32NumOutputConnections : UInt32, ppOutputConnections : Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_for_process.call(this, u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections)
    end
    def unlock_for_process(this : IAudioProcessingObjectConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_for_process.call(this)
    end

  end

  @[Extern]
  record IAudioProcessingObjectVtbl,
    query_interface : Proc(IAudioProcessingObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObject*, UInt32),
    release : Proc(IAudioProcessingObject*, UInt32),
    reset : Proc(IAudioProcessingObject*, Win32cr::Foundation::HRESULT),
    get_latency : Proc(IAudioProcessingObject*, Int64*, Win32cr::Foundation::HRESULT),
    get_registration_properties : Proc(IAudioProcessingObject*, Win32cr::Media::Audio::Apo::APO_REG_PROPERTIES**, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IAudioProcessingObject*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    is_input_format_supported : Proc(IAudioProcessingObject*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    is_output_format_supported : Proc(IAudioProcessingObject*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_input_channel_count : Proc(IAudioProcessingObject*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fd7f2b29-24d0-4b5c-b177-592c39f9ca10")]
  record IAudioProcessingObject, lpVtbl : IAudioProcessingObjectVtbl* do
    GUID = LibC::GUID.new(0xfd7f2b29_u32, 0x24d0_u16, 0x4b5c_u16, StaticArray[0xb1_u8, 0x77_u8, 0x59_u8, 0x2c_u8, 0x39_u8, 0xf9_u8, 0xca_u8, 0x10_u8])
    def query_interface(this : IAudioProcessingObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset(this : IAudioProcessingObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def get_latency(this : IAudioProcessingObject*, pTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency.call(this, pTime)
    end
    def get_registration_properties(this : IAudioProcessingObject*, ppRegProps : Win32cr::Media::Audio::Apo::APO_REG_PROPERTIES**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registration_properties.call(this, ppRegProps)
    end
    def initialize__(this : IAudioProcessingObject*, cbDataSize : UInt32, pbyData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, cbDataSize, pbyData)
    end
    def is_input_format_supported(this : IAudioProcessingObject*, pOppositeFormat : Void*, pRequestedInputFormat : Void*, ppSupportedInputFormat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_input_format_supported.call(this, pOppositeFormat, pRequestedInputFormat, ppSupportedInputFormat)
    end
    def is_output_format_supported(this : IAudioProcessingObject*, pOppositeFormat : Void*, pRequestedOutputFormat : Void*, ppSupportedOutputFormat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_output_format_supported.call(this, pOppositeFormat, pRequestedOutputFormat, ppSupportedOutputFormat)
    end
    def get_input_channel_count(this : IAudioProcessingObject*, pu32ChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_channel_count.call(this, pu32ChannelCount)
    end

  end

  @[Extern]
  record IAudioDeviceModulesClientVtbl,
    query_interface : Proc(IAudioDeviceModulesClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioDeviceModulesClient*, UInt32),
    release : Proc(IAudioDeviceModulesClient*, UInt32),
    set_audio_device_modules_manager : Proc(IAudioDeviceModulesClient*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("98f37dac-d0b6-49f5-896a-aa4d169a4c48")]
  record IAudioDeviceModulesClient, lpVtbl : IAudioDeviceModulesClientVtbl* do
    GUID = LibC::GUID.new(0x98f37dac_u32, 0xd0b6_u16, 0x49f5_u16, StaticArray[0x89_u8, 0x6a_u8, 0xaa_u8, 0x4d_u8, 0x16_u8, 0x9a_u8, 0x4c_u8, 0x48_u8])
    def query_interface(this : IAudioDeviceModulesClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioDeviceModulesClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioDeviceModulesClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_audio_device_modules_manager(this : IAudioDeviceModulesClient*, pAudioDeviceModulesManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_audio_device_modules_manager.call(this, pAudioDeviceModulesManager)
    end

  end

  @[Extern]
  record IAudioSystemEffectsVtbl,
    query_interface : Proc(IAudioSystemEffects*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioSystemEffects*, UInt32),
    release : Proc(IAudioSystemEffects*, UInt32)


  @[Extern]
  #@[Com("5fa00f27-add6-499a-8a9d-6b98521fa75b")]
  record IAudioSystemEffects, lpVtbl : IAudioSystemEffectsVtbl* do
    GUID = LibC::GUID.new(0x5fa00f27_u32, 0xadd6_u16, 0x499a_u16, StaticArray[0x8a_u8, 0x9d_u8, 0x6b_u8, 0x98_u8, 0x52_u8, 0x1f_u8, 0xa7_u8, 0x5b_u8])
    def query_interface(this : IAudioSystemEffects*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioSystemEffects*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioSystemEffects*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IAudioSystemEffects2Vtbl,
    query_interface : Proc(IAudioSystemEffects2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioSystemEffects2*, UInt32),
    release : Proc(IAudioSystemEffects2*, UInt32),
    get_effects_list : Proc(IAudioSystemEffects2*, LibC::GUID**, UInt32*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bafe99d2-7436-44ce-9e0e-4d89afbfff56")]
  record IAudioSystemEffects2, lpVtbl : IAudioSystemEffects2Vtbl* do
    GUID = LibC::GUID.new(0xbafe99d2_u32, 0x7436_u16, 0x44ce_u16, StaticArray[0x9e_u8, 0xe_u8, 0x4d_u8, 0x89_u8, 0xaf_u8, 0xbf_u8, 0xff_u8, 0x56_u8])
    def query_interface(this : IAudioSystemEffects2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioSystemEffects2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioSystemEffects2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_effects_list(this : IAudioSystemEffects2*, ppEffectsIds : LibC::GUID**, pcEffects : UInt32*, event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effects_list.call(this, ppEffectsIds, pcEffects, event)
    end

  end

  @[Extern]
  record IAudioSystemEffectsCustomFormatsVtbl,
    query_interface : Proc(IAudioSystemEffectsCustomFormats*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioSystemEffectsCustomFormats*, UInt32),
    release : Proc(IAudioSystemEffectsCustomFormats*, UInt32),
    get_format_count : Proc(IAudioSystemEffectsCustomFormats*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IAudioSystemEffectsCustomFormats*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_format_representation : Proc(IAudioSystemEffectsCustomFormats*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b1176e34-bb7f-4f05-bebd-1b18a534e097")]
  record IAudioSystemEffectsCustomFormats, lpVtbl : IAudioSystemEffectsCustomFormatsVtbl* do
    GUID = LibC::GUID.new(0xb1176e34_u32, 0xbb7f_u16, 0x4f05_u16, StaticArray[0xbe_u8, 0xbd_u8, 0x1b_u8, 0x18_u8, 0xa5_u8, 0x34_u8, 0xe0_u8, 0x97_u8])
    def query_interface(this : IAudioSystemEffectsCustomFormats*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioSystemEffectsCustomFormats*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioSystemEffectsCustomFormats*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_format_count(this : IAudioSystemEffectsCustomFormats*, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_count.call(this, pcFormats)
    end
    def get_format(this : IAudioSystemEffectsCustomFormats*, nFormat : UInt32, ppFormat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, nFormat, ppFormat)
    end
    def get_format_representation(this : IAudioSystemEffectsCustomFormats*, nFormat : UInt32, ppwstrFormatRep : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_representation.call(this, nFormat, ppwstrFormatRep)
    end

  end

  @[Extern]
  record IApoAuxiliaryInputConfigurationVtbl,
    query_interface : Proc(IApoAuxiliaryInputConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApoAuxiliaryInputConfiguration*, UInt32),
    release : Proc(IApoAuxiliaryInputConfiguration*, UInt32),
    add_auxiliary_input : Proc(IApoAuxiliaryInputConfiguration*, UInt32, UInt32, UInt8*, Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR*, Win32cr::Foundation::HRESULT),
    remove_auxiliary_input : Proc(IApoAuxiliaryInputConfiguration*, UInt32, Win32cr::Foundation::HRESULT),
    is_input_format_supported : Proc(IApoAuxiliaryInputConfiguration*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ceb0aab-fa19-48ed-a857-87771ae1b768")]
  record IApoAuxiliaryInputConfiguration, lpVtbl : IApoAuxiliaryInputConfigurationVtbl* do
    GUID = LibC::GUID.new(0x4ceb0aab_u32, 0xfa19_u16, 0x48ed_u16, StaticArray[0xa8_u8, 0x57_u8, 0x87_u8, 0x77_u8, 0x1a_u8, 0xe1_u8, 0xb7_u8, 0x68_u8])
    def query_interface(this : IApoAuxiliaryInputConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApoAuxiliaryInputConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApoAuxiliaryInputConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_auxiliary_input(this : IApoAuxiliaryInputConfiguration*, dwInputId : UInt32, cbDataSize : UInt32, pbyData : UInt8*, pInputConnection : Win32cr::Media::Audio::Apo::APO_CONNECTION_DESCRIPTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_auxiliary_input.call(this, dwInputId, cbDataSize, pbyData, pInputConnection)
    end
    def remove_auxiliary_input(this : IApoAuxiliaryInputConfiguration*, dwInputId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_auxiliary_input.call(this, dwInputId)
    end
    def is_input_format_supported(this : IApoAuxiliaryInputConfiguration*, pRequestedInputFormat : Void*, ppSupportedInputFormat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_input_format_supported.call(this, pRequestedInputFormat, ppSupportedInputFormat)
    end

  end

  @[Extern]
  record IApoAuxiliaryInputRTVtbl,
    query_interface : Proc(IApoAuxiliaryInputRT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApoAuxiliaryInputRT*, UInt32),
    release : Proc(IApoAuxiliaryInputRT*, UInt32),
    accept_input : Proc(IApoAuxiliaryInputRT*, UInt32, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*, Void)


  @[Extern]
  #@[Com("f851809c-c177-49a0-b1b2-b66f017943ab")]
  record IApoAuxiliaryInputRT, lpVtbl : IApoAuxiliaryInputRTVtbl* do
    GUID = LibC::GUID.new(0xf851809c_u32, 0xc177_u16, 0x49a0_u16, StaticArray[0xb1_u8, 0xb2_u8, 0xb6_u8, 0x6f_u8, 0x1_u8, 0x79_u8, 0x43_u8, 0xab_u8])
    def query_interface(this : IApoAuxiliaryInputRT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApoAuxiliaryInputRT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApoAuxiliaryInputRT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def accept_input(this : IApoAuxiliaryInputRT*, dwInputId : UInt32, pInputConnection : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*) : Void
      @lpVtbl.try &.value.accept_input.call(this, dwInputId, pInputConnection)
    end

  end

  @[Extern]
  record IApoAcousticEchoCancellationVtbl,
    query_interface : Proc(IApoAcousticEchoCancellation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApoAcousticEchoCancellation*, UInt32),
    release : Proc(IApoAcousticEchoCancellation*, UInt32)


  @[Extern]
  #@[Com("25385759-3236-4101-a943-25693dfb5d2d")]
  record IApoAcousticEchoCancellation, lpVtbl : IApoAcousticEchoCancellationVtbl* do
    GUID = LibC::GUID.new(0x25385759_u32, 0x3236_u16, 0x4101_u16, StaticArray[0xa9_u8, 0x43_u8, 0x25_u8, 0x69_u8, 0x3d_u8, 0xfb_u8, 0x5d_u8, 0x2d_u8])
    def query_interface(this : IApoAcousticEchoCancellation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApoAcousticEchoCancellation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApoAcousticEchoCancellation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IAudioSystemEffects3Vtbl,
    query_interface : Proc(IAudioSystemEffects3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioSystemEffects3*, UInt32),
    release : Proc(IAudioSystemEffects3*, UInt32),
    get_effects_list : Proc(IAudioSystemEffects3*, LibC::GUID**, UInt32*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    get_controllable_system_effects_list : Proc(IAudioSystemEffects3*, Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECT**, UInt32*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    set_audio_system_effect_state : Proc(IAudioSystemEffects3*, LibC::GUID, Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECT_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c58b31cd-fc6a-4255-bc1f-ad29bb0a4a17")]
  record IAudioSystemEffects3, lpVtbl : IAudioSystemEffects3Vtbl* do
    GUID = LibC::GUID.new(0xc58b31cd_u32, 0xfc6a_u16, 0x4255_u16, StaticArray[0xbc_u8, 0x1f_u8, 0xad_u8, 0x29_u8, 0xbb_u8, 0xa_u8, 0x4a_u8, 0x17_u8])
    def query_interface(this : IAudioSystemEffects3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioSystemEffects3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioSystemEffects3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_effects_list(this : IAudioSystemEffects3*, ppEffectsIds : LibC::GUID**, pcEffects : UInt32*, event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effects_list.call(this, ppEffectsIds, pcEffects, event)
    end
    def get_controllable_system_effects_list(this : IAudioSystemEffects3*, effects : Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECT**, numEffects : UInt32*, event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_controllable_system_effects_list.call(this, effects, numEffects, event)
    end
    def set_audio_system_effect_state(this : IAudioSystemEffects3*, effectId : LibC::GUID, state : Win32cr::Media::Audio::Apo::AUDIO_SYSTEMEFFECT_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_audio_system_effect_state.call(this, effectId, state)
    end

  end

  @[Extern]
  record IAudioProcessingObjectRTQueueServiceVtbl,
    query_interface : Proc(IAudioProcessingObjectRTQueueService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectRTQueueService*, UInt32),
    release : Proc(IAudioProcessingObjectRTQueueService*, UInt32),
    get_real_time_work_queue : Proc(IAudioProcessingObjectRTQueueService*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("acd65e2f-955b-4b57-b9bf-ac297bb752c9")]
  record IAudioProcessingObjectRTQueueService, lpVtbl : IAudioProcessingObjectRTQueueServiceVtbl* do
    GUID = LibC::GUID.new(0xacd65e2f_u32, 0x955b_u16, 0x4b57_u16, StaticArray[0xb9_u8, 0xbf_u8, 0xac_u8, 0x29_u8, 0x7b_u8, 0xb7_u8, 0x52_u8, 0xc9_u8])
    def query_interface(this : IAudioProcessingObjectRTQueueService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectRTQueueService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectRTQueueService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_real_time_work_queue(this : IAudioProcessingObjectRTQueueService*, workQueueId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_real_time_work_queue.call(this, workQueueId)
    end

  end

  @[Extern]
  record IAudioProcessingObjectLoggingServiceVtbl,
    query_interface : Proc(IAudioProcessingObjectLoggingService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectLoggingService*, UInt32),
    release : Proc(IAudioProcessingObjectLoggingService*, UInt32),
    apo_log : Proc(IAudioProcessingObjectLoggingService*, Win32cr::Media::Audio::Apo::APO_LOG_LEVEL, Win32cr::Foundation::PWSTR, Void)


  @[Extern]
  #@[Com("698f0107-1745-4708-95a5-d84478a62a65")]
  record IAudioProcessingObjectLoggingService, lpVtbl : IAudioProcessingObjectLoggingServiceVtbl* do
    GUID = LibC::GUID.new(0x698f0107_u32, 0x1745_u16, 0x4708_u16, StaticArray[0x95_u8, 0xa5_u8, 0xd8_u8, 0x44_u8, 0x78_u8, 0xa6_u8, 0x2a_u8, 0x65_u8])
    def query_interface(this : IAudioProcessingObjectLoggingService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectLoggingService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectLoggingService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def apo_log(this : IAudioProcessingObjectLoggingService*, level : Win32cr::Media::Audio::Apo::APO_LOG_LEVEL, format : Win32cr::Foundation::PWSTR) : Void
      @lpVtbl.try &.value.apo_log.call(this, level, format)
    end

  end

  @[Extern]
  record IAudioProcessingObjectNotificationsVtbl,
    query_interface : Proc(IAudioProcessingObjectNotifications*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioProcessingObjectNotifications*, UInt32),
    release : Proc(IAudioProcessingObjectNotifications*, UInt32),
    get_apo_notification_registration_info : Proc(IAudioProcessingObjectNotifications*, Win32cr::Media::Audio::Apo::APO_NOTIFICATION_DESCRIPTOR**, UInt32*, Win32cr::Foundation::HRESULT),
    handle_notification : Proc(IAudioProcessingObjectNotifications*, Win32cr::Media::Audio::Apo::APO_NOTIFICATION*, Void)


  @[Extern]
  #@[Com("56b0c76f-02fd-4b21-a52e-9f8219fc86e4")]
  record IAudioProcessingObjectNotifications, lpVtbl : IAudioProcessingObjectNotificationsVtbl* do
    GUID = LibC::GUID.new(0x56b0c76f_u32, 0x2fd_u16, 0x4b21_u16, StaticArray[0xa5_u8, 0x2e_u8, 0x9f_u8, 0x82_u8, 0x19_u8, 0xfc_u8, 0x86_u8, 0xe4_u8])
    def query_interface(this : IAudioProcessingObjectNotifications*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioProcessingObjectNotifications*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioProcessingObjectNotifications*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_apo_notification_registration_info(this : IAudioProcessingObjectNotifications*, apoNotifications : Win32cr::Media::Audio::Apo::APO_NOTIFICATION_DESCRIPTOR**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_apo_notification_registration_info.call(this, apoNotifications, count)
    end
    def handle_notification(this : IAudioProcessingObjectNotifications*, apoNotification : Win32cr::Media::Audio::Apo::APO_NOTIFICATION*) : Void
      @lpVtbl.try &.value.handle_notification.call(this, apoNotification)
    end

  end

end