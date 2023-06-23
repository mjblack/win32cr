require "../../media/audio.cr"
require "../../graphics/direct3d.cr"
require "../../foundation.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dsound.dll")]
{% else %}
@[Link("dsound")]
{% end %}
lib LibWin32
  DIRECTSOUND_VERSION = 1792_u32
  FACDS = 2168_u32
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
  DSFXCHORUS_WETDRYMIX_MIN = "0.0_f32"
  DSFXCHORUS_WETDRYMIX_MAX = "100.0_f32"
  DSFXCHORUS_DEPTH_MIN = "0.0_f32"
  DSFXCHORUS_DEPTH_MAX = "100.0_f32"
  DSFXCHORUS_FEEDBACK_MIN = "-99.0_f32"
  DSFXCHORUS_FEEDBACK_MAX = "99.0_f32"
  DSFXCHORUS_FREQUENCY_MIN = "0.0_f32"
  DSFXCHORUS_FREQUENCY_MAX = "10.0_f32"
  DSFXCHORUS_DELAY_MIN = "0.0_f32"
  DSFXCHORUS_DELAY_MAX = "20.0_f32"
  DSFXCHORUS_PHASE_MIN = 0_u32
  DSFXCHORUS_PHASE_MAX = 4_u32
  DSFXCHORUS_PHASE_NEG_180 = 0_u32
  DSFXCHORUS_PHASE_NEG_90 = 1_u32
  DSFXCHORUS_PHASE_ZERO = 2_u32
  DSFXCHORUS_PHASE_90 = 3_u32
  DSFXCHORUS_PHASE_180 = 4_u32
  DSFXFLANGER_WAVE_TRIANGLE = 0_u32
  DSFXFLANGER_WAVE_SIN = 1_u32
  DSFXFLANGER_WETDRYMIX_MIN = "0.0_f32"
  DSFXFLANGER_WETDRYMIX_MAX = "100.0_f32"
  DSFXFLANGER_FREQUENCY_MIN = "0.0_f32"
  DSFXFLANGER_FREQUENCY_MAX = "10.0_f32"
  DSFXFLANGER_DEPTH_MIN = "0.0_f32"
  DSFXFLANGER_DEPTH_MAX = "100.0_f32"
  DSFXFLANGER_PHASE_MIN = 0_u32
  DSFXFLANGER_PHASE_MAX = 4_u32
  DSFXFLANGER_FEEDBACK_MIN = "-99.0_f32"
  DSFXFLANGER_FEEDBACK_MAX = "99.0_f32"
  DSFXFLANGER_DELAY_MIN = "0.0_f32"
  DSFXFLANGER_DELAY_MAX = "4.0_f32"
  DSFXFLANGER_PHASE_NEG_180 = 0_u32
  DSFXFLANGER_PHASE_NEG_90 = 1_u32
  DSFXFLANGER_PHASE_ZERO = 2_u32
  DSFXFLANGER_PHASE_90 = 3_u32
  DSFXFLANGER_PHASE_180 = 4_u32
  DSFXECHO_WETDRYMIX_MIN = "0.0_f32"
  DSFXECHO_WETDRYMIX_MAX = "100.0_f32"
  DSFXECHO_FEEDBACK_MIN = "0.0_f32"
  DSFXECHO_FEEDBACK_MAX = "100.0_f32"
  DSFXECHO_LEFTDELAY_MIN = "1.0_f32"
  DSFXECHO_LEFTDELAY_MAX = "2000.0_f32"
  DSFXECHO_RIGHTDELAY_MIN = "1.0_f32"
  DSFXECHO_RIGHTDELAY_MAX = "2000.0_f32"
  DSFXECHO_PANDELAY_MIN = 0_u32
  DSFXECHO_PANDELAY_MAX = 1_u32
  DSFXDISTORTION_GAIN_MIN = "-60.0_f32"
  DSFXDISTORTION_GAIN_MAX = "0.0_f32"
  DSFXDISTORTION_EDGE_MIN = "0.0_f32"
  DSFXDISTORTION_EDGE_MAX = "100.0_f32"
  DSFXDISTORTION_POSTEQCENTERFREQUENCY_MIN = "100.0_f32"
  DSFXDISTORTION_POSTEQCENTERFREQUENCY_MAX = "8000.0_f32"
  DSFXDISTORTION_POSTEQBANDWIDTH_MIN = "100.0_f32"
  DSFXDISTORTION_POSTEQBANDWIDTH_MAX = "8000.0_f32"
  DSFXDISTORTION_PRELOWPASSCUTOFF_MIN = "100.0_f32"
  DSFXDISTORTION_PRELOWPASSCUTOFF_MAX = "8000.0_f32"
  DSFXCOMPRESSOR_GAIN_MIN = "-60.0_f32"
  DSFXCOMPRESSOR_GAIN_MAX = "60.0_f32"
  DSFXCOMPRESSOR_ATTACK_MIN = "0.01_f32"
  DSFXCOMPRESSOR_ATTACK_MAX = "500.0_f32"
  DSFXCOMPRESSOR_RELEASE_MIN = "50.0_f32"
  DSFXCOMPRESSOR_RELEASE_MAX = "3000.0_f32"
  DSFXCOMPRESSOR_THRESHOLD_MIN = "-60.0_f32"
  DSFXCOMPRESSOR_THRESHOLD_MAX = "0.0_f32"
  DSFXCOMPRESSOR_RATIO_MIN = "1.0_f32"
  DSFXCOMPRESSOR_RATIO_MAX = "100.0_f32"
  DSFXCOMPRESSOR_PREDELAY_MIN = "0.0_f32"
  DSFXCOMPRESSOR_PREDELAY_MAX = "4.0_f32"
  DSFXPARAMEQ_CENTER_MIN = "80.0_f32"
  DSFXPARAMEQ_CENTER_MAX = "16000.0_f32"
  DSFXPARAMEQ_BANDWIDTH_MIN = "1.0_f32"
  DSFXPARAMEQ_BANDWIDTH_MAX = "36.0_f32"
  DSFXPARAMEQ_GAIN_MIN = "-15.0_f32"
  DSFXPARAMEQ_GAIN_MAX = "15.0_f32"
  DSFX_I3DL2REVERB_ROOM_MIN = -10000_i32
  DSFX_I3DL2REVERB_ROOM_MAX = 0_u32
  DSFX_I3DL2REVERB_ROOM_DEFAULT = -1000_i32
  DSFX_I3DL2REVERB_ROOMHF_MIN = -10000_i32
  DSFX_I3DL2REVERB_ROOMHF_MAX = 0_u32
  DSFX_I3DL2REVERB_ROOMHF_DEFAULT = -100_i32
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MIN = "0.0_f32"
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MAX = "10.0_f32"
  DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_DEFAULT = "0.0_f32"
  DSFX_I3DL2REVERB_DECAYTIME_MIN = "0.1_f32"
  DSFX_I3DL2REVERB_DECAYTIME_MAX = "20.0_f32"
  DSFX_I3DL2REVERB_DECAYTIME_DEFAULT = "1.49_f32"
  DSFX_I3DL2REVERB_DECAYHFRATIO_MIN = "0.1_f32"
  DSFX_I3DL2REVERB_DECAYHFRATIO_MAX = "2.0_f32"
  DSFX_I3DL2REVERB_DECAYHFRATIO_DEFAULT = "0.83_f32"
  DSFX_I3DL2REVERB_REFLECTIONS_MIN = -10000_i32
  DSFX_I3DL2REVERB_REFLECTIONS_MAX = 1000_u32
  DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT = -2602_i32
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_MIN = "0.0_f32"
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_MAX = "0.3_f32"
  DSFX_I3DL2REVERB_REFLECTIONSDELAY_DEFAULT = "0.007_f32"
  DSFX_I3DL2REVERB_REVERB_MIN = -10000_i32
  DSFX_I3DL2REVERB_REVERB_MAX = 2000_u32
  DSFX_I3DL2REVERB_REVERB_DEFAULT = 200_u32
  DSFX_I3DL2REVERB_REVERBDELAY_MIN = "0.0_f32"
  DSFX_I3DL2REVERB_REVERBDELAY_MAX = "0.1_f32"
  DSFX_I3DL2REVERB_REVERBDELAY_DEFAULT = "0.011_f32"
  DSFX_I3DL2REVERB_DIFFUSION_MIN = "0.0_f32"
  DSFX_I3DL2REVERB_DIFFUSION_MAX = "100.0_f32"
  DSFX_I3DL2REVERB_DIFFUSION_DEFAULT = "100.0_f32"
  DSFX_I3DL2REVERB_DENSITY_MIN = "0.0_f32"
  DSFX_I3DL2REVERB_DENSITY_MAX = "100.0_f32"
  DSFX_I3DL2REVERB_DENSITY_DEFAULT = "100.0_f32"
  DSFX_I3DL2REVERB_HFREFERENCE_MIN = "20.0_f32"
  DSFX_I3DL2REVERB_HFREFERENCE_MAX = "20000.0_f32"
  DSFX_I3DL2REVERB_HFREFERENCE_DEFAULT = "5000.0_f32"
  DSFX_I3DL2REVERB_QUALITY_MIN = 0_u32
  DSFX_I3DL2REVERB_QUALITY_MAX = 3_u32
  DSFX_I3DL2REVERB_QUALITY_DEFAULT = 2_u32
  DSFX_WAVESREVERB_INGAIN_MIN = "-96.0_f32"
  DSFX_WAVESREVERB_INGAIN_MAX = "0.0_f32"
  DSFX_WAVESREVERB_INGAIN_DEFAULT = "0.0_f32"
  DSFX_WAVESREVERB_REVERBMIX_MIN = "-96.0_f32"
  DSFX_WAVESREVERB_REVERBMIX_MAX = "0.0_f32"
  DSFX_WAVESREVERB_REVERBMIX_DEFAULT = "0.0_f32"
  DSFX_WAVESREVERB_REVERBTIME_MIN = "0.001_f32"
  DSFX_WAVESREVERB_REVERBTIME_MAX = "3000.0_f32"
  DSFX_WAVESREVERB_REVERBTIME_DEFAULT = "1000.0_f32"
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_MIN = "0.001_f32"
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_MAX = "0.999_f32"
  DSFX_WAVESREVERB_HIGHFREQRTRATIO_DEFAULT = "0.001_f32"
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
  DS3D_DEFAULTDISTANCEFACTOR = "1.0_f32"
  DS3D_MINROLLOFFFACTOR = "0.0_f32"
  DS3D_MAXROLLOFFFACTOR = "10.0_f32"
  DS3D_DEFAULTROLLOFFFACTOR = "1.0_f32"
  DS3D_MINDOPPLERFACTOR = "0.0_f32"
  DS3D_MAXDOPPLERFACTOR = "10.0_f32"
  DS3D_DEFAULTDOPPLERFACTOR = "1.0_f32"
  DS3D_DEFAULTMINDISTANCE = "1.0_f32"
  DS3D_DEFAULTMAXDISTANCE = "1000000000.0_f32"
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

  alias LPDSENUMCALLBACKA = Proc(Guid*, PSTR, PSTR, Void*, LibC::BOOL)
  alias LPDSENUMCALLBACKW = Proc(Guid*, LibC::LPWSTR, LibC::LPWSTR, Void*, LibC::BOOL)

  struct DSCAPS
    dw_size : UInt32
    dw_flags : UInt32
    dw_min_secondary_sample_rate : UInt32
    dw_max_secondary_sample_rate : UInt32
    dw_primary_buffers : UInt32
    dw_max_hw_mixing_all_buffers : UInt32
    dw_max_hw_mixing_static_buffers : UInt32
    dw_max_hw_mixing_streaming_buffers : UInt32
    dw_free_hw_mixing_all_buffers : UInt32
    dw_free_hw_mixing_static_buffers : UInt32
    dw_free_hw_mixing_streaming_buffers : UInt32
    dw_max_hw3_d_all_buffers : UInt32
    dw_max_hw3_d_static_buffers : UInt32
    dw_max_hw3_d_streaming_buffers : UInt32
    dw_free_hw3_d_all_buffers : UInt32
    dw_free_hw3_d_static_buffers : UInt32
    dw_free_hw3_d_streaming_buffers : UInt32
    dw_total_hw_mem_bytes : UInt32
    dw_free_hw_mem_bytes : UInt32
    dw_max_contig_free_hw_mem_bytes : UInt32
    dw_unlock_transfer_rate_hw_buffers : UInt32
    dw_play_cpu_overhead_sw_buffers : UInt32
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
  end
  struct DSBCAPS
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_unlock_transfer_rate : UInt32
    dw_play_cpu_overhead : UInt32
  end
  struct DSEFFECTDESC
    dw_size : UInt32
    dw_flags : UInt32
    guid_dsfx_class : Guid
    dw_reserved1 : LibC::UINT_PTR
    dw_reserved2 : LibC::UINT_PTR
  end
  struct DSCEFFECTDESC
    dw_size : UInt32
    dw_flags : UInt32
    guid_dscfx_class : Guid
    guid_dscfx_instance : Guid
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
  end
  struct DSBUFFERDESC
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_reserved : UInt32
    lpwfx_format : WAVEFORMATEX*
    guid3_d_algorithm : Guid
  end
  struct DSBUFFERDESC1
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_reserved : UInt32
    lpwfx_format : WAVEFORMATEX*
  end
  struct DS3DBUFFER
    dw_size : UInt32
    v_position : D3DVECTOR
    v_velocity : D3DVECTOR
    dw_inside_cone_angle : UInt32
    dw_outside_cone_angle : UInt32
    v_cone_orientation : D3DVECTOR
    l_cone_outside_volume : Int32
    fl_min_distance : Float32
    fl_max_distance : Float32
    dw_mode : UInt32
  end
  struct DS3DLISTENER
    dw_size : UInt32
    v_position : D3DVECTOR
    v_velocity : D3DVECTOR
    v_orient_front : D3DVECTOR
    v_orient_top : D3DVECTOR
    fl_distance_factor : Float32
    fl_rolloff_factor : Float32
    fl_doppler_factor : Float32
  end
  struct DSCCAPS
    dw_size : UInt32
    dw_flags : UInt32
    dw_formats : UInt32
    dw_channels : UInt32
  end
  struct DSCBUFFERDESC1
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_reserved : UInt32
    lpwfx_format : WAVEFORMATEX*
  end
  struct DSCBUFFERDESC
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_reserved : UInt32
    lpwfx_format : WAVEFORMATEX*
    dw_fx_count : UInt32
    lp_dscfx_desc : DSCEFFECTDESC*
  end
  struct DSCBCAPS
    dw_size : UInt32
    dw_flags : UInt32
    dw_buffer_bytes : UInt32
    dw_reserved : UInt32
  end
  struct DSBPOSITIONNOTIFY
    dw_offset : UInt32
    h_event_notify : LibC::HANDLE
  end
  struct DSFXGargle
    dw_rate_hz : UInt32
    dw_wave_shape : UInt32
  end
  struct DSFXChorus
    f_wet_dry_mix : Float32
    f_depth : Float32
    f_feedback : Float32
    f_frequency : Float32
    l_waveform : Int32
    f_delay : Float32
    l_phase : Int32
  end
  struct DSFXFlanger
    f_wet_dry_mix : Float32
    f_depth : Float32
    f_feedback : Float32
    f_frequency : Float32
    l_waveform : Int32
    f_delay : Float32
    l_phase : Int32
  end
  struct DSFXEcho
    f_wet_dry_mix : Float32
    f_feedback : Float32
    f_left_delay : Float32
    f_right_delay : Float32
    l_pan_delay : Int32
  end
  struct DSFXDistortion
    f_gain : Float32
    f_edge : Float32
    f_post_eq_center_frequency : Float32
    f_post_eq_bandwidth : Float32
    f_pre_lowpass_cutoff : Float32
  end
  struct DSFXCompressor
    f_gain : Float32
    f_attack : Float32
    f_release : Float32
    f_threshold : Float32
    f_ratio : Float32
    f_predelay : Float32
  end
  struct DSFXParamEq
    f_center : Float32
    f_bandwidth : Float32
    f_gain : Float32
  end
  struct DSFXI3DL2Reverb
    l_room : Int32
    l_room_hf : Int32
    fl_room_rolloff_factor : Float32
    fl_decay_time : Float32
    fl_decay_hf_ratio : Float32
    l_reflections : Int32
    fl_reflections_delay : Float32
    l_reverb : Int32
    fl_reverb_delay : Float32
    fl_diffusion : Float32
    fl_density : Float32
    fl_hf_reference : Float32
  end
  struct DSFXWavesReverb
    f_in_gain : Float32
    f_reverb_mix : Float32
    f_reverb_time : Float32
    f_high_freq_rt_ratio : Float32
  end
  struct DSCFXAec
    f_enable : LibC::BOOL
    f_noise_fill : LibC::BOOL
    dw_mode : UInt32
  end
  struct DSCFXNoiseSuppress
    f_enable : LibC::BOOL
  end


  struct IDirectSoundVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_sound_buffer : UInt64
    get_caps : UInt64
    duplicate_sound_buffer : UInt64
    set_cooperative_level : UInt64
    compact : UInt64
    get_speaker_config : UInt64
    set_speaker_config : UInt64
    initialize : UInt64
  end

  IDirectSound_GUID = "279afa83-4981-11ce-a521-0020af0be560"
  IID_IDirectSound = LibC::GUID.new(0x279afa83_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
  struct IDirectSound
    lpVtbl : IDirectSoundVTbl*
  end

  struct IDirectSound8VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_sound_buffer : UInt64
    get_caps : UInt64
    duplicate_sound_buffer : UInt64
    set_cooperative_level : UInt64
    compact : UInt64
    get_speaker_config : UInt64
    set_speaker_config : UInt64
    initialize : UInt64
    verify_certification : UInt64
  end

  IDirectSound8_GUID = "c50a7e93-f395-4834-9ef6-7fa99de50966"
  IID_IDirectSound8 = LibC::GUID.new(0xc50a7e93_u32, 0xf395_u16, 0x4834_u16, StaticArray[0x9e_u8, 0xf6_u8, 0x7f_u8, 0xa9_u8, 0x9d_u8, 0xe5_u8, 0x9_u8, 0x66_u8])
  struct IDirectSound8
    lpVtbl : IDirectSound8VTbl*
  end

  struct IDirectSoundBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_caps : UInt64
    get_current_position : UInt64
    get_format : UInt64
    get_volume : UInt64
    get_pan : UInt64
    get_frequency : UInt64
    get_status : UInt64
    initialize : UInt64
    lock : UInt64
    play : UInt64
    set_current_position : UInt64
    set_format : UInt64
    set_volume : UInt64
    set_pan : UInt64
    set_frequency : UInt64
    stop : UInt64
    unlock : UInt64
    restore : UInt64
  end

  IDirectSoundBuffer_GUID = "279afa85-4981-11ce-a521-0020af0be560"
  IID_IDirectSoundBuffer = LibC::GUID.new(0x279afa85_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
  struct IDirectSoundBuffer
    lpVtbl : IDirectSoundBufferVTbl*
  end

  struct IDirectSoundBuffer8VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_caps : UInt64
    get_current_position : UInt64
    get_format : UInt64
    get_volume : UInt64
    get_pan : UInt64
    get_frequency : UInt64
    get_status : UInt64
    initialize : UInt64
    lock : UInt64
    play : UInt64
    set_current_position : UInt64
    set_format : UInt64
    set_volume : UInt64
    set_pan : UInt64
    set_frequency : UInt64
    stop : UInt64
    unlock : UInt64
    restore : UInt64
    set_fx : UInt64
    acquire_resources : UInt64
    get_object_in_path : UInt64
  end

  IDirectSoundBuffer8_GUID = "6825a449-7524-4d82-920f-50e36ab3ab1e"
  IID_IDirectSoundBuffer8 = LibC::GUID.new(0x6825a449_u32, 0x7524_u16, 0x4d82_u16, StaticArray[0x92_u8, 0xf_u8, 0x50_u8, 0xe3_u8, 0x6a_u8, 0xb3_u8, 0xab_u8, 0x1e_u8])
  struct IDirectSoundBuffer8
    lpVtbl : IDirectSoundBuffer8VTbl*
  end

  struct IDirectSound3DListenerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_all_parameters : UInt64
    get_distance_factor : UInt64
    get_doppler_factor : UInt64
    get_orientation : UInt64
    get_position : UInt64
    get_rolloff_factor : UInt64
    get_velocity : UInt64
    set_all_parameters : UInt64
    set_distance_factor : UInt64
    set_doppler_factor : UInt64
    set_orientation : UInt64
    set_position : UInt64
    set_rolloff_factor : UInt64
    set_velocity : UInt64
    commit_deferred_settings : UInt64
  end

  IDirectSound3DListener_GUID = "279afa84-4981-11ce-a521-0020af0be560"
  IID_IDirectSound3DListener = LibC::GUID.new(0x279afa84_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
  struct IDirectSound3DListener
    lpVtbl : IDirectSound3DListenerVTbl*
  end

  struct IDirectSound3DBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_all_parameters : UInt64
    get_cone_angles : UInt64
    get_cone_orientation : UInt64
    get_cone_outside_volume : UInt64
    get_max_distance : UInt64
    get_min_distance : UInt64
    get_mode : UInt64
    get_position : UInt64
    get_velocity : UInt64
    set_all_parameters : UInt64
    set_cone_angles : UInt64
    set_cone_orientation : UInt64
    set_cone_outside_volume : UInt64
    set_max_distance : UInt64
    set_min_distance : UInt64
    set_mode : UInt64
    set_position : UInt64
    set_velocity : UInt64
  end

  IDirectSound3DBuffer_GUID = "279afa86-4981-11ce-a521-0020af0be560"
  IID_IDirectSound3DBuffer = LibC::GUID.new(0x279afa86_u32, 0x4981_u16, 0x11ce_u16, StaticArray[0xa5_u8, 0x21_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xe5_u8, 0x60_u8])
  struct IDirectSound3DBuffer
    lpVtbl : IDirectSound3DBufferVTbl*
  end

  struct IDirectSoundCaptureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_capture_buffer : UInt64
    get_caps : UInt64
    initialize : UInt64
  end

  IDirectSoundCapture_GUID = "b0210781-89cd-11d0-af08-00a0c925cd16"
  IID_IDirectSoundCapture = LibC::GUID.new(0xb0210781_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
  struct IDirectSoundCapture
    lpVtbl : IDirectSoundCaptureVTbl*
  end

  struct IDirectSoundCaptureBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_caps : UInt64
    get_current_position : UInt64
    get_format : UInt64
    get_status : UInt64
    initialize : UInt64
    lock : UInt64
    start : UInt64
    stop : UInt64
    unlock : UInt64
  end

  IDirectSoundCaptureBuffer_GUID = "b0210782-89cd-11d0-af08-00a0c925cd16"
  IID_IDirectSoundCaptureBuffer = LibC::GUID.new(0xb0210782_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
  struct IDirectSoundCaptureBuffer
    lpVtbl : IDirectSoundCaptureBufferVTbl*
  end

  struct IDirectSoundCaptureBuffer8VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_caps : UInt64
    get_current_position : UInt64
    get_format : UInt64
    get_status : UInt64
    initialize : UInt64
    lock : UInt64
    start : UInt64
    stop : UInt64
    unlock : UInt64
    get_object_in_path : UInt64
    get_fx_status : UInt64
  end

  IDirectSoundCaptureBuffer8_GUID = "00990df4-0dbb-4872-833e-6d303e80aeb6"
  IID_IDirectSoundCaptureBuffer8 = LibC::GUID.new(0x990df4_u32, 0xdbb_u16, 0x4872_u16, StaticArray[0x83_u8, 0x3e_u8, 0x6d_u8, 0x30_u8, 0x3e_u8, 0x80_u8, 0xae_u8, 0xb6_u8])
  struct IDirectSoundCaptureBuffer8
    lpVtbl : IDirectSoundCaptureBuffer8VTbl*
  end

  struct IDirectSoundNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notification_positions : UInt64
  end

  IDirectSoundNotify_GUID = "b0210783-89cd-11d0-af08-00a0c925cd16"
  IID_IDirectSoundNotify = LibC::GUID.new(0xb0210783_u32, 0x89cd_u16, 0x11d0_u16, StaticArray[0xaf_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x25_u8, 0xcd_u8, 0x16_u8])
  struct IDirectSoundNotify
    lpVtbl : IDirectSoundNotifyVTbl*
  end

  struct IDirectSoundFXGargleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXGargle_GUID = "d616f352-d622-11ce-aac5-0020af0b99a3"
  IID_IDirectSoundFXGargle = LibC::GUID.new(0xd616f352_u32, 0xd622_u16, 0x11ce_u16, StaticArray[0xaa_u8, 0xc5_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0x99_u8, 0xa3_u8])
  struct IDirectSoundFXGargle
    lpVtbl : IDirectSoundFXGargleVTbl*
  end

  struct IDirectSoundFXChorusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXChorus_GUID = "880842e3-145f-43e6-a934-a71806e50547"
  IID_IDirectSoundFXChorus = LibC::GUID.new(0x880842e3_u32, 0x145f_u16, 0x43e6_u16, StaticArray[0xa9_u8, 0x34_u8, 0xa7_u8, 0x18_u8, 0x6_u8, 0xe5_u8, 0x5_u8, 0x47_u8])
  struct IDirectSoundFXChorus
    lpVtbl : IDirectSoundFXChorusVTbl*
  end

  struct IDirectSoundFXFlangerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXFlanger_GUID = "903e9878-2c92-4072-9b2c-ea68f5396783"
  IID_IDirectSoundFXFlanger = LibC::GUID.new(0x903e9878_u32, 0x2c92_u16, 0x4072_u16, StaticArray[0x9b_u8, 0x2c_u8, 0xea_u8, 0x68_u8, 0xf5_u8, 0x39_u8, 0x67_u8, 0x83_u8])
  struct IDirectSoundFXFlanger
    lpVtbl : IDirectSoundFXFlangerVTbl*
  end

  struct IDirectSoundFXEchoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXEcho_GUID = "8bd28edf-50db-4e92-a2bd-445488d1ed42"
  IID_IDirectSoundFXEcho = LibC::GUID.new(0x8bd28edf_u32, 0x50db_u16, 0x4e92_u16, StaticArray[0xa2_u8, 0xbd_u8, 0x44_u8, 0x54_u8, 0x88_u8, 0xd1_u8, 0xed_u8, 0x42_u8])
  struct IDirectSoundFXEcho
    lpVtbl : IDirectSoundFXEchoVTbl*
  end

  struct IDirectSoundFXDistortionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXDistortion_GUID = "8ecf4326-455f-4d8b-bda9-8d5d3e9e3e0b"
  IID_IDirectSoundFXDistortion = LibC::GUID.new(0x8ecf4326_u32, 0x455f_u16, 0x4d8b_u16, StaticArray[0xbd_u8, 0xa9_u8, 0x8d_u8, 0x5d_u8, 0x3e_u8, 0x9e_u8, 0x3e_u8, 0xb_u8])
  struct IDirectSoundFXDistortion
    lpVtbl : IDirectSoundFXDistortionVTbl*
  end

  struct IDirectSoundFXCompressorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXCompressor_GUID = "4bbd1154-62f6-4e2c-a15c-d3b6c417f7a0"
  IID_IDirectSoundFXCompressor = LibC::GUID.new(0x4bbd1154_u32, 0x62f6_u16, 0x4e2c_u16, StaticArray[0xa1_u8, 0x5c_u8, 0xd3_u8, 0xb6_u8, 0xc4_u8, 0x17_u8, 0xf7_u8, 0xa0_u8])
  struct IDirectSoundFXCompressor
    lpVtbl : IDirectSoundFXCompressorVTbl*
  end

  struct IDirectSoundFXParamEqVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXParamEq_GUID = "c03ca9fe-fe90-4204-8078-82334cd177da"
  IID_IDirectSoundFXParamEq = LibC::GUID.new(0xc03ca9fe_u32, 0xfe90_u16, 0x4204_u16, StaticArray[0x80_u8, 0x78_u8, 0x82_u8, 0x33_u8, 0x4c_u8, 0xd1_u8, 0x77_u8, 0xda_u8])
  struct IDirectSoundFXParamEq
    lpVtbl : IDirectSoundFXParamEqVTbl*
  end

  struct IDirectSoundFXI3DL2ReverbVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
    set_preset : UInt64
    get_preset : UInt64
    set_quality : UInt64
    get_quality : UInt64
  end

  IDirectSoundFXI3DL2Reverb_GUID = "4b166a6a-0d66-43f3-80e3-ee6280dee1a4"
  IID_IDirectSoundFXI3DL2Reverb = LibC::GUID.new(0x4b166a6a_u32, 0xd66_u16, 0x43f3_u16, StaticArray[0x80_u8, 0xe3_u8, 0xee_u8, 0x62_u8, 0x80_u8, 0xde_u8, 0xe1_u8, 0xa4_u8])
  struct IDirectSoundFXI3DL2Reverb
    lpVtbl : IDirectSoundFXI3DL2ReverbVTbl*
  end

  struct IDirectSoundFXWavesReverbVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
  end

  IDirectSoundFXWavesReverb_GUID = "46858c3a-0dc6-45e3-b760-d4eef16cb325"
  IID_IDirectSoundFXWavesReverb = LibC::GUID.new(0x46858c3a_u32, 0xdc6_u16, 0x45e3_u16, StaticArray[0xb7_u8, 0x60_u8, 0xd4_u8, 0xee_u8, 0xf1_u8, 0x6c_u8, 0xb3_u8, 0x25_u8])
  struct IDirectSoundFXWavesReverb
    lpVtbl : IDirectSoundFXWavesReverbVTbl*
  end

  struct IDirectSoundCaptureFXAecVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
    get_status : UInt64
    reset : UInt64
  end

  IDirectSoundCaptureFXAec_GUID = "ad74143d-903d-4ab7-8066-28d363036d65"
  IID_IDirectSoundCaptureFXAec = LibC::GUID.new(0xad74143d_u32, 0x903d_u16, 0x4ab7_u16, StaticArray[0x80_u8, 0x66_u8, 0x28_u8, 0xd3_u8, 0x63_u8, 0x3_u8, 0x6d_u8, 0x65_u8])
  struct IDirectSoundCaptureFXAec
    lpVtbl : IDirectSoundCaptureFXAecVTbl*
  end

  struct IDirectSoundCaptureFXNoiseSuppressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_all_parameters : UInt64
    get_all_parameters : UInt64
    reset : UInt64
  end

  IDirectSoundCaptureFXNoiseSuppress_GUID = "ed311e41-fbae-4175-9625-cd0854f693ca"
  IID_IDirectSoundCaptureFXNoiseSuppress = LibC::GUID.new(0xed311e41_u32, 0xfbae_u16, 0x4175_u16, StaticArray[0x96_u8, 0x25_u8, 0xcd_u8, 0x8_u8, 0x54_u8, 0xf6_u8, 0x93_u8, 0xca_u8])
  struct IDirectSoundCaptureFXNoiseSuppress
    lpVtbl : IDirectSoundCaptureFXNoiseSuppressVTbl*
  end

  struct IDirectSoundFullDuplexVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
  end

  IDirectSoundFullDuplex_GUID = "edcb4c7a-daab-4216-a42e-6c50596ddc1d"
  IID_IDirectSoundFullDuplex = LibC::GUID.new(0xedcb4c7a_u32, 0xdaab_u16, 0x4216_u16, StaticArray[0xa4_u8, 0x2e_u8, 0x6c_u8, 0x50_u8, 0x59_u8, 0x6d_u8, 0xdc_u8, 0x1d_u8])
  struct IDirectSoundFullDuplex
    lpVtbl : IDirectSoundFullDuplexVTbl*
  end


  # Params # pcguiddevice : Guid* [In],ppds : IDirectSound* [In],punkouter : IUnknown [In]
  fun DirectSoundCreate(pcguiddevice : Guid*, ppds : IDirectSound*, punkouter : IUnknown) : HRESULT

  # Params # pdsenumcallback : LPDSENUMCALLBACKA [In],pcontext : Void* [In]
  fun DirectSoundEnumerateA(pdsenumcallback : LPDSENUMCALLBACKA, pcontext : Void*) : HRESULT

  # Params # pdsenumcallback : LPDSENUMCALLBACKW [In],pcontext : Void* [In]
  fun DirectSoundEnumerateW(pdsenumcallback : LPDSENUMCALLBACKW, pcontext : Void*) : HRESULT

  # Params # pcguiddevice : Guid* [In],ppdsc : IDirectSoundCapture* [In],punkouter : IUnknown [In]
  fun DirectSoundCaptureCreate(pcguiddevice : Guid*, ppdsc : IDirectSoundCapture*, punkouter : IUnknown) : HRESULT

  # Params # pdsenumcallback : LPDSENUMCALLBACKA [In],pcontext : Void* [In]
  fun DirectSoundCaptureEnumerateA(pdsenumcallback : LPDSENUMCALLBACKA, pcontext : Void*) : HRESULT

  # Params # pdsenumcallback : LPDSENUMCALLBACKW [In],pcontext : Void* [In]
  fun DirectSoundCaptureEnumerateW(pdsenumcallback : LPDSENUMCALLBACKW, pcontext : Void*) : HRESULT

  # Params # pcguiddevice : Guid* [In],ppds8 : IDirectSound8* [In],punkouter : IUnknown [In]
  fun DirectSoundCreate8(pcguiddevice : Guid*, ppds8 : IDirectSound8*, punkouter : IUnknown) : HRESULT

  # Params # pcguiddevice : Guid* [In],ppdsc8 : IDirectSoundCapture* [In],punkouter : IUnknown [In]
  fun DirectSoundCaptureCreate8(pcguiddevice : Guid*, ppdsc8 : IDirectSoundCapture*, punkouter : IUnknown) : HRESULT

  # Params # pcguidcapturedevice : Guid* [In],pcguidrenderdevice : Guid* [In],pcdscbufferdesc : DSCBUFFERDESC* [In],pcdsbufferdesc : DSBUFFERDESC* [In],hwnd : LibC::HANDLE [In],dwlevel : UInt32 [In],ppdsfd : IDirectSoundFullDuplex* [In],ppdscbuffer8 : IDirectSoundCaptureBuffer8* [In],ppdsbuffer8 : IDirectSoundBuffer8* [In],punkouter : IUnknown [In]
  fun DirectSoundFullDuplexCreate(pcguidcapturedevice : Guid*, pcguidrenderdevice : Guid*, pcdscbufferdesc : DSCBUFFERDESC*, pcdsbufferdesc : DSBUFFERDESC*, hwnd : LibC::HANDLE, dwlevel : UInt32, ppdsfd : IDirectSoundFullDuplex*, ppdscbuffer8 : IDirectSoundCaptureBuffer8*, ppdsbuffer8 : IDirectSoundBuffer8*, punkouter : IUnknown) : HRESULT

  # Params # pguidsrc : Guid* [In],pguiddest : Guid* [In]
  fun GetDeviceID(pguidsrc : Guid*, pguiddest : Guid*) : HRESULT
end
struct LibWin32::IDirectSound
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_sound_buffer(pcdsbufferdesc : DSBUFFERDESC*, ppdsbuffer : IDirectSoundBuffer*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_sound_buffer.unsafe_as(Proc(DSBUFFERDESC*, IDirectSoundBuffer*, IUnknown, HRESULT)).call(pcdsbufferdesc, ppdsbuffer, punkouter)
  end
  def get_caps(pdscaps : DSCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSCAPS*, HRESULT)).call(pdscaps)
  end
  def duplicate_sound_buffer(pdsbufferoriginal : IDirectSoundBuffer, ppdsbufferduplicate : IDirectSoundBuffer*) : HRESULT
    @lpVtbl.value.duplicate_sound_buffer.unsafe_as(Proc(IDirectSoundBuffer, IDirectSoundBuffer*, HRESULT)).call(pdsbufferoriginal, ppdsbufferduplicate)
  end
  def set_cooperative_level(hwnd : LibC::HANDLE, dwlevel : UInt32) : HRESULT
    @lpVtbl.value.set_cooperative_level.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hwnd, dwlevel)
  end
  def compact : HRESULT
    @lpVtbl.value.compact.unsafe_as(Proc(HRESULT)).call
  end
  def get_speaker_config(pdwspeakerconfig : UInt32*) : HRESULT
    @lpVtbl.value.get_speaker_config.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwspeakerconfig)
  end
  def set_speaker_config(dwspeakerconfig : UInt32) : HRESULT
    @lpVtbl.value.set_speaker_config.unsafe_as(Proc(UInt32, HRESULT)).call(dwspeakerconfig)
  end
  def initialize(pcguiddevice : Guid*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid*, HRESULT)).call(pcguiddevice)
  end
end
struct LibWin32::IDirectSound8
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_sound_buffer(pcdsbufferdesc : DSBUFFERDESC*, ppdsbuffer : IDirectSoundBuffer*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_sound_buffer.unsafe_as(Proc(DSBUFFERDESC*, IDirectSoundBuffer*, IUnknown, HRESULT)).call(pcdsbufferdesc, ppdsbuffer, punkouter)
  end
  def get_caps(pdscaps : DSCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSCAPS*, HRESULT)).call(pdscaps)
  end
  def duplicate_sound_buffer(pdsbufferoriginal : IDirectSoundBuffer, ppdsbufferduplicate : IDirectSoundBuffer*) : HRESULT
    @lpVtbl.value.duplicate_sound_buffer.unsafe_as(Proc(IDirectSoundBuffer, IDirectSoundBuffer*, HRESULT)).call(pdsbufferoriginal, ppdsbufferduplicate)
  end
  def set_cooperative_level(hwnd : LibC::HANDLE, dwlevel : UInt32) : HRESULT
    @lpVtbl.value.set_cooperative_level.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hwnd, dwlevel)
  end
  def compact : HRESULT
    @lpVtbl.value.compact.unsafe_as(Proc(HRESULT)).call
  end
  def get_speaker_config(pdwspeakerconfig : UInt32*) : HRESULT
    @lpVtbl.value.get_speaker_config.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwspeakerconfig)
  end
  def set_speaker_config(dwspeakerconfig : UInt32) : HRESULT
    @lpVtbl.value.set_speaker_config.unsafe_as(Proc(UInt32, HRESULT)).call(dwspeakerconfig)
  end
  def initialize(pcguiddevice : Guid*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid*, HRESULT)).call(pcguiddevice)
  end
  def verify_certification(pdwcertified : UInt32*) : HRESULT
    @lpVtbl.value.verify_certification.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcertified)
  end
