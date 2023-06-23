require "../../system/com.cr"
require "../../foundation.cr"
require "../../media/audio.cr"
require "../../media/kernelstreaming.cr"
require "../../media/audio/apo.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  DEVPKEY_AudioEndpointPlugin_FactoryCLSID = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 1_u32)
  DEVPKEY_AudioEndpointPlugin_DataFlow = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 2_u32)
  DEVPKEY_AudioEndpointPlugin_PnPInterface = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 3_u32)
  DEVPKEY_AudioEndpointPlugin2_FactoryCLSID = PROPERTYKEY.new(LibC::GUID.new(0x12d83bd7_u32, 0xcf12_u16, 0x46be_u16, StaticArray[0x85_u8, 0x40_u8, 0x81_u8, 0x27_u8, 0x10_u8, 0xd3_u8, 0x2_u8, 0x1c_u8]), 4_u32)
  CLSID_DEVINTERFACE_AUDIOENDPOINTPLUGIN = LibC::GUID.new(0x9f2f7b66_u32, 0x65ac_u16, 0x4fa6_u16, StaticArray[0x8a_u8, 0xe4_u8, 0x12_u8, 0x3c_u8, 0x78_u8, 0xb8_u8, 0x93_u8, 0x13_u8])


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

  IAudioEndpointFormatControl_GUID = "784cfd40-9f89-456e-a1a6-873b006a664e"
  IID_IAudioEndpointFormatControl = LibC::GUID.new(0x784cfd40_u32, 0x9f89_u16, 0x456e_u16, StaticArray[0xa1_u8, 0xa6_u8, 0x87_u8, 0x3b_u8, 0x0_u8, 0x6a_u8, 0x66_u8, 0x4e_u8])
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

  IAudioEndpointOffloadStreamVolume_GUID = "64f1dd49-71ca-4281-8672-3a9eddd1d0b6"
  IID_IAudioEndpointOffloadStreamVolume = LibC::GUID.new(0x64f1dd49_u32, 0x71ca_u16, 0x4281_u16, StaticArray[0x86_u8, 0x72_u8, 0x3a_u8, 0x9e_u8, 0xdd_u8, 0xd1_u8, 0xd0_u8, 0xb6_u8])
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

  IAudioEndpointOffloadStreamMute_GUID = "dfe21355-5ec2-40e0-8d6b-710ac3c00249"
  IID_IAudioEndpointOffloadStreamMute = LibC::GUID.new(0xdfe21355_u32, 0x5ec2_u16, 0x40e0_u16, StaticArray[0x8d_u8, 0x6b_u8, 0x71_u8, 0xa_u8, 0xc3_u8, 0xc0_u8, 0x2_u8, 0x49_u8])
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

  IAudioEndpointOffloadStreamMeter_GUID = "e1546dce-9dd1-418b-9ab2-348ced161c86"
  IID_IAudioEndpointOffloadStreamMeter = LibC::GUID.new(0xe1546dce_u32, 0x9dd1_u16, 0x418b_u16, StaticArray[0x9a_u8, 0xb2_u8, 0x34_u8, 0x8c_u8, 0xed_u8, 0x16_u8, 0x1c_u8, 0x86_u8])
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

  IAudioEndpointLastBufferControl_GUID = "f8520dd3-8f9d-4437-9861-62f584c33dd6"
  IID_IAudioEndpointLastBufferControl = LibC::GUID.new(0xf8520dd3_u32, 0x8f9d_u16, 0x4437_u16, StaticArray[0x98_u8, 0x61_u8, 0x62_u8, 0xf5_u8, 0x84_u8, 0xc3_u8, 0x3d_u8, 0xd6_u8])
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

  IAudioLfxControl_GUID = "076a6922-d802-4f83-baf6-409d9ca11bfe"
  IID_IAudioLfxControl = LibC::GUID.new(0x76a6922_u32, 0xd802_u16, 0x4f83_u16, StaticArray[0xba_u8, 0xf6_u8, 0x40_u8, 0x9d_u8, 0x9c_u8, 0xa1_u8, 0x1b_u8, 0xfe_u8])
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

  IHardwareAudioEngineBase_GUID = "eddce3e4-f3c1-453a-b461-223563cbd886"
  IID_IHardwareAudioEngineBase = LibC::GUID.new(0xeddce3e4_u32, 0xf3c1_u16, 0x453a_u16, StaticArray[0xb4_u8, 0x61_u8, 0x22_u8, 0x35_u8, 0x63_u8, 0xcb_u8, 0xd8_u8, 0x86_u8])
  struct IHardwareAudioEngineBase
    lpVtbl : IHardwareAudioEngineBaseVTbl*
  end

  struct IAudioEndpointVolumeCallbackVTbl
    query_interface : Proc(IAudioEndpointVolumeCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioEndpointVolumeCallback*, UInt32)
    release : Proc(IAudioEndpointVolumeCallback*, UInt32)
    on_notify : Proc(IAudioEndpointVolumeCallback*, AUDIO_VOLUME_NOTIFICATION_DATA*, HRESULT)
  end

  IAudioEndpointVolumeCallback_GUID = "657804fa-d6ad-4496-8a60-352752af4f89"
  IID_IAudioEndpointVolumeCallback = LibC::GUID.new(0x657804fa_u32, 0xd6ad_u16, 0x4496_u16, StaticArray[0x8a_u8, 0x60_u8, 0x35_u8, 0x27_u8, 0x52_u8, 0xaf_u8, 0x4f_u8, 0x89_u8])
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

  IAudioEndpointVolume_GUID = "5cdf2c82-841e-4546-9722-0cf74078229a"
  IID_IAudioEndpointVolume = LibC::GUID.new(0x5cdf2c82_u32, 0x841e_u16, 0x4546_u16, StaticArray[0x97_u8, 0x22_u8, 0xc_u8, 0xf7_u8, 0x40_u8, 0x78_u8, 0x22_u8, 0x9a_u8])
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

  IAudioEndpointVolumeEx_GUID = "66e11784-f695-4f28-a505-a7080081a78f"
  IID_IAudioEndpointVolumeEx = LibC::GUID.new(0x66e11784_u32, 0xf695_u16, 0x4f28_u16, StaticArray[0xa5_u8, 0x5_u8, 0xa7_u8, 0x8_u8, 0x0_u8, 0x81_u8, 0xa7_u8, 0x8f_u8])
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

  IAudioMeterInformation_GUID = "c02216f6-8c67-4b5b-9d00-d008e73e0064"
  IID_IAudioMeterInformation = LibC::GUID.new(0xc02216f6_u32, 0x8c67_u16, 0x4b5b_u16, StaticArray[0x9d_u8, 0x0_u8, 0xd0_u8, 0x8_u8, 0xe7_u8, 0x3e_u8, 0x0_u8, 0x64_u8])
  struct IAudioMeterInformation
    lpVtbl : IAudioMeterInformationVTbl*
  end

