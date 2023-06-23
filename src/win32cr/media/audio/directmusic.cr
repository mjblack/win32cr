require "../../media/audio.cr"
require "../../foundation.cr"
require "../../system/com.cr"
require "../../media.cr"
require "../../media/audio/directsound.cr"
require "../../system/io.cr"
require "../../media/multimedia.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  DMUS_MAX_DESCRIPTION = 128_u32
  DMUS_MAX_DRIVER = 128_u32
  DMUS_EFFECT_NONE = 0_u32
  DMUS_EFFECT_REVERB = 1_u32
  DMUS_EFFECT_CHORUS = 2_u32
  DMUS_EFFECT_DELAY = 4_u32
  DMUS_PC_INPUTCLASS = 0_u32
  DMUS_PC_OUTPUTCLASS = 1_u32
  DMUS_PC_DLS = 1_u32
  DMUS_PC_EXTERNAL = 2_u32
  DMUS_PC_SOFTWARESYNTH = 4_u32
  DMUS_PC_MEMORYSIZEFIXED = 8_u32
  DMUS_PC_GMINHARDWARE = 16_u32
  DMUS_PC_GSINHARDWARE = 32_u32
  DMUS_PC_XGINHARDWARE = 64_u32
  DMUS_PC_DIRECTSOUND = 128_u32
  DMUS_PC_SHAREABLE = 256_u32
  DMUS_PC_DLS2 = 512_u32
  DMUS_PC_AUDIOPATH = 1024_u32
  DMUS_PC_WAVE = 2048_u32
  DMUS_PC_SYSTEMMEMORY = 2147483647_u32
  DMUS_PORT_WINMM_DRIVER = 0_u32
  DMUS_PORT_USER_MODE_SYNTH = 1_u32
  DMUS_PORT_KERNEL_MODE = 2_u32
  DMUS_PORTPARAMS_VOICES = 1_u32
  DMUS_PORTPARAMS_CHANNELGROUPS = 2_u32
  DMUS_PORTPARAMS_AUDIOCHANNELS = 4_u32
  DMUS_PORTPARAMS_SAMPLERATE = 8_u32
  DMUS_PORTPARAMS_EFFECTS = 32_u32
  DMUS_PORTPARAMS_SHARE = 64_u32
  DMUS_PORTPARAMS_FEATURES = 128_u32
  DMUS_PORT_FEATURE_AUDIOPATH = 1_u32
  DMUS_PORT_FEATURE_STREAMING = 2_u32
  DMUS_SYNTHSTATS_VOICES = 1_u32
  DMUS_SYNTHSTATS_TOTAL_CPU = 2_u32
  DMUS_SYNTHSTATS_CPU_PER_VOICE = 4_u32
  DMUS_SYNTHSTATS_LOST_NOTES = 8_u32
  DMUS_SYNTHSTATS_PEAK_VOLUME = 16_u32
  DMUS_SYNTHSTATS_FREE_MEMORY = 32_u32
  DMUS_SYNTHSTATS_SYSTEMMEMORY = 2147483647_u32
  DMUS_CLOCKF_GLOBAL = 1_u32
  DSBUSID_FIRST_SPKR_LOC = 0_u32
  DSBUSID_FRONT_LEFT = 0_u32
  DSBUSID_LEFT = 0_u32
  DSBUSID_FRONT_RIGHT = 1_u32
  DSBUSID_RIGHT = 1_u32
  DSBUSID_FRONT_CENTER = 2_u32
  DSBUSID_LOW_FREQUENCY = 3_u32
  DSBUSID_BACK_LEFT = 4_u32
  DSBUSID_BACK_RIGHT = 5_u32
  DSBUSID_FRONT_LEFT_OF_CENTER = 6_u32
  DSBUSID_FRONT_RIGHT_OF_CENTER = 7_u32
  DSBUSID_BACK_CENTER = 8_u32
  DSBUSID_SIDE_LEFT = 9_u32
  DSBUSID_SIDE_RIGHT = 10_u32
  DSBUSID_TOP_CENTER = 11_u32
  DSBUSID_TOP_FRONT_LEFT = 12_u32
  DSBUSID_TOP_FRONT_CENTER = 13_u32
  DSBUSID_TOP_FRONT_RIGHT = 14_u32
  DSBUSID_TOP_BACK_LEFT = 15_u32
  DSBUSID_TOP_BACK_CENTER = 16_u32
  DSBUSID_TOP_BACK_RIGHT = 17_u32
  DSBUSID_LAST_SPKR_LOC = 17_u32
  DSBUSID_REVERB_SEND = 64_u32
  DSBUSID_CHORUS_SEND = 65_u32
  DSBUSID_DYNAMIC_0 = 512_u32
  DSBUSID_NULL = 4294967295_u32
  DAUD_CRITICAL_VOICE_PRIORITY = 4026531840_u32
  DAUD_HIGH_VOICE_PRIORITY = 3221225472_u32
  DAUD_STANDARD_VOICE_PRIORITY = 2147483648_u32
  DAUD_LOW_VOICE_PRIORITY = 1073741824_u32
  DAUD_PERSIST_VOICE_PRIORITY = 268435456_u32
  DAUD_CHAN1_VOICE_PRIORITY_OFFSET = 14_u32
  DAUD_CHAN2_VOICE_PRIORITY_OFFSET = 13_u32
  DAUD_CHAN3_VOICE_PRIORITY_OFFSET = 12_u32
  DAUD_CHAN4_VOICE_PRIORITY_OFFSET = 11_u32
  DAUD_CHAN5_VOICE_PRIORITY_OFFSET = 10_u32
  DAUD_CHAN6_VOICE_PRIORITY_OFFSET = 9_u32
  DAUD_CHAN7_VOICE_PRIORITY_OFFSET = 8_u32
  DAUD_CHAN8_VOICE_PRIORITY_OFFSET = 7_u32
  DAUD_CHAN9_VOICE_PRIORITY_OFFSET = 6_u32
  DAUD_CHAN10_VOICE_PRIORITY_OFFSET = 15_u32
  DAUD_CHAN11_VOICE_PRIORITY_OFFSET = 5_u32
  DAUD_CHAN12_VOICE_PRIORITY_OFFSET = 4_u32
  DAUD_CHAN13_VOICE_PRIORITY_OFFSET = 3_u32
  DAUD_CHAN14_VOICE_PRIORITY_OFFSET = 2_u32
  DAUD_CHAN15_VOICE_PRIORITY_OFFSET = 1_u32
  DAUD_CHAN16_VOICE_PRIORITY_OFFSET = 0_u32
  CLSID_DirectMusic = "636b9f10-0c7d-11d1-95b2-0020afdc7421"
  CLSID_DirectMusicCollection = "480ff4b0-28b2-11d1-bef7-00c04fbf8fef"
  CLSID_DirectMusicSynth = "58c2b4d0-46e7-11d1-89ac-00a0c9054129"
  GUID_DMUS_PROP_GM_Hardware = "178f2f24-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_GS_Hardware = "178f2f25-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_XG_Hardware = "178f2f26-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_XG_Capable = "6496aba1-61b0-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_GS_Capable = "6496aba2-61b0-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_DLS1 = "178f2f27-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_DLS2 = "f14599e5-4689-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_INSTRUMENT2 = "865fd372-9f67-11d2-872a-00600893b1bd"
  GUID_DMUS_PROP_SynthSink_DSOUND = "0aa97844-c877-11d1-870c-00600893b1bd"
  GUID_DMUS_PROP_SynthSink_WAVE = "0aa97845-c877-11d1-870c-00600893b1bd"
  GUID_DMUS_PROP_SampleMemorySize = "178f2f28-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_SamplePlaybackRate = "2a91f713-a4bf-11d2-bbdf-00600833dbd8"
  GUID_DMUS_PROP_WriteLatency = "268a0fa0-60f2-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_WritePeriod = "268a0fa1-60f2-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_MemorySize = "178f2f28-c364-11d1-a760-0000f875ac12"
  GUID_DMUS_PROP_WavesReverb = "04cb5622-32e5-11d2-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_Effects = "cda8d611-684a-11d2-871e-00600893b1bd"
  GUID_DMUS_PROP_LegacyCaps = "cfa7cdc2-00a1-11d2-aad5-0000f875ac12"
  GUID_DMUS_PROP_Volume = "fedfae25-e46e-11d1-aace-0000f875ac12"
  DMUS_VOLUME_MAX = 2000_u32
  DMUS_VOLUME_MIN = -20000_i32
  DMUS_EVENT_STRUCTURED = 1_u32
  DMUS_DOWNLOADINFO_INSTRUMENT = 1_u32
  DMUS_DOWNLOADINFO_WAVE = 2_u32
  DMUS_DOWNLOADINFO_INSTRUMENT2 = 3_u32
  DMUS_DOWNLOADINFO_WAVEARTICULATION = 4_u32
  DMUS_DOWNLOADINFO_STREAMINGWAVE = 5_u32
  DMUS_DOWNLOADINFO_ONESHOTWAVE = 6_u32
  DMUS_DEFAULT_SIZE_OFFSETTABLE = 1_u32
  DMUS_INSTRUMENT_GM_INSTRUMENT = 1_u32
  DMUS_MIN_DATA_SIZE = 4_u32
  CONN_SRC_NONE = 0_u32
  CONN_SRC_LFO = 1_u32
  CONN_SRC_KEYONVELOCITY = 2_u32
  CONN_SRC_KEYNUMBER = 3_u32
  CONN_SRC_EG1 = 4_u32
  CONN_SRC_EG2 = 5_u32
  CONN_SRC_PITCHWHEEL = 6_u32
  CONN_SRC_CC1 = 129_u32
  CONN_SRC_CC7 = 135_u32
  CONN_SRC_CC10 = 138_u32
  CONN_SRC_CC11 = 139_u32
  CONN_DST_NONE = 0_u32
  CONN_DST_ATTENUATION = 1_u32
  CONN_DST_PITCH = 3_u32
  CONN_DST_PAN = 4_u32
  CONN_DST_LFO_FREQUENCY = 260_u32
  CONN_DST_LFO_STARTDELAY = 261_u32
  CONN_DST_EG1_ATTACKTIME = 518_u32
  CONN_DST_EG1_DECAYTIME = 519_u32
  CONN_DST_EG1_RELEASETIME = 521_u32
  CONN_DST_EG1_SUSTAINLEVEL = 522_u32
  CONN_DST_EG2_ATTACKTIME = 778_u32
  CONN_DST_EG2_DECAYTIME = 779_u32
  CONN_DST_EG2_RELEASETIME = 781_u32
  CONN_DST_EG2_SUSTAINLEVEL = 782_u32
  CONN_TRN_NONE = 0_u32
  CONN_TRN_CONCAVE = 1_u32
  F_INSTRUMENT_DRUMS = 2147483648_u32
  F_RGN_OPTION_SELFNONEXCLUSIVE = 1_u32
  WAVELINK_CHANNEL_LEFT = 1_i32
  WAVELINK_CHANNEL_RIGHT = 2_i32
  F_WAVELINK_PHASE_MASTER = 1_u32
  POOL_CUE_NULL = -1_i32
  F_WSMP_NO_TRUNCATION = 1_i32
  F_WSMP_NO_COMPRESSION = 2_i32
  WLOOP_TYPE_FORWARD = 0_u32
  CONN_SRC_POLYPRESSURE = 7_u32
  CONN_SRC_CHANNELPRESSURE = 8_u32
  CONN_SRC_VIBRATO = 9_u32
  CONN_SRC_MONOPRESSURE = 10_u32
  CONN_SRC_CC91 = 219_u32
  CONN_SRC_CC93 = 221_u32
  CONN_DST_GAIN = 1_u32
  CONN_DST_KEYNUMBER = 5_u32
  CONN_DST_LEFT = 16_u32
  CONN_DST_RIGHT = 17_u32
  CONN_DST_CENTER = 18_u32
  CONN_DST_LEFTREAR = 19_u32
  CONN_DST_RIGHTREAR = 20_u32
  CONN_DST_LFE_CHANNEL = 21_u32
  CONN_DST_CHORUS = 128_u32
  CONN_DST_REVERB = 129_u32
  CONN_DST_VIB_FREQUENCY = 276_u32
  CONN_DST_VIB_STARTDELAY = 277_u32
  CONN_DST_EG1_DELAYTIME = 523_u32
  CONN_DST_EG1_HOLDTIME = 524_u32
  CONN_DST_EG1_SHUTDOWNTIME = 525_u32
  CONN_DST_EG2_DELAYTIME = 783_u32
  CONN_DST_EG2_HOLDTIME = 784_u32
  CONN_DST_FILTER_CUTOFF = 1280_u32
  CONN_DST_FILTER_Q = 1281_u32
  CONN_TRN_CONVEX = 2_u32
  CONN_TRN_SWITCH = 3_u32
  DLS_CDL_AND = 1_u32
  DLS_CDL_OR = 2_u32
  DLS_CDL_XOR = 3_u32
  DLS_CDL_ADD = 4_u32
  DLS_CDL_SUBTRACT = 5_u32
  DLS_CDL_MULTIPLY = 6_u32
  DLS_CDL_DIVIDE = 7_u32
  DLS_CDL_LOGICAL_AND = 8_u32
  DLS_CDL_LOGICAL_OR = 9_u32
  DLS_CDL_LT = 10_u32
  DLS_CDL_LE = 11_u32
  DLS_CDL_GT = 12_u32
  DLS_CDL_GE = 13_u32
  DLS_CDL_EQ = 14_u32
  DLS_CDL_NOT = 15_u32
  DLS_CDL_CONST = 16_u32
  DLS_CDL_QUERY = 17_u32
  DLS_CDL_QUERYSUPPORTED = 18_u32
  WLOOP_TYPE_RELEASE = 2_u32
  F_WAVELINK_MULTICHANNEL = 2_u32
  DLSID_GMInHardware = "178f2f24-c364-11d1-a760-0000f875ac12"
  DLSID_GSInHardware = "178f2f25-c364-11d1-a760-0000f875ac12"
  DLSID_XGInHardware = "178f2f26-c364-11d1-a760-0000f875ac12"
  DLSID_SupportsDLS1 = "178f2f27-c364-11d1-a760-0000f875ac12"
  DLSID_SupportsDLS2 = "f14599e5-4689-11d2-afa6-00aa0024d8b6"
  DLSID_SampleMemorySize = "178f2f28-c364-11d1-a760-0000f875ac12"
  DLSID_ManufacturersID = "b03e1181-8095-11d2-a1ef-00600833dbd8"
  DLSID_ProductID = "b03e1182-8095-11d2-a1ef-00600833dbd8"
  DLSID_SamplePlaybackRate = "2a91f713-a4bf-11d2-bbdf-00600833dbd8"
  REFRESH_F_LASTBUFFER = 1_u32
  CLSID_DirectMusicSynthSink = "aec17ce3-a514-11d1-afa6-00aa0024d8b6"
  GUID_DMUS_PROP_SetSynthSink = "0a3a5ba5-37b6-11d2-b9f9-0000f875ac12"
  GUID_DMUS_PROP_SinkUsesDSound = "be208857-8952-11d2-ba1c-0000f875ac12"
  CLSID_DirectSoundPrivate = "11ab3ec0-25ec-11d1-a4d8-00c04fc28aca"
  DSPROPSETID_DirectSoundDevice = "84624f82-25ec-11d1-a4d8-00c04fc28aca"
  DV_DVSD_NTSC_FRAMESIZE = 120000_i32
  DV_DVSD_PAL_FRAMESIZE = 144000_i32
  DV_SMCHN = 57344_u32
  DV_AUDIOMODE = 3840_u32
  DV_AUDIOSMP = 939524096_u32
  DV_AUDIOQU = 117440512_u32
  DV_NTSCPAL = 2097152_u32
  DV_STYPE = 2031616_u32
  DV_NTSC = 0_u32
  DV_PAL = 1_u32
  DV_SD = 0_u32
  DV_HD = 1_u32
  DV_SL = 2_u32
  DV_CAP_AUD16Bits = 0_u32
  DV_CAP_AUD12Bits = 1_u32
  SIZE_DVINFO = 32_u32

  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 = Proc(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA*, Void*, LibC::BOOL)
  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA = Proc(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA*, Void*, LibC::BOOL)
  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW = Proc(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA*, Void*, LibC::BOOL)


  enum DMUS_CLOCKTYPE : Int32
    DMUS_CLOCK_SYSTEM = 0
    DMUS_CLOCK_WAVE = 1
  end

  enum DSPROPERTY_DIRECTSOUNDDEVICE : Int32
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A = 1
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1 = 2
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1 = 3
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W = 4
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A = 5
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W = 6
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A = 7
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W = 8
  end

  enum DIRECTSOUNDDEVICE_TYPE : Int32
    DIRECTSOUNDDEVICE_TYPE_EMULATED = 0
    DIRECTSOUNDDEVICE_TYPE_VXD = 1
    DIRECTSOUNDDEVICE_TYPE_WDM = 2
  end

  enum DIRECTSOUNDDEVICE_DATAFLOW : Int32
    DIRECTSOUNDDEVICE_DATAFLOW_RENDER = 0
    DIRECTSOUNDDEVICE_DATAFLOW_CAPTURE = 1
  end

  struct DLSID
    ul_data1 : UInt32
    us_data2 : UInt16
    us_data3 : UInt16
    ab_data4 : UInt8[8]*
  end
  struct DLSVERSION
    dw_version_ms : UInt32
    dw_version_ls : UInt32
  end
  struct CONNECTION
    us_source : UInt16
    us_control : UInt16
    us_destination : UInt16
    us_transform : UInt16
    l_scale : Int32
  end
  struct CONNECTIONLIST
    cb_size : UInt32
    c_connections : UInt32
  end
  struct RGNRANGE
    us_low : UInt16
    us_high : UInt16
  end
  struct MIDILOCALE
    ul_bank : UInt32
    ul_instrument : UInt32
  end
  struct RGNHEADER
    range_key : RGNRANGE
    range_velocity : RGNRANGE
    fus_options : UInt16
    us_key_group : UInt16
  end
  struct INSTHEADER
    c_regions : UInt32
    locale : MIDILOCALE
  end
  struct DLSHEADER
    c_instruments : UInt32
  end
  struct WAVELINK
    fus_options : UInt16
    us_phase_group : UInt16
    ul_channel : UInt32
    ul_table_index : UInt32
  end
  struct POOLCUE
    ul_offset : UInt32
  end
  struct POOLTABLE
    cb_size : UInt32
    c_cues : UInt32
  end
  struct Rwsmp
    cb_size : UInt32
    us_unity_note : UInt16
    s_fine_tune : Int16
    l_attenuation : Int32
    ful_options : UInt32
    c_sample_loops : UInt32
  end
  struct Rloop
    cb_size : UInt32
    ul_type : UInt32
    ul_start : UInt32
    ul_length : UInt32
  end
  struct DMUS_DOWNLOADINFO
    dw_dl_type : UInt32
    dw_dl_id : UInt32
    dw_num_offset_table_entries : UInt32
    cb_size : UInt32
  end
  struct DMUS_OFFSETTABLE
    ul_offset_table : UInt32[0]*
  end
  struct DMUS_INSTRUMENT
    ul_patch : UInt32
    ul_first_region_idx : UInt32
    ul_global_art_idx : UInt32
    ul_first_ext_ck_idx : UInt32
    ul_copyright_idx : UInt32
    ul_flags : UInt32
  end
  struct DMUS_REGION
    range_key : RGNRANGE
    range_velocity : RGNRANGE
    fus_options : UInt16
    us_key_group : UInt16
    ul_region_art_idx : UInt32
    ul_next_region_idx : UInt32
    ul_first_ext_ck_idx : UInt32
    wave_link : WAVELINK
    wsmp : Rwsmp
    wloop : Rloop[0]*
  end
  struct DMUS_LFOPARAMS
    pc_frequency : Int32
    tc_delay : Int32
    gc_volume_scale : Int32
    pc_pitch_scale : Int32
    gc_mw_to_volume : Int32
    pc_mw_to_pitch : Int32
  end
  struct DMUS_VEGPARAMS
    tc_attack : Int32
    tc_decay : Int32
    pt_sustain : Int32
    tc_release : Int32
    tc_vel2_attack : Int32
    tc_key2_decay : Int32
  end
  struct DMUS_PEGPARAMS
    tc_attack : Int32
    tc_decay : Int32
    pt_sustain : Int32
    tc_release : Int32
    tc_vel2_attack : Int32
    tc_key2_decay : Int32
    pc_range : Int32
  end
  struct DMUS_MSCPARAMS
    pt_default_pan : Int32
  end
  struct DMUS_ARTICPARAMS
    lfo : DMUS_LFOPARAMS
    vol_eg : DMUS_VEGPARAMS
    pitch_eg : DMUS_PEGPARAMS
    misc : DMUS_MSCPARAMS
  end
  struct DMUS_ARTICULATION
    ul_art1_idx : UInt32
    ul_first_ext_ck_idx : UInt32
  end
  struct DMUS_ARTICULATION2
    ul_art_idx : UInt32
    ul_first_ext_ck_idx : UInt32
    ul_next_art_idx : UInt32
  end
  struct DMUS_EXTENSIONCHUNK
    cb_size : UInt32
    ul_next_ext_ck_idx : UInt32
    ext_ck_id : UInt32
    by_ext_ck : UInt8[4]*
  end
  struct DMUS_COPYRIGHT
    cb_size : UInt32
    by_copyright : UInt8[4]*
  end
  struct DMUS_WAVEDATA
    cb_size : UInt32
    by_data : UInt8[4]*
  end
  struct DMUS_WAVE
    ul_first_ext_ck_idx : UInt32
    ul_copyright_idx : UInt32
    ul_wave_data_idx : UInt32
    waveformat_ex : WAVEFORMATEX
  end
  struct DMUS_NOTERANGE
    dw_low_note : UInt32
    dw_high_note : UInt32
  end
  struct DMUS_WAVEARTDL
    ul_download_id_idx : UInt32
    ul_bus : UInt32
    ul_buffers : UInt32
    ul_master_dl_id : UInt32
    us_options : UInt16
  end
  struct DMUS_WAVEDL
    cb_wave_data : UInt32
  end
  struct DMUS_EVENTHEADER
    cb_event : UInt32
    dw_channel_group : UInt32
    rt_delta : Int64
    dw_flags : UInt32
  end
  struct DMUS_BUFFERDESC
    dw_size : UInt32
    dw_flags : UInt32
    guid_buffer_format : Guid
    cb_buffer : UInt32
  end
  struct DMUS_PORTCAPS
    dw_size : UInt32
    dw_flags : UInt32
    guid_port : Guid
    dw_class : UInt32
    dw_type : UInt32
    dw_memory_size : UInt32
    dw_max_channel_groups : UInt32
    dw_max_voices : UInt32
    dw_max_audio_channels : UInt32
    dw_effect_flags : UInt32
    wsz_description : Char[128]*
  end
  struct DMUS_PORTPARAMS
    dw_size : UInt32
    dw_valid_params : UInt32
    dw_voices : UInt32
    dw_channel_groups : UInt32
    dw_audio_channels : UInt32
    dw_sample_rate : UInt32
    dw_effect_flags : UInt32
    f_share : LibC::BOOL
  end
  struct DMUS_PORTPARAMS8
    dw_size : UInt32
    dw_valid_params : UInt32
    dw_voices : UInt32
    dw_channel_groups : UInt32
    dw_audio_channels : UInt32
    dw_sample_rate : UInt32
    dw_effect_flags : UInt32
    f_share : LibC::BOOL
    dw_features : UInt32
  end
  struct DMUS_SYNTHSTATS
    dw_size : UInt32
    dw_valid_stats : UInt32
    dw_voices : UInt32
    dw_total_cpu : UInt32
    dw_cpu_per_voice : UInt32
    dw_lost_notes : UInt32
    dw_free_memory : UInt32
    l_peak_volume : Int32
  end
  struct DMUS_SYNTHSTATS8
    dw_size : UInt32
    dw_valid_stats : UInt32
    dw_voices : UInt32
    dw_total_cpu : UInt32
    dw_cpu_per_voice : UInt32
    dw_lost_notes : UInt32
    dw_free_memory : UInt32
    l_peak_volume : Int32
    dw_synth_mem_use : UInt32
  end
  struct DMUS_WAVES_REVERB_PARAMS
    f_in_gain : Float32
    f_reverb_mix : Float32
    f_reverb_time : Float32
    f_high_freq_rt_ratio : Float32
  end
  struct DMUS_CLOCKINFO7
    dw_size : UInt32
    ct_type : DMUS_CLOCKTYPE
    guid_clock : Guid
    wsz_description : Char[128]*
  end
  struct DMUS_CLOCKINFO8
    dw_size : UInt32
    ct_type : DMUS_CLOCKTYPE
    guid_clock : Guid
    wsz_description : Char[128]*
    dw_flags : UInt32
  end
  struct DMUS_VOICE_STATE
    b_exists : LibC::BOOL
    sp_position : UInt64
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A_DATA
    device_name : PSTR
    data_flow : DIRECTSOUNDDEVICE_DATAFLOW
    device_id : Guid
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W_DATA
    device_name : LibC::LPWSTR
    data_flow : DIRECTSOUNDDEVICE_DATAFLOW
    device_id : Guid
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA
    device_id : Guid
    description_a : CHAR[256]*
    description_w : Char[256]*
    module_a : CHAR[260]*
    module_w : Char[260]*
    type : DIRECTSOUNDDEVICE_TYPE
    data_flow : DIRECTSOUNDDEVICE_DATAFLOW
    wave_device_id : UInt32
    devnode : UInt32
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA
    type : DIRECTSOUNDDEVICE_TYPE
    data_flow : DIRECTSOUNDDEVICE_DATAFLOW
    device_id : Guid
    description : PSTR
    module_ : PSTR
    interface : PSTR
    wave_device_id : UInt32
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA
    type : DIRECTSOUNDDEVICE_TYPE
    data_flow : DIRECTSOUNDDEVICE_DATAFLOW
    device_id : Guid
    description : LibC::LPWSTR
    module_ : LibC::LPWSTR
    interface : LibC::LPWSTR
    wave_device_id : UInt32
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1_DATA
    callback : LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1
    context : Void*
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A_DATA
    callback : LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA
    context : Void*
  end
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W_DATA
    callback : LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW
    context : Void*
  end
  struct Tag_DVAudInfo
    b_aud_style : UInt8[2]*
    b_aud_qu : UInt8[2]*
    b_num_aud_pin : UInt8
    w_avg_samples_per_pin_per_frm : UInt16[2]*
    w_blk_mode : UInt16
    w_dif_mode : UInt16
    w_blk_div : UInt16
  end
  struct MDEVICECAPSEX
    cb_size : UInt32
    p_caps : Void*
  end
  struct MIDIOPENDESC
    h_midi : HMIDI
    dw_callback : LibC::UINT_PTR
    dw_instance : LibC::UINT_PTR
    dn_dev_node : LibC::UINT_PTR
    c_ids : UInt32
    rg_ids : MIDIOPENSTRMID[0]*
  end


  struct IDirectMusicVTbl
    query_interface : Proc(IDirectMusic*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusic*, UInt32)
    release : Proc(IDirectMusic*, UInt32)
    enum_port : Proc(IDirectMusic*, UInt32, DMUS_PORTCAPS*, HRESULT)
    create_music_buffer : Proc(IDirectMusic*, DMUS_BUFFERDESC*, IDirectMusicBuffer*, IUnknown, HRESULT)
    create_port : Proc(IDirectMusic*, Guid*, DMUS_PORTPARAMS8*, IDirectMusicPort*, IUnknown, HRESULT)
    enum_master_clock : Proc(IDirectMusic*, UInt32, DMUS_CLOCKINFO8*, HRESULT)
    get_master_clock : Proc(IDirectMusic*, Guid*, IReferenceClock*, HRESULT)
    set_master_clock : Proc(IDirectMusic*, Guid*, HRESULT)
    activate : Proc(IDirectMusic*, LibC::BOOL, HRESULT)
    get_default_port : Proc(IDirectMusic*, Guid*, HRESULT)
    set_direct_sound : Proc(IDirectMusic*, IDirectSound, LibC::HANDLE, HRESULT)
  end

  IDirectMusic_GUID = "6536115a-7b2d-11d2-ba18-0000f875ac12"
  IID_IDirectMusic = LibC::GUID.new(0x6536115a_u32, 0x7b2d_u16, 0x11d2_u16, StaticArray[0xba_u8, 0x18_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
  struct IDirectMusic
    lpVtbl : IDirectMusicVTbl*
  end

  struct IDirectMusic8VTbl
    query_interface : Proc(IDirectMusic8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusic8*, UInt32)
    release : Proc(IDirectMusic8*, UInt32)
    enum_port : Proc(IDirectMusic8*, UInt32, DMUS_PORTCAPS*, HRESULT)
    create_music_buffer : Proc(IDirectMusic8*, DMUS_BUFFERDESC*, IDirectMusicBuffer*, IUnknown, HRESULT)
    create_port : Proc(IDirectMusic8*, Guid*, DMUS_PORTPARAMS8*, IDirectMusicPort*, IUnknown, HRESULT)
    enum_master_clock : Proc(IDirectMusic8*, UInt32, DMUS_CLOCKINFO8*, HRESULT)
    get_master_clock : Proc(IDirectMusic8*, Guid*, IReferenceClock*, HRESULT)
    set_master_clock : Proc(IDirectMusic8*, Guid*, HRESULT)
    activate : Proc(IDirectMusic8*, LibC::BOOL, HRESULT)
    get_default_port : Proc(IDirectMusic8*, Guid*, HRESULT)
    set_direct_sound : Proc(IDirectMusic8*, IDirectSound, LibC::HANDLE, HRESULT)
    set_external_master_clock : Proc(IDirectMusic8*, IReferenceClock, HRESULT)
  end

  IDirectMusic8_GUID = "2d3629f7-813d-4939-8508-f05c6b75fd97"
  IID_IDirectMusic8 = LibC::GUID.new(0x2d3629f7_u32, 0x813d_u16, 0x4939_u16, StaticArray[0x85_u8, 0x8_u8, 0xf0_u8, 0x5c_u8, 0x6b_u8, 0x75_u8, 0xfd_u8, 0x97_u8])
  struct IDirectMusic8
    lpVtbl : IDirectMusic8VTbl*
  end

  struct IDirectMusicBufferVTbl
    query_interface : Proc(IDirectMusicBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicBuffer*, UInt32)
    release : Proc(IDirectMusicBuffer*, UInt32)
    flush : Proc(IDirectMusicBuffer*, HRESULT)
    total_time : Proc(IDirectMusicBuffer*, Int64*, HRESULT)
    pack_structured : Proc(IDirectMusicBuffer*, Int64, UInt32, UInt32, HRESULT)
    pack_unstructured : Proc(IDirectMusicBuffer*, Int64, UInt32, UInt32, UInt8*, HRESULT)
    reset_read_ptr : Proc(IDirectMusicBuffer*, HRESULT)
    get_next_event : Proc(IDirectMusicBuffer*, Int64*, UInt32*, UInt32*, UInt8**, HRESULT)
    get_raw_buffer_ptr : Proc(IDirectMusicBuffer*, UInt8**, HRESULT)
    get_start_time : Proc(IDirectMusicBuffer*, Int64*, HRESULT)
    get_used_bytes : Proc(IDirectMusicBuffer*, UInt32*, HRESULT)
    get_max_bytes : Proc(IDirectMusicBuffer*, UInt32*, HRESULT)
    get_buffer_format : Proc(IDirectMusicBuffer*, Guid*, HRESULT)
    set_start_time : Proc(IDirectMusicBuffer*, Int64, HRESULT)
    set_used_bytes : Proc(IDirectMusicBuffer*, UInt32, HRESULT)
  end

  IDirectMusicBuffer_GUID = "d2ac2878-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicBuffer = LibC::GUID.new(0xd2ac2878_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicBuffer
    lpVtbl : IDirectMusicBufferVTbl*
  end

  struct IDirectMusicInstrumentVTbl
    query_interface : Proc(IDirectMusicInstrument*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicInstrument*, UInt32)
    release : Proc(IDirectMusicInstrument*, UInt32)
    get_patch : Proc(IDirectMusicInstrument*, UInt32*, HRESULT)
    set_patch : Proc(IDirectMusicInstrument*, UInt32, HRESULT)
  end

  IDirectMusicInstrument_GUID = "d2ac287d-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicInstrument = LibC::GUID.new(0xd2ac287d_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicInstrument
    lpVtbl : IDirectMusicInstrumentVTbl*
  end

  struct IDirectMusicDownloadedInstrumentVTbl
    query_interface : Proc(IDirectMusicDownloadedInstrument*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicDownloadedInstrument*, UInt32)
    release : Proc(IDirectMusicDownloadedInstrument*, UInt32)
  end

  IDirectMusicDownloadedInstrument_GUID = "d2ac287e-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicDownloadedInstrument = LibC::GUID.new(0xd2ac287e_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicDownloadedInstrument
    lpVtbl : IDirectMusicDownloadedInstrumentVTbl*
  end

  struct IDirectMusicCollectionVTbl
    query_interface : Proc(IDirectMusicCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicCollection*, UInt32)
    release : Proc(IDirectMusicCollection*, UInt32)
    get_instrument : Proc(IDirectMusicCollection*, UInt32, IDirectMusicInstrument*, HRESULT)
    enum_instrument : Proc(IDirectMusicCollection*, UInt32, UInt32*, LibC::LPWSTR, UInt32, HRESULT)
  end

  IDirectMusicCollection_GUID = "d2ac287c-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicCollection = LibC::GUID.new(0xd2ac287c_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicCollection
    lpVtbl : IDirectMusicCollectionVTbl*
  end

  struct IDirectMusicDownloadVTbl
    query_interface : Proc(IDirectMusicDownload*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicDownload*, UInt32)
    release : Proc(IDirectMusicDownload*, UInt32)
    get_buffer : Proc(IDirectMusicDownload*, Void**, UInt32*, HRESULT)
  end

  IDirectMusicDownload_GUID = "d2ac287b-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicDownload = LibC::GUID.new(0xd2ac287b_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicDownload
    lpVtbl : IDirectMusicDownloadVTbl*
  end

  struct IDirectMusicPortDownloadVTbl
    query_interface : Proc(IDirectMusicPortDownload*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicPortDownload*, UInt32)
    release : Proc(IDirectMusicPortDownload*, UInt32)
    get_buffer : Proc(IDirectMusicPortDownload*, UInt32, IDirectMusicDownload*, HRESULT)
    allocate_buffer : Proc(IDirectMusicPortDownload*, UInt32, IDirectMusicDownload*, HRESULT)
    get_dl_id : Proc(IDirectMusicPortDownload*, UInt32*, UInt32, HRESULT)
    get_append : Proc(IDirectMusicPortDownload*, UInt32*, HRESULT)
    download : Proc(IDirectMusicPortDownload*, IDirectMusicDownload, HRESULT)
    unload : Proc(IDirectMusicPortDownload*, IDirectMusicDownload, HRESULT)
  end

  IDirectMusicPortDownload_GUID = "d2ac287a-b39b-11d1-8704-00600893b1bd"
  IID_IDirectMusicPortDownload = LibC::GUID.new(0xd2ac287a_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
  struct IDirectMusicPortDownload
    lpVtbl : IDirectMusicPortDownloadVTbl*
  end

  struct IDirectMusicPortVTbl
    query_interface : Proc(IDirectMusicPort*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicPort*, UInt32)
    release : Proc(IDirectMusicPort*, UInt32)
    play_buffer : Proc(IDirectMusicPort*, IDirectMusicBuffer, HRESULT)
    set_read_notification_handle : Proc(IDirectMusicPort*, LibC::HANDLE, HRESULT)
    read : Proc(IDirectMusicPort*, IDirectMusicBuffer, HRESULT)
    download_instrument : Proc(IDirectMusicPort*, IDirectMusicInstrument, IDirectMusicDownloadedInstrument*, DMUS_NOTERANGE*, UInt32, HRESULT)
    unload_instrument : Proc(IDirectMusicPort*, IDirectMusicDownloadedInstrument, HRESULT)
    get_latency_clock : Proc(IDirectMusicPort*, IReferenceClock*, HRESULT)
    get_running_stats : Proc(IDirectMusicPort*, DMUS_SYNTHSTATS*, HRESULT)
    compact : Proc(IDirectMusicPort*, HRESULT)
    get_caps : Proc(IDirectMusicPort*, DMUS_PORTCAPS*, HRESULT)
    device_io_control : Proc(IDirectMusicPort*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, OVERLAPPED*, HRESULT)
    set_num_channel_groups : Proc(IDirectMusicPort*, UInt32, HRESULT)
    get_num_channel_groups : Proc(IDirectMusicPort*, UInt32*, HRESULT)
    activate : Proc(IDirectMusicPort*, LibC::BOOL, HRESULT)
    set_channel_priority : Proc(IDirectMusicPort*, UInt32, UInt32, UInt32, HRESULT)
    get_channel_priority : Proc(IDirectMusicPort*, UInt32, UInt32, UInt32*, HRESULT)
    set_direct_sound : Proc(IDirectMusicPort*, IDirectSound, IDirectSoundBuffer, HRESULT)
    get_format : Proc(IDirectMusicPort*, WAVEFORMATEX*, UInt32*, UInt32*, HRESULT)
  end

  IDirectMusicPort_GUID = "08f2d8c9-37c2-11d2-b9f9-0000f875ac12"
  IID_IDirectMusicPort = LibC::GUID.new(0x8f2d8c9_u32, 0x37c2_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0xf9_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
  struct IDirectMusicPort
    lpVtbl : IDirectMusicPortVTbl*
  end

  struct IDirectMusicThruVTbl
    query_interface : Proc(IDirectMusicThru*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicThru*, UInt32)
    release : Proc(IDirectMusicThru*, UInt32)
    thru_channel : Proc(IDirectMusicThru*, UInt32, UInt32, UInt32, UInt32, IDirectMusicPort, HRESULT)
  end

  IDirectMusicThru_GUID = "ced153e7-3606-11d2-b9f9-0000f875ac12"
  IID_IDirectMusicThru = LibC::GUID.new(0xced153e7_u32, 0x3606_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0xf9_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
  struct IDirectMusicThru
    lpVtbl : IDirectMusicThruVTbl*
  end

  struct IDirectMusicSynthVTbl
    query_interface : Proc(IDirectMusicSynth*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicSynth*, UInt32)
    release : Proc(IDirectMusicSynth*, UInt32)
    open : Proc(IDirectMusicSynth*, DMUS_PORTPARAMS8*, HRESULT)
    close : Proc(IDirectMusicSynth*, HRESULT)
    set_num_channel_groups : Proc(IDirectMusicSynth*, UInt32, HRESULT)
    download : Proc(IDirectMusicSynth*, LibC::HANDLE*, Void*, Int32*, HRESULT)
    unload : Proc(IDirectMusicSynth*, LibC::HANDLE, LibC::IntPtrT, LibC::HANDLE, HRESULT)
    play_buffer : Proc(IDirectMusicSynth*, Int64, UInt8*, UInt32, HRESULT)
    get_running_stats : Proc(IDirectMusicSynth*, DMUS_SYNTHSTATS*, HRESULT)
    get_port_caps : Proc(IDirectMusicSynth*, DMUS_PORTCAPS*, HRESULT)
    set_master_clock : Proc(IDirectMusicSynth*, IReferenceClock, HRESULT)
    get_latency_clock : Proc(IDirectMusicSynth*, IReferenceClock*, HRESULT)
    activate : Proc(IDirectMusicSynth*, LibC::BOOL, HRESULT)
    set_synth_sink : Proc(IDirectMusicSynth*, IDirectMusicSynthSink, HRESULT)
    render : Proc(IDirectMusicSynth*, Int16*, UInt32, Int64, HRESULT)
    set_channel_priority : Proc(IDirectMusicSynth*, UInt32, UInt32, UInt32, HRESULT)
    get_channel_priority : Proc(IDirectMusicSynth*, UInt32, UInt32, UInt32*, HRESULT)
    get_format : Proc(IDirectMusicSynth*, WAVEFORMATEX*, UInt32*, HRESULT)
    get_append : Proc(IDirectMusicSynth*, UInt32*, HRESULT)
  end

  IDirectMusicSynth_GUID = "09823661-5c85-11d2-afa6-00aa0024d8b6"
  IID_IDirectMusicSynth = LibC::GUID.new(0x9823661_u32, 0x5c85_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xa6_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x24_u8, 0xd8_u8, 0xb6_u8])
  struct IDirectMusicSynth
    lpVtbl : IDirectMusicSynthVTbl*
  end

  struct IDirectMusicSynth8VTbl
    query_interface : Proc(IDirectMusicSynth8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicSynth8*, UInt32)
    release : Proc(IDirectMusicSynth8*, UInt32)
    open : Proc(IDirectMusicSynth8*, DMUS_PORTPARAMS8*, HRESULT)
    close : Proc(IDirectMusicSynth8*, HRESULT)
    set_num_channel_groups : Proc(IDirectMusicSynth8*, UInt32, HRESULT)
    download : Proc(IDirectMusicSynth8*, LibC::HANDLE*, Void*, Int32*, HRESULT)
    unload : Proc(IDirectMusicSynth8*, LibC::HANDLE, LibC::IntPtrT, LibC::HANDLE, HRESULT)
    play_buffer : Proc(IDirectMusicSynth8*, Int64, UInt8*, UInt32, HRESULT)
    get_running_stats : Proc(IDirectMusicSynth8*, DMUS_SYNTHSTATS*, HRESULT)
    get_port_caps : Proc(IDirectMusicSynth8*, DMUS_PORTCAPS*, HRESULT)
    set_master_clock : Proc(IDirectMusicSynth8*, IReferenceClock, HRESULT)
    get_latency_clock : Proc(IDirectMusicSynth8*, IReferenceClock*, HRESULT)
    activate : Proc(IDirectMusicSynth8*, LibC::BOOL, HRESULT)
    set_synth_sink : Proc(IDirectMusicSynth8*, IDirectMusicSynthSink, HRESULT)
    render : Proc(IDirectMusicSynth8*, Int16*, UInt32, Int64, HRESULT)
    set_channel_priority : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32, HRESULT)
    get_channel_priority : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32*, HRESULT)
    get_format : Proc(IDirectMusicSynth8*, WAVEFORMATEX*, UInt32*, HRESULT)
    get_append : Proc(IDirectMusicSynth8*, UInt32*, HRESULT)
    play_voice : Proc(IDirectMusicSynth8*, Int64, UInt32, UInt32, UInt32, UInt32, Int32, Int32, UInt64, UInt64, UInt64, HRESULT)
    stop_voice : Proc(IDirectMusicSynth8*, Int64, UInt32, HRESULT)
    get_voice_state : Proc(IDirectMusicSynth8*, UInt32*, UInt32, DMUS_VOICE_STATE*, HRESULT)
    refresh : Proc(IDirectMusicSynth8*, UInt32, UInt32, HRESULT)
    assign_channel_to_buses : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32*, UInt32, HRESULT)
  end

  IDirectMusicSynth8_GUID = "53cab625-2711-4c9f-9de7-1b7f925f6fc8"
  IID_IDirectMusicSynth8 = LibC::GUID.new(0x53cab625_u32, 0x2711_u16, 0x4c9f_u16, StaticArray[0x9d_u8, 0xe7_u8, 0x1b_u8, 0x7f_u8, 0x92_u8, 0x5f_u8, 0x6f_u8, 0xc8_u8])
  struct IDirectMusicSynth8
    lpVtbl : IDirectMusicSynth8VTbl*
  end

  struct IDirectMusicSynthSinkVTbl
    query_interface : Proc(IDirectMusicSynthSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectMusicSynthSink*, UInt32)
    release : Proc(IDirectMusicSynthSink*, UInt32)
    init : Proc(IDirectMusicSynthSink*, IDirectMusicSynth, HRESULT)
    set_master_clock : Proc(IDirectMusicSynthSink*, IReferenceClock, HRESULT)
    get_latency_clock : Proc(IDirectMusicSynthSink*, IReferenceClock*, HRESULT)
    activate : Proc(IDirectMusicSynthSink*, LibC::BOOL, HRESULT)
    sample_to_ref_time : Proc(IDirectMusicSynthSink*, Int64, Int64*, HRESULT)
    ref_time_to_sample : Proc(IDirectMusicSynthSink*, Int64, Int64*, HRESULT)
    set_direct_sound : Proc(IDirectMusicSynthSink*, IDirectSound, IDirectSoundBuffer, HRESULT)
    get_desired_buffer_size : Proc(IDirectMusicSynthSink*, UInt32*, HRESULT)
  end

  IDirectMusicSynthSink_GUID = "09823663-5c85-11d2-afa6-00aa0024d8b6"
  IID_IDirectMusicSynthSink = LibC::GUID.new(0x9823663_u32, 0x5c85_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xa6_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x24_u8, 0xd8_u8, 0xb6_u8])
  struct IDirectMusicSynthSink
    lpVtbl : IDirectMusicSynthSinkVTbl*
  end