end
struct LibWin32::IDirectSoundBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_caps(pdsbuffercaps : DSBCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSBCAPS*, HRESULT)).call(pdsbuffercaps)
  end
  def get_current_position(pdwcurrentplaycursor : UInt32*, pdwcurrentwritecursor : UInt32*) : HRESULT
    @lpVtbl.value.get_current_position.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcurrentplaycursor, pdwcurrentwritecursor)
  end
  def get_format(pwfxformat : WAVEFORMATEX*, dwsizeallocated : UInt32, pdwsizewritten : UInt32*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(WAVEFORMATEX*, UInt32, UInt32*, HRESULT)).call(pwfxformat, dwsizeallocated, pdwsizewritten)
  end
  def get_volume(plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(Int32*, HRESULT)).call(plvolume)
  end
  def get_pan(plpan : Int32*) : HRESULT
    @lpVtbl.value.get_pan.unsafe_as(Proc(Int32*, HRESULT)).call(plpan)
  end
  def get_frequency(pdwfrequency : UInt32*) : HRESULT
    @lpVtbl.value.get_frequency.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfrequency)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(pdirectsound : IDirectSound, pcdsbufferdesc : DSBUFFERDESC*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IDirectSound, DSBUFFERDESC*, HRESULT)).call(pdirectsound, pcdsbufferdesc)
  end
  def lock(dwoffset : UInt32, dwbytes : UInt32, ppvaudioptr1 : Void**, pdwaudiobytes1 : UInt32*, ppvaudioptr2 : Void**, pdwaudiobytes2 : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.lock.unsafe_as(Proc(UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)).call(dwoffset, dwbytes, ppvaudioptr1, pdwaudiobytes1, ppvaudioptr2, pdwaudiobytes2, dwflags)
  end
  def play(dwreserved1 : UInt32, dwpriority : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.play.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(dwreserved1, dwpriority, dwflags)
  end
  def set_current_position(dwnewposition : UInt32) : HRESULT
    @lpVtbl.value.set_current_position.unsafe_as(Proc(UInt32, HRESULT)).call(dwnewposition)
  end
  def set_format(pcfxformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(WAVEFORMATEX*, HRESULT)).call(pcfxformat)
  end
  def set_volume(lvolume : Int32) : HRESULT
    @lpVtbl.value.set_volume.unsafe_as(Proc(Int32, HRESULT)).call(lvolume)
  end
  def set_pan(lpan : Int32) : HRESULT
    @lpVtbl.value.set_pan.unsafe_as(Proc(Int32, HRESULT)).call(lpan)
  end
  def set_frequency(dwfrequency : UInt32) : HRESULT
    @lpVtbl.value.set_frequency.unsafe_as(Proc(UInt32, HRESULT)).call(dwfrequency)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def unlock(pvaudioptr1 : Void*, dwaudiobytes1 : UInt32, pvaudioptr2 : Void*, dwaudiobytes2 : UInt32) : HRESULT
    @lpVtbl.value.unlock.unsafe_as(Proc(Void*, UInt32, Void*, UInt32, HRESULT)).call(pvaudioptr1, dwaudiobytes1, pvaudioptr2, dwaudiobytes2)
  end
  def restore : HRESULT
    @lpVtbl.value.restore.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectSoundBuffer8
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_caps(pdsbuffercaps : DSBCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSBCAPS*, HRESULT)).call(pdsbuffercaps)
  end
  def get_current_position(pdwcurrentplaycursor : UInt32*, pdwcurrentwritecursor : UInt32*) : HRESULT
    @lpVtbl.value.get_current_position.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcurrentplaycursor, pdwcurrentwritecursor)
  end
  def get_format(pwfxformat : WAVEFORMATEX*, dwsizeallocated : UInt32, pdwsizewritten : UInt32*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(WAVEFORMATEX*, UInt32, UInt32*, HRESULT)).call(pwfxformat, dwsizeallocated, pdwsizewritten)
  end
  def get_volume(plvolume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(Int32*, HRESULT)).call(plvolume)
  end
  def get_pan(plpan : Int32*) : HRESULT
    @lpVtbl.value.get_pan.unsafe_as(Proc(Int32*, HRESULT)).call(plpan)
  end
  def get_frequency(pdwfrequency : UInt32*) : HRESULT
    @lpVtbl.value.get_frequency.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfrequency)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(pdirectsound : IDirectSound, pcdsbufferdesc : DSBUFFERDESC*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IDirectSound, DSBUFFERDESC*, HRESULT)).call(pdirectsound, pcdsbufferdesc)
  end
  def lock(dwoffset : UInt32, dwbytes : UInt32, ppvaudioptr1 : Void**, pdwaudiobytes1 : UInt32*, ppvaudioptr2 : Void**, pdwaudiobytes2 : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.lock.unsafe_as(Proc(UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)).call(dwoffset, dwbytes, ppvaudioptr1, pdwaudiobytes1, ppvaudioptr2, pdwaudiobytes2, dwflags)
  end
  def play(dwreserved1 : UInt32, dwpriority : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.play.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(dwreserved1, dwpriority, dwflags)
  end
  def set_current_position(dwnewposition : UInt32) : HRESULT
    @lpVtbl.value.set_current_position.unsafe_as(Proc(UInt32, HRESULT)).call(dwnewposition)
  end
  def set_format(pcfxformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(WAVEFORMATEX*, HRESULT)).call(pcfxformat)
  end
  def set_volume(lvolume : Int32) : HRESULT
    @lpVtbl.value.set_volume.unsafe_as(Proc(Int32, HRESULT)).call(lvolume)
  end
  def set_pan(lpan : Int32) : HRESULT
    @lpVtbl.value.set_pan.unsafe_as(Proc(Int32, HRESULT)).call(lpan)
  end
  def set_frequency(dwfrequency : UInt32) : HRESULT
    @lpVtbl.value.set_frequency.unsafe_as(Proc(UInt32, HRESULT)).call(dwfrequency)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def unlock(pvaudioptr1 : Void*, dwaudiobytes1 : UInt32, pvaudioptr2 : Void*, dwaudiobytes2 : UInt32) : HRESULT
    @lpVtbl.value.unlock.unsafe_as(Proc(Void*, UInt32, Void*, UInt32, HRESULT)).call(pvaudioptr1, dwaudiobytes1, pvaudioptr2, dwaudiobytes2)
  end
  def restore : HRESULT
    @lpVtbl.value.restore.unsafe_as(Proc(HRESULT)).call
  end
  def set_fx(dweffectscount : UInt32, pdsfxdesc : DSEFFECTDESC*, pdwresultcodes : UInt32*) : HRESULT
    @lpVtbl.value.set_fx.unsafe_as(Proc(UInt32, DSEFFECTDESC*, UInt32*, HRESULT)).call(dweffectscount, pdsfxdesc, pdwresultcodes)
  end
  def acquire_resources(dwflags : UInt32, dweffectscount : UInt32, pdwresultcodes : UInt32*) : HRESULT
    @lpVtbl.value.acquire_resources.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(dwflags, dweffectscount, pdwresultcodes)
  end
  def get_object_in_path(rguidobject : Guid*, dwindex : UInt32, rguidinterface : Guid*, ppobject : Void**) : HRESULT
    @lpVtbl.value.get_object_in_path.unsafe_as(Proc(Guid*, UInt32, Guid*, Void**, HRESULT)).call(rguidobject, dwindex, rguidinterface, ppobject)
  end
end
struct LibWin32::IDirectSound3DListener
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_all_parameters(plistener : DS3DLISTENER*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DS3DLISTENER*, HRESULT)).call(plistener)
  end
  def get_distance_factor(pfldistancefactor : Float32*) : HRESULT
    @lpVtbl.value.get_distance_factor.unsafe_as(Proc(Float32*, HRESULT)).call(pfldistancefactor)
  end
  def get_doppler_factor(pfldopplerfactor : Float32*) : HRESULT
    @lpVtbl.value.get_doppler_factor.unsafe_as(Proc(Float32*, HRESULT)).call(pfldopplerfactor)
  end
  def get_orientation(pvorientfront : D3DVECTOR*, pvorienttop : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_orientation.unsafe_as(Proc(D3DVECTOR*, D3DVECTOR*, HRESULT)).call(pvorientfront, pvorienttop)
  end
  def get_position(pvposition : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_position.unsafe_as(Proc(D3DVECTOR*, HRESULT)).call(pvposition)
  end
  def get_rolloff_factor(pflrollofffactor : Float32*) : HRESULT
    @lpVtbl.value.get_rolloff_factor.unsafe_as(Proc(Float32*, HRESULT)).call(pflrollofffactor)
  end
  def get_velocity(pvvelocity : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_velocity.unsafe_as(Proc(D3DVECTOR*, HRESULT)).call(pvvelocity)
  end
  def set_all_parameters(pclistener : DS3DLISTENER*, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DS3DLISTENER*, UInt32, HRESULT)).call(pclistener, dwapply)
  end
  def set_distance_factor(fldistancefactor : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_distance_factor.unsafe_as(Proc(Float32, UInt32, HRESULT)).call(fldistancefactor, dwapply)
  end
  def set_doppler_factor(fldopplerfactor : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_doppler_factor.unsafe_as(Proc(Float32, UInt32, HRESULT)).call(fldopplerfactor, dwapply)
  end
  def set_orientation(xfront : Float32, yfront : Float32, zfront : Float32, xtop : Float32, ytop : Float32, ztop : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_orientation.unsafe_as(Proc(Float32, Float32, Float32, Float32, Float32, Float32, UInt32, HRESULT)).call(xfront, yfront, zfront, xtop, ytop, ztop, dwapply)
  end
  def set_position(x : Float32, y : Float32, z : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_position.unsafe_as(Proc(Float32, Float32, Float32, UInt32, HRESULT)).call(x, y, z, dwapply)
  end
  def set_rolloff_factor(flrollofffactor : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_rolloff_factor.unsafe_as(Proc(Float32, UInt32, HRESULT)).call(flrollofffactor, dwapply)
  end
  def set_velocity(x : Float32, y : Float32, z : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_velocity.unsafe_as(Proc(Float32, Float32, Float32, UInt32, HRESULT)).call(x, y, z, dwapply)
  end
  def commit_deferred_settings : HRESULT
    @lpVtbl.value.commit_deferred_settings.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectSound3DBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_all_parameters(pds3dbuffer : DS3DBUFFER*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DS3DBUFFER*, HRESULT)).call(pds3dbuffer)
  end
  def get_cone_angles(pdwinsideconeangle : UInt32*, pdwoutsideconeangle : UInt32*) : HRESULT
    @lpVtbl.value.get_cone_angles.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwinsideconeangle, pdwoutsideconeangle)
  end
  def get_cone_orientation(pvorientation : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_cone_orientation.unsafe_as(Proc(D3DVECTOR*, HRESULT)).call(pvorientation)
  end
  def get_cone_outside_volume(plconeoutsidevolume : Int32*) : HRESULT
    @lpVtbl.value.get_cone_outside_volume.unsafe_as(Proc(Int32*, HRESULT)).call(plconeoutsidevolume)
  end
  def get_max_distance(pflmaxdistance : Float32*) : HRESULT
    @lpVtbl.value.get_max_distance.unsafe_as(Proc(Float32*, HRESULT)).call(pflmaxdistance)
  end
  def get_min_distance(pflmindistance : Float32*) : HRESULT
    @lpVtbl.value.get_min_distance.unsafe_as(Proc(Float32*, HRESULT)).call(pflmindistance)
  end
  def get_mode(pdwmode : UInt32*) : HRESULT
    @lpVtbl.value.get_mode.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmode)
  end
  def get_position(pvposition : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_position.unsafe_as(Proc(D3DVECTOR*, HRESULT)).call(pvposition)
  end
  def get_velocity(pvvelocity : D3DVECTOR*) : HRESULT
    @lpVtbl.value.get_velocity.unsafe_as(Proc(D3DVECTOR*, HRESULT)).call(pvvelocity)
  end
  def set_all_parameters(pcds3dbuffer : DS3DBUFFER*, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DS3DBUFFER*, UInt32, HRESULT)).call(pcds3dbuffer, dwapply)
  end
  def set_cone_angles(dwinsideconeangle : UInt32, dwoutsideconeangle : UInt32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_cone_angles.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(dwinsideconeangle, dwoutsideconeangle, dwapply)
  end
  def set_cone_orientation(x : Float32, y : Float32, z : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_cone_orientation.unsafe_as(Proc(Float32, Float32, Float32, UInt32, HRESULT)).call(x, y, z, dwapply)
  end
  def set_cone_outside_volume(lconeoutsidevolume : Int32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_cone_outside_volume.unsafe_as(Proc(Int32, UInt32, HRESULT)).call(lconeoutsidevolume, dwapply)
  end
  def set_max_distance(flmaxdistance : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_max_distance.unsafe_as(Proc(Float32, UInt32, HRESULT)).call(flmaxdistance, dwapply)
  end
  def set_min_distance(flmindistance : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_min_distance.unsafe_as(Proc(Float32, UInt32, HRESULT)).call(flmindistance, dwapply)
  end
  def set_mode(dwmode : UInt32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_mode.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwmode, dwapply)
  end
  def set_position(x : Float32, y : Float32, z : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_position.unsafe_as(Proc(Float32, Float32, Float32, UInt32, HRESULT)).call(x, y, z, dwapply)
  end
  def set_velocity(x : Float32, y : Float32, z : Float32, dwapply : UInt32) : HRESULT
    @lpVtbl.value.set_velocity.unsafe_as(Proc(Float32, Float32, Float32, UInt32, HRESULT)).call(x, y, z, dwapply)
  end
end
struct LibWin32::IDirectSoundCapture
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_capture_buffer(pcdscbufferdesc : DSCBUFFERDESC*, ppdscbuffer : IDirectSoundCaptureBuffer*, punkouter : IUnknown) : HRESULT
    @lpVtbl.value.create_capture_buffer.unsafe_as(Proc(DSCBUFFERDESC*, IDirectSoundCaptureBuffer*, IUnknown, HRESULT)).call(pcdscbufferdesc, ppdscbuffer, punkouter)
  end
  def get_caps(pdsccaps : DSCCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSCCAPS*, HRESULT)).call(pdsccaps)
  end
  def initialize(pcguiddevice : Guid*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid*, HRESULT)).call(pcguiddevice)
  end
end
struct LibWin32::IDirectSoundCaptureBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_caps(pdscbcaps : DSCBCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSCBCAPS*, HRESULT)).call(pdscbcaps)
  end
  def get_current_position(pdwcaptureposition : UInt32*, pdwreadposition : UInt32*) : HRESULT
    @lpVtbl.value.get_current_position.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcaptureposition, pdwreadposition)
  end
  def get_format(pwfxformat : WAVEFORMATEX*, dwsizeallocated : UInt32, pdwsizewritten : UInt32*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(WAVEFORMATEX*, UInt32, UInt32*, HRESULT)).call(pwfxformat, dwsizeallocated, pdwsizewritten)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(pdirectsoundcapture : IDirectSoundCapture, pcdscbufferdesc : DSCBUFFERDESC*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IDirectSoundCapture, DSCBUFFERDESC*, HRESULT)).call(pdirectsoundcapture, pcdscbufferdesc)
  end
  def lock(dwoffset : UInt32, dwbytes : UInt32, ppvaudioptr1 : Void**, pdwaudiobytes1 : UInt32*, ppvaudioptr2 : Void**, pdwaudiobytes2 : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.lock.unsafe_as(Proc(UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)).call(dwoffset, dwbytes, ppvaudioptr1, pdwaudiobytes1, ppvaudioptr2, pdwaudiobytes2, dwflags)
  end
  def start(dwflags : UInt32) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def unlock(pvaudioptr1 : Void*, dwaudiobytes1 : UInt32, pvaudioptr2 : Void*, dwaudiobytes2 : UInt32) : HRESULT
    @lpVtbl.value.unlock.unsafe_as(Proc(Void*, UInt32, Void*, UInt32, HRESULT)).call(pvaudioptr1, dwaudiobytes1, pvaudioptr2, dwaudiobytes2)
  end
end
struct LibWin32::IDirectSoundCaptureBuffer8
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_caps(pdscbcaps : DSCBCAPS*) : HRESULT
    @lpVtbl.value.get_caps.unsafe_as(Proc(DSCBCAPS*, HRESULT)).call(pdscbcaps)
  end
  def get_current_position(pdwcaptureposition : UInt32*, pdwreadposition : UInt32*) : HRESULT
    @lpVtbl.value.get_current_position.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcaptureposition, pdwreadposition)
  end
  def get_format(pwfxformat : WAVEFORMATEX*, dwsizeallocated : UInt32, pdwsizewritten : UInt32*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(WAVEFORMATEX*, UInt32, UInt32*, HRESULT)).call(pwfxformat, dwsizeallocated, pdwsizewritten)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(pdirectsoundcapture : IDirectSoundCapture, pcdscbufferdesc : DSCBUFFERDESC*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IDirectSoundCapture, DSCBUFFERDESC*, HRESULT)).call(pdirectsoundcapture, pcdscbufferdesc)
  end
  def lock(dwoffset : UInt32, dwbytes : UInt32, ppvaudioptr1 : Void**, pdwaudiobytes1 : UInt32*, ppvaudioptr2 : Void**, pdwaudiobytes2 : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.lock.unsafe_as(Proc(UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)).call(dwoffset, dwbytes, ppvaudioptr1, pdwaudiobytes1, ppvaudioptr2, pdwaudiobytes2, dwflags)
  end
  def start(dwflags : UInt32) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def unlock(pvaudioptr1 : Void*, dwaudiobytes1 : UInt32, pvaudioptr2 : Void*, dwaudiobytes2 : UInt32) : HRESULT
    @lpVtbl.value.unlock.unsafe_as(Proc(Void*, UInt32, Void*, UInt32, HRESULT)).call(pvaudioptr1, dwaudiobytes1, pvaudioptr2, dwaudiobytes2)
  end
  def get_object_in_path(rguidobject : Guid*, dwindex : UInt32, rguidinterface : Guid*, ppobject : Void**) : HRESULT
    @lpVtbl.value.get_object_in_path.unsafe_as(Proc(Guid*, UInt32, Guid*, Void**, HRESULT)).call(rguidobject, dwindex, rguidinterface, ppobject)
  end
  def get_fx_status(dweffectscount : UInt32, pdwfxstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_fx_status.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dweffectscount, pdwfxstatus)
  end
end
struct LibWin32::IDirectSoundNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notification_positions(dwpositionnotifies : UInt32, pcpositionnotifies : DSBPOSITIONNOTIFY*) : HRESULT
    @lpVtbl.value.set_notification_positions.unsafe_as(Proc(UInt32, DSBPOSITIONNOTIFY*, HRESULT)).call(dwpositionnotifies, pcpositionnotifies)
  end
end
struct LibWin32::IDirectSoundFXGargle
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxgargle : DSFXGargle*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXGargle*, HRESULT)).call(pcdsfxgargle)
  end
  def get_all_parameters(pdsfxgargle : DSFXGargle*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXGargle*, HRESULT)).call(pdsfxgargle)
  end
end
struct LibWin32::IDirectSoundFXChorus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxchorus : DSFXChorus*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXChorus*, HRESULT)).call(pcdsfxchorus)
  end
  def get_all_parameters(pdsfxchorus : DSFXChorus*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXChorus*, HRESULT)).call(pdsfxchorus)
  end
end
struct LibWin32::IDirectSoundFXFlanger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxflanger : DSFXFlanger*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXFlanger*, HRESULT)).call(pcdsfxflanger)
  end
  def get_all_parameters(pdsfxflanger : DSFXFlanger*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXFlanger*, HRESULT)).call(pdsfxflanger)
  end
