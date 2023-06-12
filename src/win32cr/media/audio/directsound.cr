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
    query_interface : Proc(IDirectSound*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSound*, UInt32)
    release : Proc(IDirectSound*, UInt32)
    create_sound_buffer : Proc(IDirectSound*, DSBUFFERDESC*, IDirectSoundBuffer*, IUnknown, HRESULT)
    get_caps : Proc(IDirectSound*, DSCAPS*, HRESULT)
    duplicate_sound_buffer : Proc(IDirectSound*, IDirectSoundBuffer, IDirectSoundBuffer*, HRESULT)
    set_cooperative_level : Proc(IDirectSound*, LibC::HANDLE, UInt32, HRESULT)
    compact : Proc(IDirectSound*, HRESULT)
    get_speaker_config : Proc(IDirectSound*, UInt32*, HRESULT)
    set_speaker_config : Proc(IDirectSound*, UInt32, HRESULT)
    initialize : Proc(IDirectSound*, Guid*, HRESULT)
  end

  IDirectSound_GUID = LibC::GUID.new("279afa83-4981-11ce-a521-0020af0be560")
  CLSID_IDirectSound = "279afa83-4981-11ce-a521-0020af0be560"
  struct IDirectSound
    lpVtbl : IDirectSoundVTbl*
  end

  struct IDirectSound8VTbl
    query_interface : Proc(IDirectSound8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSound8*, UInt32)
    release : Proc(IDirectSound8*, UInt32)
    create_sound_buffer : Proc(IDirectSound8*, DSBUFFERDESC*, IDirectSoundBuffer*, IUnknown, HRESULT)
    get_caps : Proc(IDirectSound8*, DSCAPS*, HRESULT)
    duplicate_sound_buffer : Proc(IDirectSound8*, IDirectSoundBuffer, IDirectSoundBuffer*, HRESULT)
    set_cooperative_level : Proc(IDirectSound8*, LibC::HANDLE, UInt32, HRESULT)
    compact : Proc(IDirectSound8*, HRESULT)
    get_speaker_config : Proc(IDirectSound8*, UInt32*, HRESULT)
    set_speaker_config : Proc(IDirectSound8*, UInt32, HRESULT)
    initialize : Proc(IDirectSound8*, Guid*, HRESULT)
    verify_certification : Proc(IDirectSound8*, UInt32*, HRESULT)
  end

  IDirectSound8_GUID = LibC::GUID.new("c50a7e93-f395-4834-9ef6-7fa99de50966")
  CLSID_IDirectSound8 = "c50a7e93-f395-4834-9ef6-7fa99de50966"
  struct IDirectSound8
    lpVtbl : IDirectSound8VTbl*
  end

  struct IDirectSoundBufferVTbl
    query_interface : Proc(IDirectSoundBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundBuffer*, UInt32)
    release : Proc(IDirectSoundBuffer*, UInt32)
    get_caps : Proc(IDirectSoundBuffer*, DSBCAPS*, HRESULT)
    get_current_position : Proc(IDirectSoundBuffer*, UInt32*, UInt32*, HRESULT)
    get_format : Proc(IDirectSoundBuffer*, WAVEFORMATEX*, UInt32, UInt32*, HRESULT)
    get_volume : Proc(IDirectSoundBuffer*, Int32*, HRESULT)
    get_pan : Proc(IDirectSoundBuffer*, Int32*, HRESULT)
    get_frequency : Proc(IDirectSoundBuffer*, UInt32*, HRESULT)
    get_status : Proc(IDirectSoundBuffer*, UInt32*, HRESULT)
    initialize : Proc(IDirectSoundBuffer*, IDirectSound, DSBUFFERDESC*, HRESULT)
    lock : Proc(IDirectSoundBuffer*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)
    play : Proc(IDirectSoundBuffer*, UInt32, UInt32, UInt32, HRESULT)
    set_current_position : Proc(IDirectSoundBuffer*, UInt32, HRESULT)
    set_format : Proc(IDirectSoundBuffer*, WAVEFORMATEX*, HRESULT)
    set_volume : Proc(IDirectSoundBuffer*, Int32, HRESULT)
    set_pan : Proc(IDirectSoundBuffer*, Int32, HRESULT)
    set_frequency : Proc(IDirectSoundBuffer*, UInt32, HRESULT)
    stop : Proc(IDirectSoundBuffer*, HRESULT)
    unlock : Proc(IDirectSoundBuffer*, Void*, UInt32, Void*, UInt32, HRESULT)
    restore : Proc(IDirectSoundBuffer*, HRESULT)
  end

  IDirectSoundBuffer_GUID = LibC::GUID.new("279afa85-4981-11ce-a521-0020af0be560")
  CLSID_IDirectSoundBuffer = "279afa85-4981-11ce-a521-0020af0be560"
  struct IDirectSoundBuffer
    lpVtbl : IDirectSoundBufferVTbl*
  end

  struct IDirectSoundBuffer8VTbl
    query_interface : Proc(IDirectSoundBuffer8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundBuffer8*, UInt32)
    release : Proc(IDirectSoundBuffer8*, UInt32)
    get_caps : Proc(IDirectSoundBuffer8*, DSBCAPS*, HRESULT)
    get_current_position : Proc(IDirectSoundBuffer8*, UInt32*, UInt32*, HRESULT)
    get_format : Proc(IDirectSoundBuffer8*, WAVEFORMATEX*, UInt32, UInt32*, HRESULT)
    get_volume : Proc(IDirectSoundBuffer8*, Int32*, HRESULT)
    get_pan : Proc(IDirectSoundBuffer8*, Int32*, HRESULT)
    get_frequency : Proc(IDirectSoundBuffer8*, UInt32*, HRESULT)
    get_status : Proc(IDirectSoundBuffer8*, UInt32*, HRESULT)
    initialize : Proc(IDirectSoundBuffer8*, IDirectSound, DSBUFFERDESC*, HRESULT)
    lock : Proc(IDirectSoundBuffer8*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)
    play : Proc(IDirectSoundBuffer8*, UInt32, UInt32, UInt32, HRESULT)
    set_current_position : Proc(IDirectSoundBuffer8*, UInt32, HRESULT)
    set_format : Proc(IDirectSoundBuffer8*, WAVEFORMATEX*, HRESULT)
    set_volume : Proc(IDirectSoundBuffer8*, Int32, HRESULT)
    set_pan : Proc(IDirectSoundBuffer8*, Int32, HRESULT)
    set_frequency : Proc(IDirectSoundBuffer8*, UInt32, HRESULT)
    stop : Proc(IDirectSoundBuffer8*, HRESULT)
    unlock : Proc(IDirectSoundBuffer8*, Void*, UInt32, Void*, UInt32, HRESULT)
    restore : Proc(IDirectSoundBuffer8*, HRESULT)
    set_fx : Proc(IDirectSoundBuffer8*, UInt32, DSEFFECTDESC*, UInt32*, HRESULT)
    acquire_resources : Proc(IDirectSoundBuffer8*, UInt32, UInt32, UInt32*, HRESULT)
    get_object_in_path : Proc(IDirectSoundBuffer8*, Guid*, UInt32, Guid*, Void**, HRESULT)
  end

  IDirectSoundBuffer8_GUID = LibC::GUID.new("6825a449-7524-4d82-920f-50e36ab3ab1e")
  CLSID_IDirectSoundBuffer8 = "6825a449-7524-4d82-920f-50e36ab3ab1e"
  struct IDirectSoundBuffer8
    lpVtbl : IDirectSoundBuffer8VTbl*
  end

  struct IDirectSound3DListenerVTbl
    query_interface : Proc(IDirectSound3DListener*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSound3DListener*, UInt32)
    release : Proc(IDirectSound3DListener*, UInt32)
    get_all_parameters : Proc(IDirectSound3DListener*, DS3DLISTENER*, HRESULT)
    get_distance_factor : Proc(IDirectSound3DListener*, Float32*, HRESULT)
    get_doppler_factor : Proc(IDirectSound3DListener*, Float32*, HRESULT)
    get_orientation : Proc(IDirectSound3DListener*, D3DVECTOR*, D3DVECTOR*, HRESULT)
    get_position : Proc(IDirectSound3DListener*, D3DVECTOR*, HRESULT)
    get_rolloff_factor : Proc(IDirectSound3DListener*, Float32*, HRESULT)
    get_velocity : Proc(IDirectSound3DListener*, D3DVECTOR*, HRESULT)
    set_all_parameters : Proc(IDirectSound3DListener*, DS3DLISTENER*, UInt32, HRESULT)
    set_distance_factor : Proc(IDirectSound3DListener*, Float32, UInt32, HRESULT)
    set_doppler_factor : Proc(IDirectSound3DListener*, Float32, UInt32, HRESULT)
    set_orientation : Proc(IDirectSound3DListener*, Float32, Float32, Float32, Float32, Float32, Float32, UInt32, HRESULT)
    set_position : Proc(IDirectSound3DListener*, Float32, Float32, Float32, UInt32, HRESULT)
    set_rolloff_factor : Proc(IDirectSound3DListener*, Float32, UInt32, HRESULT)
    set_velocity : Proc(IDirectSound3DListener*, Float32, Float32, Float32, UInt32, HRESULT)
    commit_deferred_settings : Proc(IDirectSound3DListener*, HRESULT)
  end

  IDirectSound3DListener_GUID = LibC::GUID.new("279afa84-4981-11ce-a521-0020af0be560")
  CLSID_IDirectSound3DListener = "279afa84-4981-11ce-a521-0020af0be560"
  struct IDirectSound3DListener
    lpVtbl : IDirectSound3DListenerVTbl*
  end

  struct IDirectSound3DBufferVTbl
    query_interface : Proc(IDirectSound3DBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSound3DBuffer*, UInt32)
    release : Proc(IDirectSound3DBuffer*, UInt32)
    get_all_parameters : Proc(IDirectSound3DBuffer*, DS3DBUFFER*, HRESULT)
    get_cone_angles : Proc(IDirectSound3DBuffer*, UInt32*, UInt32*, HRESULT)
    get_cone_orientation : Proc(IDirectSound3DBuffer*, D3DVECTOR*, HRESULT)
    get_cone_outside_volume : Proc(IDirectSound3DBuffer*, Int32*, HRESULT)
    get_max_distance : Proc(IDirectSound3DBuffer*, Float32*, HRESULT)
    get_min_distance : Proc(IDirectSound3DBuffer*, Float32*, HRESULT)
    get_mode : Proc(IDirectSound3DBuffer*, UInt32*, HRESULT)
    get_position : Proc(IDirectSound3DBuffer*, D3DVECTOR*, HRESULT)
    get_velocity : Proc(IDirectSound3DBuffer*, D3DVECTOR*, HRESULT)
    set_all_parameters : Proc(IDirectSound3DBuffer*, DS3DBUFFER*, UInt32, HRESULT)
    set_cone_angles : Proc(IDirectSound3DBuffer*, UInt32, UInt32, UInt32, HRESULT)
    set_cone_orientation : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, HRESULT)
    set_cone_outside_volume : Proc(IDirectSound3DBuffer*, Int32, UInt32, HRESULT)
    set_max_distance : Proc(IDirectSound3DBuffer*, Float32, UInt32, HRESULT)
    set_min_distance : Proc(IDirectSound3DBuffer*, Float32, UInt32, HRESULT)
    set_mode : Proc(IDirectSound3DBuffer*, UInt32, UInt32, HRESULT)
    set_position : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, HRESULT)
    set_velocity : Proc(IDirectSound3DBuffer*, Float32, Float32, Float32, UInt32, HRESULT)
  end

  IDirectSound3DBuffer_GUID = LibC::GUID.new("279afa86-4981-11ce-a521-0020af0be560")
  CLSID_IDirectSound3DBuffer = "279afa86-4981-11ce-a521-0020af0be560"
  struct IDirectSound3DBuffer
    lpVtbl : IDirectSound3DBufferVTbl*
  end

  struct IDirectSoundCaptureVTbl
    query_interface : Proc(IDirectSoundCapture*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundCapture*, UInt32)
    release : Proc(IDirectSoundCapture*, UInt32)
    create_capture_buffer : Proc(IDirectSoundCapture*, DSCBUFFERDESC*, IDirectSoundCaptureBuffer*, IUnknown, HRESULT)
    get_caps : Proc(IDirectSoundCapture*, DSCCAPS*, HRESULT)
    initialize : Proc(IDirectSoundCapture*, Guid*, HRESULT)
  end

  IDirectSoundCapture_GUID = LibC::GUID.new("b0210781-89cd-11d0-af08-00a0c925cd16")
  CLSID_IDirectSoundCapture = "b0210781-89cd-11d0-af08-00a0c925cd16"
  struct IDirectSoundCapture
    lpVtbl : IDirectSoundCaptureVTbl*
  end

  struct IDirectSoundCaptureBufferVTbl
    query_interface : Proc(IDirectSoundCaptureBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundCaptureBuffer*, UInt32)
    release : Proc(IDirectSoundCaptureBuffer*, UInt32)
    get_caps : Proc(IDirectSoundCaptureBuffer*, DSCBCAPS*, HRESULT)
    get_current_position : Proc(IDirectSoundCaptureBuffer*, UInt32*, UInt32*, HRESULT)
    get_format : Proc(IDirectSoundCaptureBuffer*, WAVEFORMATEX*, UInt32, UInt32*, HRESULT)
    get_status : Proc(IDirectSoundCaptureBuffer*, UInt32*, HRESULT)
    initialize : Proc(IDirectSoundCaptureBuffer*, IDirectSoundCapture, DSCBUFFERDESC*, HRESULT)
    lock : Proc(IDirectSoundCaptureBuffer*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)
    start : Proc(IDirectSoundCaptureBuffer*, UInt32, HRESULT)
    stop : Proc(IDirectSoundCaptureBuffer*, HRESULT)
    unlock : Proc(IDirectSoundCaptureBuffer*, Void*, UInt32, Void*, UInt32, HRESULT)
  end

  IDirectSoundCaptureBuffer_GUID = LibC::GUID.new("b0210782-89cd-11d0-af08-00a0c925cd16")
  CLSID_IDirectSoundCaptureBuffer = "b0210782-89cd-11d0-af08-00a0c925cd16"
  struct IDirectSoundCaptureBuffer
    lpVtbl : IDirectSoundCaptureBufferVTbl*
  end

  struct IDirectSoundCaptureBuffer8VTbl
    query_interface : Proc(IDirectSoundCaptureBuffer8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundCaptureBuffer8*, UInt32)
    release : Proc(IDirectSoundCaptureBuffer8*, UInt32)
    get_caps : Proc(IDirectSoundCaptureBuffer8*, DSCBCAPS*, HRESULT)
    get_current_position : Proc(IDirectSoundCaptureBuffer8*, UInt32*, UInt32*, HRESULT)
    get_format : Proc(IDirectSoundCaptureBuffer8*, WAVEFORMATEX*, UInt32, UInt32*, HRESULT)
    get_status : Proc(IDirectSoundCaptureBuffer8*, UInt32*, HRESULT)
    initialize : Proc(IDirectSoundCaptureBuffer8*, IDirectSoundCapture, DSCBUFFERDESC*, HRESULT)
    lock : Proc(IDirectSoundCaptureBuffer8*, UInt32, UInt32, Void**, UInt32*, Void**, UInt32*, UInt32, HRESULT)
    start : Proc(IDirectSoundCaptureBuffer8*, UInt32, HRESULT)
    stop : Proc(IDirectSoundCaptureBuffer8*, HRESULT)
    unlock : Proc(IDirectSoundCaptureBuffer8*, Void*, UInt32, Void*, UInt32, HRESULT)
    get_object_in_path : Proc(IDirectSoundCaptureBuffer8*, Guid*, UInt32, Guid*, Void**, HRESULT)
    get_fx_status : Proc(IDirectSoundCaptureBuffer8*, UInt32, UInt32*, HRESULT)
  end

  IDirectSoundCaptureBuffer8_GUID = LibC::GUID.new("00990df4-0dbb-4872-833e-6d303e80aeb6")
  CLSID_IDirectSoundCaptureBuffer8 = "00990df4-0dbb-4872-833e-6d303e80aeb6"
  struct IDirectSoundCaptureBuffer8
    lpVtbl : IDirectSoundCaptureBuffer8VTbl*
  end

  struct IDirectSoundNotifyVTbl
    query_interface : Proc(IDirectSoundNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundNotify*, UInt32)
    release : Proc(IDirectSoundNotify*, UInt32)
    set_notification_positions : Proc(IDirectSoundNotify*, UInt32, DSBPOSITIONNOTIFY*, HRESULT)
  end

  IDirectSoundNotify_GUID = LibC::GUID.new("b0210783-89cd-11d0-af08-00a0c925cd16")
  CLSID_IDirectSoundNotify = "b0210783-89cd-11d0-af08-00a0c925cd16"
  struct IDirectSoundNotify
    lpVtbl : IDirectSoundNotifyVTbl*
  end

  struct IDirectSoundFXGargleVTbl
    query_interface : Proc(IDirectSoundFXGargle*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXGargle*, UInt32)
    release : Proc(IDirectSoundFXGargle*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXGargle*, DSFXGargle*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXGargle*, DSFXGargle*, HRESULT)
  end

  IDirectSoundFXGargle_GUID = LibC::GUID.new("d616f352-d622-11ce-aac5-0020af0b99a3")
  CLSID_IDirectSoundFXGargle = "d616f352-d622-11ce-aac5-0020af0b99a3"
  struct IDirectSoundFXGargle
    lpVtbl : IDirectSoundFXGargleVTbl*
  end

  struct IDirectSoundFXChorusVTbl
    query_interface : Proc(IDirectSoundFXChorus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXChorus*, UInt32)
    release : Proc(IDirectSoundFXChorus*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXChorus*, DSFXChorus*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXChorus*, DSFXChorus*, HRESULT)
  end

  IDirectSoundFXChorus_GUID = LibC::GUID.new("880842e3-145f-43e6-a934-a71806e50547")
  CLSID_IDirectSoundFXChorus = "880842e3-145f-43e6-a934-a71806e50547"
  struct IDirectSoundFXChorus
    lpVtbl : IDirectSoundFXChorusVTbl*
  end

  struct IDirectSoundFXFlangerVTbl
    query_interface : Proc(IDirectSoundFXFlanger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXFlanger*, UInt32)
    release : Proc(IDirectSoundFXFlanger*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXFlanger*, DSFXFlanger*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXFlanger*, DSFXFlanger*, HRESULT)
  end

  IDirectSoundFXFlanger_GUID = LibC::GUID.new("903e9878-2c92-4072-9b2c-ea68f5396783")
  CLSID_IDirectSoundFXFlanger = "903e9878-2c92-4072-9b2c-ea68f5396783"
  struct IDirectSoundFXFlanger
    lpVtbl : IDirectSoundFXFlangerVTbl*
  end

  struct IDirectSoundFXEchoVTbl
    query_interface : Proc(IDirectSoundFXEcho*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXEcho*, UInt32)
    release : Proc(IDirectSoundFXEcho*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXEcho*, DSFXEcho*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXEcho*, DSFXEcho*, HRESULT)
  end

  IDirectSoundFXEcho_GUID = LibC::GUID.new("8bd28edf-50db-4e92-a2bd-445488d1ed42")
  CLSID_IDirectSoundFXEcho = "8bd28edf-50db-4e92-a2bd-445488d1ed42"
  struct IDirectSoundFXEcho
    lpVtbl : IDirectSoundFXEchoVTbl*
  end

  struct IDirectSoundFXDistortionVTbl
    query_interface : Proc(IDirectSoundFXDistortion*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXDistortion*, UInt32)
    release : Proc(IDirectSoundFXDistortion*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXDistortion*, DSFXDistortion*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXDistortion*, DSFXDistortion*, HRESULT)
  end

  IDirectSoundFXDistortion_GUID = LibC::GUID.new("8ecf4326-455f-4d8b-bda9-8d5d3e9e3e0b")
  CLSID_IDirectSoundFXDistortion = "8ecf4326-455f-4d8b-bda9-8d5d3e9e3e0b"
  struct IDirectSoundFXDistortion
    lpVtbl : IDirectSoundFXDistortionVTbl*
  end

  struct IDirectSoundFXCompressorVTbl
    query_interface : Proc(IDirectSoundFXCompressor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXCompressor*, UInt32)
    release : Proc(IDirectSoundFXCompressor*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXCompressor*, DSFXCompressor*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXCompressor*, DSFXCompressor*, HRESULT)
  end

  IDirectSoundFXCompressor_GUID = LibC::GUID.new("4bbd1154-62f6-4e2c-a15c-d3b6c417f7a0")
  CLSID_IDirectSoundFXCompressor = "4bbd1154-62f6-4e2c-a15c-d3b6c417f7a0"
  struct IDirectSoundFXCompressor
    lpVtbl : IDirectSoundFXCompressorVTbl*
  end

  struct IDirectSoundFXParamEqVTbl
    query_interface : Proc(IDirectSoundFXParamEq*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXParamEq*, UInt32)
    release : Proc(IDirectSoundFXParamEq*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXParamEq*, DSFXParamEq*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXParamEq*, DSFXParamEq*, HRESULT)
  end

  IDirectSoundFXParamEq_GUID = LibC::GUID.new("c03ca9fe-fe90-4204-8078-82334cd177da")
  CLSID_IDirectSoundFXParamEq = "c03ca9fe-fe90-4204-8078-82334cd177da"
  struct IDirectSoundFXParamEq
    lpVtbl : IDirectSoundFXParamEqVTbl*
  end

  struct IDirectSoundFXI3DL2ReverbVTbl
    query_interface : Proc(IDirectSoundFXI3DL2Reverb*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXI3DL2Reverb*, UInt32)
    release : Proc(IDirectSoundFXI3DL2Reverb*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXI3DL2Reverb*, DSFXI3DL2Reverb*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXI3DL2Reverb*, DSFXI3DL2Reverb*, HRESULT)
    set_preset : Proc(IDirectSoundFXI3DL2Reverb*, UInt32, HRESULT)
    get_preset : Proc(IDirectSoundFXI3DL2Reverb*, UInt32*, HRESULT)
    set_quality : Proc(IDirectSoundFXI3DL2Reverb*, Int32, HRESULT)
    get_quality : Proc(IDirectSoundFXI3DL2Reverb*, Int32*, HRESULT)
  end

  IDirectSoundFXI3DL2Reverb_GUID = LibC::GUID.new("4b166a6a-0d66-43f3-80e3-ee6280dee1a4")
  CLSID_IDirectSoundFXI3DL2Reverb = "4b166a6a-0d66-43f3-80e3-ee6280dee1a4"
  struct IDirectSoundFXI3DL2Reverb
    lpVtbl : IDirectSoundFXI3DL2ReverbVTbl*
  end

  struct IDirectSoundFXWavesReverbVTbl
    query_interface : Proc(IDirectSoundFXWavesReverb*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFXWavesReverb*, UInt32)
    release : Proc(IDirectSoundFXWavesReverb*, UInt32)
    set_all_parameters : Proc(IDirectSoundFXWavesReverb*, DSFXWavesReverb*, HRESULT)
    get_all_parameters : Proc(IDirectSoundFXWavesReverb*, DSFXWavesReverb*, HRESULT)
  end

  IDirectSoundFXWavesReverb_GUID = LibC::GUID.new("46858c3a-0dc6-45e3-b760-d4eef16cb325")
  CLSID_IDirectSoundFXWavesReverb = "46858c3a-0dc6-45e3-b760-d4eef16cb325"
  struct IDirectSoundFXWavesReverb
    lpVtbl : IDirectSoundFXWavesReverbVTbl*
  end

  struct IDirectSoundCaptureFXAecVTbl
    query_interface : Proc(IDirectSoundCaptureFXAec*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundCaptureFXAec*, UInt32)
    release : Proc(IDirectSoundCaptureFXAec*, UInt32)
    set_all_parameters : Proc(IDirectSoundCaptureFXAec*, DSCFXAec*, HRESULT)
    get_all_parameters : Proc(IDirectSoundCaptureFXAec*, DSCFXAec*, HRESULT)
    get_status : Proc(IDirectSoundCaptureFXAec*, UInt32*, HRESULT)
    reset : Proc(IDirectSoundCaptureFXAec*, HRESULT)
  end

  IDirectSoundCaptureFXAec_GUID = LibC::GUID.new("ad74143d-903d-4ab7-8066-28d363036d65")
  CLSID_IDirectSoundCaptureFXAec = "ad74143d-903d-4ab7-8066-28d363036d65"
  struct IDirectSoundCaptureFXAec
    lpVtbl : IDirectSoundCaptureFXAecVTbl*
  end

  struct IDirectSoundCaptureFXNoiseSuppressVTbl
    query_interface : Proc(IDirectSoundCaptureFXNoiseSuppress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundCaptureFXNoiseSuppress*, UInt32)
    release : Proc(IDirectSoundCaptureFXNoiseSuppress*, UInt32)
    set_all_parameters : Proc(IDirectSoundCaptureFXNoiseSuppress*, DSCFXNoiseSuppress*, HRESULT)
    get_all_parameters : Proc(IDirectSoundCaptureFXNoiseSuppress*, DSCFXNoiseSuppress*, HRESULT)
    reset : Proc(IDirectSoundCaptureFXNoiseSuppress*, HRESULT)
  end

  IDirectSoundCaptureFXNoiseSuppress_GUID = LibC::GUID.new("ed311e41-fbae-4175-9625-cd0854f693ca")
  CLSID_IDirectSoundCaptureFXNoiseSuppress = "ed311e41-fbae-4175-9625-cd0854f693ca"
  struct IDirectSoundCaptureFXNoiseSuppress
    lpVtbl : IDirectSoundCaptureFXNoiseSuppressVTbl*
  end

  struct IDirectSoundFullDuplexVTbl
    query_interface : Proc(IDirectSoundFullDuplex*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectSoundFullDuplex*, UInt32)
    release : Proc(IDirectSoundFullDuplex*, UInt32)
    initialize : Proc(IDirectSoundFullDuplex*, Guid*, Guid*, DSCBUFFERDESC*, DSBUFFERDESC*, LibC::HANDLE, UInt32, IDirectSoundCaptureBuffer8*, IDirectSoundBuffer8*, HRESULT)
  end

  IDirectSoundFullDuplex_GUID = LibC::GUID.new("edcb4c7a-daab-4216-a42e-6c50596ddc1d")
  CLSID_IDirectSoundFullDuplex = "edcb4c7a-daab-4216-a42e-6c50596ddc1d"
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
