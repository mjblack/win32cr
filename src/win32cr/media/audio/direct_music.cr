require "./../audio.cr"
require "./../../foundation.cr"
require "./../../system/com.cr"
require "./../../media.cr"
require "./direct_sound.cr"
require "./../../system/io.cr"
require "./../multimedia.cr"

module Win32cr::Media::Audio::DirectMusic
  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 = Proc(Win32cr::Media::Audio::DirectMusic::DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA*, Void*, Win32cr::Foundation::BOOL)

  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA = Proc(Win32cr::Media::Audio::DirectMusic::DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA*, Void*, Win32cr::Foundation::BOOL)

  alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW = Proc(Win32cr::Media::Audio::DirectMusic::DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA*, Void*, Win32cr::Foundation::BOOL)

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
  REGSTR_PATH_SOFTWARESYNTHS = "Software\\Microsoft\\DirectMusic\\SoftwareSynths"
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

  enum DMUS_CLOCKTYPE
    DMUS_CLOCK_SYSTEM = 0_i32
    DMUS_CLOCK_WAVE = 1_i32
  end
  enum DSPROPERTY_DIRECTSOUNDDEVICE
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A = 1_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1 = 2_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1 = 3_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W = 4_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A = 5_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W = 6_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A = 7_i32
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W = 8_i32
  end
  enum DIRECTSOUNDDEVICE_TYPE
    DIRECTSOUNDDEVICE_TYPE_EMULATED = 0_i32
    DIRECTSOUNDDEVICE_TYPE_VXD = 1_i32
    DIRECTSOUNDDEVICE_TYPE_WDM = 2_i32
  end
  enum DIRECTSOUNDDEVICE_DATAFLOW
    DIRECTSOUNDDEVICE_DATAFLOW_RENDER = 0_i32
    DIRECTSOUNDDEVICE_DATAFLOW_CAPTURE = 1_i32
  end

  @[Extern]
  struct DLSID
    property ulData1 : UInt32
    property usData2 : UInt16
    property usData3 : UInt16
    property abData4 : UInt8[8]
    def initialize(@ulData1 : UInt32, @usData2 : UInt16, @usData3 : UInt16, @abData4 : UInt8[8])
    end
  end

  @[Extern]
  struct DLSVERSION
    property dwVersionMS : UInt32
    property dwVersionLS : UInt32
    def initialize(@dwVersionMS : UInt32, @dwVersionLS : UInt32)
    end
  end

  @[Extern]
  struct CONNECTION
    property usSource : UInt16
    property usControl : UInt16
    property usDestination : UInt16
    property usTransform : UInt16
    property lScale : Int32
    def initialize(@usSource : UInt16, @usControl : UInt16, @usDestination : UInt16, @usTransform : UInt16, @lScale : Int32)
    end
  end

  @[Extern]
  struct CONNECTIONLIST
    property cbSize : UInt32
    property cConnections : UInt32
    def initialize(@cbSize : UInt32, @cConnections : UInt32)
    end
  end

  @[Extern]
  struct RGNRANGE
    property usLow : UInt16
    property usHigh : UInt16
    def initialize(@usLow : UInt16, @usHigh : UInt16)
    end
  end

  @[Extern]
  struct MIDILOCALE
    property ulBank : UInt32
    property ulInstrument : UInt32
    def initialize(@ulBank : UInt32, @ulInstrument : UInt32)
    end
  end

  @[Extern]
  struct RGNHEADER
    property range_key : Win32cr::Media::Audio::DirectMusic::RGNRANGE
    property range_velocity : Win32cr::Media::Audio::DirectMusic::RGNRANGE
    property fusOptions : UInt16
    property usKeyGroup : UInt16
    def initialize(@range_key : Win32cr::Media::Audio::DirectMusic::RGNRANGE, @range_velocity : Win32cr::Media::Audio::DirectMusic::RGNRANGE, @fusOptions : UInt16, @usKeyGroup : UInt16)
    end
  end

  @[Extern]
  struct INSTHEADER
    property cRegions : UInt32
    property locale : Win32cr::Media::Audio::DirectMusic::MIDILOCALE
    def initialize(@cRegions : UInt32, @locale : Win32cr::Media::Audio::DirectMusic::MIDILOCALE)
    end
  end

  @[Extern]
  struct DLSHEADER
    property cInstruments : UInt32
    def initialize(@cInstruments : UInt32)
    end
  end

  @[Extern]
  struct WAVELINK
    property fusOptions : UInt16
    property usPhaseGroup : UInt16
    property ulChannel : UInt32
    property ulTableIndex : UInt32
    def initialize(@fusOptions : UInt16, @usPhaseGroup : UInt16, @ulChannel : UInt32, @ulTableIndex : UInt32)
    end
  end

  @[Extern]
  struct POOLCUE
    property ulOffset : UInt32
    def initialize(@ulOffset : UInt32)
    end
  end

  @[Extern]
  struct POOLTABLE
    property cbSize : UInt32
    property cCues : UInt32
    def initialize(@cbSize : UInt32, @cCues : UInt32)
    end
  end

  @[Extern]
  struct Rwsmp_
    property cbSize : UInt32
    property usUnityNote : UInt16
    property sFineTune : Int16
    property lAttenuation : Int32
    property fulOptions : UInt32
    property cSampleLoops : UInt32
    def initialize(@cbSize : UInt32, @usUnityNote : UInt16, @sFineTune : Int16, @lAttenuation : Int32, @fulOptions : UInt32, @cSampleLoops : UInt32)
    end
  end

  @[Extern]
  struct Rloop_
    property cbSize : UInt32
    property ulType : UInt32
    property ulStart : UInt32
    property ulLength : UInt32
    def initialize(@cbSize : UInt32, @ulType : UInt32, @ulStart : UInt32, @ulLength : UInt32)
    end
  end

  @[Extern]
  struct DMUS_DOWNLOADINFO
    property dwDLType : UInt32
    property dwDLId : UInt32
    property dwNumOffsetTableEntries : UInt32
    property cbSize : UInt32
    def initialize(@dwDLType : UInt32, @dwDLId : UInt32, @dwNumOffsetTableEntries : UInt32, @cbSize : UInt32)
    end
  end

  @[Extern]
  struct DMUS_OFFSETTABLE
    property ulOffsetTable : UInt32*
    def initialize(@ulOffsetTable : UInt32*)
    end
  end

  @[Extern]
  struct DMUS_INSTRUMENT
    property ulPatch : UInt32
    property ulFirstRegionIdx : UInt32
    property ulGlobalArtIdx : UInt32
    property ulFirstExtCkIdx : UInt32
    property ulCopyrightIdx : UInt32
    property ulFlags : UInt32
    def initialize(@ulPatch : UInt32, @ulFirstRegionIdx : UInt32, @ulGlobalArtIdx : UInt32, @ulFirstExtCkIdx : UInt32, @ulCopyrightIdx : UInt32, @ulFlags : UInt32)
    end
  end

  @[Extern]
  struct DMUS_REGION
    property range_key : Win32cr::Media::Audio::DirectMusic::RGNRANGE
    property range_velocity : Win32cr::Media::Audio::DirectMusic::RGNRANGE
    property fusOptions : UInt16
    property usKeyGroup : UInt16
    property ulRegionArtIdx : UInt32
    property ulNextRegionIdx : UInt32
    property ulFirstExtCkIdx : UInt32
    property wave_link : Win32cr::Media::Audio::DirectMusic::WAVELINK
    property wsmp : Win32cr::Media::Audio::DirectMusic::Rwsmp_
    property wloop : Win32cr::Media::Audio::DirectMusic::Rloop_*
    def initialize(@range_key : Win32cr::Media::Audio::DirectMusic::RGNRANGE, @range_velocity : Win32cr::Media::Audio::DirectMusic::RGNRANGE, @fusOptions : UInt16, @usKeyGroup : UInt16, @ulRegionArtIdx : UInt32, @ulNextRegionIdx : UInt32, @ulFirstExtCkIdx : UInt32, @wave_link : Win32cr::Media::Audio::DirectMusic::WAVELINK, @wsmp : Win32cr::Media::Audio::DirectMusic::Rwsmp_, @wloop : Win32cr::Media::Audio::DirectMusic::Rloop_*)
    end
  end

  @[Extern]
  struct DMUS_LFOPARAMS
    property pcFrequency : Int32
    property tcDelay : Int32
    property gcVolumeScale : Int32
    property pcPitchScale : Int32
    property gcMWToVolume : Int32
    property pcMWToPitch : Int32
    def initialize(@pcFrequency : Int32, @tcDelay : Int32, @gcVolumeScale : Int32, @pcPitchScale : Int32, @gcMWToVolume : Int32, @pcMWToPitch : Int32)
    end
  end

  @[Extern]
  struct DMUS_VEGPARAMS
    property tcAttack : Int32
    property tcDecay : Int32
    property ptSustain : Int32
    property tcRelease : Int32
    property tcVel2Attack : Int32
    property tcKey2Decay : Int32
    def initialize(@tcAttack : Int32, @tcDecay : Int32, @ptSustain : Int32, @tcRelease : Int32, @tcVel2Attack : Int32, @tcKey2Decay : Int32)
    end
  end

  @[Extern]
  struct DMUS_PEGPARAMS
    property tcAttack : Int32
    property tcDecay : Int32
    property ptSustain : Int32
    property tcRelease : Int32
    property tcVel2Attack : Int32
    property tcKey2Decay : Int32
    property pcRange : Int32
    def initialize(@tcAttack : Int32, @tcDecay : Int32, @ptSustain : Int32, @tcRelease : Int32, @tcVel2Attack : Int32, @tcKey2Decay : Int32, @pcRange : Int32)
    end
  end

  @[Extern]
  struct DMUS_MSCPARAMS
    property ptDefaultPan : Int32
    def initialize(@ptDefaultPan : Int32)
    end
  end

  @[Extern]
  struct DMUS_ARTICPARAMS
    property lfo : Win32cr::Media::Audio::DirectMusic::DMUS_LFOPARAMS
    property vol_eg : Win32cr::Media::Audio::DirectMusic::DMUS_VEGPARAMS
    property pitch_eg : Win32cr::Media::Audio::DirectMusic::DMUS_PEGPARAMS
    property misc : Win32cr::Media::Audio::DirectMusic::DMUS_MSCPARAMS
    def initialize(@lfo : Win32cr::Media::Audio::DirectMusic::DMUS_LFOPARAMS, @vol_eg : Win32cr::Media::Audio::DirectMusic::DMUS_VEGPARAMS, @pitch_eg : Win32cr::Media::Audio::DirectMusic::DMUS_PEGPARAMS, @misc : Win32cr::Media::Audio::DirectMusic::DMUS_MSCPARAMS)
    end
  end

  @[Extern]
  struct DMUS_ARTICULATION
    property ulArt1Idx : UInt32
    property ulFirstExtCkIdx : UInt32
    def initialize(@ulArt1Idx : UInt32, @ulFirstExtCkIdx : UInt32)
    end
  end

  @[Extern]
  struct DMUS_ARTICULATION2
    property ulArtIdx : UInt32
    property ulFirstExtCkIdx : UInt32
    property ulNextArtIdx : UInt32
    def initialize(@ulArtIdx : UInt32, @ulFirstExtCkIdx : UInt32, @ulNextArtIdx : UInt32)
    end
  end

  @[Extern]
  struct DMUS_EXTENSIONCHUNK
    property cbSize : UInt32
    property ulNextExtCkIdx : UInt32
    property ext_ck_id : UInt32
    property byExtCk : UInt8[4]
    def initialize(@cbSize : UInt32, @ulNextExtCkIdx : UInt32, @ext_ck_id : UInt32, @byExtCk : UInt8[4])
    end
  end

  @[Extern]
  struct DMUS_COPYRIGHT
    property cbSize : UInt32
    property byCopyright : UInt8[4]
    def initialize(@cbSize : UInt32, @byCopyright : UInt8[4])
    end
  end

  @[Extern]
  struct DMUS_WAVEDATA
    property cbSize : UInt32
    property byData : UInt8[4]
    def initialize(@cbSize : UInt32, @byData : UInt8[4])
    end
  end

  @[Extern]
  struct DMUS_WAVE
    property ulFirstExtCkIdx : UInt32
    property ulCopyrightIdx : UInt32
    property ulWaveDataIdx : UInt32
    property waveformat_ex : Win32cr::Media::Audio::WAVEFORMATEX
    def initialize(@ulFirstExtCkIdx : UInt32, @ulCopyrightIdx : UInt32, @ulWaveDataIdx : UInt32, @waveformat_ex : Win32cr::Media::Audio::WAVEFORMATEX)
    end
  end

  @[Extern]
  struct DMUS_NOTERANGE
    property dwLowNote : UInt32
    property dwHighNote : UInt32
    def initialize(@dwLowNote : UInt32, @dwHighNote : UInt32)
    end
  end

  @[Extern]
  struct DMUS_WAVEARTDL
    property ulDownloadIdIdx : UInt32
    property ulBus : UInt32
    property ulBuffers : UInt32
    property ulMasterDLId : UInt32
    property usOptions : UInt16
    def initialize(@ulDownloadIdIdx : UInt32, @ulBus : UInt32, @ulBuffers : UInt32, @ulMasterDLId : UInt32, @usOptions : UInt16)
    end
  end

  @[Extern]
  struct DMUS_WAVEDL
    property cbWaveData : UInt32
    def initialize(@cbWaveData : UInt32)
    end
  end

  @[Extern]
  struct DMUS_EVENTHEADER
    property cbEvent : UInt32
    property dwChannelGroup : UInt32
    property rtDelta : Int64
    property dwFlags : UInt32
    def initialize(@cbEvent : UInt32, @dwChannelGroup : UInt32, @rtDelta : Int64, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct DMUS_BUFFERDESC
    property dwSize : UInt32
    property dwFlags : UInt32
    property guidBufferFormat : LibC::GUID
    property cbBuffer : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @guidBufferFormat : LibC::GUID, @cbBuffer : UInt32)
    end
  end

  @[Extern]
  struct DMUS_PORTCAPS
    property dwSize : UInt32
    property dwFlags : UInt32
    property guidPort : LibC::GUID
    property dwClass : UInt32
    property dwType : UInt32
    property dwMemorySize : UInt32
    property dwMaxChannelGroups : UInt32
    property dwMaxVoices : UInt32
    property dwMaxAudioChannels : UInt32
    property dwEffectFlags : UInt32
    property wszDescription : UInt16[128]
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @guidPort : LibC::GUID, @dwClass : UInt32, @dwType : UInt32, @dwMemorySize : UInt32, @dwMaxChannelGroups : UInt32, @dwMaxVoices : UInt32, @dwMaxAudioChannels : UInt32, @dwEffectFlags : UInt32, @wszDescription : UInt16[128])
    end
  end

  @[Extern]
  struct DMUS_PORTPARAMS_
    property dwSize : UInt32
    property dwValidParams : UInt32
    property dwVoices : UInt32
    property dwChannelGroups : UInt32
    property dwAudioChannels : UInt32
    property dwSampleRate : UInt32
    property dwEffectFlags : UInt32
    property fShare : Win32cr::Foundation::BOOL
    def initialize(@dwSize : UInt32, @dwValidParams : UInt32, @dwVoices : UInt32, @dwChannelGroups : UInt32, @dwAudioChannels : UInt32, @dwSampleRate : UInt32, @dwEffectFlags : UInt32, @fShare : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DMUS_PORTPARAMS8
    property dwSize : UInt32
    property dwValidParams : UInt32
    property dwVoices : UInt32
    property dwChannelGroups : UInt32
    property dwAudioChannels : UInt32
    property dwSampleRate : UInt32
    property dwEffectFlags : UInt32
    property fShare : Win32cr::Foundation::BOOL
    property dwFeatures : UInt32
    def initialize(@dwSize : UInt32, @dwValidParams : UInt32, @dwVoices : UInt32, @dwChannelGroups : UInt32, @dwAudioChannels : UInt32, @dwSampleRate : UInt32, @dwEffectFlags : UInt32, @fShare : Win32cr::Foundation::BOOL, @dwFeatures : UInt32)
    end
  end

  @[Extern]
  struct DMUS_SYNTHSTATS
    property dwSize : UInt32
    property dwValidStats : UInt32
    property dwVoices : UInt32
    property dwTotalCPU : UInt32
    property dwCPUPerVoice : UInt32
    property dwLostNotes : UInt32
    property dwFreeMemory : UInt32
    property lPeakVolume : Int32
    def initialize(@dwSize : UInt32, @dwValidStats : UInt32, @dwVoices : UInt32, @dwTotalCPU : UInt32, @dwCPUPerVoice : UInt32, @dwLostNotes : UInt32, @dwFreeMemory : UInt32, @lPeakVolume : Int32)
    end
  end

  @[Extern]
  struct DMUS_SYNTHSTATS8
    property dwSize : UInt32
    property dwValidStats : UInt32
    property dwVoices : UInt32
    property dwTotalCPU : UInt32
    property dwCPUPerVoice : UInt32
    property dwLostNotes : UInt32
    property dwFreeMemory : UInt32
    property lPeakVolume : Int32
    property dwSynthMemUse : UInt32
    def initialize(@dwSize : UInt32, @dwValidStats : UInt32, @dwVoices : UInt32, @dwTotalCPU : UInt32, @dwCPUPerVoice : UInt32, @dwLostNotes : UInt32, @dwFreeMemory : UInt32, @lPeakVolume : Int32, @dwSynthMemUse : UInt32)
    end
  end

  @[Extern]
  struct DMUS_WAVES_REVERB_PARAMS
    property fInGain : Float32
    property fReverbMix : Float32
    property fReverbTime : Float32
    property fHighFreqRTRatio : Float32
    def initialize(@fInGain : Float32, @fReverbMix : Float32, @fReverbTime : Float32, @fHighFreqRTRatio : Float32)
    end
  end

  @[Extern]
  struct DMUS_CLOCKINFO7
    property dwSize : UInt32
    property ctType : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKTYPE
    property guidClock : LibC::GUID
    property wszDescription : UInt16[128]
    def initialize(@dwSize : UInt32, @ctType : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKTYPE, @guidClock : LibC::GUID, @wszDescription : UInt16[128])
    end
  end

  @[Extern]
  struct DMUS_CLOCKINFO8
    property dwSize : UInt32
    property ctType : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKTYPE
    property guidClock : LibC::GUID
    property wszDescription : UInt16[128]
    property dwFlags : UInt32
    def initialize(@dwSize : UInt32, @ctType : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKTYPE, @guidClock : LibC::GUID, @wszDescription : UInt16[128], @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct DMUS_VOICE_STATE
    property bExists : Win32cr::Foundation::BOOL
    property spPosition : UInt64
    def initialize(@bExists : Win32cr::Foundation::BOOL, @spPosition : UInt64)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A_DATA
    property device_name : Win32cr::Foundation::PSTR
    property data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW
    property device_id : LibC::GUID
    def initialize(@device_name : Win32cr::Foundation::PSTR, @data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW, @device_id : LibC::GUID)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W_DATA
    property device_name : Win32cr::Foundation::PWSTR
    property data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW
    property device_id : LibC::GUID
    def initialize(@device_name : Win32cr::Foundation::PWSTR, @data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW, @device_id : LibC::GUID)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA
    property device_id : LibC::GUID
    property description_a : Win32cr::Foundation::CHAR[256]
    property description_w : UInt16[256]
    property module_a : Win32cr::Foundation::CHAR[260]
    property module_w : UInt16[260]
    property type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE
    property data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW
    property wave_device_id : UInt32
    property devnode : UInt32
    def initialize(@device_id : LibC::GUID, @description_a : Win32cr::Foundation::CHAR[256], @description_w : UInt16[256], @module_a : Win32cr::Foundation::CHAR[260], @module_w : UInt16[260], @type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE, @data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW, @wave_device_id : UInt32, @devnode : UInt32)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA
    property type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE
    property data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW
    property device_id : LibC::GUID
    property description : Win32cr::Foundation::PSTR
    property module__ : Win32cr::Foundation::PSTR
    property interface : Win32cr::Foundation::PSTR
    property wave_device_id : UInt32
    def initialize(@type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE, @data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW, @device_id : LibC::GUID, @description : Win32cr::Foundation::PSTR, @module__ : Win32cr::Foundation::PSTR, @interface : Win32cr::Foundation::PSTR, @wave_device_id : UInt32)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA
    property type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE
    property data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW
    property device_id : LibC::GUID
    property description : Win32cr::Foundation::PWSTR
    property module__ : Win32cr::Foundation::PWSTR
    property interface : Win32cr::Foundation::PWSTR
    property wave_device_id : UInt32
    def initialize(@type__ : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_TYPE, @data_flow : Win32cr::Media::Audio::DirectMusic::DIRECTSOUNDDEVICE_DATAFLOW, @device_id : LibC::GUID, @description : Win32cr::Foundation::PWSTR, @module__ : Win32cr::Foundation::PWSTR, @interface : Win32cr::Foundation::PWSTR, @wave_device_id : UInt32)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1_DATA
    property callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1
    property context : Void*
    def initialize(@callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1, @context : Void*)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A_DATA
    property callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA
    property context : Void*
    def initialize(@callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA, @context : Void*)
    end
  end

  @[Extern]
  struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W_DATA
    property callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW
    property context : Void*
    def initialize(@callback : Win32cr::Media::Audio::DirectMusic::LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW, @context : Void*)
    end
  end

  @[Extern]
  struct Tag_DVAudInfo
    property bAudStyle : UInt8[2]
    property bAudQu : UInt8[2]
    property bNumAudPin : UInt8
    property wAvgSamplesPerPinPerFrm : UInt16[2]
    property wBlkMode : UInt16
    property wDIFMode : UInt16
    property wBlkDiv : UInt16
    def initialize(@bAudStyle : UInt8[2], @bAudQu : UInt8[2], @bNumAudPin : UInt8, @wAvgSamplesPerPinPerFrm : UInt16[2], @wBlkMode : UInt16, @wDIFMode : UInt16, @wBlkDiv : UInt16)
    end
  end

  @[Extern]
  struct MDEVICECAPSEX
    property cbSize : UInt32
    property pCaps : Void*
    def initialize(@cbSize : UInt32, @pCaps : Void*)
    end
  end

  @[Extern]
  struct MIDIOPENDESC
    property hMidi : Win32cr::Media::Audio::HMIDI
    property dwCallback : LibC::UIntPtrT
    property dwInstance : LibC::UIntPtrT
    property dnDevNode : LibC::UIntPtrT
    property cIds : UInt32
    property rgIds : Win32cr::Media::Multimedia::MIDIOPENSTRMID*
    def initialize(@hMidi : Win32cr::Media::Audio::HMIDI, @dwCallback : LibC::UIntPtrT, @dwInstance : LibC::UIntPtrT, @dnDevNode : LibC::UIntPtrT, @cIds : UInt32, @rgIds : Win32cr::Media::Multimedia::MIDIOPENSTRMID*)
    end
  end

  @[Extern]
  record IDirectMusicVtbl,
    query_interface : Proc(IDirectMusic*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusic*, UInt32),
    release : Proc(IDirectMusic*, UInt32),
    enum_port : Proc(IDirectMusic*, UInt32, Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*, Win32cr::Foundation::HRESULT),
    create_music_buffer : Proc(IDirectMusic*, Win32cr::Media::Audio::DirectMusic::DMUS_BUFFERDESC*, Void**, Void*, Win32cr::Foundation::HRESULT),
    create_port : Proc(IDirectMusic*, LibC::GUID*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, Void**, Void*, Win32cr::Foundation::HRESULT),
    enum_master_clock : Proc(IDirectMusic*, UInt32, Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKINFO8*, Win32cr::Foundation::HRESULT),
    get_master_clock : Proc(IDirectMusic*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_master_clock : Proc(IDirectMusic*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusic*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_default_port : Proc(IDirectMusic*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_direct_sound : Proc(IDirectMusic*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusic, lpVtbl : IDirectMusicVtbl* do
    GUID = LibC::GUID.new(0x6536115a_u32, 0x7b2d_u16, 0x11d2_u16, StaticArray[0xba_u8, 0x18_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
    def query_interface(this : IDirectMusic*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusic*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusic*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_port(this : IDirectMusic*, dwIndex : UInt32, pPortCaps : Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_port.call(this, dwIndex, pPortCaps)
    end
    def create_music_buffer(this : IDirectMusic*, pBufferDesc : Win32cr::Media::Audio::DirectMusic::DMUS_BUFFERDESC*, ppBuffer : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_music_buffer.call(this, pBufferDesc, ppBuffer, pUnkOuter)
    end
    def create_port(this : IDirectMusic*, rclsidPort : LibC::GUID*, pPortParams : Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, ppPort : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_port.call(this, rclsidPort, pPortParams, ppPort, pUnkOuter)
    end
    def enum_master_clock(this : IDirectMusic*, dwIndex : UInt32, lpClockInfo : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKINFO8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_master_clock.call(this, dwIndex, lpClockInfo)
    end
    def get_master_clock(this : IDirectMusic*, pguidClock : LibC::GUID*, ppReferenceClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_clock.call(this, pguidClock, ppReferenceClock)
    end
    def set_master_clock(this : IDirectMusic*, rguidClock : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_clock.call(this, rguidClock)
    end
    def activate(this : IDirectMusic*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fEnable)
    end
    def get_default_port(this : IDirectMusic*, pguidPort : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_port.call(this, pguidPort)
    end
    def set_direct_sound(this : IDirectMusic*, pDirectSound : Void*, hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_direct_sound.call(this, pDirectSound, hWnd)
    end

  end

  @[Extern]
  record IDirectMusic8Vtbl,
    query_interface : Proc(IDirectMusic8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusic8*, UInt32),
    release : Proc(IDirectMusic8*, UInt32),
    enum_port : Proc(IDirectMusic8*, UInt32, Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*, Win32cr::Foundation::HRESULT),
    create_music_buffer : Proc(IDirectMusic8*, Win32cr::Media::Audio::DirectMusic::DMUS_BUFFERDESC*, Void**, Void*, Win32cr::Foundation::HRESULT),
    create_port : Proc(IDirectMusic8*, LibC::GUID*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, Void**, Void*, Win32cr::Foundation::HRESULT),
    enum_master_clock : Proc(IDirectMusic8*, UInt32, Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKINFO8*, Win32cr::Foundation::HRESULT),
    get_master_clock : Proc(IDirectMusic8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_master_clock : Proc(IDirectMusic8*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusic8*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_default_port : Proc(IDirectMusic8*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_direct_sound : Proc(IDirectMusic8*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    set_external_master_clock : Proc(IDirectMusic8*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusic8, lpVtbl : IDirectMusic8Vtbl* do
    GUID = LibC::GUID.new(0x2d3629f7_u32, 0x813d_u16, 0x4939_u16, StaticArray[0x85_u8, 0x8_u8, 0xf0_u8, 0x5c_u8, 0x6b_u8, 0x75_u8, 0xfd_u8, 0x97_u8])
    def query_interface(this : IDirectMusic8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusic8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusic8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_port(this : IDirectMusic8*, dwIndex : UInt32, pPortCaps : Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_port.call(this, dwIndex, pPortCaps)
    end
    def create_music_buffer(this : IDirectMusic8*, pBufferDesc : Win32cr::Media::Audio::DirectMusic::DMUS_BUFFERDESC*, ppBuffer : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_music_buffer.call(this, pBufferDesc, ppBuffer, pUnkOuter)
    end
    def create_port(this : IDirectMusic8*, rclsidPort : LibC::GUID*, pPortParams : Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, ppPort : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_port.call(this, rclsidPort, pPortParams, ppPort, pUnkOuter)
    end
    def enum_master_clock(this : IDirectMusic8*, dwIndex : UInt32, lpClockInfo : Win32cr::Media::Audio::DirectMusic::DMUS_CLOCKINFO8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_master_clock.call(this, dwIndex, lpClockInfo)
    end
    def get_master_clock(this : IDirectMusic8*, pguidClock : LibC::GUID*, ppReferenceClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_master_clock.call(this, pguidClock, ppReferenceClock)
    end
    def set_master_clock(this : IDirectMusic8*, rguidClock : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_clock.call(this, rguidClock)
    end
    def activate(this : IDirectMusic8*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fEnable)
    end
    def get_default_port(this : IDirectMusic8*, pguidPort : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_port.call(this, pguidPort)
    end
    def set_direct_sound(this : IDirectMusic8*, pDirectSound : Void*, hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_direct_sound.call(this, pDirectSound, hWnd)
    end
    def set_external_master_clock(this : IDirectMusic8*, pClock : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_external_master_clock.call(this, pClock)
    end

  end

  @[Extern]
  record IDirectMusicBufferVtbl,
    query_interface : Proc(IDirectMusicBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicBuffer*, UInt32),
    release : Proc(IDirectMusicBuffer*, UInt32),
    flush : Proc(IDirectMusicBuffer*, Win32cr::Foundation::HRESULT),
    total_time : Proc(IDirectMusicBuffer*, Int64*, Win32cr::Foundation::HRESULT),
    pack_structured : Proc(IDirectMusicBuffer*, Int64, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    pack_unstructured : Proc(IDirectMusicBuffer*, Int64, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    reset_read_ptr : Proc(IDirectMusicBuffer*, Win32cr::Foundation::HRESULT),
    get_next_event : Proc(IDirectMusicBuffer*, Int64*, UInt32*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_raw_buffer_ptr : Proc(IDirectMusicBuffer*, UInt8**, Win32cr::Foundation::HRESULT),
    get_start_time : Proc(IDirectMusicBuffer*, Int64*, Win32cr::Foundation::HRESULT),
    get_used_bytes : Proc(IDirectMusicBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_bytes : Proc(IDirectMusicBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer_format : Proc(IDirectMusicBuffer*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_start_time : Proc(IDirectMusicBuffer*, Int64, Win32cr::Foundation::HRESULT),
    set_used_bytes : Proc(IDirectMusicBuffer*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicBuffer, lpVtbl : IDirectMusicBufferVtbl* do
    GUID = LibC::GUID.new(0xd2ac2878_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def flush(this : IDirectMusicBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def total_time(this : IDirectMusicBuffer*, prtTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.total_time.call(this, prtTime)
    end
    def pack_structured(this : IDirectMusicBuffer*, rt : Int64, dwChannelGroup : UInt32, dwChannelMessage : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pack_structured.call(this, rt, dwChannelGroup, dwChannelMessage)
    end
    def pack_unstructured(this : IDirectMusicBuffer*, rt : Int64, dwChannelGroup : UInt32, cb : UInt32, lpb : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pack_unstructured.call(this, rt, dwChannelGroup, cb, lpb)
    end
    def reset_read_ptr(this : IDirectMusicBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_read_ptr.call(this)
    end
    def get_next_event(this : IDirectMusicBuffer*, prt : Int64*, pdwChannelGroup : UInt32*, pdwLength : UInt32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_event.call(this, prt, pdwChannelGroup, pdwLength, ppData)
    end
    def get_raw_buffer_ptr(this : IDirectMusicBuffer*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_buffer_ptr.call(this, ppData)
    end
    def get_start_time(this : IDirectMusicBuffer*, prt : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start_time.call(this, prt)
    end
    def get_used_bytes(this : IDirectMusicBuffer*, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_used_bytes.call(this, pcb)
    end
    def get_max_bytes(this : IDirectMusicBuffer*, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_bytes.call(this, pcb)
    end
    def get_buffer_format(this : IDirectMusicBuffer*, pGuidFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_format.call(this, pGuidFormat)
    end
    def set_start_time(this : IDirectMusicBuffer*, rt : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start_time.call(this, rt)
    end
    def set_used_bytes(this : IDirectMusicBuffer*, cb : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_used_bytes.call(this, cb)
    end

  end

  @[Extern]
  record IDirectMusicInstrumentVtbl,
    query_interface : Proc(IDirectMusicInstrument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicInstrument*, UInt32),
    release : Proc(IDirectMusicInstrument*, UInt32),
    get_patch : Proc(IDirectMusicInstrument*, UInt32*, Win32cr::Foundation::HRESULT),
    set_patch : Proc(IDirectMusicInstrument*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicInstrument, lpVtbl : IDirectMusicInstrumentVtbl* do
    GUID = LibC::GUID.new(0xd2ac287d_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicInstrument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicInstrument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicInstrument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_patch(this : IDirectMusicInstrument*, pdwPatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_patch.call(this, pdwPatch)
    end
    def set_patch(this : IDirectMusicInstrument*, dwPatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_patch.call(this, dwPatch)
    end

  end

  @[Extern]
  record IDirectMusicDownloadedInstrumentVtbl,
    query_interface : Proc(IDirectMusicDownloadedInstrument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicDownloadedInstrument*, UInt32),
    release : Proc(IDirectMusicDownloadedInstrument*, UInt32)


  @[Extern]
  record IDirectMusicDownloadedInstrument, lpVtbl : IDirectMusicDownloadedInstrumentVtbl* do
    GUID = LibC::GUID.new(0xd2ac287e_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicDownloadedInstrument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicDownloadedInstrument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicDownloadedInstrument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDirectMusicCollectionVtbl,
    query_interface : Proc(IDirectMusicCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicCollection*, UInt32),
    release : Proc(IDirectMusicCollection*, UInt32),
    get_instrument : Proc(IDirectMusicCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    enum_instrument : Proc(IDirectMusicCollection*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicCollection, lpVtbl : IDirectMusicCollectionVtbl* do
    GUID = LibC::GUID.new(0xd2ac287c_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_instrument(this : IDirectMusicCollection*, dwPatch : UInt32, ppInstrument : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instrument.call(this, dwPatch, ppInstrument)
    end
    def enum_instrument(this : IDirectMusicCollection*, dwIndex : UInt32, pdwPatch : UInt32*, pwszName : Win32cr::Foundation::PWSTR, dwNameLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_instrument.call(this, dwIndex, pdwPatch, pwszName, dwNameLen)
    end

  end

  @[Extern]
  record IDirectMusicDownloadVtbl,
    query_interface : Proc(IDirectMusicDownload*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicDownload*, UInt32),
    release : Proc(IDirectMusicDownload*, UInt32),
    get_buffer : Proc(IDirectMusicDownload*, Void**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicDownload, lpVtbl : IDirectMusicDownloadVtbl* do
    GUID = LibC::GUID.new(0xd2ac287b_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicDownload*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicDownload*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicDownload*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IDirectMusicDownload*, ppvBuffer : Void**, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppvBuffer, pdwSize)
    end

  end

  @[Extern]
  record IDirectMusicPortDownloadVtbl,
    query_interface : Proc(IDirectMusicPortDownload*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicPortDownload*, UInt32),
    release : Proc(IDirectMusicPortDownload*, UInt32),
    get_buffer : Proc(IDirectMusicPortDownload*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    allocate_buffer : Proc(IDirectMusicPortDownload*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_dl_id : Proc(IDirectMusicPortDownload*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_append : Proc(IDirectMusicPortDownload*, UInt32*, Win32cr::Foundation::HRESULT),
    download : Proc(IDirectMusicPortDownload*, Void*, Win32cr::Foundation::HRESULT),
    unload : Proc(IDirectMusicPortDownload*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicPortDownload, lpVtbl : IDirectMusicPortDownloadVtbl* do
    GUID = LibC::GUID.new(0xd2ac287a_u32, 0xb39b_u16, 0x11d1_u16, StaticArray[0x87_u8, 0x4_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x93_u8, 0xb1_u8, 0xbd_u8])
    def query_interface(this : IDirectMusicPortDownload*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicPortDownload*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicPortDownload*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IDirectMusicPortDownload*, dwDLId : UInt32, ppIDMDownload : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, dwDLId, ppIDMDownload)
    end
    def allocate_buffer(this : IDirectMusicPortDownload*, dwSize : UInt32, ppIDMDownload : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_buffer.call(this, dwSize, ppIDMDownload)
    end
    def get_dl_id(this : IDirectMusicPortDownload*, pdwStartDLId : UInt32*, dwCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dl_id.call(this, pdwStartDLId, dwCount)
    end
    def get_append(this : IDirectMusicPortDownload*, pdwAppend : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_append.call(this, pdwAppend)
    end
    def download(this : IDirectMusicPortDownload*, pIDMDownload : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download.call(this, pIDMDownload)
    end
    def unload(this : IDirectMusicPortDownload*, pIDMDownload : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload.call(this, pIDMDownload)
    end

  end

  @[Extern]
  record IDirectMusicPortVtbl,
    query_interface : Proc(IDirectMusicPort*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicPort*, UInt32),
    release : Proc(IDirectMusicPort*, UInt32),
    play_buffer : Proc(IDirectMusicPort*, Void*, Win32cr::Foundation::HRESULT),
    set_read_notification_handle : Proc(IDirectMusicPort*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    read : Proc(IDirectMusicPort*, Void*, Win32cr::Foundation::HRESULT),
    download_instrument : Proc(IDirectMusicPort*, Void*, Void**, Win32cr::Media::Audio::DirectMusic::DMUS_NOTERANGE*, UInt32, Win32cr::Foundation::HRESULT),
    unload_instrument : Proc(IDirectMusicPort*, Void*, Win32cr::Foundation::HRESULT),
    get_latency_clock : Proc(IDirectMusicPort*, Void**, Win32cr::Foundation::HRESULT),
    get_running_stats : Proc(IDirectMusicPort*, Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*, Win32cr::Foundation::HRESULT),
    compact : Proc(IDirectMusicPort*, Win32cr::Foundation::HRESULT),
    get_caps : Proc(IDirectMusicPort*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*, Win32cr::Foundation::HRESULT),
    device_io_control : Proc(IDirectMusicPort*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    set_num_channel_groups : Proc(IDirectMusicPort*, UInt32, Win32cr::Foundation::HRESULT),
    get_num_channel_groups : Proc(IDirectMusicPort*, UInt32*, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusicPort*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_channel_priority : Proc(IDirectMusicPort*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_priority : Proc(IDirectMusicPort*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_direct_sound : Proc(IDirectMusicPort*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectMusicPort*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicPort, lpVtbl : IDirectMusicPortVtbl* do
    GUID = LibC::GUID.new(0x8f2d8c9_u32, 0x37c2_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0xf9_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
    def query_interface(this : IDirectMusicPort*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicPort*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicPort*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def play_buffer(this : IDirectMusicPort*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_buffer.call(this, pBuffer)
    end
    def set_read_notification_handle(this : IDirectMusicPort*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_read_notification_handle.call(this, hEvent)
    end
    def read(this : IDirectMusicPort*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pBuffer)
    end
    def download_instrument(this : IDirectMusicPort*, pInstrument : Void*, ppDownloadedInstrument : Void**, pNoteRanges : Win32cr::Media::Audio::DirectMusic::DMUS_NOTERANGE*, dwNumNoteRanges : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download_instrument.call(this, pInstrument, ppDownloadedInstrument, pNoteRanges, dwNumNoteRanges)
    end
    def unload_instrument(this : IDirectMusicPort*, pDownloadedInstrument : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload_instrument.call(this, pDownloadedInstrument)
    end
    def get_latency_clock(this : IDirectMusicPort*, ppClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency_clock.call(this, ppClock)
    end
    def get_running_stats(this : IDirectMusicPort*, pStats : Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_stats.call(this, pStats)
    end
    def compact(this : IDirectMusicPort*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compact.call(this)
    end
    def get_caps(this : IDirectMusicPort*, pPortCaps : Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pPortCaps)
    end
    def device_io_control(this : IDirectMusicPort*, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_io_control.call(this, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped)
    end
    def set_num_channel_groups(this : IDirectMusicPort*, dwChannelGroups : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_num_channel_groups.call(this, dwChannelGroups)
    end
    def get_num_channel_groups(this : IDirectMusicPort*, pdwChannelGroups : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_channel_groups.call(this, pdwChannelGroups)
    end
    def activate(this : IDirectMusicPort*, fActive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fActive)
    end
    def set_channel_priority(this : IDirectMusicPort*, dwChannelGroup : UInt32, dwChannel : UInt32, dwPriority : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_priority.call(this, dwChannelGroup, dwChannel, dwPriority)
    end
    def get_channel_priority(this : IDirectMusicPort*, dwChannelGroup : UInt32, dwChannel : UInt32, pdwPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_priority.call(this, dwChannelGroup, dwChannel, pdwPriority)
    end
    def set_direct_sound(this : IDirectMusicPort*, pDirectSound : Void*, pDirectSoundBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_direct_sound.call(this, pDirectSound, pDirectSoundBuffer)
    end
    def get_format(this : IDirectMusicPort*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*, pdwWaveFormatExSize : UInt32*, pdwBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pWaveFormatEx, pdwWaveFormatExSize, pdwBufferSize)
    end

  end

  @[Extern]
  record IDirectMusicThruVtbl,
    query_interface : Proc(IDirectMusicThru*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicThru*, UInt32),
    release : Proc(IDirectMusicThru*, UInt32),
    thru_channel : Proc(IDirectMusicThru*, UInt32, UInt32, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicThru, lpVtbl : IDirectMusicThruVtbl* do
    GUID = LibC::GUID.new(0xced153e7_u32, 0x3606_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0xf9_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xac_u8, 0x12_u8])
    def query_interface(this : IDirectMusicThru*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicThru*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicThru*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thru_channel(this : IDirectMusicThru*, dwSourceChannelGroup : UInt32, dwSourceChannel : UInt32, dwDestinationChannelGroup : UInt32, dwDestinationChannel : UInt32, pDestinationPort : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thru_channel.call(this, dwSourceChannelGroup, dwSourceChannel, dwDestinationChannelGroup, dwDestinationChannel, pDestinationPort)
    end

  end

  @[Extern]
  record IDirectMusicSynthVtbl,
    query_interface : Proc(IDirectMusicSynth*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicSynth*, UInt32),
    release : Proc(IDirectMusicSynth*, UInt32),
    open : Proc(IDirectMusicSynth*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, Win32cr::Foundation::HRESULT),
    close : Proc(IDirectMusicSynth*, Win32cr::Foundation::HRESULT),
    set_num_channel_groups : Proc(IDirectMusicSynth*, UInt32, Win32cr::Foundation::HRESULT),
    download : Proc(IDirectMusicSynth*, Win32cr::Foundation::HANDLE*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    unload : Proc(IDirectMusicSynth*, Win32cr::Foundation::HANDLE, LibC::IntPtrT, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    play_buffer : Proc(IDirectMusicSynth*, Int64, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_running_stats : Proc(IDirectMusicSynth*, Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*, Win32cr::Foundation::HRESULT),
    get_port_caps : Proc(IDirectMusicSynth*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*, Win32cr::Foundation::HRESULT),
    set_master_clock : Proc(IDirectMusicSynth*, Void*, Win32cr::Foundation::HRESULT),
    get_latency_clock : Proc(IDirectMusicSynth*, Void**, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusicSynth*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_synth_sink : Proc(IDirectMusicSynth*, Void*, Win32cr::Foundation::HRESULT),
    render : Proc(IDirectMusicSynth*, Int16*, UInt32, Int64, Win32cr::Foundation::HRESULT),
    set_channel_priority : Proc(IDirectMusicSynth*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_priority : Proc(IDirectMusicSynth*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectMusicSynth*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32*, Win32cr::Foundation::HRESULT),
    get_append : Proc(IDirectMusicSynth*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicSynth, lpVtbl : IDirectMusicSynthVtbl* do
    GUID = LibC::GUID.new(0x9823661_u32, 0x5c85_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xa6_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x24_u8, 0xd8_u8, 0xb6_u8])
    def query_interface(this : IDirectMusicSynth*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicSynth*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicSynth*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IDirectMusicSynth*, pPortParams : Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pPortParams)
    end
    def close(this : IDirectMusicSynth*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def set_num_channel_groups(this : IDirectMusicSynth*, dwGroups : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_num_channel_groups.call(this, dwGroups)
    end
    def download(this : IDirectMusicSynth*, phDownload : Win32cr::Foundation::HANDLE*, pvData : Void*, pbFree : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download.call(this, phDownload, pvData, pbFree)
    end
    def unload(this : IDirectMusicSynth*, hDownload : Win32cr::Foundation::HANDLE, lpFreeHandle : LibC::IntPtrT, hUserData : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload.call(this, hDownload, lpFreeHandle, hUserData)
    end
    def play_buffer(this : IDirectMusicSynth*, rt : Int64, pbBuffer : UInt8*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_buffer.call(this, rt, pbBuffer, cbBuffer)
    end
    def get_running_stats(this : IDirectMusicSynth*, pStats : Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_stats.call(this, pStats)
    end
    def get_port_caps(this : IDirectMusicSynth*, pCaps : Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port_caps.call(this, pCaps)
    end
    def set_master_clock(this : IDirectMusicSynth*, pClock : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_clock.call(this, pClock)
    end
    def get_latency_clock(this : IDirectMusicSynth*, ppClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency_clock.call(this, ppClock)
    end
    def activate(this : IDirectMusicSynth*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fEnable)
    end
    def set_synth_sink(this : IDirectMusicSynth*, pSynthSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_synth_sink.call(this, pSynthSink)
    end
    def render(this : IDirectMusicSynth*, pBuffer : Int16*, dwLength : UInt32, llPosition : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render.call(this, pBuffer, dwLength, llPosition)
    end
    def set_channel_priority(this : IDirectMusicSynth*, dwChannelGroup : UInt32, dwChannel : UInt32, dwPriority : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_priority.call(this, dwChannelGroup, dwChannel, dwPriority)
    end
    def get_channel_priority(this : IDirectMusicSynth*, dwChannelGroup : UInt32, dwChannel : UInt32, pdwPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_priority.call(this, dwChannelGroup, dwChannel, pdwPriority)
    end
    def get_format(this : IDirectMusicSynth*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*, pdwWaveFormatExSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pWaveFormatEx, pdwWaveFormatExSize)
    end
    def get_append(this : IDirectMusicSynth*, pdwAppend : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_append.call(this, pdwAppend)
    end

  end

  @[Extern]
  record IDirectMusicSynth8Vtbl,
    query_interface : Proc(IDirectMusicSynth8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicSynth8*, UInt32),
    release : Proc(IDirectMusicSynth8*, UInt32),
    open : Proc(IDirectMusicSynth8*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*, Win32cr::Foundation::HRESULT),
    close : Proc(IDirectMusicSynth8*, Win32cr::Foundation::HRESULT),
    set_num_channel_groups : Proc(IDirectMusicSynth8*, UInt32, Win32cr::Foundation::HRESULT),
    download : Proc(IDirectMusicSynth8*, Win32cr::Foundation::HANDLE*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    unload : Proc(IDirectMusicSynth8*, Win32cr::Foundation::HANDLE, LibC::IntPtrT, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    play_buffer : Proc(IDirectMusicSynth8*, Int64, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_running_stats : Proc(IDirectMusicSynth8*, Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*, Win32cr::Foundation::HRESULT),
    get_port_caps : Proc(IDirectMusicSynth8*, Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*, Win32cr::Foundation::HRESULT),
    set_master_clock : Proc(IDirectMusicSynth8*, Void*, Win32cr::Foundation::HRESULT),
    get_latency_clock : Proc(IDirectMusicSynth8*, Void**, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusicSynth8*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_synth_sink : Proc(IDirectMusicSynth8*, Void*, Win32cr::Foundation::HRESULT),
    render : Proc(IDirectMusicSynth8*, Int16*, UInt32, Int64, Win32cr::Foundation::HRESULT),
    set_channel_priority : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_channel_priority : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectMusicSynth8*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32*, Win32cr::Foundation::HRESULT),
    get_append : Proc(IDirectMusicSynth8*, UInt32*, Win32cr::Foundation::HRESULT),
    play_voice : Proc(IDirectMusicSynth8*, Int64, UInt32, UInt32, UInt32, UInt32, Int32, Int32, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    stop_voice : Proc(IDirectMusicSynth8*, Int64, UInt32, Win32cr::Foundation::HRESULT),
    get_voice_state : Proc(IDirectMusicSynth8*, UInt32*, UInt32, Win32cr::Media::Audio::DirectMusic::DMUS_VOICE_STATE*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IDirectMusicSynth8*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    assign_channel_to_buses : Proc(IDirectMusicSynth8*, UInt32, UInt32, UInt32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicSynth8, lpVtbl : IDirectMusicSynth8Vtbl* do
    GUID = LibC::GUID.new(0x53cab625_u32, 0x2711_u16, 0x4c9f_u16, StaticArray[0x9d_u8, 0xe7_u8, 0x1b_u8, 0x7f_u8, 0x92_u8, 0x5f_u8, 0x6f_u8, 0xc8_u8])
    def query_interface(this : IDirectMusicSynth8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicSynth8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicSynth8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IDirectMusicSynth8*, pPortParams : Win32cr::Media::Audio::DirectMusic::DMUS_PORTPARAMS8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pPortParams)
    end
    def close(this : IDirectMusicSynth8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def set_num_channel_groups(this : IDirectMusicSynth8*, dwGroups : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_num_channel_groups.call(this, dwGroups)
    end
    def download(this : IDirectMusicSynth8*, phDownload : Win32cr::Foundation::HANDLE*, pvData : Void*, pbFree : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download.call(this, phDownload, pvData, pbFree)
    end
    def unload(this : IDirectMusicSynth8*, hDownload : Win32cr::Foundation::HANDLE, lpFreeHandle : LibC::IntPtrT, hUserData : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload.call(this, hDownload, lpFreeHandle, hUserData)
    end
    def play_buffer(this : IDirectMusicSynth8*, rt : Int64, pbBuffer : UInt8*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_buffer.call(this, rt, pbBuffer, cbBuffer)
    end
    def get_running_stats(this : IDirectMusicSynth8*, pStats : Win32cr::Media::Audio::DirectMusic::DMUS_SYNTHSTATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_stats.call(this, pStats)
    end
    def get_port_caps(this : IDirectMusicSynth8*, pCaps : Win32cr::Media::Audio::DirectMusic::DMUS_PORTCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port_caps.call(this, pCaps)
    end
    def set_master_clock(this : IDirectMusicSynth8*, pClock : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_clock.call(this, pClock)
    end
    def get_latency_clock(this : IDirectMusicSynth8*, ppClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency_clock.call(this, ppClock)
    end
    def activate(this : IDirectMusicSynth8*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fEnable)
    end
    def set_synth_sink(this : IDirectMusicSynth8*, pSynthSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_synth_sink.call(this, pSynthSink)
    end
    def render(this : IDirectMusicSynth8*, pBuffer : Int16*, dwLength : UInt32, llPosition : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render.call(this, pBuffer, dwLength, llPosition)
    end
    def set_channel_priority(this : IDirectMusicSynth8*, dwChannelGroup : UInt32, dwChannel : UInt32, dwPriority : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_channel_priority.call(this, dwChannelGroup, dwChannel, dwPriority)
    end
    def get_channel_priority(this : IDirectMusicSynth8*, dwChannelGroup : UInt32, dwChannel : UInt32, pdwPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_priority.call(this, dwChannelGroup, dwChannel, pdwPriority)
    end
    def get_format(this : IDirectMusicSynth8*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*, pdwWaveFormatExSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pWaveFormatEx, pdwWaveFormatExSize)
    end
    def get_append(this : IDirectMusicSynth8*, pdwAppend : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_append.call(this, pdwAppend)
    end
    def play_voice(this : IDirectMusicSynth8*, rt : Int64, dwVoiceId : UInt32, dwChannelGroup : UInt32, dwChannel : UInt32, dwDLId : UInt32, prPitch : Int32, vrVolume : Int32, stVoiceStart : UInt64, stLoopStart : UInt64, stLoopEnd : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play_voice.call(this, rt, dwVoiceId, dwChannelGroup, dwChannel, dwDLId, prPitch, vrVolume, stVoiceStart, stLoopStart, stLoopEnd)
    end
    def stop_voice(this : IDirectMusicSynth8*, rt : Int64, dwVoiceId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_voice.call(this, rt, dwVoiceId)
    end
    def get_voice_state(this : IDirectMusicSynth8*, dwVoice : UInt32*, cbVoice : UInt32, dwVoiceState : Win32cr::Media::Audio::DirectMusic::DMUS_VOICE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voice_state.call(this, dwVoice, cbVoice, dwVoiceState)
    end
    def refresh(this : IDirectMusicSynth8*, dwDownloadID : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this, dwDownloadID, dwFlags)
    end
    def assign_channel_to_buses(this : IDirectMusicSynth8*, dwChannelGroup : UInt32, dwChannel : UInt32, pdwBuses : UInt32*, cBuses : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assign_channel_to_buses.call(this, dwChannelGroup, dwChannel, pdwBuses, cBuses)
    end

  end

  @[Extern]
  record IDirectMusicSynthSinkVtbl,
    query_interface : Proc(IDirectMusicSynthSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectMusicSynthSink*, UInt32),
    release : Proc(IDirectMusicSynthSink*, UInt32),
    init : Proc(IDirectMusicSynthSink*, Void*, Win32cr::Foundation::HRESULT),
    set_master_clock : Proc(IDirectMusicSynthSink*, Void*, Win32cr::Foundation::HRESULT),
    get_latency_clock : Proc(IDirectMusicSynthSink*, Void**, Win32cr::Foundation::HRESULT),
    activate : Proc(IDirectMusicSynthSink*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    sample_to_ref_time : Proc(IDirectMusicSynthSink*, Int64, Int64*, Win32cr::Foundation::HRESULT),
    ref_time_to_sample : Proc(IDirectMusicSynthSink*, Int64, Int64*, Win32cr::Foundation::HRESULT),
    set_direct_sound : Proc(IDirectMusicSynthSink*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_desired_buffer_size : Proc(IDirectMusicSynthSink*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectMusicSynthSink, lpVtbl : IDirectMusicSynthSinkVtbl* do
    GUID = LibC::GUID.new(0x9823663_u32, 0x5c85_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xa6_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x24_u8, 0xd8_u8, 0xb6_u8])
    def query_interface(this : IDirectMusicSynthSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectMusicSynthSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectMusicSynthSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IDirectMusicSynthSink*, pSynth : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pSynth)
    end
    def set_master_clock(this : IDirectMusicSynthSink*, pClock : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_master_clock.call(this, pClock)
    end
    def get_latency_clock(this : IDirectMusicSynthSink*, ppClock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latency_clock.call(this, ppClock)
    end
    def activate(this : IDirectMusicSynthSink*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fEnable)
    end
    def sample_to_ref_time(this : IDirectMusicSynthSink*, llSampleTime : Int64, prfTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sample_to_ref_time.call(this, llSampleTime, prfTime)
    end
    def ref_time_to_sample(this : IDirectMusicSynthSink*, rfTime : Int64, pllSampleTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ref_time_to_sample.call(this, rfTime, pllSampleTime)
    end
    def set_direct_sound(this : IDirectMusicSynthSink*, pDirectSound : Void*, pDirectSoundBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_direct_sound.call(this, pDirectSound, pDirectSoundBuffer)
    end
    def get_desired_buffer_size(this : IDirectMusicSynthSink*, pdwBufferSizeInSamples : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desired_buffer_size.call(this, pdwBufferSizeInSamples)
    end

  end

end