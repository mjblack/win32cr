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
    notify_callback : UInt64
  end

  struct ISpNotifyCallback
    lpVtbl : ISpNotifyCallbackVTbl*
  end

  struct ISpNotifySourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify_sink : UInt64
    set_notify_window_message : UInt64
    set_notify_callback_function : UInt64
    set_notify_callback_interface : UInt64
    set_notify_win32_event : UInt64
    wait_for_notify_event : UInt64
    get_notify_event_handle : UInt64
  end

  ISpNotifySource_GUID = "5eff4aef-8487-11d2-961c-00c04f8ee628"
  IID_ISpNotifySource = LibC::GUID.new(0x5eff4aef_u32, 0x8487_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x1c_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  struct ISpNotifySource
    lpVtbl : ISpNotifySourceVTbl*
  end

  struct ISpNotifySinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    notify : UInt64
  end

  ISpNotifySink_GUID = "259684dc-37c3-11d2-9603-00c04f8ee628"
  IID_ISpNotifySink = LibC::GUID.new(0x259684dc_u32, 0x37c3_u16, 0x11d2_u16, StaticArray[0x96_u8, 0x3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  struct ISpNotifySink
    lpVtbl : ISpNotifySinkVTbl*
  end

  struct ISpNotifyTranslatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    notify : UInt64
    init_window_message : UInt64
    init_callback : UInt64
    init_sp_notify_callback : UInt64
    init_win32_event : UInt64
    wait : UInt64
    get_event_handle : UInt64
  end

  ISpNotifyTranslator_GUID = "aca16614-5d3d-11d2-960e-00c04f8ee628"
  IID_ISpNotifyTranslator = LibC::GUID.new(0xaca16614_u32, 0x5d3d_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xe_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  struct ISpNotifyTranslator
    lpVtbl : ISpNotifyTranslatorVTbl*
  end

  struct ISpDataKeyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_data : UInt64
    get_data : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_dword : UInt64
    get_dword : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
  end

  ISpDataKey_GUID = "14056581-e16c-11d2-bb90-00c04f8ee6c0"
  IID_ISpDataKey = LibC::GUID.new(0x14056581_u32, 0xe16c_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x90_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
  struct ISpDataKey
    lpVtbl : ISpDataKeyVTbl*
  end

  struct ISpRegDataKeyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_data : UInt64
    get_data : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_dword : UInt64
    get_dword : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
    set_key : UInt64
  end

  ISpRegDataKey_GUID = "92a66e2b-c830-4149-83df-6fc2ba1e7a5b"
  IID_ISpRegDataKey = LibC::GUID.new(0x92a66e2b_u32, 0xc830_u16, 0x4149_u16, StaticArray[0x83_u8, 0xdf_u8, 0x6f_u8, 0xc2_u8, 0xba_u8, 0x1e_u8, 0x7a_u8, 0x5b_u8])
  struct ISpRegDataKey
    lpVtbl : ISpRegDataKeyVTbl*
  end

  struct ISpObjectTokenCategoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_data : UInt64
    get_data : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_dword : UInt64
    get_dword : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
    set_id : UInt64
    get_id : UInt64
    get_data_key : UInt64
    enum_tokens : UInt64
    set_default_token_id : UInt64
    get_default_token_id : UInt64
  end

  ISpObjectTokenCategory_GUID = "2d3d3845-39af-4850-bbf9-40b49780011d"
  IID_ISpObjectTokenCategory = LibC::GUID.new(0x2d3d3845_u32, 0x39af_u16, 0x4850_u16, StaticArray[0xbb_u8, 0xf9_u8, 0x40_u8, 0xb4_u8, 0x97_u8, 0x80_u8, 0x1_u8, 0x1d_u8])
  struct ISpObjectTokenCategory
    lpVtbl : ISpObjectTokenCategoryVTbl*
  end

  struct ISpObjectTokenVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_data : UInt64
    get_data : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_dword : UInt64
    get_dword : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
    set_id : UInt64
    get_id : UInt64
    get_category : UInt64
    create_instance : UInt64
    get_storage_file_name : UInt64
    remove_storage_file_name : UInt64
    remove : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
    matches_attributes : UInt64
  end

  ISpObjectToken_GUID = "14056589-e16c-11d2-bb90-00c04f8ee6c0"
  IID_ISpObjectToken = LibC::GUID.new(0x14056589_u32, 0xe16c_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x90_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
  struct ISpObjectToken
    lpVtbl : ISpObjectTokenVTbl*
  end

  struct ISpObjectTokenInitVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_data : UInt64
    get_data : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_dword : UInt64
    get_dword : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
    set_id : UInt64
    get_id : UInt64
    get_category : UInt64
    create_instance : UInt64
    get_storage_file_name : UInt64
    remove_storage_file_name : UInt64
    remove : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
    matches_attributes : UInt64
    init_from_data_key : UInt64
  end

  ISpObjectTokenInit_GUID = "b8aab0cf-346f-49d8-9499-c8b03f161d51"
  IID_ISpObjectTokenInit = LibC::GUID.new(0xb8aab0cf_u32, 0x346f_u16, 0x49d8_u16, StaticArray[0x94_u8, 0x99_u8, 0xc8_u8, 0xb0_u8, 0x3f_u8, 0x16_u8, 0x1d_u8, 0x51_u8])
  struct ISpObjectTokenInit
    lpVtbl : ISpObjectTokenInitVTbl*
  end

  struct IEnumSpObjectTokensVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
    item : UInt64
    get_count : UInt64
  end

  IEnumSpObjectTokens_GUID = "06b64f9e-7fda-11d2-b4f2-00c04f797396"
  IID_IEnumSpObjectTokens = LibC::GUID.new(0x6b64f9e_u32, 0x7fda_u16, 0x11d2_u16, StaticArray[0xb4_u8, 0xf2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  struct IEnumSpObjectTokens
    lpVtbl : IEnumSpObjectTokensVTbl*
  end

  struct ISpObjectWithTokenVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_object_token : UInt64
    get_object_token : UInt64
  end

  ISpObjectWithToken_GUID = "5b559f40-e952-11d2-bb91-00c04f8ee6c0"
  IID_ISpObjectWithToken = LibC::GUID.new(0x5b559f40_u32, 0xe952_u16, 0x11d2_u16, StaticArray[0xbb_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
  struct ISpObjectWithToken
    lpVtbl : ISpObjectWithTokenVTbl*
  end

  struct ISpResourceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_service : UInt64
    set_object : UInt64
    get_object : UInt64
  end

  ISpResourceManager_GUID = "93384e18-5014-43d5-adbb-a78e055926bd"
  IID_ISpResourceManager = LibC::GUID.new(0x93384e18_u32, 0x5014_u16, 0x43d5_u16, StaticArray[0xad_u8, 0xbb_u8, 0xa7_u8, 0x8e_u8, 0x5_u8, 0x59_u8, 0x26_u8, 0xbd_u8])
  struct ISpResourceManager
    lpVtbl : ISpResourceManagerVTbl*
  end

  struct ISpEventSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify_sink : UInt64
    set_notify_window_message : UInt64
    set_notify_callback_function : UInt64
    set_notify_callback_interface : UInt64
    set_notify_win32_event : UInt64
    wait_for_notify_event : UInt64
    get_notify_event_handle : UInt64
    set_interest : UInt64
    get_events : UInt64
    get_info : UInt64
  end

  ISpEventSource_GUID = "be7a9cce-5f9e-11d2-960f-00c04f8ee628"
  IID_ISpEventSource = LibC::GUID.new(0xbe7a9cce_u32, 0x5f9e_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  struct ISpEventSource
    lpVtbl : ISpEventSourceVTbl*
  end

  struct ISpEventSource2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify_sink : UInt64
    set_notify_window_message : UInt64
    set_notify_callback_function : UInt64
    set_notify_callback_interface : UInt64
    set_notify_win32_event : UInt64
    wait_for_notify_event : UInt64
    get_notify_event_handle : UInt64
    set_interest : UInt64
    get_events : UInt64
    get_info : UInt64
    get_events_ex : UInt64
  end

  ISpEventSource2_GUID = "2373a435-6a4b-429e-a6ac-d4231a61975b"
  IID_ISpEventSource2 = LibC::GUID.new(0x2373a435_u32, 0x6a4b_u16, 0x429e_u16, StaticArray[0xa6_u8, 0xac_u8, 0xd4_u8, 0x23_u8, 0x1a_u8, 0x61_u8, 0x97_u8, 0x5b_u8])
  struct ISpEventSource2
    lpVtbl : ISpEventSource2VTbl*
  end

  struct ISpEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_events : UInt64
    get_event_interest : UInt64
  end

  ISpEventSink_GUID = "be7a9cc9-5f9e-11d2-960f-00c04f8ee628"
  IID_ISpEventSink = LibC::GUID.new(0xbe7a9cc9_u32, 0x5f9e_u16, 0x11d2_u16, StaticArray[0x96_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0x28_u8])
  struct ISpEventSink
    lpVtbl : ISpEventSinkVTbl*
  end

  struct ISpStreamFormatVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
    get_format : UInt64
  end

  ISpStreamFormat_GUID = "bed530be-2606-4f4d-a1c0-54c5cda5566f"
  IID_ISpStreamFormat = LibC::GUID.new(0xbed530be_u32, 0x2606_u16, 0x4f4d_u16, StaticArray[0xa1_u8, 0xc0_u8, 0x54_u8, 0xc5_u8, 0xcd_u8, 0xa5_u8, 0x56_u8, 0x6f_u8])
  struct ISpStreamFormat
    lpVtbl : ISpStreamFormatVTbl*
  end

  struct ISpStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
    get_format : UInt64
    set_base_stream : UInt64
    get_base_stream : UInt64
    bind_to_file : UInt64
    close : UInt64
  end

  ISpStream_GUID = "12e3cca9-7518-44c5-a5e7-ba5a79cb929e"
  IID_ISpStream = LibC::GUID.new(0x12e3cca9_u32, 0x7518_u16, 0x44c5_u16, StaticArray[0xa5_u8, 0xe7_u8, 0xba_u8, 0x5a_u8, 0x79_u8, 0xcb_u8, 0x92_u8, 0x9e_u8])
  struct ISpStream
    lpVtbl : ISpStreamVTbl*
  end

  struct ISpStreamFormatConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
    get_format : UInt64
    set_base_stream : UInt64
    get_base_stream : UInt64
    set_format : UInt64
    reset_seek_position : UInt64
    scale_converted_to_base_offset : UInt64
    scale_base_to_converted_offset : UInt64
  end

  ISpStreamFormatConverter_GUID = "678a932c-ea71-4446-9b41-78fda6280a29"
  IID_ISpStreamFormatConverter = LibC::GUID.new(0x678a932c_u32, 0xea71_u16, 0x4446_u16, StaticArray[0x9b_u8, 0x41_u8, 0x78_u8, 0xfd_u8, 0xa6_u8, 0x28_u8, 0xa_u8, 0x29_u8])
  struct ISpStreamFormatConverter
    lpVtbl : ISpStreamFormatConverterVTbl*
  end

  struct ISpAudioVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
    get_format : UInt64
    set_state : UInt64
    set_format : UInt64
    get_status : UInt64
    set_buffer_info : UInt64
    get_buffer_info : UInt64
    get_default_format : UInt64
    event_handle : UInt64
    get_volume_level : UInt64
    set_volume_level : UInt64
    get_buffer_notify_size : UInt64
    set_buffer_notify_size : UInt64
  end

  ISpAudio_GUID = "c05c768f-fae8-4ec2-8e07-338321c12452"
  IID_ISpAudio = LibC::GUID.new(0xc05c768f_u32, 0xfae8_u16, 0x4ec2_u16, StaticArray[0x8e_u8, 0x7_u8, 0x33_u8, 0x83_u8, 0x21_u8, 0xc1_u8, 0x24_u8, 0x52_u8])
  struct ISpAudio
    lpVtbl : ISpAudioVTbl*
  end

  struct ISpMMSysAudioVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
    get_format : UInt64
    set_state : UInt64
    set_format : UInt64
    get_status : UInt64
    set_buffer_info : UInt64
    get_buffer_info : UInt64
    get_default_format : UInt64
    event_handle : UInt64
    get_volume_level : UInt64
    set_volume_level : UInt64
    get_buffer_notify_size : UInt64
    set_buffer_notify_size : UInt64
    get_device_id : UInt64
    set_device_id : UInt64
    get_mm_handle : UInt64
    get_line_id : UInt64
    set_line_id : UInt64
  end

  ISpMMSysAudio_GUID = "15806f6e-1d70-4b48-98e6-3b1a007509ab"
  IID_ISpMMSysAudio = LibC::GUID.new(0x15806f6e_u32, 0x1d70_u16, 0x4b48_u16, StaticArray[0x98_u8, 0xe6_u8, 0x3b_u8, 0x1a_u8, 0x0_u8, 0x75_u8, 0x9_u8, 0xab_u8])
  struct ISpMMSysAudio
    lpVtbl : ISpMMSysAudioVTbl*
  end

  struct ISpTranscriptVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_transcript : UInt64
    append_transcript : UInt64
  end

  ISpTranscript_GUID = "10f63bce-201a-11d3-ac70-00c04f8ee6c0"
  IID_ISpTranscript = LibC::GUID.new(0x10f63bce_u32, 0x201a_u16, 0x11d3_u16, StaticArray[0xac_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe6_u8, 0xc0_u8])
  struct ISpTranscript
    lpVtbl : ISpTranscriptVTbl*
  end

  struct ISpLexiconVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_pronunciations : UInt64
    add_pronunciation : UInt64
    remove_pronunciation : UInt64
    get_generation : UInt64
    get_generation_change : UInt64
    get_words : UInt64
  end

  ISpLexicon_GUID = "da41a7c2-5383-4db2-916b-6c1719e3db58"
  IID_ISpLexicon = LibC::GUID.new(0xda41a7c2_u32, 0x5383_u16, 0x4db2_u16, StaticArray[0x91_u8, 0x6b_u8, 0x6c_u8, 0x17_u8, 0x19_u8, 0xe3_u8, 0xdb_u8, 0x58_u8])
  struct ISpLexicon
    lpVtbl : ISpLexiconVTbl*
  end

  struct ISpContainerLexiconVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_pronunciations : UInt64
    add_pronunciation : UInt64
    remove_pronunciation : UInt64
    get_generation : UInt64
    get_generation_change : UInt64
    get_words : UInt64
    add_lexicon : UInt64
  end

  ISpContainerLexicon_GUID = "8565572f-c094-41cc-b56e-10bd9c3ff044"
  IID_ISpContainerLexicon = LibC::GUID.new(0x8565572f_u32, 0xc094_u16, 0x41cc_u16, StaticArray[0xb5_u8, 0x6e_u8, 0x10_u8, 0xbd_u8, 0x9c_u8, 0x3f_u8, 0xf0_u8, 0x44_u8])
  struct ISpContainerLexicon
    lpVtbl : ISpContainerLexiconVTbl*
  end

  struct ISpShortcutVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_shortcut : UInt64
    remove_shortcut : UInt64
    get_shortcuts : UInt64
    get_generation : UInt64
    get_words_from_generation_change : UInt64
    get_words : UInt64
    get_shortcuts_for_generation : UInt64
    get_generation_change : UInt64
  end

  ISpShortcut_GUID = "3df681e2-ea56-11d9-8bde-f66bad1e3f3a"
  IID_ISpShortcut = LibC::GUID.new(0x3df681e2_u32, 0xea56_u16, 0x11d9_u16, StaticArray[0x8b_u8, 0xde_u8, 0xf6_u8, 0x6b_u8, 0xad_u8, 0x1e_u8, 0x3f_u8, 0x3a_u8])
  struct ISpShortcut
    lpVtbl : ISpShortcutVTbl*
  end

  struct ISpPhoneConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_object_token : UInt64
    get_object_token : UInt64
    phone_to_id : UInt64
    id_to_phone : UInt64
  end

  ISpPhoneConverter_GUID = "8445c581-0cac-4a38-abfe-9b2ce2826455"
  IID_ISpPhoneConverter = LibC::GUID.new(0x8445c581_u32, 0xcac_u16, 0x4a38_u16, StaticArray[0xab_u8, 0xfe_u8, 0x9b_u8, 0x2c_u8, 0xe2_u8, 0x82_u8, 0x64_u8, 0x55_u8])
  struct ISpPhoneConverter
    lpVtbl : ISpPhoneConverterVTbl*
  end

  struct ISpPhoneticAlphabetConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_lang_id : UInt64
    set_lang_id : UInt64
    sapi2_ups : UInt64
    ups2_sapi : UInt64
    get_max_convert_length : UInt64
  end

  ISpPhoneticAlphabetConverter_GUID = "133adcd4-19b4-4020-9fdc-842e78253b17"
  IID_ISpPhoneticAlphabetConverter = LibC::GUID.new(0x133adcd4_u32, 0x19b4_u16, 0x4020_u16, StaticArray[0x9f_u8, 0xdc_u8, 0x84_u8, 0x2e_u8, 0x78_u8, 0x25_u8, 0x3b_u8, 0x17_u8])
  struct ISpPhoneticAlphabetConverter
    lpVtbl : ISpPhoneticAlphabetConverterVTbl*
  end

  struct ISpPhoneticAlphabetSelectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_alphabet_ups : UInt64
    set_alphabet_to_ups : UInt64
  end

  ISpPhoneticAlphabetSelection_GUID = "b2745efd-42ce-48ca-81f1-a96e02538a90"
  IID_ISpPhoneticAlphabetSelection = LibC::GUID.new(0xb2745efd_u32, 0x42ce_u16, 0x48ca_u16, StaticArray[0x81_u8, 0xf1_u8, 0xa9_u8, 0x6e_u8, 0x2_u8, 0x53_u8, 0x8a_u8, 0x90_u8])
  struct ISpPhoneticAlphabetSelection
    lpVtbl : ISpPhoneticAlphabetSelectionVTbl*
  end

  struct ISpVoiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify_sink : UInt64
    set_notify_window_message : UInt64
    set_notify_callback_function : UInt64
    set_notify_callback_interface : UInt64
    set_notify_win32_event : UInt64
    wait_for_notify_event : UInt64
    get_notify_event_handle : UInt64
    set_interest : UInt64
    get_events : UInt64
    get_info : UInt64
    set_output : UInt64
    get_output_object_token : UInt64
    get_output_stream : UInt64
    pause : UInt64
    resume : UInt64
    set_voice : UInt64
    get_voice : UInt64
    speak : UInt64
    speak_stream : UInt64
    get_status : UInt64
    skip : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_alert_boundary : UInt64
    get_alert_boundary : UInt64
    set_rate : UInt64
    get_rate : UInt64
    set_volume : UInt64
    get_volume : UInt64
    wait_until_done : UInt64
    set_sync_speak_timeout : UInt64
    get_sync_speak_timeout : UInt64
    speak_complete_event : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
  end

  ISpVoice_GUID = "6c44df74-72b9-4992-a1ec-ef996e0422d4"
  IID_ISpVoice = LibC::GUID.new(0x6c44df74_u32, 0x72b9_u16, 0x4992_u16, StaticArray[0xa1_u8, 0xec_u8, 0xef_u8, 0x99_u8, 0x6e_u8, 0x4_u8, 0x22_u8, 0xd4_u8])
  struct ISpVoice
    lpVtbl : ISpVoiceVTbl*
  end

  struct ISpPhraseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
  end

  ISpPhrase_GUID = "1a5c0354-b621-4b5a-8791-d306ed379e53"
  IID_ISpPhrase = LibC::GUID.new(0x1a5c0354_u32, 0xb621_u16, 0x4b5a_u16, StaticArray[0x87_u8, 0x91_u8, 0xd3_u8, 0x6_u8, 0xed_u8, 0x37_u8, 0x9e_u8, 0x53_u8])
  struct ISpPhrase
    lpVtbl : ISpPhraseVTbl*
  end

  struct ISpPhraseAltVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
    get_alt_info : UInt64
    commit : UInt64
  end

  ISpPhraseAlt_GUID = "8fcebc98-4e49-4067-9c6c-d86a0e092e3d"
  IID_ISpPhraseAlt = LibC::GUID.new(0x8fcebc98_u32, 0x4e49_u16, 0x4067_u16, StaticArray[0x9c_u8, 0x6c_u8, 0xd8_u8, 0x6a_u8, 0xe_u8, 0x9_u8, 0x2e_u8, 0x3d_u8])
  struct ISpPhraseAlt
    lpVtbl : ISpPhraseAltVTbl*
  end

  struct ISpPhrase2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
    get_xml_result : UInt64
    get_xml_error_info : UInt64
    get_audio : UInt64
  end

  ISpPhrase2_GUID = "f264da52-e457-4696-b856-a737b717af79"
  IID_ISpPhrase2 = LibC::GUID.new(0xf264da52_u32, 0xe457_u16, 0x4696_u16, StaticArray[0xb8_u8, 0x56_u8, 0xa7_u8, 0x37_u8, 0xb7_u8, 0x17_u8, 0xaf_u8, 0x79_u8])
  struct ISpPhrase2
    lpVtbl : ISpPhrase2VTbl*
  end

  struct ISpRecoResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
    get_result_times : UInt64
    get_alternates : UInt64
    get_audio : UInt64
    speak_audio : UInt64
    serialize : UInt64
    scale_audio : UInt64
    get_reco_context : UInt64
  end

  ISpRecoResult_GUID = "20b053be-e235-43cd-9a2a-8d17a48b7842"
  IID_ISpRecoResult = LibC::GUID.new(0x20b053be_u32, 0xe235_u16, 0x43cd_u16, StaticArray[0x9a_u8, 0x2a_u8, 0x8d_u8, 0x17_u8, 0xa4_u8, 0x8b_u8, 0x78_u8, 0x42_u8])
  struct ISpRecoResult
    lpVtbl : ISpRecoResultVTbl*
  end

  struct ISpRecoResult2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
    get_result_times : UInt64
    get_alternates : UInt64
    get_audio : UInt64
    speak_audio : UInt64
    serialize : UInt64
    scale_audio : UInt64
    get_reco_context : UInt64
    commit_alternate : UInt64
    commit_text : UInt64
    set_text_feedback : UInt64
  end

  ISpRecoResult2_GUID = "27cac6c4-88f2-41f2-8817-0c95e59f1e6e"
  IID_ISpRecoResult2 = LibC::GUID.new(0x27cac6c4_u32, 0x88f2_u16, 0x41f2_u16, StaticArray[0x88_u8, 0x17_u8, 0xc_u8, 0x95_u8, 0xe5_u8, 0x9f_u8, 0x1e_u8, 0x6e_u8])
  struct ISpRecoResult2
    lpVtbl : ISpRecoResult2VTbl*
  end

  struct ISpXMLRecoResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_phrase : UInt64
    get_serialized_phrase : UInt64
    get_text : UInt64
    discard : UInt64
    get_result_times : UInt64
    get_alternates : UInt64
    get_audio : UInt64
    speak_audio : UInt64
    serialize : UInt64
    scale_audio : UInt64
    get_reco_context : UInt64
    get_xml_result : UInt64
    get_xml_error_info : UInt64
  end

  ISpXMLRecoResult_GUID = "ae39362b-45a8-4074-9b9e-ccf49aa2d0b6"
  IID_ISpXMLRecoResult = LibC::GUID.new(0xae39362b_u32, 0x45a8_u16, 0x4074_u16, StaticArray[0x9b_u8, 0x9e_u8, 0xcc_u8, 0xf4_u8, 0x9a_u8, 0xa2_u8, 0xd0_u8, 0xb6_u8])
  struct ISpXMLRecoResult
    lpVtbl : ISpXMLRecoResultVTbl*
  end

  struct ISpGrammarBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset_grammar : UInt64
    get_rule : UInt64
    clear_rule : UInt64
    create_new_state : UInt64
    add_word_transition : UInt64
    add_rule_transition : UInt64
    add_resource : UInt64
    commit : UInt64
  end

  ISpGrammarBuilder_GUID = "8137828f-591a-4a42-be58-49ea7ebaac68"
  IID_ISpGrammarBuilder = LibC::GUID.new(0x8137828f_u32, 0x591a_u16, 0x4a42_u16, StaticArray[0xbe_u8, 0x58_u8, 0x49_u8, 0xea_u8, 0x7e_u8, 0xba_u8, 0xac_u8, 0x68_u8])
  struct ISpGrammarBuilder
    lpVtbl : ISpGrammarBuilderVTbl*
  end

  struct ISpRecoGrammarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset_grammar : UInt64
    get_rule : UInt64
    clear_rule : UInt64
    create_new_state : UInt64
    add_word_transition : UInt64
    add_rule_transition : UInt64
    add_resource : UInt64
    commit : UInt64
    get_grammar_id : UInt64
    get_reco_context : UInt64
    load_cmd_from_file : UInt64
    load_cmd_from_object : UInt64
    load_cmd_from_resource : UInt64
    load_cmd_from_memory : UInt64
    load_cmd_from_proprietary_grammar : UInt64
    set_rule_state : UInt64
    set_rule_id_state : UInt64
    load_dictation : UInt64
    unload_dictation : UInt64
    set_dictation_state : UInt64
    set_word_sequence_data : UInt64
    set_text_selection : UInt64
    is_pronounceable : UInt64
    set_grammar_state : UInt64
    save_cmd : UInt64
    get_grammar_state : UInt64
  end

  ISpRecoGrammar_GUID = "2177db29-7f45-47d0-8554-067e91c80502"
  IID_ISpRecoGrammar = LibC::GUID.new(0x2177db29_u32, 0x7f45_u16, 0x47d0_u16, StaticArray[0x85_u8, 0x54_u8, 0x6_u8, 0x7e_u8, 0x91_u8, 0xc8_u8, 0x5_u8, 0x2_u8])
  struct ISpRecoGrammar
    lpVtbl : ISpRecoGrammarVTbl*
  end

  struct ISpGrammarBuilder2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_text_subset : UInt64
    set_phonetic_alphabet : UInt64
  end

  ISpGrammarBuilder2_GUID = "8ab10026-20cc-4b20-8c22-a49c9ba78f60"
  IID_ISpGrammarBuilder2 = LibC::GUID.new(0x8ab10026_u32, 0x20cc_u16, 0x4b20_u16, StaticArray[0x8c_u8, 0x22_u8, 0xa4_u8, 0x9c_u8, 0x9b_u8, 0xa7_u8, 0x8f_u8, 0x60_u8])
  struct ISpGrammarBuilder2
    lpVtbl : ISpGrammarBuilder2VTbl*
  end

  struct ISpRecoGrammar2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_rules : UInt64
    load_cmd_from_file2 : UInt64
    load_cmd_from_memory2 : UInt64
    set_rule_priority : UInt64
    set_rule_weight : UInt64
    set_dictation_weight : UInt64
    set_grammar_loader : UInt64
    set_sml_security_manager : UInt64
  end

  ISpRecoGrammar2_GUID = "4b37bc9e-9ed6-44a3-93d3-18f022b79ec3"
  IID_ISpRecoGrammar2 = LibC::GUID.new(0x4b37bc9e_u32, 0x9ed6_u16, 0x44a3_u16, StaticArray[0x93_u8, 0xd3_u8, 0x18_u8, 0xf0_u8, 0x22_u8, 0xb7_u8, 0x9e_u8, 0xc3_u8])
  struct ISpRecoGrammar2
    lpVtbl : ISpRecoGrammar2VTbl*
  end

  struct ISpeechResourceLoaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    load_resource : UInt64
    get_local_copy : UInt64
    release_local_copy : UInt64
  end

  ISpeechResourceLoader_GUID = "b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3"
  IID_ISpeechResourceLoader = LibC::GUID.new(0xb9ac5783_u32, 0xfcd0_u16, 0x4b21_u16, StaticArray[0xb1_u8, 0x19_u8, 0xb4_u8, 0xf8_u8, 0xda_u8, 0x8f_u8, 0xd2_u8, 0xc3_u8])
  struct ISpeechResourceLoader
    lpVtbl : ISpeechResourceLoaderVTbl*
  end

  struct ISpRecoContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify_sink : UInt64
    set_notify_window_message : UInt64
    set_notify_callback_function : UInt64
    set_notify_callback_interface : UInt64
    set_notify_win32_event : UInt64
    wait_for_notify_event : UInt64
    get_notify_event_handle : UInt64
    set_interest : UInt64
    get_events : UInt64
    get_info : UInt64
    get_recognizer : UInt64
    create_grammar : UInt64
    get_status : UInt64
    get_max_alternates : UInt64
    set_max_alternates : UInt64
    set_audio_options : UInt64
    get_audio_options : UInt64
    deserialize_result : UInt64
    bookmark : UInt64
    set_adaptation_data : UInt64
    pause : UInt64
    resume : UInt64
    set_voice : UInt64
    get_voice : UInt64
    set_voice_purge_event : UInt64
    get_voice_purge_event : UInt64
    set_context_state : UInt64
    get_context_state : UInt64
  end

  ISpRecoContext_GUID = "f740a62f-7c15-489e-8234-940a33d9272d"
  IID_ISpRecoContext = LibC::GUID.new(0xf740a62f_u32, 0x7c15_u16, 0x489e_u16, StaticArray[0x82_u8, 0x34_u8, 0x94_u8, 0xa_u8, 0x33_u8, 0xd9_u8, 0x27_u8, 0x2d_u8])
  struct ISpRecoContext
    lpVtbl : ISpRecoContextVTbl*
  end

  struct ISpRecoContext2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_grammar_options : UInt64
    get_grammar_options : UInt64
    set_adaptation_data2 : UInt64
  end

  ISpRecoContext2_GUID = "bead311c-52ff-437f-9464-6b21054ca73d"
  IID_ISpRecoContext2 = LibC::GUID.new(0xbead311c_u32, 0x52ff_u16, 0x437f_u16, StaticArray[0x94_u8, 0x64_u8, 0x6b_u8, 0x21_u8, 0x5_u8, 0x4c_u8, 0xa7_u8, 0x3d_u8])
  struct ISpRecoContext2
    lpVtbl : ISpRecoContext2VTbl*
  end

  struct ISpPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_property_num : UInt64
    get_property_num : UInt64
    set_property_string : UInt64
    get_property_string : UInt64
  end

  ISpProperties_GUID = "5b4fb971-b115-4de1-ad97-e482e3bf6ee4"
  IID_ISpProperties = LibC::GUID.new(0x5b4fb971_u32, 0xb115_u16, 0x4de1_u16, StaticArray[0xad_u8, 0x97_u8, 0xe4_u8, 0x82_u8, 0xe3_u8, 0xbf_u8, 0x6e_u8, 0xe4_u8])
  struct ISpProperties
    lpVtbl : ISpPropertiesVTbl*
  end

  struct ISpRecognizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_property_num : UInt64
    get_property_num : UInt64
    set_property_string : UInt64
    get_property_string : UInt64
    set_recognizer : UInt64
    get_recognizer : UInt64
    set_input : UInt64
    get_input_object_token : UInt64
    get_input_stream : UInt64
    create_reco_context : UInt64
    get_reco_profile : UInt64
    set_reco_profile : UInt64
    is_shared_instance : UInt64
    get_reco_state : UInt64
    set_reco_state : UInt64
    get_status : UInt64
    get_format : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
    emulate_recognition : UInt64
  end

  ISpRecognizer_GUID = "c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c"
  IID_ISpRecognizer = LibC::GUID.new(0xc2b5f241_u32, 0xdaa0_u16, 0x4507_u16, StaticArray[0x9e_u8, 0x16_u8, 0x5a_u8, 0x1e_u8, 0xaa_u8, 0x2b_u8, 0x7a_u8, 0x5c_u8])
  struct ISpRecognizer
    lpVtbl : ISpRecognizerVTbl*
  end

  struct ISpSerializeStateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_serialized_state : UInt64
    set_serialized_state : UInt64
  end

  ISpSerializeState_GUID = "21b501a0-0ec7-46c9-92c3-a2bc784c54b9"
  IID_ISpSerializeState = LibC::GUID.new(0x21b501a0_u32, 0xec7_u16, 0x46c9_u16, StaticArray[0x92_u8, 0xc3_u8, 0xa2_u8, 0xbc_u8, 0x78_u8, 0x4c_u8, 0x54_u8, 0xb9_u8])
  struct ISpSerializeState
    lpVtbl : ISpSerializeStateVTbl*
  end

  struct ISpRecognizer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    emulate_recognition_ex : UInt64
    set_training_state : UInt64
    reset_acoustic_model_adaptation : UInt64
  end

  ISpRecognizer2_GUID = "8fc6d974-c81e-4098-93c5-0147f61ed4d3"
  IID_ISpRecognizer2 = LibC::GUID.new(0x8fc6d974_u32, 0xc81e_u16, 0x4098_u16, StaticArray[0x93_u8, 0xc5_u8, 0x1_u8, 0x47_u8, 0xf6_u8, 0x1e_u8, 0xd4_u8, 0xd3_u8])
  struct ISpRecognizer2
    lpVtbl : ISpRecognizer2VTbl*
  end

  struct ISpEnginePronunciationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    normalize : UInt64
    get_pronunciations : UInt64
  end

  ISpEnginePronunciation_GUID = "c360ce4b-76d1-4214-ad68-52657d5083da"
  IID_ISpEnginePronunciation = LibC::GUID.new(0xc360ce4b_u32, 0x76d1_u16, 0x4214_u16, StaticArray[0xad_u8, 0x68_u8, 0x52_u8, 0x65_u8, 0x7d_u8, 0x50_u8, 0x83_u8, 0xda_u8])
  struct ISpEnginePronunciation
    lpVtbl : ISpEnginePronunciationVTbl*
  end

  struct ISpDisplayAlternatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_alternates : UInt64
    set_full_stop_trail_space : UInt64
  end

  ISpDisplayAlternates_GUID = "c8d7c7e2-0dde-44b7-afe3-b0c991fbeb5e"
  IID_ISpDisplayAlternates = LibC::GUID.new(0xc8d7c7e2_u32, 0xdde_u16, 0x44b7_u16, StaticArray[0xaf_u8, 0xe3_u8, 0xb0_u8, 0xc9_u8, 0x91_u8, 0xfb_u8, 0xeb_u8, 0x5e_u8])
  struct ISpDisplayAlternates
    lpVtbl : ISpDisplayAlternatesVTbl*
  end

  struct ISpeechDataKeyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    set_binary_value : UInt64
    get_binary_value : UInt64
    set_string_value : UInt64
    get_string_value : UInt64
    set_long_value : UInt64
    get_long_value : UInt64
    open_key : UInt64
    create_key : UInt64
    delete_key : UInt64
    delete_value : UInt64
    enum_keys : UInt64
    enum_values : UInt64
  end

  ISpeechDataKey_GUID = "ce17c09b-4efa-44d5-a4c9-59d9585ab0cd"
  IID_ISpeechDataKey = LibC::GUID.new(0xce17c09b_u32, 0x4efa_u16, 0x44d5_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x59_u8, 0xd9_u8, 0x58_u8, 0x5a_u8, 0xb0_u8, 0xcd_u8])
  struct ISpeechDataKey
    lpVtbl : ISpeechDataKeyVTbl*
  end

  struct ISpeechObjectTokenVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_data_key : UInt64
    get_category : UInt64
    get_description : UInt64
    set_id : UInt64
    get_attribute : UInt64
    create_instance : UInt64
    remove : UInt64
    get_storage_file_name : UInt64
    remove_storage_file_name : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
    matches_attributes : UInt64
  end

  ISpeechObjectToken_GUID = "c74a3adc-b727-4500-a84a-b526721c8b8c"
  IID_ISpeechObjectToken = LibC::GUID.new(0xc74a3adc_u32, 0xb727_u16, 0x4500_u16, StaticArray[0xa8_u8, 0x4a_u8, 0xb5_u8, 0x26_u8, 0x72_u8, 0x1c_u8, 0x8b_u8, 0x8c_u8])
  struct ISpeechObjectToken
    lpVtbl : ISpeechObjectTokenVTbl*
  end

  struct ISpeechObjectTokensVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechObjectTokens_GUID = "9285b776-2e7b-4bc0-b53e-580eb6fa967f"
  IID_ISpeechObjectTokens = LibC::GUID.new(0x9285b776_u32, 0x2e7b_u16, 0x4bc0_u16, StaticArray[0xb5_u8, 0x3e_u8, 0x58_u8, 0xe_u8, 0xb6_u8, 0xfa_u8, 0x96_u8, 0x7f_u8])
  struct ISpeechObjectTokens
    lpVtbl : ISpeechObjectTokensVTbl*
  end

  struct ISpeechObjectTokenCategoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_default : UInt64
    get_default : UInt64
    set_id : UInt64
    get_data_key : UInt64
    enumerate_tokens : UInt64
  end

  ISpeechObjectTokenCategory_GUID = "ca7eac50-2d01-4145-86d4-5ae7d70f4469"
  IID_ISpeechObjectTokenCategory = LibC::GUID.new(0xca7eac50_u32, 0x2d01_u16, 0x4145_u16, StaticArray[0x86_u8, 0xd4_u8, 0x5a_u8, 0xe7_u8, 0xd7_u8, 0xf_u8, 0x44_u8, 0x69_u8])
  struct ISpeechObjectTokenCategory
    lpVtbl : ISpeechObjectTokenCategoryVTbl*
  end

  struct ISpeechAudioBufferInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_min_notification : UInt64
    put_min_notification : UInt64
    get_buffer_size : UInt64
    put_buffer_size : UInt64
    get_event_bias : UInt64
    put_event_bias : UInt64
  end

  ISpeechAudioBufferInfo_GUID = "11b103d8-1142-4edf-a093-82fb3915f8cc"
  IID_ISpeechAudioBufferInfo = LibC::GUID.new(0x11b103d8_u32, 0x1142_u16, 0x4edf_u16, StaticArray[0xa0_u8, 0x93_u8, 0x82_u8, 0xfb_u8, 0x39_u8, 0x15_u8, 0xf8_u8, 0xcc_u8])
  struct ISpeechAudioBufferInfo
    lpVtbl : ISpeechAudioBufferInfoVTbl*
  end

  struct ISpeechAudioStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_free_buffer_space : UInt64
    get_non_blocking_io : UInt64
    get_state : UInt64
    get_current_seek_position : UInt64
    get_current_device_position : UInt64
  end

  ISpeechAudioStatus_GUID = "c62d9c91-7458-47f6-862d-1ef86fb0b278"
  IID_ISpeechAudioStatus = LibC::GUID.new(0xc62d9c91_u32, 0x7458_u16, 0x47f6_u16, StaticArray[0x86_u8, 0x2d_u8, 0x1e_u8, 0xf8_u8, 0x6f_u8, 0xb0_u8, 0xb2_u8, 0x78_u8])
  struct ISpeechAudioStatus
    lpVtbl : ISpeechAudioStatusVTbl*
  end

  struct ISpeechAudioFormatVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    put_type : UInt64
    get_guid : UInt64
    put_guid : UInt64
    get_wave_format_ex : UInt64
    set_wave_format_ex : UInt64
  end

  ISpeechAudioFormat_GUID = "e6e9c590-3e18-40e3-8299-061f98bde7c7"
  IID_ISpeechAudioFormat = LibC::GUID.new(0xe6e9c590_u32, 0x3e18_u16, 0x40e3_u16, StaticArray[0x82_u8, 0x99_u8, 0x6_u8, 0x1f_u8, 0x98_u8, 0xbd_u8, 0xe7_u8, 0xc7_u8])
  struct ISpeechAudioFormat
    lpVtbl : ISpeechAudioFormatVTbl*
  end

  struct ISpeechWaveFormatExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format_tag : UInt64
    put_format_tag : UInt64
    get_channels : UInt64
    put_channels : UInt64
    get_samples_per_sec : UInt64
    put_samples_per_sec : UInt64
    get_avg_bytes_per_sec : UInt64
    put_avg_bytes_per_sec : UInt64
    get_block_align : UInt64
    put_block_align : UInt64
    get_bits_per_sample : UInt64
    put_bits_per_sample : UInt64
    get_extra_data : UInt64
    put_extra_data : UInt64
  end

  ISpeechWaveFormatEx_GUID = "7a1ef0d5-1581-4741-88e4-209a49f11a10"
  IID_ISpeechWaveFormatEx = LibC::GUID.new(0x7a1ef0d5_u32, 0x1581_u16, 0x4741_u16, StaticArray[0x88_u8, 0xe4_u8, 0x20_u8, 0x9a_u8, 0x49_u8, 0xf1_u8, 0x1a_u8, 0x10_u8])
  struct ISpeechWaveFormatEx
    lpVtbl : ISpeechWaveFormatExVTbl*
  end

  struct ISpeechBaseStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
  end

  ISpeechBaseStream_GUID = "6450336f-7d49-4ced-8097-49d6dee37294"
  IID_ISpeechBaseStream = LibC::GUID.new(0x6450336f_u32, 0x7d49_u16, 0x4ced_u16, StaticArray[0x80_u8, 0x97_u8, 0x49_u8, 0xd6_u8, 0xde_u8, 0xe3_u8, 0x72_u8, 0x94_u8])
  struct ISpeechBaseStream
    lpVtbl : ISpeechBaseStreamVTbl*
  end

  struct ISpeechFileStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    open : UInt64
    close : UInt64
  end

  ISpeechFileStream_GUID = "af67f125-ab39-4e93-b4a2-cc2e66e182a7"
  IID_ISpeechFileStream = LibC::GUID.new(0xaf67f125_u32, 0xab39_u16, 0x4e93_u16, StaticArray[0xb4_u8, 0xa2_u8, 0xcc_u8, 0x2e_u8, 0x66_u8, 0xe1_u8, 0x82_u8, 0xa7_u8])
  struct ISpeechFileStream
    lpVtbl : ISpeechFileStreamVTbl*
  end

  struct ISpeechMemoryStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_data : UInt64
    get_data : UInt64
  end

  ISpeechMemoryStream_GUID = "eeb14b68-808b-4abe-a5ea-b51da7588008"
  IID_ISpeechMemoryStream = LibC::GUID.new(0xeeb14b68_u32, 0x808b_u16, 0x4abe_u16, StaticArray[0xa5_u8, 0xea_u8, 0xb5_u8, 0x1d_u8, 0xa7_u8, 0x58_u8, 0x80_u8, 0x8_u8])
  struct ISpeechMemoryStream
    lpVtbl : ISpeechMemoryStreamVTbl*
  end

  struct ISpeechCustomStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    get_base_stream : UInt64
    putref_base_stream : UInt64
  end

  ISpeechCustomStream_GUID = "1a9e9f4f-104f-4db8-a115-efd7fd0c97ae"
  IID_ISpeechCustomStream = LibC::GUID.new(0x1a9e9f4f_u32, 0x104f_u16, 0x4db8_u16, StaticArray[0xa1_u8, 0x15_u8, 0xef_u8, 0xd7_u8, 0xfd_u8, 0xc_u8, 0x97_u8, 0xae_u8])
  struct ISpeechCustomStream
    lpVtbl : ISpeechCustomStreamVTbl*
  end

  struct ISpeechAudioVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    get_status : UInt64
    get_buffer_info : UInt64
    get_default_format : UInt64
    get_volume : UInt64
    put_volume : UInt64
    get_buffer_notify_size : UInt64
    put_buffer_notify_size : UInt64
    get_event_handle : UInt64
    set_state : UInt64
  end

  ISpeechAudio_GUID = "cff8e175-019e-11d3-a08e-00c04f8ef9b5"
  IID_ISpeechAudio = LibC::GUID.new(0xcff8e175_u32, 0x19e_u16, 0x11d3_u16, StaticArray[0xa0_u8, 0x8e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0xb5_u8])
  struct ISpeechAudio
    lpVtbl : ISpeechAudioVTbl*
  end

  struct ISpeechMMSysAudioVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_format : UInt64
    putref_format : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    get_status : UInt64
    get_buffer_info : UInt64
    get_default_format : UInt64
    get_volume : UInt64
    put_volume : UInt64
    get_buffer_notify_size : UInt64
    put_buffer_notify_size : UInt64
    get_event_handle : UInt64
    set_state : UInt64
    get_device_id : UInt64
    put_device_id : UInt64
    get_line_id : UInt64
    put_line_id : UInt64
    get_mm_handle : UInt64
  end

  ISpeechMMSysAudio_GUID = "3c76af6d-1fd7-4831-81d1-3b71d5a13c44"
  IID_ISpeechMMSysAudio = LibC::GUID.new(0x3c76af6d_u32, 0x1fd7_u16, 0x4831_u16, StaticArray[0x81_u8, 0xd1_u8, 0x3b_u8, 0x71_u8, 0xd5_u8, 0xa1_u8, 0x3c_u8, 0x44_u8])
  struct ISpeechMMSysAudio
    lpVtbl : ISpeechMMSysAudioVTbl*
  end

  struct ISpeechVoiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status : UInt64
    get_voice : UInt64
    putref_voice : UInt64
    get_audio_output : UInt64
    putref_audio_output : UInt64
    get_audio_output_stream : UInt64
    putref_audio_output_stream : UInt64
    get_rate : UInt64
    put_rate : UInt64
    get_volume : UInt64
    put_volume : UInt64
    put_allow_audio_output_format_changes_on_next_set : UInt64
    get_allow_audio_output_format_changes_on_next_set : UInt64
    get_event_interests : UInt64
    put_event_interests : UInt64
    put_priority : UInt64
    get_priority : UInt64
    put_alert_boundary : UInt64
    get_alert_boundary : UInt64
    put_synchronous_speak_timeout : UInt64
    get_synchronous_speak_timeout : UInt64
    speak : UInt64
    speak_stream : UInt64
    pause : UInt64
    resume : UInt64
    skip : UInt64
    get_voices : UInt64
    get_audio_outputs : UInt64
    wait_until_done : UInt64
    speak_complete_event : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
  end

  ISpeechVoice_GUID = "269316d8-57bd-11d2-9eee-00c04f797396"
  IID_ISpeechVoice = LibC::GUID.new(0x269316d8_u32, 0x57bd_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xee_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  struct ISpeechVoice
    lpVtbl : ISpeechVoiceVTbl*
  end

  struct ISpeechVoiceStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_current_stream_number : UInt64
    get_last_stream_number_queued : UInt64
    get_last_h_result : UInt64
    get_running_state : UInt64
    get_input_word_position : UInt64
    get_input_word_length : UInt64
    get_input_sentence_position : UInt64
    get_input_sentence_length : UInt64
    get_last_bookmark : UInt64
    get_last_bookmark_id : UInt64
    get_phoneme_id : UInt64
    get_viseme_id : UInt64
  end

  ISpeechVoiceStatus_GUID = "8be47b07-57f6-11d2-9eee-00c04f797396"
  IID_ISpeechVoiceStatus = LibC::GUID.new(0x8be47b07_u32, 0x57f6_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xee_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x73_u8, 0x96_u8])
  struct ISpeechVoiceStatus
    lpVtbl : ISpeechVoiceStatusVTbl*
  end

  struct IISpeechVoiceEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IISpeechVoiceEvents_GUID = "a372acd1-3bef-4bbd-8ffb-cb3e2b416af8"
  IID_IISpeechVoiceEvents = LibC::GUID.new(0xa372acd1_u32, 0x3bef_u16, 0x4bbd_u16, StaticArray[0x8f_u8, 0xfb_u8, 0xcb_u8, 0x3e_u8, 0x2b_u8, 0x41_u8, 0x6a_u8, 0xf8_u8])
  struct IISpeechVoiceEvents
    lpVtbl : IISpeechVoiceEventsVTbl*
  end

  struct ISpeechRecognizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    putref_recognizer : UInt64
    get_recognizer : UInt64
    put_allow_audio_input_format_changes_on_next_set : UInt64
    get_allow_audio_input_format_changes_on_next_set : UInt64
    putref_audio_input : UInt64
    get_audio_input : UInt64
    putref_audio_input_stream : UInt64
    get_audio_input_stream : UInt64
    get_is_shared : UInt64
    put_state : UInt64
    get_state : UInt64
    get_status : UInt64
    putref_profile : UInt64
    get_profile : UInt64
    emulate_recognition : UInt64
    create_reco_context : UInt64
    get_format : UInt64
    set_property_number : UInt64
    get_property_number : UInt64
    set_property_string : UInt64
    get_property_string : UInt64
    is_ui_supported : UInt64
    display_ui : UInt64
    get_recognizers : UInt64
    get_audio_inputs : UInt64
    get_profiles : UInt64
  end

  ISpeechRecognizer_GUID = "2d5f1c0c-bd75-4b08-9478-3b11fea2586c"
  IID_ISpeechRecognizer = LibC::GUID.new(0x2d5f1c0c_u32, 0xbd75_u16, 0x4b08_u16, StaticArray[0x94_u8, 0x78_u8, 0x3b_u8, 0x11_u8, 0xfe_u8, 0xa2_u8, 0x58_u8, 0x6c_u8])
  struct ISpeechRecognizer
    lpVtbl : ISpeechRecognizerVTbl*
  end

  struct ISpeechRecognizerStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_audio_status : UInt64
    get_current_stream_position : UInt64
    get_current_stream_number : UInt64
    get_number_of_active_rules : UInt64
    get_clsid_engine : UInt64
    get_supported_languages : UInt64
  end

  ISpeechRecognizerStatus_GUID = "bff9e781-53ec-484e-bb8a-0e1b5551e35c"
  IID_ISpeechRecognizerStatus = LibC::GUID.new(0xbff9e781_u32, 0x53ec_u16, 0x484e_u16, StaticArray[0xbb_u8, 0x8a_u8, 0xe_u8, 0x1b_u8, 0x55_u8, 0x51_u8, 0xe3_u8, 0x5c_u8])
  struct ISpeechRecognizerStatus
    lpVtbl : ISpeechRecognizerStatusVTbl*
  end

  struct ISpeechRecoContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_recognizer : UInt64
    get_audio_input_interference_status : UInt64
    get_requested_ui_type : UInt64
    putref_voice : UInt64
    get_voice : UInt64
    put_allow_voice_format_matching_on_next_set : UInt64
    get_allow_voice_format_matching_on_next_set : UInt64
    put_voice_purge_event : UInt64
    get_voice_purge_event : UInt64
    put_event_interests : UInt64
    get_event_interests : UInt64
    put_cmd_max_alternates : UInt64
    get_cmd_max_alternates : UInt64
    put_state : UInt64
    get_state : UInt64
    put_retained_audio : UInt64
    get_retained_audio : UInt64
    putref_retained_audio_format : UInt64
    get_retained_audio_format : UInt64
    pause : UInt64
    resume : UInt64
    create_grammar : UInt64
    create_result_from_memory : UInt64
    bookmark : UInt64
    set_adaptation_data : UInt64
  end

  ISpeechRecoContext_GUID = "580aa49d-7e1e-4809-b8e2-57da806104b8"
  IID_ISpeechRecoContext = LibC::GUID.new(0x580aa49d_u32, 0x7e1e_u16, 0x4809_u16, StaticArray[0xb8_u8, 0xe2_u8, 0x57_u8, 0xda_u8, 0x80_u8, 0x61_u8, 0x4_u8, 0xb8_u8])
  struct ISpeechRecoContext
    lpVtbl : ISpeechRecoContextVTbl*
  end

  struct ISpeechRecoGrammarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_reco_context : UInt64
    put_state : UInt64
    get_state : UInt64
    get_rules : UInt64
    reset : UInt64
    cmd_load_from_file : UInt64
    cmd_load_from_object : UInt64
    cmd_load_from_resource : UInt64
    cmd_load_from_memory : UInt64
    cmd_load_from_proprietary_grammar : UInt64
    cmd_set_rule_state : UInt64
    cmd_set_rule_id_state : UInt64
    dictation_load : UInt64
    dictation_unload : UInt64
    dictation_set_state : UInt64
    set_word_sequence_data : UInt64
    set_text_selection : UInt64
    is_pronounceable : UInt64
  end

  ISpeechRecoGrammar_GUID = "b6d6f79f-2158-4e50-b5bc-9a9ccd852a09"
  IID_ISpeechRecoGrammar = LibC::GUID.new(0xb6d6f79f_u32, 0x2158_u16, 0x4e50_u16, StaticArray[0xb5_u8, 0xbc_u8, 0x9a_u8, 0x9c_u8, 0xcd_u8, 0x85_u8, 0x2a_u8, 0x9_u8])
  struct ISpeechRecoGrammar
    lpVtbl : ISpeechRecoGrammarVTbl*
  end

  struct IISpeechRecoContextEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IISpeechRecoContextEvents_GUID = "7b8fcb42-0e9d-4f00-a048-7b04d6179d3d"
  IID_IISpeechRecoContextEvents = LibC::GUID.new(0x7b8fcb42_u32, 0xe9d_u16, 0x4f00_u16, StaticArray[0xa0_u8, 0x48_u8, 0x7b_u8, 0x4_u8, 0xd6_u8, 0x17_u8, 0x9d_u8, 0x3d_u8])
  struct IISpeechRecoContextEvents
    lpVtbl : IISpeechRecoContextEventsVTbl*
  end

  struct ISpeechGrammarRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_attributes : UInt64
    get_initial_state : UInt64
    get_name : UInt64
    get_id : UInt64
    clear : UInt64
    add_resource : UInt64
    add_state : UInt64
  end

  ISpeechGrammarRule_GUID = "afe719cf-5dd1-44f2-999c-7a399f1cfccc"
  IID_ISpeechGrammarRule = LibC::GUID.new(0xafe719cf_u32, 0x5dd1_u16, 0x44f2_u16, StaticArray[0x99_u8, 0x9c_u8, 0x7a_u8, 0x39_u8, 0x9f_u8, 0x1c_u8, 0xfc_u8, 0xcc_u8])
  struct ISpeechGrammarRule
    lpVtbl : ISpeechGrammarRuleVTbl*
  end

  struct ISpeechGrammarRulesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    find_rule : UInt64
    item : UInt64
    get__new_enum : UInt64
    get_dynamic : UInt64
    add : UInt64
    commit : UInt64
    commit_and_save : UInt64
  end

  ISpeechGrammarRules_GUID = "6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1"
  IID_ISpeechGrammarRules = LibC::GUID.new(0x6ffa3b44_u32, 0xfc2d_u16, 0x40d1_u16, StaticArray[0x8a_u8, 0xfc_u8, 0x32_u8, 0x91_u8, 0x1c_u8, 0x7f_u8, 0x1a_u8, 0xd1_u8])
  struct ISpeechGrammarRules
    lpVtbl : ISpeechGrammarRulesVTbl*
  end

  struct ISpeechGrammarRuleStateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_rule : UInt64
    get_transitions : UInt64
    add_word_transition : UInt64
    add_rule_transition : UInt64
    add_special_transition : UInt64
  end

  ISpeechGrammarRuleState_GUID = "d4286f2c-ee67-45ae-b928-28d695362eda"
  IID_ISpeechGrammarRuleState = LibC::GUID.new(0xd4286f2c_u32, 0xee67_u16, 0x45ae_u16, StaticArray[0xb9_u8, 0x28_u8, 0x28_u8, 0xd6_u8, 0x95_u8, 0x36_u8, 0x2e_u8, 0xda_u8])
  struct ISpeechGrammarRuleState
    lpVtbl : ISpeechGrammarRuleStateVTbl*
  end

  struct ISpeechGrammarRuleStateTransitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_text : UInt64
    get_rule : UInt64
    get_weight : UInt64
    get_property_name : UInt64
    get_property_id : UInt64
    get_property_value : UInt64
    get_next_state : UInt64
  end

  ISpeechGrammarRuleStateTransition_GUID = "cafd1db1-41d1-4a06-9863-e2e81da17a9a"
  IID_ISpeechGrammarRuleStateTransition = LibC::GUID.new(0xcafd1db1_u32, 0x41d1_u16, 0x4a06_u16, StaticArray[0x98_u8, 0x63_u8, 0xe2_u8, 0xe8_u8, 0x1d_u8, 0xa1_u8, 0x7a_u8, 0x9a_u8])
  struct ISpeechGrammarRuleStateTransition
    lpVtbl : ISpeechGrammarRuleStateTransitionVTbl*
  end

  struct ISpeechGrammarRuleStateTransitionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechGrammarRuleStateTransitions_GUID = "eabce657-75bc-44a2-aa7f-c56476742963"
  IID_ISpeechGrammarRuleStateTransitions = LibC::GUID.new(0xeabce657_u32, 0x75bc_u16, 0x44a2_u16, StaticArray[0xaa_u8, 0x7f_u8, 0xc5_u8, 0x64_u8, 0x76_u8, 0x74_u8, 0x29_u8, 0x63_u8])
  struct ISpeechGrammarRuleStateTransitions
    lpVtbl : ISpeechGrammarRuleStateTransitionsVTbl*
  end

  struct ISpeechTextSelectionInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    put_active_offset : UInt64
    get_active_offset : UInt64
    put_active_length : UInt64
    get_active_length : UInt64
    put_selection_offset : UInt64
    get_selection_offset : UInt64
    put_selection_length : UInt64
    get_selection_length : UInt64
  end

  ISpeechTextSelectionInformation_GUID = "3b9c7e7a-6eee-4ded-9092-11657279adbe"
  IID_ISpeechTextSelectionInformation = LibC::GUID.new(0x3b9c7e7a_u32, 0x6eee_u16, 0x4ded_u16, StaticArray[0x90_u8, 0x92_u8, 0x11_u8, 0x65_u8, 0x72_u8, 0x79_u8, 0xad_u8, 0xbe_u8])
  struct ISpeechTextSelectionInformation
    lpVtbl : ISpeechTextSelectionInformationVTbl*
  end

  struct ISpeechRecoResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_reco_context : UInt64
    get_times : UInt64
    putref_audio_format : UInt64
    get_audio_format : UInt64
    get_phrase_info : UInt64
    alternates : UInt64
    audio : UInt64
    speak_audio : UInt64
    save_to_memory : UInt64
    discard_result_info : UInt64
  end

  ISpeechRecoResult_GUID = "ed2879cf-ced9-4ee6-a534-de0191d5468d"
  IID_ISpeechRecoResult = LibC::GUID.new(0xed2879cf_u32, 0xced9_u16, 0x4ee6_u16, StaticArray[0xa5_u8, 0x34_u8, 0xde_u8, 0x1_u8, 0x91_u8, 0xd5_u8, 0x46_u8, 0x8d_u8])
  struct ISpeechRecoResult
    lpVtbl : ISpeechRecoResultVTbl*
  end

  struct ISpeechRecoResult2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_reco_context : UInt64
    get_times : UInt64
    putref_audio_format : UInt64
    get_audio_format : UInt64
    get_phrase_info : UInt64
    alternates : UInt64
    audio : UInt64
    speak_audio : UInt64
    save_to_memory : UInt64
    discard_result_info : UInt64
    set_text_feedback : UInt64
  end

  ISpeechRecoResult2_GUID = "8e0a246d-d3c8-45de-8657-04290c458c3c"
  IID_ISpeechRecoResult2 = LibC::GUID.new(0x8e0a246d_u32, 0xd3c8_u16, 0x45de_u16, StaticArray[0x86_u8, 0x57_u8, 0x4_u8, 0x29_u8, 0xc_u8, 0x45_u8, 0x8c_u8, 0x3c_u8])
  struct ISpeechRecoResult2
    lpVtbl : ISpeechRecoResult2VTbl*
  end

  struct ISpeechRecoResultTimesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_stream_time : UInt64
    get_length : UInt64
    get_tick_count : UInt64
    get_offset_from_start : UInt64
  end

  ISpeechRecoResultTimes_GUID = "62b3b8fb-f6e7-41be-bdcb-056b1c29efc0"
  IID_ISpeechRecoResultTimes = LibC::GUID.new(0x62b3b8fb_u32, 0xf6e7_u16, 0x41be_u16, StaticArray[0xbd_u8, 0xcb_u8, 0x5_u8, 0x6b_u8, 0x1c_u8, 0x29_u8, 0xef_u8, 0xc0_u8])
  struct ISpeechRecoResultTimes
    lpVtbl : ISpeechRecoResultTimesVTbl*
  end

  struct ISpeechPhraseAlternateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_reco_result : UInt64
    get_start_element_in_result : UInt64
    get_number_of_elements_in_result : UInt64
    get_phrase_info : UInt64
    commit : UInt64
  end

  ISpeechPhraseAlternate_GUID = "27864a2a-2b9f-4cb8-92d3-0d2722fd1e73"
  IID_ISpeechPhraseAlternate = LibC::GUID.new(0x27864a2a_u32, 0x2b9f_u16, 0x4cb8_u16, StaticArray[0x92_u8, 0xd3_u8, 0xd_u8, 0x27_u8, 0x22_u8, 0xfd_u8, 0x1e_u8, 0x73_u8])
  struct ISpeechPhraseAlternate
    lpVtbl : ISpeechPhraseAlternateVTbl*
  end

  struct ISpeechPhraseAlternatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechPhraseAlternates_GUID = "b238b6d5-f276-4c3d-a6c1-2974801c3cc2"
  IID_ISpeechPhraseAlternates = LibC::GUID.new(0xb238b6d5_u32, 0xf276_u16, 0x4c3d_u16, StaticArray[0xa6_u8, 0xc1_u8, 0x29_u8, 0x74_u8, 0x80_u8, 0x1c_u8, 0x3c_u8, 0xc2_u8])
  struct ISpeechPhraseAlternates
    lpVtbl : ISpeechPhraseAlternatesVTbl*
  end

  struct ISpeechPhraseInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_language_id : UInt64
    get_grammar_id : UInt64
    get_start_time : UInt64
    get_audio_stream_position : UInt64
    get_audio_size_bytes : UInt64
    get_retained_size_bytes : UInt64
    get_audio_size_time : UInt64
    get_rule : UInt64
    get_properties : UInt64
    get_elements : UInt64
    get_replacements : UInt64
    get_engine_id : UInt64
    get_engine_private_data : UInt64
    save_to_memory : UInt64
    get_text : UInt64
    get_display_attributes : UInt64
  end

  ISpeechPhraseInfo_GUID = "961559cf-4e67-4662-8bf0-d93f1fcd61b3"
  IID_ISpeechPhraseInfo = LibC::GUID.new(0x961559cf_u32, 0x4e67_u16, 0x4662_u16, StaticArray[0x8b_u8, 0xf0_u8, 0xd9_u8, 0x3f_u8, 0x1f_u8, 0xcd_u8, 0x61_u8, 0xb3_u8])
  struct ISpeechPhraseInfo
    lpVtbl : ISpeechPhraseInfoVTbl*
  end

  struct ISpeechPhraseElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_audio_time_offset : UInt64
    get_audio_size_time : UInt64
    get_audio_stream_offset : UInt64
    get_audio_size_bytes : UInt64
    get_retained_stream_offset : UInt64
    get_retained_size_bytes : UInt64
    get_display_text : UInt64
    get_lexical_form : UInt64
    get_pronunciation : UInt64
    get_display_attributes : UInt64
    get_required_confidence : UInt64
    get_actual_confidence : UInt64
    get_engine_confidence : UInt64
  end

  ISpeechPhraseElement_GUID = "e6176f96-e373-4801-b223-3b62c068c0b4"
  IID_ISpeechPhraseElement = LibC::GUID.new(0xe6176f96_u32, 0xe373_u16, 0x4801_u16, StaticArray[0xb2_u8, 0x23_u8, 0x3b_u8, 0x62_u8, 0xc0_u8, 0x68_u8, 0xc0_u8, 0xb4_u8])
  struct ISpeechPhraseElement
    lpVtbl : ISpeechPhraseElementVTbl*
  end

  struct ISpeechPhraseElementsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechPhraseElements_GUID = "0626b328-3478-467d-a0b3-d0853b93dda3"
  IID_ISpeechPhraseElements = LibC::GUID.new(0x626b328_u32, 0x3478_u16, 0x467d_u16, StaticArray[0xa0_u8, 0xb3_u8, 0xd0_u8, 0x85_u8, 0x3b_u8, 0x93_u8, 0xdd_u8, 0xa3_u8])
  struct ISpeechPhraseElements
    lpVtbl : ISpeechPhraseElementsVTbl*
  end

  struct ISpeechPhraseReplacementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_attributes : UInt64
    get_text : UInt64
    get_first_element : UInt64
    get_number_of_elements : UInt64
  end

  ISpeechPhraseReplacement_GUID = "2890a410-53a7-4fb5-94ec-06d4998e3d02"
  IID_ISpeechPhraseReplacement = LibC::GUID.new(0x2890a410_u32, 0x53a7_u16, 0x4fb5_u16, StaticArray[0x94_u8, 0xec_u8, 0x6_u8, 0xd4_u8, 0x99_u8, 0x8e_u8, 0x3d_u8, 0x2_u8])
  struct ISpeechPhraseReplacement
    lpVtbl : ISpeechPhraseReplacementVTbl*
  end

  struct ISpeechPhraseReplacementsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechPhraseReplacements_GUID = "38bc662f-2257-4525-959e-2069d2596c05"
  IID_ISpeechPhraseReplacements = LibC::GUID.new(0x38bc662f_u32, 0x2257_u16, 0x4525_u16, StaticArray[0x95_u8, 0x9e_u8, 0x20_u8, 0x69_u8, 0xd2_u8, 0x59_u8, 0x6c_u8, 0x5_u8])
  struct ISpeechPhraseReplacements
    lpVtbl : ISpeechPhraseReplacementsVTbl*
  end

  struct ISpeechPhrasePropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_id : UInt64
    get_value : UInt64
    get_first_element : UInt64
    get_number_of_elements : UInt64
    get_engine_confidence : UInt64
    get_confidence : UInt64
    get_parent : UInt64
    get_children : UInt64
  end

  ISpeechPhraseProperty_GUID = "ce563d48-961e-4732-a2e1-378a42b430be"
  IID_ISpeechPhraseProperty = LibC::GUID.new(0xce563d48_u32, 0x961e_u16, 0x4732_u16, StaticArray[0xa2_u8, 0xe1_u8, 0x37_u8, 0x8a_u8, 0x42_u8, 0xb4_u8, 0x30_u8, 0xbe_u8])
  struct ISpeechPhraseProperty
    lpVtbl : ISpeechPhrasePropertyVTbl*
  end

  struct ISpeechPhrasePropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechPhraseProperties_GUID = "08166b47-102e-4b23-a599-bdb98dbfd1f4"
  IID_ISpeechPhraseProperties = LibC::GUID.new(0x8166b47_u32, 0x102e_u16, 0x4b23_u16, StaticArray[0xa5_u8, 0x99_u8, 0xbd_u8, 0xb9_u8, 0x8d_u8, 0xbf_u8, 0xd1_u8, 0xf4_u8])
  struct ISpeechPhraseProperties
    lpVtbl : ISpeechPhrasePropertiesVTbl*
  end

  struct ISpeechPhraseRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_id : UInt64
    get_first_element : UInt64
    get_number_of_elements : UInt64
    get_parent : UInt64
    get_children : UInt64
    get_confidence : UInt64
    get_engine_confidence : UInt64
  end

  ISpeechPhraseRule_GUID = "a7bfe112-a4a0-48d9-b602-c313843f6964"
  IID_ISpeechPhraseRule = LibC::GUID.new(0xa7bfe112_u32, 0xa4a0_u16, 0x48d9_u16, StaticArray[0xb6_u8, 0x2_u8, 0xc3_u8, 0x13_u8, 0x84_u8, 0x3f_u8, 0x69_u8, 0x64_u8])
  struct ISpeechPhraseRule
    lpVtbl : ISpeechPhraseRuleVTbl*
  end

  struct ISpeechPhraseRulesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechPhraseRules_GUID = "9047d593-01dd-4b72-81a3-e4a0ca69f407"
  IID_ISpeechPhraseRules = LibC::GUID.new(0x9047d593_u32, 0x1dd_u16, 0x4b72_u16, StaticArray[0x81_u8, 0xa3_u8, 0xe4_u8, 0xa0_u8, 0xca_u8, 0x69_u8, 0xf4_u8, 0x7_u8])
  struct ISpeechPhraseRules
    lpVtbl : ISpeechPhraseRulesVTbl*
  end

  struct ISpeechLexiconVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_generation_id : UInt64
    get_words : UInt64
    add_pronunciation : UInt64
    add_pronunciation_by_phone_ids : UInt64
    remove_pronunciation : UInt64
    remove_pronunciation_by_phone_ids : UInt64
    get_pronunciations : UInt64
    get_generation_change : UInt64
  end

  ISpeechLexicon_GUID = "3da7627a-c7ae-4b23-8708-638c50362c25"
  IID_ISpeechLexicon = LibC::GUID.new(0x3da7627a_u32, 0xc7ae_u16, 0x4b23_u16, StaticArray[0x87_u8, 0x8_u8, 0x63_u8, 0x8c_u8, 0x50_u8, 0x36_u8, 0x2c_u8, 0x25_u8])
  struct ISpeechLexicon
    lpVtbl : ISpeechLexiconVTbl*
  end

  struct ISpeechLexiconWordsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechLexiconWords_GUID = "8d199862-415e-47d5-ac4f-faa608b424e6"
  IID_ISpeechLexiconWords = LibC::GUID.new(0x8d199862_u32, 0x415e_u16, 0x47d5_u16, StaticArray[0xac_u8, 0x4f_u8, 0xfa_u8, 0xa6_u8, 0x8_u8, 0xb4_u8, 0x24_u8, 0xe6_u8])
  struct ISpeechLexiconWords
    lpVtbl : ISpeechLexiconWordsVTbl*
  end

  struct ISpeechLexiconWordVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_lang_id : UInt64
    get_type : UInt64
    get_word : UInt64
    get_pronunciations : UInt64
  end

  ISpeechLexiconWord_GUID = "4e5b933c-c9be-48ed-8842-1ee51bb1d4ff"
  IID_ISpeechLexiconWord = LibC::GUID.new(0x4e5b933c_u32, 0xc9be_u16, 0x48ed_u16, StaticArray[0x88_u8, 0x42_u8, 0x1e_u8, 0xe5_u8, 0x1b_u8, 0xb1_u8, 0xd4_u8, 0xff_u8])
  struct ISpeechLexiconWord
    lpVtbl : ISpeechLexiconWordVTbl*
  end

  struct ISpeechLexiconPronunciationsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  ISpeechLexiconPronunciations_GUID = "72829128-5682-4704-a0d4-3e2bb6f2ead3"
  IID_ISpeechLexiconPronunciations = LibC::GUID.new(0x72829128_u32, 0x5682_u16, 0x4704_u16, StaticArray[0xa0_u8, 0xd4_u8, 0x3e_u8, 0x2b_u8, 0xb6_u8, 0xf2_u8, 0xea_u8, 0xd3_u8])
  struct ISpeechLexiconPronunciations
    lpVtbl : ISpeechLexiconPronunciationsVTbl*
  end

  struct ISpeechLexiconPronunciationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_lang_id : UInt64
    get_part_of_speech : UInt64
    get_phone_ids : UInt64
    get_symbolic : UInt64
  end

  ISpeechLexiconPronunciation_GUID = "95252c5d-9e43-4f4a-9899-48ee73352f9f"
  IID_ISpeechLexiconPronunciation = LibC::GUID.new(0x95252c5d_u32, 0x9e43_u16, 0x4f4a_u16, StaticArray[0x98_u8, 0x99_u8, 0x48_u8, 0xee_u8, 0x73_u8, 0x35_u8, 0x2f_u8, 0x9f_u8])
  struct ISpeechLexiconPronunciation
    lpVtbl : ISpeechLexiconPronunciationVTbl*
  end

  struct ISpeechXMLRecoResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_reco_context : UInt64
    get_times : UInt64
    putref_audio_format : UInt64
    get_audio_format : UInt64
    get_phrase_info : UInt64
    alternates : UInt64
    audio : UInt64
    speak_audio : UInt64
    save_to_memory : UInt64
    discard_result_info : UInt64
    get_xml_result : UInt64
    get_xml_error_info : UInt64
  end

  ISpeechXMLRecoResult_GUID = "aaec54af-8f85-4924-944d-b79d39d72e19"
  IID_ISpeechXMLRecoResult = LibC::GUID.new(0xaaec54af_u32, 0x8f85_u16, 0x4924_u16, StaticArray[0x94_u8, 0x4d_u8, 0xb7_u8, 0x9d_u8, 0x39_u8, 0xd7_u8, 0x2e_u8, 0x19_u8])
  struct ISpeechXMLRecoResult
    lpVtbl : ISpeechXMLRecoResultVTbl*
  end

  struct ISpeechRecoResultDispatchVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_reco_context : UInt64
    get_times : UInt64
    putref_audio_format : UInt64
    get_audio_format : UInt64
    get_phrase_info : UInt64
    alternates : UInt64
    audio : UInt64
    speak_audio : UInt64
    save_to_memory : UInt64
    discard_result_info : UInt64
    get_xml_result : UInt64
    get_xml_error_info : UInt64
    set_text_feedback : UInt64
  end

  ISpeechRecoResultDispatch_GUID = "6d60eb64-aced-40a6-bbf3-4e557f71dee2"
  IID_ISpeechRecoResultDispatch = LibC::GUID.new(0x6d60eb64_u32, 0xaced_u16, 0x40a6_u16, StaticArray[0xbb_u8, 0xf3_u8, 0x4e_u8, 0x55_u8, 0x7f_u8, 0x71_u8, 0xde_u8, 0xe2_u8])
  struct ISpeechRecoResultDispatch
    lpVtbl : ISpeechRecoResultDispatchVTbl*
  end

  struct ISpeechPhraseInfoBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    restore_phrase_from_memory : UInt64
  end

  ISpeechPhraseInfoBuilder_GUID = "3b151836-df3a-4e0a-846c-d2adc9334333"
  IID_ISpeechPhraseInfoBuilder = LibC::GUID.new(0x3b151836_u32, 0xdf3a_u16, 0x4e0a_u16, StaticArray[0x84_u8, 0x6c_u8, 0xd2_u8, 0xad_u8, 0xc9_u8, 0x33_u8, 0x43_u8, 0x33_u8])
  struct ISpeechPhraseInfoBuilder
    lpVtbl : ISpeechPhraseInfoBuilderVTbl*
  end

  struct ISpeechPhoneConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_language_id : UInt64
    put_language_id : UInt64
    phone_to_id : UInt64
    id_to_phone : UInt64
  end

  ISpeechPhoneConverter_GUID = "c3e4f353-433f-43d6-89a1-6a62a7054c3d"
  IID_ISpeechPhoneConverter = LibC::GUID.new(0xc3e4f353_u32, 0x433f_u16, 0x43d6_u16, StaticArray[0x89_u8, 0xa1_u8, 0x6a_u8, 0x62_u8, 0xa7_u8, 0x5_u8, 0x4c_u8, 0x3d_u8])
  struct ISpeechPhoneConverter
    lpVtbl : ISpeechPhoneConverterVTbl*
  end

end
struct LibWin32::ISpNotifyCallback
  def notify_callback(wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.notify_callback.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, HRESULT)).call(wparam, lparam)
  end
end
struct LibWin32::ISpNotifySource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify_sink(pnotifysink : ISpNotifySink) : HRESULT
    @lpVtbl.value.set_notify_sink.unsafe_as(Proc(ISpNotifySink, HRESULT)).call(pnotifysink)
  end
  def set_notify_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def set_notify_callback_function(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_function.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def set_notify_callback_interface(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_interface.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def set_notify_win32_event : HRESULT
    @lpVtbl.value.set_notify_win32_event.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_notify_event(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait_for_notify_event.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_notify_event_handle : LibC::HANDLE
    @lpVtbl.value.get_notify_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
end
struct LibWin32::ISpNotifySink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def notify : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpNotifyTranslator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def notify : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(HRESULT)).call
  end
  def init_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.init_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def init_callback(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.init_callback.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def init_sp_notify_callback(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.init_sp_notify_callback.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def init_win32_event(hevent : LibC::HANDLE, fclosehandleonrelease : LibC::BOOL) : HRESULT
    @lpVtbl.value.init_win32_event.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, HRESULT)).call(hevent, fclosehandleonrelease)
  end
  def wait(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_event_handle : LibC::HANDLE
    @lpVtbl.value.get_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
end
struct LibWin32::ISpDataKey
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_data(pszvaluename : LibC::LPWSTR, cbdata : UInt32, pdata : UInt8*) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt8*, HRESULT)).call(pszvaluename, cbdata, pdata)
  end
  def get_data(pszvaluename : LibC::LPWSTR, pcbdata : UInt32*, pdata : UInt8*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(LibC::LPWSTR, UInt32*, UInt8*, HRESULT)).call(pszvaluename, pcbdata, pdata)
  end
  def set_string_value(pszvaluename : LibC::LPWSTR, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszvaluename, pszvalue)
  end
  def get_string_value(pszvaluename : LibC::LPWSTR, ppszvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszvaluename, ppszvalue)
  end
  def set_dword(pszvaluename : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.set_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszvaluename, dwvalue)
  end
  def get_dword(pszvaluename : LibC::LPWSTR, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszvaluename, pdwvalue)
  end
  def open_key(pszsubkeyname : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkeyname, ppsubkey)
  end
  def create_key(pszsubkey : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkey, ppsubkey)
  end
  def delete_key(pszsubkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubkey)
  end
  def delete_value(pszvaluename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszvaluename)
  end
  def enum_keys(index : UInt32, ppszsubkeyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszsubkeyname)
  end
  def enum_values(index : UInt32, ppszvaluename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszvaluename)
  end
end
struct LibWin32::ISpRegDataKey
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_data(pszvaluename : LibC::LPWSTR, cbdata : UInt32, pdata : UInt8*) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt8*, HRESULT)).call(pszvaluename, cbdata, pdata)
  end
  def get_data(pszvaluename : LibC::LPWSTR, pcbdata : UInt32*, pdata : UInt8*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(LibC::LPWSTR, UInt32*, UInt8*, HRESULT)).call(pszvaluename, pcbdata, pdata)
  end
  def set_string_value(pszvaluename : LibC::LPWSTR, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszvaluename, pszvalue)
  end
  def get_string_value(pszvaluename : LibC::LPWSTR, ppszvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszvaluename, ppszvalue)
  end
  def set_dword(pszvaluename : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.set_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszvaluename, dwvalue)
  end
  def get_dword(pszvaluename : LibC::LPWSTR, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszvaluename, pdwvalue)
  end
  def open_key(pszsubkeyname : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkeyname, ppsubkey)
  end
  def create_key(pszsubkey : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkey, ppsubkey)
  end
  def delete_key(pszsubkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubkey)
  end
  def delete_value(pszvaluename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszvaluename)
  end
  def enum_keys(index : UInt32, ppszsubkeyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszsubkeyname)
  end
  def enum_values(index : UInt32, ppszvaluename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszvaluename)
  end
  def set_key(hkey : HKEY, freadonly : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_key.unsafe_as(Proc(HKEY, LibC::BOOL, HRESULT)).call(hkey, freadonly)
  end
end
struct LibWin32::ISpObjectTokenCategory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_data(pszvaluename : LibC::LPWSTR, cbdata : UInt32, pdata : UInt8*) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt8*, HRESULT)).call(pszvaluename, cbdata, pdata)
  end
  def get_data(pszvaluename : LibC::LPWSTR, pcbdata : UInt32*, pdata : UInt8*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(LibC::LPWSTR, UInt32*, UInt8*, HRESULT)).call(pszvaluename, pcbdata, pdata)
  end
  def set_string_value(pszvaluename : LibC::LPWSTR, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszvaluename, pszvalue)
  end
  def get_string_value(pszvaluename : LibC::LPWSTR, ppszvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszvaluename, ppszvalue)
  end
  def set_dword(pszvaluename : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.set_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszvaluename, dwvalue)
  end
  def get_dword(pszvaluename : LibC::LPWSTR, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszvaluename, pdwvalue)
  end
  def open_key(pszsubkeyname : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkeyname, ppsubkey)
  end
  def create_key(pszsubkey : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkey, ppsubkey)
  end
  def delete_key(pszsubkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubkey)
  end
  def delete_value(pszvaluename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszvaluename)
  end
  def enum_keys(index : UInt32, ppszsubkeyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszsubkeyname)
  end
  def enum_values(index : UInt32, ppszvaluename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszvaluename)
  end
  def set_id(pszcategoryid : LibC::LPWSTR, fcreateifnotexist : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszcategoryid, fcreateifnotexist)
  end
  def get_id(ppszcomemcategoryid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszcomemcategoryid)
  end
  def get_data_key(spdkl : SPDATAKEYLOCATION, ppdatakey : ISpDataKey*) : HRESULT
    @lpVtbl.value.get_data_key.unsafe_as(Proc(SPDATAKEYLOCATION, ISpDataKey*, HRESULT)).call(spdkl, ppdatakey)
  end
  def enum_tokens(pzsreqattribs : LibC::LPWSTR, pszoptattribs : LibC::LPWSTR, ppenum : IEnumSpObjectTokens*) : HRESULT
    @lpVtbl.value.enum_tokens.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, IEnumSpObjectTokens*, HRESULT)).call(pzsreqattribs, pszoptattribs, ppenum)
  end
  def set_default_token_id(psztokenid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_default_token_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztokenid)
  end
  def get_default_token_id(ppszcomemtokenid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_default_token_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszcomemtokenid)
  end
end
struct LibWin32::ISpObjectToken
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_data(pszvaluename : LibC::LPWSTR, cbdata : UInt32, pdata : UInt8*) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt8*, HRESULT)).call(pszvaluename, cbdata, pdata)
  end
  def get_data(pszvaluename : LibC::LPWSTR, pcbdata : UInt32*, pdata : UInt8*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(LibC::LPWSTR, UInt32*, UInt8*, HRESULT)).call(pszvaluename, pcbdata, pdata)
  end
  def set_string_value(pszvaluename : LibC::LPWSTR, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszvaluename, pszvalue)
  end
  def get_string_value(pszvaluename : LibC::LPWSTR, ppszvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszvaluename, ppszvalue)
  end
  def set_dword(pszvaluename : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.set_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszvaluename, dwvalue)
  end
  def get_dword(pszvaluename : LibC::LPWSTR, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszvaluename, pdwvalue)
  end
  def open_key(pszsubkeyname : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkeyname, ppsubkey)
  end
  def create_key(pszsubkey : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkey, ppsubkey)
  end
  def delete_key(pszsubkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubkey)
  end
  def delete_value(pszvaluename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszvaluename)
  end
  def enum_keys(index : UInt32, ppszsubkeyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszsubkeyname)
  end
  def enum_values(index : UInt32, ppszvaluename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszvaluename)
  end
  def set_id(pszcategoryid : LibC::LPWSTR, psztokenid : LibC::LPWSTR, fcreateifnotexist : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszcategoryid, psztokenid, fcreateifnotexist)
  end
  def get_id(ppszcomemtokenid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszcomemtokenid)
  end
  def get_category(pptokencategory : ISpObjectTokenCategory*) : HRESULT
    @lpVtbl.value.get_category.unsafe_as(Proc(ISpObjectTokenCategory*, HRESULT)).call(pptokencategory)
  end
  def create_instance(punkouter : IUnknown, dwclscontext : UInt32, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, UInt32, Guid*, Void**, HRESULT)).call(punkouter, dwclscontext, riid, ppvobject)
  end
  def get_storage_file_name(clsidcaller : Guid*, pszvaluename : LibC::LPWSTR, pszfilenamespecifier : LibC::LPWSTR, nfolder : UInt32, ppszfilepath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_storage_file_name.unsafe_as(Proc(Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(clsidcaller, pszvaluename, pszfilenamespecifier, nfolder, ppszfilepath)
  end
  def remove_storage_file_name(clsidcaller : Guid*, pszkeyname : LibC::LPWSTR, fdeletefile : LibC::BOOL) : HRESULT
    @lpVtbl.value.remove_storage_file_name.unsafe_as(Proc(Guid*, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(clsidcaller, pszkeyname, fdeletefile)
  end
  def remove(pclsidcaller : Guid*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Guid*, HRESULT)).call(pclsidcaller)
  end
  def is_ui_supported(psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, punkobject : IUnknown, pfsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(LibC::LPWSTR, Void*, UInt32, IUnknown, LibC::BOOL*, HRESULT)).call(psztypeofui, pvextradata, cbextradata, punkobject, pfsupported)
  end
  def display_ui(hwndparent : LibC::HANDLE, psztitle : LibC::LPWSTR, psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, punkobject : IUnknown) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, IUnknown, HRESULT)).call(hwndparent, psztitle, psztypeofui, pvextradata, cbextradata, punkobject)
  end
  def matches_attributes(pszattributes : LibC::LPWSTR, pfmatches : LibC::BOOL*) : HRESULT
    @lpVtbl.value.matches_attributes.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pszattributes, pfmatches)
  end
end
struct LibWin32::ISpObjectTokenInit
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_data(pszvaluename : LibC::LPWSTR, cbdata : UInt32, pdata : UInt8*) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt8*, HRESULT)).call(pszvaluename, cbdata, pdata)
  end
  def get_data(pszvaluename : LibC::LPWSTR, pcbdata : UInt32*, pdata : UInt8*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(LibC::LPWSTR, UInt32*, UInt8*, HRESULT)).call(pszvaluename, pcbdata, pdata)
  end
  def set_string_value(pszvaluename : LibC::LPWSTR, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszvaluename, pszvalue)
  end
  def get_string_value(pszvaluename : LibC::LPWSTR, ppszvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszvaluename, ppszvalue)
  end
  def set_dword(pszvaluename : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.set_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszvaluename, dwvalue)
  end
  def get_dword(pszvaluename : LibC::LPWSTR, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszvaluename, pdwvalue)
  end
  def open_key(pszsubkeyname : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkeyname, ppsubkey)
  end
  def create_key(pszsubkey : LibC::LPWSTR, ppsubkey : ISpDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(LibC::LPWSTR, ISpDataKey*, HRESULT)).call(pszsubkey, ppsubkey)
  end
  def delete_key(pszsubkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubkey)
  end
  def delete_value(pszvaluename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszvaluename)
  end
  def enum_keys(index : UInt32, ppszsubkeyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszsubkeyname)
  end
  def enum_values(index : UInt32, ppszvaluename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, ppszvaluename)
  end
  def set_id(pszcategoryid : LibC::LPWSTR, psztokenid : LibC::LPWSTR, fcreateifnotexist : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszcategoryid, psztokenid, fcreateifnotexist)
  end
  def get_id(ppszcomemtokenid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszcomemtokenid)
  end
  def get_category(pptokencategory : ISpObjectTokenCategory*) : HRESULT
    @lpVtbl.value.get_category.unsafe_as(Proc(ISpObjectTokenCategory*, HRESULT)).call(pptokencategory)
  end
  def create_instance(punkouter : IUnknown, dwclscontext : UInt32, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, UInt32, Guid*, Void**, HRESULT)).call(punkouter, dwclscontext, riid, ppvobject)
  end
  def get_storage_file_name(clsidcaller : Guid*, pszvaluename : LibC::LPWSTR, pszfilenamespecifier : LibC::LPWSTR, nfolder : UInt32, ppszfilepath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_storage_file_name.unsafe_as(Proc(Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(clsidcaller, pszvaluename, pszfilenamespecifier, nfolder, ppszfilepath)
  end
  def remove_storage_file_name(clsidcaller : Guid*, pszkeyname : LibC::LPWSTR, fdeletefile : LibC::BOOL) : HRESULT
    @lpVtbl.value.remove_storage_file_name.unsafe_as(Proc(Guid*, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(clsidcaller, pszkeyname, fdeletefile)
  end
  def remove(pclsidcaller : Guid*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Guid*, HRESULT)).call(pclsidcaller)
  end
  def is_ui_supported(psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, punkobject : IUnknown, pfsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(LibC::LPWSTR, Void*, UInt32, IUnknown, LibC::BOOL*, HRESULT)).call(psztypeofui, pvextradata, cbextradata, punkobject, pfsupported)
  end
  def display_ui(hwndparent : LibC::HANDLE, psztitle : LibC::LPWSTR, psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, punkobject : IUnknown) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, IUnknown, HRESULT)).call(hwndparent, psztitle, psztypeofui, pvextradata, cbextradata, punkobject)
  end
  def matches_attributes(pszattributes : LibC::LPWSTR, pfmatches : LibC::BOOL*) : HRESULT
    @lpVtbl.value.matches_attributes.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pszattributes, pfmatches)
  end
  def init_from_data_key(pszcategoryid : LibC::LPWSTR, psztokenid : LibC::LPWSTR, pdatakey : ISpDataKey) : HRESULT
    @lpVtbl.value.init_from_data_key.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, ISpDataKey, HRESULT)).call(pszcategoryid, psztokenid, pdatakey)
  end
