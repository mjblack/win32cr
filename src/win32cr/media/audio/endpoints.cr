require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../audio.cr"
require "./../kernel_streaming.cr"
require "./apo.cr"

module Win32cr::Media::Audio::Endpoints
  DEVPKEY_AudioEndpointPlugin_FactoryCLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 1_u32)
  DEVPKEY_AudioEndpointPlugin_DataFlow = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 2_u32)
  DEVPKEY_AudioEndpointPlugin_PnPInterface = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 3_u32)
  DEVPKEY_AudioEndpointPlugin2_FactoryCLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 4_u32)

  CLSID_DEVINTERFACE_AUDIOENDPOINTPLUGIN = LibC::GUID.new(0x9f2f7b66_u32, 0x65ac_u16, 0x4fa6_u16, StaticArray[0x8a_u8, 0xe4_u8, 0x12_u8, 0x3c_u8, 0x78_u8, 0xb8_u8, 0x93_u8, 0x13_u8])

  enum EndpointConnectorType
    Ehostprocessconnector = 0_i32
    Eoffloadconnector = 1_i32
    Eloopbackconnector = 2_i32
    Ekeyworddetectorconnector = 3_i32
    Econnectorcount = 4_i32
  end

  @[Extern]
  struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS
    property u32Size : UInt32
    property u32TSSessionId : UInt32
    property targetEndpointConnectorType : Win32cr::Media::Audio::Endpoints::EndpointConnectorType
    property wfxDeviceFormat : Win32cr::Media::Audio::WAVEFORMATEX
    def initialize(@u32Size : UInt32, @u32TSSessionId : UInt32, @targetEndpointConnectorType : Win32cr::Media::Audio::Endpoints::EndpointConnectorType, @wfxDeviceFormat : Win32cr::Media::Audio::WAVEFORMATEX)
    end
  end

  @[Extern]
  record IAudioEndpointFormatControlVtbl,
    query_interface : Proc(IAudioEndpointFormatControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointFormatControl*, UInt32),
    release : Proc(IAudioEndpointFormatControl*, UInt32),
    reset_to_default : Proc(IAudioEndpointFormatControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointFormatControl, lpVtbl : IAudioEndpointFormatControlVtbl* do
    GUID = LibC::GUID.new(0x784cfd40_u32, 0x9f89_u16, 0x456e_u16, StaticArray[0xa1_u8, 0xa6_u8, 0x87_u8, 0x3b_u8, 0x0_u8, 0x6a_u8, 0x66_u8, 0x4e_u8])
    def query_interface(this : IAudioEndpointFormatControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointFormatControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointFormatControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset_to_default(this : IAudioEndpointFormatControl*, reset_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_to_default.call(this, reset_flags)
    end

  end

  @[Extern]
  record IAudioEndpointOffloadStreamVolumeVtbl,
    query_interface : Proc(IAudioEndpointOffloadStreamVolume*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointOffloadStreamVolume*, UInt32),
    release : Proc(IAudioEndpointOffloadStreamVolume*, UInt32),
    get_volume_channel_count : Proc(IAudioEndpointOffloadStreamVolume*, UInt32*, Win32cr::Foundation::HRESULT),
    set_channel_volumes : Proc(IAudioEndpointOffloadStreamVolume*, UInt32, Float32*, Win32cr::Media::KernelStreaming::AUDIO_CURVE_TYPE, Int64*, Win32cr::Foundation::HRESULT),
    get_channel_volumes : Proc(IAudioEndpointOffloadStreamVolume*, UInt32, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointOffloadStreamVolume, lpVtbl : IAudioEndpointOffloadStreamVolumeVtbl* do
    GUID = LibC::GUID.new(0x64f1dd49_u32, 0x71ca_u16, 0x4281_u16, StaticArray[0x86_u8, 0x72_u8, 0x3a_u8, 0x9e_u8, 0xdd_u8, 0xd1_u8, 0xd0_u8, 0xb6_u8])
    def query_interface(this : IAudioEndpointOffloadStreamVolume*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointOffloadStreamVolume*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointOffloadStreamVolume*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_volume_channel_count(this : IAudioEndpointOffloadStreamVolume*, pu32ChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_channel_count.call(this, pu32ChannelCount)
    end
    def set_channel_volumes(this : IAudioEndpointOffloadStreamVolume*, u32ChannelCount : UInt32, pf32Volumes : Float32*, u32CurveType : Win32cr::Media::KernelStreaming::AUDIO_CURVE_TYPE, pCurveDuration : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volumes.call(this, u32ChannelCount, pf32Volumes, u32CurveType, pCurveDuration)
    end
    def get_channel_volumes(this : IAudioEndpointOffloadStreamVolume*, u32ChannelCount : UInt32, pf32Volumes : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_volumes.call(this, u32ChannelCount, pf32Volumes)
    end

  end

  @[Extern]
  record IAudioEndpointOffloadStreamMuteVtbl,
    query_interface : Proc(IAudioEndpointOffloadStreamMute*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointOffloadStreamMute*, UInt32),
    release : Proc(IAudioEndpointOffloadStreamMute*, UInt32),
    set_mute : Proc(IAudioEndpointOffloadStreamMute*, UInt8, Win32cr::Foundation::HRESULT),
    get_mute : Proc(IAudioEndpointOffloadStreamMute*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointOffloadStreamMute, lpVtbl : IAudioEndpointOffloadStreamMuteVtbl* do
    GUID = LibC::GUID.new(0xdfe21355_u32, 0x5ec2_u16, 0x40e0_u16, StaticArray[0x8d_u8, 0x6b_u8, 0x71_u8, 0xa_u8, 0xc3_u8, 0xc0_u8, 0x2_u8, 0x49_u8])
    def query_interface(this : IAudioEndpointOffloadStreamMute*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointOffloadStreamMute*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointOffloadStreamMute*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_mute(this : IAudioEndpointOffloadStreamMute*, bMuted : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mute.call(this, bMuted)
    end
    def get_mute(this : IAudioEndpointOffloadStreamMute*, pbMuted : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mute.call(this, pbMuted)
    end

  end

  @[Extern]
  record IAudioEndpointOffloadStreamMeterVtbl,
    query_interface : Proc(IAudioEndpointOffloadStreamMeter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointOffloadStreamMeter*, UInt32),
    release : Proc(IAudioEndpointOffloadStreamMeter*, UInt32),
    get_meter_channel_count : Proc(IAudioEndpointOffloadStreamMeter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metering_data : Proc(IAudioEndpointOffloadStreamMeter*, UInt32, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointOffloadStreamMeter, lpVtbl : IAudioEndpointOffloadStreamMeterVtbl* do
    GUID = LibC::GUID.new(0xe1546dce_u32, 0x9dd1_u16, 0x418b_u16, StaticArray[0x9a_u8, 0xb2_u8, 0x34_u8, 0x8c_u8, 0xed_u8, 0x16_u8, 0x1c_u8, 0x86_u8])
    def query_interface(this : IAudioEndpointOffloadStreamMeter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointOffloadStreamMeter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointOffloadStreamMeter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_meter_channel_count(this : IAudioEndpointOffloadStreamMeter*, pu32ChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_meter_channel_count.call(this, pu32ChannelCount)
    end
    def get_metering_data(this : IAudioEndpointOffloadStreamMeter*, u32ChannelCount : UInt32, pf32PeakValues : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metering_data.call(this, u32ChannelCount, pf32PeakValues)
    end

  end

  @[Extern]
  record IAudioEndpointLastBufferControlVtbl,
    query_interface : Proc(IAudioEndpointLastBufferControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointLastBufferControl*, UInt32),
    release : Proc(IAudioEndpointLastBufferControl*, UInt32),
    is_last_buffer_control_supported : Proc(IAudioEndpointLastBufferControl*, Win32cr::Foundation::BOOL),
    release_output_data_pointer_for_last_buffer : Proc(IAudioEndpointLastBufferControl*, Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*, Void)


  @[Extern]
  record IAudioEndpointLastBufferControl, lpVtbl : IAudioEndpointLastBufferControlVtbl* do
    GUID = LibC::GUID.new(0xf8520dd3_u32, 0x8f9d_u16, 0x4437_u16, StaticArray[0x98_u8, 0x61_u8, 0x62_u8, 0xf5_u8, 0x84_u8, 0xc3_u8, 0x3d_u8, 0xd6_u8])
    def query_interface(this : IAudioEndpointLastBufferControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointLastBufferControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointLastBufferControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_last_buffer_control_supported(this : IAudioEndpointLastBufferControl*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_last_buffer_control_supported.call(this)
    end
    def release_output_data_pointer_for_last_buffer(this : IAudioEndpointLastBufferControl*, pConnectionProperty : Win32cr::Media::Audio::Apo::APO_CONNECTION_PROPERTY*) : Void
      @lpVtbl.try &.value.release_output_data_pointer_for_last_buffer.call(this, pConnectionProperty)
    end

  end

  @[Extern]
  record IAudioLfxControlVtbl,
    query_interface : Proc(IAudioLfxControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioLfxControl*, UInt32),
    release : Proc(IAudioLfxControl*, UInt32),
    set_local_effects_state : Proc(IAudioLfxControl*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_local_effects_state : Proc(IAudioLfxControl*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioLfxControl, lpVtbl : IAudioLfxControlVtbl* do
    GUID = LibC::GUID.new(0x76a6922_u32, 0xd802_u16, 0x4f83_u16, StaticArray[0xba_u8, 0xf6_u8, 0x40_u8, 0x9d_u8, 0x9c_u8, 0xa1_u8, 0x1b_u8, 0xfe_u8])
    def query_interface(this : IAudioLfxControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioLfxControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioLfxControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_local_effects_state(this : IAudioLfxControl*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_effects_state.call(this, bEnabled)
    end
    def get_local_effects_state(this : IAudioLfxControl*, pbEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_effects_state.call(this, pbEnabled)
    end

  end

  @[Extern]
  record IHardwareAudioEngineBaseVtbl,
    query_interface : Proc(IHardwareAudioEngineBase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHardwareAudioEngineBase*, UInt32),
    release : Proc(IHardwareAudioEngineBase*, UInt32),
    get_available_offload_connector_count : Proc(IHardwareAudioEngineBase*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_engine_format : Proc(IHardwareAudioEngineBase*, Void*, Win32cr::Foundation::BOOL, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    set_engine_device_format : Proc(IHardwareAudioEngineBase*, Void*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_gfx_state : Proc(IHardwareAudioEngineBase*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_gfx_state : Proc(IHardwareAudioEngineBase*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHardwareAudioEngineBase, lpVtbl : IHardwareAudioEngineBaseVtbl* do
    GUID = LibC::GUID.new(0xeddce3e4_u32, 0xf3c1_u16, 0x453a_u16, StaticArray[0xb4_u8, 0x61_u8, 0x22_u8, 0x35_u8, 0x63_u8, 0xcb_u8, 0xd8_u8, 0x86_u8])
    def query_interface(this : IHardwareAudioEngineBase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHardwareAudioEngineBase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHardwareAudioEngineBase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_available_offload_connector_count(this : IHardwareAudioEngineBase*, _pwstr_device_id : Win32cr::Foundation::PWSTR, _u_connector_id : UInt32, _p_available_connector_instance_count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_offload_connector_count.call(this, _pwstr_device_id, _u_connector_id, _p_available_connector_instance_count)
    end
    def get_engine_format(this : IHardwareAudioEngineBase*, pDevice : Void*, _b_request_device_format : Win32cr::Foundation::BOOL, _ppwfx_format : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_engine_format.call(this, pDevice, _b_request_device_format, _ppwfx_format)
    end
    def set_engine_device_format(this : IHardwareAudioEngineBase*, pDevice : Void*, _pwfx_format : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_engine_device_format.call(this, pDevice, _pwfx_format)
    end
    def set_gfx_state(this : IHardwareAudioEngineBase*, pDevice : Void*, _b_enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gfx_state.call(this, pDevice, _b_enable)
    end
    def get_gfx_state(this : IHardwareAudioEngineBase*, pDevice : Void*, _pb_enable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gfx_state.call(this, pDevice, _pb_enable)
    end

  end

  @[Extern]
  record IAudioEndpointVolumeCallbackVtbl,
    query_interface : Proc(IAudioEndpointVolumeCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointVolumeCallback*, UInt32),
    release : Proc(IAudioEndpointVolumeCallback*, UInt32),
    on_notify : Proc(IAudioEndpointVolumeCallback*, Win32cr::Media::Audio::AUDIO_VOLUME_NOTIFICATION_DATA*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointVolumeCallback, lpVtbl : IAudioEndpointVolumeCallbackVtbl* do
    GUID = LibC::GUID.new(0x657804fa_u32, 0xd6ad_u16, 0x4496_u16, StaticArray[0x8a_u8, 0x60_u8, 0x35_u8, 0x27_u8, 0x52_u8, 0xaf_u8, 0x4f_u8, 0x89_u8])
    def query_interface(this : IAudioEndpointVolumeCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointVolumeCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointVolumeCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_notify(this : IAudioEndpointVolumeCallback*, pNotify : Win32cr::Media::Audio::AUDIO_VOLUME_NOTIFICATION_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_notify.call(this, pNotify)
    end

  end

  @[Extern]
  record IAudioEndpointVolumeVtbl,
    query_interface : Proc(IAudioEndpointVolume*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointVolume*, UInt32),
    release : Proc(IAudioEndpointVolume*, UInt32),
    register_control_change_notify : Proc(IAudioEndpointVolume*, Void*, Win32cr::Foundation::HRESULT),
    unregister_control_change_notify : Proc(IAudioEndpointVolume*, Void*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IAudioEndpointVolume*, UInt32*, Win32cr::Foundation::HRESULT),
    set_master_volume_level : Proc(IAudioEndpointVolume*, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_master_volume_level_scalar : Proc(IAudioEndpointVolume*, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_master_volume_level : Proc(IAudioEndpointVolume*, Float32*, Win32cr::Foundation::HRESULT),
    get_master_volume_level_scalar : Proc(IAudioEndpointVolume*, Float32*, Win32cr::Foundation::HRESULT),
    set_channel_volume_level : Proc(IAudioEndpointVolume*, UInt32, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_channel_volume_level_scalar : Proc(IAudioEndpointVolume*, UInt32, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_channel_volume_level : Proc(IAudioEndpointVolume*, UInt32, Float32*, Win32cr::Foundation::HRESULT),
    get_channel_volume_level_scalar : Proc(IAudioEndpointVolume*, UInt32, Float32*, Win32cr::Foundation::HRESULT),
    set_mute : Proc(IAudioEndpointVolume*, Win32cr::Foundation::BOOL, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_mute : Proc(IAudioEndpointVolume*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_volume_step_info : Proc(IAudioEndpointVolume*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    volume_step_up : Proc(IAudioEndpointVolume*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    volume_step_down : Proc(IAudioEndpointVolume*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    query_hardware_support : Proc(IAudioEndpointVolume*, UInt32*, Win32cr::Foundation::HRESULT),
    get_volume_range : Proc(IAudioEndpointVolume*, Float32*, Float32*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointVolume, lpVtbl : IAudioEndpointVolumeVtbl* do
    GUID = LibC::GUID.new(0x5cdf2c82_u32, 0x841e_u16, 0x4546_u16, StaticArray[0x97_u8, 0x22_u8, 0xc_u8, 0xf7_u8, 0x40_u8, 0x78_u8, 0x22_u8, 0x9a_u8])
    def query_interface(this : IAudioEndpointVolume*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointVolume*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointVolume*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_control_change_notify(this : IAudioEndpointVolume*, pNotify : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_control_change_notify.call(this, pNotify)
    end
    def unregister_control_change_notify(this : IAudioEndpointVolume*, pNotify : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_control_change_notify.call(this, pNotify)
    end
    def get_channel_count(this : IAudioEndpointVolume*, pnChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_count.call(this, pnChannelCount)
    end
    def set_master_volume_level(this : IAudioEndpointVolume*, fLevelDB : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_volume_level.call(this, fLevelDB, pguidEventContext)
    end
    def set_master_volume_level_scalar(this : IAudioEndpointVolume*, fLevel : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_volume_level_scalar.call(this, fLevel, pguidEventContext)
    end
    def get_master_volume_level(this : IAudioEndpointVolume*, pfLevelDB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_volume_level.call(this, pfLevelDB)
    end
    def get_master_volume_level_scalar(this : IAudioEndpointVolume*, pfLevel : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_volume_level_scalar.call(this, pfLevel)
    end
    def set_channel_volume_level(this : IAudioEndpointVolume*, nChannel : UInt32, fLevelDB : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volume_level.call(this, nChannel, fLevelDB, pguidEventContext)
    end
    def set_channel_volume_level_scalar(this : IAudioEndpointVolume*, nChannel : UInt32, fLevel : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volume_level_scalar.call(this, nChannel, fLevel, pguidEventContext)
    end
    def get_channel_volume_level(this : IAudioEndpointVolume*, nChannel : UInt32, pfLevelDB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_volume_level.call(this, nChannel, pfLevelDB)
    end
    def get_channel_volume_level_scalar(this : IAudioEndpointVolume*, nChannel : UInt32, pfLevel : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_volume_level_scalar.call(this, nChannel, pfLevel)
    end
    def set_mute(this : IAudioEndpointVolume*, bMute : Win32cr::Foundation::BOOL, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mute.call(this, bMute, pguidEventContext)
    end
    def get_mute(this : IAudioEndpointVolume*, pbMute : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mute.call(this, pbMute)
    end
    def get_volume_step_info(this : IAudioEndpointVolume*, pnStep : UInt32*, pnStepCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_step_info.call(this, pnStep, pnStepCount)
    end
    def volume_step_up(this : IAudioEndpointVolume*, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.volume_step_up.call(this, pguidEventContext)
    end
    def volume_step_down(this : IAudioEndpointVolume*, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.volume_step_down.call(this, pguidEventContext)
    end
    def query_hardware_support(this : IAudioEndpointVolume*, pdwHardwareSupportMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_hardware_support.call(this, pdwHardwareSupportMask)
    end
    def get_volume_range(this : IAudioEndpointVolume*, pflVolumeMindB : Float32*, pflVolumeMaxdB : Float32*, pflVolumeIncrementdB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_range.call(this, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB)
    end

  end

  @[Extern]
  record IAudioEndpointVolumeExVtbl,
    query_interface : Proc(IAudioEndpointVolumeEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioEndpointVolumeEx*, UInt32),
    release : Proc(IAudioEndpointVolumeEx*, UInt32),
    register_control_change_notify : Proc(IAudioEndpointVolumeEx*, Void*, Win32cr::Foundation::HRESULT),
    unregister_control_change_notify : Proc(IAudioEndpointVolumeEx*, Void*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IAudioEndpointVolumeEx*, UInt32*, Win32cr::Foundation::HRESULT),
    set_master_volume_level : Proc(IAudioEndpointVolumeEx*, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_master_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_master_volume_level : Proc(IAudioEndpointVolumeEx*, Float32*, Win32cr::Foundation::HRESULT),
    get_master_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, Float32*, Win32cr::Foundation::HRESULT),
    set_channel_volume_level : Proc(IAudioEndpointVolumeEx*, UInt32, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_channel_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, UInt32, Float32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_channel_volume_level : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, Win32cr::Foundation::HRESULT),
    get_channel_volume_level_scalar : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, Win32cr::Foundation::HRESULT),
    set_mute : Proc(IAudioEndpointVolumeEx*, Win32cr::Foundation::BOOL, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_mute : Proc(IAudioEndpointVolumeEx*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_volume_step_info : Proc(IAudioEndpointVolumeEx*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    volume_step_up : Proc(IAudioEndpointVolumeEx*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    volume_step_down : Proc(IAudioEndpointVolumeEx*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    query_hardware_support : Proc(IAudioEndpointVolumeEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_volume_range : Proc(IAudioEndpointVolumeEx*, Float32*, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    get_volume_range_channel : Proc(IAudioEndpointVolumeEx*, UInt32, Float32*, Float32*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioEndpointVolumeEx, lpVtbl : IAudioEndpointVolumeExVtbl* do
    GUID = LibC::GUID.new(0x66e11784_u32, 0xf695_u16, 0x4f28_u16, StaticArray[0xa5_u8, 0x5_u8, 0xa7_u8, 0x8_u8, 0x0_u8, 0x81_u8, 0xa7_u8, 0x8f_u8])
    def query_interface(this : IAudioEndpointVolumeEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioEndpointVolumeEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioEndpointVolumeEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_control_change_notify(this : IAudioEndpointVolumeEx*, pNotify : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_control_change_notify.call(this, pNotify)
    end
    def unregister_control_change_notify(this : IAudioEndpointVolumeEx*, pNotify : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_control_change_notify.call(this, pNotify)
    end
    def get_channel_count(this : IAudioEndpointVolumeEx*, pnChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_count.call(this, pnChannelCount)
    end
    def set_master_volume_level(this : IAudioEndpointVolumeEx*, fLevelDB : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_volume_level.call(this, fLevelDB, pguidEventContext)
    end
    def set_master_volume_level_scalar(this : IAudioEndpointVolumeEx*, fLevel : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_volume_level_scalar.call(this, fLevel, pguidEventContext)
    end
    def get_master_volume_level(this : IAudioEndpointVolumeEx*, pfLevelDB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_volume_level.call(this, pfLevelDB)
    end
    def get_master_volume_level_scalar(this : IAudioEndpointVolumeEx*, pfLevel : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_volume_level_scalar.call(this, pfLevel)
    end
    def set_channel_volume_level(this : IAudioEndpointVolumeEx*, nChannel : UInt32, fLevelDB : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volume_level.call(this, nChannel, fLevelDB, pguidEventContext)
    end
    def set_channel_volume_level_scalar(this : IAudioEndpointVolumeEx*, nChannel : UInt32, fLevel : Float32, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volume_level_scalar.call(this, nChannel, fLevel, pguidEventContext)
    end
    def get_channel_volume_level(this : IAudioEndpointVolumeEx*, nChannel : UInt32, pfLevelDB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_volume_level.call(this, nChannel, pfLevelDB)
    end
    def get_channel_volume_level_scalar(this : IAudioEndpointVolumeEx*, nChannel : UInt32, pfLevel : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_volume_level_scalar.call(this, nChannel, pfLevel)
    end
    def set_mute(this : IAudioEndpointVolumeEx*, bMute : Win32cr::Foundation::BOOL, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mute.call(this, bMute, pguidEventContext)
    end
    def get_mute(this : IAudioEndpointVolumeEx*, pbMute : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mute.call(this, pbMute)
    end
    def get_volume_step_info(this : IAudioEndpointVolumeEx*, pnStep : UInt32*, pnStepCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_step_info.call(this, pnStep, pnStepCount)
    end
    def volume_step_up(this : IAudioEndpointVolumeEx*, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.volume_step_up.call(this, pguidEventContext)
    end
    def volume_step_down(this : IAudioEndpointVolumeEx*, pguidEventContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.volume_step_down.call(this, pguidEventContext)
    end
    def query_hardware_support(this : IAudioEndpointVolumeEx*, pdwHardwareSupportMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_hardware_support.call(this, pdwHardwareSupportMask)
    end
    def get_volume_range(this : IAudioEndpointVolumeEx*, pflVolumeMindB : Float32*, pflVolumeMaxdB : Float32*, pflVolumeIncrementdB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_range.call(this, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB)
    end
    def get_volume_range_channel(this : IAudioEndpointVolumeEx*, iChannel : UInt32, pflVolumeMindB : Float32*, pflVolumeMaxdB : Float32*, pflVolumeIncrementdB : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_range_channel.call(this, iChannel, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB)
    end

  end

  @[Extern]
  record IAudioMeterInformationVtbl,
    query_interface : Proc(IAudioMeterInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioMeterInformation*, UInt32),
    release : Proc(IAudioMeterInformation*, UInt32),
    get_peak_value : Proc(IAudioMeterInformation*, Float32*, Win32cr::Foundation::HRESULT),
    get_metering_channel_count : Proc(IAudioMeterInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channels_peak_values : Proc(IAudioMeterInformation*, UInt32, Float32*, Win32cr::Foundation::HRESULT),
    query_hardware_support : Proc(IAudioMeterInformation*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioMeterInformation, lpVtbl : IAudioMeterInformationVtbl* do
    GUID = LibC::GUID.new(0xc02216f6_u32, 0x8c67_u16, 0x4b5b_u16, StaticArray[0x9d_u8, 0x0_u8, 0xd0_u8, 0x8_u8, 0xe7_u8, 0x3e_u8, 0x0_u8, 0x64_u8])
    def query_interface(this : IAudioMeterInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioMeterInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioMeterInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_peak_value(this : IAudioMeterInformation*, pfPeak : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peak_value.call(this, pfPeak)
    end
    def get_metering_channel_count(this : IAudioMeterInformation*, pnChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metering_channel_count.call(this, pnChannelCount)
    end
    def get_channels_peak_values(this : IAudioMeterInformation*, u32ChannelCount : UInt32, afPeakValues : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channels_peak_values.call(this, u32ChannelCount, afPeakValues)
    end
    def query_hardware_support(this : IAudioMeterInformation*, pdwHardwareSupportMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_hardware_support.call(this, pdwHardwareSupportMask)
    end

  end

end