require "../../system/com.cr"
require "../../foundation.cr"
require "../../media/audio.cr"
require "../../media/kernelstreaming.cr"
require "../../media/audio/apo.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  DEVPKEY_AudioEndpointPlugin_FactoryCLSID = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 1_u32)
  DEVPKEY_AudioEndpointPlugin_DataFlow = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 2_u32)
  DEVPKEY_AudioEndpointPlugin_PnPInterface = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 3_u32)
  DEVPKEY_AudioEndpointPlugin2_FactoryCLSID = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 4_u32)
  DEVINTERFACE_AUDIOENDPOINTPLUGIN = LibC::GUID.new(0x9f2f7b66_u32, 0x65ac_u16, 0x4fa6_u16, StaticArray[0x8a_u8, 0xe4_u8, 0x12_u8, 0x3c_u8, 0x78_u8, 0xb8_u8, 0x93_u8, 0x13_u8])


  enum EndpointConnectorType : Int32
    Ehostprocessconnector = 0
    Eoffloadconnector = 1
    Eloopbackconnector = 2
    Ekeyworddetectorconnector = 3
    Econnectorcount = 4
  end

  struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS
    u32_size : UInt32
    u32_ts_session_id : UInt32
    target_endpoint_connector_type : EndpointConnectorType
    wfx_device_format : WAVEFORMATEX
  end


  struct IAudioEndpointFormatControlVTbl
    query_interface : Proc(IAudioEndpointFormatControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointFormatControl*, UInt32)
    release : Proc(IAudioEndpointFormatControl*, UInt32)
    reset_to_default : Proc(IAudioEndpointFormatControl*, UInt32, HRESULT)
  end

  struct IAudioEndpointFormatControl
    lpVtbl : IAudioEndpointFormatControlVTbl*
  end

  struct IAudioEndpointOffloadStreamVolumeVTbl
    query_interface : Proc(IAudioEndpointOffloadStreamVolume*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointOffloadStreamVolume*, UInt32)
    release : Proc(IAudioEndpointOffloadStreamVolume*, UInt32)
    get_volume_channel_count : Proc(IAudioEndpointOffloadStreamVolume*, UInt32*, HRESULT)
    set_channel_volumes : Proc(IAudioEndpointOffloadStreamVolume*, UInt32, Float32*, AUDIO_CURVE_TYPE, Int64*, HRESULT)
    get_channel_volumes : Proc(IAudioEndpointOffloadStreamVolume*, UInt32, Float32*, HRESULT)
  end

  struct IAudioEndpointOffloadStreamVolume
    lpVtbl : IAudioEndpointOffloadStreamVolumeVTbl*
  end

  struct IAudioEndpointOffloadStreamMuteVTbl
    query_interface : Proc(IAudioEndpointOffloadStreamMute*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointOffloadStreamMute*, UInt32)
    release : Proc(IAudioEndpointOffloadStreamMute*, UInt32)
    set_mute : Proc(IAudioEndpointOffloadStreamMute*, UInt8, HRESULT)
    get_mute : Proc(IAudioEndpointOffloadStreamMute*, UInt8*, HRESULT)
  end

  struct IAudioEndpointOffloadStreamMute
    lpVtbl : IAudioEndpointOffloadStreamMuteVTbl*
  end

  struct IAudioEndpointOffloadStreamMeterVTbl
    query_interface : Proc(IAudioEndpointOffloadStreamMeter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointOffloadStreamMeter*, UInt32)
    release : Proc(IAudioEndpointOffloadStreamMeter*, UInt32)
    get_meter_channel_count : Proc(IAudioEndpointOffloadStreamMeter*, UInt32*, HRESULT)
    get_metering_data : Proc(IAudioEndpointOffloadStreamMeter*, UInt32, Float32*, HRESULT)
  end

  struct IAudioEndpointOffloadStreamMeter
    lpVtbl : IAudioEndpointOffloadStreamMeterVTbl*
  end

  struct IAudioEndpointLastBufferControlVTbl
    query_interface : Proc(IAudioEndpointLastBufferControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointLastBufferControl*, UInt32)
    release : Proc(IAudioEndpointLastBufferControl*, UInt32)
    is_last_buffer_control_supported : Proc(IAudioEndpointLastBufferControl*, LibC::BOOL)
    release_output_data_pointer_for_last_buffer : Proc(IAudioEndpointLastBufferControl*, APO_CONNECTION_PROPERTY*, Void)
  end

  struct IAudioEndpointLastBufferControl
    lpVtbl : IAudioEndpointLastBufferControlVTbl*
  end

  struct IAudioLfxControlVTbl
    query_interface : Proc(IAudioLfxControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioLfxControl*, UInt32)
    release : Proc(IAudioLfxControl*, UInt32)
    set_local_effects_state : Proc(IAudioLfxControl*, LibC::BOOL, HRESULT)
    get_local_effects_state : Proc(IAudioLfxControl*, LibC::BOOL*, HRESULT)
  end

  struct IAudioLfxControl
    lpVtbl : IAudioLfxControlVTbl*
  end

  struct IHardwareAudioEngineBaseVTbl
    query_interface : Proc(IHardwareAudioEngineBase*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHardwareAudioEngineBase*, UInt32)
    release : Proc(IHardwareAudioEngineBase*, UInt32)
    get_available_offload_connector_count : Proc(IHardwareAudioEngineBase*, LibC::LPWSTR, UInt32, UInt32*, HRESULT)
    get_engine_format : Proc(IHardwareAudioEngineBase*, IMMDevice, LibC::BOOL, WAVEFORMATEX**, HRESULT)
    set_engine_device_format : Proc(IHardwareAudioEngineBase*, IMMDevice, WAVEFORMATEX*, HRESULT)
    set_gfx_state : Proc(IHardwareAudioEngineBase*, IMMDevice, LibC::BOOL, HRESULT)
    get_gfx_state : Proc(IHardwareAudioEngineBase*, IMMDevice, LibC::BOOL*, HRESULT)
  end

  struct IHardwareAudioEngineBase
    lpVtbl : IHardwareAudioEngineBaseVTbl*
  end

  struct IAudioEndpointVolumeCallbackVTbl
    query_interface : Proc(IAudioEndpointVolumeCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointVolumeCallback*, UInt32)
    release : Proc(IAudioEndpointVolumeCallback*, UInt32)
    on_notify : Proc(IAudioEndpointVolumeCallback*, AUDIO_VOLUME_NOTIFICATION_DATA*, HRESULT)
  end

  struct IAudioEndpointVolumeCallback
    lpVtbl : IAudioEndpointVolumeCallbackVTbl*
  end

  struct IAudioEndpointVolumeVTbl
    query_interface : Proc(IAudioEndpointVolume*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointVolume*, UInt32)
    release : Proc(IAudioEndpointVolume*, UInt32)
    register_control_change_notify : Proc(IAudioEndpointVolume*, IAudioEndpointVolumeCallback, HRESULT)
    unregister_control_change_notify : Proc(IAudioEndpointVolume*, IAudioEndpointVolumeCallback, HRESULT)
    get_channel_count : Proc(IAudioEndpointVolume*, UInt32*, HRESULT)
    set_master_volume_level : Proc(IAudioEndpointVolume*, Float32, Guid*, HRESULT)
    set_master_volume_level_scalar : Proc(IAudioEndpointVolume*, Float32, Guid*, HRESULT)
    get_master_volume_level : Proc(IAudioEndpointVolume*, Float32*, HRESULT)
    get_master_volume_level_scalar : Proc(IAudioEndpointVolume*, Float32*, HRESULT)
    set_channel_volume_level : Proc(IAudioEndpointVolume*, UInt32, Float32, Guid*, HRESULT)
    set_channel_volume_level_scalar : Proc(IAudioEndpointVolume*, UInt32, Float32, Guid*, HRESULT)
    get_channel_volume_level : Proc(IAudioEndpointVolume*, UInt32, Float32*, HRESULT)
    get_channel_volume_level_scalar : Proc(IAudioEndpointVolume*, UInt32, Float32*, HRESULT)
    set_mute : Proc(IAudioEndpointVolume*, LibC::BOOL, Guid*, HRESULT)
    get_mute : Proc(IAudioEndpointVolume*, LibC::BOOL*, HRESULT)
    get_volume_step_info : Proc(IAudioEndpointVolume*, UInt32*, UInt32*, HRESULT)
    volume_step_up : Proc(IAudioEndpointVolume*, Guid*, HRESULT)
    volume_step_down : Proc(IAudioEndpointVolume*, Guid*, HRESULT)
    query_hardware_support : Proc(IAudioEndpointVolume*, UInt32*, HRESULT)
    get_volume_range : Proc(IAudioEndpointVolume*, Float32*, Float32*, Float32*, HRESULT)
  end

  struct IAudioEndpointVolume
    lpVtbl : IAudioEndpointVolumeVTbl*
  end

  struct IAudioEndpointVolumeExVTbl
    query_interface : Proc(IAudioEndpointVolumeEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointVolumeEx*, UInt32)
    release : Proc(IAudioEndpointVolumeEx*, UInt32)
    register_control_change_notify : Proc(IAudioEndpointVolumeEx*, IAudioEndpointVolumeCallback, HRESULT)
    unregister_control_change_notify : Proc(IAudioEndpointVolumeEx*, IAudioEndpointVolumeCallback, HRESULT)
    get_channel_count : Proc(IAudioEndpointVolumeEx*, UInt32*, HRESULT)
    set_master_volume_level : Proc(IAudioEndpointVolumeEx*, Float32, Guid*, HRESULT)
    set_master_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, Float32, Guid*, HRESULT)
    get_master_volume_level : Proc(IAudioEndpointVolumeEx*, Float32*, HRESULT)
    get_master_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, Float32*, HRESULT)
    set_channel_volume_level : Proc(IAudioEndpointVolumeEx*, UInt32, Float32, Guid*, HRESULT)
    set_channel_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, UInt32, Float32, Guid*, HRESULT)
    get_channel_volume_level : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, HRESULT)
    get_channel_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, HRESULT)
    set_mute : Proc(IAudioEndpointVolumeEx*, LibC::BOOL, Guid*, HRESULT)
    get_mute : Proc(IAudioEndpointVolumeEx*, LibC::BOOL*, HRESULT)
    get_volume_step_info : Proc(IAudioEndpointVolumeEx*, UInt32*, UInt32*, HRESULT)
    volume_step_up : Proc(IAudioEndpointVolumeEx*, Guid*, HRESULT)
    volume_step_down : Proc(IAudioEndpointVolumeEx*, Guid*, HRESULT)
    query_hardware_support : Proc(IAudioEndpointVolumeEx*, UInt32*, HRESULT)
    get_volume_range : Proc(IAudioEndpointVolumeEx*, Float32*, Float32*, Float32*, HRESULT)
    get_volume_range_channel : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, Float32*, Float32*, HRESULT)
  end

  struct IAudioEndpointVolumeEx
    lpVtbl : IAudioEndpointVolumeExVTbl*
  end

  struct IAudioMeterInformationVTbl
    query_interface : Proc(IAudioMeterInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioMeterInformation*, UInt32)
    release : Proc(IAudioMeterInformation*, UInt32)
    get_peak_value : Proc(IAudioMeterInformation*, Float32*, HRESULT)
    get_metering_channel_count : Proc(IAudioMeterInformation*, UInt32*, HRESULT)
    get_channels_peak_values : Proc(IAudioMeterInformation*, UInt32, Float32*, HRESULT)
    query_hardware_support : Proc(IAudioMeterInformation*, UInt32*, HRESULT)
  end

  struct IAudioMeterInformation
    lpVtbl : IAudioMeterInformationVTbl*
  end

end