end
struct LibWin32::IDirectMusic
  def query_interface(this : IDirectMusic*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusic*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusic*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_port(this : IDirectMusic*, dwindex : UInt32, pportcaps : DMUS_PORTCAPS*) : HRESULT
    @lpVtbl.value.enum_port.call(this, dwindex, pportcaps)
  end
  def create_music_buffer(this : IDirectMusic*, pbufferdesc : DMUS_BUFFERDESC*, ppbuffer : IDirectMusicBuffer*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_music_buffer.call(this, pbufferdesc, ppbuffer, punkouter)
  end
  def create_port(this : IDirectMusic*, rclsidport : Guid*, pportparams : DMUS_PORTPARAMS8*, ppport : IDirectMusicPort*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_port.call(this, rclsidport, pportparams, ppport, punkouter)
  end
  def enum_master_clock(this : IDirectMusic*, dwindex : UInt32, lpclockinfo : DMUS_CLOCKINFO8*) : HRESULT
    @lpVtbl.value.enum_master_clock.call(this, dwindex, lpclockinfo)
  end
  def get_master_clock(this : IDirectMusic*, pguidclock : Guid*, ppreferenceclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_master_clock.call(this, pguidclock, ppreferenceclock)
  end
  def set_master_clock(this : IDirectMusic*, rguidclock : Guid*) : HRESULT
    @lpVtbl.value.set_master_clock.call(this, rguidclock)
  end
  def activate(this : IDirectMusic*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, fenable)
  end
  def get_default_port(this : IDirectMusic*, pguidport : Guid*) : HRESULT
    @lpVtbl.value.get_default_port.call(this, pguidport)
  end
  def set_direct_sound(this : IDirectMusic*, pdirectsound : IDirectSound, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_direct_sound.call(this, pdirectsound, hwnd)
  end
end
struct LibWin32::IDirectMusic8
  def query_interface(this : IDirectMusic8*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusic8*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusic8*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_port(this : IDirectMusic8*, dwindex : UInt32, pportcaps : DMUS_PORTCAPS*) : HRESULT
    @lpVtbl.value.enum_port.call(this, dwindex, pportcaps)
  end
  def create_music_buffer(this : IDirectMusic8*, pbufferdesc : DMUS_BUFFERDESC*, ppbuffer : IDirectMusicBuffer*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_music_buffer.call(this, pbufferdesc, ppbuffer, punkouter)
  end
  def create_port(this : IDirectMusic8*, rclsidport : Guid*, pportparams : DMUS_PORTPARAMS8*, ppport : IDirectMusicPort*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_port.call(this, rclsidport, pportparams, ppport, punkouter)
  end
  def enum_master_clock(this : IDirectMusic8*, dwindex : UInt32, lpclockinfo : DMUS_CLOCKINFO8*) : HRESULT
    @lpVtbl.value.enum_master_clock.call(this, dwindex, lpclockinfo)
  end
  def get_master_clock(this : IDirectMusic8*, pguidclock : Guid*, ppreferenceclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_master_clock.call(this, pguidclock, ppreferenceclock)
  end
  def set_master_clock(this : IDirectMusic8*, rguidclock : Guid*) : HRESULT
    @lpVtbl.value.set_master_clock.call(this, rguidclock)
  end
  def activate(this : IDirectMusic8*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, fenable)
  end
  def get_default_port(this : IDirectMusic8*, pguidport : Guid*) : HRESULT
    @lpVtbl.value.get_default_port.call(this, pguidport)
  end
  def set_direct_sound(this : IDirectMusic8*, pdirectsound : IDirectSound, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_direct_sound.call(this, pdirectsound, hwnd)
  end
  def set_external_master_clock(this : IDirectMusic8*, pclock : IReferenceClock) : HRESULT
    @lpVtbl.value.set_external_master_clock.call(this, pclock)
  end
end
struct LibWin32::IDirectMusicBuffer
  def query_interface(this : IDirectMusicBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def flush(this : IDirectMusicBuffer*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
  def total_time(this : IDirectMusicBuffer*, prttime : Int64*) : HRESULT
    @lpVtbl.value.total_time.call(this, prttime)
  end
  def pack_structured(this : IDirectMusicBuffer*, rt : Int64, dwchannelgroup : UInt32, dwchannelmessage : UInt32) : HRESULT
    @lpVtbl.value.pack_structured.call(this, rt, dwchannelgroup, dwchannelmessage)
  end
  def pack_unstructured(this : IDirectMusicBuffer*, rt : Int64, dwchannelgroup : UInt32, cb : UInt32, lpb : UInt8*) : HRESULT
    @lpVtbl.value.pack_unstructured.call(this, rt, dwchannelgroup, cb, lpb)
  end
  def reset_read_ptr(this : IDirectMusicBuffer*) : HRESULT
    @lpVtbl.value.reset_read_ptr.call(this)
  end
  def get_next_event(this : IDirectMusicBuffer*, prt : Int64*, pdwchannelgroup : UInt32*, pdwlength : UInt32*, ppdata : UInt8**) : HRESULT
    @lpVtbl.value.get_next_event.call(this, prt, pdwchannelgroup, pdwlength, ppdata)
  end
  def get_raw_buffer_ptr(this : IDirectMusicBuffer*, ppdata : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_buffer_ptr.call(this, ppdata)
  end
  def get_start_time(this : IDirectMusicBuffer*, prt : Int64*) : HRESULT
    @lpVtbl.value.get_start_time.call(this, prt)
  end
  def get_used_bytes(this : IDirectMusicBuffer*, pcb : UInt32*) : HRESULT
    @lpVtbl.value.get_used_bytes.call(this, pcb)
  end
  def get_max_bytes(this : IDirectMusicBuffer*, pcb : UInt32*) : HRESULT
    @lpVtbl.value.get_max_bytes.call(this, pcb)
  end
  def get_buffer_format(this : IDirectMusicBuffer*, pguidformat : Guid*) : HRESULT
    @lpVtbl.value.get_buffer_format.call(this, pguidformat)
  end
  def set_start_time(this : IDirectMusicBuffer*, rt : Int64) : HRESULT
    @lpVtbl.value.set_start_time.call(this, rt)
  end
  def set_used_bytes(this : IDirectMusicBuffer*, cb : UInt32) : HRESULT
    @lpVtbl.value.set_used_bytes.call(this, cb)
  end
end
struct LibWin32::IDirectMusicInstrument
  def query_interface(this : IDirectMusicInstrument*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicInstrument*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicInstrument*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_patch(this : IDirectMusicInstrument*, pdwpatch : UInt32*) : HRESULT
    @lpVtbl.value.get_patch.call(this, pdwpatch)
  end
  def set_patch(this : IDirectMusicInstrument*, dwpatch : UInt32) : HRESULT
    @lpVtbl.value.set_patch.call(this, dwpatch)
  end
end
struct LibWin32::IDirectMusicDownloadedInstrument
  def query_interface(this : IDirectMusicDownloadedInstrument*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicDownloadedInstrument*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicDownloadedInstrument*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDirectMusicCollection
  def query_interface(this : IDirectMusicCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_instrument(this : IDirectMusicCollection*, dwpatch : UInt32, ppinstrument : IDirectMusicInstrument*) : HRESULT
    @lpVtbl.value.get_instrument.call(this, dwpatch, ppinstrument)
  end
  def enum_instrument(this : IDirectMusicCollection*, dwindex : UInt32, pdwpatch : UInt32*, pwszname : LibC::LPWSTR, dwnamelen : UInt32) : HRESULT
    @lpVtbl.value.enum_instrument.call(this, dwindex, pdwpatch, pwszname, dwnamelen)
  end
end
struct LibWin32::IDirectMusicDownload
  def query_interface(this : IDirectMusicDownload*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicDownload*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicDownload*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IDirectMusicDownload*, ppvbuffer : Void**, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, ppvbuffer, pdwsize)
  end
end
struct LibWin32::IDirectMusicPortDownload
  def query_interface(this : IDirectMusicPortDownload*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicPortDownload*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicPortDownload*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IDirectMusicPortDownload*, dwdlid : UInt32, ppidmdownload : IDirectMusicDownload*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, dwdlid, ppidmdownload)
  end
  def allocate_buffer(this : IDirectMusicPortDownload*, dwsize : UInt32, ppidmdownload : IDirectMusicDownload*) : HRESULT
    @lpVtbl.value.allocate_buffer.call(this, dwsize, ppidmdownload)
  end
  def get_dl_id(this : IDirectMusicPortDownload*, pdwstartdlid : UInt32*, dwcount : UInt32) : HRESULT
    @lpVtbl.value.get_dl_id.call(this, pdwstartdlid, dwcount)
  end
  def get_append(this : IDirectMusicPortDownload*, pdwappend : UInt32*) : HRESULT
    @lpVtbl.value.get_append.call(this, pdwappend)
  end
  def download(this : IDirectMusicPortDownload*, pidmdownload : IDirectMusicDownload) : HRESULT
    @lpVtbl.value.download.call(this, pidmdownload)
  end
  def unload(this : IDirectMusicPortDownload*, pidmdownload : IDirectMusicDownload) : HRESULT
    @lpVtbl.value.unload.call(this, pidmdownload)
  end
end
struct LibWin32::IDirectMusicPort
  def query_interface(this : IDirectMusicPort*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicPort*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicPort*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def play_buffer(this : IDirectMusicPort*, pbuffer : IDirectMusicBuffer) : HRESULT
    @lpVtbl.value.play_buffer.call(this, pbuffer)
  end
  def set_read_notification_handle(this : IDirectMusicPort*, hevent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_read_notification_handle.call(this, hevent)
  end
  def read(this : IDirectMusicPort*, pbuffer : IDirectMusicBuffer) : HRESULT
    @lpVtbl.value.read.call(this, pbuffer)
  end
  def download_instrument(this : IDirectMusicPort*, pinstrument : IDirectMusicInstrument, ppdownloadedinstrument : IDirectMusicDownloadedInstrument*, pnoteranges : DMUS_NOTERANGE*, dwnumnoteranges : UInt32) : HRESULT
    @lpVtbl.value.download_instrument.call(this, pinstrument, ppdownloadedinstrument, pnoteranges, dwnumnoteranges)
  end
  def unload_instrument(this : IDirectMusicPort*, pdownloadedinstrument : IDirectMusicDownloadedInstrument) : HRESULT
    @lpVtbl.value.unload_instrument.call(this, pdownloadedinstrument)
  end
  def get_latency_clock(this : IDirectMusicPort*, ppclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_latency_clock.call(this, ppclock)
  end
  def get_running_stats(this : IDirectMusicPort*, pstats : DMUS_SYNTHSTATS*) : HRESULT
    @lpVtbl.value.get_running_stats.call(this, pstats)
  end
  def compact(this : IDirectMusicPort*) : HRESULT
    @lpVtbl.value.compact.call(this)
  end
  def get_caps(this : IDirectMusicPort*, pportcaps : DMUS_PORTCAPS*) : HRESULT
    @lpVtbl.value.get_caps.call(this, pportcaps)
  end
  def device_io_control(this : IDirectMusicPort*, dwiocontrolcode : UInt32, lpinbuffer : Void*, ninbuffersize : UInt32, lpoutbuffer : Void*, noutbuffersize : UInt32, lpbytesreturned : UInt32*, lpoverlapped : OVERLAPPED*) : HRESULT
    @lpVtbl.value.device_io_control.call(this, dwiocontrolcode, lpinbuffer, ninbuffersize, lpoutbuffer, noutbuffersize, lpbytesreturned, lpoverlapped)
  end
  def set_num_channel_groups(this : IDirectMusicPort*, dwchannelgroups : UInt32) : HRESULT
    @lpVtbl.value.set_num_channel_groups.call(this, dwchannelgroups)
  end
  def get_num_channel_groups(this : IDirectMusicPort*, pdwchannelgroups : UInt32*) : HRESULT
    @lpVtbl.value.get_num_channel_groups.call(this, pdwchannelgroups)
  end
  def activate(this : IDirectMusicPort*, factive : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, factive)
  end
  def set_channel_priority(this : IDirectMusicPort*, dwchannelgroup : UInt32, dwchannel : UInt32, dwpriority : UInt32) : HRESULT
    @lpVtbl.value.set_channel_priority.call(this, dwchannelgroup, dwchannel, dwpriority)
  end
  def get_channel_priority(this : IDirectMusicPort*, dwchannelgroup : UInt32, dwchannel : UInt32, pdwpriority : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_priority.call(this, dwchannelgroup, dwchannel, pdwpriority)
  end
  def set_direct_sound(this : IDirectMusicPort*, pdirectsound : IDirectSound, pdirectsoundbuffer : IDirectSoundBuffer) : HRESULT
    @lpVtbl.value.set_direct_sound.call(this, pdirectsound, pdirectsoundbuffer)
  end
  def get_format(this : IDirectMusicPort*, pwaveformatex : WAVEFORMATEX*, pdwwaveformatexsize : UInt32*, pdwbuffersize : UInt32*) : HRESULT
    @lpVtbl.value.get_format.call(this, pwaveformatex, pdwwaveformatexsize, pdwbuffersize)
  end
end
struct LibWin32::IDirectMusicThru
  def query_interface(this : IDirectMusicThru*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicThru*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicThru*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def thru_channel(this : IDirectMusicThru*, dwsourcechannelgroup : UInt32, dwsourcechannel : UInt32, dwdestinationchannelgroup : UInt32, dwdestinationchannel : UInt32, pdestinationport : IDirectMusicPort) : HRESULT
    @lpVtbl.value.thru_channel.call(this, dwsourcechannelgroup, dwsourcechannel, dwdestinationchannelgroup, dwdestinationchannel, pdestinationport)
  end
end
struct LibWin32::IDirectMusicSynth
  def query_interface(this : IDirectMusicSynth*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicSynth*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicSynth*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IDirectMusicSynth*, pportparams : DMUS_PORTPARAMS8*) : HRESULT
    @lpVtbl.value.open.call(this, pportparams)
  end
  def close(this : IDirectMusicSynth*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def set_num_channel_groups(this : IDirectMusicSynth*, dwgroups : UInt32) : HRESULT
    @lpVtbl.value.set_num_channel_groups.call(this, dwgroups)
  end
  def download(this : IDirectMusicSynth*, phdownload : LibC::HANDLE*, pvdata : Void*, pbfree : Int32*) : HRESULT
    @lpVtbl.value.download.call(this, phdownload, pvdata, pbfree)
  end
  def unload(this : IDirectMusicSynth*, hdownload : LibC::HANDLE, lpfreehandle : LibC::IntPtrT, huserdata : LibC::HANDLE) : HRESULT
    @lpVtbl.value.unload.call(this, hdownload, lpfreehandle, huserdata)
  end
  def play_buffer(this : IDirectMusicSynth*, rt : Int64, pbbuffer : UInt8*, cbbuffer : UInt32) : HRESULT
    @lpVtbl.value.play_buffer.call(this, rt, pbbuffer, cbbuffer)
  end
  def get_running_stats(this : IDirectMusicSynth*, pstats : DMUS_SYNTHSTATS*) : HRESULT
    @lpVtbl.value.get_running_stats.call(this, pstats)
  end
  def get_port_caps(this : IDirectMusicSynth*, pcaps : DMUS_PORTCAPS*) : HRESULT
    @lpVtbl.value.get_port_caps.call(this, pcaps)
  end
  def set_master_clock(this : IDirectMusicSynth*, pclock : IReferenceClock) : HRESULT
    @lpVtbl.value.set_master_clock.call(this, pclock)
  end
  def get_latency_clock(this : IDirectMusicSynth*, ppclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_latency_clock.call(this, ppclock)
  end
  def activate(this : IDirectMusicSynth*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, fenable)
  end
  def set_synth_sink(this : IDirectMusicSynth*, psynthsink : IDirectMusicSynthSink) : HRESULT
    @lpVtbl.value.set_synth_sink.call(this, psynthsink)
  end
  def render(this : IDirectMusicSynth*, pbuffer : Int16*, dwlength : UInt32, llposition : Int64) : HRESULT
    @lpVtbl.value.render.call(this, pbuffer, dwlength, llposition)
  end
  def set_channel_priority(this : IDirectMusicSynth*, dwchannelgroup : UInt32, dwchannel : UInt32, dwpriority : UInt32) : HRESULT
    @lpVtbl.value.set_channel_priority.call(this, dwchannelgroup, dwchannel, dwpriority)
  end
  def get_channel_priority(this : IDirectMusicSynth*, dwchannelgroup : UInt32, dwchannel : UInt32, pdwpriority : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_priority.call(this, dwchannelgroup, dwchannel, pdwpriority)
  end
  def get_format(this : IDirectMusicSynth*, pwaveformatex : WAVEFORMATEX*, pdwwaveformatexsize : UInt32*) : HRESULT
    @lpVtbl.value.get_format.call(this, pwaveformatex, pdwwaveformatexsize)
  end
  def get_append(this : IDirectMusicSynth*, pdwappend : UInt32*) : HRESULT
    @lpVtbl.value.get_append.call(this, pdwappend)
  end
end
struct LibWin32::IDirectMusicSynth8
  def query_interface(this : IDirectMusicSynth8*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicSynth8*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicSynth8*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IDirectMusicSynth8*, pportparams : DMUS_PORTPARAMS8*) : HRESULT
    @lpVtbl.value.open.call(this, pportparams)
  end
  def close(this : IDirectMusicSynth8*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def set_num_channel_groups(this : IDirectMusicSynth8*, dwgroups : UInt32) : HRESULT
    @lpVtbl.value.set_num_channel_groups.call(this, dwgroups)
  end
  def download(this : IDirectMusicSynth8*, phdownload : LibC::HANDLE*, pvdata : Void*, pbfree : Int32*) : HRESULT
    @lpVtbl.value.download.call(this, phdownload, pvdata, pbfree)
  end
  def unload(this : IDirectMusicSynth8*, hdownload : LibC::HANDLE, lpfreehandle : LibC::IntPtrT, huserdata : LibC::HANDLE) : HRESULT
    @lpVtbl.value.unload.call(this, hdownload, lpfreehandle, huserdata)
  end
  def play_buffer(this : IDirectMusicSynth8*, rt : Int64, pbbuffer : UInt8*, cbbuffer : UInt32) : HRESULT
    @lpVtbl.value.play_buffer.call(this, rt, pbbuffer, cbbuffer)
  end
  def get_running_stats(this : IDirectMusicSynth8*, pstats : DMUS_SYNTHSTATS*) : HRESULT
    @lpVtbl.value.get_running_stats.call(this, pstats)
  end
  def get_port_caps(this : IDirectMusicSynth8*, pcaps : DMUS_PORTCAPS*) : HRESULT
    @lpVtbl.value.get_port_caps.call(this, pcaps)
  end
  def set_master_clock(this : IDirectMusicSynth8*, pclock : IReferenceClock) : HRESULT
    @lpVtbl.value.set_master_clock.call(this, pclock)
  end
  def get_latency_clock(this : IDirectMusicSynth8*, ppclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_latency_clock.call(this, ppclock)
  end
  def activate(this : IDirectMusicSynth8*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, fenable)
  end
  def set_synth_sink(this : IDirectMusicSynth8*, psynthsink : IDirectMusicSynthSink) : HRESULT
    @lpVtbl.value.set_synth_sink.call(this, psynthsink)
  end
  def render(this : IDirectMusicSynth8*, pbuffer : Int16*, dwlength : UInt32, llposition : Int64) : HRESULT
    @lpVtbl.value.render.call(this, pbuffer, dwlength, llposition)
  end
  def set_channel_priority(this : IDirectMusicSynth8*, dwchannelgroup : UInt32, dwchannel : UInt32, dwpriority : UInt32) : HRESULT
    @lpVtbl.value.set_channel_priority.call(this, dwchannelgroup, dwchannel, dwpriority)
  end
  def get_channel_priority(this : IDirectMusicSynth8*, dwchannelgroup : UInt32, dwchannel : UInt32, pdwpriority : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_priority.call(this, dwchannelgroup, dwchannel, pdwpriority)
  end
  def get_format(this : IDirectMusicSynth8*, pwaveformatex : WAVEFORMATEX*, pdwwaveformatexsize : UInt32*) : HRESULT
    @lpVtbl.value.get_format.call(this, pwaveformatex, pdwwaveformatexsize)
  end
  def get_append(this : IDirectMusicSynth8*, pdwappend : UInt32*) : HRESULT
    @lpVtbl.value.get_append.call(this, pdwappend)
  end
  def play_voice(this : IDirectMusicSynth8*, rt : Int64, dwvoiceid : UInt32, dwchannelgroup : UInt32, dwchannel : UInt32, dwdlid : UInt32, prpitch : Int32, vrvolume : Int32, stvoicestart : UInt64, stloopstart : UInt64, stloopend : UInt64) : HRESULT
    @lpVtbl.value.play_voice.call(this, rt, dwvoiceid, dwchannelgroup, dwchannel, dwdlid, prpitch, vrvolume, stvoicestart, stloopstart, stloopend)
  end
  def stop_voice(this : IDirectMusicSynth8*, rt : Int64, dwvoiceid : UInt32) : HRESULT
    @lpVtbl.value.stop_voice.call(this, rt, dwvoiceid)
  end
  def get_voice_state(this : IDirectMusicSynth8*, dwvoice : UInt32*, cbvoice : UInt32, dwvoicestate : DMUS_VOICE_STATE*) : HRESULT
    @lpVtbl.value.get_voice_state.call(this, dwvoice, cbvoice, dwvoicestate)
  end
  def refresh(this : IDirectMusicSynth8*, dwdownloadid : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.refresh.call(this, dwdownloadid, dwflags)
  end
  def assign_channel_to_buses(this : IDirectMusicSynth8*, dwchannelgroup : UInt32, dwchannel : UInt32, pdwbuses : UInt32*, cbuses : UInt32) : HRESULT
    @lpVtbl.value.assign_channel_to_buses.call(this, dwchannelgroup, dwchannel, pdwbuses, cbuses)
  end
end
struct LibWin32::IDirectMusicSynthSink
  def query_interface(this : IDirectMusicSynthSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDirectMusicSynthSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDirectMusicSynthSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init(this : IDirectMusicSynthSink*, psynth : IDirectMusicSynth) : HRESULT
    @lpVtbl.value.init.call(this, psynth)
  end
  def set_master_clock(this : IDirectMusicSynthSink*, pclock : IReferenceClock) : HRESULT
    @lpVtbl.value.set_master_clock.call(this, pclock)
  end
  def get_latency_clock(this : IDirectMusicSynthSink*, ppclock : IReferenceClock*) : HRESULT
    @lpVtbl.value.get_latency_clock.call(this, ppclock)
  end
  def activate(this : IDirectMusicSynthSink*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.activate.call(this, fenable)
  end
  def sample_to_ref_time(this : IDirectMusicSynthSink*, llsampletime : Int64, prftime : Int64*) : HRESULT
    @lpVtbl.value.sample_to_ref_time.call(this, llsampletime, prftime)
  end
  def ref_time_to_sample(this : IDirectMusicSynthSink*, rftime : Int64, pllsampletime : Int64*) : HRESULT
    @lpVtbl.value.ref_time_to_sample.call(this, rftime, pllsampletime)
  end
  def set_direct_sound(this : IDirectMusicSynthSink*, pdirectsound : IDirectSound, pdirectsoundbuffer : IDirectSoundBuffer) : HRESULT
    @lpVtbl.value.set_direct_sound.call(this, pdirectsound, pdirectsoundbuffer)
  end
  def get_desired_buffer_size(this : IDirectMusicSynthSink*, pdwbuffersizeinsamples : UInt32*) : HRESULT
    @lpVtbl.value.get_desired_buffer_size.call(this, pdwbuffersizeinsamples)
  end
end
