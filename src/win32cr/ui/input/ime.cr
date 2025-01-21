require "./../../foundation.cr"
require "./../../graphics/gdi.cr"
require "./../../globalization.cr"
require "./../../system/com.cr"
require "./../windows_and_messaging.cr"
require "./../text_services.cr"

module Win32cr::UI::Input::Ime
  alias IMCENUMPROC = Proc(Win32cr::Globalization::HIMC, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)*

  alias REGISTERWORDENUMPROCA = Proc(Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Void*, Int32)*

  alias REGISTERWORDENUMPROCW = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Int32)*

  alias PFNLOG = Proc(Win32cr::UI::Input::Ime::IMEDP*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL)*

  alias Fpcreateifecommoninstancetype = Proc(Void**, Win32cr::Foundation::HRESULT)*

  alias Fpcreateifelanguageinstancetype = Proc(LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)*

  alias Fpcreateifedictionaryinstancetype = Proc(Void**, Win32cr::Foundation::HRESULT)*

  Szimejapan = "MSIME.Japan"
  Szimekorea = "MSIME.Korea"
  Szimechina = "MSIME.China"
  Szimetaiwan = "MSIME.Taiwan"
  CLSID_VERSION_DEPENDENT_MSIME_JAPANESE = "6a91029e-aa49-471b-aee7-7d332785660d"
  IFEC_S_ALREADY_DEFAULT = 291840_i32
  FELANG_REQ_CONV = 65536_u32
  FELANG_REQ_RECONV = 131072_u32
  FELANG_REQ_REV = 196608_u32
  FELANG_CMODE_MONORUBY = 2_u32
  FELANG_CMODE_NOPRUNING = 4_u32
  FELANG_CMODE_KATAKANAOUT = 8_u32
  FELANG_CMODE_HIRAGANAOUT = 0_u32
  FELANG_CMODE_HALFWIDTHOUT = 16_u32
  FELANG_CMODE_FULLWIDTHOUT = 32_u32
  FELANG_CMODE_BOPOMOFO = 64_u32
  FELANG_CMODE_HANGUL = 128_u32
  FELANG_CMODE_PINYIN = 256_u32
  FELANG_CMODE_PRECONV = 512_u32
  FELANG_CMODE_RADICAL = 1024_u32
  FELANG_CMODE_UNKNOWNREADING = 2048_u32
  FELANG_CMODE_MERGECAND = 4096_u32
  FELANG_CMODE_ROMAN = 8192_u32
  FELANG_CMODE_BESTFIRST = 16384_u32
  FELANG_CMODE_USENOREVWORDS = 32768_u32
  FELANG_CMODE_NONE = 16777216_u32
  FELANG_CMODE_PLAURALCLAUSE = 33554432_u32
  FELANG_CMODE_SINGLECONVERT = 67108864_u32
  FELANG_CMODE_AUTOMATIC = 134217728_u32
  FELANG_CMODE_PHRASEPREDICT = 268435456_u32
  FELANG_CMODE_CONVERSATION = 536870912_u32
  FELANG_CMODE_NAME = 268435456_u32
  FELANG_CMODE_NOINVISIBLECHAR = 1073741824_u32
  E_NOCAND = 48_u32
  E_NOTENOUGH_BUFFER = 49_u32
  E_NOTENOUGH_WDD = 50_u32
  E_LARGEINPUT = 51_u32
  FELANG_CLMN_WBREAK = 1_u32
  FELANG_CLMN_NOWBREAK = 2_u32
  FELANG_CLMN_PBREAK = 4_u32
  FELANG_CLMN_NOPBREAK = 8_u32
  FELANG_CLMN_FIXR = 16_u32
  FELANG_CLMN_FIXD = 32_u32
  FELANG_INVALD_PO = 65535_u32
  IFED_POS_NONE = 0_u32
  IFED_POS_NOUN = 1_u32
  IFED_POS_VERB = 2_u32
  IFED_POS_ADJECTIVE = 4_u32
  IFED_POS_ADJECTIVE_VERB = 8_u32
  IFED_POS_ADVERB = 16_u32
  IFED_POS_ADNOUN = 32_u32
  IFED_POS_CONJUNCTION = 64_u32
  IFED_POS_INTERJECTION = 128_u32
  IFED_POS_INDEPENDENT = 255_u32
  IFED_POS_INFLECTIONALSUFFIX = 256_u32
  IFED_POS_PREFIX = 512_u32
  IFED_POS_SUFFIX = 1024_u32
  IFED_POS_AFFIX = 1536_u32
  IFED_POS_TANKANJI = 2048_u32
  IFED_POS_IDIOMS = 4096_u32
  IFED_POS_SYMBOLS = 8192_u32
  IFED_POS_PARTICLE = 16384_u32
  IFED_POS_AUXILIARY_VERB = 32768_u32
  IFED_POS_SUB_VERB = 65536_u32
  IFED_POS_DEPENDENT = 114688_u32
  IFED_POS_ALL = 131071_u32
  IFED_SELECT_NONE = 0_u32
  IFED_SELECT_READING = 1_u32
  IFED_SELECT_DISPLAY = 2_u32
  IFED_SELECT_POS = 4_u32
  IFED_SELECT_COMMENT = 8_u32
  IFED_SELECT_ALL = 15_u32
  IFED_REG_NONE = 0_u32
  IFED_REG_USER = 1_u32
  IFED_REG_AUTO = 2_u32
  IFED_REG_GRAMMAR = 4_u32
  IFED_REG_ALL = 7_u32
  IFED_TYPE_NONE = 0_u32
  IFED_TYPE_GENERAL = 1_u32
  IFED_TYPE_NAMEPLACE = 2_u32
  IFED_TYPE_SPEECH = 4_u32
  IFED_TYPE_REVERSE = 8_u32
  IFED_TYPE_ENGLISH = 16_u32
  IFED_TYPE_ALL = 31_u32
  IFED_S_MORE_ENTRIES = 291328_i32
  IFED_S_EMPTY_DICTIONARY = 291329_i32
  IFED_S_WORD_EXISTS = 291330_i32
  IFED_S_COMMENT_CHANGED = 291331_i32
  IFED_E_NOT_FOUND = -2147192064_i32
  IFED_E_INVALID_FORMAT = -2147192063_i32
  IFED_E_OPEN_FAILED = -2147192062_i32
  IFED_E_WRITE_FAILED = -2147192061_i32
  IFED_E_NO_ENTRY = -2147192060_i32
  IFED_E_REGISTER_FAILED = -2147192059_i32
  IFED_E_NOT_USER_DIC = -2147192058_i32
  IFED_E_NOT_SUPPORTED = -2147192057_i32
  IFED_E_USER_COMMENT = -2147192056_i32
  IFED_E_REGISTER_ILLEGAL_POS = -2147192055_i32
  IFED_E_REGISTER_IMPROPER_WORD = -2147192054_i32
  IFED_E_REGISTER_DISCONNECTED = -2147192053_i32
  Cbcommentmax = 256_u32
  Wchprivate1 = 57344_u32
  POS_UNDEFINED = 0_u32
  JPOS_UNDEFINED = 0_u32
  JPOS_MEISHI_FUTSU = 100_u32
  JPOS_MEISHI_SAHEN = 101_u32
  JPOS_MEISHI_ZAHEN = 102_u32
  JPOS_MEISHI_KEIYOUDOUSHI = 103_u32
  JPOS_HUKUSIMEISHI = 104_u32
  JPOS_MEISA_KEIDOU = 105_u32
  JPOS_JINMEI = 106_u32
  JPOS_JINMEI_SEI = 107_u32
  JPOS_JINMEI_MEI = 108_u32
  JPOS_CHIMEI = 109_u32
  JPOS_CHIMEI_KUNI = 110_u32
  JPOS_CHIMEI_KEN = 111_u32
  JPOS_CHIMEI_GUN = 112_u32
  JPOS_CHIMEI_KU = 113_u32
  JPOS_CHIMEI_SHI = 114_u32
  JPOS_CHIMEI_MACHI = 115_u32
  JPOS_CHIMEI_MURA = 116_u32
  JPOS_CHIMEI_EKI = 117_u32
  JPOS_SONOTA = 118_u32
  JPOS_SHAMEI = 119_u32
  JPOS_SOSHIKI = 120_u32
  JPOS_KENCHIKU = 121_u32
  JPOS_BUPPIN = 122_u32
  JPOS_DAIMEISHI = 123_u32
  JPOS_DAIMEISHI_NINSHOU = 124_u32
  JPOS_DAIMEISHI_SHIJI = 125_u32
  JPOS_KAZU = 126_u32
  JPOS_KAZU_SURYOU = 127_u32
  JPOS_KAZU_SUSHI = 128_u32
  JPOS_5DAN_AWA = 200_u32
  JPOS_5DAN_KA = 201_u32
  JPOS_5DAN_GA = 202_u32
  JPOS_5DAN_SA = 203_u32
  JPOS_5DAN_TA = 204_u32
  JPOS_5DAN_NA = 205_u32
  JPOS_5DAN_BA = 206_u32
  JPOS_5DAN_MA = 207_u32
  JPOS_5DAN_RA = 208_u32
  JPOS_5DAN_AWAUON = 209_u32
  JPOS_5DAN_KASOKUON = 210_u32
  JPOS_5DAN_RAHEN = 211_u32
  JPOS_4DAN_HA = 212_u32
  JPOS_1DAN = 213_u32
  JPOS_TOKUSHU_KAHEN = 214_u32
  JPOS_TOKUSHU_SAHENSURU = 215_u32
  JPOS_TOKUSHU_SAHEN = 216_u32
  JPOS_TOKUSHU_ZAHEN = 217_u32
  JPOS_TOKUSHU_NAHEN = 218_u32
  JPOS_KURU_KI = 219_u32
  JPOS_KURU_KITA = 220_u32
  JPOS_KURU_KITARA = 221_u32
  JPOS_KURU_KITARI = 222_u32
  JPOS_KURU_KITAROU = 223_u32
  JPOS_KURU_KITE = 224_u32
  JPOS_KURU_KUREBA = 225_u32
  JPOS_KURU_KO = 226_u32
  JPOS_KURU_KOI = 227_u32
  JPOS_KURU_KOYOU = 228_u32
  JPOS_SURU_SA = 229_u32
  JPOS_SURU_SI = 230_u32
  JPOS_SURU_SITA = 231_u32
  JPOS_SURU_SITARA = 232_u32
  JPOS_SURU_SIATRI = 233_u32
  JPOS_SURU_SITAROU = 234_u32
  JPOS_SURU_SITE = 235_u32
  JPOS_SURU_SIYOU = 236_u32
  JPOS_SURU_SUREBA = 237_u32
  JPOS_SURU_SE = 238_u32
  JPOS_SURU_SEYO = 239_u32
  JPOS_KEIYOU = 300_u32
  JPOS_KEIYOU_GARU = 301_u32
  JPOS_KEIYOU_GE = 302_u32
  JPOS_KEIYOU_ME = 303_u32
  JPOS_KEIYOU_YUU = 304_u32
  JPOS_KEIYOU_U = 305_u32
  JPOS_KEIDOU = 400_u32
  JPOS_KEIDOU_NO = 401_u32
  JPOS_KEIDOU_TARU = 402_u32
  JPOS_KEIDOU_GARU = 403_u32
  JPOS_FUKUSHI = 500_u32
  JPOS_FUKUSHI_SAHEN = 501_u32
  JPOS_FUKUSHI_NI = 502_u32
  JPOS_FUKUSHI_NANO = 503_u32
  JPOS_FUKUSHI_DA = 504_u32
  JPOS_FUKUSHI_TO = 505_u32
  JPOS_FUKUSHI_TOSURU = 506_u32
  JPOS_RENTAISHI = 600_u32
  JPOS_RENTAISHI_SHIJI = 601_u32
  JPOS_SETSUZOKUSHI = 650_u32
  JPOS_KANDOUSHI = 670_u32
  JPOS_SETTOU = 700_u32
  JPOS_SETTOU_KAKU = 701_u32
  JPOS_SETTOU_SAI = 702_u32
  JPOS_SETTOU_FUKU = 703_u32
  JPOS_SETTOU_MI = 704_u32
  JPOS_SETTOU_DAISHOU = 705_u32
  JPOS_SETTOU_KOUTEI = 706_u32
  JPOS_SETTOU_CHOUTAN = 707_u32
  JPOS_SETTOU_SHINKYU = 708_u32
  JPOS_SETTOU_JINMEI = 709_u32
  JPOS_SETTOU_CHIMEI = 710_u32
  JPOS_SETTOU_SONOTA = 711_u32
  JPOS_SETTOU_JOSUSHI = 712_u32
  JPOS_SETTOU_TEINEI_O = 713_u32
  JPOS_SETTOU_TEINEI_GO = 714_u32
  JPOS_SETTOU_TEINEI_ON = 715_u32
  JPOS_SETSUBI = 800_u32
  JPOS_SETSUBI_TEKI = 801_u32
  JPOS_SETSUBI_SEI = 802_u32
  JPOS_SETSUBI_KA = 803_u32
  JPOS_SETSUBI_CHU = 804_u32
  JPOS_SETSUBI_FU = 805_u32
  JPOS_SETSUBI_RYU = 806_u32
  JPOS_SETSUBI_YOU = 807_u32
  JPOS_SETSUBI_KATA = 808_u32
  JPOS_SETSUBI_MEISHIRENDAKU = 809_u32
  JPOS_SETSUBI_JINMEI = 810_u32
  JPOS_SETSUBI_CHIMEI = 811_u32
  JPOS_SETSUBI_KUNI = 812_u32
  JPOS_SETSUBI_KEN = 813_u32
  JPOS_SETSUBI_GUN = 814_u32
  JPOS_SETSUBI_KU = 815_u32
  JPOS_SETSUBI_SHI = 816_u32
  JPOS_SETSUBI_MACHI = 817_u32
  JPOS_SETSUBI_CHOU = 818_u32
  JPOS_SETSUBI_MURA = 819_u32
  JPOS_SETSUBI_SON = 820_u32
  JPOS_SETSUBI_EKI = 821_u32
  JPOS_SETSUBI_SONOTA = 822_u32
  JPOS_SETSUBI_SHAMEI = 823_u32
  JPOS_SETSUBI_SOSHIKI = 824_u32
  JPOS_SETSUBI_KENCHIKU = 825_u32
  JPOS_RENYOU_SETSUBI = 826_u32
  JPOS_SETSUBI_JOSUSHI = 827_u32
  JPOS_SETSUBI_JOSUSHIPLUS = 828_u32
  JPOS_SETSUBI_JIKAN = 829_u32
  JPOS_SETSUBI_JIKANPLUS = 830_u32
  JPOS_SETSUBI_TEINEI = 831_u32
  JPOS_SETSUBI_SAN = 832_u32
  JPOS_SETSUBI_KUN = 833_u32
  JPOS_SETSUBI_SAMA = 834_u32
  JPOS_SETSUBI_DONO = 835_u32
  JPOS_SETSUBI_FUKUSU = 836_u32
  JPOS_SETSUBI_TACHI = 837_u32
  JPOS_SETSUBI_RA = 838_u32
  JPOS_TANKANJI = 900_u32
  JPOS_TANKANJI_KAO = 901_u32
  JPOS_KANYOUKU = 902_u32
  JPOS_DOKURITSUGO = 903_u32
  JPOS_FUTEIGO = 904_u32
  JPOS_KIGOU = 905_u32
  JPOS_EIJI = 906_u32
  JPOS_KUTEN = 907_u32
  JPOS_TOUTEN = 908_u32
  JPOS_KANJI = 909_u32
  JPOS_OPENBRACE = 910_u32
  JPOS_CLOSEBRACE = 911_u32
  JPOS_YOKUSEI = 912_u32
  JPOS_TANSHUKU = 913_u32
  VERSION_ID_JAPANESE = 16777216_u32
  VERSION_ID_KOREAN = 33554432_u32
  VERSION_ID_CHINESE_TRADITIONAL = 67108864_u32
  VERSION_ID_CHINESE_SIMPLIFIED = 134217728_u32
  RWM_SERVICE = "MSIMEService"
  FID_MSIME_VERSION = 0_u32
  RWM_UIREADY = "MSIMEUIReady"
  RWM_MOUSE = "MSIMEMouseOperation"
  VERSION_MOUSE_OPERATION = 1_u32
  IMEMOUSERET_NOTHANDLED = -1_i32
  IMEMOUSE_VERSION = 255_u32
  IMEMOUSE_NONE = 0_u32
  IMEMOUSE_LDOWN = 1_u32
  IMEMOUSE_RDOWN = 2_u32
  IMEMOUSE_MDOWN = 4_u32
  IMEMOUSE_WUP = 16_u32
  IMEMOUSE_WDOWN = 32_u32
  RWM_RECONVERT = "MSIMEReconvert"
  FID_RECONVERT_VERSION = 268435456_u32
  VERSION_RECONVERSION = 1_u32
  RWM_RECONVERTREQUEST = "MSIMEReconvertRequest"
  VERSION_DOCUMENTFEED = 1_u32
  RWM_DOCUMENTFEED = "MSIMEDocumentFeed"
  VERSION_QUERYPOSITION = 1_u32
  RWM_QUERYPOSITION = "MSIMEQueryPosition"
  RWM_MODEBIAS = "MSIMEModeBias"
  VERSION_MODEBIAS = 1_u32
  MODEBIAS_GETVERSION = 0_u32
  MODEBIAS_SETVALUE = 1_u32
  MODEBIAS_GETVALUE = 2_u32
  MODEBIASMODE_DEFAULT = 0_u32
  MODEBIASMODE_FILENAME = 1_u32
  MODEBIASMODE_READING = 2_u32
  MODEBIASMODE_DIGIT = 4_u32
  RWM_SHOWIMEPAD = "MSIMEShowImePad"
  SHOWIMEPAD_DEFAULT = 0_u32
  SHOWIMEPAD_CATEGORY = 1_u32
  SHOWIMEPAD_GUID = 2_u32
  RWM_KEYMAP = "MSIMEKeyMap"
  RWM_CHGKEYMAP = "MSIMEChangeKeyMap"
  RWM_NTFYKEYMAP = "MSIMENotifyKeyMap"
  FID_MSIME_KMS_VERSION = 1_u32
  FID_MSIME_KMS_INIT = 2_u32
  FID_MSIME_KMS_TERM = 3_u32
  FID_MSIME_KMS_DEL_KEYLIST = 4_u32
  FID_MSIME_KMS_NOTIFY = 5_u32
  FID_MSIME_KMS_GETMAP = 6_u32
  FID_MSIME_KMS_INVOKE = 7_u32
  FID_MSIME_KMS_SETMAP = 8_u32
  FID_MSIME_KMS_FUNCDESC = 9_u32
  FID_MSIME_KMS_GETMAPSEAMLESS = 10_u32
  FID_MSIME_KMS_GETMAPFAST = 11_u32
  IMEKMS_NOCOMPOSITION = 0_u32
  IMEKMS_COMPOSITION = 1_u32
  IMEKMS_SELECTION = 2_u32
  IMEKMS_IMEOFF = 3_u32
  IMEKMS_2NDLEVEL = 4_u32
  IMEKMS_INPTGL = 5_u32
  IMEKMS_CANDIDATE = 6_u32
  IMEKMS_TYPECAND = 7_u32
  RWM_RECONVERTOPTIONS = "MSIMEReconvertOptions"
  RECONVOPT_NONE = 0_u32
  RECONVOPT_USECANCELNOTIFY = 1_u32
  GCSEX_CANCELRECONVERT = 268435456_u32
  STYLE_DESCRIPTION_SIZE = 32_u32
  IMEMENUITEM_STRING_SIZE = 80_u32
  IMC_GETCANDIDATEPOS = 7_u32
  IMC_SETCANDIDATEPOS = 8_u32
  IMC_GETCOMPOSITIONFONT = 9_u32
  IMC_SETCOMPOSITIONFONT = 10_u32
  IMC_GETCOMPOSITIONWINDOW = 11_u32
  IMC_SETCOMPOSITIONWINDOW = 12_u32
  IMC_GETSTATUSWINDOWPOS = 15_u32
  IMC_SETSTATUSWINDOWPOS = 16_u32
  IMC_CLOSESTATUSWINDOW = 33_u32
  IMC_OPENSTATUSWINDOW = 34_u32
  NI_FINALIZECONVERSIONRESULT = 20_u32
  ISC_SHOWUICANDIDATEWINDOW = 1_u32
  ISC_SHOWUICOMPOSITIONWINDOW = 2147483648_u32
  ISC_SHOWUIGUIDELINE = 1073741824_u32
  ISC_SHOWUIALLCANDIDATEWINDOW = 15_u32
  ISC_SHOWUIALL = 3221225487_u32
  MOD_LEFT = 32768_u32
  MOD_RIGHT = 16384_u32
  MOD_ON_KEYUP = 2048_u32
  MOD_IGNORE_ALL_MODIFIER = 1024_u32
  IME_CHOTKEY_IME_NONIME_TOGGLE = 16_u32
  IME_CHOTKEY_SHAPE_TOGGLE = 17_u32
  IME_CHOTKEY_SYMBOL_TOGGLE = 18_u32
  IME_JHOTKEY_CLOSE_OPEN = 48_u32
  IME_KHOTKEY_SHAPE_TOGGLE = 80_u32
  IME_KHOTKEY_HANJACONVERT = 81_u32
  IME_KHOTKEY_ENGLISH = 82_u32
  IME_THOTKEY_IME_NONIME_TOGGLE = 112_u32
  IME_THOTKEY_SHAPE_TOGGLE = 113_u32
  IME_THOTKEY_SYMBOL_TOGGLE = 114_u32
  IME_HOTKEY_DSWITCH_FIRST = 256_u32
  IME_HOTKEY_DSWITCH_LAST = 287_u32
  IME_HOTKEY_PRIVATE_FIRST = 512_u32
  IME_ITHOTKEY_RESEND_RESULTSTR = 512_u32
  IME_ITHOTKEY_PREVIOUS_COMPOSITION = 513_u32
  IME_ITHOTKEY_UISTYLE_TOGGLE = 514_u32
  IME_ITHOTKEY_RECONVERTSTRING = 515_u32
  IME_HOTKEY_PRIVATE_LAST = 543_u32
  GCS_COMPREADSTR = 1_u32
  GCS_COMPREADATTR = 2_u32
  GCS_COMPREADCLAUSE = 4_u32
  GCS_COMPSTR = 8_u32
  GCS_COMPATTR = 16_u32
  GCS_COMPCLAUSE = 32_u32
  GCS_CURSORPOS = 128_u32
  GCS_DELTASTART = 256_u32
  GCS_RESULTREADSTR = 512_u32
  GCS_RESULTREADCLAUSE = 1024_u32
  GCS_RESULTSTR = 2048_u32
  GCS_RESULTCLAUSE = 4096_u32
  CS_INSERTCHAR = 8192_u32
  CS_NOMOVECARET = 16384_u32
  IMEVER_0310 = 196618_u32
  IMEVER_0400 = 262144_u32
  IME_PROP_AT_CARET = 65536_u32
  IME_PROP_SPECIAL_UI = 131072_u32
  IME_PROP_CANDLIST_START_FROM_1 = 262144_u32
  IME_PROP_UNICODE = 524288_u32
  IME_PROP_COMPLETE_ON_UNSELECT = 1048576_u32
  UI_CAP_2700 = 1_u32
  UI_CAP_ROT90 = 2_u32
  UI_CAP_ROTANY = 4_u32
  SCS_CAP_COMPSTR = 1_u32
  SCS_CAP_MAKEREAD = 2_u32
  SCS_CAP_SETRECONVERTSTRING = 4_u32
  SELECT_CAP_CONVERSION = 1_u32
  SELECT_CAP_SENTENCE = 2_u32
  GL_LEVEL_NOGUIDELINE = 0_u32
  GL_LEVEL_FATAL = 1_u32
  GL_LEVEL_ERROR = 2_u32
  GL_LEVEL_WARNING = 3_u32
  GL_LEVEL_INFORMATION = 4_u32
  GL_ID_UNKNOWN = 0_u32
  GL_ID_NOMODULE = 1_u32
  GL_ID_NODICTIONARY = 16_u32
  GL_ID_CANNOTSAVE = 17_u32
  GL_ID_NOCONVERT = 32_u32
  GL_ID_TYPINGERROR = 33_u32
  GL_ID_TOOMANYSTROKE = 34_u32
  GL_ID_READINGCONFLICT = 35_u32
  GL_ID_INPUTREADING = 36_u32
  GL_ID_INPUTRADICAL = 37_u32
  GL_ID_INPUTCODE = 38_u32
  GL_ID_INPUTSYMBOL = 39_u32
  GL_ID_CHOOSECANDIDATE = 40_u32
  GL_ID_REVERSECONVERSION = 41_u32
  GL_ID_PRIVATE_FIRST = 32768_u32
  GL_ID_PRIVATE_LAST = 65535_u32
  ATTR_INPUT = 0_u32
  ATTR_TARGET_CONVERTED = 1_u32
  ATTR_CONVERTED = 2_u32
  ATTR_TARGET_NOTCONVERTED = 3_u32
  ATTR_INPUT_ERROR = 4_u32
  ATTR_FIXEDCONVERTED = 5_u32
  CFS_DEFAULT = 0_u32
  CFS_RECT = 1_u32
  CFS_POINT = 2_u32
  CFS_FORCE_POSITION = 32_u32
  CFS_CANDIDATEPOS = 64_u32
  CFS_EXCLUDE = 128_u32
  IME_CMODE_SOFTKBD = 128_u32
  IME_CMODE_NOCONVERSION = 256_u32
  IME_CMODE_EUDC = 512_u32
  IME_CMODE_SYMBOL = 1024_u32
  IME_CMODE_FIXED = 2048_u32
  IME_CMODE_RESERVED = 4026531840_u32
  IME_SMODE_NONE = 0_u32
  IME_SMODE_PLAURALCLAUSE = 1_u32
  IME_SMODE_SINGLECONVERT = 2_u32
  IME_SMODE_AUTOMATIC = 4_u32
  IME_SMODE_PHRASEPREDICT = 8_u32
  IME_SMODE_CONVERSATION = 16_u32
  IME_SMODE_RESERVED = 61440_u32
  IME_CAND_UNKNOWN = 0_u32
  IME_CAND_READ = 1_u32
  IME_CAND_CODE = 2_u32
  IME_CAND_MEANING = 3_u32
  IME_CAND_RADICAL = 4_u32
  IME_CAND_STROKE = 5_u32
  IMN_CLOSESTATUSWINDOW = 1_u32
  IMN_OPENSTATUSWINDOW = 2_u32
  IMN_CHANGECANDIDATE = 3_u32
  IMN_CLOSECANDIDATE = 4_u32
  IMN_OPENCANDIDATE = 5_u32
  IMN_SETCONVERSIONMODE = 6_u32
  IMN_SETSENTENCEMODE = 7_u32
  IMN_SETOPENSTATUS = 8_u32
  IMN_SETCANDIDATEPOS = 9_u32
  IMN_SETCOMPOSITIONFONT = 10_u32
  IMN_SETCOMPOSITIONWINDOW = 11_u32
  IMN_SETSTATUSWINDOWPOS = 12_u32
  IMN_GUIDELINE = 13_u32
  IMN_PRIVATE = 14_u32
  IMR_COMPOSITIONWINDOW = 1_u32
  IMR_CANDIDATEWINDOW = 2_u32
  IMR_COMPOSITIONFONT = 3_u32
  IMR_RECONVERTSTRING = 4_u32
  IMR_CONFIRMRECONVERTSTRING = 5_u32
  IMR_QUERYCHARPOSITION = 6_u32
  IMR_DOCUMENTFEED = 7_u32
  IMM_ERROR_NODATA = -1_i32
  IMM_ERROR_GENERAL = -2_i32
  IME_CONFIG_GENERAL = 1_u32
  IME_CONFIG_REGISTERWORD = 2_u32
  IME_CONFIG_SELECTDICTIONARY = 3_u32
  IME_ESC_QUERY_SUPPORT = 3_u32
  IME_ESC_RESERVED_FIRST = 4_u32
  IME_ESC_RESERVED_LAST = 2047_u32
  IME_ESC_PRIVATE_FIRST = 2048_u32
  IME_ESC_PRIVATE_LAST = 4095_u32
  IME_ESC_SEQUENCE_TO_INTERNAL = 4097_u32
  IME_ESC_GET_EUDC_DICTIONARY = 4099_u32
  IME_ESC_SET_EUDC_DICTIONARY = 4100_u32
  IME_ESC_MAX_KEY = 4101_u32
  IME_ESC_IME_NAME = 4102_u32
  IME_ESC_SYNC_HOTKEY = 4103_u32
  IME_ESC_HANJA_MODE = 4104_u32
  IME_ESC_AUTOMATA = 4105_u32
  IME_ESC_PRIVATE_HOTKEY = 4106_u32
  IME_ESC_GETHELPFILENAME = 4107_u32
  IME_REGWORD_STYLE_EUDC = 1_u32
  IME_REGWORD_STYLE_USER_FIRST = 2147483648_u32
  IME_REGWORD_STYLE_USER_LAST = 4294967295_u32
  IACE_CHILDREN = 1_u32
  IACE_DEFAULT = 16_u32
  IACE_IGNORENOCONTEXT = 32_u32
  IGIMIF_RIGHTMENU = 1_u32
  IGIMII_CMODE = 1_u32
  IGIMII_SMODE = 2_u32
  IGIMII_CONFIGURE = 4_u32
  IGIMII_TOOLS = 8_u32
  IGIMII_HELP = 16_u32
  IGIMII_OTHER = 32_u32
  IGIMII_INPUTTOOLS = 64_u32
  IMFT_RADIOCHECK = 1_u32
  IMFT_SEPARATOR = 2_u32
  IMFT_SUBMENU = 4_u32
  SOFTKEYBOARD_TYPE_T1 = 1_u32
  SOFTKEYBOARD_TYPE_C1 = 2_u32
  IMMGWL_IMC = 0_u32
  IMMGWLP_IMC = 0_u32
  IMC_SETCONVERSIONMODE = 2_u32
  IMC_SETSENTENCEMODE = 4_u32
  IMC_SETOPENSTATUS = 6_u32
  IMC_GETSOFTKBDFONT = 17_u32
  IMC_SETSOFTKBDFONT = 18_u32
  IMC_GETSOFTKBDPOS = 19_u32
  IMC_SETSOFTKBDPOS = 20_u32
  IMC_GETSOFTKBDSUBTYPE = 21_u32
  IMC_SETSOFTKBDSUBTYPE = 22_u32
  IMC_SETSOFTKBDDATA = 24_u32
  NI_CONTEXTUPDATED = 3_u32
  IME_SYSINFO_WINLOGON = 1_u32
  IME_SYSINFO_WOW16 = 2_u32
  INIT_STATUSWNDPOS = 1_u32
  INIT_CONVERSION = 2_u32
  INIT_SENTENCE = 4_u32
  INIT_LOGFONT = 8_u32
  INIT_COMPFORM = 16_u32
  INIT_SOFTKBDPOS = 32_u32
  IME_PROP_END_UNLOAD = 1_u32
  IME_PROP_KBD_CHAR_FIRST = 2_u32
  IME_PROP_IGNORE_UPKEYS = 4_u32
  IME_PROP_NEED_ALTKEY = 8_u32
  IME_PROP_NO_KEYS_ON_CLOSE = 16_u32
  IME_PROP_ACCEPT_WIDE_VKEY = 32_u32
  UI_CAP_SOFTKBD = 65536_u32
  IMN_SOFTKBDDESTROYED = 17_u32
  IME_UI_CLASS_NAME_SIZE = 16_u32
  IME_ESC_STRING_BUFFER_SIZE = 80_u32
  CATID_MSIME_IImePadApplet_VER7 = "4a0f8e31-c3ee-11d1-afef-00805f0c8b6d"
  CATID_MSIME_IImePadApplet_VER80 = "56f7a792-fef1-11d3-8463-00c04f7a06e5"
  CATID_MSIME_IImePadApplet_VER81 = "656520b0-bb88-11d4-84c0-00c04f7a06e5"
  CATID_MSIME_IImePadApplet900 = "faae51bf-5e5b-4a1d-8de1-17c1d9e1728d"
  CATID_MSIME_IImePadApplet1000 = "e081e1d6-2389-43cb-b66f-609f823d9f9c"
  CATID_MSIME_IImePadApplet1200 = "a47fb5fc-7d15-4223-a789-b781bf9ae667"
  CATID_MSIME_IImePadApplet = "7566cad1-4ec9-4478-9fe9-8ed766619edf"
  FEID_NONE = 0_u32
  FEID_CHINESE_TRADITIONAL = 1_u32
  FEID_CHINESE_SIMPLIFIED = 2_u32
  FEID_CHINESE_HONGKONG = 3_u32
  FEID_CHINESE_SINGAPORE = 4_u32
  FEID_JAPANESE = 5_u32
  FEID_KOREAN = 6_u32
  FEID_KOREAN_JOHAB = 7_u32
  INFOMASK_NONE = 0_u32
  INFOMASK_QUERY_CAND = 1_u32
  INFOMASK_APPLY_CAND = 2_u32
  INFOMASK_APPLY_CAND_EX = 4_u32
  INFOMASK_STRING_FIX = 65536_u32
  INFOMASK_HIDE_CAND = 131072_u32
  INFOMASK_BLOCK_CAND = 262144_u32
  IMEFAREASTINFO_TYPE_DEFAULT = 0_u32
  IMEFAREASTINFO_TYPE_READING = 1_u32
  IMEFAREASTINFO_TYPE_COMMENT = 2_u32
  IMEFAREASTINFO_TYPE_COSTTIME = 3_u32
  CHARINFO_APPLETID_MASK = 4278190080_u32
  CHARINFO_FEID_MASK = 15728640_u32
  CHARINFO_CHARID_MASK = 65535_u32
  MAX_APPLETTITLE = 64_u32
  MAX_FONTFACE = 32_u32
  IPACFG_NONE = 0_i32
  IPACFG_PROPERTY = 1_i32
  IPACFG_HELP = 2_i32
  IPACFG_TITLE = 65536_i32
  IPACFG_TITLEFONTFACE = 131072_i32
  IPACFG_CATEGORY = 262144_i32
  IPACFG_LANG = 16_i32
  IPACID_NONE = 0_u32
  IPACID_SOFTKEY = 1_u32
  IPACID_HANDWRITING = 2_u32
  IPACID_STROKESEARCH = 3_u32
  IPACID_RADICALSEARCH = 4_u32
  IPACID_SYMBOLSEARCH = 5_u32
  IPACID_VOICE = 6_u32
  IPACID_EPWING = 7_u32
  IPACID_OCR = 8_u32
  IPACID_CHARLIST = 9_u32
  IPACID_USER = 256_u32
  IMEPADREQ_FIRST = 4096_u32
  IMEPADREQ_INSERTSTRINGCANDIDATE = 4098_u32
  IMEPADREQ_INSERTITEMCANDIDATE = 4099_u32
  IMEPADREQ_SENDKEYCONTROL = 4101_u32
  IMEPADREQ_GETSELECTEDSTRING = 4103_u32
  IMEPADREQ_SETAPPLETDATA = 4105_u32
  IMEPADREQ_GETAPPLETDATA = 4106_u32
  IMEPADREQ_SETTITLEFONT = 4107_u32
  IMEPADREQ_GETCOMPOSITIONSTRINGID = 4109_u32
  IMEPADREQ_INSERTSTRINGCANDIDATEINFO = 4110_u32
  IMEPADREQ_CHANGESTRINGCANDIDATEINFO = 4111_u32
  IMEPADREQ_INSERTSTRINGINFO = 4114_u32
  IMEPADREQ_CHANGESTRINGINFO = 4115_u32
  IMEPADREQ_GETCURRENTUILANGID = 4120_u32
  IMEPADCTRL_CONVERTALL = 1_u32
  IMEPADCTRL_DETERMINALL = 2_u32
  IMEPADCTRL_DETERMINCHAR = 3_u32
  IMEPADCTRL_CLEARALL = 4_u32
  IMEPADCTRL_CARETSET = 5_u32
  IMEPADCTRL_CARETLEFT = 6_u32
  IMEPADCTRL_CARETRIGHT = 7_u32
  IMEPADCTRL_CARETTOP = 8_u32
  IMEPADCTRL_CARETBOTTOM = 9_u32
  IMEPADCTRL_CARETBACKSPACE = 10_u32
  IMEPADCTRL_CARETDELETE = 11_u32
  IMEPADCTRL_PHRASEDELETE = 12_u32
  IMEPADCTRL_INSERTSPACE = 13_u32
  IMEPADCTRL_INSERTFULLSPACE = 14_u32
  IMEPADCTRL_INSERTHALFSPACE = 15_u32
  IMEPADCTRL_ONIME = 16_u32
  IMEPADCTRL_OFFIME = 17_u32
  IMEPADCTRL_ONPRECONVERSION = 18_u32
  IMEPADCTRL_OFFPRECONVERSION = 19_u32
  IMEPADCTRL_PHONETICCANDIDATE = 20_u32
  IMEKEYCTRLMASK_ALT = 1_u32
  IMEKEYCTRLMASK_CTRL = 2_u32
  IMEKEYCTRLMASK_SHIFT = 4_u32
  IMEKEYCTRL_UP = 1_u32
  IMEKEYCTRL_DOWN = 0_u32
  IMEPN_FIRST = 256_u32
  IMEPN_ACTIVATE = 257_u32
  IMEPN_INACTIVATE = 258_u32
  IMEPN_SHOW = 260_u32
  IMEPN_HIDE = 261_u32
  IMEPN_SIZECHANGING = 262_u32
  IMEPN_SIZECHANGED = 263_u32
  IMEPN_CONFIG = 264_u32
  IMEPN_HELP = 265_u32
  IMEPN_QUERYCAND = 266_u32
  IMEPN_APPLYCAND = 267_u32
  IMEPN_APPLYCANDEX = 268_u32
  IMEPN_SETTINGCHANGED = 269_u32
  IMEPN_USER = 356_u32
  IPAWS_ENABLED = 1_i32
  IPAWS_SIZINGNOTIFY = 4_i32
  IPAWS_VERTICALFIXED = 256_i32
  IPAWS_HORIZONTALFIXED = 512_i32
  IPAWS_SIZEFIXED = 768_i32
  IPAWS_MAXWIDTHFIXED = 4096_i32
  IPAWS_MAXHEIGHTFIXED = 8192_i32
  IPAWS_MAXSIZEFIXED = 12288_i32
  IPAWS_MINWIDTHFIXED = 65536_i32
  IPAWS_MINHEIGHTFIXED = 131072_i32
  IPAWS_MINSIZEFIXED = 196608_i32
  CLSID_ImePlugInDictDictionaryList_CHS = "7bf0129b-5bef-4de4-9b0b-5edb66ac2fa6"
  CLSID_ImePlugInDictDictionaryList_JPN = "4fe2776b-b0f9-4396-b5fc-e9d4cf1ec195"

  CLSID_CActiveIMM = LibC::GUID.new(0x4955dd33_u32, 0xb159_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])

  enum SET_COMPOSITION_STRING_TYPE : UInt32
    SCS_SETSTR = 9_u32
    SCS_CHANGEATTR = 18_u32
    SCS_CHANGECLAUSE = 36_u32
    SCS_SETRECONVERTSTRING = 65536_u32
    SCS_QUERYRECONVERTSTRING = 131072_u32
  end
  enum GET_GUIDE_LINE_TYPE : UInt32
    GGL_LEVEL = 1_u32
    GGL_INDEX = 2_u32
    GGL_STRING = 3_u32
    GGL_PRIVATE = 4_u32
  end
  enum NOTIFY_IME_INDEX : UInt32
    CPS_CANCEL = 4_u32
    CPS_COMPLETE = 1_u32
    CPS_CONVERT = 2_u32
    CPS_REVERT = 3_u32
  end
  enum NOTIFY_IME_ACTION : UInt32
    NI_CHANGECANDIDATELIST = 19_u32
    NI_CLOSECANDIDATE = 17_u32
    NI_COMPOSITIONSTR = 21_u32
    NI_IMEMENUSELECTED = 24_u32
    NI_OPENCANDIDATE = 16_u32
    NI_SELECTCANDIDATESTR = 18_u32
    NI_SETCANDIDATE_PAGESIZE = 23_u32
    NI_SETCANDIDATE_PAGESTART = 22_u32
  end
  enum GET_CONVERSION_LIST_FLAG : UInt32
    GCL_CONVERSION = 1_u32
    GCL_REVERSECONVERSION = 2_u32
    GCL_REVERSE_LENGTH = 3_u32
  end
  enum IME_PAD_REQUEST_FLAGS : UInt32
    IMEPADREQ_INSERTSTRING = 4097_u32
    IMEPADREQ_SENDCONTROL = 4100_u32
    IMEPADREQ_SETAPPLETSIZE = 4104_u32
    IMEPADREQ_GETCOMPOSITIONSTRING = 4102_u32
    IMEPADREQ_GETCOMPOSITIONSTRINGINFO = 4108_u32
    IMEPADREQ_DELETESTRING = 4112_u32
    IMEPADREQ_CHANGESTRING = 4113_u32
    IMEPADREQ_GETAPPLHWND = 4116_u32
    IMEPADREQ_FORCEIMEPADWINDOWSHOW = 4117_u32
    IMEPADREQ_POSTMODALNOTIFY = 4118_u32
    IMEPADREQ_GETDEFAULTUILANGID = 4119_u32
    IMEPADREQ_GETAPPLETUISTYLE = 4121_u32
    IMEPADREQ_SETAPPLETUISTYLE = 4122_u32
    IMEPADREQ_ISAPPLETACTIVE = 4123_u32
    IMEPADREQ_ISIMEPADWINDOWVISIBLE = 4124_u32
    IMEPADREQ_SETAPPLETMINMAXSIZE = 4125_u32
    IMEPADREQ_GETCONVERSIONSTATUS = 4126_u32
    IMEPADREQ_GETVERSION = 4127_u32
    IMEPADREQ_GETCURRENTIMEINFO = 4128_u32
  end
  enum IMEREG
    IFED_REG_HEAD = 0_i32
    IFED_REG_TAIL = 1_i32
    IFED_REG_DEL = 2_i32
  end
  enum IMEFMT
    IFED_UNKNOWN = 0_i32
    IFED_MSIME2_BIN_SYSTEM = 1_i32
    IFED_MSIME2_BIN_USER = 2_i32
    IFED_MSIME2_TEXT_USER = 3_i32
    IFED_MSIME95_BIN_SYSTEM = 4_i32
    IFED_MSIME95_BIN_USER = 5_i32
    IFED_MSIME95_TEXT_USER = 6_i32
    IFED_MSIME97_BIN_SYSTEM = 7_i32
    IFED_MSIME97_BIN_USER = 8_i32
    IFED_MSIME97_TEXT_USER = 9_i32
    IFED_MSIME98_BIN_SYSTEM = 10_i32
    IFED_MSIME98_BIN_USER = 11_i32
    IFED_MSIME98_TEXT_USER = 12_i32
    IFED_ACTIVE_DICT = 13_i32
    IFED_ATOK9 = 14_i32
    IFED_ATOK10 = 15_i32
    IFED_NEC_AI_ = 16_i32
    IFED_WX_II = 17_i32
    IFED_WX_III = 18_i32
    IFED_VJE_20 = 19_i32
    IFED_MSIME98_SYSTEM_CE = 20_i32
    IFED_MSIME_BIN_SYSTEM = 21_i32
    IFED_MSIME_BIN_USER = 22_i32
    IFED_MSIME_TEXT_USER = 23_i32
    IFED_PIME2_BIN_USER = 24_i32
    IFED_PIME2_BIN_SYSTEM = 25_i32
    IFED_PIME2_BIN_STANDARD_SYSTEM = 26_i32
  end
  enum IMEUCT
    IFED_UCT_NONE = 0_i32
    IFED_UCT_STRING_SJIS = 1_i32
    IFED_UCT_STRING_UNICODE = 2_i32
    IFED_UCT_USER_DEFINED = 3_i32
    IFED_UCT_MAX = 4_i32
  end
  enum IMEREL
    IFED_REL_NONE = 0_i32
    IFED_REL_NO = 1_i32
    IFED_REL_GA = 2_i32
    IFED_REL_WO = 3_i32
    IFED_REL_NI = 4_i32
    IFED_REL_DE = 5_i32
    IFED_REL_YORI = 6_i32
    IFED_REL_KARA = 7_i32
    IFED_REL_MADE = 8_i32
    IFED_REL_HE = 9_i32
    IFED_REL_TO = 10_i32
    IFED_REL_IDEOM = 11_i32
    IFED_REL_FUKU_YOUGEN = 12_i32
    IFED_REL_KEIYOU_YOUGEN = 13_i32
    IFED_REL_KEIDOU1_YOUGEN = 14_i32
    IFED_REL_KEIDOU2_YOUGEN = 15_i32
    IFED_REL_TAIGEN = 16_i32
    IFED_REL_YOUGEN = 17_i32
    IFED_REL_RENTAI_MEI = 18_i32
    IFED_REL_RENSOU = 19_i32
    IFED_REL_KEIYOU_TO_YOUGEN = 20_i32
    IFED_REL_KEIYOU_TARU_YOUGEN = 21_i32
    IFED_REL_UNKNOWN1 = 22_i32
    IFED_REL_UNKNOWN2 = 23_i32
    IFED_REL_ALL = 24_i32
  end

  @[Extern]
  record COMPOSITIONFORM,
    dwStyle : UInt32,
    ptCurrentPos : Win32cr::Foundation::POINT,
    rcArea : Win32cr::Foundation::RECT

  @[Extern]
  record CANDIDATEFORM,
    dwIndex : UInt32,
    dwStyle : UInt32,
    ptCurrentPos : Win32cr::Foundation::POINT,
    rcArea : Win32cr::Foundation::RECT

  @[Extern]
  record CANDIDATELIST,
    dwSize : UInt32,
    dwStyle : UInt32,
    dwCount : UInt32,
    dwSelection : UInt32,
    dwPageStart : UInt32,
    dwPageSize : UInt32,
    dwOffset : UInt32*

  @[Extern]
  record REGISTERWORDA,
    lpReading : Win32cr::Foundation::PSTR,
    lpWord : Win32cr::Foundation::PSTR

  @[Extern]
  record REGISTERWORDW,
    lpReading : Win32cr::Foundation::PWSTR,
    lpWord : Win32cr::Foundation::PWSTR

  @[Extern]
  record RECONVERTSTRING,
    dwSize : UInt32,
    dwVersion : UInt32,
    dwStrLen : UInt32,
    dwStrOffset : UInt32,
    dwCompStrLen : UInt32,
    dwCompStrOffset : UInt32,
    dwTargetStrLen : UInt32,
    dwTargetStrOffset : UInt32

  @[Extern]
  record STYLEBUFA,
    dwStyle : UInt32,
    szDescription : Win32cr::Foundation::CHAR[32]

  @[Extern]
  record STYLEBUFW,
    dwStyle : UInt32,
    szDescription : UInt16[32]

  @[Extern]
  record IMEMENUITEMINFOA,
    cbSize : UInt32,
    fType : UInt32,
    fState : UInt32,
    wID : UInt32,
    hbmpChecked : Win32cr::Graphics::Gdi::HBITMAP,
    hbmpUnchecked : Win32cr::Graphics::Gdi::HBITMAP,
    dwItemData : UInt32,
    szString : Win32cr::Foundation::CHAR[80],
    hbmpItem : Win32cr::Graphics::Gdi::HBITMAP

  @[Extern]
  record IMEMENUITEMINFOW,
    cbSize : UInt32,
    fType : UInt32,
    fState : UInt32,
    wID : UInt32,
    hbmpChecked : Win32cr::Graphics::Gdi::HBITMAP,
    hbmpUnchecked : Win32cr::Graphics::Gdi::HBITMAP,
    dwItemData : UInt32,
    szString : UInt16[80],
    hbmpItem : Win32cr::Graphics::Gdi::HBITMAP

  @[Extern]
  record IMECHARPOSITION,
    dwSize : UInt32,
    dwCharPos : UInt32,
    pt : Win32cr::Foundation::POINT,
    cLineHeight : UInt32,
    rcDocument : Win32cr::Foundation::RECT

  @[Extern]
  record IMEDLG,
    cbIMEDLG : Int32,
    hwnd : Win32cr::Foundation::HWND,
    lpwstrWord : Win32cr::Foundation::PWSTR,
    nTabId : Int32

  @[Extern]
  record WDD,
    wDispPos : UInt16,
    anonymous1 : Anonymous1_e__Union_,
    cchDisp : UInt16,
    anonymous2 : Anonymous2_e__Union_,
    wdd_n_reserve1 : UInt32,
    nPos : UInt16,
    _bitfield : UInt16,
    pReserved : Void* do

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      cchRead : UInt16,
      cchComp : UInt16


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      wReadPos : UInt16,
      wCompPos : UInt16

  end

  @[Extern]
  record MORRSLT,
    dwSize : UInt32,
    pwchOutput : Win32cr::Foundation::PWSTR,
    cchOutput : UInt16,
    anonymous1 : Anonymous1_e__Union_,
    anonymous2 : Anonymous2_e__Union_,
    pchInputPos : UInt16*,
    pchOutputIdxWDD : UInt16*,
    anonymous3 : Anonymous3_e__Union_,
    paMonoRubyPos : UInt16*,
    pWDD : Win32cr::UI::Input::Ime::WDD*,
    cWDD : Int32,
    pPrivate : Void*,
    blk_buff : UInt16* do

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      cchRead : UInt16,
      cchComp : UInt16


    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    record Anonymous3_e__Union_,
      pchReadIdxWDD : UInt16*,
      pchCompIdxWDD : UInt16*


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      pwchRead : Win32cr::Foundation::PWSTR,
      pwchComp : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record IMEWRD,
    pwchReading : Win32cr::Foundation::PWSTR,
    pwchDisplay : Win32cr::Foundation::PWSTR,
    anonymous : Anonymous_e__Union_,
    rgulAttrs : UInt32[2],
    cbComment : Int32,
    uct : Win32cr::UI::Input::Ime::IMEUCT,
    pvComment : Void* do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      ulPos : UInt32,
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        nPos1 : UInt16,
        nPos2 : UInt16

    end

  end

  @[Extern]
  record IMESHF,
    cbShf : UInt16,
    verDic : UInt16,
    szTitle : Win32cr::Foundation::CHAR[48],
    szDescription : Win32cr::Foundation::CHAR[256],
    szCopyright : Win32cr::Foundation::CHAR[128]

  @[Extern]
  record POSTBL,
    nPos : UInt16,
    szName : UInt8*

  @[Extern]
  record IMEDP,
    wrdModifier : Win32cr::UI::Input::Ime::IMEWRD,
    wrdModifiee : Win32cr::UI::Input::Ime::IMEWRD,
    relID : Win32cr::UI::Input::Ime::IMEREL

  @[Extern]
  record IMEKMSINIT,
    cbSize : Int32,
    hWnd : Win32cr::Foundation::HWND

  @[Extern]
  record IMEKMSKEY,
    dwStatus : UInt32,
    dwCompStatus : UInt32,
    dwVKEY : UInt32,
    anonymous1 : Anonymous1_e__Union_,
    anonymous2 : Anonymous2_e__Union_ do

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      dwControl : UInt32,
      dwNotUsed : UInt32


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      pwszDscr : UInt16[31],
      pwszNoUse : UInt16[31]

  end

  @[Extern]
  record IMEKMS,
    cbSize : Int32,
    hIMC : Win32cr::Globalization::HIMC,
    cKeyList : UInt32,
    pKeyList : Win32cr::UI::Input::Ime::IMEKMSKEY*

  @[Extern]
  record IMEKMSNTFY,
    cbSize : Int32,
    hIMC : Win32cr::Globalization::HIMC,
    fSelect : Win32cr::Foundation::BOOL

  @[Extern]
  record IMEKMSKMP,
    cbSize : Int32,
    hIMC : Win32cr::Globalization::HIMC,
    idLang : UInt16,
    wVKStart : UInt16,
    wVKEnd : UInt16,
    cKeyList : Int32,
    pKeyList : Win32cr::UI::Input::Ime::IMEKMSKEY*

  @[Extern]
  record IMEKMSINVK,
    cbSize : Int32,
    hIMC : Win32cr::Globalization::HIMC,
    dwControl : UInt32

  @[Extern]
  record IMEKMSFUNCDESC,
    cbSize : Int32,
    idLang : UInt16,
    dwControl : UInt32,
    pwszDescription : UInt16[128]

  @[Extern]
  record COMPOSITIONSTRING,
    dwSize : UInt32,
    dwCompReadAttrLen : UInt32,
    dwCompReadAttrOffset : UInt32,
    dwCompReadClauseLen : UInt32,
    dwCompReadClauseOffset : UInt32,
    dwCompReadStrLen : UInt32,
    dwCompReadStrOffset : UInt32,
    dwCompAttrLen : UInt32,
    dwCompAttrOffset : UInt32,
    dwCompClauseLen : UInt32,
    dwCompClauseOffset : UInt32,
    dwCompStrLen : UInt32,
    dwCompStrOffset : UInt32,
    dwCursorPos : UInt32,
    dwDeltaStart : UInt32,
    dwResultReadClauseLen : UInt32,
    dwResultReadClauseOffset : UInt32,
    dwResultReadStrLen : UInt32,
    dwResultReadStrOffset : UInt32,
    dwResultClauseLen : UInt32,
    dwResultClauseOffset : UInt32,
    dwResultStrLen : UInt32,
    dwResultStrOffset : UInt32,
    dwPrivateSize : UInt32,
    dwPrivateOffset : UInt32

  @[Extern]
  record GUIDELINE,
    dwSize : UInt32,
    dwLevel : UInt32,
    dwIndex : UInt32,
    dwStrLen : UInt32,
    dwStrOffset : UInt32,
    dwPrivateSize : UInt32,
    dwPrivateOffset : UInt32

  @[Extern]
  record TRANSMSG,
    message : UInt32,
    wParam : Win32cr::Foundation::WPARAM,
    lParam : Win32cr::Foundation::LPARAM

  @[Extern]
  record TRANSMSGLIST,
    uMsgCount : UInt32,
    trans_msg : Win32cr::UI::Input::Ime::TRANSMSG*

  @[Extern]
  record CANDIDATEINFO,
    dwSize : UInt32,
    dwCount : UInt32,
    dwOffset : UInt32[32],
    dwPrivateSize : UInt32,
    dwPrivateOffset : UInt32

  @[Extern]
  record INPUTCONTEXT,
    hWnd : Win32cr::Foundation::HWND,
    fOpen : Win32cr::Foundation::BOOL,
    ptStatusWndPos : Win32cr::Foundation::POINT,
    ptSoftKbdPos : Win32cr::Foundation::POINT,
    fdwConversion : UInt32,
    fdwSentence : UInt32,
    lfFont : Lffont_e__union_,
    cfCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM,
    cfCandForm : Win32cr::UI::Input::Ime::CANDIDATEFORM[4],
    hCompStr : Win32cr::Globalization::HIMCC,
    hCandInfo : Win32cr::Globalization::HIMCC,
    hGuideLine : Win32cr::Globalization::HIMCC,
    hPrivate : Win32cr::Globalization::HIMCC,
    dwNumMsgBuf : UInt32,
    hMsgBuf : Win32cr::Globalization::HIMCC,
    fdwInit : UInt32,
    dwReserve : UInt32[3] do

    # Nested Type Lffont_e__union_
    @[Extern(union: true)]
    record Lffont_e__union_,
      a : Win32cr::Graphics::Gdi::LOGFONTA,
      w : Win32cr::Graphics::Gdi::LOGFONTW

  end

  @[Extern]
  record IMEINFO,
    dwPrivateDataSize : UInt32,
    fdwProperty : UInt32,
    fdwConversionCaps : UInt32,
    fdwSentenceCaps : UInt32,
    fdwUICaps : UInt32,
    fdwSCSCaps : UInt32,
    fdwSelectCaps : UInt32

  @[Extern]
  record SOFTKBDDATA,
    uCount : UInt32,
    wCode : UInt16[256]

  @[Extern]
  record APPLETIDLIST,
    count : Int32,
    pIIDList : LibC::GUID*

  @[Extern]
  record IMESTRINGCANDIDATE,
    uCount : UInt32,
    lpwstr : Win32cr::Foundation::PWSTR*

  @[Extern]
  record IMEITEM,
    cbSize : Int32,
    iType : Int32,
    lpItemData : Void*

  @[Extern]
  record IMEITEMCANDIDATE,
    uCount : UInt32,
    imeItem : Win32cr::UI::Input::Ime::IMEITEM*

  @[Extern]
  record Tabimestringinfo,
    dwFarEastId : UInt32,
    lpwstr : Win32cr::Foundation::PWSTR

  @[Extern]
  record Tabimefareastinfo,
    dwSize : UInt32,
    dwType : UInt32,
    dwData : UInt32*

  @[Extern]
  record IMESTRINGCANDIDATEINFO,
    dwFarEastId : UInt32,
    lpFarEastInfo : Win32cr::UI::Input::Ime::Tabimefareastinfo*,
    fInfoMask : UInt32,
    iSelIndex : Int32,
    uCount : UInt32,
    lpwstr : Win32cr::Foundation::PWSTR*

  @[Extern]
  record IMECOMPOSITIONSTRINGINFO,
    iCompStrLen : Int32,
    iCaretPos : Int32,
    iEditStart : Int32,
    iEditLen : Int32,
    iTargetStart : Int32,
    iTargetLen : Int32

  @[Extern]
  record IMECHARINFO,
    wch : UInt16,
    dwCharInfo : UInt32

  @[Extern]
  record IMEAPPLETCFG,
    dwConfig : UInt32,
    wchTitle : UInt16[64],
    wchTitleFontFace : UInt16[32],
    dwCharSet : UInt32,
    iCategory : Int32,
    hIcon : Win32cr::UI::WindowsAndMessaging::HICON,
    langID : UInt16,
    dummy : UInt16,
    lReserved1 : Win32cr::Foundation::LPARAM

  @[Extern]
  record IMEAPPLETUI,
    hwnd : Win32cr::Foundation::HWND,
    dwStyle : UInt32,
    width : Int32,
    height : Int32,
    minWidth : Int32,
    minHeight : Int32,
    maxWidth : Int32,
    maxHeight : Int32,
    lReserved1 : Win32cr::Foundation::LPARAM,
    lReserved2 : Win32cr::Foundation::LPARAM

  @[Extern]
  record APPLYCANDEXPARAM,
    dwSize : UInt32,
    lpwstrDisplay : Win32cr::Foundation::PWSTR,
    lpwstrReading : Win32cr::Foundation::PWSTR,
    dwReserved : UInt32

  @[Extern]
  record IFEClassFactoryVtbl,
    query_interface : Proc(IFEClassFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFEClassFactory*, UInt32),
    release : Proc(IFEClassFactory*, UInt32),
    create_instance : Proc(IFEClassFactory*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    lock_server : Proc(IFEClassFactory*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFEClassFactory, lpVtbl : IFEClassFactoryVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IFEClassFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFEClassFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFEClassFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : IFEClassFactory*, pUnkOuter : Void*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, riid, ppvObject)
    end
    def lock_server(this : IFEClassFactory*, fLock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_server.call(this, fLock)
    end

  end

  @[Extern]
  record IFECommonVtbl,
    query_interface : Proc(IFECommon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFECommon*, UInt32),
    release : Proc(IFECommon*, UInt32),
    is_default_ime : Proc(IFECommon*, UInt8*, Int32, Win32cr::Foundation::HRESULT),
    set_default_ime : Proc(IFECommon*, Win32cr::Foundation::HRESULT),
    invoke_word_reg_dialog : Proc(IFECommon*, Win32cr::UI::Input::Ime::IMEDLG*, Win32cr::Foundation::HRESULT),
    invoke_dict_tool_dialog : Proc(IFECommon*, Win32cr::UI::Input::Ime::IMEDLG*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("019f7151-e6db-11d0-83c3-00c04fddb82e")]
  record IFECommon, lpVtbl : IFECommonVtbl* do
    GUID = LibC::GUID.new(0x19f7151_u32, 0xe6db_u16, 0x11d0_u16, StaticArray[0x83_u8, 0xc3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdd_u8, 0xb8_u8, 0x2e_u8])
    def query_interface(this : IFECommon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFECommon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFECommon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_default_ime(this : IFECommon*, szName : UInt8*, cszName : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_default_ime.call(this, szName, cszName)
    end
    def set_default_ime(this : IFECommon*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_ime.call(this)
    end
    def invoke_word_reg_dialog(this : IFECommon*, pimedlg : Win32cr::UI::Input::Ime::IMEDLG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_word_reg_dialog.call(this, pimedlg)
    end
    def invoke_dict_tool_dialog(this : IFECommon*, pimedlg : Win32cr::UI::Input::Ime::IMEDLG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_dict_tool_dialog.call(this, pimedlg)
    end

  end

  @[Extern]
  record IFELanguageVtbl,
    query_interface : Proc(IFELanguage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFELanguage*, UInt32),
    release : Proc(IFELanguage*, UInt32),
    open : Proc(IFELanguage*, Win32cr::Foundation::HRESULT),
    close : Proc(IFELanguage*, Win32cr::Foundation::HRESULT),
    get_j_morph_result : Proc(IFELanguage*, UInt32, UInt32, Int32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::UI::Input::Ime::MORRSLT**, Win32cr::Foundation::HRESULT),
    get_conversion_mode_caps : Proc(IFELanguage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_phonetic : Proc(IFELanguage*, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_conversion : Proc(IFELanguage*, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("019f7152-e6db-11d0-83c3-00c04fddb82e")]
  record IFELanguage, lpVtbl : IFELanguageVtbl* do
    GUID = LibC::GUID.new(0x19f7152_u32, 0xe6db_u16, 0x11d0_u16, StaticArray[0x83_u8, 0xc3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdd_u8, 0xb8_u8, 0x2e_u8])
    def query_interface(this : IFELanguage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFELanguage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFELanguage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IFELanguage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this)
    end
    def close(this : IFELanguage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_j_morph_result(this : IFELanguage*, dwRequest : UInt32, dwCMode : UInt32, cwchInput : Int32, pwchInput : Win32cr::Foundation::PWSTR, pfCInfo : UInt32*, ppResult : Win32cr::UI::Input::Ime::MORRSLT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_j_morph_result.call(this, dwRequest, dwCMode, cwchInput, pwchInput, pfCInfo, ppResult)
    end
    def get_conversion_mode_caps(this : IFELanguage*, pdwCaps : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_mode_caps.call(this, pdwCaps)
    end
    def get_phonetic(this : IFELanguage*, string : Win32cr::Foundation::BSTR, start : Int32, length : Int32, phonetic : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phonetic.call(this, string, start, length, phonetic)
    end
    def get_conversion(this : IFELanguage*, string : Win32cr::Foundation::BSTR, start : Int32, length : Int32, result : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion.call(this, string, start, length, result)
    end

  end

  @[Extern]
  record IFEDictionaryVtbl,
    query_interface : Proc(IFEDictionary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFEDictionary*, UInt32),
    release : Proc(IFEDictionary*, UInt32),
    open : Proc(IFEDictionary*, UInt8*, Win32cr::UI::Input::Ime::IMESHF*, Win32cr::Foundation::HRESULT),
    close : Proc(IFEDictionary*, Win32cr::Foundation::HRESULT),
    get_header : Proc(IFEDictionary*, UInt8*, Win32cr::UI::Input::Ime::IMESHF*, Win32cr::UI::Input::Ime::IMEFMT*, UInt32*, Win32cr::Foundation::HRESULT),
    display_property : Proc(IFEDictionary*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_pos_table : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::POSTBL**, Int32*, Win32cr::Foundation::HRESULT),
    get_words : Proc(IFEDictionary*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    next_words : Proc(IFEDictionary*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    create : Proc(IFEDictionary*, Win32cr::Foundation::PSTR, Win32cr::UI::Input::Ime::IMESHF*, Win32cr::Foundation::HRESULT),
    set_header : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::IMESHF*, Win32cr::Foundation::HRESULT),
    exist_word : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::IMEWRD*, Win32cr::Foundation::HRESULT),
    exist_dependency : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::IMEDP*, Win32cr::Foundation::HRESULT),
    register_word : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::IMEREG, Win32cr::UI::Input::Ime::IMEWRD*, Win32cr::Foundation::HRESULT),
    register_dependency : Proc(IFEDictionary*, Win32cr::UI::Input::Ime::IMEREG, Win32cr::UI::Input::Ime::IMEDP*, Win32cr::Foundation::HRESULT),
    get_dependencies : Proc(IFEDictionary*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::UI::Input::Ime::IMEREL, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    next_dependencies : Proc(IFEDictionary*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    convert_from_old_msime : Proc(IFEDictionary*, Win32cr::Foundation::PSTR, Win32cr::UI::Input::Ime::PFNLOG, Win32cr::UI::Input::Ime::IMEREG, Win32cr::Foundation::HRESULT),
    convert_from_user_to_sys : Proc(IFEDictionary*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("019f7153-e6db-11d0-83c3-00c04fddb82e")]
  record IFEDictionary, lpVtbl : IFEDictionaryVtbl* do
    GUID = LibC::GUID.new(0x19f7153_u32, 0xe6db_u16, 0x11d0_u16, StaticArray[0x83_u8, 0xc3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdd_u8, 0xb8_u8, 0x2e_u8])
    def query_interface(this : IFEDictionary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFEDictionary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFEDictionary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IFEDictionary*, pchDictPath : UInt8*, pshf : Win32cr::UI::Input::Ime::IMESHF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pchDictPath, pshf)
    end
    def close(this : IFEDictionary*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_header(this : IFEDictionary*, pchDictPath : UInt8*, pshf : Win32cr::UI::Input::Ime::IMESHF*, pjfmt : Win32cr::UI::Input::Ime::IMEFMT*, pulType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_header.call(this, pchDictPath, pshf, pjfmt, pulType)
    end
    def display_property(this : IFEDictionary*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_property.call(this, hwnd)
    end
    def get_pos_table(this : IFEDictionary*, prgPosTbl : Win32cr::UI::Input::Ime::POSTBL**, pcPosTbl : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pos_table.call(this, prgPosTbl, pcPosTbl)
    end
    def get_words(this : IFEDictionary*, pwchFirst : Win32cr::Foundation::PWSTR, pwchLast : Win32cr::Foundation::PWSTR, pwchDisplay : Win32cr::Foundation::PWSTR, ulPos : UInt32, ulSelect : UInt32, ulWordSrc : UInt32, pchBuffer : UInt8*, cbBuffer : UInt32, pcWrd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_words.call(this, pwchFirst, pwchLast, pwchDisplay, ulPos, ulSelect, ulWordSrc, pchBuffer, cbBuffer, pcWrd)
    end
    def next_words(this : IFEDictionary*, pchBuffer : UInt8*, cbBuffer : UInt32, pcWrd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_words.call(this, pchBuffer, cbBuffer, pcWrd)
    end
    def create(this : IFEDictionary*, pchDictPath : Win32cr::Foundation::PSTR, pshf : Win32cr::UI::Input::Ime::IMESHF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pchDictPath, pshf)
    end
    def set_header(this : IFEDictionary*, pshf : Win32cr::UI::Input::Ime::IMESHF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_header.call(this, pshf)
    end
    def exist_word(this : IFEDictionary*, pwrd : Win32cr::UI::Input::Ime::IMEWRD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exist_word.call(this, pwrd)
    end
    def exist_dependency(this : IFEDictionary*, pdp : Win32cr::UI::Input::Ime::IMEDP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exist_dependency.call(this, pdp)
    end
    def register_word(this : IFEDictionary*, reg : Win32cr::UI::Input::Ime::IMEREG, pwrd : Win32cr::UI::Input::Ime::IMEWRD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word.call(this, reg, pwrd)
    end
    def register_dependency(this : IFEDictionary*, reg : Win32cr::UI::Input::Ime::IMEREG, pdp : Win32cr::UI::Input::Ime::IMEDP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_dependency.call(this, reg, pdp)
    end
    def get_dependencies(this : IFEDictionary*, pwchKakariReading : Win32cr::Foundation::PWSTR, pwchKakariDisplay : Win32cr::Foundation::PWSTR, ulKakariPos : UInt32, pwchUkeReading : Win32cr::Foundation::PWSTR, pwchUkeDisplay : Win32cr::Foundation::PWSTR, ulUkePos : UInt32, jrel : Win32cr::UI::Input::Ime::IMEREL, ulWordSrc : UInt32, pchBuffer : UInt8*, cbBuffer : UInt32, pcdp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dependencies.call(this, pwchKakariReading, pwchKakariDisplay, ulKakariPos, pwchUkeReading, pwchUkeDisplay, ulUkePos, jrel, ulWordSrc, pchBuffer, cbBuffer, pcdp)
    end
    def next_dependencies(this : IFEDictionary*, pchBuffer : UInt8*, cbBuffer : UInt32, pcDp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_dependencies.call(this, pchBuffer, cbBuffer, pcDp)
    end
    def convert_from_old_msime(this : IFEDictionary*, pchDic : Win32cr::Foundation::PSTR, pfnLog : Win32cr::UI::Input::Ime::PFNLOG, reg : Win32cr::UI::Input::Ime::IMEREG) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_from_old_msime.call(this, pchDic, pfnLog, reg)
    end
    def convert_from_user_to_sys(this : IFEDictionary*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_from_user_to_sys.call(this)
    end

  end

  @[Extern]
  record IImeSpecifyAppletsVtbl,
    query_interface : Proc(IImeSpecifyApplets*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImeSpecifyApplets*, UInt32),
    release : Proc(IImeSpecifyApplets*, UInt32),
    get_applet_iid_list : Proc(IImeSpecifyApplets*, LibC::GUID*, Win32cr::UI::Input::Ime::APPLETIDLIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d8e643c-c3a9-11d1-afef-00805f0c8b6d")]
  record IImeSpecifyApplets, lpVtbl : IImeSpecifyAppletsVtbl* do
    GUID = LibC::GUID.new(0x5d8e643c_u32, 0xc3a9_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xef_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc_u8, 0x8b_u8, 0x6d_u8])
    def query_interface(this : IImeSpecifyApplets*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImeSpecifyApplets*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImeSpecifyApplets*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_applet_iid_list(this : IImeSpecifyApplets*, refiid : LibC::GUID*, lpIIDList : Win32cr::UI::Input::Ime::APPLETIDLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applet_iid_list.call(this, refiid, lpIIDList)
    end

  end

  @[Extern]
  record IImePadAppletVtbl,
    query_interface : Proc(IImePadApplet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImePadApplet*, UInt32),
    release : Proc(IImePadApplet*, UInt32),
    initialize__ : Proc(IImePadApplet*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IImePadApplet*, Win32cr::Foundation::HRESULT),
    get_applet_config : Proc(IImePadApplet*, Win32cr::UI::Input::Ime::IMEAPPLETCFG*, Win32cr::Foundation::HRESULT),
    create_ui : Proc(IImePadApplet*, Win32cr::Foundation::HWND, Win32cr::UI::Input::Ime::IMEAPPLETUI*, Win32cr::Foundation::HRESULT),
    notify : Proc(IImePadApplet*, Void*, Int32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d8e643b-c3a9-11d1-afef-00805f0c8b6d")]
  record IImePadApplet, lpVtbl : IImePadAppletVtbl* do
    GUID = LibC::GUID.new(0x5d8e643b_u32, 0xc3a9_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xef_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc_u8, 0x8b_u8, 0x6d_u8])
    def query_interface(this : IImePadApplet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImePadApplet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImePadApplet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IImePadApplet*, lpIImePad : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lpIImePad)
    end
    def terminate(this : IImePadApplet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end
    def get_applet_config(this : IImePadApplet*, lpAppletCfg : Win32cr::UI::Input::Ime::IMEAPPLETCFG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applet_config.call(this, lpAppletCfg)
    end
    def create_ui(this : IImePadApplet*, hwndParent : Win32cr::Foundation::HWND, lpImeAppletUI : Win32cr::UI::Input::Ime::IMEAPPLETUI*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_ui.call(this, hwndParent, lpImeAppletUI)
    end
    def notify(this : IImePadApplet*, lpImePad : Void*, notify : Int32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, lpImePad, notify, wParam, lParam)
    end

  end

  @[Extern]
  record IImePadVtbl,
    query_interface : Proc(IImePad*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImePad*, UInt32),
    release : Proc(IImePad*, UInt32),
    request : Proc(IImePad*, Void*, Win32cr::UI::Input::Ime::IME_PAD_REQUEST_FLAGS, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d8e643a-c3a9-11d1-afef-00805f0c8b6d")]
  record IImePad, lpVtbl : IImePadVtbl* do
    GUID = LibC::GUID.new(0x5d8e643a_u32, 0xc3a9_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xef_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc_u8, 0x8b_u8, 0x6d_u8])
    def query_interface(this : IImePad*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImePad*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImePad*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request(this : IImePad*, pIImePadApplet : Void*, reqId : Win32cr::UI::Input::Ime::IME_PAD_REQUEST_FLAGS, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request.call(this, pIImePadApplet, reqId, wParam, lParam)
    end

  end

  @[Extern]
  record IImePlugInDictDictionaryListVtbl,
    query_interface : Proc(IImePlugInDictDictionaryList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImePlugInDictDictionaryList*, UInt32),
    release : Proc(IImePlugInDictDictionaryList*, UInt32),
    get_dictionaries_in_use : Proc(IImePlugInDictDictionaryList*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    delete_dictionary : Proc(IImePlugInDictDictionaryList*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("98752974-b0a6-489b-8f6f-bff3769c8eeb")]
  record IImePlugInDictDictionaryList, lpVtbl : IImePlugInDictDictionaryListVtbl* do
    GUID = LibC::GUID.new(0x98752974_u32, 0xb0a6_u16, 0x489b_u16, StaticArray[0x8f_u8, 0x6f_u8, 0xbf_u8, 0xf3_u8, 0x76_u8, 0x9c_u8, 0x8e_u8, 0xeb_u8])
    def query_interface(this : IImePlugInDictDictionaryList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImePlugInDictDictionaryList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImePlugInDictDictionaryList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dictionaries_in_use(this : IImePlugInDictDictionaryList*, prgDictionaryGUID : Win32cr::System::Com::SAFEARRAY**, prgDateCreated : Win32cr::System::Com::SAFEARRAY**, prgfEncrypted : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionaries_in_use.call(this, prgDictionaryGUID, prgDateCreated, prgfEncrypted)
    end
    def delete_dictionary(this : IImePlugInDictDictionaryList*, bstrDictionaryGUID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_dictionary.call(this, bstrDictionaryGUID)
    end

  end

  @[Extern]
  record IEnumRegisterWordAVtbl,
    query_interface : Proc(IEnumRegisterWordA*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumRegisterWordA*, UInt32),
    release : Proc(IEnumRegisterWordA*, UInt32),
    clone : Proc(IEnumRegisterWordA*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumRegisterWordA*, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDA*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumRegisterWordA*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumRegisterWordA*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("08c03412-f96b-11d0-a475-00aa006bcc59")]
  record IEnumRegisterWordA, lpVtbl : IEnumRegisterWordAVtbl* do
    GUID = LibC::GUID.new(0x8c03412_u32, 0xf96b_u16, 0x11d0_u16, StaticArray[0xa4_u8, 0x75_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])
    def query_interface(this : IEnumRegisterWordA*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumRegisterWordA*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumRegisterWordA*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumRegisterWordA*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumRegisterWordA*, ulCount : UInt32, rgRegisterWord : Win32cr::UI::Input::Ime::REGISTERWORDA*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgRegisterWord, pcFetched)
    end
    def reset(this : IEnumRegisterWordA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumRegisterWordA*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record IEnumRegisterWordWVtbl,
    query_interface : Proc(IEnumRegisterWordW*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumRegisterWordW*, UInt32),
    release : Proc(IEnumRegisterWordW*, UInt32),
    clone : Proc(IEnumRegisterWordW*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumRegisterWordW*, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDW*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumRegisterWordW*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumRegisterWordW*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4955dd31-b159-11d0-8fcf-00aa006bcc59")]
  record IEnumRegisterWordW, lpVtbl : IEnumRegisterWordWVtbl* do
    GUID = LibC::GUID.new(0x4955dd31_u32, 0xb159_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])
    def query_interface(this : IEnumRegisterWordW*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumRegisterWordW*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumRegisterWordW*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumRegisterWordW*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumRegisterWordW*, ulCount : UInt32, rgRegisterWord : Win32cr::UI::Input::Ime::REGISTERWORDW*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgRegisterWord, pcFetched)
    end
    def reset(this : IEnumRegisterWordW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumRegisterWordW*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record IEnumInputContextVtbl,
    query_interface : Proc(IEnumInputContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumInputContext*, UInt32),
    release : Proc(IEnumInputContext*, UInt32),
    clone : Proc(IEnumInputContext*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumInputContext*, UInt32, Win32cr::Globalization::HIMC*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumInputContext*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumInputContext*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("09b5eab0-f997-11d1-93d4-0060b067b86e")]
  record IEnumInputContext, lpVtbl : IEnumInputContextVtbl* do
    GUID = LibC::GUID.new(0x9b5eab0_u32, 0xf997_u16, 0x11d1_u16, StaticArray[0x93_u8, 0xd4_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IEnumInputContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumInputContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumInputContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumInputContext*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumInputContext*, ulCount : UInt32, rgInputContext : Win32cr::Globalization::HIMC*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgInputContext, pcFetched)
    end
    def reset(this : IEnumInputContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumInputContext*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record IActiveIMMRegistrarVtbl,
    query_interface : Proc(IActiveIMMRegistrar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIMMRegistrar*, UInt32),
    release : Proc(IActiveIMMRegistrar*, UInt32),
    register_ime : Proc(IActiveIMMRegistrar*, LibC::GUID*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unregister_ime : Proc(IActiveIMMRegistrar*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b3458082-bd00-11d1-939b-0060b067b86e")]
  record IActiveIMMRegistrar, lpVtbl : IActiveIMMRegistrarVtbl* do
    GUID = LibC::GUID.new(0xb3458082_u32, 0xbd00_u16, 0x11d1_u16, StaticArray[0x93_u8, 0x9b_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IActiveIMMRegistrar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIMMRegistrar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIMMRegistrar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_ime(this : IActiveIMMRegistrar*, rclsid : LibC::GUID*, lgid : UInt16, pszIconFile : Win32cr::Foundation::PWSTR, pszDesc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_ime.call(this, rclsid, lgid, pszIconFile, pszDesc)
    end
    def unregister_ime(this : IActiveIMMRegistrar*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_ime.call(this, rclsid)
    end

  end

  @[Extern]
  record IActiveIMMMessagePumpOwnerVtbl,
    query_interface : Proc(IActiveIMMMessagePumpOwner*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIMMMessagePumpOwner*, UInt32),
    release : Proc(IActiveIMMMessagePumpOwner*, UInt32),
    start : Proc(IActiveIMMMessagePumpOwner*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IActiveIMMMessagePumpOwner*, Win32cr::Foundation::HRESULT),
    on_translate_message : Proc(IActiveIMMMessagePumpOwner*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::HRESULT),
    pause : Proc(IActiveIMMMessagePumpOwner*, UInt32*, Win32cr::Foundation::HRESULT),
    resume : Proc(IActiveIMMMessagePumpOwner*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b5cf2cfa-8aeb-11d1-9364-0060b067b86e")]
  record IActiveIMMMessagePumpOwner, lpVtbl : IActiveIMMMessagePumpOwnerVtbl* do
    GUID = LibC::GUID.new(0xb5cf2cfa_u32, 0x8aeb_u16, 0x11d1_u16, StaticArray[0x93_u8, 0x64_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IActiveIMMMessagePumpOwner*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIMMMessagePumpOwner*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIMMMessagePumpOwner*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IActiveIMMMessagePumpOwner*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def end__(this : IActiveIMMMessagePumpOwner*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this)
    end
    def on_translate_message(this : IActiveIMMMessagePumpOwner*, pMsg : Win32cr::UI::WindowsAndMessaging::MSG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_translate_message.call(this, pMsg)
    end
    def pause(this : IActiveIMMMessagePumpOwner*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this, pdwCookie)
    end
    def resume(this : IActiveIMMMessagePumpOwner*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this, dwCookie)
    end

  end

  @[Extern]
  record IActiveIMMAppVtbl,
    query_interface : Proc(IActiveIMMApp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIMMApp*, UInt32),
    release : Proc(IActiveIMMApp*, UInt32),
    associate_context : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    configure_imea : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDA*, Win32cr::Foundation::HRESULT),
    configure_imew : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDW*, Win32cr::Foundation::HRESULT),
    create_context : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    destroy_context : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    enum_register_word_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    enum_register_word_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    escape_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    escape_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    get_candidate_list_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_count_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_count_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_window : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, Win32cr::UI::Input::Ime::CANDIDATEFORM*, Win32cr::Foundation::HRESULT),
    get_composition_font_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTA*, Win32cr::Foundation::HRESULT),
    get_composition_font_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTW*, Win32cr::Foundation::HRESULT),
    get_composition_string_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Int32*, Void*, Win32cr::Foundation::HRESULT),
    get_composition_string_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Int32*, Void*, Win32cr::Foundation::HRESULT),
    get_composition_window : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::COMPOSITIONFORM*, Win32cr::Foundation::HRESULT),
    get_context : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    get_conversion_list_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, Win32cr::Foundation::PSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_conversion_list_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_conversion_status : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_default_ime_wnd : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_description_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_description_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_guide_line_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_guide_line_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_file_name_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_file_name_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_open_status : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    get_property : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_register_word_style_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::UI::Input::Ime::STYLEBUFA*, UInt32*, Win32cr::Foundation::HRESULT),
    get_register_word_style_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::UI::Input::Ime::STYLEBUFW*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status_window_pos : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    get_virtual_key : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, UInt32*, Win32cr::Foundation::HRESULT),
    install_imea : Proc(IActiveIMMApp*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT),
    install_imew : Proc(IActiveIMMApp*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT),
    is_ime : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HRESULT),
    is_ui_message_a : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    is_ui_message_w : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    notify_ime : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    register_word_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    register_word_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    release_context : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    set_candidate_window : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::CANDIDATEFORM*, Win32cr::Foundation::HRESULT),
    set_composition_font_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTA*, Win32cr::Foundation::HRESULT),
    set_composition_font_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTW*, Win32cr::Foundation::HRESULT),
    set_composition_string_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_composition_string_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_composition_window : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::COMPOSITIONFORM*, Win32cr::Foundation::HRESULT),
    set_conversion_status : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_open_status : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_status_window_pos : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    simulate_hot_key : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    unregister_word_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    unregister_word_w : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    activate : Proc(IActiveIMMApp*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IActiveIMMApp*, Win32cr::Foundation::HRESULT),
    on_def_window_proc : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    filter_client_windows : Proc(IActiveIMMApp*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_code_page_a : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt32*, Win32cr::Foundation::HRESULT),
    get_lang_id : Proc(IActiveIMMApp*, Win32cr::UI::TextServices::HKL, UInt16*, Win32cr::Foundation::HRESULT),
    associate_context_ex : Proc(IActiveIMMApp*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, UInt32, Win32cr::Foundation::HRESULT),
    disable_ime : Proc(IActiveIMMApp*, UInt32, Win32cr::Foundation::HRESULT),
    get_ime_menu_items_a : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_menu_items_w : Proc(IActiveIMMApp*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_input_context : Proc(IActiveIMMApp*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("08c0e040-62d1-11d1-9326-0060b067b86e")]
  record IActiveIMMApp, lpVtbl : IActiveIMMAppVtbl* do
    GUID = LibC::GUID.new(0x8c0e040_u32, 0x62d1_u16, 0x11d1_u16, StaticArray[0x93_u8, 0x26_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IActiveIMMApp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIMMApp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIMMApp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def associate_context(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, hIME : Win32cr::Globalization::HIMC, phPrev : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_context.call(this, hWnd, hIME, phPrev)
    end
    def configure_imea(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pData : Win32cr::UI::Input::Ime::REGISTERWORDA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_imea.call(this, hKL, hWnd, dwMode, pData)
    end
    def configure_imew(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pData : Win32cr::UI::Input::Ime::REGISTERWORDW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_imew.call(this, hKL, hWnd, dwMode, pData)
    end
    def create_context(this : IActiveIMMApp*, phIMC : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_context.call(this, phIMC)
    end
    def destroy_context(this : IActiveIMMApp*, hIME : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_context.call(this, hIME)
    end
    def enum_register_word_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PSTR, pData : Void*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word_a.call(this, hKL, szReading, dwStyle, szRegister, pData, pEnum)
    end
    def enum_register_word_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR, pData : Void*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word_w.call(this, hKL, szReading, dwStyle, szRegister, pData, pEnum)
    end
    def escape_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_a.call(this, hKL, hIMC, uEscape, pData, plResult)
    end
    def escape_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_w.call(this, hKL, hIMC, uEscape, pData, plResult)
    end
    def get_candidate_list_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, uBufLen : UInt32, pCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_a.call(this, hIMC, dwIndex, uBufLen, pCandList, puCopied)
    end
    def get_candidate_list_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, uBufLen : UInt32, pCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_w.call(this, hIMC, dwIndex, uBufLen, pCandList, puCopied)
    end
    def get_candidate_list_count_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pdwListSize : UInt32*, pdwBufLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_count_a.call(this, hIMC, pdwListSize, pdwBufLen)
    end
    def get_candidate_list_count_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pdwListSize : UInt32*, pdwBufLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_count_w.call(this, hIMC, pdwListSize, pdwBufLen)
    end
    def get_candidate_window(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_window.call(this, hIMC, dwIndex, pCandidate)
    end
    def get_composition_font_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_font_a.call(this, hIMC, plf)
    end
    def get_composition_font_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_font_w.call(this, hIMC, plf)
    end
    def get_composition_string_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, plCopied : Int32*, pBuf : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_string_a.call(this, hIMC, dwIndex, dwBufLen, plCopied, pBuf)
    end
    def get_composition_string_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, plCopied : Int32*, pBuf : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_string_w.call(this, hIMC, dwIndex, dwBufLen, plCopied, pBuf)
    end
    def get_composition_window(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_window.call(this, hIMC, pCompForm)
    end
    def get_context(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, phIMC : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, hWnd, phIMC)
    end
    def get_conversion_list_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, pSrc : Win32cr::Foundation::PSTR, uBufLen : UInt32, uFlag : UInt32, pDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_list_a.call(this, hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied)
    end
    def get_conversion_list_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, pSrc : Win32cr::Foundation::PWSTR, uBufLen : UInt32, uFlag : UInt32, pDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_list_w.call(this, hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied)
    end
    def get_conversion_status(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pfdwConversion : UInt32*, pfdwSentence : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_status.call(this, hIMC, pfdwConversion, pfdwSentence)
    end
    def get_default_ime_wnd(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, phDefWnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_ime_wnd.call(this, hWnd, phDefWnd)
    end
    def get_description_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szDescription : Win32cr::Foundation::PSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_a.call(this, hKL, uBufLen, szDescription, puCopied)
    end
    def get_description_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szDescription : Win32cr::Foundation::PWSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_w.call(this, hKL, uBufLen, szDescription, puCopied)
    end
    def get_guide_line_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, pBuf : Win32cr::Foundation::PSTR, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guide_line_a.call(this, hIMC, dwIndex, dwBufLen, pBuf, pdwResult)
    end
    def get_guide_line_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, pBuf : Win32cr::Foundation::PWSTR, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guide_line_w.call(this, hIMC, dwIndex, dwBufLen, pBuf, pdwResult)
    end
    def get_ime_file_name_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szFileName : Win32cr::Foundation::PSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_file_name_a.call(this, hKL, uBufLen, szFileName, puCopied)
    end
    def get_ime_file_name_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szFileName : Win32cr::Foundation::PWSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_file_name_w.call(this, hKL, uBufLen, szFileName, puCopied)
    end
    def get_open_status(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_open_status.call(this, hIMC)
    end
    def get_property(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, fdwIndex : UInt32, pdwProperty : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, hKL, fdwIndex, pdwProperty)
    end
    def get_register_word_style_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFA*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style_a.call(this, hKL, nItem, pStyleBuf, puCopied)
    end
    def get_register_word_style_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFW*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style_w.call(this, hKL, nItem, pStyleBuf, puCopied)
    end
    def get_status_window_pos(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status_window_pos.call(this, hIMC, pptPos)
    end
    def get_virtual_key(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, puVirtualKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_virtual_key.call(this, hWnd, puVirtualKey)
    end
    def install_imea(this : IActiveIMMApp*, szIMEFileName : Win32cr::Foundation::PSTR, szLayoutText : Win32cr::Foundation::PSTR, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_imea.call(this, szIMEFileName, szLayoutText, phKL)
    end
    def install_imew(this : IActiveIMMApp*, szIMEFileName : Win32cr::Foundation::PWSTR, szLayoutText : Win32cr::Foundation::PWSTR, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_imew.call(this, szIMEFileName, szLayoutText, phKL)
    end
    def is_ime(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ime.call(this, hKL)
    end
    def is_ui_message_a(this : IActiveIMMApp*, hWndIME : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_message_a.call(this, hWndIME, msg, wParam, lParam)
    end
    def is_ui_message_w(this : IActiveIMMApp*, hWndIME : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_message_w.call(this, hWndIME, msg, wParam, lParam)
    end
    def notify_ime(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwAction : UInt32, dwIndex : UInt32, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_ime.call(this, hIMC, dwAction, dwIndex, dwValue)
    end
    def register_word_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word_a.call(this, hKL, szReading, dwStyle, szRegister)
    end
    def register_word_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word_w.call(this, hKL, szReading, dwStyle, szRegister)
    end
    def release_context(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_context.call(this, hWnd, hIMC)
    end
    def set_candidate_window(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_candidate_window.call(this, hIMC, pCandidate)
    end
    def set_composition_font_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_font_a.call(this, hIMC, plf)
    end
    def set_composition_font_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_font_w.call(this, hIMC, plf)
    end
    def set_composition_string_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string_a.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def set_composition_string_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string_w.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def set_composition_window(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_window.call(this, hIMC, pCompForm)
    end
    def set_conversion_status(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, fdwConversion : UInt32, fdwSentence : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_conversion_status.call(this, hIMC, fdwConversion, fdwSentence)
    end
    def set_open_status(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, fOpen : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_open_status.call(this, hIMC, fOpen)
    end
    def set_status_window_pos(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, pptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status_window_pos.call(this, hIMC, pptPos)
    end
    def simulate_hot_key(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, dwHotKeyID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.simulate_hot_key.call(this, hWnd, dwHotKeyID)
    end
    def unregister_word_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szUnregister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word_a.call(this, hKL, szReading, dwStyle, szUnregister)
    end
    def unregister_word_w(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szUnregister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word_w.call(this, hKL, szReading, dwStyle, szUnregister)
    end
    def activate(this : IActiveIMMApp*, fRestoreLayout : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, fRestoreLayout)
    end
    def deactivate(this : IActiveIMMApp*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def on_def_window_proc(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_def_window_proc.call(this, hWnd, msg, wParam, lParam, plResult)
    end
    def filter_client_windows(this : IActiveIMMApp*, aaClassList : UInt16*, uSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.filter_client_windows.call(this, aaClassList, uSize)
    end
    def get_code_page_a(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, uCodePage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_page_a.call(this, hKL, uCodePage)
    end
    def get_lang_id(this : IActiveIMMApp*, hKL : Win32cr::UI::TextServices::HKL, plid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lang_id.call(this, hKL, plid)
    end
    def associate_context_ex(this : IActiveIMMApp*, hWnd : Win32cr::Foundation::HWND, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_context_ex.call(this, hWnd, hIMC, dwFlags)
    end
    def disable_ime(this : IActiveIMMApp*, idThread : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_ime.call(this, idThread)
    end
    def get_ime_menu_items_a(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32, dwType : UInt32, pImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, pImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, dwSize : UInt32, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_menu_items_a.call(this, hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult)
    end
    def get_ime_menu_items_w(this : IActiveIMMApp*, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32, dwType : UInt32, pImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, pImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, dwSize : UInt32, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_menu_items_w.call(this, hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult)
    end
    def enum_input_context(this : IActiveIMMApp*, idThread : UInt32, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_input_context.call(this, idThread, ppEnum)
    end

  end

  @[Extern]
  record IActiveIMMIMEVtbl,
    query_interface : Proc(IActiveIMMIME*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIMMIME*, UInt32),
    release : Proc(IActiveIMMIME*, UInt32),
    associate_context : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    configure_imea : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDA*, Win32cr::Foundation::HRESULT),
    configure_imew : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDW*, Win32cr::Foundation::HRESULT),
    create_context : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    destroy_context : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    enum_register_word_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    enum_register_word_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    escape_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    escape_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    get_candidate_list_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_count_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_list_count_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate_window : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, Win32cr::UI::Input::Ime::CANDIDATEFORM*, Win32cr::Foundation::HRESULT),
    get_composition_font_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTA*, Win32cr::Foundation::HRESULT),
    get_composition_font_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTW*, Win32cr::Foundation::HRESULT),
    get_composition_string_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Int32*, Void*, Win32cr::Foundation::HRESULT),
    get_composition_string_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Int32*, Void*, Win32cr::Foundation::HRESULT),
    get_composition_window : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::COMPOSITIONFORM*, Win32cr::Foundation::HRESULT),
    get_context : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC*, Win32cr::Foundation::HRESULT),
    get_conversion_list_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, Win32cr::Foundation::PSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_conversion_list_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Globalization::HIMC, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    get_conversion_status : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_default_ime_wnd : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_description_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_description_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_guide_line_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_guide_line_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_file_name_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_file_name_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_open_status : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    get_property : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_register_word_style_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::UI::Input::Ime::STYLEBUFA*, UInt32*, Win32cr::Foundation::HRESULT),
    get_register_word_style_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::UI::Input::Ime::STYLEBUFW*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status_window_pos : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    get_virtual_key : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32*, Win32cr::Foundation::HRESULT),
    install_imea : Proc(IActiveIMMIME*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT),
    install_imew : Proc(IActiveIMMIME*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT),
    is_ime : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HRESULT),
    is_ui_message_a : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    is_ui_message_w : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    notify_ime : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    register_word_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    register_word_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    release_context : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    set_candidate_window : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::CANDIDATEFORM*, Win32cr::Foundation::HRESULT),
    set_composition_font_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTA*, Win32cr::Foundation::HRESULT),
    set_composition_font_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Graphics::Gdi::LOGFONTW*, Win32cr::Foundation::HRESULT),
    set_composition_string_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_composition_string_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_composition_window : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::COMPOSITIONFORM*, Win32cr::Foundation::HRESULT),
    set_conversion_status : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_open_status : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_status_window_pos : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    simulate_hot_key : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    unregister_word_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    unregister_word_w : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    generate_message : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    lock_imc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::UI::Input::Ime::INPUTCONTEXT**, Win32cr::Foundation::HRESULT),
    unlock_imc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::HRESULT),
    get_imc_lock_count : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32*, Win32cr::Foundation::HRESULT),
    create_imcc : Proc(IActiveIMMIME*, UInt32, Win32cr::Globalization::HIMCC*, Win32cr::Foundation::HRESULT),
    destroy_imcc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, Win32cr::Foundation::HRESULT),
    lock_imcc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, Void**, Win32cr::Foundation::HRESULT),
    unlock_imcc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, Win32cr::Foundation::HRESULT),
    re_size_imcc : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, UInt32, Win32cr::Globalization::HIMCC*, Win32cr::Foundation::HRESULT),
    get_imcc_size : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, UInt32*, Win32cr::Foundation::HRESULT),
    get_imcc_lock_count : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMCC, UInt32*, Win32cr::Foundation::HRESULT),
    get_hot_key : Proc(IActiveIMMIME*, UInt32, UInt32*, UInt32*, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT),
    set_hot_key : Proc(IActiveIMMIME*, UInt32, UInt32, UInt32, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HRESULT),
    create_soft_keyboard : Proc(IActiveIMMIME*, UInt32, Win32cr::Foundation::HWND, Int32, Int32, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    destroy_soft_keyboard : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    show_soft_keyboard : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Int32, Win32cr::Foundation::HRESULT),
    get_code_page_a : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt32*, Win32cr::Foundation::HRESULT),
    get_lang_id : Proc(IActiveIMMIME*, Win32cr::UI::TextServices::HKL, UInt16*, Win32cr::Foundation::HRESULT),
    keybd_event : Proc(IActiveIMMIME*, UInt16, UInt8, UInt8, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    lock_modal : Proc(IActiveIMMIME*, Win32cr::Foundation::HRESULT),
    unlock_modal : Proc(IActiveIMMIME*, Win32cr::Foundation::HRESULT),
    associate_context_ex : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, Win32cr::Globalization::HIMC, UInt32, Win32cr::Foundation::HRESULT),
    disable_ime : Proc(IActiveIMMIME*, UInt32, Win32cr::Foundation::HRESULT),
    get_ime_menu_items_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_ime_menu_items_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_input_context : Proc(IActiveIMMIME*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    request_message_a : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    request_message_w : Proc(IActiveIMMIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    send_imca : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    send_imcw : Proc(IActiveIMMIME*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    is_sleeping : Proc(IActiveIMMIME*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("08c03411-f96b-11d0-a475-00aa006bcc59")]
  record IActiveIMMIME, lpVtbl : IActiveIMMIMEVtbl* do
    GUID = LibC::GUID.new(0x8c03411_u32, 0xf96b_u16, 0x11d0_u16, StaticArray[0xa4_u8, 0x75_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])
    def query_interface(this : IActiveIMMIME*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIMMIME*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIMMIME*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def associate_context(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, hIME : Win32cr::Globalization::HIMC, phPrev : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_context.call(this, hWnd, hIME, phPrev)
    end
    def configure_imea(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pData : Win32cr::UI::Input::Ime::REGISTERWORDA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_imea.call(this, hKL, hWnd, dwMode, pData)
    end
    def configure_imew(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pData : Win32cr::UI::Input::Ime::REGISTERWORDW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_imew.call(this, hKL, hWnd, dwMode, pData)
    end
    def create_context(this : IActiveIMMIME*, phIMC : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_context.call(this, phIMC)
    end
    def destroy_context(this : IActiveIMMIME*, hIME : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_context.call(this, hIME)
    end
    def enum_register_word_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PSTR, pData : Void*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word_a.call(this, hKL, szReading, dwStyle, szRegister, pData, pEnum)
    end
    def enum_register_word_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR, pData : Void*, pEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word_w.call(this, hKL, szReading, dwStyle, szRegister, pData, pEnum)
    end
    def escape_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_a.call(this, hKL, hIMC, uEscape, pData, plResult)
    end
    def escape_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_w.call(this, hKL, hIMC, uEscape, pData, plResult)
    end
    def get_candidate_list_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, uBufLen : UInt32, pCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_a.call(this, hIMC, dwIndex, uBufLen, pCandList, puCopied)
    end
    def get_candidate_list_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, uBufLen : UInt32, pCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_w.call(this, hIMC, dwIndex, uBufLen, pCandList, puCopied)
    end
    def get_candidate_list_count_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pdwListSize : UInt32*, pdwBufLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_count_a.call(this, hIMC, pdwListSize, pdwBufLen)
    end
    def get_candidate_list_count_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pdwListSize : UInt32*, pdwBufLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_list_count_w.call(this, hIMC, pdwListSize, pdwBufLen)
    end
    def get_candidate_window(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_window.call(this, hIMC, dwIndex, pCandidate)
    end
    def get_composition_font_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_font_a.call(this, hIMC, plf)
    end
    def get_composition_font_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_font_w.call(this, hIMC, plf)
    end
    def get_composition_string_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, plCopied : Int32*, pBuf : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_string_a.call(this, hIMC, dwIndex, dwBufLen, plCopied, pBuf)
    end
    def get_composition_string_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, plCopied : Int32*, pBuf : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_string_w.call(this, hIMC, dwIndex, dwBufLen, plCopied, pBuf)
    end
    def get_composition_window(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_composition_window.call(this, hIMC, pCompForm)
    end
    def get_context(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, phIMC : Win32cr::Globalization::HIMC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, hWnd, phIMC)
    end
    def get_conversion_list_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, pSrc : Win32cr::Foundation::PSTR, uBufLen : UInt32, uFlag : UInt32, pDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_list_a.call(this, hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied)
    end
    def get_conversion_list_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, hIMC : Win32cr::Globalization::HIMC, pSrc : Win32cr::Foundation::PWSTR, uBufLen : UInt32, uFlag : UInt32, pDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_list_w.call(this, hKL, hIMC, pSrc, uBufLen, uFlag, pDst, puCopied)
    end
    def get_conversion_status(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pfdwConversion : UInt32*, pfdwSentence : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_status.call(this, hIMC, pfdwConversion, pfdwSentence)
    end
    def get_default_ime_wnd(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, phDefWnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_ime_wnd.call(this, hWnd, phDefWnd)
    end
    def get_description_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szDescription : Win32cr::Foundation::PSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_a.call(this, hKL, uBufLen, szDescription, puCopied)
    end
    def get_description_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szDescription : Win32cr::Foundation::PWSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_w.call(this, hKL, uBufLen, szDescription, puCopied)
    end
    def get_guide_line_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, pBuf : Win32cr::Foundation::PSTR, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guide_line_a.call(this, hIMC, dwIndex, dwBufLen, pBuf, pdwResult)
    end
    def get_guide_line_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, dwBufLen : UInt32, pBuf : Win32cr::Foundation::PWSTR, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guide_line_w.call(this, hIMC, dwIndex, dwBufLen, pBuf, pdwResult)
    end
    def get_ime_file_name_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szFileName : Win32cr::Foundation::PSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_file_name_a.call(this, hKL, uBufLen, szFileName, puCopied)
    end
    def get_ime_file_name_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, uBufLen : UInt32, szFileName : Win32cr::Foundation::PWSTR, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_file_name_w.call(this, hKL, uBufLen, szFileName, puCopied)
    end
    def get_open_status(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_open_status.call(this, hIMC)
    end
    def get_property(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, fdwIndex : UInt32, pdwProperty : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, hKL, fdwIndex, pdwProperty)
    end
    def get_register_word_style_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFA*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style_a.call(this, hKL, nItem, pStyleBuf, puCopied)
    end
    def get_register_word_style_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFW*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style_w.call(this, hKL, nItem, pStyleBuf, puCopied)
    end
    def get_status_window_pos(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status_window_pos.call(this, hIMC, pptPos)
    end
    def get_virtual_key(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, puVirtualKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_virtual_key.call(this, hWnd, puVirtualKey)
    end
    def install_imea(this : IActiveIMMIME*, szIMEFileName : Win32cr::Foundation::PSTR, szLayoutText : Win32cr::Foundation::PSTR, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_imea.call(this, szIMEFileName, szLayoutText, phKL)
    end
    def install_imew(this : IActiveIMMIME*, szIMEFileName : Win32cr::Foundation::PWSTR, szLayoutText : Win32cr::Foundation::PWSTR, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_imew.call(this, szIMEFileName, szLayoutText, phKL)
    end
    def is_ime(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ime.call(this, hKL)
    end
    def is_ui_message_a(this : IActiveIMMIME*, hWndIME : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_message_a.call(this, hWndIME, msg, wParam, lParam)
    end
    def is_ui_message_w(this : IActiveIMMIME*, hWndIME : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_ui_message_w.call(this, hWndIME, msg, wParam, lParam)
    end
    def notify_ime(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwAction : UInt32, dwIndex : UInt32, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_ime.call(this, hIMC, dwAction, dwIndex, dwValue)
    end
    def register_word_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word_a.call(this, hKL, szReading, dwStyle, szRegister)
    end
    def register_word_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word_w.call(this, hKL, szReading, dwStyle, szRegister)
    end
    def release_context(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_context.call(this, hWnd, hIMC)
    end
    def set_candidate_window(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_candidate_window.call(this, hIMC, pCandidate)
    end
    def set_composition_font_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_font_a.call(this, hIMC, plf)
    end
    def set_composition_font_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, plf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_font_w.call(this, hIMC, plf)
    end
    def set_composition_string_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string_a.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def set_composition_string_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string_w.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def set_composition_window(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_window.call(this, hIMC, pCompForm)
    end
    def set_conversion_status(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, fdwConversion : UInt32, fdwSentence : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_conversion_status.call(this, hIMC, fdwConversion, fdwSentence)
    end
    def set_open_status(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, fOpen : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_open_status.call(this, hIMC, fOpen)
    end
    def set_status_window_pos(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status_window_pos.call(this, hIMC, pptPos)
    end
    def simulate_hot_key(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, dwHotKeyID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.simulate_hot_key.call(this, hWnd, dwHotKeyID)
    end
    def unregister_word_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PSTR, dwStyle : UInt32, szUnregister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word_a.call(this, hKL, szReading, dwStyle, szUnregister)
    end
    def unregister_word_w(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szUnregister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word_w.call(this, hKL, szReading, dwStyle, szUnregister)
    end
    def generate_message(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_message.call(this, hIMC)
    end
    def lock_imc(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, ppIMC : Win32cr::UI::Input::Ime::INPUTCONTEXT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_imc.call(this, hIMC, ppIMC)
    end
    def unlock_imc(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_imc.call(this, hIMC)
    end
    def get_imc_lock_count(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, pdwLockCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_imc_lock_count.call(this, hIMC, pdwLockCount)
    end
    def create_imcc(this : IActiveIMMIME*, dwSize : UInt32, phIMCC : Win32cr::Globalization::HIMCC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_imcc.call(this, dwSize, phIMCC)
    end
    def destroy_imcc(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_imcc.call(this, hIMCC)
    end
    def lock_imcc(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_imcc.call(this, hIMCC, ppv)
    end
    def unlock_imcc(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_imcc.call(this, hIMCC)
    end
    def re_size_imcc(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC, dwSize : UInt32, phIMCC : Win32cr::Globalization::HIMCC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_size_imcc.call(this, hIMCC, dwSize, phIMCC)
    end
    def get_imcc_size(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_imcc_size.call(this, hIMCC, pdwSize)
    end
    def get_imcc_lock_count(this : IActiveIMMIME*, hIMCC : Win32cr::Globalization::HIMCC, pdwLockCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_imcc_lock_count.call(this, hIMCC, pdwLockCount)
    end
    def get_hot_key(this : IActiveIMMIME*, dwHotKeyID : UInt32, puModifiers : UInt32*, puVKey : UInt32*, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hot_key.call(this, dwHotKeyID, puModifiers, puVKey, phKL)
    end
    def set_hot_key(this : IActiveIMMIME*, dwHotKeyID : UInt32, uModifiers : UInt32, uVKey : UInt32, hKL : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hot_key.call(this, dwHotKeyID, uModifiers, uVKey, hKL)
    end
    def create_soft_keyboard(this : IActiveIMMIME*, uType : UInt32, hOwner : Win32cr::Foundation::HWND, x : Int32, y : Int32, phSoftKbdWnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_soft_keyboard.call(this, uType, hOwner, x, y, phSoftKbdWnd)
    end
    def destroy_soft_keyboard(this : IActiveIMMIME*, hSoftKbdWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_soft_keyboard.call(this, hSoftKbdWnd)
    end
    def show_soft_keyboard(this : IActiveIMMIME*, hSoftKbdWnd : Win32cr::Foundation::HWND, nCmdShow : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_soft_keyboard.call(this, hSoftKbdWnd, nCmdShow)
    end
    def get_code_page_a(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, uCodePage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_page_a.call(this, hKL, uCodePage)
    end
    def get_lang_id(this : IActiveIMMIME*, hKL : Win32cr::UI::TextServices::HKL, plid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lang_id.call(this, hKL, plid)
    end
    def keybd_event(this : IActiveIMMIME*, lgidIME : UInt16, bVk : UInt8, bScan : UInt8, dwFlags : UInt32, dwExtraInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.keybd_event.call(this, lgidIME, bVk, bScan, dwFlags, dwExtraInfo)
    end
    def lock_modal(this : IActiveIMMIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_modal.call(this)
    end
    def unlock_modal(this : IActiveIMMIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_modal.call(this)
    end
    def associate_context_ex(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_context_ex.call(this, hWnd, hIMC, dwFlags)
    end
    def disable_ime(this : IActiveIMMIME*, idThread : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_ime.call(this, idThread)
    end
    def get_ime_menu_items_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32, dwType : UInt32, pImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, pImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, dwSize : UInt32, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_menu_items_a.call(this, hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult)
    end
    def get_ime_menu_items_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, dwFlags : UInt32, dwType : UInt32, pImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, pImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, dwSize : UInt32, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ime_menu_items_w.call(this, hIMC, dwFlags, dwType, pImeParentMenu, pImeMenu, dwSize, pdwResult)
    end
    def enum_input_context(this : IActiveIMMIME*, idThread : UInt32, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_input_context.call(this, idThread, ppEnum)
    end
    def request_message_a(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_message_a.call(this, hIMC, wParam, lParam, plResult)
    end
    def request_message_w(this : IActiveIMMIME*, hIMC : Win32cr::Globalization::HIMC, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_message_w.call(this, hIMC, wParam, lParam, plResult)
    end
    def send_imca(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, uMsg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_imca.call(this, hWnd, uMsg, wParam, lParam, plResult)
    end
    def send_imcw(this : IActiveIMMIME*, hWnd : Win32cr::Foundation::HWND, uMsg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_imcw.call(this, hWnd, uMsg, wParam, lParam, plResult)
    end
    def is_sleeping(this : IActiveIMMIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_sleeping.call(this)
    end

  end

  @[Extern]
  record IActiveIMEVtbl,
    query_interface : Proc(IActiveIME*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIME*, UInt32),
    release : Proc(IActiveIME*, UInt32),
    inquire : Proc(IActiveIME*, UInt32, Win32cr::UI::Input::Ime::IMEINFO*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    conversion_list : Proc(IActiveIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    configure : Proc(IActiveIME*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDW*, Win32cr::Foundation::HRESULT),
    destroy : Proc(IActiveIME*, UInt32, Win32cr::Foundation::HRESULT),
    escape : Proc(IActiveIME*, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    set_active_context : Proc(IActiveIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    process_key : Proc(IActiveIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    notify : Proc(IActiveIME*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    select__ : Proc(IActiveIME*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_composition_string : Proc(IActiveIME*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    to_ascii_ex : Proc(IActiveIME*, UInt32, UInt32, UInt8*, UInt32, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    register_word : Proc(IActiveIME*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unregister_word : Proc(IActiveIME*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_register_word_style : Proc(IActiveIME*, UInt32, Win32cr::UI::Input::Ime::STYLEBUFW*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_register_word : Proc(IActiveIME*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_code_page_a : Proc(IActiveIME*, UInt32*, Win32cr::Foundation::HRESULT),
    get_lang_id : Proc(IActiveIME*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6fe20962-d077-11d0-8fe7-00aa006bcc59")]
  record IActiveIME, lpVtbl : IActiveIMEVtbl* do
    GUID = LibC::GUID.new(0x6fe20962_u32, 0xd077_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0xe7_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])
    def query_interface(this : IActiveIME*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIME*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIME*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def inquire(this : IActiveIME*, dwSystemInfoFlags : UInt32, pIMEInfo : Win32cr::UI::Input::Ime::IMEINFO*, szWndClass : Win32cr::Foundation::PWSTR, pdwPrivate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.inquire.call(this, dwSystemInfoFlags, pIMEInfo, szWndClass, pdwPrivate)
    end
    def conversion_list(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, szSource : Win32cr::Foundation::PWSTR, uFlag : UInt32, uBufLen : UInt32, pDest : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conversion_list.call(this, hIMC, szSource, uFlag, uBufLen, pDest, puCopied)
    end
    def configure(this : IActiveIME*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pRegisterWord : Win32cr::UI::Input::Ime::REGISTERWORDW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, hKL, hWnd, dwMode, pRegisterWord)
    end
    def destroy(this : IActiveIME*, uReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this, uReserved)
    end
    def escape(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape.call(this, hIMC, uEscape, pData, plResult)
    end
    def set_active_context(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, fFlag : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_context.call(this, hIMC, fFlag)
    end
    def process_key(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, uVirKey : UInt32, lParam : UInt32, pbKeyState : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_key.call(this, hIMC, uVirKey, lParam, pbKeyState)
    end
    def notify(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, dwAction : UInt32, dwIndex : UInt32, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, hIMC, dwAction, dwIndex, dwValue)
    end
    def select__(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, fSelect : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this, hIMC, fSelect)
    end
    def set_composition_string(this : IActiveIME*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def to_ascii_ex(this : IActiveIME*, uVirKey : UInt32, uScanCode : UInt32, pbKeyState : UInt8*, fuState : UInt32, hIMC : Win32cr::Globalization::HIMC, pdwTransBuf : UInt32*, puSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.to_ascii_ex.call(this, uVirKey, uScanCode, pbKeyState, fuState, hIMC, pdwTransBuf, puSize)
    end
    def register_word(this : IActiveIME*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word.call(this, szReading, dwStyle, szString)
    end
    def unregister_word(this : IActiveIME*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word.call(this, szReading, dwStyle, szString)
    end
    def get_register_word_style(this : IActiveIME*, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFW*, puBufSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style.call(this, nItem, pStyleBuf, puBufSize)
    end
    def enum_register_word(this : IActiveIME*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR, pData : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word.call(this, szReading, dwStyle, szRegister, pData, ppEnum)
    end
    def get_code_page_a(this : IActiveIME*, uCodePage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_page_a.call(this, uCodePage)
    end
    def get_lang_id(this : IActiveIME*, plid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lang_id.call(this, plid)
    end

  end

  @[Extern]
  record IActiveIME2Vtbl,
    query_interface : Proc(IActiveIME2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveIME2*, UInt32),
    release : Proc(IActiveIME2*, UInt32),
    inquire : Proc(IActiveIME2*, UInt32, Win32cr::UI::Input::Ime::IMEINFO*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    conversion_list : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::UI::Input::Ime::CANDIDATELIST*, UInt32*, Win32cr::Foundation::HRESULT),
    configure : Proc(IActiveIME2*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HWND, UInt32, Win32cr::UI::Input::Ime::REGISTERWORDW*, Win32cr::Foundation::HRESULT),
    destroy : Proc(IActiveIME2*, UInt32, Win32cr::Foundation::HRESULT),
    escape : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, UInt32, Void*, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    set_active_context : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    process_key : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    notify : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    select__ : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_composition_string : Proc(IActiveIME2*, Win32cr::Globalization::HIMC, UInt32, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    to_ascii_ex : Proc(IActiveIME2*, UInt32, UInt32, UInt8*, UInt32, Win32cr::Globalization::HIMC, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    register_word : Proc(IActiveIME2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unregister_word : Proc(IActiveIME2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_register_word_style : Proc(IActiveIME2*, UInt32, Win32cr::UI::Input::Ime::STYLEBUFW*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_register_word : Proc(IActiveIME2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_code_page_a : Proc(IActiveIME2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_lang_id : Proc(IActiveIME2*, UInt16*, Win32cr::Foundation::HRESULT),
    sleep : Proc(IActiveIME2*, Win32cr::Foundation::HRESULT),
    unsleep : Proc(IActiveIME2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1c4bf0e-2d53-11d2-93e1-0060b067b86e")]
  record IActiveIME2, lpVtbl : IActiveIME2Vtbl* do
    GUID = LibC::GUID.new(0xe1c4bf0e_u32, 0x2d53_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe1_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IActiveIME2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveIME2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveIME2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def inquire(this : IActiveIME2*, dwSystemInfoFlags : UInt32, pIMEInfo : Win32cr::UI::Input::Ime::IMEINFO*, szWndClass : Win32cr::Foundation::PWSTR, pdwPrivate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.inquire.call(this, dwSystemInfoFlags, pIMEInfo, szWndClass, pdwPrivate)
    end
    def conversion_list(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, szSource : Win32cr::Foundation::PWSTR, uFlag : UInt32, uBufLen : UInt32, pDest : Win32cr::UI::Input::Ime::CANDIDATELIST*, puCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conversion_list.call(this, hIMC, szSource, uFlag, uBufLen, pDest, puCopied)
    end
    def configure(this : IActiveIME2*, hKL : Win32cr::UI::TextServices::HKL, hWnd : Win32cr::Foundation::HWND, dwMode : UInt32, pRegisterWord : Win32cr::UI::Input::Ime::REGISTERWORDW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, hKL, hWnd, dwMode, pRegisterWord)
    end
    def destroy(this : IActiveIME2*, uReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this, uReserved)
    end
    def escape(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, uEscape : UInt32, pData : Void*, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape.call(this, hIMC, uEscape, pData, plResult)
    end
    def set_active_context(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, fFlag : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_context.call(this, hIMC, fFlag)
    end
    def process_key(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, uVirKey : UInt32, lParam : UInt32, pbKeyState : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_key.call(this, hIMC, uVirKey, lParam, pbKeyState)
    end
    def notify(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, dwAction : UInt32, dwIndex : UInt32, dwValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, hIMC, dwAction, dwIndex, dwValue)
    end
    def select__(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, fSelect : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this, hIMC, fSelect)
    end
    def set_composition_string(this : IActiveIME2*, hIMC : Win32cr::Globalization::HIMC, dwIndex : UInt32, pComp : Void*, dwCompLen : UInt32, pRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composition_string.call(this, hIMC, dwIndex, pComp, dwCompLen, pRead, dwReadLen)
    end
    def to_ascii_ex(this : IActiveIME2*, uVirKey : UInt32, uScanCode : UInt32, pbKeyState : UInt8*, fuState : UInt32, hIMC : Win32cr::Globalization::HIMC, pdwTransBuf : UInt32*, puSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.to_ascii_ex.call(this, uVirKey, uScanCode, pbKeyState, fuState, hIMC, pdwTransBuf, puSize)
    end
    def register_word(this : IActiveIME2*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_word.call(this, szReading, dwStyle, szString)
    end
    def unregister_word(this : IActiveIME2*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_word.call(this, szReading, dwStyle, szString)
    end
    def get_register_word_style(this : IActiveIME2*, nItem : UInt32, pStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFW*, puBufSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_register_word_style.call(this, nItem, pStyleBuf, puBufSize)
    end
    def enum_register_word(this : IActiveIME2*, szReading : Win32cr::Foundation::PWSTR, dwStyle : UInt32, szRegister : Win32cr::Foundation::PWSTR, pData : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_register_word.call(this, szReading, dwStyle, szRegister, pData, ppEnum)
    end
    def get_code_page_a(this : IActiveIME2*, uCodePage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_page_a.call(this, uCodePage)
    end
    def get_lang_id(this : IActiveIME2*, plid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lang_id.call(this, plid)
    end
    def sleep(this : IActiveIME2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sleep.call(this)
    end
    def unsleep(this : IActiveIME2*, fDead : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unsleep.call(this, fDead)
    end

  end

  @[Link("imm32")]
  lib C
    fun ImmInstallIMEA(lpszIMEFileName : Win32cr::Foundation::PSTR, lpszLayoutText : Win32cr::Foundation::PSTR) : Win32cr::UI::TextServices::HKL

    fun ImmInstallIMEW(lpszIMEFileName : Win32cr::Foundation::PWSTR, lpszLayoutText : Win32cr::Foundation::PWSTR) : Win32cr::UI::TextServices::HKL

    fun ImmGetDefaultIMEWnd(param0 : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    fun ImmGetDescriptionA(param0 : Win32cr::UI::TextServices::HKL, lpszDescription : UInt8*, uBufLen : UInt32) : UInt32

    fun ImmGetDescriptionW(param0 : Win32cr::UI::TextServices::HKL, lpszDescription : UInt16*, uBufLen : UInt32) : UInt32

    fun ImmGetIMEFileNameA(param0 : Win32cr::UI::TextServices::HKL, lpszFileName : UInt8*, uBufLen : UInt32) : UInt32

    fun ImmGetIMEFileNameW(param0 : Win32cr::UI::TextServices::HKL, lpszFileName : UInt16*, uBufLen : UInt32) : UInt32

    fun ImmGetProperty(param0 : Win32cr::UI::TextServices::HKL, param1 : UInt32) : UInt32

    fun ImmIsIME(param0 : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::BOOL

    fun ImmSimulateHotKey(param0 : Win32cr::Foundation::HWND, param1 : UInt32) : Win32cr::Foundation::BOOL

    fun ImmCreateContext : Win32cr::Globalization::HIMC

    fun ImmDestroyContext(param0 : Win32cr::Globalization::HIMC) : Win32cr::Foundation::BOOL

    fun ImmGetContext(param0 : Win32cr::Foundation::HWND) : Win32cr::Globalization::HIMC

    fun ImmReleaseContext(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Globalization::HIMC) : Win32cr::Foundation::BOOL

    fun ImmAssociateContext(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Globalization::HIMC) : Win32cr::Globalization::HIMC

    fun ImmAssociateContextEx(param0 : Win32cr::Foundation::HWND, param1 : Win32cr::Globalization::HIMC, param2 : UInt32) : Win32cr::Foundation::BOOL

    fun ImmGetCompositionStringA(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, lpBuf : Void*, dwBufLen : UInt32) : Int32

    fun ImmGetCompositionStringW(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, lpBuf : Void*, dwBufLen : UInt32) : Int32

    fun ImmSetCompositionStringA(param0 : Win32cr::Globalization::HIMC, dwIndex : Win32cr::UI::Input::Ime::SET_COMPOSITION_STRING_TYPE, lpComp : Void*, dwCompLen : UInt32, lpRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::BOOL

    fun ImmSetCompositionStringW(param0 : Win32cr::Globalization::HIMC, dwIndex : Win32cr::UI::Input::Ime::SET_COMPOSITION_STRING_TYPE, lpComp : Void*, dwCompLen : UInt32, lpRead : Void*, dwReadLen : UInt32) : Win32cr::Foundation::BOOL

    fun ImmGetCandidateListCountA(param0 : Win32cr::Globalization::HIMC, lpdwListCount : UInt32*) : UInt32

    fun ImmGetCandidateListCountW(param0 : Win32cr::Globalization::HIMC, lpdwListCount : UInt32*) : UInt32

    fun ImmGetCandidateListA(param0 : Win32cr::Globalization::HIMC, deIndex : UInt32, lpCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, dwBufLen : UInt32) : UInt32

    fun ImmGetCandidateListW(param0 : Win32cr::Globalization::HIMC, deIndex : UInt32, lpCandList : Win32cr::UI::Input::Ime::CANDIDATELIST*, dwBufLen : UInt32) : UInt32

    fun ImmGetGuideLineA(param0 : Win32cr::Globalization::HIMC, dwIndex : Win32cr::UI::Input::Ime::GET_GUIDE_LINE_TYPE, lpBuf : Win32cr::Foundation::PSTR, dwBufLen : UInt32) : UInt32

    fun ImmGetGuideLineW(param0 : Win32cr::Globalization::HIMC, dwIndex : Win32cr::UI::Input::Ime::GET_GUIDE_LINE_TYPE, lpBuf : Win32cr::Foundation::PWSTR, dwBufLen : UInt32) : UInt32

    fun ImmGetConversionStatus(param0 : Win32cr::Globalization::HIMC, lpfdwConversion : UInt32*, lpfdwSentence : UInt32*) : Win32cr::Foundation::BOOL

    fun ImmSetConversionStatus(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, param2 : UInt32) : Win32cr::Foundation::BOOL

    fun ImmGetOpenStatus(param0 : Win32cr::Globalization::HIMC) : Win32cr::Foundation::BOOL

    fun ImmSetOpenStatus(param0 : Win32cr::Globalization::HIMC, param1 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ImmGetCompositionFontA(param0 : Win32cr::Globalization::HIMC, lplf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::BOOL

    fun ImmGetCompositionFontW(param0 : Win32cr::Globalization::HIMC, lplf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::BOOL

    fun ImmSetCompositionFontA(param0 : Win32cr::Globalization::HIMC, lplf : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Foundation::BOOL

    fun ImmSetCompositionFontW(param0 : Win32cr::Globalization::HIMC, lplf : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Foundation::BOOL

    fun ImmConfigureIMEA(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Foundation::HWND, param2 : UInt32, param3 : Void*) : Win32cr::Foundation::BOOL

    fun ImmConfigureIMEW(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Foundation::HWND, param2 : UInt32, param3 : Void*) : Win32cr::Foundation::BOOL

    fun ImmEscapeA(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Globalization::HIMC, param2 : UInt32, param3 : Void*) : Win32cr::Foundation::LRESULT

    fun ImmEscapeW(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Globalization::HIMC, param2 : UInt32, param3 : Void*) : Win32cr::Foundation::LRESULT

    fun ImmGetConversionListA(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Globalization::HIMC, lpSrc : Win32cr::Foundation::PSTR, lpDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, dwBufLen : UInt32, uFlag : Win32cr::UI::Input::Ime::GET_CONVERSION_LIST_FLAG) : UInt32

    fun ImmGetConversionListW(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::Globalization::HIMC, lpSrc : Win32cr::Foundation::PWSTR, lpDst : Win32cr::UI::Input::Ime::CANDIDATELIST*, dwBufLen : UInt32, uFlag : Win32cr::UI::Input::Ime::GET_CONVERSION_LIST_FLAG) : UInt32

    fun ImmNotifyIME(param0 : Win32cr::Globalization::HIMC, dwAction : Win32cr::UI::Input::Ime::NOTIFY_IME_ACTION, dwIndex : Win32cr::UI::Input::Ime::NOTIFY_IME_INDEX, dwValue : UInt32) : Win32cr::Foundation::BOOL

    fun ImmGetStatusWindowPos(param0 : Win32cr::Globalization::HIMC, lpptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    fun ImmSetStatusWindowPos(param0 : Win32cr::Globalization::HIMC, lpptPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    fun ImmGetCompositionWindow(param0 : Win32cr::Globalization::HIMC, lpCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::BOOL

    fun ImmSetCompositionWindow(param0 : Win32cr::Globalization::HIMC, lpCompForm : Win32cr::UI::Input::Ime::COMPOSITIONFORM*) : Win32cr::Foundation::BOOL

    fun ImmGetCandidateWindow(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, lpCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::BOOL

    fun ImmSetCandidateWindow(param0 : Win32cr::Globalization::HIMC, lpCandidate : Win32cr::UI::Input::Ime::CANDIDATEFORM*) : Win32cr::Foundation::BOOL

    fun ImmIsUIMessageA(param0 : Win32cr::Foundation::HWND, param1 : UInt32, param2 : Win32cr::Foundation::WPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun ImmIsUIMessageW(param0 : Win32cr::Foundation::HWND, param1 : UInt32, param2 : Win32cr::Foundation::WPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun ImmGetVirtualKey(param0 : Win32cr::Foundation::HWND) : UInt32

    fun ImmRegisterWordA(param0 : Win32cr::UI::TextServices::HKL, lpszReading : Win32cr::Foundation::PSTR, param2 : UInt32, lpszRegister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun ImmRegisterWordW(param0 : Win32cr::UI::TextServices::HKL, lpszReading : Win32cr::Foundation::PWSTR, param2 : UInt32, lpszRegister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ImmUnregisterWordA(param0 : Win32cr::UI::TextServices::HKL, lpszReading : Win32cr::Foundation::PSTR, param2 : UInt32, lpszUnregister : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun ImmUnregisterWordW(param0 : Win32cr::UI::TextServices::HKL, lpszReading : Win32cr::Foundation::PWSTR, param2 : UInt32, lpszUnregister : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ImmGetRegisterWordStyleA(param0 : Win32cr::UI::TextServices::HKL, nItem : UInt32, lpStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFA*) : UInt32

    fun ImmGetRegisterWordStyleW(param0 : Win32cr::UI::TextServices::HKL, nItem : UInt32, lpStyleBuf : Win32cr::UI::Input::Ime::STYLEBUFW*) : UInt32

    fun ImmEnumRegisterWordA(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::UI::Input::Ime::REGISTERWORDENUMPROCA, lpszReading : Win32cr::Foundation::PSTR, param3 : UInt32, lpszRegister : Win32cr::Foundation::PSTR, param5 : Void*) : UInt32

    fun ImmEnumRegisterWordW(param0 : Win32cr::UI::TextServices::HKL, param1 : Win32cr::UI::Input::Ime::REGISTERWORDENUMPROCW, lpszReading : Win32cr::Foundation::PWSTR, param3 : UInt32, lpszRegister : Win32cr::Foundation::PWSTR, param5 : Void*) : UInt32

    fun ImmDisableIME(param0 : UInt32) : Win32cr::Foundation::BOOL

    fun ImmEnumInputContext(idThread : UInt32, lpfn : Win32cr::UI::Input::Ime::IMCENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun ImmGetImeMenuItemsA(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, param2 : UInt32, lpImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, lpImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOA*, dwSize : UInt32) : UInt32

    fun ImmGetImeMenuItemsW(param0 : Win32cr::Globalization::HIMC, param1 : UInt32, param2 : UInt32, lpImeParentMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, lpImeMenu : Win32cr::UI::Input::Ime::IMEMENUITEMINFOW*, dwSize : UInt32) : UInt32

    fun ImmDisableTextFrameService(idThread : UInt32) : Win32cr::Foundation::BOOL

    fun ImmDisableLegacyIME : Win32cr::Foundation::BOOL

    fun ImmGetHotKey(param0 : UInt32, lpuModifiers : UInt32*, lpuVKey : UInt32*, phKL : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    fun ImmSetHotKey(param0 : UInt32, param1 : UInt32, param2 : UInt32, param3 : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::BOOL

    fun ImmGenerateMessage(param0 : Win32cr::Globalization::HIMC) : Win32cr::Foundation::BOOL

    fun ImmRequestMessageA(param0 : Win32cr::Globalization::HIMC, param1 : Win32cr::Foundation::WPARAM, param2 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT

    fun ImmRequestMessageW(param0 : Win32cr::Globalization::HIMC, param1 : Win32cr::Foundation::WPARAM, param2 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::LRESULT

    fun ImmCreateSoftKeyboard(param0 : UInt32, param1 : Win32cr::Foundation::HWND, param2 : Int32, param3 : Int32) : Win32cr::Foundation::HWND

    fun ImmDestroySoftKeyboard(param0 : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun ImmShowSoftKeyboard(param0 : Win32cr::Foundation::HWND, param1 : Int32) : Win32cr::Foundation::BOOL

    fun ImmLockIMC(param0 : Win32cr::Globalization::HIMC) : Win32cr::UI::Input::Ime::INPUTCONTEXT*

    fun ImmUnlockIMC(param0 : Win32cr::Globalization::HIMC) : Win32cr::Foundation::BOOL

    fun ImmGetIMCLockCount(param0 : Win32cr::Globalization::HIMC) : UInt32

    fun ImmCreateIMCC(param0 : UInt32) : Win32cr::Globalization::HIMCC

    fun ImmDestroyIMCC(param0 : Win32cr::Globalization::HIMCC) : Win32cr::Globalization::HIMCC

    fun ImmLockIMCC(param0 : Win32cr::Globalization::HIMCC) : Void*

    fun ImmUnlockIMCC(param0 : Win32cr::Globalization::HIMCC) : Win32cr::Foundation::BOOL

    fun ImmGetIMCCLockCount(param0 : Win32cr::Globalization::HIMCC) : UInt32

    fun ImmReSizeIMCC(param0 : Win32cr::Globalization::HIMCC, param1 : UInt32) : Win32cr::Globalization::HIMCC

    fun ImmGetIMCCSize(param0 : Win32cr::Globalization::HIMCC) : UInt32

  end
end