end
struct LibWin32::IEnumSpObjectTokens
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, pelt : ISpObjectToken*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISpObjectToken*, UInt32*, HRESULT)).call(celt, pelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSpObjectTokens*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSpObjectTokens*, HRESULT)).call(ppenum)
  end
  def item(index : UInt32, pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt32, ISpObjectToken*, HRESULT)).call(index, pptoken)
  end
  def get_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
end
struct LibWin32::ISpObjectWithToken
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_object_token(ptoken : ISpObjectToken) : HRESULT
    @lpVtbl.value.set_object_token.unsafe_as(Proc(ISpObjectToken, HRESULT)).call(ptoken)
  end
  def get_object_token(pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_object_token.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pptoken)
  end
end
struct LibWin32::ISpResourceManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_service(guidservice : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_service.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(guidservice, riid, ppvobject)
  end
  def set_object(guidserviceid : Guid*, punkobject : IUnknown) : HRESULT
    @lpVtbl.value.set_object.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guidserviceid, punkobject)
  end
  def get_object(guidserviceid : Guid*, objectclsid : Guid*, objectiid : Guid*, freleasewhenlastexternalrefreleased : LibC::BOOL, ppobject : Void**) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(Guid*, Guid*, Guid*, LibC::BOOL, Void**, HRESULT)).call(guidserviceid, objectclsid, objectiid, freleasewhenlastexternalrefreleased, ppobject)
  end
