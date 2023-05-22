require "../../system/com.cr"
require "../../foundation.cr"
require "../../media/audio.cr"
require "../../ui/shell/propertiessystem.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
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
  AUDIO_MIN_FRAMERATE = "10.0_f64"
  AUDIO_MAX_FRAMERATE = "384000.0_f64"
  AUDIO_MIN_CHANNELS = 1_u32
  AUDIO_MAX_CHANNELS = 4096_u32
  PKEY_FX_Association = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 0_u32)
  PKEY_FX_PreMixEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 1_u32)
  PKEY_FX_PostMixEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 2_u32)
  PKEY_FX_UserInterfaceClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 3_u32)
  PKEY_FX_FriendlyName = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 4_u32)
  PKEY_FX_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 5_u32)
  PKEY_FX_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 6_u32)
  PKEY_FX_EndpointEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 7_u32)
  PKEY_FX_KeywordDetector_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 8_u32)
  PKEY_FX_KeywordDetector_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 9_u32)
  PKEY_FX_KeywordDetector_EndpointEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 10_u32)
  PKEY_FX_Offload_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 11_u32)
  PKEY_FX_Offload_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 12_u32)
  PKEY_CompositeFX_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 13_u32)
  PKEY_CompositeFX_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 14_u32)
  PKEY_CompositeFX_EndpointEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 15_u32)
  PKEY_CompositeFX_KeywordDetector_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 16_u32)
  PKEY_CompositeFX_KeywordDetector_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 17_u32)
  PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 18_u32)
  PKEY_CompositeFX_Offload_StreamEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 19_u32)
  PKEY_CompositeFX_Offload_ModeEffectClsid = PROPERTYKEY.new(LibC::GUID.new(0xd04e05a6_u32, 0x594b_u16, 0x4fb6_u16, StaticArray[0xa8_u8, 0xd_u8, 0x1_u8, 0xaf_u8, 0x5e_u8, 0xed_u8, 0x7d_u8, 0x1d_u8]), 20_u32)
  PKEY_SFX_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 5_u32)
  PKEY_MFX_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 6_u32)
  PKEY_EFX_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 7_u32)
  PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 8_u32)
  PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 9_u32)
  PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 10_u32)
  PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 11_u32)
  PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 12_u32)
  PKEY_APO_SWFallback_ProcessingModes = PROPERTYKEY.new(LibC::GUID.new(0xd3993a3f_u32, 0x99c2_u16, 0x4402_u16, StaticArray[0xb5_u8, 0xec_u8, 0xa9_u8, 0x2a_u8, 0x3_u8, 0x67_u8, 0x66_u8, 0x4b_u8]), 13_u32)
  SID_AudioProcessingObjectRTQueue = "458c1a1f-6899-4c12-99ac-e2e6ac253104"
  SID_AudioProcessingObjectLoggingService = "8b8008af-09f9-456e-a173-bdb58499bce7"
  AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES = 2_u32
  AUDIOMEDIATYPE_EQUAL_FORMAT_DATA = 4_u32
  AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA = 8_u32

  alias FNAPONOTIFICATIONCALLBACK = Proc(APO_REG_PROPERTIES*, Void*, HRESULT)


  enum APO_BUFFER_FLAGS : Int32
    BUFFER_INVALID = 0
    BUFFER_VALID = 1
    BUFFER_SILENT = 2
  end

  enum APO_CONNECTION_BUFFER_TYPE : Int32
    APO_CONNECTION_BUFFER_TYPE_ALLOCATED = 0
    APO_CONNECTION_BUFFER_TYPE_EXTERNAL = 1
    APO_CONNECTION_BUFFER_TYPE_DEPENDANT = 2
  end

  enum APO_FLAG : Int32
    APO_FLAG_NONE = 0
    APO_FLAG_INPLACE = 1
    APO_FLAG_SAMPLESPERFRAME_MUST_MATCH = 2
    APO_FLAG_FRAMESPERSECOND_MUST_MATCH = 4
    APO_FLAG_BITSPERSAMPLE_MUST_MATCH = 8
    APO_FLAG_MIXER = 16
    APO_FLAG_DEFAULT = 14
  end

  enum AUDIO_FLOW_TYPE : Int32
    AUDIO_FLOW_PULL = 0
    AUDIO_FLOW_PUSH = 1
  end

  enum EAudioConstriction : Int32
    Eaudioconstrictionoff = 0
    Eaudioconstriction48_16 = 1
    Eaudioconstriction44_16 = 2
    Eaudioconstriction14_14 = 3
    Eaudioconstrictionmute = 4
  end

  enum AUDIO_SYSTEMEFFECT_STATE : Int32
    AUDIO_SYSTEMEFFECT_STATE_OFF = 0
    AUDIO_SYSTEMEFFECT_STATE_ON = 1
  end

  enum APO_LOG_LEVEL : Int32
    APO_LOG_LEVEL_ALWAYS = 0
    APO_LOG_LEVEL_CRITICAL = 1
    APO_LOG_LEVEL_ERROR = 2
    APO_LOG_LEVEL_WARNING = 3
    APO_LOG_LEVEL_INFO = 4
    APO_LOG_LEVEL_VERBOSE = 5
  end

  enum APO_NOTIFICATION_TYPE : Int32
    APO_NOTIFICATION_TYPE_NONE = 0
    APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME = 1
    APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE = 2
    APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE = 3
  end

