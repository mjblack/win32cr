require "./../audio.cr"
require "./../../system/com.cr"
require "./../../foundation.cr"

module Win32cr::Media::Audio::XAudio2
  FXEQ_MIN_FRAMERATE = 22000_u32
  FXEQ_MAX_FRAMERATE = 48000_u32
  FXEQ_MIN_FREQUENCY_CENTER = 20
  FXEQ_MAX_FREQUENCY_CENTER = 20000
  FXEQ_DEFAULT_FREQUENCY_CENTER_0 = 100
  FXEQ_DEFAULT_FREQUENCY_CENTER_1 = 800
  FXEQ_DEFAULT_FREQUENCY_CENTER_2 = 2000
  FXEQ_DEFAULT_FREQUENCY_CENTER_3 = 10000
  FXEQ_MIN_GAIN = 0.126
  FXEQ_MAX_GAIN = 7.94
  FXEQ_DEFAULT_GAIN = 1
  FXEQ_MIN_BANDWIDTH = 0.1
  FXEQ_MAX_BANDWIDTH = 2
  FXEQ_DEFAULT_BANDWIDTH = 1
  FXMASTERINGLIMITER_MIN_RELEASE = 1_u32
  FXMASTERINGLIMITER_MAX_RELEASE = 20_u32
  FXMASTERINGLIMITER_DEFAULT_RELEASE = 6_u32
  FXMASTERINGLIMITER_MIN_LOUDNESS = 1_u32
  FXMASTERINGLIMITER_MAX_LOUDNESS = 1800_u32
  FXMASTERINGLIMITER_DEFAULT_LOUDNESS = 1000_u32
  FXREVERB_MIN_DIFFUSION = 0
  FXREVERB_MAX_DIFFUSION = 1
  FXREVERB_DEFAULT_DIFFUSION = 0.9
  FXREVERB_MIN_ROOMSIZE = 0.0001
  FXREVERB_MAX_ROOMSIZE = 1
  FXREVERB_DEFAULT_ROOMSIZE = 0.6
  FXLOUDNESS_DEFAULT_MOMENTARY_MS = 400_u32
  FXLOUDNESS_DEFAULT_SHORTTERM_MS = 3000_u32
  FXECHO_MIN_WETDRYMIX = 0
  FXECHO_MAX_WETDRYMIX = 1
  FXECHO_DEFAULT_WETDRYMIX = 0.5
  FXECHO_MIN_FEEDBACK = 0
  FXECHO_MAX_FEEDBACK = 1
  FXECHO_DEFAULT_FEEDBACK = 0.5
  FXECHO_MIN_DELAY = 1
  FXECHO_MAX_DELAY = 2000
  FXECHO_DEFAULT_DELAY = 500
  XAUDIO2_DLL_A = "xaudio2_9.dll"
  XAUDIO2_DLL_W = "xaudio2_9.dll"
  XAUDIO2D_DLL_A = "xaudio2_9d.dll"
  XAUDIO2D_DLL_W = "xaudio2_9d.dll"
  XAUDIO2_DLL = "xaudio2_9.dll"
  XAUDIO2D_DLL = "xaudio2_9d.dll"
  XAUDIO2_MAX_BUFFER_BYTES = 2147483648_u32
  XAUDIO2_MAX_QUEUED_BUFFERS = 64_u32
  XAUDIO2_MAX_BUFFERS_SYSTEM = 2_u32
  XAUDIO2_MAX_AUDIO_CHANNELS = 64_u32
  XAUDIO2_MIN_SAMPLE_RATE = 1000_u32
  XAUDIO2_MAX_SAMPLE_RATE = 200000_u32
  XAUDIO2_MAX_VOLUME_LEVEL = 16777216
  XAUDIO2_MAX_FREQ_RATIO = 1024
  XAUDIO2_DEFAULT_FREQ_RATIO = 2
  XAUDIO2_MAX_FILTER_ONEOVERQ = 1.5
  XAUDIO2_MAX_FILTER_FREQUENCY = 1
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
  XAUDIO2_DEFAULT_FILTER_FREQUENCY = 1
  XAUDIO2_DEFAULT_FILTER_ONEOVERQ = 1
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
  XAUDIO2FX_REVERB_MIN_WET_DRY_MIX = 0
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
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_FREQ = 20
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_MAIN = -100
  XAUDIO2FX_REVERB_MIN_ROOM_FILTER_HF = -100
  XAUDIO2FX_REVERB_MIN_REFLECTIONS_GAIN = -100
  XAUDIO2FX_REVERB_MIN_REVERB_GAIN = -100
  XAUDIO2FX_REVERB_MIN_DECAY_TIME = 0.1
  XAUDIO2FX_REVERB_MIN_DENSITY = 0
  XAUDIO2FX_REVERB_MIN_ROOM_SIZE = 0
  XAUDIO2FX_REVERB_MAX_WET_DRY_MIX = 100
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
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_FREQ = 20000
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_MAIN = 0
  XAUDIO2FX_REVERB_MAX_ROOM_FILTER_HF = 0
  XAUDIO2FX_REVERB_MAX_REFLECTIONS_GAIN = 20
  XAUDIO2FX_REVERB_MAX_REVERB_GAIN = 20
  XAUDIO2FX_REVERB_MAX_DENSITY = 100
  XAUDIO2FX_REVERB_MAX_ROOM_SIZE = 100
  XAUDIO2FX_REVERB_DEFAULT_WET_DRY_MIX = 100
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
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_FREQ = 5000
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_MAIN = 0
  XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_HF = 0
  XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_GAIN = 0
  XAUDIO2FX_REVERB_DEFAULT_REVERB_GAIN = 0
  XAUDIO2FX_REVERB_DEFAULT_DECAY_TIME = 1
  XAUDIO2FX_REVERB_DEFAULT_DENSITY = 100
  XAUDIO2FX_REVERB_DEFAULT_ROOM_SIZE = 100
  XAUDIO2FX_REVERB_DEFAULT_DISABLE_LATE_FIELD = 0_u32
  HRTF_MAX_GAIN_LIMIT = 12
  HRTF_MIN_GAIN_LIMIT = -96
  HRTF_MIN_UNITY_GAIN_DISTANCE = 0.05
  HRTF_DEFAULT_UNITY_GAIN_DISTANCE = 1
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
  X3DAUDIO_PI = 3.1415927
  X3DAUDIO_2PI = 6.2831855
  X3DAUDIO_SPEED_OF_SOUND = 343.5
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

  enum XAPO_BUFFER_FLAGS
    XAPO_BUFFER_SILENT = 0_i32
    XAPO_BUFFER_VALID = 1_i32
  end
  enum XAUDIO2_FILTER_TYPE
    LowPassFilter = 0_i32
    BandPassFilter = 1_i32
    HighPassFilter = 2_i32
    NotchFilter = 3_i32
    LowPassOnePoleFilter = 4_i32
    HighPassOnePoleFilter = 5_i32
  end
  enum HrtfDirectivityType
    OmniDirectional = 0_i32
    Cardioid = 1_i32
    Cone = 2_i32
  end
  enum HrtfEnvironment
    Small = 0_i32
    Medium = 1_i32
    Large = 2_i32
    Outdoors = 3_i32
  end
  enum HrtfDistanceDecayType
    NaturalDecay = 0_i32
    CustomDecay = 1_i32
  end

  @[Extern]
  struct XAPO_REGISTRATION_PROPERTIES
    property clsid : LibC::GUID
    property friendly_name : UInt16[256]
    property copyright_info : UInt16[256]
    property major_version : UInt32
    property minor_version : UInt32
    property flags : UInt32
    property min_input_buffer_count : UInt32
    property max_input_buffer_count : UInt32
    property min_output_buffer_count : UInt32
    property max_output_buffer_count : UInt32
    def initialize(@clsid : LibC::GUID, @friendly_name : UInt16[256], @copyright_info : UInt16[256], @major_version : UInt32, @minor_version : UInt32, @flags : UInt32, @min_input_buffer_count : UInt32, @max_input_buffer_count : UInt32, @min_output_buffer_count : UInt32, @max_output_buffer_count : UInt32)
    end
  end

  @[Extern]
  struct XAPO_LOCKFORPROCESS_PARAMETERS
    property pFormat : Win32cr::Media::Audio::WAVEFORMATEX*
    property max_frame_count : UInt32
    def initialize(@pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, @max_frame_count : UInt32)
    end
  end

  @[Extern]
  struct XAPO_PROCESS_BUFFER_PARAMETERS
    property pBuffer : Void*
    property buffer_flags : Win32cr::Media::Audio::XAudio2::XAPO_BUFFER_FLAGS
    property valid_frame_count : UInt32
    def initialize(@pBuffer : Void*, @buffer_flags : Win32cr::Media::Audio::XAudio2::XAPO_BUFFER_FLAGS, @valid_frame_count : UInt32)
    end
  end

  @[Extern]
  struct FXEQ_PARAMETERS
    property frequency_center0 : Float32
    property gain0 : Float32
    property bandwidth0 : Float32
    property frequency_center1 : Float32
    property gain1 : Float32
    property bandwidth1 : Float32
    property frequency_center2 : Float32
    property gain2 : Float32
    property bandwidth2 : Float32
    property frequency_center3 : Float32
    property gain3 : Float32
    property bandwidth3 : Float32
    def initialize(@frequency_center0 : Float32, @gain0 : Float32, @bandwidth0 : Float32, @frequency_center1 : Float32, @gain1 : Float32, @bandwidth1 : Float32, @frequency_center2 : Float32, @gain2 : Float32, @bandwidth2 : Float32, @frequency_center3 : Float32, @gain3 : Float32, @bandwidth3 : Float32)
    end
  end

  @[Extern]
  struct FXMASTERINGLIMITER_PARAMETERS
    property release : UInt32
    property loudness : UInt32
    def initialize(@release : UInt32, @loudness : UInt32)
    end
  end

  @[Extern]
  struct FXREVERB_PARAMETERS
    property diffusion : Float32
    property room_size : Float32
    def initialize(@diffusion : Float32, @room_size : Float32)
    end
  end

  @[Extern]
  struct FXECHO_INITDATA
    property max_delay : Float32
    def initialize(@max_delay : Float32)
    end
  end

  @[Extern]
  struct FXECHO_PARAMETERS
    property wet_dry_mix : Float32
    property feedback : Float32
    property delay : Float32
    def initialize(@wet_dry_mix : Float32, @feedback : Float32, @delay : Float32)
    end
  end

  @[Extern]
  struct XAUDIO2_VOICE_DETAILS
    property creation_flags : UInt32
    property active_flags : UInt32
    property input_channels : UInt32
    property input_sample_rate : UInt32
    def initialize(@creation_flags : UInt32, @active_flags : UInt32, @input_channels : UInt32, @input_sample_rate : UInt32)
    end
  end

  @[Extern]
  struct XAUDIO2_SEND_DESCRIPTOR
    property flags : UInt32
    property pOutputVoice : Void*
    def initialize(@flags : UInt32, @pOutputVoice : Void*)
    end
  end

  @[Extern]
  struct XAUDIO2_VOICE_SENDS
    property send_count : UInt32
    property pSends : Win32cr::Media::Audio::XAudio2::XAUDIO2_SEND_DESCRIPTOR*
    def initialize(@send_count : UInt32, @pSends : Win32cr::Media::Audio::XAudio2::XAUDIO2_SEND_DESCRIPTOR*)
    end
  end

  @[Extern]
  struct XAUDIO2_EFFECT_DESCRIPTOR
    property pEffect : Void*
    property initial_state : Win32cr::Foundation::BOOL
    property output_channels : UInt32
    def initialize(@pEffect : Void*, @initial_state : Win32cr::Foundation::BOOL, @output_channels : UInt32)
    end
  end

  @[Extern]
  struct XAUDIO2_EFFECT_CHAIN
    property effect_count : UInt32
    property pEffectDescriptors : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_DESCRIPTOR*
    def initialize(@effect_count : UInt32, @pEffectDescriptors : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_DESCRIPTOR*)
    end
  end

  @[Extern]
  struct XAUDIO2_FILTER_PARAMETERS
    property type__ : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_TYPE
    property frequency : Float32
    property one_over_q : Float32
    def initialize(@type__ : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_TYPE, @frequency : Float32, @one_over_q : Float32)
    end
  end

  @[Extern]
  struct XAUDIO2_BUFFER
    property flags : UInt32
    property audio_bytes : UInt32
    property pAudioData : UInt8*
    property play_begin : UInt32
    property play_length : UInt32
    property loop_begin : UInt32
    property loop_length : UInt32
    property loop_count : UInt32
    property pContext : Void*
    def initialize(@flags : UInt32, @audio_bytes : UInt32, @pAudioData : UInt8*, @play_begin : UInt32, @play_length : UInt32, @loop_begin : UInt32, @loop_length : UInt32, @loop_count : UInt32, @pContext : Void*)
    end
  end

  @[Extern]
  struct XAUDIO2_BUFFER_WMA
    property pDecodedPacketCumulativeBytes : UInt32*
    property packet_count : UInt32
    def initialize(@pDecodedPacketCumulativeBytes : UInt32*, @packet_count : UInt32)
    end
  end

  @[Extern]
  struct XAUDIO2_VOICE_STATE
    property pCurrentBufferContext : Void*
    property buffers_queued : UInt32
    property samples_played : UInt64
    def initialize(@pCurrentBufferContext : Void*, @buffers_queued : UInt32, @samples_played : UInt64)
    end
  end

  @[Extern]
  struct XAUDIO2_PERFORMANCE_DATA
    property audio_cycles_since_last_query : UInt64
    property total_cycles_since_last_query : UInt64
    property minimum_cycles_per_quantum : UInt32
    property maximum_cycles_per_quantum : UInt32
    property memory_usage_in_bytes : UInt32
    property current_latency_in_samples : UInt32
    property glitches_since_engine_started : UInt32
    property active_source_voice_count : UInt32
    property total_source_voice_count : UInt32
    property active_submix_voice_count : UInt32
    property active_resampler_count : UInt32
    property active_matrix_mix_count : UInt32
    property active_xma_source_voices : UInt32
    property active_xma_streams : UInt32
    def initialize(@audio_cycles_since_last_query : UInt64, @total_cycles_since_last_query : UInt64, @minimum_cycles_per_quantum : UInt32, @maximum_cycles_per_quantum : UInt32, @memory_usage_in_bytes : UInt32, @current_latency_in_samples : UInt32, @glitches_since_engine_started : UInt32, @active_source_voice_count : UInt32, @total_source_voice_count : UInt32, @active_submix_voice_count : UInt32, @active_resampler_count : UInt32, @active_matrix_mix_count : UInt32, @active_xma_source_voices : UInt32, @active_xma_streams : UInt32)
    end
  end

  @[Extern]
  struct XAUDIO2_DEBUG_CONFIGURATION
    property trace_mask : UInt32
    property break_mask : UInt32
    property log_thread_id : Win32cr::Foundation::BOOL
    property log_fileline : Win32cr::Foundation::BOOL
    property log_function_name : Win32cr::Foundation::BOOL
    property log_timing : Win32cr::Foundation::BOOL
    def initialize(@trace_mask : UInt32, @break_mask : UInt32, @log_thread_id : Win32cr::Foundation::BOOL, @log_fileline : Win32cr::Foundation::BOOL, @log_function_name : Win32cr::Foundation::BOOL, @log_timing : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct XAUDIO2FX_VOLUMEMETER_LEVELS
    property pPeakLevels : Float32*
    property pRMSLevels : Float32*
    property channel_count : UInt32
    def initialize(@pPeakLevels : Float32*, @pRMSLevels : Float32*, @channel_count : UInt32)
    end
  end

  @[Extern]
  struct XAUDIO2FX_REVERB_PARAMETERS
    property wet_dry_mix : Float32
    property reflections_delay : UInt32
    property reverb_delay : UInt8
    property rear_delay : UInt8
    property side_delay : UInt8
    property position_left : UInt8
    property position_right : UInt8
    property position_matrix_left : UInt8
    property position_matrix_right : UInt8
    property early_diffusion : UInt8
    property late_diffusion : UInt8
    property low_eq_gain : UInt8
    property low_eq_cutoff : UInt8
    property high_eq_gain : UInt8
    property high_eq_cutoff : UInt8
    property room_filter_freq : Float32
    property room_filter_main : Float32
    property room_filter_hf : Float32
    property reflections_gain : Float32
    property reverb_gain : Float32
    property decay_time : Float32
    property density : Float32
    property room_size : Float32
    property disable_late_field : Win32cr::Foundation::BOOL
    def initialize(@wet_dry_mix : Float32, @reflections_delay : UInt32, @reverb_delay : UInt8, @rear_delay : UInt8, @side_delay : UInt8, @position_left : UInt8, @position_right : UInt8, @position_matrix_left : UInt8, @position_matrix_right : UInt8, @early_diffusion : UInt8, @late_diffusion : UInt8, @low_eq_gain : UInt8, @low_eq_cutoff : UInt8, @high_eq_gain : UInt8, @high_eq_cutoff : UInt8, @room_filter_freq : Float32, @room_filter_main : Float32, @room_filter_hf : Float32, @reflections_gain : Float32, @reverb_gain : Float32, @decay_time : Float32, @density : Float32, @room_size : Float32, @disable_late_field : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct XAUDIO2FX_REVERB_I3DL2_PARAMETERS
    property wet_dry_mix : Float32
    property room : Int32
    property room_hf : Int32
    property room_rolloff_factor : Float32
    property decay_time : Float32
    property decay_hf_ratio : Float32
    property reflections : Int32
    property reflections_delay : Float32
    property reverb : Int32
    property reverb_delay : Float32
    property diffusion : Float32
    property density : Float32
    property hf_reference : Float32
    def initialize(@wet_dry_mix : Float32, @room : Int32, @room_hf : Int32, @room_rolloff_factor : Float32, @decay_time : Float32, @decay_hf_ratio : Float32, @reflections : Int32, @reflections_delay : Float32, @reverb : Int32, @reverb_delay : Float32, @diffusion : Float32, @density : Float32, @hf_reference : Float32)
    end
  end

  @[Extern]
  struct HrtfPosition
    property x : Float32
    property y : Float32
    property z : Float32
    def initialize(@x : Float32, @y : Float32, @z : Float32)
    end
  end

  @[Extern]
  struct HrtfOrientation
    property element : Float32[9]
    def initialize(@element : Float32[9])
    end
  end

  @[Extern]
  struct HrtfDirectivity
    property type__ : Win32cr::Media::Audio::XAudio2::HrtfDirectivityType
    property scaling : Float32
    def initialize(@type__ : Win32cr::Media::Audio::XAudio2::HrtfDirectivityType, @scaling : Float32)
    end
  end

  @[Extern]
  struct HrtfDirectivityCardioid
    property directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity
    property order : Float32
    def initialize(@directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity, @order : Float32)
    end
  end

  @[Extern]
  struct HrtfDirectivityCone
    property directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity
    property innerAngle : Float32
    property outerAngle : Float32
    def initialize(@directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity, @innerAngle : Float32, @outerAngle : Float32)
    end
  end

  @[Extern]
  struct HrtfDistanceDecay
    property type__ : Win32cr::Media::Audio::XAudio2::HrtfDistanceDecayType
    property maxGain : Float32
    property minGain : Float32
    property unityGainDistance : Float32
    property cutoffDistance : Float32
    def initialize(@type__ : Win32cr::Media::Audio::XAudio2::HrtfDistanceDecayType, @maxGain : Float32, @minGain : Float32, @unityGainDistance : Float32, @cutoffDistance : Float32)
    end
  end

  @[Extern]
  struct HrtfApoInit
    property distanceDecay : Win32cr::Media::Audio::XAudio2::HrtfDistanceDecay*
    property directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity*
    def initialize(@distanceDecay : Win32cr::Media::Audio::XAudio2::HrtfDistanceDecay*, @directivity : Win32cr::Media::Audio::XAudio2::HrtfDirectivity*)
    end
  end

  @[Extern]
  record IXAPOVtbl,
    query_interface : Proc(IXAPO*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAPO*, UInt32),
    release : Proc(IXAPO*, UInt32),
    get_registration_properties : Proc(IXAPO*, Win32cr::Media::Audio::XAudio2::XAPO_REGISTRATION_PROPERTIES**, Win32cr::Foundation::HRESULT),
    is_input_format_supported : Proc(IXAPO*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    is_output_format_supported : Proc(IXAPO*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IXAPO*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IXAPO*, Void),
    lock_for_process : Proc(IXAPO*, UInt32, Win32cr::Media::Audio::XAudio2::XAPO_LOCKFORPROCESS_PARAMETERS*, UInt32, Win32cr::Media::Audio::XAudio2::XAPO_LOCKFORPROCESS_PARAMETERS*, Win32cr::Foundation::HRESULT),
    unlock_for_process : Proc(IXAPO*, Void),
    process : Proc(IXAPO*, UInt32, Win32cr::Media::Audio::XAudio2::XAPO_PROCESS_BUFFER_PARAMETERS*, UInt32, Win32cr::Media::Audio::XAudio2::XAPO_PROCESS_BUFFER_PARAMETERS*, Win32cr::Foundation::BOOL, Void),
    calc_input_frames : Proc(IXAPO*, UInt32, UInt32),
    calc_output_frames : Proc(IXAPO*, UInt32, UInt32)


  @[Extern]
  record IXAPO, lpVtbl : IXAPOVtbl* do
    GUID = LibC::GUID.new(0xa410b984_u32, 0x9839_u16, 0x4819_u16, StaticArray[0xa0_u8, 0xbe_u8, 0x28_u8, 0x56_u8, 0xae_u8, 0x6b_u8, 0x3a_u8, 0xdb_u8])
    def query_interface(this : IXAPO*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAPO*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAPO*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_registration_properties(this : IXAPO*, ppRegistrationProperties : Win32cr::Media::Audio::XAudio2::XAPO_REGISTRATION_PROPERTIES**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registration_properties.call(this, ppRegistrationProperties)
    end
    def is_input_format_supported(this : IXAPO*, pOutputFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pRequestedInputFormat : Win32cr::Media::Audio::WAVEFORMATEX*, ppSupportedInputFormat : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_input_format_supported.call(this, pOutputFormat, pRequestedInputFormat, ppSupportedInputFormat)
    end
    def is_output_format_supported(this : IXAPO*, pInputFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pRequestedOutputFormat : Win32cr::Media::Audio::WAVEFORMATEX*, ppSupportedOutputFormat : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_output_format_supported.call(this, pInputFormat, pRequestedOutputFormat, ppSupportedOutputFormat)
    end
    def initialize__(this : IXAPO*, pData : Void*, data_byte_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pData, data_byte_size)
    end
    def reset(this : IXAPO*) : Void
      @lpVtbl.try &.value.reset.call(this)
    end
    def lock_for_process(this : IXAPO*, input_locked_parameter_count : UInt32, pInputLockedParameters : Win32cr::Media::Audio::XAudio2::XAPO_LOCKFORPROCESS_PARAMETERS*, output_locked_parameter_count : UInt32, pOutputLockedParameters : Win32cr::Media::Audio::XAudio2::XAPO_LOCKFORPROCESS_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_for_process.call(this, input_locked_parameter_count, pInputLockedParameters, output_locked_parameter_count, pOutputLockedParameters)
    end
    def unlock_for_process(this : IXAPO*) : Void
      @lpVtbl.try &.value.unlock_for_process.call(this)
    end
    def process(this : IXAPO*, input_process_parameter_count : UInt32, pInputProcessParameters : Win32cr::Media::Audio::XAudio2::XAPO_PROCESS_BUFFER_PARAMETERS*, output_process_parameter_count : UInt32, pOutputProcessParameters : Win32cr::Media::Audio::XAudio2::XAPO_PROCESS_BUFFER_PARAMETERS*, is_enabled : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.process.call(this, input_process_parameter_count, pInputProcessParameters, output_process_parameter_count, pOutputProcessParameters, is_enabled)
    end
    def calc_input_frames(this : IXAPO*, output_frame_count : UInt32) : UInt32
      @lpVtbl.try &.value.calc_input_frames.call(this, output_frame_count)
    end
    def calc_output_frames(this : IXAPO*, input_frame_count : UInt32) : UInt32
      @lpVtbl.try &.value.calc_output_frames.call(this, input_frame_count)
    end

  end

  @[Extern]
  record IXAPOParametersVtbl,
    query_interface : Proc(IXAPOParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAPOParameters*, UInt32),
    release : Proc(IXAPOParameters*, UInt32),
    set_parameters : Proc(IXAPOParameters*, Void*, UInt32, Void),
    get_parameters : Proc(IXAPOParameters*, Void*, UInt32, Void)


  @[Extern]
  record IXAPOParameters, lpVtbl : IXAPOParametersVtbl* do
    GUID = LibC::GUID.new(0x26d95c66_u32, 0x80f2_u16, 0x499a_u16, StaticArray[0xad_u8, 0x54_u8, 0x5a_u8, 0xe7_u8, 0xf0_u8, 0x1c_u8, 0x6d_u8, 0x98_u8])
    def query_interface(this : IXAPOParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAPOParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAPOParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_parameters(this : IXAPOParameters*, pParameters : Void*, parameter_byte_size : UInt32) : Void
      @lpVtbl.try &.value.set_parameters.call(this, pParameters, parameter_byte_size)
    end
    def get_parameters(this : IXAPOParameters*, pParameters : Void*, parameter_byte_size : UInt32) : Void
      @lpVtbl.try &.value.get_parameters.call(this, pParameters, parameter_byte_size)
    end

  end

  @[Extern]
  record IXAudio2Vtbl,
    query_interface : Proc(IXAudio2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAudio2*, UInt32),
    release : Proc(IXAudio2*, UInt32),
    register_for_callbacks : Proc(IXAudio2*, Void*, Win32cr::Foundation::HRESULT),
    unregister_for_callbacks : Proc(IXAudio2*, Void*, Void),
    create_source_voice : Proc(IXAudio2*, Void**, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32, Float32, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    create_submix_voice : Proc(IXAudio2*, Void**, UInt32, UInt32, UInt32, UInt32, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    create_mastering_voice : Proc(IXAudio2*, Void**, UInt32, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Media::Audio::AUDIO_STREAM_CATEGORY, Win32cr::Foundation::HRESULT),
    start_engine : Proc(IXAudio2*, Win32cr::Foundation::HRESULT),
    stop_engine : Proc(IXAudio2*, Void),
    commit_changes : Proc(IXAudio2*, UInt32, Win32cr::Foundation::HRESULT),
    get_performance_data : Proc(IXAudio2*, Win32cr::Media::Audio::XAudio2::XAUDIO2_PERFORMANCE_DATA*, Void),
    set_debug_configuration : Proc(IXAudio2*, Win32cr::Media::Audio::XAudio2::XAUDIO2_DEBUG_CONFIGURATION*, Void*, Void)


  @[Extern]
  record IXAudio2, lpVtbl : IXAudio2Vtbl* do
    GUID = LibC::GUID.new(0x2b02e3cf_u32, 0x2e0b_u16, 0x4ec3_u16, StaticArray[0xbe_u8, 0x45_u8, 0x1b_u8, 0x2a_u8, 0x3f_u8, 0xe7_u8, 0x21_u8, 0xd_u8])
    def query_interface(this : IXAudio2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAudio2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAudio2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_for_callbacks(this : IXAudio2*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_for_callbacks.call(this, pCallback)
    end
    def unregister_for_callbacks(this : IXAudio2*, pCallback : Void*) : Void
      @lpVtbl.try &.value.unregister_for_callbacks.call(this, pCallback)
    end
    def create_source_voice(this : IXAudio2*, ppSourceVoice : Void**, pSourceFormat : Win32cr::Media::Audio::WAVEFORMATEX*, flags : UInt32, max_frequency_ratio : Float32, pCallback : Void*, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_source_voice.call(this, ppSourceVoice, pSourceFormat, flags, max_frequency_ratio, pCallback, pSendList, pEffectChain)
    end
    def create_submix_voice(this : IXAudio2*, ppSubmixVoice : Void**, input_channels : UInt32, input_sample_rate : UInt32, flags : UInt32, processing_stage : UInt32, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_submix_voice.call(this, ppSubmixVoice, input_channels, input_sample_rate, flags, processing_stage, pSendList, pEffectChain)
    end
    def create_mastering_voice(this : IXAudio2*, ppMasteringVoice : Void**, input_channels : UInt32, input_sample_rate : UInt32, flags : UInt32, szDeviceId : Win32cr::Foundation::PWSTR, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, stream_category : Win32cr::Media::Audio::AUDIO_STREAM_CATEGORY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_mastering_voice.call(this, ppMasteringVoice, input_channels, input_sample_rate, flags, szDeviceId, pEffectChain, stream_category)
    end
    def start_engine(this : IXAudio2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_engine.call(this)
    end
    def stop_engine(this : IXAudio2*) : Void
      @lpVtbl.try &.value.stop_engine.call(this)
    end
    def commit_changes(this : IXAudio2*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_changes.call(this, operation_set)
    end
    def get_performance_data(this : IXAudio2*, pPerfData : Win32cr::Media::Audio::XAudio2::XAUDIO2_PERFORMANCE_DATA*) : Void
      @lpVtbl.try &.value.get_performance_data.call(this, pPerfData)
    end
    def set_debug_configuration(this : IXAudio2*, pDebugConfiguration : Win32cr::Media::Audio::XAudio2::XAUDIO2_DEBUG_CONFIGURATION*, pReserved : Void*) : Void
      @lpVtbl.try &.value.set_debug_configuration.call(this, pDebugConfiguration, pReserved)
    end

  end

  @[Extern]
  record IXAudio2ExtensionVtbl,
    query_interface : Proc(IXAudio2Extension*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAudio2Extension*, UInt32),
    release : Proc(IXAudio2Extension*, UInt32),
    get_processing_quantum : Proc(IXAudio2Extension*, UInt32*, UInt32*, Void),
    get_processor : Proc(IXAudio2Extension*, UInt32*, Void)


  @[Extern]
  record IXAudio2Extension, lpVtbl : IXAudio2ExtensionVtbl* do
    GUID = LibC::GUID.new(0x84ac29bb_u32, 0xd619_u16, 0x44d2_u16, StaticArray[0xb1_u8, 0x97_u8, 0xe4_u8, 0xac_u8, 0xf7_u8, 0xdf_u8, 0x3e_u8, 0xd6_u8])
    def query_interface(this : IXAudio2Extension*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAudio2Extension*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAudio2Extension*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_processing_quantum(this : IXAudio2Extension*, quantumNumerator : UInt32*, quantumDenominator : UInt32*) : Void
      @lpVtbl.try &.value.get_processing_quantum.call(this, quantumNumerator, quantumDenominator)
    end
    def get_processor(this : IXAudio2Extension*, processor : UInt32*) : Void
      @lpVtbl.try &.value.get_processor.call(this, processor)
    end

  end

  @[Extern]
  record IXAudio2VoiceVtbl,
    get_voice_details : Proc(IXAudio2Voice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*, Void),
    set_output_voices : Proc(IXAudio2Voice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Foundation::HRESULT),
    set_effect_chain : Proc(IXAudio2Voice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    enable_effect : Proc(IXAudio2Voice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    disable_effect : Proc(IXAudio2Voice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_state : Proc(IXAudio2Voice*, UInt32, Win32cr::Foundation::BOOL*, Void),
    set_effect_parameters : Proc(IXAudio2Voice*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_parameters : Proc(IXAudio2Voice*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_filter_parameters : Proc(IXAudio2Voice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_filter_parameters : Proc(IXAudio2Voice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_output_filter_parameters : Proc(IXAudio2Voice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_filter_parameters : Proc(IXAudio2Voice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_volume : Proc(IXAudio2Voice*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IXAudio2Voice*, Float32*, Void),
    set_channel_volumes : Proc(IXAudio2Voice*, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_volumes : Proc(IXAudio2Voice*, UInt32, Float32*, Void),
    set_output_matrix : Proc(IXAudio2Voice*, Void*, UInt32, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_matrix : Proc(IXAudio2Voice*, Void*, UInt32, UInt32, Float32*, Void),
    destroy_voice : Proc(IXAudio2Voice*, Void)


  @[Extern]
  record IXAudio2Voice, lpVtbl : IXAudio2VoiceVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def get_voice_details(this : IXAudio2Voice*, pVoiceDetails : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*) : Void
      @lpVtbl.try &.value.get_voice_details.call(this, pVoiceDetails)
    end
    def set_output_voices(this : IXAudio2Voice*, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_voices.call(this, pSendList)
    end
    def set_effect_chain(this : IXAudio2Voice*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_chain.call(this, pEffectChain)
    end
    def enable_effect(this : IXAudio2Voice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_effect.call(this, effect_index, operation_set)
    end
    def disable_effect(this : IXAudio2Voice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_effect.call(this, effect_index, operation_set)
    end
    def get_effect_state(this : IXAudio2Voice*, effect_index : UInt32, pEnabled : Win32cr::Foundation::BOOL*) : Void
      @lpVtbl.try &.value.get_effect_state.call(this, effect_index, pEnabled)
    end
    def set_effect_parameters(this : IXAudio2Voice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size, operation_set)
    end
    def get_effect_parameters(this : IXAudio2Voice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size)
    end
    def set_filter_parameters(this : IXAudio2Voice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_parameters.call(this, pParameters, operation_set)
    end
    def get_filter_parameters(this : IXAudio2Voice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_filter_parameters.call(this, pParameters)
    end
    def set_output_filter_parameters(this : IXAudio2Voice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filter_parameters.call(this, pDestinationVoice, pParameters, operation_set)
    end
    def get_output_filter_parameters(this : IXAudio2Voice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_output_filter_parameters.call(this, pDestinationVoice, pParameters)
    end
    def set_volume(this : IXAudio2Voice*, volume : Float32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, volume, operation_set)
    end
    def get_volume(this : IXAudio2Voice*, pVolume : Float32*) : Void
      @lpVtbl.try &.value.get_volume.call(this, pVolume)
    end
    def set_channel_volumes(this : IXAudio2Voice*, channels : UInt32, pVolumes : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volumes.call(this, channels, pVolumes, operation_set)
    end
    def get_channel_volumes(this : IXAudio2Voice*, channels : UInt32, pVolumes : Float32*) : Void
      @lpVtbl.try &.value.get_channel_volumes.call(this, channels, pVolumes)
    end
    def set_output_matrix(this : IXAudio2Voice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix, operation_set)
    end
    def get_output_matrix(this : IXAudio2Voice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*) : Void
      @lpVtbl.try &.value.get_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix)
    end
    def destroy_voice(this : IXAudio2Voice*) : Void
      @lpVtbl.try &.value.destroy_voice.call(this)
    end

  end

  @[Extern]
  record IXAudio2SourceVoiceVtbl,
    get_voice_details : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*, Void),
    set_output_voices : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Foundation::HRESULT),
    set_effect_chain : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    enable_effect : Proc(IXAudio2SourceVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    disable_effect : Proc(IXAudio2SourceVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_state : Proc(IXAudio2SourceVoice*, UInt32, Win32cr::Foundation::BOOL*, Void),
    set_effect_parameters : Proc(IXAudio2SourceVoice*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_parameters : Proc(IXAudio2SourceVoice*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_filter_parameters : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_filter_parameters : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_output_filter_parameters : Proc(IXAudio2SourceVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_filter_parameters : Proc(IXAudio2SourceVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_volume : Proc(IXAudio2SourceVoice*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IXAudio2SourceVoice*, Float32*, Void),
    set_channel_volumes : Proc(IXAudio2SourceVoice*, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_volumes : Proc(IXAudio2SourceVoice*, UInt32, Float32*, Void),
    set_output_matrix : Proc(IXAudio2SourceVoice*, Void*, UInt32, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_matrix : Proc(IXAudio2SourceVoice*, Void*, UInt32, UInt32, Float32*, Void),
    destroy_voice : Proc(IXAudio2SourceVoice*, Void),
    start : Proc(IXAudio2SourceVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stop : Proc(IXAudio2SourceVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    submit_source_buffer : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_BUFFER*, Win32cr::Media::Audio::XAudio2::XAUDIO2_BUFFER_WMA*, Win32cr::Foundation::HRESULT),
    flush_source_buffers : Proc(IXAudio2SourceVoice*, Win32cr::Foundation::HRESULT),
    discontinuity : Proc(IXAudio2SourceVoice*, Win32cr::Foundation::HRESULT),
    exit_loop : Proc(IXAudio2SourceVoice*, UInt32, Win32cr::Foundation::HRESULT),
    get_state : Proc(IXAudio2SourceVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_STATE*, UInt32, Void),
    set_frequency_ratio : Proc(IXAudio2SourceVoice*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_frequency_ratio : Proc(IXAudio2SourceVoice*, Float32*, Void),
    set_source_sample_rate : Proc(IXAudio2SourceVoice*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXAudio2SourceVoice, lpVtbl : IXAudio2SourceVoiceVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def get_voice_details(this : IXAudio2SourceVoice*, pVoiceDetails : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*) : Void
      @lpVtbl.try &.value.get_voice_details.call(this, pVoiceDetails)
    end
    def set_output_voices(this : IXAudio2SourceVoice*, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_voices.call(this, pSendList)
    end
    def set_effect_chain(this : IXAudio2SourceVoice*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_chain.call(this, pEffectChain)
    end
    def enable_effect(this : IXAudio2SourceVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_effect.call(this, effect_index, operation_set)
    end
    def disable_effect(this : IXAudio2SourceVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_effect.call(this, effect_index, operation_set)
    end
    def get_effect_state(this : IXAudio2SourceVoice*, effect_index : UInt32, pEnabled : Win32cr::Foundation::BOOL*) : Void
      @lpVtbl.try &.value.get_effect_state.call(this, effect_index, pEnabled)
    end
    def set_effect_parameters(this : IXAudio2SourceVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size, operation_set)
    end
    def get_effect_parameters(this : IXAudio2SourceVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size)
    end
    def set_filter_parameters(this : IXAudio2SourceVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_parameters.call(this, pParameters, operation_set)
    end
    def get_filter_parameters(this : IXAudio2SourceVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_filter_parameters.call(this, pParameters)
    end
    def set_output_filter_parameters(this : IXAudio2SourceVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filter_parameters.call(this, pDestinationVoice, pParameters, operation_set)
    end
    def get_output_filter_parameters(this : IXAudio2SourceVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_output_filter_parameters.call(this, pDestinationVoice, pParameters)
    end
    def set_volume(this : IXAudio2SourceVoice*, volume : Float32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, volume, operation_set)
    end
    def get_volume(this : IXAudio2SourceVoice*, pVolume : Float32*) : Void
      @lpVtbl.try &.value.get_volume.call(this, pVolume)
    end
    def set_channel_volumes(this : IXAudio2SourceVoice*, channels : UInt32, pVolumes : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volumes.call(this, channels, pVolumes, operation_set)
    end
    def get_channel_volumes(this : IXAudio2SourceVoice*, channels : UInt32, pVolumes : Float32*) : Void
      @lpVtbl.try &.value.get_channel_volumes.call(this, channels, pVolumes)
    end
    def set_output_matrix(this : IXAudio2SourceVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix, operation_set)
    end
    def get_output_matrix(this : IXAudio2SourceVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*) : Void
      @lpVtbl.try &.value.get_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix)
    end
    def destroy_voice(this : IXAudio2SourceVoice*) : Void
      @lpVtbl.try &.value.destroy_voice.call(this)
    end
    def start(this : IXAudio2SourceVoice*, flags : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, flags, operation_set)
    end
    def stop(this : IXAudio2SourceVoice*, flags : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, flags, operation_set)
    end
    def submit_source_buffer(this : IXAudio2SourceVoice*, pBuffer : Win32cr::Media::Audio::XAudio2::XAUDIO2_BUFFER*, pBufferWMA : Win32cr::Media::Audio::XAudio2::XAUDIO2_BUFFER_WMA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit_source_buffer.call(this, pBuffer, pBufferWMA)
    end
    def flush_source_buffers(this : IXAudio2SourceVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush_source_buffers.call(this)
    end
    def discontinuity(this : IXAudio2SourceVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discontinuity.call(this)
    end
    def exit_loop(this : IXAudio2SourceVoice*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exit_loop.call(this, operation_set)
    end
    def get_state(this : IXAudio2SourceVoice*, pVoiceState : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_STATE*, flags : UInt32) : Void
      @lpVtbl.try &.value.get_state.call(this, pVoiceState, flags)
    end
    def set_frequency_ratio(this : IXAudio2SourceVoice*, ratio : Float32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frequency_ratio.call(this, ratio, operation_set)
    end
    def get_frequency_ratio(this : IXAudio2SourceVoice*, pRatio : Float32*) : Void
      @lpVtbl.try &.value.get_frequency_ratio.call(this, pRatio)
    end
    def set_source_sample_rate(this : IXAudio2SourceVoice*, new_source_sample_rate : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_sample_rate.call(this, new_source_sample_rate)
    end

  end

  @[Extern]
  record IXAudio2SubmixVoiceVtbl,
    get_voice_details : Proc(IXAudio2SubmixVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*, Void),
    set_output_voices : Proc(IXAudio2SubmixVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Foundation::HRESULT),
    set_effect_chain : Proc(IXAudio2SubmixVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    enable_effect : Proc(IXAudio2SubmixVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    disable_effect : Proc(IXAudio2SubmixVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_state : Proc(IXAudio2SubmixVoice*, UInt32, Win32cr::Foundation::BOOL*, Void),
    set_effect_parameters : Proc(IXAudio2SubmixVoice*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_parameters : Proc(IXAudio2SubmixVoice*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_filter_parameters : Proc(IXAudio2SubmixVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_filter_parameters : Proc(IXAudio2SubmixVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_output_filter_parameters : Proc(IXAudio2SubmixVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_filter_parameters : Proc(IXAudio2SubmixVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_volume : Proc(IXAudio2SubmixVoice*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IXAudio2SubmixVoice*, Float32*, Void),
    set_channel_volumes : Proc(IXAudio2SubmixVoice*, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_volumes : Proc(IXAudio2SubmixVoice*, UInt32, Float32*, Void),
    set_output_matrix : Proc(IXAudio2SubmixVoice*, Void*, UInt32, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_matrix : Proc(IXAudio2SubmixVoice*, Void*, UInt32, UInt32, Float32*, Void),
    destroy_voice : Proc(IXAudio2SubmixVoice*, Void)


  @[Extern]
  record IXAudio2SubmixVoice, lpVtbl : IXAudio2SubmixVoiceVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def get_voice_details(this : IXAudio2SubmixVoice*, pVoiceDetails : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*) : Void
      @lpVtbl.try &.value.get_voice_details.call(this, pVoiceDetails)
    end
    def set_output_voices(this : IXAudio2SubmixVoice*, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_voices.call(this, pSendList)
    end
    def set_effect_chain(this : IXAudio2SubmixVoice*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_chain.call(this, pEffectChain)
    end
    def enable_effect(this : IXAudio2SubmixVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_effect.call(this, effect_index, operation_set)
    end
    def disable_effect(this : IXAudio2SubmixVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_effect.call(this, effect_index, operation_set)
    end
    def get_effect_state(this : IXAudio2SubmixVoice*, effect_index : UInt32, pEnabled : Win32cr::Foundation::BOOL*) : Void
      @lpVtbl.try &.value.get_effect_state.call(this, effect_index, pEnabled)
    end
    def set_effect_parameters(this : IXAudio2SubmixVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size, operation_set)
    end
    def get_effect_parameters(this : IXAudio2SubmixVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size)
    end
    def set_filter_parameters(this : IXAudio2SubmixVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_parameters.call(this, pParameters, operation_set)
    end
    def get_filter_parameters(this : IXAudio2SubmixVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_filter_parameters.call(this, pParameters)
    end
    def set_output_filter_parameters(this : IXAudio2SubmixVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filter_parameters.call(this, pDestinationVoice, pParameters, operation_set)
    end
    def get_output_filter_parameters(this : IXAudio2SubmixVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_output_filter_parameters.call(this, pDestinationVoice, pParameters)
    end
    def set_volume(this : IXAudio2SubmixVoice*, volume : Float32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, volume, operation_set)
    end
    def get_volume(this : IXAudio2SubmixVoice*, pVolume : Float32*) : Void
      @lpVtbl.try &.value.get_volume.call(this, pVolume)
    end
    def set_channel_volumes(this : IXAudio2SubmixVoice*, channels : UInt32, pVolumes : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volumes.call(this, channels, pVolumes, operation_set)
    end
    def get_channel_volumes(this : IXAudio2SubmixVoice*, channels : UInt32, pVolumes : Float32*) : Void
      @lpVtbl.try &.value.get_channel_volumes.call(this, channels, pVolumes)
    end
    def set_output_matrix(this : IXAudio2SubmixVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix, operation_set)
    end
    def get_output_matrix(this : IXAudio2SubmixVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*) : Void
      @lpVtbl.try &.value.get_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix)
    end
    def destroy_voice(this : IXAudio2SubmixVoice*) : Void
      @lpVtbl.try &.value.destroy_voice.call(this)
    end

  end

  @[Extern]
  record IXAudio2MasteringVoiceVtbl,
    get_voice_details : Proc(IXAudio2MasteringVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*, Void),
    set_output_voices : Proc(IXAudio2MasteringVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*, Win32cr::Foundation::HRESULT),
    set_effect_chain : Proc(IXAudio2MasteringVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*, Win32cr::Foundation::HRESULT),
    enable_effect : Proc(IXAudio2MasteringVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    disable_effect : Proc(IXAudio2MasteringVoice*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_state : Proc(IXAudio2MasteringVoice*, UInt32, Win32cr::Foundation::BOOL*, Void),
    set_effect_parameters : Proc(IXAudio2MasteringVoice*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_parameters : Proc(IXAudio2MasteringVoice*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_filter_parameters : Proc(IXAudio2MasteringVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_filter_parameters : Proc(IXAudio2MasteringVoice*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_output_filter_parameters : Proc(IXAudio2MasteringVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_filter_parameters : Proc(IXAudio2MasteringVoice*, Void*, Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, Void),
    set_volume : Proc(IXAudio2MasteringVoice*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IXAudio2MasteringVoice*, Float32*, Void),
    set_channel_volumes : Proc(IXAudio2MasteringVoice*, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_volumes : Proc(IXAudio2MasteringVoice*, UInt32, Float32*, Void),
    set_output_matrix : Proc(IXAudio2MasteringVoice*, Void*, UInt32, UInt32, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_matrix : Proc(IXAudio2MasteringVoice*, Void*, UInt32, UInt32, Float32*, Void),
    destroy_voice : Proc(IXAudio2MasteringVoice*, Void),
    get_channel_mask : Proc(IXAudio2MasteringVoice*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXAudio2MasteringVoice, lpVtbl : IXAudio2MasteringVoiceVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def get_voice_details(this : IXAudio2MasteringVoice*, pVoiceDetails : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_DETAILS*) : Void
      @lpVtbl.try &.value.get_voice_details.call(this, pVoiceDetails)
    end
    def set_output_voices(this : IXAudio2MasteringVoice*, pSendList : Win32cr::Media::Audio::XAudio2::XAUDIO2_VOICE_SENDS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_voices.call(this, pSendList)
    end
    def set_effect_chain(this : IXAudio2MasteringVoice*, pEffectChain : Win32cr::Media::Audio::XAudio2::XAUDIO2_EFFECT_CHAIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_chain.call(this, pEffectChain)
    end
    def enable_effect(this : IXAudio2MasteringVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_effect.call(this, effect_index, operation_set)
    end
    def disable_effect(this : IXAudio2MasteringVoice*, effect_index : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_effect.call(this, effect_index, operation_set)
    end
    def get_effect_state(this : IXAudio2MasteringVoice*, effect_index : UInt32, pEnabled : Win32cr::Foundation::BOOL*) : Void
      @lpVtbl.try &.value.get_effect_state.call(this, effect_index, pEnabled)
    end
    def set_effect_parameters(this : IXAudio2MasteringVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size, operation_set)
    end
    def get_effect_parameters(this : IXAudio2MasteringVoice*, effect_index : UInt32, pParameters : Void*, parameters_byte_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_parameters.call(this, effect_index, pParameters, parameters_byte_size)
    end
    def set_filter_parameters(this : IXAudio2MasteringVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_parameters.call(this, pParameters, operation_set)
    end
    def get_filter_parameters(this : IXAudio2MasteringVoice*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_filter_parameters.call(this, pParameters)
    end
    def set_output_filter_parameters(this : IXAudio2MasteringVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filter_parameters.call(this, pDestinationVoice, pParameters, operation_set)
    end
    def get_output_filter_parameters(this : IXAudio2MasteringVoice*, pDestinationVoice : Void*, pParameters : Win32cr::Media::Audio::XAudio2::XAUDIO2_FILTER_PARAMETERS*) : Void
      @lpVtbl.try &.value.get_output_filter_parameters.call(this, pDestinationVoice, pParameters)
    end
    def set_volume(this : IXAudio2MasteringVoice*, volume : Float32, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, volume, operation_set)
    end
    def get_volume(this : IXAudio2MasteringVoice*, pVolume : Float32*) : Void
      @lpVtbl.try &.value.get_volume.call(this, pVolume)
    end
    def set_channel_volumes(this : IXAudio2MasteringVoice*, channels : UInt32, pVolumes : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_volumes.call(this, channels, pVolumes, operation_set)
    end
    def get_channel_volumes(this : IXAudio2MasteringVoice*, channels : UInt32, pVolumes : Float32*) : Void
      @lpVtbl.try &.value.get_channel_volumes.call(this, channels, pVolumes)
    end
    def set_output_matrix(this : IXAudio2MasteringVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*, operation_set : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix, operation_set)
    end
    def get_output_matrix(this : IXAudio2MasteringVoice*, pDestinationVoice : Void*, source_channels : UInt32, destination_channels : UInt32, pLevelMatrix : Float32*) : Void
      @lpVtbl.try &.value.get_output_matrix.call(this, pDestinationVoice, source_channels, destination_channels, pLevelMatrix)
    end
    def destroy_voice(this : IXAudio2MasteringVoice*) : Void
      @lpVtbl.try &.value.destroy_voice.call(this)
    end
    def get_channel_mask(this : IXAudio2MasteringVoice*, pChannelmask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_mask.call(this, pChannelmask)
    end

  end

  @[Extern]
  record IXAudio2EngineCallbackVtbl,
    on_processing_pass_start : Proc(IXAudio2EngineCallback*, Void),
    on_processing_pass_end : Proc(IXAudio2EngineCallback*, Void),
    on_critical_error : Proc(IXAudio2EngineCallback*, Win32cr::Foundation::HRESULT, Void)


  @[Extern]
  record IXAudio2EngineCallback, lpVtbl : IXAudio2EngineCallbackVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def on_processing_pass_start(this : IXAudio2EngineCallback*) : Void
      @lpVtbl.try &.value.on_processing_pass_start.call(this)
    end
    def on_processing_pass_end(this : IXAudio2EngineCallback*) : Void
      @lpVtbl.try &.value.on_processing_pass_end.call(this)
    end
    def on_critical_error(this : IXAudio2EngineCallback*, error : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.on_critical_error.call(this, error)
    end

  end

  @[Extern]
  record IXAudio2VoiceCallbackVtbl,
    on_voice_processing_pass_start : Proc(IXAudio2VoiceCallback*, UInt32, Void),
    on_voice_processing_pass_end : Proc(IXAudio2VoiceCallback*, Void),
    on_stream_end : Proc(IXAudio2VoiceCallback*, Void),
    on_buffer_start : Proc(IXAudio2VoiceCallback*, Void*, Void),
    on_buffer_end : Proc(IXAudio2VoiceCallback*, Void*, Void),
    on_loop_end : Proc(IXAudio2VoiceCallback*, Void*, Void),
    on_voice_error : Proc(IXAudio2VoiceCallback*, Void*, Win32cr::Foundation::HRESULT, Void)


  @[Extern]
  record IXAudio2VoiceCallback, lpVtbl : IXAudio2VoiceCallbackVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def on_voice_processing_pass_start(this : IXAudio2VoiceCallback*, bytes_required : UInt32) : Void
      @lpVtbl.try &.value.on_voice_processing_pass_start.call(this, bytes_required)
    end
    def on_voice_processing_pass_end(this : IXAudio2VoiceCallback*) : Void
      @lpVtbl.try &.value.on_voice_processing_pass_end.call(this)
    end
    def on_stream_end(this : IXAudio2VoiceCallback*) : Void
      @lpVtbl.try &.value.on_stream_end.call(this)
    end
    def on_buffer_start(this : IXAudio2VoiceCallback*, pBufferContext : Void*) : Void
      @lpVtbl.try &.value.on_buffer_start.call(this, pBufferContext)
    end
    def on_buffer_end(this : IXAudio2VoiceCallback*, pBufferContext : Void*) : Void
      @lpVtbl.try &.value.on_buffer_end.call(this, pBufferContext)
    end
    def on_loop_end(this : IXAudio2VoiceCallback*, pBufferContext : Void*) : Void
      @lpVtbl.try &.value.on_loop_end.call(this, pBufferContext)
    end
    def on_voice_error(this : IXAudio2VoiceCallback*, pBufferContext : Void*, error : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.on_voice_error.call(this, pBufferContext, error)
    end

  end

  @[Extern]
  record IXAPOHrtfParametersVtbl,
    query_interface : Proc(IXAPOHrtfParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAPOHrtfParameters*, UInt32),
    release : Proc(IXAPOHrtfParameters*, UInt32),
    set_source_position : Proc(IXAPOHrtfParameters*, Win32cr::Media::Audio::XAudio2::HrtfPosition*, Win32cr::Foundation::HRESULT),
    set_source_orientation : Proc(IXAPOHrtfParameters*, Win32cr::Media::Audio::XAudio2::HrtfOrientation*, Win32cr::Foundation::HRESULT),
    set_source_gain : Proc(IXAPOHrtfParameters*, Float32, Win32cr::Foundation::HRESULT),
    set_environment : Proc(IXAPOHrtfParameters*, Win32cr::Media::Audio::XAudio2::HrtfEnvironment, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXAPOHrtfParameters, lpVtbl : IXAPOHrtfParametersVtbl* do
    GUID = LibC::GUID.new(0x15b3cd66_u32, 0xe9de_u16, 0x4464_u16, StaticArray[0xb6_u8, 0xe6_u8, 0x2b_u8, 0xc3_u8, 0xcf_u8, 0x63_u8, 0xd4_u8, 0x55_u8])
    def query_interface(this : IXAPOHrtfParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAPOHrtfParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAPOHrtfParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_source_position(this : IXAPOHrtfParameters*, position : Win32cr::Media::Audio::XAudio2::HrtfPosition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_position.call(this, position)
    end
    def set_source_orientation(this : IXAPOHrtfParameters*, orientation : Win32cr::Media::Audio::XAudio2::HrtfOrientation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_orientation.call(this, orientation)
    end
    def set_source_gain(this : IXAPOHrtfParameters*, gain : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_gain.call(this, gain)
    end
    def set_environment(this : IXAPOHrtfParameters*, environment : Win32cr::Media::Audio::XAudio2::HrtfEnvironment) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment.call(this, environment)
    end

  end

  @[Link("xaudio2_8")]
  @[Link("hrtfapo")]
  lib C
    fun CreateFX(clsid : LibC::GUID*, pEffect : Void**, pInitDat : Void*, init_data_byte_size : UInt32) : Win32cr::Foundation::HRESULT

    fun XAudio2CreateWithVersionInfo(ppXAudio2 : Void**, flags : UInt32, x_audio2_processor : UInt32, ntddiVersion : UInt32) : Win32cr::Foundation::HRESULT

    fun CreateAudioVolumeMeter(ppApo : Void**) : Win32cr::Foundation::HRESULT

    fun CreateAudioReverb(ppApo : Void**) : Win32cr::Foundation::HRESULT

    fun CreateHrtfApo(init : Win32cr::Media::Audio::XAudio2::HrtfApoInit*, xApo : Void**) : Win32cr::Foundation::HRESULT

  end
end