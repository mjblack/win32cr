require "../../foundation.cr"
require "../../graphics/gdi.cr"
require "../../globalization.cr"
require "../../system/com.cr"
require "../../ui/windowsandmessaging.cr"
require "../../ui/textservices.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:imm32.dll")]
{% else %}
@[Link("imm32")]
{% end %}
lib LibWin32
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
  FID_MSIME_VERSION = 0_u32
  VERSION_MOUSE_OPERATION = 1_u32
  IMEMOUSERET_NOTHANDLED = -1_i32
  IMEMOUSE_VERSION = 255_u32
  IMEMOUSE_NONE = 0_u32
  IMEMOUSE_LDOWN = 1_u32
  IMEMOUSE_RDOWN = 2_u32
  IMEMOUSE_MDOWN = 4_u32
  IMEMOUSE_WUP = 16_u32
  IMEMOUSE_WDOWN = 32_u32
  FID_RECONVERT_VERSION = 268435456_u32
  VERSION_RECONVERSION = 1_u32
  VERSION_DOCUMENTFEED = 1_u32
  VERSION_QUERYPOSITION = 1_u32
  VERSION_MODEBIAS = 1_u32
  MODEBIAS_GETVERSION = 0_u32
  MODEBIAS_SETVALUE = 1_u32
  MODEBIAS_GETVALUE = 2_u32
  MODEBIASMODE_DEFAULT = 0_u32
  MODEBIASMODE_FILENAME = 1_u32
  MODEBIASMODE_READING = 2_u32
  MODEBIASMODE_DIGIT = 4_u32
  SHOWIMEPAD_DEFAULT = 0_u32
  SHOWIMEPAD_CATEGORY = 1_u32
  SHOWIMEPAD_GUID = 2_u32
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
  CActiveIMM = LibC::GUID.new(0x4955dd33_u32, 0xb159_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6b_u8, 0xcc_u8, 0x59_u8])

  alias IMCENUMPROC = Proc(HIMC, LPARAM, LibC::BOOL)
  alias REGISTERWORDENUMPROCA = Proc(PSTR, UInt32, PSTR, Void*, Int32)
  alias REGISTERWORDENUMPROCW = Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR, Void*, Int32)
  alias PFNLOG = Proc(IMEDP*, HRESULT, LibC::BOOL)
  alias Fpcreateifecommoninstancetype = Proc(Void**, HRESULT)
  alias Fpcreateifelanguageinstancetype = Proc(Guid*, Void**, HRESULT)
  alias Fpcreateifedictionaryinstancetype = Proc(Void**, HRESULT)


  enum SET_COMPOSITION_STRING_TYPE : UInt32
    SCS_SETSTR = 9
    SCS_CHANGEATTR = 18
    SCS_CHANGECLAUSE = 36
    SCS_SETRECONVERTSTRING = 65536
    SCS_QUERYRECONVERTSTRING = 131072
  end

  enum GET_GUIDE_LINE_TYPE : UInt32
    GGL_LEVEL = 1
    GGL_INDEX = 2
    GGL_STRING = 3
    GGL_PRIVATE = 4
  end

  enum NOTIFY_IME_INDEX : UInt32
    CPS_CANCEL = 4
    CPS_COMPLETE = 1
    CPS_CONVERT = 2
    CPS_REVERT = 3
  end

  enum NOTIFY_IME_ACTION : UInt32
    NI_CHANGECANDIDATELIST = 19
    NI_CLOSECANDIDATE = 17
    NI_COMPOSITIONSTR = 21
    NI_IMEMENUSELECTED = 24
    NI_OPENCANDIDATE = 16
    NI_SELECTCANDIDATESTR = 18
    NI_SETCANDIDATE_PAGESIZE = 23
    NI_SETCANDIDATE_PAGESTART = 22
  end

  enum GET_CONVERSION_LIST_FLAG : UInt32
    GCL_CONVERSION = 1
    GCL_REVERSECONVERSION = 2
    GCL_REVERSE_LENGTH = 3
  end

  enum IME_PAD_REQUEST_FLAGS : UInt32
    IMEPADREQ_INSERTSTRING = 4097
    IMEPADREQ_SENDCONTROL = 4100
    IMEPADREQ_SETAPPLETSIZE = 4104
    IMEPADREQ_GETCOMPOSITIONSTRING = 4102
    IMEPADREQ_GETCOMPOSITIONSTRINGINFO = 4108
    IMEPADREQ_DELETESTRING = 4112
    IMEPADREQ_CHANGESTRING = 4113
    IMEPADREQ_GETAPPLHWND = 4116
    IMEPADREQ_FORCEIMEPADWINDOWSHOW = 4117
    IMEPADREQ_POSTMODALNOTIFY = 4118
    IMEPADREQ_GETDEFAULTUILANGID = 4119
    IMEPADREQ_GETAPPLETUISTYLE = 4121
    IMEPADREQ_SETAPPLETUISTYLE = 4122
    IMEPADREQ_ISAPPLETACTIVE = 4123
    IMEPADREQ_ISIMEPADWINDOWVISIBLE = 4124
    IMEPADREQ_SETAPPLETMINMAXSIZE = 4125
    IMEPADREQ_GETCONVERSIONSTATUS = 4126
    IMEPADREQ_GETVERSION = 4127
    IMEPADREQ_GETCURRENTIMEINFO = 4128
  end

  enum IMEREG : Int32
    IFED_REG_HEAD = 0
    IFED_REG_TAIL = 1
    IFED_REG_DEL = 2
  end

  enum IMEFMT : Int32
    IFED_UNKNOWN = 0
    IFED_MSIME2_BIN_SYSTEM = 1
    IFED_MSIME2_BIN_USER = 2
    IFED_MSIME2_TEXT_USER = 3
    IFED_MSIME95_BIN_SYSTEM = 4
    IFED_MSIME95_BIN_USER = 5
    IFED_MSIME95_TEXT_USER = 6
    IFED_MSIME97_BIN_SYSTEM = 7
    IFED_MSIME97_BIN_USER = 8
    IFED_MSIME97_TEXT_USER = 9
    IFED_MSIME98_BIN_SYSTEM = 10
    IFED_MSIME98_BIN_USER = 11
    IFED_MSIME98_TEXT_USER = 12
    IFED_ACTIVE_DICT = 13
    IFED_ATOK9 = 14
    IFED_ATOK10 = 15
    IFED_NEC_AI_ = 16
    IFED_WX_II = 17
    IFED_WX_III = 18
    IFED_VJE_20 = 19
    IFED_MSIME98_SYSTEM_CE = 20
    IFED_MSIME_BIN_SYSTEM = 21
    IFED_MSIME_BIN_USER = 22
    IFED_MSIME_TEXT_USER = 23
    IFED_PIME2_BIN_USER = 24
    IFED_PIME2_BIN_SYSTEM = 25
    IFED_PIME2_BIN_STANDARD_SYSTEM = 26
  end

  enum IMEUCT : Int32
    IFED_UCT_NONE = 0
    IFED_UCT_STRING_SJIS = 1
    IFED_UCT_STRING_UNICODE = 2
    IFED_UCT_USER_DEFINED = 3
    IFED_UCT_MAX = 4
  end

  enum IMEREL : Int32
    IFED_REL_NONE = 0
    IFED_REL_NO = 1
    IFED_REL_GA = 2
    IFED_REL_WO = 3
    IFED_REL_NI = 4
    IFED_REL_DE = 5
    IFED_REL_YORI = 6
    IFED_REL_KARA = 7
    IFED_REL_MADE = 8
    IFED_REL_HE = 9
    IFED_REL_TO = 10
    IFED_REL_IDEOM = 11
    IFED_REL_FUKU_YOUGEN = 12
    IFED_REL_KEIYOU_YOUGEN = 13
    IFED_REL_KEIDOU1_YOUGEN = 14
    IFED_REL_KEIDOU2_YOUGEN = 15
    IFED_REL_TAIGEN = 16
    IFED_REL_YOUGEN = 17
    IFED_REL_RENTAI_MEI = 18
    IFED_REL_RENSOU = 19
    IFED_REL_KEIYOU_TO_YOUGEN = 20
    IFED_REL_KEIYOU_TARU_YOUGEN = 21
    IFED_REL_UNKNOWN1 = 22
    IFED_REL_UNKNOWN2 = 23
    IFED_REL_ALL = 24
  end

  union WDD_Anonymous2_e__Union
    cch_read : UInt16
    cch_comp : UInt16
  end
  union WDD_Anonymous1_e__Union
    w_read_pos : UInt16
    w_comp_pos : UInt16
  end
  union MORRSLT_Anonymous2_e__Union
    cch_read : UInt16
    cch_comp : UInt16
  end
  union MORRSLT_Anonymous3_e__Union
    pch_read_idx_wdd : UInt16*
    pch_comp_idx_wdd : UInt16*
  end
  union MORRSLT_Anonymous1_e__Union
    pwch_read : LibC::LPWSTR
    pwch_comp : LibC::LPWSTR
  end
  union IMEWRD_Anonymous_e__Union
    ul_pos : UInt32
    anonymous : IMEWRD_Anonymous_e__Union_Anonymous_e__Struct
  end
  union IMEKMSKEY_Anonymous1_e__Union
    dw_control : UInt32
    dw_not_used : UInt32
  end
  union IMEKMSKEY_Anonymous2_e__Union
    pwsz_dscr : Char[31]*
    pwsz_no_use : Char[31]*
  end
  union INPUTCONTEXT_lfFont_e__Union
    a : LOGFONTA
    w : LOGFONTW
  end

  struct COMPOSITIONFORM
    dw_style : UInt32
    pt_current_pos : POINT
    rc_area : RECT
  end
  struct CANDIDATEFORM
    dw_index : UInt32
    dw_style : UInt32
    pt_current_pos : POINT
    rc_area : RECT
  end
  struct CANDIDATELIST
    dw_size : UInt32
    dw_style : UInt32
    dw_count : UInt32
    dw_selection : UInt32
    dw_page_start : UInt32
    dw_page_size : UInt32
    dw_offset : UInt32[0]*
  end
  struct REGISTERWORDA
    lp_reading : PSTR
    lp_word : PSTR
  end
  struct REGISTERWORDW
    lp_reading : LibC::LPWSTR
    lp_word : LibC::LPWSTR
  end
  struct RECONVERTSTRING
    dw_size : UInt32
    dw_version : UInt32
    dw_str_len : UInt32
    dw_str_offset : UInt32
    dw_comp_str_len : UInt32
    dw_comp_str_offset : UInt32
    dw_target_str_len : UInt32
    dw_target_str_offset : UInt32
  end
  struct STYLEBUFA
    dw_style : UInt32
    sz_description : CHAR[32]*
  end
  struct STYLEBUFW
    dw_style : UInt32
    sz_description : Char[32]*
  end
  struct IMEMENUITEMINFOA
    cb_size : UInt32
    f_type : UInt32
    f_state : UInt32
    w_id : UInt32
    hbmp_checked : HBITMAP
    hbmp_unchecked : HBITMAP
    dw_item_data : UInt32
    sz_string : CHAR[80]*
    hbmp_item : HBITMAP
  end
  struct IMEMENUITEMINFOW
    cb_size : UInt32
    f_type : UInt32
    f_state : UInt32
    w_id : UInt32
    hbmp_checked : HBITMAP
    hbmp_unchecked : HBITMAP
    dw_item_data : UInt32
    sz_string : Char[80]*
    hbmp_item : HBITMAP
  end
  struct IMECHARPOSITION
    dw_size : UInt32
    dw_char_pos : UInt32
    pt : POINT
    c_line_height : UInt32
    rc_document : RECT
  end
  struct IMEDLG
    cb_imedlg : Int32
    hwnd : HANDLE
    lpwstr_word : LibC::LPWSTR
    n_tab_id : Int32
  end
  struct WDD
    w_disp_pos : UInt16
    anonymous1 : WDD_Anonymous1_e__Union
    cch_disp : UInt16
    anonymous2 : WDD_Anonymous2_e__Union
    wdd_n_reserve1 : UInt32
    n_pos : UInt16
    _bitfield : UInt16
    p_reserved : Void*
  end
  struct MORRSLT
    dw_size : UInt32
    pwch_output : LibC::LPWSTR
    cch_output : UInt16
    anonymous1 : MORRSLT_Anonymous1_e__Union
    anonymous2 : MORRSLT_Anonymous2_e__Union
    pch_input_pos : UInt16*
    pch_output_idx_wdd : UInt16*
    anonymous3 : MORRSLT_Anonymous3_e__Union
    pa_mono_ruby_pos : UInt16*
    p_wdd : WDD*
    c_wdd : Int32
    p_private : Void*
    blk_buff : Char[0]*
  end
  struct IMEWRD
    pwch_reading : LibC::LPWSTR
    pwch_display : LibC::LPWSTR
    anonymous : IMEWRD_Anonymous_e__Union
    rgul_attrs : UInt32[2]*
    cb_comment : Int32
    uct : IMEUCT
    pv_comment : Void*
  end
  struct IMEWRD_Anonymous_e__Union_Anonymous_e__Struct
    n_pos1 : UInt16
    n_pos2 : UInt16
  end
  struct IMESHF
    cb_shf : UInt16
    ver_dic : UInt16
    sz_title : CHAR[48]*
    sz_description : CHAR[256]*
    sz_copyright : CHAR[128]*
  end
  struct POSTBL
    n_pos : UInt16
    sz_name : UInt8*
  end
  struct IMEDP
    wrd_modifier : IMEWRD
    wrd_modifiee : IMEWRD
    rel_id : IMEREL
  end
  struct IMEKMSINIT
    cb_size : Int32
    h_wnd : HANDLE
  end
  struct IMEKMSKEY
    dw_status : UInt32
    dw_comp_status : UInt32
    dw_vkey : UInt32
    anonymous1 : IMEKMSKEY_Anonymous1_e__Union
    anonymous2 : IMEKMSKEY_Anonymous2_e__Union
  end
  struct IMEKMS
    cb_size : Int32
    h_imc : HIMC
    c_key_list : UInt32
    p_key_list : IMEKMSKEY*
  end
  struct IMEKMSNTFY
    cb_size : Int32
    h_imc : HIMC
    f_select : LibC::BOOL
  end
  struct IMEKMSKMP
    cb_size : Int32
    h_imc : HIMC
    id_lang : UInt16
    w_vk_start : UInt16
    w_vk_end : UInt16
    c_key_list : Int32
    p_key_list : IMEKMSKEY*
  end
  struct IMEKMSINVK
    cb_size : Int32
    h_imc : HIMC
    dw_control : UInt32
  end
  struct IMEKMSFUNCDESC
    cb_size : Int32
    id_lang : UInt16
    dw_control : UInt32
    pwsz_description : Char[128]*
  end
  struct COMPOSITIONSTRING
    dw_size : UInt32
    dw_comp_read_attr_len : UInt32
    dw_comp_read_attr_offset : UInt32
    dw_comp_read_clause_len : UInt32
    dw_comp_read_clause_offset : UInt32
    dw_comp_read_str_len : UInt32
    dw_comp_read_str_offset : UInt32
    dw_comp_attr_len : UInt32
    dw_comp_attr_offset : UInt32
    dw_comp_clause_len : UInt32
    dw_comp_clause_offset : UInt32
    dw_comp_str_len : UInt32
    dw_comp_str_offset : UInt32
    dw_cursor_pos : UInt32
    dw_delta_start : UInt32
    dw_result_read_clause_len : UInt32
    dw_result_read_clause_offset : UInt32
    dw_result_read_str_len : UInt32
    dw_result_read_str_offset : UInt32
    dw_result_clause_len : UInt32
    dw_result_clause_offset : UInt32
    dw_result_str_len : UInt32
    dw_result_str_offset : UInt32
    dw_private_size : UInt32
    dw_private_offset : UInt32
  end
  struct GUIDELINE
    dw_size : UInt32
    dw_level : UInt32
    dw_index : UInt32
    dw_str_len : UInt32
    dw_str_offset : UInt32
    dw_private_size : UInt32
    dw_private_offset : UInt32
  end
  struct TRANSMSG
    message : UInt32
    w_param : LibC::UINT_PTR
    l_param : LPARAM
  end
  struct TRANSMSGLIST
    u_msg_count : UInt32
    trans_msg : TRANSMSG[0]*
  end
  struct CANDIDATEINFO
    dw_size : UInt32
    dw_count : UInt32
    dw_offset : UInt32[32]*
    dw_private_size : UInt32
    dw_private_offset : UInt32
  end
  struct INPUTCONTEXT
    h_wnd : HANDLE
    f_open : LibC::BOOL
    pt_status_wnd_pos : POINT
    pt_soft_kbd_pos : POINT
    fdw_conversion : UInt32
    fdw_sentence : UInt32
    lf_font : INPUTCONTEXT_lfFont_e__Union
    cf_comp_form : COMPOSITIONFORM
    cf_cand_form : CANDIDATEFORM[4]*
    h_comp_str : HIMCC
    h_cand_info : HIMCC
    h_guide_line : HIMCC
    h_private : HIMCC
    dw_num_msg_buf : UInt32
    h_msg_buf : HIMCC
    fdw_init : UInt32
    dw_reserve : UInt32[3]*
  end
  struct IMEINFO
    dw_private_data_size : UInt32
    fdw_property : UInt32
    fdw_conversion_caps : UInt32
    fdw_sentence_caps : UInt32
    fdw_ui_caps : UInt32
    fdw_scs_caps : UInt32
    fdw_select_caps : UInt32
  end
  struct SOFTKBDDATA
    u_count : UInt32
    w_code : UInt16[256]*
  end
  struct APPLETIDLIST
    count : Int32
    p_iid_list : Guid*
  end
  struct IMESTRINGCANDIDATE
    u_count : UInt32
    lpwstr : LibC::LPWSTR[0]*
  end
  struct IMEITEM
    cb_size : Int32
    i_type : Int32
    lp_item_data : Void*
  end
  struct IMEITEMCANDIDATE
    u_count : UInt32
    ime_item : IMEITEM[0]*
  end
  struct Tabimestringinfo
    dw_far_east_id : UInt32
    lpwstr : LibC::LPWSTR
  end
  struct Tabimefareastinfo
    dw_size : UInt32
    dw_type : UInt32
    dw_data : UInt32[0]*
  end
  struct IMESTRINGCANDIDATEINFO
    dw_far_east_id : UInt32
    lp_far_east_info : Tabimefareastinfo*
    f_info_mask : UInt32
    i_sel_index : Int32
    u_count : UInt32
    lpwstr : LibC::LPWSTR[0]*
  end
  struct IMECOMPOSITIONSTRINGINFO
    i_comp_str_len : Int32
    i_caret_pos : Int32
    i_edit_start : Int32
    i_edit_len : Int32
    i_target_start : Int32
    i_target_len : Int32
  end
  struct IMECHARINFO
    wch : Char
    dw_char_info : UInt32
  end
  struct IMEAPPLETCFG
    dw_config : UInt32
    wch_title : Char[64]*
    wch_title_font_face : Char[32]*
    dw_char_set : UInt32
    i_category : Int32
    h_icon : HANDLE
    lang_id : UInt16
    dummy : UInt16
    l_reserved1 : LPARAM
  end
  struct IMEAPPLETUI
    hwnd : HANDLE
    dw_style : UInt32
    width : Int32
    height : Int32
    min_width : Int32
    min_height : Int32
    max_width : Int32
    max_height : Int32
    l_reserved1 : LPARAM
    l_reserved2 : LPARAM
  end
  struct APPLYCANDEXPARAM
    dw_size : UInt32
    lpwstr_display : LibC::LPWSTR
    lpwstr_reading : LibC::LPWSTR
    dw_reserved : UInt32
  end


  struct IFEClassFactoryVTbl
    query_interface : Proc(IFEClassFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFEClassFactory*, UInt32)
    release : Proc(IFEClassFactory*, UInt32)
    create_instance : Proc(IFEClassFactory*, IUnknown, Guid*, Void**, HRESULT)
    lock_server : Proc(IFEClassFactory*, LibC::BOOL, HRESULT)
  end

  struct IFEClassFactory
    lpVtbl : IFEClassFactoryVTbl*
  end

  struct IFECommonVTbl
    query_interface : Proc(IFECommon*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFECommon*, UInt32)
    release : Proc(IFECommon*, UInt32)
    is_default_ime : Proc(IFECommon*, UInt8*, Int32, HRESULT)
    set_default_ime : Proc(IFECommon*, HRESULT)
    invoke_word_reg_dialog : Proc(IFECommon*, IMEDLG*, HRESULT)
    invoke_dict_tool_dialog : Proc(IFECommon*, IMEDLG*, HRESULT)
  end

  IFECommon_GUID = LibC::GUID.new("019f7151-e6db-11d0-83c3-00c04fddb82e")
  CLSID_IFECommon = "019f7151-e6db-11d0-83c3-00c04fddb82e"
  struct IFECommon
    lpVtbl : IFECommonVTbl*
  end

  struct IFELanguageVTbl
    query_interface : Proc(IFELanguage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFELanguage*, UInt32)
    release : Proc(IFELanguage*, UInt32)
    open : Proc(IFELanguage*, HRESULT)
    close : Proc(IFELanguage*, HRESULT)
    get_j_morph_result : Proc(IFELanguage*, UInt32, UInt32, Int32, LibC::LPWSTR, UInt32*, MORRSLT**, HRESULT)
    get_conversion_mode_caps : Proc(IFELanguage*, UInt32*, HRESULT)
    get_phonetic : Proc(IFELanguage*, UInt8*, Int32, Int32, UInt8**, HRESULT)
    get_conversion : Proc(IFELanguage*, UInt8*, Int32, Int32, UInt8**, HRESULT)
  end

  IFELanguage_GUID = LibC::GUID.new("019f7152-e6db-11d0-83c3-00c04fddb82e")
  CLSID_IFELanguage = "019f7152-e6db-11d0-83c3-00c04fddb82e"
  struct IFELanguage
    lpVtbl : IFELanguageVTbl*
  end

  struct IFEDictionaryVTbl
    query_interface : Proc(IFEDictionary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFEDictionary*, UInt32)
    release : Proc(IFEDictionary*, UInt32)
    open : Proc(IFEDictionary*, UInt8*, IMESHF*, HRESULT)
    close : Proc(IFEDictionary*, HRESULT)
    get_header : Proc(IFEDictionary*, UInt8*, IMESHF*, IMEFMT*, UInt32*, HRESULT)
    display_property : Proc(IFEDictionary*, LibC::HANDLE, HRESULT)
    get_pos_table : Proc(IFEDictionary*, POSTBL**, Int32*, HRESULT)
    get_words : Proc(IFEDictionary*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, UInt32, UInt8*, UInt32, UInt32*, HRESULT)
    next_words : Proc(IFEDictionary*, UInt8*, UInt32, UInt32*, HRESULT)
    create : Proc(IFEDictionary*, PSTR, IMESHF*, HRESULT)
    set_header : Proc(IFEDictionary*, IMESHF*, HRESULT)
    exist_word : Proc(IFEDictionary*, IMEWRD*, HRESULT)
    exist_dependency : Proc(IFEDictionary*, IMEDP*, HRESULT)
    register_word : Proc(IFEDictionary*, IMEREG, IMEWRD*, HRESULT)
    register_dependency : Proc(IFEDictionary*, IMEREG, IMEDP*, HRESULT)
    get_dependencies : Proc(IFEDictionary*, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR, LibC::LPWSTR, UInt32, IMEREL, UInt32, UInt8*, UInt32, UInt32*, HRESULT)
    next_dependencies : Proc(IFEDictionary*, UInt8*, UInt32, UInt32*, HRESULT)
    convert_from_old_msime : Proc(IFEDictionary*, PSTR, PFNLOG, IMEREG, HRESULT)
    convert_from_user_to_sys : Proc(IFEDictionary*, HRESULT)
  end

  IFEDictionary_GUID = LibC::GUID.new("019f7153-e6db-11d0-83c3-00c04fddb82e")
  CLSID_IFEDictionary = "019f7153-e6db-11d0-83c3-00c04fddb82e"
  struct IFEDictionary
    lpVtbl : IFEDictionaryVTbl*
  end

  struct IImeSpecifyAppletsVTbl
    query_interface : Proc(IImeSpecifyApplets*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImeSpecifyApplets*, UInt32)
    release : Proc(IImeSpecifyApplets*, UInt32)
    get_applet_iid_list : Proc(IImeSpecifyApplets*, Guid*, APPLETIDLIST*, HRESULT)
  end

  IImeSpecifyApplets_GUID = LibC::GUID.new("5d8e643c-c3a9-11d1-afef-00805f0c8b6d")
  CLSID_IImeSpecifyApplets = "5d8e643c-c3a9-11d1-afef-00805f0c8b6d"
  struct IImeSpecifyApplets
    lpVtbl : IImeSpecifyAppletsVTbl*
  end

  struct IImePadAppletVTbl
    query_interface : Proc(IImePadApplet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImePadApplet*, UInt32)
    release : Proc(IImePadApplet*, UInt32)
    initialize : Proc(IImePadApplet*, IUnknown, HRESULT)
    terminate : Proc(IImePadApplet*, HRESULT)
    get_applet_config : Proc(IImePadApplet*, IMEAPPLETCFG*, HRESULT)
    create_ui : Proc(IImePadApplet*, LibC::HANDLE, IMEAPPLETUI*, HRESULT)
    notify : Proc(IImePadApplet*, IUnknown, Int32, LibC::UINT_PTR, LPARAM, HRESULT)
  end

  IImePadApplet_GUID = LibC::GUID.new("5d8e643b-c3a9-11d1-afef-00805f0c8b6d")
  CLSID_IImePadApplet = "5d8e643b-c3a9-11d1-afef-00805f0c8b6d"
  struct IImePadApplet
    lpVtbl : IImePadAppletVTbl*
  end

  struct IImePadVTbl
    query_interface : Proc(IImePad*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImePad*, UInt32)
    release : Proc(IImePad*, UInt32)
    request : Proc(IImePad*, IImePadApplet, IME_PAD_REQUEST_FLAGS, LibC::UINT_PTR, LPARAM, HRESULT)
  end

  IImePad_GUID = LibC::GUID.new("5d8e643a-c3a9-11d1-afef-00805f0c8b6d")
  CLSID_IImePad = "5d8e643a-c3a9-11d1-afef-00805f0c8b6d"
  struct IImePad
    lpVtbl : IImePadVTbl*
  end

  struct IImePlugInDictDictionaryListVTbl
    query_interface : Proc(IImePlugInDictDictionaryList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImePlugInDictDictionaryList*, UInt32)
    release : Proc(IImePlugInDictDictionaryList*, UInt32)
    get_dictionaries_in_use : Proc(IImePlugInDictDictionaryList*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)
    delete_dictionary : Proc(IImePlugInDictDictionaryList*, UInt8*, HRESULT)
  end

  IImePlugInDictDictionaryList_GUID = LibC::GUID.new("98752974-b0a6-489b-8f6f-bff3769c8eeb")
  CLSID_IImePlugInDictDictionaryList = "98752974-b0a6-489b-8f6f-bff3769c8eeb"
  struct IImePlugInDictDictionaryList
    lpVtbl : IImePlugInDictDictionaryListVTbl*
  end

  struct IEnumRegisterWordAVTbl
    query_interface : Proc(IEnumRegisterWordA*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumRegisterWordA*, UInt32)
    release : Proc(IEnumRegisterWordA*, UInt32)
    clone : Proc(IEnumRegisterWordA*, IEnumRegisterWordA*, HRESULT)
    next : Proc(IEnumRegisterWordA*, UInt32, REGISTERWORDA*, UInt32*, HRESULT)
    reset : Proc(IEnumRegisterWordA*, HRESULT)
    skip : Proc(IEnumRegisterWordA*, UInt32, HRESULT)
  end

  IEnumRegisterWordA_GUID = LibC::GUID.new("08c03412-f96b-11d0-a475-00aa006bcc59")
  CLSID_IEnumRegisterWordA = "08c03412-f96b-11d0-a475-00aa006bcc59"
  struct IEnumRegisterWordA
    lpVtbl : IEnumRegisterWordAVTbl*
  end

  struct IEnumRegisterWordWVTbl
    query_interface : Proc(IEnumRegisterWordW*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumRegisterWordW*, UInt32)
    release : Proc(IEnumRegisterWordW*, UInt32)
    clone : Proc(IEnumRegisterWordW*, IEnumRegisterWordW*, HRESULT)
    next : Proc(IEnumRegisterWordW*, UInt32, REGISTERWORDW*, UInt32*, HRESULT)
    reset : Proc(IEnumRegisterWordW*, HRESULT)
    skip : Proc(IEnumRegisterWordW*, UInt32, HRESULT)
  end

  IEnumRegisterWordW_GUID = LibC::GUID.new("4955dd31-b159-11d0-8fcf-00aa006bcc59")
  CLSID_IEnumRegisterWordW = "4955dd31-b159-11d0-8fcf-00aa006bcc59"
  struct IEnumRegisterWordW
    lpVtbl : IEnumRegisterWordWVTbl*
  end

  struct IEnumInputContextVTbl
    query_interface : Proc(IEnumInputContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumInputContext*, UInt32)
    release : Proc(IEnumInputContext*, UInt32)
    clone : Proc(IEnumInputContext*, IEnumInputContext*, HRESULT)
    next : Proc(IEnumInputContext*, UInt32, HIMC*, UInt32*, HRESULT)
    reset : Proc(IEnumInputContext*, HRESULT)
    skip : Proc(IEnumInputContext*, UInt32, HRESULT)
  end

  IEnumInputContext_GUID = LibC::GUID.new("09b5eab0-f997-11d1-93d4-0060b067b86e")
  CLSID_IEnumInputContext = "09b5eab0-f997-11d1-93d4-0060b067b86e"
  struct IEnumInputContext
    lpVtbl : IEnumInputContextVTbl*
  end

  struct IActiveIMMRegistrarVTbl
    query_interface : Proc(IActiveIMMRegistrar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIMMRegistrar*, UInt32)
    release : Proc(IActiveIMMRegistrar*, UInt32)
    register_ime : Proc(IActiveIMMRegistrar*, Guid*, UInt16, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    unregister_ime : Proc(IActiveIMMRegistrar*, Guid*, HRESULT)
  end

  IActiveIMMRegistrar_GUID = LibC::GUID.new("b3458082-bd00-11d1-939b-0060b067b86e")
  CLSID_IActiveIMMRegistrar = "b3458082-bd00-11d1-939b-0060b067b86e"
  struct IActiveIMMRegistrar
    lpVtbl : IActiveIMMRegistrarVTbl*
  end

  struct IActiveIMMMessagePumpOwnerVTbl
    query_interface : Proc(IActiveIMMMessagePumpOwner*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIMMMessagePumpOwner*, UInt32)
    release : Proc(IActiveIMMMessagePumpOwner*, UInt32)
    start : Proc(IActiveIMMMessagePumpOwner*, HRESULT)
    rend : Proc(IActiveIMMMessagePumpOwner*, HRESULT)
    on_translate_message : Proc(IActiveIMMMessagePumpOwner*, MSG*, HRESULT)
    pause : Proc(IActiveIMMMessagePumpOwner*, UInt32*, HRESULT)
    resume : Proc(IActiveIMMMessagePumpOwner*, UInt32, HRESULT)
  end

  IActiveIMMMessagePumpOwner_GUID = LibC::GUID.new("b5cf2cfa-8aeb-11d1-9364-0060b067b86e")
  CLSID_IActiveIMMMessagePumpOwner = "b5cf2cfa-8aeb-11d1-9364-0060b067b86e"
  struct IActiveIMMMessagePumpOwner
    lpVtbl : IActiveIMMMessagePumpOwnerVTbl*
  end

  struct IActiveIMMAppVTbl
    query_interface : Proc(IActiveIMMApp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIMMApp*, UInt32)
    release : Proc(IActiveIMMApp*, UInt32)
    associate_context : Proc(IActiveIMMApp*, LibC::HANDLE, HIMC, HIMC*, HRESULT)
    configure_imea : Proc(IActiveIMMApp*, HKL, LibC::HANDLE, UInt32, REGISTERWORDA*, HRESULT)
    configure_imew : Proc(IActiveIMMApp*, HKL, LibC::HANDLE, UInt32, REGISTERWORDW*, HRESULT)
    create_context : Proc(IActiveIMMApp*, HIMC*, HRESULT)
    destroy_context : Proc(IActiveIMMApp*, HIMC, HRESULT)
    enum_register_word_a : Proc(IActiveIMMApp*, HKL, PSTR, UInt32, PSTR, Void*, IEnumRegisterWordA*, HRESULT)
    enum_register_word_w : Proc(IActiveIMMApp*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, Void*, IEnumRegisterWordW*, HRESULT)
    escape_a : Proc(IActiveIMMApp*, HKL, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    escape_w : Proc(IActiveIMMApp*, HKL, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    get_candidate_list_a : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_candidate_list_w : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_candidate_list_count_a : Proc(IActiveIMMApp*, HIMC, UInt32*, UInt32*, HRESULT)
    get_candidate_list_count_w : Proc(IActiveIMMApp*, HIMC, UInt32*, UInt32*, HRESULT)
    get_candidate_window : Proc(IActiveIMMApp*, HIMC, UInt32, CANDIDATEFORM*, HRESULT)
    get_composition_font_a : Proc(IActiveIMMApp*, HIMC, LOGFONTA*, HRESULT)
    get_composition_font_w : Proc(IActiveIMMApp*, HIMC, LOGFONTW*, HRESULT)
    get_composition_string_a : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, Int32*, Void*, HRESULT)
    get_composition_string_w : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, Int32*, Void*, HRESULT)
    get_composition_window : Proc(IActiveIMMApp*, HIMC, COMPOSITIONFORM*, HRESULT)
    get_context : Proc(IActiveIMMApp*, LibC::HANDLE, HIMC*, HRESULT)
    get_conversion_list_a : Proc(IActiveIMMApp*, HKL, HIMC, PSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_conversion_list_w : Proc(IActiveIMMApp*, HKL, HIMC, LibC::LPWSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_conversion_status : Proc(IActiveIMMApp*, HIMC, UInt32*, UInt32*, HRESULT)
    get_default_ime_wnd : Proc(IActiveIMMApp*, LibC::HANDLE, HANDLE*, HRESULT)
    get_description_a : Proc(IActiveIMMApp*, HKL, UInt32, PSTR, UInt32*, HRESULT)
    get_description_w : Proc(IActiveIMMApp*, HKL, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_guide_line_a : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, PSTR, UInt32*, HRESULT)
    get_guide_line_w : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_ime_file_name_a : Proc(IActiveIMMApp*, HKL, UInt32, PSTR, UInt32*, HRESULT)
    get_ime_file_name_w : Proc(IActiveIMMApp*, HKL, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_open_status : Proc(IActiveIMMApp*, HIMC, HRESULT)
    get_property : Proc(IActiveIMMApp*, HKL, UInt32, UInt32*, HRESULT)
    get_register_word_style_a : Proc(IActiveIMMApp*, HKL, UInt32, STYLEBUFA*, UInt32*, HRESULT)
    get_register_word_style_w : Proc(IActiveIMMApp*, HKL, UInt32, STYLEBUFW*, UInt32*, HRESULT)
    get_status_window_pos : Proc(IActiveIMMApp*, HIMC, POINT*, HRESULT)
    get_virtual_key : Proc(IActiveIMMApp*, LibC::HANDLE, UInt32*, HRESULT)
    install_imea : Proc(IActiveIMMApp*, PSTR, PSTR, HKL*, HRESULT)
    install_imew : Proc(IActiveIMMApp*, LibC::LPWSTR, LibC::LPWSTR, HKL*, HRESULT)
    is_ime : Proc(IActiveIMMApp*, HKL, HRESULT)
    is_ui_message_a : Proc(IActiveIMMApp*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    is_ui_message_w : Proc(IActiveIMMApp*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    notify_ime : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, UInt32, HRESULT)
    register_word_a : Proc(IActiveIMMApp*, HKL, PSTR, UInt32, PSTR, HRESULT)
    register_word_w : Proc(IActiveIMMApp*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    release_context : Proc(IActiveIMMApp*, LibC::HANDLE, HIMC, HRESULT)
    set_candidate_window : Proc(IActiveIMMApp*, HIMC, CANDIDATEFORM*, HRESULT)
    set_composition_font_a : Proc(IActiveIMMApp*, HIMC, LOGFONTA*, HRESULT)
    set_composition_font_w : Proc(IActiveIMMApp*, HIMC, LOGFONTW*, HRESULT)
    set_composition_string_a : Proc(IActiveIMMApp*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    set_composition_string_w : Proc(IActiveIMMApp*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    set_composition_window : Proc(IActiveIMMApp*, HIMC, COMPOSITIONFORM*, HRESULT)
    set_conversion_status : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, HRESULT)
    set_open_status : Proc(IActiveIMMApp*, HIMC, LibC::BOOL, HRESULT)
    set_status_window_pos : Proc(IActiveIMMApp*, HIMC, POINT*, HRESULT)
    simulate_hot_key : Proc(IActiveIMMApp*, LibC::HANDLE, UInt32, HRESULT)
    unregister_word_a : Proc(IActiveIMMApp*, HKL, PSTR, UInt32, PSTR, HRESULT)
    unregister_word_w : Proc(IActiveIMMApp*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    activate : Proc(IActiveIMMApp*, LibC::BOOL, HRESULT)
    deactivate : Proc(IActiveIMMApp*, HRESULT)
    on_def_window_proc : Proc(IActiveIMMApp*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    filter_client_windows : Proc(IActiveIMMApp*, UInt16*, UInt32, HRESULT)
    get_code_page_a : Proc(IActiveIMMApp*, HKL, UInt32*, HRESULT)
    get_lang_id : Proc(IActiveIMMApp*, HKL, UInt16*, HRESULT)
    associate_context_ex : Proc(IActiveIMMApp*, LibC::HANDLE, HIMC, UInt32, HRESULT)
    disable_ime : Proc(IActiveIMMApp*, UInt32, HRESULT)
    get_ime_menu_items_a : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, IMEMENUITEMINFOA*, IMEMENUITEMINFOA*, UInt32, UInt32*, HRESULT)
    get_ime_menu_items_w : Proc(IActiveIMMApp*, HIMC, UInt32, UInt32, IMEMENUITEMINFOW*, IMEMENUITEMINFOW*, UInt32, UInt32*, HRESULT)
    enum_input_context : Proc(IActiveIMMApp*, UInt32, IEnumInputContext*, HRESULT)
  end

  IActiveIMMApp_GUID = LibC::GUID.new("08c0e040-62d1-11d1-9326-0060b067b86e")
  CLSID_IActiveIMMApp = "08c0e040-62d1-11d1-9326-0060b067b86e"
  struct IActiveIMMApp
    lpVtbl : IActiveIMMAppVTbl*
  end

  struct IActiveIMMIMEVTbl
    query_interface : Proc(IActiveIMMIME*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIMMIME*, UInt32)
    release : Proc(IActiveIMMIME*, UInt32)
    associate_context : Proc(IActiveIMMIME*, LibC::HANDLE, HIMC, HIMC*, HRESULT)
    configure_imea : Proc(IActiveIMMIME*, HKL, LibC::HANDLE, UInt32, REGISTERWORDA*, HRESULT)
    configure_imew : Proc(IActiveIMMIME*, HKL, LibC::HANDLE, UInt32, REGISTERWORDW*, HRESULT)
    create_context : Proc(IActiveIMMIME*, HIMC*, HRESULT)
    destroy_context : Proc(IActiveIMMIME*, HIMC, HRESULT)
    enum_register_word_a : Proc(IActiveIMMIME*, HKL, PSTR, UInt32, PSTR, Void*, IEnumRegisterWordA*, HRESULT)
    enum_register_word_w : Proc(IActiveIMMIME*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, Void*, IEnumRegisterWordW*, HRESULT)
    escape_a : Proc(IActiveIMMIME*, HKL, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    escape_w : Proc(IActiveIMMIME*, HKL, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    get_candidate_list_a : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_candidate_list_w : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_candidate_list_count_a : Proc(IActiveIMMIME*, HIMC, UInt32*, UInt32*, HRESULT)
    get_candidate_list_count_w : Proc(IActiveIMMIME*, HIMC, UInt32*, UInt32*, HRESULT)
    get_candidate_window : Proc(IActiveIMMIME*, HIMC, UInt32, CANDIDATEFORM*, HRESULT)
    get_composition_font_a : Proc(IActiveIMMIME*, HIMC, LOGFONTA*, HRESULT)
    get_composition_font_w : Proc(IActiveIMMIME*, HIMC, LOGFONTW*, HRESULT)
    get_composition_string_a : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, Int32*, Void*, HRESULT)
    get_composition_string_w : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, Int32*, Void*, HRESULT)
    get_composition_window : Proc(IActiveIMMIME*, HIMC, COMPOSITIONFORM*, HRESULT)
    get_context : Proc(IActiveIMMIME*, LibC::HANDLE, HIMC*, HRESULT)
    get_conversion_list_a : Proc(IActiveIMMIME*, HKL, HIMC, PSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_conversion_list_w : Proc(IActiveIMMIME*, HKL, HIMC, LibC::LPWSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    get_conversion_status : Proc(IActiveIMMIME*, HIMC, UInt32*, UInt32*, HRESULT)
    get_default_ime_wnd : Proc(IActiveIMMIME*, LibC::HANDLE, HANDLE*, HRESULT)
    get_description_a : Proc(IActiveIMMIME*, HKL, UInt32, PSTR, UInt32*, HRESULT)
    get_description_w : Proc(IActiveIMMIME*, HKL, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_guide_line_a : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, PSTR, UInt32*, HRESULT)
    get_guide_line_w : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_ime_file_name_a : Proc(IActiveIMMIME*, HKL, UInt32, PSTR, UInt32*, HRESULT)
    get_ime_file_name_w : Proc(IActiveIMMIME*, HKL, UInt32, LibC::LPWSTR, UInt32*, HRESULT)
    get_open_status : Proc(IActiveIMMIME*, HIMC, HRESULT)
    get_property : Proc(IActiveIMMIME*, HKL, UInt32, UInt32*, HRESULT)
    get_register_word_style_a : Proc(IActiveIMMIME*, HKL, UInt32, STYLEBUFA*, UInt32*, HRESULT)
    get_register_word_style_w : Proc(IActiveIMMIME*, HKL, UInt32, STYLEBUFW*, UInt32*, HRESULT)
    get_status_window_pos : Proc(IActiveIMMIME*, HIMC, POINT*, HRESULT)
    get_virtual_key : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32*, HRESULT)
    install_imea : Proc(IActiveIMMIME*, PSTR, PSTR, HKL*, HRESULT)
    install_imew : Proc(IActiveIMMIME*, LibC::LPWSTR, LibC::LPWSTR, HKL*, HRESULT)
    is_ime : Proc(IActiveIMMIME*, HKL, HRESULT)
    is_ui_message_a : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    is_ui_message_w : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    notify_ime : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, UInt32, HRESULT)
    register_word_a : Proc(IActiveIMMIME*, HKL, PSTR, UInt32, PSTR, HRESULT)
    register_word_w : Proc(IActiveIMMIME*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    release_context : Proc(IActiveIMMIME*, LibC::HANDLE, HIMC, HRESULT)
    set_candidate_window : Proc(IActiveIMMIME*, HIMC, CANDIDATEFORM*, HRESULT)
    set_composition_font_a : Proc(IActiveIMMIME*, HIMC, LOGFONTA*, HRESULT)
    set_composition_font_w : Proc(IActiveIMMIME*, HIMC, LOGFONTW*, HRESULT)
    set_composition_string_a : Proc(IActiveIMMIME*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    set_composition_string_w : Proc(IActiveIMMIME*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    set_composition_window : Proc(IActiveIMMIME*, HIMC, COMPOSITIONFORM*, HRESULT)
    set_conversion_status : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, HRESULT)
    set_open_status : Proc(IActiveIMMIME*, HIMC, LibC::BOOL, HRESULT)
    set_status_window_pos : Proc(IActiveIMMIME*, HIMC, POINT*, HRESULT)
    simulate_hot_key : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32, HRESULT)
    unregister_word_a : Proc(IActiveIMMIME*, HKL, PSTR, UInt32, PSTR, HRESULT)
    unregister_word_w : Proc(IActiveIMMIME*, HKL, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    generate_message : Proc(IActiveIMMIME*, HIMC, HRESULT)
    lock_imc : Proc(IActiveIMMIME*, HIMC, INPUTCONTEXT**, HRESULT)
    unlock_imc : Proc(IActiveIMMIME*, HIMC, HRESULT)
    get_imc_lock_count : Proc(IActiveIMMIME*, HIMC, UInt32*, HRESULT)
    create_imcc : Proc(IActiveIMMIME*, UInt32, HIMCC*, HRESULT)
    destroy_imcc : Proc(IActiveIMMIME*, HIMCC, HRESULT)
    lock_imcc : Proc(IActiveIMMIME*, HIMCC, Void**, HRESULT)
    unlock_imcc : Proc(IActiveIMMIME*, HIMCC, HRESULT)
    re_size_imcc : Proc(IActiveIMMIME*, HIMCC, UInt32, HIMCC*, HRESULT)
    get_imcc_size : Proc(IActiveIMMIME*, HIMCC, UInt32*, HRESULT)
    get_imcc_lock_count : Proc(IActiveIMMIME*, HIMCC, UInt32*, HRESULT)
    get_hot_key : Proc(IActiveIMMIME*, UInt32, UInt32*, UInt32*, HKL*, HRESULT)
    set_hot_key : Proc(IActiveIMMIME*, UInt32, UInt32, UInt32, HKL, HRESULT)
    create_soft_keyboard : Proc(IActiveIMMIME*, UInt32, LibC::HANDLE, Int32, Int32, HANDLE*, HRESULT)
    destroy_soft_keyboard : Proc(IActiveIMMIME*, LibC::HANDLE, HRESULT)
    show_soft_keyboard : Proc(IActiveIMMIME*, LibC::HANDLE, Int32, HRESULT)
    get_code_page_a : Proc(IActiveIMMIME*, HKL, UInt32*, HRESULT)
    get_lang_id : Proc(IActiveIMMIME*, HKL, UInt16*, HRESULT)
    keybd_event : Proc(IActiveIMMIME*, UInt16, UInt8, UInt8, UInt32, UInt32, HRESULT)
    lock_modal : Proc(IActiveIMMIME*, HRESULT)
    unlock_modal : Proc(IActiveIMMIME*, HRESULT)
    associate_context_ex : Proc(IActiveIMMIME*, LibC::HANDLE, HIMC, UInt32, HRESULT)
    disable_ime : Proc(IActiveIMMIME*, UInt32, HRESULT)
    get_ime_menu_items_a : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, IMEMENUITEMINFOA*, IMEMENUITEMINFOA*, UInt32, UInt32*, HRESULT)
    get_ime_menu_items_w : Proc(IActiveIMMIME*, HIMC, UInt32, UInt32, IMEMENUITEMINFOW*, IMEMENUITEMINFOW*, UInt32, UInt32*, HRESULT)
    enum_input_context : Proc(IActiveIMMIME*, UInt32, IEnumInputContext*, HRESULT)
    request_message_a : Proc(IActiveIMMIME*, HIMC, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    request_message_w : Proc(IActiveIMMIME*, HIMC, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    send_imca : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    send_imcw : Proc(IActiveIMMIME*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    is_sleeping : Proc(IActiveIMMIME*, HRESULT)
  end

  IActiveIMMIME_GUID = LibC::GUID.new("08c03411-f96b-11d0-a475-00aa006bcc59")
  CLSID_IActiveIMMIME = "08c03411-f96b-11d0-a475-00aa006bcc59"
  struct IActiveIMMIME
    lpVtbl : IActiveIMMIMEVTbl*
  end

  struct IActiveIMEVTbl
    query_interface : Proc(IActiveIME*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIME*, UInt32)
    release : Proc(IActiveIME*, UInt32)
    inquire : Proc(IActiveIME*, UInt32, IMEINFO*, LibC::LPWSTR, UInt32*, HRESULT)
    conversion_list : Proc(IActiveIME*, HIMC, LibC::LPWSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    configure : Proc(IActiveIME*, HKL, LibC::HANDLE, UInt32, REGISTERWORDW*, HRESULT)
    destroy : Proc(IActiveIME*, UInt32, HRESULT)
    escape : Proc(IActiveIME*, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    set_active_context : Proc(IActiveIME*, HIMC, LibC::BOOL, HRESULT)
    process_key : Proc(IActiveIME*, HIMC, UInt32, UInt32, UInt8*, HRESULT)
    notify : Proc(IActiveIME*, HIMC, UInt32, UInt32, UInt32, HRESULT)
    select : Proc(IActiveIME*, HIMC, LibC::BOOL, HRESULT)
    set_composition_string : Proc(IActiveIME*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    to_ascii_ex : Proc(IActiveIME*, UInt32, UInt32, UInt8*, UInt32, HIMC, UInt32*, UInt32*, HRESULT)
    register_word : Proc(IActiveIME*, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    unregister_word : Proc(IActiveIME*, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    get_register_word_style : Proc(IActiveIME*, UInt32, STYLEBUFW*, UInt32*, HRESULT)
    enum_register_word : Proc(IActiveIME*, LibC::LPWSTR, UInt32, LibC::LPWSTR, Void*, IEnumRegisterWordW*, HRESULT)
    get_code_page_a : Proc(IActiveIME*, UInt32*, HRESULT)
    get_lang_id : Proc(IActiveIME*, UInt16*, HRESULT)
  end

  IActiveIME_GUID = LibC::GUID.new("6fe20962-d077-11d0-8fe7-00aa006bcc59")
  CLSID_IActiveIME = "6fe20962-d077-11d0-8fe7-00aa006bcc59"
  struct IActiveIME
    lpVtbl : IActiveIMEVTbl*
  end

  struct IActiveIME2VTbl
    query_interface : Proc(IActiveIME2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveIME2*, UInt32)
    release : Proc(IActiveIME2*, UInt32)
    inquire : Proc(IActiveIME2*, UInt32, IMEINFO*, LibC::LPWSTR, UInt32*, HRESULT)
    conversion_list : Proc(IActiveIME2*, HIMC, LibC::LPWSTR, UInt32, UInt32, CANDIDATELIST*, UInt32*, HRESULT)
    configure : Proc(IActiveIME2*, HKL, LibC::HANDLE, UInt32, REGISTERWORDW*, HRESULT)
    destroy : Proc(IActiveIME2*, UInt32, HRESULT)
    escape : Proc(IActiveIME2*, HIMC, UInt32, Void*, LRESULT*, HRESULT)
    set_active_context : Proc(IActiveIME2*, HIMC, LibC::BOOL, HRESULT)
    process_key : Proc(IActiveIME2*, HIMC, UInt32, UInt32, UInt8*, HRESULT)
    notify : Proc(IActiveIME2*, HIMC, UInt32, UInt32, UInt32, HRESULT)
    select : Proc(IActiveIME2*, HIMC, LibC::BOOL, HRESULT)
    set_composition_string : Proc(IActiveIME2*, HIMC, UInt32, Void*, UInt32, Void*, UInt32, HRESULT)
    to_ascii_ex : Proc(IActiveIME2*, UInt32, UInt32, UInt8*, UInt32, HIMC, UInt32*, UInt32*, HRESULT)
    register_word : Proc(IActiveIME2*, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    unregister_word : Proc(IActiveIME2*, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    get_register_word_style : Proc(IActiveIME2*, UInt32, STYLEBUFW*, UInt32*, HRESULT)
    enum_register_word : Proc(IActiveIME2*, LibC::LPWSTR, UInt32, LibC::LPWSTR, Void*, IEnumRegisterWordW*, HRESULT)
    get_code_page_a : Proc(IActiveIME2*, UInt32*, HRESULT)
    get_lang_id : Proc(IActiveIME2*, UInt16*, HRESULT)
    sleep : Proc(IActiveIME2*, HRESULT)
    unsleep : Proc(IActiveIME2*, LibC::BOOL, HRESULT)
  end

  IActiveIME2_GUID = LibC::GUID.new("e1c4bf0e-2d53-11d2-93e1-0060b067b86e")
  CLSID_IActiveIME2 = "e1c4bf0e-2d53-11d2-93e1-0060b067b86e"
  struct IActiveIME2
    lpVtbl : IActiveIME2VTbl*
  end


  # Params # lpszimefilename : PSTR [In],lpszlayouttext : PSTR [In]
  fun ImmInstallIMEA(lpszimefilename : PSTR, lpszlayouttext : PSTR) : HKL

  # Params # lpszimefilename : LibC::LPWSTR [In],lpszlayouttext : LibC::LPWSTR [In]
  fun ImmInstallIMEW(lpszimefilename : LibC::LPWSTR, lpszlayouttext : LibC::LPWSTR) : HKL

  # Params # param0 : LibC::HANDLE [In]
  fun ImmGetDefaultIMEWnd(param0 : LibC::HANDLE) : HANDLE

  # Params # param0 : HKL [In],lpszdescription : UInt8* [In],ubuflen : UInt32 [In]
  fun ImmGetDescriptionA(param0 : HKL, lpszdescription : UInt8*, ubuflen : UInt32) : UInt32

  # Params # param0 : HKL [In],lpszdescription : Char* [In],ubuflen : UInt32 [In]
  fun ImmGetDescriptionW(param0 : HKL, lpszdescription : Char*, ubuflen : UInt32) : UInt32

  # Params # param0 : HKL [In],lpszfilename : UInt8* [In],ubuflen : UInt32 [In]
  fun ImmGetIMEFileNameA(param0 : HKL, lpszfilename : UInt8*, ubuflen : UInt32) : UInt32

  # Params # param0 : HKL [In],lpszfilename : Char* [In],ubuflen : UInt32 [In]
  fun ImmGetIMEFileNameW(param0 : HKL, lpszfilename : Char*, ubuflen : UInt32) : UInt32

  # Params # param0 : HKL [In],param1 : UInt32 [In]
  fun ImmGetProperty(param0 : HKL, param1 : UInt32) : UInt32

  # Params # param0 : HKL [In]
  fun ImmIsIME(param0 : HKL) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : UInt32 [In]
  fun ImmSimulateHotKey(param0 : LibC::HANDLE, param1 : UInt32) : LibC::BOOL

  # Params # 
  fun ImmCreateContext : HIMC

  # Params # param0 : HIMC [In]
  fun ImmDestroyContext(param0 : HIMC) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In]
  fun ImmGetContext(param0 : LibC::HANDLE) : HIMC

  # Params # param0 : LibC::HANDLE [In],param1 : HIMC [In]
  fun ImmReleaseContext(param0 : LibC::HANDLE, param1 : HIMC) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : HIMC [In]
  fun ImmAssociateContext(param0 : LibC::HANDLE, param1 : HIMC) : HIMC

  # Params # param0 : LibC::HANDLE [In],param1 : HIMC [In],param2 : UInt32 [In]
  fun ImmAssociateContextEx(param0 : LibC::HANDLE, param1 : HIMC, param2 : UInt32) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : UInt32 [In],lpbuf : Void* [In],dwbuflen : UInt32 [In]
  fun ImmGetCompositionStringA(param0 : HIMC, param1 : UInt32, lpbuf : Void*, dwbuflen : UInt32) : Int32

  # Params # param0 : HIMC [In],param1 : UInt32 [In],lpbuf : Void* [In],dwbuflen : UInt32 [In]
  fun ImmGetCompositionStringW(param0 : HIMC, param1 : UInt32, lpbuf : Void*, dwbuflen : UInt32) : Int32

  # Params # param0 : HIMC [In],dwindex : SET_COMPOSITION_STRING_TYPE [In],lpcomp : Void* [In],dwcomplen : UInt32 [In],lpread : Void* [In],dwreadlen : UInt32 [In]
  fun ImmSetCompositionStringA(param0 : HIMC, dwindex : SET_COMPOSITION_STRING_TYPE, lpcomp : Void*, dwcomplen : UInt32, lpread : Void*, dwreadlen : UInt32) : LibC::BOOL

  # Params # param0 : HIMC [In],dwindex : SET_COMPOSITION_STRING_TYPE [In],lpcomp : Void* [In],dwcomplen : UInt32 [In],lpread : Void* [In],dwreadlen : UInt32 [In]
  fun ImmSetCompositionStringW(param0 : HIMC, dwindex : SET_COMPOSITION_STRING_TYPE, lpcomp : Void*, dwcomplen : UInt32, lpread : Void*, dwreadlen : UInt32) : LibC::BOOL

  # Params # param0 : HIMC [In],lpdwlistcount : UInt32* [In]
  fun ImmGetCandidateListCountA(param0 : HIMC, lpdwlistcount : UInt32*) : UInt32

  # Params # param0 : HIMC [In],lpdwlistcount : UInt32* [In]
  fun ImmGetCandidateListCountW(param0 : HIMC, lpdwlistcount : UInt32*) : UInt32

  # Params # param0 : HIMC [In],deindex : UInt32 [In],lpcandlist : CANDIDATELIST* [In],dwbuflen : UInt32 [In]
  fun ImmGetCandidateListA(param0 : HIMC, deindex : UInt32, lpcandlist : CANDIDATELIST*, dwbuflen : UInt32) : UInt32

  # Params # param0 : HIMC [In],deindex : UInt32 [In],lpcandlist : CANDIDATELIST* [In],dwbuflen : UInt32 [In]
  fun ImmGetCandidateListW(param0 : HIMC, deindex : UInt32, lpcandlist : CANDIDATELIST*, dwbuflen : UInt32) : UInt32

  # Params # param0 : HIMC [In],dwindex : GET_GUIDE_LINE_TYPE [In],lpbuf : PSTR [In],dwbuflen : UInt32 [In]
  fun ImmGetGuideLineA(param0 : HIMC, dwindex : GET_GUIDE_LINE_TYPE, lpbuf : PSTR, dwbuflen : UInt32) : UInt32

  # Params # param0 : HIMC [In],dwindex : GET_GUIDE_LINE_TYPE [In],lpbuf : LibC::LPWSTR [In],dwbuflen : UInt32 [In]
  fun ImmGetGuideLineW(param0 : HIMC, dwindex : GET_GUIDE_LINE_TYPE, lpbuf : LibC::LPWSTR, dwbuflen : UInt32) : UInt32

  # Params # param0 : HIMC [In],lpfdwconversion : UInt32* [In],lpfdwsentence : UInt32* [In]
  fun ImmGetConversionStatus(param0 : HIMC, lpfdwconversion : UInt32*, lpfdwsentence : UInt32*) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : UInt32 [In],param2 : UInt32 [In]
  fun ImmSetConversionStatus(param0 : HIMC, param1 : UInt32, param2 : UInt32) : LibC::BOOL

  # Params # param0 : HIMC [In]
  fun ImmGetOpenStatus(param0 : HIMC) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : LibC::BOOL [In]
  fun ImmSetOpenStatus(param0 : HIMC, param1 : LibC::BOOL) : LibC::BOOL

  # Params # param0 : HIMC [In],lplf : LOGFONTA* [In]
  fun ImmGetCompositionFontA(param0 : HIMC, lplf : LOGFONTA*) : LibC::BOOL

  # Params # param0 : HIMC [In],lplf : LOGFONTW* [In]
  fun ImmGetCompositionFontW(param0 : HIMC, lplf : LOGFONTW*) : LibC::BOOL

  # Params # param0 : HIMC [In],lplf : LOGFONTA* [In]
  fun ImmSetCompositionFontA(param0 : HIMC, lplf : LOGFONTA*) : LibC::BOOL

  # Params # param0 : HIMC [In],lplf : LOGFONTW* [In]
  fun ImmSetCompositionFontW(param0 : HIMC, lplf : LOGFONTW*) : LibC::BOOL

  # Params # param0 : HKL [In],param1 : LibC::HANDLE [In],param2 : UInt32 [In],param3 : Void* [In]
  fun ImmConfigureIMEA(param0 : HKL, param1 : LibC::HANDLE, param2 : UInt32, param3 : Void*) : LibC::BOOL

  # Params # param0 : HKL [In],param1 : LibC::HANDLE [In],param2 : UInt32 [In],param3 : Void* [In]
  fun ImmConfigureIMEW(param0 : HKL, param1 : LibC::HANDLE, param2 : UInt32, param3 : Void*) : LibC::BOOL

  # Params # param0 : HKL [In],param1 : HIMC [In],param2 : UInt32 [In],param3 : Void* [In]
  fun ImmEscapeA(param0 : HKL, param1 : HIMC, param2 : UInt32, param3 : Void*) : LRESULT

  # Params # param0 : HKL [In],param1 : HIMC [In],param2 : UInt32 [In],param3 : Void* [In]
  fun ImmEscapeW(param0 : HKL, param1 : HIMC, param2 : UInt32, param3 : Void*) : LRESULT

  # Params # param0 : HKL [In],param1 : HIMC [In],lpsrc : PSTR [In],lpdst : CANDIDATELIST* [In],dwbuflen : UInt32 [In],uflag : GET_CONVERSION_LIST_FLAG [In]
  fun ImmGetConversionListA(param0 : HKL, param1 : HIMC, lpsrc : PSTR, lpdst : CANDIDATELIST*, dwbuflen : UInt32, uflag : GET_CONVERSION_LIST_FLAG) : UInt32

  # Params # param0 : HKL [In],param1 : HIMC [In],lpsrc : LibC::LPWSTR [In],lpdst : CANDIDATELIST* [In],dwbuflen : UInt32 [In],uflag : GET_CONVERSION_LIST_FLAG [In]
  fun ImmGetConversionListW(param0 : HKL, param1 : HIMC, lpsrc : LibC::LPWSTR, lpdst : CANDIDATELIST*, dwbuflen : UInt32, uflag : GET_CONVERSION_LIST_FLAG) : UInt32

  # Params # param0 : HIMC [In],dwaction : NOTIFY_IME_ACTION [In],dwindex : NOTIFY_IME_INDEX [In],dwvalue : UInt32 [In]
  fun ImmNotifyIME(param0 : HIMC, dwaction : NOTIFY_IME_ACTION, dwindex : NOTIFY_IME_INDEX, dwvalue : UInt32) : LibC::BOOL

  # Params # param0 : HIMC [In],lpptpos : POINT* [In]
  fun ImmGetStatusWindowPos(param0 : HIMC, lpptpos : POINT*) : LibC::BOOL

  # Params # param0 : HIMC [In],lpptpos : POINT* [In]
  fun ImmSetStatusWindowPos(param0 : HIMC, lpptpos : POINT*) : LibC::BOOL

  # Params # param0 : HIMC [In],lpcompform : COMPOSITIONFORM* [In]
  fun ImmGetCompositionWindow(param0 : HIMC, lpcompform : COMPOSITIONFORM*) : LibC::BOOL

  # Params # param0 : HIMC [In],lpcompform : COMPOSITIONFORM* [In]
  fun ImmSetCompositionWindow(param0 : HIMC, lpcompform : COMPOSITIONFORM*) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : UInt32 [In],lpcandidate : CANDIDATEFORM* [In]
  fun ImmGetCandidateWindow(param0 : HIMC, param1 : UInt32, lpcandidate : CANDIDATEFORM*) : LibC::BOOL

  # Params # param0 : HIMC [In],lpcandidate : CANDIDATEFORM* [In]
  fun ImmSetCandidateWindow(param0 : HIMC, lpcandidate : CANDIDATEFORM*) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : UInt32 [In],param2 : LibC::UINT_PTR [In],param3 : LPARAM [In]
  fun ImmIsUIMessageA(param0 : LibC::HANDLE, param1 : UInt32, param2 : LibC::UINT_PTR, param3 : LPARAM) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : UInt32 [In],param2 : LibC::UINT_PTR [In],param3 : LPARAM [In]
  fun ImmIsUIMessageW(param0 : LibC::HANDLE, param1 : UInt32, param2 : LibC::UINT_PTR, param3 : LPARAM) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In]
  fun ImmGetVirtualKey(param0 : LibC::HANDLE) : UInt32

  # Params # param0 : HKL [In],lpszreading : PSTR [In],param2 : UInt32 [In],lpszregister : PSTR [In]
  fun ImmRegisterWordA(param0 : HKL, lpszreading : PSTR, param2 : UInt32, lpszregister : PSTR) : LibC::BOOL

  # Params # param0 : HKL [In],lpszreading : LibC::LPWSTR [In],param2 : UInt32 [In],lpszregister : LibC::LPWSTR [In]
  fun ImmRegisterWordW(param0 : HKL, lpszreading : LibC::LPWSTR, param2 : UInt32, lpszregister : LibC::LPWSTR) : LibC::BOOL

  # Params # param0 : HKL [In],lpszreading : PSTR [In],param2 : UInt32 [In],lpszunregister : PSTR [In]
  fun ImmUnregisterWordA(param0 : HKL, lpszreading : PSTR, param2 : UInt32, lpszunregister : PSTR) : LibC::BOOL

  # Params # param0 : HKL [In],lpszreading : LibC::LPWSTR [In],param2 : UInt32 [In],lpszunregister : LibC::LPWSTR [In]
  fun ImmUnregisterWordW(param0 : HKL, lpszreading : LibC::LPWSTR, param2 : UInt32, lpszunregister : LibC::LPWSTR) : LibC::BOOL

  # Params # param0 : HKL [In],nitem : UInt32 [In],lpstylebuf : STYLEBUFA* [In]
  fun ImmGetRegisterWordStyleA(param0 : HKL, nitem : UInt32, lpstylebuf : STYLEBUFA*) : UInt32

  # Params # param0 : HKL [In],nitem : UInt32 [In],lpstylebuf : STYLEBUFW* [In]
  fun ImmGetRegisterWordStyleW(param0 : HKL, nitem : UInt32, lpstylebuf : STYLEBUFW*) : UInt32

  # Params # param0 : HKL [In],param1 : REGISTERWORDENUMPROCA [In],lpszreading : PSTR [In],param3 : UInt32 [In],lpszregister : PSTR [In],param5 : Void* [In]
  fun ImmEnumRegisterWordA(param0 : HKL, param1 : REGISTERWORDENUMPROCA, lpszreading : PSTR, param3 : UInt32, lpszregister : PSTR, param5 : Void*) : UInt32

  # Params # param0 : HKL [In],param1 : REGISTERWORDENUMPROCW [In],lpszreading : LibC::LPWSTR [In],param3 : UInt32 [In],lpszregister : LibC::LPWSTR [In],param5 : Void* [In]
  fun ImmEnumRegisterWordW(param0 : HKL, param1 : REGISTERWORDENUMPROCW, lpszreading : LibC::LPWSTR, param3 : UInt32, lpszregister : LibC::LPWSTR, param5 : Void*) : UInt32

  # Params # param0 : UInt32 [In]
  fun ImmDisableIME(param0 : UInt32) : LibC::BOOL

  # Params # idthread : UInt32 [In],lpfn : IMCENUMPROC [In],lparam : LPARAM [In]
  fun ImmEnumInputContext(idthread : UInt32, lpfn : IMCENUMPROC, lparam : LPARAM) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : UInt32 [In],param2 : UInt32 [In],lpimeparentmenu : IMEMENUITEMINFOA* [In],lpimemenu : IMEMENUITEMINFOA* [In],dwsize : UInt32 [In]
  fun ImmGetImeMenuItemsA(param0 : HIMC, param1 : UInt32, param2 : UInt32, lpimeparentmenu : IMEMENUITEMINFOA*, lpimemenu : IMEMENUITEMINFOA*, dwsize : UInt32) : UInt32

  # Params # param0 : HIMC [In],param1 : UInt32 [In],param2 : UInt32 [In],lpimeparentmenu : IMEMENUITEMINFOW* [In],lpimemenu : IMEMENUITEMINFOW* [In],dwsize : UInt32 [In]
  fun ImmGetImeMenuItemsW(param0 : HIMC, param1 : UInt32, param2 : UInt32, lpimeparentmenu : IMEMENUITEMINFOW*, lpimemenu : IMEMENUITEMINFOW*, dwsize : UInt32) : UInt32

  # Params # idthread : UInt32 [In]
  fun ImmDisableTextFrameService(idthread : UInt32) : LibC::BOOL

  # Params # 
  fun ImmDisableLegacyIME : LibC::BOOL

  # Params # param0 : UInt32 [In],lpumodifiers : UInt32* [In],lpuvkey : UInt32* [In],phkl : LibC::IntPtrT* [In]
  fun ImmGetHotKey(param0 : UInt32, lpumodifiers : UInt32*, lpuvkey : UInt32*, phkl : LibC::IntPtrT*) : LibC::BOOL

  # Params # param0 : UInt32 [In],param1 : UInt32 [In],param2 : UInt32 [In],param3 : HKL [In]
  fun ImmSetHotKey(param0 : UInt32, param1 : UInt32, param2 : UInt32, param3 : HKL) : LibC::BOOL

  # Params # param0 : HIMC [In]
  fun ImmGenerateMessage(param0 : HIMC) : LibC::BOOL

  # Params # param0 : HIMC [In],param1 : LibC::UINT_PTR [In],param2 : LPARAM [In]
  fun ImmRequestMessageA(param0 : HIMC, param1 : LibC::UINT_PTR, param2 : LPARAM) : LRESULT

  # Params # param0 : HIMC [In],param1 : LibC::UINT_PTR [In],param2 : LPARAM [In]
  fun ImmRequestMessageW(param0 : HIMC, param1 : LibC::UINT_PTR, param2 : LPARAM) : LRESULT

  # Params # param0 : UInt32 [In],param1 : LibC::HANDLE [In],param2 : Int32 [In],param3 : Int32 [In]
  fun ImmCreateSoftKeyboard(param0 : UInt32, param1 : LibC::HANDLE, param2 : Int32, param3 : Int32) : HANDLE

  # Params # param0 : LibC::HANDLE [In]
  fun ImmDestroySoftKeyboard(param0 : LibC::HANDLE) : LibC::BOOL

  # Params # param0 : LibC::HANDLE [In],param1 : Int32 [In]
  fun ImmShowSoftKeyboard(param0 : LibC::HANDLE, param1 : Int32) : LibC::BOOL

  # Params # param0 : HIMC [In]
  fun ImmLockIMC(param0 : HIMC) : INPUTCONTEXT*

  # Params # param0 : HIMC [In]
  fun ImmUnlockIMC(param0 : HIMC) : LibC::BOOL

  # Params # param0 : HIMC [In]
  fun ImmGetIMCLockCount(param0 : HIMC) : UInt32

  # Params # param0 : UInt32 [In]
  fun ImmCreateIMCC(param0 : UInt32) : HIMCC

  # Params # param0 : HIMCC [In]
  fun ImmDestroyIMCC(param0 : HIMCC) : HIMCC

  # Params # param0 : HIMCC [In]
  fun ImmLockIMCC(param0 : HIMCC) : Void*

  # Params # param0 : HIMCC [In]
  fun ImmUnlockIMCC(param0 : HIMCC) : LibC::BOOL

  # Params # param0 : HIMCC [In]
  fun ImmGetIMCCLockCount(param0 : HIMCC) : UInt32

  # Params # param0 : HIMCC [In],param1 : UInt32 [In]
  fun ImmReSizeIMCC(param0 : HIMCC, param1 : UInt32) : HIMCC

  # Params # param0 : HIMCC [In]
  fun ImmGetIMCCSize(param0 : HIMCC) : UInt32
end
