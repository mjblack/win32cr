require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/registry.cr"
require "./audio.cr"
require "./../system/com/urlmon.cr"

module Win32cr::Media::Speech
  extend self
  alias SPNOTIFYCALLBACK = Proc(Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Void)

  SPDUI_EngineProperties = "EngineProperties"
  SPDUI_AddRemoveWord = "AddRemoveWord"
  SPDUI_UserTraining = "UserTraining"
  SPDUI_MicTraining = "MicTraining"
  SPDUI_RecoProfileProperties = "RecoProfileProperties"
  SPDUI_AudioProperties = "AudioProperties"
  SPDUI_AudioVolume = "AudioVolume"
  SPDUI_UserEnrollment = "UserEnrollment"
  SPDUI_ShareData = "ShareData"
  SPDUI_Tutorial = "Tutorial"
  SPREG_USER_ROOT = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech"
  SPREG_LOCAL_MACHINE_ROOT = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech"
  SPCAT_AUDIOOUT = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioOutput"
  SPCAT_AUDIOIN = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioInput"
  SPCAT_VOICES = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Voices"
  SPCAT_RECOGNIZERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Recognizers"
  SPCAT_APPLEXICONS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AppLexicons"
  SPCAT_PHONECONVERTERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\PhoneConverters"
  SPCAT_TEXTNORMALIZERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\TextNormalizers"
  SPCAT_RECOPROFILES = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\RecoProfiles"
  SPMMSYS_AUDIO_IN_TOKEN_ID = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioInput\\TokenEnums\\MMAudioIn\\"
  SPMMSYS_AUDIO_OUT_TOKEN_ID = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioOutput\\TokenEnums\\MMAudioOut\\"
  SPCURRENT_USER_LEXICON_TOKEN_ID = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\CurrentUserLexicon"
  SPCURRENT_USER_SHORTCUT_TOKEN_ID = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\CurrentUserShortcut"
  SPTOKENVALUE_CLSID = "CLSID"
  SPTOKENKEY_FILES = "Files"
  SPTOKENKEY_UI = "UI"
  SPTOKENKEY_ATTRIBUTES = "Attributes"
  SPTOKENKEY_RETAINEDAUDIO = "SecondsPerRetainedAudioEvent"
  SPTOKENKEY_AUDIO_LATENCY_WARNING = "LatencyWarningThreshold"
  SPTOKENKEY_AUDIO_LATENCY_TRUNCATE = "LatencyTruncateThreshold"
  SPTOKENKEY_AUDIO_LATENCY_UPDATE_INTERVAL = "LatencyUpdateInterval"
  SPVOICECATEGORY_TTSRATE = "DefaultTTSRate"
  SPPROP_RESOURCE_USAGE = "ResourceUsage"
  SPPROP_HIGH_CONFIDENCE_THRESHOLD = "HighConfidenceThreshold"
  SPPROP_NORMAL_CONFIDENCE_THRESHOLD = "NormalConfidenceThreshold"
  SPPROP_LOW_CONFIDENCE_THRESHOLD = "LowConfidenceThreshold"
  SPPROP_RESPONSE_SPEED = "ResponseSpeed"
  SPPROP_COMPLEX_RESPONSE_SPEED = "ComplexResponseSpeed"
  SPPROP_ADAPTATION_ON = "AdaptationOn"
  SPPROP_PERSISTED_BACKGROUND_ADAPTATION = "PersistedBackgroundAdaptation"
  SPPROP_PERSISTED_LANGUAGE_MODEL_ADAPTATION = "PersistedLanguageModelAdaptation"
  SPPROP_UX_IS_LISTENING = "UXIsListening"
  SPTOPIC_SPELLING = "Spelling"
  SPWILDCARD = "..."
  SPDICTATION = "*"
  SPINFDICTATION = "*+"
  SPREG_SAFE_USER_TOKENS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\UserTokens"
  SP_LOW_CONFIDENCE = -1_i32
  SP_NORMAL_CONFIDENCE = 0_u32
  DEFAULT_WEIGHT = 1_u32
  SP_MAX_WORD_LENGTH = 128_u32
  SP_MAX_PRON_LENGTH = 384_u32
  SP_EMULATE_RESULT = 1073741824_u32
  SP_STREAMPOS_ASAP = 0_u32
  SP_STREAMPOS_REALTIME = -1_i32
  SPRP_NORMAL = 0_u32
  SP_MAX_LANGIDS = 20_u32
  SPRECOEXTENSION = "RecoExtension"
  SPALTERNATESCLSID = "AlternatesCLSID"
  SR_LOCALIZED_DESCRIPTION = "Description"
  SAPI_ERROR_BASE = 20480_u32
  Speech_Default_Weight = 1
  Speech_Max_Word_Length = 128_i32
  Speech_Max_Pron_Length = 384_i32
  Speech_StreamPos_Asap = 0_i32
  Speech_StreamPos_RealTime = -1_i32
  SpeechAllElements = -1_i32

  CLSID_SpNotifyTranslator = LibC::GUID.new(0xe2ae5372_u32, 0x5d40_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xe_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])

  CLSID_SpObjectTokenCategory = LibC::GUID.new(0xa910187f_u32, 0xc7a_u16, 0x45ac_u16, StaticArray[0x92_u8, 0xcc_u8, 0x59_u8, 0xed_u8, 0xaf_u8, 0xb7_u8, 0x7b_u8, 0x53_u8])

  CLSID_SpObjectToken = LibC::GUID.new(0xef411752_u32, 0x3736_u16, 0x4cb4_u16, StaticArray[0x9c_u8, 0x8c_u8, 0x8e_u8, 0xf4_u8, 0xcc_u8, 0xb5_u8, 0x8e_u8, 0xfe_u8])

  CLSID_SpResourceManager = LibC::GUID.new(0x96749373_u32, 0x3391_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])

  CLSID_SpStreamFormatConverter = LibC::GUID.new(0x7013943a_u32, 0xe2ec_u16, 0x11d2_u16, StaticArray[0xa0_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0xb5_u8])

  CLSID_SpMMAudioEnum = LibC::GUID.new(0xab1890a0_u32, 0xe91f_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])

  CLSID_SpMMAudioIn = LibC::GUID.new(0xcf3d2e50_u32, 0x53f2_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])

  CLSID_SpMMAudioOut = LibC::GUID.new(0xa8c680eb_u32, 0x3d32_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])

  CLSID_SpStream = LibC::GUID.new(0x715d9c59_u32, 0x4442_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])

  CLSID_SpVoice = LibC::GUID.new(0x96749377_u32, 0x3391_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])

  CLSID_SpSharedRecoContext = LibC::GUID.new(0x47206204_u32, 0x5eca_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])

  CLSID_SpInprocRecognizer = LibC::GUID.new(0x41b89b6b_u32, 0x9399_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x23_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])

  CLSID_SpSharedRecognizer = LibC::GUID.new(0x3bee4890_u32, 0x4fe9_u16, 0x4a37_u16, StaticArray[0x8c_u8, 0x1e_u8, 0x5e_u8, 0x7e_u8, 0x12_u8, 0x79_u8, 0x1c_u8, 0x1f_u8])

  CLSID_SpLexicon = LibC::GUID.new(0x655e396_u32, 0x25d0_u16, 0x11d3_u16, StaticArray[0x9c_u8, 0x26_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf8_u8, 0x7c_u8])

  CLSID_SpUnCompressedLexicon = LibC::GUID.new(0xc9e37c15_u32, 0xdf92_u16, 0x4727_u16, StaticArray[0x85_u8, 0xd6_u8, 0x72_u8, 0xe5_u8, 0xee_u8, 0xb6_u8, 0x99_u8, 0x5a_u8])

  CLSID_SpCompressedLexicon = LibC::GUID.new(0x90903716_u32, 0x2f42_u16, 0x11d3_u16, StaticArray[0x9c_u8, 0x26_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf8_u8, 0x7c_u8])

  CLSID_SpShortcut = LibC::GUID.new(0xd722f1a_u32, 0x9fcf_u16, 0x4e62_u16, StaticArray[0x96_u8, 0xd8_u8, 0x6d_u8, 0xf8_u8, 0xf0_u8, 0x1a_u8, 0x26_u8, 0xaa_u8])

  CLSID_SpPhoneConverter = LibC::GUID.new(0x9185f743_u32, 0x1143_u16, 0x4c28_u16, StaticArray[0x86_u8, 0xb5_u8, 0xbf_u8, 0xf1_u8, 0x4f_u8, 0x20_u8, 0xe5_u8, 0xc8_u8])

  CLSID_SpPhoneticAlphabetConverter = LibC::GUID.new(0x4f414126_u32, 0xdfe3_u16, 0x4629_u16, StaticArray[0x99_u8, 0xee_u8, 0x79_u8, 0x79_u8, 0x78_u8, 0x31_u8, 0x7e_u8, 0xad_u8])

  CLSID_SpNullPhoneConverter = LibC::GUID.new(0x455f24e9_u32, 0x7396_u16, 0x4a16_u16, StaticArray[0x97_u8, 0x15_u8, 0x7c_u8, 0xf_u8, 0xdb_u8, 0xe3_u8, 0xef_u8, 0xe3_u8])

  CLSID_SpTextSelectionInformation = LibC::GUID.new(0xf92030a_u32, 0xcbfd_u16, 0x4ab8_u16, StaticArray[0xa1_u8, 0x64_u8, 0xff_u8, 0x59_u8, 0x85_u8, 0x54_u8, 0x7f_u8, 0xf6_u8])

  CLSID_SpPhraseInfoBuilder = LibC::GUID.new(0xc23fc28d_u32, 0xc55f_u16, 0x4720_u16, StaticArray[0x8b_u8, 0x32_u8, 0x91_u8, 0xf7_u8, 0x3c_u8, 0x2b_u8, 0xd5_u8, 0xd1_u8])

  CLSID_SpAudioFormat = LibC::GUID.new(0x9ef96870_u32, 0xe160_u16, 0x4792_u16, StaticArray[0x82_u8, 0xd_u8, 0x48_u8, 0xcf_u8, 0x6_u8, 0x49_u8, 0xe4_u8, 0xec_u8])

  CLSID_SpWaveFormatEx = LibC::GUID.new(0xc79a574c_u32, 0x63be_u16, 0x44b9_u16, StaticArray[0x80_u8, 0x1f_u8, 0x28_u8, 0x3f_u8, 0x87_u8, 0xf8_u8, 0x98_u8, 0xbe_u8])

  CLSID_SpInProcRecoContext = LibC::GUID.new(0x73ad6842_u32, 0xace0_u16, 0x45e8_u16, StaticArray[0xa4_u8, 0xdd_u8, 0x87_u8, 0x95_u8, 0x88_u8, 0x1a_u8, 0x2c_u8, 0x2a_u8])

  CLSID_SpCustomStream = LibC::GUID.new(0x8dbef13f_u32, 0x1948_u16, 0x4aa8_u16, StaticArray[0x8c_u8, 0xf0_u8, 0x4_u8, 0x8e_u8, 0xeb_u8, 0xed_u8, 0x95_u8, 0xd8_u8])

  CLSID_SpFileStream = LibC::GUID.new(0x947812b3_u32, 0x2ae1_u16, 0x4644_u16, StaticArray[0xba_u8, 0x86_u8, 0x9e_u8, 0x90_u8, 0xde_u8, 0xd7_u8, 0xec_u8, 0x91_u8])

  CLSID_SpMemoryStream = LibC::GUID.new(0x5fb7ef7d_u32, 0xdff4_u16, 0x468a_u16, StaticArray[0xb6_u8, 0xb7_u8, 0x2f_u8, 0xcb_u8, 0xd1_u8, 0x88_u8, 0xf9_u8, 0x94_u8])

  enum SPDATAKEYLOCATION
    SPDKL_DefaultLocation = 0_i32
    SPDKL_CurrentUser = 1_i32
    SPDKL_LocalMachine = 2_i32
    SPDKL_CurrentConfig = 5_i32
  end
  enum SPSTREAMFORMAT
    SPSF_Default = -1_i32
    SPSF_NoAssignedFormat = 0_i32
    SPSF_Text = 1_i32
    SPSF_NonStandardFormat = 2_i32
    SPSF_ExtendedAudioFormat = 3_i32
    SPSF_8kHz8BitMono = 4_i32
    SPSF_8kHz8BitStereo = 5_i32
    SPSF_8kHz16BitMono = 6_i32
    SPSF_8kHz16BitStereo = 7_i32
    SPSF_11kHz8BitMono = 8_i32
    SPSF_11kHz8BitStereo = 9_i32
    SPSF_11kHz16BitMono = 10_i32
    SPSF_11kHz16BitStereo = 11_i32
    SPSF_12kHz8BitMono = 12_i32
    SPSF_12kHz8BitStereo = 13_i32
    SPSF_12kHz16BitMono = 14_i32
    SPSF_12kHz16BitStereo = 15_i32
    SPSF_16kHz8BitMono = 16_i32
    SPSF_16kHz8BitStereo = 17_i32
    SPSF_16kHz16BitMono = 18_i32
    SPSF_16kHz16BitStereo = 19_i32
    SPSF_22kHz8BitMono = 20_i32
    SPSF_22kHz8BitStereo = 21_i32
    SPSF_22kHz16BitMono = 22_i32
    SPSF_22kHz16BitStereo = 23_i32
    SPSF_24kHz8BitMono = 24_i32
    SPSF_24kHz8BitStereo = 25_i32
    SPSF_24kHz16BitMono = 26_i32
    SPSF_24kHz16BitStereo = 27_i32
    SPSF_32kHz8BitMono = 28_i32
    SPSF_32kHz8BitStereo = 29_i32
    SPSF_32kHz16BitMono = 30_i32
    SPSF_32kHz16BitStereo = 31_i32
    SPSF_44kHz8BitMono = 32_i32
    SPSF_44kHz8BitStereo = 33_i32
    SPSF_44kHz16BitMono = 34_i32
    SPSF_44kHz16BitStereo = 35_i32
    SPSF_48kHz8BitMono = 36_i32
    SPSF_48kHz8BitStereo = 37_i32
    SPSF_48kHz16BitMono = 38_i32
    SPSF_48kHz16BitStereo = 39_i32
    SPSF_TrueSpeech_8kHz1BitMono = 40_i32
    SPSF_CCITT_ALaw_8kHzMono = 41_i32
    SPSF_CCITT_ALaw_8kHzStereo = 42_i32
    SPSF_CCITT_ALaw_11kHzMono = 43_i32
    SPSF_CCITT_ALaw_11kHzStereo = 44_i32
    SPSF_CCITT_ALaw_22kHzMono = 45_i32
    SPSF_CCITT_ALaw_22kHzStereo = 46_i32
    SPSF_CCITT_ALaw_44kHzMono = 47_i32
    SPSF_CCITT_ALaw_44kHzStereo = 48_i32
    SPSF_CCITT_uLaw_8kHzMono = 49_i32
    SPSF_CCITT_uLaw_8kHzStereo = 50_i32
    SPSF_CCITT_uLaw_11kHzMono = 51_i32
    SPSF_CCITT_uLaw_11kHzStereo = 52_i32
    SPSF_CCITT_uLaw_22kHzMono = 53_i32
    SPSF_CCITT_uLaw_22kHzStereo = 54_i32
    SPSF_CCITT_uLaw_44kHzMono = 55_i32
    SPSF_CCITT_uLaw_44kHzStereo = 56_i32
    SPSF_ADPCM_8kHzMono = 57_i32
    SPSF_ADPCM_8kHzStereo = 58_i32
    SPSF_ADPCM_11kHzMono = 59_i32
    SPSF_ADPCM_11kHzStereo = 60_i32
    SPSF_ADPCM_22kHzMono = 61_i32
    SPSF_ADPCM_22kHzStereo = 62_i32
    SPSF_ADPCM_44kHzMono = 63_i32
    SPSF_ADPCM_44kHzStereo = 64_i32
    SPSF_GSM610_8kHzMono = 65_i32
    SPSF_GSM610_11kHzMono = 66_i32
    SPSF_GSM610_22kHzMono = 67_i32
    SPSF_GSM610_44kHzMono = 68_i32
    SPSF_NUM_FORMATS = 69_i32
  end
  enum SPEVENTLPARAMTYPE
    SPET_LPARAM_IS_UNDEFINED = 0_i32
    SPET_LPARAM_IS_TOKEN = 1_i32
    SPET_LPARAM_IS_OBJECT = 2_i32
    SPET_LPARAM_IS_POINTER = 3_i32
    SPET_LPARAM_IS_STRING = 4_i32
  end
  enum SPEVENTENUM
    SPEI_UNDEFINED = 0_i32
    SPEI_START_INPUT_STREAM = 1_i32
    SPEI_END_INPUT_STREAM = 2_i32
    SPEI_VOICE_CHANGE = 3_i32
    SPEI_TTS_BOOKMARK = 4_i32
    SPEI_WORD_BOUNDARY = 5_i32
    SPEI_PHONEME = 6_i32
    SPEI_SENTENCE_BOUNDARY = 7_i32
    SPEI_VISEME = 8_i32
    SPEI_TTS_AUDIO_LEVEL = 9_i32
    SPEI_TTS_PRIVATE = 15_i32
    SPEI_MIN_TTS = 1_i32
    SPEI_MAX_TTS = 15_i32
    SPEI_END_SR_STREAM = 34_i32
    SPEI_SOUND_START = 35_i32
    SPEI_SOUND_END = 36_i32
    SPEI_PHRASE_START = 37_i32
    SPEI_RECOGNITION = 38_i32
    SPEI_HYPOTHESIS = 39_i32
    SPEI_SR_BOOKMARK = 40_i32
    SPEI_PROPERTY_NUM_CHANGE = 41_i32
    SPEI_PROPERTY_STRING_CHANGE = 42_i32
    SPEI_FALSE_RECOGNITION = 43_i32
    SPEI_INTERFERENCE = 44_i32
    SPEI_REQUEST_UI = 45_i32
    SPEI_RECO_STATE_CHANGE = 46_i32
    SPEI_ADAPTATION = 47_i32
    SPEI_START_SR_STREAM = 48_i32
    SPEI_RECO_OTHER_CONTEXT = 49_i32
    SPEI_SR_AUDIO_LEVEL = 50_i32
    SPEI_SR_RETAINEDAUDIO = 51_i32
    SPEI_SR_PRIVATE = 52_i32
    SPEI_RESERVED4 = 53_i32
    SPEI_RESERVED5 = 54_i32
    SPEI_RESERVED6 = 55_i32
    SPEI_MIN_SR = 34_i32
    SPEI_MAX_SR = 55_i32
    SPEI_RESERVED1 = 30_i32
    SPEI_RESERVED2 = 33_i32
    SPEI_RESERVED3 = 63_i32
  end
  enum SPINTERFERENCE
    SPINTERFERENCE_NONE = 0_i32
    SPINTERFERENCE_NOISE = 1_i32
    SPINTERFERENCE_NOSIGNAL = 2_i32
    SPINTERFERENCE_TOOLOUD = 3_i32
    SPINTERFERENCE_TOOQUIET = 4_i32
    SPINTERFERENCE_TOOFAST = 5_i32
    SPINTERFERENCE_TOOSLOW = 6_i32
    SPINTERFERENCE_LATENCY_WARNING = 7_i32
    SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN = 8_i32
    SPINTERFERENCE_LATENCY_TRUNCATE_END = 9_i32
  end
  enum SPENDSRSTREAMFLAGS
    SPESF_NONE = 0_i32
    SPESF_STREAM_RELEASED = 1_i32
    SPESF_EMULATED = 2_i32
  end
  enum SPVFEATURE
    SPVFEATURE_STRESSED = 1_i32
    SPVFEATURE_EMPHASIS = 2_i32
  end
  enum SPVISEMES
    SP_VISEME_0 = 0_i32
    SP_VISEME_1 = 1_i32
    SP_VISEME_2 = 2_i32
    SP_VISEME_3 = 3_i32
    SP_VISEME_4 = 4_i32
    SP_VISEME_5 = 5_i32
    SP_VISEME_6 = 6_i32
    SP_VISEME_7 = 7_i32
    SP_VISEME_8 = 8_i32
    SP_VISEME_9 = 9_i32
    SP_VISEME_10 = 10_i32
    SP_VISEME_11 = 11_i32
    SP_VISEME_12 = 12_i32
    SP_VISEME_13 = 13_i32
    SP_VISEME_14 = 14_i32
    SP_VISEME_15 = 15_i32
    SP_VISEME_16 = 16_i32
    SP_VISEME_17 = 17_i32
    SP_VISEME_18 = 18_i32
    SP_VISEME_19 = 19_i32
    SP_VISEME_20 = 20_i32
    SP_VISEME_21 = 21_i32
  end
  enum SPFILEMODE
    SPFM_OPEN_READONLY = 0_i32
    SPFM_OPEN_READWRITE = 1_i32
    SPFM_CREATE = 2_i32
    SPFM_CREATE_ALWAYS = 3_i32
    SPFM_NUM_MODES = 4_i32
  end
  enum SPAUDIOSTATE
    SPAS_CLOSED = 0_i32
    SPAS_STOP = 1_i32
    SPAS_PAUSE = 2_i32
    SPAS_RUN = 3_i32
  end
  enum SPDISPLYATTRIBUTES
    SPAF_ONE_TRAILING_SPACE = 2_i32
    SPAF_TWO_TRAILING_SPACES = 4_i32
    SPAF_CONSUME_LEADING_SPACES = 8_i32
    SPAF_BUFFER_POSITION = 16_i32
    SPAF_ALL = 31_i32
    SPAF_USER_SPECIFIED = 128_i32
  end
  enum SPPHRASEPROPERTYUNIONTYPE
    SPPPUT_UNUSED = 0_i32
    SPPPUT_ARRAY_INDEX = 1_i32
  end
  enum SPSEMANTICFORMAT
    SPSMF_SAPI_PROPERTIES = 0_i32
    SPSMF_SRGS_SEMANTICINTERPRETATION_MS = 1_i32
    SPSMF_SRGS_SAPIPROPERTIES = 2_i32
    SPSMF_UPS = 4_i32
    SPSMF_SRGS_SEMANTICINTERPRETATION_W3C = 8_i32
  end
  enum SPVALUETYPE
    SPDF_PROPERTY = 1_i32
    SPDF_REPLACEMENT = 2_i32
    SPDF_RULE = 4_i32
    SPDF_DISPLAYTEXT = 8_i32
    SPDF_LEXICALFORM = 16_i32
    SPDF_PRONUNCIATION = 32_i32
    SPDF_AUDIO = 64_i32
    SPDF_ALTERNATES = 128_i32
    SPDF_ALL = 255_i32
  end
  enum SPPHRASERNG
    SPPR_ALL_ELEMENTS = -1_i32
  end
  enum SPRECOEVENTFLAGS
    SPREF_AutoPause = 1_i32
    SPREF_Emulated = 2_i32
    SPREF_SMLTimeout = 4_i32
    SPREF_ExtendableParse = 8_i32
    SPREF_ReSent = 16_i32
    SPREF_Hypothesis = 32_i32
    SPREF_FalseRecognition = 64_i32
  end
  enum SPPARTOFSPEECH
    SPPS_NotOverriden = -1_i32
    SPPS_Unknown = 0_i32
    SPPS_Noun = 4096_i32
    SPPS_Verb = 8192_i32
    SPPS_Modifier = 12288_i32
    SPPS_Function = 16384_i32
    SPPS_Interjection = 20480_i32
    SPPS_Noncontent = 24576_i32
    SPPS_LMA = 28672_i32
    SPPS_SuppressWord = 61440_i32
  end
  enum SPLEXICONTYPE
    Elextype_user = 1_i32
    Elextype_app = 2_i32
    Elextype_vendorlexicon = 4_i32
    Elextype_lettertosound = 8_i32
    Elextype_morphology = 16_i32
    Elextype_reserved4 = 32_i32
    Elextype_user_shortcut = 64_i32
    Elextype_reserved6 = 128_i32
    Elextype_reserved7 = 256_i32
    Elextype_reserved8 = 512_i32
    Elextype_reserved9 = 1024_i32
    Elextype_reserved10 = 2048_i32
    Elextype_private1 = 4096_i32
    Elextype_private2 = 8192_i32
    Elextype_private3 = 16384_i32
    Elextype_private4 = 32768_i32
    Elextype_private5 = 65536_i32
    Elextype_private6 = 131072_i32
    Elextype_private7 = 262144_i32
    Elextype_private8 = 524288_i32
    Elextype_private9 = 1048576_i32
    Elextype_private10 = 2097152_i32
    Elextype_private11 = 4194304_i32
    Elextype_private12 = 8388608_i32
    Elextype_private13 = 16777216_i32
    Elextype_private14 = 33554432_i32
    Elextype_private15 = 67108864_i32
    Elextype_private16 = 134217728_i32
    Elextype_private17 = 268435456_i32
    Elextype_private18 = 536870912_i32
    Elextype_private19 = 1073741824_i32
    Elextype_private20 = -2147483648_i32
  end
  enum SPWORDTYPE
    Ewordtype_added = 1_i32
    Ewordtype_deleted = 2_i32
  end
  enum SPPRONUNCIATIONFLAGS
    Epronflag_used = 1_i32
  end
  enum SPSHORTCUTTYPE
    SPSHT_NotOverriden = -1_i32
    SPSHT_Unknown = 0_i32
    SPSHT_EMAIL = 4096_i32
    SPSHT_OTHER = 8192_i32
    SPPS_RESERVED1 = 12288_i32
    SPPS_RESERVED2 = 16384_i32
    SPPS_RESERVED3 = 20480_i32
    SPPS_RESERVED4 = 61440_i32
  end
  enum SPVACTIONS
    SPVA_Speak = 0_i32
    SPVA_Silence = 1_i32
    SPVA_Pronounce = 2_i32
    SPVA_Bookmark = 3_i32
    SPVA_SpellOut = 4_i32
    SPVA_Section = 5_i32
    SPVA_ParseUnknownTag = 6_i32
  end
  enum SPRUNSTATE
    SPRS_DONE = 1_i32
    SPRS_IS_SPEAKING = 2_i32
  end
  enum SPVLIMITS
    SPMIN_VOLUME = 0_i32
    SPMAX_VOLUME = 100_i32
    SPMIN_RATE = -10_i32
    SPMAX_RATE = 10_i32
  end
  enum SPVPRIORITY
    SPVPRI_NORMAL = 0_i32
    SPVPRI_ALERT = 1_i32
    SPVPRI_OVER = 2_i32
  end
  enum SPEAKFLAGS
    SPF_DEFAULT = 0_i32
    SPF_ASYNC = 1_i32
    SPF_PURGEBEFORESPEAK = 2_i32
    SPF_IS_FILENAME = 4_i32
    SPF_IS_XML = 8_i32
    SPF_IS_NOT_XML = 16_i32
    SPF_PERSIST_XML = 32_i32
    SPF_NLP_SPEAK_PUNC = 64_i32
    SPF_PARSE_SAPI = 128_i32
    SPF_PARSE_SSML = 256_i32
    SPF_PARSE_AUTODETECT = 0_i32
    SPF_NLP_MASK = 64_i32
    SPF_PARSE_MASK = 384_i32
    SPF_VOICE_MASK = 511_i32
    SPF_UNUSED_FLAGS = -512_i32
  end
  enum SPXMLRESULTOPTIONS
    SPXRO_SML = 0_i32
    SPXRO_Alternates_SML = 1_i32
  end
  enum SPCOMMITFLAGS
    SPCF_NONE = 0_i32
    SPCF_ADD_TO_USER_LEXICON = 1_i32
    SPCF_DEFINITE_CORRECTION = 2_i32
  end
  enum SPWORDPRONOUNCEABLE
    SPWP_UNKNOWN_WORD_UNPRONOUNCEABLE = 0_i32
    SPWP_UNKNOWN_WORD_PRONOUNCEABLE = 1_i32
    SPWP_KNOWN_WORD_PRONOUNCEABLE = 2_i32
  end
  enum SPGRAMMARSTATE
    SPGS_DISABLED = 0_i32
    SPGS_ENABLED = 1_i32
    SPGS_EXCLUSIVE = 3_i32
  end
  enum SPCONTEXTSTATE
    SPCS_DISABLED = 0_i32
    SPCS_ENABLED = 1_i32
  end
  enum SPRULESTATE
    SPRS_INACTIVE = 0_i32
    SPRS_ACTIVE = 1_i32
    SPRS_ACTIVE_WITH_AUTO_PAUSE = 3_i32
    SPRS_ACTIVE_USER_DELIMITED = 4_i32
  end
  enum SPGRAMMARWORDTYPE
    SPWT_DISPLAY = 0_i32
    SPWT_LEXICAL = 1_i32
    SPWT_PRONUNCIATION = 2_i32
    SPWT_LEXICAL_NO_SPECIAL_CHARS = 3_i32
  end
  enum SPCFGRULEATTRIBUTES
    SPRAF_TopLevel = 1_i32
    SPRAF_Active = 2_i32
    SPRAF_Export = 4_i32
    SPRAF_Import = 8_i32
    SPRAF_Interpreter = 16_i32
    SPRAF_Dynamic = 32_i32
    SPRAF_Root = 64_i32
    SPRAF_AutoPause = 65536_i32
    SPRAF_UserDelimited = 131072_i32
  end
  enum SPLOADOPTIONS
    SPLO_STATIC = 0_i32
    SPLO_DYNAMIC = 1_i32
  end
  enum SPMATCHINGMODE
    AllWords = 0_i32
    Subsequence = 1_i32
    OrderedSubset = 3_i32
    SubsequenceContentRequired = 5_i32
    OrderedSubsetContentRequired = 7_i32
  end
  enum PHONETICALPHABET
    PA_Ipa = 0_i32
    PA_Ups = 1_i32
    PA_Sapi = 2_i32
  end
  enum SPBOOKMARKOPTIONS
    SPBO_NONE = 0_i32
    SPBO_PAUSE = 1_i32
    SPBO_AHEAD = 2_i32
    SPBO_TIME_UNITS = 4_i32
  end
  enum SPAUDIOOPTIONS
    SPAO_NONE = 0_i32
    SPAO_RETAIN_AUDIO = 1_i32
  end
  enum SPGRAMMAROPTIONS
    SPGO_SAPI = 1_i32
    SPGO_SRGS = 2_i32
    SPGO_UPS = 4_i32
    SPGO_SRGS_MS_SCRIPT = 8_i32
    SPGO_SRGS_W3C_SCRIPT = 256_i32
    SPGO_SRGS_STG_SCRIPT = 512_i32
    SPGO_SRGS_SCRIPT = 778_i32
    SPGO_FILE = 16_i32
    SPGO_HTTP = 32_i32
    SPGO_RES = 64_i32
    SPGO_OBJECT = 128_i32
    SPGO_DEFAULT = 1019_i32
    SPGO_ALL = 1023_i32
  end
  enum SPADAPTATIONSETTINGS
    SPADS_Default = 0_i32
    SPADS_CurrentRecognizer = 1_i32
    SPADS_RecoProfile = 2_i32
    SPADS_Immediate = 4_i32
    SPADS_Reset = 8_i32
    SPADS_HighVolumeDataSource = 16_i32
  end
  enum SPADAPTATIONRELEVANCE
    SPAR_Unknown = 0_i32
    SPAR_Low = 1_i32
    SPAR_Medium = 2_i32
    SPAR_High = 3_i32
  end
  enum SPWAVEFORMATTYPE
    SPWF_INPUT = 0_i32
    SPWF_SRENGINE = 1_i32
  end
  enum SPRECOSTATE
    SPRST_INACTIVE = 0_i32
    SPRST_ACTIVE = 1_i32
    SPRST_ACTIVE_ALWAYS = 2_i32
    SPRST_INACTIVE_WITH_PURGE = 3_i32
    SPRST_NUM_STATES = 4_i32
  end
  enum DISPID_SpeechDataKey
    DISPID_SDKSetBinaryValue = 1_i32
    DISPID_SDKGetBinaryValue = 2_i32
    DISPID_SDKSetStringValue = 3_i32
    DISPID_SDKGetStringValue = 4_i32
    DISPID_SDKSetLongValue = 5_i32
    DISPID_SDKGetlongValue = 6_i32
    DISPID_SDKOpenKey = 7_i32
    DISPID_SDKCreateKey = 8_i32
    DISPID_SDKDeleteKey = 9_i32
    DISPID_SDKDeleteValue = 10_i32
    DISPID_SDKEnumKeys = 11_i32
    DISPID_SDKEnumValues = 12_i32
  end
  enum DISPID_SpeechObjectToken
    DISPID_SOTId = 1_i32
    DISPID_SOTDataKey = 2_i32
    DISPID_SOTCategory = 3_i32
    DISPID_SOTGetDescription = 4_i32
    DISPID_SOTSetId = 5_i32
    DISPID_SOTGetAttribute = 6_i32
    DISPID_SOTCreateInstance = 7_i32
    DISPID_SOTRemove = 8_i32
    DISPID_SOTGetStorageFileName = 9_i32
    DISPID_SOTRemoveStorageFileName = 10_i32
    DISPID_SOTIsUISupported = 11_i32
    DISPID_SOTDisplayUI = 12_i32
    DISPID_SOTMatchesAttributes = 13_i32
  end
  enum SpeechDataKeyLocation
    SDKLDefaultLocation = 0_i32
    SDKLCurrentUser = 1_i32
    SDKLLocalMachine = 2_i32
    SDKLCurrentConfig = 5_i32
  end
  enum SpeechTokenContext : UInt32
    STCInprocServer = 1_u32
    STCInprocHandler = 2_u32
    STCLocalServer = 4_u32
    STCRemoteServer = 16_u32
    STCAll = 23_u32
  end
  enum SpeechTokenShellFolder
    STSF_AppData = 26_i32
    STSF_LocalAppData = 28_i32
    STSF_CommonAppData = 35_i32
    STSF_FlagCreate = 32768_i32
  end
  enum DISPID_SpeechObjectTokens
    DISPID_SOTsCount = 1_i32
    DISPID_SOTsItem = 0_i32
    DISPID_SOTs_NewEnum = -4_i32
  end
  enum DISPID_SpeechObjectTokenCategory
    DISPID_SOTCId = 1_i32
    DISPID_SOTCDefault = 2_i32
    DISPID_SOTCSetId = 3_i32
    DISPID_SOTCGetDataKey = 4_i32
    DISPID_SOTCEnumerateTokens = 5_i32
  end
  enum SpeechAudioFormatType
    SAFTDefault = -1_i32
    SAFTNoAssignedFormat = 0_i32
    SAFTText = 1_i32
    SAFTNonStandardFormat = 2_i32
    SAFTExtendedAudioFormat = 3_i32
    SAFT8kHz8BitMono = 4_i32
    SAFT8kHz8BitStereo = 5_i32
    SAFT8kHz16BitMono = 6_i32
    SAFT8kHz16BitStereo = 7_i32
    SAFT11kHz8BitMono = 8_i32
    SAFT11kHz8BitStereo = 9_i32
    SAFT11kHz16BitMono = 10_i32
    SAFT11kHz16BitStereo = 11_i32
    SAFT12kHz8BitMono = 12_i32
    SAFT12kHz8BitStereo = 13_i32
    SAFT12kHz16BitMono = 14_i32
    SAFT12kHz16BitStereo = 15_i32
    SAFT16kHz8BitMono = 16_i32
    SAFT16kHz8BitStereo = 17_i32
    SAFT16kHz16BitMono = 18_i32
    SAFT16kHz16BitStereo = 19_i32
    SAFT22kHz8BitMono = 20_i32
    SAFT22kHz8BitStereo = 21_i32
    SAFT22kHz16BitMono = 22_i32
    SAFT22kHz16BitStereo = 23_i32
    SAFT24kHz8BitMono = 24_i32
    SAFT24kHz8BitStereo = 25_i32
    SAFT24kHz16BitMono = 26_i32
    SAFT24kHz16BitStereo = 27_i32
    SAFT32kHz8BitMono = 28_i32
    SAFT32kHz8BitStereo = 29_i32
    SAFT32kHz16BitMono = 30_i32
    SAFT32kHz16BitStereo = 31_i32
    SAFT44kHz8BitMono = 32_i32
    SAFT44kHz8BitStereo = 33_i32
    SAFT44kHz16BitMono = 34_i32
    SAFT44kHz16BitStereo = 35_i32
    SAFT48kHz8BitMono = 36_i32
    SAFT48kHz8BitStereo = 37_i32
    SAFT48kHz16BitMono = 38_i32
    SAFT48kHz16BitStereo = 39_i32
    SAFTTrueSpeech_8kHz1BitMono = 40_i32
    SAFTCCITT_ALaw_8kHzMono = 41_i32
    SAFTCCITT_ALaw_8kHzStereo = 42_i32
    SAFTCCITT_ALaw_11kHzMono = 43_i32
    SAFTCCITT_ALaw_11kHzStereo = 44_i32
    SAFTCCITT_ALaw_22kHzMono = 45_i32
    SAFTCCITT_ALaw_22kHzStereo = 46_i32
    SAFTCCITT_ALaw_44kHzMono = 47_i32
    SAFTCCITT_ALaw_44kHzStereo = 48_i32
    SAFTCCITT_uLaw_8kHzMono = 49_i32
    SAFTCCITT_uLaw_8kHzStereo = 50_i32
    SAFTCCITT_uLaw_11kHzMono = 51_i32
    SAFTCCITT_uLaw_11kHzStereo = 52_i32
    SAFTCCITT_uLaw_22kHzMono = 53_i32
    SAFTCCITT_uLaw_22kHzStereo = 54_i32
    SAFTCCITT_uLaw_44kHzMono = 55_i32
    SAFTCCITT_uLaw_44kHzStereo = 56_i32
    SAFTADPCM_8kHzMono = 57_i32
    SAFTADPCM_8kHzStereo = 58_i32
    SAFTADPCM_11kHzMono = 59_i32
    SAFTADPCM_11kHzStereo = 60_i32
    SAFTADPCM_22kHzMono = 61_i32
    SAFTADPCM_22kHzStereo = 62_i32
    SAFTADPCM_44kHzMono = 63_i32
    SAFTADPCM_44kHzStereo = 64_i32
    SAFTGSM610_8kHzMono = 65_i32
    SAFTGSM610_11kHzMono = 66_i32
    SAFTGSM610_22kHzMono = 67_i32
    SAFTGSM610_44kHzMono = 68_i32
  end
  enum DISPID_SpeechAudioFormat
    DISPID_SAFType = 1_i32
    DISPID_SAFGuid = 2_i32
    DISPID_SAFGetWaveFormatEx = 3_i32
    DISPID_SAFSetWaveFormatEx = 4_i32
  end
  enum DISPID_SpeechBaseStream
    DISPID_SBSFormat = 1_i32
    DISPID_SBSRead = 2_i32
    DISPID_SBSWrite = 3_i32
    DISPID_SBSSeek = 4_i32
  end
  enum SpeechStreamSeekPositionType : UInt32
    SSSPTRelativeToStart = 0_u32
    SSSPTRelativeToCurrentPosition = 1_u32
    SSSPTRelativeToEnd = 2_u32
  end
  enum DISPID_SpeechAudio
    DISPID_SAStatus = 200_i32
    DISPID_SABufferInfo = 201_i32
    DISPID_SADefaultFormat = 202_i32
    DISPID_SAVolume = 203_i32
    DISPID_SABufferNotifySize = 204_i32
    DISPID_SAEventHandle = 205_i32
    DISPID_SASetState = 206_i32
  end
  enum SpeechAudioState
    SASClosed = 0_i32
    SASStop = 1_i32
    SASPause = 2_i32
    SASRun = 3_i32
  end
  enum DISPID_SpeechMMSysAudio
    DISPID_SMSADeviceId = 300_i32
    DISPID_SMSALineId = 301_i32
    DISPID_SMSAMMHandle = 302_i32
  end
  enum DISPID_SpeechFileStream
    DISPID_SFSOpen = 100_i32
    DISPID_SFSClose = 101_i32
  end
  enum SpeechStreamFileMode
    SSFMOpenForRead = 0_i32
    SSFMOpenReadWrite = 1_i32
    SSFMCreate = 2_i32
    SSFMCreateForWrite = 3_i32
  end
  enum DISPID_SpeechCustomStream
    DISPID_SCSBaseStream = 100_i32
  end
  enum DISPID_SpeechMemoryStream
    DISPID_SMSSetData = 100_i32
    DISPID_SMSGetData = 101_i32
  end
  enum DISPID_SpeechAudioStatus
    DISPID_SASFreeBufferSpace = 1_i32
    DISPID_SASNonBlockingIO = 2_i32
    DISPID_SASState = 3_i32
    DISPID_SASCurrentSeekPosition = 4_i32
    DISPID_SASCurrentDevicePosition = 5_i32
  end
  enum DISPID_SpeechAudioBufferInfo
    DISPID_SABIMinNotification = 1_i32
    DISPID_SABIBufferSize = 2_i32
    DISPID_SABIEventBias = 3_i32
  end
  enum DISPID_SpeechWaveFormatEx
    DISPID_SWFEFormatTag = 1_i32
    DISPID_SWFEChannels = 2_i32
    DISPID_SWFESamplesPerSec = 3_i32
    DISPID_SWFEAvgBytesPerSec = 4_i32
    DISPID_SWFEBlockAlign = 5_i32
    DISPID_SWFEBitsPerSample = 6_i32
    DISPID_SWFEExtraData = 7_i32
  end
  enum DISPID_SpeechVoice
    DISPID_SVStatus = 1_i32
    DISPID_SVVoice = 2_i32
    DISPID_SVAudioOutput = 3_i32
    DISPID_SVAudioOutputStream = 4_i32
    DISPID_SVRate = 5_i32
    DISPID_SVVolume = 6_i32
    DISPID_SVAllowAudioOuputFormatChangesOnNextSet = 7_i32
    DISPID_SVEventInterests = 8_i32
    DISPID_SVPriority = 9_i32
    DISPID_SVAlertBoundary = 10_i32
    DISPID_SVSyncronousSpeakTimeout = 11_i32
    DISPID_SVSpeak = 12_i32
    DISPID_SVSpeakStream = 13_i32
    DISPID_SVPause = 14_i32
    DISPID_SVResume = 15_i32
    DISPID_SVSkip = 16_i32
    DISPID_SVGetVoices = 17_i32
    DISPID_SVGetAudioOutputs = 18_i32
    DISPID_SVWaitUntilDone = 19_i32
    DISPID_SVSpeakCompleteEvent = 20_i32
    DISPID_SVIsUISupported = 21_i32
    DISPID_SVDisplayUI = 22_i32
  end
  enum SpeechVoicePriority
    SVPNormal = 0_i32
    SVPAlert = 1_i32
    SVPOver = 2_i32
  end
  enum SpeechVoiceSpeakFlags
    SVSFDefault = 0_i32
    SVSFlagsAsync = 1_i32
    SVSFPurgeBeforeSpeak = 2_i32
    SVSFIsFilename = 4_i32
    SVSFIsXML = 8_i32
    SVSFIsNotXML = 16_i32
    SVSFPersistXML = 32_i32
    SVSFNLPSpeakPunc = 64_i32
    SVSFParseSapi = 128_i32
    SVSFParseSsml = 256_i32
    SVSFParseAutodetect = 0_i32
    SVSFNLPMask = 64_i32
    SVSFParseMask = 384_i32
    SVSFVoiceMask = 511_i32
    SVSFUnusedFlags = -512_i32
  end
  enum SpeechVoiceEvents
    SVEStartInputStream = 2_i32
    SVEEndInputStream = 4_i32
    SVEVoiceChange = 8_i32
    SVEBookmark = 16_i32
    SVEWordBoundary = 32_i32
    SVEPhoneme = 64_i32
    SVESentenceBoundary = 128_i32
    SVEViseme = 256_i32
    SVEAudioLevel = 512_i32
    SVEPrivate = 32768_i32
    SVEAllEvents = 33790_i32
  end
  enum DISPID_SpeechVoiceStatus
    DISPID_SVSCurrentStreamNumber = 1_i32
    DISPID_SVSLastStreamNumberQueued = 2_i32
    DISPID_SVSLastResult = 3_i32
    DISPID_SVSRunningState = 4_i32
    DISPID_SVSInputWordPosition = 5_i32
    DISPID_SVSInputWordLength = 6_i32
    DISPID_SVSInputSentencePosition = 7_i32
    DISPID_SVSInputSentenceLength = 8_i32
    DISPID_SVSLastBookmark = 9_i32
    DISPID_SVSLastBookmarkId = 10_i32
    DISPID_SVSPhonemeId = 11_i32
    DISPID_SVSVisemeId = 12_i32
  end
  enum SpeechRunState
    SRSEDone = 1_i32
    SRSEIsSpeaking = 2_i32
  end
  enum SpeechVisemeType
    SVP_0 = 0_i32
    SVP_1 = 1_i32
    SVP_2 = 2_i32
    SVP_3 = 3_i32
    SVP_4 = 4_i32
    SVP_5 = 5_i32
    SVP_6 = 6_i32
    SVP_7 = 7_i32
    SVP_8 = 8_i32
    SVP_9 = 9_i32
    SVP_10 = 10_i32
    SVP_11 = 11_i32
    SVP_12 = 12_i32
    SVP_13 = 13_i32
    SVP_14 = 14_i32
    SVP_15 = 15_i32
    SVP_16 = 16_i32
    SVP_17 = 17_i32
    SVP_18 = 18_i32
    SVP_19 = 19_i32
    SVP_20 = 20_i32
    SVP_21 = 21_i32
  end
  enum SpeechVisemeFeature
    SVF_None = 0_i32
    SVF_Stressed = 1_i32
    SVF_Emphasis = 2_i32
  end
  enum DISPID_SpeechVoiceEvent
    DISPID_SVEStreamStart = 1_i32
    DISPID_SVEStreamEnd = 2_i32
    DISPID_SVEVoiceChange = 3_i32
    DISPID_SVEBookmark = 4_i32
    DISPID_SVEWord = 5_i32
    DISPID_SVEPhoneme = 6_i32
    DISPID_SVESentenceBoundary = 7_i32
    DISPID_SVEViseme = 8_i32
    DISPID_SVEAudioLevel = 9_i32
    DISPID_SVEEnginePrivate = 10_i32
  end
  enum DISPID_SpeechRecognizer
    DISPID_SRRecognizer = 1_i32
    DISPID_SRAllowAudioInputFormatChangesOnNextSet = 2_i32
    DISPID_SRAudioInput = 3_i32
    DISPID_SRAudioInputStream = 4_i32
    DISPID_SRIsShared = 5_i32
    DISPID_SRState = 6_i32
    DISPID_SRStatus = 7_i32
    DISPID_SRProfile = 8_i32
    DISPID_SREmulateRecognition = 9_i32
    DISPID_SRCreateRecoContext = 10_i32
    DISPID_SRGetFormat = 11_i32
    DISPID_SRSetPropertyNumber = 12_i32
    DISPID_SRGetPropertyNumber = 13_i32
    DISPID_SRSetPropertyString = 14_i32
    DISPID_SRGetPropertyString = 15_i32
    DISPID_SRIsUISupported = 16_i32
    DISPID_SRDisplayUI = 17_i32
    DISPID_SRGetRecognizers = 18_i32
    DISPID_SVGetAudioInputs = 19_i32
    DISPID_SVGetProfiles = 20_i32
  end
  enum SpeechRecognizerState
    SRSInactive = 0_i32
    SRSActive = 1_i32
    SRSActiveAlways = 2_i32
    SRSInactiveWithPurge = 3_i32
  end
  enum SpeechDisplayAttributes
    SDA_No_Trailing_Space = 0_i32
    SDA_One_Trailing_Space = 2_i32
    SDA_Two_Trailing_Spaces = 4_i32
    SDA_Consume_Leading_Spaces = 8_i32
  end
  enum SpeechFormatType
    SFTInput = 0_i32
    SFTSREngine = 1_i32
  end
  enum SpeechEmulationCompareFlags
    SECFIgnoreCase = 1_i32
    SECFIgnoreKanaType = 65536_i32
    SECFIgnoreWidth = 131072_i32
    SECFNoSpecialChars = 536870912_i32
    SECFEmulateResult = 1073741824_i32
    SECFDefault = 196609_i32
  end
  enum DISPID_SpeechRecognizerStatus
    DISPID_SRSAudioStatus = 1_i32
    DISPID_SRSCurrentStreamPosition = 2_i32
    DISPID_SRSCurrentStreamNumber = 3_i32
    DISPID_SRSNumberOfActiveRules = 4_i32
    DISPID_SRSClsidEngine = 5_i32
    DISPID_SRSSupportedLanguages = 6_i32
  end
  enum DISPID_SpeechRecoContext
    DISPID_SRCRecognizer = 1_i32
    DISPID_SRCAudioInInterferenceStatus = 2_i32
    DISPID_SRCRequestedUIType = 3_i32
    DISPID_SRCVoice = 4_i32
    DISPID_SRAllowVoiceFormatMatchingOnNextSet = 5_i32
    DISPID_SRCVoicePurgeEvent = 6_i32
    DISPID_SRCEventInterests = 7_i32
    DISPID_SRCCmdMaxAlternates = 8_i32
    DISPID_SRCState = 9_i32
    DISPID_SRCRetainedAudio = 10_i32
    DISPID_SRCRetainedAudioFormat = 11_i32
    DISPID_SRCPause = 12_i32
    DISPID_SRCResume = 13_i32
    DISPID_SRCCreateGrammar = 14_i32
    DISPID_SRCCreateResultFromMemory = 15_i32
    DISPID_SRCBookmark = 16_i32
    DISPID_SRCSetAdaptationData = 17_i32
  end
  enum SpeechRetainedAudioOptions
    SRAONone = 0_i32
    SRAORetainAudio = 1_i32
  end
  enum SpeechBookmarkOptions
    SBONone = 0_i32
    SBOPause = 1_i32
  end
  enum SpeechInterference
    SINone = 0_i32
    SINoise = 1_i32
    SINoSignal = 2_i32
    SITooLoud = 3_i32
    SITooQuiet = 4_i32
    SITooFast = 5_i32
    SITooSlow = 6_i32
  end
  enum SpeechRecoEvents
    SREStreamEnd = 1_i32
    SRESoundStart = 2_i32
    SRESoundEnd = 4_i32
    SREPhraseStart = 8_i32
    SRERecognition = 16_i32
    SREHypothesis = 32_i32
    SREBookmark = 64_i32
    SREPropertyNumChange = 128_i32
    SREPropertyStringChange = 256_i32
    SREFalseRecognition = 512_i32
    SREInterference = 1024_i32
    SRERequestUI = 2048_i32
    SREStateChange = 4096_i32
    SREAdaptation = 8192_i32
    SREStreamStart = 16384_i32
    SRERecoOtherContext = 32768_i32
    SREAudioLevel = 65536_i32
    SREPrivate = 262144_i32
    SREAllEvents = 393215_i32
  end
  enum SpeechRecoContextState
    SRCS_Disabled = 0_i32
    SRCS_Enabled = 1_i32
  end
  enum DISPIDSPRG
    DISPID_SRGId = 1_i32
    DISPID_SRGRecoContext = 2_i32
    DISPID_SRGState = 3_i32
    DISPID_SRGRules = 4_i32
    DISPID_SRGReset = 5_i32
    DISPID_SRGCommit = 6_i32
    DISPID_SRGCmdLoadFromFile = 7_i32
    DISPID_SRGCmdLoadFromObject = 8_i32
    DISPID_SRGCmdLoadFromResource = 9_i32
    DISPID_SRGCmdLoadFromMemory = 10_i32
    DISPID_SRGCmdLoadFromProprietaryGrammar = 11_i32
    DISPID_SRGCmdSetRuleState = 12_i32
    DISPID_SRGCmdSetRuleIdState = 13_i32
    DISPID_SRGDictationLoad = 14_i32
    DISPID_SRGDictationUnload = 15_i32
    DISPID_SRGDictationSetState = 16_i32
    DISPID_SRGSetWordSequenceData = 17_i32
    DISPID_SRGSetTextSelection = 18_i32
    DISPID_SRGIsPronounceable = 19_i32
  end
  enum SpeechLoadOption
    SLOStatic = 0_i32
    SLODynamic = 1_i32
  end
  enum SpeechWordPronounceable
    SWPUnknownWordUnpronounceable = 0_i32
    SWPUnknownWordPronounceable = 1_i32
    SWPKnownWordPronounceable = 2_i32
  end
  enum SpeechGrammarState
    SGSEnabled = 1_i32
    SGSDisabled = 0_i32
    SGSExclusive = 3_i32
  end
  enum SpeechRuleState
    SGDSInactive = 0_i32
    SGDSActive = 1_i32
    SGDSActiveWithAutoPause = 3_i32
    SGDSActiveUserDelimited = 4_i32
  end
  enum SpeechRuleAttributes
    SRATopLevel = 1_i32
    SRADefaultToActive = 2_i32
    SRAExport = 4_i32
    SRAImport = 8_i32
    SRAInterpreter = 16_i32
    SRADynamic = 32_i32
    SRARoot = 64_i32
  end
  enum SpeechGrammarWordType
    SGDisplay = 0_i32
    SGLexical = 1_i32
    SGPronounciation = 2_i32
    SGLexicalNoSpecialChars = 3_i32
  end
  enum DISPID_SpeechRecoContextEvents
    DISPID_SRCEStartStream = 1_i32
    DISPID_SRCEEndStream = 2_i32
    DISPID_SRCEBookmark = 3_i32
    DISPID_SRCESoundStart = 4_i32
    DISPID_SRCESoundEnd = 5_i32
    DISPID_SRCEPhraseStart = 6_i32
    DISPID_SRCERecognition = 7_i32
    DISPID_SRCEHypothesis = 8_i32
    DISPID_SRCEPropertyNumberChange = 9_i32
    DISPID_SRCEPropertyStringChange = 10_i32
    DISPID_SRCEFalseRecognition = 11_i32
    DISPID_SRCEInterference = 12_i32
    DISPID_SRCERequestUI = 13_i32
    DISPID_SRCERecognizerStateChange = 14_i32
    DISPID_SRCEAdaptation = 15_i32
    DISPID_SRCERecognitionForOtherContext = 16_i32
    DISPID_SRCEAudioLevel = 17_i32
    DISPID_SRCEEnginePrivate = 18_i32
  end
  enum SpeechRecognitionType
    SRTStandard = 0_i32
    SRTAutopause = 1_i32
    SRTEmulated = 2_i32
    SRTSMLTimeout = 4_i32
    SRTExtendableParse = 8_i32
    SRTReSent = 16_i32
  end
  enum DISPID_SpeechGrammarRule
    DISPID_SGRAttributes = 1_i32
    DISPID_SGRInitialState = 2_i32
    DISPID_SGRName = 3_i32
    DISPID_SGRId = 4_i32
    DISPID_SGRClear = 5_i32
    DISPID_SGRAddResource = 6_i32
    DISPID_SGRAddState = 7_i32
  end
  enum DISPID_SpeechGrammarRules
    DISPID_SGRsCount = 1_i32
    DISPID_SGRsDynamic = 2_i32
    DISPID_SGRsAdd = 3_i32
    DISPID_SGRsCommit = 4_i32
    DISPID_SGRsCommitAndSave = 5_i32
    DISPID_SGRsFindRule = 6_i32
    DISPID_SGRsItem = 0_i32
    DISPID_SGRs_NewEnum = -4_i32
  end
  enum DISPID_SpeechGrammarRuleState
    DISPID_SGRSRule = 1_i32
    DISPID_SGRSTransitions = 2_i32
    DISPID_SGRSAddWordTransition = 3_i32
    DISPID_SGRSAddRuleTransition = 4_i32
    DISPID_SGRSAddSpecialTransition = 5_i32
  end
  enum SpeechSpecialTransitionType
    SSTTWildcard = 1_i32
    SSTTDictation = 2_i32
    SSTTTextBuffer = 3_i32
  end
  enum DISPID_SpeechGrammarRuleStateTransitions
    DISPID_SGRSTsCount = 1_i32
    DISPID_SGRSTsItem = 0_i32
    DISPID_SGRSTs_NewEnum = -4_i32
  end
  enum DISPID_SpeechGrammarRuleStateTransition
    DISPID_SGRSTType = 1_i32
    DISPID_SGRSTText = 2_i32
    DISPID_SGRSTRule = 3_i32
    DISPID_SGRSTWeight = 4_i32
    DISPID_SGRSTPropertyName = 5_i32
    DISPID_SGRSTPropertyId = 6_i32
    DISPID_SGRSTPropertyValue = 7_i32
    DISPID_SGRSTNextState = 8_i32
  end
  enum SpeechGrammarRuleStateTransitionType
    SGRSTTEpsilon = 0_i32
    SGRSTTWord = 1_i32
    SGRSTTRule = 2_i32
    SGRSTTDictation = 3_i32
    SGRSTTWildcard = 4_i32
    SGRSTTTextBuffer = 5_i32
  end
  enum DISPIDSPTSI
    DISPIDSPTSI_ActiveOffset = 1_i32
    DISPIDSPTSI_ActiveLength = 2_i32
    DISPIDSPTSI_SelectionOffset = 3_i32
    DISPIDSPTSI_SelectionLength = 4_i32
  end
  enum DISPID_SpeechRecoResult
    DISPID_SRRRecoContext = 1_i32
    DISPID_SRRTimes = 2_i32
    DISPID_SRRAudioFormat = 3_i32
    DISPID_SRRPhraseInfo = 4_i32
    DISPID_SRRAlternates = 5_i32
    DISPID_SRRAudio = 6_i32
    DISPID_SRRSpeakAudio = 7_i32
    DISPID_SRRSaveToMemory = 8_i32
    DISPID_SRRDiscardResultInfo = 9_i32
  end
  enum SpeechDiscardType
    SDTProperty = 1_i32
    SDTReplacement = 2_i32
    SDTRule = 4_i32
    SDTDisplayText = 8_i32
    SDTLexicalForm = 16_i32
    SDTPronunciation = 32_i32
    SDTAudio = 64_i32
    SDTAlternates = 128_i32
    SDTAll = 255_i32
  end
  enum DISPID_SpeechXMLRecoResult
    DISPID_SRRGetXMLResult = 10_i32
    DISPID_SRRGetXMLErrorInfo = 11_i32
  end
  enum DISPID_SpeechRecoResult2
    DISPID_SRRSetTextFeedback = 12_i32
  end
  enum DISPID_SpeechPhraseBuilder
    DISPID_SPPBRestorePhraseFromMemory = 1_i32
  end
  enum DISPID_SpeechRecoResultTimes
    DISPID_SRRTStreamTime = 1_i32
    DISPID_SRRTLength = 2_i32
    DISPID_SRRTTickCount = 3_i32
    DISPID_SRRTOffsetFromStart = 4_i32
  end
  enum DISPID_SpeechPhraseAlternate
    DISPID_SPARecoResult = 1_i32
    DISPID_SPAStartElementInResult = 2_i32
    DISPID_SPANumberOfElementsInResult = 3_i32
    DISPID_SPAPhraseInfo = 4_i32
    DISPID_SPACommit = 5_i32
  end
  enum DISPID_SpeechPhraseAlternates
    DISPID_SPAsCount = 1_i32
    DISPID_SPAsItem = 0_i32
    DISPID_SPAs_NewEnum = -4_i32
  end
  enum DISPID_SpeechPhraseInfo
    DISPID_SPILanguageId = 1_i32
    DISPID_SPIGrammarId = 2_i32
    DISPID_SPIStartTime = 3_i32
    DISPID_SPIAudioStreamPosition = 4_i32
    DISPID_SPIAudioSizeBytes = 5_i32
    DISPID_SPIRetainedSizeBytes = 6_i32
    DISPID_SPIAudioSizeTime = 7_i32
    DISPID_SPIRule = 8_i32
    DISPID_SPIProperties = 9_i32
    DISPID_SPIElements = 10_i32
    DISPID_SPIReplacements = 11_i32
    DISPID_SPIEngineId = 12_i32
    DISPID_SPIEnginePrivateData = 13_i32
    DISPID_SPISaveToMemory = 14_i32
    DISPID_SPIGetText = 15_i32
    DISPID_SPIGetDisplayAttributes = 16_i32
  end
  enum DISPID_SpeechPhraseElement
    DISPID_SPEAudioTimeOffset = 1_i32
    DISPID_SPEAudioSizeTime = 2_i32
    DISPID_SPEAudioStreamOffset = 3_i32
    DISPID_SPEAudioSizeBytes = 4_i32
    DISPID_SPERetainedStreamOffset = 5_i32
    DISPID_SPERetainedSizeBytes = 6_i32
    DISPID_SPEDisplayText = 7_i32
    DISPID_SPELexicalForm = 8_i32
    DISPID_SPEPronunciation = 9_i32
    DISPID_SPEDisplayAttributes = 10_i32
    DISPID_SPERequiredConfidence = 11_i32
    DISPID_SPEActualConfidence = 12_i32
    DISPID_SPEEngineConfidence = 13_i32
  end
  enum SpeechEngineConfidence
    SECLowConfidence = -1_i32
    SECNormalConfidence = 0_i32
    SECHighConfidence = 1_i32
  end
  enum DISPID_SpeechPhraseElements
    DISPID_SPEsCount = 1_i32
    DISPID_SPEsItem = 0_i32
    DISPID_SPEs_NewEnum = -4_i32
  end
  enum DISPID_SpeechPhraseReplacement
    DISPID_SPRDisplayAttributes = 1_i32
    DISPID_SPRText = 2_i32
    DISPID_SPRFirstElement = 3_i32
    DISPID_SPRNumberOfElements = 4_i32
  end
  enum DISPID_SpeechPhraseReplacements
    DISPID_SPRsCount = 1_i32
    DISPID_SPRsItem = 0_i32
    DISPID_SPRs_NewEnum = -4_i32
  end
  enum DISPID_SpeechPhraseProperty
    DISPID_SPPName = 1_i32
    DISPID_SPPId = 2_i32
    DISPID_SPPValue = 3_i32
    DISPID_SPPFirstElement = 4_i32
    DISPID_SPPNumberOfElements = 5_i32
    DISPID_SPPEngineConfidence = 6_i32
    DISPID_SPPConfidence = 7_i32
    DISPID_SPPParent = 8_i32
    DISPID_SPPChildren = 9_i32
  end
  enum DISPID_SpeechPhraseProperties
    DISPID_SPPsCount = 1_i32
    DISPID_SPPsItem = 0_i32
    DISPID_SPPs_NewEnum = -4_i32
  end
  enum DISPID_SpeechPhraseRule
    DISPID_SPRuleName = 1_i32
    DISPID_SPRuleId = 2_i32
    DISPID_SPRuleFirstElement = 3_i32
    DISPID_SPRuleNumberOfElements = 4_i32
    DISPID_SPRuleParent = 5_i32
    DISPID_SPRuleChildren = 6_i32
    DISPID_SPRuleConfidence = 7_i32
    DISPID_SPRuleEngineConfidence = 8_i32
  end
  enum DISPID_SpeechPhraseRules
    DISPID_SPRulesCount = 1_i32
    DISPID_SPRulesItem = 0_i32
    DISPID_SPRules_NewEnum = -4_i32
  end
  enum DISPID_SpeechLexicon
    DISPID_SLGenerationId = 1_i32
    DISPID_SLGetWords = 2_i32
    DISPID_SLAddPronunciation = 3_i32
    DISPID_SLAddPronunciationByPhoneIds = 4_i32
    DISPID_SLRemovePronunciation = 5_i32
    DISPID_SLRemovePronunciationByPhoneIds = 6_i32
    DISPID_SLGetPronunciations = 7_i32
    DISPID_SLGetGenerationChange = 8_i32
  end
  enum SpeechLexiconType
    SLTUser = 1_i32
    SLTApp = 2_i32
  end
  enum SpeechPartOfSpeech
    SPSNotOverriden = -1_i32
    SPSUnknown = 0_i32
    SPSNoun = 4096_i32
    SPSVerb = 8192_i32
    SPSModifier = 12288_i32
    SPSFunction = 16384_i32
    SPSInterjection = 20480_i32
    SPSLMA = 28672_i32
    SPSSuppressWord = 61440_i32
  end
  enum DISPID_SpeechLexiconWords
    DISPID_SLWsCount = 1_i32
    DISPID_SLWsItem = 0_i32
    DISPID_SLWs_NewEnum = -4_i32
  end
  enum SpeechWordType
    SWTAdded = 1_i32
    SWTDeleted = 2_i32
  end
  enum DISPID_SpeechLexiconWord
    DISPID_SLWLangId = 1_i32
    DISPID_SLWType = 2_i32
    DISPID_SLWWord = 3_i32
    DISPID_SLWPronunciations = 4_i32
  end
  enum DISPID_SpeechLexiconProns
    DISPID_SLPsCount = 1_i32
    DISPID_SLPsItem = 0_i32
    DISPID_SLPs_NewEnum = -4_i32
  end
  enum DISPID_SpeechLexiconPronunciation
    DISPID_SLPType = 1_i32
    DISPID_SLPLangId = 2_i32
    DISPID_SLPPartOfSpeech = 3_i32
    DISPID_SLPPhoneIds = 4_i32
    DISPID_SLPSymbolic = 5_i32
  end
  enum DISPID_SpeechPhoneConverter
    DISPID_SPCLangId = 1_i32
    DISPID_SPCPhoneToId = 2_i32
    DISPID_SPCIdToPhone = 3_i32
  end

  @[Extern]
  struct SPEVENT
    property _bitfield : Int32
    property ulStreamNum : UInt32
    property ullAudioStreamOffset : UInt64
    property wParam : Win32cr::Foundation::WPARAM
    property lParam : Win32cr::Foundation::LPARAM
    def initialize(@_bitfield : Int32, @ulStreamNum : UInt32, @ullAudioStreamOffset : UInt64, @wParam : Win32cr::Foundation::WPARAM, @lParam : Win32cr::Foundation::LPARAM)
    end
  end

  @[Extern]
  struct SPSERIALIZEDEVENT
    property _bitfield : Int32
    property ulStreamNum : UInt32
    property ullAudioStreamOffset : UInt64
    property serializedw_param : UInt32
    property serializedl_param : Int32
    def initialize(@_bitfield : Int32, @ulStreamNum : UInt32, @ullAudioStreamOffset : UInt64, @serializedw_param : UInt32, @serializedl_param : Int32)
    end
  end

  @[Extern]
  struct SPSERIALIZEDEVENT64
    property _bitfield : Int32
    property ulStreamNum : UInt32
    property ullAudioStreamOffset : UInt64
    property serializedw_param : UInt64
    property serializedl_param : Int64
    def initialize(@_bitfield : Int32, @ulStreamNum : UInt32, @ullAudioStreamOffset : UInt64, @serializedw_param : UInt64, @serializedl_param : Int64)
    end
  end

  @[Extern]
  struct SPEVENTEX
    property _bitfield : Int32
    property ulStreamNum : UInt32
    property ullAudioStreamOffset : UInt64
    property wParam : Win32cr::Foundation::WPARAM
    property lParam : Win32cr::Foundation::LPARAM
    property ullAudioTimeOffset : UInt64
    def initialize(@_bitfield : Int32, @ulStreamNum : UInt32, @ullAudioStreamOffset : UInt64, @wParam : Win32cr::Foundation::WPARAM, @lParam : Win32cr::Foundation::LPARAM, @ullAudioTimeOffset : UInt64)
    end
  end

  @[Extern]
  struct SPEVENTSOURCEINFO
    property ullEventInterest : UInt64
    property ullQueuedInterest : UInt64
    property ulCount : UInt32
    def initialize(@ullEventInterest : UInt64, @ullQueuedInterest : UInt64, @ulCount : UInt32)
    end
  end

  @[Extern]
  struct SPAUDIOSTATUS
    property cbFreeBuffSpace : Int32
    property cbNonBlockingIO : UInt32
    property state : Win32cr::Media::Speech::SPAUDIOSTATE
    property cur_seek_pos : UInt64
    property cur_device_pos : UInt64
    property dwAudioLevel : UInt32
    property dwReserved2 : UInt32
    def initialize(@cbFreeBuffSpace : Int32, @cbNonBlockingIO : UInt32, @state : Win32cr::Media::Speech::SPAUDIOSTATE, @cur_seek_pos : UInt64, @cur_device_pos : UInt64, @dwAudioLevel : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct SPAUDIOBUFFERINFO
    property ulMsMinNotification : UInt32
    property ulMsBufferSize : UInt32
    property ulMsEventBias : UInt32
    def initialize(@ulMsMinNotification : UInt32, @ulMsBufferSize : UInt32, @ulMsEventBias : UInt32)
    end
  end

  @[Extern]
  struct SPPHRASEELEMENT
    property ulAudioTimeOffset : UInt32
    property ulAudioSizeTime : UInt32
    property ulAudioStreamOffset : UInt32
    property ulAudioSizeBytes : UInt32
    property ulRetainedStreamOffset : UInt32
    property ulRetainedSizeBytes : UInt32
    property pszDisplayText : Win32cr::Foundation::PWSTR
    property pszLexicalForm : Win32cr::Foundation::PWSTR
    property pszPronunciation : UInt16*
    property bDisplayAttributes : UInt8
    property required_confidence : Int8
    property actual_confidence : Int8
    property reserved : UInt8
    property sr_engine_confidence : Float32
    def initialize(@ulAudioTimeOffset : UInt32, @ulAudioSizeTime : UInt32, @ulAudioStreamOffset : UInt32, @ulAudioSizeBytes : UInt32, @ulRetainedStreamOffset : UInt32, @ulRetainedSizeBytes : UInt32, @pszDisplayText : Win32cr::Foundation::PWSTR, @pszLexicalForm : Win32cr::Foundation::PWSTR, @pszPronunciation : UInt16*, @bDisplayAttributes : UInt8, @required_confidence : Int8, @actual_confidence : Int8, @reserved : UInt8, @sr_engine_confidence : Float32)
    end
  end

  @[Extern]
  struct SPPHRASERULE
    property pszName : Win32cr::Foundation::PWSTR
    property ulId : UInt32
    property ulFirstElement : UInt32
    property ulCountOfElements : UInt32
    property pNextSibling : Win32cr::Media::Speech::SPPHRASERULE*
    property pFirstChild : Win32cr::Media::Speech::SPPHRASERULE*
    property sr_engine_confidence : Float32
    property confidence : Int8
    def initialize(@pszName : Win32cr::Foundation::PWSTR, @ulId : UInt32, @ulFirstElement : UInt32, @ulCountOfElements : UInt32, @pNextSibling : Win32cr::Media::Speech::SPPHRASERULE*, @pFirstChild : Win32cr::Media::Speech::SPPHRASERULE*, @sr_engine_confidence : Float32, @confidence : Int8)
    end
  end

  @[Extern]
  struct SPPHRASEPROPERTY
    property pszName : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_
    property pszValue : Win32cr::Foundation::PWSTR
    property vValue : Win32cr::System::Com::VARIANT
    property ulFirstElement : UInt32
    property ulCountOfElements : UInt32
    property pNextSibling : Win32cr::Media::Speech::SPPHRASEPROPERTY*
    property pFirstChild : Win32cr::Media::Speech::SPPHRASEPROPERTY*
    property sr_engine_confidence : Float32
    property confidence : Int8

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property ulId : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property bType : UInt8
    property bReserved : UInt8
    property usArrayIndex : UInt16
    def initialize(@bType : UInt8, @bReserved : UInt8, @usArrayIndex : UInt16)
    end
      end

    def initialize(@ulId : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@pszName : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_, @pszValue : Win32cr::Foundation::PWSTR, @vValue : Win32cr::System::Com::VARIANT, @ulFirstElement : UInt32, @ulCountOfElements : UInt32, @pNextSibling : Win32cr::Media::Speech::SPPHRASEPROPERTY*, @pFirstChild : Win32cr::Media::Speech::SPPHRASEPROPERTY*, @sr_engine_confidence : Float32, @confidence : Int8)
    end
  end

  @[Extern]
  struct SPPHRASEREPLACEMENT
    property bDisplayAttributes : UInt8
    property pszReplacementText : Win32cr::Foundation::PWSTR
    property ulFirstElement : UInt32
    property ulCountOfElements : UInt32
    def initialize(@bDisplayAttributes : UInt8, @pszReplacementText : Win32cr::Foundation::PWSTR, @ulFirstElement : UInt32, @ulCountOfElements : UInt32)
    end
  end

  @[Extern]
  struct SPSEMANTICERRORINFO
    property ulLineNumber : UInt32
    property pszScriptLine : Win32cr::Foundation::PWSTR
    property pszSource : Win32cr::Foundation::PWSTR
    property pszDescription : Win32cr::Foundation::PWSTR
    property hrResultCode : Win32cr::Foundation::HRESULT
    def initialize(@ulLineNumber : UInt32, @pszScriptLine : Win32cr::Foundation::PWSTR, @pszSource : Win32cr::Foundation::PWSTR, @pszDescription : Win32cr::Foundation::PWSTR, @hrResultCode : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct SPPHRASE_50
    property cbSize : UInt32
    property lang_id : UInt16
    property wHomophoneGroupId : UInt16
    property ullGrammarID : UInt64
    property ftStartTime : UInt64
    property ullAudioStreamPosition : UInt64
    property ulAudioSizeBytes : UInt32
    property ulRetainedSizeBytes : UInt32
    property ulAudioSizeTime : UInt32
    property rule : Win32cr::Media::Speech::SPPHRASERULE
    property pProperties : Win32cr::Media::Speech::SPPHRASEPROPERTY*
    property pElements : Win32cr::Media::Speech::SPPHRASEELEMENT*
    property cReplacements : UInt32
    property pReplacements : Win32cr::Media::Speech::SPPHRASEREPLACEMENT*
    property sr_engine_id : LibC::GUID
    property ulSREnginePrivateDataSize : UInt32
    property pSREnginePrivateData : UInt8*
    def initialize(@cbSize : UInt32, @lang_id : UInt16, @wHomophoneGroupId : UInt16, @ullGrammarID : UInt64, @ftStartTime : UInt64, @ullAudioStreamPosition : UInt64, @ulAudioSizeBytes : UInt32, @ulRetainedSizeBytes : UInt32, @ulAudioSizeTime : UInt32, @rule : Win32cr::Media::Speech::SPPHRASERULE, @pProperties : Win32cr::Media::Speech::SPPHRASEPROPERTY*, @pElements : Win32cr::Media::Speech::SPPHRASEELEMENT*, @cReplacements : UInt32, @pReplacements : Win32cr::Media::Speech::SPPHRASEREPLACEMENT*, @sr_engine_id : LibC::GUID, @ulSREnginePrivateDataSize : UInt32, @pSREnginePrivateData : UInt8*)
    end
  end

  @[Extern]
  struct SPPHRASE
    property __anonymous_base_sapi53_l5821_c34 : Win32cr::Media::Speech::SPPHRASE_50
    property pSML : Win32cr::Foundation::PWSTR
    property pSemanticErrorInfo : Win32cr::Media::Speech::SPSEMANTICERRORINFO*
    def initialize(@__anonymous_base_sapi53_l5821_c34 : Win32cr::Media::Speech::SPPHRASE_50, @pSML : Win32cr::Foundation::PWSTR, @pSemanticErrorInfo : Win32cr::Media::Speech::SPSEMANTICERRORINFO*)
    end
  end

  @[Extern]
  struct SPSERIALIZEDPHRASE
    property ulSerializedSize : UInt32
    def initialize(@ulSerializedSize : UInt32)
    end
  end

  @[Extern]
  struct SPRULE
    property pszRuleName : Win32cr::Foundation::PWSTR
    property ulRuleId : UInt32
    property dwAttributes : UInt32
    def initialize(@pszRuleName : Win32cr::Foundation::PWSTR, @ulRuleId : UInt32, @dwAttributes : UInt32)
    end
  end

  @[Extern]
  struct SPBINARYGRAMMAR
    property ulTotalSerializedSize : UInt32
    def initialize(@ulTotalSerializedSize : UInt32)
    end
  end

  @[Extern]
  struct SPSTATEHANDLE__
    property unused : Int32
    def initialize(@unused : Int32)
    end
  end

  @[Extern]
  struct SPWORDPRONUNCIATION
    property pNextWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*
    property eLexiconType : Win32cr::Media::Speech::SPLEXICONTYPE
    property lang_id : UInt16
    property wPronunciationFlags : UInt16
    property ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH
    property szPronunciation : UInt16*
    def initialize(@pNextWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*, @eLexiconType : Win32cr::Media::Speech::SPLEXICONTYPE, @lang_id : UInt16, @wPronunciationFlags : UInt16, @ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, @szPronunciation : UInt16*)
    end
  end

  @[Extern]
  struct SPWORDPRONUNCIATIONLIST
    property ulSize : UInt32
    property pvBuffer : UInt8*
    property pFirstWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*
    def initialize(@ulSize : UInt32, @pvBuffer : UInt8*, @pFirstWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*)
    end
  end

  @[Extern]
  struct SPWORD
    property pNextWord : Win32cr::Media::Speech::SPWORD*
    property lang_id : UInt16
    property wReserved : UInt16
    property eWordType : Win32cr::Media::Speech::SPWORDTYPE
    property pszWord : Win32cr::Foundation::PWSTR
    property pFirstWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*
    def initialize(@pNextWord : Win32cr::Media::Speech::SPWORD*, @lang_id : UInt16, @wReserved : UInt16, @eWordType : Win32cr::Media::Speech::SPWORDTYPE, @pszWord : Win32cr::Foundation::PWSTR, @pFirstWordPronunciation : Win32cr::Media::Speech::SPWORDPRONUNCIATION*)
    end
  end

  @[Extern]
  struct SPWORDLIST
    property ulSize : UInt32
    property pvBuffer : UInt8*
    property pFirstWord : Win32cr::Media::Speech::SPWORD*
    def initialize(@ulSize : UInt32, @pvBuffer : UInt8*, @pFirstWord : Win32cr::Media::Speech::SPWORD*)
    end
  end

  @[Extern]
  struct SPSHORTCUTPAIR
    property pNextSHORTCUTPAIR : Win32cr::Media::Speech::SPSHORTCUTPAIR*
    property lang_id : UInt16
    property shType : Win32cr::Media::Speech::SPSHORTCUTTYPE
    property pszDisplay : Win32cr::Foundation::PWSTR
    property pszSpoken : Win32cr::Foundation::PWSTR
    def initialize(@pNextSHORTCUTPAIR : Win32cr::Media::Speech::SPSHORTCUTPAIR*, @lang_id : UInt16, @shType : Win32cr::Media::Speech::SPSHORTCUTTYPE, @pszDisplay : Win32cr::Foundation::PWSTR, @pszSpoken : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SPSHORTCUTPAIRLIST
    property ulSize : UInt32
    property pvBuffer : UInt8*
    property pFirstShortcutPair : Win32cr::Media::Speech::SPSHORTCUTPAIR*
    def initialize(@ulSize : UInt32, @pvBuffer : UInt8*, @pFirstShortcutPair : Win32cr::Media::Speech::SPSHORTCUTPAIR*)
    end
  end

  @[Extern]
  struct SPVPITCH
    property middle_adj : Int32
    property range_adj : Int32
    def initialize(@middle_adj : Int32, @range_adj : Int32)
    end
  end

  @[Extern]
  struct SPVCONTEXT
    property pCategory : Win32cr::Foundation::PWSTR
    property pBefore : Win32cr::Foundation::PWSTR
    property pAfter : Win32cr::Foundation::PWSTR
    def initialize(@pCategory : Win32cr::Foundation::PWSTR, @pBefore : Win32cr::Foundation::PWSTR, @pAfter : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SPVSTATE
    property eAction : Win32cr::Media::Speech::SPVACTIONS
    property lang_id : UInt16
    property wReserved : UInt16
    property emph_adj : Int32
    property rate_adj : Int32
    property volume : UInt32
    property pitch_adj : Win32cr::Media::Speech::SPVPITCH
    property silence_m_secs : UInt32
    property pPhoneIds : UInt16*
    property ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH
    property context : Win32cr::Media::Speech::SPVCONTEXT
    def initialize(@eAction : Win32cr::Media::Speech::SPVACTIONS, @lang_id : UInt16, @wReserved : UInt16, @emph_adj : Int32, @rate_adj : Int32, @volume : UInt32, @pitch_adj : Win32cr::Media::Speech::SPVPITCH, @silence_m_secs : UInt32, @pPhoneIds : UInt16*, @ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, @context : Win32cr::Media::Speech::SPVCONTEXT)
    end
  end

  @[Extern]
  struct SPVOICESTATUS
    property ulCurrentStream : UInt32
    property ulLastStreamQueued : UInt32
    property hrLastResult : Win32cr::Foundation::HRESULT
    property dwRunningState : UInt32
    property ulInputWordPos : UInt32
    property ulInputWordLen : UInt32
    property ulInputSentPos : UInt32
    property ulInputSentLen : UInt32
    property lBookmarkId : Int32
    property phoneme_id : UInt16
    property viseme_id : Win32cr::Media::Speech::SPVISEMES
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    def initialize(@ulCurrentStream : UInt32, @ulLastStreamQueued : UInt32, @hrLastResult : Win32cr::Foundation::HRESULT, @dwRunningState : UInt32, @ulInputWordPos : UInt32, @ulInputWordLen : UInt32, @ulInputSentPos : UInt32, @ulInputSentLen : UInt32, @lBookmarkId : Int32, @phoneme_id : UInt16, @viseme_id : Win32cr::Media::Speech::SPVISEMES, @dwReserved1 : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct SPRECORESULTTIMES
    property ftStreamTime : Win32cr::Foundation::FILETIME
    property ullLength : UInt64
    property dwTickCount : UInt32
    property ullStart : UInt64
    def initialize(@ftStreamTime : Win32cr::Foundation::FILETIME, @ullLength : UInt64, @dwTickCount : UInt32, @ullStart : UInt64)
    end
  end

  @[Extern]
  struct SPSERIALIZEDRESULT
    property ulSerializedSize : UInt32
    def initialize(@ulSerializedSize : UInt32)
    end
  end

  @[Extern]
  struct SPTEXTSELECTIONINFO
    property ulStartActiveOffset : UInt32
    property cchActiveChars : UInt32
    property ulStartSelection : UInt32
    property cchSelection : UInt32
    def initialize(@ulStartActiveOffset : UInt32, @cchActiveChars : UInt32, @ulStartSelection : UInt32, @cchSelection : UInt32)
    end
  end

  @[Extern]
  struct SPPROPERTYINFO
    property pszName : Win32cr::Foundation::PWSTR
    property ulId : UInt32
    property pszValue : Win32cr::Foundation::PWSTR
    property vValue : Win32cr::System::Com::VARIANT
    def initialize(@pszName : Win32cr::Foundation::PWSTR, @ulId : UInt32, @pszValue : Win32cr::Foundation::PWSTR, @vValue : Win32cr::System::Com::VARIANT)
    end
  end

  @[Extern]
  struct SPRECOCONTEXTSTATUS
    property eInterference : Win32cr::Media::Speech::SPINTERFERENCE
    property szRequestTypeOfUI : UInt16[255]
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    def initialize(@eInterference : Win32cr::Media::Speech::SPINTERFERENCE, @szRequestTypeOfUI : UInt16[255], @dwReserved1 : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct SPRECOGNIZERSTATUS
    property audio_status : Win32cr::Media::Speech::SPAUDIOSTATUS
    property ullRecognitionStreamPos : UInt64
    property ulStreamNumber : UInt32
    property ulNumActive : UInt32
    property clsidEngine : LibC::GUID
    property cLangIDs : UInt32
    property aLangID : UInt16[20]
    property ullRecognitionStreamTime : UInt64
    def initialize(@audio_status : Win32cr::Media::Speech::SPAUDIOSTATUS, @ullRecognitionStreamPos : UInt64, @ulStreamNumber : UInt32, @ulNumActive : UInt32, @clsidEngine : LibC::GUID, @cLangIDs : UInt32, @aLangID : UInt16[20], @ullRecognitionStreamTime : UInt64)
    end
  end

  @[Extern]
  struct SPNORMALIZATIONLIST
    property ulSize : UInt32
    property ppszzNormalizedList : UInt16**
    def initialize(@ulSize : UInt32, @ppszzNormalizedList : UInt16**)
    end
  end

  @[Extern]
  struct SPDISPLAYTOKEN
    property pszLexical : Win32cr::Foundation::PWSTR
    property pszDisplay : Win32cr::Foundation::PWSTR
    property bDisplayAttributes : UInt8
    def initialize(@pszLexical : Win32cr::Foundation::PWSTR, @pszDisplay : Win32cr::Foundation::PWSTR, @bDisplayAttributes : UInt8)
    end
  end

  @[Extern]
  struct SPDISPLAYPHRASE
    property ulNumTokens : UInt32
    property pTokens : Win32cr::Media::Speech::SPDISPLAYTOKEN*
    def initialize(@ulNumTokens : UInt32, @pTokens : Win32cr::Media::Speech::SPDISPLAYTOKEN*)
    end
  end

  @[Extern]
  record ISpNotifyCallbackVtbl,
    notify_callback : Proc(ISpNotifyCallback*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpNotifyCallback, lpVtbl : ISpNotifyCallbackVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def notify_callback(this : ISpNotifyCallback*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_callback.call(this, wParam, lParam)
    end

  end

  @[Extern]
  record ISpNotifySourceVtbl,
    query_interface : Proc(ISpNotifySource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpNotifySource*, UInt32),
    release : Proc(ISpNotifySource*, UInt32),
    set_notify_sink : Proc(ISpNotifySource*, Void*, Win32cr::Foundation::HRESULT),
    set_notify_window_message : Proc(ISpNotifySource*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_function : Proc(ISpNotifySource*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_interface : Proc(ISpNotifySource*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_win32_event : Proc(ISpNotifySource*, Win32cr::Foundation::HRESULT),
    wait_for_notify_event : Proc(ISpNotifySource*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_event_handle : Proc(ISpNotifySource*, Win32cr::Foundation::HANDLE)


  @[Extern]
  record ISpNotifySource, lpVtbl : ISpNotifySourceVtbl* do
    GUID = LibC::GUID.new(0x5eff4aef_u32, 0x8487_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x1c_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
    def query_interface(this : ISpNotifySource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpNotifySource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpNotifySource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notify_sink(this : ISpNotifySource*, pNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_sink.call(this, pNotifySink)
    end
    def set_notify_window_message(this : ISpNotifySource*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def set_notify_callback_function(this : ISpNotifySource*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_function.call(this, pfnCallback, wParam, lParam)
    end
    def set_notify_callback_interface(this : ISpNotifySource*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_interface.call(this, pSpCallback, wParam, lParam)
    end
    def set_notify_win32_event(this : ISpNotifySource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_win32_event.call(this)
    end
    def wait_for_notify_event(this : ISpNotifySource*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_notify_event.call(this, dwMilliseconds)
    end
    def get_notify_event_handle(this : ISpNotifySource*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_notify_event_handle.call(this)
    end

  end

  @[Extern]
  record ISpNotifySinkVtbl,
    query_interface : Proc(ISpNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpNotifySink*, UInt32),
    release : Proc(ISpNotifySink*, UInt32),
    notify : Proc(ISpNotifySink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpNotifySink, lpVtbl : ISpNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x259684dc_u32, 0x37c3_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
    def query_interface(this : ISpNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify(this : ISpNotifySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this)
    end

  end

  @[Extern]
  record ISpNotifyTranslatorVtbl,
    query_interface : Proc(ISpNotifyTranslator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpNotifyTranslator*, UInt32),
    release : Proc(ISpNotifyTranslator*, UInt32),
    notify : Proc(ISpNotifyTranslator*, Win32cr::Foundation::HRESULT),
    init_window_message : Proc(ISpNotifyTranslator*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    init_callback : Proc(ISpNotifyTranslator*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    init_sp_notify_callback : Proc(ISpNotifyTranslator*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    init_win32_event : Proc(ISpNotifyTranslator*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    wait : Proc(ISpNotifyTranslator*, UInt32, Win32cr::Foundation::HRESULT),
    get_event_handle : Proc(ISpNotifyTranslator*, Win32cr::Foundation::HANDLE)


  @[Extern]
  record ISpNotifyTranslator, lpVtbl : ISpNotifyTranslatorVtbl* do
    GUID = LibC::GUID.new(0xaca16614_u32, 0x5d3d_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xe_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
    def query_interface(this : ISpNotifyTranslator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpNotifyTranslator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpNotifyTranslator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify(this : ISpNotifyTranslator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this)
    end
    def init_window_message(this : ISpNotifyTranslator*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def init_callback(this : ISpNotifyTranslator*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_callback.call(this, pfnCallback, wParam, lParam)
    end
    def init_sp_notify_callback(this : ISpNotifyTranslator*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_sp_notify_callback.call(this, pSpCallback, wParam, lParam)
    end
    def init_win32_event(this : ISpNotifyTranslator*, hEvent : Win32cr::Foundation::HANDLE, fCloseHandleOnRelease : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_win32_event.call(this, hEvent, fCloseHandleOnRelease)
    end
    def wait(this : ISpNotifyTranslator*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwMilliseconds)
    end
    def get_event_handle(this : ISpNotifyTranslator*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_event_handle.call(this)
    end

  end

  @[Extern]
  record ISpDataKeyVtbl,
    query_interface : Proc(ISpDataKey*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpDataKey*, UInt32),
    release : Proc(ISpDataKey*, UInt32),
    set_data : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_dword : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_dword : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpDataKey*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpDataKey*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpDataKey, lpVtbl : ISpDataKeyVtbl* do
    GUID = LibC::GUID.new(0x14056581_u32, 0xe16c_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x90_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
    def query_interface(this : ISpDataKey*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpDataKey*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpDataKey*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_data(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, cbData : UInt32, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pszValueName, cbData, pData)
    end
    def get_data(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pcbData : UInt32*, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pszValueName, pcbData, pData)
    end
    def set_string_value(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, pszValueName, pszValue)
    end
    def get_string_value(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, pszValueName, ppszValue)
    end
    def set_dword(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dword.call(this, pszValueName, dwValue)
    end
    def get_dword(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword.call(this, pszValueName, pdwValue)
    end
    def open_key(this : ISpDataKey*, pszSubKeyName : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, pszSubKeyName, ppSubKey)
    end
    def create_key(this : ISpDataKey*, pszSubKey : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, pszSubKey, ppSubKey)
    end
    def delete_key(this : ISpDataKey*, pszSubKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, pszSubKey)
    end
    def delete_value(this : ISpDataKey*, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, pszValueName)
    end
    def enum_keys(this : ISpDataKey*, index : UInt32, ppszSubKeyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, ppszSubKeyName)
    end
    def enum_values(this : ISpDataKey*, index : UInt32, ppszValueName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, ppszValueName)
    end

  end

  @[Extern]
  record ISpRegDataKeyVtbl,
    query_interface : Proc(ISpRegDataKey*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRegDataKey*, UInt32),
    release : Proc(ISpRegDataKey*, UInt32),
    set_data : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_dword : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_dword : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpRegDataKey*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpRegDataKey*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpRegDataKey*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_key : Proc(ISpRegDataKey*, Win32cr::System::Registry::HKEY, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRegDataKey, lpVtbl : ISpRegDataKeyVtbl* do
    GUID = LibC::GUID.new(0x92a66e2b_u32, 0xc830_u16, 0x4149_u16, StaticArray[0x83_u8, 0xdf_u8, 0x6f_u8, 0xc2_u8, 0xba_u8, 0x1e_u8, 0x7a_u8, 0x5b_u8])
    def query_interface(this : ISpRegDataKey*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRegDataKey*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRegDataKey*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_data(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, cbData : UInt32, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pszValueName, cbData, pData)
    end
    def get_data(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pcbData : UInt32*, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pszValueName, pcbData, pData)
    end
    def set_string_value(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, pszValueName, pszValue)
    end
    def get_string_value(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, pszValueName, ppszValue)
    end
    def set_dword(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dword.call(this, pszValueName, dwValue)
    end
    def get_dword(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword.call(this, pszValueName, pdwValue)
    end
    def open_key(this : ISpRegDataKey*, pszSubKeyName : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, pszSubKeyName, ppSubKey)
    end
    def create_key(this : ISpRegDataKey*, pszSubKey : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, pszSubKey, ppSubKey)
    end
    def delete_key(this : ISpRegDataKey*, pszSubKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, pszSubKey)
    end
    def delete_value(this : ISpRegDataKey*, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, pszValueName)
    end
    def enum_keys(this : ISpRegDataKey*, index : UInt32, ppszSubKeyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, ppszSubKeyName)
    end
    def enum_values(this : ISpRegDataKey*, index : UInt32, ppszValueName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, ppszValueName)
    end
    def set_key(this : ISpRegDataKey*, hkey : Win32cr::System::Registry::HKEY, fReadOnly : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_key.call(this, hkey, fReadOnly)
    end

  end

  @[Extern]
  record ISpObjectTokenCategoryVtbl,
    query_interface : Proc(ISpObjectTokenCategory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpObjectTokenCategory*, UInt32),
    release : Proc(ISpObjectTokenCategory*, UInt32),
    set_data : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_dword : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_dword : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpObjectTokenCategory*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpObjectTokenCategory*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_id : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_data_key : Proc(ISpObjectTokenCategory*, Win32cr::Media::Speech::SPDATAKEYLOCATION, Void**, Win32cr::Foundation::HRESULT),
    enum_tokens : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    set_default_token_id : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_default_token_id : Proc(ISpObjectTokenCategory*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpObjectTokenCategory, lpVtbl : ISpObjectTokenCategoryVtbl* do
    GUID = LibC::GUID.new(0x2d3d3845_u32, 0x39af_u16, 0x4850_u16, StaticArray[0xbb_u8, 0xf9_u8, 0x40_u8, 0xb4_u8, 0x97_u8, 0x80_u8, 0x1_u8, 0x1d_u8])
    def query_interface(this : ISpObjectTokenCategory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpObjectTokenCategory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpObjectTokenCategory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_data(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, cbData : UInt32, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pszValueName, cbData, pData)
    end
    def get_data(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, pcbData : UInt32*, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pszValueName, pcbData, pData)
    end
    def set_string_value(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, pszValueName, pszValue)
    end
    def get_string_value(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, pszValueName, ppszValue)
    end
    def set_dword(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dword.call(this, pszValueName, dwValue)
    end
    def get_dword(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword.call(this, pszValueName, pdwValue)
    end
    def open_key(this : ISpObjectTokenCategory*, pszSubKeyName : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, pszSubKeyName, ppSubKey)
    end
    def create_key(this : ISpObjectTokenCategory*, pszSubKey : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, pszSubKey, ppSubKey)
    end
    def delete_key(this : ISpObjectTokenCategory*, pszSubKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, pszSubKey)
    end
    def delete_value(this : ISpObjectTokenCategory*, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, pszValueName)
    end
    def enum_keys(this : ISpObjectTokenCategory*, index : UInt32, ppszSubKeyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, ppszSubKeyName)
    end
    def enum_values(this : ISpObjectTokenCategory*, index : UInt32, ppszValueName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, ppszValueName)
    end
    def set_id(this : ISpObjectTokenCategory*, pszCategoryId : Win32cr::Foundation::PWSTR, fCreateIfNotExist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, pszCategoryId, fCreateIfNotExist)
    end
    def get_id(this : ISpObjectTokenCategory*, ppszCoMemCategoryId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, ppszCoMemCategoryId)
    end
    def get_data_key(this : ISpObjectTokenCategory*, spdkl : Win32cr::Media::Speech::SPDATAKEYLOCATION, ppDataKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_key.call(this, spdkl, ppDataKey)
    end
    def enum_tokens(this : ISpObjectTokenCategory*, pzsReqAttribs : Win32cr::Foundation::PWSTR, pszOptAttribs : Win32cr::Foundation::PWSTR, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_tokens.call(this, pzsReqAttribs, pszOptAttribs, ppEnum)
    end
    def set_default_token_id(this : ISpObjectTokenCategory*, pszTokenId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_token_id.call(this, pszTokenId)
    end
    def get_default_token_id(this : ISpObjectTokenCategory*, ppszCoMemTokenId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_token_id.call(this, ppszCoMemTokenId)
    end

  end

  @[Extern]
  record ISpObjectTokenVtbl,
    query_interface : Proc(ISpObjectToken*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpObjectToken*, UInt32),
    release : Proc(ISpObjectToken*, UInt32),
    set_data : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_dword : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_dword : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpObjectToken*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpObjectToken*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_id : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_category : Proc(ISpObjectToken*, Void**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ISpObjectToken*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_storage_file_name : Proc(ISpObjectToken*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    remove_storage_file_name : Proc(ISpObjectToken*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remove : Proc(ISpObjectToken*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Void*, UInt32, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpObjectToken*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    matches_attributes : Proc(ISpObjectToken*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpObjectToken, lpVtbl : ISpObjectTokenVtbl* do
    GUID = LibC::GUID.new(0x14056589_u32, 0xe16c_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x90_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
    def query_interface(this : ISpObjectToken*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpObjectToken*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpObjectToken*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_data(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, cbData : UInt32, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pszValueName, cbData, pData)
    end
    def get_data(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, pcbData : UInt32*, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pszValueName, pcbData, pData)
    end
    def set_string_value(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, pszValueName, pszValue)
    end
    def get_string_value(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, pszValueName, ppszValue)
    end
    def set_dword(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dword.call(this, pszValueName, dwValue)
    end
    def get_dword(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword.call(this, pszValueName, pdwValue)
    end
    def open_key(this : ISpObjectToken*, pszSubKeyName : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, pszSubKeyName, ppSubKey)
    end
    def create_key(this : ISpObjectToken*, pszSubKey : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, pszSubKey, ppSubKey)
    end
    def delete_key(this : ISpObjectToken*, pszSubKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, pszSubKey)
    end
    def delete_value(this : ISpObjectToken*, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, pszValueName)
    end
    def enum_keys(this : ISpObjectToken*, index : UInt32, ppszSubKeyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, ppszSubKeyName)
    end
    def enum_values(this : ISpObjectToken*, index : UInt32, ppszValueName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, ppszValueName)
    end
    def set_id(this : ISpObjectToken*, pszCategoryId : Win32cr::Foundation::PWSTR, pszTokenId : Win32cr::Foundation::PWSTR, fCreateIfNotExist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, pszCategoryId, pszTokenId, fCreateIfNotExist)
    end
    def get_id(this : ISpObjectToken*, ppszCoMemTokenId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, ppszCoMemTokenId)
    end
    def get_category(this : ISpObjectToken*, ppTokenCategory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, ppTokenCategory)
    end
    def create_instance(this : ISpObjectToken*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def get_storage_file_name(this : ISpObjectToken*, clsidCaller : LibC::GUID*, pszValueName : Win32cr::Foundation::PWSTR, pszFileNameSpecifier : Win32cr::Foundation::PWSTR, nFolder : UInt32, ppszFilePath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_file_name.call(this, clsidCaller, pszValueName, pszFileNameSpecifier, nFolder, ppszFilePath)
    end
    def remove_storage_file_name(this : ISpObjectToken*, clsidCaller : LibC::GUID*, pszKeyName : Win32cr::Foundation::PWSTR, fDeleteFile : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_storage_file_name.call(this, clsidCaller, pszKeyName, fDeleteFile)
    end
    def remove(this : ISpObjectToken*, pclsidCaller : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pclsidCaller)
    end
    def is_ui_supported(this : ISpObjectToken*, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, punkObject : Void*, pfSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, pszTypeOfUI, pvExtraData, cbExtraData, punkObject, pfSupported)
    end
    def display_ui(this : ISpObjectToken*, hwndParent : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, punkObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData, punkObject)
    end
    def matches_attributes(this : ISpObjectToken*, pszAttributes : Win32cr::Foundation::PWSTR, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_attributes.call(this, pszAttributes, pfMatches)
    end

  end

  @[Extern]
  record ISpObjectTokenInitVtbl,
    query_interface : Proc(ISpObjectTokenInit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpObjectTokenInit*, UInt32),
    release : Proc(ISpObjectTokenInit*, UInt32),
    set_data : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_dword : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_dword : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpObjectTokenInit*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpObjectTokenInit*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_id : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_category : Proc(ISpObjectTokenInit*, Void**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ISpObjectTokenInit*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_storage_file_name : Proc(ISpObjectTokenInit*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    remove_storage_file_name : Proc(ISpObjectTokenInit*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remove : Proc(ISpObjectTokenInit*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Void*, UInt32, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpObjectTokenInit*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    matches_attributes : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    init_from_data_key : Proc(ISpObjectTokenInit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpObjectTokenInit, lpVtbl : ISpObjectTokenInitVtbl* do
    GUID = LibC::GUID.new(0xb8aab0cf_u32, 0x346f_u16, 0x49d8_u16, StaticArray[0x94_u8, 0x99_u8, 0xc8_u8, 0xb0_u8, 0x3f_u8, 0x16_u8, 0x1d_u8, 0x51_u8])
    def query_interface(this : ISpObjectTokenInit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpObjectTokenInit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpObjectTokenInit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_data(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, cbData : UInt32, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pszValueName, cbData, pData)
    end
    def get_data(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, pcbData : UInt32*, pData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pszValueName, pcbData, pData)
    end
    def set_string_value(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, pszValueName, pszValue)
    end
    def get_string_value(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, ppszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, pszValueName, ppszValue)
    end
    def set_dword(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dword.call(this, pszValueName, dwValue)
    end
    def get_dword(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword.call(this, pszValueName, pdwValue)
    end
    def open_key(this : ISpObjectTokenInit*, pszSubKeyName : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, pszSubKeyName, ppSubKey)
    end
    def create_key(this : ISpObjectTokenInit*, pszSubKey : Win32cr::Foundation::PWSTR, ppSubKey : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, pszSubKey, ppSubKey)
    end
    def delete_key(this : ISpObjectTokenInit*, pszSubKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, pszSubKey)
    end
    def delete_value(this : ISpObjectTokenInit*, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, pszValueName)
    end
    def enum_keys(this : ISpObjectTokenInit*, index : UInt32, ppszSubKeyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, ppszSubKeyName)
    end
    def enum_values(this : ISpObjectTokenInit*, index : UInt32, ppszValueName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, ppszValueName)
    end
    def set_id(this : ISpObjectTokenInit*, pszCategoryId : Win32cr::Foundation::PWSTR, pszTokenId : Win32cr::Foundation::PWSTR, fCreateIfNotExist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, pszCategoryId, pszTokenId, fCreateIfNotExist)
    end
    def get_id(this : ISpObjectTokenInit*, ppszCoMemTokenId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, ppszCoMemTokenId)
    end
    def get_category(this : ISpObjectTokenInit*, ppTokenCategory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, ppTokenCategory)
    end
    def create_instance(this : ISpObjectTokenInit*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def get_storage_file_name(this : ISpObjectTokenInit*, clsidCaller : LibC::GUID*, pszValueName : Win32cr::Foundation::PWSTR, pszFileNameSpecifier : Win32cr::Foundation::PWSTR, nFolder : UInt32, ppszFilePath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_file_name.call(this, clsidCaller, pszValueName, pszFileNameSpecifier, nFolder, ppszFilePath)
    end
    def remove_storage_file_name(this : ISpObjectTokenInit*, clsidCaller : LibC::GUID*, pszKeyName : Win32cr::Foundation::PWSTR, fDeleteFile : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_storage_file_name.call(this, clsidCaller, pszKeyName, fDeleteFile)
    end
    def remove(this : ISpObjectTokenInit*, pclsidCaller : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pclsidCaller)
    end
    def is_ui_supported(this : ISpObjectTokenInit*, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, punkObject : Void*, pfSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, pszTypeOfUI, pvExtraData, cbExtraData, punkObject, pfSupported)
    end
    def display_ui(this : ISpObjectTokenInit*, hwndParent : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, punkObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData, punkObject)
    end
    def matches_attributes(this : ISpObjectTokenInit*, pszAttributes : Win32cr::Foundation::PWSTR, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_attributes.call(this, pszAttributes, pfMatches)
    end
    def init_from_data_key(this : ISpObjectTokenInit*, pszCategoryId : Win32cr::Foundation::PWSTR, pszTokenId : Win32cr::Foundation::PWSTR, pDataKey : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_from_data_key.call(this, pszCategoryId, pszTokenId, pDataKey)
    end

  end

  @[Extern]
  record IEnumSpObjectTokensVtbl,
    query_interface : Proc(IEnumSpObjectTokens*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSpObjectTokens*, UInt32),
    release : Proc(IEnumSpObjectTokens*, UInt32),
    next__ : Proc(IEnumSpObjectTokens*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSpObjectTokens*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSpObjectTokens*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSpObjectTokens*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IEnumSpObjectTokens*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IEnumSpObjectTokens*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSpObjectTokens, lpVtbl : IEnumSpObjectTokensVtbl* do
    GUID = LibC::GUID.new(0x6b64f9e_u32, 0x7fda_u16, 0x11d2_u16, StaticArray[0xb4_u8, 0xf2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
    def query_interface(this : IEnumSpObjectTokens*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSpObjectTokens*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSpObjectTokens*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSpObjectTokens*, celt : UInt32, pelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, pelt, pceltFetched)
    end
    def skip(this : IEnumSpObjectTokens*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSpObjectTokens*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSpObjectTokens*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def item(this : IEnumSpObjectTokens*, index : UInt32, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ppToken)
    end
    def get_count(this : IEnumSpObjectTokens*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end

  end

  @[Extern]
  record ISpObjectWithTokenVtbl,
    query_interface : Proc(ISpObjectWithToken*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpObjectWithToken*, UInt32),
    release : Proc(ISpObjectWithToken*, UInt32),
    set_object_token : Proc(ISpObjectWithToken*, Void*, Win32cr::Foundation::HRESULT),
    get_object_token : Proc(ISpObjectWithToken*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpObjectWithToken, lpVtbl : ISpObjectWithTokenVtbl* do
    GUID = LibC::GUID.new(0x5b559f40_u32, 0xe952_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
    def query_interface(this : ISpObjectWithToken*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpObjectWithToken*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpObjectWithToken*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_object_token(this : ISpObjectWithToken*, pToken : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_token.call(this, pToken)
    end
    def get_object_token(this : ISpObjectWithToken*, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_token.call(this, ppToken)
    end

  end

  @[Extern]
  record ISpResourceManagerVtbl,
    query_interface : Proc(ISpResourceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpResourceManager*, UInt32),
    release : Proc(ISpResourceManager*, UInt32),
    query_service : Proc(ISpResourceManager*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_object : Proc(ISpResourceManager*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_object : Proc(ISpResourceManager*, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpResourceManager, lpVtbl : ISpResourceManagerVtbl* do
    GUID = LibC::GUID.new(0x93384e18_u32, 0x5014_u16, 0x43d5_u16, StaticArray[0xad_u8, 0xbb_u8, 0xa7_u8, 0x8e_u8, 0x5_u8, 0x59_u8, 0x26_u8, 0xbd_u8])
    def query_interface(this : ISpResourceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpResourceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpResourceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_service(this : ISpResourceManager*, guidService : LibC::GUID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_service.call(this, guidService, riid, ppvObject)
    end
    def set_object(this : ISpResourceManager*, guidServiceId : LibC::GUID*, pUnkObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object.call(this, guidServiceId, pUnkObject)
    end
    def get_object(this : ISpResourceManager*, guidServiceId : LibC::GUID*, object_clsid : LibC::GUID*, object_iid : LibC::GUID*, fReleaseWhenLastExternalRefReleased : Win32cr::Foundation::BOOL, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, guidServiceId, object_clsid, object_iid, fReleaseWhenLastExternalRefReleased, ppObject)
    end

  end

  @[Extern]
  record ISpEventSourceVtbl,
    query_interface : Proc(ISpEventSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpEventSource*, UInt32),
    release : Proc(ISpEventSource*, UInt32),
    set_notify_sink : Proc(ISpEventSource*, Void*, Win32cr::Foundation::HRESULT),
    set_notify_window_message : Proc(ISpEventSource*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_function : Proc(ISpEventSource*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_interface : Proc(ISpEventSource*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_win32_event : Proc(ISpEventSource*, Win32cr::Foundation::HRESULT),
    wait_for_notify_event : Proc(ISpEventSource*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_event_handle : Proc(ISpEventSource*, Win32cr::Foundation::HANDLE),
    set_interest : Proc(ISpEventSource*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    get_events : Proc(ISpEventSource*, UInt32, Win32cr::Media::Speech::SPEVENT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_info : Proc(ISpEventSource*, Win32cr::Media::Speech::SPEVENTSOURCEINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpEventSource, lpVtbl : ISpEventSourceVtbl* do
    GUID = LibC::GUID.new(0xbe7a9cce_u32, 0x5f9e_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
    def query_interface(this : ISpEventSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpEventSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpEventSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notify_sink(this : ISpEventSource*, pNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_sink.call(this, pNotifySink)
    end
    def set_notify_window_message(this : ISpEventSource*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def set_notify_callback_function(this : ISpEventSource*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_function.call(this, pfnCallback, wParam, lParam)
    end
    def set_notify_callback_interface(this : ISpEventSource*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_interface.call(this, pSpCallback, wParam, lParam)
    end
    def set_notify_win32_event(this : ISpEventSource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_win32_event.call(this)
    end
    def wait_for_notify_event(this : ISpEventSource*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_notify_event.call(this, dwMilliseconds)
    end
    def get_notify_event_handle(this : ISpEventSource*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_notify_event_handle.call(this)
    end
    def set_interest(this : ISpEventSource*, ullEventInterest : UInt64, ullQueuedInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interest.call(this, ullEventInterest, ullQueuedInterest)
    end
    def get_events(this : ISpEventSource*, ulCount : UInt32, pEventArray : Win32cr::Media::Speech::SPEVENT*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_events.call(this, ulCount, pEventArray, pulFetched)
    end
    def get_info(this : ISpEventSource*, pInfo : Win32cr::Media::Speech::SPEVENTSOURCEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end

  end

  @[Extern]
  record ISpEventSource2Vtbl,
    query_interface : Proc(ISpEventSource2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpEventSource2*, UInt32),
    release : Proc(ISpEventSource2*, UInt32),
    set_notify_sink : Proc(ISpEventSource2*, Void*, Win32cr::Foundation::HRESULT),
    set_notify_window_message : Proc(ISpEventSource2*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_function : Proc(ISpEventSource2*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_interface : Proc(ISpEventSource2*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_win32_event : Proc(ISpEventSource2*, Win32cr::Foundation::HRESULT),
    wait_for_notify_event : Proc(ISpEventSource2*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_event_handle : Proc(ISpEventSource2*, Win32cr::Foundation::HANDLE),
    set_interest : Proc(ISpEventSource2*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    get_events : Proc(ISpEventSource2*, UInt32, Win32cr::Media::Speech::SPEVENT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_info : Proc(ISpEventSource2*, Win32cr::Media::Speech::SPEVENTSOURCEINFO*, Win32cr::Foundation::HRESULT),
    get_events_ex : Proc(ISpEventSource2*, UInt32, Win32cr::Media::Speech::SPEVENTEX*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpEventSource2, lpVtbl : ISpEventSource2Vtbl* do
    GUID = LibC::GUID.new(0x2373a435_u32, 0x6a4b_u16, 0x429e_u16, StaticArray[0xa6_u8, 0xac_u8, 0xd4_u8, 0x23_u8, 0x1a_u8, 0x61_u8, 0x97_u8, 0x5b_u8])
    def query_interface(this : ISpEventSource2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpEventSource2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpEventSource2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notify_sink(this : ISpEventSource2*, pNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_sink.call(this, pNotifySink)
    end
    def set_notify_window_message(this : ISpEventSource2*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def set_notify_callback_function(this : ISpEventSource2*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_function.call(this, pfnCallback, wParam, lParam)
    end
    def set_notify_callback_interface(this : ISpEventSource2*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_interface.call(this, pSpCallback, wParam, lParam)
    end
    def set_notify_win32_event(this : ISpEventSource2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_win32_event.call(this)
    end
    def wait_for_notify_event(this : ISpEventSource2*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_notify_event.call(this, dwMilliseconds)
    end
    def get_notify_event_handle(this : ISpEventSource2*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_notify_event_handle.call(this)
    end
    def set_interest(this : ISpEventSource2*, ullEventInterest : UInt64, ullQueuedInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interest.call(this, ullEventInterest, ullQueuedInterest)
    end
    def get_events(this : ISpEventSource2*, ulCount : UInt32, pEventArray : Win32cr::Media::Speech::SPEVENT*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_events.call(this, ulCount, pEventArray, pulFetched)
    end
    def get_info(this : ISpEventSource2*, pInfo : Win32cr::Media::Speech::SPEVENTSOURCEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_events_ex(this : ISpEventSource2*, ulCount : UInt32, pEventArray : Win32cr::Media::Speech::SPEVENTEX*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_events_ex.call(this, ulCount, pEventArray, pulFetched)
    end

  end

  @[Extern]
  record ISpEventSinkVtbl,
    query_interface : Proc(ISpEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpEventSink*, UInt32),
    release : Proc(ISpEventSink*, UInt32),
    add_events : Proc(ISpEventSink*, Win32cr::Media::Speech::SPEVENT*, UInt32, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(ISpEventSink*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpEventSink, lpVtbl : ISpEventSinkVtbl* do
    GUID = LibC::GUID.new(0xbe7a9cc9_u32, 0x5f9e_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
    def query_interface(this : ISpEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_events(this : ISpEventSink*, pEventArray : Win32cr::Media::Speech::SPEVENT*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_events.call(this, pEventArray, ulCount)
    end
    def get_event_interest(this : ISpEventSink*, pullEventInterest : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_interest.call(this, pullEventInterest)
    end

  end

  @[Extern]
  record ISpStreamFormatVtbl,
    query_interface : Proc(ISpStreamFormat*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpStreamFormat*, UInt32),
    release : Proc(ISpStreamFormat*, UInt32),
    read : Proc(ISpStreamFormat*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpStreamFormat*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpStreamFormat*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ISpStreamFormat*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(ISpStreamFormat*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpStreamFormat*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(ISpStreamFormat*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ISpStreamFormat*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ISpStreamFormat*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ISpStreamFormat*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(ISpStreamFormat*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpStreamFormat*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpStreamFormat, lpVtbl : ISpStreamFormatVtbl* do
    GUID = LibC::GUID.new(0xbed530be_u32, 0x2606_u16, 0x4f4d_u16, StaticArray[0xa1_u8, 0xc0_u8, 0x54_u8, 0xc5_u8, 0xcd_u8, 0xa5_u8, 0x56_u8, 0x6f_u8])
    def query_interface(this : ISpStreamFormat*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpStreamFormat*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpStreamFormat*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISpStreamFormat*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISpStreamFormat*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : ISpStreamFormat*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : ISpStreamFormat*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : ISpStreamFormat*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : ISpStreamFormat*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : ISpStreamFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : ISpStreamFormat*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ISpStreamFormat*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ISpStreamFormat*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : ISpStreamFormat*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_format(this : ISpStreamFormat*, pguidFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pguidFormatId, ppCoMemWaveFormatEx)
    end

  end

  @[Extern]
  record ISpStreamVtbl,
    query_interface : Proc(ISpStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpStream*, UInt32),
    release : Proc(ISpStream*, UInt32),
    read : Proc(ISpStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpStream*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ISpStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(ISpStream*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(ISpStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ISpStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ISpStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ISpStream*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(ISpStream*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpStream*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    set_base_stream : Proc(ISpStream*, Void*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_base_stream : Proc(ISpStream*, Void**, Win32cr::Foundation::HRESULT),
    bind_to_file : Proc(ISpStream*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPFILEMODE, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, UInt64, Win32cr::Foundation::HRESULT),
    close : Proc(ISpStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpStream, lpVtbl : ISpStreamVtbl* do
    GUID = LibC::GUID.new(0x12e3cca9_u32, 0x7518_u16, 0x44c5_u16, StaticArray[0xa5_u8, 0xe7_u8, 0xba_u8, 0x5a_u8, 0x79_u8, 0xcb_u8, 0x92_u8, 0x9e_u8])
    def query_interface(this : ISpStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISpStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISpStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : ISpStream*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : ISpStream*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : ISpStream*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : ISpStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : ISpStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : ISpStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ISpStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ISpStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : ISpStream*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_format(this : ISpStream*, pguidFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pguidFormatId, ppCoMemWaveFormatEx)
    end
    def set_base_stream(this : ISpStream*, pStream : Void*, rguidFormat : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_base_stream.call(this, pStream, rguidFormat, pWaveFormatEx)
    end
    def get_base_stream(this : ISpStream*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_base_stream.call(this, ppStream)
    end
    def bind_to_file(this : ISpStream*, pszFileName : Win32cr::Foundation::PWSTR, eMode : Win32cr::Media::Speech::SPFILEMODE, pFormatId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*, ullEventInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_file.call(this, pszFileName, eMode, pFormatId, pWaveFormatEx, ullEventInterest)
    end
    def close(this : ISpStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record ISpStreamFormatConverterVtbl,
    query_interface : Proc(ISpStreamFormatConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpStreamFormatConverter*, UInt32),
    release : Proc(ISpStreamFormatConverter*, UInt32),
    read : Proc(ISpStreamFormatConverter*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpStreamFormatConverter*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(ISpStreamFormatConverter*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpStreamFormatConverter*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ISpStreamFormatConverter*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(ISpStreamFormatConverter*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpStreamFormatConverter*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    set_base_stream : Proc(ISpStreamFormatConverter*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_base_stream : Proc(ISpStreamFormatConverter*, Void**, Win32cr::Foundation::HRESULT),
    set_format : Proc(ISpStreamFormatConverter*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    reset_seek_position : Proc(ISpStreamFormatConverter*, Win32cr::Foundation::HRESULT),
    scale_converted_to_base_offset : Proc(ISpStreamFormatConverter*, UInt64, UInt64*, Win32cr::Foundation::HRESULT),
    scale_base_to_converted_offset : Proc(ISpStreamFormatConverter*, UInt64, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpStreamFormatConverter, lpVtbl : ISpStreamFormatConverterVtbl* do
    GUID = LibC::GUID.new(0x678a932c_u32, 0xea71_u16, 0x4446_u16, StaticArray[0x9b_u8, 0x41_u8, 0x78_u8, 0xfd_u8, 0xa6_u8, 0x28_u8, 0xa_u8, 0x29_u8])
    def query_interface(this : ISpStreamFormatConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpStreamFormatConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpStreamFormatConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISpStreamFormatConverter*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISpStreamFormatConverter*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : ISpStreamFormatConverter*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : ISpStreamFormatConverter*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : ISpStreamFormatConverter*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : ISpStreamFormatConverter*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : ISpStreamFormatConverter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : ISpStreamFormatConverter*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ISpStreamFormatConverter*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ISpStreamFormatConverter*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : ISpStreamFormatConverter*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_format(this : ISpStreamFormatConverter*, pguidFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pguidFormatId, ppCoMemWaveFormatEx)
    end
    def set_base_stream(this : ISpStreamFormatConverter*, pStream : Void*, fSetFormatToBaseStreamFormat : Win32cr::Foundation::BOOL, fWriteToBaseStream : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_base_stream.call(this, pStream, fSetFormatToBaseStreamFormat, fWriteToBaseStream)
    end
    def get_base_stream(this : ISpStreamFormatConverter*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_base_stream.call(this, ppStream)
    end
    def set_format(this : ISpStreamFormatConverter*, rguidFormatIdOfConvertedStream : LibC::GUID*, pWaveFormatExOfConvertedStream : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, rguidFormatIdOfConvertedStream, pWaveFormatExOfConvertedStream)
    end
    def reset_seek_position(this : ISpStreamFormatConverter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_seek_position.call(this)
    end
    def scale_converted_to_base_offset(this : ISpStreamFormatConverter*, ullOffsetConvertedStream : UInt64, pullOffsetBaseStream : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_converted_to_base_offset.call(this, ullOffsetConvertedStream, pullOffsetBaseStream)
    end
    def scale_base_to_converted_offset(this : ISpStreamFormatConverter*, ullOffsetBaseStream : UInt64, pullOffsetConvertedStream : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_base_to_converted_offset.call(this, ullOffsetBaseStream, pullOffsetConvertedStream)
    end

  end

  @[Extern]
  record ISpAudioVtbl,
    query_interface : Proc(ISpAudio*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpAudio*, UInt32),
    release : Proc(ISpAudio*, UInt32),
    read : Proc(ISpAudio*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpAudio*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpAudio*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ISpAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(ISpAudio*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpAudio*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(ISpAudio*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ISpAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ISpAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ISpAudio*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(ISpAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    set_state : Proc(ISpAudio*, Win32cr::Media::Speech::SPAUDIOSTATE, UInt64, Win32cr::Foundation::HRESULT),
    set_format : Proc(ISpAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ISpAudio*, Win32cr::Media::Speech::SPAUDIOSTATUS*, Win32cr::Foundation::HRESULT),
    set_buffer_info : Proc(ISpAudio*, Win32cr::Media::Speech::SPAUDIOBUFFERINFO*, Win32cr::Foundation::HRESULT),
    get_buffer_info : Proc(ISpAudio*, Win32cr::Media::Speech::SPAUDIOBUFFERINFO*, Win32cr::Foundation::HRESULT),
    get_default_format : Proc(ISpAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    event_handle : Proc(ISpAudio*, Win32cr::Foundation::HANDLE),
    get_volume_level : Proc(ISpAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_volume_level : Proc(ISpAudio*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_notify_size : Proc(ISpAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_buffer_notify_size : Proc(ISpAudio*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpAudio, lpVtbl : ISpAudioVtbl* do
    GUID = LibC::GUID.new(0xc05c768f_u32, 0xfae8_u16, 0x4ec2_u16, StaticArray[0x8e_u8, 0x7_u8, 0x33_u8, 0x83_u8, 0x21_u8, 0xc1_u8, 0x24_u8, 0x52_u8])
    def query_interface(this : ISpAudio*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpAudio*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpAudio*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISpAudio*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISpAudio*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : ISpAudio*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : ISpAudio*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : ISpAudio*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : ISpAudio*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : ISpAudio*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : ISpAudio*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ISpAudio*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ISpAudio*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : ISpAudio*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_format(this : ISpAudio*, pguidFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pguidFormatId, ppCoMemWaveFormatEx)
    end
    def set_state(this : ISpAudio*, new_state : Win32cr::Media::Speech::SPAUDIOSTATE, ullReserved : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, new_state, ullReserved)
    end
    def set_format(this : ISpAudio*, rguidFmtId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, rguidFmtId, pWaveFormatEx)
    end
    def get_status(this : ISpAudio*, pStatus : Win32cr::Media::Speech::SPAUDIOSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def set_buffer_info(this : ISpAudio*, pBuffInfo : Win32cr::Media::Speech::SPAUDIOBUFFERINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_info.call(this, pBuffInfo)
    end
    def get_buffer_info(this : ISpAudio*, pBuffInfo : Win32cr::Media::Speech::SPAUDIOBUFFERINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_info.call(this, pBuffInfo)
    end
    def get_default_format(this : ISpAudio*, pFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_format.call(this, pFormatId, ppCoMemWaveFormatEx)
    end
    def event_handle(this : ISpAudio*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.event_handle.call(this)
    end
    def get_volume_level(this : ISpAudio*, pLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_level.call(this, pLevel)
    end
    def set_volume_level(this : ISpAudio*, level : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume_level.call(this, level)
    end
    def get_buffer_notify_size(this : ISpAudio*, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_notify_size.call(this, pcbSize)
    end
    def set_buffer_notify_size(this : ISpAudio*, cbSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_notify_size.call(this, cbSize)
    end

  end

  @[Extern]
  record ISpMMSysAudioVtbl,
    query_interface : Proc(ISpMMSysAudio*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpMMSysAudio*, UInt32),
    release : Proc(ISpMMSysAudio*, UInt32),
    read : Proc(ISpMMSysAudio*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpMMSysAudio*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpMMSysAudio*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ISpMMSysAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(ISpMMSysAudio*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpMMSysAudio*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(ISpMMSysAudio*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ISpMMSysAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ISpMMSysAudio*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ISpMMSysAudio*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(ISpMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpMMSysAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    set_state : Proc(ISpMMSysAudio*, Win32cr::Media::Speech::SPAUDIOSTATE, UInt64, Win32cr::Foundation::HRESULT),
    set_format : Proc(ISpMMSysAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ISpMMSysAudio*, Win32cr::Media::Speech::SPAUDIOSTATUS*, Win32cr::Foundation::HRESULT),
    set_buffer_info : Proc(ISpMMSysAudio*, Win32cr::Media::Speech::SPAUDIOBUFFERINFO*, Win32cr::Foundation::HRESULT),
    get_buffer_info : Proc(ISpMMSysAudio*, Win32cr::Media::Speech::SPAUDIOBUFFERINFO*, Win32cr::Foundation::HRESULT),
    get_default_format : Proc(ISpMMSysAudio*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    event_handle : Proc(ISpMMSysAudio*, Win32cr::Foundation::HANDLE),
    get_volume_level : Proc(ISpMMSysAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_volume_level : Proc(ISpMMSysAudio*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_notify_size : Proc(ISpMMSysAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_buffer_notify_size : Proc(ISpMMSysAudio*, UInt32, Win32cr::Foundation::HRESULT),
    get_device_id : Proc(ISpMMSysAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_device_id : Proc(ISpMMSysAudio*, UInt32, Win32cr::Foundation::HRESULT),
    get_mm_handle : Proc(ISpMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_line_id : Proc(ISpMMSysAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    set_line_id : Proc(ISpMMSysAudio*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpMMSysAudio, lpVtbl : ISpMMSysAudioVtbl* do
    GUID = LibC::GUID.new(0x15806f6e_u32, 0x1d70_u16, 0x4b48_u16, StaticArray[0x98_u8, 0xe6_u8, 0x3b_u8, 0x1a_u8, 0x0_u8, 0x75_u8, 0x9_u8, 0xab_u8])
    def query_interface(this : ISpMMSysAudio*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpMMSysAudio*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpMMSysAudio*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISpMMSysAudio*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISpMMSysAudio*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : ISpMMSysAudio*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : ISpMMSysAudio*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : ISpMMSysAudio*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : ISpMMSysAudio*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : ISpMMSysAudio*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : ISpMMSysAudio*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ISpMMSysAudio*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ISpMMSysAudio*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : ISpMMSysAudio*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_format(this : ISpMMSysAudio*, pguidFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pguidFormatId, ppCoMemWaveFormatEx)
    end
    def set_state(this : ISpMMSysAudio*, new_state : Win32cr::Media::Speech::SPAUDIOSTATE, ullReserved : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, new_state, ullReserved)
    end
    def set_format(this : ISpMMSysAudio*, rguidFmtId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, rguidFmtId, pWaveFormatEx)
    end
    def get_status(this : ISpMMSysAudio*, pStatus : Win32cr::Media::Speech::SPAUDIOSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def set_buffer_info(this : ISpMMSysAudio*, pBuffInfo : Win32cr::Media::Speech::SPAUDIOBUFFERINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_info.call(this, pBuffInfo)
    end
    def get_buffer_info(this : ISpMMSysAudio*, pBuffInfo : Win32cr::Media::Speech::SPAUDIOBUFFERINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_info.call(this, pBuffInfo)
    end
    def get_default_format(this : ISpMMSysAudio*, pFormatId : LibC::GUID*, ppCoMemWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_format.call(this, pFormatId, ppCoMemWaveFormatEx)
    end
    def event_handle(this : ISpMMSysAudio*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.event_handle.call(this)
    end
    def get_volume_level(this : ISpMMSysAudio*, pLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_level.call(this, pLevel)
    end
    def set_volume_level(this : ISpMMSysAudio*, level : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume_level.call(this, level)
    end
    def get_buffer_notify_size(this : ISpMMSysAudio*, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_notify_size.call(this, pcbSize)
    end
    def set_buffer_notify_size(this : ISpMMSysAudio*, cbSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_notify_size.call(this, cbSize)
    end
    def get_device_id(this : ISpMMSysAudio*, puDeviceId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_id.call(this, puDeviceId)
    end
    def set_device_id(this : ISpMMSysAudio*, uDeviceId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device_id.call(this, uDeviceId)
    end
    def get_mm_handle(this : ISpMMSysAudio*, pHandle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mm_handle.call(this, pHandle)
    end
    def get_line_id(this : ISpMMSysAudio*, puLineId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_id.call(this, puLineId)
    end
    def set_line_id(this : ISpMMSysAudio*, uLineId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_line_id.call(this, uLineId)
    end

  end

  @[Extern]
  record ISpTranscriptVtbl,
    query_interface : Proc(ISpTranscript*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpTranscript*, UInt32),
    release : Proc(ISpTranscript*, UInt32),
    get_transcript : Proc(ISpTranscript*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    append_transcript : Proc(ISpTranscript*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpTranscript, lpVtbl : ISpTranscriptVtbl* do
    GUID = LibC::GUID.new(0x10f63bce_u32, 0x201a_u16, 0x11d3_u16, StaticArray[0xac_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
    def query_interface(this : ISpTranscript*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpTranscript*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpTranscript*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_transcript(this : ISpTranscript*, ppszTranscript : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transcript.call(this, ppszTranscript)
    end
    def append_transcript(this : ISpTranscript*, pszTranscript : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append_transcript.call(this, pszTranscript)
    end

  end

  @[Extern]
  record ISpLexiconVtbl,
    query_interface : Proc(ISpLexicon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpLexicon*, UInt32),
    release : Proc(ISpLexicon*, UInt32),
    get_pronunciations : Proc(ISpLexicon*, Win32cr::Foundation::PWSTR, UInt16, UInt32, Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*, Win32cr::Foundation::HRESULT),
    add_pronunciation : Proc(ISpLexicon*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPPARTOFSPEECH, UInt16*, Win32cr::Foundation::HRESULT),
    remove_pronunciation : Proc(ISpLexicon*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPPARTOFSPEECH, UInt16*, Win32cr::Foundation::HRESULT),
    get_generation : Proc(ISpLexicon*, UInt32*, Win32cr::Foundation::HRESULT),
    get_generation_change : Proc(ISpLexicon*, UInt32, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT),
    get_words : Proc(ISpLexicon*, UInt32, UInt32*, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpLexicon, lpVtbl : ISpLexiconVtbl* do
    GUID = LibC::GUID.new(0xda41a7c2_u32, 0x5383_u16, 0x4db2_u16, StaticArray[0x91_u8, 0x6b_u8, 0x6c_u8, 0x17_u8, 0x19_u8, 0xe3_u8, 0xdb_u8, 0x58_u8])
    def query_interface(this : ISpLexicon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpLexicon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpLexicon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_pronunciations(this : ISpLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, dwFlags : UInt32, pWordPronunciationList : Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pronunciations.call(this, pszWord, lang_id, dwFlags, pWordPronunciationList)
    end
    def add_pronunciation(this : ISpLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, pszPronunciation : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pronunciation.call(this, pszWord, lang_id, ePartOfSpeech, pszPronunciation)
    end
    def remove_pronunciation(this : ISpLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, pszPronunciation : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_pronunciation.call(this, pszWord, lang_id, ePartOfSpeech, pszPronunciation)
    end
    def get_generation(this : ISpLexicon*, pdwGeneration : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation.call(this, pdwGeneration)
    end
    def get_generation_change(this : ISpLexicon*, dwFlags : UInt32, pdwGeneration : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_change.call(this, dwFlags, pdwGeneration, pWordList)
    end
    def get_words(this : ISpLexicon*, dwFlags : UInt32, pdwGeneration : UInt32*, pdwCookie : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words.call(this, dwFlags, pdwGeneration, pdwCookie, pWordList)
    end

  end

  @[Extern]
  record ISpContainerLexiconVtbl,
    query_interface : Proc(ISpContainerLexicon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpContainerLexicon*, UInt32),
    release : Proc(ISpContainerLexicon*, UInt32),
    get_pronunciations : Proc(ISpContainerLexicon*, Win32cr::Foundation::PWSTR, UInt16, UInt32, Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*, Win32cr::Foundation::HRESULT),
    add_pronunciation : Proc(ISpContainerLexicon*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPPARTOFSPEECH, UInt16*, Win32cr::Foundation::HRESULT),
    remove_pronunciation : Proc(ISpContainerLexicon*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPPARTOFSPEECH, UInt16*, Win32cr::Foundation::HRESULT),
    get_generation : Proc(ISpContainerLexicon*, UInt32*, Win32cr::Foundation::HRESULT),
    get_generation_change : Proc(ISpContainerLexicon*, UInt32, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT),
    get_words : Proc(ISpContainerLexicon*, UInt32, UInt32*, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT),
    add_lexicon : Proc(ISpContainerLexicon*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpContainerLexicon, lpVtbl : ISpContainerLexiconVtbl* do
    GUID = LibC::GUID.new(0x8565572f_u32, 0xc094_u16, 0x41cc_u16, StaticArray[0xb5_u8, 0x6e_u8, 0x10_u8, 0xbd_u8, 0x9c_u8, 0x3f_u8, 0xf0_u8, 0x44_u8])
    def query_interface(this : ISpContainerLexicon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpContainerLexicon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpContainerLexicon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_pronunciations(this : ISpContainerLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, dwFlags : UInt32, pWordPronunciationList : Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pronunciations.call(this, pszWord, lang_id, dwFlags, pWordPronunciationList)
    end
    def add_pronunciation(this : ISpContainerLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, pszPronunciation : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pronunciation.call(this, pszWord, lang_id, ePartOfSpeech, pszPronunciation)
    end
    def remove_pronunciation(this : ISpContainerLexicon*, pszWord : Win32cr::Foundation::PWSTR, lang_id : UInt16, ePartOfSpeech : Win32cr::Media::Speech::SPPARTOFSPEECH, pszPronunciation : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_pronunciation.call(this, pszWord, lang_id, ePartOfSpeech, pszPronunciation)
    end
    def get_generation(this : ISpContainerLexicon*, pdwGeneration : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation.call(this, pdwGeneration)
    end
    def get_generation_change(this : ISpContainerLexicon*, dwFlags : UInt32, pdwGeneration : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_change.call(this, dwFlags, pdwGeneration, pWordList)
    end
    def get_words(this : ISpContainerLexicon*, dwFlags : UInt32, pdwGeneration : UInt32*, pdwCookie : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words.call(this, dwFlags, pdwGeneration, pdwCookie, pWordList)
    end
    def add_lexicon(this : ISpContainerLexicon*, pAddLexicon : Void*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_lexicon.call(this, pAddLexicon, dwFlags)
    end

  end

  @[Extern]
  record ISpShortcutVtbl,
    query_interface : Proc(ISpShortcut*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpShortcut*, UInt32),
    release : Proc(ISpShortcut*, UInt32),
    add_shortcut : Proc(ISpShortcut*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPSHORTCUTTYPE, Win32cr::Foundation::HRESULT),
    remove_shortcut : Proc(ISpShortcut*, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPSHORTCUTTYPE, Win32cr::Foundation::HRESULT),
    get_shortcuts : Proc(ISpShortcut*, UInt16, Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*, Win32cr::Foundation::HRESULT),
    get_generation : Proc(ISpShortcut*, UInt32*, Win32cr::Foundation::HRESULT),
    get_words_from_generation_change : Proc(ISpShortcut*, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT),
    get_words : Proc(ISpShortcut*, UInt32*, UInt32*, Win32cr::Media::Speech::SPWORDLIST*, Win32cr::Foundation::HRESULT),
    get_shortcuts_for_generation : Proc(ISpShortcut*, UInt32*, UInt32*, Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*, Win32cr::Foundation::HRESULT),
    get_generation_change : Proc(ISpShortcut*, UInt32*, Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpShortcut, lpVtbl : ISpShortcutVtbl* do
    GUID = LibC::GUID.new(0x3df681e2_u32, 0xea56_u16, 0x11d9_u16, StaticArray[0x8b_u8, 0xde_u8, 0xf6_u8, 0x6b_u8, 0xad_u8, 0x1e_u8, 0x3f_u8, 0x3a_u8])
    def query_interface(this : ISpShortcut*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpShortcut*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpShortcut*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_shortcut(this : ISpShortcut*, pszDisplay : Win32cr::Foundation::PWSTR, lang_id : UInt16, pszSpoken : Win32cr::Foundation::PWSTR, shType : Win32cr::Media::Speech::SPSHORTCUTTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_shortcut.call(this, pszDisplay, lang_id, pszSpoken, shType)
    end
    def remove_shortcut(this : ISpShortcut*, pszDisplay : Win32cr::Foundation::PWSTR, lang_id : UInt16, pszSpoken : Win32cr::Foundation::PWSTR, shType : Win32cr::Media::Speech::SPSHORTCUTTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_shortcut.call(this, pszDisplay, lang_id, pszSpoken, shType)
    end
    def get_shortcuts(this : ISpShortcut*, lang_id : UInt16, pShortcutpairList : Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shortcuts.call(this, lang_id, pShortcutpairList)
    end
    def get_generation(this : ISpShortcut*, pdwGeneration : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation.call(this, pdwGeneration)
    end
    def get_words_from_generation_change(this : ISpShortcut*, pdwGeneration : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words_from_generation_change.call(this, pdwGeneration, pWordList)
    end
    def get_words(this : ISpShortcut*, pdwGeneration : UInt32*, pdwCookie : UInt32*, pWordList : Win32cr::Media::Speech::SPWORDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words.call(this, pdwGeneration, pdwCookie, pWordList)
    end
    def get_shortcuts_for_generation(this : ISpShortcut*, pdwGeneration : UInt32*, pdwCookie : UInt32*, pShortcutpairList : Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shortcuts_for_generation.call(this, pdwGeneration, pdwCookie, pShortcutpairList)
    end
    def get_generation_change(this : ISpShortcut*, pdwGeneration : UInt32*, pShortcutpairList : Win32cr::Media::Speech::SPSHORTCUTPAIRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_change.call(this, pdwGeneration, pShortcutpairList)
    end

  end

  @[Extern]
  record ISpPhoneConverterVtbl,
    query_interface : Proc(ISpPhoneConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhoneConverter*, UInt32),
    release : Proc(ISpPhoneConverter*, UInt32),
    set_object_token : Proc(ISpPhoneConverter*, Void*, Win32cr::Foundation::HRESULT),
    get_object_token : Proc(ISpPhoneConverter*, Void**, Win32cr::Foundation::HRESULT),
    phone_to_id : Proc(ISpPhoneConverter*, Win32cr::Foundation::PWSTR, UInt16*, Win32cr::Foundation::HRESULT),
    id_to_phone : Proc(ISpPhoneConverter*, UInt16*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhoneConverter, lpVtbl : ISpPhoneConverterVtbl* do
    GUID = LibC::GUID.new(0x8445c581_u32, 0xcac_u16, 0x4a38_u16, StaticArray[0xab_u8, 0xfe_u8, 0x9b_u8, 0x2c_u8, 0xe2_u8, 0x82_u8, 0x64_u8, 0x55_u8])
    def query_interface(this : ISpPhoneConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhoneConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhoneConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_object_token(this : ISpPhoneConverter*, pToken : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_token.call(this, pToken)
    end
    def get_object_token(this : ISpPhoneConverter*, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_token.call(this, ppToken)
    end
    def phone_to_id(this : ISpPhoneConverter*, pszPhone : Win32cr::Foundation::PWSTR, pId : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.phone_to_id.call(this, pszPhone, pId)
    end
    def id_to_phone(this : ISpPhoneConverter*, pId : UInt16*, pszPhone : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.id_to_phone.call(this, pId, pszPhone)
    end

  end

  @[Extern]
  record ISpPhoneticAlphabetConverterVtbl,
    query_interface : Proc(ISpPhoneticAlphabetConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhoneticAlphabetConverter*, UInt32),
    release : Proc(ISpPhoneticAlphabetConverter*, UInt32),
    get_lang_id : Proc(ISpPhoneticAlphabetConverter*, UInt16*, Win32cr::Foundation::HRESULT),
    set_lang_id : Proc(ISpPhoneticAlphabetConverter*, UInt16, Win32cr::Foundation::HRESULT),
    sapi2_ups : Proc(ISpPhoneticAlphabetConverter*, UInt16*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    ups2_sapi : Proc(ISpPhoneticAlphabetConverter*, UInt16*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_convert_length : Proc(ISpPhoneticAlphabetConverter*, UInt32, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhoneticAlphabetConverter, lpVtbl : ISpPhoneticAlphabetConverterVtbl* do
    GUID = LibC::GUID.new(0x133adcd4_u32, 0x19b4_u16, 0x4020_u16, StaticArray[0x9f_u8, 0xdc_u8, 0x84_u8, 0x2e_u8, 0x78_u8, 0x25_u8, 0x3b_u8, 0x17_u8])
    def query_interface(this : ISpPhoneticAlphabetConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhoneticAlphabetConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhoneticAlphabetConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_lang_id(this : ISpPhoneticAlphabetConverter*, pLangID : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lang_id.call(this, pLangID)
    end
    def set_lang_id(this : ISpPhoneticAlphabetConverter*, lang_id : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lang_id.call(this, lang_id)
    end
    def sapi2_ups(this : ISpPhoneticAlphabetConverter*, pszSAPIId : UInt16*, pszUPSId : UInt16*, cMaxLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sapi2_ups.call(this, pszSAPIId, pszUPSId, cMaxLength)
    end
    def ups2_sapi(this : ISpPhoneticAlphabetConverter*, pszUPSId : UInt16*, pszSAPIId : UInt16*, cMaxLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ups2_sapi.call(this, pszUPSId, pszSAPIId, cMaxLength)
    end
    def get_max_convert_length(this : ISpPhoneticAlphabetConverter*, cSrcLength : UInt32, bSAPI2UPS : Win32cr::Foundation::BOOL, pcMaxDestLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_convert_length.call(this, cSrcLength, bSAPI2UPS, pcMaxDestLength)
    end

  end

  @[Extern]
  record ISpPhoneticAlphabetSelectionVtbl,
    query_interface : Proc(ISpPhoneticAlphabetSelection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhoneticAlphabetSelection*, UInt32),
    release : Proc(ISpPhoneticAlphabetSelection*, UInt32),
    is_alphabet_ups : Proc(ISpPhoneticAlphabetSelection*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_alphabet_to_ups : Proc(ISpPhoneticAlphabetSelection*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhoneticAlphabetSelection, lpVtbl : ISpPhoneticAlphabetSelectionVtbl* do
    GUID = LibC::GUID.new(0xb2745efd_u32, 0x42ce_u16, 0x48ca_u16, StaticArray[0x81_u8, 0xf1_u8, 0xa9_u8, 0x6e_u8, 0x2_u8, 0x53_u8, 0x8a_u8, 0x90_u8])
    def query_interface(this : ISpPhoneticAlphabetSelection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhoneticAlphabetSelection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhoneticAlphabetSelection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_alphabet_ups(this : ISpPhoneticAlphabetSelection*, pfIsUPS : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_alphabet_ups.call(this, pfIsUPS)
    end
    def set_alphabet_to_ups(this : ISpPhoneticAlphabetSelection*, fForceUPS : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alphabet_to_ups.call(this, fForceUPS)
    end

  end

  @[Extern]
  record ISpVoiceVtbl,
    query_interface : Proc(ISpVoice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpVoice*, UInt32),
    release : Proc(ISpVoice*, UInt32),
    set_notify_sink : Proc(ISpVoice*, Void*, Win32cr::Foundation::HRESULT),
    set_notify_window_message : Proc(ISpVoice*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_function : Proc(ISpVoice*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_interface : Proc(ISpVoice*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_win32_event : Proc(ISpVoice*, Win32cr::Foundation::HRESULT),
    wait_for_notify_event : Proc(ISpVoice*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_event_handle : Proc(ISpVoice*, Win32cr::Foundation::HANDLE),
    set_interest : Proc(ISpVoice*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    get_events : Proc(ISpVoice*, UInt32, Win32cr::Media::Speech::SPEVENT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_info : Proc(ISpVoice*, Win32cr::Media::Speech::SPEVENTSOURCEINFO*, Win32cr::Foundation::HRESULT),
    set_output : Proc(ISpVoice*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_output_object_token : Proc(ISpVoice*, Void**, Win32cr::Foundation::HRESULT),
    get_output_stream : Proc(ISpVoice*, Void**, Win32cr::Foundation::HRESULT),
    pause : Proc(ISpVoice*, Win32cr::Foundation::HRESULT),
    resume : Proc(ISpVoice*, Win32cr::Foundation::HRESULT),
    set_voice : Proc(ISpVoice*, Void*, Win32cr::Foundation::HRESULT),
    get_voice : Proc(ISpVoice*, Void**, Win32cr::Foundation::HRESULT),
    speak : Proc(ISpVoice*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    speak_stream : Proc(ISpVoice*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ISpVoice*, Win32cr::Media::Speech::SPVOICESTATUS*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    skip : Proc(ISpVoice*, Win32cr::Foundation::PWSTR, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(ISpVoice*, Win32cr::Media::Speech::SPVPRIORITY, Win32cr::Foundation::HRESULT),
    get_priority : Proc(ISpVoice*, Win32cr::Media::Speech::SPVPRIORITY*, Win32cr::Foundation::HRESULT),
    set_alert_boundary : Proc(ISpVoice*, Win32cr::Media::Speech::SPEVENTENUM, Win32cr::Foundation::HRESULT),
    get_alert_boundary : Proc(ISpVoice*, Win32cr::Media::Speech::SPEVENTENUM*, Win32cr::Foundation::HRESULT),
    set_rate : Proc(ISpVoice*, Int32, Win32cr::Foundation::HRESULT),
    get_rate : Proc(ISpVoice*, Int32*, Win32cr::Foundation::HRESULT),
    set_volume : Proc(ISpVoice*, UInt16, Win32cr::Foundation::HRESULT),
    get_volume : Proc(ISpVoice*, UInt16*, Win32cr::Foundation::HRESULT),
    wait_until_done : Proc(ISpVoice*, UInt32, Win32cr::Foundation::HRESULT),
    set_sync_speak_timeout : Proc(ISpVoice*, UInt32, Win32cr::Foundation::HRESULT),
    get_sync_speak_timeout : Proc(ISpVoice*, UInt32*, Win32cr::Foundation::HRESULT),
    speak_complete_event : Proc(ISpVoice*, Win32cr::Foundation::HANDLE),
    is_ui_supported : Proc(ISpVoice*, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpVoice*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpVoice, lpVtbl : ISpVoiceVtbl* do
    GUID = LibC::GUID.new(0x6c44df74_u32, 0x72b9_u16, 0x4992_u16, StaticArray[0xa1_u8, 0xec_u8, 0xef_u8, 0x99_u8, 0x6e_u8, 0x4_u8, 0x22_u8, 0xd4_u8])
    def query_interface(this : ISpVoice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpVoice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpVoice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notify_sink(this : ISpVoice*, pNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_sink.call(this, pNotifySink)
    end
    def set_notify_window_message(this : ISpVoice*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def set_notify_callback_function(this : ISpVoice*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_function.call(this, pfnCallback, wParam, lParam)
    end
    def set_notify_callback_interface(this : ISpVoice*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_interface.call(this, pSpCallback, wParam, lParam)
    end
    def set_notify_win32_event(this : ISpVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_win32_event.call(this)
    end
    def wait_for_notify_event(this : ISpVoice*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_notify_event.call(this, dwMilliseconds)
    end
    def get_notify_event_handle(this : ISpVoice*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_notify_event_handle.call(this)
    end
    def set_interest(this : ISpVoice*, ullEventInterest : UInt64, ullQueuedInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interest.call(this, ullEventInterest, ullQueuedInterest)
    end
    def get_events(this : ISpVoice*, ulCount : UInt32, pEventArray : Win32cr::Media::Speech::SPEVENT*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_events.call(this, ulCount, pEventArray, pulFetched)
    end
    def get_info(this : ISpVoice*, pInfo : Win32cr::Media::Speech::SPEVENTSOURCEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def set_output(this : ISpVoice*, pUnkOutput : Void*, fAllowFormatChanges : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output.call(this, pUnkOutput, fAllowFormatChanges)
    end
    def get_output_object_token(this : ISpVoice*, ppObjectToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_object_token.call(this, ppObjectToken)
    end
    def get_output_stream(this : ISpVoice*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_stream.call(this, ppStream)
    end
    def pause(this : ISpVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : ISpVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def set_voice(this : ISpVoice*, pToken : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_voice.call(this, pToken)
    end
    def get_voice(this : ISpVoice*, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voice.call(this, ppToken)
    end
    def speak(this : ISpVoice*, pwcs : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pulStreamNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak.call(this, pwcs, dwFlags, pulStreamNumber)
    end
    def speak_stream(this : ISpVoice*, pStream : Void*, dwFlags : UInt32, pulStreamNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_stream.call(this, pStream, dwFlags, pulStreamNumber)
    end
    def get_status(this : ISpVoice*, pStatus : Win32cr::Media::Speech::SPVOICESTATUS*, ppszLastBookmark : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus, ppszLastBookmark)
    end
    def skip(this : ISpVoice*, pItemType : Win32cr::Foundation::PWSTR, lNumItems : Int32, pulNumSkipped : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, pItemType, lNumItems, pulNumSkipped)
    end
    def set_priority(this : ISpVoice*, ePriority : Win32cr::Media::Speech::SPVPRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, ePriority)
    end
    def get_priority(this : ISpVoice*, pePriority : Win32cr::Media::Speech::SPVPRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pePriority)
    end
    def set_alert_boundary(this : ISpVoice*, eBoundary : Win32cr::Media::Speech::SPEVENTENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alert_boundary.call(this, eBoundary)
    end
    def get_alert_boundary(this : ISpVoice*, peBoundary : Win32cr::Media::Speech::SPEVENTENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alert_boundary.call(this, peBoundary)
    end
    def set_rate(this : ISpVoice*, rate_adjust : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rate.call(this, rate_adjust)
    end
    def get_rate(this : ISpVoice*, pRateAdjust : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rate.call(this, pRateAdjust)
    end
    def set_volume(this : ISpVoice*, usVolume : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_volume.call(this, usVolume)
    end
    def get_volume(this : ISpVoice*, pusVolume : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume.call(this, pusVolume)
    end
    def wait_until_done(this : ISpVoice*, msTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_until_done.call(this, msTimeout)
    end
    def set_sync_speak_timeout(this : ISpVoice*, msTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sync_speak_timeout.call(this, msTimeout)
    end
    def get_sync_speak_timeout(this : ISpVoice*, pmsTimeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_speak_timeout.call(this, pmsTimeout)
    end
    def speak_complete_event(this : ISpVoice*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.speak_complete_event.call(this)
    end
    def is_ui_supported(this : ISpVoice*, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, pfSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, pszTypeOfUI, pvExtraData, cbExtraData, pfSupported)
    end
    def display_ui(this : ISpVoice*, hwndParent : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData)
    end

  end

  @[Extern]
  record ISpPhraseVtbl,
    query_interface : Proc(ISpPhrase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhrase*, UInt32),
    release : Proc(ISpPhrase*, UInt32),
    get_phrase : Proc(ISpPhrase*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpPhrase*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpPhrase*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpPhrase*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhrase, lpVtbl : ISpPhraseVtbl* do
    GUID = LibC::GUID.new(0x1a5c0354_u32, 0xb621_u16, 0x4b5a_u16, StaticArray[0x87_u8, 0x91_u8, 0xd3_u8, 0x6_u8, 0xed_u8, 0x37_u8, 0x9e_u8, 0x53_u8])
    def query_interface(this : ISpPhrase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhrase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhrase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpPhrase*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpPhrase*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpPhrase*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpPhrase*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end

  end

  @[Extern]
  record ISpPhraseAltVtbl,
    query_interface : Proc(ISpPhraseAlt*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhraseAlt*, UInt32),
    release : Proc(ISpPhraseAlt*, UInt32),
    get_phrase : Proc(ISpPhraseAlt*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpPhraseAlt*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpPhraseAlt*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpPhraseAlt*, UInt32, Win32cr::Foundation::HRESULT),
    get_alt_info : Proc(ISpPhraseAlt*, Void**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpPhraseAlt*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhraseAlt, lpVtbl : ISpPhraseAltVtbl* do
    GUID = LibC::GUID.new(0x8fcebc98_u32, 0x4e49_u16, 0x4067_u16, StaticArray[0x9c_u8, 0x6c_u8, 0xd8_u8, 0x6a_u8, 0xe_u8, 0x9_u8, 0x2e_u8, 0x3d_u8])
    def query_interface(this : ISpPhraseAlt*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhraseAlt*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhraseAlt*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpPhraseAlt*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpPhraseAlt*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpPhraseAlt*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpPhraseAlt*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end
    def get_alt_info(this : ISpPhraseAlt*, ppParent : Void**, pulStartElementInParent : UInt32*, pcElementsInParent : UInt32*, pcElementsInAlt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alt_info.call(this, ppParent, pulStartElementInParent, pcElementsInParent, pcElementsInAlt)
    end
    def commit(this : ISpPhraseAlt*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end

  end

  @[Extern]
  record ISpPhrase2Vtbl,
    query_interface : Proc(ISpPhrase2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpPhrase2*, UInt32),
    release : Proc(ISpPhrase2*, UInt32),
    get_phrase : Proc(ISpPhrase2*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpPhrase2*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpPhrase2*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpPhrase2*, UInt32, Win32cr::Foundation::HRESULT),
    get_xml_result : Proc(ISpPhrase2*, Win32cr::Foundation::PWSTR*, Win32cr::Media::Speech::SPXMLRESULTOPTIONS, Win32cr::Foundation::HRESULT),
    get_xml_error_info : Proc(ISpPhrase2*, Win32cr::Media::Speech::SPSEMANTICERRORINFO*, Win32cr::Foundation::HRESULT),
    get_audio : Proc(ISpPhrase2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpPhrase2, lpVtbl : ISpPhrase2Vtbl* do
    GUID = LibC::GUID.new(0xf264da52_u32, 0xe457_u16, 0x4696_u16, StaticArray[0xb8_u8, 0x56_u8, 0xa7_u8, 0x37_u8, 0xb7_u8, 0x17_u8, 0xaf_u8, 0x79_u8])
    def query_interface(this : ISpPhrase2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpPhrase2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpPhrase2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpPhrase2*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpPhrase2*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpPhrase2*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpPhrase2*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end
    def get_xml_result(this : ISpPhrase2*, ppszCoMemXMLResult : Win32cr::Foundation::PWSTR*, options : Win32cr::Media::Speech::SPXMLRESULTOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_result.call(this, ppszCoMemXMLResult, options)
    end
    def get_xml_error_info(this : ISpPhrase2*, pSemanticErrorInfo : Win32cr::Media::Speech::SPSEMANTICERRORINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_error_info.call(this, pSemanticErrorInfo)
    end
    def get_audio(this : ISpPhrase2*, ulStartElement : UInt32, cElements : UInt32, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio.call(this, ulStartElement, cElements, ppStream)
    end

  end

  @[Extern]
  record ISpRecoResultVtbl,
    query_interface : Proc(ISpRecoResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoResult*, UInt32),
    release : Proc(ISpRecoResult*, UInt32),
    get_phrase : Proc(ISpRecoResult*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpRecoResult*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpRecoResult*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpRecoResult*, UInt32, Win32cr::Foundation::HRESULT),
    get_result_times : Proc(ISpRecoResult*, Win32cr::Media::Speech::SPRECORESULTTIMES*, Win32cr::Foundation::HRESULT),
    get_alternates : Proc(ISpRecoResult*, UInt32, UInt32, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_audio : Proc(ISpRecoResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpRecoResult*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISpRecoResult*, Win32cr::Media::Speech::SPSERIALIZEDRESULT**, Win32cr::Foundation::HRESULT),
    scale_audio : Proc(ISpRecoResult*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_reco_context : Proc(ISpRecoResult*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoResult, lpVtbl : ISpRecoResultVtbl* do
    GUID = LibC::GUID.new(0x20b053be_u32, 0xe235_u16, 0x43cd_u16, StaticArray[0x9a_u8, 0x2a_u8, 0x8d_u8, 0x17_u8, 0xa4_u8, 0x8b_u8, 0x78_u8, 0x42_u8])
    def query_interface(this : ISpRecoResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpRecoResult*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpRecoResult*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpRecoResult*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpRecoResult*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end
    def get_result_times(this : ISpRecoResult*, pTimes : Win32cr::Media::Speech::SPRECORESULTTIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_times.call(this, pTimes)
    end
    def get_alternates(this : ISpRecoResult*, ulStartElement : UInt32, cElements : UInt32, ulRequestCount : UInt32, ppPhrases : Void**, pcPhrasesReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternates.call(this, ulStartElement, cElements, ulRequestCount, ppPhrases, pcPhrasesReturned)
    end
    def get_audio(this : ISpRecoResult*, ulStartElement : UInt32, cElements : UInt32, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio.call(this, ulStartElement, cElements, ppStream)
    end
    def speak_audio(this : ISpRecoResult*, ulStartElement : UInt32, cElements : UInt32, dwFlags : UInt32, pulStreamNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, ulStartElement, cElements, dwFlags, pulStreamNumber)
    end
    def serialize(this : ISpRecoResult*, ppCoMemSerializedResult : Win32cr::Media::Speech::SPSERIALIZEDRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, ppCoMemSerializedResult)
    end
    def scale_audio(this : ISpRecoResult*, pAudioFormatId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_audio.call(this, pAudioFormatId, pWaveFormatEx)
    end
    def get_reco_context(this : ISpRecoResult*, ppRecoContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_context.call(this, ppRecoContext)
    end

  end

  @[Extern]
  record ISpRecoResult2Vtbl,
    query_interface : Proc(ISpRecoResult2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoResult2*, UInt32),
    release : Proc(ISpRecoResult2*, UInt32),
    get_phrase : Proc(ISpRecoResult2*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpRecoResult2*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpRecoResult2*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpRecoResult2*, UInt32, Win32cr::Foundation::HRESULT),
    get_result_times : Proc(ISpRecoResult2*, Win32cr::Media::Speech::SPRECORESULTTIMES*, Win32cr::Foundation::HRESULT),
    get_alternates : Proc(ISpRecoResult2*, UInt32, UInt32, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_audio : Proc(ISpRecoResult2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpRecoResult2*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISpRecoResult2*, Win32cr::Media::Speech::SPSERIALIZEDRESULT**, Win32cr::Foundation::HRESULT),
    scale_audio : Proc(ISpRecoResult2*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_reco_context : Proc(ISpRecoResult2*, Void**, Win32cr::Foundation::HRESULT),
    commit_alternate : Proc(ISpRecoResult2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    commit_text : Proc(ISpRecoResult2*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_text_feedback : Proc(ISpRecoResult2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoResult2, lpVtbl : ISpRecoResult2Vtbl* do
    GUID = LibC::GUID.new(0x27cac6c4_u32, 0x88f2_u16, 0x41f2_u16, StaticArray[0x88_u8, 0x17_u8, 0xc_u8, 0x95_u8, 0xe5_u8, 0x9f_u8, 0x1e_u8, 0x6e_u8])
    def query_interface(this : ISpRecoResult2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoResult2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoResult2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpRecoResult2*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpRecoResult2*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpRecoResult2*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpRecoResult2*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end
    def get_result_times(this : ISpRecoResult2*, pTimes : Win32cr::Media::Speech::SPRECORESULTTIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_times.call(this, pTimes)
    end
    def get_alternates(this : ISpRecoResult2*, ulStartElement : UInt32, cElements : UInt32, ulRequestCount : UInt32, ppPhrases : Void**, pcPhrasesReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternates.call(this, ulStartElement, cElements, ulRequestCount, ppPhrases, pcPhrasesReturned)
    end
    def get_audio(this : ISpRecoResult2*, ulStartElement : UInt32, cElements : UInt32, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio.call(this, ulStartElement, cElements, ppStream)
    end
    def speak_audio(this : ISpRecoResult2*, ulStartElement : UInt32, cElements : UInt32, dwFlags : UInt32, pulStreamNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, ulStartElement, cElements, dwFlags, pulStreamNumber)
    end
    def serialize(this : ISpRecoResult2*, ppCoMemSerializedResult : Win32cr::Media::Speech::SPSERIALIZEDRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, ppCoMemSerializedResult)
    end
    def scale_audio(this : ISpRecoResult2*, pAudioFormatId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_audio.call(this, pAudioFormatId, pWaveFormatEx)
    end
    def get_reco_context(this : ISpRecoResult2*, ppRecoContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_context.call(this, ppRecoContext)
    end
    def commit_alternate(this : ISpRecoResult2*, pPhraseAlt : Void*, ppNewResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_alternate.call(this, pPhraseAlt, ppNewResult)
    end
    def commit_text(this : ISpRecoResult2*, ulStartElement : UInt32, cElements : UInt32, pszCorrectedData : Win32cr::Foundation::PWSTR, eCommitFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_text.call(this, ulStartElement, cElements, pszCorrectedData, eCommitFlags)
    end
    def set_text_feedback(this : ISpRecoResult2*, pszFeedback : Win32cr::Foundation::PWSTR, fSuccessful : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_feedback.call(this, pszFeedback, fSuccessful)
    end

  end

  @[Extern]
  record ISpXMLRecoResultVtbl,
    query_interface : Proc(ISpXMLRecoResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpXMLRecoResult*, UInt32),
    release : Proc(ISpXMLRecoResult*, UInt32),
    get_phrase : Proc(ISpXMLRecoResult*, Win32cr::Media::Speech::SPPHRASE**, Win32cr::Foundation::HRESULT),
    get_serialized_phrase : Proc(ISpXMLRecoResult*, Win32cr::Media::Speech::SPSERIALIZEDPHRASE**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpXMLRecoResult*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt8*, Win32cr::Foundation::HRESULT),
    discard : Proc(ISpXMLRecoResult*, UInt32, Win32cr::Foundation::HRESULT),
    get_result_times : Proc(ISpXMLRecoResult*, Win32cr::Media::Speech::SPRECORESULTTIMES*, Win32cr::Foundation::HRESULT),
    get_alternates : Proc(ISpXMLRecoResult*, UInt32, UInt32, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_audio : Proc(ISpXMLRecoResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpXMLRecoResult*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISpXMLRecoResult*, Win32cr::Media::Speech::SPSERIALIZEDRESULT**, Win32cr::Foundation::HRESULT),
    scale_audio : Proc(ISpXMLRecoResult*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_reco_context : Proc(ISpXMLRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    get_xml_result : Proc(ISpXMLRecoResult*, Win32cr::Foundation::PWSTR*, Win32cr::Media::Speech::SPXMLRESULTOPTIONS, Win32cr::Foundation::HRESULT),
    get_xml_error_info : Proc(ISpXMLRecoResult*, Win32cr::Media::Speech::SPSEMANTICERRORINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpXMLRecoResult, lpVtbl : ISpXMLRecoResultVtbl* do
    GUID = LibC::GUID.new(0xae39362b_u32, 0x45a8_u16, 0x4074_u16, StaticArray[0x9b_u8, 0x9e_u8, 0xcc_u8, 0xf4_u8, 0x9a_u8, 0xa2_u8, 0xd0_u8, 0xb6_u8])
    def query_interface(this : ISpXMLRecoResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpXMLRecoResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpXMLRecoResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_phrase(this : ISpXMLRecoResult*, ppCoMemPhrase : Win32cr::Media::Speech::SPPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppCoMemPhrase)
    end
    def get_serialized_phrase(this : ISpXMLRecoResult*, ppCoMemPhrase : Win32cr::Media::Speech::SPSERIALIZEDPHRASE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_phrase.call(this, ppCoMemPhrase)
    end
    def get_text(this : ISpXMLRecoResult*, ulStart : UInt32, ulCount : UInt32, fUseTextReplacements : Win32cr::Foundation::BOOL, ppszCoMemText : Win32cr::Foundation::PWSTR*, pbDisplayAttributes : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes)
    end
    def discard(this : ISpXMLRecoResult*, dwValueTypes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard.call(this, dwValueTypes)
    end
    def get_result_times(this : ISpXMLRecoResult*, pTimes : Win32cr::Media::Speech::SPRECORESULTTIMES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_times.call(this, pTimes)
    end
    def get_alternates(this : ISpXMLRecoResult*, ulStartElement : UInt32, cElements : UInt32, ulRequestCount : UInt32, ppPhrases : Void**, pcPhrasesReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternates.call(this, ulStartElement, cElements, ulRequestCount, ppPhrases, pcPhrasesReturned)
    end
    def get_audio(this : ISpXMLRecoResult*, ulStartElement : UInt32, cElements : UInt32, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio.call(this, ulStartElement, cElements, ppStream)
    end
    def speak_audio(this : ISpXMLRecoResult*, ulStartElement : UInt32, cElements : UInt32, dwFlags : UInt32, pulStreamNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, ulStartElement, cElements, dwFlags, pulStreamNumber)
    end
    def serialize(this : ISpXMLRecoResult*, ppCoMemSerializedResult : Win32cr::Media::Speech::SPSERIALIZEDRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, ppCoMemSerializedResult)
    end
    def scale_audio(this : ISpXMLRecoResult*, pAudioFormatId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_audio.call(this, pAudioFormatId, pWaveFormatEx)
    end
    def get_reco_context(this : ISpXMLRecoResult*, ppRecoContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_context.call(this, ppRecoContext)
    end
    def get_xml_result(this : ISpXMLRecoResult*, ppszCoMemXMLResult : Win32cr::Foundation::PWSTR*, options : Win32cr::Media::Speech::SPXMLRESULTOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_result.call(this, ppszCoMemXMLResult, options)
    end
    def get_xml_error_info(this : ISpXMLRecoResult*, pSemanticErrorInfo : Win32cr::Media::Speech::SPSEMANTICERRORINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_error_info.call(this, pSemanticErrorInfo)
    end

  end

  @[Extern]
  record ISpGrammarBuilderVtbl,
    query_interface : Proc(ISpGrammarBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpGrammarBuilder*, UInt32),
    release : Proc(ISpGrammarBuilder*, UInt32),
    reset_grammar : Proc(ISpGrammarBuilder*, UInt16, Win32cr::Foundation::HRESULT),
    get_rule : Proc(ISpGrammarBuilder*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Media::Speech::SPSTATEHANDLE__**, Win32cr::Foundation::HRESULT),
    clear_rule : Proc(ISpGrammarBuilder*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::HRESULT),
    create_new_state : Proc(ISpGrammarBuilder*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__**, Win32cr::Foundation::HRESULT),
    add_word_transition : Proc(ISpGrammarBuilder*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPGRAMMARWORDTYPE, Float32, Win32cr::Media::Speech::SPPROPERTYINFO*, Win32cr::Foundation::HRESULT),
    add_rule_transition : Proc(ISpGrammarBuilder*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Float32, Win32cr::Media::Speech::SPPROPERTYINFO*, Win32cr::Foundation::HRESULT),
    add_resource : Proc(ISpGrammarBuilder*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpGrammarBuilder*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpGrammarBuilder, lpVtbl : ISpGrammarBuilderVtbl* do
    GUID = LibC::GUID.new(0x8137828f_u32, 0x591a_u16, 0x4a42_u16, StaticArray[0xbe_u8, 0x58_u8, 0x49_u8, 0xea_u8, 0x7e_u8, 0xba_u8, 0xac_u8, 0x68_u8])
    def query_interface(this : ISpGrammarBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpGrammarBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpGrammarBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset_grammar(this : ISpGrammarBuilder*, new_language : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_grammar.call(this, new_language)
    end
    def get_rule(this : ISpGrammarBuilder*, pszRuleName : Win32cr::Foundation::PWSTR, dwRuleId : UInt32, dwAttributes : UInt32, fCreateIfNotExist : Win32cr::Foundation::BOOL, phInitialState : Win32cr::Media::Speech::SPSTATEHANDLE__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rule.call(this, pszRuleName, dwRuleId, dwAttributes, fCreateIfNotExist, phInitialState)
    end
    def clear_rule(this : ISpGrammarBuilder*, hState : Win32cr::Media::Speech::SPSTATEHANDLE__*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_rule.call(this, hState)
    end
    def create_new_state(this : ISpGrammarBuilder*, hState : Win32cr::Media::Speech::SPSTATEHANDLE__*, phState : Win32cr::Media::Speech::SPSTATEHANDLE__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_state.call(this, hState, phState)
    end
    def add_word_transition(this : ISpGrammarBuilder*, hFromState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hToState : Win32cr::Media::Speech::SPSTATEHANDLE__*, psz : Win32cr::Foundation::PWSTR, pszSeparators : Win32cr::Foundation::PWSTR, eWordType : Win32cr::Media::Speech::SPGRAMMARWORDTYPE, weight : Float32, pPropInfo : Win32cr::Media::Speech::SPPROPERTYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_word_transition.call(this, hFromState, hToState, psz, pszSeparators, eWordType, weight, pPropInfo)
    end
    def add_rule_transition(this : ISpGrammarBuilder*, hFromState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hToState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hRule : Win32cr::Media::Speech::SPSTATEHANDLE__*, weight : Float32, pPropInfo : Win32cr::Media::Speech::SPPROPERTYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_rule_transition.call(this, hFromState, hToState, hRule, weight, pPropInfo)
    end
    def add_resource(this : ISpGrammarBuilder*, hRuleState : Win32cr::Media::Speech::SPSTATEHANDLE__*, pszResourceName : Win32cr::Foundation::PWSTR, pszResourceValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, hRuleState, pszResourceName, pszResourceValue)
    end
    def commit(this : ISpGrammarBuilder*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, dwReserved)
    end

  end

  @[Extern]
  record ISpRecoGrammarVtbl,
    query_interface : Proc(ISpRecoGrammar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoGrammar*, UInt32),
    release : Proc(ISpRecoGrammar*, UInt32),
    reset_grammar : Proc(ISpRecoGrammar*, UInt16, Win32cr::Foundation::HRESULT),
    get_rule : Proc(ISpRecoGrammar*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Media::Speech::SPSTATEHANDLE__**, Win32cr::Foundation::HRESULT),
    clear_rule : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::HRESULT),
    create_new_state : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__**, Win32cr::Foundation::HRESULT),
    add_word_transition : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPGRAMMARWORDTYPE, Float32, Win32cr::Media::Speech::SPPROPERTYINFO*, Win32cr::Foundation::HRESULT),
    add_rule_transition : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Float32, Win32cr::Media::Speech::SPPROPERTYINFO*, Win32cr::Foundation::HRESULT),
    add_resource : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpRecoGrammar*, UInt32, Win32cr::Foundation::HRESULT),
    get_grammar_id : Proc(ISpRecoGrammar*, UInt64*, Win32cr::Foundation::HRESULT),
    get_reco_context : Proc(ISpRecoGrammar*, Void**, Win32cr::Foundation::HRESULT),
    load_cmd_from_file : Proc(ISpRecoGrammar*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    load_cmd_from_object : Proc(ISpRecoGrammar*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    load_cmd_from_resource : Proc(ISpRecoGrammar*, Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    load_cmd_from_memory : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPBINARYGRAMMAR*, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    load_cmd_from_proprietary_grammar : Proc(ISpRecoGrammar*, LibC::GUID*, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    set_rule_state : Proc(ISpRecoGrammar*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Media::Speech::SPRULESTATE, Win32cr::Foundation::HRESULT),
    set_rule_id_state : Proc(ISpRecoGrammar*, UInt32, Win32cr::Media::Speech::SPRULESTATE, Win32cr::Foundation::HRESULT),
    load_dictation : Proc(ISpRecoGrammar*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::HRESULT),
    unload_dictation : Proc(ISpRecoGrammar*, Win32cr::Foundation::HRESULT),
    set_dictation_state : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPRULESTATE, Win32cr::Foundation::HRESULT),
    set_word_sequence_data : Proc(ISpRecoGrammar*, UInt16*, UInt32, Win32cr::Media::Speech::SPTEXTSELECTIONINFO*, Win32cr::Foundation::HRESULT),
    set_text_selection : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPTEXTSELECTIONINFO*, Win32cr::Foundation::HRESULT),
    is_pronounceable : Proc(ISpRecoGrammar*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPWORDPRONOUNCEABLE*, Win32cr::Foundation::HRESULT),
    set_grammar_state : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPGRAMMARSTATE, Win32cr::Foundation::HRESULT),
    save_cmd : Proc(ISpRecoGrammar*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_grammar_state : Proc(ISpRecoGrammar*, Win32cr::Media::Speech::SPGRAMMARSTATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoGrammar, lpVtbl : ISpRecoGrammarVtbl* do
    GUID = LibC::GUID.new(0x2177db29_u32, 0x7f45_u16, 0x47d0_u16, StaticArray[0x85_u8, 0x54_u8, 0x6_u8, 0x7e_u8, 0x91_u8, 0xc8_u8, 0x5_u8, 0x2_u8])
    def query_interface(this : ISpRecoGrammar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoGrammar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoGrammar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset_grammar(this : ISpRecoGrammar*, new_language : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_grammar.call(this, new_language)
    end
    def get_rule(this : ISpRecoGrammar*, pszRuleName : Win32cr::Foundation::PWSTR, dwRuleId : UInt32, dwAttributes : UInt32, fCreateIfNotExist : Win32cr::Foundation::BOOL, phInitialState : Win32cr::Media::Speech::SPSTATEHANDLE__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rule.call(this, pszRuleName, dwRuleId, dwAttributes, fCreateIfNotExist, phInitialState)
    end
    def clear_rule(this : ISpRecoGrammar*, hState : Win32cr::Media::Speech::SPSTATEHANDLE__*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_rule.call(this, hState)
    end
    def create_new_state(this : ISpRecoGrammar*, hState : Win32cr::Media::Speech::SPSTATEHANDLE__*, phState : Win32cr::Media::Speech::SPSTATEHANDLE__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_state.call(this, hState, phState)
    end
    def add_word_transition(this : ISpRecoGrammar*, hFromState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hToState : Win32cr::Media::Speech::SPSTATEHANDLE__*, psz : Win32cr::Foundation::PWSTR, pszSeparators : Win32cr::Foundation::PWSTR, eWordType : Win32cr::Media::Speech::SPGRAMMARWORDTYPE, weight : Float32, pPropInfo : Win32cr::Media::Speech::SPPROPERTYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_word_transition.call(this, hFromState, hToState, psz, pszSeparators, eWordType, weight, pPropInfo)
    end
    def add_rule_transition(this : ISpRecoGrammar*, hFromState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hToState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hRule : Win32cr::Media::Speech::SPSTATEHANDLE__*, weight : Float32, pPropInfo : Win32cr::Media::Speech::SPPROPERTYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_rule_transition.call(this, hFromState, hToState, hRule, weight, pPropInfo)
    end
    def add_resource(this : ISpRecoGrammar*, hRuleState : Win32cr::Media::Speech::SPSTATEHANDLE__*, pszResourceName : Win32cr::Foundation::PWSTR, pszResourceValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, hRuleState, pszResourceName, pszResourceValue)
    end
    def commit(this : ISpRecoGrammar*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, dwReserved)
    end
    def get_grammar_id(this : ISpRecoGrammar*, pullGrammarId : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grammar_id.call(this, pullGrammarId)
    end
    def get_reco_context(this : ISpRecoGrammar*, ppRecoCtxt : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_context.call(this, ppRecoCtxt)
    end
    def load_cmd_from_file(this : ISpRecoGrammar*, pszFileName : Win32cr::Foundation::PWSTR, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_file.call(this, pszFileName, options)
    end
    def load_cmd_from_object(this : ISpRecoGrammar*, rcid : LibC::GUID*, pszGrammarName : Win32cr::Foundation::PWSTR, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_object.call(this, rcid, pszGrammarName, options)
    end
    def load_cmd_from_resource(this : ISpRecoGrammar*, hModule : Win32cr::Foundation::HINSTANCE, pszResourceName : Win32cr::Foundation::PWSTR, pszResourceType : Win32cr::Foundation::PWSTR, wLanguage : UInt16, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_resource.call(this, hModule, pszResourceName, pszResourceType, wLanguage, options)
    end
    def load_cmd_from_memory(this : ISpRecoGrammar*, pGrammar : Win32cr::Media::Speech::SPBINARYGRAMMAR*, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_memory.call(this, pGrammar, options)
    end
    def load_cmd_from_proprietary_grammar(this : ISpRecoGrammar*, rguidParam : LibC::GUID*, pszStringParam : Win32cr::Foundation::PWSTR, pvDataPrarm : Void*, cbDataSize : UInt32, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_proprietary_grammar.call(this, rguidParam, pszStringParam, pvDataPrarm, cbDataSize, options)
    end
    def set_rule_state(this : ISpRecoGrammar*, pszName : Win32cr::Foundation::PWSTR, pReserved : Void*, new_state : Win32cr::Media::Speech::SPRULESTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rule_state.call(this, pszName, pReserved, new_state)
    end
    def set_rule_id_state(this : ISpRecoGrammar*, ulRuleId : UInt32, new_state : Win32cr::Media::Speech::SPRULESTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rule_id_state.call(this, ulRuleId, new_state)
    end
    def load_dictation(this : ISpRecoGrammar*, pszTopicName : Win32cr::Foundation::PWSTR, options : Win32cr::Media::Speech::SPLOADOPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_dictation.call(this, pszTopicName, options)
    end
    def unload_dictation(this : ISpRecoGrammar*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload_dictation.call(this)
    end
    def set_dictation_state(this : ISpRecoGrammar*, new_state : Win32cr::Media::Speech::SPRULESTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictation_state.call(this, new_state)
    end
    def set_word_sequence_data(this : ISpRecoGrammar*, pText : UInt16*, cchText : UInt32, pInfo : Win32cr::Media::Speech::SPTEXTSELECTIONINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_word_sequence_data.call(this, pText, cchText, pInfo)
    end
    def set_text_selection(this : ISpRecoGrammar*, pInfo : Win32cr::Media::Speech::SPTEXTSELECTIONINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_selection.call(this, pInfo)
    end
    def is_pronounceable(this : ISpRecoGrammar*, pszWord : Win32cr::Foundation::PWSTR, pWordPronounceable : Win32cr::Media::Speech::SPWORDPRONOUNCEABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pronounceable.call(this, pszWord, pWordPronounceable)
    end
    def set_grammar_state(this : ISpRecoGrammar*, eGrammarState : Win32cr::Media::Speech::SPGRAMMARSTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_grammar_state.call(this, eGrammarState)
    end
    def save_cmd(this : ISpRecoGrammar*, pStream : Void*, ppszCoMemErrorText : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_cmd.call(this, pStream, ppszCoMemErrorText)
    end
    def get_grammar_state(this : ISpRecoGrammar*, peGrammarState : Win32cr::Media::Speech::SPGRAMMARSTATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grammar_state.call(this, peGrammarState)
    end

  end

  @[Extern]
  record ISpGrammarBuilder2Vtbl,
    query_interface : Proc(ISpGrammarBuilder2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpGrammarBuilder2*, UInt32),
    release : Proc(ISpGrammarBuilder2*, UInt32),
    add_text_subset : Proc(ISpGrammarBuilder2*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Media::Speech::SPSTATEHANDLE__*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPMATCHINGMODE, Win32cr::Foundation::HRESULT),
    set_phonetic_alphabet : Proc(ISpGrammarBuilder2*, Win32cr::Media::Speech::PHONETICALPHABET, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpGrammarBuilder2, lpVtbl : ISpGrammarBuilder2Vtbl* do
    GUID = LibC::GUID.new(0x8ab10026_u32, 0x20cc_u16, 0x4b20_u16, StaticArray[0x8c_u8, 0x22_u8, 0xa4_u8, 0x9c_u8, 0x9b_u8, 0xa7_u8, 0x8f_u8, 0x60_u8])
    def query_interface(this : ISpGrammarBuilder2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpGrammarBuilder2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpGrammarBuilder2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_text_subset(this : ISpGrammarBuilder2*, hFromState : Win32cr::Media::Speech::SPSTATEHANDLE__*, hToState : Win32cr::Media::Speech::SPSTATEHANDLE__*, psz : Win32cr::Foundation::PWSTR, eMatchMode : Win32cr::Media::Speech::SPMATCHINGMODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_subset.call(this, hFromState, hToState, psz, eMatchMode)
    end
    def set_phonetic_alphabet(this : ISpGrammarBuilder2*, phoneticALphabet : Win32cr::Media::Speech::PHONETICALPHABET) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_phonetic_alphabet.call(this, phoneticALphabet)
    end

  end

  @[Extern]
  record ISpRecoGrammar2Vtbl,
    query_interface : Proc(ISpRecoGrammar2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoGrammar2*, UInt32),
    release : Proc(ISpRecoGrammar2*, UInt32),
    get_rules : Proc(ISpRecoGrammar2*, Win32cr::Media::Speech::SPRULE**, UInt32*, Win32cr::Foundation::HRESULT),
    load_cmd_from_file2 : Proc(ISpRecoGrammar2*, Win32cr::Foundation::PWSTR, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    load_cmd_from_memory2 : Proc(ISpRecoGrammar2*, Win32cr::Media::Speech::SPBINARYGRAMMAR*, Win32cr::Media::Speech::SPLOADOPTIONS, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_rule_priority : Proc(ISpRecoGrammar2*, Win32cr::Foundation::PWSTR, UInt32, Int32, Win32cr::Foundation::HRESULT),
    set_rule_weight : Proc(ISpRecoGrammar2*, Win32cr::Foundation::PWSTR, UInt32, Float32, Win32cr::Foundation::HRESULT),
    set_dictation_weight : Proc(ISpRecoGrammar2*, Float32, Win32cr::Foundation::HRESULT),
    set_grammar_loader : Proc(ISpRecoGrammar2*, Void*, Win32cr::Foundation::HRESULT),
    set_sml_security_manager : Proc(ISpRecoGrammar2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoGrammar2, lpVtbl : ISpRecoGrammar2Vtbl* do
    GUID = LibC::GUID.new(0x4b37bc9e_u32, 0x9ed6_u16, 0x44a3_u16, StaticArray[0x93_u8, 0xd3_u8, 0x18_u8, 0xf0_u8, 0x22_u8, 0xb7_u8, 0x9e_u8, 0xc3_u8])
    def query_interface(this : ISpRecoGrammar2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoGrammar2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoGrammar2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_rules(this : ISpRecoGrammar2*, ppCoMemRules : Win32cr::Media::Speech::SPRULE**, puNumRules : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rules.call(this, ppCoMemRules, puNumRules)
    end
    def load_cmd_from_file2(this : ISpRecoGrammar2*, pszFileName : Win32cr::Foundation::PWSTR, options : Win32cr::Media::Speech::SPLOADOPTIONS, pszSharingUri : Win32cr::Foundation::PWSTR, pszBaseUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_file2.call(this, pszFileName, options, pszSharingUri, pszBaseUri)
    end
    def load_cmd_from_memory2(this : ISpRecoGrammar2*, pGrammar : Win32cr::Media::Speech::SPBINARYGRAMMAR*, options : Win32cr::Media::Speech::SPLOADOPTIONS, pszSharingUri : Win32cr::Foundation::PWSTR, pszBaseUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_cmd_from_memory2.call(this, pGrammar, options, pszSharingUri, pszBaseUri)
    end
    def set_rule_priority(this : ISpRecoGrammar2*, pszRuleName : Win32cr::Foundation::PWSTR, ulRuleId : UInt32, nRulePriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rule_priority.call(this, pszRuleName, ulRuleId, nRulePriority)
    end
    def set_rule_weight(this : ISpRecoGrammar2*, pszRuleName : Win32cr::Foundation::PWSTR, ulRuleId : UInt32, flWeight : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rule_weight.call(this, pszRuleName, ulRuleId, flWeight)
    end
    def set_dictation_weight(this : ISpRecoGrammar2*, flWeight : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictation_weight.call(this, flWeight)
    end
    def set_grammar_loader(this : ISpRecoGrammar2*, pLoader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_grammar_loader.call(this, pLoader)
    end
    def set_sml_security_manager(this : ISpRecoGrammar2*, pSMLSecurityManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sml_security_manager.call(this, pSMLSecurityManager)
    end

  end

  @[Extern]
  record ISpeechResourceLoaderVtbl,
    query_interface : Proc(ISpeechResourceLoader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechResourceLoader*, UInt32),
    release : Proc(ISpeechResourceLoader*, UInt32),
    get_type_info_count : Proc(ISpeechResourceLoader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechResourceLoader*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechResourceLoader*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechResourceLoader*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    load_resource : Proc(ISpeechResourceLoader*, Win32cr::Foundation::BSTR, Int16, Void**, Win32cr::Foundation::BSTR*, Int16*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_local_copy : Proc(ISpeechResourceLoader*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    release_local_copy : Proc(ISpeechResourceLoader*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechResourceLoader, lpVtbl : ISpeechResourceLoaderVtbl* do
    GUID = LibC::GUID.new(0xb9ac5783_u32, 0xfcd0_u16, 0x4b21_u16, StaticArray[0xb1_u8, 0x19_u8, 0xb4_u8, 0xf8_u8, 0xda_u8, 0x8f_u8, 0xd2_u8, 0xc3_u8])
    def query_interface(this : ISpeechResourceLoader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechResourceLoader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechResourceLoader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechResourceLoader*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechResourceLoader*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechResourceLoader*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechResourceLoader*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def load_resource(this : ISpeechResourceLoader*, bstrResourceUri : Win32cr::Foundation::BSTR, fAlwaysReload : Int16, pStream : Void**, pbstrMIMEType : Win32cr::Foundation::BSTR*, pfModified : Int16*, pbstrRedirectUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_resource.call(this, bstrResourceUri, fAlwaysReload, pStream, pbstrMIMEType, pfModified, pbstrRedirectUrl)
    end
    def get_local_copy(this : ISpeechResourceLoader*, bstrResourceUri : Win32cr::Foundation::BSTR, pbstrLocalPath : Win32cr::Foundation::BSTR*, pbstrMIMEType : Win32cr::Foundation::BSTR*, pbstrRedirectUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_copy.call(this, bstrResourceUri, pbstrLocalPath, pbstrMIMEType, pbstrRedirectUrl)
    end
    def release_local_copy(this : ISpeechResourceLoader*, pbstrLocalPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_local_copy.call(this, pbstrLocalPath)
    end

  end

  @[Extern]
  record ISpRecoContextVtbl,
    query_interface : Proc(ISpRecoContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoContext*, UInt32),
    release : Proc(ISpRecoContext*, UInt32),
    set_notify_sink : Proc(ISpRecoContext*, Void*, Win32cr::Foundation::HRESULT),
    set_notify_window_message : Proc(ISpRecoContext*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_function : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPNOTIFYCALLBACK*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_callback_interface : Proc(ISpRecoContext*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_notify_win32_event : Proc(ISpRecoContext*, Win32cr::Foundation::HRESULT),
    wait_for_notify_event : Proc(ISpRecoContext*, UInt32, Win32cr::Foundation::HRESULT),
    get_notify_event_handle : Proc(ISpRecoContext*, Win32cr::Foundation::HANDLE),
    set_interest : Proc(ISpRecoContext*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    get_events : Proc(ISpRecoContext*, UInt32, Win32cr::Media::Speech::SPEVENT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_info : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPEVENTSOURCEINFO*, Win32cr::Foundation::HRESULT),
    get_recognizer : Proc(ISpRecoContext*, Void**, Win32cr::Foundation::HRESULT),
    create_grammar : Proc(ISpRecoContext*, UInt64, Void**, Win32cr::Foundation::HRESULT),
    get_status : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPRECOCONTEXTSTATUS*, Win32cr::Foundation::HRESULT),
    get_max_alternates : Proc(ISpRecoContext*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_alternates : Proc(ISpRecoContext*, UInt32, Win32cr::Foundation::HRESULT),
    set_audio_options : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPAUDIOOPTIONS, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_audio_options : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPAUDIOOPTIONS*, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    deserialize_result : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPSERIALIZEDRESULT*, Void**, Win32cr::Foundation::HRESULT),
    bookmark : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPBOOKMARKOPTIONS, UInt64, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_adaptation_data : Proc(ISpRecoContext*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    pause : Proc(ISpRecoContext*, UInt32, Win32cr::Foundation::HRESULT),
    resume : Proc(ISpRecoContext*, UInt32, Win32cr::Foundation::HRESULT),
    set_voice : Proc(ISpRecoContext*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_voice : Proc(ISpRecoContext*, Void**, Win32cr::Foundation::HRESULT),
    set_voice_purge_event : Proc(ISpRecoContext*, UInt64, Win32cr::Foundation::HRESULT),
    get_voice_purge_event : Proc(ISpRecoContext*, UInt64*, Win32cr::Foundation::HRESULT),
    set_context_state : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPCONTEXTSTATE, Win32cr::Foundation::HRESULT),
    get_context_state : Proc(ISpRecoContext*, Win32cr::Media::Speech::SPCONTEXTSTATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoContext, lpVtbl : ISpRecoContextVtbl* do
    GUID = LibC::GUID.new(0xf740a62f_u32, 0x7c15_u16, 0x489e_u16, StaticArray[0x82_u8, 0x34_u8, 0x94_u8, 0xa_u8, 0x33_u8, 0xd9_u8, 0x27_u8, 0x2d_u8])
    def query_interface(this : ISpRecoContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_notify_sink(this : ISpRecoContext*, pNotifySink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_sink.call(this, pNotifySink)
    end
    def set_notify_window_message(this : ISpRecoContext*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_window_message.call(this, hWnd, msg, wParam, lParam)
    end
    def set_notify_callback_function(this : ISpRecoContext*, pfnCallback : Win32cr::Media::Speech::SPNOTIFYCALLBACK*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_function.call(this, pfnCallback, wParam, lParam)
    end
    def set_notify_callback_interface(this : ISpRecoContext*, pSpCallback : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_callback_interface.call(this, pSpCallback, wParam, lParam)
    end
    def set_notify_win32_event(this : ISpRecoContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notify_win32_event.call(this)
    end
    def wait_for_notify_event(this : ISpRecoContext*, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_notify_event.call(this, dwMilliseconds)
    end
    def get_notify_event_handle(this : ISpRecoContext*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_notify_event_handle.call(this)
    end
    def set_interest(this : ISpRecoContext*, ullEventInterest : UInt64, ullQueuedInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interest.call(this, ullEventInterest, ullQueuedInterest)
    end
    def get_events(this : ISpRecoContext*, ulCount : UInt32, pEventArray : Win32cr::Media::Speech::SPEVENT*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_events.call(this, ulCount, pEventArray, pulFetched)
    end
    def get_info(this : ISpRecoContext*, pInfo : Win32cr::Media::Speech::SPEVENTSOURCEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_recognizer(this : ISpRecoContext*, ppRecognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recognizer.call(this, ppRecognizer)
    end
    def create_grammar(this : ISpRecoContext*, ullGrammarId : UInt64, ppGrammar : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_grammar.call(this, ullGrammarId, ppGrammar)
    end
    def get_status(this : ISpRecoContext*, pStatus : Win32cr::Media::Speech::SPRECOCONTEXTSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def get_max_alternates(this : ISpRecoContext*, pcAlternates : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_alternates.call(this, pcAlternates)
    end
    def set_max_alternates(this : ISpRecoContext*, cAlternates : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_alternates.call(this, cAlternates)
    end
    def set_audio_options(this : ISpRecoContext*, options : Win32cr::Media::Speech::SPAUDIOOPTIONS, pAudioFormatId : LibC::GUID*, pWaveFormatEx : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_audio_options.call(this, options, pAudioFormatId, pWaveFormatEx)
    end
    def get_audio_options(this : ISpRecoContext*, pOptions : Win32cr::Media::Speech::SPAUDIOOPTIONS*, pAudioFormatId : LibC::GUID*, ppCoMemWFEX : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio_options.call(this, pOptions, pAudioFormatId, ppCoMemWFEX)
    end
    def deserialize_result(this : ISpRecoContext*, pSerializedResult : Win32cr::Media::Speech::SPSERIALIZEDRESULT*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize_result.call(this, pSerializedResult, ppResult)
    end
    def bookmark(this : ISpRecoContext*, options : Win32cr::Media::Speech::SPBOOKMARKOPTIONS, ullStreamPosition : UInt64, lparamEvent : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bookmark.call(this, options, ullStreamPosition, lparamEvent)
    end
    def set_adaptation_data(this : ISpRecoContext*, pAdaptationData : Win32cr::Foundation::PWSTR, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_adaptation_data.call(this, pAdaptationData, cch)
    end
    def pause(this : ISpRecoContext*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this, dwReserved)
    end
    def resume(this : ISpRecoContext*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this, dwReserved)
    end
    def set_voice(this : ISpRecoContext*, pVoice : Void*, fAllowFormatChanges : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_voice.call(this, pVoice, fAllowFormatChanges)
    end
    def get_voice(this : ISpRecoContext*, ppVoice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voice.call(this, ppVoice)
    end
    def set_voice_purge_event(this : ISpRecoContext*, ullEventInterest : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_voice_purge_event.call(this, ullEventInterest)
    end
    def get_voice_purge_event(this : ISpRecoContext*, pullEventInterest : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voice_purge_event.call(this, pullEventInterest)
    end
    def set_context_state(this : ISpRecoContext*, eContextState : Win32cr::Media::Speech::SPCONTEXTSTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_context_state.call(this, eContextState)
    end
    def get_context_state(this : ISpRecoContext*, peContextState : Win32cr::Media::Speech::SPCONTEXTSTATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_state.call(this, peContextState)
    end

  end

  @[Extern]
  record ISpRecoContext2Vtbl,
    query_interface : Proc(ISpRecoContext2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecoContext2*, UInt32),
    release : Proc(ISpRecoContext2*, UInt32),
    set_grammar_options : Proc(ISpRecoContext2*, UInt32, Win32cr::Foundation::HRESULT),
    get_grammar_options : Proc(ISpRecoContext2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_adaptation_data2 : Proc(ISpRecoContext2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Media::Speech::SPADAPTATIONRELEVANCE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecoContext2, lpVtbl : ISpRecoContext2Vtbl* do
    GUID = LibC::GUID.new(0xbead311c_u32, 0x52ff_u16, 0x437f_u16, StaticArray[0x94_u8, 0x64_u8, 0x6b_u8, 0x21_u8, 0x5_u8, 0x4c_u8, 0xa7_u8, 0x3d_u8])
    def query_interface(this : ISpRecoContext2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecoContext2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecoContext2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_grammar_options(this : ISpRecoContext2*, eGrammarOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_grammar_options.call(this, eGrammarOptions)
    end
    def get_grammar_options(this : ISpRecoContext2*, peGrammarOptions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grammar_options.call(this, peGrammarOptions)
    end
    def set_adaptation_data2(this : ISpRecoContext2*, pAdaptationData : Win32cr::Foundation::PWSTR, cch : UInt32, pTopicName : Win32cr::Foundation::PWSTR, eAdaptationSettings : UInt32, eRelevance : Win32cr::Media::Speech::SPADAPTATIONRELEVANCE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_adaptation_data2.call(this, pAdaptationData, cch, pTopicName, eAdaptationSettings, eRelevance)
    end

  end

  @[Extern]
  record ISpPropertiesVtbl,
    query_interface : Proc(ISpProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpProperties*, UInt32),
    release : Proc(ISpProperties*, UInt32),
    set_property_num : Proc(ISpProperties*, Win32cr::Foundation::PWSTR, Int32, Win32cr::Foundation::HRESULT),
    get_property_num : Proc(ISpProperties*, Win32cr::Foundation::PWSTR, Int32*, Win32cr::Foundation::HRESULT),
    set_property_string : Proc(ISpProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_property_string : Proc(ISpProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpProperties, lpVtbl : ISpPropertiesVtbl* do
    GUID = LibC::GUID.new(0x5b4fb971_u32, 0xb115_u16, 0x4de1_u16, StaticArray[0xad_u8, 0x97_u8, 0xe4_u8, 0x82_u8, 0xe3_u8, 0xbf_u8, 0x6e_u8, 0xe4_u8])
    def query_interface(this : ISpProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_property_num(this : ISpProperties*, pName : Win32cr::Foundation::PWSTR, lValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_num.call(this, pName, lValue)
    end
    def get_property_num(this : ISpProperties*, pName : Win32cr::Foundation::PWSTR, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_num.call(this, pName, plValue)
    end
    def set_property_string(this : ISpProperties*, pName : Win32cr::Foundation::PWSTR, pValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_string.call(this, pName, pValue)
    end
    def get_property_string(this : ISpProperties*, pName : Win32cr::Foundation::PWSTR, ppCoMemValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_string.call(this, pName, ppCoMemValue)
    end

  end

  @[Extern]
  record ISpRecognizerVtbl,
    query_interface : Proc(ISpRecognizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecognizer*, UInt32),
    release : Proc(ISpRecognizer*, UInt32),
    set_property_num : Proc(ISpRecognizer*, Win32cr::Foundation::PWSTR, Int32, Win32cr::Foundation::HRESULT),
    get_property_num : Proc(ISpRecognizer*, Win32cr::Foundation::PWSTR, Int32*, Win32cr::Foundation::HRESULT),
    set_property_string : Proc(ISpRecognizer*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_property_string : Proc(ISpRecognizer*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_recognizer : Proc(ISpRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    get_recognizer : Proc(ISpRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    set_input : Proc(ISpRecognizer*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_input_object_token : Proc(ISpRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    get_input_stream : Proc(ISpRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    create_reco_context : Proc(ISpRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    get_reco_profile : Proc(ISpRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    set_reco_profile : Proc(ISpRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    is_shared_instance : Proc(ISpRecognizer*, Win32cr::Foundation::HRESULT),
    get_reco_state : Proc(ISpRecognizer*, Win32cr::Media::Speech::SPRECOSTATE*, Win32cr::Foundation::HRESULT),
    set_reco_state : Proc(ISpRecognizer*, Win32cr::Media::Speech::SPRECOSTATE, Win32cr::Foundation::HRESULT),
    get_status : Proc(ISpRecognizer*, Win32cr::Media::Speech::SPRECOGNIZERSTATUS*, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpRecognizer*, Win32cr::Media::Speech::SPWAVEFORMATTYPE, LibC::GUID*, Win32cr::Media::Audio::WAVEFORMATEX**, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpRecognizer*, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpRecognizer*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::HRESULT),
    emulate_recognition : Proc(ISpRecognizer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecognizer, lpVtbl : ISpRecognizerVtbl* do
    GUID = LibC::GUID.new(0xc2b5f241_u32, 0xdaa0_u16, 0x4507_u16, StaticArray[0x9e_u8, 0x16_u8, 0x5a_u8, 0x1e_u8, 0xaa_u8, 0x2b_u8, 0x7a_u8, 0x5c_u8])
    def query_interface(this : ISpRecognizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecognizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecognizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_property_num(this : ISpRecognizer*, pName : Win32cr::Foundation::PWSTR, lValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_num.call(this, pName, lValue)
    end
    def get_property_num(this : ISpRecognizer*, pName : Win32cr::Foundation::PWSTR, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_num.call(this, pName, plValue)
    end
    def set_property_string(this : ISpRecognizer*, pName : Win32cr::Foundation::PWSTR, pValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_string.call(this, pName, pValue)
    end
    def get_property_string(this : ISpRecognizer*, pName : Win32cr::Foundation::PWSTR, ppCoMemValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_string.call(this, pName, ppCoMemValue)
    end
    def set_recognizer(this : ISpRecognizer*, pRecognizer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_recognizer.call(this, pRecognizer)
    end
    def get_recognizer(this : ISpRecognizer*, ppRecognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recognizer.call(this, ppRecognizer)
    end
    def set_input(this : ISpRecognizer*, pUnkInput : Void*, fAllowFormatChanges : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, pUnkInput, fAllowFormatChanges)
    end
    def get_input_object_token(this : ISpRecognizer*, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_object_token.call(this, ppToken)
    end
    def get_input_stream(this : ISpRecognizer*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_stream.call(this, ppStream)
    end
    def create_reco_context(this : ISpRecognizer*, ppNewCtxt : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_reco_context.call(this, ppNewCtxt)
    end
    def get_reco_profile(this : ISpRecognizer*, ppToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_profile.call(this, ppToken)
    end
    def set_reco_profile(this : ISpRecognizer*, pToken : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reco_profile.call(this, pToken)
    end
    def is_shared_instance(this : ISpRecognizer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shared_instance.call(this)
    end
    def get_reco_state(this : ISpRecognizer*, pState : Win32cr::Media::Speech::SPRECOSTATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reco_state.call(this, pState)
    end
    def set_reco_state(this : ISpRecognizer*, new_state : Win32cr::Media::Speech::SPRECOSTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_reco_state.call(this, new_state)
    end
    def get_status(this : ISpRecognizer*, pStatus : Win32cr::Media::Speech::SPRECOGNIZERSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def get_format(this : ISpRecognizer*, wave_format_type : Win32cr::Media::Speech::SPWAVEFORMATTYPE, pFormatId : LibC::GUID*, ppCoMemWFEX : Win32cr::Media::Audio::WAVEFORMATEX**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, wave_format_type, pFormatId, ppCoMemWFEX)
    end
    def is_ui_supported(this : ISpRecognizer*, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32, pfSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, pszTypeOfUI, pvExtraData, cbExtraData, pfSupported)
    end
    def display_ui(this : ISpRecognizer*, hwndParent : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pszTypeOfUI : Win32cr::Foundation::PWSTR, pvExtraData : Void*, cbExtraData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData)
    end
    def emulate_recognition(this : ISpRecognizer*, pPhrase : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.emulate_recognition.call(this, pPhrase)
    end

  end

  @[Extern]
  record ISpSerializeStateVtbl,
    query_interface : Proc(ISpSerializeState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpSerializeState*, UInt32),
    release : Proc(ISpSerializeState*, UInt32),
    get_serialized_state : Proc(ISpSerializeState*, UInt8**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    set_serialized_state : Proc(ISpSerializeState*, UInt8*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpSerializeState, lpVtbl : ISpSerializeStateVtbl* do
    GUID = LibC::GUID.new(0x21b501a0_u32, 0xec7_u16, 0x46c9_u16, StaticArray[0x92_u8, 0xc3_u8, 0xa2_u8, 0xbc_u8, 0x78_u8, 0x4c_u8, 0x54_u8, 0xb9_u8])
    def query_interface(this : ISpSerializeState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpSerializeState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpSerializeState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_serialized_state(this : ISpSerializeState*, ppbData : UInt8**, pulSize : UInt32*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_state.call(this, ppbData, pulSize, dwReserved)
    end
    def set_serialized_state(this : ISpSerializeState*, pbData : UInt8*, ulSize : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_serialized_state.call(this, pbData, ulSize, dwReserved)
    end

  end

  @[Extern]
  record ISpRecognizer2Vtbl,
    query_interface : Proc(ISpRecognizer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpRecognizer2*, UInt32),
    release : Proc(ISpRecognizer2*, UInt32),
    emulate_recognition_ex : Proc(ISpRecognizer2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_training_state : Proc(ISpRecognizer2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    reset_acoustic_model_adaptation : Proc(ISpRecognizer2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpRecognizer2, lpVtbl : ISpRecognizer2Vtbl* do
    GUID = LibC::GUID.new(0x8fc6d974_u32, 0xc81e_u16, 0x4098_u16, StaticArray[0x93_u8, 0xc5_u8, 0x1_u8, 0x47_u8, 0xf6_u8, 0x1e_u8, 0xd4_u8, 0xd3_u8])
    def query_interface(this : ISpRecognizer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpRecognizer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpRecognizer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def emulate_recognition_ex(this : ISpRecognizer2*, pPhrase : Void*, dwCompareFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.emulate_recognition_ex.call(this, pPhrase, dwCompareFlags)
    end
    def set_training_state(this : ISpRecognizer2*, fDoingTraining : Win32cr::Foundation::BOOL, fAdaptFromTrainingData : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_training_state.call(this, fDoingTraining, fAdaptFromTrainingData)
    end
    def reset_acoustic_model_adaptation(this : ISpRecognizer2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_acoustic_model_adaptation.call(this)
    end

  end

  @[Extern]
  record ISpEnginePronunciationVtbl,
    query_interface : Proc(ISpEnginePronunciation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpEnginePronunciation*, UInt32),
    release : Proc(ISpEnginePronunciation*, UInt32),
    normalize : Proc(ISpEnginePronunciation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPNORMALIZATIONLIST*, Win32cr::Foundation::HRESULT),
    get_pronunciations : Proc(ISpEnginePronunciation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16, Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpEnginePronunciation, lpVtbl : ISpEnginePronunciationVtbl* do
    GUID = LibC::GUID.new(0xc360ce4b_u32, 0x76d1_u16, 0x4214_u16, StaticArray[0xad_u8, 0x68_u8, 0x52_u8, 0x65_u8, 0x7d_u8, 0x50_u8, 0x83_u8, 0xda_u8])
    def query_interface(this : ISpEnginePronunciation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpEnginePronunciation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpEnginePronunciation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def normalize(this : ISpEnginePronunciation*, pszWord : Win32cr::Foundation::PWSTR, pszLeftContext : Win32cr::Foundation::PWSTR, pszRightContext : Win32cr::Foundation::PWSTR, lang_id : UInt16, pNormalizationList : Win32cr::Media::Speech::SPNORMALIZATIONLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.normalize.call(this, pszWord, pszLeftContext, pszRightContext, lang_id, pNormalizationList)
    end
    def get_pronunciations(this : ISpEnginePronunciation*, pszWord : Win32cr::Foundation::PWSTR, pszLeftContext : Win32cr::Foundation::PWSTR, pszRightContext : Win32cr::Foundation::PWSTR, lang_id : UInt16, pEnginePronunciationList : Win32cr::Media::Speech::SPWORDPRONUNCIATIONLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pronunciations.call(this, pszWord, pszLeftContext, pszRightContext, lang_id, pEnginePronunciationList)
    end

  end

  @[Extern]
  record ISpDisplayAlternatesVtbl,
    query_interface : Proc(ISpDisplayAlternates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpDisplayAlternates*, UInt32),
    release : Proc(ISpDisplayAlternates*, UInt32),
    get_display_alternates : Proc(ISpDisplayAlternates*, Win32cr::Media::Speech::SPDISPLAYPHRASE*, UInt32, Win32cr::Media::Speech::SPDISPLAYPHRASE**, UInt32*, Win32cr::Foundation::HRESULT),
    set_full_stop_trail_space : Proc(ISpDisplayAlternates*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpDisplayAlternates, lpVtbl : ISpDisplayAlternatesVtbl* do
    GUID = LibC::GUID.new(0xc8d7c7e2_u32, 0xdde_u16, 0x44b7_u16, StaticArray[0xaf_u8, 0xe3_u8, 0xb0_u8, 0xc9_u8, 0x91_u8, 0xfb_u8, 0xeb_u8, 0x5e_u8])
    def query_interface(this : ISpDisplayAlternates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpDisplayAlternates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpDisplayAlternates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_alternates(this : ISpDisplayAlternates*, pPhrase : Win32cr::Media::Speech::SPDISPLAYPHRASE*, cRequestCount : UInt32, ppCoMemPhrases : Win32cr::Media::Speech::SPDISPLAYPHRASE**, pcPhrasesReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_alternates.call(this, pPhrase, cRequestCount, ppCoMemPhrases, pcPhrasesReturned)
    end
    def set_full_stop_trail_space(this : ISpDisplayAlternates*, ulTrailSpace : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_full_stop_trail_space.call(this, ulTrailSpace)
    end

  end

  @[Extern]
  record ISpeechDataKeyVtbl,
    query_interface : Proc(ISpeechDataKey*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechDataKey*, UInt32),
    release : Proc(ISpeechDataKey*, UInt32),
    get_type_info_count : Proc(ISpeechDataKey*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechDataKey*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechDataKey*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechDataKey*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    set_binary_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_binary_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_long_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    get_long_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    open_key : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_key : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_key : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_value : Proc(ISpeechDataKey*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    enum_keys : Proc(ISpeechDataKey*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    enum_values : Proc(ISpeechDataKey*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechDataKey, lpVtbl : ISpeechDataKeyVtbl* do
    GUID = LibC::GUID.new(0xce17c09b_u32, 0x4efa_u16, 0x44d5_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x59_u8, 0xd9_u8, 0x58_u8, 0x5a_u8, 0xb0_u8, 0xcd_u8])
    def query_interface(this : ISpeechDataKey*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechDataKey*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechDataKey*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechDataKey*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechDataKey*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechDataKey*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechDataKey*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def set_binary_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_binary_value.call(this, value_name, value)
    end
    def get_binary_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_binary_value.call(this, value_name, value)
    end
    def set_string_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, value_name, value)
    end
    def get_string_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, value_name, value)
    end
    def set_long_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_long_value.call(this, value_name, value)
    end
    def get_long_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR, value : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_long_value.call(this, value_name, value)
    end
    def open_key(this : ISpeechDataKey*, sub_key_name : Win32cr::Foundation::BSTR, sub_key : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_key.call(this, sub_key_name, sub_key)
    end
    def create_key(this : ISpeechDataKey*, sub_key_name : Win32cr::Foundation::BSTR, sub_key : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_key.call(this, sub_key_name, sub_key)
    end
    def delete_key(this : ISpeechDataKey*, sub_key_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_key.call(this, sub_key_name)
    end
    def delete_value(this : ISpeechDataKey*, value_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_value.call(this, value_name)
    end
    def enum_keys(this : ISpeechDataKey*, index : Int32, sub_key_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_keys.call(this, index, sub_key_name)
    end
    def enum_values(this : ISpeechDataKey*, index : Int32, value_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_values.call(this, index, value_name)
    end

  end

  @[Extern]
  record ISpeechObjectTokenVtbl,
    query_interface : Proc(ISpeechObjectToken*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechObjectToken*, UInt32),
    release : Proc(ISpeechObjectToken*, UInt32),
    get_type_info_count : Proc(ISpeechObjectToken*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechObjectToken*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechObjectToken*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechObjectToken*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DataKey : Proc(ISpeechObjectToken*, Void**, Win32cr::Foundation::HRESULT),
    get_Category : Proc(ISpeechObjectToken*, Void**, Win32cr::Foundation::HRESULT),
    get_description : Proc(ISpeechObjectToken*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ISpeechObjectToken*, Void*, Win32cr::Media::Speech::SpeechTokenContext, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_storage_file_name : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechTokenShellFolder, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    remove_storage_file_name : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void*, Int16*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpeechObjectToken*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    matches_attributes : Proc(ISpeechObjectToken*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechObjectToken, lpVtbl : ISpeechObjectTokenVtbl* do
    GUID = LibC::GUID.new(0xc74a3adc_u32, 0xb727_u16, 0x4500_u16, StaticArray[0xa8_u8, 0x4a_u8, 0xb5_u8, 0x26_u8, 0x72_u8, 0x1c_u8, 0x8b_u8, 0x8c_u8])
    def query_interface(this : ISpeechObjectToken*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechObjectToken*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechObjectToken*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechObjectToken*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechObjectToken*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechObjectToken*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechObjectToken*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : ISpeechObjectToken*, object_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, object_id)
    end
    def get_DataKey(this : ISpeechObjectToken*, data_key : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataKey.call(this, data_key)
    end
    def get_Category(this : ISpeechObjectToken*, category : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Category.call(this, category)
    end
    def get_description(this : ISpeechObjectToken*, locale : Int32, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, locale, description)
    end
    def set_id(this : ISpeechObjectToken*, id : Win32cr::Foundation::BSTR, category_id : Win32cr::Foundation::BSTR, create_if_not_exist : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, id, category_id, create_if_not_exist)
    end
    def get_attribute(this : ISpeechObjectToken*, attribute_name : Win32cr::Foundation::BSTR, attribute_value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, attribute_name, attribute_value)
    end
    def create_instance(this : ISpeechObjectToken*, pUnkOuter : Void*, cls_context : Win32cr::Media::Speech::SpeechTokenContext, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, cls_context, object)
    end
    def remove(this : ISpeechObjectToken*, object_storage_clsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, object_storage_clsid)
    end
    def get_storage_file_name(this : ISpeechObjectToken*, object_storage_clsid : Win32cr::Foundation::BSTR, key_name : Win32cr::Foundation::BSTR, file_name : Win32cr::Foundation::BSTR, folder : Win32cr::Media::Speech::SpeechTokenShellFolder, file_path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_file_name.call(this, object_storage_clsid, key_name, file_name, folder, file_path)
    end
    def remove_storage_file_name(this : ISpeechObjectToken*, object_storage_clsid : Win32cr::Foundation::BSTR, key_name : Win32cr::Foundation::BSTR, delete_file_a : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_storage_file_name.call(this, object_storage_clsid, key_name, delete_file_a)
    end
    def is_ui_supported(this : ISpeechObjectToken*, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*, object : Void*, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, type_of_ui, extra_data, object, supported)
    end
    def display_ui(this : ISpeechObjectToken*, hWnd : Int32, title : Win32cr::Foundation::BSTR, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hWnd, title, type_of_ui, extra_data, object)
    end
    def matches_attributes(this : ISpeechObjectToken*, attributes : Win32cr::Foundation::BSTR, matches : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_attributes.call(this, attributes, matches)
    end

  end

  @[Extern]
  record ISpeechObjectTokensVtbl,
    query_interface : Proc(ISpeechObjectTokens*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechObjectTokens*, UInt32),
    release : Proc(ISpeechObjectTokens*, UInt32),
    get_type_info_count : Proc(ISpeechObjectTokens*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechObjectTokens*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechObjectTokens*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechObjectTokens*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechObjectTokens*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechObjectTokens*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechObjectTokens*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechObjectTokens, lpVtbl : ISpeechObjectTokensVtbl* do
    GUID = LibC::GUID.new(0x9285b776_u32, 0x2e7b_u16, 0x4bc0_u16, StaticArray[0xb5_u8, 0x3e_u8, 0x58_u8, 0xe_u8, 0xb6_u8, 0xfa_u8, 0x96_u8, 0x7f_u8])
    def query_interface(this : ISpeechObjectTokens*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechObjectTokens*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechObjectTokens*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechObjectTokens*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechObjectTokens*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechObjectTokens*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechObjectTokens*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechObjectTokens*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechObjectTokens*, index : Int32, token : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, token)
    end
    def get__NewEnum(this : ISpeechObjectTokens*, ppEnumVARIANT : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVARIANT)
    end

  end

  @[Extern]
  record ISpeechObjectTokenCategoryVtbl,
    query_interface : Proc(ISpeechObjectTokenCategory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechObjectTokenCategory*, UInt32),
    release : Proc(ISpeechObjectTokenCategory*, UInt32),
    get_type_info_count : Proc(ISpeechObjectTokenCategory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechObjectTokenCategory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechObjectTokenCategory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechObjectTokenCategory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechObjectTokenCategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Default : Proc(ISpeechObjectTokenCategory*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Default : Proc(ISpeechObjectTokenCategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_id : Proc(ISpeechObjectTokenCategory*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_data_key : Proc(ISpeechObjectTokenCategory*, Win32cr::Media::Speech::SpeechDataKeyLocation, Void**, Win32cr::Foundation::HRESULT),
    enumerate_tokens : Proc(ISpeechObjectTokenCategory*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechObjectTokenCategory, lpVtbl : ISpeechObjectTokenCategoryVtbl* do
    GUID = LibC::GUID.new(0xca7eac50_u32, 0x2d01_u16, 0x4145_u16, StaticArray[0x86_u8, 0xd4_u8, 0x5a_u8, 0xe7_u8, 0xd7_u8, 0xf_u8, 0x44_u8, 0x69_u8])
    def query_interface(this : ISpeechObjectTokenCategory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechObjectTokenCategory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechObjectTokenCategory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechObjectTokenCategory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechObjectTokenCategory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechObjectTokenCategory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechObjectTokenCategory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : ISpeechObjectTokenCategory*, id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def put_Default(this : ISpeechObjectTokenCategory*, token_id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Default.call(this, token_id)
    end
    def get_Default(this : ISpeechObjectTokenCategory*, token_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Default.call(this, token_id)
    end
    def set_id(this : ISpeechObjectTokenCategory*, id : Win32cr::Foundation::BSTR, create_if_not_exist : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_id.call(this, id, create_if_not_exist)
    end
    def get_data_key(this : ISpeechObjectTokenCategory*, location : Win32cr::Media::Speech::SpeechDataKeyLocation, data_key : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_key.call(this, location, data_key)
    end
    def enumerate_tokens(this : ISpeechObjectTokenCategory*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_tokens.call(this, required_attributes, optional_attributes, tokens)
    end

  end

  @[Extern]
  record ISpeechAudioBufferInfoVtbl,
    query_interface : Proc(ISpeechAudioBufferInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechAudioBufferInfo*, UInt32),
    release : Proc(ISpeechAudioBufferInfo*, UInt32),
    get_type_info_count : Proc(ISpeechAudioBufferInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechAudioBufferInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechAudioBufferInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechAudioBufferInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_MinNotification : Proc(ISpeechAudioBufferInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_MinNotification : Proc(ISpeechAudioBufferInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_BufferSize : Proc(ISpeechAudioBufferInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_BufferSize : Proc(ISpeechAudioBufferInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_EventBias : Proc(ISpeechAudioBufferInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_EventBias : Proc(ISpeechAudioBufferInfo*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechAudioBufferInfo, lpVtbl : ISpeechAudioBufferInfoVtbl* do
    GUID = LibC::GUID.new(0x11b103d8_u32, 0x1142_u16, 0x4edf_u16, StaticArray[0xa0_u8, 0x93_u8, 0x82_u8, 0xfb_u8, 0x39_u8, 0x15_u8, 0xf8_u8, 0xcc_u8])
    def query_interface(this : ISpeechAudioBufferInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechAudioBufferInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechAudioBufferInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechAudioBufferInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechAudioBufferInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechAudioBufferInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechAudioBufferInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_MinNotification(this : ISpeechAudioBufferInfo*, min_notification : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinNotification.call(this, min_notification)
    end
    def put_MinNotification(this : ISpeechAudioBufferInfo*, min_notification : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinNotification.call(this, min_notification)
    end
    def get_BufferSize(this : ISpeechAudioBufferInfo*, buffer_size : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferSize.call(this, buffer_size)
    end
    def put_BufferSize(this : ISpeechAudioBufferInfo*, buffer_size : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BufferSize.call(this, buffer_size)
    end
    def get_EventBias(this : ISpeechAudioBufferInfo*, event_bias : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventBias.call(this, event_bias)
    end
    def put_EventBias(this : ISpeechAudioBufferInfo*, event_bias : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventBias.call(this, event_bias)
    end

  end

  @[Extern]
  record ISpeechAudioStatusVtbl,
    query_interface : Proc(ISpeechAudioStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechAudioStatus*, UInt32),
    release : Proc(ISpeechAudioStatus*, UInt32),
    get_type_info_count : Proc(ISpeechAudioStatus*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechAudioStatus*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechAudioStatus*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechAudioStatus*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FreeBufferSpace : Proc(ISpeechAudioStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_NonBlockingIO : Proc(ISpeechAudioStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISpeechAudioStatus*, Win32cr::Media::Speech::SpeechAudioState*, Win32cr::Foundation::HRESULT),
    get_CurrentSeekPosition : Proc(ISpeechAudioStatus*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CurrentDevicePosition : Proc(ISpeechAudioStatus*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechAudioStatus, lpVtbl : ISpeechAudioStatusVtbl* do
    GUID = LibC::GUID.new(0xc62d9c91_u32, 0x7458_u16, 0x47f6_u16, StaticArray[0x86_u8, 0x2d_u8, 0x1e_u8, 0xf8_u8, 0x6f_u8, 0xb0_u8, 0xb2_u8, 0x78_u8])
    def query_interface(this : ISpeechAudioStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechAudioStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechAudioStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechAudioStatus*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechAudioStatus*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechAudioStatus*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechAudioStatus*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FreeBufferSpace(this : ISpeechAudioStatus*, free_buffer_space : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FreeBufferSpace.call(this, free_buffer_space)
    end
    def get_NonBlockingIO(this : ISpeechAudioStatus*, non_blocking_io : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonBlockingIO.call(this, non_blocking_io)
    end
    def get_State(this : ISpeechAudioStatus*, state : Win32cr::Media::Speech::SpeechAudioState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def get_CurrentSeekPosition(this : ISpeechAudioStatus*, current_seek_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSeekPosition.call(this, current_seek_position)
    end
    def get_CurrentDevicePosition(this : ISpeechAudioStatus*, current_device_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDevicePosition.call(this, current_device_position)
    end

  end

  @[Extern]
  record ISpeechAudioFormatVtbl,
    query_interface : Proc(ISpeechAudioFormat*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechAudioFormat*, UInt32),
    release : Proc(ISpeechAudioFormat*, UInt32),
    get_type_info_count : Proc(ISpeechAudioFormat*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechAudioFormat*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechAudioFormat*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechAudioFormat*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISpeechAudioFormat*, Win32cr::Media::Speech::SpeechAudioFormatType*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(ISpeechAudioFormat*, Win32cr::Media::Speech::SpeechAudioFormatType, Win32cr::Foundation::HRESULT),
    get_Guid : Proc(ISpeechAudioFormat*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Guid : Proc(ISpeechAudioFormat*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_wave_format_ex : Proc(ISpeechAudioFormat*, Void**, Win32cr::Foundation::HRESULT),
    set_wave_format_ex : Proc(ISpeechAudioFormat*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechAudioFormat, lpVtbl : ISpeechAudioFormatVtbl* do
    GUID = LibC::GUID.new(0xe6e9c590_u32, 0x3e18_u16, 0x40e3_u16, StaticArray[0x82_u8, 0x99_u8, 0x6_u8, 0x1f_u8, 0x98_u8, 0xbd_u8, 0xe7_u8, 0xc7_u8])
    def query_interface(this : ISpeechAudioFormat*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechAudioFormat*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechAudioFormat*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechAudioFormat*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechAudioFormat*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechAudioFormat*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechAudioFormat*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ISpeechAudioFormat*, audio_format : Win32cr::Media::Speech::SpeechAudioFormatType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, audio_format)
    end
    def put_Type(this : ISpeechAudioFormat*, audio_format : Win32cr::Media::Speech::SpeechAudioFormatType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, audio_format)
    end
    def get_Guid(this : ISpeechAudioFormat*, guid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guid.call(this, guid)
    end
    def put_Guid(this : ISpeechAudioFormat*, guid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Guid.call(this, guid)
    end
    def get_wave_format_ex(this : ISpeechAudioFormat*, speech_wave_format_ex : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wave_format_ex.call(this, speech_wave_format_ex)
    end
    def set_wave_format_ex(this : ISpeechAudioFormat*, speech_wave_format_ex : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wave_format_ex.call(this, speech_wave_format_ex)
    end

  end

  @[Extern]
  record ISpeechWaveFormatExVtbl,
    query_interface : Proc(ISpeechWaveFormatEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechWaveFormatEx*, UInt32),
    release : Proc(ISpeechWaveFormatEx*, UInt32),
    get_type_info_count : Proc(ISpeechWaveFormatEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechWaveFormatEx*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechWaveFormatEx*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechWaveFormatEx*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FormatTag : Proc(ISpeechWaveFormatEx*, Int16*, Win32cr::Foundation::HRESULT),
    put_FormatTag : Proc(ISpeechWaveFormatEx*, Int16, Win32cr::Foundation::HRESULT),
    get_Channels : Proc(ISpeechWaveFormatEx*, Int16*, Win32cr::Foundation::HRESULT),
    put_Channels : Proc(ISpeechWaveFormatEx*, Int16, Win32cr::Foundation::HRESULT),
    get_SamplesPerSec : Proc(ISpeechWaveFormatEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_SamplesPerSec : Proc(ISpeechWaveFormatEx*, Int32, Win32cr::Foundation::HRESULT),
    get_AvgBytesPerSec : Proc(ISpeechWaveFormatEx*, Int32*, Win32cr::Foundation::HRESULT),
    put_AvgBytesPerSec : Proc(ISpeechWaveFormatEx*, Int32, Win32cr::Foundation::HRESULT),
    get_BlockAlign : Proc(ISpeechWaveFormatEx*, Int16*, Win32cr::Foundation::HRESULT),
    put_BlockAlign : Proc(ISpeechWaveFormatEx*, Int16, Win32cr::Foundation::HRESULT),
    get_BitsPerSample : Proc(ISpeechWaveFormatEx*, Int16*, Win32cr::Foundation::HRESULT),
    put_BitsPerSample : Proc(ISpeechWaveFormatEx*, Int16, Win32cr::Foundation::HRESULT),
    get_ExtraData : Proc(ISpeechWaveFormatEx*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_ExtraData : Proc(ISpeechWaveFormatEx*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechWaveFormatEx, lpVtbl : ISpeechWaveFormatExVtbl* do
    GUID = LibC::GUID.new(0x7a1ef0d5_u32, 0x1581_u16, 0x4741_u16, StaticArray[0x88_u8, 0xe4_u8, 0x20_u8, 0x9a_u8, 0x49_u8, 0xf1_u8, 0x1a_u8, 0x10_u8])
    def query_interface(this : ISpeechWaveFormatEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechWaveFormatEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechWaveFormatEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechWaveFormatEx*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechWaveFormatEx*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechWaveFormatEx*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechWaveFormatEx*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FormatTag(this : ISpeechWaveFormatEx*, format_tag : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatTag.call(this, format_tag)
    end
    def put_FormatTag(this : ISpeechWaveFormatEx*, format_tag : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatTag.call(this, format_tag)
    end
    def get_Channels(this : ISpeechWaveFormatEx*, channels : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Channels.call(this, channels)
    end
    def put_Channels(this : ISpeechWaveFormatEx*, channels : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Channels.call(this, channels)
    end
    def get_SamplesPerSec(this : ISpeechWaveFormatEx*, samples_per_sec : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SamplesPerSec.call(this, samples_per_sec)
    end
    def put_SamplesPerSec(this : ISpeechWaveFormatEx*, samples_per_sec : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SamplesPerSec.call(this, samples_per_sec)
    end
    def get_AvgBytesPerSec(this : ISpeechWaveFormatEx*, avg_bytes_per_sec : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvgBytesPerSec.call(this, avg_bytes_per_sec)
    end
    def put_AvgBytesPerSec(this : ISpeechWaveFormatEx*, avg_bytes_per_sec : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AvgBytesPerSec.call(this, avg_bytes_per_sec)
    end
    def get_BlockAlign(this : ISpeechWaveFormatEx*, block_align : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockAlign.call(this, block_align)
    end
    def put_BlockAlign(this : ISpeechWaveFormatEx*, block_align : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockAlign.call(this, block_align)
    end
    def get_BitsPerSample(this : ISpeechWaveFormatEx*, bits_per_sample : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BitsPerSample.call(this, bits_per_sample)
    end
    def put_BitsPerSample(this : ISpeechWaveFormatEx*, bits_per_sample : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BitsPerSample.call(this, bits_per_sample)
    end
    def get_ExtraData(this : ISpeechWaveFormatEx*, extra_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtraData.call(this, extra_data)
    end
    def put_ExtraData(this : ISpeechWaveFormatEx*, extra_data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExtraData.call(this, extra_data)
    end

  end

  @[Extern]
  record ISpeechBaseStreamVtbl,
    query_interface : Proc(ISpeechBaseStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechBaseStream*, UInt32),
    release : Proc(ISpeechBaseStream*, UInt32),
    get_type_info_count : Proc(ISpeechBaseStream*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechBaseStream*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechBaseStream*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechBaseStream*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechBaseStream*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechBaseStream*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechBaseStream*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechBaseStream*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechBaseStream*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechBaseStream, lpVtbl : ISpeechBaseStreamVtbl* do
    GUID = LibC::GUID.new(0x6450336f_u32, 0x7d49_u16, 0x4ced_u16, StaticArray[0x80_u8, 0x97_u8, 0x49_u8, 0xd6_u8, 0xde_u8, 0xe3_u8, 0x72_u8, 0x94_u8])
    def query_interface(this : ISpeechBaseStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechBaseStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechBaseStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechBaseStream*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechBaseStream*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechBaseStream*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechBaseStream*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechBaseStream*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechBaseStream*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechBaseStream*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechBaseStream*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechBaseStream*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end

  end

  @[Extern]
  record ISpeechFileStreamVtbl,
    query_interface : Proc(ISpeechFileStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechFileStream*, UInt32),
    release : Proc(ISpeechFileStream*, UInt32),
    get_type_info_count : Proc(ISpeechFileStream*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechFileStream*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechFileStream*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechFileStream*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechFileStream*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechFileStream*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechFileStream*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechFileStream*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechFileStream*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    open : Proc(ISpeechFileStream*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechStreamFileMode, Int16, Win32cr::Foundation::HRESULT),
    close : Proc(ISpeechFileStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechFileStream, lpVtbl : ISpeechFileStreamVtbl* do
    GUID = LibC::GUID.new(0xaf67f125_u32, 0xab39_u16, 0x4e93_u16, StaticArray[0xb4_u8, 0xa2_u8, 0xcc_u8, 0x2e_u8, 0x66_u8, 0xe1_u8, 0x82_u8, 0xa7_u8])
    def query_interface(this : ISpeechFileStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechFileStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechFileStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechFileStream*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechFileStream*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechFileStream*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechFileStream*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechFileStream*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechFileStream*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechFileStream*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechFileStream*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechFileStream*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end
    def open(this : ISpeechFileStream*, file_name : Win32cr::Foundation::BSTR, file_mode : Win32cr::Media::Speech::SpeechStreamFileMode, do_events : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, file_name, file_mode, do_events)
    end
    def close(this : ISpeechFileStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record ISpeechMemoryStreamVtbl,
    query_interface : Proc(ISpeechMemoryStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechMemoryStream*, UInt32),
    release : Proc(ISpeechMemoryStream*, UInt32),
    get_type_info_count : Proc(ISpeechMemoryStream*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechMemoryStream*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechMemoryStream*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechMemoryStream*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechMemoryStream*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechMemoryStream*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechMemoryStream*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechMemoryStream*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechMemoryStream*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_data : Proc(ISpeechMemoryStream*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISpeechMemoryStream*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechMemoryStream, lpVtbl : ISpeechMemoryStreamVtbl* do
    GUID = LibC::GUID.new(0xeeb14b68_u32, 0x808b_u16, 0x4abe_u16, StaticArray[0xa5_u8, 0xea_u8, 0xb5_u8, 0x1d_u8, 0xa7_u8, 0x58_u8, 0x80_u8, 0x8_u8])
    def query_interface(this : ISpeechMemoryStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechMemoryStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechMemoryStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechMemoryStream*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechMemoryStream*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechMemoryStream*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechMemoryStream*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechMemoryStream*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechMemoryStream*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechMemoryStream*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechMemoryStream*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechMemoryStream*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end
    def set_data(this : ISpeechMemoryStream*, data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, data)
    end
    def get_data(this : ISpeechMemoryStream*, pData : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pData)
    end

  end

  @[Extern]
  record ISpeechCustomStreamVtbl,
    query_interface : Proc(ISpeechCustomStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechCustomStream*, UInt32),
    release : Proc(ISpeechCustomStream*, UInt32),
    get_type_info_count : Proc(ISpeechCustomStream*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechCustomStream*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechCustomStream*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechCustomStream*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechCustomStream*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechCustomStream*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechCustomStream*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechCustomStream*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechCustomStream*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_BaseStream : Proc(ISpeechCustomStream*, Void**, Win32cr::Foundation::HRESULT),
    putref_BaseStream : Proc(ISpeechCustomStream*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechCustomStream, lpVtbl : ISpeechCustomStreamVtbl* do
    GUID = LibC::GUID.new(0x1a9e9f4f_u32, 0x104f_u16, 0x4db8_u16, StaticArray[0xa1_u8, 0x15_u8, 0xef_u8, 0xd7_u8, 0xfd_u8, 0xc_u8, 0x97_u8, 0xae_u8])
    def query_interface(this : ISpeechCustomStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechCustomStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechCustomStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechCustomStream*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechCustomStream*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechCustomStream*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechCustomStream*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechCustomStream*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechCustomStream*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechCustomStream*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechCustomStream*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechCustomStream*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end
    def get_BaseStream(this : ISpeechCustomStream*, ppUnkStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BaseStream.call(this, ppUnkStream)
    end
    def putref_BaseStream(this : ISpeechCustomStream*, pUnkStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_BaseStream.call(this, pUnkStream)
    end

  end

  @[Extern]
  record ISpeechAudioVtbl,
    query_interface : Proc(ISpeechAudio*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechAudio*, UInt32),
    release : Proc(ISpeechAudio*, UInt32),
    get_type_info_count : Proc(ISpeechAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechAudio*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechAudio*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechAudio*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechAudio*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechAudio*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechAudio*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechAudio*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechAudio*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ISpeechAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_BufferInfo : Proc(ISpeechAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_DefaultFormat : Proc(ISpeechAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_Volume : Proc(ISpeechAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_Volume : Proc(ISpeechAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_BufferNotifySize : Proc(ISpeechAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_BufferNotifySize : Proc(ISpeechAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_EventHandle : Proc(ISpeechAudio*, Int32*, Win32cr::Foundation::HRESULT),
    set_state : Proc(ISpeechAudio*, Win32cr::Media::Speech::SpeechAudioState, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechAudio, lpVtbl : ISpeechAudioVtbl* do
    GUID = LibC::GUID.new(0xcff8e175_u32, 0x19e_u16, 0x11d3_u16, StaticArray[0xa0_u8, 0x8e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0xb5_u8])
    def query_interface(this : ISpeechAudio*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechAudio*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechAudio*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechAudio*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechAudio*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechAudio*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechAudio*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechAudio*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechAudio*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechAudio*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechAudio*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechAudio*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end
    def get_Status(this : ISpeechAudio*, status : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_BufferInfo(this : ISpeechAudio*, buffer_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferInfo.call(this, buffer_info)
    end
    def get_DefaultFormat(this : ISpeechAudio*, stream_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultFormat.call(this, stream_format)
    end
    def get_Volume(this : ISpeechAudio*, volume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volume.call(this, volume)
    end
    def put_Volume(this : ISpeechAudio*, volume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volume.call(this, volume)
    end
    def get_BufferNotifySize(this : ISpeechAudio*, buffer_notify_size : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferNotifySize.call(this, buffer_notify_size)
    end
    def put_BufferNotifySize(this : ISpeechAudio*, buffer_notify_size : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BufferNotifySize.call(this, buffer_notify_size)
    end
    def get_EventHandle(this : ISpeechAudio*, event_handle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventHandle.call(this, event_handle)
    end
    def set_state(this : ISpeechAudio*, state : Win32cr::Media::Speech::SpeechAudioState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, state)
    end

  end

  @[Extern]
  record ISpeechMMSysAudioVtbl,
    query_interface : Proc(ISpeechMMSysAudio*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechMMSysAudio*, UInt32),
    release : Proc(ISpeechMMSysAudio*, UInt32),
    get_type_info_count : Proc(ISpeechMMSysAudio*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechMMSysAudio*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechMMSysAudio*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechMMSysAudio*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISpeechMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    putref_Format : Proc(ISpeechMMSysAudio*, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(ISpeechMMSysAudio*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISpeechMMSysAudio*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    seek : Proc(ISpeechMMSysAudio*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechStreamSeekPositionType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ISpeechMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_BufferInfo : Proc(ISpeechMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_DefaultFormat : Proc(ISpeechMMSysAudio*, Void**, Win32cr::Foundation::HRESULT),
    get_Volume : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_Volume : Proc(ISpeechMMSysAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_BufferNotifySize : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_BufferNotifySize : Proc(ISpeechMMSysAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_EventHandle : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT),
    set_state : Proc(ISpeechMMSysAudio*, Win32cr::Media::Speech::SpeechAudioState, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_DeviceId : Proc(ISpeechMMSysAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_LineId : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT),
    put_LineId : Proc(ISpeechMMSysAudio*, Int32, Win32cr::Foundation::HRESULT),
    get_MMHandle : Proc(ISpeechMMSysAudio*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechMMSysAudio, lpVtbl : ISpeechMMSysAudioVtbl* do
    GUID = LibC::GUID.new(0x3c76af6d_u32, 0x1fd7_u16, 0x4831_u16, StaticArray[0x81_u8, 0xd1_u8, 0x3b_u8, 0x71_u8, 0xd5_u8, 0xa1_u8, 0x3c_u8, 0x44_u8])
    def query_interface(this : ISpeechMMSysAudio*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechMMSysAudio*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechMMSysAudio*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechMMSysAudio*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechMMSysAudio*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechMMSysAudio*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechMMSysAudio*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Format(this : ISpeechMMSysAudio*, audio_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, audio_format)
    end
    def putref_Format(this : ISpeechMMSysAudio*, audio_format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Format.call(this, audio_format)
    end
    def read(this : ISpeechMMSysAudio*, buffer : Win32cr::System::Com::VARIANT*, number_of_bytes : Int32, bytes_read : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, buffer, number_of_bytes, bytes_read)
    end
    def write(this : ISpeechMMSysAudio*, buffer : Win32cr::System::Com::VARIANT, bytes_written : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, buffer, bytes_written)
    end
    def seek(this : ISpeechMMSysAudio*, position : Win32cr::System::Com::VARIANT, origin : Win32cr::Media::Speech::SpeechStreamSeekPositionType, new_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, position, origin, new_position)
    end
    def get_Status(this : ISpeechMMSysAudio*, status : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_BufferInfo(this : ISpeechMMSysAudio*, buffer_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferInfo.call(this, buffer_info)
    end
    def get_DefaultFormat(this : ISpeechMMSysAudio*, stream_format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultFormat.call(this, stream_format)
    end
    def get_Volume(this : ISpeechMMSysAudio*, volume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volume.call(this, volume)
    end
    def put_Volume(this : ISpeechMMSysAudio*, volume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volume.call(this, volume)
    end
    def get_BufferNotifySize(this : ISpeechMMSysAudio*, buffer_notify_size : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferNotifySize.call(this, buffer_notify_size)
    end
    def put_BufferNotifySize(this : ISpeechMMSysAudio*, buffer_notify_size : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BufferNotifySize.call(this, buffer_notify_size)
    end
    def get_EventHandle(this : ISpeechMMSysAudio*, event_handle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventHandle.call(this, event_handle)
    end
    def set_state(this : ISpeechMMSysAudio*, state : Win32cr::Media::Speech::SpeechAudioState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, state)
    end
    def get_DeviceId(this : ISpeechMMSysAudio*, device_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, device_id)
    end
    def put_DeviceId(this : ISpeechMMSysAudio*, device_id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DeviceId.call(this, device_id)
    end
    def get_LineId(this : ISpeechMMSysAudio*, line_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineId.call(this, line_id)
    end
    def put_LineId(this : ISpeechMMSysAudio*, line_id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LineId.call(this, line_id)
    end
    def get_MMHandle(this : ISpeechMMSysAudio*, handle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MMHandle.call(this, handle)
    end

  end

  @[Extern]
  record ISpeechVoiceVtbl,
    query_interface : Proc(ISpeechVoice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechVoice*, UInt32),
    release : Proc(ISpeechVoice*, UInt32),
    get_type_info_count : Proc(ISpeechVoice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechVoice*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechVoice*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechVoice*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ISpeechVoice*, Void**, Win32cr::Foundation::HRESULT),
    get_Voice : Proc(ISpeechVoice*, Void**, Win32cr::Foundation::HRESULT),
    putref_Voice : Proc(ISpeechVoice*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioOutput : Proc(ISpeechVoice*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioOutput : Proc(ISpeechVoice*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioOutputStream : Proc(ISpeechVoice*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioOutputStream : Proc(ISpeechVoice*, Void*, Win32cr::Foundation::HRESULT),
    get_Rate : Proc(ISpeechVoice*, Int32*, Win32cr::Foundation::HRESULT),
    put_Rate : Proc(ISpeechVoice*, Int32, Win32cr::Foundation::HRESULT),
    get_Volume : Proc(ISpeechVoice*, Int32*, Win32cr::Foundation::HRESULT),
    put_Volume : Proc(ISpeechVoice*, Int32, Win32cr::Foundation::HRESULT),
    put_AllowAudioOutputFormatChangesOnNextSet : Proc(ISpeechVoice*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowAudioOutputFormatChangesOnNextSet : Proc(ISpeechVoice*, Int16*, Win32cr::Foundation::HRESULT),
    get_EventInterests : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoiceEvents*, Win32cr::Foundation::HRESULT),
    put_EventInterests : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoiceEvents, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoicePriority, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoicePriority*, Win32cr::Foundation::HRESULT),
    put_AlertBoundary : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoiceEvents, Win32cr::Foundation::HRESULT),
    get_AlertBoundary : Proc(ISpeechVoice*, Win32cr::Media::Speech::SpeechVoiceEvents*, Win32cr::Foundation::HRESULT),
    put_SynchronousSpeakTimeout : Proc(ISpeechVoice*, Int32, Win32cr::Foundation::HRESULT),
    get_SynchronousSpeakTimeout : Proc(ISpeechVoice*, Int32*, Win32cr::Foundation::HRESULT),
    speak : Proc(ISpeechVoice*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    speak_stream : Proc(ISpeechVoice*, Void*, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    pause : Proc(ISpeechVoice*, Win32cr::Foundation::HRESULT),
    resume : Proc(ISpeechVoice*, Win32cr::Foundation::HRESULT),
    skip : Proc(ISpeechVoice*, Win32cr::Foundation::BSTR, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_voices : Proc(ISpeechVoice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_audio_outputs : Proc(ISpeechVoice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    wait_until_done : Proc(ISpeechVoice*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    speak_complete_event : Proc(ISpeechVoice*, Int32*, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpeechVoice*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpeechVoice*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechVoice, lpVtbl : ISpeechVoiceVtbl* do
    GUID = LibC::GUID.new(0x269316d8_u32, 0x57bd_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xee_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
    def query_interface(this : ISpeechVoice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechVoice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechVoice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechVoice*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechVoice*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechVoice*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechVoice*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Status(this : ISpeechVoice*, status : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_Voice(this : ISpeechVoice*, voice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Voice.call(this, voice)
    end
    def putref_Voice(this : ISpeechVoice*, voice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Voice.call(this, voice)
    end
    def get_AudioOutput(this : ISpeechVoice*, audio_output : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioOutput.call(this, audio_output)
    end
    def putref_AudioOutput(this : ISpeechVoice*, audio_output : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioOutput.call(this, audio_output)
    end
    def get_AudioOutputStream(this : ISpeechVoice*, audio_output_stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioOutputStream.call(this, audio_output_stream)
    end
    def putref_AudioOutputStream(this : ISpeechVoice*, audio_output_stream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioOutputStream.call(this, audio_output_stream)
    end
    def get_Rate(this : ISpeechVoice*, rate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rate.call(this, rate)
    end
    def put_Rate(this : ISpeechVoice*, rate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Rate.call(this, rate)
    end
    def get_Volume(this : ISpeechVoice*, volume : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volume.call(this, volume)
    end
    def put_Volume(this : ISpeechVoice*, volume : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volume.call(this, volume)
    end
    def put_AllowAudioOutputFormatChangesOnNextSet(this : ISpeechVoice*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowAudioOutputFormatChangesOnNextSet.call(this, allow)
    end
    def get_AllowAudioOutputFormatChangesOnNextSet(this : ISpeechVoice*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowAudioOutputFormatChangesOnNextSet.call(this, allow)
    end
    def get_EventInterests(this : ISpeechVoice*, event_interest_flags : Win32cr::Media::Speech::SpeechVoiceEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventInterests.call(this, event_interest_flags)
    end
    def put_EventInterests(this : ISpeechVoice*, event_interest_flags : Win32cr::Media::Speech::SpeechVoiceEvents) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventInterests.call(this, event_interest_flags)
    end
    def put_Priority(this : ISpeechVoice*, priority : Win32cr::Media::Speech::SpeechVoicePriority) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, priority)
    end
    def get_Priority(this : ISpeechVoice*, priority : Win32cr::Media::Speech::SpeechVoicePriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, priority)
    end
    def put_AlertBoundary(this : ISpeechVoice*, boundary : Win32cr::Media::Speech::SpeechVoiceEvents) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AlertBoundary.call(this, boundary)
    end
    def get_AlertBoundary(this : ISpeechVoice*, boundary : Win32cr::Media::Speech::SpeechVoiceEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AlertBoundary.call(this, boundary)
    end
    def put_SynchronousSpeakTimeout(this : ISpeechVoice*, msTimeout : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SynchronousSpeakTimeout.call(this, msTimeout)
    end
    def get_SynchronousSpeakTimeout(this : ISpeechVoice*, msTimeout : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SynchronousSpeakTimeout.call(this, msTimeout)
    end
    def speak(this : ISpeechVoice*, text : Win32cr::Foundation::BSTR, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak.call(this, text, flags, stream_number)
    end
    def speak_stream(this : ISpeechVoice*, stream : Void*, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_stream.call(this, stream, flags, stream_number)
    end
    def pause(this : ISpeechVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : ISpeechVoice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def skip(this : ISpeechVoice*, type__ : Win32cr::Foundation::BSTR, num_items : Int32, num_skipped : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, type__, num_items, num_skipped)
    end
    def get_voices(this : ISpeechVoice*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, object_tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_voices.call(this, required_attributes, optional_attributes, object_tokens)
    end
    def get_audio_outputs(this : ISpeechVoice*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, object_tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio_outputs.call(this, required_attributes, optional_attributes, object_tokens)
    end
    def wait_until_done(this : ISpeechVoice*, msTimeout : Int32, done : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_until_done.call(this, msTimeout, done)
    end
    def speak_complete_event(this : ISpeechVoice*, handle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_complete_event.call(this, handle)
    end
    def is_ui_supported(this : ISpeechVoice*, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, type_of_ui, extra_data, supported)
    end
    def display_ui(this : ISpeechVoice*, hWndParent : Int32, title : Win32cr::Foundation::BSTR, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hWndParent, title, type_of_ui, extra_data)
    end

  end

  @[Extern]
  record ISpeechVoiceStatusVtbl,
    query_interface : Proc(ISpeechVoiceStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechVoiceStatus*, UInt32),
    release : Proc(ISpeechVoiceStatus*, UInt32),
    get_type_info_count : Proc(ISpeechVoiceStatus*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechVoiceStatus*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechVoiceStatus*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechVoiceStatus*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentStreamNumber : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_LastStreamNumberQueued : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_LastHResult : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_RunningState : Proc(ISpeechVoiceStatus*, Win32cr::Media::Speech::SpeechRunState*, Win32cr::Foundation::HRESULT),
    get_InputWordPosition : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_InputWordLength : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_InputSentencePosition : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_InputSentenceLength : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_LastBookmark : Proc(ISpeechVoiceStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LastBookmarkId : Proc(ISpeechVoiceStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_PhonemeId : Proc(ISpeechVoiceStatus*, Int16*, Win32cr::Foundation::HRESULT),
    get_VisemeId : Proc(ISpeechVoiceStatus*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechVoiceStatus, lpVtbl : ISpeechVoiceStatusVtbl* do
    GUID = LibC::GUID.new(0x8be47b07_u32, 0x57f6_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xee_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
    def query_interface(this : ISpeechVoiceStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechVoiceStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechVoiceStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechVoiceStatus*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechVoiceStatus*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechVoiceStatus*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechVoiceStatus*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CurrentStreamNumber(this : ISpeechVoiceStatus*, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentStreamNumber.call(this, stream_number)
    end
    def get_LastStreamNumberQueued(this : ISpeechVoiceStatus*, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastStreamNumberQueued.call(this, stream_number)
    end
    def get_LastHResult(this : ISpeechVoiceStatus*, h_result : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastHResult.call(this, h_result)
    end
    def get_RunningState(this : ISpeechVoiceStatus*, state : Win32cr::Media::Speech::SpeechRunState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunningState.call(this, state)
    end
    def get_InputWordPosition(this : ISpeechVoiceStatus*, position : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InputWordPosition.call(this, position)
    end
    def get_InputWordLength(this : ISpeechVoiceStatus*, length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InputWordLength.call(this, length)
    end
    def get_InputSentencePosition(this : ISpeechVoiceStatus*, position : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InputSentencePosition.call(this, position)
    end
    def get_InputSentenceLength(this : ISpeechVoiceStatus*, length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InputSentenceLength.call(this, length)
    end
    def get_LastBookmark(this : ISpeechVoiceStatus*, bookmark : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastBookmark.call(this, bookmark)
    end
    def get_LastBookmarkId(this : ISpeechVoiceStatus*, bookmark_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastBookmarkId.call(this, bookmark_id)
    end
    def get_PhonemeId(this : ISpeechVoiceStatus*, phone_id : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhonemeId.call(this, phone_id)
    end
    def get_VisemeId(this : ISpeechVoiceStatus*, viseme_id : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VisemeId.call(this, viseme_id)
    end

  end

  @[Extern]
  record ISpeechVoiceEvents_Vtbl,
    query_interface : Proc(ISpeechVoiceEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechVoiceEvents_*, UInt32),
    release : Proc(ISpeechVoiceEvents_*, UInt32),
    get_type_info_count : Proc(ISpeechVoiceEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechVoiceEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechVoiceEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechVoiceEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechVoiceEvents_, lpVtbl : ISpeechVoiceEvents_Vtbl* do
    GUID = LibC::GUID.new(0xa372acd1_u32, 0x3bef_u16, 0x4bbd_u16, StaticArray[0x8f_u8, 0xfb_u8, 0xcb_u8, 0x3e_u8, 0x2b_u8, 0x41_u8, 0x6a_u8, 0xf8_u8])
    def query_interface(this : ISpeechVoiceEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechVoiceEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechVoiceEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechVoiceEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechVoiceEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechVoiceEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechVoiceEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ISpeechRecognizerVtbl,
    query_interface : Proc(ISpeechRecognizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecognizer*, UInt32),
    release : Proc(ISpeechRecognizer*, UInt32),
    get_type_info_count : Proc(ISpeechRecognizer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecognizer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecognizer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecognizer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    putref_Recognizer : Proc(ISpeechRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    get_Recognizer : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    put_AllowAudioInputFormatChangesOnNextSet : Proc(ISpeechRecognizer*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowAudioInputFormatChangesOnNextSet : Proc(ISpeechRecognizer*, Int16*, Win32cr::Foundation::HRESULT),
    putref_AudioInput : Proc(ISpeechRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioInput : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioInputStream : Proc(ISpeechRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioInputStream : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    get_IsShared : Proc(ISpeechRecognizer*, Int16*, Win32cr::Foundation::HRESULT),
    put_State : Proc(ISpeechRecognizer*, Win32cr::Media::Speech::SpeechRecognizerState, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISpeechRecognizer*, Win32cr::Media::Speech::SpeechRecognizerState*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    putref_Profile : Proc(ISpeechRecognizer*, Void*, Win32cr::Foundation::HRESULT),
    get_Profile : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    emulate_recognition : Proc(ISpeechRecognizer*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    create_reco_context : Proc(ISpeechRecognizer*, Void**, Win32cr::Foundation::HRESULT),
    get_format : Proc(ISpeechRecognizer*, Win32cr::Media::Speech::SpeechFormatType, Void**, Win32cr::Foundation::HRESULT),
    set_property_number : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Int32, Int16*, Win32cr::Foundation::HRESULT),
    get_property_number : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Int32*, Int16*, Win32cr::Foundation::HRESULT),
    set_property_string : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_property_string : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Int16*, Win32cr::Foundation::HRESULT),
    is_ui_supported : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    display_ui : Proc(ISpeechRecognizer*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_recognizers : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_audio_inputs : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_profiles : Proc(ISpeechRecognizer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecognizer, lpVtbl : ISpeechRecognizerVtbl* do
    GUID = LibC::GUID.new(0x2d5f1c0c_u32, 0xbd75_u16, 0x4b08_u16, StaticArray[0x94_u8, 0x78_u8, 0x3b_u8, 0x11_u8, 0xfe_u8, 0xa2_u8, 0x58_u8, 0x6c_u8])
    def query_interface(this : ISpeechRecognizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecognizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecognizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecognizer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecognizer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecognizer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecognizer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def putref_Recognizer(this : ISpeechRecognizer*, recognizer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Recognizer.call(this, recognizer)
    end
    def get_Recognizer(this : ISpeechRecognizer*, recognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recognizer.call(this, recognizer)
    end
    def put_AllowAudioInputFormatChangesOnNextSet(this : ISpeechRecognizer*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowAudioInputFormatChangesOnNextSet.call(this, allow)
    end
    def get_AllowAudioInputFormatChangesOnNextSet(this : ISpeechRecognizer*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowAudioInputFormatChangesOnNextSet.call(this, allow)
    end
    def putref_AudioInput(this : ISpeechRecognizer*, audio_input : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioInput.call(this, audio_input)
    end
    def get_AudioInput(this : ISpeechRecognizer*, audio_input : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioInput.call(this, audio_input)
    end
    def putref_AudioInputStream(this : ISpeechRecognizer*, audio_input_stream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioInputStream.call(this, audio_input_stream)
    end
    def get_AudioInputStream(this : ISpeechRecognizer*, audio_input_stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioInputStream.call(this, audio_input_stream)
    end
    def get_IsShared(this : ISpeechRecognizer*, shared : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsShared.call(this, shared)
    end
    def put_State(this : ISpeechRecognizer*, state : Win32cr::Media::Speech::SpeechRecognizerState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, state)
    end
    def get_State(this : ISpeechRecognizer*, state : Win32cr::Media::Speech::SpeechRecognizerState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def get_Status(this : ISpeechRecognizer*, status : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def putref_Profile(this : ISpeechRecognizer*, profile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Profile.call(this, profile)
    end
    def get_Profile(this : ISpeechRecognizer*, profile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profile.call(this, profile)
    end
    def emulate_recognition(this : ISpeechRecognizer*, text_elements : Win32cr::System::Com::VARIANT, element_display_attributes : Win32cr::System::Com::VARIANT*, language_id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.emulate_recognition.call(this, text_elements, element_display_attributes, language_id)
    end
    def create_reco_context(this : ISpeechRecognizer*, new_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_reco_context.call(this, new_context)
    end
    def get_format(this : ISpeechRecognizer*, type__ : Win32cr::Media::Speech::SpeechFormatType, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, type__, format)
    end
    def set_property_number(this : ISpeechRecognizer*, name : Win32cr::Foundation::BSTR, value : Int32, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_number.call(this, name, value, supported)
    end
    def get_property_number(this : ISpeechRecognizer*, name : Win32cr::Foundation::BSTR, value : Int32*, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_number.call(this, name, value, supported)
    end
    def set_property_string(this : ISpeechRecognizer*, name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_string.call(this, name, value, supported)
    end
    def get_property_string(this : ISpeechRecognizer*, name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR*, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_string.call(this, name, value, supported)
    end
    def is_ui_supported(this : ISpeechRecognizer*, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_supported.call(this, type_of_ui, extra_data, supported)
    end
    def display_ui(this : ISpeechRecognizer*, hWndParent : Int32, title : Win32cr::Foundation::BSTR, type_of_ui : Win32cr::Foundation::BSTR, extra_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_ui.call(this, hWndParent, title, type_of_ui, extra_data)
    end
    def get_recognizers(this : ISpeechRecognizer*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, object_tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recognizers.call(this, required_attributes, optional_attributes, object_tokens)
    end
    def get_audio_inputs(this : ISpeechRecognizer*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, object_tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio_inputs.call(this, required_attributes, optional_attributes, object_tokens)
    end
    def get_profiles(this : ISpeechRecognizer*, required_attributes : Win32cr::Foundation::BSTR, optional_attributes : Win32cr::Foundation::BSTR, object_tokens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profiles.call(this, required_attributes, optional_attributes, object_tokens)
    end

  end

  @[Extern]
  record ISpeechRecognizerStatusVtbl,
    query_interface : Proc(ISpeechRecognizerStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecognizerStatus*, UInt32),
    release : Proc(ISpeechRecognizerStatus*, UInt32),
    get_type_info_count : Proc(ISpeechRecognizerStatus*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecognizerStatus*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecognizerStatus*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecognizerStatus*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AudioStatus : Proc(ISpeechRecognizerStatus*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentStreamPosition : Proc(ISpeechRecognizerStatus*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CurrentStreamNumber : Proc(ISpeechRecognizerStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfActiveRules : Proc(ISpeechRecognizerStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_ClsidEngine : Proc(ISpeechRecognizerStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SupportedLanguages : Proc(ISpeechRecognizerStatus*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecognizerStatus, lpVtbl : ISpeechRecognizerStatusVtbl* do
    GUID = LibC::GUID.new(0xbff9e781_u32, 0x53ec_u16, 0x484e_u16, StaticArray[0xbb_u8, 0x8a_u8, 0xe_u8, 0x1b_u8, 0x55_u8, 0x51_u8, 0xe3_u8, 0x5c_u8])
    def query_interface(this : ISpeechRecognizerStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecognizerStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecognizerStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecognizerStatus*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecognizerStatus*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecognizerStatus*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecognizerStatus*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AudioStatus(this : ISpeechRecognizerStatus*, audio_status : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioStatus.call(this, audio_status)
    end
    def get_CurrentStreamPosition(this : ISpeechRecognizerStatus*, pCurrentStreamPos : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentStreamPosition.call(this, pCurrentStreamPos)
    end
    def get_CurrentStreamNumber(this : ISpeechRecognizerStatus*, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentStreamNumber.call(this, stream_number)
    end
    def get_NumberOfActiveRules(this : ISpeechRecognizerStatus*, number_of_active_rules : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfActiveRules.call(this, number_of_active_rules)
    end
    def get_ClsidEngine(this : ISpeechRecognizerStatus*, clsid_engine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClsidEngine.call(this, clsid_engine)
    end
    def get_SupportedLanguages(this : ISpeechRecognizerStatus*, supported_languages : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedLanguages.call(this, supported_languages)
    end

  end

  @[Extern]
  record ISpeechRecoContextVtbl,
    query_interface : Proc(ISpeechRecoContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoContext*, UInt32),
    release : Proc(ISpeechRecoContext*, UInt32),
    get_type_info_count : Proc(ISpeechRecoContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Recognizer : Proc(ISpeechRecoContext*, Void**, Win32cr::Foundation::HRESULT),
    get_AudioInputInterferenceStatus : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechInterference*, Win32cr::Foundation::HRESULT),
    get_RequestedUIType : Proc(ISpeechRecoContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    putref_Voice : Proc(ISpeechRecoContext*, Void*, Win32cr::Foundation::HRESULT),
    get_Voice : Proc(ISpeechRecoContext*, Void**, Win32cr::Foundation::HRESULT),
    put_AllowVoiceFormatMatchingOnNextSet : Proc(ISpeechRecoContext*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowVoiceFormatMatchingOnNextSet : Proc(ISpeechRecoContext*, Int16*, Win32cr::Foundation::HRESULT),
    put_VoicePurgeEvent : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoEvents, Win32cr::Foundation::HRESULT),
    get_VoicePurgeEvent : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoEvents*, Win32cr::Foundation::HRESULT),
    put_EventInterests : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoEvents, Win32cr::Foundation::HRESULT),
    get_EventInterests : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoEvents*, Win32cr::Foundation::HRESULT),
    put_CmdMaxAlternates : Proc(ISpeechRecoContext*, Int32, Win32cr::Foundation::HRESULT),
    get_CmdMaxAlternates : Proc(ISpeechRecoContext*, Int32*, Win32cr::Foundation::HRESULT),
    put_State : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoContextState, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRecoContextState*, Win32cr::Foundation::HRESULT),
    put_RetainedAudio : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRetainedAudioOptions, Win32cr::Foundation::HRESULT),
    get_RetainedAudio : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechRetainedAudioOptions*, Win32cr::Foundation::HRESULT),
    putref_RetainedAudioFormat : Proc(ISpeechRecoContext*, Void*, Win32cr::Foundation::HRESULT),
    get_RetainedAudioFormat : Proc(ISpeechRecoContext*, Void**, Win32cr::Foundation::HRESULT),
    pause : Proc(ISpeechRecoContext*, Win32cr::Foundation::HRESULT),
    resume : Proc(ISpeechRecoContext*, Win32cr::Foundation::HRESULT),
    create_grammar : Proc(ISpeechRecoContext*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_result_from_memory : Proc(ISpeechRecoContext*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    bookmark : Proc(ISpeechRecoContext*, Win32cr::Media::Speech::SpeechBookmarkOptions, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_adaptation_data : Proc(ISpeechRecoContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoContext, lpVtbl : ISpeechRecoContextVtbl* do
    GUID = LibC::GUID.new(0x580aa49d_u32, 0x7e1e_u16, 0x4809_u16, StaticArray[0xb8_u8, 0xe2_u8, 0x57_u8, 0xda_u8, 0x80_u8, 0x61_u8, 0x4_u8, 0xb8_u8])
    def query_interface(this : ISpeechRecoContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Recognizer(this : ISpeechRecoContext*, recognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recognizer.call(this, recognizer)
    end
    def get_AudioInputInterferenceStatus(this : ISpeechRecoContext*, interference : Win32cr::Media::Speech::SpeechInterference*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioInputInterferenceStatus.call(this, interference)
    end
    def get_RequestedUIType(this : ISpeechRecoContext*, ui_type : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RequestedUIType.call(this, ui_type)
    end
    def putref_Voice(this : ISpeechRecoContext*, voice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Voice.call(this, voice)
    end
    def get_Voice(this : ISpeechRecoContext*, voice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Voice.call(this, voice)
    end
    def put_AllowVoiceFormatMatchingOnNextSet(this : ISpeechRecoContext*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowVoiceFormatMatchingOnNextSet.call(this, allow)
    end
    def get_AllowVoiceFormatMatchingOnNextSet(this : ISpeechRecoContext*, pAllow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowVoiceFormatMatchingOnNextSet.call(this, pAllow)
    end
    def put_VoicePurgeEvent(this : ISpeechRecoContext*, event_interest : Win32cr::Media::Speech::SpeechRecoEvents) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_VoicePurgeEvent.call(this, event_interest)
    end
    def get_VoicePurgeEvent(this : ISpeechRecoContext*, event_interest : Win32cr::Media::Speech::SpeechRecoEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VoicePurgeEvent.call(this, event_interest)
    end
    def put_EventInterests(this : ISpeechRecoContext*, event_interest : Win32cr::Media::Speech::SpeechRecoEvents) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventInterests.call(this, event_interest)
    end
    def get_EventInterests(this : ISpeechRecoContext*, event_interest : Win32cr::Media::Speech::SpeechRecoEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventInterests.call(this, event_interest)
    end
    def put_CmdMaxAlternates(this : ISpeechRecoContext*, max_alternates : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CmdMaxAlternates.call(this, max_alternates)
    end
    def get_CmdMaxAlternates(this : ISpeechRecoContext*, max_alternates : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CmdMaxAlternates.call(this, max_alternates)
    end
    def put_State(this : ISpeechRecoContext*, state : Win32cr::Media::Speech::SpeechRecoContextState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, state)
    end
    def get_State(this : ISpeechRecoContext*, state : Win32cr::Media::Speech::SpeechRecoContextState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def put_RetainedAudio(this : ISpeechRecoContext*, option : Win32cr::Media::Speech::SpeechRetainedAudioOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RetainedAudio.call(this, option)
    end
    def get_RetainedAudio(this : ISpeechRecoContext*, option : Win32cr::Media::Speech::SpeechRetainedAudioOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetainedAudio.call(this, option)
    end
    def putref_RetainedAudioFormat(this : ISpeechRecoContext*, format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_RetainedAudioFormat.call(this, format)
    end
    def get_RetainedAudioFormat(this : ISpeechRecoContext*, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetainedAudioFormat.call(this, format)
    end
    def pause(this : ISpeechRecoContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : ISpeechRecoContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def create_grammar(this : ISpeechRecoContext*, grammar_id : Win32cr::System::Com::VARIANT, grammar : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_grammar.call(this, grammar_id, grammar)
    end
    def create_result_from_memory(this : ISpeechRecoContext*, result_block : Win32cr::System::Com::VARIANT*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_result_from_memory.call(this, result_block, result)
    end
    def bookmark(this : ISpeechRecoContext*, options : Win32cr::Media::Speech::SpeechBookmarkOptions, stream_pos : Win32cr::System::Com::VARIANT, bookmark_id : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bookmark.call(this, options, stream_pos, bookmark_id)
    end
    def set_adaptation_data(this : ISpeechRecoContext*, adaptation_string : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_adaptation_data.call(this, adaptation_string)
    end

  end

  @[Extern]
  record ISpeechRecoGrammarVtbl,
    query_interface : Proc(ISpeechRecoGrammar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoGrammar*, UInt32),
    release : Proc(ISpeechRecoGrammar*, UInt32),
    get_type_info_count : Proc(ISpeechRecoGrammar*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoGrammar*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoGrammar*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoGrammar*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechRecoGrammar*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_RecoContext : Proc(ISpeechRecoGrammar*, Void**, Win32cr::Foundation::HRESULT),
    put_State : Proc(ISpeechRecoGrammar*, Win32cr::Media::Speech::SpeechGrammarState, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISpeechRecoGrammar*, Win32cr::Media::Speech::SpeechGrammarState*, Win32cr::Foundation::HRESULT),
    get_Rules : Proc(ISpeechRecoGrammar*, Void**, Win32cr::Foundation::HRESULT),
    reset : Proc(ISpeechRecoGrammar*, Int32, Win32cr::Foundation::HRESULT),
    cmd_load_from_file : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    cmd_load_from_object : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    cmd_load_from_resource : Proc(ISpeechRecoGrammar*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Int32, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    cmd_load_from_memory : Proc(ISpeechRecoGrammar*, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    cmd_load_from_proprietary_grammar : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    cmd_set_rule_state : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechRuleState, Win32cr::Foundation::HRESULT),
    cmd_set_rule_id_state : Proc(ISpeechRecoGrammar*, Int32, Win32cr::Media::Speech::SpeechRuleState, Win32cr::Foundation::HRESULT),
    dictation_load : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechLoadOption, Win32cr::Foundation::HRESULT),
    dictation_unload : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::HRESULT),
    dictation_set_state : Proc(ISpeechRecoGrammar*, Win32cr::Media::Speech::SpeechRuleState, Win32cr::Foundation::HRESULT),
    set_word_sequence_data : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Int32, Void*, Win32cr::Foundation::HRESULT),
    set_text_selection : Proc(ISpeechRecoGrammar*, Void*, Win32cr::Foundation::HRESULT),
    is_pronounceable : Proc(ISpeechRecoGrammar*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechWordPronounceable*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoGrammar, lpVtbl : ISpeechRecoGrammarVtbl* do
    GUID = LibC::GUID.new(0xb6d6f79f_u32, 0x2158_u16, 0x4e50_u16, StaticArray[0xb5_u8, 0xbc_u8, 0x9a_u8, 0x9c_u8, 0xcd_u8, 0x85_u8, 0x2a_u8, 0x9_u8])
    def query_interface(this : ISpeechRecoGrammar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoGrammar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoGrammar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoGrammar*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoGrammar*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoGrammar*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoGrammar*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : ISpeechRecoGrammar*, id : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_RecoContext(this : ISpeechRecoGrammar*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoContext.call(this, reco_context)
    end
    def put_State(this : ISpeechRecoGrammar*, state : Win32cr::Media::Speech::SpeechGrammarState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, state)
    end
    def get_State(this : ISpeechRecoGrammar*, state : Win32cr::Media::Speech::SpeechGrammarState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def get_Rules(this : ISpeechRecoGrammar*, rules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rules.call(this, rules)
    end
    def reset(this : ISpeechRecoGrammar*, new_language : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, new_language)
    end
    def cmd_load_from_file(this : ISpeechRecoGrammar*, file_name : Win32cr::Foundation::BSTR, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_load_from_file.call(this, file_name, load_option)
    end
    def cmd_load_from_object(this : ISpeechRecoGrammar*, class_id : Win32cr::Foundation::BSTR, grammar_name : Win32cr::Foundation::BSTR, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_load_from_object.call(this, class_id, grammar_name, load_option)
    end
    def cmd_load_from_resource(this : ISpeechRecoGrammar*, hModule : Int32, resource_name : Win32cr::System::Com::VARIANT, resource_type : Win32cr::System::Com::VARIANT, language_id : Int32, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_load_from_resource.call(this, hModule, resource_name, resource_type, language_id, load_option)
    end
    def cmd_load_from_memory(this : ISpeechRecoGrammar*, grammar_data : Win32cr::System::Com::VARIANT, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_load_from_memory.call(this, grammar_data, load_option)
    end
    def cmd_load_from_proprietary_grammar(this : ISpeechRecoGrammar*, proprietary_guid : Win32cr::Foundation::BSTR, proprietary_string : Win32cr::Foundation::BSTR, proprietary_data : Win32cr::System::Com::VARIANT, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_load_from_proprietary_grammar.call(this, proprietary_guid, proprietary_string, proprietary_data, load_option)
    end
    def cmd_set_rule_state(this : ISpeechRecoGrammar*, name : Win32cr::Foundation::BSTR, state : Win32cr::Media::Speech::SpeechRuleState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_set_rule_state.call(this, name, state)
    end
    def cmd_set_rule_id_state(this : ISpeechRecoGrammar*, rule_id : Int32, state : Win32cr::Media::Speech::SpeechRuleState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cmd_set_rule_id_state.call(this, rule_id, state)
    end
    def dictation_load(this : ISpeechRecoGrammar*, topic_name : Win32cr::Foundation::BSTR, load_option : Win32cr::Media::Speech::SpeechLoadOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dictation_load.call(this, topic_name, load_option)
    end
    def dictation_unload(this : ISpeechRecoGrammar*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dictation_unload.call(this)
    end
    def dictation_set_state(this : ISpeechRecoGrammar*, state : Win32cr::Media::Speech::SpeechRuleState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dictation_set_state.call(this, state)
    end
    def set_word_sequence_data(this : ISpeechRecoGrammar*, text : Win32cr::Foundation::BSTR, text_length : Int32, info : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_word_sequence_data.call(this, text, text_length, info)
    end
    def set_text_selection(this : ISpeechRecoGrammar*, info : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_selection.call(this, info)
    end
    def is_pronounceable(this : ISpeechRecoGrammar*, word : Win32cr::Foundation::BSTR, word_pronounceable : Win32cr::Media::Speech::SpeechWordPronounceable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_pronounceable.call(this, word, word_pronounceable)
    end

  end

  @[Extern]
  record ISpeechRecoContextEvents_Vtbl,
    query_interface : Proc(ISpeechRecoContextEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoContextEvents_*, UInt32),
    release : Proc(ISpeechRecoContextEvents_*, UInt32),
    get_type_info_count : Proc(ISpeechRecoContextEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoContextEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoContextEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoContextEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoContextEvents_, lpVtbl : ISpeechRecoContextEvents_Vtbl* do
    GUID = LibC::GUID.new(0x7b8fcb42_u32, 0xe9d_u16, 0x4f00_u16, StaticArray[0xa0_u8, 0x48_u8, 0x7b_u8, 0x4_u8, 0xd6_u8, 0x17_u8, 0x9d_u8, 0x3d_u8])
    def query_interface(this : ISpeechRecoContextEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoContextEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoContextEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoContextEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoContextEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoContextEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoContextEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ISpeechGrammarRuleVtbl,
    query_interface : Proc(ISpeechGrammarRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechGrammarRule*, UInt32),
    release : Proc(ISpeechGrammarRule*, UInt32),
    get_type_info_count : Proc(ISpeechGrammarRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechGrammarRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechGrammarRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechGrammarRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Attributes : Proc(ISpeechGrammarRule*, Win32cr::Media::Speech::SpeechRuleAttributes*, Win32cr::Foundation::HRESULT),
    get_InitialState : Proc(ISpeechGrammarRule*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISpeechGrammarRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechGrammarRule*, Int32*, Win32cr::Foundation::HRESULT),
    clear : Proc(ISpeechGrammarRule*, Win32cr::Foundation::HRESULT),
    add_resource : Proc(ISpeechGrammarRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_state : Proc(ISpeechGrammarRule*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechGrammarRule, lpVtbl : ISpeechGrammarRuleVtbl* do
    GUID = LibC::GUID.new(0xafe719cf_u32, 0x5dd1_u16, 0x44f2_u16, StaticArray[0x99_u8, 0x9c_u8, 0x7a_u8, 0x39_u8, 0x9f_u8, 0x1c_u8, 0xfc_u8, 0xcc_u8])
    def query_interface(this : ISpeechGrammarRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechGrammarRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechGrammarRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechGrammarRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechGrammarRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechGrammarRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechGrammarRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Attributes(this : ISpeechGrammarRule*, attributes : Win32cr::Media::Speech::SpeechRuleAttributes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attributes.call(this, attributes)
    end
    def get_InitialState(this : ISpeechGrammarRule*, state : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialState.call(this, state)
    end
    def get_Name(this : ISpeechGrammarRule*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Id(this : ISpeechGrammarRule*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def clear(this : ISpeechGrammarRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_resource(this : ISpeechGrammarRule*, resource_name : Win32cr::Foundation::BSTR, resource_value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, resource_name, resource_value)
    end
    def add_state(this : ISpeechGrammarRule*, state : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_state.call(this, state)
    end

  end

  @[Extern]
  record ISpeechGrammarRulesVtbl,
    query_interface : Proc(ISpeechGrammarRules*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechGrammarRules*, UInt32),
    release : Proc(ISpeechGrammarRules*, UInt32),
    get_type_info_count : Proc(ISpeechGrammarRules*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechGrammarRules*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechGrammarRules*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechGrammarRules*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechGrammarRules*, Int32*, Win32cr::Foundation::HRESULT),
    find_rule : Proc(ISpeechGrammarRules*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechGrammarRules*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechGrammarRules*, Void**, Win32cr::Foundation::HRESULT),
    get_Dynamic : Proc(ISpeechGrammarRules*, Int16*, Win32cr::Foundation::HRESULT),
    add : Proc(ISpeechGrammarRules*, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechRuleAttributes, Int32, Void**, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpeechGrammarRules*, Win32cr::Foundation::HRESULT),
    commit_and_save : Proc(ISpeechGrammarRules*, Win32cr::Foundation::BSTR*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechGrammarRules, lpVtbl : ISpeechGrammarRulesVtbl* do
    GUID = LibC::GUID.new(0x6ffa3b44_u32, 0xfc2d_u16, 0x40d1_u16, StaticArray[0x8a_u8, 0xfc_u8, 0x32_u8, 0x91_u8, 0x1c_u8, 0x7f_u8, 0x1a_u8, 0xd1_u8])
    def query_interface(this : ISpeechGrammarRules*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechGrammarRules*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechGrammarRules*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechGrammarRules*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechGrammarRules*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechGrammarRules*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechGrammarRules*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechGrammarRules*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def find_rule(this : ISpeechGrammarRules*, rule_name_or_id : Win32cr::System::Com::VARIANT, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_rule.call(this, rule_name_or_id, rule)
    end
    def item(this : ISpeechGrammarRules*, index : Int32, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, rule)
    end
    def get__NewEnum(this : ISpeechGrammarRules*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end
    def get_Dynamic(this : ISpeechGrammarRules*, dynamic : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dynamic.call(this, dynamic)
    end
    def add(this : ISpeechGrammarRules*, rule_name : Win32cr::Foundation::BSTR, attributes : Win32cr::Media::Speech::SpeechRuleAttributes, rule_id : Int32, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, rule_name, attributes, rule_id, rule)
    end
    def commit(this : ISpeechGrammarRules*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def commit_and_save(this : ISpeechGrammarRules*, error_text : Win32cr::Foundation::BSTR*, save_stream : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_save.call(this, error_text, save_stream)
    end

  end

  @[Extern]
  record ISpeechGrammarRuleStateVtbl,
    query_interface : Proc(ISpeechGrammarRuleState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechGrammarRuleState*, UInt32),
    release : Proc(ISpeechGrammarRuleState*, UInt32),
    get_type_info_count : Proc(ISpeechGrammarRuleState*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechGrammarRuleState*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechGrammarRuleState*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechGrammarRuleState*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Rule : Proc(ISpeechGrammarRuleState*, Void**, Win32cr::Foundation::HRESULT),
    get_Transitions : Proc(ISpeechGrammarRuleState*, Void**, Win32cr::Foundation::HRESULT),
    add_word_transition : Proc(ISpeechGrammarRuleState*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Media::Speech::SpeechGrammarWordType, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT*, Float32, Win32cr::Foundation::HRESULT),
    add_rule_transition : Proc(ISpeechGrammarRuleState*, Void*, Void*, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT*, Float32, Win32cr::Foundation::HRESULT),
    add_special_transition : Proc(ISpeechGrammarRuleState*, Void*, Win32cr::Media::Speech::SpeechSpecialTransitionType, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechGrammarRuleState, lpVtbl : ISpeechGrammarRuleStateVtbl* do
    GUID = LibC::GUID.new(0xd4286f2c_u32, 0xee67_u16, 0x45ae_u16, StaticArray[0xb9_u8, 0x28_u8, 0x28_u8, 0xd6_u8, 0x95_u8, 0x36_u8, 0x2e_u8, 0xda_u8])
    def query_interface(this : ISpeechGrammarRuleState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechGrammarRuleState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechGrammarRuleState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechGrammarRuleState*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechGrammarRuleState*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechGrammarRuleState*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechGrammarRuleState*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Rule(this : ISpeechGrammarRuleState*, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rule.call(this, rule)
    end
    def get_Transitions(this : ISpeechGrammarRuleState*, transitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Transitions.call(this, transitions)
    end
    def add_word_transition(this : ISpeechGrammarRuleState*, dest_state : Void*, words : Win32cr::Foundation::BSTR, separators : Win32cr::Foundation::BSTR, type__ : Win32cr::Media::Speech::SpeechGrammarWordType, property_name : Win32cr::Foundation::BSTR, property_id : Int32, property_value : Win32cr::System::Com::VARIANT*, weight : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_word_transition.call(this, dest_state, words, separators, type__, property_name, property_id, property_value, weight)
    end
    def add_rule_transition(this : ISpeechGrammarRuleState*, destination_state : Void*, rule : Void*, property_name : Win32cr::Foundation::BSTR, property_id : Int32, property_value : Win32cr::System::Com::VARIANT*, weight : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_rule_transition.call(this, destination_state, rule, property_name, property_id, property_value, weight)
    end
    def add_special_transition(this : ISpeechGrammarRuleState*, destination_state : Void*, type__ : Win32cr::Media::Speech::SpeechSpecialTransitionType, property_name : Win32cr::Foundation::BSTR, property_id : Int32, property_value : Win32cr::System::Com::VARIANT*, weight : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_special_transition.call(this, destination_state, type__, property_name, property_id, property_value, weight)
    end

  end

  @[Extern]
  record ISpeechGrammarRuleStateTransitionVtbl,
    query_interface : Proc(ISpeechGrammarRuleStateTransition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechGrammarRuleStateTransition*, UInt32),
    release : Proc(ISpeechGrammarRuleStateTransition*, UInt32),
    get_type_info_count : Proc(ISpeechGrammarRuleStateTransition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechGrammarRuleStateTransition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechGrammarRuleStateTransition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechGrammarRuleStateTransition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISpeechGrammarRuleStateTransition*, Win32cr::Media::Speech::SpeechGrammarRuleStateTransitionType*, Win32cr::Foundation::HRESULT),
    get_Text : Proc(ISpeechGrammarRuleStateTransition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Rule : Proc(ISpeechGrammarRuleStateTransition*, Void**, Win32cr::Foundation::HRESULT),
    get_Weight : Proc(ISpeechGrammarRuleStateTransition*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PropertyName : Proc(ISpeechGrammarRuleStateTransition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PropertyId : Proc(ISpeechGrammarRuleStateTransition*, Int32*, Win32cr::Foundation::HRESULT),
    get_PropertyValue : Proc(ISpeechGrammarRuleStateTransition*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NextState : Proc(ISpeechGrammarRuleStateTransition*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechGrammarRuleStateTransition, lpVtbl : ISpeechGrammarRuleStateTransitionVtbl* do
    GUID = LibC::GUID.new(0xcafd1db1_u32, 0x41d1_u16, 0x4a06_u16, StaticArray[0x98_u8, 0x63_u8, 0xe2_u8, 0xe8_u8, 0x1d_u8, 0xa1_u8, 0x7a_u8, 0x9a_u8])
    def query_interface(this : ISpeechGrammarRuleStateTransition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechGrammarRuleStateTransition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechGrammarRuleStateTransition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechGrammarRuleStateTransition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechGrammarRuleStateTransition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechGrammarRuleStateTransition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechGrammarRuleStateTransition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ISpeechGrammarRuleStateTransition*, type__ : Win32cr::Media::Speech::SpeechGrammarRuleStateTransitionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def get_Text(this : ISpeechGrammarRuleStateTransition*, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Text.call(this, text)
    end
    def get_Rule(this : ISpeechGrammarRuleStateTransition*, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rule.call(this, rule)
    end
    def get_Weight(this : ISpeechGrammarRuleStateTransition*, weight : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Weight.call(this, weight)
    end
    def get_PropertyName(this : ISpeechGrammarRuleStateTransition*, property_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyName.call(this, property_name)
    end
    def get_PropertyId(this : ISpeechGrammarRuleStateTransition*, property_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyId.call(this, property_id)
    end
    def get_PropertyValue(this : ISpeechGrammarRuleStateTransition*, property_value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyValue.call(this, property_value)
    end
    def get_NextState(this : ISpeechGrammarRuleStateTransition*, next_state : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NextState.call(this, next_state)
    end

  end

  @[Extern]
  record ISpeechGrammarRuleStateTransitionsVtbl,
    query_interface : Proc(ISpeechGrammarRuleStateTransitions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechGrammarRuleStateTransitions*, UInt32),
    release : Proc(ISpeechGrammarRuleStateTransitions*, UInt32),
    get_type_info_count : Proc(ISpeechGrammarRuleStateTransitions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechGrammarRuleStateTransitions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechGrammarRuleStateTransitions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechGrammarRuleStateTransitions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechGrammarRuleStateTransitions*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechGrammarRuleStateTransitions*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechGrammarRuleStateTransitions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechGrammarRuleStateTransitions, lpVtbl : ISpeechGrammarRuleStateTransitionsVtbl* do
    GUID = LibC::GUID.new(0xeabce657_u32, 0x75bc_u16, 0x44a2_u16, StaticArray[0xaa_u8, 0x7f_u8, 0xc5_u8, 0x64_u8, 0x76_u8, 0x74_u8, 0x29_u8, 0x63_u8])
    def query_interface(this : ISpeechGrammarRuleStateTransitions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechGrammarRuleStateTransitions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechGrammarRuleStateTransitions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechGrammarRuleStateTransitions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechGrammarRuleStateTransitions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechGrammarRuleStateTransitions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechGrammarRuleStateTransitions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechGrammarRuleStateTransitions*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechGrammarRuleStateTransitions*, index : Int32, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, transition)
    end
    def get__NewEnum(this : ISpeechGrammarRuleStateTransitions*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechTextSelectionInformationVtbl,
    query_interface : Proc(ISpeechTextSelectionInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechTextSelectionInformation*, UInt32),
    release : Proc(ISpeechTextSelectionInformation*, UInt32),
    get_type_info_count : Proc(ISpeechTextSelectionInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechTextSelectionInformation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechTextSelectionInformation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechTextSelectionInformation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ActiveOffset : Proc(ISpeechTextSelectionInformation*, Int32, Win32cr::Foundation::HRESULT),
    get_ActiveOffset : Proc(ISpeechTextSelectionInformation*, Int32*, Win32cr::Foundation::HRESULT),
    put_ActiveLength : Proc(ISpeechTextSelectionInformation*, Int32, Win32cr::Foundation::HRESULT),
    get_ActiveLength : Proc(ISpeechTextSelectionInformation*, Int32*, Win32cr::Foundation::HRESULT),
    put_SelectionOffset : Proc(ISpeechTextSelectionInformation*, Int32, Win32cr::Foundation::HRESULT),
    get_SelectionOffset : Proc(ISpeechTextSelectionInformation*, Int32*, Win32cr::Foundation::HRESULT),
    put_SelectionLength : Proc(ISpeechTextSelectionInformation*, Int32, Win32cr::Foundation::HRESULT),
    get_SelectionLength : Proc(ISpeechTextSelectionInformation*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechTextSelectionInformation, lpVtbl : ISpeechTextSelectionInformationVtbl* do
    GUID = LibC::GUID.new(0x3b9c7e7a_u32, 0x6eee_u16, 0x4ded_u16, StaticArray[0x90_u8, 0x92_u8, 0x11_u8, 0x65_u8, 0x72_u8, 0x79_u8, 0xad_u8, 0xbe_u8])
    def query_interface(this : ISpeechTextSelectionInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechTextSelectionInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechTextSelectionInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechTextSelectionInformation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechTextSelectionInformation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechTextSelectionInformation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechTextSelectionInformation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_ActiveOffset(this : ISpeechTextSelectionInformation*, active_offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ActiveOffset.call(this, active_offset)
    end
    def get_ActiveOffset(this : ISpeechTextSelectionInformation*, active_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveOffset.call(this, active_offset)
    end
    def put_ActiveLength(this : ISpeechTextSelectionInformation*, active_length : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ActiveLength.call(this, active_length)
    end
    def get_ActiveLength(this : ISpeechTextSelectionInformation*, active_length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveLength.call(this, active_length)
    end
    def put_SelectionOffset(this : ISpeechTextSelectionInformation*, selection_offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelectionOffset.call(this, selection_offset)
    end
    def get_SelectionOffset(this : ISpeechTextSelectionInformation*, selection_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelectionOffset.call(this, selection_offset)
    end
    def put_SelectionLength(this : ISpeechTextSelectionInformation*, selection_length : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelectionLength.call(this, selection_length)
    end
    def get_SelectionLength(this : ISpeechTextSelectionInformation*, selection_length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelectionLength.call(this, selection_length)
    end

  end

  @[Extern]
  record ISpeechRecoResultVtbl,
    query_interface : Proc(ISpeechRecoResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoResult*, UInt32),
    release : Proc(ISpeechRecoResult*, UInt32),
    get_type_info_count : Proc(ISpeechRecoResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RecoContext : Proc(ISpeechRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Times : Proc(ISpeechRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioFormat : Proc(ISpeechRecoResult*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioFormat : Proc(ISpeechRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    get_PhraseInfo : Proc(ISpeechRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    alternates : Proc(ISpeechRecoResult*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    audio : Proc(ISpeechRecoResult*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpeechRecoResult*, Int32, Int32, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(ISpeechRecoResult*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    discard_result_info : Proc(ISpeechRecoResult*, Win32cr::Media::Speech::SpeechDiscardType, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoResult, lpVtbl : ISpeechRecoResultVtbl* do
    GUID = LibC::GUID.new(0xed2879cf_u32, 0xced9_u16, 0x4ee6_u16, StaticArray[0xa5_u8, 0x34_u8, 0xde_u8, 0x1_u8, 0x91_u8, 0xd5_u8, 0x46_u8, 0x8d_u8])
    def query_interface(this : ISpeechRecoResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RecoContext(this : ISpeechRecoResult*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoContext.call(this, reco_context)
    end
    def get_Times(this : ISpeechRecoResult*, times : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Times.call(this, times)
    end
    def putref_AudioFormat(this : ISpeechRecoResult*, format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioFormat.call(this, format)
    end
    def get_AudioFormat(this : ISpeechRecoResult*, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioFormat.call(this, format)
    end
    def get_PhraseInfo(this : ISpeechRecoResult*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhraseInfo.call(this, phrase_info)
    end
    def alternates(this : ISpeechRecoResult*, request_count : Int32, start_element : Int32, elements : Int32, alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates.call(this, request_count, start_element, elements, alternates)
    end
    def audio(this : ISpeechRecoResult*, start_element : Int32, elements : Int32, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.audio.call(this, start_element, elements, stream)
    end
    def speak_audio(this : ISpeechRecoResult*, start_element : Int32, elements : Int32, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, start_element, elements, flags, stream_number)
    end
    def save_to_memory(this : ISpeechRecoResult*, result_block : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, result_block)
    end
    def discard_result_info(this : ISpeechRecoResult*, value_types : Win32cr::Media::Speech::SpeechDiscardType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard_result_info.call(this, value_types)
    end

  end

  @[Extern]
  record ISpeechRecoResult2Vtbl,
    query_interface : Proc(ISpeechRecoResult2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoResult2*, UInt32),
    release : Proc(ISpeechRecoResult2*, UInt32),
    get_type_info_count : Proc(ISpeechRecoResult2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoResult2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoResult2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoResult2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RecoContext : Proc(ISpeechRecoResult2*, Void**, Win32cr::Foundation::HRESULT),
    get_Times : Proc(ISpeechRecoResult2*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioFormat : Proc(ISpeechRecoResult2*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioFormat : Proc(ISpeechRecoResult2*, Void**, Win32cr::Foundation::HRESULT),
    get_PhraseInfo : Proc(ISpeechRecoResult2*, Void**, Win32cr::Foundation::HRESULT),
    alternates : Proc(ISpeechRecoResult2*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    audio : Proc(ISpeechRecoResult2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpeechRecoResult2*, Int32, Int32, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(ISpeechRecoResult2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    discard_result_info : Proc(ISpeechRecoResult2*, Win32cr::Media::Speech::SpeechDiscardType, Win32cr::Foundation::HRESULT),
    set_text_feedback : Proc(ISpeechRecoResult2*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoResult2, lpVtbl : ISpeechRecoResult2Vtbl* do
    GUID = LibC::GUID.new(0x8e0a246d_u32, 0xd3c8_u16, 0x45de_u16, StaticArray[0x86_u8, 0x57_u8, 0x4_u8, 0x29_u8, 0xc_u8, 0x45_u8, 0x8c_u8, 0x3c_u8])
    def query_interface(this : ISpeechRecoResult2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoResult2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoResult2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoResult2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoResult2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoResult2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoResult2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RecoContext(this : ISpeechRecoResult2*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoContext.call(this, reco_context)
    end
    def get_Times(this : ISpeechRecoResult2*, times : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Times.call(this, times)
    end
    def putref_AudioFormat(this : ISpeechRecoResult2*, format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioFormat.call(this, format)
    end
    def get_AudioFormat(this : ISpeechRecoResult2*, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioFormat.call(this, format)
    end
    def get_PhraseInfo(this : ISpeechRecoResult2*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhraseInfo.call(this, phrase_info)
    end
    def alternates(this : ISpeechRecoResult2*, request_count : Int32, start_element : Int32, elements : Int32, alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates.call(this, request_count, start_element, elements, alternates)
    end
    def audio(this : ISpeechRecoResult2*, start_element : Int32, elements : Int32, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.audio.call(this, start_element, elements, stream)
    end
    def speak_audio(this : ISpeechRecoResult2*, start_element : Int32, elements : Int32, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, start_element, elements, flags, stream_number)
    end
    def save_to_memory(this : ISpeechRecoResult2*, result_block : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, result_block)
    end
    def discard_result_info(this : ISpeechRecoResult2*, value_types : Win32cr::Media::Speech::SpeechDiscardType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard_result_info.call(this, value_types)
    end
    def set_text_feedback(this : ISpeechRecoResult2*, feedback : Win32cr::Foundation::BSTR, was_successful : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_feedback.call(this, feedback, was_successful)
    end

  end

  @[Extern]
  record ISpeechRecoResultTimesVtbl,
    query_interface : Proc(ISpeechRecoResultTimes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoResultTimes*, UInt32),
    release : Proc(ISpeechRecoResultTimes*, UInt32),
    get_type_info_count : Proc(ISpeechRecoResultTimes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoResultTimes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoResultTimes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoResultTimes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StreamTime : Proc(ISpeechRecoResultTimes*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Length : Proc(ISpeechRecoResultTimes*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_TickCount : Proc(ISpeechRecoResultTimes*, Int32*, Win32cr::Foundation::HRESULT),
    get_OffsetFromStart : Proc(ISpeechRecoResultTimes*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoResultTimes, lpVtbl : ISpeechRecoResultTimesVtbl* do
    GUID = LibC::GUID.new(0x62b3b8fb_u32, 0xf6e7_u16, 0x41be_u16, StaticArray[0xbd_u8, 0xcb_u8, 0x5_u8, 0x6b_u8, 0x1c_u8, 0x29_u8, 0xef_u8, 0xc0_u8])
    def query_interface(this : ISpeechRecoResultTimes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoResultTimes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoResultTimes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoResultTimes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoResultTimes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoResultTimes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoResultTimes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StreamTime(this : ISpeechRecoResultTimes*, time : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StreamTime.call(this, time)
    end
    def get_Length(this : ISpeechRecoResultTimes*, length : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Length.call(this, length)
    end
    def get_TickCount(this : ISpeechRecoResultTimes*, tick_count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TickCount.call(this, tick_count)
    end
    def get_OffsetFromStart(this : ISpeechRecoResultTimes*, offset_from_start : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OffsetFromStart.call(this, offset_from_start)
    end

  end

  @[Extern]
  record ISpeechPhraseAlternateVtbl,
    query_interface : Proc(ISpeechPhraseAlternate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseAlternate*, UInt32),
    release : Proc(ISpeechPhraseAlternate*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseAlternate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseAlternate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseAlternate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseAlternate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RecoResult : Proc(ISpeechPhraseAlternate*, Void**, Win32cr::Foundation::HRESULT),
    get_StartElementInResult : Proc(ISpeechPhraseAlternate*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfElementsInResult : Proc(ISpeechPhraseAlternate*, Int32*, Win32cr::Foundation::HRESULT),
    get_PhraseInfo : Proc(ISpeechPhraseAlternate*, Void**, Win32cr::Foundation::HRESULT),
    commit : Proc(ISpeechPhraseAlternate*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseAlternate, lpVtbl : ISpeechPhraseAlternateVtbl* do
    GUID = LibC::GUID.new(0x27864a2a_u32, 0x2b9f_u16, 0x4cb8_u16, StaticArray[0x92_u8, 0xd3_u8, 0xd_u8, 0x27_u8, 0x22_u8, 0xfd_u8, 0x1e_u8, 0x73_u8])
    def query_interface(this : ISpeechPhraseAlternate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseAlternate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseAlternate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseAlternate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseAlternate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseAlternate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseAlternate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RecoResult(this : ISpeechPhraseAlternate*, reco_result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoResult.call(this, reco_result)
    end
    def get_StartElementInResult(this : ISpeechPhraseAlternate*, start_element : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartElementInResult.call(this, start_element)
    end
    def get_NumberOfElementsInResult(this : ISpeechPhraseAlternate*, number_of_elements : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfElementsInResult.call(this, number_of_elements)
    end
    def get_PhraseInfo(this : ISpeechPhraseAlternate*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhraseInfo.call(this, phrase_info)
    end
    def commit(this : ISpeechPhraseAlternate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end

  end

  @[Extern]
  record ISpeechPhraseAlternatesVtbl,
    query_interface : Proc(ISpeechPhraseAlternates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseAlternates*, UInt32),
    release : Proc(ISpeechPhraseAlternates*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseAlternates*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseAlternates*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseAlternates*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseAlternates*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechPhraseAlternates*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechPhraseAlternates*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechPhraseAlternates*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseAlternates, lpVtbl : ISpeechPhraseAlternatesVtbl* do
    GUID = LibC::GUID.new(0xb238b6d5_u32, 0xf276_u16, 0x4c3d_u16, StaticArray[0xa6_u8, 0xc1_u8, 0x29_u8, 0x74_u8, 0x80_u8, 0x1c_u8, 0x3c_u8, 0xc2_u8])
    def query_interface(this : ISpeechPhraseAlternates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseAlternates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseAlternates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseAlternates*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseAlternates*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseAlternates*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseAlternates*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechPhraseAlternates*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechPhraseAlternates*, index : Int32, phrase_alternate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, phrase_alternate)
    end
    def get__NewEnum(this : ISpeechPhraseAlternates*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechPhraseInfoVtbl,
    query_interface : Proc(ISpeechPhraseInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseInfo*, UInt32),
    release : Proc(ISpeechPhraseInfo*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LanguageId : Proc(ISpeechPhraseInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_GrammarId : Proc(ISpeechPhraseInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_StartTime : Proc(ISpeechPhraseInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AudioStreamPosition : Proc(ISpeechPhraseInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AudioSizeBytes : Proc(ISpeechPhraseInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_RetainedSizeBytes : Proc(ISpeechPhraseInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_AudioSizeTime : Proc(ISpeechPhraseInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_Rule : Proc(ISpeechPhraseInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(ISpeechPhraseInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_Elements : Proc(ISpeechPhraseInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_Replacements : Proc(ISpeechPhraseInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_EngineId : Proc(ISpeechPhraseInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EnginePrivateData : Proc(ISpeechPhraseInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(ISpeechPhraseInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ISpeechPhraseInfo*, Int32, Int32, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_attributes : Proc(ISpeechPhraseInfo*, Int32, Int32, Int16, Win32cr::Media::Speech::SpeechDisplayAttributes*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseInfo, lpVtbl : ISpeechPhraseInfoVtbl* do
    GUID = LibC::GUID.new(0x961559cf_u32, 0x4e67_u16, 0x4662_u16, StaticArray[0x8b_u8, 0xf0_u8, 0xd9_u8, 0x3f_u8, 0x1f_u8, 0xcd_u8, 0x61_u8, 0xb3_u8])
    def query_interface(this : ISpeechPhraseInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LanguageId(this : ISpeechPhraseInfo*, language_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LanguageId.call(this, language_id)
    end
    def get_GrammarId(this : ISpeechPhraseInfo*, grammar_id : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GrammarId.call(this, grammar_id)
    end
    def get_StartTime(this : ISpeechPhraseInfo*, start_time : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartTime.call(this, start_time)
    end
    def get_AudioStreamPosition(this : ISpeechPhraseInfo*, audio_stream_position : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioStreamPosition.call(this, audio_stream_position)
    end
    def get_AudioSizeBytes(this : ISpeechPhraseInfo*, pAudioSizeBytes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioSizeBytes.call(this, pAudioSizeBytes)
    end
    def get_RetainedSizeBytes(this : ISpeechPhraseInfo*, retained_size_bytes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetainedSizeBytes.call(this, retained_size_bytes)
    end
    def get_AudioSizeTime(this : ISpeechPhraseInfo*, audio_size_time : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioSizeTime.call(this, audio_size_time)
    end
    def get_Rule(this : ISpeechPhraseInfo*, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rule.call(this, rule)
    end
    def get_Properties(this : ISpeechPhraseInfo*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, properties)
    end
    def get_Elements(this : ISpeechPhraseInfo*, elements : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Elements.call(this, elements)
    end
    def get_Replacements(this : ISpeechPhraseInfo*, replacements : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Replacements.call(this, replacements)
    end
    def get_EngineId(this : ISpeechPhraseInfo*, engine_id_guid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EngineId.call(this, engine_id_guid)
    end
    def get_EnginePrivateData(this : ISpeechPhraseInfo*, private_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnginePrivateData.call(this, private_data)
    end
    def save_to_memory(this : ISpeechPhraseInfo*, phrase_block : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, phrase_block)
    end
    def get_text(this : ISpeechPhraseInfo*, start_element : Int32, elements : Int32, use_replacements : Int16, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, start_element, elements, use_replacements, text)
    end
    def get_display_attributes(this : ISpeechPhraseInfo*, start_element : Int32, elements : Int32, use_replacements : Int16, display_attributes : Win32cr::Media::Speech::SpeechDisplayAttributes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_attributes.call(this, start_element, elements, use_replacements, display_attributes)
    end

  end

  @[Extern]
  record ISpeechPhraseElementVtbl,
    query_interface : Proc(ISpeechPhraseElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseElement*, UInt32),
    release : Proc(ISpeechPhraseElement*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseElement*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseElement*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseElement*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AudioTimeOffset : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_AudioSizeTime : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_AudioStreamOffset : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_AudioSizeBytes : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_RetainedStreamOffset : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_RetainedSizeBytes : Proc(ISpeechPhraseElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_DisplayText : Proc(ISpeechPhraseElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LexicalForm : Proc(ISpeechPhraseElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pronunciation : Proc(ISpeechPhraseElement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DisplayAttributes : Proc(ISpeechPhraseElement*, Win32cr::Media::Speech::SpeechDisplayAttributes*, Win32cr::Foundation::HRESULT),
    get_RequiredConfidence : Proc(ISpeechPhraseElement*, Win32cr::Media::Speech::SpeechEngineConfidence*, Win32cr::Foundation::HRESULT),
    get_ActualConfidence : Proc(ISpeechPhraseElement*, Win32cr::Media::Speech::SpeechEngineConfidence*, Win32cr::Foundation::HRESULT),
    get_EngineConfidence : Proc(ISpeechPhraseElement*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseElement, lpVtbl : ISpeechPhraseElementVtbl* do
    GUID = LibC::GUID.new(0xe6176f96_u32, 0xe373_u16, 0x4801_u16, StaticArray[0xb2_u8, 0x23_u8, 0x3b_u8, 0x62_u8, 0xc0_u8, 0x68_u8, 0xc0_u8, 0xb4_u8])
    def query_interface(this : ISpeechPhraseElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseElement*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseElement*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseElement*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseElement*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AudioTimeOffset(this : ISpeechPhraseElement*, audio_time_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioTimeOffset.call(this, audio_time_offset)
    end
    def get_AudioSizeTime(this : ISpeechPhraseElement*, audio_size_time : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioSizeTime.call(this, audio_size_time)
    end
    def get_AudioStreamOffset(this : ISpeechPhraseElement*, audio_stream_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioStreamOffset.call(this, audio_stream_offset)
    end
    def get_AudioSizeBytes(this : ISpeechPhraseElement*, audio_size_bytes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioSizeBytes.call(this, audio_size_bytes)
    end
    def get_RetainedStreamOffset(this : ISpeechPhraseElement*, retained_stream_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetainedStreamOffset.call(this, retained_stream_offset)
    end
    def get_RetainedSizeBytes(this : ISpeechPhraseElement*, retained_size_bytes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetainedSizeBytes.call(this, retained_size_bytes)
    end
    def get_DisplayText(this : ISpeechPhraseElement*, display_text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayText.call(this, display_text)
    end
    def get_LexicalForm(this : ISpeechPhraseElement*, lexical_form : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LexicalForm.call(this, lexical_form)
    end
    def get_Pronunciation(this : ISpeechPhraseElement*, pronunciation : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pronunciation.call(this, pronunciation)
    end
    def get_DisplayAttributes(this : ISpeechPhraseElement*, display_attributes : Win32cr::Media::Speech::SpeechDisplayAttributes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayAttributes.call(this, display_attributes)
    end
    def get_RequiredConfidence(this : ISpeechPhraseElement*, required_confidence : Win32cr::Media::Speech::SpeechEngineConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RequiredConfidence.call(this, required_confidence)
    end
    def get_ActualConfidence(this : ISpeechPhraseElement*, actual_confidence : Win32cr::Media::Speech::SpeechEngineConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActualConfidence.call(this, actual_confidence)
    end
    def get_EngineConfidence(this : ISpeechPhraseElement*, engine_confidence : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EngineConfidence.call(this, engine_confidence)
    end

  end

  @[Extern]
  record ISpeechPhraseElementsVtbl,
    query_interface : Proc(ISpeechPhraseElements*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseElements*, UInt32),
    release : Proc(ISpeechPhraseElements*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseElements*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseElements*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseElements*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseElements*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechPhraseElements*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechPhraseElements*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechPhraseElements*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseElements, lpVtbl : ISpeechPhraseElementsVtbl* do
    GUID = LibC::GUID.new(0x626b328_u32, 0x3478_u16, 0x467d_u16, StaticArray[0xa0_u8, 0xb3_u8, 0xd0_u8, 0x85_u8, 0x3b_u8, 0x93_u8, 0xdd_u8, 0xa3_u8])
    def query_interface(this : ISpeechPhraseElements*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseElements*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseElements*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseElements*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseElements*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseElements*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseElements*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechPhraseElements*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechPhraseElements*, index : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, element)
    end
    def get__NewEnum(this : ISpeechPhraseElements*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechPhraseReplacementVtbl,
    query_interface : Proc(ISpeechPhraseReplacement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseReplacement*, UInt32),
    release : Proc(ISpeechPhraseReplacement*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseReplacement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseReplacement*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseReplacement*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseReplacement*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayAttributes : Proc(ISpeechPhraseReplacement*, Win32cr::Media::Speech::SpeechDisplayAttributes*, Win32cr::Foundation::HRESULT),
    get_Text : Proc(ISpeechPhraseReplacement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FirstElement : Proc(ISpeechPhraseReplacement*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfElements : Proc(ISpeechPhraseReplacement*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseReplacement, lpVtbl : ISpeechPhraseReplacementVtbl* do
    GUID = LibC::GUID.new(0x2890a410_u32, 0x53a7_u16, 0x4fb5_u16, StaticArray[0x94_u8, 0xec_u8, 0x6_u8, 0xd4_u8, 0x99_u8, 0x8e_u8, 0x3d_u8, 0x2_u8])
    def query_interface(this : ISpeechPhraseReplacement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseReplacement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseReplacement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseReplacement*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseReplacement*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseReplacement*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseReplacement*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayAttributes(this : ISpeechPhraseReplacement*, display_attributes : Win32cr::Media::Speech::SpeechDisplayAttributes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayAttributes.call(this, display_attributes)
    end
    def get_Text(this : ISpeechPhraseReplacement*, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Text.call(this, text)
    end
    def get_FirstElement(this : ISpeechPhraseReplacement*, first_element : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirstElement.call(this, first_element)
    end
    def get_NumberOfElements(this : ISpeechPhraseReplacement*, number_of_elements : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfElements.call(this, number_of_elements)
    end

  end

  @[Extern]
  record ISpeechPhraseReplacementsVtbl,
    query_interface : Proc(ISpeechPhraseReplacements*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseReplacements*, UInt32),
    release : Proc(ISpeechPhraseReplacements*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseReplacements*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseReplacements*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseReplacements*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseReplacements*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechPhraseReplacements*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechPhraseReplacements*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechPhraseReplacements*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseReplacements, lpVtbl : ISpeechPhraseReplacementsVtbl* do
    GUID = LibC::GUID.new(0x38bc662f_u32, 0x2257_u16, 0x4525_u16, StaticArray[0x95_u8, 0x9e_u8, 0x20_u8, 0x69_u8, 0xd2_u8, 0x59_u8, 0x6c_u8, 0x5_u8])
    def query_interface(this : ISpeechPhraseReplacements*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseReplacements*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseReplacements*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseReplacements*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseReplacements*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseReplacements*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseReplacements*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechPhraseReplacements*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechPhraseReplacements*, index : Int32, reps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, reps)
    end
    def get__NewEnum(this : ISpeechPhraseReplacements*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechPhrasePropertyVtbl,
    query_interface : Proc(ISpeechPhraseProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseProperty*, UInt32),
    release : Proc(ISpeechPhraseProperty*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISpeechPhraseProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechPhraseProperty*, Int32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ISpeechPhraseProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_FirstElement : Proc(ISpeechPhraseProperty*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfElements : Proc(ISpeechPhraseProperty*, Int32*, Win32cr::Foundation::HRESULT),
    get_EngineConfidence : Proc(ISpeechPhraseProperty*, Float32*, Win32cr::Foundation::HRESULT),
    get_Confidence : Proc(ISpeechPhraseProperty*, Win32cr::Media::Speech::SpeechEngineConfidence*, Win32cr::Foundation::HRESULT),
    get_Parent : Proc(ISpeechPhraseProperty*, Void**, Win32cr::Foundation::HRESULT),
    get_Children : Proc(ISpeechPhraseProperty*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseProperty, lpVtbl : ISpeechPhrasePropertyVtbl* do
    GUID = LibC::GUID.new(0xce563d48_u32, 0x961e_u16, 0x4732_u16, StaticArray[0xa2_u8, 0xe1_u8, 0x37_u8, 0x8a_u8, 0x42_u8, 0xb4_u8, 0x30_u8, 0xbe_u8])
    def query_interface(this : ISpeechPhraseProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ISpeechPhraseProperty*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Id(this : ISpeechPhraseProperty*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Value(this : ISpeechPhraseProperty*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def get_FirstElement(this : ISpeechPhraseProperty*, first_element : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirstElement.call(this, first_element)
    end
    def get_NumberOfElements(this : ISpeechPhraseProperty*, number_of_elements : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfElements.call(this, number_of_elements)
    end
    def get_EngineConfidence(this : ISpeechPhraseProperty*, confidence : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EngineConfidence.call(this, confidence)
    end
    def get_Confidence(this : ISpeechPhraseProperty*, confidence : Win32cr::Media::Speech::SpeechEngineConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Confidence.call(this, confidence)
    end
    def get_Parent(this : ISpeechPhraseProperty*, parent_property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parent.call(this, parent_property)
    end
    def get_Children(this : ISpeechPhraseProperty*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Children.call(this, children)
    end

  end

  @[Extern]
  record ISpeechPhrasePropertiesVtbl,
    query_interface : Proc(ISpeechPhraseProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseProperties*, UInt32),
    release : Proc(ISpeechPhraseProperties*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseProperties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseProperties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseProperties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechPhraseProperties*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechPhraseProperties*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechPhraseProperties*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseProperties, lpVtbl : ISpeechPhrasePropertiesVtbl* do
    GUID = LibC::GUID.new(0x8166b47_u32, 0x102e_u16, 0x4b23_u16, StaticArray[0xa5_u8, 0x99_u8, 0xbd_u8, 0xb9_u8, 0x8d_u8, 0xbf_u8, 0xd1_u8, 0xf4_u8])
    def query_interface(this : ISpeechPhraseProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseProperties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseProperties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseProperties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseProperties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechPhraseProperties*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechPhraseProperties*, index : Int32, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, property)
    end
    def get__NewEnum(this : ISpeechPhraseProperties*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechPhraseRuleVtbl,
    query_interface : Proc(ISpeechPhraseRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseRule*, UInt32),
    release : Proc(ISpeechPhraseRule*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISpeechPhraseRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISpeechPhraseRule*, Int32*, Win32cr::Foundation::HRESULT),
    get_FirstElement : Proc(ISpeechPhraseRule*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfElements : Proc(ISpeechPhraseRule*, Int32*, Win32cr::Foundation::HRESULT),
    get_Parent : Proc(ISpeechPhraseRule*, Void**, Win32cr::Foundation::HRESULT),
    get_Children : Proc(ISpeechPhraseRule*, Void**, Win32cr::Foundation::HRESULT),
    get_Confidence : Proc(ISpeechPhraseRule*, Win32cr::Media::Speech::SpeechEngineConfidence*, Win32cr::Foundation::HRESULT),
    get_EngineConfidence : Proc(ISpeechPhraseRule*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseRule, lpVtbl : ISpeechPhraseRuleVtbl* do
    GUID = LibC::GUID.new(0xa7bfe112_u32, 0xa4a0_u16, 0x48d9_u16, StaticArray[0xb6_u8, 0x2_u8, 0xc3_u8, 0x13_u8, 0x84_u8, 0x3f_u8, 0x69_u8, 0x64_u8])
    def query_interface(this : ISpeechPhraseRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ISpeechPhraseRule*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Id(this : ISpeechPhraseRule*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_FirstElement(this : ISpeechPhraseRule*, first_element : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirstElement.call(this, first_element)
    end
    def get_NumberOfElements(this : ISpeechPhraseRule*, number_of_elements : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfElements.call(this, number_of_elements)
    end
    def get_Parent(this : ISpeechPhraseRule*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parent.call(this, parent)
    end
    def get_Children(this : ISpeechPhraseRule*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Children.call(this, children)
    end
    def get_Confidence(this : ISpeechPhraseRule*, actual_confidence : Win32cr::Media::Speech::SpeechEngineConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Confidence.call(this, actual_confidence)
    end
    def get_EngineConfidence(this : ISpeechPhraseRule*, engine_confidence : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EngineConfidence.call(this, engine_confidence)
    end

  end

  @[Extern]
  record ISpeechPhraseRulesVtbl,
    query_interface : Proc(ISpeechPhraseRules*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseRules*, UInt32),
    release : Proc(ISpeechPhraseRules*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseRules*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseRules*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseRules*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseRules*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechPhraseRules*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechPhraseRules*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechPhraseRules*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseRules, lpVtbl : ISpeechPhraseRulesVtbl* do
    GUID = LibC::GUID.new(0x9047d593_u32, 0x1dd_u16, 0x4b72_u16, StaticArray[0x81_u8, 0xa3_u8, 0xe4_u8, 0xa0_u8, 0xca_u8, 0x69_u8, 0xf4_u8, 0x7_u8])
    def query_interface(this : ISpeechPhraseRules*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseRules*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseRules*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseRules*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseRules*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseRules*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseRules*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechPhraseRules*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechPhraseRules*, index : Int32, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, rule)
    end
    def get__NewEnum(this : ISpeechPhraseRules*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechLexiconVtbl,
    query_interface : Proc(ISpeechLexicon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechLexicon*, UInt32),
    release : Proc(ISpeechLexicon*, UInt32),
    get_type_info_count : Proc(ISpeechLexicon*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechLexicon*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechLexicon*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechLexicon*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_GenerationId : Proc(ISpeechLexicon*, Int32*, Win32cr::Foundation::HRESULT),
    get_words : Proc(ISpeechLexicon*, Win32cr::Media::Speech::SpeechLexiconType, Int32*, Void**, Win32cr::Foundation::HRESULT),
    add_pronunciation : Proc(ISpeechLexicon*, Win32cr::Foundation::BSTR, Int32, Win32cr::Media::Speech::SpeechPartOfSpeech, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_pronunciation_by_phone_ids : Proc(ISpeechLexicon*, Win32cr::Foundation::BSTR, Int32, Win32cr::Media::Speech::SpeechPartOfSpeech, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove_pronunciation : Proc(ISpeechLexicon*, Win32cr::Foundation::BSTR, Int32, Win32cr::Media::Speech::SpeechPartOfSpeech, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_pronunciation_by_phone_ids : Proc(ISpeechLexicon*, Win32cr::Foundation::BSTR, Int32, Win32cr::Media::Speech::SpeechPartOfSpeech, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_pronunciations : Proc(ISpeechLexicon*, Win32cr::Foundation::BSTR, Int32, Win32cr::Media::Speech::SpeechLexiconType, Void**, Win32cr::Foundation::HRESULT),
    get_generation_change : Proc(ISpeechLexicon*, Int32*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechLexicon, lpVtbl : ISpeechLexiconVtbl* do
    GUID = LibC::GUID.new(0x3da7627a_u32, 0xc7ae_u16, 0x4b23_u16, StaticArray[0x87_u8, 0x8_u8, 0x63_u8, 0x8c_u8, 0x50_u8, 0x36_u8, 0x2c_u8, 0x25_u8])
    def query_interface(this : ISpeechLexicon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechLexicon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechLexicon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechLexicon*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechLexicon*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechLexicon*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechLexicon*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_GenerationId(this : ISpeechLexicon*, generation_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GenerationId.call(this, generation_id)
    end
    def get_words(this : ISpeechLexicon*, flags : Win32cr::Media::Speech::SpeechLexiconType, generation_id : Int32*, words : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words.call(this, flags, generation_id, words)
    end
    def add_pronunciation(this : ISpeechLexicon*, bstrWord : Win32cr::Foundation::BSTR, lang_id : Int32, part_of_speech : Win32cr::Media::Speech::SpeechPartOfSpeech, bstrPronunciation : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pronunciation.call(this, bstrWord, lang_id, part_of_speech, bstrPronunciation)
    end
    def add_pronunciation_by_phone_ids(this : ISpeechLexicon*, bstrWord : Win32cr::Foundation::BSTR, lang_id : Int32, part_of_speech : Win32cr::Media::Speech::SpeechPartOfSpeech, phone_ids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pronunciation_by_phone_ids.call(this, bstrWord, lang_id, part_of_speech, phone_ids)
    end
    def remove_pronunciation(this : ISpeechLexicon*, bstrWord : Win32cr::Foundation::BSTR, lang_id : Int32, part_of_speech : Win32cr::Media::Speech::SpeechPartOfSpeech, bstrPronunciation : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_pronunciation.call(this, bstrWord, lang_id, part_of_speech, bstrPronunciation)
    end
    def remove_pronunciation_by_phone_ids(this : ISpeechLexicon*, bstrWord : Win32cr::Foundation::BSTR, lang_id : Int32, part_of_speech : Win32cr::Media::Speech::SpeechPartOfSpeech, phone_ids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_pronunciation_by_phone_ids.call(this, bstrWord, lang_id, part_of_speech, phone_ids)
    end
    def get_pronunciations(this : ISpeechLexicon*, bstrWord : Win32cr::Foundation::BSTR, lang_id : Int32, type_flags : Win32cr::Media::Speech::SpeechLexiconType, ppPronunciations : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pronunciations.call(this, bstrWord, lang_id, type_flags, ppPronunciations)
    end
    def get_generation_change(this : ISpeechLexicon*, generation_id : Int32*, ppWords : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_change.call(this, generation_id, ppWords)
    end

  end

  @[Extern]
  record ISpeechLexiconWordsVtbl,
    query_interface : Proc(ISpeechLexiconWords*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechLexiconWords*, UInt32),
    release : Proc(ISpeechLexiconWords*, UInt32),
    get_type_info_count : Proc(ISpeechLexiconWords*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechLexiconWords*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechLexiconWords*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechLexiconWords*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechLexiconWords*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechLexiconWords*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechLexiconWords*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechLexiconWords, lpVtbl : ISpeechLexiconWordsVtbl* do
    GUID = LibC::GUID.new(0x8d199862_u32, 0x415e_u16, 0x47d5_u16, StaticArray[0xac_u8, 0x4f_u8, 0xfa_u8, 0xa6_u8, 0x8_u8, 0xb4_u8, 0x24_u8, 0xe6_u8])
    def query_interface(this : ISpeechLexiconWords*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechLexiconWords*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechLexiconWords*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechLexiconWords*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechLexiconWords*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechLexiconWords*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechLexiconWords*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechLexiconWords*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechLexiconWords*, index : Int32, word : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, word)
    end
    def get__NewEnum(this : ISpeechLexiconWords*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechLexiconWordVtbl,
    query_interface : Proc(ISpeechLexiconWord*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechLexiconWord*, UInt32),
    release : Proc(ISpeechLexiconWord*, UInt32),
    get_type_info_count : Proc(ISpeechLexiconWord*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechLexiconWord*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechLexiconWord*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechLexiconWord*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LangId : Proc(ISpeechLexiconWord*, Int32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISpeechLexiconWord*, Win32cr::Media::Speech::SpeechWordType*, Win32cr::Foundation::HRESULT),
    get_Word : Proc(ISpeechLexiconWord*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pronunciations : Proc(ISpeechLexiconWord*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechLexiconWord, lpVtbl : ISpeechLexiconWordVtbl* do
    GUID = LibC::GUID.new(0x4e5b933c_u32, 0xc9be_u16, 0x48ed_u16, StaticArray[0x88_u8, 0x42_u8, 0x1e_u8, 0xe5_u8, 0x1b_u8, 0xb1_u8, 0xd4_u8, 0xff_u8])
    def query_interface(this : ISpeechLexiconWord*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechLexiconWord*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechLexiconWord*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechLexiconWord*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechLexiconWord*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechLexiconWord*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechLexiconWord*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LangId(this : ISpeechLexiconWord*, lang_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LangId.call(this, lang_id)
    end
    def get_Type(this : ISpeechLexiconWord*, word_type : Win32cr::Media::Speech::SpeechWordType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, word_type)
    end
    def get_Word(this : ISpeechLexiconWord*, word : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Word.call(this, word)
    end
    def get_Pronunciations(this : ISpeechLexiconWord*, pronunciations : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pronunciations.call(this, pronunciations)
    end

  end

  @[Extern]
  record ISpeechLexiconPronunciationsVtbl,
    query_interface : Proc(ISpeechLexiconPronunciations*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechLexiconPronunciations*, UInt32),
    release : Proc(ISpeechLexiconPronunciations*, UInt32),
    get_type_info_count : Proc(ISpeechLexiconPronunciations*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechLexiconPronunciations*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechLexiconPronunciations*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechLexiconPronunciations*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISpeechLexiconPronunciations*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(ISpeechLexiconPronunciations*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISpeechLexiconPronunciations*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechLexiconPronunciations, lpVtbl : ISpeechLexiconPronunciationsVtbl* do
    GUID = LibC::GUID.new(0x72829128_u32, 0x5682_u16, 0x4704_u16, StaticArray[0xa0_u8, 0xd4_u8, 0x3e_u8, 0x2b_u8, 0xb6_u8, 0xf2_u8, 0xea_u8, 0xd3_u8])
    def query_interface(this : ISpeechLexiconPronunciations*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechLexiconPronunciations*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechLexiconPronunciations*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechLexiconPronunciations*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechLexiconPronunciations*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechLexiconPronunciations*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechLexiconPronunciations*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISpeechLexiconPronunciations*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : ISpeechLexiconPronunciations*, index : Int32, pronunciation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, pronunciation)
    end
    def get__NewEnum(this : ISpeechLexiconPronunciations*, enum_variant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum_variant)
    end

  end

  @[Extern]
  record ISpeechLexiconPronunciationVtbl,
    query_interface : Proc(ISpeechLexiconPronunciation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechLexiconPronunciation*, UInt32),
    release : Proc(ISpeechLexiconPronunciation*, UInt32),
    get_type_info_count : Proc(ISpeechLexiconPronunciation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechLexiconPronunciation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechLexiconPronunciation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechLexiconPronunciation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISpeechLexiconPronunciation*, Win32cr::Media::Speech::SpeechLexiconType*, Win32cr::Foundation::HRESULT),
    get_LangId : Proc(ISpeechLexiconPronunciation*, Int32*, Win32cr::Foundation::HRESULT),
    get_PartOfSpeech : Proc(ISpeechLexiconPronunciation*, Win32cr::Media::Speech::SpeechPartOfSpeech*, Win32cr::Foundation::HRESULT),
    get_PhoneIds : Proc(ISpeechLexiconPronunciation*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Symbolic : Proc(ISpeechLexiconPronunciation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechLexiconPronunciation, lpVtbl : ISpeechLexiconPronunciationVtbl* do
    GUID = LibC::GUID.new(0x95252c5d_u32, 0x9e43_u16, 0x4f4a_u16, StaticArray[0x98_u8, 0x99_u8, 0x48_u8, 0xee_u8, 0x73_u8, 0x35_u8, 0x2f_u8, 0x9f_u8])
    def query_interface(this : ISpeechLexiconPronunciation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechLexiconPronunciation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechLexiconPronunciation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechLexiconPronunciation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechLexiconPronunciation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechLexiconPronunciation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechLexiconPronunciation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ISpeechLexiconPronunciation*, lexicon_type : Win32cr::Media::Speech::SpeechLexiconType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, lexicon_type)
    end
    def get_LangId(this : ISpeechLexiconPronunciation*, lang_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LangId.call(this, lang_id)
    end
    def get_PartOfSpeech(this : ISpeechLexiconPronunciation*, part_of_speech : Win32cr::Media::Speech::SpeechPartOfSpeech*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PartOfSpeech.call(this, part_of_speech)
    end
    def get_PhoneIds(this : ISpeechLexiconPronunciation*, phone_ids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhoneIds.call(this, phone_ids)
    end
    def get_Symbolic(this : ISpeechLexiconPronunciation*, symbolic : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Symbolic.call(this, symbolic)
    end

  end

  @[Extern]
  record ISpeechXMLRecoResultVtbl,
    query_interface : Proc(ISpeechXMLRecoResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechXMLRecoResult*, UInt32),
    release : Proc(ISpeechXMLRecoResult*, UInt32),
    get_type_info_count : Proc(ISpeechXMLRecoResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechXMLRecoResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechXMLRecoResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechXMLRecoResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RecoContext : Proc(ISpeechXMLRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Times : Proc(ISpeechXMLRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioFormat : Proc(ISpeechXMLRecoResult*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioFormat : Proc(ISpeechXMLRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    get_PhraseInfo : Proc(ISpeechXMLRecoResult*, Void**, Win32cr::Foundation::HRESULT),
    alternates : Proc(ISpeechXMLRecoResult*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    audio : Proc(ISpeechXMLRecoResult*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpeechXMLRecoResult*, Int32, Int32, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(ISpeechXMLRecoResult*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    discard_result_info : Proc(ISpeechXMLRecoResult*, Win32cr::Media::Speech::SpeechDiscardType, Win32cr::Foundation::HRESULT),
    get_xml_result : Proc(ISpeechXMLRecoResult*, Win32cr::Media::Speech::SPXMLRESULTOPTIONS, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_xml_error_info : Proc(ISpeechXMLRecoResult*, Int32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Int32*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechXMLRecoResult, lpVtbl : ISpeechXMLRecoResultVtbl* do
    GUID = LibC::GUID.new(0xaaec54af_u32, 0x8f85_u16, 0x4924_u16, StaticArray[0x94_u8, 0x4d_u8, 0xb7_u8, 0x9d_u8, 0x39_u8, 0xd7_u8, 0x2e_u8, 0x19_u8])
    def query_interface(this : ISpeechXMLRecoResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechXMLRecoResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechXMLRecoResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechXMLRecoResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechXMLRecoResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechXMLRecoResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechXMLRecoResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RecoContext(this : ISpeechXMLRecoResult*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoContext.call(this, reco_context)
    end
    def get_Times(this : ISpeechXMLRecoResult*, times : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Times.call(this, times)
    end
    def putref_AudioFormat(this : ISpeechXMLRecoResult*, format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioFormat.call(this, format)
    end
    def get_AudioFormat(this : ISpeechXMLRecoResult*, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioFormat.call(this, format)
    end
    def get_PhraseInfo(this : ISpeechXMLRecoResult*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhraseInfo.call(this, phrase_info)
    end
    def alternates(this : ISpeechXMLRecoResult*, request_count : Int32, start_element : Int32, elements : Int32, alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates.call(this, request_count, start_element, elements, alternates)
    end
    def audio(this : ISpeechXMLRecoResult*, start_element : Int32, elements : Int32, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.audio.call(this, start_element, elements, stream)
    end
    def speak_audio(this : ISpeechXMLRecoResult*, start_element : Int32, elements : Int32, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, start_element, elements, flags, stream_number)
    end
    def save_to_memory(this : ISpeechXMLRecoResult*, result_block : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, result_block)
    end
    def discard_result_info(this : ISpeechXMLRecoResult*, value_types : Win32cr::Media::Speech::SpeechDiscardType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard_result_info.call(this, value_types)
    end
    def get_xml_result(this : ISpeechXMLRecoResult*, options : Win32cr::Media::Speech::SPXMLRESULTOPTIONS, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_result.call(this, options, pResult)
    end
    def get_xml_error_info(this : ISpeechXMLRecoResult*, line_number : Int32*, script_line : Win32cr::Foundation::BSTR*, source : Win32cr::Foundation::BSTR*, description : Win32cr::Foundation::BSTR*, result_code : Int32*, is_error : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_error_info.call(this, line_number, script_line, source, description, result_code, is_error)
    end

  end

  @[Extern]
  record ISpeechRecoResultDispatchVtbl,
    query_interface : Proc(ISpeechRecoResultDispatch*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechRecoResultDispatch*, UInt32),
    release : Proc(ISpeechRecoResultDispatch*, UInt32),
    get_type_info_count : Proc(ISpeechRecoResultDispatch*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechRecoResultDispatch*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechRecoResultDispatch*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechRecoResultDispatch*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RecoContext : Proc(ISpeechRecoResultDispatch*, Void**, Win32cr::Foundation::HRESULT),
    get_Times : Proc(ISpeechRecoResultDispatch*, Void**, Win32cr::Foundation::HRESULT),
    putref_AudioFormat : Proc(ISpeechRecoResultDispatch*, Void*, Win32cr::Foundation::HRESULT),
    get_AudioFormat : Proc(ISpeechRecoResultDispatch*, Void**, Win32cr::Foundation::HRESULT),
    get_PhraseInfo : Proc(ISpeechRecoResultDispatch*, Void**, Win32cr::Foundation::HRESULT),
    alternates : Proc(ISpeechRecoResultDispatch*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    audio : Proc(ISpeechRecoResultDispatch*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    speak_audio : Proc(ISpeechRecoResultDispatch*, Int32, Int32, Win32cr::Media::Speech::SpeechVoiceSpeakFlags, Int32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(ISpeechRecoResultDispatch*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    discard_result_info : Proc(ISpeechRecoResultDispatch*, Win32cr::Media::Speech::SpeechDiscardType, Win32cr::Foundation::HRESULT),
    get_xml_result : Proc(ISpeechRecoResultDispatch*, Win32cr::Media::Speech::SPXMLRESULTOPTIONS, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_xml_error_info : Proc(ISpeechRecoResultDispatch*, Int32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT*, Int16*, Win32cr::Foundation::HRESULT),
    set_text_feedback : Proc(ISpeechRecoResultDispatch*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechRecoResultDispatch, lpVtbl : ISpeechRecoResultDispatchVtbl* do
    GUID = LibC::GUID.new(0x6d60eb64_u32, 0xaced_u16, 0x40a6_u16, StaticArray[0xbb_u8, 0xf3_u8, 0x4e_u8, 0x55_u8, 0x7f_u8, 0x71_u8, 0xde_u8, 0xe2_u8])
    def query_interface(this : ISpeechRecoResultDispatch*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechRecoResultDispatch*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechRecoResultDispatch*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechRecoResultDispatch*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechRecoResultDispatch*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechRecoResultDispatch*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechRecoResultDispatch*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RecoContext(this : ISpeechRecoResultDispatch*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecoContext.call(this, reco_context)
    end
    def get_Times(this : ISpeechRecoResultDispatch*, times : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Times.call(this, times)
    end
    def putref_AudioFormat(this : ISpeechRecoResultDispatch*, format : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AudioFormat.call(this, format)
    end
    def get_AudioFormat(this : ISpeechRecoResultDispatch*, format : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AudioFormat.call(this, format)
    end
    def get_PhraseInfo(this : ISpeechRecoResultDispatch*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PhraseInfo.call(this, phrase_info)
    end
    def alternates(this : ISpeechRecoResultDispatch*, request_count : Int32, start_element : Int32, elements : Int32, alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates.call(this, request_count, start_element, elements, alternates)
    end
    def audio(this : ISpeechRecoResultDispatch*, start_element : Int32, elements : Int32, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.audio.call(this, start_element, elements, stream)
    end
    def speak_audio(this : ISpeechRecoResultDispatch*, start_element : Int32, elements : Int32, flags : Win32cr::Media::Speech::SpeechVoiceSpeakFlags, stream_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.speak_audio.call(this, start_element, elements, flags, stream_number)
    end
    def save_to_memory(this : ISpeechRecoResultDispatch*, result_block : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, result_block)
    end
    def discard_result_info(this : ISpeechRecoResultDispatch*, value_types : Win32cr::Media::Speech::SpeechDiscardType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard_result_info.call(this, value_types)
    end
    def get_xml_result(this : ISpeechRecoResultDispatch*, options : Win32cr::Media::Speech::SPXMLRESULTOPTIONS, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_result.call(this, options, pResult)
    end
    def get_xml_error_info(this : ISpeechRecoResultDispatch*, line_number : Int32*, script_line : Win32cr::Foundation::BSTR*, source : Win32cr::Foundation::BSTR*, description : Win32cr::Foundation::BSTR*, result_code : Win32cr::Foundation::HRESULT*, is_error : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml_error_info.call(this, line_number, script_line, source, description, result_code, is_error)
    end
    def set_text_feedback(this : ISpeechRecoResultDispatch*, feedback : Win32cr::Foundation::BSTR, was_successful : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_feedback.call(this, feedback, was_successful)
    end

  end

  @[Extern]
  record ISpeechPhraseInfoBuilderVtbl,
    query_interface : Proc(ISpeechPhraseInfoBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhraseInfoBuilder*, UInt32),
    release : Proc(ISpeechPhraseInfoBuilder*, UInt32),
    get_type_info_count : Proc(ISpeechPhraseInfoBuilder*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhraseInfoBuilder*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhraseInfoBuilder*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhraseInfoBuilder*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    restore_phrase_from_memory : Proc(ISpeechPhraseInfoBuilder*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhraseInfoBuilder, lpVtbl : ISpeechPhraseInfoBuilderVtbl* do
    GUID = LibC::GUID.new(0x3b151836_u32, 0xdf3a_u16, 0x4e0a_u16, StaticArray[0x84_u8, 0x6c_u8, 0xd2_u8, 0xad_u8, 0xc9_u8, 0x33_u8, 0x43_u8, 0x33_u8])
    def query_interface(this : ISpeechPhraseInfoBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhraseInfoBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhraseInfoBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhraseInfoBuilder*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhraseInfoBuilder*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhraseInfoBuilder*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhraseInfoBuilder*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def restore_phrase_from_memory(this : ISpeechPhraseInfoBuilder*, phrase_in_memory : Win32cr::System::Com::VARIANT*, phrase_info : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_phrase_from_memory.call(this, phrase_in_memory, phrase_info)
    end

  end

  @[Extern]
  record ISpeechPhoneConverterVtbl,
    query_interface : Proc(ISpeechPhoneConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechPhoneConverter*, UInt32),
    release : Proc(ISpeechPhoneConverter*, UInt32),
    get_type_info_count : Proc(ISpeechPhoneConverter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISpeechPhoneConverter*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISpeechPhoneConverter*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISpeechPhoneConverter*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LanguageId : Proc(ISpeechPhoneConverter*, Int32*, Win32cr::Foundation::HRESULT),
    put_LanguageId : Proc(ISpeechPhoneConverter*, Int32, Win32cr::Foundation::HRESULT),
    phone_to_id : Proc(ISpeechPhoneConverter*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    id_to_phone : Proc(ISpeechPhoneConverter*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpeechPhoneConverter, lpVtbl : ISpeechPhoneConverterVtbl* do
    GUID = LibC::GUID.new(0xc3e4f353_u32, 0x433f_u16, 0x43d6_u16, StaticArray[0x89_u8, 0xa1_u8, 0x6a_u8, 0x62_u8, 0xa7_u8, 0x5_u8, 0x4c_u8, 0x3d_u8])
    def query_interface(this : ISpeechPhoneConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechPhoneConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechPhoneConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISpeechPhoneConverter*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISpeechPhoneConverter*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISpeechPhoneConverter*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISpeechPhoneConverter*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LanguageId(this : ISpeechPhoneConverter*, language_id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LanguageId.call(this, language_id)
    end
    def put_LanguageId(this : ISpeechPhoneConverter*, language_id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LanguageId.call(this, language_id)
    end
    def phone_to_id(this : ISpeechPhoneConverter*, phonemes : Win32cr::Foundation::BSTR, id_array : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.phone_to_id.call(this, phonemes, id_array)
    end
    def id_to_phone(this : ISpeechPhoneConverter*, id_array : Win32cr::System::Com::VARIANT, phonemes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.id_to_phone.call(this, id_array, phonemes)
    end

  end

end