end
struct LibWin32::IAudioEndpointFormatControl
  def query_interface(this : IAudioEndpointFormatControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointFormatControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointFormatControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reset_to_default(this : IAudioEndpointFormatControl*, resetflags : UInt32) : HRESULT
    @lpVtbl.value.reset_to_default.call(this, resetflags)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamVolume
  def query_interface(this : IAudioEndpointOffloadStreamVolume*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointOffloadStreamVolume*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointOffloadStreamVolume*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_volume_channel_count(this : IAudioEndpointOffloadStreamVolume*, pu32channelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_channel_count.call(this, pu32channelcount)
  end
  def set_channel_volumes(this : IAudioEndpointOffloadStreamVolume*, u32channelcount : UInt32, pf32volumes : Float32*, u32curvetype : AUDIO_CURVE_TYPE, pcurveduration : Int64*) : HRESULT
    @lpVtbl.value.set_channel_volumes.call(this, u32channelcount, pf32volumes, u32curvetype, pcurveduration)
  end
  def get_channel_volumes(this : IAudioEndpointOffloadStreamVolume*, u32channelcount : UInt32, pf32volumes : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volumes.call(this, u32channelcount, pf32volumes)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamMute
  def query_interface(this : IAudioEndpointOffloadStreamMute*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointOffloadStreamMute*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointOffloadStreamMute*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_mute(this : IAudioEndpointOffloadStreamMute*, bmuted : UInt8) : HRESULT
    @lpVtbl.value.set_mute.call(this, bmuted)
  end
  def get_mute(this : IAudioEndpointOffloadStreamMute*, pbmuted : UInt8*) : HRESULT
    @lpVtbl.value.get_mute.call(this, pbmuted)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamMeter
  def query_interface(this : IAudioEndpointOffloadStreamMeter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointOffloadStreamMeter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointOffloadStreamMeter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_meter_channel_count(this : IAudioEndpointOffloadStreamMeter*, pu32channelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_meter_channel_count.call(this, pu32channelcount)
  end
  def get_metering_data(this : IAudioEndpointOffloadStreamMeter*, u32channelcount : UInt32, pf32peakvalues : Float32*) : HRESULT
    @lpVtbl.value.get_metering_data.call(this, u32channelcount, pf32peakvalues)
  end
end
struct LibWin32::IAudioEndpointLastBufferControl
  def query_interface(this : IAudioEndpointLastBufferControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointLastBufferControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointLastBufferControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_last_buffer_control_supported(this : IAudioEndpointLastBufferControl*) : LibC::BOOL
    @lpVtbl.value.is_last_buffer_control_supported.call(this)
  end
  def release_output_data_pointer_for_last_buffer(this : IAudioEndpointLastBufferControl*, pconnectionproperty : APO_CONNECTION_PROPERTY*) : Void
    @lpVtbl.value.release_output_data_pointer_for_last_buffer.call(this, pconnectionproperty)
  end
end
struct LibWin32::IAudioLfxControl
  def query_interface(this : IAudioLfxControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioLfxControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioLfxControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_local_effects_state(this : IAudioLfxControl*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_local_effects_state.call(this, benabled)
  end
  def get_local_effects_state(this : IAudioLfxControl*, pbenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_local_effects_state.call(this, pbenabled)
  end
end
struct LibWin32::IHardwareAudioEngineBase
  def query_interface(this : IHardwareAudioEngineBase*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHardwareAudioEngineBase*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHardwareAudioEngineBase*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_available_offload_connector_count(this : IHardwareAudioEngineBase*, pwstrdeviceid : LibC::LPWSTR, uconnectorid : UInt32, pavailableconnectorinstancecount : UInt32*) : HRESULT
    @lpVtbl.value.get_available_offload_connector_count.call(this, pwstrdeviceid, uconnectorid, pavailableconnectorinstancecount)
  end
  def get_engine_format(this : IHardwareAudioEngineBase*, pdevice : IMMDevice, brequestdeviceformat : LibC::BOOL, ppwfxformat : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_engine_format.call(this, pdevice, brequestdeviceformat, ppwfxformat)
  end
  def set_engine_device_format(this : IHardwareAudioEngineBase*, pdevice : IMMDevice, pwfxformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_engine_device_format.call(this, pdevice, pwfxformat)
  end
  def set_gfx_state(this : IHardwareAudioEngineBase*, pdevice : IMMDevice, benable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_gfx_state.call(this, pdevice, benable)
  end
  def get_gfx_state(this : IHardwareAudioEngineBase*, pdevice : IMMDevice, pbenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_gfx_state.call(this, pdevice, pbenable)
  end
end
struct LibWin32::IAudioEndpointVolumeCallback
  def query_interface(this : IAudioEndpointVolumeCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointVolumeCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointVolumeCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_notify(this : IAudioEndpointVolumeCallback*, pnotify : AUDIO_VOLUME_NOTIFICATION_DATA*) : HRESULT
    @lpVtbl.value.on_notify.call(this, pnotify)
  end
end
struct LibWin32::IAudioEndpointVolume
  def query_interface(this : IAudioEndpointVolume*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointVolume*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointVolume*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_control_change_notify(this : IAudioEndpointVolume*, pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.register_control_change_notify.call(this, pnotify)
  end
  def unregister_control_change_notify(this : IAudioEndpointVolume*, pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.unregister_control_change_notify.call(this, pnotify)
  end
  def get_channel_count(this : IAudioEndpointVolume*, pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_count.call(this, pnchannelcount)
  end
  def set_master_volume_level(this : IAudioEndpointVolume*, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level.call(this, fleveldb, pguideventcontext)
  end
  def set_master_volume_level_scalar(this : IAudioEndpointVolume*, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level_scalar.call(this, flevel, pguideventcontext)
  end
  def get_master_volume_level(this : IAudioEndpointVolume*, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level.call(this, pfleveldb)
  end
  def get_master_volume_level_scalar(this : IAudioEndpointVolume*, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level_scalar.call(this, pflevel)
  end
  def set_channel_volume_level(this : IAudioEndpointVolume*, nchannel : UInt32, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level.call(this, nchannel, fleveldb, pguideventcontext)
  end
  def set_channel_volume_level_scalar(this : IAudioEndpointVolume*, nchannel : UInt32, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level_scalar.call(this, nchannel, flevel, pguideventcontext)
  end
  def get_channel_volume_level(this : IAudioEndpointVolume*, nchannel : UInt32, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level.call(this, nchannel, pfleveldb)
  end
  def get_channel_volume_level_scalar(this : IAudioEndpointVolume*, nchannel : UInt32, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level_scalar.call(this, nchannel, pflevel)
  end
  def set_mute(this : IAudioEndpointVolume*, bmute : LibC::BOOL, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_mute.call(this, bmute, pguideventcontext)
  end
  def get_mute(this : IAudioEndpointVolume*, pbmute : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_mute.call(this, pbmute)
  end
  def get_volume_step_info(this : IAudioEndpointVolume*, pnstep : UInt32*, pnstepcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_step_info.call(this, pnstep, pnstepcount)
  end
  def volume_step_up(this : IAudioEndpointVolume*, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_up.call(this, pguideventcontext)
  end
  def volume_step_down(this : IAudioEndpointVolume*, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_down.call(this, pguideventcontext)
  end
  def query_hardware_support(this : IAudioEndpointVolume*, pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.call(this, pdwhardwaresupportmask)
  end
  def get_volume_range(this : IAudioEndpointVolume*, pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range.call(this, pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
end
struct LibWin32::IAudioEndpointVolumeEx
  def query_interface(this : IAudioEndpointVolumeEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioEndpointVolumeEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioEndpointVolumeEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_control_change_notify(this : IAudioEndpointVolumeEx*, pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.register_control_change_notify.call(this, pnotify)
  end
  def unregister_control_change_notify(this : IAudioEndpointVolumeEx*, pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.unregister_control_change_notify.call(this, pnotify)
  end
  def get_channel_count(this : IAudioEndpointVolumeEx*, pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_count.call(this, pnchannelcount)
  end
  def set_master_volume_level(this : IAudioEndpointVolumeEx*, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level.call(this, fleveldb, pguideventcontext)
  end
  def set_master_volume_level_scalar(this : IAudioEndpointVolumeEx*, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level_scalar.call(this, flevel, pguideventcontext)
  end
  def get_master_volume_level(this : IAudioEndpointVolumeEx*, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level.call(this, pfleveldb)
  end
  def get_master_volume_level_scalar(this : IAudioEndpointVolumeEx*, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level_scalar.call(this, pflevel)
  end
  def set_channel_volume_level(this : IAudioEndpointVolumeEx*, nchannel : UInt32, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level.call(this, nchannel, fleveldb, pguideventcontext)
  end
  def set_channel_volume_level_scalar(this : IAudioEndpointVolumeEx*, nchannel : UInt32, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level_scalar.call(this, nchannel, flevel, pguideventcontext)
  end
  def get_channel_volume_level(this : IAudioEndpointVolumeEx*, nchannel : UInt32, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level.call(this, nchannel, pfleveldb)
  end
  def get_channel_volume_level_scalar(this : IAudioEndpointVolumeEx*, nchannel : UInt32, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level_scalar.call(this, nchannel, pflevel)
  end
  def set_mute(this : IAudioEndpointVolumeEx*, bmute : LibC::BOOL, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_mute.call(this, bmute, pguideventcontext)
  end
  def get_mute(this : IAudioEndpointVolumeEx*, pbmute : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_mute.call(this, pbmute)
  end
  def get_volume_step_info(this : IAudioEndpointVolumeEx*, pnstep : UInt32*, pnstepcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_step_info.call(this, pnstep, pnstepcount)
  end
  def volume_step_up(this : IAudioEndpointVolumeEx*, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_up.call(this, pguideventcontext)
  end
  def volume_step_down(this : IAudioEndpointVolumeEx*, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_down.call(this, pguideventcontext)
  end
  def query_hardware_support(this : IAudioEndpointVolumeEx*, pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.call(this, pdwhardwaresupportmask)
  end
  def get_volume_range(this : IAudioEndpointVolumeEx*, pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range.call(this, pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
  def get_volume_range_channel(this : IAudioEndpointVolumeEx*, ichannel : UInt32, pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range_channel.call(this, ichannel, pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
end
struct LibWin32::IAudioMeterInformation
  def query_interface(this : IAudioMeterInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAudioMeterInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAudioMeterInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_peak_value(this : IAudioMeterInformation*, pfpeak : Float32*) : HRESULT
    @lpVtbl.value.get_peak_value.call(this, pfpeak)
  end
  def get_metering_channel_count(this : IAudioMeterInformation*, pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_metering_channel_count.call(this, pnchannelcount)
  end
  def get_channels_peak_values(this : IAudioMeterInformation*, u32channelcount : UInt32, afpeakvalues : Float32*) : HRESULT
    @lpVtbl.value.get_channels_peak_values.call(this, u32channelcount, afpeakvalues)
  end
  def query_hardware_support(this : IAudioMeterInformation*, pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.call(this, pdwhardwaresupportmask)
  end
end