end
struct LibWin32::IDirectSoundFXEcho
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxecho : DSFXEcho*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXEcho*, HRESULT)).call(pcdsfxecho)
  end
  def get_all_parameters(pdsfxecho : DSFXEcho*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXEcho*, HRESULT)).call(pdsfxecho)
  end
end
struct LibWin32::IDirectSoundFXDistortion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxdistortion : DSFXDistortion*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXDistortion*, HRESULT)).call(pcdsfxdistortion)
  end
  def get_all_parameters(pdsfxdistortion : DSFXDistortion*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXDistortion*, HRESULT)).call(pdsfxdistortion)
  end
end
struct LibWin32::IDirectSoundFXCompressor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxcompressor : DSFXCompressor*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXCompressor*, HRESULT)).call(pcdsfxcompressor)
  end
  def get_all_parameters(pdsfxcompressor : DSFXCompressor*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXCompressor*, HRESULT)).call(pdsfxcompressor)
  end
end
struct LibWin32::IDirectSoundFXParamEq
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxparameq : DSFXParamEq*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXParamEq*, HRESULT)).call(pcdsfxparameq)
  end
  def get_all_parameters(pdsfxparameq : DSFXParamEq*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXParamEq*, HRESULT)).call(pdsfxparameq)
  end
end
struct LibWin32::IDirectSoundFXI3DL2Reverb
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxi3dl2reverb : DSFXI3DL2Reverb*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXI3DL2Reverb*, HRESULT)).call(pcdsfxi3dl2reverb)
  end
  def get_all_parameters(pdsfxi3dl2reverb : DSFXI3DL2Reverb*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXI3DL2Reverb*, HRESULT)).call(pdsfxi3dl2reverb)
  end
  def set_preset(dwpreset : UInt32) : HRESULT
    @lpVtbl.value.set_preset.unsafe_as(Proc(UInt32, HRESULT)).call(dwpreset)
  end
  def get_preset(pdwpreset : UInt32*) : HRESULT
    @lpVtbl.value.get_preset.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpreset)
  end
  def set_quality(lquality : Int32) : HRESULT
    @lpVtbl.value.set_quality.unsafe_as(Proc(Int32, HRESULT)).call(lquality)
  end
  def get_quality(plquality : Int32*) : HRESULT
    @lpVtbl.value.get_quality.unsafe_as(Proc(Int32*, HRESULT)).call(plquality)
  end
