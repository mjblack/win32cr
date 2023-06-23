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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset_to_default : UInt64
  end

  IAudioEndpointFormatControl_GUID = "784cfd40-9f89-456e-a1a6-873b006a664e"
  IID_IAudioEndpointFormatControl = LibC::GUID.new(0x784cfd40_u32, 0x9f89_u16, 0x456e_u16, StaticArray[0xa1_u8, 0xa6_u8, 0x87_u8, 0x3b_u8, 0x0_u8, 0x6a_u8, 0x66_u8, 0x4e_u8])
  struct IAudioEndpointFormatControl
    lpVtbl : IAudioEndpointFormatControlVTbl*
  end

  struct IAudioEndpointOffloadStreamVolumeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_volume_channel_count : UInt64
    set_channel_volumes : UInt64
    get_channel_volumes : UInt64
  end

  IAudioEndpointOffloadStreamVolume_GUID = "64f1dd49-71ca-4281-8672-3a9eddd1d0b6"
  IID_IAudioEndpointOffloadStreamVolume = LibC::GUID.new(0x64f1dd49_u32, 0x71ca_u16, 0x4281_u16, StaticArray[0x86_u8, 0x72_u8, 0x3a_u8, 0x9e_u8, 0xdd_u8, 0xd1_u8, 0xd0_u8, 0xb6_u8])
  struct IAudioEndpointOffloadStreamVolume
    lpVtbl : IAudioEndpointOffloadStreamVolumeVTbl*
  end

  struct IAudioEndpointOffloadStreamMuteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_mute : UInt64
    get_mute : UInt64
  end

  IAudioEndpointOffloadStreamMute_GUID = "dfe21355-5ec2-40e0-8d6b-710ac3c00249"
  IID_IAudioEndpointOffloadStreamMute = LibC::GUID.new(0xdfe21355_u32, 0x5ec2_u16, 0x40e0_u16, StaticArray[0x8d_u8, 0x6b_u8, 0x71_u8, 0xa_u8, 0xc3_u8, 0xc0_u8, 0x2_u8, 0x49_u8])
  struct IAudioEndpointOffloadStreamMute
    lpVtbl : IAudioEndpointOffloadStreamMuteVTbl*
  end

  struct IAudioEndpointOffloadStreamMeterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_meter_channel_count : UInt64
    get_metering_data : UInt64
  end

  IAudioEndpointOffloadStreamMeter_GUID = "e1546dce-9dd1-418b-9ab2-348ced161c86"
  IID_IAudioEndpointOffloadStreamMeter = LibC::GUID.new(0xe1546dce_u32, 0x9dd1_u16, 0x418b_u16, StaticArray[0x9a_u8, 0xb2_u8, 0x34_u8, 0x8c_u8, 0xed_u8, 0x16_u8, 0x1c_u8, 0x86_u8])
  struct IAudioEndpointOffloadStreamMeter
    lpVtbl : IAudioEndpointOffloadStreamMeterVTbl*
  end

  struct IAudioEndpointLastBufferControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_last_buffer_control_supported : UInt64
    release_output_data_pointer_for_last_buffer : UInt64
  end

  IAudioEndpointLastBufferControl_GUID = "f8520dd3-8f9d-4437-9861-62f584c33dd6"
  IID_IAudioEndpointLastBufferControl = LibC::GUID.new(0xf8520dd3_u32, 0x8f9d_u16, 0x4437_u16, StaticArray[0x98_u8, 0x61_u8, 0x62_u8, 0xf5_u8, 0x84_u8, 0xc3_u8, 0x3d_u8, 0xd6_u8])
  struct IAudioEndpointLastBufferControl
    lpVtbl : IAudioEndpointLastBufferControlVTbl*
  end

  struct IAudioLfxControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_local_effects_state : UInt64
    get_local_effects_state : UInt64
  end

  IAudioLfxControl_GUID = "076a6922-d802-4f83-baf6-409d9ca11bfe"
  IID_IAudioLfxControl = LibC::GUID.new(0x76a6922_u32, 0xd802_u16, 0x4f83_u16, StaticArray[0xba_u8, 0xf6_u8, 0x40_u8, 0x9d_u8, 0x9c_u8, 0xa1_u8, 0x1b_u8, 0xfe_u8])
  struct IAudioLfxControl
    lpVtbl : IAudioLfxControlVTbl*
  end

  struct IHardwareAudioEngineBaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_available_offload_connector_count : UInt64
    get_engine_format : UInt64
    set_engine_device_format : UInt64
    set_gfx_state : UInt64
    get_gfx_state : UInt64
  end

  IHardwareAudioEngineBase_GUID = "eddce3e4-f3c1-453a-b461-223563cbd886"
  IID_IHardwareAudioEngineBase = LibC::GUID.new(0xeddce3e4_u32, 0xf3c1_u16, 0x453a_u16, StaticArray[0xb4_u8, 0x61_u8, 0x22_u8, 0x35_u8, 0x63_u8, 0xcb_u8, 0xd8_u8, 0x86_u8])
  struct IHardwareAudioEngineBase
    lpVtbl : IHardwareAudioEngineBaseVTbl*
  end

  struct IAudioEndpointVolumeCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_notify : UInt64
  end

  IAudioEndpointVolumeCallback_GUID = "657804fa-d6ad-4496-8a60-352752af4f89"
  IID_IAudioEndpointVolumeCallback = LibC::GUID.new(0x657804fa_u32, 0xd6ad_u16, 0x4496_u16, StaticArray[0x8a_u8, 0x60_u8, 0x35_u8, 0x27_u8, 0x52_u8, 0xaf_u8, 0x4f_u8, 0x89_u8])
  struct IAudioEndpointVolumeCallback
    lpVtbl : IAudioEndpointVolumeCallbackVTbl*
  end

  struct IAudioEndpointVolumeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_control_change_notify : UInt64
    unregister_control_change_notify : UInt64
    get_channel_count : UInt64
    set_master_volume_level : UInt64
    set_master_volume_level_scalar : UInt64
    get_master_volume_level : UInt64
    get_master_volume_level_scalar : UInt64
    set_channel_volume_level : UInt64
    set_channel_volume_level_scalar : UInt64
    get_channel_volume_level : UInt64
    get_channel_volume_level_scalar : UInt64
    set_mute : UInt64
    get_mute : UInt64
    get_volume_step_info : UInt64
    volume_step_up : UInt64
    volume_step_down : UInt64
    query_hardware_support : UInt64
    get_volume_range : UInt64
  end

  IAudioEndpointVolume_GUID = "5cdf2c82-841e-4546-9722-0cf74078229a"
  IID_IAudioEndpointVolume = LibC::GUID.new(0x5cdf2c82_u32, 0x841e_u16, 0x4546_u16, StaticArray[0x97_u8, 0x22_u8, 0xc_u8, 0xf7_u8, 0x40_u8, 0x78_u8, 0x22_u8, 0x9a_u8])
  struct IAudioEndpointVolume
    lpVtbl : IAudioEndpointVolumeVTbl*
  end

  struct IAudioEndpointVolumeExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_control_change_notify : UInt64
    unregister_control_change_notify : UInt64
    get_channel_count : UInt64
    set_master_volume_level : UInt64
    set_master_volume_level_scalar : UInt64
    get_master_volume_level : UInt64
    get_master_volume_level_scalar : UInt64
    set_channel_volume_level : UInt64
    set_channel_volume_level_scalar : UInt64
    get_channel_volume_level : UInt64
    get_channel_volume_level_scalar : UInt64
    set_mute : UInt64
    get_mute : UInt64
    get_volume_step_info : UInt64
    volume_step_up : UInt64
    volume_step_down : UInt64
    query_hardware_support : UInt64
    get_volume_range : UInt64
    get_volume_range_channel : UInt64
  end

  IAudioEndpointVolumeEx_GUID = "66e11784-f695-4f28-a505-a7080081a78f"
  IID_IAudioEndpointVolumeEx = LibC::GUID.new(0x66e11784_u32, 0xf695_u16, 0x4f28_u16, StaticArray[0xa5_u8, 0x5_u8, 0xa7_u8, 0x8_u8, 0x0_u8, 0x81_u8, 0xa7_u8, 0x8f_u8])
  struct IAudioEndpointVolumeEx
    lpVtbl : IAudioEndpointVolumeExVTbl*
  end

  struct IAudioMeterInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_peak_value : UInt64
    get_metering_channel_count : UInt64
    get_channels_peak_values : UInt64
    query_hardware_support : UInt64
  end

  IAudioMeterInformation_GUID = "c02216f6-8c67-4b5b-9d00-d008e73e0064"
  IID_IAudioMeterInformation = LibC::GUID.new(0xc02216f6_u32, 0x8c67_u16, 0x4b5b_u16, StaticArray[0x9d_u8, 0x0_u8, 0xd0_u8, 0x8_u8, 0xe7_u8, 0x3e_u8, 0x0_u8, 0x64_u8])
  struct IAudioMeterInformation
    lpVtbl : IAudioMeterInformationVTbl*
  end

