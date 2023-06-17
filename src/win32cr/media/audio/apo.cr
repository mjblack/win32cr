require "../../system/com.cr"
require "../../foundation.cr"
require "../../media/audio.cr"
require "../../ui/shell/propertiessystem.cr"

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

  IAudioMediaType_GUID = "4e997f73-b71f-4798-873b-ed7dfcf15b4d"
  IID_IAudioMediaType = LibC::GUID.new(0x4e997f73_u32, 0xb71f_u16, 0x4798_u16, StaticArray[0x87_u8, 0x3b_u8, 0xed_u8, 0x7d_u8, 0xfc_u8, 0xf1_u8, 0x5b_u8, 0x4d_u8])
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

  IAudioProcessingObjectRT_GUID = "9e1d6a6d-ddbc-4e95-a4c7-ad64ba37846c"
  IID_IAudioProcessingObjectRT = LibC::GUID.new(0x9e1d6a6d_u32, 0xddbc_u16, 0x4e95_u16, StaticArray[0xa4_u8, 0xc7_u8, 0xad_u8, 0x64_u8, 0xba_u8, 0x37_u8, 0x84_u8, 0x6c_u8])
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

  IAudioProcessingObjectVBR_GUID = "7ba1db8f-78ad-49cd-9591-f79d80a17c81"
  IID_IAudioProcessingObjectVBR = LibC::GUID.new(0x7ba1db8f_u32, 0x78ad_u16, 0x49cd_u16, StaticArray[0x95_u8, 0x91_u8, 0xf7_u8, 0x9d_u8, 0x80_u8, 0xa1_u8, 0x7c_u8, 0x81_u8])
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

  IAudioProcessingObjectConfiguration_GUID = "0e5ed805-aba6-49c3-8f9a-2b8c889c4fa8"
  IID_IAudioProcessingObjectConfiguration = LibC::GUID.new(0xe5ed805_u32, 0xaba6_u16, 0x49c3_u16, StaticArray[0x8f_u8, 0x9a_u8, 0x2b_u8, 0x8c_u8, 0x88_u8, 0x9c_u8, 0x4f_u8, 0xa8_u8])
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

  IAudioProcessingObject_GUID = "fd7f2b29-24d0-4b5c-b177-592c39f9ca10"
  IID_IAudioProcessingObject = LibC::GUID.new(0xfd7f2b29_u32, 0x24d0_u16, 0x4b5c_u16, StaticArray[0xb1_u8, 0x77_u8, 0x59_u8, 0x2c_u8, 0x39_u8, 0xf9_u8, 0xca_u8, 0x10_u8])
  struct IAudioProcessingObject
    lpVtbl : IAudioProcessingObjectVTbl*
  end

  struct IAudioDeviceModulesClientVTbl
    query_interface : Proc(IAudioDeviceModulesClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioDeviceModulesClient*, UInt32)
    release : Proc(IAudioDeviceModulesClient*, UInt32)
    set_audio_device_modules_manager : Proc(IAudioDeviceModulesClient*, IUnknown, HRESULT)
  end

  IAudioDeviceModulesClient_GUID = "98f37dac-d0b6-49f5-896a-aa4d169a4c48"
  IID_IAudioDeviceModulesClient = LibC::GUID.new(0x98f37dac_u32, 0xd0b6_u16, 0x49f5_u16, StaticArray[0x89_u8, 0x6a_u8, 0xaa_u8, 0x4d_u8, 0x16_u8, 0x9a_u8, 0x4c_u8, 0x48_u8])
  struct IAudioDeviceModulesClient
    lpVtbl : IAudioDeviceModulesClientVTbl*
  end

  struct IAudioSystemEffectsVTbl
    query_interface : Proc(IAudioSystemEffects*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffects*, UInt32)
    release : Proc(IAudioSystemEffects*, UInt32)
  end

  IAudioSystemEffects_GUID = "5fa00f27-add6-499a-8a9d-6b98521fa75b"
  IID_IAudioSystemEffects = LibC::GUID.new(0x5fa00f27_u32, 0xadd6_u16, 0x499a_u16, StaticArray[0x8a_u8, 0x9d_u8, 0x6b_u8, 0x98_u8, 0x52_u8, 0x1f_u8, 0xa7_u8, 0x5b_u8])
  struct IAudioSystemEffects
    lpVtbl : IAudioSystemEffectsVTbl*
  end

  struct IAudioSystemEffects2VTbl
    query_interface : Proc(IAudioSystemEffects2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioSystemEffects2*, UInt32)
    release : Proc(IAudioSystemEffects2*, UInt32)
    get_effects_list : Proc(IAudioSystemEffects2*, Guid**, UInt32*, LibC::HANDLE, HRESULT)
  end

  IAudioSystemEffects2_GUID = "bafe99d2-7436-44ce-9e0e-4d89afbfff56"
  IID_IAudioSystemEffects2 = LibC::GUID.new(0xbafe99d2_u32, 0x7436_u16, 0x44ce_u16, StaticArray[0x9e_u8, 0xe_u8, 0x4d_u8, 0x89_u8, 0xaf_u8, 0xbf_u8, 0xff_u8, 0x56_u8])
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

  IAudioSystemEffectsCustomFormats_GUID = "b1176e34-bb7f-4f05-bebd-1b18a534e097"
  IID_IAudioSystemEffectsCustomFormats = LibC::GUID.new(0xb1176e34_u32, 0xbb7f_u16, 0x4f05_u16, StaticArray[0xbe_u8, 0xbd_u8, 0x1b_u8, 0x18_u8, 0xa5_u8, 0x34_u8, 0xe0_u8, 0x97_u8])
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

  IApoAuxiliaryInputConfiguration_GUID = "4ceb0aab-fa19-48ed-a857-87771ae1b768"
  IID_IApoAuxiliaryInputConfiguration = LibC::GUID.new(0x4ceb0aab_u32, 0xfa19_u16, 0x48ed_u16, StaticArray[0xa8_u8, 0x57_u8, 0x87_u8, 0x77_u8, 0x1a_u8, 0xe1_u8, 0xb7_u8, 0x68_u8])
  struct IApoAuxiliaryInputConfiguration
    lpVtbl : IApoAuxiliaryInputConfigurationVTbl*
  end

  struct IApoAuxiliaryInputRTVTbl
    query_interface : Proc(IApoAuxiliaryInputRT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApoAuxiliaryInputRT*, UInt32)
    release : Proc(IApoAuxiliaryInputRT*, UInt32)
    accept_input : Proc(IApoAuxiliaryInputRT*, UInt32, APO_CONNECTION_PROPERTY*, Void)
  end

  IApoAuxiliaryInputRT_GUID = "f851809c-c177-49a0-b1b2-b66f017943ab"
  IID_IApoAuxiliaryInputRT = LibC::GUID.new(0xf851809c_u32, 0xc177_u16, 0x49a0_u16, StaticArray[0xb1_u8, 0xb2_u8, 0xb6_u8, 0x6f_u8, 0x1_u8, 0x79_u8, 0x43_u8, 0xab_u8])
  struct IApoAuxiliaryInputRT
    lpVtbl : IApoAuxiliaryInputRTVTbl*
  end

  struct IApoAcousticEchoCancellationVTbl
    query_interface : Proc(IApoAcousticEchoCancellation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApoAcousticEchoCancellation*, UInt32)
    release : Proc(IApoAcousticEchoCancellation*, UInt32)
  end

  IApoAcousticEchoCancellation_GUID = "25385759-3236-4101-a943-25693dfb5d2d"
  IID_IApoAcousticEchoCancellation = LibC::GUID.new(0x25385759_u32, 0x3236_u16, 0x4101_u16, StaticArray[0xa9_u8, 0x43_u8, 0x25_u8, 0x69_u8, 0x3d_u8, 0xfb_u8, 0x5d_u8, 0x2d_u8])
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

  IAudioSystemEffects3_GUID = "c58b31cd-fc6a-4255-bc1f-ad29bb0a4a17"
  IID_IAudioSystemEffects3 = LibC::GUID.new(0xc58b31cd_u32, 0xfc6a_u16, 0x4255_u16, StaticArray[0xbc_u8, 0x1f_u8, 0xad_u8, 0x29_u8, 0xbb_u8, 0xa_u8, 0x4a_u8, 0x17_u8])
  struct IAudioSystemEffects3
    lpVtbl : IAudioSystemEffects3VTbl*
  end

  struct IAudioProcessingObjectRTQueueServiceVTbl
    query_interface : Proc(IAudioProcessingObjectRTQueueService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectRTQueueService*, UInt32)
    release : Proc(IAudioProcessingObjectRTQueueService*, UInt32)
    get_real_time_work_queue : Proc(IAudioProcessingObjectRTQueueService*, UInt32*, HRESULT)
  end

  IAudioProcessingObjectRTQueueService_GUID = "acd65e2f-955b-4b57-b9bf-ac297bb752c9"
  IID_IAudioProcessingObjectRTQueueService = LibC::GUID.new(0xacd65e2f_u32, 0x955b_u16, 0x4b57_u16, StaticArray[0xb9_u8, 0xbf_u8, 0xac_u8, 0x29_u8, 0x7b_u8, 0xb7_u8, 0x52_u8, 0xc9_u8])
  struct IAudioProcessingObjectRTQueueService
    lpVtbl : IAudioProcessingObjectRTQueueServiceVTbl*
  end

  struct IAudioProcessingObjectLoggingServiceVTbl
    query_interface : Proc(IAudioProcessingObjectLoggingService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioProcessingObjectLoggingService*, UInt32)
    release : Proc(IAudioProcessingObjectLoggingService*, UInt32)
    apo_log : Proc(IAudioProcessingObjectLoggingService*, APO_LOG_LEVEL, LibC::LPWSTR, Void)
  end

  IAudioProcessingObjectLoggingService_GUID = "698f0107-1745-4708-95a5-d84478a62a65"
  IID_IAudioProcessingObjectLoggingService = LibC::GUID.new(0x698f0107_u32, 0x1745_u16, 0x4708_u16, StaticArray[0x95_u8, 0xa5_u8, 0xd8_u8, 0x44_u8, 0x78_u8, 0xa6_u8, 0x2a_u8, 0x65_u8])
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

  IAudioProcessingObjectNotifications_GUID = "56b0c76f-02fd-4b21-a52e-9f8219fc86e4"
  IID_IAudioProcessingObjectNotifications = LibC::GUID.new(0x56b0c76f_u32, 0x2fd_u16, 0x4b21_u16, StaticArray[0xa5_u8, 0x2e_u8, 0x9f_u8, 0x82_u8, 0x19_u8, 0xfc_u8, 0x86_u8, 0xe4_u8])
  struct IAudioProcessingObjectNotifications
    lpVtbl : IAudioProcessingObjectNotificationsVTbl*
  end

end