end
struct LibWin32::ISpEventSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify_sink(pnotifysink : ISpNotifySink) : HRESULT
    @lpVtbl.value.set_notify_sink.unsafe_as(Proc(ISpNotifySink, HRESULT)).call(pnotifysink)
  end
  def set_notify_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def set_notify_callback_function(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_function.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def set_notify_callback_interface(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_interface.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def set_notify_win32_event : HRESULT
    @lpVtbl.value.set_notify_win32_event.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_notify_event(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait_for_notify_event.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_notify_event_handle : LibC::HANDLE
    @lpVtbl.value.get_notify_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def set_interest(ulleventinterest : UInt64, ullqueuedinterest : UInt64) : HRESULT
    @lpVtbl.value.set_interest.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(ulleventinterest, ullqueuedinterest)
  end
  def get_events(ulcount : UInt32, peventarray : SPEVENT*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_events.unsafe_as(Proc(UInt32, SPEVENT*, UInt32*, HRESULT)).call(ulcount, peventarray, pulfetched)
  end
  def get_info(pinfo : SPEVENTSOURCEINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(SPEVENTSOURCEINFO*, HRESULT)).call(pinfo)
  end
end
struct LibWin32::ISpEventSource2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify_sink(pnotifysink : ISpNotifySink) : HRESULT
    @lpVtbl.value.set_notify_sink.unsafe_as(Proc(ISpNotifySink, HRESULT)).call(pnotifysink)
  end
  def set_notify_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def set_notify_callback_function(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_function.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def set_notify_callback_interface(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_interface.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def set_notify_win32_event : HRESULT
    @lpVtbl.value.set_notify_win32_event.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_notify_event(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait_for_notify_event.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_notify_event_handle : LibC::HANDLE
    @lpVtbl.value.get_notify_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def set_interest(ulleventinterest : UInt64, ullqueuedinterest : UInt64) : HRESULT
    @lpVtbl.value.set_interest.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(ulleventinterest, ullqueuedinterest)
  end
  def get_events(ulcount : UInt32, peventarray : SPEVENT*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_events.unsafe_as(Proc(UInt32, SPEVENT*, UInt32*, HRESULT)).call(ulcount, peventarray, pulfetched)
  end
  def get_info(pinfo : SPEVENTSOURCEINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(SPEVENTSOURCEINFO*, HRESULT)).call(pinfo)
  end
  def get_events_ex(ulcount : UInt32, peventarray : SPEVENTEX*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_events_ex.unsafe_as(Proc(UInt32, SPEVENTEX*, UInt32*, HRESULT)).call(ulcount, peventarray, pulfetched)
  end
end
struct LibWin32::ISpEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_events(peventarray : SPEVENT*, ulcount : UInt32) : HRESULT
    @lpVtbl.value.add_events.unsafe_as(Proc(SPEVENT*, UInt32, HRESULT)).call(peventarray, ulcount)
  end
  def get_event_interest(pulleventinterest : UInt64*) : HRESULT
    @lpVtbl.value.get_event_interest.unsafe_as(Proc(UInt64*, HRESULT)).call(pulleventinterest)
  end
end
struct LibWin32::ISpStreamFormat
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
  def get_format(pguidformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pguidformatid, ppcomemwaveformatex)
  end
end
struct LibWin32::ISpStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
  def get_format(pguidformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pguidformatid, ppcomemwaveformatex)
  end
  def set_base_stream(pstream : IStream, rguidformat : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_base_stream.unsafe_as(Proc(IStream, Guid*, WAVEFORMATEX*, HRESULT)).call(pstream, rguidformat, pwaveformatex)
  end
  def get_base_stream(ppstream : IStream*) : HRESULT
    @lpVtbl.value.get_base_stream.unsafe_as(Proc(IStream*, HRESULT)).call(ppstream)
  end
  def bind_to_file(pszfilename : LibC::LPWSTR, emode : SPFILEMODE, pformatid : Guid*, pwaveformatex : WAVEFORMATEX*, ulleventinterest : UInt64) : HRESULT
    @lpVtbl.value.bind_to_file.unsafe_as(Proc(LibC::LPWSTR, SPFILEMODE, Guid*, WAVEFORMATEX*, UInt64, HRESULT)).call(pszfilename, emode, pformatid, pwaveformatex, ulleventinterest)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpStreamFormatConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
  def get_format(pguidformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pguidformatid, ppcomemwaveformatex)
  end
  def set_base_stream(pstream : ISpStreamFormat, fsetformattobasestreamformat : LibC::BOOL, fwritetobasestream : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_base_stream.unsafe_as(Proc(ISpStreamFormat, LibC::BOOL, LibC::BOOL, HRESULT)).call(pstream, fsetformattobasestreamformat, fwritetobasestream)
  end
  def get_base_stream(ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_base_stream.unsafe_as(Proc(ISpStreamFormat*, HRESULT)).call(ppstream)
  end
  def set_format(rguidformatidofconvertedstream : Guid*, pwaveformatexofconvertedstream : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(rguidformatidofconvertedstream, pwaveformatexofconvertedstream)
  end
  def reset_seek_position : HRESULT
    @lpVtbl.value.reset_seek_position.unsafe_as(Proc(HRESULT)).call
  end
  def scale_converted_to_base_offset(ulloffsetconvertedstream : UInt64, pulloffsetbasestream : UInt64*) : HRESULT
    @lpVtbl.value.scale_converted_to_base_offset.unsafe_as(Proc(UInt64, UInt64*, HRESULT)).call(ulloffsetconvertedstream, pulloffsetbasestream)
  end
  def scale_base_to_converted_offset(ulloffsetbasestream : UInt64, pulloffsetconvertedstream : UInt64*) : HRESULT
    @lpVtbl.value.scale_base_to_converted_offset.unsafe_as(Proc(UInt64, UInt64*, HRESULT)).call(ulloffsetbasestream, pulloffsetconvertedstream)
  end
end
struct LibWin32::ISpAudio
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
  def get_format(pguidformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pguidformatid, ppcomemwaveformatex)
  end
  def set_state(newstate : SPAUDIOSTATE, ullreserved : UInt64) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(SPAUDIOSTATE, UInt64, HRESULT)).call(newstate, ullreserved)
  end
  def set_format(rguidfmtid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(rguidfmtid, pwaveformatex)
  end
  def get_status(pstatus : SPAUDIOSTATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(SPAUDIOSTATUS*, HRESULT)).call(pstatus)
  end
  def set_buffer_info(pbuffinfo : SPAUDIOBUFFERINFO*) : HRESULT
    @lpVtbl.value.set_buffer_info.unsafe_as(Proc(SPAUDIOBUFFERINFO*, HRESULT)).call(pbuffinfo)
  end
  def get_buffer_info(pbuffinfo : SPAUDIOBUFFERINFO*) : HRESULT
    @lpVtbl.value.get_buffer_info.unsafe_as(Proc(SPAUDIOBUFFERINFO*, HRESULT)).call(pbuffinfo)
  end
  def get_default_format(pformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_default_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pformatid, ppcomemwaveformatex)
  end
  def event_handle : LibC::HANDLE
    @lpVtbl.value.event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def get_volume_level(plevel : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_level.unsafe_as(Proc(UInt32*, HRESULT)).call(plevel)
  end
  def set_volume_level(level : UInt32) : HRESULT
    @lpVtbl.value.set_volume_level.unsafe_as(Proc(UInt32, HRESULT)).call(level)
  end
  def get_buffer_notify_size(pcbsize : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_notify_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbsize)
  end
  def set_buffer_notify_size(cbsize : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_notify_size.unsafe_as(Proc(UInt32, HRESULT)).call(cbsize)
  end
end
struct LibWin32::ISpMMSysAudio
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
  def get_format(pguidformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pguidformatid, ppcomemwaveformatex)
  end
  def set_state(newstate : SPAUDIOSTATE, ullreserved : UInt64) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(SPAUDIOSTATE, UInt64, HRESULT)).call(newstate, ullreserved)
  end
  def set_format(rguidfmtid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(rguidfmtid, pwaveformatex)
  end
  def get_status(pstatus : SPAUDIOSTATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(SPAUDIOSTATUS*, HRESULT)).call(pstatus)
  end
  def set_buffer_info(pbuffinfo : SPAUDIOBUFFERINFO*) : HRESULT
    @lpVtbl.value.set_buffer_info.unsafe_as(Proc(SPAUDIOBUFFERINFO*, HRESULT)).call(pbuffinfo)
  end
  def get_buffer_info(pbuffinfo : SPAUDIOBUFFERINFO*) : HRESULT
    @lpVtbl.value.get_buffer_info.unsafe_as(Proc(SPAUDIOBUFFERINFO*, HRESULT)).call(pbuffinfo)
  end
  def get_default_format(pformatid : Guid*, ppcomemwaveformatex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_default_format.unsafe_as(Proc(Guid*, WAVEFORMATEX**, HRESULT)).call(pformatid, ppcomemwaveformatex)
  end
  def event_handle : LibC::HANDLE
    @lpVtbl.value.event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def get_volume_level(plevel : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_level.unsafe_as(Proc(UInt32*, HRESULT)).call(plevel)
  end
  def set_volume_level(level : UInt32) : HRESULT
    @lpVtbl.value.set_volume_level.unsafe_as(Proc(UInt32, HRESULT)).call(level)
  end
  def get_buffer_notify_size(pcbsize : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_notify_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbsize)
  end
  def set_buffer_notify_size(cbsize : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_notify_size.unsafe_as(Proc(UInt32, HRESULT)).call(cbsize)
  end
  def get_device_id(pudeviceid : UInt32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(UInt32*, HRESULT)).call(pudeviceid)
  end
  def set_device_id(udeviceid : UInt32) : HRESULT
    @lpVtbl.value.set_device_id.unsafe_as(Proc(UInt32, HRESULT)).call(udeviceid)
  end
  def get_mm_handle(phandle : Void**) : HRESULT
    @lpVtbl.value.get_mm_handle.unsafe_as(Proc(Void**, HRESULT)).call(phandle)
  end
  def get_line_id(pulineid : UInt32*) : HRESULT
    @lpVtbl.value.get_line_id.unsafe_as(Proc(UInt32*, HRESULT)).call(pulineid)
  end
  def set_line_id(ulineid : UInt32) : HRESULT
    @lpVtbl.value.set_line_id.unsafe_as(Proc(UInt32, HRESULT)).call(ulineid)
  end
end
struct LibWin32::ISpTranscript
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_transcript(ppsztranscript : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transcript.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppsztranscript)
  end
  def append_transcript(psztranscript : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.append_transcript.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztranscript)
  end
end
struct LibWin32::ISpLexicon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_pronunciations(pszword : LibC::LPWSTR, langid : UInt16, dwflags : UInt32, pwordpronunciationlist : SPWORDPRONUNCIATIONLIST*) : HRESULT
    @lpVtbl.value.get_pronunciations.unsafe_as(Proc(LibC::LPWSTR, UInt16, UInt32, SPWORDPRONUNCIATIONLIST*, HRESULT)).call(pszword, langid, dwflags, pwordpronunciationlist)
  end
  def add_pronunciation(pszword : LibC::LPWSTR, langid : UInt16, epartofspeech : SPPARTOFSPEECH, pszpronunciation : UInt16*) : HRESULT
    @lpVtbl.value.add_pronunciation.unsafe_as(Proc(LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)).call(pszword, langid, epartofspeech, pszpronunciation)
  end
  def remove_pronunciation(pszword : LibC::LPWSTR, langid : UInt16, epartofspeech : SPPARTOFSPEECH, pszpronunciation : UInt16*) : HRESULT
    @lpVtbl.value.remove_pronunciation.unsafe_as(Proc(LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)).call(pszword, langid, epartofspeech, pszpronunciation)
  end
  def get_generation(pdwgeneration : UInt32*) : HRESULT
    @lpVtbl.value.get_generation.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwgeneration)
  end
  def get_generation_change(dwflags : UInt32, pdwgeneration : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_generation_change.unsafe_as(Proc(UInt32, UInt32*, SPWORDLIST*, HRESULT)).call(dwflags, pdwgeneration, pwordlist)
  end
  def get_words(dwflags : UInt32, pdwgeneration : UInt32*, pdwcookie : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_words.unsafe_as(Proc(UInt32, UInt32*, UInt32*, SPWORDLIST*, HRESULT)).call(dwflags, pdwgeneration, pdwcookie, pwordlist)
  end
end
struct LibWin32::ISpContainerLexicon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_pronunciations(pszword : LibC::LPWSTR, langid : UInt16, dwflags : UInt32, pwordpronunciationlist : SPWORDPRONUNCIATIONLIST*) : HRESULT
    @lpVtbl.value.get_pronunciations.unsafe_as(Proc(LibC::LPWSTR, UInt16, UInt32, SPWORDPRONUNCIATIONLIST*, HRESULT)).call(pszword, langid, dwflags, pwordpronunciationlist)
  end
  def add_pronunciation(pszword : LibC::LPWSTR, langid : UInt16, epartofspeech : SPPARTOFSPEECH, pszpronunciation : UInt16*) : HRESULT
    @lpVtbl.value.add_pronunciation.unsafe_as(Proc(LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)).call(pszword, langid, epartofspeech, pszpronunciation)
  end
  def remove_pronunciation(pszword : LibC::LPWSTR, langid : UInt16, epartofspeech : SPPARTOFSPEECH, pszpronunciation : UInt16*) : HRESULT
    @lpVtbl.value.remove_pronunciation.unsafe_as(Proc(LibC::LPWSTR, UInt16, SPPARTOFSPEECH, UInt16*, HRESULT)).call(pszword, langid, epartofspeech, pszpronunciation)
  end
  def get_generation(pdwgeneration : UInt32*) : HRESULT
    @lpVtbl.value.get_generation.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwgeneration)
  end
  def get_generation_change(dwflags : UInt32, pdwgeneration : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_generation_change.unsafe_as(Proc(UInt32, UInt32*, SPWORDLIST*, HRESULT)).call(dwflags, pdwgeneration, pwordlist)
  end
  def get_words(dwflags : UInt32, pdwgeneration : UInt32*, pdwcookie : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_words.unsafe_as(Proc(UInt32, UInt32*, UInt32*, SPWORDLIST*, HRESULT)).call(dwflags, pdwgeneration, pdwcookie, pwordlist)
  end
  def add_lexicon(paddlexicon : ISpLexicon, dwflags : UInt32) : HRESULT
    @lpVtbl.value.add_lexicon.unsafe_as(Proc(ISpLexicon, UInt32, HRESULT)).call(paddlexicon, dwflags)
  end
end
struct LibWin32::ISpShortcut
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_shortcut(pszdisplay : LibC::LPWSTR, langid : UInt16, pszspoken : LibC::LPWSTR, shtype : SPSHORTCUTTYPE) : HRESULT
    @lpVtbl.value.add_shortcut.unsafe_as(Proc(LibC::LPWSTR, UInt16, LibC::LPWSTR, SPSHORTCUTTYPE, HRESULT)).call(pszdisplay, langid, pszspoken, shtype)
  end
  def remove_shortcut(pszdisplay : LibC::LPWSTR, langid : UInt16, pszspoken : LibC::LPWSTR, shtype : SPSHORTCUTTYPE) : HRESULT
    @lpVtbl.value.remove_shortcut.unsafe_as(Proc(LibC::LPWSTR, UInt16, LibC::LPWSTR, SPSHORTCUTTYPE, HRESULT)).call(pszdisplay, langid, pszspoken, shtype)
  end
  def get_shortcuts(langid : UInt16, pshortcutpairlist : SPSHORTCUTPAIRLIST*) : HRESULT
    @lpVtbl.value.get_shortcuts.unsafe_as(Proc(UInt16, SPSHORTCUTPAIRLIST*, HRESULT)).call(langid, pshortcutpairlist)
  end
  def get_generation(pdwgeneration : UInt32*) : HRESULT
    @lpVtbl.value.get_generation.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwgeneration)
  end
  def get_words_from_generation_change(pdwgeneration : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_words_from_generation_change.unsafe_as(Proc(UInt32*, SPWORDLIST*, HRESULT)).call(pdwgeneration, pwordlist)
  end
  def get_words(pdwgeneration : UInt32*, pdwcookie : UInt32*, pwordlist : SPWORDLIST*) : HRESULT
    @lpVtbl.value.get_words.unsafe_as(Proc(UInt32*, UInt32*, SPWORDLIST*, HRESULT)).call(pdwgeneration, pdwcookie, pwordlist)
  end
  def get_shortcuts_for_generation(pdwgeneration : UInt32*, pdwcookie : UInt32*, pshortcutpairlist : SPSHORTCUTPAIRLIST*) : HRESULT
    @lpVtbl.value.get_shortcuts_for_generation.unsafe_as(Proc(UInt32*, UInt32*, SPSHORTCUTPAIRLIST*, HRESULT)).call(pdwgeneration, pdwcookie, pshortcutpairlist)
  end
  def get_generation_change(pdwgeneration : UInt32*, pshortcutpairlist : SPSHORTCUTPAIRLIST*) : HRESULT
    @lpVtbl.value.get_generation_change.unsafe_as(Proc(UInt32*, SPSHORTCUTPAIRLIST*, HRESULT)).call(pdwgeneration, pshortcutpairlist)
  end
end
struct LibWin32::ISpPhoneConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_object_token(ptoken : ISpObjectToken) : HRESULT
    @lpVtbl.value.set_object_token.unsafe_as(Proc(ISpObjectToken, HRESULT)).call(ptoken)
  end
  def get_object_token(pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_object_token.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pptoken)
  end
  def phone_to_id(pszphone : LibC::LPWSTR, pid : UInt16*) : HRESULT
    @lpVtbl.value.phone_to_id.unsafe_as(Proc(LibC::LPWSTR, UInt16*, HRESULT)).call(pszphone, pid)
  end
  def id_to_phone(pid : UInt16*, pszphone : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.id_to_phone.unsafe_as(Proc(UInt16*, LibC::LPWSTR, HRESULT)).call(pid, pszphone)
  end
end
struct LibWin32::ISpPhoneticAlphabetConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_lang_id(plangid : UInt16*) : HRESULT
    @lpVtbl.value.get_lang_id.unsafe_as(Proc(UInt16*, HRESULT)).call(plangid)
  end
  def set_lang_id(langid : UInt16) : HRESULT
    @lpVtbl.value.set_lang_id.unsafe_as(Proc(UInt16, HRESULT)).call(langid)
  end
  def sapi2_ups(pszsapiid : UInt16*, pszupsid : UInt16*, cmaxlength : UInt32) : HRESULT
    @lpVtbl.value.sapi2_ups.unsafe_as(Proc(UInt16*, UInt16*, UInt32, HRESULT)).call(pszsapiid, pszupsid, cmaxlength)
  end
  def ups2_sapi(pszupsid : UInt16*, pszsapiid : UInt16*, cmaxlength : UInt32) : HRESULT
    @lpVtbl.value.ups2_sapi.unsafe_as(Proc(UInt16*, UInt16*, UInt32, HRESULT)).call(pszupsid, pszsapiid, cmaxlength)
  end
  def get_max_convert_length(csrclength : UInt32, bsapi2ups : LibC::BOOL, pcmaxdestlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_convert_length.unsafe_as(Proc(UInt32, LibC::BOOL, UInt32*, HRESULT)).call(csrclength, bsapi2ups, pcmaxdestlength)
  end
end
struct LibWin32::ISpPhoneticAlphabetSelection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_alphabet_ups(pfisups : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_alphabet_ups.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfisups)
  end
  def set_alphabet_to_ups(fforceups : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_alphabet_to_ups.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fforceups)
  end
end
struct LibWin32::ISpVoice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify_sink(pnotifysink : ISpNotifySink) : HRESULT
    @lpVtbl.value.set_notify_sink.unsafe_as(Proc(ISpNotifySink, HRESULT)).call(pnotifysink)
  end
  def set_notify_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def set_notify_callback_function(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_function.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def set_notify_callback_interface(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_interface.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def set_notify_win32_event : HRESULT
    @lpVtbl.value.set_notify_win32_event.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_notify_event(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait_for_notify_event.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_notify_event_handle : LibC::HANDLE
    @lpVtbl.value.get_notify_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def set_interest(ulleventinterest : UInt64, ullqueuedinterest : UInt64) : HRESULT
    @lpVtbl.value.set_interest.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(ulleventinterest, ullqueuedinterest)
  end
  def get_events(ulcount : UInt32, peventarray : SPEVENT*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_events.unsafe_as(Proc(UInt32, SPEVENT*, UInt32*, HRESULT)).call(ulcount, peventarray, pulfetched)
  end
  def get_info(pinfo : SPEVENTSOURCEINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(SPEVENTSOURCEINFO*, HRESULT)).call(pinfo)
  end
  def set_output(punkoutput : IUnknown, fallowformatchanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_output.unsafe_as(Proc(IUnknown, LibC::BOOL, HRESULT)).call(punkoutput, fallowformatchanges)
  end
  def get_output_object_token(ppobjecttoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_output_object_token.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(ppobjecttoken)
  end
  def get_output_stream(ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_output_stream.unsafe_as(Proc(ISpStreamFormat*, HRESULT)).call(ppstream)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def set_voice(ptoken : ISpObjectToken) : HRESULT
    @lpVtbl.value.set_voice.unsafe_as(Proc(ISpObjectToken, HRESULT)).call(ptoken)
  end
  def get_voice(pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_voice.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pptoken)
  end
  def speak(pwcs : LibC::LPWSTR, dwflags : UInt32, pulstreamnumber : UInt32*) : HRESULT
    @lpVtbl.value.speak.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32*, HRESULT)).call(pwcs, dwflags, pulstreamnumber)
  end
  def speak_stream(pstream : IStream, dwflags : UInt32, pulstreamnumber : UInt32*) : HRESULT
    @lpVtbl.value.speak_stream.unsafe_as(Proc(IStream, UInt32, UInt32*, HRESULT)).call(pstream, dwflags, pulstreamnumber)
  end
  def get_status(pstatus : SPVOICESTATUS*, ppszlastbookmark : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(SPVOICESTATUS*, LibC::LPWSTR*, HRESULT)).call(pstatus, ppszlastbookmark)
  end
  def skip(pitemtype : LibC::LPWSTR, lnumitems : Int32, pulnumskipped : UInt32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(LibC::LPWSTR, Int32, UInt32*, HRESULT)).call(pitemtype, lnumitems, pulnumskipped)
  end
  def set_priority(epriority : SPVPRIORITY) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(SPVPRIORITY, HRESULT)).call(epriority)
  end
  def get_priority(pepriority : SPVPRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(SPVPRIORITY*, HRESULT)).call(pepriority)
  end
  def set_alert_boundary(eboundary : SPEVENTENUM) : HRESULT
    @lpVtbl.value.set_alert_boundary.unsafe_as(Proc(SPEVENTENUM, HRESULT)).call(eboundary)
  end
  def get_alert_boundary(peboundary : SPEVENTENUM*) : HRESULT
    @lpVtbl.value.get_alert_boundary.unsafe_as(Proc(SPEVENTENUM*, HRESULT)).call(peboundary)
  end
  def set_rate(rateadjust : Int32) : HRESULT
    @lpVtbl.value.set_rate.unsafe_as(Proc(Int32, HRESULT)).call(rateadjust)
  end
  def get_rate(prateadjust : Int32*) : HRESULT
    @lpVtbl.value.get_rate.unsafe_as(Proc(Int32*, HRESULT)).call(prateadjust)
  end
  def set_volume(usvolume : UInt16) : HRESULT
    @lpVtbl.value.set_volume.unsafe_as(Proc(UInt16, HRESULT)).call(usvolume)
  end
  def get_volume(pusvolume : UInt16*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(UInt16*, HRESULT)).call(pusvolume)
  end
  def wait_until_done(mstimeout : UInt32) : HRESULT
    @lpVtbl.value.wait_until_done.unsafe_as(Proc(UInt32, HRESULT)).call(mstimeout)
  end
  def set_sync_speak_timeout(mstimeout : UInt32) : HRESULT
    @lpVtbl.value.set_sync_speak_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(mstimeout)
  end
  def get_sync_speak_timeout(pmstimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_speak_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(pmstimeout)
  end
  def speak_complete_event : LibC::HANDLE
    @lpVtbl.value.speak_complete_event.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def is_ui_supported(psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, pfsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(LibC::LPWSTR, Void*, UInt32, LibC::BOOL*, HRESULT)).call(psztypeofui, pvextradata, cbextradata, pfsupported)
  end
  def display_ui(hwndparent : LibC::HANDLE, psztitle : LibC::LPWSTR, psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, HRESULT)).call(hwndparent, psztitle, psztypeofui, pvextradata, cbextradata)
  end
end
struct LibWin32::ISpPhrase
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
end
struct LibWin32::ISpPhraseAlt
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
  def get_alt_info(ppparent : ISpPhrase*, pulstartelementinparent : UInt32*, pcelementsinparent : UInt32*, pcelementsinalt : UInt32*) : HRESULT
    @lpVtbl.value.get_alt_info.unsafe_as(Proc(ISpPhrase*, UInt32*, UInt32*, UInt32*, HRESULT)).call(ppparent, pulstartelementinparent, pcelementsinparent, pcelementsinalt)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpPhrase2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
  def get_xml_result(ppszcomemxmlresult : LibC::LPWSTR*, options : SPXMLRESULTOPTIONS) : HRESULT
    @lpVtbl.value.get_xml_result.unsafe_as(Proc(LibC::LPWSTR*, SPXMLRESULTOPTIONS, HRESULT)).call(ppszcomemxmlresult, options)
  end
  def get_xml_error_info(psemanticerrorinfo : SPSEMANTICERRORINFO*) : HRESULT
    @lpVtbl.value.get_xml_error_info.unsafe_as(Proc(SPSEMANTICERRORINFO*, HRESULT)).call(psemanticerrorinfo)
  end
  def get_audio(ulstartelement : UInt32, celements : UInt32, ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_audio.unsafe_as(Proc(UInt32, UInt32, ISpStreamFormat*, HRESULT)).call(ulstartelement, celements, ppstream)
  end
end
struct LibWin32::ISpRecoResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
  def get_result_times(ptimes : SPRECORESULTTIMES*) : HRESULT
    @lpVtbl.value.get_result_times.unsafe_as(Proc(SPRECORESULTTIMES*, HRESULT)).call(ptimes)
  end
  def get_alternates(ulstartelement : UInt32, celements : UInt32, ulrequestcount : UInt32, ppphrases : ISpPhraseAlt*, pcphrasesreturned : UInt32*) : HRESULT
    @lpVtbl.value.get_alternates.unsafe_as(Proc(UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)).call(ulstartelement, celements, ulrequestcount, ppphrases, pcphrasesreturned)
  end
  def get_audio(ulstartelement : UInt32, celements : UInt32, ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_audio.unsafe_as(Proc(UInt32, UInt32, ISpStreamFormat*, HRESULT)).call(ulstartelement, celements, ppstream)
  end
  def speak_audio(ulstartelement : UInt32, celements : UInt32, dwflags : UInt32, pulstreamnumber : UInt32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(UInt32, UInt32, UInt32, UInt32*, HRESULT)).call(ulstartelement, celements, dwflags, pulstreamnumber)
  end
  def serialize(ppcomemserializedresult : SPSERIALIZEDRESULT**) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(SPSERIALIZEDRESULT**, HRESULT)).call(ppcomemserializedresult)
  end
  def scale_audio(paudioformatid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.scale_audio.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(paudioformatid, pwaveformatex)
  end
  def get_reco_context(pprecocontext : ISpRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpRecoContext*, HRESULT)).call(pprecocontext)
  end
end
struct LibWin32::ISpRecoResult2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
  def get_result_times(ptimes : SPRECORESULTTIMES*) : HRESULT
    @lpVtbl.value.get_result_times.unsafe_as(Proc(SPRECORESULTTIMES*, HRESULT)).call(ptimes)
  end
  def get_alternates(ulstartelement : UInt32, celements : UInt32, ulrequestcount : UInt32, ppphrases : ISpPhraseAlt*, pcphrasesreturned : UInt32*) : HRESULT
    @lpVtbl.value.get_alternates.unsafe_as(Proc(UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)).call(ulstartelement, celements, ulrequestcount, ppphrases, pcphrasesreturned)
  end
  def get_audio(ulstartelement : UInt32, celements : UInt32, ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_audio.unsafe_as(Proc(UInt32, UInt32, ISpStreamFormat*, HRESULT)).call(ulstartelement, celements, ppstream)
  end
  def speak_audio(ulstartelement : UInt32, celements : UInt32, dwflags : UInt32, pulstreamnumber : UInt32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(UInt32, UInt32, UInt32, UInt32*, HRESULT)).call(ulstartelement, celements, dwflags, pulstreamnumber)
  end
  def serialize(ppcomemserializedresult : SPSERIALIZEDRESULT**) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(SPSERIALIZEDRESULT**, HRESULT)).call(ppcomemserializedresult)
  end
  def scale_audio(paudioformatid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.scale_audio.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(paudioformatid, pwaveformatex)
  end
  def get_reco_context(pprecocontext : ISpRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpRecoContext*, HRESULT)).call(pprecocontext)
  end
  def commit_alternate(pphrasealt : ISpPhraseAlt, ppnewresult : ISpRecoResult*) : HRESULT
    @lpVtbl.value.commit_alternate.unsafe_as(Proc(ISpPhraseAlt, ISpRecoResult*, HRESULT)).call(pphrasealt, ppnewresult)
  end
  def commit_text(ulstartelement : UInt32, celements : UInt32, pszcorrecteddata : LibC::LPWSTR, ecommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit_text.unsafe_as(Proc(UInt32, UInt32, LibC::LPWSTR, UInt32, HRESULT)).call(ulstartelement, celements, pszcorrecteddata, ecommitflags)
  end
  def set_text_feedback(pszfeedback : LibC::LPWSTR, fsuccessful : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_text_feedback.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszfeedback, fsuccessful)
  end
end
struct LibWin32::ISpXMLRecoResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_phrase(ppcomemphrase : SPPHRASE**) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(SPPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_serialized_phrase(ppcomemphrase : SPSERIALIZEDPHRASE**) : HRESULT
    @lpVtbl.value.get_serialized_phrase.unsafe_as(Proc(SPSERIALIZEDPHRASE**, HRESULT)).call(ppcomemphrase)
  end
  def get_text(ulstart : UInt32, ulcount : UInt32, fusetextreplacements : LibC::BOOL, ppszcomemtext : LibC::LPWSTR*, pbdisplayattributes : UInt8*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::LPWSTR*, UInt8*, HRESULT)).call(ulstart, ulcount, fusetextreplacements, ppszcomemtext, pbdisplayattributes)
  end
  def discard(dwvaluetypes : UInt32) : HRESULT
    @lpVtbl.value.discard.unsafe_as(Proc(UInt32, HRESULT)).call(dwvaluetypes)
  end
  def get_result_times(ptimes : SPRECORESULTTIMES*) : HRESULT
    @lpVtbl.value.get_result_times.unsafe_as(Proc(SPRECORESULTTIMES*, HRESULT)).call(ptimes)
  end
  def get_alternates(ulstartelement : UInt32, celements : UInt32, ulrequestcount : UInt32, ppphrases : ISpPhraseAlt*, pcphrasesreturned : UInt32*) : HRESULT
    @lpVtbl.value.get_alternates.unsafe_as(Proc(UInt32, UInt32, UInt32, ISpPhraseAlt*, UInt32*, HRESULT)).call(ulstartelement, celements, ulrequestcount, ppphrases, pcphrasesreturned)
  end
  def get_audio(ulstartelement : UInt32, celements : UInt32, ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_audio.unsafe_as(Proc(UInt32, UInt32, ISpStreamFormat*, HRESULT)).call(ulstartelement, celements, ppstream)
  end
  def speak_audio(ulstartelement : UInt32, celements : UInt32, dwflags : UInt32, pulstreamnumber : UInt32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(UInt32, UInt32, UInt32, UInt32*, HRESULT)).call(ulstartelement, celements, dwflags, pulstreamnumber)
  end
  def serialize(ppcomemserializedresult : SPSERIALIZEDRESULT**) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(SPSERIALIZEDRESULT**, HRESULT)).call(ppcomemserializedresult)
  end
  def scale_audio(paudioformatid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.scale_audio.unsafe_as(Proc(Guid*, WAVEFORMATEX*, HRESULT)).call(paudioformatid, pwaveformatex)
  end
  def get_reco_context(pprecocontext : ISpRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpRecoContext*, HRESULT)).call(pprecocontext)
  end
  def get_xml_result(ppszcomemxmlresult : LibC::LPWSTR*, options : SPXMLRESULTOPTIONS) : HRESULT
    @lpVtbl.value.get_xml_result.unsafe_as(Proc(LibC::LPWSTR*, SPXMLRESULTOPTIONS, HRESULT)).call(ppszcomemxmlresult, options)
  end
  def get_xml_error_info(psemanticerrorinfo : SPSEMANTICERRORINFO*) : HRESULT
    @lpVtbl.value.get_xml_error_info.unsafe_as(Proc(SPSEMANTICERRORINFO*, HRESULT)).call(psemanticerrorinfo)
  end
end
struct LibWin32::ISpGrammarBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset_grammar(newlanguage : UInt16) : HRESULT
    @lpVtbl.value.reset_grammar.unsafe_as(Proc(UInt16, HRESULT)).call(newlanguage)
  end
  def get_rule(pszrulename : LibC::LPWSTR, dwruleid : UInt32, dwattributes : UInt32, fcreateifnotexist : LibC::BOOL, phinitialstate : SPSTATEHANDLE__**) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, LibC::BOOL, SPSTATEHANDLE__**, HRESULT)).call(pszrulename, dwruleid, dwattributes, fcreateifnotexist, phinitialstate)
  end
  def clear_rule(hstate : SPSTATEHANDLE__*) : HRESULT
    @lpVtbl.value.clear_rule.unsafe_as(Proc(SPSTATEHANDLE__*, HRESULT)).call(hstate)
  end
  def create_new_state(hstate : SPSTATEHANDLE__*, phstate : SPSTATEHANDLE__**) : HRESULT
    @lpVtbl.value.create_new_state.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__**, HRESULT)).call(hstate, phstate)
  end
  def add_word_transition(hfromstate : SPSTATEHANDLE__*, htostate : SPSTATEHANDLE__*, psz : LibC::LPWSTR, pszseparators : LibC::LPWSTR, ewordtype : SPGRAMMARWORDTYPE, weight : Float32, ppropinfo : SPPROPERTYINFO*) : HRESULT
    @lpVtbl.value.add_word_transition.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, SPGRAMMARWORDTYPE, Float32, SPPROPERTYINFO*, HRESULT)).call(hfromstate, htostate, psz, pszseparators, ewordtype, weight, ppropinfo)
  end
  def add_rule_transition(hfromstate : SPSTATEHANDLE__*, htostate : SPSTATEHANDLE__*, hrule : SPSTATEHANDLE__*, weight : Float32, ppropinfo : SPPROPERTYINFO*) : HRESULT
    @lpVtbl.value.add_rule_transition.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, Float32, SPPROPERTYINFO*, HRESULT)).call(hfromstate, htostate, hrule, weight, ppropinfo)
  end
  def add_resource(hrulestate : SPSTATEHANDLE__*, pszresourcename : LibC::LPWSTR, pszresourcevalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_resource.unsafe_as(Proc(SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(hrulestate, pszresourcename, pszresourcevalue)
  end
  def commit(dwreserved : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(dwreserved)
  end
end
struct LibWin32::ISpRecoGrammar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset_grammar(newlanguage : UInt16) : HRESULT
    @lpVtbl.value.reset_grammar.unsafe_as(Proc(UInt16, HRESULT)).call(newlanguage)
  end
  def get_rule(pszrulename : LibC::LPWSTR, dwruleid : UInt32, dwattributes : UInt32, fcreateifnotexist : LibC::BOOL, phinitialstate : SPSTATEHANDLE__**) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, LibC::BOOL, SPSTATEHANDLE__**, HRESULT)).call(pszrulename, dwruleid, dwattributes, fcreateifnotexist, phinitialstate)
  end
  def clear_rule(hstate : SPSTATEHANDLE__*) : HRESULT
    @lpVtbl.value.clear_rule.unsafe_as(Proc(SPSTATEHANDLE__*, HRESULT)).call(hstate)
  end
  def create_new_state(hstate : SPSTATEHANDLE__*, phstate : SPSTATEHANDLE__**) : HRESULT
    @lpVtbl.value.create_new_state.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__**, HRESULT)).call(hstate, phstate)
  end
  def add_word_transition(hfromstate : SPSTATEHANDLE__*, htostate : SPSTATEHANDLE__*, psz : LibC::LPWSTR, pszseparators : LibC::LPWSTR, ewordtype : SPGRAMMARWORDTYPE, weight : Float32, ppropinfo : SPPROPERTYINFO*) : HRESULT
    @lpVtbl.value.add_word_transition.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, SPGRAMMARWORDTYPE, Float32, SPPROPERTYINFO*, HRESULT)).call(hfromstate, htostate, psz, pszseparators, ewordtype, weight, ppropinfo)
  end
  def add_rule_transition(hfromstate : SPSTATEHANDLE__*, htostate : SPSTATEHANDLE__*, hrule : SPSTATEHANDLE__*, weight : Float32, ppropinfo : SPPROPERTYINFO*) : HRESULT
    @lpVtbl.value.add_rule_transition.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__*, SPSTATEHANDLE__*, Float32, SPPROPERTYINFO*, HRESULT)).call(hfromstate, htostate, hrule, weight, ppropinfo)
  end
  def add_resource(hrulestate : SPSTATEHANDLE__*, pszresourcename : LibC::LPWSTR, pszresourcevalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_resource.unsafe_as(Proc(SPSTATEHANDLE__*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(hrulestate, pszresourcename, pszresourcevalue)
  end
  def commit(dwreserved : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(dwreserved)
  end
  def get_grammar_id(pullgrammarid : UInt64*) : HRESULT
    @lpVtbl.value.get_grammar_id.unsafe_as(Proc(UInt64*, HRESULT)).call(pullgrammarid)
  end
  def get_reco_context(pprecoctxt : ISpRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpRecoContext*, HRESULT)).call(pprecoctxt)
  end
  def load_cmd_from_file(pszfilename : LibC::LPWSTR, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_cmd_from_file.unsafe_as(Proc(LibC::LPWSTR, SPLOADOPTIONS, HRESULT)).call(pszfilename, options)
  end
  def load_cmd_from_object(rcid : Guid*, pszgrammarname : LibC::LPWSTR, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_cmd_from_object.unsafe_as(Proc(Guid*, LibC::LPWSTR, SPLOADOPTIONS, HRESULT)).call(rcid, pszgrammarname, options)
  end
  def load_cmd_from_resource(hmodule : HINSTANCE, pszresourcename : LibC::LPWSTR, pszresourcetype : LibC::LPWSTR, wlanguage : UInt16, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_cmd_from_resource.unsafe_as(Proc(HINSTANCE, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPLOADOPTIONS, HRESULT)).call(hmodule, pszresourcename, pszresourcetype, wlanguage, options)
  end
  def load_cmd_from_memory(pgrammar : SPBINARYGRAMMAR*, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_cmd_from_memory.unsafe_as(Proc(SPBINARYGRAMMAR*, SPLOADOPTIONS, HRESULT)).call(pgrammar, options)
  end
  def load_cmd_from_proprietary_grammar(rguidparam : Guid*, pszstringparam : LibC::LPWSTR, pvdataprarm : Void*, cbdatasize : UInt32, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_cmd_from_proprietary_grammar.unsafe_as(Proc(Guid*, LibC::LPWSTR, Void*, UInt32, SPLOADOPTIONS, HRESULT)).call(rguidparam, pszstringparam, pvdataprarm, cbdatasize, options)
  end
  def set_rule_state(pszname : LibC::LPWSTR, preserved : Void*, newstate : SPRULESTATE) : HRESULT
    @lpVtbl.value.set_rule_state.unsafe_as(Proc(LibC::LPWSTR, Void*, SPRULESTATE, HRESULT)).call(pszname, preserved, newstate)
  end
  def set_rule_id_state(ulruleid : UInt32, newstate : SPRULESTATE) : HRESULT
    @lpVtbl.value.set_rule_id_state.unsafe_as(Proc(UInt32, SPRULESTATE, HRESULT)).call(ulruleid, newstate)
  end
  def load_dictation(psztopicname : LibC::LPWSTR, options : SPLOADOPTIONS) : HRESULT
    @lpVtbl.value.load_dictation.unsafe_as(Proc(LibC::LPWSTR, SPLOADOPTIONS, HRESULT)).call(psztopicname, options)
  end
  def unload_dictation : HRESULT
    @lpVtbl.value.unload_dictation.unsafe_as(Proc(HRESULT)).call
  end
  def set_dictation_state(newstate : SPRULESTATE) : HRESULT
    @lpVtbl.value.set_dictation_state.unsafe_as(Proc(SPRULESTATE, HRESULT)).call(newstate)
  end
  def set_word_sequence_data(ptext : Char*, cchtext : UInt32, pinfo : SPTEXTSELECTIONINFO*) : HRESULT
    @lpVtbl.value.set_word_sequence_data.unsafe_as(Proc(Char*, UInt32, SPTEXTSELECTIONINFO*, HRESULT)).call(ptext, cchtext, pinfo)
  end
  def set_text_selection(pinfo : SPTEXTSELECTIONINFO*) : HRESULT
    @lpVtbl.value.set_text_selection.unsafe_as(Proc(SPTEXTSELECTIONINFO*, HRESULT)).call(pinfo)
  end
  def is_pronounceable(pszword : LibC::LPWSTR, pwordpronounceable : SPWORDPRONOUNCEABLE*) : HRESULT
    @lpVtbl.value.is_pronounceable.unsafe_as(Proc(LibC::LPWSTR, SPWORDPRONOUNCEABLE*, HRESULT)).call(pszword, pwordpronounceable)
  end
  def set_grammar_state(egrammarstate : SPGRAMMARSTATE) : HRESULT
    @lpVtbl.value.set_grammar_state.unsafe_as(Proc(SPGRAMMARSTATE, HRESULT)).call(egrammarstate)
  end
  def save_cmd(pstream : IStream, ppszcomemerrortext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.save_cmd.unsafe_as(Proc(IStream, LibC::LPWSTR*, HRESULT)).call(pstream, ppszcomemerrortext)
  end
  def get_grammar_state(pegrammarstate : SPGRAMMARSTATE*) : HRESULT
    @lpVtbl.value.get_grammar_state.unsafe_as(Proc(SPGRAMMARSTATE*, HRESULT)).call(pegrammarstate)
  end
end
struct LibWin32::ISpGrammarBuilder2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_text_subset(hfromstate : SPSTATEHANDLE__*, htostate : SPSTATEHANDLE__*, psz : LibC::LPWSTR, ematchmode : SPMATCHINGMODE) : HRESULT
    @lpVtbl.value.add_text_subset.unsafe_as(Proc(SPSTATEHANDLE__*, SPSTATEHANDLE__*, LibC::LPWSTR, SPMATCHINGMODE, HRESULT)).call(hfromstate, htostate, psz, ematchmode)
  end
  def set_phonetic_alphabet(phoneticalphabet : PHONETICALPHABET) : HRESULT
    @lpVtbl.value.set_phonetic_alphabet.unsafe_as(Proc(PHONETICALPHABET, HRESULT)).call(phoneticalphabet)
  end
end
struct LibWin32::ISpRecoGrammar2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_rules(ppcomemrules : SPRULE**, punumrules : UInt32*) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(SPRULE**, UInt32*, HRESULT)).call(ppcomemrules, punumrules)
  end
  def load_cmd_from_file2(pszfilename : LibC::LPWSTR, options : SPLOADOPTIONS, pszsharinguri : LibC::LPWSTR, pszbaseuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.load_cmd_from_file2.unsafe_as(Proc(LibC::LPWSTR, SPLOADOPTIONS, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszfilename, options, pszsharinguri, pszbaseuri)
  end
  def load_cmd_from_memory2(pgrammar : SPBINARYGRAMMAR*, options : SPLOADOPTIONS, pszsharinguri : LibC::LPWSTR, pszbaseuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.load_cmd_from_memory2.unsafe_as(Proc(SPBINARYGRAMMAR*, SPLOADOPTIONS, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pgrammar, options, pszsharinguri, pszbaseuri)
  end
  def set_rule_priority(pszrulename : LibC::LPWSTR, ulruleid : UInt32, nrulepriority : Int32) : HRESULT
    @lpVtbl.value.set_rule_priority.unsafe_as(Proc(LibC::LPWSTR, UInt32, Int32, HRESULT)).call(pszrulename, ulruleid, nrulepriority)
  end
  def set_rule_weight(pszrulename : LibC::LPWSTR, ulruleid : UInt32, flweight : Float32) : HRESULT
    @lpVtbl.value.set_rule_weight.unsafe_as(Proc(LibC::LPWSTR, UInt32, Float32, HRESULT)).call(pszrulename, ulruleid, flweight)
  end
  def set_dictation_weight(flweight : Float32) : HRESULT
    @lpVtbl.value.set_dictation_weight.unsafe_as(Proc(Float32, HRESULT)).call(flweight)
  end
  def set_grammar_loader(ploader : ISpeechResourceLoader) : HRESULT
    @lpVtbl.value.set_grammar_loader.unsafe_as(Proc(ISpeechResourceLoader, HRESULT)).call(ploader)
  end
  def set_sml_security_manager(psmlsecuritymanager : IInternetSecurityManager) : HRESULT
    @lpVtbl.value.set_sml_security_manager.unsafe_as(Proc(IInternetSecurityManager, HRESULT)).call(psmlsecuritymanager)
  end
end
struct LibWin32::ISpeechResourceLoader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def load_resource(bstrresourceuri : UInt8*, falwaysreload : Int16, pstream : IUnknown*, pbstrmimetype : UInt8**, pfmodified : Int16*, pbstrredirecturl : UInt8**) : HRESULT
    @lpVtbl.value.load_resource.unsafe_as(Proc(UInt8*, Int16, IUnknown*, UInt8**, Int16*, UInt8**, HRESULT)).call(bstrresourceuri, falwaysreload, pstream, pbstrmimetype, pfmodified, pbstrredirecturl)
  end
  def get_local_copy(bstrresourceuri : UInt8*, pbstrlocalpath : UInt8**, pbstrmimetype : UInt8**, pbstrredirecturl : UInt8**) : HRESULT
    @lpVtbl.value.get_local_copy.unsafe_as(Proc(UInt8*, UInt8**, UInt8**, UInt8**, HRESULT)).call(bstrresourceuri, pbstrlocalpath, pbstrmimetype, pbstrredirecturl)
  end
  def release_local_copy(pbstrlocalpath : UInt8*) : HRESULT
    @lpVtbl.value.release_local_copy.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrlocalpath)
  end
end
struct LibWin32::ISpRecoContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify_sink(pnotifysink : ISpNotifySink) : HRESULT
    @lpVtbl.value.set_notify_sink.unsafe_as(Proc(ISpNotifySink, HRESULT)).call(pnotifysink)
  end
  def set_notify_window_message(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_window_message.unsafe_as(Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(hwnd, msg, wparam, lparam)
  end
  def set_notify_callback_function(pfncallback : SPNOTIFYCALLBACK*, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_function.unsafe_as(Proc(SPNOTIFYCALLBACK*, LibC::UINT_PTR, LPARAM, HRESULT)).call(pfncallback, wparam, lparam)
  end
  def set_notify_callback_interface(pspcallback : ISpNotifyCallback, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.set_notify_callback_interface.unsafe_as(Proc(ISpNotifyCallback, LibC::UINT_PTR, LPARAM, HRESULT)).call(pspcallback, wparam, lparam)
  end
  def set_notify_win32_event : HRESULT
    @lpVtbl.value.set_notify_win32_event.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_notify_event(dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait_for_notify_event.unsafe_as(Proc(UInt32, HRESULT)).call(dwmilliseconds)
  end
  def get_notify_event_handle : LibC::HANDLE
    @lpVtbl.value.get_notify_event_handle.unsafe_as(Proc(LibC::HANDLE)).call
  end
  def set_interest(ulleventinterest : UInt64, ullqueuedinterest : UInt64) : HRESULT
    @lpVtbl.value.set_interest.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(ulleventinterest, ullqueuedinterest)
  end
  def get_events(ulcount : UInt32, peventarray : SPEVENT*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_events.unsafe_as(Proc(UInt32, SPEVENT*, UInt32*, HRESULT)).call(ulcount, peventarray, pulfetched)
  end
  def get_info(pinfo : SPEVENTSOURCEINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(SPEVENTSOURCEINFO*, HRESULT)).call(pinfo)
  end
  def get_recognizer(pprecognizer : ISpRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(ISpRecognizer*, HRESULT)).call(pprecognizer)
  end
  def create_grammar(ullgrammarid : UInt64, ppgrammar : ISpRecoGrammar*) : HRESULT
    @lpVtbl.value.create_grammar.unsafe_as(Proc(UInt64, ISpRecoGrammar*, HRESULT)).call(ullgrammarid, ppgrammar)
  end
  def get_status(pstatus : SPRECOCONTEXTSTATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(SPRECOCONTEXTSTATUS*, HRESULT)).call(pstatus)
  end
  def get_max_alternates(pcalternates : UInt32*) : HRESULT
    @lpVtbl.value.get_max_alternates.unsafe_as(Proc(UInt32*, HRESULT)).call(pcalternates)
  end
  def set_max_alternates(calternates : UInt32) : HRESULT
    @lpVtbl.value.set_max_alternates.unsafe_as(Proc(UInt32, HRESULT)).call(calternates)
  end
  def set_audio_options(options : SPAUDIOOPTIONS, paudioformatid : Guid*, pwaveformatex : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_audio_options.unsafe_as(Proc(SPAUDIOOPTIONS, Guid*, WAVEFORMATEX*, HRESULT)).call(options, paudioformatid, pwaveformatex)
  end
  def get_audio_options(poptions : SPAUDIOOPTIONS*, paudioformatid : Guid*, ppcomemwfex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_audio_options.unsafe_as(Proc(SPAUDIOOPTIONS*, Guid*, WAVEFORMATEX**, HRESULT)).call(poptions, paudioformatid, ppcomemwfex)
  end
  def deserialize_result(pserializedresult : SPSERIALIZEDRESULT*, ppresult : ISpRecoResult*) : HRESULT
    @lpVtbl.value.deserialize_result.unsafe_as(Proc(SPSERIALIZEDRESULT*, ISpRecoResult*, HRESULT)).call(pserializedresult, ppresult)
  end
  def bookmark(options : SPBOOKMARKOPTIONS, ullstreamposition : UInt64, lparamevent : LPARAM) : HRESULT
    @lpVtbl.value.bookmark.unsafe_as(Proc(SPBOOKMARKOPTIONS, UInt64, LPARAM, HRESULT)).call(options, ullstreamposition, lparamevent)
  end
  def set_adaptation_data(padaptationdata : LibC::LPWSTR, cch : UInt32) : HRESULT
    @lpVtbl.value.set_adaptation_data.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(padaptationdata, cch)
  end
  def pause(dwreserved : UInt32) : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(UInt32, HRESULT)).call(dwreserved)
  end
  def resume(dwreserved : UInt32) : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(UInt32, HRESULT)).call(dwreserved)
  end
  def set_voice(pvoice : ISpVoice, fallowformatchanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_voice.unsafe_as(Proc(ISpVoice, LibC::BOOL, HRESULT)).call(pvoice, fallowformatchanges)
  end
  def get_voice(ppvoice : ISpVoice*) : HRESULT
    @lpVtbl.value.get_voice.unsafe_as(Proc(ISpVoice*, HRESULT)).call(ppvoice)
  end
  def set_voice_purge_event(ulleventinterest : UInt64) : HRESULT
    @lpVtbl.value.set_voice_purge_event.unsafe_as(Proc(UInt64, HRESULT)).call(ulleventinterest)
  end
  def get_voice_purge_event(pulleventinterest : UInt64*) : HRESULT
    @lpVtbl.value.get_voice_purge_event.unsafe_as(Proc(UInt64*, HRESULT)).call(pulleventinterest)
  end
  def set_context_state(econtextstate : SPCONTEXTSTATE) : HRESULT
    @lpVtbl.value.set_context_state.unsafe_as(Proc(SPCONTEXTSTATE, HRESULT)).call(econtextstate)
  end
  def get_context_state(pecontextstate : SPCONTEXTSTATE*) : HRESULT
    @lpVtbl.value.get_context_state.unsafe_as(Proc(SPCONTEXTSTATE*, HRESULT)).call(pecontextstate)
  end
end
struct LibWin32::ISpRecoContext2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_grammar_options(egrammaroptions : UInt32) : HRESULT
    @lpVtbl.value.set_grammar_options.unsafe_as(Proc(UInt32, HRESULT)).call(egrammaroptions)
  end
  def get_grammar_options(pegrammaroptions : UInt32*) : HRESULT
    @lpVtbl.value.get_grammar_options.unsafe_as(Proc(UInt32*, HRESULT)).call(pegrammaroptions)
  end
  def set_adaptation_data2(padaptationdata : LibC::LPWSTR, cch : UInt32, ptopicname : LibC::LPWSTR, eadaptationsettings : UInt32, erelevance : SPADAPTATIONRELEVANCE) : HRESULT
    @lpVtbl.value.set_adaptation_data2.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR, UInt32, SPADAPTATIONRELEVANCE, HRESULT)).call(padaptationdata, cch, ptopicname, eadaptationsettings, erelevance)
  end
end
struct LibWin32::ISpProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_property_num(pname : LibC::LPWSTR, lvalue : Int32) : HRESULT
    @lpVtbl.value.set_property_num.unsafe_as(Proc(LibC::LPWSTR, Int32, HRESULT)).call(pname, lvalue)
  end
  def get_property_num(pname : LibC::LPWSTR, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property_num.unsafe_as(Proc(LibC::LPWSTR, Int32*, HRESULT)).call(pname, plvalue)
  end
  def set_property_string(pname : LibC::LPWSTR, pvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_property_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pname, pvalue)
  end
  def get_property_string(pname : LibC::LPWSTR, ppcomemvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_property_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pname, ppcomemvalue)
  end
end
struct LibWin32::ISpRecognizer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_property_num(pname : LibC::LPWSTR, lvalue : Int32) : HRESULT
    @lpVtbl.value.set_property_num.unsafe_as(Proc(LibC::LPWSTR, Int32, HRESULT)).call(pname, lvalue)
  end
  def get_property_num(pname : LibC::LPWSTR, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property_num.unsafe_as(Proc(LibC::LPWSTR, Int32*, HRESULT)).call(pname, plvalue)
  end
  def set_property_string(pname : LibC::LPWSTR, pvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_property_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pname, pvalue)
  end
  def get_property_string(pname : LibC::LPWSTR, ppcomemvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_property_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pname, ppcomemvalue)
  end
  def set_recognizer(precognizer : ISpObjectToken) : HRESULT
    @lpVtbl.value.set_recognizer.unsafe_as(Proc(ISpObjectToken, HRESULT)).call(precognizer)
  end
  def get_recognizer(pprecognizer : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pprecognizer)
  end
  def set_input(punkinput : IUnknown, fallowformatchanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(IUnknown, LibC::BOOL, HRESULT)).call(punkinput, fallowformatchanges)
  end
  def get_input_object_token(pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_input_object_token.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pptoken)
  end
  def get_input_stream(ppstream : ISpStreamFormat*) : HRESULT
    @lpVtbl.value.get_input_stream.unsafe_as(Proc(ISpStreamFormat*, HRESULT)).call(ppstream)
  end
  def create_reco_context(ppnewctxt : ISpRecoContext*) : HRESULT
    @lpVtbl.value.create_reco_context.unsafe_as(Proc(ISpRecoContext*, HRESULT)).call(ppnewctxt)
  end
  def get_reco_profile(pptoken : ISpObjectToken*) : HRESULT
    @lpVtbl.value.get_reco_profile.unsafe_as(Proc(ISpObjectToken*, HRESULT)).call(pptoken)
  end
  def set_reco_profile(ptoken : ISpObjectToken) : HRESULT
    @lpVtbl.value.set_reco_profile.unsafe_as(Proc(ISpObjectToken, HRESULT)).call(ptoken)
  end
  def is_shared_instance : HRESULT
    @lpVtbl.value.is_shared_instance.unsafe_as(Proc(HRESULT)).call
  end
  def get_reco_state(pstate : SPRECOSTATE*) : HRESULT
    @lpVtbl.value.get_reco_state.unsafe_as(Proc(SPRECOSTATE*, HRESULT)).call(pstate)
  end
  def set_reco_state(newstate : SPRECOSTATE) : HRESULT
    @lpVtbl.value.set_reco_state.unsafe_as(Proc(SPRECOSTATE, HRESULT)).call(newstate)
  end
  def get_status(pstatus : SPRECOGNIZERSTATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(SPRECOGNIZERSTATUS*, HRESULT)).call(pstatus)
  end
  def get_format(waveformattype : SPWAVEFORMATTYPE, pformatid : Guid*, ppcomemwfex : WAVEFORMATEX**) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(SPWAVEFORMATTYPE, Guid*, WAVEFORMATEX**, HRESULT)).call(waveformattype, pformatid, ppcomemwfex)
  end
  def is_ui_supported(psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32, pfsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(LibC::LPWSTR, Void*, UInt32, LibC::BOOL*, HRESULT)).call(psztypeofui, pvextradata, cbextradata, pfsupported)
  end
  def display_ui(hwndparent : LibC::HANDLE, psztitle : LibC::LPWSTR, psztypeofui : LibC::LPWSTR, pvextradata : Void*, cbextradata : UInt32) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, HRESULT)).call(hwndparent, psztitle, psztypeofui, pvextradata, cbextradata)
  end
  def emulate_recognition(pphrase : ISpPhrase) : HRESULT
    @lpVtbl.value.emulate_recognition.unsafe_as(Proc(ISpPhrase, HRESULT)).call(pphrase)
  end
end
struct LibWin32::ISpSerializeState
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_serialized_state(ppbdata : UInt8**, pulsize : UInt32*, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.get_serialized_state.unsafe_as(Proc(UInt8**, UInt32*, UInt32, HRESULT)).call(ppbdata, pulsize, dwreserved)
  end
  def set_serialized_state(pbdata : UInt8*, ulsize : UInt32, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.set_serialized_state.unsafe_as(Proc(UInt8*, UInt32, UInt32, HRESULT)).call(pbdata, ulsize, dwreserved)
  end
end
struct LibWin32::ISpRecognizer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def emulate_recognition_ex(pphrase : ISpPhrase, dwcompareflags : UInt32) : HRESULT
    @lpVtbl.value.emulate_recognition_ex.unsafe_as(Proc(ISpPhrase, UInt32, HRESULT)).call(pphrase, dwcompareflags)
  end
  def set_training_state(fdoingtraining : LibC::BOOL, fadaptfromtrainingdata : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_training_state.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, HRESULT)).call(fdoingtraining, fadaptfromtrainingdata)
  end
  def reset_acoustic_model_adaptation : HRESULT
    @lpVtbl.value.reset_acoustic_model_adaptation.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpEnginePronunciation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def normalize(pszword : LibC::LPWSTR, pszleftcontext : LibC::LPWSTR, pszrightcontext : LibC::LPWSTR, langid : UInt16, pnormalizationlist : SPNORMALIZATIONLIST*) : HRESULT
    @lpVtbl.value.normalize.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPNORMALIZATIONLIST*, HRESULT)).call(pszword, pszleftcontext, pszrightcontext, langid, pnormalizationlist)
  end
  def get_pronunciations(pszword : LibC::LPWSTR, pszleftcontext : LibC::LPWSTR, pszrightcontext : LibC::LPWSTR, langid : UInt16, penginepronunciationlist : SPWORDPRONUNCIATIONLIST*) : HRESULT
    @lpVtbl.value.get_pronunciations.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt16, SPWORDPRONUNCIATIONLIST*, HRESULT)).call(pszword, pszleftcontext, pszrightcontext, langid, penginepronunciationlist)
  end
end
struct LibWin32::ISpDisplayAlternates
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_alternates(pphrase : SPDISPLAYPHRASE*, crequestcount : UInt32, ppcomemphrases : SPDISPLAYPHRASE**, pcphrasesreturned : UInt32*) : HRESULT
    @lpVtbl.value.get_display_alternates.unsafe_as(Proc(SPDISPLAYPHRASE*, UInt32, SPDISPLAYPHRASE**, UInt32*, HRESULT)).call(pphrase, crequestcount, ppcomemphrases, pcphrasesreturned)
  end
  def set_full_stop_trail_space(ultrailspace : UInt32) : HRESULT
    @lpVtbl.value.set_full_stop_trail_space.unsafe_as(Proc(UInt32, HRESULT)).call(ultrailspace)
  end
end
struct LibWin32::ISpeechDataKey
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def set_binary_value(valuename : UInt8*, value : VARIANT) : HRESULT
    @lpVtbl.value.set_binary_value.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(valuename, value)
  end
  def get_binary_value(valuename : UInt8*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_binary_value.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(valuename, value)
  end
  def set_string_value(valuename : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_string_value.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(valuename, value)
  end
  def get_string_value(valuename : UInt8*, value : UInt8**) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(valuename, value)
  end
  def set_long_value(valuename : UInt8*, value : Int32) : HRESULT
    @lpVtbl.value.set_long_value.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(valuename, value)
  end
  def get_long_value(valuename : UInt8*, value : Int32*) : HRESULT
    @lpVtbl.value.get_long_value.unsafe_as(Proc(UInt8*, Int32*, HRESULT)).call(valuename, value)
  end
  def open_key(subkeyname : UInt8*, subkey : ISpeechDataKey*) : HRESULT
    @lpVtbl.value.open_key.unsafe_as(Proc(UInt8*, ISpeechDataKey*, HRESULT)).call(subkeyname, subkey)
  end
  def create_key(subkeyname : UInt8*, subkey : ISpeechDataKey*) : HRESULT
    @lpVtbl.value.create_key.unsafe_as(Proc(UInt8*, ISpeechDataKey*, HRESULT)).call(subkeyname, subkey)
  end
  def delete_key(subkeyname : UInt8*) : HRESULT
    @lpVtbl.value.delete_key.unsafe_as(Proc(UInt8*, HRESULT)).call(subkeyname)
  end
  def delete_value(valuename : UInt8*) : HRESULT
    @lpVtbl.value.delete_value.unsafe_as(Proc(UInt8*, HRESULT)).call(valuename)
  end
  def enum_keys(index : Int32, subkeyname : UInt8**) : HRESULT
    @lpVtbl.value.enum_keys.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(index, subkeyname)
  end
  def enum_values(index : Int32, valuename : UInt8**) : HRESULT
    @lpVtbl.value.enum_values.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(index, valuename)
  end
end
struct LibWin32::ISpeechObjectToken
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(objectid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(objectid)
  end
  def get_data_key(datakey : ISpeechDataKey*) : HRESULT
    @lpVtbl.value.get_data_key.unsafe_as(Proc(ISpeechDataKey*, HRESULT)).call(datakey)
  end
  def get_category(category : ISpeechObjectTokenCategory*) : HRESULT
    @lpVtbl.value.get_category.unsafe_as(Proc(ISpeechObjectTokenCategory*, HRESULT)).call(category)
  end
  def get_description(locale : Int32, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(locale, description)
  end
  def set_id(id : UInt8*, categoryid : UInt8*, createifnotexist : Int16) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(UInt8*, UInt8*, Int16, HRESULT)).call(id, categoryid, createifnotexist)
  end
  def get_attribute(attributename : UInt8*, attributevalue : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(attributename, attributevalue)
  end
  def create_instance(punkouter : IUnknown, clscontext : SpeechTokenContext, object : IUnknown*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, SpeechTokenContext, IUnknown*, HRESULT)).call(punkouter, clscontext, object)
  end
  def remove(objectstorageclsid : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, HRESULT)).call(objectstorageclsid)
  end
  def get_storage_file_name(objectstorageclsid : UInt8*, keyname : UInt8*, filename : UInt8*, folder : SpeechTokenShellFolder, filepath : UInt8**) : HRESULT
    @lpVtbl.value.get_storage_file_name.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SpeechTokenShellFolder, UInt8**, HRESULT)).call(objectstorageclsid, keyname, filename, folder, filepath)
  end
  def remove_storage_file_name(objectstorageclsid : UInt8*, keyname : UInt8*, deletefilea : Int16) : HRESULT
    @lpVtbl.value.remove_storage_file_name.unsafe_as(Proc(UInt8*, UInt8*, Int16, HRESULT)).call(objectstorageclsid, keyname, deletefilea)
  end
  def is_ui_supported(typeofui : UInt8*, extradata : VARIANT*, object : IUnknown, supported : Int16*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(UInt8*, VARIANT*, IUnknown, Int16*, HRESULT)).call(typeofui, extradata, object, supported)
  end
  def display_ui(hwnd : Int32, title : UInt8*, typeofui : UInt8*, extradata : VARIANT*, object : IUnknown) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(Int32, UInt8*, UInt8*, VARIANT*, IUnknown, HRESULT)).call(hwnd, title, typeofui, extradata, object)
  end
  def matches_attributes(attributes : UInt8*, matches : Int16*) : HRESULT
    @lpVtbl.value.matches_attributes.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(attributes, matches)
  end
end
struct LibWin32::ISpeechObjectTokens
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, token : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechObjectToken*, HRESULT)).call(index, token)
  end
  def get__new_enum(ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenumvariant)
  end
end
struct LibWin32::ISpeechObjectTokenCategory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(id : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(id)
  end
  def put_default(tokenid : UInt8*) : HRESULT
    @lpVtbl.value.put_default.unsafe_as(Proc(UInt8*, HRESULT)).call(tokenid)
  end
  def get_default(tokenid : UInt8**) : HRESULT
    @lpVtbl.value.get_default.unsafe_as(Proc(UInt8**, HRESULT)).call(tokenid)
  end
  def set_id(id : UInt8*, createifnotexist : Int16) : HRESULT
    @lpVtbl.value.set_id.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(id, createifnotexist)
  end
  def get_data_key(location : SpeechDataKeyLocation, datakey : ISpeechDataKey*) : HRESULT
    @lpVtbl.value.get_data_key.unsafe_as(Proc(SpeechDataKeyLocation, ISpeechDataKey*, HRESULT)).call(location, datakey)
  end
  def enumerate_tokens(requiredattributes : UInt8*, optionalattributes : UInt8*, tokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.enumerate_tokens.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, tokens)
  end
end
struct LibWin32::ISpeechAudioBufferInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_min_notification(minnotification : Int32*) : HRESULT
    @lpVtbl.value.get_min_notification.unsafe_as(Proc(Int32*, HRESULT)).call(minnotification)
  end
  def put_min_notification(minnotification : Int32) : HRESULT
    @lpVtbl.value.put_min_notification.unsafe_as(Proc(Int32, HRESULT)).call(minnotification)
  end
  def get_buffer_size(buffersize : Int32*) : HRESULT
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(Int32*, HRESULT)).call(buffersize)
  end
  def put_buffer_size(buffersize : Int32) : HRESULT
    @lpVtbl.value.put_buffer_size.unsafe_as(Proc(Int32, HRESULT)).call(buffersize)
  end
  def get_event_bias(eventbias : Int32*) : HRESULT
    @lpVtbl.value.get_event_bias.unsafe_as(Proc(Int32*, HRESULT)).call(eventbias)
  end
  def put_event_bias(eventbias : Int32) : HRESULT
    @lpVtbl.value.put_event_bias.unsafe_as(Proc(Int32, HRESULT)).call(eventbias)
  end
end
struct LibWin32::ISpeechAudioStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_free_buffer_space(freebufferspace : Int32*) : HRESULT
    @lpVtbl.value.get_free_buffer_space.unsafe_as(Proc(Int32*, HRESULT)).call(freebufferspace)
  end
  def get_non_blocking_io(nonblockingio : Int32*) : HRESULT
    @lpVtbl.value.get_non_blocking_io.unsafe_as(Proc(Int32*, HRESULT)).call(nonblockingio)
  end
  def get_state(state : SpeechAudioState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(SpeechAudioState*, HRESULT)).call(state)
  end
  def get_current_seek_position(currentseekposition : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_seek_position.unsafe_as(Proc(VARIANT*, HRESULT)).call(currentseekposition)
  end
  def get_current_device_position(currentdeviceposition : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_device_position.unsafe_as(Proc(VARIANT*, HRESULT)).call(currentdeviceposition)
  end
end
struct LibWin32::ISpeechAudioFormat
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(audioformat : SpeechAudioFormatType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(SpeechAudioFormatType*, HRESULT)).call(audioformat)
  end
  def put_type(audioformat : SpeechAudioFormatType) : HRESULT
    @lpVtbl.value.put_type.unsafe_as(Proc(SpeechAudioFormatType, HRESULT)).call(audioformat)
  end
  def get_guid(guid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(guid)
  end
  def put_guid(guid : UInt8*) : HRESULT
    @lpVtbl.value.put_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(guid)
  end
  def get_wave_format_ex(speechwaveformatex : ISpeechWaveFormatEx*) : HRESULT
    @lpVtbl.value.get_wave_format_ex.unsafe_as(Proc(ISpeechWaveFormatEx*, HRESULT)).call(speechwaveformatex)
  end
  def set_wave_format_ex(speechwaveformatex : ISpeechWaveFormatEx) : HRESULT
    @lpVtbl.value.set_wave_format_ex.unsafe_as(Proc(ISpeechWaveFormatEx, HRESULT)).call(speechwaveformatex)
  end
end
struct LibWin32::ISpeechWaveFormatEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format_tag(formattag : Int16*) : HRESULT
    @lpVtbl.value.get_format_tag.unsafe_as(Proc(Int16*, HRESULT)).call(formattag)
  end
  def put_format_tag(formattag : Int16) : HRESULT
    @lpVtbl.value.put_format_tag.unsafe_as(Proc(Int16, HRESULT)).call(formattag)
  end
  def get_channels(channels : Int16*) : HRESULT
    @lpVtbl.value.get_channels.unsafe_as(Proc(Int16*, HRESULT)).call(channels)
  end
  def put_channels(channels : Int16) : HRESULT
    @lpVtbl.value.put_channels.unsafe_as(Proc(Int16, HRESULT)).call(channels)
  end
  def get_samples_per_sec(samplespersec : Int32*) : HRESULT
    @lpVtbl.value.get_samples_per_sec.unsafe_as(Proc(Int32*, HRESULT)).call(samplespersec)
  end
  def put_samples_per_sec(samplespersec : Int32) : HRESULT
    @lpVtbl.value.put_samples_per_sec.unsafe_as(Proc(Int32, HRESULT)).call(samplespersec)
  end
  def get_avg_bytes_per_sec(avgbytespersec : Int32*) : HRESULT
    @lpVtbl.value.get_avg_bytes_per_sec.unsafe_as(Proc(Int32*, HRESULT)).call(avgbytespersec)
  end
  def put_avg_bytes_per_sec(avgbytespersec : Int32) : HRESULT
    @lpVtbl.value.put_avg_bytes_per_sec.unsafe_as(Proc(Int32, HRESULT)).call(avgbytespersec)
  end
  def get_block_align(blockalign : Int16*) : HRESULT
    @lpVtbl.value.get_block_align.unsafe_as(Proc(Int16*, HRESULT)).call(blockalign)
  end
  def put_block_align(blockalign : Int16) : HRESULT
    @lpVtbl.value.put_block_align.unsafe_as(Proc(Int16, HRESULT)).call(blockalign)
  end
  def get_bits_per_sample(bitspersample : Int16*) : HRESULT
    @lpVtbl.value.get_bits_per_sample.unsafe_as(Proc(Int16*, HRESULT)).call(bitspersample)
  end
  def put_bits_per_sample(bitspersample : Int16) : HRESULT
    @lpVtbl.value.put_bits_per_sample.unsafe_as(Proc(Int16, HRESULT)).call(bitspersample)
  end
  def get_extra_data(extradata : VARIANT*) : HRESULT
    @lpVtbl.value.get_extra_data.unsafe_as(Proc(VARIANT*, HRESULT)).call(extradata)
  end
  def put_extra_data(extradata : VARIANT) : HRESULT
    @lpVtbl.value.put_extra_data.unsafe_as(Proc(VARIANT, HRESULT)).call(extradata)
  end
end
struct LibWin32::ISpeechBaseStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
end
struct LibWin32::ISpeechFileStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
  def open(filename : UInt8*, filemode : SpeechStreamFileMode, doevents : Int16) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(UInt8*, SpeechStreamFileMode, Int16, HRESULT)).call(filename, filemode, doevents)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpeechMemoryStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
  def set_data(data : VARIANT) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(VARIANT, HRESULT)).call(data)
  end
  def get_data(pdata : VARIANT*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(VARIANT*, HRESULT)).call(pdata)
  end
end
struct LibWin32::ISpeechCustomStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
  def get_base_stream(ppunkstream : IUnknown*) : HRESULT
    @lpVtbl.value.get_base_stream.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunkstream)
  end
  def putref_base_stream(punkstream : IUnknown) : HRESULT
    @lpVtbl.value.putref_base_stream.unsafe_as(Proc(IUnknown, HRESULT)).call(punkstream)
  end
end
struct LibWin32::ISpeechAudio
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
  def get_status(status : ISpeechAudioStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(ISpeechAudioStatus*, HRESULT)).call(status)
  end
  def get_buffer_info(bufferinfo : ISpeechAudioBufferInfo*) : HRESULT
    @lpVtbl.value.get_buffer_info.unsafe_as(Proc(ISpeechAudioBufferInfo*, HRESULT)).call(bufferinfo)
  end
  def get_default_format(streamformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_default_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(streamformat)
  end
  def get_volume(volume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(Int32*, HRESULT)).call(volume)
  end
  def put_volume(volume : Int32) : HRESULT
    @lpVtbl.value.put_volume.unsafe_as(Proc(Int32, HRESULT)).call(volume)
  end
  def get_buffer_notify_size(buffernotifysize : Int32*) : HRESULT
    @lpVtbl.value.get_buffer_notify_size.unsafe_as(Proc(Int32*, HRESULT)).call(buffernotifysize)
  end
  def put_buffer_notify_size(buffernotifysize : Int32) : HRESULT
    @lpVtbl.value.put_buffer_notify_size.unsafe_as(Proc(Int32, HRESULT)).call(buffernotifysize)
  end
  def get_event_handle(eventhandle : Int32*) : HRESULT
    @lpVtbl.value.get_event_handle.unsafe_as(Proc(Int32*, HRESULT)).call(eventhandle)
  end
  def set_state(state : SpeechAudioState) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(SpeechAudioState, HRESULT)).call(state)
  end
end
struct LibWin32::ISpeechMMSysAudio
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_format(audioformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(audioformat)
  end
  def putref_format(audioformat : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(audioformat)
  end
  def read(buffer : VARIANT*, numberofbytes : Int32, bytesread : Int32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(buffer, numberofbytes, bytesread)
  end
  def write(buffer : VARIANT, byteswritten : Int32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(VARIANT, Int32*, HRESULT)).call(buffer, byteswritten)
  end
  def seek(position : VARIANT, origin : SpeechStreamSeekPositionType, newposition : VARIANT*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(VARIANT, SpeechStreamSeekPositionType, VARIANT*, HRESULT)).call(position, origin, newposition)
  end
  def get_status(status : ISpeechAudioStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(ISpeechAudioStatus*, HRESULT)).call(status)
  end
  def get_buffer_info(bufferinfo : ISpeechAudioBufferInfo*) : HRESULT
    @lpVtbl.value.get_buffer_info.unsafe_as(Proc(ISpeechAudioBufferInfo*, HRESULT)).call(bufferinfo)
  end
  def get_default_format(streamformat : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_default_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(streamformat)
  end
  def get_volume(volume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(Int32*, HRESULT)).call(volume)
  end
  def put_volume(volume : Int32) : HRESULT
    @lpVtbl.value.put_volume.unsafe_as(Proc(Int32, HRESULT)).call(volume)
  end
  def get_buffer_notify_size(buffernotifysize : Int32*) : HRESULT
    @lpVtbl.value.get_buffer_notify_size.unsafe_as(Proc(Int32*, HRESULT)).call(buffernotifysize)
  end
  def put_buffer_notify_size(buffernotifysize : Int32) : HRESULT
    @lpVtbl.value.put_buffer_notify_size.unsafe_as(Proc(Int32, HRESULT)).call(buffernotifysize)
  end
  def get_event_handle(eventhandle : Int32*) : HRESULT
    @lpVtbl.value.get_event_handle.unsafe_as(Proc(Int32*, HRESULT)).call(eventhandle)
  end
  def set_state(state : SpeechAudioState) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(SpeechAudioState, HRESULT)).call(state)
  end
  def get_device_id(deviceid : Int32*) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(Int32*, HRESULT)).call(deviceid)
  end
  def put_device_id(deviceid : Int32) : HRESULT
    @lpVtbl.value.put_device_id.unsafe_as(Proc(Int32, HRESULT)).call(deviceid)
  end
  def get_line_id(lineid : Int32*) : HRESULT
    @lpVtbl.value.get_line_id.unsafe_as(Proc(Int32*, HRESULT)).call(lineid)
  end
  def put_line_id(lineid : Int32) : HRESULT
    @lpVtbl.value.put_line_id.unsafe_as(Proc(Int32, HRESULT)).call(lineid)
  end
  def get_mm_handle(handle : Int32*) : HRESULT
    @lpVtbl.value.get_mm_handle.unsafe_as(Proc(Int32*, HRESULT)).call(handle)
  end
end
struct LibWin32::ISpeechVoice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(status : ISpeechVoiceStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(ISpeechVoiceStatus*, HRESULT)).call(status)
  end
  def get_voice(voice : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.get_voice.unsafe_as(Proc(ISpeechObjectToken*, HRESULT)).call(voice)
  end
  def putref_voice(voice : ISpeechObjectToken) : HRESULT
    @lpVtbl.value.putref_voice.unsafe_as(Proc(ISpeechObjectToken, HRESULT)).call(voice)
  end
  def get_audio_output(audiooutput : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.get_audio_output.unsafe_as(Proc(ISpeechObjectToken*, HRESULT)).call(audiooutput)
  end
  def putref_audio_output(audiooutput : ISpeechObjectToken) : HRESULT
    @lpVtbl.value.putref_audio_output.unsafe_as(Proc(ISpeechObjectToken, HRESULT)).call(audiooutput)
  end
  def get_audio_output_stream(audiooutputstream : ISpeechBaseStream*) : HRESULT
    @lpVtbl.value.get_audio_output_stream.unsafe_as(Proc(ISpeechBaseStream*, HRESULT)).call(audiooutputstream)
  end
  def putref_audio_output_stream(audiooutputstream : ISpeechBaseStream) : HRESULT
    @lpVtbl.value.putref_audio_output_stream.unsafe_as(Proc(ISpeechBaseStream, HRESULT)).call(audiooutputstream)
  end
  def get_rate(rate : Int32*) : HRESULT
    @lpVtbl.value.get_rate.unsafe_as(Proc(Int32*, HRESULT)).call(rate)
  end
  def put_rate(rate : Int32) : HRESULT
    @lpVtbl.value.put_rate.unsafe_as(Proc(Int32, HRESULT)).call(rate)
  end
  def get_volume(volume : Int32*) : HRESULT
    @lpVtbl.value.get_volume.unsafe_as(Proc(Int32*, HRESULT)).call(volume)
  end
  def put_volume(volume : Int32) : HRESULT
    @lpVtbl.value.put_volume.unsafe_as(Proc(Int32, HRESULT)).call(volume)
  end
  def put_allow_audio_output_format_changes_on_next_set(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_audio_output_format_changes_on_next_set.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_audio_output_format_changes_on_next_set(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_audio_output_format_changes_on_next_set.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def get_event_interests(eventinterestflags : SpeechVoiceEvents*) : HRESULT
    @lpVtbl.value.get_event_interests.unsafe_as(Proc(SpeechVoiceEvents*, HRESULT)).call(eventinterestflags)
  end
  def put_event_interests(eventinterestflags : SpeechVoiceEvents) : HRESULT
    @lpVtbl.value.put_event_interests.unsafe_as(Proc(SpeechVoiceEvents, HRESULT)).call(eventinterestflags)
  end
  def put_priority(priority : SpeechVoicePriority) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(SpeechVoicePriority, HRESULT)).call(priority)
  end
  def get_priority(priority : SpeechVoicePriority*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(SpeechVoicePriority*, HRESULT)).call(priority)
  end
  def put_alert_boundary(boundary : SpeechVoiceEvents) : HRESULT
    @lpVtbl.value.put_alert_boundary.unsafe_as(Proc(SpeechVoiceEvents, HRESULT)).call(boundary)
  end
  def get_alert_boundary(boundary : SpeechVoiceEvents*) : HRESULT
    @lpVtbl.value.get_alert_boundary.unsafe_as(Proc(SpeechVoiceEvents*, HRESULT)).call(boundary)
  end
  def put_synchronous_speak_timeout(mstimeout : Int32) : HRESULT
    @lpVtbl.value.put_synchronous_speak_timeout.unsafe_as(Proc(Int32, HRESULT)).call(mstimeout)
  end
  def get_synchronous_speak_timeout(mstimeout : Int32*) : HRESULT
    @lpVtbl.value.get_synchronous_speak_timeout.unsafe_as(Proc(Int32*, HRESULT)).call(mstimeout)
  end
  def speak(text : UInt8*, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak.unsafe_as(Proc(UInt8*, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(text, flags, streamnumber)
  end
  def speak_stream(stream : ISpeechBaseStream, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak_stream.unsafe_as(Proc(ISpeechBaseStream, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(stream, flags, streamnumber)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def skip(type : UInt8*, numitems : Int32, numskipped : Int32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt8*, Int32, Int32*, HRESULT)).call(type, numitems, numskipped)
  end
  def get_voices(requiredattributes : UInt8*, optionalattributes : UInt8*, objecttokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.get_voices.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, objecttokens)
  end
  def get_audio_outputs(requiredattributes : UInt8*, optionalattributes : UInt8*, objecttokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.get_audio_outputs.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, objecttokens)
  end
  def wait_until_done(mstimeout : Int32, done : Int16*) : HRESULT
    @lpVtbl.value.wait_until_done.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(mstimeout, done)
  end
  def speak_complete_event(handle : Int32*) : HRESULT
    @lpVtbl.value.speak_complete_event.unsafe_as(Proc(Int32*, HRESULT)).call(handle)
  end
  def is_ui_supported(typeofui : UInt8*, extradata : VARIANT*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(UInt8*, VARIANT*, Int16*, HRESULT)).call(typeofui, extradata, supported)
  end
  def display_ui(hwndparent : Int32, title : UInt8*, typeofui : UInt8*, extradata : VARIANT*) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(Int32, UInt8*, UInt8*, VARIANT*, HRESULT)).call(hwndparent, title, typeofui, extradata)
  end
end
struct LibWin32::ISpeechVoiceStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_current_stream_number(streamnumber : Int32*) : HRESULT
    @lpVtbl.value.get_current_stream_number.unsafe_as(Proc(Int32*, HRESULT)).call(streamnumber)
  end
  def get_last_stream_number_queued(streamnumber : Int32*) : HRESULT
    @lpVtbl.value.get_last_stream_number_queued.unsafe_as(Proc(Int32*, HRESULT)).call(streamnumber)
  end
  def get_last_h_result(hresult : Int32*) : HRESULT
    @lpVtbl.value.get_last_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(hresult)
  end
  def get_running_state(state : SpeechRunState*) : HRESULT
    @lpVtbl.value.get_running_state.unsafe_as(Proc(SpeechRunState*, HRESULT)).call(state)
  end
  def get_input_word_position(position : Int32*) : HRESULT
    @lpVtbl.value.get_input_word_position.unsafe_as(Proc(Int32*, HRESULT)).call(position)
  end
  def get_input_word_length(length : Int32*) : HRESULT
    @lpVtbl.value.get_input_word_length.unsafe_as(Proc(Int32*, HRESULT)).call(length)
  end
  def get_input_sentence_position(position : Int32*) : HRESULT
    @lpVtbl.value.get_input_sentence_position.unsafe_as(Proc(Int32*, HRESULT)).call(position)
  end
  def get_input_sentence_length(length : Int32*) : HRESULT
    @lpVtbl.value.get_input_sentence_length.unsafe_as(Proc(Int32*, HRESULT)).call(length)
  end
  def get_last_bookmark(bookmark : UInt8**) : HRESULT
    @lpVtbl.value.get_last_bookmark.unsafe_as(Proc(UInt8**, HRESULT)).call(bookmark)
  end
  def get_last_bookmark_id(bookmarkid : Int32*) : HRESULT
    @lpVtbl.value.get_last_bookmark_id.unsafe_as(Proc(Int32*, HRESULT)).call(bookmarkid)
  end
  def get_phoneme_id(phoneid : Int16*) : HRESULT
    @lpVtbl.value.get_phoneme_id.unsafe_as(Proc(Int16*, HRESULT)).call(phoneid)
  end
  def get_viseme_id(visemeid : Int16*) : HRESULT
    @lpVtbl.value.get_viseme_id.unsafe_as(Proc(Int16*, HRESULT)).call(visemeid)
  end
end
struct LibWin32::IISpeechVoiceEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ISpeechRecognizer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def putref_recognizer(recognizer : ISpeechObjectToken) : HRESULT
    @lpVtbl.value.putref_recognizer.unsafe_as(Proc(ISpeechObjectToken, HRESULT)).call(recognizer)
  end
  def get_recognizer(recognizer : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(ISpeechObjectToken*, HRESULT)).call(recognizer)
  end
  def put_allow_audio_input_format_changes_on_next_set(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_audio_input_format_changes_on_next_set.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_audio_input_format_changes_on_next_set(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_audio_input_format_changes_on_next_set.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def putref_audio_input(audioinput : ISpeechObjectToken) : HRESULT
    @lpVtbl.value.putref_audio_input.unsafe_as(Proc(ISpeechObjectToken, HRESULT)).call(audioinput)
  end
  def get_audio_input(audioinput : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.get_audio_input.unsafe_as(Proc(ISpeechObjectToken*, HRESULT)).call(audioinput)
  end
  def putref_audio_input_stream(audioinputstream : ISpeechBaseStream) : HRESULT
    @lpVtbl.value.putref_audio_input_stream.unsafe_as(Proc(ISpeechBaseStream, HRESULT)).call(audioinputstream)
  end
  def get_audio_input_stream(audioinputstream : ISpeechBaseStream*) : HRESULT
    @lpVtbl.value.get_audio_input_stream.unsafe_as(Proc(ISpeechBaseStream*, HRESULT)).call(audioinputstream)
  end
  def get_is_shared(shared : Int16*) : HRESULT
    @lpVtbl.value.get_is_shared.unsafe_as(Proc(Int16*, HRESULT)).call(shared)
  end
  def put_state(state : SpeechRecognizerState) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(SpeechRecognizerState, HRESULT)).call(state)
  end
  def get_state(state : SpeechRecognizerState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(SpeechRecognizerState*, HRESULT)).call(state)
  end
  def get_status(status : ISpeechRecognizerStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(ISpeechRecognizerStatus*, HRESULT)).call(status)
  end
  def putref_profile(profile : ISpeechObjectToken) : HRESULT
    @lpVtbl.value.putref_profile.unsafe_as(Proc(ISpeechObjectToken, HRESULT)).call(profile)
  end
  def get_profile(profile : ISpeechObjectToken*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(ISpeechObjectToken*, HRESULT)).call(profile)
  end
  def emulate_recognition(textelements : VARIANT, elementdisplayattributes : VARIANT*, languageid : Int32) : HRESULT
    @lpVtbl.value.emulate_recognition.unsafe_as(Proc(VARIANT, VARIANT*, Int32, HRESULT)).call(textelements, elementdisplayattributes, languageid)
  end
  def create_reco_context(newcontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.create_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(newcontext)
  end
  def get_format(type : SpeechFormatType, format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(SpeechFormatType, ISpeechAudioFormat*, HRESULT)).call(type, format)
  end
  def set_property_number(name : UInt8*, value : Int32, supported : Int16*) : HRESULT
    @lpVtbl.value.set_property_number.unsafe_as(Proc(UInt8*, Int32, Int16*, HRESULT)).call(name, value, supported)
  end
  def get_property_number(name : UInt8*, value : Int32*, supported : Int16*) : HRESULT
    @lpVtbl.value.get_property_number.unsafe_as(Proc(UInt8*, Int32*, Int16*, HRESULT)).call(name, value, supported)
  end
  def set_property_string(name : UInt8*, value : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.set_property_string.unsafe_as(Proc(UInt8*, UInt8*, Int16*, HRESULT)).call(name, value, supported)
  end
  def get_property_string(name : UInt8*, value : UInt8**, supported : Int16*) : HRESULT
    @lpVtbl.value.get_property_string.unsafe_as(Proc(UInt8*, UInt8**, Int16*, HRESULT)).call(name, value, supported)
  end
  def is_ui_supported(typeofui : UInt8*, extradata : VARIANT*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_ui_supported.unsafe_as(Proc(UInt8*, VARIANT*, Int16*, HRESULT)).call(typeofui, extradata, supported)
  end
  def display_ui(hwndparent : Int32, title : UInt8*, typeofui : UInt8*, extradata : VARIANT*) : HRESULT
    @lpVtbl.value.display_ui.unsafe_as(Proc(Int32, UInt8*, UInt8*, VARIANT*, HRESULT)).call(hwndparent, title, typeofui, extradata)
  end
  def get_recognizers(requiredattributes : UInt8*, optionalattributes : UInt8*, objecttokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.get_recognizers.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, objecttokens)
  end
  def get_audio_inputs(requiredattributes : UInt8*, optionalattributes : UInt8*, objecttokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.get_audio_inputs.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, objecttokens)
  end
  def get_profiles(requiredattributes : UInt8*, optionalattributes : UInt8*, objecttokens : ISpeechObjectTokens*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(UInt8*, UInt8*, ISpeechObjectTokens*, HRESULT)).call(requiredattributes, optionalattributes, objecttokens)
  end
end
struct LibWin32::ISpeechRecognizerStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_audio_status(audiostatus : ISpeechAudioStatus*) : HRESULT
    @lpVtbl.value.get_audio_status.unsafe_as(Proc(ISpeechAudioStatus*, HRESULT)).call(audiostatus)
  end
  def get_current_stream_position(pcurrentstreampos : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_stream_position.unsafe_as(Proc(VARIANT*, HRESULT)).call(pcurrentstreampos)
  end
  def get_current_stream_number(streamnumber : Int32*) : HRESULT
    @lpVtbl.value.get_current_stream_number.unsafe_as(Proc(Int32*, HRESULT)).call(streamnumber)
  end
  def get_number_of_active_rules(numberofactiverules : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_active_rules.unsafe_as(Proc(Int32*, HRESULT)).call(numberofactiverules)
  end
  def get_clsid_engine(clsidengine : UInt8**) : HRESULT
    @lpVtbl.value.get_clsid_engine.unsafe_as(Proc(UInt8**, HRESULT)).call(clsidengine)
  end
  def get_supported_languages(supportedlanguages : VARIANT*) : HRESULT
    @lpVtbl.value.get_supported_languages.unsafe_as(Proc(VARIANT*, HRESULT)).call(supportedlanguages)
  end
end
struct LibWin32::ISpeechRecoContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_recognizer(recognizer : ISpeechRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(ISpeechRecognizer*, HRESULT)).call(recognizer)
  end
  def get_audio_input_interference_status(interference : SpeechInterference*) : HRESULT
    @lpVtbl.value.get_audio_input_interference_status.unsafe_as(Proc(SpeechInterference*, HRESULT)).call(interference)
  end
  def get_requested_ui_type(uitype : UInt8**) : HRESULT
    @lpVtbl.value.get_requested_ui_type.unsafe_as(Proc(UInt8**, HRESULT)).call(uitype)
  end
  def putref_voice(voice : ISpeechVoice) : HRESULT
    @lpVtbl.value.putref_voice.unsafe_as(Proc(ISpeechVoice, HRESULT)).call(voice)
  end
  def get_voice(voice : ISpeechVoice*) : HRESULT
    @lpVtbl.value.get_voice.unsafe_as(Proc(ISpeechVoice*, HRESULT)).call(voice)
  end
  def put_allow_voice_format_matching_on_next_set(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_voice_format_matching_on_next_set.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_voice_format_matching_on_next_set(pallow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_voice_format_matching_on_next_set.unsafe_as(Proc(Int16*, HRESULT)).call(pallow)
  end
  def put_voice_purge_event(eventinterest : SpeechRecoEvents) : HRESULT
    @lpVtbl.value.put_voice_purge_event.unsafe_as(Proc(SpeechRecoEvents, HRESULT)).call(eventinterest)
  end
  def get_voice_purge_event(eventinterest : SpeechRecoEvents*) : HRESULT
    @lpVtbl.value.get_voice_purge_event.unsafe_as(Proc(SpeechRecoEvents*, HRESULT)).call(eventinterest)
  end
  def put_event_interests(eventinterest : SpeechRecoEvents) : HRESULT
    @lpVtbl.value.put_event_interests.unsafe_as(Proc(SpeechRecoEvents, HRESULT)).call(eventinterest)
  end
  def get_event_interests(eventinterest : SpeechRecoEvents*) : HRESULT
    @lpVtbl.value.get_event_interests.unsafe_as(Proc(SpeechRecoEvents*, HRESULT)).call(eventinterest)
  end
  def put_cmd_max_alternates(maxalternates : Int32) : HRESULT
    @lpVtbl.value.put_cmd_max_alternates.unsafe_as(Proc(Int32, HRESULT)).call(maxalternates)
  end
  def get_cmd_max_alternates(maxalternates : Int32*) : HRESULT
    @lpVtbl.value.get_cmd_max_alternates.unsafe_as(Proc(Int32*, HRESULT)).call(maxalternates)
  end
  def put_state(state : SpeechRecoContextState) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(SpeechRecoContextState, HRESULT)).call(state)
  end
  def get_state(state : SpeechRecoContextState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(SpeechRecoContextState*, HRESULT)).call(state)
  end
  def put_retained_audio(option : SpeechRetainedAudioOptions) : HRESULT
    @lpVtbl.value.put_retained_audio.unsafe_as(Proc(SpeechRetainedAudioOptions, HRESULT)).call(option)
  end
  def get_retained_audio(option : SpeechRetainedAudioOptions*) : HRESULT
    @lpVtbl.value.get_retained_audio.unsafe_as(Proc(SpeechRetainedAudioOptions*, HRESULT)).call(option)
  end
  def putref_retained_audio_format(format : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_retained_audio_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(format)
  end
  def get_retained_audio_format(format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_retained_audio_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(format)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def create_grammar(grammarid : VARIANT, grammar : ISpeechRecoGrammar*) : HRESULT
    @lpVtbl.value.create_grammar.unsafe_as(Proc(VARIANT, ISpeechRecoGrammar*, HRESULT)).call(grammarid, grammar)
  end
  def create_result_from_memory(resultblock : VARIANT*, result : ISpeechRecoResult*) : HRESULT
    @lpVtbl.value.create_result_from_memory.unsafe_as(Proc(VARIANT*, ISpeechRecoResult*, HRESULT)).call(resultblock, result)
  end
  def bookmark(options : SpeechBookmarkOptions, streampos : VARIANT, bookmarkid : VARIANT) : HRESULT
    @lpVtbl.value.bookmark.unsafe_as(Proc(SpeechBookmarkOptions, VARIANT, VARIANT, HRESULT)).call(options, streampos, bookmarkid)
  end
  def set_adaptation_data(adaptationstring : UInt8*) : HRESULT
    @lpVtbl.value.set_adaptation_data.unsafe_as(Proc(UInt8*, HRESULT)).call(adaptationstring)
  end
end
struct LibWin32::ISpeechRecoGrammar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(id : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(id)
  end
  def get_reco_context(recocontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(recocontext)
  end
  def put_state(state : SpeechGrammarState) : HRESULT
    @lpVtbl.value.put_state.unsafe_as(Proc(SpeechGrammarState, HRESULT)).call(state)
  end
  def get_state(state : SpeechGrammarState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(SpeechGrammarState*, HRESULT)).call(state)
  end
  def get_rules(rules : ISpeechGrammarRules*) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(ISpeechGrammarRules*, HRESULT)).call(rules)
  end
  def reset(newlanguage : Int32) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Int32, HRESULT)).call(newlanguage)
  end
  def cmd_load_from_file(filename : UInt8*, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.cmd_load_from_file.unsafe_as(Proc(UInt8*, SpeechLoadOption, HRESULT)).call(filename, loadoption)
  end
  def cmd_load_from_object(classid : UInt8*, grammarname : UInt8*, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.cmd_load_from_object.unsafe_as(Proc(UInt8*, UInt8*, SpeechLoadOption, HRESULT)).call(classid, grammarname, loadoption)
  end
  def cmd_load_from_resource(hmodule : Int32, resourcename : VARIANT, resourcetype : VARIANT, languageid : Int32, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.cmd_load_from_resource.unsafe_as(Proc(Int32, VARIANT, VARIANT, Int32, SpeechLoadOption, HRESULT)).call(hmodule, resourcename, resourcetype, languageid, loadoption)
  end
  def cmd_load_from_memory(grammardata : VARIANT, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.cmd_load_from_memory.unsafe_as(Proc(VARIANT, SpeechLoadOption, HRESULT)).call(grammardata, loadoption)
  end
  def cmd_load_from_proprietary_grammar(proprietaryguid : UInt8*, proprietarystring : UInt8*, proprietarydata : VARIANT, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.cmd_load_from_proprietary_grammar.unsafe_as(Proc(UInt8*, UInt8*, VARIANT, SpeechLoadOption, HRESULT)).call(proprietaryguid, proprietarystring, proprietarydata, loadoption)
  end
  def cmd_set_rule_state(name : UInt8*, state : SpeechRuleState) : HRESULT
    @lpVtbl.value.cmd_set_rule_state.unsafe_as(Proc(UInt8*, SpeechRuleState, HRESULT)).call(name, state)
  end
  def cmd_set_rule_id_state(ruleid : Int32, state : SpeechRuleState) : HRESULT
    @lpVtbl.value.cmd_set_rule_id_state.unsafe_as(Proc(Int32, SpeechRuleState, HRESULT)).call(ruleid, state)
  end
  def dictation_load(topicname : UInt8*, loadoption : SpeechLoadOption) : HRESULT
    @lpVtbl.value.dictation_load.unsafe_as(Proc(UInt8*, SpeechLoadOption, HRESULT)).call(topicname, loadoption)
  end
  def dictation_unload : HRESULT
    @lpVtbl.value.dictation_unload.unsafe_as(Proc(HRESULT)).call
  end
  def dictation_set_state(state : SpeechRuleState) : HRESULT
    @lpVtbl.value.dictation_set_state.unsafe_as(Proc(SpeechRuleState, HRESULT)).call(state)
  end
  def set_word_sequence_data(text : UInt8*, textlength : Int32, info : ISpeechTextSelectionInformation) : HRESULT
    @lpVtbl.value.set_word_sequence_data.unsafe_as(Proc(UInt8*, Int32, ISpeechTextSelectionInformation, HRESULT)).call(text, textlength, info)
  end
  def set_text_selection(info : ISpeechTextSelectionInformation) : HRESULT
    @lpVtbl.value.set_text_selection.unsafe_as(Proc(ISpeechTextSelectionInformation, HRESULT)).call(info)
  end
  def is_pronounceable(word : UInt8*, wordpronounceable : SpeechWordPronounceable*) : HRESULT
    @lpVtbl.value.is_pronounceable.unsafe_as(Proc(UInt8*, SpeechWordPronounceable*, HRESULT)).call(word, wordpronounceable)
  end
end
struct LibWin32::IISpeechRecoContextEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ISpeechGrammarRule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_attributes(attributes : SpeechRuleAttributes*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(SpeechRuleAttributes*, HRESULT)).call(attributes)
  end
  def get_initial_state(state : ISpeechGrammarRuleState*) : HRESULT
    @lpVtbl.value.get_initial_state.unsafe_as(Proc(ISpeechGrammarRuleState*, HRESULT)).call(state)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_id(id : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(id)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_resource(resourcename : UInt8*, resourcevalue : UInt8*) : HRESULT
    @lpVtbl.value.add_resource.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(resourcename, resourcevalue)
  end
  def add_state(state : ISpeechGrammarRuleState*) : HRESULT
    @lpVtbl.value.add_state.unsafe_as(Proc(ISpeechGrammarRuleState*, HRESULT)).call(state)
  end
end
struct LibWin32::ISpeechGrammarRules
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def find_rule(rulenameorid : VARIANT, rule : ISpeechGrammarRule*) : HRESULT
    @lpVtbl.value.find_rule.unsafe_as(Proc(VARIANT, ISpeechGrammarRule*, HRESULT)).call(rulenameorid, rule)
  end
  def item(index : Int32, rule : ISpeechGrammarRule*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechGrammarRule*, HRESULT)).call(index, rule)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
  def get_dynamic(dynamic : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic.unsafe_as(Proc(Int16*, HRESULT)).call(dynamic)
  end
  def add(rulename : UInt8*, attributes : SpeechRuleAttributes, ruleid : Int32, rule : ISpeechGrammarRule*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, SpeechRuleAttributes, Int32, ISpeechGrammarRule*, HRESULT)).call(rulename, attributes, ruleid, rule)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def commit_and_save(errortext : UInt8**, savestream : VARIANT*) : HRESULT
    @lpVtbl.value.commit_and_save.unsafe_as(Proc(UInt8**, VARIANT*, HRESULT)).call(errortext, savestream)
  end
end
struct LibWin32::ISpeechGrammarRuleState
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_rule(rule : ISpeechGrammarRule*) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(ISpeechGrammarRule*, HRESULT)).call(rule)
  end
  def get_transitions(transitions : ISpeechGrammarRuleStateTransitions*) : HRESULT
    @lpVtbl.value.get_transitions.unsafe_as(Proc(ISpeechGrammarRuleStateTransitions*, HRESULT)).call(transitions)
  end
  def add_word_transition(deststate : ISpeechGrammarRuleState, words : UInt8*, separators : UInt8*, type : SpeechGrammarWordType, propertyname : UInt8*, propertyid : Int32, propertyvalue : VARIANT*, weight : Float32) : HRESULT
    @lpVtbl.value.add_word_transition.unsafe_as(Proc(ISpeechGrammarRuleState, UInt8*, UInt8*, SpeechGrammarWordType, UInt8*, Int32, VARIANT*, Float32, HRESULT)).call(deststate, words, separators, type, propertyname, propertyid, propertyvalue, weight)
  end
  def add_rule_transition(destinationstate : ISpeechGrammarRuleState, rule : ISpeechGrammarRule, propertyname : UInt8*, propertyid : Int32, propertyvalue : VARIANT*, weight : Float32) : HRESULT
    @lpVtbl.value.add_rule_transition.unsafe_as(Proc(ISpeechGrammarRuleState, ISpeechGrammarRule, UInt8*, Int32, VARIANT*, Float32, HRESULT)).call(destinationstate, rule, propertyname, propertyid, propertyvalue, weight)
  end
  def add_special_transition(destinationstate : ISpeechGrammarRuleState, type : SpeechSpecialTransitionType, propertyname : UInt8*, propertyid : Int32, propertyvalue : VARIANT*, weight : Float32) : HRESULT
    @lpVtbl.value.add_special_transition.unsafe_as(Proc(ISpeechGrammarRuleState, SpeechSpecialTransitionType, UInt8*, Int32, VARIANT*, Float32, HRESULT)).call(destinationstate, type, propertyname, propertyid, propertyvalue, weight)
  end
end
struct LibWin32::ISpeechGrammarRuleStateTransition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(type : SpeechGrammarRuleStateTransitionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(SpeechGrammarRuleStateTransitionType*, HRESULT)).call(type)
  end
  def get_text(text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(text)
  end
  def get_rule(rule : ISpeechGrammarRule*) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(ISpeechGrammarRule*, HRESULT)).call(rule)
  end
  def get_weight(weight : VARIANT*) : HRESULT
    @lpVtbl.value.get_weight.unsafe_as(Proc(VARIANT*, HRESULT)).call(weight)
  end
  def get_property_name(propertyname : UInt8**) : HRESULT
    @lpVtbl.value.get_property_name.unsafe_as(Proc(UInt8**, HRESULT)).call(propertyname)
  end
  def get_property_id(propertyid : Int32*) : HRESULT
    @lpVtbl.value.get_property_id.unsafe_as(Proc(Int32*, HRESULT)).call(propertyid)
  end
  def get_property_value(propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(propertyvalue)
  end
  def get_next_state(nextstate : ISpeechGrammarRuleState*) : HRESULT
    @lpVtbl.value.get_next_state.unsafe_as(Proc(ISpeechGrammarRuleState*, HRESULT)).call(nextstate)
  end
end
struct LibWin32::ISpeechGrammarRuleStateTransitions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, transition : ISpeechGrammarRuleStateTransition*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechGrammarRuleStateTransition*, HRESULT)).call(index, transition)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechTextSelectionInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_active_offset(activeoffset : Int32) : HRESULT
    @lpVtbl.value.put_active_offset.unsafe_as(Proc(Int32, HRESULT)).call(activeoffset)
  end
  def get_active_offset(activeoffset : Int32*) : HRESULT
    @lpVtbl.value.get_active_offset.unsafe_as(Proc(Int32*, HRESULT)).call(activeoffset)
  end
  def put_active_length(activelength : Int32) : HRESULT
    @lpVtbl.value.put_active_length.unsafe_as(Proc(Int32, HRESULT)).call(activelength)
  end
  def get_active_length(activelength : Int32*) : HRESULT
    @lpVtbl.value.get_active_length.unsafe_as(Proc(Int32*, HRESULT)).call(activelength)
  end
  def put_selection_offset(selectionoffset : Int32) : HRESULT
    @lpVtbl.value.put_selection_offset.unsafe_as(Proc(Int32, HRESULT)).call(selectionoffset)
  end
  def get_selection_offset(selectionoffset : Int32*) : HRESULT
    @lpVtbl.value.get_selection_offset.unsafe_as(Proc(Int32*, HRESULT)).call(selectionoffset)
  end
  def put_selection_length(selectionlength : Int32) : HRESULT
    @lpVtbl.value.put_selection_length.unsafe_as(Proc(Int32, HRESULT)).call(selectionlength)
  end
  def get_selection_length(selectionlength : Int32*) : HRESULT
    @lpVtbl.value.get_selection_length.unsafe_as(Proc(Int32*, HRESULT)).call(selectionlength)
  end
end
struct LibWin32::ISpeechRecoResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_reco_context(recocontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(recocontext)
  end
  def get_times(times : ISpeechRecoResultTimes*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(ISpeechRecoResultTimes*, HRESULT)).call(times)
  end
  def putref_audio_format(format : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_audio_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(format)
  end
  def get_audio_format(format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_audio_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(format)
  end
  def get_phrase_info(phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.get_phrase_info.unsafe_as(Proc(ISpeechPhraseInfo*, HRESULT)).call(phraseinfo)
  end
  def alternates(requestcount : Int32, startelement : Int32, elements : Int32, alternates : ISpeechPhraseAlternates*) : HRESULT
    @lpVtbl.value.alternates.unsafe_as(Proc(Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)).call(requestcount, startelement, elements, alternates)
  end
  def audio(startelement : Int32, elements : Int32, stream : ISpeechMemoryStream*) : HRESULT
    @lpVtbl.value.audio.unsafe_as(Proc(Int32, Int32, ISpeechMemoryStream*, HRESULT)).call(startelement, elements, stream)
  end
  def speak_audio(startelement : Int32, elements : Int32, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(startelement, elements, flags, streamnumber)
  end
  def save_to_memory(resultblock : VARIANT*) : HRESULT
    @lpVtbl.value.save_to_memory.unsafe_as(Proc(VARIANT*, HRESULT)).call(resultblock)
  end
  def discard_result_info(valuetypes : SpeechDiscardType) : HRESULT
    @lpVtbl.value.discard_result_info.unsafe_as(Proc(SpeechDiscardType, HRESULT)).call(valuetypes)
  end
end
struct LibWin32::ISpeechRecoResult2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_reco_context(recocontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(recocontext)
  end
  def get_times(times : ISpeechRecoResultTimes*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(ISpeechRecoResultTimes*, HRESULT)).call(times)
  end
  def putref_audio_format(format : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_audio_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(format)
  end
  def get_audio_format(format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_audio_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(format)
  end
  def get_phrase_info(phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.get_phrase_info.unsafe_as(Proc(ISpeechPhraseInfo*, HRESULT)).call(phraseinfo)
  end
  def alternates(requestcount : Int32, startelement : Int32, elements : Int32, alternates : ISpeechPhraseAlternates*) : HRESULT
    @lpVtbl.value.alternates.unsafe_as(Proc(Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)).call(requestcount, startelement, elements, alternates)
  end
  def audio(startelement : Int32, elements : Int32, stream : ISpeechMemoryStream*) : HRESULT
    @lpVtbl.value.audio.unsafe_as(Proc(Int32, Int32, ISpeechMemoryStream*, HRESULT)).call(startelement, elements, stream)
  end
  def speak_audio(startelement : Int32, elements : Int32, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(startelement, elements, flags, streamnumber)
  end
  def save_to_memory(resultblock : VARIANT*) : HRESULT
    @lpVtbl.value.save_to_memory.unsafe_as(Proc(VARIANT*, HRESULT)).call(resultblock)
  end
  def discard_result_info(valuetypes : SpeechDiscardType) : HRESULT
    @lpVtbl.value.discard_result_info.unsafe_as(Proc(SpeechDiscardType, HRESULT)).call(valuetypes)
  end
  def set_text_feedback(feedback : UInt8*, wassuccessful : Int16) : HRESULT
    @lpVtbl.value.set_text_feedback.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(feedback, wassuccessful)
  end
end
struct LibWin32::ISpeechRecoResultTimes
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_stream_time(time : VARIANT*) : HRESULT
    @lpVtbl.value.get_stream_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(time)
  end
  def get_length(length : VARIANT*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(VARIANT*, HRESULT)).call(length)
  end
  def get_tick_count(tickcount : Int32*) : HRESULT
    @lpVtbl.value.get_tick_count.unsafe_as(Proc(Int32*, HRESULT)).call(tickcount)
  end
  def get_offset_from_start(offsetfromstart : VARIANT*) : HRESULT
    @lpVtbl.value.get_offset_from_start.unsafe_as(Proc(VARIANT*, HRESULT)).call(offsetfromstart)
  end
end
struct LibWin32::ISpeechPhraseAlternate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_reco_result(recoresult : ISpeechRecoResult*) : HRESULT
    @lpVtbl.value.get_reco_result.unsafe_as(Proc(ISpeechRecoResult*, HRESULT)).call(recoresult)
  end
  def get_start_element_in_result(startelement : Int32*) : HRESULT
    @lpVtbl.value.get_start_element_in_result.unsafe_as(Proc(Int32*, HRESULT)).call(startelement)
  end
  def get_number_of_elements_in_result(numberofelements : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_elements_in_result.unsafe_as(Proc(Int32*, HRESULT)).call(numberofelements)
  end
  def get_phrase_info(phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.get_phrase_info.unsafe_as(Proc(ISpeechPhraseInfo*, HRESULT)).call(phraseinfo)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISpeechPhraseAlternates
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, phrasealternate : ISpeechPhraseAlternate*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechPhraseAlternate*, HRESULT)).call(index, phrasealternate)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechPhraseInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_language_id(languageid : Int32*) : HRESULT
    @lpVtbl.value.get_language_id.unsafe_as(Proc(Int32*, HRESULT)).call(languageid)
  end
  def get_grammar_id(grammarid : VARIANT*) : HRESULT
    @lpVtbl.value.get_grammar_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(grammarid)
  end
  def get_start_time(starttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_start_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(starttime)
  end
  def get_audio_stream_position(audiostreamposition : VARIANT*) : HRESULT
    @lpVtbl.value.get_audio_stream_position.unsafe_as(Proc(VARIANT*, HRESULT)).call(audiostreamposition)
  end
  def get_audio_size_bytes(paudiosizebytes : Int32*) : HRESULT
    @lpVtbl.value.get_audio_size_bytes.unsafe_as(Proc(Int32*, HRESULT)).call(paudiosizebytes)
  end
  def get_retained_size_bytes(retainedsizebytes : Int32*) : HRESULT
    @lpVtbl.value.get_retained_size_bytes.unsafe_as(Proc(Int32*, HRESULT)).call(retainedsizebytes)
  end
  def get_audio_size_time(audiosizetime : Int32*) : HRESULT
    @lpVtbl.value.get_audio_size_time.unsafe_as(Proc(Int32*, HRESULT)).call(audiosizetime)
  end
  def get_rule(rule : ISpeechPhraseRule*) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(ISpeechPhraseRule*, HRESULT)).call(rule)
  end
  def get_properties(properties : ISpeechPhraseProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(ISpeechPhraseProperties*, HRESULT)).call(properties)
  end
  def get_elements(elements : ISpeechPhraseElements*) : HRESULT
    @lpVtbl.value.get_elements.unsafe_as(Proc(ISpeechPhraseElements*, HRESULT)).call(elements)
  end
  def get_replacements(replacements : ISpeechPhraseReplacements*) : HRESULT
    @lpVtbl.value.get_replacements.unsafe_as(Proc(ISpeechPhraseReplacements*, HRESULT)).call(replacements)
  end
  def get_engine_id(engineidguid : UInt8**) : HRESULT
    @lpVtbl.value.get_engine_id.unsafe_as(Proc(UInt8**, HRESULT)).call(engineidguid)
  end
  def get_engine_private_data(privatedata : VARIANT*) : HRESULT
    @lpVtbl.value.get_engine_private_data.unsafe_as(Proc(VARIANT*, HRESULT)).call(privatedata)
  end
  def save_to_memory(phraseblock : VARIANT*) : HRESULT
    @lpVtbl.value.save_to_memory.unsafe_as(Proc(VARIANT*, HRESULT)).call(phraseblock)
  end
  def get_text(startelement : Int32, elements : Int32, usereplacements : Int16, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, Int32, Int16, UInt8**, HRESULT)).call(startelement, elements, usereplacements, text)
  end
  def get_display_attributes(startelement : Int32, elements : Int32, usereplacements : Int16, displayattributes : SpeechDisplayAttributes*) : HRESULT
    @lpVtbl.value.get_display_attributes.unsafe_as(Proc(Int32, Int32, Int16, SpeechDisplayAttributes*, HRESULT)).call(startelement, elements, usereplacements, displayattributes)
  end
end
struct LibWin32::ISpeechPhraseElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_audio_time_offset(audiotimeoffset : Int32*) : HRESULT
    @lpVtbl.value.get_audio_time_offset.unsafe_as(Proc(Int32*, HRESULT)).call(audiotimeoffset)
  end
  def get_audio_size_time(audiosizetime : Int32*) : HRESULT
    @lpVtbl.value.get_audio_size_time.unsafe_as(Proc(Int32*, HRESULT)).call(audiosizetime)
  end
  def get_audio_stream_offset(audiostreamoffset : Int32*) : HRESULT
    @lpVtbl.value.get_audio_stream_offset.unsafe_as(Proc(Int32*, HRESULT)).call(audiostreamoffset)
  end
  def get_audio_size_bytes(audiosizebytes : Int32*) : HRESULT
    @lpVtbl.value.get_audio_size_bytes.unsafe_as(Proc(Int32*, HRESULT)).call(audiosizebytes)
  end
  def get_retained_stream_offset(retainedstreamoffset : Int32*) : HRESULT
    @lpVtbl.value.get_retained_stream_offset.unsafe_as(Proc(Int32*, HRESULT)).call(retainedstreamoffset)
  end
  def get_retained_size_bytes(retainedsizebytes : Int32*) : HRESULT
    @lpVtbl.value.get_retained_size_bytes.unsafe_as(Proc(Int32*, HRESULT)).call(retainedsizebytes)
  end
  def get_display_text(displaytext : UInt8**) : HRESULT
    @lpVtbl.value.get_display_text.unsafe_as(Proc(UInt8**, HRESULT)).call(displaytext)
  end
  def get_lexical_form(lexicalform : UInt8**) : HRESULT
    @lpVtbl.value.get_lexical_form.unsafe_as(Proc(UInt8**, HRESULT)).call(lexicalform)
  end
  def get_pronunciation(pronunciation : VARIANT*) : HRESULT
    @lpVtbl.value.get_pronunciation.unsafe_as(Proc(VARIANT*, HRESULT)).call(pronunciation)
  end
  def get_display_attributes(displayattributes : SpeechDisplayAttributes*) : HRESULT
    @lpVtbl.value.get_display_attributes.unsafe_as(Proc(SpeechDisplayAttributes*, HRESULT)).call(displayattributes)
  end
  def get_required_confidence(requiredconfidence : SpeechEngineConfidence*) : HRESULT
    @lpVtbl.value.get_required_confidence.unsafe_as(Proc(SpeechEngineConfidence*, HRESULT)).call(requiredconfidence)
  end
  def get_actual_confidence(actualconfidence : SpeechEngineConfidence*) : HRESULT
    @lpVtbl.value.get_actual_confidence.unsafe_as(Proc(SpeechEngineConfidence*, HRESULT)).call(actualconfidence)
  end
  def get_engine_confidence(engineconfidence : Float32*) : HRESULT
    @lpVtbl.value.get_engine_confidence.unsafe_as(Proc(Float32*, HRESULT)).call(engineconfidence)
  end
end
struct LibWin32::ISpeechPhraseElements
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, element : ISpeechPhraseElement*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechPhraseElement*, HRESULT)).call(index, element)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechPhraseReplacement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_attributes(displayattributes : SpeechDisplayAttributes*) : HRESULT
    @lpVtbl.value.get_display_attributes.unsafe_as(Proc(SpeechDisplayAttributes*, HRESULT)).call(displayattributes)
  end
  def get_text(text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(text)
  end
  def get_first_element(firstelement : Int32*) : HRESULT
    @lpVtbl.value.get_first_element.unsafe_as(Proc(Int32*, HRESULT)).call(firstelement)
  end
  def get_number_of_elements(numberofelements : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_elements.unsafe_as(Proc(Int32*, HRESULT)).call(numberofelements)
  end
end
struct LibWin32::ISpeechPhraseReplacements
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, reps : ISpeechPhraseReplacement*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechPhraseReplacement*, HRESULT)).call(index, reps)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechPhraseProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_id(id : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(id)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def get_first_element(firstelement : Int32*) : HRESULT
    @lpVtbl.value.get_first_element.unsafe_as(Proc(Int32*, HRESULT)).call(firstelement)
  end
  def get_number_of_elements(numberofelements : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_elements.unsafe_as(Proc(Int32*, HRESULT)).call(numberofelements)
  end
  def get_engine_confidence(confidence : Float32*) : HRESULT
    @lpVtbl.value.get_engine_confidence.unsafe_as(Proc(Float32*, HRESULT)).call(confidence)
  end
  def get_confidence(confidence : SpeechEngineConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.unsafe_as(Proc(SpeechEngineConfidence*, HRESULT)).call(confidence)
  end
  def get_parent(parentproperty : ISpeechPhraseProperty*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(ISpeechPhraseProperty*, HRESULT)).call(parentproperty)
  end
  def get_children(children : ISpeechPhraseProperties*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(ISpeechPhraseProperties*, HRESULT)).call(children)
  end
end
struct LibWin32::ISpeechPhraseProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, property : ISpeechPhraseProperty*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechPhraseProperty*, HRESULT)).call(index, property)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechPhraseRule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_id(id : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(id)
  end
  def get_first_element(firstelement : Int32*) : HRESULT
    @lpVtbl.value.get_first_element.unsafe_as(Proc(Int32*, HRESULT)).call(firstelement)
  end
  def get_number_of_elements(numberofelements : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_elements.unsafe_as(Proc(Int32*, HRESULT)).call(numberofelements)
  end
  def get_parent(parent : ISpeechPhraseRule*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(ISpeechPhraseRule*, HRESULT)).call(parent)
  end
  def get_children(children : ISpeechPhraseRules*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(ISpeechPhraseRules*, HRESULT)).call(children)
  end
  def get_confidence(actualconfidence : SpeechEngineConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.unsafe_as(Proc(SpeechEngineConfidence*, HRESULT)).call(actualconfidence)
  end
  def get_engine_confidence(engineconfidence : Float32*) : HRESULT
    @lpVtbl.value.get_engine_confidence.unsafe_as(Proc(Float32*, HRESULT)).call(engineconfidence)
  end
end
struct LibWin32::ISpeechPhraseRules
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, rule : ISpeechPhraseRule*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechPhraseRule*, HRESULT)).call(index, rule)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechLexicon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_generation_id(generationid : Int32*) : HRESULT
    @lpVtbl.value.get_generation_id.unsafe_as(Proc(Int32*, HRESULT)).call(generationid)
  end
  def get_words(flags : SpeechLexiconType, generationid : Int32*, words : ISpeechLexiconWords*) : HRESULT
    @lpVtbl.value.get_words.unsafe_as(Proc(SpeechLexiconType, Int32*, ISpeechLexiconWords*, HRESULT)).call(flags, generationid, words)
  end
  def add_pronunciation(bstrword : UInt8*, langid : Int32, partofspeech : SpeechPartOfSpeech, bstrpronunciation : UInt8*) : HRESULT
    @lpVtbl.value.add_pronunciation.unsafe_as(Proc(UInt8*, Int32, SpeechPartOfSpeech, UInt8*, HRESULT)).call(bstrword, langid, partofspeech, bstrpronunciation)
  end
  def add_pronunciation_by_phone_ids(bstrword : UInt8*, langid : Int32, partofspeech : SpeechPartOfSpeech, phoneids : VARIANT*) : HRESULT
    @lpVtbl.value.add_pronunciation_by_phone_ids.unsafe_as(Proc(UInt8*, Int32, SpeechPartOfSpeech, VARIANT*, HRESULT)).call(bstrword, langid, partofspeech, phoneids)
  end
  def remove_pronunciation(bstrword : UInt8*, langid : Int32, partofspeech : SpeechPartOfSpeech, bstrpronunciation : UInt8*) : HRESULT
    @lpVtbl.value.remove_pronunciation.unsafe_as(Proc(UInt8*, Int32, SpeechPartOfSpeech, UInt8*, HRESULT)).call(bstrword, langid, partofspeech, bstrpronunciation)
  end
  def remove_pronunciation_by_phone_ids(bstrword : UInt8*, langid : Int32, partofspeech : SpeechPartOfSpeech, phoneids : VARIANT*) : HRESULT
    @lpVtbl.value.remove_pronunciation_by_phone_ids.unsafe_as(Proc(UInt8*, Int32, SpeechPartOfSpeech, VARIANT*, HRESULT)).call(bstrword, langid, partofspeech, phoneids)
  end
  def get_pronunciations(bstrword : UInt8*, langid : Int32, typeflags : SpeechLexiconType, pppronunciations : ISpeechLexiconPronunciations*) : HRESULT
    @lpVtbl.value.get_pronunciations.unsafe_as(Proc(UInt8*, Int32, SpeechLexiconType, ISpeechLexiconPronunciations*, HRESULT)).call(bstrword, langid, typeflags, pppronunciations)
  end
  def get_generation_change(generationid : Int32*, ppwords : ISpeechLexiconWords*) : HRESULT
    @lpVtbl.value.get_generation_change.unsafe_as(Proc(Int32*, ISpeechLexiconWords*, HRESULT)).call(generationid, ppwords)
  end
end
struct LibWin32::ISpeechLexiconWords
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, word : ISpeechLexiconWord*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechLexiconWord*, HRESULT)).call(index, word)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechLexiconWord
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_lang_id(langid : Int32*) : HRESULT
    @lpVtbl.value.get_lang_id.unsafe_as(Proc(Int32*, HRESULT)).call(langid)
  end
  def get_type(wordtype : SpeechWordType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(SpeechWordType*, HRESULT)).call(wordtype)
  end
  def get_word(word : UInt8**) : HRESULT
    @lpVtbl.value.get_word.unsafe_as(Proc(UInt8**, HRESULT)).call(word)
  end
  def get_pronunciations(pronunciations : ISpeechLexiconPronunciations*) : HRESULT
    @lpVtbl.value.get_pronunciations.unsafe_as(Proc(ISpeechLexiconPronunciations*, HRESULT)).call(pronunciations)
  end
end
struct LibWin32::ISpeechLexiconPronunciations
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(index : Int32, pronunciation : ISpeechLexiconPronunciation*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ISpeechLexiconPronunciation*, HRESULT)).call(index, pronunciation)
  end
  def get__new_enum(enumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enumvariant)
  end
end
struct LibWin32::ISpeechLexiconPronunciation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(lexicontype : SpeechLexiconType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(SpeechLexiconType*, HRESULT)).call(lexicontype)
  end
  def get_lang_id(langid : Int32*) : HRESULT
    @lpVtbl.value.get_lang_id.unsafe_as(Proc(Int32*, HRESULT)).call(langid)
  end
  def get_part_of_speech(partofspeech : SpeechPartOfSpeech*) : HRESULT
    @lpVtbl.value.get_part_of_speech.unsafe_as(Proc(SpeechPartOfSpeech*, HRESULT)).call(partofspeech)
  end
  def get_phone_ids(phoneids : VARIANT*) : HRESULT
    @lpVtbl.value.get_phone_ids.unsafe_as(Proc(VARIANT*, HRESULT)).call(phoneids)
  end
  def get_symbolic(symbolic : UInt8**) : HRESULT
    @lpVtbl.value.get_symbolic.unsafe_as(Proc(UInt8**, HRESULT)).call(symbolic)
  end
end
struct LibWin32::ISpeechXMLRecoResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_reco_context(recocontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(recocontext)
  end
  def get_times(times : ISpeechRecoResultTimes*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(ISpeechRecoResultTimes*, HRESULT)).call(times)
  end
  def putref_audio_format(format : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_audio_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(format)
  end
  def get_audio_format(format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_audio_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(format)
  end
  def get_phrase_info(phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.get_phrase_info.unsafe_as(Proc(ISpeechPhraseInfo*, HRESULT)).call(phraseinfo)
  end
  def alternates(requestcount : Int32, startelement : Int32, elements : Int32, alternates : ISpeechPhraseAlternates*) : HRESULT
    @lpVtbl.value.alternates.unsafe_as(Proc(Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)).call(requestcount, startelement, elements, alternates)
  end
  def audio(startelement : Int32, elements : Int32, stream : ISpeechMemoryStream*) : HRESULT
    @lpVtbl.value.audio.unsafe_as(Proc(Int32, Int32, ISpeechMemoryStream*, HRESULT)).call(startelement, elements, stream)
  end
  def speak_audio(startelement : Int32, elements : Int32, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(startelement, elements, flags, streamnumber)
  end
  def save_to_memory(resultblock : VARIANT*) : HRESULT
    @lpVtbl.value.save_to_memory.unsafe_as(Proc(VARIANT*, HRESULT)).call(resultblock)
  end
  def discard_result_info(valuetypes : SpeechDiscardType) : HRESULT
    @lpVtbl.value.discard_result_info.unsafe_as(Proc(SpeechDiscardType, HRESULT)).call(valuetypes)
  end
  def get_xml_result(options : SPXMLRESULTOPTIONS, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_result.unsafe_as(Proc(SPXMLRESULTOPTIONS, UInt8**, HRESULT)).call(options, presult)
  end
  def get_xml_error_info(linenumber : Int32*, scriptline : UInt8**, source : UInt8**, description : UInt8**, resultcode : Int32*, iserror : Int16*) : HRESULT
    @lpVtbl.value.get_xml_error_info.unsafe_as(Proc(Int32*, UInt8**, UInt8**, UInt8**, Int32*, Int16*, HRESULT)).call(linenumber, scriptline, source, description, resultcode, iserror)
  end
end
struct LibWin32::ISpeechRecoResultDispatch
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_reco_context(recocontext : ISpeechRecoContext*) : HRESULT
    @lpVtbl.value.get_reco_context.unsafe_as(Proc(ISpeechRecoContext*, HRESULT)).call(recocontext)
  end
  def get_times(times : ISpeechRecoResultTimes*) : HRESULT
    @lpVtbl.value.get_times.unsafe_as(Proc(ISpeechRecoResultTimes*, HRESULT)).call(times)
  end
  def putref_audio_format(format : ISpeechAudioFormat) : HRESULT
    @lpVtbl.value.putref_audio_format.unsafe_as(Proc(ISpeechAudioFormat, HRESULT)).call(format)
  end
  def get_audio_format(format : ISpeechAudioFormat*) : HRESULT
    @lpVtbl.value.get_audio_format.unsafe_as(Proc(ISpeechAudioFormat*, HRESULT)).call(format)
  end
  def get_phrase_info(phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.get_phrase_info.unsafe_as(Proc(ISpeechPhraseInfo*, HRESULT)).call(phraseinfo)
  end
  def alternates(requestcount : Int32, startelement : Int32, elements : Int32, alternates : ISpeechPhraseAlternates*) : HRESULT
    @lpVtbl.value.alternates.unsafe_as(Proc(Int32, Int32, Int32, ISpeechPhraseAlternates*, HRESULT)).call(requestcount, startelement, elements, alternates)
  end
  def audio(startelement : Int32, elements : Int32, stream : ISpeechMemoryStream*) : HRESULT
    @lpVtbl.value.audio.unsafe_as(Proc(Int32, Int32, ISpeechMemoryStream*, HRESULT)).call(startelement, elements, stream)
  end
  def speak_audio(startelement : Int32, elements : Int32, flags : SpeechVoiceSpeakFlags, streamnumber : Int32*) : HRESULT
    @lpVtbl.value.speak_audio.unsafe_as(Proc(Int32, Int32, SpeechVoiceSpeakFlags, Int32*, HRESULT)).call(startelement, elements, flags, streamnumber)
  end
  def save_to_memory(resultblock : VARIANT*) : HRESULT
    @lpVtbl.value.save_to_memory.unsafe_as(Proc(VARIANT*, HRESULT)).call(resultblock)
  end
  def discard_result_info(valuetypes : SpeechDiscardType) : HRESULT
    @lpVtbl.value.discard_result_info.unsafe_as(Proc(SpeechDiscardType, HRESULT)).call(valuetypes)
  end
  def get_xml_result(options : SPXMLRESULTOPTIONS, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_result.unsafe_as(Proc(SPXMLRESULTOPTIONS, UInt8**, HRESULT)).call(options, presult)
  end
  def get_xml_error_info(linenumber : Int32*, scriptline : UInt8**, source : UInt8**, description : UInt8**, resultcode : HRESULT*, iserror : Int16*) : HRESULT
    @lpVtbl.value.get_xml_error_info.unsafe_as(Proc(Int32*, UInt8**, UInt8**, UInt8**, HRESULT*, Int16*, HRESULT)).call(linenumber, scriptline, source, description, resultcode, iserror)
  end
  def set_text_feedback(feedback : UInt8*, wassuccessful : Int16) : HRESULT
    @lpVtbl.value.set_text_feedback.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(feedback, wassuccessful)
  end
end
struct LibWin32::ISpeechPhraseInfoBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def restore_phrase_from_memory(phraseinmemory : VARIANT*, phraseinfo : ISpeechPhraseInfo*) : HRESULT
    @lpVtbl.value.restore_phrase_from_memory.unsafe_as(Proc(VARIANT*, ISpeechPhraseInfo*, HRESULT)).call(phraseinmemory, phraseinfo)
  end
end
struct LibWin32::ISpeechPhoneConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_language_id(languageid : Int32*) : HRESULT
    @lpVtbl.value.get_language_id.unsafe_as(Proc(Int32*, HRESULT)).call(languageid)
  end
  def put_language_id(languageid : Int32) : HRESULT
    @lpVtbl.value.put_language_id.unsafe_as(Proc(Int32, HRESULT)).call(languageid)
  end
  def phone_to_id(phonemes : UInt8*, idarray : VARIANT*) : HRESULT
    @lpVtbl.value.phone_to_id.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(phonemes, idarray)
  end
  def id_to_phone(idarray : VARIANT, phonemes : UInt8**) : HRESULT
    @lpVtbl.value.id_to_phone.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(idarray, phonemes)
  end
end