end
struct LibWin32::IAudioEndpointFormatControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset_to_default(resetflags : UInt32) : HRESULT
    @lpVtbl.value.reset_to_default.unsafe_as(Proc(UInt32, HRESULT)).call(resetflags)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamVolume
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_volume_channel_count(pu32channelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_channel_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pu32channelcount)
  end
  def set_channel_volumes(u32channelcount : UInt32, pf32volumes : Float32*, u32curvetype : AUDIO_CURVE_TYPE, pcurveduration : Int64*) : HRESULT
    @lpVtbl.value.set_channel_volumes.unsafe_as(Proc(UInt32, Float32*, AUDIO_CURVE_TYPE, Int64*, HRESULT)).call(u32channelcount, pf32volumes, u32curvetype, pcurveduration)
  end
  def get_channel_volumes(u32channelcount : UInt32, pf32volumes : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volumes.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(u32channelcount, pf32volumes)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamMute
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_mute(bmuted : UInt8) : HRESULT
    @lpVtbl.value.set_mute.unsafe_as(Proc(UInt8, HRESULT)).call(bmuted)
  end
  def get_mute(pbmuted : UInt8*) : HRESULT
    @lpVtbl.value.get_mute.unsafe_as(Proc(UInt8*, HRESULT)).call(pbmuted)
  end
end
struct LibWin32::IAudioEndpointOffloadStreamMeter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_meter_channel_count(pu32channelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_meter_channel_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pu32channelcount)
  end
  def get_metering_data(u32channelcount : UInt32, pf32peakvalues : Float32*) : HRESULT
    @lpVtbl.value.get_metering_data.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(u32channelcount, pf32peakvalues)
  end
end
struct LibWin32::IAudioEndpointLastBufferControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_last_buffer_control_supported : LibC::BOOL
    @lpVtbl.value.is_last_buffer_control_supported.unsafe_as(Proc(LibC::BOOL)).call
  end
  def release_output_data_pointer_for_last_buffer(pconnectionproperty : APO_CONNECTION_PROPERTY*) : Void
    @lpVtbl.value.release_output_data_pointer_for_last_buffer.unsafe_as(Proc(APO_CONNECTION_PROPERTY*, Void)).call(pconnectionproperty)
  end
end
struct LibWin32::IAudioLfxControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_local_effects_state(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_local_effects_state.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def get_local_effects_state(pbenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_local_effects_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbenabled)
  end
end
struct LibWin32::IHardwareAudioEngineBase
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_available_offload_connector_count(pwstrdeviceid : LibC::LPWSTR, uconnectorid : UInt32, pavailableconnectorinstancecount : UInt32*) : HRESULT
    @lpVtbl.value.get_available_offload_connector_count.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32*, HRESULT)).call(pwstrdeviceid, uconnectorid, pavailableconnectorinstancecount)
  end
  def get_engine_format(pdevice : IMMDevice, brequestdeviceformat : LibC::BOOL, ppwfxformat : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_engine_format.unsafe_as(Proc(IMMDevice, LibC::BOOL, WAVEFORMATEX**, HRESULT)).call(pdevice, brequestdeviceformat, ppwfxformat)
  end
  def set_engine_device_format(pdevice : IMMDevice, pwfxformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_engine_device_format.unsafe_as(Proc(IMMDevice, WAVEFORMATEX*, HRESULT)).call(pdevice, pwfxformat)
  end
  def set_gfx_state(pdevice : IMMDevice, benable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_gfx_state.unsafe_as(Proc(IMMDevice, LibC::BOOL, HRESULT)).call(pdevice, benable)
  end
  def get_gfx_state(pdevice : IMMDevice, pbenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_gfx_state.unsafe_as(Proc(IMMDevice, LibC::BOOL*, HRESULT)).call(pdevice, pbenable)
  end
end
struct LibWin32::IAudioEndpointVolumeCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_notify(pnotify : AUDIO_VOLUME_NOTIFICATION_DATA*) : HRESULT
    @lpVtbl.value.on_notify.unsafe_as(Proc(AUDIO_VOLUME_NOTIFICATION_DATA*, HRESULT)).call(pnotify)
  end
end
struct LibWin32::IAudioEndpointVolume
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_control_change_notify(pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.register_control_change_notify.unsafe_as(Proc(IAudioEndpointVolumeCallback, HRESULT)).call(pnotify)
  end
  def unregister_control_change_notify(pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.unregister_control_change_notify.unsafe_as(Proc(IAudioEndpointVolumeCallback, HRESULT)).call(pnotify)
  end
  def get_channel_count(pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnchannelcount)
  end
  def set_master_volume_level(fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level.unsafe_as(Proc(Float32, Guid*, HRESULT)).call(fleveldb, pguideventcontext)
  end
  def set_master_volume_level_scalar(flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level_scalar.unsafe_as(Proc(Float32, Guid*, HRESULT)).call(flevel, pguideventcontext)
  end
  def get_master_volume_level(pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level.unsafe_as(Proc(Float32*, HRESULT)).call(pfleveldb)
  end
  def get_master_volume_level_scalar(pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level_scalar.unsafe_as(Proc(Float32*, HRESULT)).call(pflevel)
  end
  def set_channel_volume_level(nchannel : UInt32, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level.unsafe_as(Proc(UInt32, Float32, Guid*, HRESULT)).call(nchannel, fleveldb, pguideventcontext)
  end
  def set_channel_volume_level_scalar(nchannel : UInt32, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level_scalar.unsafe_as(Proc(UInt32, Float32, Guid*, HRESULT)).call(nchannel, flevel, pguideventcontext)
  end
  def get_channel_volume_level(nchannel : UInt32, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(nchannel, pfleveldb)
  end
  def get_channel_volume_level_scalar(nchannel : UInt32, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level_scalar.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(nchannel, pflevel)
  end
  def set_mute(bmute : LibC::BOOL, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_mute.unsafe_as(Proc(LibC::BOOL, Guid*, HRESULT)).call(bmute, pguideventcontext)
  end
  def get_mute(pbmute : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_mute.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmute)
  end
  def get_volume_step_info(pnstep : UInt32*, pnstepcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_step_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pnstep, pnstepcount)
  end
  def volume_step_up(pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_up.unsafe_as(Proc(Guid*, HRESULT)).call(pguideventcontext)
  end
  def volume_step_down(pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_down.unsafe_as(Proc(Guid*, HRESULT)).call(pguideventcontext)
  end
  def query_hardware_support(pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhardwaresupportmask)
  end
  def get_volume_range(pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range.unsafe_as(Proc(Float32*, Float32*, Float32*, HRESULT)).call(pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
end
struct LibWin32::IAudioEndpointVolumeEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_control_change_notify(pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.register_control_change_notify.unsafe_as(Proc(IAudioEndpointVolumeCallback, HRESULT)).call(pnotify)
  end
  def unregister_control_change_notify(pnotify : IAudioEndpointVolumeCallback) : HRESULT
    @lpVtbl.value.unregister_control_change_notify.unsafe_as(Proc(IAudioEndpointVolumeCallback, HRESULT)).call(pnotify)
  end
  def get_channel_count(pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnchannelcount)
  end
  def set_master_volume_level(fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level.unsafe_as(Proc(Float32, Guid*, HRESULT)).call(fleveldb, pguideventcontext)
  end
  def set_master_volume_level_scalar(flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_master_volume_level_scalar.unsafe_as(Proc(Float32, Guid*, HRESULT)).call(flevel, pguideventcontext)
  end
  def get_master_volume_level(pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level.unsafe_as(Proc(Float32*, HRESULT)).call(pfleveldb)
  end
  def get_master_volume_level_scalar(pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_master_volume_level_scalar.unsafe_as(Proc(Float32*, HRESULT)).call(pflevel)
  end
  def set_channel_volume_level(nchannel : UInt32, fleveldb : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level.unsafe_as(Proc(UInt32, Float32, Guid*, HRESULT)).call(nchannel, fleveldb, pguideventcontext)
  end
  def set_channel_volume_level_scalar(nchannel : UInt32, flevel : Float32, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_channel_volume_level_scalar.unsafe_as(Proc(UInt32, Float32, Guid*, HRESULT)).call(nchannel, flevel, pguideventcontext)
  end
  def get_channel_volume_level(nchannel : UInt32, pfleveldb : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(nchannel, pfleveldb)
  end
  def get_channel_volume_level_scalar(nchannel : UInt32, pflevel : Float32*) : HRESULT
    @lpVtbl.value.get_channel_volume_level_scalar.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(nchannel, pflevel)
  end
  def set_mute(bmute : LibC::BOOL, pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.set_mute.unsafe_as(Proc(LibC::BOOL, Guid*, HRESULT)).call(bmute, pguideventcontext)
  end
  def get_mute(pbmute : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_mute.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmute)
  end
  def get_volume_step_info(pnstep : UInt32*, pnstepcount : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_step_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pnstep, pnstepcount)
  end
  def volume_step_up(pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_up.unsafe_as(Proc(Guid*, HRESULT)).call(pguideventcontext)
  end
  def volume_step_down(pguideventcontext : Guid*) : HRESULT
    @lpVtbl.value.volume_step_down.unsafe_as(Proc(Guid*, HRESULT)).call(pguideventcontext)
  end
  def query_hardware_support(pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhardwaresupportmask)
  end
  def get_volume_range(pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range.unsafe_as(Proc(Float32*, Float32*, Float32*, HRESULT)).call(pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
  def get_volume_range_channel(ichannel : UInt32, pflvolumemindb : Float32*, pflvolumemaxdb : Float32*, pflvolumeincrementdb : Float32*) : HRESULT
    @lpVtbl.value.get_volume_range_channel.unsafe_as(Proc(UInt32, Float32*, Float32*, Float32*, HRESULT)).call(ichannel, pflvolumemindb, pflvolumemaxdb, pflvolumeincrementdb)
  end
end
struct LibWin32::IAudioMeterInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_peak_value(pfpeak : Float32*) : HRESULT
    @lpVtbl.value.get_peak_value.unsafe_as(Proc(Float32*, HRESULT)).call(pfpeak)
  end
  def get_metering_channel_count(pnchannelcount : UInt32*) : HRESULT
    @lpVtbl.value.get_metering_channel_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnchannelcount)
  end
  def get_channels_peak_values(u32channelcount : UInt32, afpeakvalues : Float32*) : HRESULT
    @lpVtbl.value.get_channels_peak_values.unsafe_as(Proc(UInt32, Float32*, HRESULT)).call(u32channelcount, afpeakvalues)
  end
  def query_hardware_support(pdwhardwaresupportmask : UInt32*) : HRESULT
    @lpVtbl.value.query_hardware_support.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhardwaresupportmask)
  end
end
