require "../../media/audio.cr"
require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:xaudio2_8.dll")]
@[Link(ldflags: "/DELAYLOAD:hrtfapo.dll")]
{% else %}
@[Link("xaudio2_8")]
@[Link("hrtfapo")]
{% end %}
lib LibWin32
  FXEQ_MIN_FRAMERATE = 22000_u32
  FXEQ_MAX_FRAMERATE = 48000_u32
  FXEQ_MIN_FREQUENCY_CENTER = "20.0_f32"
  FXEQ_MAX_FREQUENCY_CENTER = "20000.0_f32"
  FXEQ_DEFAULT_FREQUENCY_CENTER_0 = "100.0_f32"
  FXEQ_DEFAULT_FREQUENCY_CENTER_1 = "800.0_f32"
  FXEQ_DEFAULT_FREQUENCY_CENTER_2 = "2000.0_f32"
  FXEQ_DEFAULT_FREQUENCY_CENTER_3 = "10000.0_f32"
  FXEQ_MIN_GAIN = "0.126_f32"
  FXEQ_MAX_GAIN = "7.94_f32"
  FXEQ_DEFAULT_GAIN = "1.0_f32"
  FXEQ_MIN_BANDWIDTH = "0.1_f32"
  FXEQ_MAX_BANDWIDTH = "2.0_f32"
  FXEQ_DEFAULT_BANDWIDTH = "1.0_f32"
  FXMASTERINGLIMITER_MIN_RELEASE = 1_u32
  FXMASTERINGLIMITER_MAX_RELEASE = 20_u32
  FXMASTERINGLIMITER_DEFAULT_RELEASE = 6_u32
  FXMASTERINGLIMITER_MIN_LOUDNESS = 1_u32
  FXMASTERINGLIMITER_MAX_LOUDNESS = 1800_u32
  FXMASTERINGLIMITER_DEFAULT_LOUDNESS = 1000_u32
  FXREVERB_MIN_DIFFUSION = "0.0_f32"
  FXREVERB_MAX_DIFFUSION = "1.0_f32"
  FXREVERB_DEFAULT_DIFFUSION = "0.9_f32"
  FXREVERB_MIN_ROOMSIZE = "0.0001_f32"
  FXREVERB_MAX_ROOMSIZE = "1.0_f32"
  FXREVERB_DEFAULT_ROOMSIZE = "0.6_f32"
  FXLOUDNESS_DEFAULT_MOMENTARY_MS = 400_u32
  FXLOUDNESS_DEFAULT_SHORTTERM_MS = 3000_u32
  FXECHO_MIN_WETDRYMIX = "0.0_f32"
  FXECHO_MAX_WETDRYMIX = "1.0_f32"
  FXECHO_DEFAULT_WETDRYMIX = "0.5_f32"
  FXECHO_MIN_FEEDBACK = "0.0_f32"
  FXECHO_MAX_FEEDBACK = "1.0_f32"
  FXECHO_DEFAULT_FEEDBACK = "0.5_f32"
  FXECHO_MIN_DELAY = "1.0_f32"
  FXECHO_MAX_DELAY = "2000.0_f32"
  FXECHO_DEFAULT_DELAY = "500.0_f32"
  XAUDIO2_MAX_BUFFER_BYTES = 2147483648_u32
  XAUDIO2_MAX_QUEUED_BUFFERS = 64_u32
  XAUDIO2_MAX_BUFFERS_SYSTEM = 2_u32
  XAUDIO2_MAX_AUDIO_CHANNELS = 64_u32
  XAUDIO2_MIN_SAMPLE_RATE = 1000_u32
  XAUDIO2_MAX_SAMPLE_RATE = 200000_u32
  XAUDIO2_MAX_VOLUME_LEVEL = "16777216.0_f32"
  XAUDIO2_MAX_FREQ_RATIO = "1024.0_f32"
  XAUDIO2_DEFAULT_FREQ_RATIO = "2.0_f32"
  XAUDIO2_MAX_FILTER_ONEOVERQ = "1.5_f32"
  XAUDIO2_MAX_FILTER_FREQUENCY = "1.0_f32"
  XAUDIO2_MAX_LOOP_COUNT = 254_u32
  XAUDIO2_MAX_INSTANCES = 8_u32
  XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MONO = 600000_u32
  XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MULTICHANNEL = 300000_u32
  XAUDIO2_COMMIT_NOW = 0_u32
  XAUDIO2_COMMIT_ALL = 0_u32
  XAUDIO2_NO_LOOP_REGION = 0_u32
  XAUDIO2_LOOP_INFINITE = 255_u32
  XAUDIO2_DEFAULT_CHANNELS = 0_u32
  XAUDIO2_DEFAULT_SAMPLERATE = 0_u32
  XAUDIO2_DEBUG_ENGINE = 1_u32
  XAUDIO2_VOICE_NOPITCH = 2_u32
  XAUDIO2_VOICE_NOSRC = 4_u32
  XAUDIO2_VOICE_USEFILTER = 8_u32
  XAUDIO2_PLAY_TAILS = 32_u32
  XAUDIO2_END_OF_STREAM = 64_u32
  XAUDIO2_SEND_USEFILTER = 128_u32
  XAUDIO2_VOICE_NOSAMPLESPLAYED = 256_u32
  XAUDIO2_STOP_ENGINE_WHEN_IDLE = 8192_u32
  XAUDIO2_1024_QUANTUM = 32768_u32
  XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT = 65536_u32
  XAUDIO2_DEFAULT_FILTER_FREQUENCY = "1.0_f32"
  XAUDIO2_DEFAULT_FILTER_ONEOVERQ = "1.0_f32"
  XAUDIO2_QUANTUM_NUMERATOR = 1_u32
  XAUDIO2_QUANTUM_DENOMINATOR = 100_u32
  FACILITY_XAUDIO2 = 2198_u32
  XAUDIO2_E_INVALID_CALL = -2003435519_i32
  XAUDIO2_E_XMA_DECODER_ERROR = -2003435518_i32
  XAUDIO2_E_XAPO_CREATION_FAILED = -2003435517_i32
  XAUDIO2_E_DEVICE_INVALIDATED = -2003435516_i32
  Processor1 = 1_u32
  Processor2 = 2_u32
  Processor3 = 4_u32
  Processor4 = 8_u32
  Processor5 = 16_u32
  Processor6 = 32_u32
  Processor7 = 64_u32
  Processor8 = 128_u32
  Processor9 = 256_u32
  Processor10 = 512_u32
  Processor11 = 1024_u32
  Processor12 = 2048_u32
  Processor13 = 4096_u32
  Processor14 = 8192_u32
  Processor15 = 16384_u32
  Processor16 = 32768_u32
  Processor17 = 65536_u32
  Processor18 = 131072_u32
  Processor19 = 262144_u32
  Processor20 = 524288_u32
  Processor21 = 1048576_u32
  Processor22 = 2097152_u32
  Processor23 = 4194304_u32
  Processor24 = 8388608_u32
  Processor25 = 16777216_u32
  Processor26 = 33554432_u32
  Processor27 = 67108864_u32
  Processor28 = 134217728_u32
  Processor29 = 268435456_u32
  Processor30 = 536870912_u32
  Processor31 = 1073741824_u32
  Processor32 = 2147483648_u32
  XAUDIO2_ANY_PROCESSOR = 4294967295_u32
  XAUDIO2_USE_DEFAULT_PROCESSOR = 0_u32
  XAUDIO2_DEFAULT_PROCESSOR = 1_u32
  XAUDIO2_LOG_ERRORS = 1_u32
  XAUDIO2_LOG_WARNINGS = 2_u32
  XAUDIO2_LOG_INFO = 4_u32
  XAUDIO2_LOG_DETAIL = 8_u32
  XAUDIO2_LOG_API_CALLS = 16_u32
  XAUDIO2_LOG_FUNC_CALLS = 32_u32
  XAUDIO2_LOG_TIMING = 64_u32
  XAUDIO2_LOG_LOCKS = 128_u32
  XAUDIO2_LOG_MEMORY = 256_u32
  XAUDIO2_LOG_STREAMING = 4096_u32
  XAUDIO2FX_REVERB_MIN_FRAMERATE = 20000_u32
  XAUDIO2FX_REVERB_MAX_FRAMERATE = 48000_u32
  XAUDIO2FX_REVERB_MIN_WET_DRY_MIX = "0.0_f32"
  XAUDIO2FX_REVERB_MIN_REFLECTIONS_DELAY = 0_u32
  XAUDIO2FX_REVERB_MIN_REVERB_DELAY = 0_u32
  XAUDIO2FX_REVERB_MIN_REAR_DELAY = 0_u32
  XAUDIO2FX_REVERB_MIN_7POINT1_SIDE_DELAY = 0_u32
  XAUDIO2FX_REVERB_MIN_7POINT1_REAR_DELAY = 0_u32
  XAUDIO2FX_REVERB_MIN_POSITION = 0_u32
  XAUDIO2FX_REVERB_MIN_DIFFUSION = 0_u32
  XAUDIO2FX_REVERB_MIN_LOW_EQ_GAIN = 0_u32
  XAUDIO2FX_REVERB_MIN_LOW_EQ_CUTOFF = 0_u32
  XAUDIO2FX_REVERB_MIN_HIGH_EQ_GAIN = 0_u32
  XAUDIO2FX_REVERB_MIN_HIGH_EQ_CUTOFF = 0_u32
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_FREQ = "20.0_f32"
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_MAIN = "-100.0_f32"
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_HF = "-100.0_f32"
  XAUDIO2FX_REVERB_MIN_REFLECTIONS_GAIN = "-100.0_f32"
  XAUDIO2FX_REVERB_MIN_REVERB_GAIN = "-100.0_f32"
  XAUDIO2FX_REVERB_MIN_DECAY_TIME = "0.1_f32"
  XAUDIO2FX_REVERB_MIN_DENSITY = "0.0_f32"
  XAUDIO2FX_REVERB_MIN_ROOM_SIZE = "0.0_f32"
  XAUDIO2FX_REVERB_MAX_WET_DRY_MIX = "100.0_f32"
  XAUDIO2FX_REVERB_MAX_REFLECTIONS_DELAY = 300_u32
  XAUDIO2FX_REVERB_MAX_REVERB_DELAY = 85_u32
  XAUDIO2FX_REVERB_MAX_REAR_DELAY = 5_u32
  XAUDIO2FX_REVERB_MAX_7POINT1_SIDE_DELAY = 5_u32
  XAUDIO2FX_REVERB_MAX_7POINT1_REAR_DELAY = 20_u32
  XAUDIO2FX_REVERB_MAX_POSITION = 30_u32
  XAUDIO2FX_REVERB_MAX_DIFFUSION = 15_u32
  XAUDIO2FX_REVERB_MAX_LOW_EQ_GAIN = 12_u32
  XAUDIO2FX_REVERB_MAX_LOW_EQ_CUTOFF = 9_u32
  XAUDIO2FX_REVERB_MAX_HIGH_EQ_GAIN = 8_u32
  XAUDIO2FX_REVERB_MAX_HIGH_EQ_CUTOFF = 14_u32
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_FREQ = "20000.0_f32"
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_MAIN = "0.0_f32"
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_HF = "0.0_f32"
  XAUDIO2FX_REVERB_MAX_REFLECTIONS_GAIN = "20.0_f32"
  XAUDIO2FX_REVERB_MAX_REVERB_GAIN = "20.0_f32"
  XAUDIO2FX_REVERB_MAX_DENSITY = "100.0_f32"
  XAUDIO2FX_REVERB_MAX_ROOM_SIZE = "100.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_WET_DRY_MIX = "100.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_DELAY = 5_u32
  XAUDIO2FX_REVERB_DEFAULT_REVERB_DELAY = 5_u32
  XAUDIO2FX_REVERB_DEFAULT_REAR_DELAY = 5_u32
  XAUDIO2FX_REVERB_DEFAULT_7POINT1_SIDE_DELAY = 5_u32
  XAUDIO2FX_REVERB_DEFAULT_7POINT1_REAR_DELAY = 20_u32
  XAUDIO2FX_REVERB_DEFAULT_POSITION = 6_u32
  XAUDIO2FX_REVERB_DEFAULT_POSITION_MATRIX = 27_u32
  XAUDIO2FX_REVERB_DEFAULT_EARLY_DIFFUSION = 8_u32
  XAUDIO2FX_REVERB_DEFAULT_LATE_DIFFUSION = 8_u32
  XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_GAIN = 8_u32
  XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_CUTOFF = 4_u32
  XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_GAIN = 8_u32
  XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_CUTOFF = 4_u32
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_FREQ = "5000.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_MAIN = "0.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_HF = "0.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_GAIN = "0.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_REVERB_GAIN = "0.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_DECAY_TIME = "1.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_DENSITY = "100.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_ROOM_SIZE = "100.0_f32"
  XAUDIO2FX_REVERB_DEFAULT_DISABLE_LATE_FIELD = 0_u32
  HRTF_MAX_GAIN_LIMIT = "12.0_f32"
  HRTF_MIN_GAIN_LIMIT = "-96.0_f32"
  HRTF_MIN_UNITY_GAIN_DISTANCE = "0.05_f32"
  HRTF_DEFAULT_UNITY_GAIN_DISTANCE = "1.0_f32"
  FACILITY_XAPO = 2199_u32
  XAPO_E_FORMAT_UNSUPPORTED = -2003369983_i32
  XAPO_MIN_CHANNELS = 1_u32
  XAPO_MAX_CHANNELS = 64_u32
  XAPO_MIN_FRAMERATE = 1000_u32
  XAPO_MAX_FRAMERATE = 200000_u32
  XAPO_REGISTRATION_STRING_LENGTH = 256_u32
  XAPO_FLAG_CHANNELS_MUST_MATCH = 1_u32
  XAPO_FLAG_FRAMERATE_MUST_MATCH = 2_u32
  XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH = 4_u32
  XAPO_FLAG_BUFFERCOUNT_MUST_MATCH = 8_u32
  XAPO_FLAG_INPLACE_REQUIRED = 32_u32
  XAPO_FLAG_INPLACE_SUPPORTED = 16_u32
  SPEAKER_MONO = 4_u32
  X3DAUDIO_HANDLE_BYTESIZE = 20_u32
  X3DAUDIO_PI = "3.1415927_f32"
  X3DAUDIO_2PI = "6.2831855_f32"
  X3DAUDIO_SPEED_OF_SOUND = "343.5_f32"
  X3DAUDIO_CALCULATE_MATRIX = 1_u32
  X3DAUDIO_CALCULATE_DELAY = 2_u32
  X3DAUDIO_CALCULATE_LPF_DIRECT = 4_u32
  X3DAUDIO_CALCULATE_LPF_REVERB = 8_u32
  X3DAUDIO_CALCULATE_REVERB = 16_u32
  X3DAUDIO_CALCULATE_DOPPLER = 32_u32
  X3DAUDIO_CALCULATE_EMITTER_ANGLE = 64_u32
  X3DAUDIO_CALCULATE_ZEROCENTER = 65536_u32
  X3DAUDIO_CALCULATE_REDIRECT_TO_LFE = 131072_u32
  CLSID_FXEQ = LibC::GUID.new(0xf5e01117_u32, 0xd6c4_u16, 0x485a_u16, StaticArray[0xa3_u8, 0xf5_u8, 0x69_u8, 0x51_u8, 0x96_u8, 0xf3_u8, 0xdb_u8, 0xfa_u8])
  CLSID_FXMasteringLimiter = LibC::GUID.new(0xc4137916_u32, 0x2be1_u16, 0x46fd_u16, StaticArray[0x85_u8, 0x99_u8, 0x44_u8, 0x15_u8, 0x36_u8, 0xf4_u8, 0x98_u8, 0x56_u8])
  CLSID_FXReverb = LibC::GUID.new(0x7d9aca56_u32, 0xcb68_u16, 0x4807_u16, StaticArray[0xb6_u8, 0x32_u8, 0xb1_u8, 0x37_u8, 0x35_u8, 0x2e_u8, 0x85_u8, 0x96_u8])
  CLSID_FXEcho = LibC::GUID.new(0x5039d740_u32, 0xf736_u16, 0x449a_u16, StaticArray[0x84_u8, 0xd3_u8, 0xa5_u8, 0x62_u8, 0x2_u8, 0x55_u8, 0x7b_u8, 0x87_u8])
  CLSID_AudioVolumeMeter = LibC::GUID.new(0x4fc3b166_u32, 0x972a_u16, 0x40cf_u16, StaticArray[0xbc_u8, 0x37_u8, 0x7d_u8, 0xb0_u8, 0x3d_u8, 0xb2_u8, 0xfb_u8, 0xa3_u8])
  CLSID_AudioReverb = LibC::GUID.new(0xc2633b16_u32, 0x471b_u16, 0x4498_u16, StaticArray[0xb8_u8, 0xc5_u8, 0x4f_u8, 0x9_u8, 0x59_u8, 0xe2_u8, 0xec_u8, 0x9_u8])


  enum XAPO_BUFFER_FLAGS : Int32
    XAPO_BUFFER_SILENT = 0
    XAPO_BUFFER_VALID = 1
  end

  enum XAUDIO2_FILTER_TYPE : Int32
    LowPassFilter = 0
    BandPassFilter = 1
    HighPassFilter = 2
    NotchFilter = 3
    LowPassOnePoleFilter = 4
    HighPassOnePoleFilter = 5
  end

  enum HrtfDirectivityType : Int32
    OmniDirectional = 0
    Cardioid = 1
    Cone = 2
  end

  enum HrtfEnvironment : Int32
    Small = 0
    Medium = 1
    Large = 2
    Outdoors = 3
  end

  enum HrtfDistanceDecayType : Int32
    NaturalDecay = 0
    CustomDecay = 1
  end

  struct XAPO_REGISTRATION_PROPERTIES
    clsid : Guid
    friendly_name : Char[256]*
    copyright_info : Char[256]*
    major_version : UInt32
    minor_version : UInt32
    flags : UInt32
    min_input_buffer_count : UInt32
    max_input_buffer_count : UInt32
    min_output_buffer_count : UInt32
    max_output_buffer_count : UInt32
  end
  struct XAPO_LOCKFORPROCESS_PARAMETERS
    p_format : WAVEFORMATEX*
    max_frame_count : UInt32
  end
  struct XAPO_PROCESS_BUFFER_PARAMETERS
    p_buffer : Void*
    buffer_flags : XAPO_BUFFER_FLAGS
    valid_frame_count : UInt32
  end
  struct FXEQ_PARAMETERS
    frequency_center0 : Float32
    gain0 : Float32
    bandwidth0 : Float32
    frequency_center1 : Float32
    gain1 : Float32
    bandwidth1 : Float32
    frequency_center2 : Float32
    gain2 : Float32
    bandwidth2 : Float32
    frequency_center3 : Float32
    gain3 : Float32
    bandwidth3 : Float32
  end
  struct FXMASTERINGLIMITER_PARAMETERS
    release : UInt32
    loudness : UInt32
  end
  struct FXREVERB_PARAMETERS
    diffusion : Float32
    room_size : Float32
  end
  struct FXECHO_INITDATA
    max_delay : Float32
  end
  struct FXECHO_PARAMETERS
    wet_dry_mix : Float32
    feedback : Float32
    delay : Float32
  end
  struct XAUDIO2_VOICE_DETAILS
    creation_flags : UInt32
    active_flags : UInt32
    input_channels : UInt32
    input_sample_rate : UInt32
  end
  struct XAUDIO2_SEND_DESCRIPTOR
    flags : UInt32
    p_output_voice : IXAudio2Voice
  end
  struct XAUDIO2_VOICE_SENDS
    send_count : UInt32
    p_sends : XAUDIO2_SEND_DESCRIPTOR*
  end
  struct XAUDIO2_EFFECT_DESCRIPTOR
    p_effect : IUnknown
    initial_state : LibC::BOOL
    output_channels : UInt32
  end
  struct XAUDIO2_EFFECT_CHAIN
    effect_count : UInt32
    p_effect_descriptors : XAUDIO2_EFFECT_DESCRIPTOR*
  end
  struct XAUDIO2_FILTER_PARAMETERS
    type : XAUDIO2_FILTER_TYPE
    frequency : Float32
    one_over_q : Float32
  end
  struct XAUDIO2_BUFFER
    flags : UInt32
    audio_bytes : UInt32
    p_audio_data : UInt8*
    play_begin : UInt32
    play_length : UInt32
    loop_begin : UInt32
    loop_length : UInt32
    loop_count : UInt32
    p_context : Void*
  end
  struct XAUDIO2_BUFFER_WMA
    p_decoded_packet_cumulative_bytes : UInt32*
    packet_count : UInt32
  end
  struct XAUDIO2_VOICE_STATE
    p_current_buffer_context : Void*
    buffers_queued : UInt32
    samples_played : UInt64
  end
  struct XAUDIO2_PERFORMANCE_DATA
    audio_cycles_since_last_query : UInt64
    total_cycles_since_last_query : UInt64
    minimum_cycles_per_quantum : UInt32
    maximum_cycles_per_quantum : UInt32
    memory_usage_in_bytes : UInt32
    current_latency_in_samples : UInt32
    glitches_since_engine_started : UInt32
    active_source_voice_count : UInt32
    total_source_voice_count : UInt32
    active_submix_voice_count : UInt32
    active_resampler_count : UInt32
    active_matrix_mix_count : UInt32
    active_xma_source_voices : UInt32
    active_xma_streams : UInt32
  end
  struct XAUDIO2_DEBUG_CONFIGURATION
    trace_mask : UInt32
    break_mask : UInt32
    log_thread_id : LibC::BOOL
    log_fileline : LibC::BOOL
    log_function_name : LibC::BOOL
    log_timing : LibC::BOOL
  end
  struct XAUDIO2FX_VOLUMEMETER_LEVELS
    p_peak_levels : Float32*
    p_rms_levels : Float32*
    channel_count : UInt32
  end
  struct XAUDIO2FX_REVERB_PARAMETERS
    wet_dry_mix : Float32
    reflections_delay : UInt32
    reverb_delay : UInt8
    rear_delay : UInt8
    side_delay : UInt8
    position_left : UInt8
    position_right : UInt8
    position_matrix_left : UInt8
    position_matrix_right : UInt8
    early_diffusion : UInt8
    late_diffusion : UInt8
    low_eq_gain : UInt8
    low_eq_cutoff : UInt8
    high_eq_gain : UInt8
    high_eq_cutoff : UInt8
    room_filter_freq : Float32
    room_filter_main : Float32
    room_filter_hf : Float32
    reflections_gain : Float32
    reverb_gain : Float32
    decay_time : Float32
    density : Float32
    room_size : Float32
    disable_late_field : LibC::BOOL
  end
  struct XAUDIO2FX_REVERB_I3DL2_PARAMETERS
    wet_dry_mix : Float32
    room : Int32
    room_hf : Int32
    room_rolloff_factor : Float32
    decay_time : Float32
    decay_hf_ratio : Float32
    reflections : Int32
    reflections_delay : Float32
    reverb : Int32
    reverb_delay : Float32
    diffusion : Float32
    density : Float32
    hf_reference : Float32
  end
  struct HrtfPosition
    x : Float32
    y : Float32
    z : Float32
  end
  struct HrtfOrientation
    element : Float32[9]*
  end
  struct HrtfDirectivity
    type : HrtfDirectivityType
    scaling : Float32
  end
  struct HrtfDirectivityCardioid
    directivity : HrtfDirectivity
    order : Float32
  end
  struct HrtfDirectivityCone
    directivity : HrtfDirectivity
    inner_angle : Float32
    outer_angle : Float32
  end
  struct HrtfDistanceDecay
    type : HrtfDistanceDecayType
    max_gain : Float32
    min_gain : Float32
    unity_gain_distance : Float32
    cutoff_distance : Float32
  end
  struct HrtfApoInit
    distance_decay : HrtfDistanceDecay*
    directivity : HrtfDirectivity*
  end


  struct IXAPOVTbl
    query_interface : Proc(IXAPO*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAPO*, UInt32)
    release : Proc(IXAPO*, UInt32)
    get_registration_properties : Proc(IXAPO*, XAPO_REGISTRATION_PROPERTIES**, HRESULT)
    is_input_format_supported : Proc(IXAPO*, WAVEFORMATEX*, WAVEFORMATEX*, WAVEFORMATEX**, HRESULT)
    is_output_format_supported : Proc(IXAPO*, WAVEFORMATEX*, WAVEFORMATEX*, WAVEFORMATEX**, HRESULT)
    initialize : Proc(IXAPO*, Void*, UInt32, HRESULT)
    reset : Proc(IXAPO*, Void)
    lock_for_process : Proc(IXAPO*, UInt32, XAPO_LOCKFORPROCESS_PARAMETERS*, UInt32, XAPO_LOCKFORPROCESS_PARAMETERS*, HRESULT)
    unlock_for_process : Proc(IXAPO*, Void)
    process : Proc(IXAPO*, UInt32, XAPO_PROCESS_BUFFER_PARAMETERS*, UInt32, XAPO_PROCESS_BUFFER_PARAMETERS*, LibC::BOOL, Void)
    calc_input_frames : Proc(IXAPO*, UInt32, UInt32)
    calc_output_frames : Proc(IXAPO*, UInt32, UInt32)
  end

  IXAPO_GUID = "a410b984-9839-4819-a0be-2856ae6b3adb"
  IID_IXAPO = LibC::GUID.new(0xa410b984_u32, 0x9839_u16, 0x4819_u16, StaticArray[0xa0_u8, 0xbe_u8, 0x28_u8, 0x56_u8, 0xae_u8, 0x6b_u8, 0x3a_u8, 0xdb_u8])
  struct IXAPO
    lpVtbl : IXAPOVTbl*
  end

  struct IXAPOParametersVTbl
    query_interface : Proc(IXAPOParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAPOParameters*, UInt32)
    release : Proc(IXAPOParameters*, UInt32)
    set_parameters : Proc(IXAPOParameters*, Void*, UInt32, Void)
    get_parameters : Proc(IXAPOParameters*, Void*, UInt32, Void)
  end

  IXAPOParameters_GUID = "26d95c66-80f2-499a-ad54-5ae7f01c6d98"
  IID_IXAPOParameters = LibC::GUID.new(0x26d95c66_u32, 0x80f2_u16, 0x499a_u16, StaticArray[0xad_u8, 0x54_u8, 0x5a_u8, 0xe7_u8, 0xf0_u8, 0x1c_u8, 0x6d_u8, 0x98_u8])
  struct IXAPOParameters
    lpVtbl : IXAPOParametersVTbl*
  end

  struct IXAudio2VTbl
    query_interface : Proc(IXAudio2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAudio2*, UInt32)
    release : Proc(IXAudio2*, UInt32)
    register_for_callbacks : Proc(IXAudio2*, IXAudio2EngineCallback, HRESULT)
    unregister_for_callbacks : Proc(IXAudio2*, IXAudio2EngineCallback, Void)
    create_source_voice : Proc(IXAudio2*, IXAudio2SourceVoice*, WAVEFORMATEX*, UInt32, Float32, IXAudio2VoiceCallback, XAUDIO2_VOICE_SENDS*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    create_submix_voice : Proc(IXAudio2*, IXAudio2SubmixVoice*, UInt32, UInt32, UInt32, UInt32, XAUDIO2_VOICE_SENDS*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    create_mastering_voice : Proc(IXAudio2*, IXAudio2MasteringVoice*, UInt32, UInt32, UInt32, LibC::LPWSTR, XAUDIO2_EFFECT_CHAIN*, AUDIO_STREAM_CATEGORY, HRESULT)
    start_engine : Proc(IXAudio2*, HRESULT)
    stop_engine : Proc(IXAudio2*, Void)
    commit_changes : Proc(IXAudio2*, UInt32, HRESULT)
    get_performance_data : Proc(IXAudio2*, XAUDIO2_PERFORMANCE_DATA*, Void)
    set_debug_configuration : Proc(IXAudio2*, XAUDIO2_DEBUG_CONFIGURATION*, Void*, Void)
  end

  IXAudio2_GUID = "2b02e3cf-2e0b-4ec3-be45-1b2a3fe7210d"
  IID_IXAudio2 = LibC::GUID.new(0x2b02e3cf_u32, 0x2e0b_u16, 0x4ec3_u16, StaticArray[0xbe_u8, 0x45_u8, 0x1b_u8, 0x2a_u8, 0x3f_u8, 0xe7_u8, 0x21_u8, 0xd_u8])
  struct IXAudio2
    lpVtbl : IXAudio2VTbl*
  end

  struct IXAudio2ExtensionVTbl
    query_interface : Proc(IXAudio2Extension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAudio2Extension*, UInt32)
    release : Proc(IXAudio2Extension*, UInt32)
    get_processing_quantum : Proc(IXAudio2Extension*, UInt32*, UInt32*, Void)
    get_processor : Proc(IXAudio2Extension*, UInt32*, Void)
  end

  IXAudio2Extension_GUID = "84ac29bb-d619-44d2-b197-e4acf7df3ed6"
  IID_IXAudio2Extension = LibC::GUID.new(0x84ac29bb_u32, 0xd619_u16, 0x44d2_u16, StaticArray[0xb1_u8, 0x97_u8, 0xe4_u8, 0xac_u8, 0xf7_u8, 0xdf_u8, 0x3e_u8, 0xd6_u8])
  struct IXAudio2Extension
    lpVtbl : IXAudio2ExtensionVTbl*
  end

  struct IXAudio2VoiceVTbl
    get_voice_details : Proc(IXAudio2Voice*, XAUDIO2_VOICE_DETAILS*, Void)
    set_output_voices : Proc(IXAudio2Voice*, XAUDIO2_VOICE_SENDS*, HRESULT)
    set_effect_chain : Proc(IXAudio2Voice*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    enable_effect : Proc(IXAudio2Voice*, UInt32, UInt32, HRESULT)
    disable_effect : Proc(IXAudio2Voice*, UInt32, UInt32, HRESULT)
    get_effect_state : Proc(IXAudio2Voice*, UInt32, LibC::BOOL*, Void)
    set_effect_parameters : Proc(IXAudio2Voice*, UInt32, Void*, UInt32, UInt32, HRESULT)
    get_effect_parameters : Proc(IXAudio2Voice*, UInt32, Void*, UInt32, HRESULT)
    set_filter_parameters : Proc(IXAudio2Voice*, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_filter_parameters : Proc(IXAudio2Voice*, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_output_filter_parameters : Proc(IXAudio2Voice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_output_filter_parameters : Proc(IXAudio2Voice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_volume : Proc(IXAudio2Voice*, Float32, UInt32, HRESULT)
    get_volume : Proc(IXAudio2Voice*, Float32*, Void)
    set_channel_volumes : Proc(IXAudio2Voice*, UInt32, Float32*, UInt32, HRESULT)
    get_channel_volumes : Proc(IXAudio2Voice*, UInt32, Float32*, Void)
    set_output_matrix : Proc(IXAudio2Voice*, IXAudio2Voice, UInt32, UInt32, Float32*, UInt32, HRESULT)
    get_output_matrix : Proc(IXAudio2Voice*, IXAudio2Voice, UInt32, UInt32, Float32*, Void)
    destroy_voice : Proc(IXAudio2Voice*, Void)
  end

  struct IXAudio2Voice
    lpVtbl : IXAudio2VoiceVTbl*
  end

  struct IXAudio2SourceVoiceVTbl
    get_voice_details : Proc(IXAudio2SourceVoice*, XAUDIO2_VOICE_DETAILS*, Void)
    set_output_voices : Proc(IXAudio2SourceVoice*, XAUDIO2_VOICE_SENDS*, HRESULT)
    set_effect_chain : Proc(IXAudio2SourceVoice*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    enable_effect : Proc(IXAudio2SourceVoice*, UInt32, UInt32, HRESULT)
    disable_effect : Proc(IXAudio2SourceVoice*, UInt32, UInt32, HRESULT)
    get_effect_state : Proc(IXAudio2SourceVoice*, UInt32, LibC::BOOL*, Void)
    set_effect_parameters : Proc(IXAudio2SourceVoice*, UInt32, Void*, UInt32, UInt32, HRESULT)
    get_effect_parameters : Proc(IXAudio2SourceVoice*, UInt32, Void*, UInt32, HRESULT)
    set_filter_parameters : Proc(IXAudio2SourceVoice*, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_filter_parameters : Proc(IXAudio2SourceVoice*, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_output_filter_parameters : Proc(IXAudio2SourceVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_output_filter_parameters : Proc(IXAudio2SourceVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_volume : Proc(IXAudio2SourceVoice*, Float32, UInt32, HRESULT)
    get_volume : Proc(IXAudio2SourceVoice*, Float32*, Void)
    set_channel_volumes : Proc(IXAudio2SourceVoice*, UInt32, Float32*, UInt32, HRESULT)
    get_channel_volumes : Proc(IXAudio2SourceVoice*, UInt32, Float32*, Void)
    set_output_matrix : Proc(IXAudio2SourceVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, UInt32, HRESULT)
    get_output_matrix : Proc(IXAudio2SourceVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, Void)
    destroy_voice : Proc(IXAudio2SourceVoice*, Void)
    start : Proc(IXAudio2SourceVoice*, UInt32, UInt32, HRESULT)
    stop : Proc(IXAudio2SourceVoice*, UInt32, UInt32, HRESULT)
    submit_source_buffer : Proc(IXAudio2SourceVoice*, XAUDIO2_BUFFER*, XAUDIO2_BUFFER_WMA*, HRESULT)
    flush_source_buffers : Proc(IXAudio2SourceVoice*, HRESULT)
    discontinuity : Proc(IXAudio2SourceVoice*, HRESULT)
    exit_loop : Proc(IXAudio2SourceVoice*, UInt32, HRESULT)
    get_state : Proc(IXAudio2SourceVoice*, XAUDIO2_VOICE_STATE*, UInt32, Void)
    set_frequency_ratio : Proc(IXAudio2SourceVoice*, Float32, UInt32, HRESULT)
    get_frequency_ratio : Proc(IXAudio2SourceVoice*, Float32*, Void)
    set_source_sample_rate : Proc(IXAudio2SourceVoice*, UInt32, HRESULT)
  end

  struct IXAudio2SourceVoice
    lpVtbl : IXAudio2SourceVoiceVTbl*
  end

  struct IXAudio2SubmixVoiceVTbl
    get_voice_details : Proc(IXAudio2SubmixVoice*, XAUDIO2_VOICE_DETAILS*, Void)
    set_output_voices : Proc(IXAudio2SubmixVoice*, XAUDIO2_VOICE_SENDS*, HRESULT)
    set_effect_chain : Proc(IXAudio2SubmixVoice*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    enable_effect : Proc(IXAudio2SubmixVoice*, UInt32, UInt32, HRESULT)
    disable_effect : Proc(IXAudio2SubmixVoice*, UInt32, UInt32, HRESULT)
    get_effect_state : Proc(IXAudio2SubmixVoice*, UInt32, LibC::BOOL*, Void)
    set_effect_parameters : Proc(IXAudio2SubmixVoice*, UInt32, Void*, UInt32, UInt32, HRESULT)
    get_effect_parameters : Proc(IXAudio2SubmixVoice*, UInt32, Void*, UInt32, HRESULT)
    set_filter_parameters : Proc(IXAudio2SubmixVoice*, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_filter_parameters : Proc(IXAudio2SubmixVoice*, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_output_filter_parameters : Proc(IXAudio2SubmixVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_output_filter_parameters : Proc(IXAudio2SubmixVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_volume : Proc(IXAudio2SubmixVoice*, Float32, UInt32, HRESULT)
    get_volume : Proc(IXAudio2SubmixVoice*, Float32*, Void)
    set_channel_volumes : Proc(IXAudio2SubmixVoice*, UInt32, Float32*, UInt32, HRESULT)
    get_channel_volumes : Proc(IXAudio2SubmixVoice*, UInt32, Float32*, Void)
    set_output_matrix : Proc(IXAudio2SubmixVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, UInt32, HRESULT)
    get_output_matrix : Proc(IXAudio2SubmixVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, Void)
    destroy_voice : Proc(IXAudio2SubmixVoice*, Void)
  end

  struct IXAudio2SubmixVoice
    lpVtbl : IXAudio2SubmixVoiceVTbl*
  end

  struct IXAudio2MasteringVoiceVTbl
    get_voice_details : Proc(IXAudio2MasteringVoice*, XAUDIO2_VOICE_DETAILS*, Void)
    set_output_voices : Proc(IXAudio2MasteringVoice*, XAUDIO2_VOICE_SENDS*, HRESULT)
    set_effect_chain : Proc(IXAudio2MasteringVoice*, XAUDIO2_EFFECT_CHAIN*, HRESULT)
    enable_effect : Proc(IXAudio2MasteringVoice*, UInt32, UInt32, HRESULT)
    disable_effect : Proc(IXAudio2MasteringVoice*, UInt32, UInt32, HRESULT)
    get_effect_state : Proc(IXAudio2MasteringVoice*, UInt32, LibC::BOOL*, Void)
    set_effect_parameters : Proc(IXAudio2MasteringVoice*, UInt32, Void*, UInt32, UInt32, HRESULT)
    get_effect_parameters : Proc(IXAudio2MasteringVoice*, UInt32, Void*, UInt32, HRESULT)
    set_filter_parameters : Proc(IXAudio2MasteringVoice*, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_filter_parameters : Proc(IXAudio2MasteringVoice*, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_output_filter_parameters : Proc(IXAudio2MasteringVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, UInt32, HRESULT)
    get_output_filter_parameters : Proc(IXAudio2MasteringVoice*, IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*, Void)
    set_volume : Proc(IXAudio2MasteringVoice*, Float32, UInt32, HRESULT)
    get_volume : Proc(IXAudio2MasteringVoice*, Float32*, Void)
    set_channel_volumes : Proc(IXAudio2MasteringVoice*, UInt32, Float32*, UInt32, HRESULT)
    get_channel_volumes : Proc(IXAudio2MasteringVoice*, UInt32, Float32*, Void)
    set_output_matrix : Proc(IXAudio2MasteringVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, UInt32, HRESULT)
    get_output_matrix : Proc(IXAudio2MasteringVoice*, IXAudio2Voice, UInt32, UInt32, Float32*, Void)
    destroy_voice : Proc(IXAudio2MasteringVoice*, Void)
    get_channel_mask : Proc(IXAudio2MasteringVoice*, UInt32*, HRESULT)
  end

  struct IXAudio2MasteringVoice
    lpVtbl : IXAudio2MasteringVoiceVTbl*
  end

  struct IXAudio2EngineCallbackVTbl
    on_processing_pass_start : Proc(IXAudio2EngineCallback*, Void)
    on_processing_pass_end : Proc(IXAudio2EngineCallback*, Void)
    on_critical_error : Proc(IXAudio2EngineCallback*, HRESULT, Void)
  end

  struct IXAudio2EngineCallback
    lpVtbl : IXAudio2EngineCallbackVTbl*
  end

  struct IXAudio2VoiceCallbackVTbl
    on_voice_processing_pass_start : Proc(IXAudio2VoiceCallback*, UInt32, Void)
    on_voice_processing_pass_end : Proc(IXAudio2VoiceCallback*, Void)
    on_stream_end : Proc(IXAudio2VoiceCallback*, Void)
    on_buffer_start : Proc(IXAudio2VoiceCallback*, Void*, Void)
    on_buffer_end : Proc(IXAudio2VoiceCallback*, Void*, Void)
    on_loop_end : Proc(IXAudio2VoiceCallback*, Void*, Void)
    on_voice_error : Proc(IXAudio2VoiceCallback*, Void*, HRESULT, Void)
  end

  struct IXAudio2VoiceCallback
    lpVtbl : IXAudio2VoiceCallbackVTbl*
  end

  struct IXAPOHrtfParametersVTbl
    query_interface : Proc(IXAPOHrtfParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAPOHrtfParameters*, UInt32)
    release : Proc(IXAPOHrtfParameters*, UInt32)
    set_source_position : Proc(IXAPOHrtfParameters*, HrtfPosition*, HRESULT)
    set_source_orientation : Proc(IXAPOHrtfParameters*, HrtfOrientation*, HRESULT)
    set_source_gain : Proc(IXAPOHrtfParameters*, Float32, HRESULT)
    set_environment : Proc(IXAPOHrtfParameters*, HrtfEnvironment, HRESULT)
  end

  IXAPOHrtfParameters_GUID = "15b3cd66-e9de-4464-b6e6-2bc3cf63d455"
  IID_IXAPOHrtfParameters = LibC::GUID.new(0x15b3cd66_u32, 0xe9de_u16, 0x4464_u16, StaticArray[0xb6_u8, 0xe6_u8, 0x2b_u8, 0xc3_u8, 0xcf_u8, 0x63_u8, 0xd4_u8, 0x55_u8])
  struct IXAPOHrtfParameters
    lpVtbl : IXAPOHrtfParametersVTbl*
  end


  # Params # clsid : Guid* [In],peffect : IUnknown* [In],pinitdat : Void* [In],initdatabytesize : UInt32 [In]
  fun CreateFX(clsid : Guid*, peffect : IUnknown*, pinitdat : Void*, initdatabytesize : UInt32) : HRESULT

  # Params # ppxaudio2 : IXAudio2* [In],flags : UInt32 [In],xaudio2processor : UInt32 [In],ntddiversion : UInt32 [In]
  fun XAudio2CreateWithVersionInfo(ppxaudio2 : IXAudio2*, flags : UInt32, xaudio2processor : UInt32, ntddiversion : UInt32) : HRESULT

  # Params # ppapo : IUnknown* [In]
  fun CreateAudioVolumeMeter(ppapo : IUnknown*) : HRESULT

  # Params # ppapo : IUnknown* [In]
  fun CreateAudioReverb(ppapo : IUnknown*) : HRESULT

  # Params # init : HrtfApoInit* [In],xapo : IXAPO* [In]
  fun CreateHrtfApo(init : HrtfApoInit*, xapo : IXAPO*) : HRESULT
end
struct LibWin32::IXAPO
  def query_interface(this : IXAPO*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAPO*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAPO*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_registration_properties(this : IXAPO*, ppregistrationproperties : XAPO_REGISTRATION_PROPERTIES**) : HRESULT
    @lpVtbl.value.get_registration_properties.call(this, ppregistrationproperties)
  end
  def is_input_format_supported(this : IXAPO*, poutputformat : WAVEFORMATEX*, prequestedinputformat : WAVEFORMATEX*, ppsupportedinputformat : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.is_input_format_supported.call(this, poutputformat, prequestedinputformat, ppsupportedinputformat)
  end
  def is_output_format_supported(this : IXAPO*, pinputformat : WAVEFORMATEX*, prequestedoutputformat : WAVEFORMATEX*, ppsupportedoutputformat : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.is_output_format_supported.call(this, pinputformat, prequestedoutputformat, ppsupportedoutputformat)
  end
  def initialize(this : IXAPO*, pdata : Void*, databytesize : UInt32) : HRESULT
    @lpVtbl.value.initialize.call(this, pdata, databytesize)
  end
  def reset(this : IXAPO*) : Void
    @lpVtbl.value.reset.call(this)
  end
  def lock_for_process(this : IXAPO*, inputlockedparametercount : UInt32, pinputlockedparameters : XAPO_LOCKFORPROCESS_PARAMETERS*, outputlockedparametercount : UInt32, poutputlockedparameters : XAPO_LOCKFORPROCESS_PARAMETERS*) : HRESULT
    @lpVtbl.value.lock_for_process.call(this, inputlockedparametercount, pinputlockedparameters, outputlockedparametercount, poutputlockedparameters)
  end
  def unlock_for_process(this : IXAPO*) : Void
    @lpVtbl.value.unlock_for_process.call(this)
  end
  def process(this : IXAPO*, inputprocessparametercount : UInt32, pinputprocessparameters : XAPO_PROCESS_BUFFER_PARAMETERS*, outputprocessparametercount : UInt32, poutputprocessparameters : XAPO_PROCESS_BUFFER_PARAMETERS*, isenabled : LibC::BOOL) : Void
    @lpVtbl.value.process.call(this, inputprocessparametercount, pinputprocessparameters, outputprocessparametercount, poutputprocessparameters, isenabled)
  end
  def calc_input_frames(this : IXAPO*, outputframecount : UInt32) : UInt32
    @lpVtbl.value.calc_input_frames.call(this, outputframecount)
  end
  def calc_output_frames(this : IXAPO*, inputframecount : UInt32) : UInt32
    @lpVtbl.value.calc_output_frames.call(this, inputframecount)
  end
end
struct LibWin32::IXAPOParameters
  def query_interface(this : IXAPOParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAPOParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAPOParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_parameters(this : IXAPOParameters*, pparameters : Void*, parameterbytesize : UInt32) : Void
    @lpVtbl.value.set_parameters.call(this, pparameters, parameterbytesize)
  end
  def get_parameters(this : IXAPOParameters*, pparameters : Void*, parameterbytesize : UInt32) : Void
    @lpVtbl.value.get_parameters.call(this, pparameters, parameterbytesize)
  end
end
struct LibWin32::IXAudio2
  def query_interface(this : IXAudio2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAudio2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAudio2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_for_callbacks(this : IXAudio2*, pcallback : IXAudio2EngineCallback) : HRESULT
    @lpVtbl.value.register_for_callbacks.call(this, pcallback)
  end
  def unregister_for_callbacks(this : IXAudio2*, pcallback : IXAudio2EngineCallback) : Void
    @lpVtbl.value.unregister_for_callbacks.call(this, pcallback)
  end
  def create_source_voice(this : IXAudio2*, ppsourcevoice : IXAudio2SourceVoice*, psourceformat : WAVEFORMATEX*, flags : UInt32, maxfrequencyratio : Float32, pcallback : IXAudio2VoiceCallback, psendlist : XAUDIO2_VOICE_SENDS*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.create_source_voice.call(this, ppsourcevoice, psourceformat, flags, maxfrequencyratio, pcallback, psendlist, peffectchain)
  end
  def create_submix_voice(this : IXAudio2*, ppsubmixvoice : IXAudio2SubmixVoice*, inputchannels : UInt32, inputsamplerate : UInt32, flags : UInt32, processingstage : UInt32, psendlist : XAUDIO2_VOICE_SENDS*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.create_submix_voice.call(this, ppsubmixvoice, inputchannels, inputsamplerate, flags, processingstage, psendlist, peffectchain)
  end
  def create_mastering_voice(this : IXAudio2*, ppmasteringvoice : IXAudio2MasteringVoice*, inputchannels : UInt32, inputsamplerate : UInt32, flags : UInt32, szdeviceid : LibC::LPWSTR, peffectchain : XAUDIO2_EFFECT_CHAIN*, streamcategory : AUDIO_STREAM_CATEGORY) : HRESULT
    @lpVtbl.value.create_mastering_voice.call(this, ppmasteringvoice, inputchannels, inputsamplerate, flags, szdeviceid, peffectchain, streamcategory)
  end
  def start_engine(this : IXAudio2*) : HRESULT
    @lpVtbl.value.start_engine.call(this)
  end
  def stop_engine(this : IXAudio2*) : Void
    @lpVtbl.value.stop_engine.call(this)
  end
  def commit_changes(this : IXAudio2*, operationset : UInt32) : HRESULT
    @lpVtbl.value.commit_changes.call(this, operationset)
  end
  def get_performance_data(this : IXAudio2*, pperfdata : XAUDIO2_PERFORMANCE_DATA*) : Void
    @lpVtbl.value.get_performance_data.call(this, pperfdata)
  end
  def set_debug_configuration(this : IXAudio2*, pdebugconfiguration : XAUDIO2_DEBUG_CONFIGURATION*, preserved : Void*) : Void
    @lpVtbl.value.set_debug_configuration.call(this, pdebugconfiguration, preserved)
  end
end
struct LibWin32::IXAudio2Extension
  def query_interface(this : IXAudio2Extension*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAudio2Extension*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAudio2Extension*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_processing_quantum(this : IXAudio2Extension*, quantumnumerator : UInt32*, quantumdenominator : UInt32*) : Void
    @lpVtbl.value.get_processing_quantum.call(this, quantumnumerator, quantumdenominator)
  end
  def get_processor(this : IXAudio2Extension*, processor : UInt32*) : Void
    @lpVtbl.value.get_processor.call(this, processor)
  end
end
struct LibWin32::IXAudio2Voice
  def get_voice_details(this : IXAudio2Voice*, pvoicedetails : XAUDIO2_VOICE_DETAILS*) : Void
    @lpVtbl.value.get_voice_details.call(this, pvoicedetails)
  end
  def set_output_voices(this : IXAudio2Voice*, psendlist : XAUDIO2_VOICE_SENDS*) : HRESULT
    @lpVtbl.value.set_output_voices.call(this, psendlist)
  end
  def set_effect_chain(this : IXAudio2Voice*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.set_effect_chain.call(this, peffectchain)
  end
  def enable_effect(this : IXAudio2Voice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.enable_effect.call(this, effectindex, operationset)
  end
  def disable_effect(this : IXAudio2Voice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.disable_effect.call(this, effectindex, operationset)
  end
  def get_effect_state(this : IXAudio2Voice*, effectindex : UInt32, penabled : LibC::BOOL*) : Void
    @lpVtbl.value.get_effect_state.call(this, effectindex, penabled)
  end
  def set_effect_parameters(this : IXAudio2Voice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_effect_parameters.call(this, effectindex, pparameters, parametersbytesize, operationset)
  end
  def get_effect_parameters(this : IXAudio2Voice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32) : HRESULT
    @lpVtbl.value.get_effect_parameters.call(this, effectindex, pparameters, parametersbytesize)
  end
  def set_filter_parameters(this : IXAudio2Voice*, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_filter_parameters.call(this, pparameters, operationset)
  end
  def get_filter_parameters(this : IXAudio2Voice*, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_filter_parameters.call(this, pparameters)
  end
  def set_output_filter_parameters(this : IXAudio2Voice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_filter_parameters.call(this, pdestinationvoice, pparameters, operationset)
  end
  def get_output_filter_parameters(this : IXAudio2Voice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_output_filter_parameters.call(this, pdestinationvoice, pparameters)
  end
  def set_volume(this : IXAudio2Voice*, volume : Float32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_volume.call(this, volume, operationset)
  end
  def get_volume(this : IXAudio2Voice*, pvolume : Float32*) : Void
    @lpVtbl.value.get_volume.call(this, pvolume)
  end
  def set_channel_volumes(this : IXAudio2Voice*, channels : UInt32, pvolumes : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_channel_volumes.call(this, channels, pvolumes, operationset)
  end
  def get_channel_volumes(this : IXAudio2Voice*, channels : UInt32, pvolumes : Float32*) : Void
    @lpVtbl.value.get_channel_volumes.call(this, channels, pvolumes)
  end
  def set_output_matrix(this : IXAudio2Voice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix, operationset)
  end
  def get_output_matrix(this : IXAudio2Voice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*) : Void
    @lpVtbl.value.get_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix)
  end
  def destroy_voice(this : IXAudio2Voice*) : Void
    @lpVtbl.value.destroy_voice.call(this)
  end
end
struct LibWin32::IXAudio2SourceVoice
  def get_voice_details(this : IXAudio2SourceVoice*, pvoicedetails : XAUDIO2_VOICE_DETAILS*) : Void
    @lpVtbl.value.get_voice_details.call(this, pvoicedetails)
  end
  def set_output_voices(this : IXAudio2SourceVoice*, psendlist : XAUDIO2_VOICE_SENDS*) : HRESULT
    @lpVtbl.value.set_output_voices.call(this, psendlist)
  end
  def set_effect_chain(this : IXAudio2SourceVoice*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.set_effect_chain.call(this, peffectchain)
  end
  def enable_effect(this : IXAudio2SourceVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.enable_effect.call(this, effectindex, operationset)
  end
  def disable_effect(this : IXAudio2SourceVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.disable_effect.call(this, effectindex, operationset)
  end
  def get_effect_state(this : IXAudio2SourceVoice*, effectindex : UInt32, penabled : LibC::BOOL*) : Void
    @lpVtbl.value.get_effect_state.call(this, effectindex, penabled)
  end
  def set_effect_parameters(this : IXAudio2SourceVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_effect_parameters.call(this, effectindex, pparameters, parametersbytesize, operationset)
  end
  def get_effect_parameters(this : IXAudio2SourceVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32) : HRESULT
    @lpVtbl.value.get_effect_parameters.call(this, effectindex, pparameters, parametersbytesize)
  end
  def set_filter_parameters(this : IXAudio2SourceVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_filter_parameters.call(this, pparameters, operationset)
  end
  def get_filter_parameters(this : IXAudio2SourceVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_filter_parameters.call(this, pparameters)
  end
  def set_output_filter_parameters(this : IXAudio2SourceVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_filter_parameters.call(this, pdestinationvoice, pparameters, operationset)
  end
  def get_output_filter_parameters(this : IXAudio2SourceVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_output_filter_parameters.call(this, pdestinationvoice, pparameters)
  end
  def set_volume(this : IXAudio2SourceVoice*, volume : Float32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_volume.call(this, volume, operationset)
  end
  def get_volume(this : IXAudio2SourceVoice*, pvolume : Float32*) : Void
    @lpVtbl.value.get_volume.call(this, pvolume)
  end
  def set_channel_volumes(this : IXAudio2SourceVoice*, channels : UInt32, pvolumes : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_channel_volumes.call(this, channels, pvolumes, operationset)
  end
  def get_channel_volumes(this : IXAudio2SourceVoice*, channels : UInt32, pvolumes : Float32*) : Void
    @lpVtbl.value.get_channel_volumes.call(this, channels, pvolumes)
  end
  def set_output_matrix(this : IXAudio2SourceVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix, operationset)
  end
  def get_output_matrix(this : IXAudio2SourceVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*) : Void
    @lpVtbl.value.get_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix)
  end
  def destroy_voice(this : IXAudio2SourceVoice*) : Void
    @lpVtbl.value.destroy_voice.call(this)
  end
  def start(this : IXAudio2SourceVoice*, flags : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.start.call(this, flags, operationset)
  end
  def stop(this : IXAudio2SourceVoice*, flags : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.stop.call(this, flags, operationset)
  end
  def submit_source_buffer(this : IXAudio2SourceVoice*, pbuffer : XAUDIO2_BUFFER*, pbufferwma : XAUDIO2_BUFFER_WMA*) : HRESULT
    @lpVtbl.value.submit_source_buffer.call(this, pbuffer, pbufferwma)
  end
  def flush_source_buffers(this : IXAudio2SourceVoice*) : HRESULT
    @lpVtbl.value.flush_source_buffers.call(this)
  end
  def discontinuity(this : IXAudio2SourceVoice*) : HRESULT
    @lpVtbl.value.discontinuity.call(this)
  end
  def exit_loop(this : IXAudio2SourceVoice*, operationset : UInt32) : HRESULT
    @lpVtbl.value.exit_loop.call(this, operationset)
  end
  def get_state(this : IXAudio2SourceVoice*, pvoicestate : XAUDIO2_VOICE_STATE*, flags : UInt32) : Void
    @lpVtbl.value.get_state.call(this, pvoicestate, flags)
  end
  def set_frequency_ratio(this : IXAudio2SourceVoice*, ratio : Float32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_frequency_ratio.call(this, ratio, operationset)
  end
  def get_frequency_ratio(this : IXAudio2SourceVoice*, pratio : Float32*) : Void
    @lpVtbl.value.get_frequency_ratio.call(this, pratio)
  end
  def set_source_sample_rate(this : IXAudio2SourceVoice*, newsourcesamplerate : UInt32) : HRESULT
    @lpVtbl.value.set_source_sample_rate.call(this, newsourcesamplerate)
  end
end
struct LibWin32::IXAudio2SubmixVoice
  def get_voice_details(this : IXAudio2SubmixVoice*, pvoicedetails : XAUDIO2_VOICE_DETAILS*) : Void
    @lpVtbl.value.get_voice_details.call(this, pvoicedetails)
  end
  def set_output_voices(this : IXAudio2SubmixVoice*, psendlist : XAUDIO2_VOICE_SENDS*) : HRESULT
    @lpVtbl.value.set_output_voices.call(this, psendlist)
  end
  def set_effect_chain(this : IXAudio2SubmixVoice*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.set_effect_chain.call(this, peffectchain)
  end
  def enable_effect(this : IXAudio2SubmixVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.enable_effect.call(this, effectindex, operationset)
  end
  def disable_effect(this : IXAudio2SubmixVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.disable_effect.call(this, effectindex, operationset)
  end
  def get_effect_state(this : IXAudio2SubmixVoice*, effectindex : UInt32, penabled : LibC::BOOL*) : Void
    @lpVtbl.value.get_effect_state.call(this, effectindex, penabled)
  end
  def set_effect_parameters(this : IXAudio2SubmixVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_effect_parameters.call(this, effectindex, pparameters, parametersbytesize, operationset)
  end
  def get_effect_parameters(this : IXAudio2SubmixVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32) : HRESULT
    @lpVtbl.value.get_effect_parameters.call(this, effectindex, pparameters, parametersbytesize)
  end
  def set_filter_parameters(this : IXAudio2SubmixVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_filter_parameters.call(this, pparameters, operationset)
  end
  def get_filter_parameters(this : IXAudio2SubmixVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_filter_parameters.call(this, pparameters)
  end
  def set_output_filter_parameters(this : IXAudio2SubmixVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_filter_parameters.call(this, pdestinationvoice, pparameters, operationset)
  end
  def get_output_filter_parameters(this : IXAudio2SubmixVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_output_filter_parameters.call(this, pdestinationvoice, pparameters)
  end
  def set_volume(this : IXAudio2SubmixVoice*, volume : Float32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_volume.call(this, volume, operationset)
  end
  def get_volume(this : IXAudio2SubmixVoice*, pvolume : Float32*) : Void
    @lpVtbl.value.get_volume.call(this, pvolume)
  end
  def set_channel_volumes(this : IXAudio2SubmixVoice*, channels : UInt32, pvolumes : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_channel_volumes.call(this, channels, pvolumes, operationset)
  end
  def get_channel_volumes(this : IXAudio2SubmixVoice*, channels : UInt32, pvolumes : Float32*) : Void
    @lpVtbl.value.get_channel_volumes.call(this, channels, pvolumes)
  end
  def set_output_matrix(this : IXAudio2SubmixVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix, operationset)
  end
  def get_output_matrix(this : IXAudio2SubmixVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*) : Void
    @lpVtbl.value.get_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix)
  end
  def destroy_voice(this : IXAudio2SubmixVoice*) : Void
    @lpVtbl.value.destroy_voice.call(this)
  end
end
struct LibWin32::IXAudio2MasteringVoice
  def get_voice_details(this : IXAudio2MasteringVoice*, pvoicedetails : XAUDIO2_VOICE_DETAILS*) : Void
    @lpVtbl.value.get_voice_details.call(this, pvoicedetails)
  end
  def set_output_voices(this : IXAudio2MasteringVoice*, psendlist : XAUDIO2_VOICE_SENDS*) : HRESULT
    @lpVtbl.value.set_output_voices.call(this, psendlist)
  end
  def set_effect_chain(this : IXAudio2MasteringVoice*, peffectchain : XAUDIO2_EFFECT_CHAIN*) : HRESULT
    @lpVtbl.value.set_effect_chain.call(this, peffectchain)
  end
  def enable_effect(this : IXAudio2MasteringVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.enable_effect.call(this, effectindex, operationset)
  end
  def disable_effect(this : IXAudio2MasteringVoice*, effectindex : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.disable_effect.call(this, effectindex, operationset)
  end
  def get_effect_state(this : IXAudio2MasteringVoice*, effectindex : UInt32, penabled : LibC::BOOL*) : Void
    @lpVtbl.value.get_effect_state.call(this, effectindex, penabled)
  end
  def set_effect_parameters(this : IXAudio2MasteringVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_effect_parameters.call(this, effectindex, pparameters, parametersbytesize, operationset)
  end
  def get_effect_parameters(this : IXAudio2MasteringVoice*, effectindex : UInt32, pparameters : Void*, parametersbytesize : UInt32) : HRESULT
    @lpVtbl.value.get_effect_parameters.call(this, effectindex, pparameters, parametersbytesize)
  end
  def set_filter_parameters(this : IXAudio2MasteringVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_filter_parameters.call(this, pparameters, operationset)
  end
  def get_filter_parameters(this : IXAudio2MasteringVoice*, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_filter_parameters.call(this, pparameters)
  end
  def set_output_filter_parameters(this : IXAudio2MasteringVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_filter_parameters.call(this, pdestinationvoice, pparameters, operationset)
  end
  def get_output_filter_parameters(this : IXAudio2MasteringVoice*, pdestinationvoice : IXAudio2Voice, pparameters : XAUDIO2_FILTER_PARAMETERS*) : Void
    @lpVtbl.value.get_output_filter_parameters.call(this, pdestinationvoice, pparameters)
  end
  def set_volume(this : IXAudio2MasteringVoice*, volume : Float32, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_volume.call(this, volume, operationset)
  end
  def get_volume(this : IXAudio2MasteringVoice*, pvolume : Float32*) : Void
    @lpVtbl.value.get_volume.call(this, pvolume)
  end
  def set_channel_volumes(this : IXAudio2MasteringVoice*, channels : UInt32, pvolumes : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_channel_volumes.call(this, channels, pvolumes, operationset)
  end
  def get_channel_volumes(this : IXAudio2MasteringVoice*, channels : UInt32, pvolumes : Float32*) : Void
    @lpVtbl.value.get_channel_volumes.call(this, channels, pvolumes)
  end
  def set_output_matrix(this : IXAudio2MasteringVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*, operationset : UInt32) : HRESULT
    @lpVtbl.value.set_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix, operationset)
  end
  def get_output_matrix(this : IXAudio2MasteringVoice*, pdestinationvoice : IXAudio2Voice, sourcechannels : UInt32, destinationchannels : UInt32, plevelmatrix : Float32*) : Void
    @lpVtbl.value.get_output_matrix.call(this, pdestinationvoice, sourcechannels, destinationchannels, plevelmatrix)
  end
  def destroy_voice(this : IXAudio2MasteringVoice*) : Void
    @lpVtbl.value.destroy_voice.call(this)
  end
  def get_channel_mask(this : IXAudio2MasteringVoice*, pchannelmask : UInt32*) : HRESULT
    @lpVtbl.value.get_channel_mask.call(this, pchannelmask)
  end
end
struct LibWin32::IXAudio2EngineCallback
  def on_processing_pass_start(this : IXAudio2EngineCallback*) : Void
    @lpVtbl.value.on_processing_pass_start.call(this)
  end
  def on_processing_pass_end(this : IXAudio2EngineCallback*) : Void
    @lpVtbl.value.on_processing_pass_end.call(this)
  end
  def on_critical_error(this : IXAudio2EngineCallback*, error : HRESULT) : Void
    @lpVtbl.value.on_critical_error.call(this, error)
  end
end
struct LibWin32::IXAudio2VoiceCallback
  def on_voice_processing_pass_start(this : IXAudio2VoiceCallback*, bytesrequired : UInt32) : Void
    @lpVtbl.value.on_voice_processing_pass_start.call(this, bytesrequired)
  end
  def on_voice_processing_pass_end(this : IXAudio2VoiceCallback*) : Void
    @lpVtbl.value.on_voice_processing_pass_end.call(this)
  end
  def on_stream_end(this : IXAudio2VoiceCallback*) : Void
    @lpVtbl.value.on_stream_end.call(this)
  end
  def on_buffer_start(this : IXAudio2VoiceCallback*, pbuffercontext : Void*) : Void
    @lpVtbl.value.on_buffer_start.call(this, pbuffercontext)
  end
  def on_buffer_end(this : IXAudio2VoiceCallback*, pbuffercontext : Void*) : Void
    @lpVtbl.value.on_buffer_end.call(this, pbuffercontext)
  end
  def on_loop_end(this : IXAudio2VoiceCallback*, pbuffercontext : Void*) : Void
    @lpVtbl.value.on_loop_end.call(this, pbuffercontext)
  end
  def on_voice_error(this : IXAudio2VoiceCallback*, pbuffercontext : Void*, error : HRESULT) : Void
    @lpVtbl.value.on_voice_error.call(this, pbuffercontext, error)
  end
end
struct LibWin32::IXAPOHrtfParameters
  def query_interface(this : IXAPOHrtfParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAPOHrtfParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAPOHrtfParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_source_position(this : IXAPOHrtfParameters*, position : HrtfPosition*) : HRESULT
    @lpVtbl.value.set_source_position.call(this, position)
  end
  def set_source_orientation(this : IXAPOHrtfParameters*, orientation : HrtfOrientation*) : HRESULT
    @lpVtbl.value.set_source_orientation.call(this, orientation)
  end
  def set_source_gain(this : IXAPOHrtfParameters*, gain : Float32) : HRESULT
    @lpVtbl.value.set_source_gain.call(this, gain)
  end
  def set_environment(this : IXAPOHrtfParameters*, environment : HrtfEnvironment) : HRESULT
    @lpVtbl.value.set_environment.call(this, environment)
  end
end