union APO_NOTIFICATION_Anonymous_e__Union
  audio_endpoint_volume_change : AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION
  audio_endpoint_property_change : AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION
  audio_system_effects_property_change : AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION
end
union APO_NOTIFICATION_DESCRIPTOR_Anonymous_e__Union
  audio_endpoint_volume : AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR
  audio_endpoint_property_change : AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
  audio_system_effects_property_change : AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
end

  struct UNCOMPRESSEDAUDIOFORMAT
    guid_format_type : Guid
    dw_samples_per_frame : UInt32
    dw_bytes_per_sample_container : UInt32
    dw_valid_bits_per_sample : UInt32
    f_frames_per_second : Float32
    dw_channel_mask : UInt32
  end
  struct APO_CONNECTION_PROPERTY
    p_buffer : LibC::UINT_PTR
    u32_valid_frame_count : UInt32
    u32_buffer_flags : APO_BUFFER_FLAGS
    u32_signature : UInt32
  end
  struct APO_CONNECTION_PROPERTY_V2
    property : APO_CONNECTION_PROPERTY
    u64_qpc_time : UInt64
  end
  struct APO_CONNECTION_DESCRIPTOR
    type : APO_CONNECTION_BUFFER_TYPE
    p_buffer : LibC::UINT_PTR
    u32_max_frame_count : UInt32
    p_format : IAudioMediaType
    u32_signature : UInt32
  end
  struct APO_REG_PROPERTIES
    clsid : Guid
    flags : APO_FLAG
    sz_friendly_name : Char[256]*
    sz_copyright_info : Char[256]*
    u32_major_version : UInt32
    u32_minor_version : UInt32
    u32_min_input_connections : UInt32
    u32_max_input_connections : UInt32
    u32_min_output_connections : UInt32
    u32_max_output_connections : UInt32
    u32_max_instances : UInt32
    u32_num_apo_interfaces : UInt32
    iid_apo_interface_list : Guid[0]*
  end
  struct APOInitBaseStruct
    cb_size : UInt32
    clsid : Guid
  end
  struct APOInitSystemEffects
    apo_init : APOInitBaseStruct
    p_apo_endpoint_properties : IPropertyStore
    p_apo_system_effects_properties : IPropertyStore
    p_reserved : Void*
    p_device_collection : IMMDeviceCollection
  end
  struct APOInitSystemEffects2
    apo_init : APOInitBaseStruct
    p_apo_endpoint_properties : IPropertyStore
    p_apo_system_effects_properties : IPropertyStore
    p_reserved : Void*
    p_device_collection : IMMDeviceCollection
    n_software_io_device_in_collection : UInt32
    n_software_io_connector_index : UInt32
    audio_processing_mode : Guid
    initialize_for_discovery_only : LibC::BOOL
  end
  struct AudioFXExtensionParams
    add_page_param : LPARAM
    pwstr_endpoint_id : LibC::LPWSTR
    p_fx_properties : IPropertyStore
  end
  struct AUDIO_SYSTEMEFFECT
    id : Guid
    can_set_state : LibC::BOOL
    state : AUDIO_SYSTEMEFFECT_STATE
  end
  struct APOInitSystemEffects3
    apo_init : APOInitBaseStruct
    p_apo_endpoint_properties : IPropertyStore
    p_service_provider : IServiceProvider
    p_device_collection : IMMDeviceCollection
    n_software_io_device_in_collection : UInt32
    n_software_io_connector_index : UInt32
    audio_processing_mode : Guid
    initialize_for_discovery_only : LibC::BOOL
  end
  struct AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION
    endpoint : IMMDevice
    volume : AUDIO_VOLUME_NOTIFICATION_DATA*
  end
  struct AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION
    endpoint : IMMDevice
    property_store : IPropertyStore
    property_key : PROPERTYKEY
  end
  struct AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION
    endpoint : IMMDevice
    property_store_context : Guid
    property_store_type : MIDL___MIDL_itf_mmdeviceapi_0000_0008_0002
    property_store : IPropertyStore
    property_key : PROPERTYKEY
  end
  struct APO_NOTIFICATION
    type : APO_NOTIFICATION_TYPE
    anonymous : APO_NOTIFICATION_Anonymous_e__Union
  end
  struct AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR
    device : IMMDevice
  end
  struct AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
    device : IMMDevice
  end
  struct AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
    device : IMMDevice
    property_store_context : Guid
  end
  struct APO_NOTIFICATION_DESCRIPTOR
    type : APO_NOTIFICATION_TYPE
    anonymous : APO_NOTIFICATION_DESCRIPTOR_Anonymous_e__Union
  end


  struct IAudioMediaTypeVTbl
    query_interface : Proc(IAudioMediaType*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioMediaType*, UInt32)
    release : Proc(IAudioMediaType*, UInt32)
    is_compressed_format : Proc(IAudioMediaType*, LibC::BOOL*, HRESULT)
    is_equal : Proc(IAudioMediaType*, IAudioMediaType, UInt32*, HRESULT)
    get_audio_format : Proc(IAudioMediaType*, WAVEFORMATEX**)
    get_uncompressed_audio_format : Proc(IAudioMediaType*, UNCOMPRESSEDAUDIOFORMAT*, HRESULT)
  end

  struct IAudioMediaType
    lpVtbl : IAudioMediaTypeVTbl*
  end

  struct IAudioProcessingObjectRTVTbl
    query_interface : Proc(IAudioProcessingObjectRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectRT*, UInt32)
    release : Proc(IAudioProcessingObjectRT*, UInt32)
    apo_process : Proc(IAudioProcessingObjectRT*, UInt32, APO_CONNECTION_PROPERTY**, UInt32, APO_CONNECTION_PROPERTY**, Void)
    calc_input_frames : Proc(IAudioProcessingObjectRT*, UInt32, UInt32)
    calc_output_frames : Proc(IAudioProcessingObjectRT*, UInt32, UInt32)
  end

  struct IAudioProcessingObjectRT
    lpVtbl : IAudioProcessingObjectRTVTbl*
  end

  struct IAudioProcessingObjectVBRVTbl
    query_interface : Proc(IAudioProcessingObjectVBR*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectVBR*, UInt32)
    release : Proc(IAudioProcessingObjectVBR*, UInt32)
    calc_max_input_frames : Proc(IAudioProcessingObjectVBR*, UInt32, UInt32*, HRESULT)
    calc_max_output_frames : Proc(IAudioProcessingObjectVBR*, UInt32, UInt32*, HRESULT)
  end

  struct IAudioProcessingObjectVBR
    lpVtbl : IAudioProcessingObjectVBRVTbl*
  end

  struct IAudioProcessingObjectConfigurationVTbl
    query_interface : Proc(IAudioProcessingObjectConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectConfiguration*, UInt32)
    release : Proc(IAudioProcessingObjectConfiguration*, UInt32)
    lock_for_process : Proc(IAudioProcessingObjectConfiguration*, UInt32, APO_CONNECTION_DESCRIPTOR**, UInt32, APO_CONNECTION_DESCRIPTOR**, HRESULT)
    unlock_for_process : Proc(IAudioProcessingObjectConfiguration*, HRESULT)
  end

  struct IAudioProcessingObjectConfiguration
    lpVtbl : IAudioProcessingObjectConfigurationVTbl*
  end

  struct IAudioProcessingObjectVTbl
    query_interface : Proc(IAudioProcessingObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObject*, UInt32)
    release : Proc(IAudioProcessingObject*, UInt32)
    reset : Proc(IAudioProcessingObject*, HRESULT)
    get_latency : Proc(IAudioProcessingObject*, Int64*, HRESULT)
    get_registration_properties : Proc(IAudioProcessingObject*, APO_REG_PROPERTIES**, HRESULT)
    initialize : Proc(IAudioProcessingObject*, UInt32, UInt8*, HRESULT)
    is_input_format_supported : Proc(IAudioProcessingObject*, IAudioMediaType, IAudioMediaType, IAudioMediaType*, HRESULT)
    is_output_format_supported : Proc(IAudioProcessingObject*, IAudioMediaType, IAudioMediaType, IAudioMediaType*, HRESULT)
    get_input_channel_count : Proc(IAudioProcessingObject*, UInt32*, HRESULT)
  end

  struct IAudioProcessingObject
    lpVtbl : IAudioProcessingObjectVTbl*
  end

  struct IAudioDeviceModulesClientVTbl
    query_interface : Proc(IAudioDeviceModulesClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioDeviceModulesClient*, UInt32)
    release : Proc(IAudioDeviceModulesClient*, UInt32)
    set_audio_device_modules_manager : Proc(IAudioDeviceModulesClient*, IUnknown, HRESULT)
  end

  struct IAudioDeviceModulesClient
    lpVtbl : IAudioDeviceModulesClientVTbl*
  end

  struct IAudioSystemEffectsVTbl
    query_interface : Proc(IAudioSystemEffects*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffects*, UInt32)
    release : Proc(IAudioSystemEffects*, UInt32)
  end

  struct IAudioSystemEffects
    lpVtbl : IAudioSystemEffectsVTbl*
  end

  struct IAudioSystemEffects2VTbl
    query_interface : Proc(IAudioSystemEffects2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffects2*, UInt32)
    release : Proc(IAudioSystemEffects2*, UInt32)
    get_effects_list : Proc(IAudioSystemEffects2*, Guid**, UInt32*, LibC::HANDLE, HRESULT)
  end

  struct IAudioSystemEffects2
    lpVtbl : IAudioSystemEffects2VTbl*
  end

  struct IAudioSystemEffectsCustomFormatsVTbl
    query_interface : Proc(IAudioSystemEffectsCustomFormats*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffectsCustomFormats*, UInt32)
    release : Proc(IAudioSystemEffectsCustomFormats*, UInt32)
    get_format_count : Proc(IAudioSystemEffectsCustomFormats*, UInt32*, HRESULT)
    get_format : Proc(IAudioSystemEffectsCustomFormats*, UInt32, IAudioMediaType*, HRESULT)
    get_format_representation : Proc(IAudioSystemEffectsCustomFormats*, UInt32, LibC::LPWSTR*, HRESULT)
  end

  struct IAudioSystemEffectsCustomFormats
    lpVtbl : IAudioSystemEffectsCustomFormatsVTbl*
  end

  struct IApoAuxiliaryInputConfigurationVTbl
    query_interface : Proc(IApoAuxiliaryInputConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApoAuxiliaryInputConfiguration*, UInt32)
    release : Proc(IApoAuxiliaryInputConfiguration*, UInt32)
    add_auxiliary_input : Proc(IApoAuxiliaryInputConfiguration*, UInt32, UInt32, UInt8*, APO_CONNECTION_DESCRIPTOR*, HRESULT)
    remove_auxiliary_input : Proc(IApoAuxiliaryInputConfiguration*, UInt32, HRESULT)
    is_input_format_supported : Proc(IApoAuxiliaryInputConfiguration*, IAudioMediaType, IAudioMediaType*, HRESULT)
  end

  struct IApoAuxiliaryInputConfiguration
    lpVtbl : IApoAuxiliaryInputConfigurationVTbl*
  end

  struct IApoAuxiliaryInputRTVTbl
    query_interface : Proc(IApoAuxiliaryInputRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApoAuxiliaryInputRT*, UInt32)
    release : Proc(IApoAuxiliaryInputRT*, UInt32)
    accept_input : Proc(IApoAuxiliaryInputRT*, UInt32, APO_CONNECTION_PROPERTY*, Void)
  end

  struct IApoAuxiliaryInputRT
    lpVtbl : IApoAuxiliaryInputRTVTbl*
  end

  struct IApoAcousticEchoCancellationVTbl
    query_interface : Proc(IApoAcousticEchoCancellation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApoAcousticEchoCancellation*, UInt32)
    release : Proc(IApoAcousticEchoCancellation*, UInt32)
  end

  struct IApoAcousticEchoCancellation
    lpVtbl : IApoAcousticEchoCancellationVTbl*
  end

  struct IAudioSystemEffects3VTbl
    query_interface : Proc(IAudioSystemEffects3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffects3*, UInt32)
    release : Proc(IAudioSystemEffects3*, UInt32)
    get_effects_list : Proc(IAudioSystemEffects3*, Guid**, UInt32*, LibC::HANDLE, HRESULT)
    get_controllable_system_effects_list : Proc(IAudioSystemEffects3*, AUDIO_SYSTEMEFFECT**, UInt32*, LibC::HANDLE, HRESULT)
    set_audio_system_effect_state : Proc(IAudioSystemEffects3*, Guid, AUDIO_SYSTEMEFFECT_STATE, HRESULT)
  end

  struct IAudioSystemEffects3
    lpVtbl : IAudioSystemEffects3VTbl*
  end

  struct IAudioProcessingObjectRTQueueServiceVTbl
    query_interface : Proc(IAudioProcessingObjectRTQueueService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectRTQueueService*, UInt32)
    release : Proc(IAudioProcessingObjectRTQueueService*, UInt32)
    get_real_time_work_queue : Proc(IAudioProcessingObjectRTQueueService*, UInt32*, HRESULT)
  end

  struct IAudioProcessingObjectRTQueueService
    lpVtbl : IAudioProcessingObjectRTQueueServiceVTbl*
  end

  struct IAudioProcessingObjectLoggingServiceVTbl
    query_interface : Proc(IAudioProcessingObjectLoggingService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectLoggingService*, UInt32)
    release : Proc(IAudioProcessingObjectLoggingService*, UInt32)
    apo_log : Proc(IAudioProcessingObjectLoggingService*, APO_LOG_LEVEL, LibC::LPWSTR, Void)
  end

  struct IAudioProcessingObjectLoggingService
    lpVtbl : IAudioProcessingObjectLoggingServiceVTbl*
  end

  struct IAudioProcessingObjectNotificationsVTbl
    query_interface : Proc(IAudioProcessingObjectNotifications*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectNotifications*, UInt32)
    release : Proc(IAudioProcessingObjectNotifications*, UInt32)
    get_apo_notification_registration_info : Proc(IAudioProcessingObjectNotifications*, APO_NOTIFICATION_DESCRIPTOR**, UInt32*, HRESULT)
    handle_notification : Proc(IAudioProcessingObjectNotifications*, APO_NOTIFICATION*, Void)
  end

  struct IAudioProcessingObjectNotifications
    lpVtbl : IAudioProcessingObjectNotificationsVTbl*
  end

end