end
struct LibWin32::IDirectSoundFXWavesReverb
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdsfxwavesreverb : DSFXWavesReverb*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSFXWavesReverb*, HRESULT)).call(pcdsfxwavesreverb)
  end
  def get_all_parameters(pdsfxwavesreverb : DSFXWavesReverb*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSFXWavesReverb*, HRESULT)).call(pdsfxwavesreverb)
  end
end
struct LibWin32::IDirectSoundCaptureFXAec
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pdscfxaec : DSCFXAec*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSCFXAec*, HRESULT)).call(pdscfxaec)
  end
  def get_all_parameters(pdscfxaec : DSCFXAec*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSCFXAec*, HRESULT)).call(pdscfxaec)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectSoundCaptureFXNoiseSuppress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_all_parameters(pcdscfxnoisesuppress : DSCFXNoiseSuppress*) : HRESULT
    @lpVtbl.value.set_all_parameters.unsafe_as(Proc(DSCFXNoiseSuppress*, HRESULT)).call(pcdscfxnoisesuppress)
  end
  def get_all_parameters(pdscfxnoisesuppress : DSCFXNoiseSuppress*) : HRESULT
    @lpVtbl.value.get_all_parameters.unsafe_as(Proc(DSCFXNoiseSuppress*, HRESULT)).call(pdscfxnoisesuppress)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectSoundFullDuplex
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pcaptureguid : Guid*, prenderguid : Guid*, lpdscbufferdesc : DSCBUFFERDESC*, lpdsbufferdesc : DSBUFFERDESC*, hwnd : LibC::HANDLE, dwlevel : UInt32, lplpdirectsoundcapturebuffer8 : IDirectSoundCaptureBuffer8*, lplpdirectsoundbuffer8 : IDirectSoundBuffer8*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid*, Guid*, DSCBUFFERDESC*, DSBUFFERDESC*, LibC::HANDLE, UInt32, IDirectSoundCaptureBuffer8*, IDirectSoundBuffer8*, HRESULT)).call(pcaptureguid, prenderguid, lpdscbufferdesc, lpdsbufferdesc, hwnd, dwlevel, lplpdirectsoundcapturebuffer8, lplpdirectsoundbuffer8)
  end
end
