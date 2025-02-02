require "./../audio.cr"
require "./../../graphics/direct3_d.cr"
require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::Media::Audio::DirectSound
  extend self
  alias LPDSENUMCALLBACKA = Proc(LibC::GUID*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Void*, Win32cr::Foundation::BOOL)

  alias LPDSENUMCALLBACKW = Proc(LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL)

  DIRECTSOUND_VERSION = 1792_u32
  FACDS_ = 2168_u32
  CLSID_DirectSound = "47d4d946-62e8-11cf-93bc-444553540000"
  CLSID_DirectSound8 = "3901cc3f-84b5-4fa4-ba35-aa8172b8a09b"
  CLSID_DirectSoundCapture = "b0210780-89cd-11d0-af08-00a0c925cd16"
  CLSID_DirectSoundCapture8 = "e4bcac13-7f99-4908-9a8e-74e3bf24b6e1"
  CLSID_DirectSoundFullDuplex = "fea4300c-7959-4147-b26a-2377b9e7a91d"
  DSDEVID_DefaultPlayback = "def00000-9c6d-47ed-aaf1-4dda8f2b5c03"
  DSDEVID_DefaultCapture = "def00001-9c6d-47ed-aaf1-4dda8f2b5c03"
  DSDEVID_DefaultVoicePlayback = "def00002-9c6d-47ed-aaf1-4dda8f2b5c03"
  DSDEVID_DefaultVoiceCapture = "def00003-9c6d-47ed-aaf1-4dda8f2b5c03"
  DSFX_LOCHARDWARE = 1_u32
  DSFX_LOCSOFTWARE = 2_u32
  DSCFX_LOCHARDWARE = 1_u32
  DSCFX_LOCSOFTWARE = 2_u32
  DSCFXR_LOCHARDWARE = 16_u32
  DSCFXR_LOCSOFTWARE = 32_u32
  GUID_All_Objects = "aa114de5-c262-4169-a1c8-23d698cc73b5"
  KSPROPERTY_SUPPORT_GET = 1_u32
  KSPROPERTY_SUPPORT_SET = 2_u32
  DSFXGARGLE_WAVE_TRIANGLE = 0_u32
  DSFXGARGLE_WAVE_SQUARE = 1_u32
  DSFXGARGLE_RATEHZ_MIN = 1_u32
  DSFXGARGLE_RATEHZ_MAX = 1000_u32
  DSFXCHORUS_WAVE_TRIANGLE = 0_u32
  DSFXCHORUS_WAVE_SIN = 1_u32
  DSFXCHORUS_WETDRYMIX_MIN = 0
  DSFXCHORUS_WETDRYMIX_MAX = 100
  DSFXCHORUS_DEPTH_MIN = 0
  DSFXCHORUS_DEPTH_MAX = 100
  DSFXCHORUS_FEEDBACK_MIN = -99
  DSFXCHORUS_FEEDBACK_MAX = 99
  DSFXCHORUS_FREQUENCY_MIN = 0
  DSFXCHORUS_FREQUENCY_MAX = 10
  DSFXCHORUS_DELAY_MIN = 0
  DSFXCHORUS_DELAY_MAX = 20
  DSFXCHORUS_PHASE_MIN = 0_u32
  DSFXCHORUS_PHASE_MAX = 4_u32
  DSFXCHORUS_PHASE_NEG_180 = 0_u32
  DSFXCHORUS_PHASE_NEG_90 = 1_u32
  DSFXCHORUS_PHASE_ZERO = 2_u32
  DSFXCHORUS_PHASE_90 = 3_u32
  DSFXCHORUS_PHASE_180 = 4_u32
  DSFXFLANGER_WAVE_TRIANGLE = 0_u32
  DSFXFLANGER_WAVE_SIN = 1_u32
  DSFXFLANGER_WETDRYMIX_MIN = 0
  DSFXFLANGER_WETDRYMIX_MAX = 100
  DSFXFLANGER_FREQUENCY_MIN = 0
  DSFXFLANGER_FREQUENCY_MAX = 10
  DSFXFLANGER_DEPTH_MIN = 0
  DSFXFLANGER_DEPTH_MAX = 100
  DSFXFLANGER_PHASE_MIN = 0_u32
  DSFXFLANGER_PHASE_MAX = 4_u32
  DSFXFLANGER_FEEDBACK_MIN = -99
  DSFXFLANGER_FEEDBACK_MAX = 99
  DSFXFLANGER_DELAY_MIN = 0
  DSFXFLANGER_DELAY_MAX = 4
  DSFXFLANGER_PHASE_NEG_180 = 0_u32
  DSFXFLANGER_PHASE_NEG_90 = 1_u32
  DSFXFLANGER_PHASE_ZERO = 2_u32
  DSFXFLANGER_PHASE_90 = 3_u32
  DSFXFLANGER_PHASE_180 = 4_u32
  DSFXECHO_WETDRYMIX_MIN = 0
  DSFXECHO_WETDRYMIX_MAX = 100
  DSFXECHO_FEEDBACK_MIN = 0
  DSFXECHO_FEEDBACK_MAX = 100
  DSFXECHO_LEFTDELAY_MIN = 1
  DSFXECHO_LEFTDELAY_MAX = 2000
  DSFXECHO_RIGHTDELAY_MIN = 1
  DSFXECHO_RIGHTDELAY_MAX = 2000
  DSFXECHO_PANDELAY_MIN = 0_u32
  DSFXECHO_PANDELAY_MAX = 1_u32
  DSFXDISTORTION_GAIN_MIN = -60
  DSFXDISTORTION_GAIN_MAX = 0
  DSFXDISTORTION_EDGE_MIN = 0
  DSFXDISTORTION_EDGE_MAX = 100
  DSFXDISTORTION_POSTEQCENTERFREQUENCY_MIN = 100
  DSFXDISTORTION_POSTEQCENTERFREQUENCY_MAX = 8000
  DSFXDISTORTION_POSTEQBANDWIDTH_MIN = 100
  DSFXDISTORTION_POSTEQBANDWIDTH_MAX = 8000
  DSFXDISTORTION_PRELOWPASSCUTOFF_MIN = 100
  DSFXDISTORTION_PRELOWPASSCUTOFF_MAX = 8000
  DSFXCOMPRESSOR_GAIN_MIN = -60
  DSFXCOMPRESSOR_GAIN_MAX = 60
  DSFXCOMPRESSOR_ATTACK_MIN = 0.01
  DSFXCOMPRESSOR_ATTACK_MAX = 500
  DSFXCOMPRESSOR_RELEASE_MIN = 50
  DSFXCOMPRESSOR_RELEASE_MAX = 3000
  DSFXCOMPRESSOR_THRESHOLD_MIN = -60
  DSFXCOMPRESSOR_THRESHOLD_MAX = 0
  DSFXCOMPRESSOR_RATIO_MIN = 1
  DSFXCOMPRESSOR_RATIO_MAX = 100
  DSFXCOMPRESSOR_PREDELAY_MIN = 0
  DSFXCOMPRESSOR_PREDELAY_MAX = 4
  DSFXPARAMEQ_CENTER_MIN = 80
  DSFXPARAMEQ_CENTER_MAX = 16000
  DSFXPARAMEQ_BANDWIDTH_MIN = 1
  DSFXPARAMEQ_BANDWIDTH_MAX = 36
  DSFXPARAMEQ_GAIN_MIN = -15
  DSFXPARAMEQ_GAIN_MAX = 15
  DSFX_I3DL2REVERB_ROOM_MIN = -10000_i32
  DSFX_I3DL2REVERB_ROOM_MAX = 0_u32
  DSFX_I3DL2REVERB_ROOM_DEFAULT = -1000_i32
  DSFX_I3DL2REVERB_ROOMHF_MIN = -10000_i32
  DSFX_I3DL2REVERB_ROOMHF_MAX = 0_u32
  DSFX_I3DL2REVERB_ROOMHF_DEFAULT = -100_i32
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MIN = 0
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MAX = 10
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_DEFAULT = 0
  DSFX_I3DL2REVERB_DECAYTIME_MIN = 0.1
  DSFX_I3DL2REVERB_DECAYTIME_MAX = 20
  DSFX_I3DL2REVERB_DECAYTIME_DEFAULT = 1.49
  DSFX_I3DL2REVERB_DECAYHFRATIO_MIN = 0.1
  DSFX_I3DL2REVERB_DECAYHFRATIO_MAX = 2
  DSFX_I3DL2REVERB_DECAYHFRATIO_DEFAULT = 0.83
  DSFX_I3DL2REVERB_REFLECTIONS_MIN = -10000_i32
  DSFX_I3DL2REVERB_REFLECTIONS_MAX = 1000_u32
  DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT = -2602_i32
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_MIN = 0
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_MAX = 0.3
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_DEFAULT = 0.007
  DSFX_I3DL2REVERB_REVERB_MIN = -10000_i32
  DSFX_I3DL2REVERB_REVERB_MAX = 2000_u32
  DSFX_I3DL2REVERB_REVERB_DEFAULT = 200_u32
  DSFX_I3DL2REVERB_REVERBDELAY_MIN = 0
  DSFX_I3DL2REVERB_REVERBDELAY_MAX = 0.1
  DSFX_I3DL2REVERB_REVERBDELAY_DEFAULT = 0.011
  DSFX_I3DL2REVERB_DIFFUSION_MIN = 0
  DSFX_I3DL2REVERB_DIFFUSION_MAX = 100
  DSFX_I3DL2REVERB_DIFFUSION_DEFAULT = 100
  DSFX_I3DL2REVERB_DENSITY_MIN = 0
  DSFX_I3DL2REVERB_DENSITY_MAX = 100
  DSFX_I3DL2REVERB_DENSITY_DEFAULT = 100
  DSFX_I3DL2REVERB_HFREFERENCE_MIN = 20
  DSFX_I3DL2REVERB_HFREFERENCE_MAX = 20000
  DSFX_I3DL2REVERB_HFREFERENCE_DEFAULT = 5000
  DSFX_I3DL2REVERB_QUALITY_MIN = 0_u32
  DSFX_I3DL2REVERB_QUALITY_MAX = 3_u32
  DSFX_I3DL2REVERB_QUALITY_DEFAULT = 2_u32
  DSFX_WAVESREVERB_INGAIN_MIN = -96
  DSFX_WAVESREVERB_INGAIN_MAX = 0
  DSFX_WAVESREVERB_INGAIN_DEFAULT = 0
  DSFX_WAVESREVERB_REVERBMIX_MIN = -96
  DSFX_WAVESREVERB_REVERBMIX_MAX = 0
  DSFX_WAVESREVERB_REVERBMIX_DEFAULT = 0
  DSFX_WAVESREVERB_REVERBTIME_MIN = 0.001
  DSFX_WAVESREVERB_REVERBTIME_MAX = 3000
  DSFX_WAVESREVERB_REVERBTIME_DEFAULT = 1000
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_MIN = 0.001
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_MAX = 0.999
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_DEFAULT = 0.001
  DSCFX_AEC_MODE_PASS_THROUGH = 0_u32
  DSCFX_AEC_MODE_HALF_DUPLEX = 1_u32
  DSCFX_AEC_MODE_FULL_DUPLEX = 2_u32
  DSCFX_AEC_STATUS_HISTORY_UNINITIALIZED = 0_u32
  DSCFX_AEC_STATUS_HISTORY_CONTINUOUSLY_CONVERGED = 1_u32
  DSCFX_AEC_STATUS_HISTORY_PREVIOUSLY_DIVERGED = 2_u32
  DSCFX_AEC_STATUS_CURRENTLY_CONVERGED = 8_u32
  DS_NO_VIRTUALIZATION = 142082058_i32
  DSCAPS_PRIMARYMONO = 1_u32
  DSCAPS_PRIMARYSTEREO = 2_u32
  DSCAPS_PRIMARY8BIT = 4_u32
  DSCAPS_PRIMARY16BIT = 8_u32
  DSCAPS_CONTINUOUSRATE = 16_u32
  DSCAPS_EMULDRIVER = 32_u32
  DSCAPS_CERTIFIED = 64_u32
  DSCAPS_SECONDARYMONO = 256_u32
  DSCAPS_SECONDARYSTEREO = 512_u32
  DSCAPS_SECONDARY8BIT = 1024_u32
  DSCAPS_SECONDARY16BIT = 2048_u32
  DSSCL_NORMAL = 1_u32
  DSSCL_PRIORITY = 2_u32
  DSSCL_EXCLUSIVE = 3_u32
  DSSCL_WRITEPRIMARY = 4_u32
  DSSPEAKER_DIRECTOUT = 0_u32
  DSSPEAKER_HEADPHONE = 1_u32
  DSSPEAKER_MONO = 2_u32
  DSSPEAKER_QUAD = 3_u32
  DSSPEAKER_STEREO = 4_u32
  DSSPEAKER_SURROUND = 5_u32
  DSSPEAKER_5POINT1 = 6_u32
  DSSPEAKER_7POINT1 = 7_u32
  DSSPEAKER_7POINT1_SURROUND = 8_u32
  DSSPEAKER_5POINT1_SURROUND = 9_u32
  DSSPEAKER_7POINT1_WIDE = 7_u32
  DSSPEAKER_5POINT1_BACK = 6_u32
  DSSPEAKER_GEOMETRY_MIN = 5_u32
  DSSPEAKER_GEOMETRY_NARROW = 10_u32
  DSSPEAKER_GEOMETRY_WIDE = 20_u32
  DSSPEAKER_GEOMETRY_MAX = 180_u32
  DSBCAPS_PRIMARYBUFFER = 1_u32
  DSBCAPS_STATIC = 2_u32
  DSBCAPS_LOCHARDWARE = 4_u32
  DSBCAPS_LOCSOFTWARE = 8_u32
  DSBCAPS_CTRL3D = 16_u32
  DSBCAPS_CTRLFREQUENCY = 32_u32
  DSBCAPS_CTRLPAN = 64_u32
  DSBCAPS_CTRLVOLUME = 128_u32
  DSBCAPS_CTRLPOSITIONNOTIFY = 256_u32
  DSBCAPS_CTRLFX = 512_u32
  DSBCAPS_STICKYFOCUS = 16384_u32
  DSBCAPS_GLOBALFOCUS = 32768_u32
  DSBCAPS_GETCURRENTPOSITION2 = 65536_u32
  DSBCAPS_MUTE3DATMAXDISTANCE = 131072_u32
  DSBCAPS_LOCDEFER = 262144_u32
  DSBCAPS_TRUEPLAYPOSITION = 524288_u32
  DSBPLAY_LOOPING = 1_u32
  DSBPLAY_LOCHARDWARE = 2_u32
  DSBPLAY_LOCSOFTWARE = 4_u32
  DSBPLAY_TERMINATEBY_TIME = 8_u32
  DSBPLAY_TERMINATEBY_DISTANCE = 16_u64
  DSBPLAY_TERMINATEBY_PRIORITY = 32_u64
  DSBSTATUS_PLAYING = 1_u32
  DSBSTATUS_BUFFERLOST = 2_u32
  DSBSTATUS_LOOPING = 4_u32
  DSBSTATUS_LOCHARDWARE = 8_u32
  DSBSTATUS_LOCSOFTWARE = 16_u32
  DSBSTATUS_TERMINATED = 32_u32
  DSBLOCK_FROMWRITECURSOR = 1_u32
  DSBLOCK_ENTIREBUFFER = 2_u32
  DSBFREQUENCY_ORIGINAL = 0_u32
  DSBFREQUENCY_MIN = 100_u32
  DSBFREQUENCY_MAX = 200000_u32
  DSBPAN_LEFT = -10000_i32
  DSBPAN_CENTER = 0_u32
  DSBPAN_RIGHT = 10000_u32
  DSBVOLUME_MIN = -10000_i32
  DSBVOLUME_MAX = 0_u32
  DSBSIZE_MIN = 4_u32
  DSBSIZE_MAX = 268435455_u32
  DSBSIZE_FX_MIN = 150_u32
  DSBNOTIFICATIONS_MAX = 100000_u32
  DS3DMODE_NORMAL = 0_u32
  DS3DMODE_HEADRELATIVE = 1_u32
  DS3DMODE_DISABLE = 2_u32
  DS3D_IMMEDIATE = 0_u32
  DS3D_DEFERRED = 1_u32
  DS3D_DEFAULTDISTANCEFACTOR = 1
  DS3D_MINROLLOFFFACTOR = 0
  DS3D_MAXROLLOFFFACTOR = 10
  DS3D_DEFAULTROLLOFFFACTOR = 1
  DS3D_MINDOPPLERFACTOR = 0
  DS3D_MAXDOPPLERFACTOR = 10
  DS3D_DEFAULTDOPPLERFACTOR = 1
  DS3D_DEFAULTMINDISTANCE = 1
  DS3D_DEFAULTMAXDISTANCE = 1E+09
  DS3D_MINCONEANGLE = 0_u32
  DS3D_MAXCONEANGLE = 360_u32
  DS3D_DEFAULTCONEANGLE = 360_u32
  DS3D_DEFAULTCONEOUTSIDEVOLUME = 0_u32
  DSCCAPS_EMULDRIVER = 32_u32
  DSCCAPS_CERTIFIED = 64_u32
  DSCCAPS_MULTIPLECAPTURE = 1_u32
  DSCBCAPS_WAVEMAPPED = 2147483648_u32
  DSCBCAPS_CTRLFX = 512_u32
  DSCBLOCK_ENTIREBUFFER = 1_u32
  DSCBSTATUS_CAPTURING = 1_u32
  DSCBSTATUS_LOOPING = 2_u32
  DSCBSTART_LOOPING = 1_u32
  DSBPN_OFFSETSTOP = 4294967295_u32
  DS_CERTIFIED = 0_u32
  DS_UNCERTIFIED = 1_u32
  DS3DALG_NO_VIRTUALIZATION = "c241333f-1c1b-11d2-94f5-00c04fc28aca"
  DS3DALG_HRTF_FULL = "c2413340-1c1b-11d2-94f5-00c04fc28aca"
  DS3DALG_HRTF_LIGHT = "c2413342-1c1b-11d2-94f5-00c04fc28aca"
  GUID_DSFX_STANDARD_GARGLE = "dafd8210-5711-4b91-9fe3-f75b7ae279bf"
  GUID_DSFX_STANDARD_CHORUS = "efe6629c-81f7-4281-bd91-c9d604a95af6"
  GUID_DSFX_STANDARD_FLANGER = "efca3d92-dfd8-4672-a603-7420894bad98"
  GUID_DSFX_STANDARD_ECHO = "ef3e932c-d40b-4f51-8ccf-3f98f1b29d5d"
  GUID_DSFX_STANDARD_DISTORTION = "ef114c90-cd1d-484e-96e5-09cfaf912a21"
  GUID_DSFX_STANDARD_COMPRESSOR = "ef011f79-4000-406d-87af-bffb3fc39d57"
  GUID_DSFX_STANDARD_PARAMEQ = "120ced89-3bf4-4173-a132-3cb406cf3231"
  GUID_DSFX_STANDARD_I3DL2REVERB = "ef985e71-d5c7-42d4-ba4d-2d073e2e96f4"
  GUID_DSFX_WAVES_REVERB = "87fc0268-9a55-4360-95aa-004a1d9de26c"
  GUID_DSCFX_CLASS_AEC = "bf963d80-c559-11d0-8a2b-00a0c9255ac1"
  GUID_DSCFX_MS_AEC = "cdebb919-379a-488a-8765-f53cfd36de40"
  GUID_DSCFX_SYSTEM_AEC = "1c22c56d-9879-4f5b-a389-27996ddc2810"
  GUID_DSCFX_CLASS_NS = "e07f903f-62fd-4e60-8cdd-dea7236665b5"
  GUID_DSCFX_MS_NS = "11c5c73b-66e9-4ba1-a0ba-e814c6eed92d"
  GUID_DSCFX_SYSTEM_NS = "5ab0882e-7274-4516-877d-4eee99ba4fd0"
  DSFXR_PRESENT = 0_i32
  DSFXR_LOCHARDWARE = 1_i32
  DSFXR_LOCSOFTWARE = 2_i32
  DSFXR_UNALLOCATED = 3_i32
  DSFXR_FAILED = 4_i32
  DSFXR_UNKNOWN = 5_i32
  DSFXR_SENDLOOP = 6_i32
  DSFX_I3DL2_MATERIAL_PRESET_SINGLEWINDOW = 0_i32
  DSFX_I3DL2_MATERIAL_PRESET_DOUBLEWINDOW = 1_i32
  DSFX_I3DL2_MATERIAL_PRESET_THINDOOR = 2_i32
  DSFX_I3DL2_MATERIAL_PRESET_THICKDOOR = 3_i32
  DSFX_I3DL2_MATERIAL_PRESET_WOODWALL = 4_i32
  DSFX_I3DL2_MATERIAL_PRESET_BRICKWALL = 5_i32
  DSFX_I3DL2_MATERIAL_PRESET_STONEWALL = 6_i32
  DSFX_I3DL2_MATERIAL_PRESET_CURTAIN = 7_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_DEFAULT = 0_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_GENERIC = 1_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL = 2_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_ROOM = 3_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_BATHROOM = 4_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM = 5_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_STONEROOM = 6_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM = 7_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL = 8_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_CAVE = 9_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_ARENA = 10_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_HANGAR = 11_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY = 12_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_HALLWAY = 13_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR = 14_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_ALLEY = 15_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_FOREST = 16_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_CITY = 17_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS = 18_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_QUARRY = 19_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_PLAIN = 20_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT = 21_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE = 22_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_UNDERWATER = 23_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_SMALLROOM = 24_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM = 25_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEROOM = 26_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL = 27_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEHALL = 28_i32
  DSFX_I3DL2_ENVIRONMENT_PRESET_PLATE = 29_i32


  @[Extern]
  struct DSCAPS
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwMinSecondarySampleRate : UInt32
    property dwMaxSecondarySampleRate : UInt32
    property dwPrimaryBuffers : UInt32
    property dwMaxHwMixingAllBuffers : UInt32
    property dwMaxHwMixingStaticBuffers : UInt32
    property dwMaxHwMixingStreamingBuffers : UInt32
    property dwFreeHwMixingAllBuffers : UInt32
    property dwFreeHwMixingStaticBuffers : UInt32
    property dwFreeHwMixingStreamingBuffers : UInt32
    property dwMaxHw3DAllBuffers : UInt32
    property dwMaxHw3DStaticBuffers : UInt32
    property dwMaxHw3DStreamingBuffers : UInt32
    property dwFreeHw3DAllBuffers : UInt32
    property dwFreeHw3DStaticBuffers : UInt32
    property dwFreeHw3DStreamingBuffers : UInt32
    property dwTotalHwMemBytes : UInt32
    property dwFreeHwMemBytes : UInt32
    property dwMaxContigFreeHwMemBytes : UInt32
    property dwUnlockTransferRateHwBuffers : UInt32
    property dwPlayCpuOverheadSwBuffers : UInt32
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwMinSecondarySampleRate : UInt32, @dwMaxSecondarySampleRate : UInt32, @dwPrimaryBuffers : UInt32, @dwMaxHwMixingAllBuffers : UInt32, @dwMaxHwMixingStaticBuffers : UInt32, @dwMaxHwMixingStreamingBuffers : UInt32, @dwFreeHwMixingAllBuffers : UInt32, @dwFreeHwMixingStaticBuffers : UInt32, @dwFreeHwMixingStreamingBuffers : UInt32, @dwMaxHw3DAllBuffers : UInt32, @dwMaxHw3DStaticBuffers : UInt32, @dwMaxHw3DStreamingBuffers : UInt32, @dwFreeHw3DAllBuffers : UInt32, @dwFreeHw3DStaticBuffers : UInt32, @dwFreeHw3DStreamingBuffers : UInt32, @dwTotalHwMemBytes : UInt32, @dwFreeHwMemBytes : UInt32, @dwMaxContigFreeHwMemBytes : UInt32, @dwUnlockTransferRateHwBuffers : UInt32, @dwPlayCpuOverheadSwBuffers : UInt32, @dwReserved1 : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct DSBCAPS
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwUnlockTransferRate : UInt32
    property dwPlayCpuOverhead : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwUnlockTransferRate : UInt32, @dwPlayCpuOverhead : UInt32)
    end
  end

  @[Extern]
  struct DSEFFECTDESC
    property dwSize : UInt32
    property dwFlags : UInt32
    property guidDSFXClass : LibC::GUID
    property dwReserved1 : LibC::UIntPtrT
    property dwReserved2 : LibC::UIntPtrT
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @guidDSFXClass : LibC::GUID, @dwReserved1 : LibC::UIntPtrT, @dwReserved2 : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct DSCEFFECTDESC
    property dwSize : UInt32
    property dwFlags : UInt32
    property guidDSCFXClass : LibC::GUID
    property guidDSCFXInstance : LibC::GUID
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @guidDSCFXClass : LibC::GUID, @guidDSCFXInstance : LibC::GUID, @dwReserved1 : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct DSBUFFERDESC
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwReserved : UInt32
    property lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*
    property guid3DAlgorithm : LibC::GUID
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwReserved : UInt32, @lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, @guid3DAlgorithm : LibC::GUID)
    end
  end

  @[Extern]
  struct DSBUFFERDESC1
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwReserved : UInt32
    property lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwReserved : UInt32, @lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*)
    end
  end

  @[Extern]
  struct DS3DBUFFER
    property dwSize : UInt32
    property vPosition : Win32cr::Graphics::Direct3D::D3DVECTOR
    property vVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR
    property dwInsideConeAngle : UInt32
    property dwOutsideConeAngle : UInt32
    property vConeOrientation : Win32cr::Graphics::Direct3D::D3DVECTOR
    property lConeOutsideVolume : Int32
    property flMinDistance : Float32
    property flMaxDistance : Float32
    property dwMode : UInt32
    def initialize(@dwSize : UInt32, @vPosition : Win32cr::Graphics::Direct3D::D3DVECTOR, @vVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR, @dwInsideConeAngle : UInt32, @dwOutsideConeAngle : UInt32, @vConeOrientation : Win32cr::Graphics::Direct3D::D3DVECTOR, @lConeOutsideVolume : Int32, @flMinDistance : Float32, @flMaxDistance : Float32, @dwMode : UInt32)
    end
  end

  @[Extern]
  struct DS3DLISTENER
    property dwSize : UInt32
    property vPosition : Win32cr::Graphics::Direct3D::D3DVECTOR
    property vVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR
    property vOrientFront : Win32cr::Graphics::Direct3D::D3DVECTOR
    property vOrientTop : Win32cr::Graphics::Direct3D::D3DVECTOR
    property flDistanceFactor : Float32
    property flRolloffFactor : Float32
    property flDopplerFactor : Float32
    def initialize(@dwSize : UInt32, @vPosition : Win32cr::Graphics::Direct3D::D3DVECTOR, @vVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR, @vOrientFront : Win32cr::Graphics::Direct3D::D3DVECTOR, @vOrientTop : Win32cr::Graphics::Direct3D::D3DVECTOR, @flDistanceFactor : Float32, @flRolloffFactor : Float32, @flDopplerFactor : Float32)
    end
  end

  @[Extern]
  struct DSCCAPS
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwFormats : UInt32
    property dwChannels : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwFormats : UInt32, @dwChannels : UInt32)
    end
  end

  @[Extern]
  struct DSCBUFFERDESC1
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwReserved : UInt32
    property lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwReserved : UInt32, @lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*)
    end
  end

  @[Extern]
  struct DSCBUFFERDESC
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwReserved : UInt32
    property lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*
    property dwFXCount : UInt32
    property lpDSCFXDesc : Win32cr::Media::Audio::DirectSound::DSCEFFECTDESC*
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwReserved : UInt32, @lpwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, @dwFXCount : UInt32, @lpDSCFXDesc : Win32cr::Media::Audio::DirectSound::DSCEFFECTDESC*)
    end
  end

  @[Extern]
  struct DSCBCAPS
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwBufferBytes : UInt32
    property dwReserved : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwBufferBytes : UInt32, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct DSBPOSITIONNOTIFY
    property dwOffset : UInt32
    property hEventNotify : Win32cr::Foundation::HANDLE
    def initialize(@dwOffset : UInt32, @hEventNotify : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct DSFXGargle
    property dwRateHz : UInt32
    property dwWaveShape : UInt32
    def initialize(@dwRateHz : UInt32, @dwWaveShape : UInt32)
    end
  end

  @[Extern]
  struct DSFXChorus
    property fWetDryMix : Float32
    property fDepth : Float32
    property fFeedback : Float32
    property fFrequency : Float32
    property lWaveform : Int32
    property fDelay : Float32
    property lPhase : Int32
    def initialize(@fWetDryMix : Float32, @fDepth : Float32, @fFeedback : Float32, @fFrequency : Float32, @lWaveform : Int32, @fDelay : Float32, @lPhase : Int32)
    end
  end

  @[Extern]
  struct DSFXFlanger
    property fWetDryMix : Float32
    property fDepth : Float32
    property fFeedback : Float32
    property fFrequency : Float32
    property lWaveform : Int32
    property fDelay : Float32
    property lPhase : Int32
    def initialize(@fWetDryMix : Float32, @fDepth : Float32, @fFeedback : Float32, @fFrequency : Float32, @lWaveform : Int32, @fDelay : Float32, @lPhase : Int32)
    end
  end

  @[Extern]
  struct DSFXEcho
    property fWetDryMix : Float32
    property fFeedback : Float32
    property fLeftDelay : Float32
    property fRightDelay : Float32
    property lPanDelay : Int32
    def initialize(@fWetDryMix : Float32, @fFeedback : Float32, @fLeftDelay : Float32, @fRightDelay : Float32, @lPanDelay : Int32)
    end
  end

  @[Extern]
  struct DSFXDistortion
    property fGain : Float32
    property fEdge : Float32
    property fPostEQCenterFrequency : Float32
    property fPostEQBandwidth : Float32
    property fPreLowpassCutoff : Float32
    def initialize(@fGain : Float32, @fEdge : Float32, @fPostEQCenterFrequency : Float32, @fPostEQBandwidth : Float32, @fPreLowpassCutoff : Float32)
    end
  end

  @[Extern]
  struct DSFXCompressor
    property fGain : Float32
    property fAttack : Float32
    property fRelease : Float32
    property fThreshold : Float32
    property fRatio : Float32
    property fPredelay : Float32
    def initialize(@fGain : Float32, @fAttack : Float32, @fRelease : Float32, @fThreshold : Float32, @fRatio : Float32, @fPredelay : Float32)
    end
  end

  @[Extern]
  struct DSFXParamEq
    property fCenter : Float32
    property fBandwidth : Float32
    property fGain : Float32
    def initialize(@fCenter : Float32, @fBandwidth : Float32, @fGain : Float32)
    end
  end

  @[Extern]
  struct DSFXI3DL2Reverb
    property lRoom : Int32
    property lRoomHF : Int32
    property flRoomRolloffFactor : Float32
    property flDecayTime : Float32
    property flDecayHFRatio : Float32
    property lReflections : Int32
    property flReflectionsDelay : Float32
    property lReverb : Int32
    property flReverbDelay : Float32
    property flDiffusion : Float32
    property flDensity : Float32
    property flHFReference : Float32
    def initialize(@lRoom : Int32, @lRoomHF : Int32, @flRoomRolloffFactor : Float32, @flDecayTime : Float32, @flDecayHFRatio : Float32, @lReflections : Int32, @flReflectionsDelay : Float32, @lReverb : Int32, @flReverbDelay : Float32, @flDiffusion : Float32, @flDensity : Float32, @flHFReference : Float32)
    end
  end

  @[Extern]
  struct DSFXWavesReverb
    property fInGain : Float32
    property fReverbMix : Float32
    property fReverbTime : Float32
    property fHighFreqRTRatio : Float32
    def initialize(@fInGain : Float32, @fReverbMix : Float32, @fReverbTime : Float32, @fHighFreqRTRatio : Float32)
    end
  end

  @[Extern]
  struct DSCFXAec
    property fEnable : Win32cr::Foundation::BOOL
    property fNoiseFill : Win32cr::Foundation::BOOL
    property dwMode : UInt32
    def initialize(@fEnable : Win32cr::Foundation::BOOL, @fNoiseFill : Win32cr::Foundation::BOOL, @dwMode : UInt32)
    end
  end

  @[Extern]
  struct DSCFXNoiseSuppress
    property fEnable : Win32cr::Foundation::BOOL
    def initialize(@fEnable : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  record IDirectSoundVtbl,
    query_interface : Proc(IDirectSound*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSound*, UInt32),
    release : Proc(IDirectSound*, UInt32),
    create_sound_buffer : Proc(IDirectSound*, Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_caps : Proc(IDirectSound*, Win32cr::Media::Audio::DirectSound::DSCAPS*, Win32cr::Foundation::HRESULT),
    duplicate_sound_buffer : Proc(IDirectSound*, Void*, Void**, Win32cr::Foundation::HRESULT),
    set_cooperative_level : Proc(IDirectSound*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    compact : Proc(IDirectSound*, Win32cr::Foundation::HRESULT),
    get_speaker_config : Proc(IDirectSound*, UInt32*, Win32cr::Foundation::HRESULT),
    set_speaker_config : Proc(IDirectSound*, UInt32, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSound*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSound, lpVtbl : IDirectSoundVtbl* do
    GUID = LibC::GUID.new(0x279afa83_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
    def query_interface(this : IDirectSound*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSound*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSound*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_sound_buffer(this : IDirectSound*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, ppDSBuffer : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sound_buffer.call(this, pcDSBufferDesc, ppDSBuffer, pUnkOuter)
    end
    def get_caps(this : IDirectSound*, pDSCaps : Win32cr::Media::Audio::DirectSound::DSCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSCaps)
    end
    def duplicate_sound_buffer(this : IDirectSound*, pDSBufferOriginal : Void*, ppDSBufferDuplicate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_sound_buffer.call(this, pDSBufferOriginal, ppDSBufferDuplicate)
    end
    def set_cooperative_level(this : IDirectSound*, hwnd : Win32cr::Foundation::HWND, dwLevel : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cooperative_level.call(this, hwnd, dwLevel)
    end
    def compact(this : IDirectSound*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compact.call(this)
    end
    def get_speaker_config(this : IDirectSound*, pdwSpeakerConfig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_speaker_config.call(this, pdwSpeakerConfig)
    end
    def set_speaker_config(this : IDirectSound*, dwSpeakerConfig : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_speaker_config.call(this, dwSpeakerConfig)
    end
    def initialize__(this : IDirectSound*, pcGuidDevice : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pcGuidDevice)
    end

  end

  @[Extern]
  record IDirectSound8Vtbl,
    query_interface : Proc(IDirectSound8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSound8*, UInt32),
    release : Proc(IDirectSound8*, UInt32),
    create_sound_buffer : Proc(IDirectSound8*, Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_caps : Proc(IDirectSound8*, Win32cr::Media::Audio::DirectSound::DSCAPS*, Win32cr::Foundation::HRESULT),
    duplicate_sound_buffer : Proc(IDirectSound8*, Void*, Void**, Win32cr::Foundation::HRESULT),
    set_cooperative_level : Proc(IDirectSound8*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    compact : Proc(IDirectSound8*, Win32cr::Foundation::HRESULT),
    get_speaker_config : Proc(IDirectSound8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_speaker_config : Proc(IDirectSound8*, UInt32, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSound8*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    verify_certification : Proc(IDirectSound8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSound8, lpVtbl : IDirectSound8Vtbl* do
    GUID = LibC::GUID.new(0xc50a7e93_u32, 0xf395_u16, 0x4834_u16, StaticArray[0x9e_u8, 0xf6_u8, 0x7f_u8, 0xa9_u8, 0x9d_u8, 0xe5_u8, 0x9_u8, 0x66_u8])
    def query_interface(this : IDirectSound8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSound8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSound8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_sound_buffer(this : IDirectSound8*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, ppDSBuffer : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sound_buffer.call(this, pcDSBufferDesc, ppDSBuffer, pUnkOuter)
    end
    def get_caps(this : IDirectSound8*, pDSCaps : Win32cr::Media::Audio::DirectSound::DSCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSCaps)
    end
    def duplicate_sound_buffer(this : IDirectSound8*, pDSBufferOriginal : Void*, ppDSBufferDuplicate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_sound_buffer.call(this, pDSBufferOriginal, ppDSBufferDuplicate)
    end
    def set_cooperative_level(this : IDirectSound8*, hwnd : Win32cr::Foundation::HWND, dwLevel : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cooperative_level.call(this, hwnd, dwLevel)
    end
    def compact(this : IDirectSound8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compact.call(this)
    end
    def get_speaker_config(this : IDirectSound8*, pdwSpeakerConfig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_speaker_config.call(this, pdwSpeakerConfig)
    end
    def set_speaker_config(this : IDirectSound8*, dwSpeakerConfig : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_speaker_config.call(this, dwSpeakerConfig)
    end
    def initialize__(this : IDirectSound8*, pcGuidDevice : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pcGuidDevice)
    end
    def verify_certification(this : IDirectSound8*, pdwCertified : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.verify_certification.call(this, pdwCertified)
    end

  end

  @[Extern]
  record IDirectSoundBufferVtbl,
    query_interface : Proc(IDirectSoundBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundBuffer*, UInt32),
    release : Proc(IDirectSoundBuffer*, UInt32),
    get_caps : Proc(IDirectSoundBuffer*, Win32cr::Media::Audio::DirectSound::DSBCAPS*, Win32cr::Foundation::HRESULT),
    get_current_position : Proc(IDirectSoundBuffer*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectSoundBuffer*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IDirectSoundBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_pan : Proc(IDirectSoundBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_frequency : Proc(IDirectSoundBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectSoundBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSoundBuffer*, Void*, Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, Win32cr::Foundation::HRESULT),
    lock : Proc(IDirectSoundBuffer*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    play : Proc(IDirectSoundBuffer*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_current_position : Proc(IDirectSoundBuffer*, UInt32, Win32cr::Foundation::HRESULT),
    set_format : Proc(IDirectSoundBuffer*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_volume : Proc(IDirectSoundBuffer*, Int32, Win32cr::Foundation::HRESULT),
    set_pan : Proc(IDirectSoundBuffer*, Int32, Win32cr::Foundation::HRESULT),
    set_frequency : Proc(IDirectSoundBuffer*, UInt32, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectSoundBuffer*, Win32cr::Foundation::HRESULT),
    unlock : Proc(IDirectSoundBuffer*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    restore : Proc(IDirectSoundBuffer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundBuffer, lpVtbl : IDirectSoundBufferVtbl* do
    GUID = LibC::GUID.new(0x279afa85_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
    def query_interface(this : IDirectSoundBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_caps(this : IDirectSoundBuffer*, pDSBufferCaps : Win32cr::Media::Audio::DirectSound::DSBCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSBufferCaps)
    end
    def get_current_position(this : IDirectSoundBuffer*, pdwCurrentPlayCursor : UInt32*, pdwCurrentWriteCursor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_position.call(this, pdwCurrentPlayCursor, pdwCurrentWriteCursor)
    end
    def get_format(this : IDirectSoundBuffer*, pwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, dwSizeAllocated : UInt32, pdwSizeWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pwfxFormat, dwSizeAllocated, pdwSizeWritten)
    end
    def get_volume(this : IDirectSoundBuffer*, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume.call(this, plVolume)
    end
    def get_pan(this : IDirectSoundBuffer*, plPan : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pan.call(this, plPan)
    end
    def get_frequency(this : IDirectSoundBuffer*, pdwFrequency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frequency.call(this, pdwFrequency)
    end
    def get_status(this : IDirectSoundBuffer*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IDirectSoundBuffer*, pDirectSound : Void*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pDirectSound, pcDSBufferDesc)
    end
    def lock(this : IDirectSoundBuffer*, dwOffset : UInt32, dwBytes : UInt32, ppvAudioPtr1 : Void**, pdwAudioBytes1 : UInt32*, ppvAudioPtr2 : Void**, pdwAudioBytes2 : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags)
    end
    def play(this : IDirectSoundBuffer*, dwReserved1 : UInt32, dwPriority : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play.call(this, dwReserved1, dwPriority, dwFlags)
    end
    def set_current_position(this : IDirectSoundBuffer*, dwNewPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_position.call(this, dwNewPosition)
    end
    def set_format(this : IDirectSoundBuffer*, pcfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, pcfxFormat)
    end
    def set_volume(this : IDirectSoundBuffer*, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, lVolume)
    end
    def set_pan(this : IDirectSoundBuffer*, lPan : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pan.call(this, lPan)
    end
    def set_frequency(this : IDirectSoundBuffer*, dwFrequency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frequency.call(this, dwFrequency)
    end
    def stop(this : IDirectSoundBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def unlock(this : IDirectSoundBuffer*, pvAudioPtr1 : Void*, dwAudioBytes1 : UInt32, pvAudioPtr2 : Void*, dwAudioBytes2 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock.call(this, pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2)
    end
    def restore(this : IDirectSoundBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this)
    end

  end

  @[Extern]
  record IDirectSoundBuffer8Vtbl,
    query_interface : Proc(IDirectSoundBuffer8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundBuffer8*, UInt32),
    release : Proc(IDirectSoundBuffer8*, UInt32),
    get_caps : Proc(IDirectSoundBuffer8*, Win32cr::Media::Audio::DirectSound::DSBCAPS*, Win32cr::Foundation::HRESULT),
    get_current_position : Proc(IDirectSoundBuffer8*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectSoundBuffer8*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_volume : Proc(IDirectSoundBuffer8*, Int32*, Win32cr::Foundation::HRESULT),
    get_pan : Proc(IDirectSoundBuffer8*, Int32*, Win32cr::Foundation::HRESULT),
    get_frequency : Proc(IDirectSoundBuffer8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectSoundBuffer8*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSoundBuffer8*, Void*, Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, Win32cr::Foundation::HRESULT),
    lock : Proc(IDirectSoundBuffer8*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    play : Proc(IDirectSoundBuffer8*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_current_position : Proc(IDirectSoundBuffer8*, UInt32, Win32cr::Foundation::HRESULT),
    set_format : Proc(IDirectSoundBuffer8*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_volume : Proc(IDirectSoundBuffer8*, Int32, Win32cr::Foundation::HRESULT),
    set_pan : Proc(IDirectSoundBuffer8*, Int32, Win32cr::Foundation::HRESULT),
    set_frequency : Proc(IDirectSoundBuffer8*, UInt32, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectSoundBuffer8*, Win32cr::Foundation::HRESULT),
    unlock : Proc(IDirectSoundBuffer8*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    restore : Proc(IDirectSoundBuffer8*, Win32cr::Foundation::HRESULT),
    set_fx : Proc(IDirectSoundBuffer8*, UInt32, Win32cr::Media::Audio::DirectSound::DSEFFECTDESC*, UInt32*, Win32cr::Foundation::HRESULT),
    acquire_resources : Proc(IDirectSoundBuffer8*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_object_in_path : Proc(IDirectSoundBuffer8*, LibC::GUID*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundBuffer8, lpVtbl : IDirectSoundBuffer8Vtbl* do
    GUID = LibC::GUID.new(0x6825a449_u32, 0x7524_u16, 0x4d82_u16, StaticArray[0x92_u8, 0xf_u8, 0x50_u8, 0xe3_u8, 0x6a_u8, 0xb3_u8, 0xab_u8, 0x1e_u8])
    def query_interface(this : IDirectSoundBuffer8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundBuffer8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundBuffer8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_caps(this : IDirectSoundBuffer8*, pDSBufferCaps : Win32cr::Media::Audio::DirectSound::DSBCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSBufferCaps)
    end
    def get_current_position(this : IDirectSoundBuffer8*, pdwCurrentPlayCursor : UInt32*, pdwCurrentWriteCursor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_position.call(this, pdwCurrentPlayCursor, pdwCurrentWriteCursor)
    end
    def get_format(this : IDirectSoundBuffer8*, pwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, dwSizeAllocated : UInt32, pdwSizeWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pwfxFormat, dwSizeAllocated, pdwSizeWritten)
    end
    def get_volume(this : IDirectSoundBuffer8*, plVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume.call(this, plVolume)
    end
    def get_pan(this : IDirectSoundBuffer8*, plPan : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pan.call(this, plPan)
    end
    def get_frequency(this : IDirectSoundBuffer8*, pdwFrequency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frequency.call(this, pdwFrequency)
    end
    def get_status(this : IDirectSoundBuffer8*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IDirectSoundBuffer8*, pDirectSound : Void*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pDirectSound, pcDSBufferDesc)
    end
    def lock(this : IDirectSoundBuffer8*, dwOffset : UInt32, dwBytes : UInt32, ppvAudioPtr1 : Void**, pdwAudioBytes1 : UInt32*, ppvAudioPtr2 : Void**, pdwAudioBytes2 : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags)
    end
    def play(this : IDirectSoundBuffer8*, dwReserved1 : UInt32, dwPriority : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play.call(this, dwReserved1, dwPriority, dwFlags)
    end
    def set_current_position(this : IDirectSoundBuffer8*, dwNewPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_position.call(this, dwNewPosition)
    end
    def set_format(this : IDirectSoundBuffer8*, pcfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, pcfxFormat)
    end
    def set_volume(this : IDirectSoundBuffer8*, lVolume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, lVolume)
    end
    def set_pan(this : IDirectSoundBuffer8*, lPan : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pan.call(this, lPan)
    end
    def set_frequency(this : IDirectSoundBuffer8*, dwFrequency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frequency.call(this, dwFrequency)
    end
    def stop(this : IDirectSoundBuffer8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def unlock(this : IDirectSoundBuffer8*, pvAudioPtr1 : Void*, dwAudioBytes1 : UInt32, pvAudioPtr2 : Void*, dwAudioBytes2 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock.call(this, pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2)
    end
    def restore(this : IDirectSoundBuffer8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this)
    end
    def set_fx(this : IDirectSoundBuffer8*, dwEffectsCount : UInt32, pDSFXDesc : Win32cr::Media::Audio::DirectSound::DSEFFECTDESC*, pdwResultCodes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fx.call(this, dwEffectsCount, pDSFXDesc, pdwResultCodes)
    end
    def acquire_resources(this : IDirectSoundBuffer8*, dwFlags : UInt32, dwEffectsCount : UInt32, pdwResultCodes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_resources.call(this, dwFlags, dwEffectsCount, pdwResultCodes)
    end
    def get_object_in_path(this : IDirectSoundBuffer8*, rguidObject : LibC::GUID*, dwIndex : UInt32, rguidInterface : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_in_path.call(this, rguidObject, dwIndex, rguidInterface, ppObject)
    end

  end

  @[Extern]
  record IDirectSound3DListenerVtbl,
    query_interface : Proc(IDirectSound3DListener*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSound3DListener*, UInt32),
    release : Proc(IDirectSound3DListener*, UInt32),
    get_all_parameters : Proc(IDirectSound3DListener*, Win32cr::Media::Audio::DirectSound::DS3DLISTENER*, Win32cr::Foundation::HRESULT),
    get_distance_factor : Proc(IDirectSound3DListener*, Float32*, Win32cr::Foundation::HRESULT),
    get_doppler_factor : Proc(IDirectSound3DListener*, Float32*, Win32cr::Foundation::HRESULT),
    get_orientation : Proc(IDirectSound3DListener*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    get_position : Proc(IDirectSound3DListener*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    get_rolloff_factor : Proc(IDirectSound3DListener*, Float32*, Win32cr::Foundation::HRESULT),
    get_velocity : Proc(IDirectSound3DListener*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    set_all_parameters : Proc(IDirectSound3DListener*, Win32cr::Media::Audio::DirectSound::DS3DLISTENER*, UInt32, Win32cr::Foundation::HRESULT),
    set_distance_factor : Proc(IDirectSound3DListener*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_doppler_factor : Proc(IDirectSound3DListener*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_orientation : Proc(IDirectSound3DListener*, Float32, Float32, Float32, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_position : Proc(IDirectSound3DListener*, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_rolloff_factor : Proc(IDirectSound3DListener*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_velocity : Proc(IDirectSound3DListener*, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    commit_deferred_settings : Proc(IDirectSound3DListener*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSound3DListener, lpVtbl : IDirectSound3DListenerVtbl* do
    GUID = LibC::GUID.new(0x279afa84_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
    def query_interface(this : IDirectSound3DListener*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSound3DListener*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSound3DListener*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_all_parameters(this : IDirectSound3DListener*, pListener : Win32cr::Media::Audio::DirectSound::DS3DLISTENER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pListener)
    end
    def get_distance_factor(this : IDirectSound3DListener*, pflDistanceFactor : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_distance_factor.call(this, pflDistanceFactor)
    end
    def get_doppler_factor(this : IDirectSound3DListener*, pflDopplerFactor : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_doppler_factor.call(this, pflDopplerFactor)
    end
    def get_orientation(this : IDirectSound3DListener*, pvOrientFront : Win32cr::Graphics::Direct3D::D3DVECTOR*, pvOrientTop : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_orientation.call(this, pvOrientFront, pvOrientTop)
    end
    def get_position(this : IDirectSound3DListener*, pvPosition : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position.call(this, pvPosition)
    end
    def get_rolloff_factor(this : IDirectSound3DListener*, pflRolloffFactor : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rolloff_factor.call(this, pflRolloffFactor)
    end
    def get_velocity(this : IDirectSound3DListener*, pvVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_velocity.call(this, pvVelocity)
    end
    def set_all_parameters(this : IDirectSound3DListener*, pcListener : Win32cr::Media::Audio::DirectSound::DS3DLISTENER*, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcListener, dwApply)
    end
    def set_distance_factor(this : IDirectSound3DListener*, flDistanceFactor : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_distance_factor.call(this, flDistanceFactor, dwApply)
    end
    def set_doppler_factor(this : IDirectSound3DListener*, flDopplerFactor : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_doppler_factor.call(this, flDopplerFactor, dwApply)
    end
    def set_orientation(this : IDirectSound3DListener*, xFront : Float32, yFront : Float32, zFront : Float32, xTop : Float32, yTop : Float32, zTop : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_orientation.call(this, xFront, yFront, zFront, xTop, yTop, zTop, dwApply)
    end
    def set_position(this : IDirectSound3DListener*, x : Float32, y : Float32, z : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position.call(this, x, y, z, dwApply)
    end
    def set_rolloff_factor(this : IDirectSound3DListener*, flRolloffFactor : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rolloff_factor.call(this, flRolloffFactor, dwApply)
    end
    def set_velocity(this : IDirectSound3DListener*, x : Float32, y : Float32, z : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_velocity.call(this, x, y, z, dwApply)
    end
    def commit_deferred_settings(this : IDirectSound3DListener*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_deferred_settings.call(this)
    end

  end

  @[Extern]
  record IDirectSound3DBufferVtbl,
    query_interface : Proc(IDirectSound3DBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSound3DBuffer*, UInt32),
    release : Proc(IDirectSound3DBuffer*, UInt32),
    get_all_parameters : Proc(IDirectSound3DBuffer*, Win32cr::Media::Audio::DirectSound::DS3DBUFFER*, Win32cr::Foundation::HRESULT),
    get_cone_angles : Proc(IDirectSound3DBuffer*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cone_orientation : Proc(IDirectSound3DBuffer*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    get_cone_outside_volume : Proc(IDirectSound3DBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_max_distance : Proc(IDirectSound3DBuffer*, Float32*, Win32cr::Foundation::HRESULT),
    get_min_distance : Proc(IDirectSound3DBuffer*, Float32*, Win32cr::Foundation::HRESULT),
    get_mode : Proc(IDirectSound3DBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_position : Proc(IDirectSound3DBuffer*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    get_velocity : Proc(IDirectSound3DBuffer*, Win32cr::Graphics::Direct3D::D3DVECTOR*, Win32cr::Foundation::HRESULT),
    set_all_parameters : Proc(IDirectSound3DBuffer*, Win32cr::Media::Audio::DirectSound::DS3DBUFFER*, UInt32, Win32cr::Foundation::HRESULT),
    set_cone_angles : Proc(IDirectSound3DBuffer*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_cone_orientation : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_cone_outside_volume : Proc(IDirectSound3DBuffer*, Int32, UInt32, Win32cr::Foundation::HRESULT),
    set_max_distance : Proc(IDirectSound3DBuffer*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_min_distance : Proc(IDirectSound3DBuffer*, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_mode : Proc(IDirectSound3DBuffer*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_position : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    set_velocity : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSound3DBuffer, lpVtbl : IDirectSound3DBufferVtbl* do
    GUID = LibC::GUID.new(0x279afa86_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
    def query_interface(this : IDirectSound3DBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSound3DBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSound3DBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_all_parameters(this : IDirectSound3DBuffer*, pDs3dBuffer : Win32cr::Media::Audio::DirectSound::DS3DBUFFER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDs3dBuffer)
    end
    def get_cone_angles(this : IDirectSound3DBuffer*, pdwInsideConeAngle : UInt32*, pdwOutsideConeAngle : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cone_angles.call(this, pdwInsideConeAngle, pdwOutsideConeAngle)
    end
    def get_cone_orientation(this : IDirectSound3DBuffer*, pvOrientation : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cone_orientation.call(this, pvOrientation)
    end
    def get_cone_outside_volume(this : IDirectSound3DBuffer*, plConeOutsideVolume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cone_outside_volume.call(this, plConeOutsideVolume)
    end
    def get_max_distance(this : IDirectSound3DBuffer*, pflMaxDistance : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_distance.call(this, pflMaxDistance)
    end
    def get_min_distance(this : IDirectSound3DBuffer*, pflMinDistance : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_distance.call(this, pflMinDistance)
    end
    def get_mode(this : IDirectSound3DBuffer*, pdwMode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mode.call(this, pdwMode)
    end
    def get_position(this : IDirectSound3DBuffer*, pvPosition : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position.call(this, pvPosition)
    end
    def get_velocity(this : IDirectSound3DBuffer*, pvVelocity : Win32cr::Graphics::Direct3D::D3DVECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_velocity.call(this, pvVelocity)
    end
    def set_all_parameters(this : IDirectSound3DBuffer*, pcDs3dBuffer : Win32cr::Media::Audio::DirectSound::DS3DBUFFER*, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDs3dBuffer, dwApply)
    end
    def set_cone_angles(this : IDirectSound3DBuffer*, dwInsideConeAngle : UInt32, dwOutsideConeAngle : UInt32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cone_angles.call(this, dwInsideConeAngle, dwOutsideConeAngle, dwApply)
    end
    def set_cone_orientation(this : IDirectSound3DBuffer*, x : Float32, y : Float32, z : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cone_orientation.call(this, x, y, z, dwApply)
    end
    def set_cone_outside_volume(this : IDirectSound3DBuffer*, lConeOutsideVolume : Int32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cone_outside_volume.call(this, lConeOutsideVolume, dwApply)
    end
    def set_max_distance(this : IDirectSound3DBuffer*, flMaxDistance : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_distance.call(this, flMaxDistance, dwApply)
    end
    def set_min_distance(this : IDirectSound3DBuffer*, flMinDistance : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_distance.call(this, flMinDistance, dwApply)
    end
    def set_mode(this : IDirectSound3DBuffer*, dwMode : UInt32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mode.call(this, dwMode, dwApply)
    end
    def set_position(this : IDirectSound3DBuffer*, x : Float32, y : Float32, z : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position.call(this, x, y, z, dwApply)
    end
    def set_velocity(this : IDirectSound3DBuffer*, x : Float32, y : Float32, z : Float32, dwApply : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_velocity.call(this, x, y, z, dwApply)
    end

  end

  @[Extern]
  record IDirectSoundCaptureVtbl,
    query_interface : Proc(IDirectSoundCapture*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundCapture*, UInt32),
    release : Proc(IDirectSoundCapture*, UInt32),
    create_capture_buffer : Proc(IDirectSoundCapture*, Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_caps : Proc(IDirectSoundCapture*, Win32cr::Media::Audio::DirectSound::DSCCAPS*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSoundCapture*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundCapture, lpVtbl : IDirectSoundCaptureVtbl* do
    GUID = LibC::GUID.new(0xb0210781_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
    def query_interface(this : IDirectSoundCapture*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundCapture*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundCapture*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_capture_buffer(this : IDirectSoundCapture*, pcDSCBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, ppDSCBuffer : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_capture_buffer.call(this, pcDSCBufferDesc, ppDSCBuffer, pUnkOuter)
    end
    def get_caps(this : IDirectSoundCapture*, pDSCCaps : Win32cr::Media::Audio::DirectSound::DSCCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSCCaps)
    end
    def initialize__(this : IDirectSoundCapture*, pcGuidDevice : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pcGuidDevice)
    end

  end

  @[Extern]
  record IDirectSoundCaptureBufferVtbl,
    query_interface : Proc(IDirectSoundCaptureBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundCaptureBuffer*, UInt32),
    release : Proc(IDirectSoundCaptureBuffer*, UInt32),
    get_caps : Proc(IDirectSoundCaptureBuffer*, Win32cr::Media::Audio::DirectSound::DSCBCAPS*, Win32cr::Foundation::HRESULT),
    get_current_position : Proc(IDirectSoundCaptureBuffer*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectSoundCaptureBuffer*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectSoundCaptureBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSoundCaptureBuffer*, Void*, Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, Win32cr::Foundation::HRESULT),
    lock : Proc(IDirectSoundCaptureBuffer*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    start : Proc(IDirectSoundCaptureBuffer*, UInt32, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectSoundCaptureBuffer*, Win32cr::Foundation::HRESULT),
    unlock : Proc(IDirectSoundCaptureBuffer*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundCaptureBuffer, lpVtbl : IDirectSoundCaptureBufferVtbl* do
    GUID = LibC::GUID.new(0xb0210782_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
    def query_interface(this : IDirectSoundCaptureBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundCaptureBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundCaptureBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_caps(this : IDirectSoundCaptureBuffer*, pDSCBCaps : Win32cr::Media::Audio::DirectSound::DSCBCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSCBCaps)
    end
    def get_current_position(this : IDirectSoundCaptureBuffer*, pdwCapturePosition : UInt32*, pdwReadPosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_position.call(this, pdwCapturePosition, pdwReadPosition)
    end
    def get_format(this : IDirectSoundCaptureBuffer*, pwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, dwSizeAllocated : UInt32, pdwSizeWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pwfxFormat, dwSizeAllocated, pdwSizeWritten)
    end
    def get_status(this : IDirectSoundCaptureBuffer*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IDirectSoundCaptureBuffer*, pDirectSoundCapture : Void*, pcDSCBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pDirectSoundCapture, pcDSCBufferDesc)
    end
    def lock(this : IDirectSoundCaptureBuffer*, dwOffset : UInt32, dwBytes : UInt32, ppvAudioPtr1 : Void**, pdwAudioBytes1 : UInt32*, ppvAudioPtr2 : Void**, pdwAudioBytes2 : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags)
    end
    def start(this : IDirectSoundCaptureBuffer*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, dwFlags)
    end
    def stop(this : IDirectSoundCaptureBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def unlock(this : IDirectSoundCaptureBuffer*, pvAudioPtr1 : Void*, dwAudioBytes1 : UInt32, pvAudioPtr2 : Void*, dwAudioBytes2 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock.call(this, pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2)
    end

  end

  @[Extern]
  record IDirectSoundCaptureBuffer8Vtbl,
    query_interface : Proc(IDirectSoundCaptureBuffer8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundCaptureBuffer8*, UInt32),
    release : Proc(IDirectSoundCaptureBuffer8*, UInt32),
    get_caps : Proc(IDirectSoundCaptureBuffer8*, Win32cr::Media::Audio::DirectSound::DSCBCAPS*, Win32cr::Foundation::HRESULT),
    get_current_position : Proc(IDirectSoundCaptureBuffer8*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IDirectSoundCaptureBuffer8*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectSoundCaptureBuffer8*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IDirectSoundCaptureBuffer8*, Void*, Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, Win32cr::Foundation::HRESULT),
    lock : Proc(IDirectSoundCaptureBuffer8*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    start : Proc(IDirectSoundCaptureBuffer8*, UInt32, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectSoundCaptureBuffer8*, Win32cr::Foundation::HRESULT),
    unlock : Proc(IDirectSoundCaptureBuffer8*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_object_in_path : Proc(IDirectSoundCaptureBuffer8*, LibC::GUID*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_fx_status : Proc(IDirectSoundCaptureBuffer8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundCaptureBuffer8, lpVtbl : IDirectSoundCaptureBuffer8Vtbl* do
    GUID = LibC::GUID.new(0x990df4_u32, 0xdbb_u16, 0x4872_u16, StaticArray[0x83_u8, 0x3e_u8, 0x6d_u8, 0x30_u8, 0x3e_u8, 0x80_u8, 0xae_u8, 0xb6_u8])
    def query_interface(this : IDirectSoundCaptureBuffer8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundCaptureBuffer8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundCaptureBuffer8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_caps(this : IDirectSoundCaptureBuffer8*, pDSCBCaps : Win32cr::Media::Audio::DirectSound::DSCBCAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caps.call(this, pDSCBCaps)
    end
    def get_current_position(this : IDirectSoundCaptureBuffer8*, pdwCapturePosition : UInt32*, pdwReadPosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_position.call(this, pdwCapturePosition, pdwReadPosition)
    end
    def get_format(this : IDirectSoundCaptureBuffer8*, pwfxFormat : Win32cr::Media::Audio::WAVEFORMATEX*, dwSizeAllocated : UInt32, pdwSizeWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pwfxFormat, dwSizeAllocated, pdwSizeWritten)
    end
    def get_status(this : IDirectSoundCaptureBuffer8*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IDirectSoundCaptureBuffer8*, pDirectSoundCapture : Void*, pcDSCBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pDirectSoundCapture, pcDSCBufferDesc)
    end
    def lock(this : IDirectSoundCaptureBuffer8*, dwOffset : UInt32, dwBytes : UInt32, ppvAudioPtr1 : Void**, pdwAudioBytes1 : UInt32*, ppvAudioPtr2 : Void**, pdwAudioBytes2 : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags)
    end
    def start(this : IDirectSoundCaptureBuffer8*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, dwFlags)
    end
    def stop(this : IDirectSoundCaptureBuffer8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def unlock(this : IDirectSoundCaptureBuffer8*, pvAudioPtr1 : Void*, dwAudioBytes1 : UInt32, pvAudioPtr2 : Void*, dwAudioBytes2 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock.call(this, pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2)
    end
    def get_object_in_path(this : IDirectSoundCaptureBuffer8*, rguidObject : LibC::GUID*, dwIndex : UInt32, rguidInterface : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_in_path.call(this, rguidObject, dwIndex, rguidInterface, ppObject)
    end
    def get_fx_status(this : IDirectSoundCaptureBuffer8*, dwEffectsCount : UInt32, pdwFXStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fx_status.call(this, dwEffectsCount, pdwFXStatus)
    end

  end

  @[Extern]
  record IDirectSoundNotifyVtbl,
    query_interface : Proc(IDirectSoundNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundNotify*, UInt32),
    release : Proc(IDirectSoundNotify*, UInt32),
    set_notification_positions : Proc(IDirectSoundNotify*, UInt32, Win32cr::Media::Audio::DirectSound::DSBPOSITIONNOTIFY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundNotify, lpVtbl : IDirectSoundNotifyVtbl* do
    GUID = LibC::GUID.new(0xb0210783_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
    def query_interface(this : IDirectSoundNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notification_positions(this : IDirectSoundNotify*, dwPositionNotifies : UInt32, pcPositionNotifies : Win32cr::Media::Audio::DirectSound::DSBPOSITIONNOTIFY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_positions.call(this, dwPositionNotifies, pcPositionNotifies)
    end

  end

  @[Extern]
  record IDirectSoundFXGargleVtbl,
    query_interface : Proc(IDirectSoundFXGargle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXGargle*, UInt32),
    release : Proc(IDirectSoundFXGargle*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXGargle*, Win32cr::Media::Audio::DirectSound::DSFXGargle*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXGargle*, Win32cr::Media::Audio::DirectSound::DSFXGargle*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXGargle, lpVtbl : IDirectSoundFXGargleVtbl* do
    GUID = LibC::GUID.new(0xd616f352_u32, 0xd622_u16, 0x11ce_u16, StaticArray[0xaa_u8, 0xc5_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0x99_u8, 0xa3_u8])
    def query_interface(this : IDirectSoundFXGargle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXGargle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXGargle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXGargle*, pcDsFxGargle : Win32cr::Media::Audio::DirectSound::DSFXGargle*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxGargle)
    end
    def get_all_parameters(this : IDirectSoundFXGargle*, pDsFxGargle : Win32cr::Media::Audio::DirectSound::DSFXGargle*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxGargle)
    end

  end

  @[Extern]
  record IDirectSoundFXChorusVtbl,
    query_interface : Proc(IDirectSoundFXChorus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXChorus*, UInt32),
    release : Proc(IDirectSoundFXChorus*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXChorus*, Win32cr::Media::Audio::DirectSound::DSFXChorus*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXChorus*, Win32cr::Media::Audio::DirectSound::DSFXChorus*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXChorus, lpVtbl : IDirectSoundFXChorusVtbl* do
    GUID = LibC::GUID.new(0x880842e3_u32, 0x145f_u16, 0x43e6_u16, StaticArray[0xa9_u8, 0x34_u8, 0xa7_u8, 0x18_u8, 0x6_u8, 0xe5_u8, 0x5_u8, 0x47_u8])
    def query_interface(this : IDirectSoundFXChorus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXChorus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXChorus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXChorus*, pcDsFxChorus : Win32cr::Media::Audio::DirectSound::DSFXChorus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxChorus)
    end
    def get_all_parameters(this : IDirectSoundFXChorus*, pDsFxChorus : Win32cr::Media::Audio::DirectSound::DSFXChorus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxChorus)
    end

  end

  @[Extern]
  record IDirectSoundFXFlangerVtbl,
    query_interface : Proc(IDirectSoundFXFlanger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXFlanger*, UInt32),
    release : Proc(IDirectSoundFXFlanger*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXFlanger*, Win32cr::Media::Audio::DirectSound::DSFXFlanger*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXFlanger*, Win32cr::Media::Audio::DirectSound::DSFXFlanger*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXFlanger, lpVtbl : IDirectSoundFXFlangerVtbl* do
    GUID = LibC::GUID.new(0x903e9878_u32, 0x2c92_u16, 0x4072_u16, StaticArray[0x9b_u8, 0x2c_u8, 0xea_u8, 0x68_u8, 0xf5_u8, 0x39_u8, 0x67_u8, 0x83_u8])
    def query_interface(this : IDirectSoundFXFlanger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXFlanger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXFlanger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXFlanger*, pcDsFxFlanger : Win32cr::Media::Audio::DirectSound::DSFXFlanger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxFlanger)
    end
    def get_all_parameters(this : IDirectSoundFXFlanger*, pDsFxFlanger : Win32cr::Media::Audio::DirectSound::DSFXFlanger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxFlanger)
    end

  end

  @[Extern]
  record IDirectSoundFXEchoVtbl,
    query_interface : Proc(IDirectSoundFXEcho*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXEcho*, UInt32),
    release : Proc(IDirectSoundFXEcho*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXEcho*, Win32cr::Media::Audio::DirectSound::DSFXEcho*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXEcho*, Win32cr::Media::Audio::DirectSound::DSFXEcho*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXEcho, lpVtbl : IDirectSoundFXEchoVtbl* do
    GUID = LibC::GUID.new(0x8bd28edf_u32, 0x50db_u16, 0x4e92_u16, StaticArray[0xa2_u8, 0xbd_u8, 0x44_u8, 0x54_u8, 0x88_u8, 0xd1_u8, 0xed_u8, 0x42_u8])
    def query_interface(this : IDirectSoundFXEcho*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXEcho*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXEcho*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXEcho*, pcDsFxEcho : Win32cr::Media::Audio::DirectSound::DSFXEcho*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxEcho)
    end
    def get_all_parameters(this : IDirectSoundFXEcho*, pDsFxEcho : Win32cr::Media::Audio::DirectSound::DSFXEcho*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxEcho)
    end

  end

  @[Extern]
  record IDirectSoundFXDistortionVtbl,
    query_interface : Proc(IDirectSoundFXDistortion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXDistortion*, UInt32),
    release : Proc(IDirectSoundFXDistortion*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXDistortion*, Win32cr::Media::Audio::DirectSound::DSFXDistortion*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXDistortion*, Win32cr::Media::Audio::DirectSound::DSFXDistortion*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXDistortion, lpVtbl : IDirectSoundFXDistortionVtbl* do
    GUID = LibC::GUID.new(0x8ecf4326_u32, 0x455f_u16, 0x4d8b_u16, StaticArray[0xbd_u8, 0xa9_u8, 0x8d_u8, 0x5d_u8, 0x3e_u8, 0x9e_u8, 0x3e_u8, 0xb_u8])
    def query_interface(this : IDirectSoundFXDistortion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXDistortion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXDistortion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXDistortion*, pcDsFxDistortion : Win32cr::Media::Audio::DirectSound::DSFXDistortion*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxDistortion)
    end
    def get_all_parameters(this : IDirectSoundFXDistortion*, pDsFxDistortion : Win32cr::Media::Audio::DirectSound::DSFXDistortion*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxDistortion)
    end

  end

  @[Extern]
  record IDirectSoundFXCompressorVtbl,
    query_interface : Proc(IDirectSoundFXCompressor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXCompressor*, UInt32),
    release : Proc(IDirectSoundFXCompressor*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXCompressor*, Win32cr::Media::Audio::DirectSound::DSFXCompressor*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXCompressor*, Win32cr::Media::Audio::DirectSound::DSFXCompressor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXCompressor, lpVtbl : IDirectSoundFXCompressorVtbl* do
    GUID = LibC::GUID.new(0x4bbd1154_u32, 0x62f6_u16, 0x4e2c_u16, StaticArray[0xa1_u8, 0x5c_u8, 0xd3_u8, 0xb6_u8, 0xc4_u8, 0x17_u8, 0xf7_u8, 0xa0_u8])
    def query_interface(this : IDirectSoundFXCompressor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXCompressor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXCompressor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXCompressor*, pcDsFxCompressor : Win32cr::Media::Audio::DirectSound::DSFXCompressor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxCompressor)
    end
    def get_all_parameters(this : IDirectSoundFXCompressor*, pDsFxCompressor : Win32cr::Media::Audio::DirectSound::DSFXCompressor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxCompressor)
    end

  end

  @[Extern]
  record IDirectSoundFXParamEqVtbl,
    query_interface : Proc(IDirectSoundFXParamEq*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXParamEq*, UInt32),
    release : Proc(IDirectSoundFXParamEq*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXParamEq*, Win32cr::Media::Audio::DirectSound::DSFXParamEq*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXParamEq*, Win32cr::Media::Audio::DirectSound::DSFXParamEq*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXParamEq, lpVtbl : IDirectSoundFXParamEqVtbl* do
    GUID = LibC::GUID.new(0xc03ca9fe_u32, 0xfe90_u16, 0x4204_u16, StaticArray[0x80_u8, 0x78_u8, 0x82_u8, 0x33_u8, 0x4c_u8, 0xd1_u8, 0x77_u8, 0xda_u8])
    def query_interface(this : IDirectSoundFXParamEq*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXParamEq*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXParamEq*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXParamEq*, pcDsFxParamEq : Win32cr::Media::Audio::DirectSound::DSFXParamEq*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxParamEq)
    end
    def get_all_parameters(this : IDirectSoundFXParamEq*, pDsFxParamEq : Win32cr::Media::Audio::DirectSound::DSFXParamEq*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxParamEq)
    end

  end

  @[Extern]
  record IDirectSoundFXI3DL2ReverbVtbl,
    query_interface : Proc(IDirectSoundFXI3DL2Reverb*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXI3DL2Reverb*, UInt32),
    release : Proc(IDirectSoundFXI3DL2Reverb*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXI3DL2Reverb*, Win32cr::Media::Audio::DirectSound::DSFXI3DL2Reverb*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXI3DL2Reverb*, Win32cr::Media::Audio::DirectSound::DSFXI3DL2Reverb*, Win32cr::Foundation::HRESULT),
    set_preset : Proc(IDirectSoundFXI3DL2Reverb*, UInt32, Win32cr::Foundation::HRESULT),
    get_preset : Proc(IDirectSoundFXI3DL2Reverb*, UInt32*, Win32cr::Foundation::HRESULT),
    set_quality : Proc(IDirectSoundFXI3DL2Reverb*, Int32, Win32cr::Foundation::HRESULT),
    get_quality : Proc(IDirectSoundFXI3DL2Reverb*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXI3DL2Reverb, lpVtbl : IDirectSoundFXI3DL2ReverbVtbl* do
    GUID = LibC::GUID.new(0x4b166a6a_u32, 0xd66_u16, 0x43f3_u16, StaticArray[0x80_u8, 0xe3_u8, 0xee_u8, 0x62_u8, 0x80_u8, 0xde_u8, 0xe1_u8, 0xa4_u8])
    def query_interface(this : IDirectSoundFXI3DL2Reverb*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXI3DL2Reverb*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXI3DL2Reverb*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXI3DL2Reverb*, pcDsFxI3DL2Reverb : Win32cr::Media::Audio::DirectSound::DSFXI3DL2Reverb*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxI3DL2Reverb)
    end
    def get_all_parameters(this : IDirectSoundFXI3DL2Reverb*, pDsFxI3DL2Reverb : Win32cr::Media::Audio::DirectSound::DSFXI3DL2Reverb*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxI3DL2Reverb)
    end
    def set_preset(this : IDirectSoundFXI3DL2Reverb*, dwPreset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preset.call(this, dwPreset)
    end
    def get_preset(this : IDirectSoundFXI3DL2Reverb*, pdwPreset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preset.call(this, pdwPreset)
    end
    def set_quality(this : IDirectSoundFXI3DL2Reverb*, lQuality : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_quality.call(this, lQuality)
    end
    def get_quality(this : IDirectSoundFXI3DL2Reverb*, plQuality : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quality.call(this, plQuality)
    end

  end

  @[Extern]
  record IDirectSoundFXWavesReverbVtbl,
    query_interface : Proc(IDirectSoundFXWavesReverb*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFXWavesReverb*, UInt32),
    release : Proc(IDirectSoundFXWavesReverb*, UInt32),
    set_all_parameters : Proc(IDirectSoundFXWavesReverb*, Win32cr::Media::Audio::DirectSound::DSFXWavesReverb*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundFXWavesReverb*, Win32cr::Media::Audio::DirectSound::DSFXWavesReverb*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFXWavesReverb, lpVtbl : IDirectSoundFXWavesReverbVtbl* do
    GUID = LibC::GUID.new(0x46858c3a_u32, 0xdc6_u16, 0x45e3_u16, StaticArray[0xb7_u8, 0x60_u8, 0xd4_u8, 0xee_u8, 0xf1_u8, 0x6c_u8, 0xb3_u8, 0x25_u8])
    def query_interface(this : IDirectSoundFXWavesReverb*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFXWavesReverb*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFXWavesReverb*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundFXWavesReverb*, pcDsFxWavesReverb : Win32cr::Media::Audio::DirectSound::DSFXWavesReverb*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDsFxWavesReverb)
    end
    def get_all_parameters(this : IDirectSoundFXWavesReverb*, pDsFxWavesReverb : Win32cr::Media::Audio::DirectSound::DSFXWavesReverb*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDsFxWavesReverb)
    end

  end

  @[Extern]
  record IDirectSoundCaptureFXAecVtbl,
    query_interface : Proc(IDirectSoundCaptureFXAec*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundCaptureFXAec*, UInt32),
    release : Proc(IDirectSoundCaptureFXAec*, UInt32),
    set_all_parameters : Proc(IDirectSoundCaptureFXAec*, Win32cr::Media::Audio::DirectSound::DSCFXAec*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundCaptureFXAec*, Win32cr::Media::Audio::DirectSound::DSCFXAec*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectSoundCaptureFXAec*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IDirectSoundCaptureFXAec*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundCaptureFXAec, lpVtbl : IDirectSoundCaptureFXAecVtbl* do
    GUID = LibC::GUID.new(0xad74143d_u32, 0x903d_u16, 0x4ab7_u16, StaticArray[0x80_u8, 0x66_u8, 0x28_u8, 0xd3_u8, 0x63_u8, 0x3_u8, 0x6d_u8, 0x65_u8])
    def query_interface(this : IDirectSoundCaptureFXAec*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundCaptureFXAec*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundCaptureFXAec*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundCaptureFXAec*, pDscFxAec : Win32cr::Media::Audio::DirectSound::DSCFXAec*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pDscFxAec)
    end
    def get_all_parameters(this : IDirectSoundCaptureFXAec*, pDscFxAec : Win32cr::Media::Audio::DirectSound::DSCFXAec*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDscFxAec)
    end
    def get_status(this : IDirectSoundCaptureFXAec*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def reset(this : IDirectSoundCaptureFXAec*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IDirectSoundCaptureFXNoiseSuppressVtbl,
    query_interface : Proc(IDirectSoundCaptureFXNoiseSuppress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundCaptureFXNoiseSuppress*, UInt32),
    release : Proc(IDirectSoundCaptureFXNoiseSuppress*, UInt32),
    set_all_parameters : Proc(IDirectSoundCaptureFXNoiseSuppress*, Win32cr::Media::Audio::DirectSound::DSCFXNoiseSuppress*, Win32cr::Foundation::HRESULT),
    get_all_parameters : Proc(IDirectSoundCaptureFXNoiseSuppress*, Win32cr::Media::Audio::DirectSound::DSCFXNoiseSuppress*, Win32cr::Foundation::HRESULT),
    reset : Proc(IDirectSoundCaptureFXNoiseSuppress*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundCaptureFXNoiseSuppress, lpVtbl : IDirectSoundCaptureFXNoiseSuppressVtbl* do
    GUID = LibC::GUID.new(0xed311e41_u32, 0xfbae_u16, 0x4175_u16, StaticArray[0x96_u8, 0x25_u8, 0xcd_u8, 0x8_u8, 0x54_u8, 0xf6_u8, 0x93_u8, 0xca_u8])
    def query_interface(this : IDirectSoundCaptureFXNoiseSuppress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundCaptureFXNoiseSuppress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundCaptureFXNoiseSuppress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_all_parameters(this : IDirectSoundCaptureFXNoiseSuppress*, pcDscFxNoiseSuppress : Win32cr::Media::Audio::DirectSound::DSCFXNoiseSuppress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_parameters.call(this, pcDscFxNoiseSuppress)
    end
    def get_all_parameters(this : IDirectSoundCaptureFXNoiseSuppress*, pDscFxNoiseSuppress : Win32cr::Media::Audio::DirectSound::DSCFXNoiseSuppress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_parameters.call(this, pDscFxNoiseSuppress)
    end
    def reset(this : IDirectSoundCaptureFXNoiseSuppress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IDirectSoundFullDuplexVtbl,
    query_interface : Proc(IDirectSoundFullDuplex*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectSoundFullDuplex*, UInt32),
    release : Proc(IDirectSoundFullDuplex*, UInt32),
    initialize__ : Proc(IDirectSoundFullDuplex*, LibC::GUID*, LibC::GUID*, Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, Win32cr::Foundation::HWND, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectSoundFullDuplex, lpVtbl : IDirectSoundFullDuplexVtbl* do
    GUID = LibC::GUID.new(0xedcb4c7a_u32, 0xdaab_u16, 0x4216_u16, StaticArray[0xa4_u8, 0x2e_u8, 0x6c_u8, 0x50_u8, 0x59_u8, 0x6d_u8, 0xdc_u8, 0x1d_u8])
    def query_interface(this : IDirectSoundFullDuplex*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectSoundFullDuplex*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectSoundFullDuplex*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IDirectSoundFullDuplex*, pCaptureGuid : LibC::GUID*, pRenderGuid : LibC::GUID*, lpDscBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, lpDsBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, hWnd : Win32cr::Foundation::HWND, dwLevel : UInt32, lplpDirectSoundCaptureBuffer8 : Void**, lplpDirectSoundBuffer8 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pCaptureGuid, pRenderGuid, lpDscBufferDesc, lpDsBufferDesc, hWnd, dwLevel, lplpDirectSoundCaptureBuffer8, lplpDirectSoundBuffer8)
    end

  end

  def directSoundCreate(pcGuidDevice : LibC::GUID*, ppDS : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCreate(pcGuidDevice, ppDS, pUnkOuter)
  end

  def directSoundEnumerateA(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKA, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundEnumerateA(pDSEnumCallback, pContext)
  end

  def directSoundEnumerateW(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKW, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundEnumerateW(pDSEnumCallback, pContext)
  end

  def directSoundCaptureCreate(pcGuidDevice : LibC::GUID*, ppDSC : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCaptureCreate(pcGuidDevice, ppDSC, pUnkOuter)
  end

  def directSoundCaptureEnumerateA(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKA, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCaptureEnumerateA(pDSEnumCallback, pContext)
  end

  def directSoundCaptureEnumerateW(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKW, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCaptureEnumerateW(pDSEnumCallback, pContext)
  end

  def directSoundCreate8(pcGuidDevice : LibC::GUID*, ppDS8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCreate8(pcGuidDevice, ppDS8, pUnkOuter)
  end

  def directSoundCaptureCreate8(pcGuidDevice : LibC::GUID*, ppDSC8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundCaptureCreate8(pcGuidDevice, ppDSC8, pUnkOuter)
  end

  def directSoundFullDuplexCreate(pcGuidCaptureDevice : LibC::GUID*, pcGuidRenderDevice : LibC::GUID*, pcDSCBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, hWnd : Win32cr::Foundation::HWND, dwLevel : UInt32, ppDSFD : Void**, ppDSCBuffer8 : Void**, ppDSBuffer8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT
    C.DirectSoundFullDuplexCreate(pcGuidCaptureDevice, pcGuidRenderDevice, pcDSCBufferDesc, pcDSBufferDesc, hWnd, dwLevel, ppDSFD, ppDSCBuffer8, ppDSBuffer8, pUnkOuter)
  end

  def getDeviceID(pGuidSrc : LibC::GUID*, pGuidDest : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.GetDeviceID(pGuidSrc, pGuidDest)
  end

  @[Link("dsound")]
  lib C
    # :nodoc:
    fun DirectSoundCreate(pcGuidDevice : LibC::GUID*, ppDS : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundEnumerateA(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKA, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundEnumerateW(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKW, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundCaptureCreate(pcGuidDevice : LibC::GUID*, ppDSC : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundCaptureEnumerateA(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKA, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundCaptureEnumerateW(pDSEnumCallback : Win32cr::Media::Audio::DirectSound::LPDSENUMCALLBACKW, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundCreate8(pcGuidDevice : LibC::GUID*, ppDS8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundCaptureCreate8(pcGuidDevice : LibC::GUID*, ppDSC8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DirectSoundFullDuplexCreate(pcGuidCaptureDevice : LibC::GUID*, pcGuidRenderDevice : LibC::GUID*, pcDSCBufferDesc : Win32cr::Media::Audio::DirectSound::DSCBUFFERDESC*, pcDSBufferDesc : Win32cr::Media::Audio::DirectSound::DSBUFFERDESC*, hWnd : Win32cr::Foundation::HWND, dwLevel : UInt32, ppDSFD : Void**, ppDSCBuffer8 : Void**, ppDSBuffer8 : Void**, pUnkOuter : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetDeviceID(pGuidSrc : LibC::GUID*, pGuidDest : LibC::GUID*) : Win32cr::Foundation::HRESULT

  end
end