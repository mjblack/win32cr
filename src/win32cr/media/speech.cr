require "../foundation.cr"
require "../system/com.cr"
require "../system/registry.cr"
require "../media/audio.cr"
require "../system/com/urlmon.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
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
  SAPI_ERROR_BASE = 20480_u32
  Speech_Default_Weight = "1.0_f32"
  Speech_Max_Word_Length = 128_i32
  Speech_Max_Pron_Length = 384_i32
  Speech_StreamPos_Asap = 0_i32
  Speech_StreamPos_RealTime = -1_i32
  SpeechAllElements = -1_i32
  SpNotifyTranslator = LibC::GUID.new(0xe2ae5372_u32, 0x5d40_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xe_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  SpObjectTokenCategory = LibC::GUID.new(0xa910187f_u32, 0xc7a_u16, 0x45ac_u16, StaticArray[0x92_u8, 0xcc_u8, 0x59_u8, 0xed_u8, 0xaf_u8, 0xb7_u8, 0x7b_u8, 0x53_u8])
  SpObjectToken = LibC::GUID.new(0xef411752_u32, 0x3736_u16, 0x4cb4_u16, StaticArray[0x9c_u8, 0x8c_u8, 0x8e_u8, 0xf4_u8, 0xcc_u8, 0xb5_u8, 0x8e_u8, 0xfe_u8])
  SpResourceManager = LibC::GUID.new(0x96749373_u32, 0x3391_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  SpStreamFormatConverter = LibC::GUID.new(0x7013943a_u32, 0xe2ec_u16, 0x11d2_u16, StaticArray[0xa0_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0xb5_u8])
  SpMMAudioEnum = LibC::GUID.new(0xab1890a0_u32, 0xe91f_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
  SpMMAudioIn = LibC::GUID.new(0xcf3d2e50_u32, 0x53f2_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  SpMMAudioOut = LibC::GUID.new(0xa8c680eb_u32, 0x3d32_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  SpStream = LibC::GUID.new(0x715d9c59_u32, 0x4442_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  SpVoice = LibC::GUID.new(0x96749377_u32, 0x3391_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  SpSharedRecoContext = LibC::GUID.new(0x47206204_u32, 0x5eca_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  SpInprocRecognizer = LibC::GUID.new(0x41b89b6b_u32, 0x9399_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x23_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  SpSharedRecognizer = LibC::GUID.new(0x3bee4890_u32, 0x4fe9_u16, 0x4a37_u16, StaticArray[0x8c_u8, 0x1e_u8, 0x5e_u8, 0x7e_u8, 0x12_u8, 0x79_u8, 0x1c_u8, 0x1f_u8])
  SpLexicon = LibC::GUID.new(0x655e396_u32, 0x25d0_u16, 0x11d3_u16, StaticArray[0x9c_u8, 0x26_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf8_u8, 0x7c_u8])
  SpUnCompressedLexicon = LibC::GUID.new(0xc9e37c15_u32, 0xdf92_u16, 0x4727_u16, StaticArray[0x85_u8, 0xd6_u8, 0x72_u8, 0xe5_u8, 0xee_u8, 0xb6_u8, 0x99_u8, 0x5a_u8])
  SpCompressedLexicon = LibC::GUID.new(0x90903716_u32, 0x2f42_u16, 0x11d3_u16, StaticArray[0x9c_u8, 0x26_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf8_u8, 0x7c_u8])
  SpShortcut = LibC::GUID.new(0xd722f1a_u32, 0x9fcf_u16, 0x4e62_u16, StaticArray[0x96_u8, 0xd8_u8, 0x6d_u8, 0xf8_u8, 0xf0_u8, 0x1a_u8, 0x26_u8, 0xaa_u8])
  SpPhoneConverter = LibC::GUID.new(0x9185f743_u32, 0x1143_u16, 0x4c28_u16, StaticArray[0x86_u8, 0xb5_u8, 0xbf_u8, 0xf1_u8, 0x4f_u8, 0x20_u8, 0xe5_u8, 0xc8_u8])
  SpPhoneticAlphabetConverter = LibC::GUID.new(0x4f414126_u32, 0xdfe3_u16, 0x4629_u16, StaticArray[0x99_u8, 0xee_u8, 0x79_u8, 0x79_u8, 0x78_u8, 0x31_u8, 0x7e_u8, 0xad_u8])
  SpNullPhoneConverter = LibC::GUID.new(0x455f24e9_u32, 0x7396_u16, 0x4a16_u16, StaticArray[0x97_u8, 0x15_u8, 0x7c_u8, 0xf_u8, 0xdb_u8, 0xe3_u8, 0xef_u8, 0xe3_u8])
  SpTextSelectionInformation = LibC::GUID.new(0xf92030a_u32, 0xcbfd_u16, 0x4ab8_u16, StaticArray[0xa1_u8, 0x64_u8, 0xff_u8, 0x59_u8, 0x85_u8, 0x54_u8, 0x7f_u8, 0xf6_u8])
  SpPhraseInfoBuilder = LibC::GUID.new(0xc23fc28d_u32, 0xc55f_u16, 0x4720_u16, StaticArray[0x8b_u8, 0x32_u8, 0x91_u8, 0xf7_u8, 0x3c_u8, 0x2b_u8, 0xd5_u8, 0xd1_u8])
  SpAudioFormat = LibC::GUID.new(0x9ef96870_u32, 0xe160_u16, 0x4792_u16, StaticArray[0x82_u8, 0xd_u8, 0x48_u8, 0xcf_u8, 0x6_u8, 0x49_u8, 0xe4_u8, 0xec_u8])
  SpWaveFormatEx = LibC::GUID.new(0xc79a574c_u32, 0x63be_u16, 0x44b9_u16, StaticArray[0x80_u8, 0x1f_u8, 0x28_u8, 0x3f_u8, 0x87_u8, 0xf8_u8, 0x98_u8, 0xbe_u8])
  SpInProcRecoContext = LibC::GUID.new(0x73ad6842_u32, 0xace0_u16, 0x45e8_u16, StaticArray[0xa4_u8, 0xdd_u8, 0x87_u8, 0x95_u8, 0x88_u8, 0x1a_u8, 0x2c_u8, 0x2a_u8])
  SpCustomStream = LibC::GUID.new(0x8dbef13f_u32, 0x1948_u16, 0x4aa8_u16, StaticArray[0x8c_u8, 0xf0_u8, 0x4_u8, 0x8e_u8, 0xeb_u8, 0xed_u8, 0x95_u8, 0xd8_u8])
  SpFileStream = LibC::GUID.new(0x947812b3_u32, 0x2ae1_u16, 0x4644_u16, StaticArray[0xba_u8, 0x86_u8, 0x9e_u8, 0x90_u8, 0xde_u8, 0xd7_u8, 0xec_u8, 0x91_u8])
  SpMemoryStream = LibC::GUID.new(0x5fb7ef7d_u32, 0xdff4_u16, 0x468a_u16, StaticArray[0xb6_u8, 0xb7_u8, 0x2f_u8, 0xcb_u8, 0xd1_u8, 0x88_u8, 0xf9_u8, 0x94_u8])

  alias SPNOTIFYCALLBACK = Proc(LibC::UINT_PTR, LPARAM, Void)


  enum SPDATAKEYLOCATION : Int32
    SPDKL_DefaultLocation = 0
    SPDKL_CurrentUser = 1
    SPDKL_LocalMachine = 2
    SPDKL_CurrentConfig = 5
  end

  enum SPSTREAMFORMAT : Int32
    SPSF_Default = -1
    SPSF_NoAssignedFormat = 0
    SPSF_Text = 1
    SPSF_NonStandardFormat = 2
    SPSF_ExtendedAudioFormat = 3
    SPSF_8kHz8BitMono = 4
    SPSF_8kHz8BitStereo = 5
    SPSF_8kHz16BitMono = 6
    SPSF_8kHz16BitStereo = 7
    SPSF_11kHz8BitMono = 8
    SPSF_11kHz8BitStereo = 9
    SPSF_11kHz16BitMono = 10
    SPSF_11kHz16BitStereo = 11
    SPSF_12kHz8BitMono = 12
    SPSF_12kHz8BitStereo = 13
    SPSF_12kHz16BitMono = 14
    SPSF_12kHz16BitStereo = 15
    SPSF_16kHz8BitMono = 16
    SPSF_16kHz8BitStereo = 17
    SPSF_16kHz16BitMono = 18
    SPSF_16kHz16BitStereo = 19
    SPSF_22kHz8BitMono = 20
    SPSF_22kHz8BitStereo = 21
    SPSF_22kHz16BitMono = 22
    SPSF_22kHz16BitStereo = 23
    SPSF_24kHz8BitMono = 24
    SPSF_24kHz8BitStereo = 25
    SPSF_24kHz16BitMono = 26
    SPSF_24kHz16BitStereo = 27
    SPSF_32kHz8BitMono = 28
    SPSF_32kHz8BitStereo = 29
    SPSF_32kHz16BitMono = 30
    SPSF_32kHz16BitStereo = 31
    SPSF_44kHz8BitMono = 32
    SPSF_44kHz8BitStereo = 33
    SPSF_44kHz16BitMono = 34
    SPSF_44kHz16BitStereo = 35
    SPSF_48kHz8BitMono = 36
    SPSF_48kHz8BitStereo = 37
    SPSF_48kHz16BitMono = 38
    SPSF_48kHz16BitStereo = 39
    SPSF_TrueSpeech_8kHz1BitMono = 40
    SPSF_CCITT_ALaw_8kHzMono = 41
    SPSF_CCITT_ALaw_8kHzStereo = 42
    SPSF_CCITT_ALaw_11kHzMono = 43
    SPSF_CCITT_ALaw_11kHzStereo = 44
    SPSF_CCITT_ALaw_22kHzMono = 45
    SPSF_CCITT_ALaw_22kHzStereo = 46
    SPSF_CCITT_ALaw_44kHzMono = 47
    SPSF_CCITT_ALaw_44kHzStereo = 48
    SPSF_CCITT_uLaw_8kHzMono = 49
    SPSF_CCITT_uLaw_8kHzStereo = 50
    SPSF_CCITT_uLaw_11kHzMono = 51
    SPSF_CCITT_uLaw_11kHzStereo = 52
    SPSF_CCITT_uLaw_22kHzMono = 53
    SPSF_CCITT_uLaw_22kHzStereo = 54
    SPSF_CCITT_uLaw_44kHzMono = 55
    SPSF_CCITT_uLaw_44kHzStereo = 56
    SPSF_ADPCM_8kHzMono = 57
    SPSF_ADPCM_8kHzStereo = 58
    SPSF_ADPCM_11kHzMono = 59
    SPSF_ADPCM_11kHzStereo = 60
    SPSF_ADPCM_22kHzMono = 61
    SPSF_ADPCM_22kHzStereo = 62
    SPSF_ADPCM_44kHzMono = 63
    SPSF_ADPCM_44kHzStereo = 64
    SPSF_GSM610_8kHzMono = 65
    SPSF_GSM610_11kHzMono = 66
    SPSF_GSM610_22kHzMono = 67
    SPSF_GSM610_44kHzMono = 68
    SPSF_NUM_FORMATS = 69
  end

  enum SPEVENTLPARAMTYPE : Int32
    SPET_LPARAM_IS_UNDEFINED = 0
    SPET_LPARAM_IS_TOKEN = 1
    SPET_LPARAM_IS_OBJECT = 2
    SPET_LPARAM_IS_POINTER = 3
    SPET_LPARAM_IS_STRING = 4
  end

  enum SPEVENTENUM : Int32
    SPEI_UNDEFINED = 0
    SPEI_START_INPUT_STREAM = 1
    SPEI_END_INPUT_STREAM = 2
    SPEI_VOICE_CHANGE = 3
    SPEI_TTS_BOOKMARK = 4
    SPEI_WORD_BOUNDARY = 5
    SPEI_PHONEME = 6
    SPEI_SENTENCE_BOUNDARY = 7
    SPEI_VISEME = 8
    SPEI_TTS_AUDIO_LEVEL = 9
    SPEI_TTS_PRIVATE = 15
    SPEI_MIN_TTS = 1
    SPEI_MAX_TTS = 15
    SPEI_END_SR_STREAM = 34
    SPEI_SOUND_START = 35
    SPEI_SOUND_END = 36
    SPEI_PHRASE_START = 37
    SPEI_RECOGNITION = 38
    SPEI_HYPOTHESIS = 39
    SPEI_SR_BOOKMARK = 40
    SPEI_PROPERTY_NUM_CHANGE = 41
    SPEI_PROPERTY_STRING_CHANGE = 42
    SPEI_FALSE_RECOGNITION = 43
    SPEI_INTERFERENCE = 44
    SPEI_REQUEST_UI = 45
    SPEI_RECO_STATE_CHANGE = 46
    SPEI_ADAPTATION = 47
    SPEI_START_SR_STREAM = 48
    SPEI_RECO_OTHER_CONTEXT = 49
    SPEI_SR_AUDIO_LEVEL = 50
    SPEI_SR_RETAINEDAUDIO = 51
    SPEI_SR_PRIVATE = 52
    SPEI_RESERVED4 = 53
    SPEI_RESERVED5 = 54
    SPEI_RESERVED6 = 55
    SPEI_MIN_SR = 34
    SPEI_MAX_SR = 55
    SPEI_RESERVED1 = 30
    SPEI_RESERVED2 = 33
    SPEI_RESERVED3 = 63
  end

  enum SPINTERFERENCE : Int32
    SPINTERFERENCE_NONE = 0
    SPINTERFERENCE_NOISE = 1
    SPINTERFERENCE_NOSIGNAL = 2
    SPINTERFERENCE_TOOLOUD = 3
    SPINTERFERENCE_TOOQUIET = 4
    SPINTERFERENCE_TOOFAST = 5
    SPINTERFERENCE_TOOSLOW = 6
    SPINTERFERENCE_LATENCY_WARNING = 7
    SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN = 8
    SPINTERFERENCE_LATENCY_TRUNCATE_END = 9
  end

  enum SPENDSRSTREAMFLAGS : Int32
    SPESF_NONE = 0
    SPESF_STREAM_RELEASED = 1
    SPESF_EMULATED = 2
  end

  enum SPVFEATURE : Int32
    SPVFEATURE_STRESSED = 1
    SPVFEATURE_EMPHASIS = 2
  end

  enum SPVISEMES : Int32
    SP_VISEME_0 = 0
    SP_VISEME_1 = 1
    SP_VISEME_2 = 2
    SP_VISEME_3 = 3
    SP_VISEME_4 = 4
    SP_VISEME_5 = 5
    SP_VISEME_6 = 6
    SP_VISEME_7 = 7
    SP_VISEME_8 = 8
    SP_VISEME_9 = 9
    SP_VISEME_10 = 10
    SP_VISEME_11 = 11
    SP_VISEME_12 = 12
    SP_VISEME_13 = 13
    SP_VISEME_14 = 14
    SP_VISEME_15 = 15
    SP_VISEME_16 = 16
    SP_VISEME_17 = 17
    SP_VISEME_18 = 18
    SP_VISEME_19 = 19
    SP_VISEME_20 = 20
    SP_VISEME_21 = 21
  end

  enum SPFILEMODE : Int32
    SPFM_OPEN_READONLY = 0
    SPFM_OPEN_READWRITE = 1
    SPFM_CREATE = 2
    SPFM_CREATE_ALWAYS = 3
    SPFM_NUM_MODES = 4
  end

  enum SPAUDIOSTATE : Int32
    SPAS_CLOSED = 0
    SPAS_STOP = 1
    SPAS_PAUSE = 2
    SPAS_RUN = 3
  end

  enum SPDISPLYATTRIBUTES : Int32
    SPAF_ONE_TRAILING_SPACE = 2
    SPAF_TWO_TRAILING_SPACES = 4
    SPAF_CONSUME_LEADING_SPACES = 8
    SPAF_BUFFER_POSITION = 16
    SPAF_ALL = 31
    SPAF_USER_SPECIFIED = 128
  end

  enum SPPHRASEPROPERTYUNIONTYPE : Int32
    SPPPUT_UNUSED = 0
    SPPPUT_ARRAY_INDEX = 1
  end

  enum SPSEMANTICFORMAT : Int32
    SPSMF_SAPI_PROPERTIES = 0
    SPSMF_SRGS_SEMANTICINTERPRETATION_MS = 1
    SPSMF_SRGS_SAPIPROPERTIES = 2
    SPSMF_UPS = 4
    SPSMF_SRGS_SEMANTICINTERPRETATION_W3C = 8
  end

  enum SPVALUETYPE : Int32
    SPDF_PROPERTY = 1
    SPDF_REPLACEMENT = 2
    SPDF_RULE = 4
    SPDF_DISPLAYTEXT = 8
    SPDF_LEXICALFORM = 16
    SPDF_PRONUNCIATION = 32
    SPDF_AUDIO = 64
    SPDF_ALTERNATES = 128
    SPDF_ALL = 255
  end

  enum SPPHRASERNG : Int32
    SPPR_ALL_ELEMENTS = -1
  end

  enum SPRECOEVENTFLAGS : Int32
    SPREF_AutoPause = 1
    SPREF_Emulated = 2
    SPREF_SMLTimeout = 4
    SPREF_ExtendableParse = 8
    SPREF_ReSent = 16
    SPREF_Hypothesis = 32
    SPREF_FalseRecognition = 64
  end

  enum SPPARTOFSPEECH : Int32
    SPPS_NotOverriden = -1
    SPPS_Unknown = 0
    SPPS_Noun = 4096
    SPPS_Verb = 8192
    SPPS_Modifier = 12288
    SPPS_Function = 16384
    SPPS_Interjection = 20480
    SPPS_Noncontent = 24576
    SPPS_LMA = 28672
    SPPS_SuppressWord = 61440
  end

  enum SPLEXICONTYPE : Int32
    Elextype_user = 1
    Elextype_app = 2
    Elextype_vendorlexicon = 4
    Elextype_lettertosound = 8
    Elextype_morphology = 16
    Elextype_reserved4 = 32
    Elextype_user_shortcut = 64
    Elextype_reserved6 = 128
    Elextype_reserved7 = 256
    Elextype_reserved8 = 512
    Elextype_reserved9 = 1024
    Elextype_reserved10 = 2048
    Elextype_private1 = 4096
    Elextype_private2 = 8192
    Elextype_private3 = 16384
    Elextype_private4 = 32768
    Elextype_private5 = 65536
    Elextype_private6 = 131072
    Elextype_private7 = 262144
    Elextype_private8 = 524288
    Elextype_private9 = 1048576
    Elextype_private10 = 2097152
    Elextype_private11 = 4194304
    Elextype_private12 = 8388608
    Elextype_private13 = 16777216
    Elextype_private14 = 33554432
    Elextype_private15 = 67108864
    Elextype_private16 = 134217728
    Elextype_private17 = 268435456
    Elextype_private18 = 536870912
    Elextype_private19 = 1073741824
    Elextype_private20 = -2147483648
  end

  enum SPWORDTYPE : Int32
    Ewordtype_added = 1
    Ewordtype_deleted = 2
  end

  enum SPPRONUNCIATIONFLAGS : Int32
    Epronflag_used = 1
  end

  enum SPSHORTCUTTYPE : Int32
    SPSHT_NotOverriden = -1
    SPSHT_Unknown = 0
    SPSHT_EMAIL = 4096
    SPSHT_OTHER = 8192
    SPPS_RESERVED1 = 12288
    SPPS_RESERVED2 = 16384
    SPPS_RESERVED3 = 20480
    SPPS_RESERVED4 = 61440
  end

  enum SPVACTIONS : Int32
    SPVA_Speak = 0
    SPVA_Silence = 1
    SPVA_Pronounce = 2
    SPVA_Bookmark = 3
    SPVA_SpellOut = 4
    SPVA_Section = 5
    SPVA_ParseUnknownTag = 6
  end

  enum SPRUNSTATE : Int32
    SPRS_DONE = 1
    SPRS_IS_SPEAKING = 2
  end

  enum SPVLIMITS : Int32
    SPMIN_VOLUME = 0
    SPMAX_VOLUME = 100
    SPMIN_RATE = -10
    SPMAX_RATE = 10
  end

  enum SPVPRIORITY : Int32
    SPVPRI_NORMAL = 0
    SPVPRI_ALERT = 1
    SPVPRI_OVER = 2
  end

  enum SPEAKFLAGS : Int32
    SPF_DEFAULT = 0
    SPF_ASYNC = 1
    SPF_PURGEBEFORESPEAK = 2
    SPF_IS_FILENAME = 4
    SPF_IS_XML = 8
    SPF_IS_NOT_XML = 16
    SPF_PERSIST_XML = 32
    SPF_NLP_SPEAK_PUNC = 64
    SPF_PARSE_SAPI = 128
    SPF_PARSE_SSML = 256
    SPF_PARSE_AUTODETECT = 0
    SPF_NLP_MASK = 64
    SPF_PARSE_MASK = 384
    SPF_VOICE_MASK = 511
    SPF_UNUSED_FLAGS = -512
  end

  enum SPXMLRESULTOPTIONS : Int32
    SPXRO_SML = 0
    SPXRO_Alternates_SML = 1
  end

  enum SPCOMMITFLAGS : Int32
    SPCF_NONE = 0
    SPCF_ADD_TO_USER_LEXICON = 1
    SPCF_DEFINITE_CORRECTION = 2
  end

  enum SPWORDPRONOUNCEABLE : Int32
    SPWP_UNKNOWN_WORD_UNPRONOUNCEABLE = 0
    SPWP_UNKNOWN_WORD_PRONOUNCEABLE = 1
    SPWP_KNOWN_WORD_PRONOUNCEABLE = 2
  end

  enum SPGRAMMARSTATE : Int32
    SPGS_DISABLED = 0
    SPGS_ENABLED = 1
    SPGS_EXCLUSIVE = 3
  end

  enum SPCONTEXTSTATE : Int32
    SPCS_DISABLED = 0
    SPCS_ENABLED = 1
  end

  enum SPRULESTATE : Int32
    SPRS_INACTIVE = 0
    SPRS_ACTIVE = 1
    SPRS_ACTIVE_WITH_AUTO_PAUSE = 3
    SPRS_ACTIVE_USER_DELIMITED = 4
  end

  enum SPGRAMMARWORDTYPE : Int32
    SPWT_DISPLAY = 0
    SPWT_LEXICAL = 1
    SPWT_PRONUNCIATION = 2
    SPWT_LEXICAL_NO_SPECIAL_CHARS = 3
  end

  enum SPCFGRULEATTRIBUTES : Int32
    SPRAF_TopLevel = 1
    SPRAF_Active = 2
    SPRAF_Export = 4
    SPRAF_Import = 8
    SPRAF_Interpreter = 16
    SPRAF_Dynamic = 32
    SPRAF_Root = 64
    SPRAF_AutoPause = 65536
    SPRAF_UserDelimited = 131072
  end

  enum SPLOADOPTIONS : Int32
    SPLO_STATIC = 0
    SPLO_DYNAMIC = 1
  end

  enum SPMATCHINGMODE : Int32
    AllWords = 0
    Subsequence = 1
    OrderedSubset = 3
    SubsequenceContentRequired = 5
    OrderedSubsetContentRequired = 7
  end

  enum PHONETICALPHABET : Int32
    PA_Ipa = 0
    PA_Ups = 1
    PA_Sapi = 2
  end

  enum SPBOOKMARKOPTIONS : Int32
    SPBO_NONE = 0
    SPBO_PAUSE = 1
    SPBO_AHEAD = 2
    SPBO_TIME_UNITS = 4
  end

  enum SPAUDIOOPTIONS : Int32
    SPAO_NONE = 0
    SPAO_RETAIN_AUDIO = 1
  end

  enum SPGRAMMAROPTIONS : Int32
    SPGO_SAPI = 1
    SPGO_SRGS = 2
    SPGO_UPS = 4
    SPGO_SRGS_MS_SCRIPT = 8
    SPGO_SRGS_W3C_SCRIPT = 256
    SPGO_SRGS_STG_SCRIPT = 512
    SPGO_SRGS_SCRIPT = 778
    SPGO_FILE = 16
    SPGO_HTTP = 32
    SPGO_RES = 64
    SPGO_OBJECT = 128
    SPGO_DEFAULT = 1019
    SPGO_ALL = 1023
  end

  enum SPADAPTATIONSETTINGS : Int32
    SPADS_Default = 0
    SPADS_CurrentRecognizer = 1
    SPADS_RecoProfile = 2
    SPADS_Immediate = 4
    SPADS_Reset = 8
    SPADS_HighVolumeDataSource = 16
  end

  enum SPADAPTATIONRELEVANCE : Int32
    SPAR_Unknown = 0
    SPAR_Low = 1
    SPAR_Medium = 2
    SPAR_High = 3
  end

  enum SPWAVEFORMATTYPE : Int32
    SPWF_INPUT = 0
    SPWF_SRENGINE = 1
  end

  enum SPRECOSTATE : Int32
    SPRST_INACTIVE = 0
    SPRST_ACTIVE = 1
    SPRST_ACTIVE_ALWAYS = 2
    SPRST_INACTIVE_WITH_PURGE = 3
    SPRST_NUM_STATES = 4
  end

  enum DISPID_SpeechDataKey : Int32
    DISPID_SDKSetBinaryValue = 1
    DISPID_SDKGetBinaryValue = 2
    DISPID_SDKSetStringValue = 3
    DISPID_SDKGetStringValue = 4
    DISPID_SDKSetLongValue = 5
    DISPID_SDKGetlongValue = 6
    DISPID_SDKOpenKey = 7
    DISPID_SDKCreateKey = 8
    DISPID_SDKDeleteKey = 9
    DISPID_SDKDeleteValue = 10
    DISPID_SDKEnumKeys = 11
    DISPID_SDKEnumValues = 12
  end

  enum DISPID_SpeechObjectToken : Int32
    DISPID_SOTId = 1
    DISPID_SOTDataKey = 2
    DISPID_SOTCategory = 3
    DISPID_SOTGetDescription = 4
    DISPID_SOTSetId = 5
    DISPID_SOTGetAttribute = 6
    DISPID_SOTCreateInstance = 7
    DISPID_SOTRemove = 8
    DISPID_SOTGetStorageFileName = 9
    DISPID_SOTRemoveStorageFileName = 10
    DISPID_SOTIsUISupported = 11
    DISPID_SOTDisplayUI = 12
    DISPID_SOTMatchesAttributes = 13
  end

  enum SpeechDataKeyLocation : Int32
    SDKLDefaultLocation = 0
    SDKLCurrentUser = 1
    SDKLLocalMachine = 2
    SDKLCurrentConfig = 5
  end

  enum SpeechTokenContext : UInt32
    STCInprocServer = 1
    STCInprocHandler = 2
    STCLocalServer = 4
    STCRemoteServer = 16
    STCAll = 23
  end

  enum SpeechTokenShellFolder : Int32
    STSF_AppData = 26
    STSF_LocalAppData = 28
    STSF_CommonAppData = 35
    STSF_FlagCreate = 32768
  end

  enum DISPID_SpeechObjectTokens : Int32
    DISPID_SOTsCount = 1
    DISPID_SOTsItem = 0
    DISPID_SOTs_NewEnum = -4
  end

  enum DISPID_SpeechObjectTokenCategory : Int32
    DISPID_SOTCId = 1
    DISPID_SOTCDefault = 2
    DISPID_SOTCSetId = 3
    DISPID_SOTCGetDataKey = 4
    DISPID_SOTCEnumerateTokens = 5
  end

  enum SpeechAudioFormatType : Int32
    SAFTDefault = -1
    SAFTNoAssignedFormat = 0
    SAFTText = 1
    SAFTNonStandardFormat = 2
    SAFTExtendedAudioFormat = 3
    SAFT8kHz8BitMono = 4
    SAFT8kHz8BitStereo = 5
    SAFT8kHz16BitMono = 6
    SAFT8kHz16BitStereo = 7
    SAFT11kHz8BitMono = 8
    SAFT11kHz8BitStereo = 9
    SAFT11kHz16BitMono = 10
    SAFT11kHz16BitStereo = 11
    SAFT12kHz8BitMono = 12
    SAFT12kHz8BitStereo = 13
    SAFT12kHz16BitMono = 14
    SAFT12kHz16BitStereo = 15
    SAFT16kHz8BitMono = 16
    SAFT16kHz8BitStereo = 17
    SAFT16kHz16BitMono = 18
    SAFT16kHz16BitStereo = 19
    SAFT22kHz8BitMono = 20
    SAFT22kHz8BitStereo = 21
    SAFT22kHz16BitMono = 22
    SAFT22kHz16BitStereo = 23
    SAFT24kHz8BitMono = 24
    SAFT24kHz8BitStereo = 25
    SAFT24kHz16BitMono = 26
    SAFT24kHz16BitStereo = 27
    SAFT32kHz8BitMono = 28
    SAFT32kHz8BitStereo = 29
    SAFT32kHz16BitMono = 30
    SAFT32kHz16BitStereo = 31
    SAFT44kHz8BitMono = 32
    SAFT44kHz8BitStereo = 33
    SAFT44kHz16BitMono = 34
    SAFT44kHz16BitStereo = 35
    SAFT48kHz8BitMono = 36
    SAFT48kHz8BitStereo = 37
    SAFT48kHz16BitMono = 38
    SAFT48kHz16BitStereo = 39
    SAFTTrueSpeech_8kHz1BitMono = 40
    SAFTCCITT_ALaw_8kHzMono = 41
    SAFTCCITT_ALaw_8kHzStereo = 42
    SAFTCCITT_ALaw_11kHzMono = 43
    SAFTCCITT_ALaw_11kHzStereo = 44
    SAFTCCITT_ALaw_22kHzMono = 45
    SAFTCCITT_ALaw_22kHzStereo = 46
    SAFTCCITT_ALaw_44kHzMono = 47
    SAFTCCITT_ALaw_44kHzStereo = 48
    SAFTCCITT_uLaw_8kHzMono = 49
    SAFTCCITT_uLaw_8kHzStereo = 50
    SAFTCCITT_uLaw_11kHzMono = 51
    SAFTCCITT_uLaw_11kHzStereo = 52
    SAFTCCITT_uLaw_22kHzMono = 53
    SAFTCCITT_uLaw_22kHzStereo = 54
    SAFTCCITT_uLaw_44kHzMono = 55
    SAFTCCITT_uLaw_44kHzStereo = 56
    SAFTADPCM_8kHzMono = 57
    SAFTADPCM_8kHzStereo = 58
    SAFTADPCM_11kHzMono = 59
    SAFTADPCM_11kHzStereo = 60
    SAFTADPCM_22kHzMono = 61
    SAFTADPCM_22kHzStereo = 62
    SAFTADPCM_44kHzMono = 63
    SAFTADPCM_44kHzStereo = 64
    SAFTGSM610_8kHzMono = 65
    SAFTGSM610_11kHzMono = 66
    SAFTGSM610_22kHzMono = 67
    SAFTGSM610_44kHzMono = 68
  end

  enum DISPID_SpeechAudioFormat : Int32
    DISPID_SAFType = 1
    DISPID_SAFGuid = 2
    DISPID_SAFGetWaveFormatEx = 3
    DISPID_SAFSetWaveFormatEx = 4
  end

  enum DISPID_SpeechBaseStream : Int32
    DISPID_SBSFormat = 1
    DISPID_SBSRead = 2
    DISPID_SBSWrite = 3
    DISPID_SBSSeek = 4
  end

  enum SpeechStreamSeekPositionType : UInt32
    SSSPTRelativeToStart = 0
    SSSPTRelativeToCurrentPosition = 1
    SSSPTRelativeToEnd = 2
  end

  enum DISPID_SpeechAudio : Int32
    DISPID_SAStatus = 200
    DISPID_SABufferInfo = 201
    DISPID_SADefaultFormat = 202
    DISPID_SAVolume = 203
    DISPID_SABufferNotifySize = 204
    DISPID_SAEventHandle = 205
    DISPID_SASetState = 206
  end

  enum SpeechAudioState : Int32
    SASClosed = 0
    SASStop = 1
    SASPause = 2
    SASRun = 3
  end

  enum DISPID_SpeechMMSysAudio : Int32
    DISPID_SMSADeviceId = 300
    DISPID_SMSALineId = 301
    DISPID_SMSAMMHandle = 302
  end

  enum DISPID_SpeechFileStream : Int32
    DISPID_SFSOpen = 100
    DISPID_SFSClose = 101
  end

  enum SpeechStreamFileMode : Int32
    SSFMOpenForRead = 0
    SSFMOpenReadWrite = 1
    SSFMCreate = 2
    SSFMCreateForWrite = 3
  end

  enum DISPID_SpeechCustomStream : Int32
    DISPID_SCSBaseStream = 100
  end

  enum DISPID_SpeechMemoryStream : Int32
    DISPID_SMSSetData = 100
    DISPID_SMSGetData = 101
  end

  enum DISPID_SpeechAudioStatus : Int32
    DISPID_SASFreeBufferSpace = 1
    DISPID_SASNonBlockingIO = 2
    DISPID_SASState = 3
    DISPID_SASCurrentSeekPosition = 4
    DISPID_SASCurrentDevicePosition = 5
  end

  enum DISPID_SpeechAudioBufferInfo : Int32
    DISPID_SABIMinNotification = 1
    DISPID_SABIBufferSize = 2
    DISPID_SABIEventBias = 3
  end

  enum DISPID_SpeechWaveFormatEx : Int32
    DISPID_SWFEFormatTag = 1
    DISPID_SWFEChannels = 2
    DISPID_SWFESamplesPerSec = 3
    DISPID_SWFEAvgBytesPerSec = 4
    DISPID_SWFEBlockAlign = 5
    DISPID_SWFEBitsPerSample = 6
    DISPID_SWFEExtraData = 7
  end

  enum DISPID_SpeechVoice : Int32
    DISPID_SVStatus = 1
    DISPID_SVVoice = 2
    DISPID_SVAudioOutput = 3
    DISPID_SVAudioOutputStream = 4
    DISPID_SVRate = 5
    DISPID_SVVolume = 6
    DISPID_SVAllowAudioOuputFormatChangesOnNextSet = 7
    DISPID_SVEventInterests = 8
    DISPID_SVPriority = 9
    DISPID_SVAlertBoundary = 10
    DISPID_SVSyncronousSpeakTimeout = 11
    DISPID_SVSpeak = 12
    DISPID_SVSpeakStream = 13
    DISPID_SVPause = 14
    DISPID_SVResume = 15
    DISPID_SVSkip = 16
    DISPID_SVGetVoices = 17
    DISPID_SVGetAudioOutputs = 18
    DISPID_SVWaitUntilDone = 19
    DISPID_SVSpeakCompleteEvent = 20
    DISPID_SVIsUISupported = 21
    DISPID_SVDisplayUI = 22
  end

  enum SpeechVoicePriority : Int32
    SVPNormal = 0
    SVPAlert = 1
    SVPOver = 2
  end

  enum SpeechVoiceSpeakFlags : Int32
    SVSFDefault = 0
    SVSFlagsAsync = 1
    SVSFPurgeBeforeSpeak = 2
    SVSFIsFilename = 4
    SVSFIsXML = 8
    SVSFIsNotXML = 16
    SVSFPersistXML = 32
    SVSFNLPSpeakPunc = 64
    SVSFParseSapi = 128
    SVSFParseSsml = 256
    SVSFParseAutodetect = 0
    SVSFNLPMask = 64
    SVSFParseMask = 384
    SVSFVoiceMask = 511
    SVSFUnusedFlags = -512
  end

  enum SpeechVoiceEvents : Int32
    SVEStartInputStream = 2
    SVEEndInputStream = 4
    SVEVoiceChange = 8
    SVEBookmark = 16
    SVEWordBoundary = 32
    SVEPhoneme = 64
    SVESentenceBoundary = 128
    SVEViseme = 256
    SVEAudioLevel = 512
    SVEPrivate = 32768
    SVEAllEvents = 33790
  end

  enum DISPID_SpeechVoiceStatus : Int32
    DISPID_SVSCurrentStreamNumber = 1
    DISPID_SVSLastStreamNumberQueued = 2
    DISPID_SVSLastResult = 3
    DISPID_SVSRunningState = 4
    DISPID_SVSInputWordPosition = 5
    DISPID_SVSInputWordLength = 6
    DISPID_SVSInputSentencePosition = 7
    DISPID_SVSInputSentenceLength = 8
    DISPID_SVSLastBookmark = 9
    DISPID_SVSLastBookmarkId = 10
    DISPID_SVSPhonemeId = 11
    DISPID_SVSVisemeId = 12
  end

  enum SpeechRunState : Int32
    SRSEDone = 1
    SRSEIsSpeaking = 2
  end

  enum SpeechVisemeType : Int32
    SVP_0 = 0
    SVP_1 = 1
    SVP_2 = 2
    SVP_3 = 3
    SVP_4 = 4
    SVP_5 = 5
    SVP_6 = 6
    SVP_7 = 7
    SVP_8 = 8
    SVP_9 = 9
    SVP_10 = 10
    SVP_11 = 11
    SVP_12 = 12
    SVP_13 = 13
    SVP_14 = 14
    SVP_15 = 15
    SVP_16 = 16
    SVP_17 = 17
    SVP_18 = 18
    SVP_19 = 19
    SVP_20 = 20
    SVP_21 = 21
  end

  enum SpeechVisemeFeature : Int32
    SVF_None = 0
    SVF_Stressed = 1
    SVF_Emphasis = 2
  end

  enum DISPID_SpeechVoiceEvent : Int32
    DISPID_SVEStreamStart = 1
    DISPID_SVEStreamEnd = 2
    DISPID_SVEVoiceChange = 3
    DISPID_SVEBookmark = 4
    DISPID_SVEWord = 5
    DISPID_SVEPhoneme = 6
    DISPID_SVESentenceBoundary = 7
    DISPID_SVEViseme = 8
    DISPID_SVEAudioLevel = 9
    DISPID_SVEEnginePrivate = 10
  end

  enum DISPID_SpeechRecognizer : Int32
    DISPID_SRRecognizer = 1
    DISPID_SRAllowAudioInputFormatChangesOnNextSet = 2
    DISPID_SRAudioInput = 3
    DISPID_SRAudioInputStream = 4
    DISPID_SRIsShared = 5
    DISPID_SRState = 6
    DISPID_SRStatus = 7
    DISPID_SRProfile = 8
    DISPID_SREmulateRecognition = 9
    DISPID_SRCreateRecoContext = 10
    DISPID_SRGetFormat = 11
    DISPID_SRSetPropertyNumber = 12
    DISPID_SRGetPropertyNumber = 13
    DISPID_SRSetPropertyString = 14
    DISPID_SRGetPropertyString = 15
    DISPID_SRIsUISupported = 16
    DISPID_SRDisplayUI = 17
    DISPID_SRGetRecognizers = 18
    DISPID_SVGetAudioInputs = 19
    DISPID_SVGetProfiles = 20
  end

  enum SpeechRecognizerState : Int32
    SRSInactive = 0
    SRSActive = 1
    SRSActiveAlways = 2
    SRSInactiveWithPurge = 3
  end

  enum SpeechDisplayAttributes : Int32
    SDA_No_Trailing_Space = 0
    SDA_One_Trailing_Space = 2
    SDA_Two_Trailing_Spaces = 4
    SDA_Consume_Leading_Spaces = 8
  end

  enum SpeechFormatType : Int32
    SFTInput = 0
    SFTSREngine = 1
  end

  enum SpeechEmulationCompareFlags : Int32
    SECFIgnoreCase = 1
    SECFIgnoreKanaType = 65536
    SECFIgnoreWidth = 131072
    SECFNoSpecialChars = 536870912
    SECFEmulateResult = 1073741824
    SECFDefault = 196609
  end

  enum DISPID_SpeechRecognizerStatus : Int32
    DISPID_SRSAudioStatus = 1
    DISPID_SRSCurrentStreamPosition = 2
    DISPID_SRSCurrentStreamNumber = 3
    DISPID_SRSNumberOfActiveRules = 4
    DISPID_SRSClsidEngine = 5
    DISPID_SRSSupportedLanguages = 6
  end

  enum DISPID_SpeechRecoContext : Int32
    DISPID_SRCRecognizer = 1
    DISPID_SRCAudioInInterferenceStatus = 2
    DISPID_SRCRequestedUIType = 3
    DISPID_SRCVoice = 4
    DISPID_SRAllowVoiceFormatMatchingOnNextSet = 5
    DISPID_SRCVoicePurgeEvent = 6
    DISPID_SRCEventInterests = 7
    DISPID_SRCCmdMaxAlternates = 8
    DISPID_SRCState = 9
    DISPID_SRCRetainedAudio = 10
    DISPID_SRCRetainedAudioFormat = 11
    DISPID_SRCPause = 12
    DISPID_SRCResume = 13
    DISPID_SRCCreateGrammar = 14
    DISPID_SRCCreateResultFromMemory = 15
    DISPID_SRCBookmark = 16
    DISPID_SRCSetAdaptationData = 17
  end

  enum SpeechRetainedAudioOptions : Int32
    SRAONone = 0
    SRAORetainAudio = 1
  end

  enum SpeechBookmarkOptions : Int32
    SBONone = 0
    SBOPause = 1
  end

  enum SpeechInterference : Int32
    SINone = 0
    SINoise = 1
    SINoSignal = 2
    SITooLoud = 3
    SITooQuiet = 4
    SITooFast = 5
    SITooSlow = 6
  end

  enum SpeechRecoEvents : Int32
    SREStreamEnd = 1
    SRESoundStart = 2
    SRESoundEnd = 4
    SREPhraseStart = 8
    SRERecognition = 16
    SREHypothesis = 32
    SREBookmark = 64
    SREPropertyNumChange = 128
    SREPropertyStringChange = 256
    SREFalseRecognition = 512
    SREInterference = 1024
    SRERequestUI = 2048
    SREStateChange = 4096
    SREAdaptation = 8192
    SREStreamStart = 16384
    SRERecoOtherContext = 32768
    SREAudioLevel = 65536
    SREPrivate = 262144
    SREAllEvents = 393215
  end

  enum SpeechRecoContextState : Int32
    SRCS_Disabled = 0
    SRCS_Enabled = 1
  end

  enum DISPIDSPRG : Int32
    DISPID_SRGId = 1
    DISPID_SRGRecoContext = 2
    DISPID_SRGState = 3
    DISPID_SRGRules = 4
    DISPID_SRGReset = 5
    DISPID_SRGCommit = 6
    DISPID_SRGCmdLoadFromFile = 7
    DISPID_SRGCmdLoadFromObject = 8
    DISPID_SRGCmdLoadFromResource = 9
    DISPID_SRGCmdLoadFromMemory = 10
    DISPID_SRGCmdLoadFromProprietaryGrammar = 11
    DISPID_SRGCmdSetRuleState = 12
    DISPID_SRGCmdSetRuleIdState = 13
    DISPID_SRGDictationLoad = 14
    DISPID_SRGDictationUnload = 15
    DISPID_SRGDictationSetState = 16
    DISPID_SRGSetWordSequenceData = 17
    DISPID_SRGSetTextSelection = 18
    DISPID_SRGIsPronounceable = 19
  end

  enum SpeechLoadOption : Int32
    SLOStatic = 0
    SLODynamic = 1
  end

  enum SpeechWordPronounceable : Int32
    SWPUnknownWordUnpronounceable = 0
    SWPUnknownWordPronounceable = 1
    SWPKnownWordPronounceable = 2
  end

  enum SpeechGrammarState : Int32
    SGSEnabled = 1
    SGSDisabled = 0
    SGSExclusive = 3
  end

  enum SpeechRuleState : Int32
    SGDSInactive = 0
    SGDSActive = 1
    SGDSActiveWithAutoPause = 3
    SGDSActiveUserDelimited = 4
  end

  enum SpeechRuleAttributes : Int32
    SRATopLevel = 1
    SRADefaultToActive = 2
    SRAExport = 4
    SRAImport = 8
    SRAInterpreter = 16
    SRADynamic = 32
    SRARoot = 64
  end

  enum SpeechGrammarWordType : Int32
    SGDisplay = 0
    SGLexical = 1
    SGPronounciation = 2
    SGLexicalNoSpecialChars = 3
  end

  enum DISPID_SpeechRecoContextEvents : Int32
    DISPID_SRCEStartStream = 1
    DISPID_SRCEEndStream = 2
    DISPID_SRCEBookmark = 3
    DISPID_SRCESoundStart = 4
    DISPID_SRCESoundEnd = 5
    DISPID_SRCEPhraseStart = 6
    DISPID_SRCERecognition = 7
    DISPID_SRCEHypothesis = 8
    DISPID_SRCEPropertyNumberChange = 9
    DISPID_SRCEPropertyStringChange = 10
    DISPID_SRCEFalseRecognition = 11
    DISPID_SRCEInterference = 12
    DISPID_SRCERequestUI = 13
    DISPID_SRCERecognizerStateChange = 14
    DISPID_SRCEAdaptation = 15
    DISPID_SRCERecognitionForOtherContext = 16
    DISPID_SRCEAudioLevel = 17
    DISPID_SRCEEnginePrivate = 18
  end

  enum SpeechRecognitionType : Int32
    SRTStandard = 0
    SRTAutopause = 1
    SRTEmulated = 2
    SRTSMLTimeout = 4
    SRTExtendableParse = 8
    SRTReSent = 16
  end

  enum DISPID_SpeechGrammarRule : Int32
    DISPID_SGRAttributes = 1
    DISPID_SGRInitialState = 2
    DISPID_SGRName = 3
    DISPID_SGRId = 4
    DISPID_SGRClear = 5
    DISPID_SGRAddResource = 6
    DISPID_SGRAddState = 7
  end

  enum DISPID_SpeechGrammarRules : Int32
    DISPID_SGRsCount = 1
    DISPID_SGRsDynamic = 2
    DISPID_SGRsAdd = 3
    DISPID_SGRsCommit = 4
    DISPID_SGRsCommitAndSave = 5
    DISPID_SGRsFindRule = 6
    DISPID_SGRsItem = 0
    DISPID_SGRs_NewEnum = -4
  end

  enum DISPID_SpeechGrammarRuleState : Int32
    DISPID_SGRSRule = 1
    DISPID_SGRSTransitions = 2
    DISPID_SGRSAddWordTransition = 3
    DISPID_SGRSAddRuleTransition = 4
    DISPID_SGRSAddSpecialTransition = 5
  end

  enum SpeechSpecialTransitionType : Int32
    SSTTWildcard = 1
    SSTTDictation = 2
    SSTTTextBuffer = 3
  end

  enum DISPID_SpeechGrammarRuleStateTransitions : Int32
    DISPID_SGRSTsCount = 1
    DISPID_SGRSTsItem = 0
    DISPID_SGRSTs_NewEnum = -4
  end

  enum DISPID_SpeechGrammarRuleStateTransition : Int32
    DISPID_SGRSTType = 1
    DISPID_SGRSTText = 2
    DISPID_SGRSTRule = 3
    DISPID_SGRSTWeight = 4
    DISPID_SGRSTPropertyName = 5
    DISPID_SGRSTPropertyId = 6
    DISPID_SGRSTPropertyValue = 7
    DISPID_SGRSTNextState = 8
  end

  enum SpeechGrammarRuleStateTransitionType : Int32
    SGRSTTEpsilon = 0
    SGRSTTWord = 1
    SGRSTTRule = 2
    SGRSTTDictation = 3
    SGRSTTWildcard = 4
    SGRSTTTextBuffer = 5
  end

  enum DISPIDSPTSI : Int32
    DISPIDSPTSI_ActiveOffset = 1
    DISPIDSPTSI_ActiveLength = 2
    DISPIDSPTSI_SelectionOffset = 3
    DISPIDSPTSI_SelectionLength = 4
  end

  enum DISPID_SpeechRecoResult : Int32
    DISPID_SRRRecoContext = 1
    DISPID_SRRTimes = 2
    DISPID_SRRAudioFormat = 3
    DISPID_SRRPhraseInfo = 4
    DISPID_SRRAlternates = 5
    DISPID_SRRAudio = 6
    DISPID_SRRSpeakAudio = 7
    DISPID_SRRSaveToMemory = 8
    DISPID_SRRDiscardResultInfo = 9
  end

  enum SpeechDiscardType : Int32
    SDTProperty = 1
    SDTReplacement = 2
    SDTRule = 4
    SDTDisplayText = 8
    SDTLexicalForm = 16
    SDTPronunciation = 32
    SDTAudio = 64
    SDTAlternates = 128
    SDTAll = 255
  end

  enum DISPID_SpeechXMLRecoResult : Int32
    DISPID_SRRGetXMLResult = 10
    DISPID_SRRGetXMLErrorInfo = 11
  end

  enum DISPID_SpeechRecoResult2 : Int32
    DISPID_SRRSetTextFeedback = 12
  end

  enum DISPID_SpeechPhraseBuilder : Int32
    DISPID_SPPBRestorePhraseFromMemory = 1
  end

  enum DISPID_SpeechRecoResultTimes : Int32
    DISPID_SRRTStreamTime = 1
    DISPID_SRRTLength = 2
    DISPID_SRRTTickCount = 3
    DISPID_SRRTOffsetFromStart = 4
  end

  enum DISPID_SpeechPhraseAlternate : Int32
    DISPID_SPARecoResult = 1
    DISPID_SPAStartElementInResult = 2
    DISPID_SPANumberOfElementsInResult = 3
    DISPID_SPAPhraseInfo = 4
    DISPID_SPACommit = 5
  end

  enum DISPID_SpeechPhraseAlternates : Int32
    DISPID_SPAsCount = 1
    DISPID_SPAsItem = 0
    DISPID_SPAs_NewEnum = -4
  end

  enum DISPID_SpeechPhraseInfo : Int32
    DISPID_SPILanguageId = 1
    DISPID_SPIGrammarId = 2
    DISPID_SPIStartTime = 3
    DISPID_SPIAudioStreamPosition = 4
    DISPID_SPIAudioSizeBytes = 5
    DISPID_SPIRetainedSizeBytes = 6
    DISPID_SPIAudioSizeTime = 7
    DISPID_SPIRule = 8
    DISPID_SPIProperties = 9
    DISPID_SPIElements = 10
    DISPID_SPIReplacements = 11
    DISPID_SPIEngineId = 12
    DISPID_SPIEnginePrivateData = 13
    DISPID_SPISaveToMemory = 14
    DISPID_SPIGetText = 15
    DISPID_SPIGetDisplayAttributes = 16
  end

  enum DISPID_SpeechPhraseElement : Int32
    DISPID_SPEAudioTimeOffset = 1
    DISPID_SPEAudioSizeTime = 2
    DISPID_SPEAudioStreamOffset = 3
    DISPID_SPEAudioSizeBytes = 4
    DISPID_SPERetainedStreamOffset = 5
    DISPID_SPERetainedSizeBytes = 6
    DISPID_SPEDisplayText = 7
    DISPID_SPELexicalForm = 8
    DISPID_SPEPronunciation = 9
    DISPID_SPEDisplayAttributes = 10
    DISPID_SPERequiredConfidence = 11
    DISPID_SPEActualConfidence = 12
    DISPID_SPEEngineConfidence = 13
  end

  enum SpeechEngineConfidence : Int32
    SECLowConfidence = -1
    SECNormalConfidence = 0
    SECHighConfidence = 1
  end

  enum DISPID_SpeechPhraseElements : Int32
    DISPID_SPEsCount = 1
    DISPID_SPEsItem = 0
    DISPID_SPEs_NewEnum = -4
  end

  enum DISPID_SpeechPhraseReplacement : Int32
    DISPID_SPRDisplayAttributes = 1
    DISPID_SPRText = 2
    DISPID_SPRFirstElement = 3
    DISPID_SPRNumberOfElements = 4
  end

  enum DISPID_SpeechPhraseReplacements : Int32
    DISPID_SPRsCount = 1
    DISPID_SPRsItem = 0
    DISPID_SPRs_NewEnum = -4
  end

  enum DISPID_SpeechPhraseProperty : Int32
    DISPID_SPPName = 1
    DISPID_SPPId = 2
    DISPID_SPPValue = 3
    DISPID_SPPFirstElement = 4
    DISPID_SPPNumberOfElements = 5
    DISPID_SPPEngineConfidence = 6
    DISPID_SPPConfidence = 7
    DISPID_SPPParent = 8
    DISPID_SPPChildren = 9
  end

  enum DISPID_SpeechPhraseProperties : Int32
    DISPID_SPPsCount = 1
    DISPID_SPPsItem = 0
    DISPID_SPPs_NewEnum = -4
  end

  enum DISPID_SpeechPhraseRule : Int32
    DISPID_SPRuleName = 1
    DISPID_SPRuleId = 2
    DISPID_SPRuleFirstElement = 3
    DISPID_SPRuleNumberOfElements = 4
    DISPID_SPRuleParent = 5
    DISPID_SPRuleChildren = 6
    DISPID_SPRuleConfidence = 7
    DISPID_SPRuleEngineConfidence = 8
  end

  enum DISPID_SpeechPhraseRules : Int32
    DISPID_SPRulesCount = 1
    DISPID_SPRulesItem = 0
    DISPID_SPRules_NewEnum = -4
  end

  enum DISPID_SpeechLexicon : Int32
    DISPID_SLGenerationId = 1
    DISPID_SLGetWords = 2
    DISPID_SLAddPronunciation = 3
    DISPID_SLAddPronunciationByPhoneIds = 4
    DISPID_SLRemovePronunciation = 5
    DISPID_SLRemovePronunciationByPhoneIds = 6
    DISPID_SLGetPronunciations = 7
    DISPID_SLGetGenerationChange = 8
  end

  enum SpeechLexiconType : Int32
    SLTUser = 1
    SLTApp = 2
  end

  enum SpeechPartOfSpeech : Int32
    SPSNotOverriden = -1
    SPSUnknown = 0
    SPSNoun = 4096
    SPSVerb = 8192
    SPSModifier = 12288
    SPSFunction = 16384
    SPSInterjection = 20480
    SPSLMA = 28672
    SPSSuppressWord = 61440
  end

  enum DISPID_SpeechLexiconWords : Int32
    DISPID_SLWsCount = 1
    DISPID_SLWsItem = 0
    DISPID_SLWs_NewEnum = -4
  end

  enum SpeechWordType : Int32
    SWTAdded = 1
    SWTDeleted = 2
  end

  enum DISPID_SpeechLexiconWord : Int32
    DISPID_SLWLangId = 1
    DISPID_SLWType = 2
    DISPID_SLWWord = 3
    DISPID_SLWPronunciations = 4
  end

  enum DISPID_SpeechLexiconProns : Int32
    DISPID_SLPsCount = 1
    DISPID_SLPsItem = 0
    DISPID_SLPs_NewEnum = -4
  end

  enum DISPID_SpeechLexiconPronunciation : Int32
    DISPID_SLPType = 1
    DISPID_SLPLangId = 2
    DISPID_SLPPartOfSpeech = 3
    DISPID_SLPPhoneIds = 4
    DISPID_SLPSymbolic = 5
  end

  enum DISPID_SpeechPhoneConverter : Int32
    DISPID_SPCLangId = 1
    DISPID_SPCPhoneToId = 2
    DISPID_SPCIdToPhone = 3
  end

  union SPPHRASEPROPERTY_Anonymous_e__Union
    ul_id : UInt32
    anonymous : SPPHRASEPROPERTY_Anonymous_e__Union_Anonymous_e__Struct
  end

  struct SPEVENT
    _bitfield : Int32
    ul_stream_num : UInt32
    ull_audio_stream_offset : UInt64
    w_param : LibC::UINT_PTR
    l_param : LPARAM
  end
  struct SPSERIALIZEDEVENT
    _bitfield : Int32
    ul_stream_num : UInt32
    ull_audio_stream_offset : UInt64
    serializedw_param : UInt32
    serializedl_param : Int32
  end
  struct SPSERIALIZEDEVENT64
    _bitfield : Int32
    ul_stream_num : UInt32
    ull_audio_stream_offset : UInt64
    serializedw_param : UInt64
    serializedl_param : Int64
  end
  struct SPEVENTEX
    _bitfield : Int32
    ul_stream_num : UInt32
    ull_audio_stream_offset : UInt64
    w_param : LibC::UINT_PTR
    l_param : LPARAM
    ull_audio_time_offset : UInt64
  end
  struct SPEVENTSOURCEINFO
    ull_event_interest : UInt64
    ull_queued_interest : UInt64
    ul_count : UInt32
  end
  struct SPAUDIOSTATUS
    cb_free_buff_space : Int32
    cb_non_blocking_io : UInt32
    state : SPAUDIOSTATE
    cur_seek_pos : UInt64
    cur_device_pos : UInt64
    dw_audio_level : UInt32
    dw_reserved2 : UInt32
  end
  struct SPAUDIOBUFFERINFO
    ul_ms_min_notification : UInt32
    ul_ms_buffer_size : UInt32
    ul_ms_event_bias : UInt32
  end
  struct SPPHRASEELEMENT
    ul_audio_time_offset : UInt32
    ul_audio_size_time : UInt32
    ul_audio_stream_offset : UInt32
    ul_audio_size_bytes : UInt32
    ul_retained_stream_offset : UInt32
    ul_retained_size_bytes : UInt32
    psz_display_text : LibC::LPWSTR
    psz_lexical_form : LibC::LPWSTR
    psz_pronunciation : UInt16*
    b_display_attributes : UInt8
    required_confidence : Int8
    actual_confidence : Int8
    reserved : UInt8
    sr_engine_confidence : Float32
  end
  struct SPPHRASERULE
    psz_name : LibC::LPWSTR
    ul_id : UInt32
    ul_first_element : UInt32
    ul_count_of_elements : UInt32
    p_next_sibling : SPPHRASERULE*
    p_first_child : SPPHRASERULE*
    sr_engine_confidence : Float32
    confidence : Int8
  end
  struct SPPHRASEPROPERTY
    psz_name : LibC::LPWSTR
    anonymous : SPPHRASEPROPERTY_Anonymous_e__Union
    psz_value : LibC::LPWSTR
    v_value : VARIANT
    ul_first_element : UInt32
    ul_count_of_elements : UInt32
    p_next_sibling : SPPHRASEPROPERTY*
    p_first_child : SPPHRASEPROPERTY*
    sr_engine_confidence : Float32
    confidence : Int8
  end
  struct SPPHRASEPROPERTY_Anonymous_e__Union_Anonymous_e__Struct
    b_type : UInt8
    b_reserved : UInt8
    us_array_index : UInt16
  end
  struct SPPHRASEREPLACEMENT
    b_display_attributes : UInt8
    psz_replacement_text : LibC::LPWSTR
    ul_first_element : UInt32
    ul_count_of_elements : UInt32
  end
  struct SPSEMANTICERRORINFO
    ul_line_number : UInt32
    psz_script_line : LibC::LPWSTR
    psz_source : LibC::LPWSTR
    psz_description : LibC::LPWSTR
    hr_result_code : HRESULT
  end
  struct SPPHRASE_50
    cb_size : UInt32
    lang_id : UInt16
    w_homophone_group_id : UInt16
    ull_grammar_id : UInt64
    ft_start_time : UInt64
    ull_audio_stream_position : UInt64
    ul_audio_size_bytes : UInt32
    ul_retained_size_bytes : UInt32
    ul_audio_size_time : UInt32
    rule : SPPHRASERULE
    p_properties : SPPHRASEPROPERTY*
    p_elements : SPPHRASEELEMENT*
    c_replacements : UInt32
    p_replacements : SPPHRASEREPLACEMENT*
    sr_engine_id : Guid
    ul_sr_engine_private_data_size : UInt32
    p_sr_engine_private_data : UInt8*
  end
  struct SPPHRASE
    __anonymous_base_sapi53_l5821_c34 : SPPHRASE_50
    p_sml : LibC::LPWSTR
    p_semantic_error_info : SPSEMANTICERRORINFO*
  end
  struct SPSERIALIZEDPHRASE
    ul_serialized_size : UInt32
  end
  struct SPRULE
    psz_rule_name : LibC::LPWSTR
    ul_rule_id : UInt32
    dw_attributes : UInt32
  end
  struct SPBINARYGRAMMAR
    ul_total_serialized_size : UInt32
  end
  struct SPSTATEHANDLE__
    unused : Int32
  end
  struct SPWORDPRONUNCIATION
    p_next_word_pronunciation : SPWORDPRONUNCIATION*
    e_lexicon_type : SPLEXICONTYPE
    lang_id : UInt16
    w_pronunciation_flags : UInt16
    e_part_of_speech : SPPARTOFSPEECH
    sz_pronunciation : UInt16[0]*
  end
  struct SPWORDPRONUNCIATIONLIST
    ul_size : UInt32
    pv_buffer : UInt8*
    p_first_word_pronunciation : SPWORDPRONUNCIATION*
  end
  struct SPWORD
    p_next_word : SPWORD*
    lang_id : UInt16
    w_reserved : UInt16
    e_word_type : SPWORDTYPE
    psz_word : LibC::LPWSTR
    p_first_word_pronunciation : SPWORDPRONUNCIATION*
  end
  struct SPWORDLIST
    ul_size : UInt32
    pv_buffer : UInt8*
    p_first_word : SPWORD*
  end
  struct SPSHORTCUTPAIR
    p_next_shortcutpair : SPSHORTCUTPAIR*
    lang_id : UInt16
    sh_type : SPSHORTCUTTYPE
    psz_display : LibC::LPWSTR
    psz_spoken : LibC::LPWSTR
  end
  struct SPSHORTCUTPAIRLIST
    ul_size : UInt32
    pv_buffer : UInt8*
    p_first_shortcut_pair : SPSHORTCUTPAIR*
  end
  struct SPVPITCH
    middle_adj : Int32
    range_adj : Int32
  end
  struct SPVCONTEXT
    p_category : LibC::LPWSTR
    p_before : LibC::LPWSTR
    p_after : LibC::LPWSTR
  end
  struct SPVSTATE
    e_action : SPVACTIONS
    lang_id : UInt16
    w_reserved : UInt16
    emph_adj : Int32
    rate_adj : Int32
    volume : UInt32
    pitch_adj : SPVPITCH
    silence_m_secs : UInt32
    p_phone_ids : UInt16*
    e_part_of_speech : SPPARTOFSPEECH
    context : SPVCONTEXT
  end
  struct SPVOICESTATUS
    ul_current_stream : UInt32
    ul_last_stream_queued : UInt32
    hr_last_result : HRESULT
    dw_running_state : UInt32
    ul_input_word_pos : UInt32
    ul_input_word_len : UInt32
    ul_input_sent_pos : UInt32
    ul_input_sent_len : UInt32
    l_bookmark_id : Int32
    phoneme_id : UInt16
    viseme_id : SPVISEMES
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
  end
  struct SPRECORESULTTIMES
    ft_stream_time : FILETIME
    ull_length : UInt64
    dw_tick_count : UInt32
    ull_start : UInt64
  end
  struct SPSERIALIZEDRESULT
    ul_serialized_size : UInt32
  end
  struct SPTEXTSELECTIONINFO
    ul_start_active_offset : UInt32
    cch_active_chars : UInt32
    ul_start_selection : UInt32
    cch_selection : UInt32
  end
  struct SPPROPERTYINFO
    psz_name : LibC::LPWSTR
    ul_id : UInt32
    psz_value : LibC::LPWSTR
    v_value : VARIANT
  end
  struct SPRECOCONTEXTSTATUS
    e_interference : SPINTERFERENCE
    sz_request_type_of_ui : Char[255]*
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
  end
  struct SPRECOGNIZERSTATUS
    audio_status : SPAUDIOSTATUS
    ull_recognition_stream_pos : UInt64
    ul_stream_number : UInt32
    ul_num_active : UInt32
    clsid_engine : Guid
    c_lang_i_ds : UInt32
    a_lang_id : UInt16[20]*
    ull_recognition_stream_time : UInt64
  end
  struct SPNORMALIZATIONLIST
    ul_size : UInt32
    ppszz_normalized_list : UInt16**
  end
  struct SPDISPLAYTOKEN
    psz_lexical : LibC::LPWSTR
    psz_display : LibC::LPWSTR
    b_display_attributes : UInt8
  end
  struct SPDISPLAYPHRASE
    ul_num_tokens : UInt32
    p_tokens : SPDISPLAYTOKEN*
  end


  struct ISpNotifyCallbackVTbl
    notify_callback : Proc(ISpNotifyCallback*, LibC::UINT_PTR, LPARAM, HRESULT)
  end

  struct ISpNotifyCallback
    lpVtbl : ISpNotifyCallbackVTbl*
  end

  struct ISpNotifySourceVTbl
    query_interface : Proc(ISpNotifySource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpNotifySource*, UInt32)
    release : Proc(ISpNotifySource*, UInt32)
    set_notify_sink : Proc(ISpNotifySource*, ISpNotifySink, HRESULT)
    set_notify_window_message : Proc(ISpNotifySource*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_function : Proc(ISpNotifySource*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_interface : Proc(ISpNotifySource*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_win32_event : Proc(ISpNotifySource*, HRESULT)
    wait_for_notify_event : Proc(ISpNotifySource*, UInt32, HRESULT)
    get_notify_event_handle : Proc(ISpNotifySource*, LibC::HANDLE)
  end

  ISpNotifySource_GUID = LibC::GUID.new("5eff4aef-8487-11d2-961c-00c04f8ee628")
  CLSID_ISpNotifySource = "5eff4aef-8487-11d2-961c-00c04f8ee628"
  struct ISpNotifySource
    lpVtbl : ISpNotifySourceVTbl*
  end

  struct ISpNotifySinkVTbl
    query_interface : Proc(ISpNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpNotifySink*, UInt32)
    release : Proc(ISpNotifySink*, UInt32)
    notify : Proc(ISpNotifySink*, HRESULT)
  end

  ISpNotifySink_GUID = LibC::GUID.new("259684dc-37c3-11d2-9603-00c04f8ee628")
  CLSID_ISpNotifySink = "259684dc-37c3-11d2-9603-00c04f8ee628"
  struct ISpNotifySink
    lpVtbl : ISpNotifySinkVTbl*
  end

  struct ISpNotifyTranslatorVTbl
    query_interface : Proc(ISpNotifyTranslator*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpNotifyTranslator*, UInt32)
    release : Proc(ISpNotifyTranslator*, UInt32)
    notify : Proc(ISpNotifyTranslator*, HRESULT)
    init_window_message : Proc(ISpNotifyTranslator*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    init_callback : Proc(ISpNotifyTranslator*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    init_sp_notify_callback : Proc(ISpNotifyTranslator*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    init_win32_event : Proc(ISpNotifyTranslator*, LibC::HANDLE, LibC::BOOL, HRESULT)
    wait : Proc(ISpNotifyTranslator*, UInt32, HRESULT)
    get_event_handle : Proc(ISpNotifyTranslator*, LibC::HANDLE)
  end

  ISpNotifyTranslator_GUID = LibC::GUID.new("aca16614-5d3d-11d2-960e-00c04f8ee628")
  CLSID_ISpNotifyTranslator = "aca16614-5d3d-11d2-960e-00c04f8ee628"
  struct ISpNotifyTranslator
    lpVtbl : ISpNotifyTranslatorVTbl*
  end

  struct ISpDataKeyVTbl
    query_interface : Proc(ISpDataKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpDataKey*, UInt32)
    release : Proc(ISpDataKey*, UInt32)
    set_data : Proc(ISpDataKey*, LibC::LPWSTR, UInt32, UInt8*, HRESULT)
    get_data : Proc(ISpDataKey*, LibC::LPWSTR, UInt32*, UInt8*, HRESULT)
    set_string_value : Proc(ISpDataKey*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(ISpDataKey*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_dword : Proc(ISpDataKey*, LibC::LPWSTR, UInt32, HRESULT)
    get_dword : Proc(ISpDataKey*, LibC::LPWSTR, UInt32*, HRESULT)
    open_key : Proc(ISpDataKey*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    create_key : Proc(ISpDataKey*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    delete_key : Proc(ISpDataKey*, LibC::LPWSTR, HRESULT)
    delete_value : Proc(ISpDataKey*, LibC::LPWSTR, HRESULT)
    enum_keys : Proc(ISpDataKey*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_values : Proc(ISpDataKey*, UInt32, LibC::LPWSTR*, HRESULT)
  end

  ISpDataKey_GUID = LibC::GUID.new("14056581-e16c-11d2-bb90-00c04f8ee6c0")
  CLSID_ISpDataKey = "14056581-e16c-11d2-bb90-00c04f8ee6c0"
  struct ISpDataKey
    lpVtbl : ISpDataKeyVTbl*
  end

  struct ISpRegDataKeyVTbl
    query_interface : Proc(ISpRegDataKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRegDataKey*, UInt32)
    release : Proc(ISpRegDataKey*, UInt32)
    set_data : Proc(ISpRegDataKey*, LibC::LPWSTR, UInt32, UInt8*, HRESULT)
    get_data : Proc(ISpRegDataKey*, LibC::LPWSTR, UInt32*, UInt8*, HRESULT)
    set_string_value : Proc(ISpRegDataKey*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(ISpRegDataKey*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_dword : Proc(ISpRegDataKey*, LibC::LPWSTR, UInt32, HRESULT)
    get_dword : Proc(ISpRegDataKey*, LibC::LPWSTR, UInt32*, HRESULT)
    open_key : Proc(ISpRegDataKey*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    create_key : Proc(ISpRegDataKey*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    delete_key : Proc(ISpRegDataKey*, LibC::LPWSTR, HRESULT)
    delete_value : Proc(ISpRegDataKey*, LibC::LPWSTR, HRESULT)
    enum_keys : Proc(ISpRegDataKey*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_values : Proc(ISpRegDataKey*, UInt32, LibC::LPWSTR*, HRESULT)
    set_key : Proc(ISpRegDataKey*, HKEY, LibC::BOOL, HRESULT)
  end

  ISpRegDataKey_GUID = LibC::GUID.new("92a66e2b-c830-4149-83df-6fc2ba1e7a5b")
  CLSID_ISpRegDataKey = "92a66e2b-c830-4149-83df-6fc2ba1e7a5b"
  struct ISpRegDataKey
    lpVtbl : ISpRegDataKeyVTbl*
  end

  struct ISpObjectTokenCategoryVTbl
    query_interface : Proc(ISpObjectTokenCategory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpObjectTokenCategory*, UInt32)
    release : Proc(ISpObjectTokenCategory*, UInt32)
    set_data : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, UInt32, UInt8*, HRESULT)
    get_data : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, UInt32*, UInt8*, HRESULT)
    set_string_value : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_dword : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, UInt32, HRESULT)
    get_dword : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, UInt32*, HRESULT)
    open_key : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    create_key : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    delete_key : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, HRESULT)
    delete_value : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, HRESULT)
    enum_keys : Proc(ISpObjectTokenCategory*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_values : Proc(ISpObjectTokenCategory*, UInt32, LibC::LPWSTR*, HRESULT)
    set_id : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_id : Proc(ISpObjectTokenCategory*, LibC::LPWSTR*, HRESULT)
    get_data_key : Proc(ISpObjectTokenCategory*, SPDATAKEYLOCATION, ISpDataKey*, HRESULT)
    enum_tokens : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, LibC::LPWSTR, IEnumSpObjectTokens*, HRESULT)
    set_default_token_id : Proc(ISpObjectTokenCategory*, LibC::LPWSTR, HRESULT)
    get_default_token_id : Proc(ISpObjectTokenCategory*, LibC::LPWSTR*, HRESULT)
  end

  ISpObjectTokenCategory_GUID = LibC::GUID.new("2d3d3845-39af-4850-bbf9-40b49780011d")
  CLSID_ISpObjectTokenCategory = "2d3d3845-39af-4850-bbf9-40b49780011d"
  struct ISpObjectTokenCategory
    lpVtbl : ISpObjectTokenCategoryVTbl*
  end

  struct ISpObjectTokenVTbl
    query_interface : Proc(ISpObjectToken*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpObjectToken*, UInt32)
    release : Proc(ISpObjectToken*, UInt32)
    set_data : Proc(ISpObjectToken*, LibC::LPWSTR, UInt32, UInt8*, HRESULT)
    get_data : Proc(ISpObjectToken*, LibC::LPWSTR, UInt32*, UInt8*, HRESULT)
    set_string_value : Proc(ISpObjectToken*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(ISpObjectToken*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_dword : Proc(ISpObjectToken*, LibC::LPWSTR, UInt32, HRESULT)
    get_dword : Proc(ISpObjectToken*, LibC::LPWSTR, UInt32*, HRESULT)
    open_key : Proc(ISpObjectToken*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    create_key : Proc(ISpObjectToken*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    delete_key : Proc(ISpObjectToken*, LibC::LPWSTR, HRESULT)
    delete_value : Proc(ISpObjectToken*, LibC::LPWSTR, HRESULT)
    enum_keys : Proc(ISpObjectToken*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_values : Proc(ISpObjectToken*, UInt32, LibC::LPWSTR*, HRESULT)
    set_id : Proc(ISpObjectToken*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_id : Proc(ISpObjectToken*, LibC::LPWSTR*, HRESULT)
    get_category : Proc(ISpObjectToken*, ISpObjectTokenCategory*, HRESULT)
    create_instance : Proc(ISpObjectToken*, IUnknown, UInt32, Guid*, Void**, HRESULT)
    get_storage_file_name : Proc(ISpObjectToken*, Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
    remove_storage_file_name : Proc(ISpObjectToken*, Guid*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    remove : Proc(ISpObjectToken*, Guid*, HRESULT)
    is_ui_supported : Proc(ISpObjectToken*, LibC::LPWSTR, Void*, UInt32, IUnknown, LibC::BOOL*, HRESULT)
    display_ui : Proc(ISpObjectToken*, LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, IUnknown, HRESULT)
    matches_attributes : Proc(ISpObjectToken*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
  end

  ISpObjectToken_GUID = LibC::GUID.new("14056589-e16c-11d2-bb90-00c04f8ee6c0")
  CLSID_ISpObjectToken = "14056589-e16c-11d2-bb90-00c04f8ee6c0"
  struct ISpObjectToken
    lpVtbl : ISpObjectTokenVTbl*
  end

  struct ISpObjectTokenInitVTbl
    query_interface : Proc(ISpObjectTokenInit*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpObjectTokenInit*, UInt32)
    release : Proc(ISpObjectTokenInit*, UInt32)
    set_data : Proc(ISpObjectTokenInit*, LibC::LPWSTR, UInt32, UInt8*, HRESULT)
    get_data : Proc(ISpObjectTokenInit*, LibC::LPWSTR, UInt32*, UInt8*, HRESULT)
    set_string_value : Proc(ISpObjectTokenInit*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(ISpObjectTokenInit*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_dword : Proc(ISpObjectTokenInit*, LibC::LPWSTR, UInt32, HRESULT)
    get_dword : Proc(ISpObjectTokenInit*, LibC::LPWSTR, UInt32*, HRESULT)
    open_key : Proc(ISpObjectTokenInit*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    create_key : Proc(ISpObjectTokenInit*, LibC::LPWSTR, ISpDataKey*, HRESULT)
    delete_key : Proc(ISpObjectTokenInit*, LibC::LPWSTR, HRESULT)
    delete_value : Proc(ISpObjectTokenInit*, LibC::LPWSTR, HRESULT)
    enum_keys : Proc(ISpObjectTokenInit*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_values : Proc(ISpObjectTokenInit*, UInt32, LibC::LPWSTR*, HRESULT)
    set_id : Proc(ISpObjectTokenInit*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_id : Proc(ISpObjectTokenInit*, LibC::LPWSTR*, HRESULT)
    get_category : Proc(ISpObjectTokenInit*, ISpObjectTokenCategory*, HRESULT)
    create_instance : Proc(ISpObjectTokenInit*, IUnknown, UInt32, Guid*, Void**, HRESULT)
    get_storage_file_name : Proc(ISpObjectTokenInit*, Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
    remove_storage_file_name : Proc(ISpObjectTokenInit*, Guid*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    remove : Proc(ISpObjectTokenInit*, Guid*, HRESULT)
    is_ui_supported : Proc(ISpObjectTokenInit*, LibC::LPWSTR, Void*, UInt32, IUnknown, LibC::BOOL*, HRESULT)
    display_ui : Proc(ISpObjectTokenInit*, LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, IUnknown, HRESULT)
    matches_attributes : Proc(ISpObjectTokenInit*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    init_from_data_key : Proc(ISpObjectTokenInit*, LibC::LPWSTR, LibC::LPWSTR, ISpDataKey, HRESULT)
  end

  ISpObjectTokenInit_GUID = LibC::GUID.new("b8aab0cf-346f-49d8-9499-c8b03f161d51")
  CLSID_ISpObjectTokenInit = "b8aab0cf-346f-49d8-9499-c8b03f161d51"
  struct ISpObjectTokenInit
    lpVtbl : ISpObjectTokenInitVTbl*
  end

  struct IEnumSpObjectTokensVTbl
    query_interface : Proc(IEnumSpObjectTokens*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSpObjectTokens*, UInt32)
    release : Proc(IEnumSpObjectTokens*, UInt32)
    next : Proc(IEnumSpObjectTokens*, UInt32, ISpObjectToken*, UInt32*, HRESULT)
    skip : Proc(IEnumSpObjectTokens*, UInt32, HRESULT)
    reset : Proc(IEnumSpObjectTokens*, HRESULT)
    clone : Proc(IEnumSpObjectTokens*, IEnumSpObjectTokens*, HRESULT)
    item : Proc(IEnumSpObjectTokens*, UInt32, ISpObjectToken*, HRESULT)
    get_count : Proc(IEnumSpObjectTokens*, UInt32*, HRESULT)
  end

  IEnumSpObjectTokens_GUID = LibC::GUID.new("06b64f9e-7fda-11d2-b4f2-00c04f797396")
  CLSID_IEnumSpObjectTokens = "06b64f9e-7fda-11d2-b4f2-00c04f797396"
  struct IEnumSpObjectTokens
    lpVtbl : IEnumSpObjectTokensVTbl*
  end

  struct ISpObjectWithTokenVTbl
    query_interface : Proc(ISpObjectWithToken*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpObjectWithToken*, UInt32)
    release : Proc(ISpObjectWithToken*, UInt32)
    set_object_token : Proc(ISpObjectWithToken*, ISpObjectToken, HRESULT)
    get_object_token : Proc(ISpObjectWithToken*, ISpObjectToken*, HRESULT)
  end

  ISpObjectWithToken_GUID = LibC::GUID.new("5b559f40-e952-11d2-bb91-00c04f8ee6c0")
  CLSID_ISpObjectWithToken = "5b559f40-e952-11d2-bb91-00c04f8ee6c0"
  struct ISpObjectWithToken
    lpVtbl : ISpObjectWithTokenVTbl*
  end

  struct ISpResourceManagerVTbl
    query_interface : Proc(ISpResourceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpResourceManager*, UInt32)
    release : Proc(ISpResourceManager*, UInt32)
    query_service : Proc(ISpResourceManager*, Guid*, Guid*, Void**, HRESULT)
    set_object : Proc(ISpResourceManager*, Guid*, IUnknown, HRESULT)
    get_object : Proc(ISpResourceManager*, Guid*, Guid*, Guid*, LibC::BOOL, Void**, HRESULT)
  end

  ISpResourceManager_GUID = LibC::GUID.new("93384e18-5014-43d5-adbb-a78e055926bd")
  CLSID_ISpResourceManager = "93384e18-5014-43d5-adbb-a78e055926bd"
  struct ISpResourceManager
    lpVtbl : ISpResourceManagerVTbl*
  end

  struct ISpEventSourceVTbl
    query_interface : Proc(ISpEventSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpEventSource*, UInt32)
    release : Proc(ISpEventSource*, UInt32)
    set_notify_sink : Proc(ISpEventSource*, ISpNotifySink, HRESULT)
    set_notify_window_message : Proc(ISpEventSource*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_function : Proc(ISpEventSource*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_interface : Proc(ISpEventSource*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_win32_event : Proc(ISpEventSource*, HRESULT)
    wait_for_notify_event : Proc(ISpEventSource*, UInt32, HRESULT)
    get_notify_event_handle : Proc(ISpEventSource*, LibC::HANDLE)
    set_interest : Proc(ISpEventSource*, UInt64, UInt64, HRESULT)
    get_events : Proc(ISpEventSource*, UInt32, SPEVENT*, UInt32*, HRESULT)
    get_info : Proc(ISpEventSource*, SPEVENTSOURCEINFO*, HRESULT)
  end

  ISpEventSource_GUID = LibC::GUID.new("be7a9cce-5f9e-11d2-960f-00c04f8ee628")
  CLSID_ISpEventSource = "be7a9cce-5f9e-11d2-960f-00c04f8ee628"
  struct ISpEventSource
    lpVtbl : ISpEventSourceVTbl*
  end

  struct ISpEventSource2VTbl
    query_interface : Proc(ISpEventSource2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpEventSource2*, UInt32)
    release : Proc(ISpEventSource2*, UInt32)
    set_notify_sink : Proc(ISpEventSource2*, ISpNotifySink, HRESULT)
    set_notify_window_message : Proc(ISpEventSource2*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_function : Proc(ISpEventSource2*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_interface : Proc(ISpEventSource2*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_win32_event : Proc(ISpEventSource2*, HRESULT)
    wait_for_notify_event : Proc(ISpEventSource2*, UInt32, HRESULT)
    get_notify_event_handle : Proc(ISpEventSource2*, LibC::HANDLE)
    set_interest : Proc(ISpEventSource2*, UInt64, UInt64, HRESULT)
    get_events : Proc(ISpEventSource2*, UInt32, SPEVENT*, UInt32*, HRESULT)
    get_info : Proc(ISpEventSource2*, SPEVENTSOURCEINFO*, HRESULT)
    get_events_ex : Proc(ISpEventSource2*, UInt32, SPEVENTEX*, UInt32*, HRESULT)
  end

  ISpEventSource2_GUID = LibC::GUID.new("2373a435-6a4b-429e-a6ac-d4231a61975b")
  CLSID_ISpEventSource2 = "2373a435-6a4b-429e-a6ac-d4231a61975b"
  struct ISpEventSource2
    lpVtbl : ISpEventSource2VTbl*
  end

  struct ISpEventSinkVTbl
    query_interface : Proc(ISpEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpEventSink*, UInt32)
    release : Proc(ISpEventSink*, UInt32)
    add_events : Proc(ISpEventSink*, SPEVENT*, UInt32, HRESULT)
    get_event_interest : Proc(ISpEventSink*, UInt64*, HRESULT)
  end

  ISpEventSink_GUID = LibC::GUID.new("be7a9cc9-5f9e-11d2-960f-00c04f8ee628")
  CLSID_ISpEventSink = "be7a9cc9-5f9e-11d2-960f-00c04f8ee628"
  struct ISpEventSink
    lpVtbl : ISpEventSinkVTbl*
  end

  struct ISpStreamFormatVTbl
    query_interface : Proc(ISpStreamFormat*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpStreamFormat*, UInt32)
    release : Proc(ISpStreamFormat*, UInt32)
    read : Proc(ISpStreamFormat*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISpStreamFormat*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(ISpStreamFormat*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(ISpStreamFormat*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(ISpStreamFormat*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(ISpStreamFormat*, UInt32, HRESULT)
    revert : Proc(ISpStreamFormat*, HRESULT)
    lock_region : Proc(ISpStreamFormat*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ISpStreamFormat*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ISpStreamFormat*, STATSTG*, UInt32, HRESULT)
    clone : Proc(ISpStreamFormat*, IStream*, HRESULT)
    get_format : Proc(ISpStreamFormat*, Guid*, WAVEFORMATEX**, HRESULT)
  end

  ISpStreamFormat_GUID = LibC::GUID.new("bed530be-2606-4f4d-a1c0-54c5cda5566f")
  CLSID_ISpStreamFormat = "bed530be-2606-4f4d-a1c0-54c5cda5566f"
  struct ISpStreamFormat
    lpVtbl : ISpStreamFormatVTbl*
  end

  struct ISpStreamVTbl
    query_interface : Proc(ISpStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpStream*, UInt32)
    release : Proc(ISpStream*, UInt32)
    read : Proc(ISpStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISpStream*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(ISpStream*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(ISpStream*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(ISpStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(ISpStream*, UInt32, HRESULT)
    revert : Proc(ISpStream*, HRESULT)
    lock_region : Proc(ISpStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ISpStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ISpStream*, STATSTG*, UInt32, HRESULT)
    clone : Proc(ISpStream*, IStream*, HRESULT)
    get_format : Proc(ISpStream*, Guid*, WAVEFORMATEX**, HRESULT)
    set_base_stream : Proc(ISpStream*, IStream, Guid*, WAVEFORMATEX*, HRESULT)
    get_base_stream : Proc(ISpStream*, IStream*, HRESULT)
    bind_to_file : Proc(ISpStream*, LibC::LPWSTR, SPFILEMODE, Guid*, WAVEFORMATEX*, UInt64, HRESULT)
    close : Proc(ISpStream*, HRESULT)
  end

  ISpStream_GUID = LibC::GUID.new("12e3cca9-7518-44c5-a5e7-ba5a79cb929e")
  CLSID_ISpStream = "12e3cca9-7518-44c5-a5e7-ba5a79cb929e"
  struct ISpStream
    lpVtbl : ISpStreamVTbl*
  end

  struct ISpStreamFormatConverterVTbl
    query_interface : Proc(ISpStreamFormatConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpStreamFormatConverter*, UInt32)
    release : Proc(ISpStreamFormatConverter*, UInt32)
    read : Proc(ISpStreamFormatConverter*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISpStreamFormatConverter*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(ISpStreamFormatConverter*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(ISpStreamFormatConverter*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(ISpStreamFormatConverter*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(ISpStreamFormatConverter*, UInt32, HRESULT)
    revert : Proc(ISpStreamFormatConverter*, HRESULT)
    lock_region : Proc(ISpStreamFormatConverter*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ISpStreamFormatConverter*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ISpStreamFormatConverter*, STATSTG*, UInt32, HRESULT)
    clone : Proc(ISpStreamFormatConverter*, IStream*, HRESULT)
    get_format : Proc(ISpStreamFormatConverter*, Guid*, WAVEFORMATEX**, HRESULT)
    set_base_stream : Proc(ISpStreamFormatConverter*, ISpStreamFormat, LibC::BOOL, LibC::BOOL, HRESULT)
    get_base_stream : Proc(ISpStreamFormatConverter*, ISpStreamFormat*, HRESULT)
    set_format : Proc(ISpStreamFormatConverter*, Guid*, WAVEFORMATEX*, HRESULT)
    reset_seek_position : Proc(ISpStreamFormatConverter*, HRESULT)
    scale_converted_to_base_offset : Proc(ISpStreamFormatConverter*, UInt64, UInt64*, HRESULT)
    scale_base_to_converted_offset : Proc(ISpStreamFormatConverter*, UInt64, UInt64*, HRESULT)
  end

  ISpStreamFormatConverter_GUID = LibC::GUID.new("678a932c-ea71-4446-9b41-78fda6280a29")
  CLSID_ISpStreamFormatConverter = "678a932c-ea71-4446-9b41-78fda6280a29"
  struct ISpStreamFormatConverter
    lpVtbl : ISpStreamFormatConverterVTbl*
  end

  struct ISpAudioVTbl
    query_interface : Proc(ISpAudio*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpAudio*, UInt32)
    release : Proc(ISpAudio*, UInt32)
    read : Proc(ISpAudio*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISpAudio*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(ISpAudio*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(ISpAudio*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(ISpAudio*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(ISpAudio*, UInt32, HRESULT)
    revert : Proc(ISpAudio*, HRESULT)
    lock_region : Proc(ISpAudio*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ISpAudio*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ISpAudio*, STATSTG*, UInt32, HRESULT)
    clone : Proc(ISpAudio*, IStream*, HRESULT)
    get_format : Proc(ISpAudio*, Guid*, WAVEFORMATEX**, HRESULT)
    set_state : Proc(ISpAudio*, SPAUDIOSTATE, UInt64, HRESULT)
    set_format : Proc(ISpAudio*, Guid*, WAVEFORMATEX*, HRESULT)
    get_status : Proc(ISpAudio*, SPAUDIOSTATUS*, HRESULT)
    set_buffer_info : Proc(ISpAudio*, SPAUDIOBUFFERINFO*, HRESULT)
    get_buffer_info : Proc(ISpAudio*, SPAUDIOBUFFERINFO*, HRESULT)
    get_default_format : Proc(ISpAudio*, Guid*, WAVEFORMATEX**, HRESULT)
    event_handle : Proc(ISpAudio*, LibC::HANDLE)
    get_volume_level : Proc(ISpAudio*, UInt32*, HRESULT)
    set_volume_level : Proc(ISpAudio*, UInt32, HRESULT)
    get_buffer_notify_size : Proc(ISpAudio*, UInt32*, HRESULT)
    set_buffer_notify_size : Proc(ISpAudio*, UInt32, HRESULT)
  end

  ISpAudio_GUID = LibC::GUID.new("c05c768f-fae8-4ec2-8e07-338321c12452")
  CLSID_ISpAudio = "c05c768f-fae8-4ec2-8e07-338321c12452"
  struct ISpAudio
    lpVtbl : ISpAudioVTbl*
  end

  struct ISpMMSysAudioVTbl
    query_interface : Proc(ISpMMSysAudio*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpMMSysAudio*, UInt32)
    release : Proc(ISpMMSysAudio*, UInt32)
    read : Proc(ISpMMSysAudio*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISpMMSysAudio*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(ISpMMSysAudio*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(ISpMMSysAudio*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(ISpMMSysAudio*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(ISpMMSysAudio*, UInt32, HRESULT)
    revert : Proc(ISpMMSysAudio*, HRESULT)
    lock_region : Proc(ISpMMSysAudio*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ISpMMSysAudio*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ISpMMSysAudio*, STATSTG*, UInt32, HRESULT)
    clone : Proc(ISpMMSysAudio*, IStream*, HRESULT)
    get_format : Proc(ISpMMSysAudio*, Guid*, WAVEFORMATEX**, HRESULT)
    set_state : Proc(ISpMMSysAudio*, SPAUDIOSTATE, UInt64, HRESULT)
    set_format : Proc(ISpMMSysAudio*, Guid*, WAVEFORMATEX*, HRESULT)
    get_status : Proc(ISpMMSysAudio*, SPAUDIOSTATUS*, HRESULT)
    set_buffer_info : Proc(ISpMMSysAudio*, SPAUDIOBUFFERINFO*, HRESULT)
    get_buffer_info : Proc(ISpMMSysAudio*, SPAUDIOBUFFERINFO*, HRESULT)
    get_default_format : Proc(ISpMMSysAudio*, Guid*, WAVEFORMATEX**, HRESULT)
    event_handle : Proc(ISpMMSysAudio*, LibC::HANDLE)
    get_volume_level : Proc(ISpMMSysAudio*, UInt32*, HRESULT)
    set_volume_level : Proc(ISpMMSysAudio*, UInt32, HRESULT)
    get_buffer_notify_size : Proc(ISpMMSysAudio*, UInt32*, HRESULT)
    set_buffer_notify_size : Proc(ISpMMSysAudio*, UInt32, HRESULT)
    get_device_id : Proc(ISpMMSysAudio*, UInt32*, HRESULT)
    set_device_id : Proc(ISpMMSysAudio*, UInt32, HRESULT)
    get_mm_handle : Proc(ISpMMSysAudio*, Void**, HRESULT)
    get_line_id : Proc(ISpMMSysAudio*, UInt32*, HRESULT)
    set_line_id : Proc(ISpMMSysAudio*, UInt32, HRESULT)
  end

  ISpMMSysAudio_GUID = LibC::GUID.new("15806f6e-1d70-4b48-98e6-3b1a007509ab")
  CLSID_ISpMMSysAudio = "15806f6e-1d70-4b48-98e6-3b1a007509ab"
  struct ISpMMSysAudio
    lpVtbl : ISpMMSysAudioVTbl*
  end

  struct ISpTranscriptVTbl
    query_interface : Proc(ISpTranscript*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpTranscript*, UInt32)
    release : Proc(ISpTranscript*, UInt32)
    get_transcript : Proc(ISpTranscript*, LibC::LPWSTR*, HRESULT)
    append_transcript : Proc(ISpTranscript*, LibC::LPWSTR, HRESULT)
  end

  ISpTranscript_GUID = LibC::GUID.new("10f63bce-201a-11d3-ac70-00c04f8ee6c0")
  CLSID_ISpTranscript = "10f63bce-201a-11d3-ac70-00c04f8ee6c0"
  struct ISpTranscript
    lpVtbl : ISpTranscriptVTbl*
  end

  struct ISpLexiconVTbl
    query_interface : Proc(ISpLexicon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpLexicon*, UInt32)
    release : Proc(ISpLexicon*, UInt32)
    get_pronunciations : Proc(ISpLexicon*, LibC::LPWSTR, UInt16, UInt32, SPWORDPRONUNCIATIONLIST*, HRESULT)
    add_pronunciation : Proc(ISpLexicon*, LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)
    remove_pronunciation : Proc(ISpLexicon*, LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)
    get_generation : Proc(ISpLexicon*, UInt32*, HRESULT)
    get_generation_change : Proc(ISpLexicon*, UInt32, UInt32*, SPWORDLIST*, HRESULT)
    get_words : Proc(ISpLexicon*, UInt32, UInt32*, UInt32*, SPWORDLIST*, HRESULT)
  end

  ISpLexicon_GUID = LibC::GUID.new("da41a7c2-5383-4db2-916b-6c1719e3db58")
  CLSID_ISpLexicon = "da41a7c2-5383-4db2-916b-6c1719e3db58"
  struct ISpLexicon
    lpVtbl : ISpLexiconVTbl*
  end

  struct ISpContainerLexiconVTbl
    query_interface : Proc(ISpContainerLexicon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpContainerLexicon*, UInt32)
    release : Proc(ISpContainerLexicon*, UInt32)
    get_pronunciations : Proc(ISpContainerLexicon*, LibC::LPWSTR, UInt16, UInt32, SPWORDPRONUNCIATIONLIST*, HRESULT)
    add_pronunciation : Proc(ISpContainerLexicon*, LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)
    remove_pronunciation : Proc(ISpContainerLexicon*, LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)
    get_generation : Proc(ISpContainerLexicon*, UInt32*, HRESULT)
    get_generation_change : Proc(ISpContainerLexicon*, UInt32, UInt32*, SPWORDLIST*, HRESULT)
    get_words : Proc(ISpContainerLexicon*, UInt32, UInt32*, UInt32*, SPWORDLIST*, HRESULT)
    add_lexicon : Proc(ISpContainerLexicon*, ISpLexicon, UInt32, HRESULT)
  end

  ISpContainerLexicon_GUID = LibC::GUID.new("8565572f-c094-41cc-b56e-10bd9c3ff044")
  CLSID_ISpContainerLexicon = "8565572f-c094-41cc-b56e-10bd9c3ff044"
  struct ISpContainerLexicon
    lpVtbl : ISpContainerLexiconVTbl*
  end

  struct ISpShortcutVTbl
    query_interface : Proc(ISpShortcut*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpShortcut*, UInt32)
    release : Proc(ISpShortcut*, UInt32)
    add_shortcut : Proc(ISpShortcut*, LibC::LPWSTR, UInt16, LibC::LPWSTR, SPSHORTCUTTYPE, HRESULT)
    remove_shortcut : Proc(ISpShortcut*, LibC::LPWSTR, UInt16, LibC::LPWSTR, SPSHORTCUTTYPE, HRESULT)
    get_shortcuts : Proc(ISpShortcut*, UInt16, SPSHORTCUTPAIRLIST*, HRESULT)
    get_generation : Proc(ISpShortcut*, UInt32*, HRESULT)
    get_words_from_generation_change : Proc(ISpShortcut*, UInt32*, SPWORDLIST*, HRESULT)
    get_words : Proc(ISpShortcut*, UInt32*, UInt32*, SPWORDLIST*, HRESULT)
    get_shortcuts_for_generation : Proc(ISpShortcut*, UInt32*, UInt32*, SPSHORTCUTPAIRLIST*, HRESULT)
    get_generation_change : Proc(ISpShortcut*, UInt32*, SPSHORTCUTPAIRLIST*, HRESULT)
  end

  ISpShortcut_GUID = LibC::GUID.new("3df681e2-ea56-11d9-8bde-f66bad1e3f3a")
  CLSID_ISpShortcut = "3df681e2-ea56-11d9-8bde-f66bad1e3f3a"
  struct ISpShortcut
    lpVtbl : ISpShortcutVTbl*
  end

  struct ISpPhoneConverterVTbl
    query_interface : Proc(ISpPhoneConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhoneConverter*, UInt32)
    release : Proc(ISpPhoneConverter*, UInt32)
    set_object_token : Proc(ISpPhoneConverter*, ISpObjectToken, HRESULT)
    get_object_token : Proc(ISpPhoneConverter*, ISpObjectToken*, HRESULT)
    phone_to_id : Proc(ISpPhoneConverter*, LibC::LPWSTR, UInt16*, HRESULT)
    id_to_phone : Proc(ISpPhoneConverter*, UInt16*, LibC::LPWSTR, HRESULT)
  end

  ISpPhoneConverter_GUID = LibC::GUID.new("8445c581-0cac-4a38-abfe-9b2ce2826455")
  CLSID_ISpPhoneConverter = "8445c581-0cac-4a38-abfe-9b2ce2826455"
  struct ISpPhoneConverter
    lpVtbl : ISpPhoneConverterVTbl*
  end

  struct ISpPhoneticAlphabetConverterVTbl
    query_interface : Proc(ISpPhoneticAlphabetConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhoneticAlphabetConverter*, UInt32)
    release : Proc(ISpPhoneticAlphabetConverter*, UInt32)
    get_lang_id : Proc(ISpPhoneticAlphabetConverter*, UInt16*, HRESULT)
    set_lang_id : Proc(ISpPhoneticAlphabetConverter*, UInt16, HRESULT)
    sapi2_ups : Proc(ISpPhoneticAlphabetConverter*, UInt16*, UInt16*, UInt32, HRESULT)
    ups2_sapi : Proc(ISpPhoneticAlphabetConverter*, UInt16*, UInt16*, UInt32, HRESULT)
    get_max_convert_length : Proc(ISpPhoneticAlphabetConverter*, UInt32, LibC::BOOL, UInt32*, HRESULT)
  end

  ISpPhoneticAlphabetConverter_GUID = LibC::GUID.new("133adcd4-19b4-4020-9fdc-842e78253b17")
  CLSID_ISpPhoneticAlphabetConverter = "133adcd4-19b4-4020-9fdc-842e78253b17"
  struct ISpPhoneticAlphabetConverter
    lpVtbl : ISpPhoneticAlphabetConverterVTbl*
  end

  struct ISpPhoneticAlphabetSelectionVTbl
    query_interface : Proc(ISpPhoneticAlphabetSelection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhoneticAlphabetSelection*, UInt32)
    release : Proc(ISpPhoneticAlphabetSelection*, UInt32)
    is_alphabet_ups : Proc(ISpPhoneticAlphabetSelection*, LibC::BOOL*, HRESULT)
    set_alphabet_to_ups : Proc(ISpPhoneticAlphabetSelection*, LibC::BOOL, HRESULT)
  end

  ISpPhoneticAlphabetSelection_GUID = LibC::GUID.new("b2745efd-42ce-48ca-81f1-a96e02538a90")
  CLSID_ISpPhoneticAlphabetSelection = "b2745efd-42ce-48ca-81f1-a96e02538a90"
  struct ISpPhoneticAlphabetSelection
    lpVtbl : ISpPhoneticAlphabetSelectionVTbl*
  end

  struct ISpVoiceVTbl
    query_interface : Proc(ISpVoice*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpVoice*, UInt32)
    release : Proc(ISpVoice*, UInt32)
    set_notify_sink : Proc(ISpVoice*, ISpNotifySink, HRESULT)
    set_notify_window_message : Proc(ISpVoice*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_function : Proc(ISpVoice*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_interface : Proc(ISpVoice*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_win32_event : Proc(ISpVoice*, HRESULT)
    wait_for_notify_event : Proc(ISpVoice*, UInt32, HRESULT)
    get_notify_event_handle : Proc(ISpVoice*, LibC::HANDLE)
    set_interest : Proc(ISpVoice*, UInt64, UInt64, HRESULT)
    get_events : Proc(ISpVoice*, UInt32, SPEVENT*, UInt32*, HRESULT)
    get_info : Proc(ISpVoice*, SPEVENTSOURCEINFO*, HRESULT)
    set_output : Proc(ISpVoice*, IUnknown, LibC::BOOL, HRESULT)
    get_output_object_token : Proc(ISpVoice*, ISpObjectToken*, HRESULT)
    get_output_stream : Proc(ISpVoice*, ISpStreamFormat*, HRESULT)
    pause : Proc(ISpVoice*, HRESULT)
    resume : Proc(ISpVoice*, HRESULT)
    set_voice : Proc(ISpVoice*, ISpObjectToken, HRESULT)
    get_voice : Proc(ISpVoice*, ISpObjectToken*, HRESULT)
    speak : Proc(ISpVoice*, LibC::LPWSTR, UInt32, UInt32*, HRESULT)
    speak_stream : Proc(ISpVoice*, IStream, UInt32, UInt32*, HRESULT)
    get_status : Proc(ISpVoice*, SPVOICESTATUS*, LibC::LPWSTR*, HRESULT)
    skip : Proc(ISpVoice*, LibC::LPWSTR, Int32, UInt32*, HRESULT)
    set_priority : Proc(ISpVoice*, SPVPRIORITY, HRESULT)
    get_priority : Proc(ISpVoice*, SPVPRIORITY*, HRESULT)
    set_alert_boundary : Proc(ISpVoice*, SPEVENTENUM, HRESULT)
    get_alert_boundary : Proc(ISpVoice*, SPEVENTENUM*, HRESULT)
    set_rate : Proc(ISpVoice*, Int32, HRESULT)
    get_rate : Proc(ISpVoice*, Int32*, HRESULT)
    set_volume : Proc(ISpVoice*, UInt16, HRESULT)
    get_volume : Proc(ISpVoice*, UInt16*, HRESULT)
    wait_until_done : Proc(ISpVoice*, UInt32, HRESULT)
    set_sync_speak_timeout : Proc(ISpVoice*, UInt32, HRESULT)
    get_sync_speak_timeout : Proc(ISpVoice*, UInt32*, HRESULT)
    speak_complete_event : Proc(ISpVoice*, LibC::HANDLE)
    is_ui_supported : Proc(ISpVoice*, LibC::LPWSTR, Void*, UInt32, LibC::BOOL*, HRESULT)
    display_ui : Proc(ISpVoice*, LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, HRESULT)
  end

  ISpVoice_GUID = LibC::GUID.new("6c44df74-72b9-4992-a1ec-ef996e0422d4")
  CLSID_ISpVoice = "6c44df74-72b9-4992-a1ec-ef996e0422d4"
  struct ISpVoice
    lpVtbl : ISpVoiceVTbl*
  end

  struct ISpPhraseVTbl
    query_interface : Proc(ISpPhrase*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhrase*, UInt32)
    release : Proc(ISpPhrase*, UInt32)
    get_phrase : Proc(ISpPhrase*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpPhrase*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpPhrase*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpPhrase*, UInt32, HRESULT)
  end

  ISpPhrase_GUID = LibC::GUID.new("1a5c0354-b621-4b5a-8791-d306ed379e53")
  CLSID_ISpPhrase = "1a5c0354-b621-4b5a-8791-d306ed379e53"
  struct ISpPhrase
    lpVtbl : ISpPhraseVTbl*
  end

  struct ISpPhraseAltVTbl
    query_interface : Proc(ISpPhraseAlt*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhraseAlt*, UInt32)
    release : Proc(ISpPhraseAlt*, UInt32)
    get_phrase : Proc(ISpPhraseAlt*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpPhraseAlt*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpPhraseAlt*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpPhraseAlt*, UInt32, HRESULT)
    get_alt_info : Proc(ISpPhraseAlt*, ISpPhrase*, UInt32*, UInt32*, UInt32*, HRESULT)
    commit : Proc(ISpPhraseAlt*, HRESULT)
  end

  ISpPhraseAlt_GUID = LibC::GUID.new("8fcebc98-4e49-4067-9c6c-d86a0e092e3d")
  CLSID_ISpPhraseAlt = "8fcebc98-4e49-4067-9c6c-d86a0e092e3d"
  struct ISpPhraseAlt
    lpVtbl : ISpPhraseAltVTbl*
  end

  struct ISpPhrase2VTbl
    query_interface : Proc(ISpPhrase2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpPhrase2*, UInt32)
    release : Proc(ISpPhrase2*, UInt32)
    get_phrase : Proc(ISpPhrase2*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpPhrase2*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpPhrase2*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpPhrase2*, UInt32, HRESULT)
    get_xml_result : Proc(ISpPhrase2*, LibC::LPWSTR*, SPXMLRESULTOPTIONS, HRESULT)
    get_xml_error_info : Proc(ISpPhrase2*, SPSEMANTICERRORINFO*, HRESULT)
    get_audio : Proc(ISpPhrase2*, UInt32, UInt32, ISpStreamFormat*, HRESULT)
  end

  ISpPhrase2_GUID = LibC::GUID.new("f264da52-e457-4696-b856-a737b717af79")
  CLSID_ISpPhrase2 = "f264da52-e457-4696-b856-a737b717af79"
  struct ISpPhrase2
    lpVtbl : ISpPhrase2VTbl*
  end

  struct ISpRecoResultVTbl
    query_interface : Proc(ISpRecoResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoResult*, UInt32)
    release : Proc(ISpRecoResult*, UInt32)
    get_phrase : Proc(ISpRecoResult*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpRecoResult*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpRecoResult*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpRecoResult*, UInt32, HRESULT)
    get_result_times : Proc(ISpRecoResult*, SPRECORESULTTIMES*, HRESULT)
    get_alternates : Proc(ISpRecoResult*, UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)
    get_audio : Proc(ISpRecoResult*, UInt32, UInt32, ISpStreamFormat*, HRESULT)
    speak_audio : Proc(ISpRecoResult*, UInt32, UInt32, UInt32, UInt32*, HRESULT)
    serialize : Proc(ISpRecoResult*, SPSERIALIZEDRESULT**, HRESULT)
    scale_audio : Proc(ISpRecoResult*, Guid*, WAVEFORMATEX*, HRESULT)
    get_reco_context : Proc(ISpRecoResult*, ISpRecoContext*, HRESULT)
  end

  ISpRecoResult_GUID = LibC::GUID.new("20b053be-e235-43cd-9a2a-8d17a48b7842")
  CLSID_ISpRecoResult = "20b053be-e235-43cd-9a2a-8d17a48b7842"
  struct ISpRecoResult
    lpVtbl : ISpRecoResultVTbl*
  end

  struct ISpRecoResult2VTbl
    query_interface : Proc(ISpRecoResult2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoResult2*, UInt32)
    release : Proc(ISpRecoResult2*, UInt32)
    get_phrase : Proc(ISpRecoResult2*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpRecoResult2*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpRecoResult2*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpRecoResult2*, UInt32, HRESULT)
    get_result_times : Proc(ISpRecoResult2*, SPRECORESULTTIMES*, HRESULT)
    get_alternates : Proc(ISpRecoResult2*, UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)
    get_audio : Proc(ISpRecoResult2*, UInt32, UInt32, ISpStreamFormat*, HRESULT)
    speak_audio : Proc(ISpRecoResult2*, UInt32, UInt32, UInt32, UInt32*, HRESULT)
    serialize : Proc(ISpRecoResult2*, SPSERIALIZEDRESULT**, HRESULT)
    scale_audio : Proc(ISpRecoResult2*, Guid*, WAVEFORMATEX*, HRESULT)
    get_reco_context : Proc(ISpRecoResult2*, ISpRecoContext*, HRESULT)
    commit_alternate : Proc(ISpRecoResult2*, ISpPhraseAlt, ISpRecoResult*, HRESULT)
    commit_text : Proc(ISpRecoResult2*, UInt32, UInt32, LibC::LPWSTR, UInt32, HRESULT)
    set_text_feedback : Proc(ISpRecoResult2*, LibC::LPWSTR, LibC::BOOL, HRESULT)
  end

  ISpRecoResult2_GUID = LibC::GUID.new("27cac6c4-88f2-41f2-8817-0c95e59f1e6e")
  CLSID_ISpRecoResult2 = "27cac6c4-88f2-41f2-8817-0c95e59f1e6e"
  struct ISpRecoResult2
    lpVtbl : ISpRecoResult2VTbl*
  end

  struct ISpXMLRecoResultVTbl
    query_interface : Proc(ISpXMLRecoResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpXMLRecoResult*, UInt32)
    release : Proc(ISpXMLRecoResult*, UInt32)
    get_phrase : Proc(ISpXMLRecoResult*, SPPHRASE**, HRESULT)
    get_serialized_phrase : Proc(ISpXMLRecoResult*, SPSERIALIZEDPHRASE**, HRESULT)
    get_text : Proc(ISpXMLRecoResult*, UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)
    discard : Proc(ISpXMLRecoResult*, UInt32, HRESULT)
    get_result_times : Proc(ISpXMLRecoResult*, SPRECORESULTTIMES*, HRESULT)
    get_alternates : Proc(ISpXMLRecoResult*, UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)
    get_audio : Proc(ISpXMLRecoResult*, UInt32, UInt32, ISpStreamFormat*, HRESULT)
    speak_audio : Proc(ISpXMLRecoResult*, UInt32, UInt32, UInt32, UInt32*, HRESULT)
    serialize : Proc(ISpXMLRecoResult*, SPSERIALIZEDRESULT**, HRESULT)
    scale_audio : Proc(ISpXMLRecoResult*, Guid*, WAVEFORMATEX*, HRESULT)
    get_reco_context : Proc(ISpXMLRecoResult*, ISpRecoContext*, HRESULT)
    get_xml_result : Proc(ISpXMLRecoResult*, LibC::LPWSTR*, SPXMLRESULTOPTIONS, HRESULT)
    get_xml_error_info : Proc(ISpXMLRecoResult*, SPSEMANTICERRORINFO*, HRESULT)
  end

  ISpXMLRecoResult_GUID = LibC::GUID.new("ae39362b-45a8-4074-9b9e-ccf49aa2d0b6")
  CLSID_ISpXMLRecoResult = "ae39362b-45a8-4074-9b9e-ccf49aa2d0b6"
  struct ISpXMLRecoResult
    lpVtbl : ISpXMLRecoResultVTbl*
  end

  struct ISpGrammarBuilderVTbl
    query_interface : Proc(ISpGrammarBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpGrammarBuilder*, UInt32)
    release : Proc(ISpGrammarBuilder*, UInt32)
    reset_grammar : Proc(ISpGrammarBuilder*, UInt16, HRESULT)
    get_rule : Proc(ISpGrammarBuilder*, LibC::LPWSTR, UInt32, UInt32, LibC::BOOL, SPSTATEHANDLE__**, HRESULT)
    clear_rule : Proc(ISpGrammarBuilder*, SPSTATEHANDLE__*, HRESULT)
    create_new_state : Proc(ISpGrammarBuilder*, SPSTATEHANDLE__*, SPSTATEHANDLE__**, HRESULT)
    add_word_transition : Proc(ISpGrammarBuilder*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, SPGRAMMARWORDTYPE, Float32, SPPROPERTYINFO*, HRESULT)
    add_rule_transition : Proc(ISpGrammarBuilder*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, Float32, SPPROPERTYINFO*, HRESULT)
    add_resource : Proc(ISpGrammarBuilder*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    commit : Proc(ISpGrammarBuilder*, UInt32, HRESULT)
  end

  ISpGrammarBuilder_GUID = LibC::GUID.new("8137828f-591a-4a42-be58-49ea7ebaac68")
  CLSID_ISpGrammarBuilder = "8137828f-591a-4a42-be58-49ea7ebaac68"
  struct ISpGrammarBuilder
    lpVtbl : ISpGrammarBuilderVTbl*
  end

  struct ISpRecoGrammarVTbl
    query_interface : Proc(ISpRecoGrammar*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoGrammar*, UInt32)
    release : Proc(ISpRecoGrammar*, UInt32)
    reset_grammar : Proc(ISpRecoGrammar*, UInt16, HRESULT)
    get_rule : Proc(ISpRecoGrammar*, LibC::LPWSTR, UInt32, UInt32, LibC::BOOL, SPSTATEHANDLE__**, HRESULT)
    clear_rule : Proc(ISpRecoGrammar*, SPSTATEHANDLE__*, HRESULT)
    create_new_state : Proc(ISpRecoGrammar*, SPSTATEHANDLE__*, SPSTATEHANDLE__**, HRESULT)
    add_word_transition : Proc(ISpRecoGrammar*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, SPGRAMMARWORDTYPE, Float32, SPPROPERTYINFO*, HRESULT)
    add_rule_transition : Proc(ISpRecoGrammar*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, Float32, SPPROPERTYINFO*, HRESULT)
    add_resource : Proc(ISpRecoGrammar*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    commit : Proc(ISpRecoGrammar*, UInt32, HRESULT)
    get_grammar_id : Proc(ISpRecoGrammar*, UInt64*, HRESULT)
    get_reco_context : Proc(ISpRecoGrammar*, ISpRecoContext*, HRESULT)
    load_cmd_from_file : Proc(ISpRecoGrammar*, LibC::LPWSTR, SPLOADOPTIONS, HRESULT)
    load_cmd_from_object : Proc(ISpRecoGrammar*, Guid*, LibC::LPWSTR, SPLOADOPTIONS, HRESULT)
    load_cmd_from_resource : Proc(ISpRecoGrammar*, HINSTANCE, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPLOADOPTIONS, HRESULT)
    load_cmd_from_memory : Proc(ISpRecoGrammar*, SPBINARYGRAMMAR*, SPLOADOPTIONS, HRESULT)
    load_cmd_from_proprietary_grammar : Proc(ISpRecoGrammar*, Guid*, LibC::LPWSTR, Void*, UInt32, SPLOADOPTIONS, HRESULT)
    set_rule_state : Proc(ISpRecoGrammar*, LibC::LPWSTR, Void*, SPRULESTATE, HRESULT)
    set_rule_id_state : Proc(ISpRecoGrammar*, UInt32, SPRULESTATE, HRESULT)
    load_dictation : Proc(ISpRecoGrammar*, LibC::LPWSTR, SPLOADOPTIONS, HRESULT)
    unload_dictation : Proc(ISpRecoGrammar*, HRESULT)
    set_dictation_state : Proc(ISpRecoGrammar*, SPRULESTATE, HRESULT)
    set_word_sequence_data : Proc(ISpRecoGrammar*, Char*, UInt32, SPTEXTSELECTIONINFO*, HRESULT)
    set_text_selection : Proc(ISpRecoGrammar*, SPTEXTSELECTIONINFO*, HRESULT)
    is_pronounceable : Proc(ISpRecoGrammar*, LibC::LPWSTR, SPWORDPRONOUNCEABLE*, HRESULT)
    set_grammar_state : Proc(ISpRecoGrammar*, SPGRAMMARSTATE, HRESULT)
    save_cmd : Proc(ISpRecoGrammar*, IStream, LibC::LPWSTR*, HRESULT)
    get_grammar_state : Proc(ISpRecoGrammar*, SPGRAMMARSTATE*, HRESULT)
  end

  ISpRecoGrammar_GUID = LibC::GUID.new("2177db29-7f45-47d0-8554-067e91c80502")
  CLSID_ISpRecoGrammar = "2177db29-7f45-47d0-8554-067e91c80502"
  struct ISpRecoGrammar
    lpVtbl : ISpRecoGrammarVTbl*
  end

  struct ISpGrammarBuilder2VTbl
    query_interface : Proc(ISpGrammarBuilder2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpGrammarBuilder2*, UInt32)
    release : Proc(ISpGrammarBuilder2*, UInt32)
    add_text_subset : Proc(ISpGrammarBuilder2*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, SPMATCHINGMODE, HRESULT)
    set_phonetic_alphabet : Proc(ISpGrammarBuilder2*, PHONETICALPHABET, HRESULT)
  end

  ISpGrammarBuilder2_GUID = LibC::GUID.new("8ab10026-20cc-4b20-8c22-a49c9ba78f60")
  CLSID_ISpGrammarBuilder2 = "8ab10026-20cc-4b20-8c22-a49c9ba78f60"
  struct ISpGrammarBuilder2
    lpVtbl : ISpGrammarBuilder2VTbl*
  end

  struct ISpRecoGrammar2VTbl
    query_interface : Proc(ISpRecoGrammar2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoGrammar2*, UInt32)
    release : Proc(ISpRecoGrammar2*, UInt32)
    get_rules : Proc(ISpRecoGrammar2*, SPRULE**, UInt32*, HRESULT)
    load_cmd_from_file2 : Proc(ISpRecoGrammar2*, LibC::LPWSTR, SPLOADOPTIONS, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    load_cmd_from_memory2 : Proc(ISpRecoGrammar2*, SPBINARYGRAMMAR*, SPLOADOPTIONS, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_rule_priority : Proc(ISpRecoGrammar2*, LibC::LPWSTR, UInt32, Int32, HRESULT)
    set_rule_weight : Proc(ISpRecoGrammar2*, LibC::LPWSTR, UInt32, Float32, HRESULT)
    set_dictation_weight : Proc(ISpRecoGrammar2*, Float32, HRESULT)
    set_grammar_loader : Proc(ISpRecoGrammar2*, ISpeechResourceLoader, HRESULT)
    set_sml_security_manager : Proc(ISpRecoGrammar2*, IInternetSecurityManager, HRESULT)
  end

  ISpRecoGrammar2_GUID = LibC::GUID.new("4b37bc9e-9ed6-44a3-93d3-18f022b79ec3")
  CLSID_ISpRecoGrammar2 = "4b37bc9e-9ed6-44a3-93d3-18f022b79ec3"
  struct ISpRecoGrammar2
    lpVtbl : ISpRecoGrammar2VTbl*
  end

  struct ISpeechResourceLoaderVTbl
    query_interface : Proc(ISpeechResourceLoader*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechResourceLoader*, UInt32)
    release : Proc(ISpeechResourceLoader*, UInt32)
    get_type_info_count : Proc(ISpeechResourceLoader*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechResourceLoader*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechResourceLoader*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechResourceLoader*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    load_resource : Proc(ISpeechResourceLoader*, UInt8*, Int16, IUnknown*, UInt8**, Int16*, UInt8**, HRESULT)
    get_local_copy : Proc(ISpeechResourceLoader*, UInt8*, UInt8**, UInt8**, UInt8**, HRESULT)
    release_local_copy : Proc(ISpeechResourceLoader*, UInt8*, HRESULT)
  end

  ISpeechResourceLoader_GUID = LibC::GUID.new("b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3")
  CLSID_ISpeechResourceLoader = "b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3"
  struct ISpeechResourceLoader
    lpVtbl : ISpeechResourceLoaderVTbl*
  end

  struct ISpRecoContextVTbl
    query_interface : Proc(ISpRecoContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoContext*, UInt32)
    release : Proc(ISpRecoContext*, UInt32)
    set_notify_sink : Proc(ISpRecoContext*, ISpNotifySink, HRESULT)
    set_notify_window_message : Proc(ISpRecoContext*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_function : Proc(ISpRecoContext*, SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_callback_interface : Proc(ISpRecoContext*, ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)
    set_notify_win32_event : Proc(ISpRecoContext*, HRESULT)
    wait_for_notify_event : Proc(ISpRecoContext*, UInt32, HRESULT)
    get_notify_event_handle : Proc(ISpRecoContext*, LibC::HANDLE)
    set_interest : Proc(ISpRecoContext*, UInt64, UInt64, HRESULT)
    get_events : Proc(ISpRecoContext*, UInt32, SPEVENT*, UInt32*, HRESULT)
    get_info : Proc(ISpRecoContext*, SPEVENTSOURCEINFO*, HRESULT)
    get_recognizer : Proc(ISpRecoContext*, ISpRecognizer*, HRESULT)
    create_grammar : Proc(ISpRecoContext*, UInt64, ISpRecoGrammar*, HRESULT)
    get_status : Proc(ISpRecoContext*, SPRECOCONTEXTSTATUS*, HRESULT)
    get_max_alternates : Proc(ISpRecoContext*, UInt32*, HRESULT)
    set_max_alternates : Proc(ISpRecoContext*, UInt32, HRESULT)
    set_audio_options : Proc(ISpRecoContext*, SPAUDIOOPTIONS, Guid*, WAVEFORMATEX*, HRESULT)
    get_audio_options : Proc(ISpRecoContext*, SPAUDIOOPTIONS*, Guid*, WAVEFORMATEX**, HRESULT)
    deserialize_result : Proc(ISpRecoContext*, SPSERIALIZEDRESULT*, ISpRecoResult*, HRESULT)
    bookmark : Proc(ISpRecoContext*, SPBOOKMARKOPTIONS, UInt64, LPARAM, HRESULT)
    set_adaptation_data : Proc(ISpRecoContext*, LibC::LPWSTR, UInt32, HRESULT)
    pause : Proc(ISpRecoContext*, UInt32, HRESULT)
    resume : Proc(ISpRecoContext*, UInt32, HRESULT)
    set_voice : Proc(ISpRecoContext*, ISpVoice, LibC::BOOL, HRESULT)
    get_voice : Proc(ISpRecoContext*, ISpVoice*, HRESULT)
    set_voice_purge_event : Proc(ISpRecoContext*, UInt64, HRESULT)
    get_voice_purge_event : Proc(ISpRecoContext*, UInt64*, HRESULT)
    set_context_state : Proc(ISpRecoContext*, SPCONTEXTSTATE, HRESULT)
    get_context_state : Proc(ISpRecoContext*, SPCONTEXTSTATE*, HRESULT)
  end

  ISpRecoContext_GUID = LibC::GUID.new("f740a62f-7c15-489e-8234-940a33d9272d")
  CLSID_ISpRecoContext = "f740a62f-7c15-489e-8234-940a33d9272d"
  struct ISpRecoContext
    lpVtbl : ISpRecoContextVTbl*
  end

  struct ISpRecoContext2VTbl
    query_interface : Proc(ISpRecoContext2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecoContext2*, UInt32)
    release : Proc(ISpRecoContext2*, UInt32)
    set_grammar_options : Proc(ISpRecoContext2*, UInt32, HRESULT)
    get_grammar_options : Proc(ISpRecoContext2*, UInt32*, HRESULT)
    set_adaptation_data2 : Proc(ISpRecoContext2*, LibC::LPWSTR, UInt32, LibC::LPWSTR, UInt32, SPADAPTATIONRELEVANCE, HRESULT)
  end

  ISpRecoContext2_GUID = LibC::GUID.new("bead311c-52ff-437f-9464-6b21054ca73d")
  CLSID_ISpRecoContext2 = "bead311c-52ff-437f-9464-6b21054ca73d"
  struct ISpRecoContext2
    lpVtbl : ISpRecoContext2VTbl*
  end

  struct ISpPropertiesVTbl
    query_interface : Proc(ISpProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpProperties*, UInt32)
    release : Proc(ISpProperties*, UInt32)
    set_property_num : Proc(ISpProperties*, LibC::LPWSTR, Int32, HRESULT)
    get_property_num : Proc(ISpProperties*, LibC::LPWSTR, Int32*, HRESULT)
    set_property_string : Proc(ISpProperties*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_property_string : Proc(ISpProperties*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
  end

  ISpProperties_GUID = LibC::GUID.new("5b4fb971-b115-4de1-ad97-e482e3bf6ee4")
  CLSID_ISpProperties = "5b4fb971-b115-4de1-ad97-e482e3bf6ee4"
  struct ISpProperties
    lpVtbl : ISpPropertiesVTbl*
  end

  struct ISpRecognizerVTbl
    query_interface : Proc(ISpRecognizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecognizer*, UInt32)
    release : Proc(ISpRecognizer*, UInt32)
    set_property_num : Proc(ISpRecognizer*, LibC::LPWSTR, Int32, HRESULT)
    get_property_num : Proc(ISpRecognizer*, LibC::LPWSTR, Int32*, HRESULT)
    set_property_string : Proc(ISpRecognizer*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_property_string : Proc(ISpRecognizer*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    set_recognizer : Proc(ISpRecognizer*, ISpObjectToken, HRESULT)
    get_recognizer : Proc(ISpRecognizer*, ISpObjectToken*, HRESULT)
    set_input : Proc(ISpRecognizer*, IUnknown, LibC::BOOL, HRESULT)
    get_input_object_token : Proc(ISpRecognizer*, ISpObjectToken*, HRESULT)
    get_input_stream : Proc(ISpRecognizer*, ISpStreamFormat*, HRESULT)
    create_reco_context : Proc(ISpRecognizer*, ISpRecoContext*, HRESULT)
    get_reco_profile : Proc(ISpRecognizer*, ISpObjectToken*, HRESULT)
    set_reco_profile : Proc(ISpRecognizer*, ISpObjectToken, HRESULT)
    is_shared_instance : Proc(ISpRecognizer*, HRESULT)
    get_reco_state : Proc(ISpRecognizer*, SPRECOSTATE*, HRESULT)
    set_reco_state : Proc(ISpRecognizer*, SPRECOSTATE, HRESULT)
    get_status : Proc(ISpRecognizer*, SPRECOGNIZERSTATUS*, HRESULT)
    get_format : Proc(ISpRecognizer*, SPWAVEFORMATTYPE, Guid*, WAVEFORMATEX**, HRESULT)
    is_ui_supported : Proc(ISpRecognizer*, LibC::LPWSTR, Void*, UInt32, LibC::BOOL*, HRESULT)
    display_ui : Proc(ISpRecognizer*, LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, HRESULT)
    emulate_recognition : Proc(ISpRecognizer*, ISpPhrase, HRESULT)
  end

  ISpRecognizer_GUID = LibC::GUID.new("c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c")
  CLSID_ISpRecognizer = "c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c"
  struct ISpRecognizer
    lpVtbl : ISpRecognizerVTbl*
  end

  struct ISpSerializeStateVTbl
    query_interface : Proc(ISpSerializeState*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpSerializeState*, UInt32)
    release : Proc(ISpSerializeState*, UInt32)
    get_serialized_state : Proc(ISpSerializeState*, UInt8**, UInt32*, UInt32, HRESULT)
    set_serialized_state : Proc(ISpSerializeState*, UInt8*, UInt32, UInt32, HRESULT)
  end

  ISpSerializeState_GUID = LibC::GUID.new("21b501a0-0ec7-46c9-92c3-a2bc784c54b9")
  CLSID_ISpSerializeState = "21b501a0-0ec7-46c9-92c3-a2bc784c54b9"
  struct ISpSerializeState
    lpVtbl : ISpSerializeStateVTbl*
  end

  struct ISpRecognizer2VTbl
    query_interface : Proc(ISpRecognizer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpRecognizer2*, UInt32)
    release : Proc(ISpRecognizer2*, UInt32)
    emulate_recognition_ex : Proc(ISpRecognizer2*, ISpPhrase, UInt32, HRESULT)
    set_training_state : Proc(ISpRecognizer2*, LibC::BOOL, LibC::BOOL, HRESULT)
    reset_acoustic_model_adaptation : Proc(ISpRecognizer2*, HRESULT)
  end

  ISpRecognizer2_GUID = LibC::GUID.new("8fc6d974-c81e-4098-93c5-0147f61ed4d3")
  CLSID_ISpRecognizer2 = "8fc6d974-c81e-4098-93c5-0147f61ed4d3"
  struct ISpRecognizer2
    lpVtbl : ISpRecognizer2VTbl*
  end

  struct ISpEnginePronunciationVTbl
    query_interface : Proc(ISpEnginePronunciation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpEnginePronunciation*, UInt32)
    release : Proc(ISpEnginePronunciation*, UInt32)
    normalize : Proc(ISpEnginePronunciation*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPNORMALIZATIONLIST*, HRESULT)
    get_pronunciations : Proc(ISpEnginePronunciation*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPWORDPRONUNCIATIONLIST*, HRESULT)
  end

  ISpEnginePronunciation_GUID = LibC::GUID.new("c360ce4b-76d1-4214-ad68-52657d5083da")
  CLSID_ISpEnginePronunciation = "c360ce4b-76d1-4214-ad68-52657d5083da"
  struct ISpEnginePronunciation
    lpVtbl : ISpEnginePronunciationVTbl*
  end

  struct ISpDisplayAlternatesVTbl
    query_interface : Proc(ISpDisplayAlternates*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpDisplayAlternates*, UInt32)
    release : Proc(ISpDisplayAlternates*, UInt32)
    get_display_alternates : Proc(ISpDisplayAlternates*, SPDISPLAYPHRASE*, UInt32, SPDISPLAYPHRASE**, UInt32*, HRESULT)
    set_full_stop_trail_space : Proc(ISpDisplayAlternates*, UInt32, HRESULT)
  end

  ISpDisplayAlternates_GUID = LibC::GUID.new("c8d7c7e2-0dde-44b7-afe3-b0c991fbeb5e")
  CLSID_ISpDisplayAlternates = "c8d7c7e2-0dde-44b7-afe3-b0c991fbeb5e"
  struct ISpDisplayAlternates
    lpVtbl : ISpDisplayAlternatesVTbl*
  end

  struct ISpeechDataKeyVTbl
    query_interface : Proc(ISpeechDataKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechDataKey*, UInt32)
    release : Proc(ISpeechDataKey*, UInt32)
    get_type_info_count : Proc(ISpeechDataKey*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechDataKey*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechDataKey*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechDataKey*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_binary_value : Proc(ISpeechDataKey*, UInt8*, VARIANT, HRESULT)
    get_binary_value : Proc(ISpeechDataKey*, UInt8*, VARIANT*, HRESULT)
    set_string_value : Proc(ISpeechDataKey*, UInt8*, UInt8*, HRESULT)
    get_string_value : Proc(ISpeechDataKey*, UInt8*, UInt8**, HRESULT)
    set_long_value : Proc(ISpeechDataKey*, UInt8*, Int32, HRESULT)
    get_long_value : Proc(ISpeechDataKey*, UInt8*, Int32*, HRESULT)
    open_key : Proc(ISpeechDataKey*, UInt8*, ISpeechDataKey*, HRESULT)
    create_key : Proc(ISpeechDataKey*, UInt8*, ISpeechDataKey*, HRESULT)
    delete_key : Proc(ISpeechDataKey*, UInt8*, HRESULT)
    delete_value : Proc(ISpeechDataKey*, UInt8*, HRESULT)
    enum_keys : Proc(ISpeechDataKey*, Int32, UInt8**, HRESULT)
    enum_values : Proc(ISpeechDataKey*, Int32, UInt8**, HRESULT)
  end

  ISpeechDataKey_GUID = LibC::GUID.new("ce17c09b-4efa-44d5-a4c9-59d9585ab0cd")
  CLSID_ISpeechDataKey = "ce17c09b-4efa-44d5-a4c9-59d9585ab0cd"
  struct ISpeechDataKey
    lpVtbl : ISpeechDataKeyVTbl*
  end

  struct ISpeechObjectTokenVTbl
    query_interface : Proc(ISpeechObjectToken*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechObjectToken*, UInt32)
    release : Proc(ISpeechObjectToken*, UInt32)
    get_type_info_count : Proc(ISpeechObjectToken*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechObjectToken*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechObjectToken*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechObjectToken*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(ISpeechObjectToken*, UInt8**, HRESULT)
    get_data_key : Proc(ISpeechObjectToken*, ISpeechDataKey*, HRESULT)
    get_category : Proc(ISpeechObjectToken*, ISpeechObjectTokenCategory*, HRESULT)
    get_description : Proc(ISpeechObjectToken*, Int32, UInt8**, HRESULT)
    set_id : Proc(ISpeechObjectToken*, UInt8*, UInt8*, Int16, HRESULT)
    get_attribute : Proc(ISpeechObjectToken*, UInt8*, UInt8**, HRESULT)
    create_instance : Proc(ISpeechObjectToken*, IUnknown, SpeechTokenContext, IUnknown*, HRESULT)
    remove : Proc(ISpeechObjectToken*, UInt8*, HRESULT)
    get_storage_file_name : Proc(ISpeechObjectToken*, UInt8*, UInt8*, UInt8*, SpeechTokenShellFolder, UInt8**, HRESULT)
    remove_storage_file_name : Proc(ISpeechObjectToken*, UInt8*, UInt8*, Int16, HRESULT)
    is_ui_supported : Proc(ISpeechObjectToken*, UInt8*, VARIANT*, IUnknown, Int16*, HRESULT)
    display_ui : Proc(ISpeechObjectToken*, Int32, UInt8*, UInt8*, VARIANT*, IUnknown, HRESULT)
    matches_attributes : Proc(ISpeechObjectToken*, UInt8*, Int16*, HRESULT)
  end

  ISpeechObjectToken_GUID = LibC::GUID.new("c74a3adc-b727-4500-a84a-b526721c8b8c")
  CLSID_ISpeechObjectToken = "c74a3adc-b727-4500-a84a-b526721c8b8c"
  struct ISpeechObjectToken
    lpVtbl : ISpeechObjectTokenVTbl*
  end

  struct ISpeechObjectTokensVTbl
    query_interface : Proc(ISpeechObjectTokens*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechObjectTokens*, UInt32)
    release : Proc(ISpeechObjectTokens*, UInt32)
    get_type_info_count : Proc(ISpeechObjectTokens*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechObjectTokens*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechObjectTokens*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechObjectTokens*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechObjectTokens*, Int32*, HRESULT)
    item : Proc(ISpeechObjectTokens*, Int32, ISpeechObjectToken*, HRESULT)
    get__new_enum : Proc(ISpeechObjectTokens*, IUnknown*, HRESULT)
  end

  ISpeechObjectTokens_GUID = LibC::GUID.new("9285b776-2e7b-4bc0-b53e-580eb6fa967f")
  CLSID_ISpeechObjectTokens = "9285b776-2e7b-4bc0-b53e-580eb6fa967f"
  struct ISpeechObjectTokens
    lpVtbl : ISpeechObjectTokensVTbl*
  end

  struct ISpeechObjectTokenCategoryVTbl
    query_interface : Proc(ISpeechObjectTokenCategory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechObjectTokenCategory*, UInt32)
    release : Proc(ISpeechObjectTokenCategory*, UInt32)
    get_type_info_count : Proc(ISpeechObjectTokenCategory*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechObjectTokenCategory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechObjectTokenCategory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechObjectTokenCategory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(ISpeechObjectTokenCategory*, UInt8**, HRESULT)
    put_default : Proc(ISpeechObjectTokenCategory*, UInt8*, HRESULT)
    get_default : Proc(ISpeechObjectTokenCategory*, UInt8**, HRESULT)
    set_id : Proc(ISpeechObjectTokenCategory*, UInt8*, Int16, HRESULT)
    get_data_key : Proc(ISpeechObjectTokenCategory*, SpeechDataKeyLocation, ISpeechDataKey*, HRESULT)
    enumerate_tokens : Proc(ISpeechObjectTokenCategory*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
  end

  ISpeechObjectTokenCategory_GUID = LibC::GUID.new("ca7eac50-2d01-4145-86d4-5ae7d70f4469")
  CLSID_ISpeechObjectTokenCategory = "ca7eac50-2d01-4145-86d4-5ae7d70f4469"
  struct ISpeechObjectTokenCategory
    lpVtbl : ISpeechObjectTokenCategoryVTbl*
  end

  struct ISpeechAudioBufferInfoVTbl
    query_interface : Proc(ISpeechAudioBufferInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechAudioBufferInfo*, UInt32)
    release : Proc(ISpeechAudioBufferInfo*, UInt32)
    get_type_info_count : Proc(ISpeechAudioBufferInfo*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechAudioBufferInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechAudioBufferInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechAudioBufferInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_min_notification : Proc(ISpeechAudioBufferInfo*, Int32*, HRESULT)
    put_min_notification : Proc(ISpeechAudioBufferInfo*, Int32, HRESULT)
    get_buffer_size : Proc(ISpeechAudioBufferInfo*, Int32*, HRESULT)
    put_buffer_size : Proc(ISpeechAudioBufferInfo*, Int32, HRESULT)
    get_event_bias : Proc(ISpeechAudioBufferInfo*, Int32*, HRESULT)
    put_event_bias : Proc(ISpeechAudioBufferInfo*, Int32, HRESULT)
  end

  ISpeechAudioBufferInfo_GUID = LibC::GUID.new("11b103d8-1142-4edf-a093-82fb3915f8cc")
  CLSID_ISpeechAudioBufferInfo = "11b103d8-1142-4edf-a093-82fb3915f8cc"
  struct ISpeechAudioBufferInfo
    lpVtbl : ISpeechAudioBufferInfoVTbl*
  end

  struct ISpeechAudioStatusVTbl
    query_interface : Proc(ISpeechAudioStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechAudioStatus*, UInt32)
    release : Proc(ISpeechAudioStatus*, UInt32)
    get_type_info_count : Proc(ISpeechAudioStatus*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechAudioStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechAudioStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechAudioStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_free_buffer_space : Proc(ISpeechAudioStatus*, Int32*, HRESULT)
    get_non_blocking_io : Proc(ISpeechAudioStatus*, Int32*, HRESULT)
    get_state : Proc(ISpeechAudioStatus*, SpeechAudioState*, HRESULT)
    get_current_seek_position : Proc(ISpeechAudioStatus*, VARIANT*, HRESULT)
    get_current_device_position : Proc(ISpeechAudioStatus*, VARIANT*, HRESULT)
  end

  ISpeechAudioStatus_GUID = LibC::GUID.new("c62d9c91-7458-47f6-862d-1ef86fb0b278")
  CLSID_ISpeechAudioStatus = "c62d9c91-7458-47f6-862d-1ef86fb0b278"
  struct ISpeechAudioStatus
    lpVtbl : ISpeechAudioStatusVTbl*
  end

  struct ISpeechAudioFormatVTbl
    query_interface : Proc(ISpeechAudioFormat*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechAudioFormat*, UInt32)
    release : Proc(ISpeechAudioFormat*, UInt32)
    get_type_info_count : Proc(ISpeechAudioFormat*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechAudioFormat*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechAudioFormat*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechAudioFormat*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ISpeechAudioFormat*, SpeechAudioFormatType*, HRESULT)
    put_type : Proc(ISpeechAudioFormat*, SpeechAudioFormatType, HRESULT)
    get_guid : Proc(ISpeechAudioFormat*, UInt8**, HRESULT)
    put_guid : Proc(ISpeechAudioFormat*, UInt8*, HRESULT)
    get_wave_format_ex : Proc(ISpeechAudioFormat*, ISpeechWaveFormatEx*, HRESULT)
    set_wave_format_ex : Proc(ISpeechAudioFormat*, ISpeechWaveFormatEx, HRESULT)
  end

  ISpeechAudioFormat_GUID = LibC::GUID.new("e6e9c590-3e18-40e3-8299-061f98bde7c7")
  CLSID_ISpeechAudioFormat = "e6e9c590-3e18-40e3-8299-061f98bde7c7"
  struct ISpeechAudioFormat
    lpVtbl : ISpeechAudioFormatVTbl*
  end

  struct ISpeechWaveFormatExVTbl
    query_interface : Proc(ISpeechWaveFormatEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechWaveFormatEx*, UInt32)
    release : Proc(ISpeechWaveFormatEx*, UInt32)
    get_type_info_count : Proc(ISpeechWaveFormatEx*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechWaveFormatEx*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechWaveFormatEx*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechWaveFormatEx*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format_tag : Proc(ISpeechWaveFormatEx*, Int16*, HRESULT)
    put_format_tag : Proc(ISpeechWaveFormatEx*, Int16, HRESULT)
    get_channels : Proc(ISpeechWaveFormatEx*, Int16*, HRESULT)
    put_channels : Proc(ISpeechWaveFormatEx*, Int16, HRESULT)
    get_samples_per_sec : Proc(ISpeechWaveFormatEx*, Int32*, HRESULT)
    put_samples_per_sec : Proc(ISpeechWaveFormatEx*, Int32, HRESULT)
    get_avg_bytes_per_sec : Proc(ISpeechWaveFormatEx*, Int32*, HRESULT)
    put_avg_bytes_per_sec : Proc(ISpeechWaveFormatEx*, Int32, HRESULT)
    get_block_align : Proc(ISpeechWaveFormatEx*, Int16*, HRESULT)
    put_block_align : Proc(ISpeechWaveFormatEx*, Int16, HRESULT)
    get_bits_per_sample : Proc(ISpeechWaveFormatEx*, Int16*, HRESULT)
    put_bits_per_sample : Proc(ISpeechWaveFormatEx*, Int16, HRESULT)
    get_extra_data : Proc(ISpeechWaveFormatEx*, VARIANT*, HRESULT)
    put_extra_data : Proc(ISpeechWaveFormatEx*, VARIANT, HRESULT)
  end

  ISpeechWaveFormatEx_GUID = LibC::GUID.new("7a1ef0d5-1581-4741-88e4-209a49f11a10")
  CLSID_ISpeechWaveFormatEx = "7a1ef0d5-1581-4741-88e4-209a49f11a10"
  struct ISpeechWaveFormatEx
    lpVtbl : ISpeechWaveFormatExVTbl*
  end

  struct ISpeechBaseStreamVTbl
    query_interface : Proc(ISpeechBaseStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechBaseStream*, UInt32)
    release : Proc(ISpeechBaseStream*, UInt32)
    get_type_info_count : Proc(ISpeechBaseStream*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechBaseStream*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechBaseStream*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechBaseStream*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechBaseStream*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechBaseStream*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechBaseStream*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechBaseStream*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechBaseStream*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
  end

  ISpeechBaseStream_GUID = LibC::GUID.new("6450336f-7d49-4ced-8097-49d6dee37294")
  CLSID_ISpeechBaseStream = "6450336f-7d49-4ced-8097-49d6dee37294"
  struct ISpeechBaseStream
    lpVtbl : ISpeechBaseStreamVTbl*
  end

  struct ISpeechFileStreamVTbl
    query_interface : Proc(ISpeechFileStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechFileStream*, UInt32)
    release : Proc(ISpeechFileStream*, UInt32)
    get_type_info_count : Proc(ISpeechFileStream*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechFileStream*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechFileStream*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechFileStream*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechFileStream*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechFileStream*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechFileStream*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechFileStream*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechFileStream*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
    open : Proc(ISpeechFileStream*, UInt8*, SpeechStreamFileMode, Int16, HRESULT)
    close : Proc(ISpeechFileStream*, HRESULT)
  end

  ISpeechFileStream_GUID = LibC::GUID.new("af67f125-ab39-4e93-b4a2-cc2e66e182a7")
  CLSID_ISpeechFileStream = "af67f125-ab39-4e93-b4a2-cc2e66e182a7"
  struct ISpeechFileStream
    lpVtbl : ISpeechFileStreamVTbl*
  end

  struct ISpeechMemoryStreamVTbl
    query_interface : Proc(ISpeechMemoryStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechMemoryStream*, UInt32)
    release : Proc(ISpeechMemoryStream*, UInt32)
    get_type_info_count : Proc(ISpeechMemoryStream*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechMemoryStream*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechMemoryStream*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechMemoryStream*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechMemoryStream*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechMemoryStream*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechMemoryStream*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechMemoryStream*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechMemoryStream*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
    set_data : Proc(ISpeechMemoryStream*, VARIANT, HRESULT)
    get_data : Proc(ISpeechMemoryStream*, VARIANT*, HRESULT)
  end

  ISpeechMemoryStream_GUID = LibC::GUID.new("eeb14b68-808b-4abe-a5ea-b51da7588008")
  CLSID_ISpeechMemoryStream = "eeb14b68-808b-4abe-a5ea-b51da7588008"
  struct ISpeechMemoryStream
    lpVtbl : ISpeechMemoryStreamVTbl*
  end

  struct ISpeechCustomStreamVTbl
    query_interface : Proc(ISpeechCustomStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechCustomStream*, UInt32)
    release : Proc(ISpeechCustomStream*, UInt32)
    get_type_info_count : Proc(ISpeechCustomStream*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechCustomStream*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechCustomStream*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechCustomStream*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechCustomStream*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechCustomStream*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechCustomStream*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechCustomStream*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechCustomStream*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
    get_base_stream : Proc(ISpeechCustomStream*, IUnknown*, HRESULT)
    putref_base_stream : Proc(ISpeechCustomStream*, IUnknown, HRESULT)
  end

  ISpeechCustomStream_GUID = LibC::GUID.new("1a9e9f4f-104f-4db8-a115-efd7fd0c97ae")
  CLSID_ISpeechCustomStream = "1a9e9f4f-104f-4db8-a115-efd7fd0c97ae"
  struct ISpeechCustomStream
    lpVtbl : ISpeechCustomStreamVTbl*
  end

  struct ISpeechAudioVTbl
    query_interface : Proc(ISpeechAudio*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechAudio*, UInt32)
    release : Proc(ISpeechAudio*, UInt32)
    get_type_info_count : Proc(ISpeechAudio*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechAudio*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechAudio*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechAudio*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechAudio*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechAudio*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechAudio*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechAudio*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechAudio*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
    get_status : Proc(ISpeechAudio*, ISpeechAudioStatus*, HRESULT)
    get_buffer_info : Proc(ISpeechAudio*, ISpeechAudioBufferInfo*, HRESULT)
    get_default_format : Proc(ISpeechAudio*, ISpeechAudioFormat*, HRESULT)
    get_volume : Proc(ISpeechAudio*, Int32*, HRESULT)
    put_volume : Proc(ISpeechAudio*, Int32, HRESULT)
    get_buffer_notify_size : Proc(ISpeechAudio*, Int32*, HRESULT)
    put_buffer_notify_size : Proc(ISpeechAudio*, Int32, HRESULT)
    get_event_handle : Proc(ISpeechAudio*, Int32*, HRESULT)
    set_state : Proc(ISpeechAudio*, SpeechAudioState, HRESULT)
  end

  ISpeechAudio_GUID = LibC::GUID.new("cff8e175-019e-11d3-a08e-00c04f8ef9b5")
  CLSID_ISpeechAudio = "cff8e175-019e-11d3-a08e-00c04f8ef9b5"
  struct ISpeechAudio
    lpVtbl : ISpeechAudioVTbl*
  end

  struct ISpeechMMSysAudioVTbl
    query_interface : Proc(ISpeechMMSysAudio*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechMMSysAudio*, UInt32)
    release : Proc(ISpeechMMSysAudio*, UInt32)
    get_type_info_count : Proc(ISpeechMMSysAudio*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechMMSysAudio*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechMMSysAudio*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechMMSysAudio*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_format : Proc(ISpeechMMSysAudio*, ISpeechAudioFormat*, HRESULT)
    putref_format : Proc(ISpeechMMSysAudio*, ISpeechAudioFormat, HRESULT)
    read : Proc(ISpeechMMSysAudio*, VARIANT*, Int32, Int32*, HRESULT)
    write : Proc(ISpeechMMSysAudio*, VARIANT, Int32*, HRESULT)
    seek : Proc(ISpeechMMSysAudio*, VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)
    get_status : Proc(ISpeechMMSysAudio*, ISpeechAudioStatus*, HRESULT)
    get_buffer_info : Proc(ISpeechMMSysAudio*, ISpeechAudioBufferInfo*, HRESULT)
    get_default_format : Proc(ISpeechMMSysAudio*, ISpeechAudioFormat*, HRESULT)
    get_volume : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
    put_volume : Proc(ISpeechMMSysAudio*, Int32, HRESULT)
    get_buffer_notify_size : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
    put_buffer_notify_size : Proc(ISpeechMMSysAudio*, Int32, HRESULT)
    get_event_handle : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
    set_state : Proc(ISpeechMMSysAudio*, SpeechAudioState, HRESULT)
    get_device_id : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
    put_device_id : Proc(ISpeechMMSysAudio*, Int32, HRESULT)
    get_line_id : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
    put_line_id : Proc(ISpeechMMSysAudio*, Int32, HRESULT)
    get_mm_handle : Proc(ISpeechMMSysAudio*, Int32*, HRESULT)
  end

  ISpeechMMSysAudio_GUID = LibC::GUID.new("3c76af6d-1fd7-4831-81d1-3b71d5a13c44")
  CLSID_ISpeechMMSysAudio = "3c76af6d-1fd7-4831-81d1-3b71d5a13c44"
  struct ISpeechMMSysAudio
    lpVtbl : ISpeechMMSysAudioVTbl*
  end

  struct ISpeechVoiceVTbl
    query_interface : Proc(ISpeechVoice*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechVoice*, UInt32)
    release : Proc(ISpeechVoice*, UInt32)
    get_type_info_count : Proc(ISpeechVoice*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechVoice*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechVoice*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechVoice*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status : Proc(ISpeechVoice*, ISpeechVoiceStatus*, HRESULT)
    get_voice : Proc(ISpeechVoice*, ISpeechObjectToken*, HRESULT)
    putref_voice : Proc(ISpeechVoice*, ISpeechObjectToken, HRESULT)
    get_audio_output : Proc(ISpeechVoice*, ISpeechObjectToken*, HRESULT)
    putref_audio_output : Proc(ISpeechVoice*, ISpeechObjectToken, HRESULT)
    get_audio_output_stream : Proc(ISpeechVoice*, ISpeechBaseStream*, HRESULT)
    putref_audio_output_stream : Proc(ISpeechVoice*, ISpeechBaseStream, HRESULT)
    get_rate : Proc(ISpeechVoice*, Int32*, HRESULT)
    put_rate : Proc(ISpeechVoice*, Int32, HRESULT)
    get_volume : Proc(ISpeechVoice*, Int32*, HRESULT)
    put_volume : Proc(ISpeechVoice*, Int32, HRESULT)
    put_allow_audio_output_format_changes_on_next_set : Proc(ISpeechVoice*, Int16, HRESULT)
    get_allow_audio_output_format_changes_on_next_set : Proc(ISpeechVoice*, Int16*, HRESULT)
    get_event_interests : Proc(ISpeechVoice*, SpeechVoiceEvents*, HRESULT)
    put_event_interests : Proc(ISpeechVoice*, SpeechVoiceEvents, HRESULT)
    put_priority : Proc(ISpeechVoice*, SpeechVoicePriority, HRESULT)
    get_priority : Proc(ISpeechVoice*, SpeechVoicePriority*, HRESULT)
    put_alert_boundary : Proc(ISpeechVoice*, SpeechVoiceEvents, HRESULT)
    get_alert_boundary : Proc(ISpeechVoice*, SpeechVoiceEvents*, HRESULT)
    put_synchronous_speak_timeout : Proc(ISpeechVoice*, Int32, HRESULT)
    get_synchronous_speak_timeout : Proc(ISpeechVoice*, Int32*, HRESULT)
    speak : Proc(ISpeechVoice*, UInt8*, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    speak_stream : Proc(ISpeechVoice*, ISpeechBaseStream, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    pause : Proc(ISpeechVoice*, HRESULT)
    resume : Proc(ISpeechVoice*, HRESULT)
    skip : Proc(ISpeechVoice*, UInt8*, Int32, Int32*, HRESULT)
    get_voices : Proc(ISpeechVoice*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
    get_audio_outputs : Proc(ISpeechVoice*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
    wait_until_done : Proc(ISpeechVoice*, Int32, Int16*, HRESULT)
    speak_complete_event : Proc(ISpeechVoice*, Int32*, HRESULT)
    is_ui_supported : Proc(ISpeechVoice*, UInt8*, VARIANT*, Int16*, HRESULT)
    display_ui : Proc(ISpeechVoice*, Int32, UInt8*, UInt8*, VARIANT*, HRESULT)
  end

  ISpeechVoice_GUID = LibC::GUID.new("269316d8-57bd-11d2-9eee-00c04f797396")
  CLSID_ISpeechVoice = "269316d8-57bd-11d2-9eee-00c04f797396"
  struct ISpeechVoice
    lpVtbl : ISpeechVoiceVTbl*
  end

  struct ISpeechVoiceStatusVTbl
    query_interface : Proc(ISpeechVoiceStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechVoiceStatus*, UInt32)
    release : Proc(ISpeechVoiceStatus*, UInt32)
    get_type_info_count : Proc(ISpeechVoiceStatus*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechVoiceStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechVoiceStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechVoiceStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_current_stream_number : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_last_stream_number_queued : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_last_h_result : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_running_state : Proc(ISpeechVoiceStatus*, SpeechRunState*, HRESULT)
    get_input_word_position : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_input_word_length : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_input_sentence_position : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_input_sentence_length : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_last_bookmark : Proc(ISpeechVoiceStatus*, UInt8**, HRESULT)
    get_last_bookmark_id : Proc(ISpeechVoiceStatus*, Int32*, HRESULT)
    get_phoneme_id : Proc(ISpeechVoiceStatus*, Int16*, HRESULT)
    get_viseme_id : Proc(ISpeechVoiceStatus*, Int16*, HRESULT)
  end

  ISpeechVoiceStatus_GUID = LibC::GUID.new("8be47b07-57f6-11d2-9eee-00c04f797396")
  CLSID_ISpeechVoiceStatus = "8be47b07-57f6-11d2-9eee-00c04f797396"
  struct ISpeechVoiceStatus
    lpVtbl : ISpeechVoiceStatusVTbl*
  end

  struct IISpeechVoiceEventsVTbl
    query_interface : Proc(IISpeechVoiceEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IISpeechVoiceEvents*, UInt32)
    release : Proc(IISpeechVoiceEvents*, UInt32)
    get_type_info_count : Proc(IISpeechVoiceEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IISpeechVoiceEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IISpeechVoiceEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IISpeechVoiceEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IISpeechVoiceEvents_GUID = LibC::GUID.new("a372acd1-3bef-4bbd-8ffb-cb3e2b416af8")
  CLSID_IISpeechVoiceEvents = "a372acd1-3bef-4bbd-8ffb-cb3e2b416af8"
  struct IISpeechVoiceEvents
    lpVtbl : IISpeechVoiceEventsVTbl*
  end

  struct ISpeechRecognizerVTbl
    query_interface : Proc(ISpeechRecognizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecognizer*, UInt32)
    release : Proc(ISpeechRecognizer*, UInt32)
    get_type_info_count : Proc(ISpeechRecognizer*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecognizer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecognizer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecognizer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    putref_recognizer : Proc(ISpeechRecognizer*, ISpeechObjectToken, HRESULT)
    get_recognizer : Proc(ISpeechRecognizer*, ISpeechObjectToken*, HRESULT)
    put_allow_audio_input_format_changes_on_next_set : Proc(ISpeechRecognizer*, Int16, HRESULT)
    get_allow_audio_input_format_changes_on_next_set : Proc(ISpeechRecognizer*, Int16*, HRESULT)
    putref_audio_input : Proc(ISpeechRecognizer*, ISpeechObjectToken, HRESULT)
    get_audio_input : Proc(ISpeechRecognizer*, ISpeechObjectToken*, HRESULT)
    putref_audio_input_stream : Proc(ISpeechRecognizer*, ISpeechBaseStream, HRESULT)
    get_audio_input_stream : Proc(ISpeechRecognizer*, ISpeechBaseStream*, HRESULT)
    get_is_shared : Proc(ISpeechRecognizer*, Int16*, HRESULT)
    put_state : Proc(ISpeechRecognizer*, SpeechRecognizerState, HRESULT)
    get_state : Proc(ISpeechRecognizer*, SpeechRecognizerState*, HRESULT)
    get_status : Proc(ISpeechRecognizer*, ISpeechRecognizerStatus*, HRESULT)
    putref_profile : Proc(ISpeechRecognizer*, ISpeechObjectToken, HRESULT)
    get_profile : Proc(ISpeechRecognizer*, ISpeechObjectToken*, HRESULT)
    emulate_recognition : Proc(ISpeechRecognizer*, VARIANT, VARIANT*, Int32, HRESULT)
    create_reco_context : Proc(ISpeechRecognizer*, ISpeechRecoContext*, HRESULT)
    get_format : Proc(ISpeechRecognizer*, SpeechFormatType, ISpeechAudioFormat*, HRESULT)
    set_property_number : Proc(ISpeechRecognizer*, UInt8*, Int32, Int16*, HRESULT)
    get_property_number : Proc(ISpeechRecognizer*, UInt8*, Int32*, Int16*, HRESULT)
    set_property_string : Proc(ISpeechRecognizer*, UInt8*, UInt8*, Int16*, HRESULT)
    get_property_string : Proc(ISpeechRecognizer*, UInt8*, UInt8**, Int16*, HRESULT)
    is_ui_supported : Proc(ISpeechRecognizer*, UInt8*, VARIANT*, Int16*, HRESULT)
    display_ui : Proc(ISpeechRecognizer*, Int32, UInt8*, UInt8*, VARIANT*, HRESULT)
    get_recognizers : Proc(ISpeechRecognizer*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
    get_audio_inputs : Proc(ISpeechRecognizer*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
    get_profiles : Proc(ISpeechRecognizer*, UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)
  end

  ISpeechRecognizer_GUID = LibC::GUID.new("2d5f1c0c-bd75-4b08-9478-3b11fea2586c")
  CLSID_ISpeechRecognizer = "2d5f1c0c-bd75-4b08-9478-3b11fea2586c"
  struct ISpeechRecognizer
    lpVtbl : ISpeechRecognizerVTbl*
  end

  struct ISpeechRecognizerStatusVTbl
    query_interface : Proc(ISpeechRecognizerStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecognizerStatus*, UInt32)
    release : Proc(ISpeechRecognizerStatus*, UInt32)
    get_type_info_count : Proc(ISpeechRecognizerStatus*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecognizerStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecognizerStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecognizerStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_audio_status : Proc(ISpeechRecognizerStatus*, ISpeechAudioStatus*, HRESULT)
    get_current_stream_position : Proc(ISpeechRecognizerStatus*, VARIANT*, HRESULT)
    get_current_stream_number : Proc(ISpeechRecognizerStatus*, Int32*, HRESULT)
    get_number_of_active_rules : Proc(ISpeechRecognizerStatus*, Int32*, HRESULT)
    get_clsid_engine : Proc(ISpeechRecognizerStatus*, UInt8**, HRESULT)
    get_supported_languages : Proc(ISpeechRecognizerStatus*, VARIANT*, HRESULT)
  end

  ISpeechRecognizerStatus_GUID = LibC::GUID.new("bff9e781-53ec-484e-bb8a-0e1b5551e35c")
  CLSID_ISpeechRecognizerStatus = "bff9e781-53ec-484e-bb8a-0e1b5551e35c"
  struct ISpeechRecognizerStatus
    lpVtbl : ISpeechRecognizerStatusVTbl*
  end

  struct ISpeechRecoContextVTbl
    query_interface : Proc(ISpeechRecoContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoContext*, UInt32)
    release : Proc(ISpeechRecoContext*, UInt32)
    get_type_info_count : Proc(ISpeechRecoContext*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_recognizer : Proc(ISpeechRecoContext*, ISpeechRecognizer*, HRESULT)
    get_audio_input_interference_status : Proc(ISpeechRecoContext*, SpeechInterference*, HRESULT)
    get_requested_ui_type : Proc(ISpeechRecoContext*, UInt8**, HRESULT)
    putref_voice : Proc(ISpeechRecoContext*, ISpeechVoice, HRESULT)
    get_voice : Proc(ISpeechRecoContext*, ISpeechVoice*, HRESULT)
    put_allow_voice_format_matching_on_next_set : Proc(ISpeechRecoContext*, Int16, HRESULT)
    get_allow_voice_format_matching_on_next_set : Proc(ISpeechRecoContext*, Int16*, HRESULT)
    put_voice_purge_event : Proc(ISpeechRecoContext*, SpeechRecoEvents, HRESULT)
    get_voice_purge_event : Proc(ISpeechRecoContext*, SpeechRecoEvents*, HRESULT)
    put_event_interests : Proc(ISpeechRecoContext*, SpeechRecoEvents, HRESULT)
    get_event_interests : Proc(ISpeechRecoContext*, SpeechRecoEvents*, HRESULT)
    put_cmd_max_alternates : Proc(ISpeechRecoContext*, Int32, HRESULT)
    get_cmd_max_alternates : Proc(ISpeechRecoContext*, Int32*, HRESULT)
    put_state : Proc(ISpeechRecoContext*, SpeechRecoContextState, HRESULT)
    get_state : Proc(ISpeechRecoContext*, SpeechRecoContextState*, HRESULT)
    put_retained_audio : Proc(ISpeechRecoContext*, SpeechRetainedAudioOptions, HRESULT)
    get_retained_audio : Proc(ISpeechRecoContext*, SpeechRetainedAudioOptions*, HRESULT)
    putref_retained_audio_format : Proc(ISpeechRecoContext*, ISpeechAudioFormat, HRESULT)
    get_retained_audio_format : Proc(ISpeechRecoContext*, ISpeechAudioFormat*, HRESULT)
    pause : Proc(ISpeechRecoContext*, HRESULT)
    resume : Proc(ISpeechRecoContext*, HRESULT)
    create_grammar : Proc(ISpeechRecoContext*, VARIANT, ISpeechRecoGrammar*, HRESULT)
    create_result_from_memory : Proc(ISpeechRecoContext*, VARIANT*, ISpeechRecoResult*, HRESULT)
    bookmark : Proc(ISpeechRecoContext*, SpeechBookmarkOptions, VARIANT, VARIANT, HRESULT)
    set_adaptation_data : Proc(ISpeechRecoContext*, UInt8*, HRESULT)
  end

  ISpeechRecoContext_GUID = LibC::GUID.new("580aa49d-7e1e-4809-b8e2-57da806104b8")
  CLSID_ISpeechRecoContext = "580aa49d-7e1e-4809-b8e2-57da806104b8"
  struct ISpeechRecoContext
    lpVtbl : ISpeechRecoContextVTbl*
  end

  struct ISpeechRecoGrammarVTbl
    query_interface : Proc(ISpeechRecoGrammar*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoGrammar*, UInt32)
    release : Proc(ISpeechRecoGrammar*, UInt32)
    get_type_info_count : Proc(ISpeechRecoGrammar*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoGrammar*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoGrammar*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoGrammar*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(ISpeechRecoGrammar*, VARIANT*, HRESULT)
    get_reco_context : Proc(ISpeechRecoGrammar*, ISpeechRecoContext*, HRESULT)
    put_state : Proc(ISpeechRecoGrammar*, SpeechGrammarState, HRESULT)
    get_state : Proc(ISpeechRecoGrammar*, SpeechGrammarState*, HRESULT)
    get_rules : Proc(ISpeechRecoGrammar*, ISpeechGrammarRules*, HRESULT)
    reset : Proc(ISpeechRecoGrammar*, Int32, HRESULT)
    cmd_load_from_file : Proc(ISpeechRecoGrammar*, UInt8*, SpeechLoadOption, HRESULT)
    cmd_load_from_object : Proc(ISpeechRecoGrammar*, UInt8*, UInt8*, SpeechLoadOption, HRESULT)
    cmd_load_from_resource : Proc(ISpeechRecoGrammar*, Int32, VARIANT, VARIANT, Int32, SpeechLoadOption, HRESULT)
    cmd_load_from_memory : Proc(ISpeechRecoGrammar*, VARIANT, SpeechLoadOption, HRESULT)
    cmd_load_from_proprietary_grammar : Proc(ISpeechRecoGrammar*, UInt8*, UInt8*, VARIANT, SpeechLoadOption, HRESULT)
    cmd_set_rule_state : Proc(ISpeechRecoGrammar*, UInt8*, SpeechRuleState, HRESULT)
    cmd_set_rule_id_state : Proc(ISpeechRecoGrammar*, Int32, SpeechRuleState, HRESULT)
    dictation_load : Proc(ISpeechRecoGrammar*, UInt8*, SpeechLoadOption, HRESULT)
    dictation_unload : Proc(ISpeechRecoGrammar*, HRESULT)
    dictation_set_state : Proc(ISpeechRecoGrammar*, SpeechRuleState, HRESULT)
    set_word_sequence_data : Proc(ISpeechRecoGrammar*, UInt8*, Int32, ISpeechTextSelectionInformation, HRESULT)
    set_text_selection : Proc(ISpeechRecoGrammar*, ISpeechTextSelectionInformation, HRESULT)
    is_pronounceable : Proc(ISpeechRecoGrammar*, UInt8*, SpeechWordPronounceable*, HRESULT)
  end

  ISpeechRecoGrammar_GUID = LibC::GUID.new("b6d6f79f-2158-4e50-b5bc-9a9ccd852a09")
  CLSID_ISpeechRecoGrammar = "b6d6f79f-2158-4e50-b5bc-9a9ccd852a09"
  struct ISpeechRecoGrammar
    lpVtbl : ISpeechRecoGrammarVTbl*
  end

  struct IISpeechRecoContextEventsVTbl
    query_interface : Proc(IISpeechRecoContextEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IISpeechRecoContextEvents*, UInt32)
    release : Proc(IISpeechRecoContextEvents*, UInt32)
    get_type_info_count : Proc(IISpeechRecoContextEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IISpeechRecoContextEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IISpeechRecoContextEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IISpeechRecoContextEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IISpeechRecoContextEvents_GUID = LibC::GUID.new("7b8fcb42-0e9d-4f00-a048-7b04d6179d3d")
  CLSID_IISpeechRecoContextEvents = "7b8fcb42-0e9d-4f00-a048-7b04d6179d3d"
  struct IISpeechRecoContextEvents
    lpVtbl : IISpeechRecoContextEventsVTbl*
  end

  struct ISpeechGrammarRuleVTbl
    query_interface : Proc(ISpeechGrammarRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechGrammarRule*, UInt32)
    release : Proc(ISpeechGrammarRule*, UInt32)
    get_type_info_count : Proc(ISpeechGrammarRule*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechGrammarRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechGrammarRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechGrammarRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_attributes : Proc(ISpeechGrammarRule*, SpeechRuleAttributes*, HRESULT)
    get_initial_state : Proc(ISpeechGrammarRule*, ISpeechGrammarRuleState*, HRESULT)
    get_name : Proc(ISpeechGrammarRule*, UInt8**, HRESULT)
    get_id : Proc(ISpeechGrammarRule*, Int32*, HRESULT)
    clear : Proc(ISpeechGrammarRule*, HRESULT)
    add_resource : Proc(ISpeechGrammarRule*, UInt8*, UInt8*, HRESULT)
    add_state : Proc(ISpeechGrammarRule*, ISpeechGrammarRuleState*, HRESULT)
  end

  ISpeechGrammarRule_GUID = LibC::GUID.new("afe719cf-5dd1-44f2-999c-7a399f1cfccc")
  CLSID_ISpeechGrammarRule = "afe719cf-5dd1-44f2-999c-7a399f1cfccc"
  struct ISpeechGrammarRule
    lpVtbl : ISpeechGrammarRuleVTbl*
  end

  struct ISpeechGrammarRulesVTbl
    query_interface : Proc(ISpeechGrammarRules*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechGrammarRules*, UInt32)
    release : Proc(ISpeechGrammarRules*, UInt32)
    get_type_info_count : Proc(ISpeechGrammarRules*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechGrammarRules*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechGrammarRules*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechGrammarRules*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechGrammarRules*, Int32*, HRESULT)
    find_rule : Proc(ISpeechGrammarRules*, VARIANT, ISpeechGrammarRule*, HRESULT)
    item : Proc(ISpeechGrammarRules*, Int32, ISpeechGrammarRule*, HRESULT)
    get__new_enum : Proc(ISpeechGrammarRules*, IUnknown*, HRESULT)
    get_dynamic : Proc(ISpeechGrammarRules*, Int16*, HRESULT)
    add : Proc(ISpeechGrammarRules*, UInt8*, SpeechRuleAttributes, Int32, ISpeechGrammarRule*, HRESULT)
    commit : Proc(ISpeechGrammarRules*, HRESULT)
    commit_and_save : Proc(ISpeechGrammarRules*, UInt8**, VARIANT*, HRESULT)
  end

  ISpeechGrammarRules_GUID = LibC::GUID.new("6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1")
  CLSID_ISpeechGrammarRules = "6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1"
  struct ISpeechGrammarRules
    lpVtbl : ISpeechGrammarRulesVTbl*
  end

  struct ISpeechGrammarRuleStateVTbl
    query_interface : Proc(ISpeechGrammarRuleState*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechGrammarRuleState*, UInt32)
    release : Proc(ISpeechGrammarRuleState*, UInt32)
    get_type_info_count : Proc(ISpeechGrammarRuleState*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechGrammarRuleState*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechGrammarRuleState*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechGrammarRuleState*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_rule : Proc(ISpeechGrammarRuleState*, ISpeechGrammarRule*, HRESULT)
    get_transitions : Proc(ISpeechGrammarRuleState*, ISpeechGrammarRuleStateTransitions*, HRESULT)
    add_word_transition : Proc(ISpeechGrammarRuleState*, ISpeechGrammarRuleState, UInt8*, UInt8*, SpeechGrammarWordType, UInt8*, Int32, VARIANT*, Float32, HRESULT)
    add_rule_transition : Proc(ISpeechGrammarRuleState*, ISpeechGrammarRuleState, ISpeechGrammarRule, UInt8*, Int32, VARIANT*, Float32, HRESULT)
    add_special_transition : Proc(ISpeechGrammarRuleState*, ISpeechGrammarRuleState, SpeechSpecialTransitionType, UInt8*, Int32, VARIANT*, Float32, HRESULT)
  end

  ISpeechGrammarRuleState_GUID = LibC::GUID.new("d4286f2c-ee67-45ae-b928-28d695362eda")
  CLSID_ISpeechGrammarRuleState = "d4286f2c-ee67-45ae-b928-28d695362eda"
  struct ISpeechGrammarRuleState
    lpVtbl : ISpeechGrammarRuleStateVTbl*
  end

  struct ISpeechGrammarRuleStateTransitionVTbl
    query_interface : Proc(ISpeechGrammarRuleStateTransition*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechGrammarRuleStateTransition*, UInt32)
    release : Proc(ISpeechGrammarRuleStateTransition*, UInt32)
    get_type_info_count : Proc(ISpeechGrammarRuleStateTransition*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechGrammarRuleStateTransition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechGrammarRuleStateTransition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechGrammarRuleStateTransition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ISpeechGrammarRuleStateTransition*, SpeechGrammarRuleStateTransitionType*, HRESULT)
    get_text : Proc(ISpeechGrammarRuleStateTransition*, UInt8**, HRESULT)
    get_rule : Proc(ISpeechGrammarRuleStateTransition*, ISpeechGrammarRule*, HRESULT)
    get_weight : Proc(ISpeechGrammarRuleStateTransition*, VARIANT*, HRESULT)
    get_property_name : Proc(ISpeechGrammarRuleStateTransition*, UInt8**, HRESULT)
    get_property_id : Proc(ISpeechGrammarRuleStateTransition*, Int32*, HRESULT)
    get_property_value : Proc(ISpeechGrammarRuleStateTransition*, VARIANT*, HRESULT)
    get_next_state : Proc(ISpeechGrammarRuleStateTransition*, ISpeechGrammarRuleState*, HRESULT)
  end

  ISpeechGrammarRuleStateTransition_GUID = LibC::GUID.new("cafd1db1-41d1-4a06-9863-e2e81da17a9a")
  CLSID_ISpeechGrammarRuleStateTransition = "cafd1db1-41d1-4a06-9863-e2e81da17a9a"
  struct ISpeechGrammarRuleStateTransition
    lpVtbl : ISpeechGrammarRuleStateTransitionVTbl*
  end

  struct ISpeechGrammarRuleStateTransitionsVTbl
    query_interface : Proc(ISpeechGrammarRuleStateTransitions*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechGrammarRuleStateTransitions*, UInt32)
    release : Proc(ISpeechGrammarRuleStateTransitions*, UInt32)
    get_type_info_count : Proc(ISpeechGrammarRuleStateTransitions*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechGrammarRuleStateTransitions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechGrammarRuleStateTransitions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechGrammarRuleStateTransitions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechGrammarRuleStateTransitions*, Int32*, HRESULT)
    item : Proc(ISpeechGrammarRuleStateTransitions*, Int32, ISpeechGrammarRuleStateTransition*, HRESULT)
    get__new_enum : Proc(ISpeechGrammarRuleStateTransitions*, IUnknown*, HRESULT)
  end

  ISpeechGrammarRuleStateTransitions_GUID = LibC::GUID.new("eabce657-75bc-44a2-aa7f-c56476742963")
  CLSID_ISpeechGrammarRuleStateTransitions = "eabce657-75bc-44a2-aa7f-c56476742963"
  struct ISpeechGrammarRuleStateTransitions
    lpVtbl : ISpeechGrammarRuleStateTransitionsVTbl*
  end

  struct ISpeechTextSelectionInformationVTbl
    query_interface : Proc(ISpeechTextSelectionInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechTextSelectionInformation*, UInt32)
    release : Proc(ISpeechTextSelectionInformation*, UInt32)
    get_type_info_count : Proc(ISpeechTextSelectionInformation*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechTextSelectionInformation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechTextSelectionInformation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechTextSelectionInformation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    put_active_offset : Proc(ISpeechTextSelectionInformation*, Int32, HRESULT)
    get_active_offset : Proc(ISpeechTextSelectionInformation*, Int32*, HRESULT)
    put_active_length : Proc(ISpeechTextSelectionInformation*, Int32, HRESULT)
    get_active_length : Proc(ISpeechTextSelectionInformation*, Int32*, HRESULT)
    put_selection_offset : Proc(ISpeechTextSelectionInformation*, Int32, HRESULT)
    get_selection_offset : Proc(ISpeechTextSelectionInformation*, Int32*, HRESULT)
    put_selection_length : Proc(ISpeechTextSelectionInformation*, Int32, HRESULT)
    get_selection_length : Proc(ISpeechTextSelectionInformation*, Int32*, HRESULT)
  end

  ISpeechTextSelectionInformation_GUID = LibC::GUID.new("3b9c7e7a-6eee-4ded-9092-11657279adbe")
  CLSID_ISpeechTextSelectionInformation = "3b9c7e7a-6eee-4ded-9092-11657279adbe"
  struct ISpeechTextSelectionInformation
    lpVtbl : ISpeechTextSelectionInformationVTbl*
  end

  struct ISpeechRecoResultVTbl
    query_interface : Proc(ISpeechRecoResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoResult*, UInt32)
    release : Proc(ISpeechRecoResult*, UInt32)
    get_type_info_count : Proc(ISpeechRecoResult*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_reco_context : Proc(ISpeechRecoResult*, ISpeechRecoContext*, HRESULT)
    get_times : Proc(ISpeechRecoResult*, ISpeechRecoResultTimes*, HRESULT)
    putref_audio_format : Proc(ISpeechRecoResult*, ISpeechAudioFormat, HRESULT)
    get_audio_format : Proc(ISpeechRecoResult*, ISpeechAudioFormat*, HRESULT)
    get_phrase_info : Proc(ISpeechRecoResult*, ISpeechPhraseInfo*, HRESULT)
    alternates : Proc(ISpeechRecoResult*, Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)
    audio : Proc(ISpeechRecoResult*, Int32, Int32, ISpeechMemoryStream*, HRESULT)
    speak_audio : Proc(ISpeechRecoResult*, Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    save_to_memory : Proc(ISpeechRecoResult*, VARIANT*, HRESULT)
    discard_result_info : Proc(ISpeechRecoResult*, SpeechDiscardType, HRESULT)
  end

  ISpeechRecoResult_GUID = LibC::GUID.new("ed2879cf-ced9-4ee6-a534-de0191d5468d")
  CLSID_ISpeechRecoResult = "ed2879cf-ced9-4ee6-a534-de0191d5468d"
  struct ISpeechRecoResult
    lpVtbl : ISpeechRecoResultVTbl*
  end

  struct ISpeechRecoResult2VTbl
    query_interface : Proc(ISpeechRecoResult2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoResult2*, UInt32)
    release : Proc(ISpeechRecoResult2*, UInt32)
    get_type_info_count : Proc(ISpeechRecoResult2*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoResult2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoResult2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoResult2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_reco_context : Proc(ISpeechRecoResult2*, ISpeechRecoContext*, HRESULT)
    get_times : Proc(ISpeechRecoResult2*, ISpeechRecoResultTimes*, HRESULT)
    putref_audio_format : Proc(ISpeechRecoResult2*, ISpeechAudioFormat, HRESULT)
    get_audio_format : Proc(ISpeechRecoResult2*, ISpeechAudioFormat*, HRESULT)
    get_phrase_info : Proc(ISpeechRecoResult2*, ISpeechPhraseInfo*, HRESULT)
    alternates : Proc(ISpeechRecoResult2*, Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)
    audio : Proc(ISpeechRecoResult2*, Int32, Int32, ISpeechMemoryStream*, HRESULT)
    speak_audio : Proc(ISpeechRecoResult2*, Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    save_to_memory : Proc(ISpeechRecoResult2*, VARIANT*, HRESULT)
    discard_result_info : Proc(ISpeechRecoResult2*, SpeechDiscardType, HRESULT)
    set_text_feedback : Proc(ISpeechRecoResult2*, UInt8*, Int16, HRESULT)
  end

  ISpeechRecoResult2_GUID = LibC::GUID.new("8e0a246d-d3c8-45de-8657-04290c458c3c")
  CLSID_ISpeechRecoResult2 = "8e0a246d-d3c8-45de-8657-04290c458c3c"
  struct ISpeechRecoResult2
    lpVtbl : ISpeechRecoResult2VTbl*
  end

  struct ISpeechRecoResultTimesVTbl
    query_interface : Proc(ISpeechRecoResultTimes*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoResultTimes*, UInt32)
    release : Proc(ISpeechRecoResultTimes*, UInt32)
    get_type_info_count : Proc(ISpeechRecoResultTimes*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoResultTimes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoResultTimes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoResultTimes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_stream_time : Proc(ISpeechRecoResultTimes*, VARIANT*, HRESULT)
    get_length : Proc(ISpeechRecoResultTimes*, VARIANT*, HRESULT)
    get_tick_count : Proc(ISpeechRecoResultTimes*, Int32*, HRESULT)
    get_offset_from_start : Proc(ISpeechRecoResultTimes*, VARIANT*, HRESULT)
  end

  ISpeechRecoResultTimes_GUID = LibC::GUID.new("62b3b8fb-f6e7-41be-bdcb-056b1c29efc0")
  CLSID_ISpeechRecoResultTimes = "62b3b8fb-f6e7-41be-bdcb-056b1c29efc0"
  struct ISpeechRecoResultTimes
    lpVtbl : ISpeechRecoResultTimesVTbl*
  end

  struct ISpeechPhraseAlternateVTbl
    query_interface : Proc(ISpeechPhraseAlternate*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseAlternate*, UInt32)
    release : Proc(ISpeechPhraseAlternate*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseAlternate*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseAlternate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseAlternate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseAlternate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_reco_result : Proc(ISpeechPhraseAlternate*, ISpeechRecoResult*, HRESULT)
    get_start_element_in_result : Proc(ISpeechPhraseAlternate*, Int32*, HRESULT)
    get_number_of_elements_in_result : Proc(ISpeechPhraseAlternate*, Int32*, HRESULT)
    get_phrase_info : Proc(ISpeechPhraseAlternate*, ISpeechPhraseInfo*, HRESULT)
    commit : Proc(ISpeechPhraseAlternate*, HRESULT)
  end

  ISpeechPhraseAlternate_GUID = LibC::GUID.new("27864a2a-2b9f-4cb8-92d3-0d2722fd1e73")
  CLSID_ISpeechPhraseAlternate = "27864a2a-2b9f-4cb8-92d3-0d2722fd1e73"
  struct ISpeechPhraseAlternate
    lpVtbl : ISpeechPhraseAlternateVTbl*
  end

  struct ISpeechPhraseAlternatesVTbl
    query_interface : Proc(ISpeechPhraseAlternates*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseAlternates*, UInt32)
    release : Proc(ISpeechPhraseAlternates*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseAlternates*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseAlternates*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseAlternates*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseAlternates*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechPhraseAlternates*, Int32*, HRESULT)
    item : Proc(ISpeechPhraseAlternates*, Int32, ISpeechPhraseAlternate*, HRESULT)
    get__new_enum : Proc(ISpeechPhraseAlternates*, IUnknown*, HRESULT)
  end

  ISpeechPhraseAlternates_GUID = LibC::GUID.new("b238b6d5-f276-4c3d-a6c1-2974801c3cc2")
  CLSID_ISpeechPhraseAlternates = "b238b6d5-f276-4c3d-a6c1-2974801c3cc2"
  struct ISpeechPhraseAlternates
    lpVtbl : ISpeechPhraseAlternatesVTbl*
  end

  struct ISpeechPhraseInfoVTbl
    query_interface : Proc(ISpeechPhraseInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseInfo*, UInt32)
    release : Proc(ISpeechPhraseInfo*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseInfo*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_language_id : Proc(ISpeechPhraseInfo*, Int32*, HRESULT)
    get_grammar_id : Proc(ISpeechPhraseInfo*, VARIANT*, HRESULT)
    get_start_time : Proc(ISpeechPhraseInfo*, VARIANT*, HRESULT)
    get_audio_stream_position : Proc(ISpeechPhraseInfo*, VARIANT*, HRESULT)
    get_audio_size_bytes : Proc(ISpeechPhraseInfo*, Int32*, HRESULT)
    get_retained_size_bytes : Proc(ISpeechPhraseInfo*, Int32*, HRESULT)
    get_audio_size_time : Proc(ISpeechPhraseInfo*, Int32*, HRESULT)
    get_rule : Proc(ISpeechPhraseInfo*, ISpeechPhraseRule*, HRESULT)
    get_properties : Proc(ISpeechPhraseInfo*, ISpeechPhraseProperties*, HRESULT)
    get_elements : Proc(ISpeechPhraseInfo*, ISpeechPhraseElements*, HRESULT)
    get_replacements : Proc(ISpeechPhraseInfo*, ISpeechPhraseReplacements*, HRESULT)
    get_engine_id : Proc(ISpeechPhraseInfo*, UInt8**, HRESULT)
    get_engine_private_data : Proc(ISpeechPhraseInfo*, VARIANT*, HRESULT)
    save_to_memory : Proc(ISpeechPhraseInfo*, VARIANT*, HRESULT)
    get_text : Proc(ISpeechPhraseInfo*, Int32, Int32, Int16, UInt8**, HRESULT)
    get_display_attributes : Proc(ISpeechPhraseInfo*, Int32, Int32, Int16, SpeechDisplayAttributes*, HRESULT)
  end

  ISpeechPhraseInfo_GUID = LibC::GUID.new("961559cf-4e67-4662-8bf0-d93f1fcd61b3")
  CLSID_ISpeechPhraseInfo = "961559cf-4e67-4662-8bf0-d93f1fcd61b3"
  struct ISpeechPhraseInfo
    lpVtbl : ISpeechPhraseInfoVTbl*
  end

  struct ISpeechPhraseElementVTbl
    query_interface : Proc(ISpeechPhraseElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseElement*, UInt32)
    release : Proc(ISpeechPhraseElement*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseElement*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseElement*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseElement*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseElement*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_audio_time_offset : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_audio_size_time : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_audio_stream_offset : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_audio_size_bytes : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_retained_stream_offset : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_retained_size_bytes : Proc(ISpeechPhraseElement*, Int32*, HRESULT)
    get_display_text : Proc(ISpeechPhraseElement*, UInt8**, HRESULT)
    get_lexical_form : Proc(ISpeechPhraseElement*, UInt8**, HRESULT)
    get_pronunciation : Proc(ISpeechPhraseElement*, VARIANT*, HRESULT)
    get_display_attributes : Proc(ISpeechPhraseElement*, SpeechDisplayAttributes*, HRESULT)
    get_required_confidence : Proc(ISpeechPhraseElement*, SpeechEngineConfidence*, HRESULT)
    get_actual_confidence : Proc(ISpeechPhraseElement*, SpeechEngineConfidence*, HRESULT)
    get_engine_confidence : Proc(ISpeechPhraseElement*, Float32*, HRESULT)
  end

  ISpeechPhraseElement_GUID = LibC::GUID.new("e6176f96-e373-4801-b223-3b62c068c0b4")
  CLSID_ISpeechPhraseElement = "e6176f96-e373-4801-b223-3b62c068c0b4"
  struct ISpeechPhraseElement
    lpVtbl : ISpeechPhraseElementVTbl*
  end

  struct ISpeechPhraseElementsVTbl
    query_interface : Proc(ISpeechPhraseElements*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseElements*, UInt32)
    release : Proc(ISpeechPhraseElements*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseElements*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseElements*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseElements*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseElements*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechPhraseElements*, Int32*, HRESULT)
    item : Proc(ISpeechPhraseElements*, Int32, ISpeechPhraseElement*, HRESULT)
    get__new_enum : Proc(ISpeechPhraseElements*, IUnknown*, HRESULT)
  end

  ISpeechPhraseElements_GUID = LibC::GUID.new("0626b328-3478-467d-a0b3-d0853b93dda3")
  CLSID_ISpeechPhraseElements = "0626b328-3478-467d-a0b3-d0853b93dda3"
  struct ISpeechPhraseElements
    lpVtbl : ISpeechPhraseElementsVTbl*
  end

  struct ISpeechPhraseReplacementVTbl
    query_interface : Proc(ISpeechPhraseReplacement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseReplacement*, UInt32)
    release : Proc(ISpeechPhraseReplacement*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseReplacement*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseReplacement*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseReplacement*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseReplacement*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_attributes : Proc(ISpeechPhraseReplacement*, SpeechDisplayAttributes*, HRESULT)
    get_text : Proc(ISpeechPhraseReplacement*, UInt8**, HRESULT)
    get_first_element : Proc(ISpeechPhraseReplacement*, Int32*, HRESULT)
    get_number_of_elements : Proc(ISpeechPhraseReplacement*, Int32*, HRESULT)
  end

  ISpeechPhraseReplacement_GUID = LibC::GUID.new("2890a410-53a7-4fb5-94ec-06d4998e3d02")
  CLSID_ISpeechPhraseReplacement = "2890a410-53a7-4fb5-94ec-06d4998e3d02"
  struct ISpeechPhraseReplacement
    lpVtbl : ISpeechPhraseReplacementVTbl*
  end

  struct ISpeechPhraseReplacementsVTbl
    query_interface : Proc(ISpeechPhraseReplacements*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseReplacements*, UInt32)
    release : Proc(ISpeechPhraseReplacements*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseReplacements*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseReplacements*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseReplacements*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseReplacements*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechPhraseReplacements*, Int32*, HRESULT)
    item : Proc(ISpeechPhraseReplacements*, Int32, ISpeechPhraseReplacement*, HRESULT)
    get__new_enum : Proc(ISpeechPhraseReplacements*, IUnknown*, HRESULT)
  end

  ISpeechPhraseReplacements_GUID = LibC::GUID.new("38bc662f-2257-4525-959e-2069d2596c05")
  CLSID_ISpeechPhraseReplacements = "38bc662f-2257-4525-959e-2069d2596c05"
  struct ISpeechPhraseReplacements
    lpVtbl : ISpeechPhraseReplacementsVTbl*
  end

  struct ISpeechPhrasePropertyVTbl
    query_interface : Proc(ISpeechPhraseProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseProperty*, UInt32)
    release : Proc(ISpeechPhraseProperty*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseProperty*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ISpeechPhraseProperty*, UInt8**, HRESULT)
    get_id : Proc(ISpeechPhraseProperty*, Int32*, HRESULT)
    get_value : Proc(ISpeechPhraseProperty*, VARIANT*, HRESULT)
    get_first_element : Proc(ISpeechPhraseProperty*, Int32*, HRESULT)
    get_number_of_elements : Proc(ISpeechPhraseProperty*, Int32*, HRESULT)
    get_engine_confidence : Proc(ISpeechPhraseProperty*, Float32*, HRESULT)
    get_confidence : Proc(ISpeechPhraseProperty*, SpeechEngineConfidence*, HRESULT)
    get_parent : Proc(ISpeechPhraseProperty*, ISpeechPhraseProperty*, HRESULT)
    get_children : Proc(ISpeechPhraseProperty*, ISpeechPhraseProperties*, HRESULT)
  end

  ISpeechPhraseProperty_GUID = LibC::GUID.new("ce563d48-961e-4732-a2e1-378a42b430be")
  CLSID_ISpeechPhraseProperty = "ce563d48-961e-4732-a2e1-378a42b430be"
  struct ISpeechPhraseProperty
    lpVtbl : ISpeechPhrasePropertyVTbl*
  end

  struct ISpeechPhrasePropertiesVTbl
    query_interface : Proc(ISpeechPhraseProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseProperties*, UInt32)
    release : Proc(ISpeechPhraseProperties*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseProperties*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseProperties*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseProperties*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseProperties*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechPhraseProperties*, Int32*, HRESULT)
    item : Proc(ISpeechPhraseProperties*, Int32, ISpeechPhraseProperty*, HRESULT)
    get__new_enum : Proc(ISpeechPhraseProperties*, IUnknown*, HRESULT)
  end

  ISpeechPhraseProperties_GUID = LibC::GUID.new("08166b47-102e-4b23-a599-bdb98dbfd1f4")
  CLSID_ISpeechPhraseProperties = "08166b47-102e-4b23-a599-bdb98dbfd1f4"
  struct ISpeechPhraseProperties
    lpVtbl : ISpeechPhrasePropertiesVTbl*
  end

  struct ISpeechPhraseRuleVTbl
    query_interface : Proc(ISpeechPhraseRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseRule*, UInt32)
    release : Proc(ISpeechPhraseRule*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseRule*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ISpeechPhraseRule*, UInt8**, HRESULT)
    get_id : Proc(ISpeechPhraseRule*, Int32*, HRESULT)
    get_first_element : Proc(ISpeechPhraseRule*, Int32*, HRESULT)
    get_number_of_elements : Proc(ISpeechPhraseRule*, Int32*, HRESULT)
    get_parent : Proc(ISpeechPhraseRule*, ISpeechPhraseRule*, HRESULT)
    get_children : Proc(ISpeechPhraseRule*, ISpeechPhraseRules*, HRESULT)
    get_confidence : Proc(ISpeechPhraseRule*, SpeechEngineConfidence*, HRESULT)
    get_engine_confidence : Proc(ISpeechPhraseRule*, Float32*, HRESULT)
  end

  ISpeechPhraseRule_GUID = LibC::GUID.new("a7bfe112-a4a0-48d9-b602-c313843f6964")
  CLSID_ISpeechPhraseRule = "a7bfe112-a4a0-48d9-b602-c313843f6964"
  struct ISpeechPhraseRule
    lpVtbl : ISpeechPhraseRuleVTbl*
  end

  struct ISpeechPhraseRulesVTbl
    query_interface : Proc(ISpeechPhraseRules*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseRules*, UInt32)
    release : Proc(ISpeechPhraseRules*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseRules*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseRules*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseRules*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseRules*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechPhraseRules*, Int32*, HRESULT)
    item : Proc(ISpeechPhraseRules*, Int32, ISpeechPhraseRule*, HRESULT)
    get__new_enum : Proc(ISpeechPhraseRules*, IUnknown*, HRESULT)
  end

  ISpeechPhraseRules_GUID = LibC::GUID.new("9047d593-01dd-4b72-81a3-e4a0ca69f407")
  CLSID_ISpeechPhraseRules = "9047d593-01dd-4b72-81a3-e4a0ca69f407"
  struct ISpeechPhraseRules
    lpVtbl : ISpeechPhraseRulesVTbl*
  end

  struct ISpeechLexiconVTbl
    query_interface : Proc(ISpeechLexicon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechLexicon*, UInt32)
    release : Proc(ISpeechLexicon*, UInt32)
    get_type_info_count : Proc(ISpeechLexicon*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechLexicon*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechLexicon*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechLexicon*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_generation_id : Proc(ISpeechLexicon*, Int32*, HRESULT)
    get_words : Proc(ISpeechLexicon*, SpeechLexiconType, Int32*, ISpeechLexiconWords*, HRESULT)
    add_pronunciation : Proc(ISpeechLexicon*, UInt8*, Int32, SpeechPartOfSpeech, UInt8*, HRESULT)
    add_pronunciation_by_phone_ids : Proc(ISpeechLexicon*, UInt8*, Int32, SpeechPartOfSpeech, VARIANT*, HRESULT)
    remove_pronunciation : Proc(ISpeechLexicon*, UInt8*, Int32, SpeechPartOfSpeech, UInt8*, HRESULT)
    remove_pronunciation_by_phone_ids : Proc(ISpeechLexicon*, UInt8*, Int32, SpeechPartOfSpeech, VARIANT*, HRESULT)
    get_pronunciations : Proc(ISpeechLexicon*, UInt8*, Int32, SpeechLexiconType, ISpeechLexiconPronunciations*, HRESULT)
    get_generation_change : Proc(ISpeechLexicon*, Int32*, ISpeechLexiconWords*, HRESULT)
  end

  ISpeechLexicon_GUID = LibC::GUID.new("3da7627a-c7ae-4b23-8708-638c50362c25")
  CLSID_ISpeechLexicon = "3da7627a-c7ae-4b23-8708-638c50362c25"
  struct ISpeechLexicon
    lpVtbl : ISpeechLexiconVTbl*
  end

  struct ISpeechLexiconWordsVTbl
    query_interface : Proc(ISpeechLexiconWords*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechLexiconWords*, UInt32)
    release : Proc(ISpeechLexiconWords*, UInt32)
    get_type_info_count : Proc(ISpeechLexiconWords*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechLexiconWords*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechLexiconWords*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechLexiconWords*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechLexiconWords*, Int32*, HRESULT)
    item : Proc(ISpeechLexiconWords*, Int32, ISpeechLexiconWord*, HRESULT)
    get__new_enum : Proc(ISpeechLexiconWords*, IUnknown*, HRESULT)
  end

  ISpeechLexiconWords_GUID = LibC::GUID.new("8d199862-415e-47d5-ac4f-faa608b424e6")
  CLSID_ISpeechLexiconWords = "8d199862-415e-47d5-ac4f-faa608b424e6"
  struct ISpeechLexiconWords
    lpVtbl : ISpeechLexiconWordsVTbl*
  end

  struct ISpeechLexiconWordVTbl
    query_interface : Proc(ISpeechLexiconWord*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechLexiconWord*, UInt32)
    release : Proc(ISpeechLexiconWord*, UInt32)
    get_type_info_count : Proc(ISpeechLexiconWord*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechLexiconWord*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechLexiconWord*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechLexiconWord*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_lang_id : Proc(ISpeechLexiconWord*, Int32*, HRESULT)
    get_type : Proc(ISpeechLexiconWord*, SpeechWordType*, HRESULT)
    get_word : Proc(ISpeechLexiconWord*, UInt8**, HRESULT)
    get_pronunciations : Proc(ISpeechLexiconWord*, ISpeechLexiconPronunciations*, HRESULT)
  end

  ISpeechLexiconWord_GUID = LibC::GUID.new("4e5b933c-c9be-48ed-8842-1ee51bb1d4ff")
  CLSID_ISpeechLexiconWord = "4e5b933c-c9be-48ed-8842-1ee51bb1d4ff"
  struct ISpeechLexiconWord
    lpVtbl : ISpeechLexiconWordVTbl*
  end

  struct ISpeechLexiconPronunciationsVTbl
    query_interface : Proc(ISpeechLexiconPronunciations*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechLexiconPronunciations*, UInt32)
    release : Proc(ISpeechLexiconPronunciations*, UInt32)
    get_type_info_count : Proc(ISpeechLexiconPronunciations*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechLexiconPronunciations*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechLexiconPronunciations*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechLexiconPronunciations*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISpeechLexiconPronunciations*, Int32*, HRESULT)
    item : Proc(ISpeechLexiconPronunciations*, Int32, ISpeechLexiconPronunciation*, HRESULT)
    get__new_enum : Proc(ISpeechLexiconPronunciations*, IUnknown*, HRESULT)
  end

  ISpeechLexiconPronunciations_GUID = LibC::GUID.new("72829128-5682-4704-a0d4-3e2bb6f2ead3")
  CLSID_ISpeechLexiconPronunciations = "72829128-5682-4704-a0d4-3e2bb6f2ead3"
  struct ISpeechLexiconPronunciations
    lpVtbl : ISpeechLexiconPronunciationsVTbl*
  end

  struct ISpeechLexiconPronunciationVTbl
    query_interface : Proc(ISpeechLexiconPronunciation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechLexiconPronunciation*, UInt32)
    release : Proc(ISpeechLexiconPronunciation*, UInt32)
    get_type_info_count : Proc(ISpeechLexiconPronunciation*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechLexiconPronunciation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechLexiconPronunciation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechLexiconPronunciation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ISpeechLexiconPronunciation*, SpeechLexiconType*, HRESULT)
    get_lang_id : Proc(ISpeechLexiconPronunciation*, Int32*, HRESULT)
    get_part_of_speech : Proc(ISpeechLexiconPronunciation*, SpeechPartOfSpeech*, HRESULT)
    get_phone_ids : Proc(ISpeechLexiconPronunciation*, VARIANT*, HRESULT)
    get_symbolic : Proc(ISpeechLexiconPronunciation*, UInt8**, HRESULT)
  end

  ISpeechLexiconPronunciation_GUID = LibC::GUID.new("95252c5d-9e43-4f4a-9899-48ee73352f9f")
  CLSID_ISpeechLexiconPronunciation = "95252c5d-9e43-4f4a-9899-48ee73352f9f"
  struct ISpeechLexiconPronunciation
    lpVtbl : ISpeechLexiconPronunciationVTbl*
  end

  struct ISpeechXMLRecoResultVTbl
    query_interface : Proc(ISpeechXMLRecoResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechXMLRecoResult*, UInt32)
    release : Proc(ISpeechXMLRecoResult*, UInt32)
    get_type_info_count : Proc(ISpeechXMLRecoResult*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechXMLRecoResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechXMLRecoResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechXMLRecoResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_reco_context : Proc(ISpeechXMLRecoResult*, ISpeechRecoContext*, HRESULT)
    get_times : Proc(ISpeechXMLRecoResult*, ISpeechRecoResultTimes*, HRESULT)
    putref_audio_format : Proc(ISpeechXMLRecoResult*, ISpeechAudioFormat, HRESULT)
    get_audio_format : Proc(ISpeechXMLRecoResult*, ISpeechAudioFormat*, HRESULT)
    get_phrase_info : Proc(ISpeechXMLRecoResult*, ISpeechPhraseInfo*, HRESULT)
    alternates : Proc(ISpeechXMLRecoResult*, Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)
    audio : Proc(ISpeechXMLRecoResult*, Int32, Int32, ISpeechMemoryStream*, HRESULT)
    speak_audio : Proc(ISpeechXMLRecoResult*, Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    save_to_memory : Proc(ISpeechXMLRecoResult*, VARIANT*, HRESULT)
    discard_result_info : Proc(ISpeechXMLRecoResult*, SpeechDiscardType, HRESULT)
    get_xml_result : Proc(ISpeechXMLRecoResult*, SPXMLRESULTOPTIONS, UInt8**, HRESULT)
    get_xml_error_info : Proc(ISpeechXMLRecoResult*, Int32*, UInt8**, UInt8**, UInt8**, Int32*, Int16*, HRESULT)
  end

  ISpeechXMLRecoResult_GUID = LibC::GUID.new("aaec54af-8f85-4924-944d-b79d39d72e19")
  CLSID_ISpeechXMLRecoResult = "aaec54af-8f85-4924-944d-b79d39d72e19"
  struct ISpeechXMLRecoResult
    lpVtbl : ISpeechXMLRecoResultVTbl*
  end

  struct ISpeechRecoResultDispatchVTbl
    query_interface : Proc(ISpeechRecoResultDispatch*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechRecoResultDispatch*, UInt32)
    release : Proc(ISpeechRecoResultDispatch*, UInt32)
    get_type_info_count : Proc(ISpeechRecoResultDispatch*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechRecoResultDispatch*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechRecoResultDispatch*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechRecoResultDispatch*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_reco_context : Proc(ISpeechRecoResultDispatch*, ISpeechRecoContext*, HRESULT)
    get_times : Proc(ISpeechRecoResultDispatch*, ISpeechRecoResultTimes*, HRESULT)
    putref_audio_format : Proc(ISpeechRecoResultDispatch*, ISpeechAudioFormat, HRESULT)
    get_audio_format : Proc(ISpeechRecoResultDispatch*, ISpeechAudioFormat*, HRESULT)
    get_phrase_info : Proc(ISpeechRecoResultDispatch*, ISpeechPhraseInfo*, HRESULT)
    alternates : Proc(ISpeechRecoResultDispatch*, Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)
    audio : Proc(ISpeechRecoResultDispatch*, Int32, Int32, ISpeechMemoryStream*, HRESULT)
    speak_audio : Proc(ISpeechRecoResultDispatch*, Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)
    save_to_memory : Proc(ISpeechRecoResultDispatch*, VARIANT*, HRESULT)
    discard_result_info : Proc(ISpeechRecoResultDispatch*, SpeechDiscardType, HRESULT)
    get_xml_result : Proc(ISpeechRecoResultDispatch*, SPXMLRESULTOPTIONS, UInt8**, HRESULT)
    get_xml_error_info : Proc(ISpeechRecoResultDispatch*, Int32*, UInt8**, UInt8**, UInt8**, HRESULT*, Int16*, HRESULT)
    set_text_feedback : Proc(ISpeechRecoResultDispatch*, UInt8*, Int16, HRESULT)
  end

  ISpeechRecoResultDispatch_GUID = LibC::GUID.new("6d60eb64-aced-40a6-bbf3-4e557f71dee2")
  CLSID_ISpeechRecoResultDispatch = "6d60eb64-aced-40a6-bbf3-4e557f71dee2"
  struct ISpeechRecoResultDispatch
    lpVtbl : ISpeechRecoResultDispatchVTbl*
  end

  struct ISpeechPhraseInfoBuilderVTbl
    query_interface : Proc(ISpeechPhraseInfoBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhraseInfoBuilder*, UInt32)
    release : Proc(ISpeechPhraseInfoBuilder*, UInt32)
    get_type_info_count : Proc(ISpeechPhraseInfoBuilder*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhraseInfoBuilder*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhraseInfoBuilder*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhraseInfoBuilder*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    restore_phrase_from_memory : Proc(ISpeechPhraseInfoBuilder*, VARIANT*, ISpeechPhraseInfo*, HRESULT)
  end

  ISpeechPhraseInfoBuilder_GUID = LibC::GUID.new("3b151836-df3a-4e0a-846c-d2adc9334333")
  CLSID_ISpeechPhraseInfoBuilder = "3b151836-df3a-4e0a-846c-d2adc9334333"
  struct ISpeechPhraseInfoBuilder
    lpVtbl : ISpeechPhraseInfoBuilderVTbl*
  end

  struct ISpeechPhoneConverterVTbl
    query_interface : Proc(ISpeechPhoneConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechPhoneConverter*, UInt32)
    release : Proc(ISpeechPhoneConverter*, UInt32)
    get_type_info_count : Proc(ISpeechPhoneConverter*, UInt32*, HRESULT)
    get_type_info : Proc(ISpeechPhoneConverter*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISpeechPhoneConverter*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISpeechPhoneConverter*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_language_id : Proc(ISpeechPhoneConverter*, Int32*, HRESULT)
    put_language_id : Proc(ISpeechPhoneConverter*, Int32, HRESULT)
    phone_to_id : Proc(ISpeechPhoneConverter*, UInt8*, VARIANT*, HRESULT)
    id_to_phone : Proc(ISpeechPhoneConverter*, VARIANT, UInt8**, HRESULT)
  end

  ISpeechPhoneConverter_GUID = LibC::GUID.new("c3e4f353-433f-43d6-89a1-6a62a7054c3d")
  CLSID_ISpeechPhoneConverter = "c3e4f353-433f-43d6-89a1-6a62a7054c3d"
  struct ISpeechPhoneConverter
    lpVtbl : ISpeechPhoneConverterVTbl*
  end

end
