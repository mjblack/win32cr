require "./../foundation.cr"
require "./../system/com.cr"
require "./../graphics/gdi.cr"
require "./../system/ole.cr"
require "./controls.cr"

module Win32cr::UI::TabletPC
  alias HRECOALT = LibC::IntPtrT
  alias HRECOCONTEXT = LibC::IntPtrT
  alias HRECOGNIZER = LibC::IntPtrT
  alias HRECOLATTICE = LibC::IntPtrT
  alias HRECOWORDLIST = LibC::IntPtrT
  alias PfnRecoCallback = Proc(UInt32, UInt8*, Win32cr::UI::TabletPC::HRECOCONTEXT, Win32cr::Foundation::HRESULT)*

  MICROSOFT_URL_EXPERIENCE_PROPERTY = "Microsoft TIP URL Experience"
  MICROSOFT_TIP_NO_INSERT_BUTTON_PROPERTY = "Microsoft TIP No Insert Option"
  MICROSOFT_TIP_COMBOBOXLIST_PROPERTY = "Microsoft TIP ComboBox List Window Identifier"
  MICROSOFT_TIP_OPENING_MSG = "TabletInputPanelOpening"
  SAFE_PARTIAL = 1_u32
  BEST_COMPLETE = 2_u32
  MAX_VENDORNAME = 32_u32
  MAX_FRIENDLYNAME = 64_u32
  MAX_LANGUAGES = 64_u32
  CAC_FULL = 0_u32
  CAC_PREFIX = 1_u32
  CAC_RANDOM = 2_u32
  ASYNC_RECO_INTERRUPTED = 1_u32
  ASYNC_RECO_PROCESS_FAILED = 2_u32
  ASYNC_RECO_ADDSTROKE_FAILED = 4_u32
  ASYNC_RECO_SETCACMODE_FAILED = 8_u32
  ASYNC_RECO_RESETCONTEXT_FAILED = 16_u32
  ASYNC_RECO_SETGUIDE_FAILED = 32_u32
  ASYNC_RECO_SETFLAGS_FAILED = 64_u32
  ASYNC_RECO_SETFACTOID_FAILED = 128_u32
  ASYNC_RECO_SETTEXTCONTEXT_FAILED = 256_u32
  ASYNC_RECO_SETWORDLIST_FAILED = 512_u32
  RF_DONTCARE = 1_i32
  RF_OBJECT = 2_i32
  RF_FREE_INPUT = 4_i32
  RF_LINED_INPUT = 8_i32
  RF_BOXED_INPUT = 16_i32
  RF_CAC_INPUT = 32_i32
  RF_RIGHT_AND_DOWN = 64_i32
  RF_LEFT_AND_DOWN = 128_i32
  RF_DOWN_AND_LEFT = 256_i32
  RF_DOWN_AND_RIGHT = 512_i32
  RF_ARBITRARY_ANGLE = 1024_i32
  RF_LATTICE = 2048_i32
  RF_ADVISEINKCHANGE = 4096_i32
  RF_STROKEREORDER = 8192_i32
  RF_PERSONALIZABLE = 16384_i32
  RF_PERFORMSLINEBREAKING = 65536_i32
  RF_REQUIRESSEGMENTATIONBREAKING = 131072_i32
  FLICK_WM_HANDLED_MASK = 1_u32
  NUM_FLICK_DIRECTIONS = 8_u32
  WM_TABLET_DEFBASE = 704_u32
  WM_TABLET_MAXOFFSET = 32_u32
  WM_TABLET_ADDED = 712_u32
  WM_TABLET_DELETED = 713_u32
  WM_TABLET_FLICK = 715_u32
  WM_TABLET_QUERYSYSTEMGESTURESTATUS = 716_u32
  TABLET_DISABLE_PRESSANDHOLD = 1_u32
  TABLET_DISABLE_PENTAPFEEDBACK = 8_u32
  TABLET_DISABLE_PENBARRELFEEDBACK = 16_u32
  TABLET_DISABLE_TOUCHUIFORCEON = 256_u32
  TABLET_DISABLE_TOUCHUIFORCEOFF = 512_u32
  TABLET_DISABLE_TOUCHSWITCH = 32768_u32
  TABLET_DISABLE_FLICKS = 65536_u32
  TABLET_ENABLE_FLICKSONCONTEXT = 131072_u32
  TABLET_ENABLE_FLICKLEARNINGMODE = 262144_u32
  TABLET_DISABLE_SMOOTHSCROLLING = 524288_u32
  TABLET_DISABLE_FLICKFALLBACKKEYS = 1048576_u32
  TABLET_ENABLE_MULTITOUCHDATA = 16777216_u32
  MAX_PACKET_PROPERTY_COUNT = 32_u32
  MAX_PACKET_BUTTON_COUNT = 32_u32
  IP_CURSOR_DOWN = 1_u32
  IP_INVERTED = 2_u32
  IP_MARGIN = 4_u32
  INK_SERIALIZED_FORMAT = "Ink Serialized Format"
  STR_GUID_X = "{598A6A8F-52C0-4BA0-93AF-AF357411A561}"
  STR_GUID_Y = "{B53F9F75-04E0-4498-A7EE-C30DBB5A9011}"
  STR_GUID_Z = "{735ADB30-0EBB-4788-A0E4-0F316490055D}"
  STR_GUID_PAKETSTATUS = "{6E0E07BF-AFE7-4CF7-87D1-AF6446208418}"
  STR_GUID_TIMERTICK = "{436510C5-FED3-45D1-8B76-71D3EA7A829D}"
  STR_GUID_SERIALNUMBER = "{78A81B56-0935-4493-BAAE-00541A8A16C4}"
  STR_GUID_NORMALPRESSURE = "{7307502D-F9F4-4E18-B3F2-2CE1B1A3610C}"
  STR_GUID_TANGENTPRESSURE = "{6DA4488B-5244-41EC-905B-32D89AB80809}"
  STR_GUID_BUTTONPRESSURE = "{8B7FEFC4-96AA-4BFE-AC26-8A5F0BE07BF5}"
  STR_GUID_XTILTORIENTATION = "{A8D07B3A-8BF0-40B0-95A9-B80A6BB787BF}"
  STR_GUID_YTILTORIENTATION = "{0E932389-1D77-43AF-AC00-5B950D6D4B2D}"
  STR_GUID_AZIMUTHORIENTATION = "{029123B4-8828-410B-B250-A0536595E5DC}"
  STR_GUID_ALTITUDEORIENTATION = "{82DEC5C7-F6BA-4906-894F-66D68DFC456C}"
  STR_GUID_TWISTORIENTATION = "{0D324960-13B2-41E4-ACE6-7AE9D43D2D3B}"
  STR_GUID_PITCHROTATION = "{7F7E57B7-BE37-4BE1-A356-7A84160E1893}"
  STR_GUID_ROLLROTATION = "{5D5D5E56-6BA9-4C5B-9FB0-851C91714E56}"
  STR_GUID_YAWROTATION = "{6A849980-7C3A-45B7-AA82-90A262950E89}"
  STR_GUID_WIDTH = "{BAABE94D-2712-48F5-BE9D-8F8B5EA0711A}"
  STR_GUID_HEIGHT = "{E61858D2-E447-4218-9D3F-18865C203DF4}"
  STR_GUID_FINGERCONTACTCONFIDENCE = "{E706C804-57F0-4F00-8A0C-853D57789BE9}"
  STR_GUID_DEVICE_CONTACT_ID = "{02585B91-049B-4750-9615-DF8948AB3C9C}"
  INKRECOGNITIONPROPERTY_LINENUMBER = "{DBF29F2C-5289-4BE8-B3D8-6EF63246253E}"
  INKRECOGNITIONPROPERTY_BOXNUMBER = "{2C243E3A-F733-4EB6-B1F8-B5DC5C2C4CDA}"
  INKRECOGNITIONPROPERTY_SEGMENTATION = "{B3C0FE6C-FB51-4164-BA2F-844AF8F983DA}"
  INKRECOGNITIONPROPERTY_HOTPOINT = "{CA6F40DC-5292-452a-91FB-2181C0BEC0DE}"
  INKRECOGNITIONPROPERTY_MAXIMUMSTROKECOUNT = "{BF0EEC4E-4B7D-47a9-8CFA-234DD24BD22A}"
  INKRECOGNITIONPROPERTY_POINTSPERINCH = "{7ED16B76-889C-468e-8276-0021B770187E}"
  INKRECOGNITIONPROPERTY_CONFIDENCELEVEL = "{7DFE11A7-FB5D-4958-8765-154ADF0D833F}"
  INKRECOGNITIONPROPERTY_LINEMETRICS = "{8CC24B27-30A9-4b96-9056-2D3A90DA0727}"
  FACTOID_NONE = "NONE"
  FACTOID_DEFAULT = "DEFAULT"
  FACTOID_SYSTEMDICTIONARY = "SYSDICT"
  FACTOID_WORDLIST = "WORDLIST"
  FACTOID_EMAIL = "EMAIL"
  FACTOID_WEB = "WEB"
  FACTOID_ONECHAR = "ONECHAR"
  FACTOID_NUMBER = "NUMBER"
  FACTOID_DIGIT = "DIGIT"
  FACTOID_NUMBERSIMPLE = "NUMSIMPLE"
  FACTOID_CURRENCY = "CURRENCY"
  FACTOID_POSTALCODE = "POSTALCODE"
  FACTOID_PERCENT = "PERCENT"
  FACTOID_DATE = "DATE"
  FACTOID_TIME = "TIME"
  FACTOID_TELEPHONE = "TELEPHONE"
  FACTOID_FILENAME = "FILENAME"
  FACTOID_UPPERCHAR = "UPPERCHAR"
  FACTOID_LOWERCHAR = "LOWERCHAR"
  FACTOID_PUNCCHAR = "PUNCCHAR"
  FACTOID_JAPANESECOMMON = "JPN_COMMON"
  FACTOID_CHINESESIMPLECOMMON = "CHS_COMMON"
  FACTOID_CHINESETRADITIONALCOMMON = "CHT_COMMON"
  FACTOID_KOREANCOMMON = "KOR_COMMON"
  FACTOID_HIRAGANA = "HIRAGANA"
  FACTOID_KATAKANA = "KATAKANA"
  FACTOID_KANJICOMMON = "KANJI_COMMON"
  FACTOID_KANJIRARE = "KANJI_RARE"
  FACTOID_BOPOMOFO = "BOPOMOFO"
  FACTOID_JAMO = "JAMO"
  FACTOID_HANGULCOMMON = "HANGUL_COMMON"
  FACTOID_HANGULRARE = "HANGUL_RARE"
  MICROSOFT_PENINPUT_PANEL_PROPERTY_T = "Microsoft PenInputPanel 1.5"
  INKEDIT_CLASSW = "INKEDIT"
  INKEDIT_CLASS = "INKEDIT"
  IEC__BASE = 1536_u32
  EM_GETINKMODE = 1537_u32
  EM_SETINKMODE = 1538_u32
  EM_GETINKINSERTMODE = 1539_u32
  EM_SETINKINSERTMODE = 1540_u32
  EM_GETDRAWATTR = 1541_u32
  EM_SETDRAWATTR = 1542_u32
  EM_GETRECOTIMEOUT = 1543_u32
  EM_SETRECOTIMEOUT = 1544_u32
  EM_GETGESTURESTATUS = 1545_u32
  EM_SETGESTURESTATUS = 1546_u32
  EM_GETRECOGNIZER = 1547_u32
  EM_SETRECOGNIZER = 1548_u32
  EM_GETFACTOID = 1549_u32
  EM_SETFACTOID = 1550_u32
  EM_GETSELINK = 1551_u32
  EM_SETSELINK = 1552_u32
  EM_GETMOUSEICON = 1553_u32
  EM_SETMOUSEICON = 1554_u32
  EM_GETMOUSEPOINTER = 1555_u32
  EM_SETMOUSEPOINTER = 1556_u32
  EM_GETSTATUS = 1557_u32
  EM_RECOGNIZE = 1558_u32
  EM_GETUSEMOUSEFORINPUT = 1559_u32
  EM_SETUSEMOUSEFORINPUT = 1560_u32
  EM_SETSELINKDISPLAYMODE = 1561_u32
  EM_GETSELINKDISPLAYMODE = 1562_u32
  IECN__BASE = 2048_u32
  IECN_STROKE = 2049_u32
  IECN_GESTURE = 2050_u32
  IECN_RECOGNITIONRESULT = 2051_u32
  RECOFLAG_WORDMODE = 1_u32
  RECOFLAG_COERCE = 2_u32
  RECOFLAG_SINGLESEG = 4_u32
  RECOFLAG_PREFIXOK = 8_u32
  RECOFLAG_LINEMODE = 16_u32
  RECOFLAG_DISABLEPERSONALIZATION = 32_u32
  RECOFLAG_AUTOSPACE = 64_u32
  RECOCONF_LOWCONFIDENCE = -1_i32
  RECOCONF_MEDIUMCONFIDENCE = 0_u32
  RECOCONF_HIGHCONFIDENCE = 1_u32
  RECOCONF_NOTSET = 128_u32
  GESTURE_NULL = 61440_u32
  GESTURE_SCRATCHOUT = 61441_u32
  GESTURE_TRIANGLE = 61442_u32
  GESTURE_SQUARE = 61443_u32
  GESTURE_STAR = 61444_u32
  GESTURE_CHECK = 61445_u32
  GESTURE_INFINITY = 61446_u32
  GESTURE_CROSS = 61447_u32
  GESTURE_PARAGRAPH = 61448_u32
  GESTURE_SECTION = 61449_u32
  GESTURE_BULLET = 61450_u32
  GESTURE_BULLET_CROSS = 61451_u32
  GESTURE_SQUIGGLE = 61452_u32
  GESTURE_SWAP = 61453_u32
  GESTURE_OPENUP = 61454_u32
  GESTURE_CLOSEUP = 61455_u32
  GESTURE_CURLICUE = 61456_u32
  GESTURE_DOUBLE_CURLICUE = 61457_u32
  GESTURE_RECTANGLE = 61458_u32
  GESTURE_CIRCLE = 61472_u32
  GESTURE_DOUBLE_CIRCLE = 61473_u32
  GESTURE_CIRCLE_TAP = 61474_u32
  GESTURE_CIRCLE_CIRCLE = 61475_u32
  GESTURE_CIRCLE_CROSS = 61477_u32
  GESTURE_CIRCLE_LINE_VERT = 61478_u32
  GESTURE_CIRCLE_LINE_HORZ = 61479_u32
  GESTURE_SEMICIRCLE_LEFT = 61480_u32
  GESTURE_SEMICIRCLE_RIGHT = 61481_u32
  GESTURE_CHEVRON_UP = 61488_u32
  GESTURE_CHEVRON_DOWN = 61489_u32
  GESTURE_CHEVRON_LEFT = 61490_u32
  GESTURE_CHEVRON_RIGHT = 61491_u32
  GESTURE_ARROW_UP = 61496_u32
  GESTURE_ARROW_DOWN = 61497_u32
  GESTURE_ARROW_LEFT = 61498_u32
  GESTURE_ARROW_RIGHT = 61499_u32
  GESTURE_DOUBLE_ARROW_UP = 61500_u32
  GESTURE_DOUBLE_ARROW_DOWN = 61501_u32
  GESTURE_DOUBLE_ARROW_LEFT = 61502_u32
  GESTURE_DOUBLE_ARROW_RIGHT = 61503_u32
  GESTURE_UP_ARROW_LEFT = 61504_u32
  GESTURE_UP_ARROW_RIGHT = 61505_u32
  GESTURE_DOWN_ARROW_LEFT = 61506_u32
  GESTURE_DOWN_ARROW_RIGHT = 61507_u32
  GESTURE_LEFT_ARROW_UP = 61508_u32
  GESTURE_LEFT_ARROW_DOWN = 61509_u32
  GESTURE_RIGHT_ARROW_UP = 61510_u32
  GESTURE_RIGHT_ARROW_DOWN = 61511_u32
  GESTURE_UP = 61528_u32
  GESTURE_DOWN = 61529_u32
  GESTURE_LEFT = 61530_u32
  GESTURE_RIGHT = 61531_u32
  GESTURE_DIAGONAL_LEFTUP = 61532_u32
  GESTURE_DIAGONAL_RIGHTUP = 61533_u32
  GESTURE_DIAGONAL_LEFTDOWN = 61534_u32
  GESTURE_DIAGONAL_RIGHTDOWN = 61535_u32
  GESTURE_UP_DOWN = 61536_u32
  GESTURE_DOWN_UP = 61537_u32
  GESTURE_LEFT_RIGHT = 61538_u32
  GESTURE_RIGHT_LEFT = 61539_u32
  GESTURE_UP_LEFT_LONG = 61540_u32
  GESTURE_UP_RIGHT_LONG = 61541_u32
  GESTURE_DOWN_LEFT_LONG = 61542_u32
  GESTURE_DOWN_RIGHT_LONG = 61543_u32
  GESTURE_UP_LEFT = 61544_u32
  GESTURE_UP_RIGHT = 61545_u32
  GESTURE_DOWN_LEFT = 61546_u32
  GESTURE_DOWN_RIGHT = 61547_u32
  GESTURE_LEFT_UP = 61548_u32
  GESTURE_LEFT_DOWN = 61549_u32
  GESTURE_RIGHT_UP = 61550_u32
  GESTURE_RIGHT_DOWN = 61551_u32
  GESTURE_LETTER_A = 61568_u32
  GESTURE_LETTER_B = 61569_u32
  GESTURE_LETTER_C = 61570_u32
  GESTURE_LETTER_D = 61571_u32
  GESTURE_LETTER_E = 61572_u32
  GESTURE_LETTER_F = 61573_u32
  GESTURE_LETTER_G = 61574_u32
  GESTURE_LETTER_H = 61575_u32
  GESTURE_LETTER_I = 61576_u32
  GESTURE_LETTER_J = 61577_u32
  GESTURE_LETTER_K = 61578_u32
  GESTURE_LETTER_L = 61579_u32
  GESTURE_LETTER_M = 61580_u32
  GESTURE_LETTER_N = 61581_u32
  GESTURE_LETTER_O = 61582_u32
  GESTURE_LETTER_P = 61583_u32
  GESTURE_LETTER_Q = 61584_u32
  GESTURE_LETTER_R = 61585_u32
  GESTURE_LETTER_S = 61586_u32
  GESTURE_LETTER_T = 61587_u32
  GESTURE_LETTER_U = 61588_u32
  GESTURE_LETTER_V = 61589_u32
  GESTURE_LETTER_W = 61590_u32
  GESTURE_LETTER_X = 61591_u32
  GESTURE_LETTER_Y = 61592_u32
  GESTURE_LETTER_Z = 61593_u32
  GESTURE_DIGIT_0 = 61594_u32
  GESTURE_DIGIT_1 = 61595_u32
  GESTURE_DIGIT_2 = 61596_u32
  GESTURE_DIGIT_3 = 61597_u32
  GESTURE_DIGIT_4 = 61598_u32
  GESTURE_DIGIT_5 = 61599_u32
  GESTURE_DIGIT_6 = 61600_u32
  GESTURE_DIGIT_7 = 61601_u32
  GESTURE_DIGIT_8 = 61602_u32
  GESTURE_DIGIT_9 = 61603_u32
  GESTURE_EXCLAMATION = 61604_u32
  GESTURE_QUESTION = 61605_u32
  GESTURE_SHARP = 61606_u32
  GESTURE_DOLLAR = 61607_u32
  GESTURE_ASTERISK = 61608_u32
  GESTURE_PLUS = 61609_u32
  GESTURE_DOUBLE_UP = 61624_u32
  GESTURE_DOUBLE_DOWN = 61625_u32
  GESTURE_DOUBLE_LEFT = 61626_u32
  GESTURE_DOUBLE_RIGHT = 61627_u32
  GESTURE_TRIPLE_UP = 61628_u32
  GESTURE_TRIPLE_DOWN = 61629_u32
  GESTURE_TRIPLE_LEFT = 61630_u32
  GESTURE_TRIPLE_RIGHT = 61631_u32
  GESTURE_BRACKET_OVER = 61668_u32
  GESTURE_BRACKET_UNDER = 61669_u32
  GESTURE_BRACKET_LEFT = 61670_u32
  GESTURE_BRACKET_RIGHT = 61671_u32
  GESTURE_BRACE_OVER = 61672_u32
  GESTURE_BRACE_UNDER = 61673_u32
  GESTURE_BRACE_LEFT = 61674_u32
  GESTURE_BRACE_RIGHT = 61675_u32
  GESTURE_TAP = 61680_u32
  GESTURE_DOUBLE_TAP = 61681_u32
  GESTURE_TRIPLE_TAP = 61682_u32
  GESTURE_QUAD_TAP = 61683_u32
  FACILITY_INK = 40_u32
  GUID_PACKETPROPERTY_GUID_X = "598a6a8f-52c0-4ba0-93af-af357411a561"
  GUID_PACKETPROPERTY_GUID_Y = "b53f9f75-04e0-4498-a7ee-c30dbb5a9011"
  GUID_PACKETPROPERTY_GUID_Z = "735adb30-0ebb-4788-a0e4-0f316490055d"
  GUID_PACKETPROPERTY_GUID_PACKET_STATUS = "6e0e07bf-afe7-4cf7-87d1-af6446208418"
  GUID_PACKETPROPERTY_GUID_TIMER_TICK = "436510c5-fed3-45d1-8b76-71d3ea7a829d"
  GUID_PACKETPROPERTY_GUID_SERIAL_NUMBER = "78a81b56-0935-4493-baae-00541a8a16c4"
  GUID_PACKETPROPERTY_GUID_NORMAL_PRESSURE = "7307502d-f9f4-4e18-b3f2-2ce1b1a3610c"
  GUID_PACKETPROPERTY_GUID_TANGENT_PRESSURE = "6da4488b-5244-41ec-905b-32d89ab80809"
  GUID_PACKETPROPERTY_GUID_BUTTON_PRESSURE = "8b7fefc4-96aa-4bfe-ac26-8a5f0be07bf5"
  GUID_PACKETPROPERTY_GUID_X_TILT_ORIENTATION = "a8d07b3a-8bf0-40b0-95a9-b80a6bb787bf"
  GUID_PACKETPROPERTY_GUID_Y_TILT_ORIENTATION = "0e932389-1d77-43af-ac00-5b950d6d4b2d"
  GUID_PACKETPROPERTY_GUID_AZIMUTH_ORIENTATION = "029123b4-8828-410b-b250-a0536595e5dc"
  GUID_PACKETPROPERTY_GUID_ALTITUDE_ORIENTATION = "82dec5c7-f6ba-4906-894f-66d68dfc456c"
  GUID_PACKETPROPERTY_GUID_TWIST_ORIENTATION = "0d324960-13b2-41e4-ace6-7ae9d43d2d3b"
  GUID_PACKETPROPERTY_GUID_PITCH_ROTATION = "7f7e57b7-be37-4be1-a356-7a84160e1893"
  GUID_PACKETPROPERTY_GUID_ROLL_ROTATION = "5d5d5e56-6ba9-4c5b-9fb0-851c91714e56"
  GUID_PACKETPROPERTY_GUID_YAW_ROTATION = "6a849980-7c3a-45b7-aa82-90a262950e89"
  GUID_PACKETPROPERTY_GUID_WIDTH = "baabe94d-2712-48f5-be9d-8f8b5ea0711a"
  GUID_PACKETPROPERTY_GUID_HEIGHT = "e61858d2-e447-4218-9d3f-18865c203df4"
  GUID_PACKETPROPERTY_GUID_FINGERCONTACTCONFIDENCE = "e706c804-57f0-4f00-8a0c-853d57789be9"
  GUID_PACKETPROPERTY_GUID_DEVICE_CONTACT_ID = "02585b91-049b-4750-9615-df8948ab3c9c"
  InkMinTransparencyValue = 0_i32
  InkMaxTransparencyValue = 255_i32
  InkCollectorClipInkToMargin = 0_i32
  InkCollectorDefaultMargin = -2147483648_i32
  GUID_GESTURE_DATA = "41e4ec0f-26aa-455a-9aa5-2cd36cf63fb9"
  GUID_DYNAMIC_RENDERER_CACHED_DATA = "bf531b92-25bf-4a95-89ad-0e476b34b4f5"

  CLSID_InkDisp = LibC::GUID.new(0x937c1a34_u32, 0x151d_u16, 0x4610_u16, StaticArray[0x9c_u8, 0xa6_u8, 0xa8_u8, 0xcc_u8, 0x9b_u8, 0xdb_u8, 0x5d_u8, 0x83_u8])

  CLSID_InkOverlay = LibC::GUID.new(0x65d00646_u32, 0xcde3_u16, 0x4a88_u16, StaticArray[0x91_u8, 0x63_u8, 0x67_u8, 0x69_u8, 0xf0_u8, 0xf1_u8, 0xa9_u8, 0x7d_u8])

  CLSID_InkPicture = LibC::GUID.new(0x4a1e553_u32, 0xfe36_u16, 0x4fde_u16, StaticArray[0x86_u8, 0x5e_u8, 0x34_u8, 0x41_u8, 0x94_u8, 0xe6_u8, 0x94_u8, 0x24_u8])

  CLSID_InkCollector = LibC::GUID.new(0x43fb1553_u32, 0xad74_u16, 0x4ee8_u16, StaticArray[0x88_u8, 0xe4_u8, 0x3e_u8, 0x6d_u8, 0xaa_u8, 0xc9_u8, 0x15_u8, 0xdb_u8])

  CLSID_InkDrawingAttributes = LibC::GUID.new(0xd8bf32a2_u32, 0x5a5_u16, 0x44c3_u16, StaticArray[0xb3_u8, 0xaa_u8, 0x5e_u8, 0x80_u8, 0xac_u8, 0x7d_u8, 0x25_u8, 0x76_u8])

  CLSID_InkRectangle = LibC::GUID.new(0x43b07326_u32, 0xaae0_u16, 0x4b62_u16, StaticArray[0xa8_u8, 0x3d_u8, 0x5f_u8, 0xd7_u8, 0x68_u8, 0xb7_u8, 0x35_u8, 0x3c_u8])

  CLSID_InkRenderer = LibC::GUID.new(0x9c1cc6e4_u32, 0xd7eb_u16, 0x4eeb_u16, StaticArray[0x90_u8, 0x91_u8, 0x15_u8, 0xa7_u8, 0xc8_u8, 0x79_u8, 0x1e_u8, 0xd9_u8])

  CLSID_InkTransform = LibC::GUID.new(0xe3d5d93c_u32, 0x1663_u16, 0x4a78_u16, StaticArray[0xa1_u8, 0xa7_u8, 0x22_u8, 0x37_u8, 0x5d_u8, 0xfe_u8, 0xba_u8, 0xee_u8])

  CLSID_InkRecognizers = LibC::GUID.new(0x9fd4e808_u32, 0xf6e6_u16, 0x4e65_u16, StaticArray[0x98_u8, 0xd3_u8, 0xaa_u8, 0x39_u8, 0x5_u8, 0x4c_u8, 0x12_u8, 0x55_u8])

  CLSID_InkRecognizerContext = LibC::GUID.new(0xaac46a37_u32, 0x9229_u16, 0x4fc0_u16, StaticArray[0x8c_u8, 0xce_u8, 0x44_u8, 0x97_u8, 0x56_u8, 0x9b_u8, 0xf4_u8, 0xd1_u8])

  CLSID_InkRecognizerGuide = LibC::GUID.new(0x8770d941_u32, 0xa63a_u16, 0x4671_u16, StaticArray[0xa3_u8, 0x75_u8, 0x28_u8, 0x55_u8, 0xa1_u8, 0x8e_u8, 0xba_u8, 0x73_u8])

  CLSID_InkTablets = LibC::GUID.new(0x6e4fcb12_u32, 0x510a_u16, 0x4d40_u16, StaticArray[0x93_u8, 0x4_u8, 0x1d_u8, 0xa1_u8, 0xa_u8, 0xe9_u8, 0x14_u8, 0x7c_u8])

  CLSID_InkWordList = LibC::GUID.new(0x9de85094_u32, 0xf71f_u16, 0x44f1_u16, StaticArray[0x84_u8, 0x71_u8, 0x15_u8, 0xa2_u8, 0xfa_u8, 0x76_u8, 0xfc_u8, 0xf3_u8])

  CLSID_InkStrokes = LibC::GUID.new(0x48f491bc_u32, 0x240e_u16, 0x4860_u16, StaticArray[0xb0_u8, 0x79_u8, 0xa1_u8, 0xe9_u8, 0x4d_u8, 0x3d_u8, 0x2c_u8, 0x86_u8])

  CLSID_Ink = LibC::GUID.new(0x13de4a42_u32, 0x8d21_u16, 0x4c8e_u16, StaticArray[0xbf_u8, 0x9c_u8, 0x8f_u8, 0x69_u8, 0xcb_u8, 0x6_u8, 0x8f_u8, 0xca_u8])

  CLSID_SketchInk = LibC::GUID.new(0xf0291081_u32, 0xe87c_u16, 0x4e07_u16, StaticArray[0x97_u8, 0xda_u8, 0xa0_u8, 0xa0_u8, 0x37_u8, 0x61_u8, 0xe5_u8, 0x86_u8])

  CLSID_InkDivider = LibC::GUID.new(0x8854f6a0_u32, 0x4683_u16, 0x4ae7_u16, StaticArray[0x91_u8, 0x91_u8, 0x75_u8, 0x2f_u8, 0xe6_u8, 0x46_u8, 0x12_u8, 0xc3_u8])

  CLSID_HandwrittenTextInsertion = LibC::GUID.new(0x9f074ee2_u32, 0xe6e9_u16, 0x4d8a_u16, StaticArray[0xa0_u8, 0x47_u8, 0xeb_u8, 0x5b_u8, 0x5c_u8, 0x3c_u8, 0x55_u8, 0xda_u8])

  CLSID_PenInputPanel = LibC::GUID.new(0xf744e496_u32, 0x1b5a_u16, 0x489e_u16, StaticArray[0x81_u8, 0xdc_u8, 0xfb_u8, 0xd7_u8, 0xac_u8, 0x62_u8, 0x98_u8, 0xa8_u8])

  CLSID_TextInputPanel = LibC::GUID.new(0xf9b189d7_u32, 0x228b_u16, 0x4f2b_u16, StaticArray[0x86_u8, 0x50_u8, 0xb9_u8, 0x7f_u8, 0x59_u8, 0xe0_u8, 0x2c_u8, 0x8c_u8])

  CLSID_PenInputPanel_Internal = LibC::GUID.new(0x802b1fb9_u32, 0x56b_u16, 0x4720_u16, StaticArray[0xb0_u8, 0xcc_u8, 0x80_u8, 0xd2_u8, 0x3b_u8, 0x71_u8, 0x17_u8, 0x1e_u8])

  CLSID_InkEdit = LibC::GUID.new(0xe5ca59f5_u32, 0x57c4_u16, 0x4dd8_u16, StaticArray[0x9b_u8, 0xd6_u8, 0x1d_u8, 0xee_u8, 0xed_u8, 0xd2_u8, 0x7a_u8, 0xf4_u8])

  CLSID_MathInputControl = LibC::GUID.new(0xc561816c_u32, 0x14d8_u16, 0x4090_u16, StaticArray[0x83_u8, 0xc_u8, 0x98_u8, 0xd9_u8, 0x94_u8, 0xb2_u8, 0x1c_u8, 0x7b_u8])

  CLSID_RealTimeStylus = LibC::GUID.new(0xe26b366d_u32, 0xf998_u16, 0x43ce_u16, StaticArray[0x83_u8, 0x6f_u8, 0xcb_u8, 0x6d_u8, 0x90_u8, 0x44_u8, 0x32_u8, 0xb0_u8])

  CLSID_DynamicRenderer = LibC::GUID.new(0xecd32aea_u32, 0x746f_u16, 0x4dcb_u16, StaticArray[0xbf_u8, 0x68_u8, 0x8_u8, 0x27_u8, 0x57_u8, 0xfa_u8, 0xff_u8, 0x18_u8])

  CLSID_GestureRecognizer = LibC::GUID.new(0xea30c654_u32, 0xc62c_u16, 0x441f_u16, StaticArray[0xac_u8, 0x0_u8, 0x95_u8, 0xf9_u8, 0xa1_u8, 0x96_u8, 0x78_u8, 0x2c_u8])

  CLSID_StrokeBuilder = LibC::GUID.new(0xe810cee7_u32, 0x6e51_u16, 0x4cb0_u16, StaticArray[0xaa_u8, 0x3a_u8, 0xb_u8, 0x98_u8, 0x5b_u8, 0x70_u8, 0xda_u8, 0xf7_u8])

  CLSID_TipAutoCompleteClient = LibC::GUID.new(0x807c1e6c_u32, 0x1d00_u16, 0x453f_u16, StaticArray[0xb9_u8, 0x20_u8, 0xb6_u8, 0x1b_u8, 0xb7_u8, 0xcd_u8, 0xd9_u8, 0x97_u8])

  enum PROPERTY_UNITS
    PROPERTY_UNITS_DEFAULT = 0_i32
    PROPERTY_UNITS_INCHES = 1_i32
    PROPERTY_UNITS_CENTIMETERS = 2_i32
    PROPERTY_UNITS_DEGREES = 3_i32
    PROPERTY_UNITS_RADIANS = 4_i32
    PROPERTY_UNITS_SECONDS = 5_i32
    PROPERTY_UNITS_POUNDS = 6_i32
    PROPERTY_UNITS_GRAMS = 7_i32
    PROPERTY_UNITS_SILINEAR = 8_i32
    PROPERTY_UNITS_SIROTATION = 9_i32
    PROPERTY_UNITS_ENGLINEAR = 10_i32
    PROPERTY_UNITS_ENGROTATION = 11_i32
    PROPERTY_UNITS_SLUGS = 12_i32
    PROPERTY_UNITS_KELVIN = 13_i32
    PROPERTY_UNITS_FAHRENHEIT = 14_i32
    PROPERTY_UNITS_AMPERE = 15_i32
    PROPERTY_UNITS_CANDELA = 16_i32
  end
  enum Enuminkmetric_flags
    IMF_FONT_SELECTED_IN_HDC = 1_i32
    IMF_ITALIC = 2_i32
    IMF_BOLD = 4_i32
  end
  enum Enumgetcandidateflags
    TCF_ALLOW_RECOGNITION = 1_i32
    TCF_FORCE_RECOGNITION = 2_i32
  end
  enum InkSelectionConstants
    ISC_FirstElement = 0_i32
    ISC_AllElements = -1_i32
  end
  enum InkBoundingBoxMode
    IBBM_Default = 0_i32
    IBBM_NoCurveFit = 1_i32
    IBBM_CurveFit = 2_i32
    IBBM_PointsOnly = 3_i32
    IBBM_Union = 4_i32
  end
  enum InkExtractFlags
    IEF_CopyFromOriginal = 0_i32
    IEF_RemoveFromOriginal = 1_i32
    IEF_Default = 1_i32
  end
  enum InkPersistenceFormat
    IPF_InkSerializedFormat = 0_i32
    IPF_Base64InkSerializedFormat = 1_i32
    IPF_GIF = 2_i32
    IPF_Base64GIF = 3_i32
  end
  enum InkPersistenceCompressionMode
    IPCM_Default = 0_i32
    IPCM_MaximumCompression = 1_i32
    IPCM_NoCompression = 2_i32
  end
  enum InkPenTip
    IPT_Ball = 0_i32
    IPT_Rectangle = 1_i32
  end
  enum InkRasterOperation
    IRO_Black = 1_i32
    IRO_NotMergePen = 2_i32
    IRO_MaskNotPen = 3_i32
    IRO_NotCopyPen = 4_i32
    IRO_MaskPenNot = 5_i32
    IRO_Not = 6_i32
    IRO_XOrPen = 7_i32
    IRO_NotMaskPen = 8_i32
    IRO_MaskPen = 9_i32
    IRO_NotXOrPen = 10_i32
    IRO_NoOperation = 11_i32
    IRO_MergeNotPen = 12_i32
    IRO_CopyPen = 13_i32
    IRO_MergePenNot = 14_i32
    IRO_MergePen = 15_i32
    IRO_White = 16_i32
  end
  enum InkMousePointer
    IMP_Default = 0_i32
    IMP_Arrow = 1_i32
    IMP_Crosshair = 2_i32
    IMP_Ibeam = 3_i32
    IMP_SizeNESW = 4_i32
    IMP_SizeNS = 5_i32
    IMP_SizeNWSE = 6_i32
    IMP_SizeWE = 7_i32
    IMP_UpArrow = 8_i32
    IMP_Hourglass = 9_i32
    IMP_NoDrop = 10_i32
    IMP_ArrowHourglass = 11_i32
    IMP_ArrowQuestion = 12_i32
    IMP_SizeAll = 13_i32
    IMP_Hand = 14_i32
    IMP_Custom = 99_i32
  end
  enum InkClipboardModes
    ICB_Copy = 0_i32
    ICB_Cut = 1_i32
    ICB_ExtractOnly = 48_i32
    ICB_DelayedCopy = 32_i32
    ICB_Default = 0_i32
  end
  enum InkClipboardFormats
    ICF_None = 0_i32
    ICF_InkSerializedFormat = 1_i32
    ICF_SketchInk = 2_i32
    ICF_TextInk = 6_i32
    ICF_EnhancedMetafile = 8_i32
    ICF_Metafile = 32_i32
    ICF_Bitmap = 64_i32
    ICF_PasteMask = 7_i32
    ICF_CopyMask = 127_i32
    ICF_Default = 127_i32
  end
  enum SelectionHitResult
    SHR_None = 0_i32
    SHR_NW = 1_i32
    SHR_SE = 2_i32
    SHR_NE = 3_i32
    SHR_SW = 4_i32
    SHR_E = 5_i32
    SHR_W = 6_i32
    SHR_N = 7_i32
    SHR_S = 8_i32
    SHR_Selection = 9_i32
  end
  enum InkRecognitionStatus
    IRS_NoError = 0_i32
    IRS_Interrupted = 1_i32
    IRS_ProcessFailed = 2_i32
    IRS_InkAddedFailed = 4_i32
    IRS_SetAutoCompletionModeFailed = 8_i32
    IRS_SetStrokesFailed = 16_i32
    IRS_SetGuideFailed = 32_i32
    IRS_SetFlagsFailed = 64_i32
    IRS_SetFactoidFailed = 128_i32
    IRS_SetPrefixSuffixFailed = 256_i32
    IRS_SetWordListFailed = 512_i32
  end
  enum DISPID_InkRectangle
    DISPID_IRTop = 1_i32
    DISPID_IRLeft = 2_i32
    DISPID_IRBottom = 3_i32
    DISPID_IRRight = 4_i32
    DISPID_IRGetRectangle = 5_i32
    DISPID_IRSetRectangle = 6_i32
    DISPID_IRData = 7_i32
  end
  enum DISPID_InkExtendedProperty
    DISPID_IEPGuid = 1_i32
    DISPID_IEPData = 2_i32
  end
  enum DISPID_InkExtendedProperties
    DISPID_IEPs_NewEnum = -4_i32
    DISPID_IEPsItem = 0_i32
    DISPID_IEPsCount = 1_i32
    DISPID_IEPsAdd = 2_i32
    DISPID_IEPsRemove = 3_i32
    DISPID_IEPsClear = 4_i32
    DISPID_IEPsDoesPropertyExist = 5_i32
  end
  enum DISPID_InkDrawingAttributes
    DISPID_DAHeight = 1_i32
    DISPID_DAColor = 2_i32
    DISPID_DAWidth = 3_i32
    DISPID_DAFitToCurve = 4_i32
    DISPID_DAIgnorePressure = 5_i32
    DISPID_DAAntiAliased = 6_i32
    DISPID_DATransparency = 7_i32
    DISPID_DARasterOperation = 8_i32
    DISPID_DAPenTip = 9_i32
    DISPID_DAClone = 10_i32
    DISPID_DAExtendedProperties = 11_i32
  end
  enum DISPID_InkTransform
    DISPID_ITReset = 1_i32
    DISPID_ITTranslate = 2_i32
    DISPID_ITRotate = 3_i32
    DISPID_ITReflect = 4_i32
    DISPID_ITShear = 5_i32
    DISPID_ITScale = 6_i32
    DISPID_ITeM11 = 7_i32
    DISPID_ITeM12 = 8_i32
    DISPID_ITeM21 = 9_i32
    DISPID_ITeM22 = 10_i32
    DISPID_ITeDx = 11_i32
    DISPID_ITeDy = 12_i32
    DISPID_ITGetTransform = 13_i32
    DISPID_ITSetTransform = 14_i32
    DISPID_ITData = 15_i32
  end
  enum InkApplicationGesture
    IAG_AllGestures = 0_i32
    IAG_NoGesture = 61440_i32
    IAG_Scratchout = 61441_i32
    IAG_Triangle = 61442_i32
    IAG_Square = 61443_i32
    IAG_Star = 61444_i32
    IAG_Check = 61445_i32
    IAG_Curlicue = 61456_i32
    IAG_DoubleCurlicue = 61457_i32
    IAG_Circle = 61472_i32
    IAG_DoubleCircle = 61473_i32
    IAG_SemiCircleLeft = 61480_i32
    IAG_SemiCircleRight = 61481_i32
    IAG_ChevronUp = 61488_i32
    IAG_ChevronDown = 61489_i32
    IAG_ChevronLeft = 61490_i32
    IAG_ChevronRight = 61491_i32
    IAG_ArrowUp = 61496_i32
    IAG_ArrowDown = 61497_i32
    IAG_ArrowLeft = 61498_i32
    IAG_ArrowRight = 61499_i32
    IAG_Up = 61528_i32
    IAG_Down = 61529_i32
    IAG_Left = 61530_i32
    IAG_Right = 61531_i32
    IAG_UpDown = 61536_i32
    IAG_DownUp = 61537_i32
    IAG_LeftRight = 61538_i32
    IAG_RightLeft = 61539_i32
    IAG_UpLeftLong = 61540_i32
    IAG_UpRightLong = 61541_i32
    IAG_DownLeftLong = 61542_i32
    IAG_DownRightLong = 61543_i32
    IAG_UpLeft = 61544_i32
    IAG_UpRight = 61545_i32
    IAG_DownLeft = 61546_i32
    IAG_DownRight = 61547_i32
    IAG_LeftUp = 61548_i32
    IAG_LeftDown = 61549_i32
    IAG_RightUp = 61550_i32
    IAG_RightDown = 61551_i32
    IAG_Exclamation = 61604_i32
    IAG_Tap = 61680_i32
    IAG_DoubleTap = 61681_i32
  end
  enum InkSystemGesture
    ISG_Tap = 16_i32
    ISG_DoubleTap = 17_i32
    ISG_RightTap = 18_i32
    ISG_Drag = 19_i32
    ISG_RightDrag = 20_i32
    ISG_HoldEnter = 21_i32
    ISG_HoldLeave = 22_i32
    ISG_HoverEnter = 23_i32
    ISG_HoverLeave = 24_i32
    ISG_Flick = 31_i32
  end
  enum InkRecognitionConfidence
    IRC_Strong = 0_i32
    IRC_Intermediate = 1_i32
    IRC_Poor = 2_i32
  end
  enum DISPID_InkGesture
    DISPID_IGId = 0_i32
    DISPID_IGGetHotPoint = 1_i32
    DISPID_IGConfidence = 2_i32
  end
  enum DISPID_InkCursor
    DISPID_ICsrName = 0_i32
    DISPID_ICsrId = 1_i32
    DISPID_ICsrDrawingAttributes = 2_i32
    DISPID_ICsrButtons = 3_i32
    DISPID_ICsrInverted = 4_i32
    DISPID_ICsrTablet = 5_i32
  end
  enum DISPID_InkCursors
    DISPID_ICs_NewEnum = -4_i32
    DISPID_ICsItem = 0_i32
    DISPID_ICsCount = 1_i32
  end
  enum InkCursorButtonState
    ICBS_Unavailable = 0_i32
    ICBS_Up = 1_i32
    ICBS_Down = 2_i32
  end
  enum DISPID_InkCursorButton
    DISPID_ICBName = 0_i32
    DISPID_ICBId = 1_i32
    DISPID_ICBState = 2_i32
  end
  enum DISPID_InkCursorButtons
    DISPID_ICBs_NewEnum = -4_i32
    DISPID_ICBsItem = 0_i32
    DISPID_ICBsCount = 1_i32
  end
  enum TabletHardwareCapabilities
    THWC_Integrated = 1_i32
    THWC_CursorMustTouch = 2_i32
    THWC_HardProximity = 4_i32
    THWC_CursorsHavePhysicalIds = 8_i32
  end
  enum TabletPropertyMetricUnit
    TPMU_Default = 0_i32
    TPMU_Inches = 1_i32
    TPMU_Centimeters = 2_i32
    TPMU_Degrees = 3_i32
    TPMU_Radians = 4_i32
    TPMU_Seconds = 5_i32
    TPMU_Pounds = 6_i32
    TPMU_Grams = 7_i32
  end
  enum DISPID_InkTablet
    DISPID_ITName = 0_i32
    DISPID_ITPlugAndPlayId = 1_i32
    DISPID_ITPropertyMetrics = 2_i32
    DISPID_ITIsPacketPropertySupported = 3_i32
    DISPID_ITMaximumInputRectangle = 4_i32
    DISPID_ITHardwareCapabilities = 5_i32
  end
  enum TabletDeviceKind
    TDK_Mouse = 0_i32
    TDK_Pen = 1_i32
    TDK_Touch = 2_i32
  end
  enum DISPID_InkTablet2
    DISPID_IT2DeviceKind = 0_i32
  end
  enum DISPID_InkTablet3
    DISPID_IT3IsMultiTouch = 0_i32
    DISPID_IT3MaximumCursors = 1_i32
  end
  enum DISPID_InkTablets
    DISPID_ITs_NewEnum = -4_i32
    DISPID_ITsItem = 0_i32
    DISPID_ITsDefaultTablet = 1_i32
    DISPID_ITsCount = 2_i32
    DISPID_ITsIsPacketPropertySupported = 3_i32
  end
  enum DISPID_InkStrokeDisp
    DISPID_ISDInkIndex = 1_i32
    DISPID_ISDID = 2_i32
    DISPID_ISDGetBoundingBox = 3_i32
    DISPID_ISDDrawingAttributes = 4_i32
    DISPID_ISDFindIntersections = 5_i32
    DISPID_ISDGetRectangleIntersections = 6_i32
    DISPID_ISDClip = 7_i32
    DISPID_ISDHitTestCircle = 8_i32
    DISPID_ISDNearestPoint = 9_i32
    DISPID_ISDSplit = 10_i32
    DISPID_ISDExtendedProperties = 11_i32
    DISPID_ISDInk = 12_i32
    DISPID_ISDBezierPoints = 13_i32
    DISPID_ISDPolylineCusps = 14_i32
    DISPID_ISDBezierCusps = 15_i32
    DISPID_ISDSelfIntersections = 16_i32
    DISPID_ISDPacketCount = 17_i32
    DISPID_ISDPacketSize = 18_i32
    DISPID_ISDPacketDescription = 19_i32
    DISPID_ISDDeleted = 20_i32
    DISPID_ISDGetPacketDescriptionPropertyMetrics = 21_i32
    DISPID_ISDGetPoints = 22_i32
    DISPID_ISDSetPoints = 23_i32
    DISPID_ISDGetPacketData = 24_i32
    DISPID_ISDGetPacketValuesByProperty = 25_i32
    DISPID_ISDSetPacketValuesByProperty = 26_i32
    DISPID_ISDGetFlattenedBezierPoints = 27_i32
    DISPID_ISDScaleToRectangle = 28_i32
    DISPID_ISDTransform = 29_i32
    DISPID_ISDMove = 30_i32
    DISPID_ISDRotate = 31_i32
    DISPID_ISDShear = 32_i32
    DISPID_ISDScale = 33_i32
  end
  enum DISPID_InkStrokes
    DISPID_ISs_NewEnum = -4_i32
    DISPID_ISsItem = 0_i32
    DISPID_ISsCount = 1_i32
    DISPID_ISsValid = 2_i32
    DISPID_ISsInk = 3_i32
    DISPID_ISsAdd = 4_i32
    DISPID_ISsAddStrokes = 5_i32
    DISPID_ISsRemove = 6_i32
    DISPID_ISsRemoveStrokes = 7_i32
    DISPID_ISsToString = 8_i32
    DISPID_ISsModifyDrawingAttributes = 9_i32
    DISPID_ISsGetBoundingBox = 10_i32
    DISPID_ISsScaleToRectangle = 11_i32
    DISPID_ISsTransform = 12_i32
    DISPID_ISsMove = 13_i32
    DISPID_ISsRotate = 14_i32
    DISPID_ISsShear = 15_i32
    DISPID_ISsScale = 16_i32
    DISPID_ISsClip = 17_i32
    DISPID_ISsRecognitionResult = 18_i32
    DISPID_ISsRemoveRecognitionResult = 19_i32
  end
  enum DISPID_InkCustomStrokes
    DISPID_ICSs_NewEnum = -4_i32
    DISPID_ICSsItem = 0_i32
    DISPID_ICSsCount = 1_i32
    DISPID_ICSsAdd = 2_i32
    DISPID_ICSsRemove = 3_i32
    DISPID_ICSsClear = 4_i32
  end
  enum DISPID_StrokeEvent
    DISPID_SEStrokesAdded = 1_i32
    DISPID_SEStrokesRemoved = 2_i32
  end
  enum DISPID_Ink
    DISPID_IStrokes = 1_i32
    DISPID_IExtendedProperties = 2_i32
    DISPID_IGetBoundingBox = 3_i32
    DISPID_IDeleteStrokes = 4_i32
    DISPID_IDeleteStroke = 5_i32
    DISPID_IExtractStrokes = 6_i32
    DISPID_IExtractWithRectangle = 7_i32
    DISPID_IDirty = 8_i32
    DISPID_ICustomStrokes = 9_i32
    DISPID_IClone = 10_i32
    DISPID_IHitTestCircle = 11_i32
    DISPID_IHitTestWithRectangle = 12_i32
    DISPID_IHitTestWithLasso = 13_i32
    DISPID_INearestPoint = 14_i32
    DISPID_ICreateStrokes = 15_i32
    DISPID_ICreateStroke = 16_i32
    DISPID_IAddStrokesAtRectangle = 17_i32
    DISPID_IClip = 18_i32
    DISPID_ISave = 19_i32
    DISPID_ILoad = 20_i32
    DISPID_ICreateStrokeFromPoints = 21_i32
    DISPID_IClipboardCopyWithRectangle = 22_i32
    DISPID_IClipboardCopy = 23_i32
    DISPID_ICanPaste = 24_i32
    DISPID_IClipboardPaste = 25_i32
  end
  enum DISPID_InkEvent
    DISPID_IEInkAdded = 1_i32
    DISPID_IEInkDeleted = 2_i32
  end
  enum DISPID_InkRenderer
    DISPID_IRGetViewTransform = 1_i32
    DISPID_IRSetViewTransform = 2_i32
    DISPID_IRGetObjectTransform = 3_i32
    DISPID_IRSetObjectTransform = 4_i32
    DISPID_IRDraw = 5_i32
    DISPID_IRDrawStroke = 6_i32
    DISPID_IRPixelToInkSpace = 7_i32
    DISPID_IRInkSpaceToPixel = 8_i32
    DISPID_IRPixelToInkSpaceFromPoints = 9_i32
    DISPID_IRInkSpaceToPixelFromPoints = 10_i32
    DISPID_IRMeasure = 11_i32
    DISPID_IRMeasureStroke = 12_i32
    DISPID_IRMove = 13_i32
    DISPID_IRRotate = 14_i32
    DISPID_IRScale = 15_i32
  end
  enum InkCollectorEventInterest
    ICEI_DefaultEvents = -1_i32
    ICEI_CursorDown = 0_i32
    ICEI_Stroke = 1_i32
    ICEI_NewPackets = 2_i32
    ICEI_NewInAirPackets = 3_i32
    ICEI_CursorButtonDown = 4_i32
    ICEI_CursorButtonUp = 5_i32
    ICEI_CursorInRange = 6_i32
    ICEI_CursorOutOfRange = 7_i32
    ICEI_SystemGesture = 8_i32
    ICEI_TabletAdded = 9_i32
    ICEI_TabletRemoved = 10_i32
    ICEI_MouseDown = 11_i32
    ICEI_MouseMove = 12_i32
    ICEI_MouseUp = 13_i32
    ICEI_MouseWheel = 14_i32
    ICEI_DblClick = 15_i32
    ICEI_AllEvents = 16_i32
  end
  enum InkMouseButton
    IMF_Left = 1_i32
    IMF_Right = 2_i32
    IMF_Middle = 4_i32
  end
  enum InkShiftKeyModifierFlags
    IKM_Shift = 1_i32
    IKM_Control = 2_i32
    IKM_Alt = 4_i32
  end
  enum DISPID_InkCollectorEvent
    DISPID_ICEStroke = 1_i32
    DISPID_ICECursorDown = 2_i32
    DISPID_ICENewPackets = 3_i32
    DISPID_ICENewInAirPackets = 4_i32
    DISPID_ICECursorButtonDown = 5_i32
    DISPID_ICECursorButtonUp = 6_i32
    DISPID_ICECursorInRange = 7_i32
    DISPID_ICECursorOutOfRange = 8_i32
    DISPID_ICESystemGesture = 9_i32
    DISPID_ICEGesture = 10_i32
    DISPID_ICETabletAdded = 11_i32
    DISPID_ICETabletRemoved = 12_i32
    DISPID_IOEPainting = 13_i32
    DISPID_IOEPainted = 14_i32
    DISPID_IOESelectionChanging = 15_i32
    DISPID_IOESelectionChanged = 16_i32
    DISPID_IOESelectionMoving = 17_i32
    DISPID_IOESelectionMoved = 18_i32
    DISPID_IOESelectionResizing = 19_i32
    DISPID_IOESelectionResized = 20_i32
    DISPID_IOEStrokesDeleting = 21_i32
    DISPID_IOEStrokesDeleted = 22_i32
    DISPID_IPEChangeUICues = 23_i32
    DISPID_IPEClick = 24_i32
    DISPID_IPEDblClick = 25_i32
    DISPID_IPEInvalidated = 26_i32
    DISPID_IPEMouseDown = 27_i32
    DISPID_IPEMouseEnter = 28_i32
    DISPID_IPEMouseHover = 29_i32
    DISPID_IPEMouseLeave = 30_i32
    DISPID_IPEMouseMove = 31_i32
    DISPID_IPEMouseUp = 32_i32
    DISPID_IPEMouseWheel = 33_i32
    DISPID_IPESizeModeChanged = 34_i32
    DISPID_IPEStyleChanged = 35_i32
    DISPID_IPESystemColorsChanged = 36_i32
    DISPID_IPEKeyDown = 37_i32
    DISPID_IPEKeyPress = 38_i32
    DISPID_IPEKeyUp = 39_i32
    DISPID_IPEResize = 40_i32
    DISPID_IPESizeChanged = 41_i32
  end
  enum InkOverlayEditingMode
    IOEM_Ink = 0_i32
    IOEM_Delete = 1_i32
    IOEM_Select = 2_i32
  end
  enum InkOverlayAttachMode
    IOAM_Behind = 0_i32
    IOAM_InFront = 1_i32
  end
  enum InkPictureSizeMode
    IPSM_AutoSize = 0_i32
    IPSM_CenterImage = 1_i32
    IPSM_Normal = 2_i32
    IPSM_StretchImage = 3_i32
  end
  enum InkOverlayEraserMode
    IOERM_StrokeErase = 0_i32
    IOERM_PointErase = 1_i32
  end
  enum InkCollectionMode
    ICM_InkOnly = 0_i32
    ICM_GestureOnly = 1_i32
    ICM_InkAndGesture = 2_i32
  end
  enum DISPID_InkCollector
    DISPID_ICEnabled = 1_i32
    DISPID_ICHwnd = 2_i32
    DISPID_ICPaint = 3_i32
    DISPID_ICText = 4_i32
    DISPID_ICDefaultDrawingAttributes = 5_i32
    DISPID_ICRenderer = 6_i32
    DISPID_ICInk = 7_i32
    DISPID_ICAutoRedraw = 8_i32
    DISPID_ICCollectingInk = 9_i32
    DISPID_ICSetEventInterest = 10_i32
    DISPID_ICGetEventInterest = 11_i32
    DISPID_IOEditingMode = 12_i32
    DISPID_IOSelection = 13_i32
    DISPID_IOAttachMode = 14_i32
    DISPID_IOHitTestSelection = 15_i32
    DISPID_IODraw = 16_i32
    DISPID_IPPicture = 17_i32
    DISPID_IPSizeMode = 18_i32
    DISPID_IPBackColor = 19_i32
    DISPID_ICCursors = 20_i32
    DISPID_ICMarginX = 21_i32
    DISPID_ICMarginY = 22_i32
    DISPID_ICSetWindowInputRectangle = 23_i32
    DISPID_ICGetWindowInputRectangle = 24_i32
    DISPID_ICTablet = 25_i32
    DISPID_ICSetAllTabletsMode = 26_i32
    DISPID_ICSetSingleTabletIntegratedMode = 27_i32
    DISPID_ICCollectionMode = 28_i32
    DISPID_ICSetGestureStatus = 29_i32
    DISPID_ICGetGestureStatus = 30_i32
    DISPID_ICDynamicRendering = 31_i32
    DISPID_ICDesiredPacketDescription = 32_i32
    DISPID_IOEraserMode = 33_i32
    DISPID_IOEraserWidth = 34_i32
    DISPID_ICMouseIcon = 35_i32
    DISPID_ICMousePointer = 36_i32
    DISPID_IPInkEnabled = 37_i32
    DISPID_ICSupportHighContrastInk = 38_i32
    DISPID_IOSupportHighContrastSelectionUI = 39_i32
  end
  enum DISPID_InkRecognizer
    DISPID_RecoClsid = 1_i32
    DISPID_RecoName = 2_i32
    DISPID_RecoVendor = 3_i32
    DISPID_RecoCapabilities = 4_i32
    DISPID_RecoLanguageID = 5_i32
    DISPID_RecoPreferredPacketDescription = 6_i32
    DISPID_RecoCreateRecognizerContext = 7_i32
    DISPID_RecoSupportedProperties = 8_i32
  end
  enum InkRecognizerCapabilities
    IRC_DontCare = 1_i32
    IRC_Object = 2_i32
    IRC_FreeInput = 4_i32
    IRC_LinedInput = 8_i32
    IRC_BoxedInput = 16_i32
    IRC_CharacterAutoCompletionInput = 32_i32
    IRC_RightAndDown = 64_i32
    IRC_LeftAndDown = 128_i32
    IRC_DownAndLeft = 256_i32
    IRC_DownAndRight = 512_i32
    IRC_ArbitraryAngle = 1024_i32
    IRC_Lattice = 2048_i32
    IRC_AdviseInkChange = 4096_i32
    IRC_StrokeReorder = 8192_i32
    IRC_Personalizable = 16384_i32
    IRC_PrefersArbitraryAngle = 32768_i32
    IRC_PrefersParagraphBreaking = 65536_i32
    IRC_PrefersSegmentation = 131072_i32
    IRC_Cursive = 262144_i32
    IRC_TextPrediction = 524288_i32
    IRC_Alpha = 1048576_i32
    IRC_Beta = 2097152_i32
  end
  enum DISPID_InkRecognizer2
    DISPID_RecoId = 0_i32
    DISPID_RecoUnicodeRanges = 1_i32
  end
  enum DISPID_InkRecognizers
    DISPID_IRecos_NewEnum = -4_i32
    DISPID_IRecosItem = 0_i32
    DISPID_IRecosCount = 1_i32
    DISPID_IRecosGetDefaultRecognizer = 2_i32
  end
  enum InkRecognizerCharacterAutoCompletionMode
    IRCACM_Full = 0_i32
    IRCACM_Prefix = 1_i32
    IRCACM_Random = 2_i32
  end
  enum InkRecognitionModes
    IRM_None = 0_i32
    IRM_WordModeOnly = 1_i32
    IRM_Coerce = 2_i32
    IRM_TopInkBreaksOnly = 4_i32
    IRM_PrefixOk = 8_i32
    IRM_LineMode = 16_i32
    IRM_DisablePersonalization = 32_i32
    IRM_AutoSpace = 64_i32
    IRM_Max = 128_i32
  end
  enum DISPID_InkRecognitionEvent
    DISPID_IRERecognitionWithAlternates = 1_i32
    DISPID_IRERecognition = 2_i32
  end
  enum DISPID_InkRecoContext
    DISPID_IRecoCtx_Strokes = 1_i32
    DISPID_IRecoCtx_CharacterAutoCompletionMode = 2_i32
    DISPID_IRecoCtx_Factoid = 3_i32
    DISPID_IRecoCtx_WordList = 4_i32
    DISPID_IRecoCtx_Recognizer = 5_i32
    DISPID_IRecoCtx_Guide = 6_i32
    DISPID_IRecoCtx_Flags = 7_i32
    DISPID_IRecoCtx_PrefixText = 8_i32
    DISPID_IRecoCtx_SuffixText = 9_i32
    DISPID_IRecoCtx_StopRecognition = 10_i32
    DISPID_IRecoCtx_Clone = 11_i32
    DISPID_IRecoCtx_Recognize = 12_i32
    DISPID_IRecoCtx_StopBackgroundRecognition = 13_i32
    DISPID_IRecoCtx_EndInkInput = 14_i32
    DISPID_IRecoCtx_BackgroundRecognize = 15_i32
    DISPID_IRecoCtx_BackgroundRecognizeWithAlternates = 16_i32
    DISPID_IRecoCtx_IsStringSupported = 17_i32
  end
  enum DISPID_InkRecoContext2
    DISPID_IRecoCtx2_EnabledUnicodeRanges = 0_i32
  end
  enum InkRecognitionAlternatesSelection
    IRAS_Start = 0_i32
    IRAS_DefaultCount = 10_i32
    IRAS_All = -1_i32
  end
  enum DISPID_InkRecognitionResult
    DISPID_InkRecognitionResult_TopString = 1_i32
    DISPID_InkRecognitionResult_TopAlternate = 2_i32
    DISPID_InkRecognitionResult_Strokes = 3_i32
    DISPID_InkRecognitionResult_TopConfidence = 4_i32
    DISPID_InkRecognitionResult_AlternatesFromSelection = 5_i32
    DISPID_InkRecognitionResult_ModifyTopAlternate = 6_i32
    DISPID_InkRecognitionResult_SetResultOnStrokes = 7_i32
  end
  enum DISPID_InkRecoAlternate
    DISPID_InkRecoAlternate_String = 1_i32
    DISPID_InkRecoAlternate_LineNumber = 2_i32
    DISPID_InkRecoAlternate_Baseline = 3_i32
    DISPID_InkRecoAlternate_Midline = 4_i32
    DISPID_InkRecoAlternate_Ascender = 5_i32
    DISPID_InkRecoAlternate_Descender = 6_i32
    DISPID_InkRecoAlternate_Confidence = 7_i32
    DISPID_InkRecoAlternate_Strokes = 8_i32
    DISPID_InkRecoAlternate_GetStrokesFromStrokeRanges = 9_i32
    DISPID_InkRecoAlternate_GetStrokesFromTextRange = 10_i32
    DISPID_InkRecoAlternate_GetTextRangeFromStrokes = 11_i32
    DISPID_InkRecoAlternate_GetPropertyValue = 12_i32
    DISPID_InkRecoAlternate_LineAlternates = 13_i32
    DISPID_InkRecoAlternate_ConfidenceAlternates = 14_i32
    DISPID_InkRecoAlternate_AlternatesWithConstantPropertyValues = 15_i32
  end
  enum DISPID_InkRecognitionAlternates
    DISPID_InkRecognitionAlternates_NewEnum = -4_i32
    DISPID_InkRecognitionAlternates_Item = 0_i32
    DISPID_InkRecognitionAlternates_Count = 1_i32
    DISPID_InkRecognitionAlternates_Strokes = 2_i32
  end
  enum DISPID_InkRecognizerGuide
    DISPID_IRGWritingBox = 1_i32
    DISPID_IRGDrawnBox = 2_i32
    DISPID_IRGRows = 3_i32
    DISPID_IRGColumns = 4_i32
    DISPID_IRGMidline = 5_i32
    DISPID_IRGGuideData = 6_i32
  end
  enum DISPID_InkWordList
    DISPID_InkWordList_AddWord = 0_i32
    DISPID_InkWordList_RemoveWord = 1_i32
    DISPID_InkWordList_Merge = 2_i32
  end
  enum DISPID_InkWordList2
    DISPID_InkWordList2_AddWords = 3_i32
  end
  enum InkDivisionType
    IDT_Segment = 0_i32
    IDT_Line = 1_i32
    IDT_Paragraph = 2_i32
    IDT_Drawing = 3_i32
  end
  enum DISPID_InkDivider
    DISPID_IInkDivider_Strokes = 1_i32
    DISPID_IInkDivider_RecognizerContext = 2_i32
    DISPID_IInkDivider_LineHeight = 3_i32
    DISPID_IInkDivider_Divide = 4_i32
  end
  enum DISPID_InkDivisionResult
    DISPID_IInkDivisionResult_Strokes = 1_i32
    DISPID_IInkDivisionResult_ResultByType = 2_i32
  end
  enum DISPID_InkDivisionUnit
    DISPID_IInkDivisionUnit_Strokes = 1_i32
    DISPID_IInkDivisionUnit_DivisionType = 2_i32
    DISPID_IInkDivisionUnit_RecognizedString = 3_i32
    DISPID_IInkDivisionUnit_RotationTransform = 4_i32
  end
  enum DISPID_InkDivisionUnits
    DISPID_IInkDivisionUnits_NewEnum = -4_i32
    DISPID_IInkDivisionUnits_Item = 0_i32
    DISPID_IInkDivisionUnits_Count = 1_i32
  end
  enum DISPID_PenInputPanel
    DISPID_PIPAttachedEditWindow = 0_i32
    DISPID_PIPFactoid = 1_i32
    DISPID_PIPCurrentPanel = 2_i32
    DISPID_PIPDefaultPanel = 3_i32
    DISPID_PIPVisible = 4_i32
    DISPID_PIPTop = 5_i32
    DISPID_PIPLeft = 6_i32
    DISPID_PIPWidth = 7_i32
    DISPID_PIPHeight = 8_i32
    DISPID_PIPMoveTo = 9_i32
    DISPID_PIPCommitPendingInput = 10_i32
    DISPID_PIPRefresh = 11_i32
    DISPID_PIPBusy = 12_i32
    DISPID_PIPVerticalOffset = 13_i32
    DISPID_PIPHorizontalOffset = 14_i32
    DISPID_PIPEnableTsf = 15_i32
    DISPID_PIPAutoShow = 16_i32
  end
  enum DISPID_PenInputPanelEvents
    DISPID_PIPEVisibleChanged = 0_i32
    DISPID_PIPEPanelChanged = 1_i32
    DISPID_PIPEInputFailed = 2_i32
    DISPID_PIPEPanelMoving = 3_i32
  end
  enum VisualState
    InPlace = 0_i32
    Floating = 1_i32
    DockedTop = 2_i32
    DockedBottom = 3_i32
    Closed = 4_i32
  end
  enum InteractionMode
    InteractionMode_InPlace = 0_i32
    InteractionMode_Floating = 1_i32
    InteractionMode_DockedTop = 2_i32
    InteractionMode_DockedBottom = 3_i32
  end
  enum InPlaceState
    InPlaceState_Auto = 0_i32
    InPlaceState_HoverTarget = 1_i32
    InPlaceState_Expanded = 2_i32
  end
  enum PanelInputArea
    PanelInputArea_Auto = 0_i32
    PanelInputArea_Keyboard = 1_i32
    PanelInputArea_WritingPad = 2_i32
    PanelInputArea_CharacterPad = 3_i32
  end
  enum CorrectionMode
    CorrectionMode_NotVisible = 0_i32
    CorrectionMode_PreInsertion = 1_i32
    CorrectionMode_PostInsertionCollapsed = 2_i32
    CorrectionMode_PostInsertionExpanded = 3_i32
  end
  enum CorrectionPosition
    CorrectionPosition_Auto = 0_i32
    CorrectionPosition_Bottom = 1_i32
    CorrectionPosition_Top = 2_i32
  end
  enum InPlaceDirection
    InPlaceDirection_Auto = 0_i32
    InPlaceDirection_Bottom = 1_i32
    InPlaceDirection_Top = 2_i32
  end
  enum EventMask
    EventMask_InPlaceStateChanging = 1_i32
    EventMask_InPlaceStateChanged = 2_i32
    EventMask_InPlaceSizeChanging = 4_i32
    EventMask_InPlaceSizeChanged = 8_i32
    EventMask_InputAreaChanging = 16_i32
    EventMask_InputAreaChanged = 32_i32
    EventMask_CorrectionModeChanging = 64_i32
    EventMask_CorrectionModeChanged = 128_i32
    EventMask_InPlaceVisibilityChanging = 256_i32
    EventMask_InPlaceVisibilityChanged = 512_i32
    EventMask_TextInserting = 1024_i32
    EventMask_TextInserted = 2048_i32
    EventMask_All = 4095_i32
  end
  enum PanelType
    PT_Default = 0_i32
    PT_Inactive = 1_i32
    PT_Handwriting = 2_i32
    PT_Keyboard = 3_i32
  end
  enum FLICKDIRECTION
    FLICKDIRECTION_MIN = 0_i32
    FLICKDIRECTION_RIGHT = 0_i32
    FLICKDIRECTION_UPRIGHT = 1_i32
    FLICKDIRECTION_UP = 2_i32
    FLICKDIRECTION_UPLEFT = 3_i32
    FLICKDIRECTION_LEFT = 4_i32
    FLICKDIRECTION_DOWNLEFT = 5_i32
    FLICKDIRECTION_DOWN = 6_i32
    FLICKDIRECTION_DOWNRIGHT = 7_i32
    FLICKDIRECTION_INVALID = 8_i32
  end
  enum FLICKMODE
    FLICKMODE_MIN = 0_i32
    FLICKMODE_OFF = 0_i32
    FLICKMODE_ON = 1_i32
    FLICKMODE_LEARNING = 2_i32
    FLICKMODE_MAX = 2_i32
    FLICKMODE_DEFAULT = 1_i32
  end
  enum FLICKACTION_COMMANDCODE
    FLICKACTION_COMMANDCODE_NULL = 0_i32
    FLICKACTION_COMMANDCODE_SCROLL = 1_i32
    FLICKACTION_COMMANDCODE_APPCOMMAND = 2_i32
    FLICKACTION_COMMANDCODE_CUSTOMKEY = 3_i32
    FLICKACTION_COMMANDCODE_KEYMODIFIER = 4_i32
  end
  enum SCROLLDIRECTION
    SCROLLDIRECTION_UP = 0_i32
    SCROLLDIRECTION_DOWN = 1_i32
  end
  enum KEYMODIFIER
    KEYMODIFIER_CONTROL = 1_i32
    KEYMODIFIER_MENU = 2_i32
    KEYMODIFIER_SHIFT = 4_i32
    KEYMODIFIER_WIN = 8_i32
    KEYMODIFIER_ALTGR = 16_i32
    KEYMODIFIER_EXT = 32_i32
  end
  enum MouseButton
    NO_BUTTON = 0_i32
    LEFT_BUTTON = 1_i32
    RIGHT_BUTTON = 2_i32
    MIDDLE_BUTTON = 4_i32
  end
  enum SelAlignmentConstants
    Rtfleft = 0_i32
    Rtfright = 1_i32
    Rtfcenter = 2_i32
  end
  enum DISPID_InkEdit
    DISPID_Text = 0_i32
    DISPID_TextRTF = 1_i32
    DISPID_Hwnd = 2_i32
    DISPID_DisableNoScroll = 3_i32
    DISPID_Locked = 4_i32
    DISPID_Enabled = 5_i32
    DISPID_MaxLength = 6_i32
    DISPID_MultiLine = 7_i32
    DISPID_ScrollBars = 8_i32
    DISPID_RTSelStart = 9_i32
    DISPID_RTSelLength = 10_i32
    DISPID_RTSelText = 11_i32
    DISPID_SelAlignment = 12_i32
    DISPID_SelBold = 13_i32
    DISPID_SelCharOffset = 14_i32
    DISPID_SelColor = 15_i32
    DISPID_SelFontName = 16_i32
    DISPID_SelFontSize = 17_i32
    DISPID_SelItalic = 18_i32
    DISPID_SelRTF = 19_i32
    DISPID_SelUnderline = 20_i32
    DISPID_DragIcon = 21_i32
    DISPID_Status = 22_i32
    DISPID_UseMouseForInput = 23_i32
    DISPID_InkMode = 24_i32
    DISPID_InkInsertMode = 25_i32
    DISPID_RecoTimeout = 26_i32
    DISPID_DrawAttr = 27_i32
    DISPID_Recognizer = 28_i32
    DISPID_Factoid = 29_i32
    DISPID_SelInk = 30_i32
    DISPID_SelInksDisplayMode = 31_i32
    DISPID_Recognize = 32_i32
    DISPID_GetGestStatus = 33_i32
    DISPID_SetGestStatus = 34_i32
    DISPID_Refresh = 35_i32
  end
  enum DISPID_InkEditEvents
    DISPID_IeeChange = 1_i32
    DISPID_IeeSelChange = 2_i32
    DISPID_IeeKeyDown = 3_i32
    DISPID_IeeKeyUp = 4_i32
    DISPID_IeeMouseUp = 5_i32
    DISPID_IeeMouseDown = 6_i32
    DISPID_IeeKeyPress = 7_i32
    DISPID_IeeDblClick = 8_i32
    DISPID_IeeClick = 9_i32
    DISPID_IeeMouseMove = 10_i32
    DISPID_IeeCursorDown = 21_i32
    DISPID_IeeStroke = 22_i32
    DISPID_IeeGesture = 23_i32
    DISPID_IeeRecognitionResult = 24_i32
  end
  enum InkMode
    IEM_Disabled = 0_i32
    IEM_Ink = 1_i32
    IEM_InkAndGesture = 2_i32
  end
  enum InkInsertMode
    IEM_InsertText = 0_i32
    IEM_InsertInk = 1_i32
  end
  enum InkEditStatus
    IES_Idle = 0_i32
    IES_Collecting = 1_i32
    IES_Recognizing = 2_i32
  end
  enum InkDisplayMode
    IDM_Ink = 0_i32
    IDM_Text = 1_i32
  end
  enum AppearanceConstants
    Rtfflat = 0_i32
    Rtfthreed = 1_i32
  end
  enum BorderStyleConstants
    Rtfnoborder = 0_i32
    Rtffixedsingle = 1_i32
  end
  enum ScrollBarsConstants
    Rtfnone = 0_i32
    Rtfhorizontal = 1_i32
    Rtfvertical = 2_i32
    Rtfboth = 3_i32
  end
  enum MICUIELEMENT
    MICUIELEMENT_BUTTON_WRITE = 1_i32
    MICUIELEMENT_BUTTON_ERASE = 2_i32
    MICUIELEMENT_BUTTON_CORRECT = 4_i32
    MICUIELEMENT_BUTTON_CLEAR = 8_i32
    MICUIELEMENT_BUTTON_UNDO = 16_i32
    MICUIELEMENT_BUTTON_REDO = 32_i32
    MICUIELEMENT_BUTTON_INSERT = 64_i32
    MICUIELEMENT_BUTTON_CANCEL = 128_i32
    MICUIELEMENT_INKPANEL_BACKGROUND = 256_i32
    MICUIELEMENT_RESULTPANEL_BACKGROUND = 512_i32
  end
  enum MICUIELEMENTSTATE
    MICUIELEMENTSTATE_NORMAL = 1_i32
    MICUIELEMENTSTATE_HOT = 2_i32
    MICUIELEMENTSTATE_PRESSED = 3_i32
    MICUIELEMENTSTATE_DISABLED = 4_i32
  end
  enum DISPID_MathInputControlEvents
    DISPID_MICInsert = 0_i32
    DISPID_MICClose = 1_i32
    DISPID_MICPaint = 2_i32
    DISPID_MICClear = 3_i32
  end
  enum RealTimeStylusDataInterest
    RTSDI_AllData = -1_i32
    RTSDI_None = 0_i32
    RTSDI_Error = 1_i32
    RTSDI_RealTimeStylusEnabled = 2_i32
    RTSDI_RealTimeStylusDisabled = 4_i32
    RTSDI_StylusNew = 8_i32
    RTSDI_StylusInRange = 16_i32
    RTSDI_InAirPackets = 32_i32
    RTSDI_StylusOutOfRange = 64_i32
    RTSDI_StylusDown = 128_i32
    RTSDI_Packets = 256_i32
    RTSDI_StylusUp = 512_i32
    RTSDI_StylusButtonUp = 1024_i32
    RTSDI_StylusButtonDown = 2048_i32
    RTSDI_SystemEvents = 4096_i32
    RTSDI_TabletAdded = 8192_i32
    RTSDI_TabletRemoved = 16384_i32
    RTSDI_CustomStylusDataAdded = 32768_i32
    RTSDI_UpdateMapping = 65536_i32
    RTSDI_DefaultEvents = 37766_i32
  end
  enum StylusQueue
    SyncStylusQueue = 1_i32
    AsyncStylusQueueImmediate = 2_i32
    AsyncStylusQueue = 3_i32
  end
  enum RealTimeStylusLockType
    RTSLT_ObjLock = 1_i32
    RTSLT_SyncEventLock = 2_i32
    RTSLT_AsyncEventLock = 4_i32
    RTSLT_ExcludeCallback = 8_i32
    RTSLT_SyncObjLock = 11_i32
    RTSLT_AsyncObjLock = 13_i32
  end
  enum LINE_METRICS
    LM_BASELINE = 0_i32
    LM_MIDLINE = 1_i32
    LM_ASCENDER = 2_i32
    LM_DESCENDER = 3_i32
  end
  enum CONFIDENCE_LEVEL
    CFL_STRONG = 0_i32
    CFL_INTERMEDIATE = 1_i32
    CFL_POOR = 2_i32
  end
  enum ALT_BREAKS
    ALT_BREAKS_SAME = 0_i32
    ALT_BREAKS_UNIQUE = 1_i32
    ALT_BREAKS_FULL = 2_i32
  end
  enum Enumreco_type
    RECO_TYPE_WSTRING = 0_i32
    RECO_TYPE_WCHAR = 1_i32
  end

  @[Extern]
  record SYSTEM_EVENT_DATA,
    bModifier : UInt8,
    wKey : UInt16,
    xPos : Int32,
    yPos : Int32,
    bCursorMode : UInt8,
    dwButtonState : UInt32

  @[Extern]
  record STROKE_RANGE,
    iStrokeBegin : UInt32,
    iStrokeEnd : UInt32

  @[Extern]
  record PROPERTY_METRICS,
    nLogicalMin : Int32,
    nLogicalMax : Int32,
    units : Win32cr::UI::TabletPC::PROPERTY_UNITS,
    fResolution : Float32

  @[Extern]
  record PACKET_PROPERTY,
    guid : LibC::GUID,
    property_metrics : Win32cr::UI::TabletPC::PROPERTY_METRICS

  @[Extern]
  record PACKET_DESCRIPTION,
    cbPacketSize : UInt32,
    cPacketProperties : UInt32,
    pPacketProperties : Win32cr::UI::TabletPC::PACKET_PROPERTY*,
    cButtons : UInt32,
    pguidButtons : LibC::GUID*

  @[Extern]
  record INKMETRIC,
    iHeight : Int32,
    iFontAscent : Int32,
    iFontDescent : Int32,
    dwFlags : UInt32,
    color : UInt32

  @[Extern]
  record InkRecoGuide,
    rectWritingBox : Win32cr::Foundation::RECT,
    rectDrawnBox : Win32cr::Foundation::RECT,
    cRows : Int32,
    cColumns : Int32,
    midline : Int32

  @[Extern]
  record FLICK_POINT,
    _bitfield : Int32

  @[Extern]
  record FLICK_DATA,
    _bitfield : Int32

  @[Extern]
  record IEC_STROKEINFO,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    cursor : Void*,
    stroke : Void*

  @[Extern]
  record IEC_GESTUREINFO,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    cursor : Void*,
    strokes : Void*,
    gestures : Win32cr::System::Com::VARIANT

  @[Extern]
  record IEC_RECOGNITIONRESULTINFO,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    recognition_result : Void*

  @[Extern]
  record StylusInfo,
    tcid : UInt32,
    cid : UInt32,
    bIsInvertedCursor : Win32cr::Foundation::BOOL

  @[Extern]
  record GESTURE_DATA,
    gestureId : Int32,
    recoConfidence : Int32,
    strokeCount : Int32

  @[Extern]
  record DYNAMIC_RENDERER_CACHED_DATA,
    strokeId : Int32,
    dynamicRenderer : Void*

  @[Extern]
  record RECO_GUIDE,
    xOrigin : Int32,
    yOrigin : Int32,
    cxBox : Int32,
    cyBox : Int32,
    cxBase : Int32,
    cyBase : Int32,
    cHorzBox : Int32,
    cVertBox : Int32,
    cyMid : Int32

  @[Extern]
  record RECO_ATTRS,
    dwRecoCapabilityFlags : UInt32,
    awcVendorName : UInt16[32],
    awcFriendlyName : UInt16[64],
    awLanguageId : UInt16[64]

  @[Extern]
  record RECO_RANGE,
    iwcBegin : UInt32,
    cCount : UInt32

  @[Extern]
  record LINE_SEGMENT,
    pt_a : Win32cr::Foundation::POINT,
    pt_b : Win32cr::Foundation::POINT

  @[Extern]
  record LATTICE_METRICS,
    lsBaseline : Win32cr::UI::TabletPC::LINE_SEGMENT,
    iMidlineOffset : Int16

  @[Extern]
  record RECO_LATTICE_PROPERTY,
    guidProperty : LibC::GUID,
    cbPropertyValue : UInt16,
    pPropertyValue : UInt8*

  @[Extern]
  record RECO_LATTICE_PROPERTIES,
    cProperties : UInt32,
    apProps : Win32cr::UI::TabletPC::RECO_LATTICE_PROPERTY**

  @[Extern]
  record RECO_LATTICE_ELEMENT,
    score : Int32,
    type__ : UInt16,
    pData : UInt8*,
    ulNextColumn : UInt32,
    ulStrokeNumber : UInt32,
    epProp : Win32cr::UI::TabletPC::RECO_LATTICE_PROPERTIES

  @[Extern]
  record RECO_LATTICE_COLUMN,
    key : UInt32,
    cpProp : Win32cr::UI::TabletPC::RECO_LATTICE_PROPERTIES,
    cStrokes : UInt32,
    pStrokes : UInt32*,
    cLatticeElements : UInt32,
    pLatticeElements : Win32cr::UI::TabletPC::RECO_LATTICE_ELEMENT*

  @[Extern]
  record RECO_LATTICE,
    ulColumnCount : UInt32,
    pLatticeColumns : Win32cr::UI::TabletPC::RECO_LATTICE_COLUMN*,
    ulPropertyCount : UInt32,
    pGuidProperties : LibC::GUID*,
    ulBestResultColumnCount : UInt32,
    pulBestResultColumns : UInt32*,
    pulBestResultIndexes : UInt32*

  @[Extern]
  record CHARACTER_RANGE,
    wcLow : UInt16,
    cChars : UInt16

  @[Extern]
  record IInkRectangleVtbl,
    query_interface : Proc(IInkRectangle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRectangle*, UInt32),
    release : Proc(IInkRectangle*, UInt32),
    get_type_info_count : Proc(IInkRectangle*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRectangle*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRectangle*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRectangle*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Top : Proc(IInkRectangle*, Int32*, Win32cr::Foundation::HRESULT),
    put_Top : Proc(IInkRectangle*, Int32, Win32cr::Foundation::HRESULT),
    get_Left : Proc(IInkRectangle*, Int32*, Win32cr::Foundation::HRESULT),
    put_Left : Proc(IInkRectangle*, Int32, Win32cr::Foundation::HRESULT),
    get_Bottom : Proc(IInkRectangle*, Int32*, Win32cr::Foundation::HRESULT),
    put_Bottom : Proc(IInkRectangle*, Int32, Win32cr::Foundation::HRESULT),
    get_Right : Proc(IInkRectangle*, Int32*, Win32cr::Foundation::HRESULT),
    put_Right : Proc(IInkRectangle*, Int32, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IInkRectangle*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IInkRectangle*, Win32cr::Foundation::RECT, Win32cr::Foundation::HRESULT),
    get_rectangle : Proc(IInkRectangle*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_rectangle : Proc(IInkRectangle*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9794ff82-6071-4717-8a8b-6ac7c64a686e")]
  record IInkRectangle, lpVtbl : IInkRectangleVtbl* do
    GUID = LibC::GUID.new(0x9794ff82_u32, 0x6071_u16, 0x4717_u16, StaticArray[0x8a_u8, 0x8b_u8, 0x6a_u8, 0xc7_u8, 0xc6_u8, 0x4a_u8, 0x68_u8, 0x6e_u8])
    def query_interface(this : IInkRectangle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRectangle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRectangle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRectangle*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRectangle*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRectangle*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRectangle*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Top(this : IInkRectangle*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Top.call(this, units)
    end
    def put_Top(this : IInkRectangle*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Top.call(this, units)
    end
    def get_Left(this : IInkRectangle*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Left.call(this, units)
    end
    def put_Left(this : IInkRectangle*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Left.call(this, units)
    end
    def get_Bottom(this : IInkRectangle*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bottom.call(this, units)
    end
    def put_Bottom(this : IInkRectangle*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Bottom.call(this, units)
    end
    def get_Right(this : IInkRectangle*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Right.call(this, units)
    end
    def put_Right(this : IInkRectangle*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Right.call(this, units)
    end
    def get_Data(this : IInkRectangle*, rect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, rect)
    end
    def put_Data(this : IInkRectangle*, rect : Win32cr::Foundation::RECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, rect)
    end
    def get_rectangle(this : IInkRectangle*, top : Int32*, left : Int32*, bottom : Int32*, right : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rectangle.call(this, top, left, bottom, right)
    end
    def set_rectangle(this : IInkRectangle*, top : Int32, left : Int32, bottom : Int32, right : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rectangle.call(this, top, left, bottom, right)
    end

  end

  @[Extern]
  record IInkExtendedPropertyVtbl,
    query_interface : Proc(IInkExtendedProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkExtendedProperty*, UInt32),
    release : Proc(IInkExtendedProperty*, UInt32),
    get_type_info_count : Proc(IInkExtendedProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkExtendedProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkExtendedProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkExtendedProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Guid : Proc(IInkExtendedProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IInkExtendedProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IInkExtendedProperty*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db489209-b7c3-411d-90f6-1548cfff271e")]
  record IInkExtendedProperty, lpVtbl : IInkExtendedPropertyVtbl* do
    GUID = LibC::GUID.new(0xdb489209_u32, 0xb7c3_u16, 0x411d_u16, StaticArray[0x90_u8, 0xf6_u8, 0x15_u8, 0x48_u8, 0xcf_u8, 0xff_u8, 0x27_u8, 0x1e_u8])
    def query_interface(this : IInkExtendedProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkExtendedProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkExtendedProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkExtendedProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkExtendedProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkExtendedProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkExtendedProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Guid(this : IInkExtendedProperty*, guid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guid.call(this, guid)
    end
    def get_Data(this : IInkExtendedProperty*, data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, data)
    end
    def put_Data(this : IInkExtendedProperty*, data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, data)
    end

  end

  @[Extern]
  record IInkExtendedPropertiesVtbl,
    query_interface : Proc(IInkExtendedProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkExtendedProperties*, UInt32),
    release : Proc(IInkExtendedProperties*, UInt32),
    get_type_info_count : Proc(IInkExtendedProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkExtendedProperties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkExtendedProperties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkExtendedProperties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkExtendedProperties*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkExtendedProperties*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkExtendedProperties*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IInkExtendedProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(IInkExtendedProperties*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IInkExtendedProperties*, Win32cr::Foundation::HRESULT),
    does_property_exist : Proc(IInkExtendedProperties*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("89f2a8be-95a9-4530-8b8f-88e971e3e25f")]
  record IInkExtendedProperties, lpVtbl : IInkExtendedPropertiesVtbl* do
    GUID = LibC::GUID.new(0x89f2a8be_u32, 0x95a9_u16, 0x4530_u16, StaticArray[0x8b_u8, 0x8f_u8, 0x88_u8, 0xe9_u8, 0x71_u8, 0xe3_u8, 0xe2_u8, 0x5f_u8])
    def query_interface(this : IInkExtendedProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkExtendedProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkExtendedProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkExtendedProperties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkExtendedProperties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkExtendedProperties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkExtendedProperties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkExtendedProperties*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkExtendedProperties*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def item(this : IInkExtendedProperties*, identifier : Win32cr::System::Com::VARIANT, item : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, identifier, item)
    end
    def add(this : IInkExtendedProperties*, guid : Win32cr::Foundation::BSTR, data : Win32cr::System::Com::VARIANT, ink_extended_property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, guid, data, ink_extended_property)
    end
    def remove(this : IInkExtendedProperties*, identifier : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, identifier)
    end
    def clear(this : IInkExtendedProperties*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def does_property_exist(this : IInkExtendedProperties*, guid : Win32cr::Foundation::BSTR, does_property_exist : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_property_exist.call(this, guid, does_property_exist)
    end

  end

  @[Extern]
  record IInkDrawingAttributesVtbl,
    query_interface : Proc(IInkDrawingAttributes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDrawingAttributes*, UInt32),
    release : Proc(IInkDrawingAttributes*, UInt32),
    get_type_info_count : Proc(IInkDrawingAttributes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDrawingAttributes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDrawingAttributes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDrawingAttributes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Color : Proc(IInkDrawingAttributes*, Int32*, Win32cr::Foundation::HRESULT),
    put_Color : Proc(IInkDrawingAttributes*, Int32, Win32cr::Foundation::HRESULT),
    get_Width : Proc(IInkDrawingAttributes*, Float32*, Win32cr::Foundation::HRESULT),
    put_Width : Proc(IInkDrawingAttributes*, Float32, Win32cr::Foundation::HRESULT),
    get_Height : Proc(IInkDrawingAttributes*, Float32*, Win32cr::Foundation::HRESULT),
    put_Height : Proc(IInkDrawingAttributes*, Float32, Win32cr::Foundation::HRESULT),
    get_FitToCurve : Proc(IInkDrawingAttributes*, Int16*, Win32cr::Foundation::HRESULT),
    put_FitToCurve : Proc(IInkDrawingAttributes*, Int16, Win32cr::Foundation::HRESULT),
    get_IgnorePressure : Proc(IInkDrawingAttributes*, Int16*, Win32cr::Foundation::HRESULT),
    put_IgnorePressure : Proc(IInkDrawingAttributes*, Int16, Win32cr::Foundation::HRESULT),
    get_AntiAliased : Proc(IInkDrawingAttributes*, Int16*, Win32cr::Foundation::HRESULT),
    put_AntiAliased : Proc(IInkDrawingAttributes*, Int16, Win32cr::Foundation::HRESULT),
    get_Transparency : Proc(IInkDrawingAttributes*, Int32*, Win32cr::Foundation::HRESULT),
    put_Transparency : Proc(IInkDrawingAttributes*, Int32, Win32cr::Foundation::HRESULT),
    get_RasterOperation : Proc(IInkDrawingAttributes*, Win32cr::UI::TabletPC::InkRasterOperation*, Win32cr::Foundation::HRESULT),
    put_RasterOperation : Proc(IInkDrawingAttributes*, Win32cr::UI::TabletPC::InkRasterOperation, Win32cr::Foundation::HRESULT),
    get_PenTip : Proc(IInkDrawingAttributes*, Win32cr::UI::TabletPC::InkPenTip*, Win32cr::Foundation::HRESULT),
    put_PenTip : Proc(IInkDrawingAttributes*, Win32cr::UI::TabletPC::InkPenTip, Win32cr::Foundation::HRESULT),
    get_ExtendedProperties : Proc(IInkDrawingAttributes*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IInkDrawingAttributes*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bf519b75-0a15-4623-adc9-c00d436a8092")]
  record IInkDrawingAttributes, lpVtbl : IInkDrawingAttributesVtbl* do
    GUID = LibC::GUID.new(0xbf519b75_u32, 0xa15_u16, 0x4623_u16, StaticArray[0xad_u8, 0xc9_u8, 0xc0_u8, 0xd_u8, 0x43_u8, 0x6a_u8, 0x80_u8, 0x92_u8])
    def query_interface(this : IInkDrawingAttributes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDrawingAttributes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDrawingAttributes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDrawingAttributes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDrawingAttributes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDrawingAttributes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDrawingAttributes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Color(this : IInkDrawingAttributes*, current_color : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Color.call(this, current_color)
    end
    def put_Color(this : IInkDrawingAttributes*, new_color : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Color.call(this, new_color)
    end
    def get_Width(this : IInkDrawingAttributes*, current_width : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, current_width)
    end
    def put_Width(this : IInkDrawingAttributes*, new_width : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Width.call(this, new_width)
    end
    def get_Height(this : IInkDrawingAttributes*, current_height : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Height.call(this, current_height)
    end
    def put_Height(this : IInkDrawingAttributes*, new_height : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Height.call(this, new_height)
    end
    def get_FitToCurve(this : IInkDrawingAttributes*, flag : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FitToCurve.call(this, flag)
    end
    def put_FitToCurve(this : IInkDrawingAttributes*, flag : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FitToCurve.call(this, flag)
    end
    def get_IgnorePressure(this : IInkDrawingAttributes*, flag : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IgnorePressure.call(this, flag)
    end
    def put_IgnorePressure(this : IInkDrawingAttributes*, flag : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IgnorePressure.call(this, flag)
    end
    def get_AntiAliased(this : IInkDrawingAttributes*, flag : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntiAliased.call(this, flag)
    end
    def put_AntiAliased(this : IInkDrawingAttributes*, flag : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AntiAliased.call(this, flag)
    end
    def get_Transparency(this : IInkDrawingAttributes*, current_transparency : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Transparency.call(this, current_transparency)
    end
    def put_Transparency(this : IInkDrawingAttributes*, new_transparency : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Transparency.call(this, new_transparency)
    end
    def get_RasterOperation(this : IInkDrawingAttributes*, current_raster_operation : Win32cr::UI::TabletPC::InkRasterOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RasterOperation.call(this, current_raster_operation)
    end
    def put_RasterOperation(this : IInkDrawingAttributes*, new_raster_operation : Win32cr::UI::TabletPC::InkRasterOperation) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RasterOperation.call(this, new_raster_operation)
    end
    def get_PenTip(this : IInkDrawingAttributes*, current_pen_tip : Win32cr::UI::TabletPC::InkPenTip*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PenTip.call(this, current_pen_tip)
    end
    def put_PenTip(this : IInkDrawingAttributes*, new_pen_tip : Win32cr::UI::TabletPC::InkPenTip) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PenTip.call(this, new_pen_tip)
    end
    def get_ExtendedProperties(this : IInkDrawingAttributes*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedProperties.call(this, properties)
    end
    def clone(this : IInkDrawingAttributes*, drawing_attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, drawing_attributes)
    end

  end

  @[Extern]
  record IInkTransformVtbl,
    query_interface : Proc(IInkTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkTransform*, UInt32),
    release : Proc(IInkTransform*, UInt32),
    get_type_info_count : Proc(IInkTransform*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkTransform*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkTransform*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkTransform*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IInkTransform*, Win32cr::Foundation::HRESULT),
    translate : Proc(IInkTransform*, Float32, Float32, Win32cr::Foundation::HRESULT),
    rotate : Proc(IInkTransform*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    reflect : Proc(IInkTransform*, Int16, Int16, Win32cr::Foundation::HRESULT),
    shear : Proc(IInkTransform*, Float32, Float32, Win32cr::Foundation::HRESULT),
    scale_transform : Proc(IInkTransform*, Float32, Float32, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IInkTransform*, Float32*, Float32*, Float32*, Float32*, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    set_transform : Proc(IInkTransform*, Float32, Float32, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    get_eM11 : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eM11 : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_eM12 : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eM12 : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_eM21 : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eM21 : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_eM22 : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eM22 : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_eDx : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eDx : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_eDy : Proc(IInkTransform*, Float32*, Win32cr::Foundation::HRESULT),
    put_eDy : Proc(IInkTransform*, Float32, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IInkTransform*, Win32cr::Graphics::Gdi::XFORM*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IInkTransform*, Win32cr::Graphics::Gdi::XFORM, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("615f1d43-8703-4565-88e2-8201d2ecd7b7")]
  record IInkTransform, lpVtbl : IInkTransformVtbl* do
    GUID = LibC::GUID.new(0x615f1d43_u32, 0x8703_u16, 0x4565_u16, StaticArray[0x88_u8, 0xe2_u8, 0x82_u8, 0x1_u8, 0xd2_u8, 0xec_u8, 0xd7_u8, 0xb7_u8])
    def query_interface(this : IInkTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkTransform*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkTransform*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkTransform*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkTransform*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def reset(this : IInkTransform*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def translate(this : IInkTransform*, horizontal_component : Float32, vertical_component : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate.call(this, horizontal_component, vertical_component)
    end
    def rotate(this : IInkTransform*, degrees : Float32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees, x, y)
    end
    def reflect(this : IInkTransform*, horizontally : Int16, vertically : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reflect.call(this, horizontally, vertically)
    end
    def shear(this : IInkTransform*, horizontal_component : Float32, vertical_component : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shear.call(this, horizontal_component, vertical_component)
    end
    def scale_transform(this : IInkTransform*, horizontal_multiplier : Float32, vertical_multiplier : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_transform.call(this, horizontal_multiplier, vertical_multiplier)
    end
    def get_transform(this : IInkTransform*, eM11 : Float32*, eM12 : Float32*, eM21 : Float32*, eM22 : Float32*, eDx : Float32*, eDy : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, eM11, eM12, eM21, eM22, eDx, eDy)
    end
    def set_transform(this : IInkTransform*, eM11 : Float32, eM12 : Float32, eM21 : Float32, eM22 : Float32, eDx : Float32, eDy : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform.call(this, eM11, eM12, eM21, eM22, eDx, eDy)
    end
    def get_eM11(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eM11.call(this, value)
    end
    def put_eM11(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eM11.call(this, value)
    end
    def get_eM12(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eM12.call(this, value)
    end
    def put_eM12(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eM12.call(this, value)
    end
    def get_eM21(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eM21.call(this, value)
    end
    def put_eM21(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eM21.call(this, value)
    end
    def get_eM22(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eM22.call(this, value)
    end
    def put_eM22(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eM22.call(this, value)
    end
    def get_eDx(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eDx.call(this, value)
    end
    def put_eDx(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eDx.call(this, value)
    end
    def get_eDy(this : IInkTransform*, value : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eDy.call(this, value)
    end
    def put_eDy(this : IInkTransform*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_eDy.call(this, value)
    end
    def get_Data(this : IInkTransform*, x_form : Win32cr::Graphics::Gdi::XFORM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, x_form)
    end
    def put_Data(this : IInkTransform*, x_form : Win32cr::Graphics::Gdi::XFORM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, x_form)
    end

  end

  @[Extern]
  record IInkGestureVtbl,
    query_interface : Proc(IInkGesture*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkGesture*, UInt32),
    release : Proc(IInkGesture*, UInt32),
    get_type_info_count : Proc(IInkGesture*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkGesture*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkGesture*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkGesture*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Confidence : Proc(IInkGesture*, Win32cr::UI::TabletPC::InkRecognitionConfidence*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IInkGesture*, Win32cr::UI::TabletPC::InkApplicationGesture*, Win32cr::Foundation::HRESULT),
    get_hot_point : Proc(IInkGesture*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3bdc0a97-04e5-4e26-b813-18f052d41def")]
  record IInkGesture, lpVtbl : IInkGestureVtbl* do
    GUID = LibC::GUID.new(0x3bdc0a97_u32, 0x4e5_u16, 0x4e26_u16, StaticArray[0xb8_u8, 0x13_u8, 0x18_u8, 0xf0_u8, 0x52_u8, 0xd4_u8, 0x1d_u8, 0xef_u8])
    def query_interface(this : IInkGesture*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkGesture*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkGesture*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkGesture*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkGesture*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkGesture*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkGesture*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Confidence(this : IInkGesture*, confidence : Win32cr::UI::TabletPC::InkRecognitionConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Confidence.call(this, confidence)
    end
    def get_Id(this : IInkGesture*, id : Win32cr::UI::TabletPC::InkApplicationGesture*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_hot_point(this : IInkGesture*, x : Int32*, y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hot_point.call(this, x, y)
    end

  end

  @[Extern]
  record IInkCursorVtbl,
    query_interface : Proc(IInkCursor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCursor*, UInt32),
    release : Proc(IInkCursor*, UInt32),
    get_type_info_count : Proc(IInkCursor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCursor*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCursor*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCursor*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IInkCursor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IInkCursor*, Int32*, Win32cr::Foundation::HRESULT),
    get_Inverted : Proc(IInkCursor*, Int16*, Win32cr::Foundation::HRESULT),
    get_DrawingAttributes : Proc(IInkCursor*, Void**, Win32cr::Foundation::HRESULT),
    putref_DrawingAttributes : Proc(IInkCursor*, Void*, Win32cr::Foundation::HRESULT),
    get_Tablet : Proc(IInkCursor*, Void**, Win32cr::Foundation::HRESULT),
    get_Buttons : Proc(IInkCursor*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ad30c630-40c5-4350-8405-9c71012fc558")]
  record IInkCursor, lpVtbl : IInkCursorVtbl* do
    GUID = LibC::GUID.new(0xad30c630_u32, 0x40c5_u16, 0x4350_u16, StaticArray[0x84_u8, 0x5_u8, 0x9c_u8, 0x71_u8, 0x1_u8, 0x2f_u8, 0xc5_u8, 0x58_u8])
    def query_interface(this : IInkCursor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCursor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCursor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCursor*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCursor*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCursor*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCursor*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IInkCursor*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Id(this : IInkCursor*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Inverted(this : IInkCursor*, status : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Inverted.call(this, status)
    end
    def get_DrawingAttributes(this : IInkCursor*, attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DrawingAttributes.call(this, attributes)
    end
    def putref_DrawingAttributes(this : IInkCursor*, attributes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DrawingAttributes.call(this, attributes)
    end
    def get_Tablet(this : IInkCursor*, tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tablet.call(this, tablet)
    end
    def get_Buttons(this : IInkCursor*, buttons : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Buttons.call(this, buttons)
    end

  end

  @[Extern]
  record IInkCursorsVtbl,
    query_interface : Proc(IInkCursors*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCursors*, UInt32),
    release : Proc(IInkCursors*, UInt32),
    get_type_info_count : Proc(IInkCursors*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCursors*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCursors*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCursors*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkCursors*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkCursors*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkCursors*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a248c1ac-c698-4e06-9e5c-d57f77c7e647")]
  record IInkCursors, lpVtbl : IInkCursorsVtbl* do
    GUID = LibC::GUID.new(0xa248c1ac_u32, 0xc698_u16, 0x4e06_u16, StaticArray[0x9e_u8, 0x5c_u8, 0xd5_u8, 0x7f_u8, 0x77_u8, 0xc7_u8, 0xe6_u8, 0x47_u8])
    def query_interface(this : IInkCursors*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCursors*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCursors*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCursors*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCursors*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCursors*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCursors*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkCursors*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkCursors*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def item(this : IInkCursors*, index : Int32, cursor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, cursor)
    end

  end

  @[Extern]
  record IInkCursorButtonVtbl,
    query_interface : Proc(IInkCursorButton*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCursorButton*, UInt32),
    release : Proc(IInkCursorButton*, UInt32),
    get_type_info_count : Proc(IInkCursorButton*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCursorButton*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCursorButton*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCursorButton*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IInkCursorButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IInkCursorButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IInkCursorButton*, Win32cr::UI::TabletPC::InkCursorButtonState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85ef9417-1d59-49b2-a13c-702c85430894")]
  record IInkCursorButton, lpVtbl : IInkCursorButtonVtbl* do
    GUID = LibC::GUID.new(0x85ef9417_u32, 0x1d59_u16, 0x49b2_u16, StaticArray[0xa1_u8, 0x3c_u8, 0x70_u8, 0x2c_u8, 0x85_u8, 0x43_u8, 0x8_u8, 0x94_u8])
    def query_interface(this : IInkCursorButton*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCursorButton*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCursorButton*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCursorButton*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCursorButton*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCursorButton*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCursorButton*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IInkCursorButton*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Id(this : IInkCursorButton*, id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_State(this : IInkCursorButton*, current_state : Win32cr::UI::TabletPC::InkCursorButtonState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, current_state)
    end

  end

  @[Extern]
  record IInkCursorButtonsVtbl,
    query_interface : Proc(IInkCursorButtons*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCursorButtons*, UInt32),
    release : Proc(IInkCursorButtons*, UInt32),
    get_type_info_count : Proc(IInkCursorButtons*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCursorButtons*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCursorButtons*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCursorButtons*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkCursorButtons*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkCursorButtons*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkCursorButtons*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3671cc40-b624-4671-9fa0-db119d952d54")]
  record IInkCursorButtons, lpVtbl : IInkCursorButtonsVtbl* do
    GUID = LibC::GUID.new(0x3671cc40_u32, 0xb624_u16, 0x4671_u16, StaticArray[0x9f_u8, 0xa0_u8, 0xdb_u8, 0x11_u8, 0x9d_u8, 0x95_u8, 0x2d_u8, 0x54_u8])
    def query_interface(this : IInkCursorButtons*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCursorButtons*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCursorButtons*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCursorButtons*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCursorButtons*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCursorButtons*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCursorButtons*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkCursorButtons*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkCursorButtons*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def item(this : IInkCursorButtons*, identifier : Win32cr::System::Com::VARIANT, button : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, identifier, button)
    end

  end

  @[Extern]
  record IInkTabletVtbl,
    query_interface : Proc(IInkTablet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkTablet*, UInt32),
    release : Proc(IInkTablet*, UInt32),
    get_type_info_count : Proc(IInkTablet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkTablet*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkTablet*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkTablet*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IInkTablet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PlugAndPlayId : Proc(IInkTablet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MaximumInputRectangle : Proc(IInkTablet*, Void**, Win32cr::Foundation::HRESULT),
    get_HardwareCapabilities : Proc(IInkTablet*, Win32cr::UI::TabletPC::TabletHardwareCapabilities*, Win32cr::Foundation::HRESULT),
    is_packet_property_supported : Proc(IInkTablet*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_property_metrics : Proc(IInkTablet*, Win32cr::Foundation::BSTR, Int32*, Int32*, Win32cr::UI::TabletPC::TabletPropertyMetricUnit*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2de25eaa-6ef8-42d5-aee9-185bc81b912d")]
  record IInkTablet, lpVtbl : IInkTabletVtbl* do
    GUID = LibC::GUID.new(0x2de25eaa_u32, 0x6ef8_u16, 0x42d5_u16, StaticArray[0xae_u8, 0xe9_u8, 0x18_u8, 0x5b_u8, 0xc8_u8, 0x1b_u8, 0x91_u8, 0x2d_u8])
    def query_interface(this : IInkTablet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkTablet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkTablet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkTablet*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkTablet*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkTablet*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkTablet*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IInkTablet*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_PlugAndPlayId(this : IInkTablet*, id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlugAndPlayId.call(this, id)
    end
    def get_MaximumInputRectangle(this : IInkTablet*, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumInputRectangle.call(this, rectangle)
    end
    def get_HardwareCapabilities(this : IInkTablet*, capabilities : Win32cr::UI::TabletPC::TabletHardwareCapabilities*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HardwareCapabilities.call(this, capabilities)
    end
    def is_packet_property_supported(this : IInkTablet*, packetPropertyName : Win32cr::Foundation::BSTR, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_packet_property_supported.call(this, packetPropertyName, supported)
    end
    def get_property_metrics(this : IInkTablet*, propertyName : Win32cr::Foundation::BSTR, minimum : Int32*, maximum : Int32*, units : Win32cr::UI::TabletPC::TabletPropertyMetricUnit*, resolution : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_metrics.call(this, propertyName, minimum, maximum, units, resolution)
    end

  end

  @[Extern]
  record IInkTablet2Vtbl,
    query_interface : Proc(IInkTablet2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkTablet2*, UInt32),
    release : Proc(IInkTablet2*, UInt32),
    get_type_info_count : Proc(IInkTablet2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkTablet2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkTablet2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkTablet2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DeviceKind : Proc(IInkTablet2*, Win32cr::UI::TabletPC::TabletDeviceKind*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("90c91ad2-fa36-49d6-9516-ce8d570f6f85")]
  record IInkTablet2, lpVtbl : IInkTablet2Vtbl* do
    GUID = LibC::GUID.new(0x90c91ad2_u32, 0xfa36_u16, 0x49d6_u16, StaticArray[0x95_u8, 0x16_u8, 0xce_u8, 0x8d_u8, 0x57_u8, 0xf_u8, 0x6f_u8, 0x85_u8])
    def query_interface(this : IInkTablet2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkTablet2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkTablet2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkTablet2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkTablet2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkTablet2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkTablet2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DeviceKind(this : IInkTablet2*, kind : Win32cr::UI::TabletPC::TabletDeviceKind*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceKind.call(this, kind)
    end

  end

  @[Extern]
  record IInkTablet3Vtbl,
    query_interface : Proc(IInkTablet3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkTablet3*, UInt32),
    release : Proc(IInkTablet3*, UInt32),
    get_type_info_count : Proc(IInkTablet3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkTablet3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkTablet3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkTablet3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IsMultiTouch : Proc(IInkTablet3*, Int16*, Win32cr::Foundation::HRESULT),
    get_MaximumCursors : Proc(IInkTablet3*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7e313997-1327-41dd-8ca9-79f24be17250")]
  record IInkTablet3, lpVtbl : IInkTablet3Vtbl* do
    GUID = LibC::GUID.new(0x7e313997_u32, 0x1327_u16, 0x41dd_u16, StaticArray[0x8c_u8, 0xa9_u8, 0x79_u8, 0xf2_u8, 0x4b_u8, 0xe1_u8, 0x72_u8, 0x50_u8])
    def query_interface(this : IInkTablet3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkTablet3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkTablet3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkTablet3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkTablet3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkTablet3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkTablet3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_IsMultiTouch(this : IInkTablet3*, pIsMultiTouch : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMultiTouch.call(this, pIsMultiTouch)
    end
    def get_MaximumCursors(this : IInkTablet3*, pMaximumCursors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumCursors.call(this, pMaximumCursors)
    end

  end

  @[Extern]
  record IInkTabletsVtbl,
    query_interface : Proc(IInkTablets*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkTablets*, UInt32),
    release : Proc(IInkTablets*, UInt32),
    get_type_info_count : Proc(IInkTablets*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkTablets*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkTablets*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkTablets*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkTablets*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkTablets*, Void**, Win32cr::Foundation::HRESULT),
    get_DefaultTablet : Proc(IInkTablets*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkTablets*, Int32, Void**, Win32cr::Foundation::HRESULT),
    is_packet_property_supported : Proc(IInkTablets*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("112086d9-7779-4535-a699-862b43ac1863")]
  record IInkTablets, lpVtbl : IInkTabletsVtbl* do
    GUID = LibC::GUID.new(0x112086d9_u32, 0x7779_u16, 0x4535_u16, StaticArray[0xa6_u8, 0x99_u8, 0x86_u8, 0x2b_u8, 0x43_u8, 0xac_u8, 0x18_u8, 0x63_u8])
    def query_interface(this : IInkTablets*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkTablets*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkTablets*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkTablets*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkTablets*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkTablets*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkTablets*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkTablets*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkTablets*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def get_DefaultTablet(this : IInkTablets*, default_tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultTablet.call(this, default_tablet)
    end
    def item(this : IInkTablets*, index : Int32, tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, tablet)
    end
    def is_packet_property_supported(this : IInkTablets*, packetPropertyName : Win32cr::Foundation::BSTR, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_packet_property_supported.call(this, packetPropertyName, supported)
    end

  end

  @[Extern]
  record IInkStrokeDispVtbl,
    query_interface : Proc(IInkStrokeDisp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkStrokeDisp*, UInt32),
    release : Proc(IInkStrokeDisp*, UInt32),
    get_type_info_count : Proc(IInkStrokeDisp*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkStrokeDisp*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkStrokeDisp*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkStrokeDisp*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IInkStrokeDisp*, Int32*, Win32cr::Foundation::HRESULT),
    get_BezierPoints : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DrawingAttributes : Proc(IInkStrokeDisp*, Void**, Win32cr::Foundation::HRESULT),
    putref_DrawingAttributes : Proc(IInkStrokeDisp*, Void*, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IInkStrokeDisp*, Void**, Win32cr::Foundation::HRESULT),
    get_ExtendedProperties : Proc(IInkStrokeDisp*, Void**, Win32cr::Foundation::HRESULT),
    get_PolylineCusps : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_BezierCusps : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SelfIntersections : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PacketCount : Proc(IInkStrokeDisp*, Int32*, Win32cr::Foundation::HRESULT),
    get_PacketSize : Proc(IInkStrokeDisp*, Int32*, Win32cr::Foundation::HRESULT),
    get_PacketDescription : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Deleted : Proc(IInkStrokeDisp*, Int16*, Win32cr::Foundation::HRESULT),
    get_bounding_box : Proc(IInkStrokeDisp*, Win32cr::UI::TabletPC::InkBoundingBoxMode, Void**, Win32cr::Foundation::HRESULT),
    find_intersections : Proc(IInkStrokeDisp*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_rectangle_intersections : Proc(IInkStrokeDisp*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    clip : Proc(IInkStrokeDisp*, Void*, Win32cr::Foundation::HRESULT),
    hit_test_circle : Proc(IInkStrokeDisp*, Int32, Int32, Float32, Int16*, Win32cr::Foundation::HRESULT),
    nearest_point : Proc(IInkStrokeDisp*, Int32, Int32, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    split : Proc(IInkStrokeDisp*, Float32, Void**, Win32cr::Foundation::HRESULT),
    get_packet_description_property_metrics : Proc(IInkStrokeDisp*, Win32cr::Foundation::BSTR, Int32*, Int32*, Win32cr::UI::TabletPC::TabletPropertyMetricUnit*, Float32*, Win32cr::Foundation::HRESULT),
    get_points : Proc(IInkStrokeDisp*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_points : Proc(IInkStrokeDisp*, Win32cr::System::Com::VARIANT, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_packet_data : Proc(IInkStrokeDisp*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_packet_values_by_property : Proc(IInkStrokeDisp*, Win32cr::Foundation::BSTR, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_packet_values_by_property : Proc(IInkStrokeDisp*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_flattened_bezier_points : Proc(IInkStrokeDisp*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    transform : Proc(IInkStrokeDisp*, Void*, Int16, Win32cr::Foundation::HRESULT),
    scale_to_rectangle : Proc(IInkStrokeDisp*, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IInkStrokeDisp*, Float32, Float32, Win32cr::Foundation::HRESULT),
    rotate : Proc(IInkStrokeDisp*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    shear : Proc(IInkStrokeDisp*, Float32, Float32, Win32cr::Foundation::HRESULT),
    scale_transform : Proc(IInkStrokeDisp*, Float32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("43242fea-91d1-4a72-963e-fbb91829cfa2")]
  record IInkStrokeDisp, lpVtbl : IInkStrokeDispVtbl* do
    GUID = LibC::GUID.new(0x43242fea_u32, 0x91d1_u16, 0x4a72_u16, StaticArray[0x96_u8, 0x3e_u8, 0xfb_u8, 0xb9_u8, 0x18_u8, 0x29_u8, 0xcf_u8, 0xa2_u8])
    def query_interface(this : IInkStrokeDisp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkStrokeDisp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkStrokeDisp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkStrokeDisp*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkStrokeDisp*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkStrokeDisp*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkStrokeDisp*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ID(this : IInkStrokeDisp*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, id)
    end
    def get_BezierPoints(this : IInkStrokeDisp*, points : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BezierPoints.call(this, points)
    end
    def get_DrawingAttributes(this : IInkStrokeDisp*, draw_attrs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DrawingAttributes.call(this, draw_attrs)
    end
    def putref_DrawingAttributes(this : IInkStrokeDisp*, draw_attrs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DrawingAttributes.call(this, draw_attrs)
    end
    def get_Ink(this : IInkStrokeDisp*, ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ink)
    end
    def get_ExtendedProperties(this : IInkStrokeDisp*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedProperties.call(this, properties)
    end
    def get_PolylineCusps(this : IInkStrokeDisp*, cusps : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PolylineCusps.call(this, cusps)
    end
    def get_BezierCusps(this : IInkStrokeDisp*, cusps : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BezierCusps.call(this, cusps)
    end
    def get_SelfIntersections(this : IInkStrokeDisp*, intersections : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelfIntersections.call(this, intersections)
    end
    def get_PacketCount(this : IInkStrokeDisp*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PacketCount.call(this, plCount)
    end
    def get_PacketSize(this : IInkStrokeDisp*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PacketSize.call(this, plSize)
    end
    def get_PacketDescription(this : IInkStrokeDisp*, packet_description : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PacketDescription.call(this, packet_description)
    end
    def get_Deleted(this : IInkStrokeDisp*, deleted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deleted.call(this, deleted)
    end
    def get_bounding_box(this : IInkStrokeDisp*, bounding_box_mode : Win32cr::UI::TabletPC::InkBoundingBoxMode, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_box.call(this, bounding_box_mode, rectangle)
    end
    def find_intersections(this : IInkStrokeDisp*, strokes : Void*, intersections : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_intersections.call(this, strokes, intersections)
    end
    def get_rectangle_intersections(this : IInkStrokeDisp*, rectangle : Void*, intersections : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rectangle_intersections.call(this, rectangle, intersections)
    end
    def clip(this : IInkStrokeDisp*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clip.call(this, rectangle)
    end
    def hit_test_circle(this : IInkStrokeDisp*, x : Int32, y : Int32, radius : Float32, intersects : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_circle.call(this, x, y, radius, intersects)
    end
    def nearest_point(this : IInkStrokeDisp*, x : Int32, y : Int32, distance : Float32*, point : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.nearest_point.call(this, x, y, distance, point)
    end
    def split(this : IInkStrokeDisp*, split_at : Float32, new_stroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.split.call(this, split_at, new_stroke)
    end
    def get_packet_description_property_metrics(this : IInkStrokeDisp*, property_name : Win32cr::Foundation::BSTR, minimum : Int32*, maximum : Int32*, units : Win32cr::UI::TabletPC::TabletPropertyMetricUnit*, resolution : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_packet_description_property_metrics.call(this, property_name, minimum, maximum, units, resolution)
    end
    def get_points(this : IInkStrokeDisp*, index : Int32, count : Int32, points : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_points.call(this, index, count, points)
    end
    def set_points(this : IInkStrokeDisp*, points : Win32cr::System::Com::VARIANT, index : Int32, count : Int32, number_of_points_set : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_points.call(this, points, index, count, number_of_points_set)
    end
    def get_packet_data(this : IInkStrokeDisp*, index : Int32, count : Int32, packet_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_packet_data.call(this, index, count, packet_data)
    end
    def get_packet_values_by_property(this : IInkStrokeDisp*, property_name : Win32cr::Foundation::BSTR, index : Int32, count : Int32, packet_values : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_packet_values_by_property.call(this, property_name, index, count, packet_values)
    end
    def set_packet_values_by_property(this : IInkStrokeDisp*, bstrPropertyName : Win32cr::Foundation::BSTR, packet_values : Win32cr::System::Com::VARIANT, index : Int32, count : Int32, number_of_packets_set : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_packet_values_by_property.call(this, bstrPropertyName, packet_values, index, count, number_of_packets_set)
    end
    def get_flattened_bezier_points(this : IInkStrokeDisp*, fitting_error : Int32, flattened_bezier_points : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flattened_bezier_points.call(this, fitting_error, flattened_bezier_points)
    end
    def transform(this : IInkStrokeDisp*, transform : Void*, apply_on_pen_width : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transform.call(this, transform, apply_on_pen_width)
    end
    def scale_to_rectangle(this : IInkStrokeDisp*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_to_rectangle.call(this, rectangle)
    end
    def move(this : IInkStrokeDisp*, horizontal_component : Float32, vertical_component : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, horizontal_component, vertical_component)
    end
    def rotate(this : IInkStrokeDisp*, degrees : Float32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees, x, y)
    end
    def shear(this : IInkStrokeDisp*, horizontal_multiplier : Float32, vertical_multiplier : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shear.call(this, horizontal_multiplier, vertical_multiplier)
    end
    def scale_transform(this : IInkStrokeDisp*, horizontal_multiplier : Float32, vertical_multiplier : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_transform.call(this, horizontal_multiplier, vertical_multiplier)
    end

  end

  @[Extern]
  record IInkStrokesVtbl,
    query_interface : Proc(IInkStrokes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkStrokes*, UInt32),
    release : Proc(IInkStrokes*, UInt32),
    get_type_info_count : Proc(IInkStrokes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkStrokes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkStrokes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkStrokes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkStrokes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkStrokes*, Void**, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IInkStrokes*, Void**, Win32cr::Foundation::HRESULT),
    get_RecognitionResult : Proc(IInkStrokes*, Void**, Win32cr::Foundation::HRESULT),
    to_string : Proc(IInkStrokes*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    item : Proc(IInkStrokes*, Int32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    add_strokes : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    remove_strokes : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    modify_drawing_attributes : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    get_bounding_box : Proc(IInkStrokes*, Win32cr::UI::TabletPC::InkBoundingBoxMode, Void**, Win32cr::Foundation::HRESULT),
    transform : Proc(IInkStrokes*, Void*, Int16, Win32cr::Foundation::HRESULT),
    scale_to_rectangle : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IInkStrokes*, Float32, Float32, Win32cr::Foundation::HRESULT),
    rotate : Proc(IInkStrokes*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    shear : Proc(IInkStrokes*, Float32, Float32, Win32cr::Foundation::HRESULT),
    scale_transform : Proc(IInkStrokes*, Float32, Float32, Win32cr::Foundation::HRESULT),
    clip : Proc(IInkStrokes*, Void*, Win32cr::Foundation::HRESULT),
    remove_recognition_result : Proc(IInkStrokes*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f1f4c9d8-590a-4963-b3ae-1935671bb6f3")]
  record IInkStrokes, lpVtbl : IInkStrokesVtbl* do
    GUID = LibC::GUID.new(0xf1f4c9d8_u32, 0x590a_u16, 0x4963_u16, StaticArray[0xb3_u8, 0xae_u8, 0x19_u8, 0x35_u8, 0x67_u8, 0x1b_u8, 0xb6_u8, 0xf3_u8])
    def query_interface(this : IInkStrokes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkStrokes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkStrokes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkStrokes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkStrokes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkStrokes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkStrokes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkStrokes*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkStrokes*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def get_Ink(this : IInkStrokes*, ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ink)
    end
    def get_RecognitionResult(this : IInkStrokes*, recognition_result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecognitionResult.call(this, recognition_result)
    end
    def to_string(this : IInkStrokes*, to_string : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.to_string.call(this, to_string)
    end
    def item(this : IInkStrokes*, index : Int32, stroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, stroke)
    end
    def add(this : IInkStrokes*, ink_stroke : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, ink_stroke)
    end
    def add_strokes(this : IInkStrokes*, ink_strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_strokes.call(this, ink_strokes)
    end
    def remove(this : IInkStrokes*, ink_stroke : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, ink_stroke)
    end
    def remove_strokes(this : IInkStrokes*, ink_strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_strokes.call(this, ink_strokes)
    end
    def modify_drawing_attributes(this : IInkStrokes*, draw_attrs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_drawing_attributes.call(this, draw_attrs)
    end
    def get_bounding_box(this : IInkStrokes*, bounding_box_mode : Win32cr::UI::TabletPC::InkBoundingBoxMode, bounding_box : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_box.call(this, bounding_box_mode, bounding_box)
    end
    def transform(this : IInkStrokes*, transform : Void*, apply_on_pen_width : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transform.call(this, transform, apply_on_pen_width)
    end
    def scale_to_rectangle(this : IInkStrokes*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_to_rectangle.call(this, rectangle)
    end
    def move(this : IInkStrokes*, horizontal_component : Float32, vertical_component : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, horizontal_component, vertical_component)
    end
    def rotate(this : IInkStrokes*, degrees : Float32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees, x, y)
    end
    def shear(this : IInkStrokes*, horizontal_multiplier : Float32, vertical_multiplier : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shear.call(this, horizontal_multiplier, vertical_multiplier)
    end
    def scale_transform(this : IInkStrokes*, horizontal_multiplier : Float32, vertical_multiplier : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_transform.call(this, horizontal_multiplier, vertical_multiplier)
    end
    def clip(this : IInkStrokes*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clip.call(this, rectangle)
    end
    def remove_recognition_result(this : IInkStrokes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_recognition_result.call(this)
    end

  end

  @[Extern]
  record IInkCustomStrokesVtbl,
    query_interface : Proc(IInkCustomStrokes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCustomStrokes*, UInt32),
    release : Proc(IInkCustomStrokes*, UInt32),
    get_type_info_count : Proc(IInkCustomStrokes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCustomStrokes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCustomStrokes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCustomStrokes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkCustomStrokes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkCustomStrokes*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkCustomStrokes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IInkCustomStrokes*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IInkCustomStrokes*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IInkCustomStrokes*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7e23a88f-c30e-420f-9bdb-28902543f0c1")]
  record IInkCustomStrokes, lpVtbl : IInkCustomStrokesVtbl* do
    GUID = LibC::GUID.new(0x7e23a88f_u32, 0xc30e_u16, 0x420f_u16, StaticArray[0x9b_u8, 0xdb_u8, 0x28_u8, 0x90_u8, 0x25_u8, 0x43_u8, 0xf0_u8, 0xc1_u8])
    def query_interface(this : IInkCustomStrokes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCustomStrokes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCustomStrokes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCustomStrokes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCustomStrokes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCustomStrokes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCustomStrokes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkCustomStrokes*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkCustomStrokes*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def item(this : IInkCustomStrokes*, identifier : Win32cr::System::Com::VARIANT, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, identifier, strokes)
    end
    def add(this : IInkCustomStrokes*, name : Win32cr::Foundation::BSTR, strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, name, strokes)
    end
    def remove(this : IInkCustomStrokes*, identifier : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, identifier)
    end
    def clear(this : IInkCustomStrokes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IInkStrokesEvents_Vtbl,
    query_interface : Proc(IInkStrokesEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkStrokesEvents_*, UInt32),
    release : Proc(IInkStrokesEvents_*, UInt32),
    get_type_info_count : Proc(IInkStrokesEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkStrokesEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkStrokesEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkStrokesEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f33053ec-5d25-430a-928f-76a6491dde15")]
  record IInkStrokesEvents_, lpVtbl : IInkStrokesEvents_Vtbl* do
    GUID = LibC::GUID.new(0xf33053ec_u32, 0x5d25_u16, 0x430a_u16, StaticArray[0x92_u8, 0x8f_u8, 0x76_u8, 0xa6_u8, 0x49_u8, 0x1d_u8, 0xde_u8, 0x15_u8])
    def query_interface(this : IInkStrokesEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkStrokesEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkStrokesEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkStrokesEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkStrokesEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkStrokesEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkStrokesEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkDispVtbl,
    query_interface : Proc(IInkDisp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDisp*, UInt32),
    release : Proc(IInkDisp*, UInt32),
    get_type_info_count : Proc(IInkDisp*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDisp*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDisp*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDisp*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkDisp*, Void**, Win32cr::Foundation::HRESULT),
    get_ExtendedProperties : Proc(IInkDisp*, Void**, Win32cr::Foundation::HRESULT),
    get_Dirty : Proc(IInkDisp*, Int16*, Win32cr::Foundation::HRESULT),
    put_Dirty : Proc(IInkDisp*, Int16, Win32cr::Foundation::HRESULT),
    get_CustomStrokes : Proc(IInkDisp*, Void**, Win32cr::Foundation::HRESULT),
    get_bounding_box : Proc(IInkDisp*, Win32cr::UI::TabletPC::InkBoundingBoxMode, Void**, Win32cr::Foundation::HRESULT),
    delete_strokes : Proc(IInkDisp*, Void*, Win32cr::Foundation::HRESULT),
    delete_stroke : Proc(IInkDisp*, Void*, Win32cr::Foundation::HRESULT),
    extract_strokes : Proc(IInkDisp*, Void*, Win32cr::UI::TabletPC::InkExtractFlags, Void**, Win32cr::Foundation::HRESULT),
    extract_with_rectangle : Proc(IInkDisp*, Void*, Win32cr::UI::TabletPC::InkExtractFlags, Void**, Win32cr::Foundation::HRESULT),
    clip : Proc(IInkDisp*, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IInkDisp*, Void**, Win32cr::Foundation::HRESULT),
    hit_test_circle : Proc(IInkDisp*, Int32, Int32, Float32, Void**, Win32cr::Foundation::HRESULT),
    hit_test_with_rectangle : Proc(IInkDisp*, Void*, Float32, Void**, Win32cr::Foundation::HRESULT),
    hit_test_with_lasso : Proc(IInkDisp*, Win32cr::System::Com::VARIANT, Float32, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    nearest_point : Proc(IInkDisp*, Int32, Int32, Float32*, Float32*, Void**, Win32cr::Foundation::HRESULT),
    create_strokes : Proc(IInkDisp*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add_strokes_at_rectangle : Proc(IInkDisp*, Void*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IInkDisp*, Win32cr::UI::TabletPC::InkPersistenceFormat, Win32cr::UI::TabletPC::InkPersistenceCompressionMode, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    load : Proc(IInkDisp*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    create_stroke : Proc(IInkDisp*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    clipboard_copy_with_rectangle : Proc(IInkDisp*, Void*, Win32cr::UI::TabletPC::InkClipboardFormats, Win32cr::UI::TabletPC::InkClipboardModes, Void**, Win32cr::Foundation::HRESULT),
    clipboard_copy : Proc(IInkDisp*, Void*, Win32cr::UI::TabletPC::InkClipboardFormats, Win32cr::UI::TabletPC::InkClipboardModes, Void**, Win32cr::Foundation::HRESULT),
    can_paste : Proc(IInkDisp*, Void*, Int16*, Win32cr::Foundation::HRESULT),
    clipboard_paste : Proc(IInkDisp*, Int32, Int32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9d398fa0-c4e2-4fcd-9973-975caaf47ea6")]
  record IInkDisp, lpVtbl : IInkDispVtbl* do
    GUID = LibC::GUID.new(0x9d398fa0_u32, 0xc4e2_u16, 0x4fcd_u16, StaticArray[0x99_u8, 0x73_u8, 0x97_u8, 0x5c_u8, 0xaa_u8, 0xf4_u8, 0x7e_u8, 0xa6_u8])
    def query_interface(this : IInkDisp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDisp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDisp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDisp*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDisp*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDisp*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDisp*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Strokes(this : IInkDisp*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def get_ExtendedProperties(this : IInkDisp*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedProperties.call(this, properties)
    end
    def get_Dirty(this : IInkDisp*, dirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dirty.call(this, dirty)
    end
    def put_Dirty(this : IInkDisp*, dirty : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Dirty.call(this, dirty)
    end
    def get_CustomStrokes(this : IInkDisp*, ppunkInkCustomStrokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CustomStrokes.call(this, ppunkInkCustomStrokes)
    end
    def get_bounding_box(this : IInkDisp*, bounding_box_mode : Win32cr::UI::TabletPC::InkBoundingBoxMode, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_box.call(this, bounding_box_mode, rectangle)
    end
    def delete_strokes(this : IInkDisp*, strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_strokes.call(this, strokes)
    end
    def delete_stroke(this : IInkDisp*, stroke : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_stroke.call(this, stroke)
    end
    def extract_strokes(this : IInkDisp*, strokes : Void*, extract_flags : Win32cr::UI::TabletPC::InkExtractFlags, extracted_ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.extract_strokes.call(this, strokes, extract_flags, extracted_ink)
    end
    def extract_with_rectangle(this : IInkDisp*, rectangle : Void*, extractFlags : Win32cr::UI::TabletPC::InkExtractFlags, extracted_ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.extract_with_rectangle.call(this, rectangle, extractFlags, extracted_ink)
    end
    def clip(this : IInkDisp*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clip.call(this, rectangle)
    end
    def clone(this : IInkDisp*, new_ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, new_ink)
    end
    def hit_test_circle(this : IInkDisp*, x : Int32, y : Int32, radius : Float32, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_circle.call(this, x, y, radius, strokes)
    end
    def hit_test_with_rectangle(this : IInkDisp*, selection_rectangle : Void*, intersect_percent : Float32, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_with_rectangle.call(this, selection_rectangle, intersect_percent, strokes)
    end
    def hit_test_with_lasso(this : IInkDisp*, points : Win32cr::System::Com::VARIANT, intersect_percent : Float32, lasso_points : Win32cr::System::Com::VARIANT*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_with_lasso.call(this, points, intersect_percent, lasso_points, strokes)
    end
    def nearest_point(this : IInkDisp*, x : Int32, y : Int32, point_on_stroke : Float32*, distance_from_packet : Float32*, stroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.nearest_point.call(this, x, y, point_on_stroke, distance_from_packet, stroke)
    end
    def create_strokes(this : IInkDisp*, stroke_ids : Win32cr::System::Com::VARIANT, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_strokes.call(this, stroke_ids, strokes)
    end
    def add_strokes_at_rectangle(this : IInkDisp*, source_strokes : Void*, target_rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_strokes_at_rectangle.call(this, source_strokes, target_rectangle)
    end
    def save(this : IInkDisp*, persistence_format : Win32cr::UI::TabletPC::InkPersistenceFormat, compression_mode : Win32cr::UI::TabletPC::InkPersistenceCompressionMode, data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, persistence_format, compression_mode, data)
    end
    def load(this : IInkDisp*, data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, data)
    end
    def create_stroke(this : IInkDisp*, packet_data : Win32cr::System::Com::VARIANT, packet_description : Win32cr::System::Com::VARIANT, stroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stroke.call(this, packet_data, packet_description, stroke)
    end
    def clipboard_copy_with_rectangle(this : IInkDisp*, rectangle : Void*, clipboard_formats : Win32cr::UI::TabletPC::InkClipboardFormats, clipboard_modes : Win32cr::UI::TabletPC::InkClipboardModes, data_object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clipboard_copy_with_rectangle.call(this, rectangle, clipboard_formats, clipboard_modes, data_object)
    end
    def clipboard_copy(this : IInkDisp*, strokes : Void*, clipboard_formats : Win32cr::UI::TabletPC::InkClipboardFormats, clipboard_modes : Win32cr::UI::TabletPC::InkClipboardModes, data_object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clipboard_copy.call(this, strokes, clipboard_formats, clipboard_modes, data_object)
    end
    def can_paste(this : IInkDisp*, data_object : Void*, can_paste : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_paste.call(this, data_object, can_paste)
    end
    def clipboard_paste(this : IInkDisp*, x : Int32, y : Int32, data_object : Void*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clipboard_paste.call(this, x, y, data_object, strokes)
    end

  end

  @[Extern]
  record IInkEvents_Vtbl,
    query_interface : Proc(IInkEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkEvents_*, UInt32),
    release : Proc(IInkEvents_*, UInt32),
    get_type_info_count : Proc(IInkEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("427b1865-ca3f-479a-83a9-0f420f2a0073")]
  record IInkEvents_, lpVtbl : IInkEvents_Vtbl* do
    GUID = LibC::GUID.new(0x427b1865_u32, 0xca3f_u16, 0x479a_u16, StaticArray[0x83_u8, 0xa9_u8, 0xf_u8, 0x42_u8, 0xf_u8, 0x2a_u8, 0x0_u8, 0x73_u8])
    def query_interface(this : IInkEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkRendererVtbl,
    query_interface : Proc(IInkRenderer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRenderer*, UInt32),
    release : Proc(IInkRenderer*, UInt32),
    get_type_info_count : Proc(IInkRenderer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRenderer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRenderer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRenderer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_view_transform : Proc(IInkRenderer*, Void*, Win32cr::Foundation::HRESULT),
    set_view_transform : Proc(IInkRenderer*, Void*, Win32cr::Foundation::HRESULT),
    get_object_transform : Proc(IInkRenderer*, Void*, Win32cr::Foundation::HRESULT),
    set_object_transform : Proc(IInkRenderer*, Void*, Win32cr::Foundation::HRESULT),
    draw : Proc(IInkRenderer*, LibC::IntPtrT, Void*, Win32cr::Foundation::HRESULT),
    draw_stroke : Proc(IInkRenderer*, LibC::IntPtrT, Void*, Void*, Win32cr::Foundation::HRESULT),
    pixel_to_ink_space : Proc(IInkRenderer*, LibC::IntPtrT, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    ink_space_to_pixel : Proc(IInkRenderer*, LibC::IntPtrT, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    pixel_to_ink_space_from_points : Proc(IInkRenderer*, LibC::IntPtrT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    ink_space_to_pixel_from_points : Proc(IInkRenderer*, LibC::IntPtrT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    measure : Proc(IInkRenderer*, Void*, Void**, Win32cr::Foundation::HRESULT),
    measure_stroke : Proc(IInkRenderer*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    move : Proc(IInkRenderer*, Float32, Float32, Win32cr::Foundation::HRESULT),
    rotate : Proc(IInkRenderer*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    scale_transform : Proc(IInkRenderer*, Float32, Float32, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e6257a9c-b511-4f4c-a8b0-a7dbc9506b83")]
  record IInkRenderer, lpVtbl : IInkRendererVtbl* do
    GUID = LibC::GUID.new(0xe6257a9c_u32, 0xb511_u16, 0x4f4c_u16, StaticArray[0xa8_u8, 0xb0_u8, 0xa7_u8, 0xdb_u8, 0xc9_u8, 0x50_u8, 0x6b_u8, 0x83_u8])
    def query_interface(this : IInkRenderer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRenderer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRenderer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRenderer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRenderer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRenderer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRenderer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_view_transform(this : IInkRenderer*, view_transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_transform.call(this, view_transform)
    end
    def set_view_transform(this : IInkRenderer*, view_transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_view_transform.call(this, view_transform)
    end
    def get_object_transform(this : IInkRenderer*, object_transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_transform.call(this, object_transform)
    end
    def set_object_transform(this : IInkRenderer*, object_transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_transform.call(this, object_transform)
    end
    def draw(this : IInkRenderer*, hDC : LibC::IntPtrT, strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw.call(this, hDC, strokes)
    end
    def draw_stroke(this : IInkRenderer*, hDC : LibC::IntPtrT, stroke : Void*, drawing_attributes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw_stroke.call(this, hDC, stroke, drawing_attributes)
    end
    def pixel_to_ink_space(this : IInkRenderer*, hDC : LibC::IntPtrT, x : Int32*, y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pixel_to_ink_space.call(this, hDC, x, y)
    end
    def ink_space_to_pixel(this : IInkRenderer*, hdcDisplay : LibC::IntPtrT, x : Int32*, y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ink_space_to_pixel.call(this, hdcDisplay, x, y)
    end
    def pixel_to_ink_space_from_points(this : IInkRenderer*, hDC : LibC::IntPtrT, points : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pixel_to_ink_space_from_points.call(this, hDC, points)
    end
    def ink_space_to_pixel_from_points(this : IInkRenderer*, hDC : LibC::IntPtrT, points : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ink_space_to_pixel_from_points.call(this, hDC, points)
    end
    def measure(this : IInkRenderer*, strokes : Void*, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.measure.call(this, strokes, rectangle)
    end
    def measure_stroke(this : IInkRenderer*, stroke : Void*, drawing_attributes : Void*, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.measure_stroke.call(this, stroke, drawing_attributes, rectangle)
    end
    def move(this : IInkRenderer*, horizontal_component : Float32, vertical_component : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, horizontal_component, vertical_component)
    end
    def rotate(this : IInkRenderer*, degrees : Float32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees, x, y)
    end
    def scale_transform(this : IInkRenderer*, horizontal_multiplier : Float32, vertical_multiplier : Float32, apply_on_pen_width : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_transform.call(this, horizontal_multiplier, vertical_multiplier, apply_on_pen_width)
    end

  end

  @[Extern]
  record IInkCollectorVtbl,
    query_interface : Proc(IInkCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCollector*, UInt32),
    release : Proc(IInkCollector*, UInt32),
    get_type_info_count : Proc(IInkCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_hWnd : Proc(IInkCollector*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    put_hWnd : Proc(IInkCollector*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IInkCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IInkCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_DefaultDrawingAttributes : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    putref_DefaultDrawingAttributes : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_Renderer : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    putref_Renderer : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    putref_Ink : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_AutoRedraw : Proc(IInkCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoRedraw : Proc(IInkCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_CollectingInk : Proc(IInkCollector*, Int16*, Win32cr::Foundation::HRESULT),
    get_CollectionMode : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkCollectionMode*, Win32cr::Foundation::HRESULT),
    put_CollectionMode : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkCollectionMode, Win32cr::Foundation::HRESULT),
    get_DynamicRendering : Proc(IInkCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_DynamicRendering : Proc(IInkCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_DesiredPacketDescription : Proc(IInkCollector*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DesiredPacketDescription : Proc(IInkCollector*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MouseIcon : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_MouseIcon : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    putref_MouseIcon : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_MousePointer : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkMousePointer*, Win32cr::Foundation::HRESULT),
    put_MousePointer : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkMousePointer, Win32cr::Foundation::HRESULT),
    get_Cursors : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    get_MarginX : Proc(IInkCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginX : Proc(IInkCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_MarginY : Proc(IInkCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginY : Proc(IInkCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Tablet : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportHighContrastInk : Proc(IInkCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_SupportHighContrastInk : Proc(IInkCollector*, Int16, Win32cr::Foundation::HRESULT),
    set_gesture_status : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16, Win32cr::Foundation::HRESULT),
    get_gesture_status : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16*, Win32cr::Foundation::HRESULT),
    get_window_input_rectangle : Proc(IInkCollector*, Void**, Win32cr::Foundation::HRESULT),
    set_window_input_rectangle : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    set_all_tablets_mode : Proc(IInkCollector*, Int16, Win32cr::Foundation::HRESULT),
    set_single_tablet_integrated_mode : Proc(IInkCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16*, Win32cr::Foundation::HRESULT),
    set_event_interest : Proc(IInkCollector*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0f060b5-8b1f-4a7c-89ec-880692588a4f")]
  record IInkCollector, lpVtbl : IInkCollectorVtbl* do
    GUID = LibC::GUID.new(0xf0f060b5_u32, 0x8b1f_u16, 0x4a7c_u16, StaticArray[0x89_u8, 0xec_u8, 0x88_u8, 0x6_u8, 0x92_u8, 0x58_u8, 0x8a_u8, 0x4f_u8])
    def query_interface(this : IInkCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_hWnd(this : IInkCollector*, current_window : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hWnd.call(this, current_window)
    end
    def put_hWnd(this : IInkCollector*, new_window : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_hWnd.call(this, new_window)
    end
    def get_Enabled(this : IInkCollector*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, collecting)
    end
    def put_Enabled(this : IInkCollector*, collecting : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, collecting)
    end
    def get_DefaultDrawingAttributes(this : IInkCollector*, current_attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultDrawingAttributes.call(this, current_attributes)
    end
    def putref_DefaultDrawingAttributes(this : IInkCollector*, new_attributes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DefaultDrawingAttributes.call(this, new_attributes)
    end
    def get_Renderer(this : IInkCollector*, current_ink_renderer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Renderer.call(this, current_ink_renderer)
    end
    def putref_Renderer(this : IInkCollector*, new_ink_renderer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Renderer.call(this, new_ink_renderer)
    end
    def get_Ink(this : IInkCollector*, ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ink)
    end
    def putref_Ink(this : IInkCollector*, new_ink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Ink.call(this, new_ink)
    end
    def get_AutoRedraw(this : IInkCollector*, auto_redraw : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoRedraw.call(this, auto_redraw)
    end
    def put_AutoRedraw(this : IInkCollector*, auto_redraw : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoRedraw.call(this, auto_redraw)
    end
    def get_CollectingInk(this : IInkCollector*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectingInk.call(this, collecting)
    end
    def get_CollectionMode(this : IInkCollector*, mode : Win32cr::UI::TabletPC::InkCollectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectionMode.call(this, mode)
    end
    def put_CollectionMode(this : IInkCollector*, mode : Win32cr::UI::TabletPC::InkCollectionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CollectionMode.call(this, mode)
    end
    def get_DynamicRendering(this : IInkCollector*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DynamicRendering.call(this, enabled)
    end
    def put_DynamicRendering(this : IInkCollector*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DynamicRendering.call(this, enabled)
    end
    def get_DesiredPacketDescription(this : IInkCollector*, packet_guids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredPacketDescription.call(this, packet_guids)
    end
    def put_DesiredPacketDescription(this : IInkCollector*, packet_guids : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredPacketDescription.call(this, packet_guids)
    end
    def get_MouseIcon(this : IInkCollector*, mouse_icon : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MouseIcon.call(this, mouse_icon)
    end
    def put_MouseIcon(this : IInkCollector*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MouseIcon.call(this, mouse_icon)
    end
    def putref_MouseIcon(this : IInkCollector*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_MouseIcon.call(this, mouse_icon)
    end
    def get_MousePointer(this : IInkCollector*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MousePointer.call(this, mouse_pointer)
    end
    def put_MousePointer(this : IInkCollector*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MousePointer.call(this, mouse_pointer)
    end
    def get_Cursors(this : IInkCollector*, cursors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cursors.call(this, cursors)
    end
    def get_MarginX(this : IInkCollector*, margin_x : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginX.call(this, margin_x)
    end
    def put_MarginX(this : IInkCollector*, margin_x : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginX.call(this, margin_x)
    end
    def get_MarginY(this : IInkCollector*, margin_y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginY.call(this, margin_y)
    end
    def put_MarginY(this : IInkCollector*, margin_y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginY.call(this, margin_y)
    end
    def get_Tablet(this : IInkCollector*, single_tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tablet.call(this, single_tablet)
    end
    def get_SupportHighContrastInk(this : IInkCollector*, support : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportHighContrastInk.call(this, support)
    end
    def put_SupportHighContrastInk(this : IInkCollector*, support : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportHighContrastInk.call(this, support)
    end
    def set_gesture_status(this : IInkCollector*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gesture_status.call(this, gesture, listen)
    end
    def get_gesture_status(this : IInkCollector*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listening : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gesture_status.call(this, gesture, listening)
    end
    def get_window_input_rectangle(this : IInkCollector*, window_input_rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_window_input_rectangle(this : IInkCollector*, window_input_rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_all_tablets_mode(this : IInkCollector*, use_mouse_for_input : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_tablets_mode.call(this, use_mouse_for_input)
    end
    def set_single_tablet_integrated_mode(this : IInkCollector*, tablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_single_tablet_integrated_mode.call(this, tablet)
    end
    def get_event_interest(this : IInkCollector*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_interest.call(this, event_id, listen)
    end
    def set_event_interest(this : IInkCollector*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_interest.call(this, event_id, listen)
    end

  end

  @[Extern]
  record IInkCollectorEvents_Vtbl,
    query_interface : Proc(IInkCollectorEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkCollectorEvents_*, UInt32),
    release : Proc(IInkCollectorEvents_*, UInt32),
    get_type_info_count : Proc(IInkCollectorEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkCollectorEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkCollectorEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkCollectorEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("11a583f2-712d-4fea-abcf-ab4af38ea06b")]
  record IInkCollectorEvents_, lpVtbl : IInkCollectorEvents_Vtbl* do
    GUID = LibC::GUID.new(0x11a583f2_u32, 0x712d_u16, 0x4fea_u16, StaticArray[0xab_u8, 0xcf_u8, 0xab_u8, 0x4a_u8, 0xf3_u8, 0x8e_u8, 0xa0_u8, 0x6b_u8])
    def query_interface(this : IInkCollectorEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkCollectorEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkCollectorEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkCollectorEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkCollectorEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkCollectorEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkCollectorEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkOverlayVtbl,
    query_interface : Proc(IInkOverlay*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkOverlay*, UInt32),
    release : Proc(IInkOverlay*, UInt32),
    get_type_info_count : Proc(IInkOverlay*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkOverlay*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkOverlay*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkOverlay*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_hWnd : Proc(IInkOverlay*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    put_hWnd : Proc(IInkOverlay*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    get_DefaultDrawingAttributes : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    putref_DefaultDrawingAttributes : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_Renderer : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    putref_Renderer : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    putref_Ink : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_AutoRedraw : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoRedraw : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    get_CollectingInk : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    get_CollectionMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkCollectionMode*, Win32cr::Foundation::HRESULT),
    put_CollectionMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkCollectionMode, Win32cr::Foundation::HRESULT),
    get_DynamicRendering : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    put_DynamicRendering : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    get_DesiredPacketDescription : Proc(IInkOverlay*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DesiredPacketDescription : Proc(IInkOverlay*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MouseIcon : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    put_MouseIcon : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    putref_MouseIcon : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_MousePointer : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkMousePointer*, Win32cr::Foundation::HRESULT),
    put_MousePointer : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkMousePointer, Win32cr::Foundation::HRESULT),
    get_EditingMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayEditingMode*, Win32cr::Foundation::HRESULT),
    put_EditingMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayEditingMode, Win32cr::Foundation::HRESULT),
    get_Selection : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    put_Selection : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_EraserMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayEraserMode*, Win32cr::Foundation::HRESULT),
    put_EraserMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayEraserMode, Win32cr::Foundation::HRESULT),
    get_EraserWidth : Proc(IInkOverlay*, Int32*, Win32cr::Foundation::HRESULT),
    put_EraserWidth : Proc(IInkOverlay*, Int32, Win32cr::Foundation::HRESULT),
    get_AttachMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayAttachMode*, Win32cr::Foundation::HRESULT),
    put_AttachMode : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkOverlayAttachMode, Win32cr::Foundation::HRESULT),
    get_Cursors : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    get_MarginX : Proc(IInkOverlay*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginX : Proc(IInkOverlay*, Int32, Win32cr::Foundation::HRESULT),
    get_MarginY : Proc(IInkOverlay*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginY : Proc(IInkOverlay*, Int32, Win32cr::Foundation::HRESULT),
    get_Tablet : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportHighContrastInk : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    put_SupportHighContrastInk : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    get_SupportHighContrastSelectionUI : Proc(IInkOverlay*, Int16*, Win32cr::Foundation::HRESULT),
    put_SupportHighContrastSelectionUI : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    hit_test_selection : Proc(IInkOverlay*, Int32, Int32, Win32cr::UI::TabletPC::SelectionHitResult*, Win32cr::Foundation::HRESULT),
    draw : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    set_gesture_status : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16, Win32cr::Foundation::HRESULT),
    get_gesture_status : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16*, Win32cr::Foundation::HRESULT),
    get_window_input_rectangle : Proc(IInkOverlay*, Void**, Win32cr::Foundation::HRESULT),
    set_window_input_rectangle : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    set_all_tablets_mode : Proc(IInkOverlay*, Int16, Win32cr::Foundation::HRESULT),
    set_single_tablet_integrated_mode : Proc(IInkOverlay*, Void*, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16*, Win32cr::Foundation::HRESULT),
    set_event_interest : Proc(IInkOverlay*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b82a463b-c1c5-45a3-997c-deab5651b67a")]
  record IInkOverlay, lpVtbl : IInkOverlayVtbl* do
    GUID = LibC::GUID.new(0xb82a463b_u32, 0xc1c5_u16, 0x45a3_u16, StaticArray[0x99_u8, 0x7c_u8, 0xde_u8, 0xab_u8, 0x56_u8, 0x51_u8, 0xb6_u8, 0x7a_u8])
    def query_interface(this : IInkOverlay*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkOverlay*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkOverlay*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkOverlay*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkOverlay*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkOverlay*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkOverlay*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_hWnd(this : IInkOverlay*, current_window : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hWnd.call(this, current_window)
    end
    def put_hWnd(this : IInkOverlay*, new_window : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_hWnd.call(this, new_window)
    end
    def get_Enabled(this : IInkOverlay*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, collecting)
    end
    def put_Enabled(this : IInkOverlay*, collecting : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, collecting)
    end
    def get_DefaultDrawingAttributes(this : IInkOverlay*, current_attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultDrawingAttributes.call(this, current_attributes)
    end
    def putref_DefaultDrawingAttributes(this : IInkOverlay*, new_attributes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DefaultDrawingAttributes.call(this, new_attributes)
    end
    def get_Renderer(this : IInkOverlay*, current_ink_renderer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Renderer.call(this, current_ink_renderer)
    end
    def putref_Renderer(this : IInkOverlay*, new_ink_renderer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Renderer.call(this, new_ink_renderer)
    end
    def get_Ink(this : IInkOverlay*, ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ink)
    end
    def putref_Ink(this : IInkOverlay*, new_ink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Ink.call(this, new_ink)
    end
    def get_AutoRedraw(this : IInkOverlay*, auto_redraw : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoRedraw.call(this, auto_redraw)
    end
    def put_AutoRedraw(this : IInkOverlay*, auto_redraw : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoRedraw.call(this, auto_redraw)
    end
    def get_CollectingInk(this : IInkOverlay*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectingInk.call(this, collecting)
    end
    def get_CollectionMode(this : IInkOverlay*, mode : Win32cr::UI::TabletPC::InkCollectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectionMode.call(this, mode)
    end
    def put_CollectionMode(this : IInkOverlay*, mode : Win32cr::UI::TabletPC::InkCollectionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CollectionMode.call(this, mode)
    end
    def get_DynamicRendering(this : IInkOverlay*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DynamicRendering.call(this, enabled)
    end
    def put_DynamicRendering(this : IInkOverlay*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DynamicRendering.call(this, enabled)
    end
    def get_DesiredPacketDescription(this : IInkOverlay*, packet_guids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredPacketDescription.call(this, packet_guids)
    end
    def put_DesiredPacketDescription(this : IInkOverlay*, packet_guids : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredPacketDescription.call(this, packet_guids)
    end
    def get_MouseIcon(this : IInkOverlay*, mouse_icon : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MouseIcon.call(this, mouse_icon)
    end
    def put_MouseIcon(this : IInkOverlay*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MouseIcon.call(this, mouse_icon)
    end
    def putref_MouseIcon(this : IInkOverlay*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_MouseIcon.call(this, mouse_icon)
    end
    def get_MousePointer(this : IInkOverlay*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MousePointer.call(this, mouse_pointer)
    end
    def put_MousePointer(this : IInkOverlay*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MousePointer.call(this, mouse_pointer)
    end
    def get_EditingMode(this : IInkOverlay*, editing_mode : Win32cr::UI::TabletPC::InkOverlayEditingMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EditingMode.call(this, editing_mode)
    end
    def put_EditingMode(this : IInkOverlay*, editing_mode : Win32cr::UI::TabletPC::InkOverlayEditingMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EditingMode.call(this, editing_mode)
    end
    def get_Selection(this : IInkOverlay*, selection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Selection.call(this, selection)
    end
    def put_Selection(this : IInkOverlay*, selection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Selection.call(this, selection)
    end
    def get_EraserMode(this : IInkOverlay*, eraser_mode : Win32cr::UI::TabletPC::InkOverlayEraserMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EraserMode.call(this, eraser_mode)
    end
    def put_EraserMode(this : IInkOverlay*, eraser_mode : Win32cr::UI::TabletPC::InkOverlayEraserMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EraserMode.call(this, eraser_mode)
    end
    def get_EraserWidth(this : IInkOverlay*, eraser_width : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EraserWidth.call(this, eraser_width)
    end
    def put_EraserWidth(this : IInkOverlay*, newEraserWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EraserWidth.call(this, newEraserWidth)
    end
    def get_AttachMode(this : IInkOverlay*, attach_mode : Win32cr::UI::TabletPC::InkOverlayAttachMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachMode.call(this, attach_mode)
    end
    def put_AttachMode(this : IInkOverlay*, attach_mode : Win32cr::UI::TabletPC::InkOverlayAttachMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachMode.call(this, attach_mode)
    end
    def get_Cursors(this : IInkOverlay*, cursors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cursors.call(this, cursors)
    end
    def get_MarginX(this : IInkOverlay*, margin_x : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginX.call(this, margin_x)
    end
    def put_MarginX(this : IInkOverlay*, margin_x : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginX.call(this, margin_x)
    end
    def get_MarginY(this : IInkOverlay*, margin_y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginY.call(this, margin_y)
    end
    def put_MarginY(this : IInkOverlay*, margin_y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginY.call(this, margin_y)
    end
    def get_Tablet(this : IInkOverlay*, single_tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tablet.call(this, single_tablet)
    end
    def get_SupportHighContrastInk(this : IInkOverlay*, support : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportHighContrastInk.call(this, support)
    end
    def put_SupportHighContrastInk(this : IInkOverlay*, support : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportHighContrastInk.call(this, support)
    end
    def get_SupportHighContrastSelectionUI(this : IInkOverlay*, support : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportHighContrastSelectionUI.call(this, support)
    end
    def put_SupportHighContrastSelectionUI(this : IInkOverlay*, support : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportHighContrastSelectionUI.call(this, support)
    end
    def hit_test_selection(this : IInkOverlay*, x : Int32, y : Int32, sel_area : Win32cr::UI::TabletPC::SelectionHitResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_selection.call(this, x, y, sel_area)
    end
    def draw(this : IInkOverlay*, rect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw.call(this, rect)
    end
    def set_gesture_status(this : IInkOverlay*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gesture_status.call(this, gesture, listen)
    end
    def get_gesture_status(this : IInkOverlay*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listening : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gesture_status.call(this, gesture, listening)
    end
    def get_window_input_rectangle(this : IInkOverlay*, window_input_rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_window_input_rectangle(this : IInkOverlay*, window_input_rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_all_tablets_mode(this : IInkOverlay*, use_mouse_for_input : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_tablets_mode.call(this, use_mouse_for_input)
    end
    def set_single_tablet_integrated_mode(this : IInkOverlay*, tablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_single_tablet_integrated_mode.call(this, tablet)
    end
    def get_event_interest(this : IInkOverlay*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_interest.call(this, event_id, listen)
    end
    def set_event_interest(this : IInkOverlay*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_interest.call(this, event_id, listen)
    end

  end

  @[Extern]
  record IInkOverlayEvents_Vtbl,
    query_interface : Proc(IInkOverlayEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkOverlayEvents_*, UInt32),
    release : Proc(IInkOverlayEvents_*, UInt32),
    get_type_info_count : Proc(IInkOverlayEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkOverlayEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkOverlayEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkOverlayEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("31179b69-e563-489e-b16f-712f1e8a0651")]
  record IInkOverlayEvents_, lpVtbl : IInkOverlayEvents_Vtbl* do
    GUID = LibC::GUID.new(0x31179b69_u32, 0xe563_u16, 0x489e_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x71_u8, 0x2f_u8, 0x1e_u8, 0x8a_u8, 0x6_u8, 0x51_u8])
    def query_interface(this : IInkOverlayEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkOverlayEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkOverlayEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkOverlayEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkOverlayEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkOverlayEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkOverlayEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkPictureVtbl,
    query_interface : Proc(IInkPicture*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkPicture*, UInt32),
    release : Proc(IInkPicture*, UInt32),
    get_type_info_count : Proc(IInkPicture*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkPicture*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkPicture*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkPicture*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_hWnd : Proc(IInkPicture*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_DefaultDrawingAttributes : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    putref_DefaultDrawingAttributes : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_Renderer : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    putref_Renderer : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    putref_Ink : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_AutoRedraw : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoRedraw : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    get_CollectingInk : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    get_CollectionMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkCollectionMode*, Win32cr::Foundation::HRESULT),
    put_CollectionMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkCollectionMode, Win32cr::Foundation::HRESULT),
    get_DynamicRendering : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_DynamicRendering : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    get_DesiredPacketDescription : Proc(IInkPicture*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DesiredPacketDescription : Proc(IInkPicture*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MouseIcon : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    put_MouseIcon : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    putref_MouseIcon : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_MousePointer : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkMousePointer*, Win32cr::Foundation::HRESULT),
    put_MousePointer : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkMousePointer, Win32cr::Foundation::HRESULT),
    get_EditingMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkOverlayEditingMode*, Win32cr::Foundation::HRESULT),
    put_EditingMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkOverlayEditingMode, Win32cr::Foundation::HRESULT),
    get_Selection : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    put_Selection : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_EraserMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkOverlayEraserMode*, Win32cr::Foundation::HRESULT),
    put_EraserMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkOverlayEraserMode, Win32cr::Foundation::HRESULT),
    get_EraserWidth : Proc(IInkPicture*, Int32*, Win32cr::Foundation::HRESULT),
    put_EraserWidth : Proc(IInkPicture*, Int32, Win32cr::Foundation::HRESULT),
    putref_Picture : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    put_Picture : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_Picture : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    put_SizeMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkPictureSizeMode, Win32cr::Foundation::HRESULT),
    get_SizeMode : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkPictureSizeMode*, Win32cr::Foundation::HRESULT),
    put_BackColor : Proc(IInkPicture*, UInt32, Win32cr::Foundation::HRESULT),
    get_BackColor : Proc(IInkPicture*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Cursors : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    get_MarginX : Proc(IInkPicture*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginX : Proc(IInkPicture*, Int32, Win32cr::Foundation::HRESULT),
    get_MarginY : Proc(IInkPicture*, Int32*, Win32cr::Foundation::HRESULT),
    put_MarginY : Proc(IInkPicture*, Int32, Win32cr::Foundation::HRESULT),
    get_Tablet : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportHighContrastInk : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_SupportHighContrastInk : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    get_SupportHighContrastSelectionUI : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_SupportHighContrastSelectionUI : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    hit_test_selection : Proc(IInkPicture*, Int32, Int32, Win32cr::UI::TabletPC::SelectionHitResult*, Win32cr::Foundation::HRESULT),
    set_gesture_status : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16, Win32cr::Foundation::HRESULT),
    get_gesture_status : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16*, Win32cr::Foundation::HRESULT),
    get_window_input_rectangle : Proc(IInkPicture*, Void**, Win32cr::Foundation::HRESULT),
    set_window_input_rectangle : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    set_all_tablets_mode : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    set_single_tablet_integrated_mode : Proc(IInkPicture*, Void*, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16*, Win32cr::Foundation::HRESULT),
    set_event_interest : Proc(IInkPicture*, Win32cr::UI::TabletPC::InkCollectorEventInterest, Int16, Win32cr::Foundation::HRESULT),
    get_InkEnabled : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_InkEnabled : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IInkPicture*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IInkPicture*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e85662e0-379a-40d7-9b5c-757d233f9923")]
  record IInkPicture, lpVtbl : IInkPictureVtbl* do
    GUID = LibC::GUID.new(0xe85662e0_u32, 0x379a_u16, 0x40d7_u16, StaticArray[0x9b_u8, 0x5c_u8, 0x75_u8, 0x7d_u8, 0x23_u8, 0x3f_u8, 0x99_u8, 0x23_u8])
    def query_interface(this : IInkPicture*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkPicture*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkPicture*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkPicture*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkPicture*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkPicture*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkPicture*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_hWnd(this : IInkPicture*, current_window : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hWnd.call(this, current_window)
    end
    def get_DefaultDrawingAttributes(this : IInkPicture*, current_attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultDrawingAttributes.call(this, current_attributes)
    end
    def putref_DefaultDrawingAttributes(this : IInkPicture*, new_attributes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DefaultDrawingAttributes.call(this, new_attributes)
    end
    def get_Renderer(this : IInkPicture*, current_ink_renderer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Renderer.call(this, current_ink_renderer)
    end
    def putref_Renderer(this : IInkPicture*, new_ink_renderer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Renderer.call(this, new_ink_renderer)
    end
    def get_Ink(this : IInkPicture*, ink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ink)
    end
    def putref_Ink(this : IInkPicture*, new_ink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Ink.call(this, new_ink)
    end
    def get_AutoRedraw(this : IInkPicture*, auto_redraw : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoRedraw.call(this, auto_redraw)
    end
    def put_AutoRedraw(this : IInkPicture*, auto_redraw : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoRedraw.call(this, auto_redraw)
    end
    def get_CollectingInk(this : IInkPicture*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectingInk.call(this, collecting)
    end
    def get_CollectionMode(this : IInkPicture*, mode : Win32cr::UI::TabletPC::InkCollectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CollectionMode.call(this, mode)
    end
    def put_CollectionMode(this : IInkPicture*, mode : Win32cr::UI::TabletPC::InkCollectionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CollectionMode.call(this, mode)
    end
    def get_DynamicRendering(this : IInkPicture*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DynamicRendering.call(this, enabled)
    end
    def put_DynamicRendering(this : IInkPicture*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DynamicRendering.call(this, enabled)
    end
    def get_DesiredPacketDescription(this : IInkPicture*, packet_guids : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredPacketDescription.call(this, packet_guids)
    end
    def put_DesiredPacketDescription(this : IInkPicture*, packet_guids : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredPacketDescription.call(this, packet_guids)
    end
    def get_MouseIcon(this : IInkPicture*, mouse_icon : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MouseIcon.call(this, mouse_icon)
    end
    def put_MouseIcon(this : IInkPicture*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MouseIcon.call(this, mouse_icon)
    end
    def putref_MouseIcon(this : IInkPicture*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_MouseIcon.call(this, mouse_icon)
    end
    def get_MousePointer(this : IInkPicture*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MousePointer.call(this, mouse_pointer)
    end
    def put_MousePointer(this : IInkPicture*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MousePointer.call(this, mouse_pointer)
    end
    def get_EditingMode(this : IInkPicture*, editing_mode : Win32cr::UI::TabletPC::InkOverlayEditingMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EditingMode.call(this, editing_mode)
    end
    def put_EditingMode(this : IInkPicture*, editing_mode : Win32cr::UI::TabletPC::InkOverlayEditingMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EditingMode.call(this, editing_mode)
    end
    def get_Selection(this : IInkPicture*, selection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Selection.call(this, selection)
    end
    def put_Selection(this : IInkPicture*, selection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Selection.call(this, selection)
    end
    def get_EraserMode(this : IInkPicture*, eraser_mode : Win32cr::UI::TabletPC::InkOverlayEraserMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EraserMode.call(this, eraser_mode)
    end
    def put_EraserMode(this : IInkPicture*, eraser_mode : Win32cr::UI::TabletPC::InkOverlayEraserMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EraserMode.call(this, eraser_mode)
    end
    def get_EraserWidth(this : IInkPicture*, eraser_width : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EraserWidth.call(this, eraser_width)
    end
    def put_EraserWidth(this : IInkPicture*, newEraserWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EraserWidth.call(this, newEraserWidth)
    end
    def putref_Picture(this : IInkPicture*, pPicture : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Picture.call(this, pPicture)
    end
    def put_Picture(this : IInkPicture*, pPicture : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Picture.call(this, pPicture)
    end
    def get_Picture(this : IInkPicture*, ppPicture : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Picture.call(this, ppPicture)
    end
    def put_SizeMode(this : IInkPicture*, smNewSizeMode : Win32cr::UI::TabletPC::InkPictureSizeMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SizeMode.call(this, smNewSizeMode)
    end
    def get_SizeMode(this : IInkPicture*, smSizeMode : Win32cr::UI::TabletPC::InkPictureSizeMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeMode.call(this, smSizeMode)
    end
    def put_BackColor(this : IInkPicture*, newColor : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColor.call(this, newColor)
    end
    def get_BackColor(this : IInkPicture*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColor.call(this, pColor)
    end
    def get_Cursors(this : IInkPicture*, cursors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cursors.call(this, cursors)
    end
    def get_MarginX(this : IInkPicture*, margin_x : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginX.call(this, margin_x)
    end
    def put_MarginX(this : IInkPicture*, margin_x : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginX.call(this, margin_x)
    end
    def get_MarginY(this : IInkPicture*, margin_y : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MarginY.call(this, margin_y)
    end
    def put_MarginY(this : IInkPicture*, margin_y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MarginY.call(this, margin_y)
    end
    def get_Tablet(this : IInkPicture*, single_tablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Tablet.call(this, single_tablet)
    end
    def get_SupportHighContrastInk(this : IInkPicture*, support : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportHighContrastInk.call(this, support)
    end
    def put_SupportHighContrastInk(this : IInkPicture*, support : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportHighContrastInk.call(this, support)
    end
    def get_SupportHighContrastSelectionUI(this : IInkPicture*, support : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportHighContrastSelectionUI.call(this, support)
    end
    def put_SupportHighContrastSelectionUI(this : IInkPicture*, support : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportHighContrastSelectionUI.call(this, support)
    end
    def hit_test_selection(this : IInkPicture*, x : Int32, y : Int32, sel_area : Win32cr::UI::TabletPC::SelectionHitResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test_selection.call(this, x, y, sel_area)
    end
    def set_gesture_status(this : IInkPicture*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gesture_status.call(this, gesture, listen)
    end
    def get_gesture_status(this : IInkPicture*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listening : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gesture_status.call(this, gesture, listening)
    end
    def get_window_input_rectangle(this : IInkPicture*, window_input_rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_window_input_rectangle(this : IInkPicture*, window_input_rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_window_input_rectangle.call(this, window_input_rectangle)
    end
    def set_all_tablets_mode(this : IInkPicture*, use_mouse_for_input : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_tablets_mode.call(this, use_mouse_for_input)
    end
    def set_single_tablet_integrated_mode(this : IInkPicture*, tablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_single_tablet_integrated_mode.call(this, tablet)
    end
    def get_event_interest(this : IInkPicture*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_interest.call(this, event_id, listen)
    end
    def set_event_interest(this : IInkPicture*, event_id : Win32cr::UI::TabletPC::InkCollectorEventInterest, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_interest.call(this, event_id, listen)
    end
    def get_InkEnabled(this : IInkPicture*, collecting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InkEnabled.call(this, collecting)
    end
    def put_InkEnabled(this : IInkPicture*, collecting : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InkEnabled.call(this, collecting)
    end
    def get_Enabled(this : IInkPicture*, pbool : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pbool)
    end
    def put_Enabled(this : IInkPicture*, vbool : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, vbool)
    end

  end

  @[Extern]
  record IInkPictureEvents_Vtbl,
    query_interface : Proc(IInkPictureEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkPictureEvents_*, UInt32),
    release : Proc(IInkPictureEvents_*, UInt32),
    get_type_info_count : Proc(IInkPictureEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkPictureEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkPictureEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkPictureEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("60ff4fee-22ff-4484-acc1-d308d9cd7ea3")]
  record IInkPictureEvents_, lpVtbl : IInkPictureEvents_Vtbl* do
    GUID = LibC::GUID.new(0x60ff4fee_u32, 0x22ff_u16, 0x4484_u16, StaticArray[0xac_u8, 0xc1_u8, 0xd3_u8, 0x8_u8, 0xd9_u8, 0xcd_u8, 0x7e_u8, 0xa3_u8])
    def query_interface(this : IInkPictureEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkPictureEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkPictureEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkPictureEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkPictureEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkPictureEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkPictureEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkRecognizerVtbl,
    query_interface : Proc(IInkRecognizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizer*, UInt32),
    release : Proc(IInkRecognizer*, UInt32),
    get_type_info_count : Proc(IInkRecognizer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IInkRecognizer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Vendor : Proc(IInkRecognizer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Capabilities : Proc(IInkRecognizer*, Win32cr::UI::TabletPC::InkRecognizerCapabilities*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IInkRecognizer*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SupportedProperties : Proc(IInkRecognizer*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PreferredPacketDescription : Proc(IInkRecognizer*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    create_recognizer_context : Proc(IInkRecognizer*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("782bf7cf-034b-4396-8a32-3a1833cf6b56")]
  record IInkRecognizer, lpVtbl : IInkRecognizerVtbl* do
    GUID = LibC::GUID.new(0x782bf7cf_u32, 0x34b_u16, 0x4396_u16, StaticArray[0x8a_u8, 0x32_u8, 0x3a_u8, 0x18_u8, 0x33_u8, 0xcf_u8, 0x6b_u8, 0x56_u8])
    def query_interface(this : IInkRecognizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IInkRecognizer*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Vendor(this : IInkRecognizer*, vendor : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Vendor.call(this, vendor)
    end
    def get_Capabilities(this : IInkRecognizer*, capabilities_flags : Win32cr::UI::TabletPC::InkRecognizerCapabilities*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Capabilities.call(this, capabilities_flags)
    end
    def get_Languages(this : IInkRecognizer*, languages : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, languages)
    end
    def get_SupportedProperties(this : IInkRecognizer*, supported_properties : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedProperties.call(this, supported_properties)
    end
    def get_PreferredPacketDescription(this : IInkRecognizer*, preferred_packet_description : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredPacketDescription.call(this, preferred_packet_description)
    end
    def create_recognizer_context(this : IInkRecognizer*, context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_recognizer_context.call(this, context)
    end

  end

  @[Extern]
  record IInkRecognizer2Vtbl,
    query_interface : Proc(IInkRecognizer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizer2*, UInt32),
    release : Proc(IInkRecognizer2*, UInt32),
    get_type_info_count : Proc(IInkRecognizer2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizer2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizer2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizer2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IInkRecognizer2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UnicodeRanges : Proc(IInkRecognizer2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6110118a-3a75-4ad6-b2aa-04b2b72bbe65")]
  record IInkRecognizer2, lpVtbl : IInkRecognizer2Vtbl* do
    GUID = LibC::GUID.new(0x6110118a_u32, 0x3a75_u16, 0x4ad6_u16, StaticArray[0xb2_u8, 0xaa_u8, 0x4_u8, 0xb2_u8, 0xb7_u8, 0x2b_u8, 0xbe_u8, 0x65_u8])
    def query_interface(this : IInkRecognizer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizer2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizer2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizer2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizer2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IInkRecognizer2*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_UnicodeRanges(this : IInkRecognizer2*, unicode_ranges : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UnicodeRanges.call(this, unicode_ranges)
    end

  end

  @[Extern]
  record IInkRecognizersVtbl,
    query_interface : Proc(IInkRecognizers*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizers*, UInt32),
    release : Proc(IInkRecognizers*, UInt32),
    get_type_info_count : Proc(IInkRecognizers*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizers*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizers*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizers*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkRecognizers*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkRecognizers*, Void**, Win32cr::Foundation::HRESULT),
    get_default_recognizer : Proc(IInkRecognizers*, Int32, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkRecognizers*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd")]
  record IInkRecognizers, lpVtbl : IInkRecognizersVtbl* do
    GUID = LibC::GUID.new(0x9ccc4f12_u32, 0xb0b7_u16, 0x4a8b_u16, StaticArray[0xbf_u8, 0x58_u8, 0x4a_u8, 0xec_u8, 0xa4_u8, 0xe8_u8, 0xce_u8, 0xfd_u8])
    def query_interface(this : IInkRecognizers*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizers*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizers*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizers*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizers*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizers*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizers*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkRecognizers*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkRecognizers*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def get_default_recognizer(this : IInkRecognizers*, lcid : Int32, default_recognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_recognizer.call(this, lcid, default_recognizer)
    end
    def item(this : IInkRecognizers*, index : Int32, ink_recognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ink_recognizer)
    end

  end

  @[Extern]
  record IInkRecognitionEvents_Vtbl,
    query_interface : Proc(IInkRecognitionEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognitionEvents_*, UInt32),
    release : Proc(IInkRecognitionEvents_*, UInt32),
    get_type_info_count : Proc(IInkRecognitionEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognitionEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognitionEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognitionEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17bce92f-2e21-47fd-9d33-3c6afbfd8c59")]
  record IInkRecognitionEvents_, lpVtbl : IInkRecognitionEvents_Vtbl* do
    GUID = LibC::GUID.new(0x17bce92f_u32, 0x2e21_u16, 0x47fd_u16, StaticArray[0x9d_u8, 0x33_u8, 0x3c_u8, 0x6a_u8, 0xfb_u8, 0xfd_u8, 0x8c_u8, 0x59_u8])
    def query_interface(this : IInkRecognitionEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognitionEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognitionEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognitionEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognitionEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognitionEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognitionEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkRecognizerContextVtbl,
    query_interface : Proc(IInkRecognizerContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizerContext*, UInt32),
    release : Proc(IInkRecognizerContext*, UInt32),
    get_type_info_count : Proc(IInkRecognizerContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizerContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizerContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizerContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkRecognizerContext*, Void**, Win32cr::Foundation::HRESULT),
    putref_Strokes : Proc(IInkRecognizerContext*, Void*, Win32cr::Foundation::HRESULT),
    get_CharacterAutoCompletionMode : Proc(IInkRecognizerContext*, Win32cr::UI::TabletPC::InkRecognizerCharacterAutoCompletionMode*, Win32cr::Foundation::HRESULT),
    put_CharacterAutoCompletionMode : Proc(IInkRecognizerContext*, Win32cr::UI::TabletPC::InkRecognizerCharacterAutoCompletionMode, Win32cr::Foundation::HRESULT),
    get_Factoid : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Factoid : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Guide : Proc(IInkRecognizerContext*, Void**, Win32cr::Foundation::HRESULT),
    putref_Guide : Proc(IInkRecognizerContext*, Void*, Win32cr::Foundation::HRESULT),
    get_PrefixText : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PrefixText : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SuffixText : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SuffixText : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RecognitionFlags : Proc(IInkRecognizerContext*, Win32cr::UI::TabletPC::InkRecognitionModes*, Win32cr::Foundation::HRESULT),
    put_RecognitionFlags : Proc(IInkRecognizerContext*, Win32cr::UI::TabletPC::InkRecognitionModes, Win32cr::Foundation::HRESULT),
    get_WordList : Proc(IInkRecognizerContext*, Void**, Win32cr::Foundation::HRESULT),
    putref_WordList : Proc(IInkRecognizerContext*, Void*, Win32cr::Foundation::HRESULT),
    get_Recognizer : Proc(IInkRecognizerContext*, Void**, Win32cr::Foundation::HRESULT),
    recognize : Proc(IInkRecognizerContext*, Win32cr::UI::TabletPC::InkRecognitionStatus*, Void**, Win32cr::Foundation::HRESULT),
    stop_background_recognition : Proc(IInkRecognizerContext*, Win32cr::Foundation::HRESULT),
    end_ink_input : Proc(IInkRecognizerContext*, Win32cr::Foundation::HRESULT),
    background_recognize : Proc(IInkRecognizerContext*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    background_recognize_with_alternates : Proc(IInkRecognizerContext*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clone : Proc(IInkRecognizerContext*, Void**, Win32cr::Foundation::HRESULT),
    is_string_supported : Proc(IInkRecognizerContext*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c68f52f9-32a3-4625-906c-44fc23b40958")]
  record IInkRecognizerContext, lpVtbl : IInkRecognizerContextVtbl* do
    GUID = LibC::GUID.new(0xc68f52f9_u32, 0x32a3_u16, 0x4625_u16, StaticArray[0x90_u8, 0x6c_u8, 0x44_u8, 0xfc_u8, 0x23_u8, 0xb4_u8, 0x9_u8, 0x58_u8])
    def query_interface(this : IInkRecognizerContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizerContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizerContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizerContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizerContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizerContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizerContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Strokes(this : IInkRecognizerContext*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def putref_Strokes(this : IInkRecognizerContext*, strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Strokes.call(this, strokes)
    end
    def get_CharacterAutoCompletionMode(this : IInkRecognizerContext*, mode : Win32cr::UI::TabletPC::InkRecognizerCharacterAutoCompletionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CharacterAutoCompletionMode.call(this, mode)
    end
    def put_CharacterAutoCompletionMode(this : IInkRecognizerContext*, mode : Win32cr::UI::TabletPC::InkRecognizerCharacterAutoCompletionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CharacterAutoCompletionMode.call(this, mode)
    end
    def get_Factoid(this : IInkRecognizerContext*, factoid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Factoid.call(this, factoid)
    end
    def put_Factoid(this : IInkRecognizerContext*, factoid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Factoid.call(this, factoid)
    end
    def get_Guide(this : IInkRecognizerContext*, recognizer_guide : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guide.call(this, recognizer_guide)
    end
    def putref_Guide(this : IInkRecognizerContext*, recognizer_guide : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Guide.call(this, recognizer_guide)
    end
    def get_PrefixText(this : IInkRecognizerContext*, prefix : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrefixText.call(this, prefix)
    end
    def put_PrefixText(this : IInkRecognizerContext*, prefix : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrefixText.call(this, prefix)
    end
    def get_SuffixText(this : IInkRecognizerContext*, suffix : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SuffixText.call(this, suffix)
    end
    def put_SuffixText(this : IInkRecognizerContext*, suffix : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SuffixText.call(this, suffix)
    end
    def get_RecognitionFlags(this : IInkRecognizerContext*, modes : Win32cr::UI::TabletPC::InkRecognitionModes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecognitionFlags.call(this, modes)
    end
    def put_RecognitionFlags(this : IInkRecognizerContext*, modes : Win32cr::UI::TabletPC::InkRecognitionModes) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RecognitionFlags.call(this, modes)
    end
    def get_WordList(this : IInkRecognizerContext*, word_list : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WordList.call(this, word_list)
    end
    def putref_WordList(this : IInkRecognizerContext*, word_list : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_WordList.call(this, word_list)
    end
    def get_Recognizer(this : IInkRecognizerContext*, recognizer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recognizer.call(this, recognizer)
    end
    def recognize(this : IInkRecognizerContext*, recognition_status : Win32cr::UI::TabletPC::InkRecognitionStatus*, recognition_result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recognize.call(this, recognition_status, recognition_result)
    end
    def stop_background_recognition(this : IInkRecognizerContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_background_recognition.call(this)
    end
    def end_ink_input(this : IInkRecognizerContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ink_input.call(this)
    end
    def background_recognize(this : IInkRecognizerContext*, custom_data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_recognize.call(this, custom_data)
    end
    def background_recognize_with_alternates(this : IInkRecognizerContext*, custom_data : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.background_recognize_with_alternates.call(this, custom_data)
    end
    def clone(this : IInkRecognizerContext*, reco_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, reco_context)
    end
    def is_string_supported(this : IInkRecognizerContext*, string : Win32cr::Foundation::BSTR, supported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_string_supported.call(this, string, supported)
    end

  end

  @[Extern]
  record IInkRecognizerContext2Vtbl,
    query_interface : Proc(IInkRecognizerContext2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizerContext2*, UInt32),
    release : Proc(IInkRecognizerContext2*, UInt32),
    get_type_info_count : Proc(IInkRecognizerContext2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizerContext2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizerContext2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizerContext2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EnabledUnicodeRanges : Proc(IInkRecognizerContext2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_EnabledUnicodeRanges : Proc(IInkRecognizerContext2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d6f0e32f-73d8-408e-8e9f-5fea592c363f")]
  record IInkRecognizerContext2, lpVtbl : IInkRecognizerContext2Vtbl* do
    GUID = LibC::GUID.new(0xd6f0e32f_u32, 0x73d8_u16, 0x408e_u16, StaticArray[0x8e_u8, 0x9f_u8, 0x5f_u8, 0xea_u8, 0x59_u8, 0x2c_u8, 0x36_u8, 0x3f_u8])
    def query_interface(this : IInkRecognizerContext2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizerContext2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizerContext2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizerContext2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizerContext2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizerContext2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizerContext2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EnabledUnicodeRanges(this : IInkRecognizerContext2*, unicode_ranges : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnabledUnicodeRanges.call(this, unicode_ranges)
    end
    def put_EnabledUnicodeRanges(this : IInkRecognizerContext2*, unicode_ranges : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnabledUnicodeRanges.call(this, unicode_ranges)
    end

  end

  @[Extern]
  record IInkRecognitionResultVtbl,
    query_interface : Proc(IInkRecognitionResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognitionResult*, UInt32),
    release : Proc(IInkRecognitionResult*, UInt32),
    get_type_info_count : Proc(IInkRecognitionResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognitionResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognitionResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognitionResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_TopString : Proc(IInkRecognitionResult*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TopAlternate : Proc(IInkRecognitionResult*, Void**, Win32cr::Foundation::HRESULT),
    get_TopConfidence : Proc(IInkRecognitionResult*, Win32cr::UI::TabletPC::InkRecognitionConfidence*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkRecognitionResult*, Void**, Win32cr::Foundation::HRESULT),
    alternates_from_selection : Proc(IInkRecognitionResult*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    modify_top_alternate : Proc(IInkRecognitionResult*, Void*, Win32cr::Foundation::HRESULT),
    set_result_on_strokes : Proc(IInkRecognitionResult*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3bc129a8-86cd-45ad-bde8-e0d32d61c16d")]
  record IInkRecognitionResult, lpVtbl : IInkRecognitionResultVtbl* do
    GUID = LibC::GUID.new(0x3bc129a8_u32, 0x86cd_u16, 0x45ad_u16, StaticArray[0xbd_u8, 0xe8_u8, 0xe0_u8, 0xd3_u8, 0x2d_u8, 0x61_u8, 0xc1_u8, 0x6d_u8])
    def query_interface(this : IInkRecognitionResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognitionResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognitionResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognitionResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognitionResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognitionResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognitionResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_TopString(this : IInkRecognitionResult*, top_string : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TopString.call(this, top_string)
    end
    def get_TopAlternate(this : IInkRecognitionResult*, top_alternate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TopAlternate.call(this, top_alternate)
    end
    def get_TopConfidence(this : IInkRecognitionResult*, top_confidence : Win32cr::UI::TabletPC::InkRecognitionConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TopConfidence.call(this, top_confidence)
    end
    def get_Strokes(this : IInkRecognitionResult*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def alternates_from_selection(this : IInkRecognitionResult*, selectionStart : Int32, selectionLength : Int32, maximumAlternates : Int32, alternates_from_selection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates_from_selection.call(this, selectionStart, selectionLength, maximumAlternates, alternates_from_selection)
    end
    def modify_top_alternate(this : IInkRecognitionResult*, alternate : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_top_alternate.call(this, alternate)
    end
    def set_result_on_strokes(this : IInkRecognitionResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_result_on_strokes.call(this)
    end

  end

  @[Extern]
  record IInkRecognitionAlternateVtbl,
    query_interface : Proc(IInkRecognitionAlternate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognitionAlternate*, UInt32),
    release : Proc(IInkRecognitionAlternate*, UInt32),
    get_type_info_count : Proc(IInkRecognitionAlternate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognitionAlternate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognitionAlternate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognitionAlternate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_String : Proc(IInkRecognitionAlternate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Confidence : Proc(IInkRecognitionAlternate*, Win32cr::UI::TabletPC::InkRecognitionConfidence*, Win32cr::Foundation::HRESULT),
    get_Baseline : Proc(IInkRecognitionAlternate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Midline : Proc(IInkRecognitionAlternate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Ascender : Proc(IInkRecognitionAlternate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Descender : Proc(IInkRecognitionAlternate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LineNumber : Proc(IInkRecognitionAlternate*, Int32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkRecognitionAlternate*, Void**, Win32cr::Foundation::HRESULT),
    get_LineAlternates : Proc(IInkRecognitionAlternate*, Void**, Win32cr::Foundation::HRESULT),
    get_ConfidenceAlternates : Proc(IInkRecognitionAlternate*, Void**, Win32cr::Foundation::HRESULT),
    get_strokes_from_stroke_ranges : Proc(IInkRecognitionAlternate*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_strokes_from_text_range : Proc(IInkRecognitionAlternate*, Int32*, Int32*, Void**, Win32cr::Foundation::HRESULT),
    get_text_range_from_strokes : Proc(IInkRecognitionAlternate*, Void*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    alternates_with_constant_property_values : Proc(IInkRecognitionAlternate*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_property_value : Proc(IInkRecognitionAlternate*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b7e660ad-77e4-429b-adda-873780d1fc4a")]
  record IInkRecognitionAlternate, lpVtbl : IInkRecognitionAlternateVtbl* do
    GUID = LibC::GUID.new(0xb7e660ad_u32, 0x77e4_u16, 0x429b_u16, StaticArray[0xad_u8, 0xda_u8, 0x87_u8, 0x37_u8, 0x80_u8, 0xd1_u8, 0xfc_u8, 0x4a_u8])
    def query_interface(this : IInkRecognitionAlternate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognitionAlternate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognitionAlternate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognitionAlternate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognitionAlternate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognitionAlternate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognitionAlternate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_String(this : IInkRecognitionAlternate*, reco_string : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_String.call(this, reco_string)
    end
    def get_Confidence(this : IInkRecognitionAlternate*, confidence : Win32cr::UI::TabletPC::InkRecognitionConfidence*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Confidence.call(this, confidence)
    end
    def get_Baseline(this : IInkRecognitionAlternate*, baseline : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Baseline.call(this, baseline)
    end
    def get_Midline(this : IInkRecognitionAlternate*, midline : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Midline.call(this, midline)
    end
    def get_Ascender(this : IInkRecognitionAlternate*, ascender : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ascender.call(this, ascender)
    end
    def get_Descender(this : IInkRecognitionAlternate*, descender : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Descender.call(this, descender)
    end
    def get_LineNumber(this : IInkRecognitionAlternate*, line_number : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineNumber.call(this, line_number)
    end
    def get_Strokes(this : IInkRecognitionAlternate*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def get_LineAlternates(this : IInkRecognitionAlternate*, line_alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineAlternates.call(this, line_alternates)
    end
    def get_ConfidenceAlternates(this : IInkRecognitionAlternate*, confidence_alternates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConfidenceAlternates.call(this, confidence_alternates)
    end
    def get_strokes_from_stroke_ranges(this : IInkRecognitionAlternate*, strokes : Void*, get_strokes_from_stroke_ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_strokes_from_stroke_ranges.call(this, strokes, get_strokes_from_stroke_ranges)
    end
    def get_strokes_from_text_range(this : IInkRecognitionAlternate*, selectionStart : Int32*, selectionLength : Int32*, get_strokes_from_text_range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_strokes_from_text_range.call(this, selectionStart, selectionLength, get_strokes_from_text_range)
    end
    def get_text_range_from_strokes(this : IInkRecognitionAlternate*, strokes : Void*, selectionStart : Int32*, selectionLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_range_from_strokes.call(this, strokes, selectionStart, selectionLength)
    end
    def alternates_with_constant_property_values(this : IInkRecognitionAlternate*, property_type : Win32cr::Foundation::BSTR, alternates_with_constant_property_values : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alternates_with_constant_property_values.call(this, property_type, alternates_with_constant_property_values)
    end
    def get_property_value(this : IInkRecognitionAlternate*, property_type : Win32cr::Foundation::BSTR, property_value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_value.call(this, property_type, property_value)
    end

  end

  @[Extern]
  record IInkRecognitionAlternatesVtbl,
    query_interface : Proc(IInkRecognitionAlternates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognitionAlternates*, UInt32),
    release : Proc(IInkRecognitionAlternates*, UInt32),
    get_type_info_count : Proc(IInkRecognitionAlternates*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognitionAlternates*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognitionAlternates*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognitionAlternates*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkRecognitionAlternates*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkRecognitionAlternates*, Void**, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkRecognitionAlternates*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkRecognitionAlternates*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("286a167f-9f19-4c61-9d53-4f07be622b84")]
  record IInkRecognitionAlternates, lpVtbl : IInkRecognitionAlternatesVtbl* do
    GUID = LibC::GUID.new(0x286a167f_u32, 0x9f19_u16, 0x4c61_u16, StaticArray[0x9d_u8, 0x53_u8, 0x4f_u8, 0x7_u8, 0xbe_u8, 0x62_u8, 0x2b_u8, 0x84_u8])
    def query_interface(this : IInkRecognitionAlternates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognitionAlternates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognitionAlternates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognitionAlternates*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognitionAlternates*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognitionAlternates*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognitionAlternates*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkRecognitionAlternates*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkRecognitionAlternates*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def get_Strokes(this : IInkRecognitionAlternates*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def item(this : IInkRecognitionAlternates*, index : Int32, ink_reco_alternate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ink_reco_alternate)
    end

  end

  @[Extern]
  record IInkRecognizerGuideVtbl,
    query_interface : Proc(IInkRecognizerGuide*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkRecognizerGuide*, UInt32),
    release : Proc(IInkRecognizerGuide*, UInt32),
    get_type_info_count : Proc(IInkRecognizerGuide*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkRecognizerGuide*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkRecognizerGuide*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkRecognizerGuide*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_WritingBox : Proc(IInkRecognizerGuide*, Void**, Win32cr::Foundation::HRESULT),
    put_WritingBox : Proc(IInkRecognizerGuide*, Void*, Win32cr::Foundation::HRESULT),
    get_DrawnBox : Proc(IInkRecognizerGuide*, Void**, Win32cr::Foundation::HRESULT),
    put_DrawnBox : Proc(IInkRecognizerGuide*, Void*, Win32cr::Foundation::HRESULT),
    get_Rows : Proc(IInkRecognizerGuide*, Int32*, Win32cr::Foundation::HRESULT),
    put_Rows : Proc(IInkRecognizerGuide*, Int32, Win32cr::Foundation::HRESULT),
    get_Columns : Proc(IInkRecognizerGuide*, Int32*, Win32cr::Foundation::HRESULT),
    put_Columns : Proc(IInkRecognizerGuide*, Int32, Win32cr::Foundation::HRESULT),
    get_Midline : Proc(IInkRecognizerGuide*, Int32*, Win32cr::Foundation::HRESULT),
    put_Midline : Proc(IInkRecognizerGuide*, Int32, Win32cr::Foundation::HRESULT),
    get_GuideData : Proc(IInkRecognizerGuide*, Win32cr::UI::TabletPC::InkRecoGuide*, Win32cr::Foundation::HRESULT),
    put_GuideData : Proc(IInkRecognizerGuide*, Win32cr::UI::TabletPC::InkRecoGuide, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d934be07-7b84-4208-9136-83c20994e905")]
  record IInkRecognizerGuide, lpVtbl : IInkRecognizerGuideVtbl* do
    GUID = LibC::GUID.new(0xd934be07_u32, 0x7b84_u16, 0x4208_u16, StaticArray[0x91_u8, 0x36_u8, 0x83_u8, 0xc2_u8, 0x9_u8, 0x94_u8, 0xe9_u8, 0x5_u8])
    def query_interface(this : IInkRecognizerGuide*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkRecognizerGuide*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkRecognizerGuide*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkRecognizerGuide*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkRecognizerGuide*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkRecognizerGuide*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkRecognizerGuide*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_WritingBox(this : IInkRecognizerGuide*, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WritingBox.call(this, rectangle)
    end
    def put_WritingBox(this : IInkRecognizerGuide*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WritingBox.call(this, rectangle)
    end
    def get_DrawnBox(this : IInkRecognizerGuide*, rectangle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DrawnBox.call(this, rectangle)
    end
    def put_DrawnBox(this : IInkRecognizerGuide*, rectangle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DrawnBox.call(this, rectangle)
    end
    def get_Rows(this : IInkRecognizerGuide*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rows.call(this, units)
    end
    def put_Rows(this : IInkRecognizerGuide*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Rows.call(this, units)
    end
    def get_Columns(this : IInkRecognizerGuide*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Columns.call(this, units)
    end
    def put_Columns(this : IInkRecognizerGuide*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Columns.call(this, units)
    end
    def get_Midline(this : IInkRecognizerGuide*, units : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Midline.call(this, units)
    end
    def put_Midline(this : IInkRecognizerGuide*, units : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Midline.call(this, units)
    end
    def get_GuideData(this : IInkRecognizerGuide*, pRecoGuide : Win32cr::UI::TabletPC::InkRecoGuide*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GuideData.call(this, pRecoGuide)
    end
    def put_GuideData(this : IInkRecognizerGuide*, recoGuide : Win32cr::UI::TabletPC::InkRecoGuide) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GuideData.call(this, recoGuide)
    end

  end

  @[Extern]
  record IInkWordListVtbl,
    query_interface : Proc(IInkWordList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkWordList*, UInt32),
    release : Proc(IInkWordList*, UInt32),
    get_type_info_count : Proc(IInkWordList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkWordList*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkWordList*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkWordList*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add_word : Proc(IInkWordList*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_word : Proc(IInkWordList*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    merge : Proc(IInkWordList*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("76ba3491-cb2f-406b-9961-0e0c4cdaaef2")]
  record IInkWordList, lpVtbl : IInkWordListVtbl* do
    GUID = LibC::GUID.new(0x76ba3491_u32, 0xcb2f_u16, 0x406b_u16, StaticArray[0x99_u8, 0x61_u8, 0xe_u8, 0xc_u8, 0x4c_u8, 0xda_u8, 0xae_u8, 0xf2_u8])
    def query_interface(this : IInkWordList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkWordList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkWordList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkWordList*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkWordList*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkWordList*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkWordList*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add_word(this : IInkWordList*, new_word : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_word.call(this, new_word)
    end
    def remove_word(this : IInkWordList*, remove_word : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_word.call(this, remove_word)
    end
    def merge(this : IInkWordList*, merge_word_list : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge.call(this, merge_word_list)
    end

  end

  @[Extern]
  record IInkWordList2Vtbl,
    query_interface : Proc(IInkWordList2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkWordList2*, UInt32),
    release : Proc(IInkWordList2*, UInt32),
    get_type_info_count : Proc(IInkWordList2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkWordList2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkWordList2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkWordList2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add_words : Proc(IInkWordList2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("14542586-11bf-4f5f-b6e7-49d0744aab6e")]
  record IInkWordList2, lpVtbl : IInkWordList2Vtbl* do
    GUID = LibC::GUID.new(0x14542586_u32, 0x11bf_u16, 0x4f5f_u16, StaticArray[0xb6_u8, 0xe7_u8, 0x49_u8, 0xd0_u8, 0x74_u8, 0x4a_u8, 0xab_u8, 0x6e_u8])
    def query_interface(this : IInkWordList2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkWordList2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkWordList2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkWordList2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkWordList2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkWordList2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkWordList2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add_words(this : IInkWordList2*, new_words : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_words.call(this, new_words)
    end

  end

  @[Extern]
  record IInkVtbl,
    query_interface : Proc(IInk*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInk*, UInt32),
    release : Proc(IInk*, UInt32),
    get_type_info_count : Proc(IInk*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInk*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInk*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInk*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("03f8e511-43a1-11d3-8bb6-0080c7d6bad5")]
  record IInk, lpVtbl : IInkVtbl* do
    GUID = LibC::GUID.new(0x3f8e511_u32, 0x43a1_u16, 0x11d3_u16, StaticArray[0x8b_u8, 0xb6_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd6_u8, 0xba_u8, 0xd5_u8])
    def query_interface(this : IInk*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInk*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInk*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInk*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInk*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInk*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInk*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkLineInfoVtbl,
    query_interface : Proc(IInkLineInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkLineInfo*, UInt32),
    release : Proc(IInkLineInfo*, UInt32),
    set_format : Proc(IInkLineInfo*, Win32cr::UI::TabletPC::INKMETRIC*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IInkLineInfo*, Win32cr::UI::TabletPC::INKMETRIC*, Win32cr::Foundation::HRESULT),
    get_ink_extent : Proc(IInkLineInfo*, Win32cr::UI::TabletPC::INKMETRIC*, UInt32*, Win32cr::Foundation::HRESULT),
    get_candidate : Proc(IInkLineInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    set_candidate : Proc(IInkLineInfo*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    recognize : Proc(IInkLineInfo*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9c1c5ad6-f22f-4de4-b453-a2cc482e7c33")]
  record IInkLineInfo, lpVtbl : IInkLineInfoVtbl* do
    GUID = LibC::GUID.new(0x9c1c5ad6_u32, 0xf22f_u16, 0x4de4_u16, StaticArray[0xb4_u8, 0x53_u8, 0xa2_u8, 0xcc_u8, 0x48_u8, 0x2e_u8, 0x7c_u8, 0x33_u8])
    def query_interface(this : IInkLineInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkLineInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkLineInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_format(this : IInkLineInfo*, pim : Win32cr::UI::TabletPC::INKMETRIC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_format.call(this, pim)
    end
    def get_format(this : IInkLineInfo*, pim : Win32cr::UI::TabletPC::INKMETRIC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, pim)
    end
    def get_ink_extent(this : IInkLineInfo*, pim : Win32cr::UI::TabletPC::INKMETRIC*, pnWidth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ink_extent.call(this, pim, pnWidth)
    end
    def get_candidate(this : IInkLineInfo*, nCandidateNum : UInt32, pwcRecogWord : Win32cr::Foundation::PWSTR, pcwcRecogWord : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate.call(this, nCandidateNum, pwcRecogWord, pcwcRecogWord, dwFlags)
    end
    def set_candidate(this : IInkLineInfo*, nCandidateNum : UInt32, strRecogWord : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_candidate.call(this, nCandidateNum, strRecogWord)
    end
    def recognize(this : IInkLineInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recognize.call(this)
    end

  end

  @[Extern]
  record ISketchInkVtbl,
    query_interface : Proc(ISketchInk*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISketchInk*, UInt32),
    release : Proc(ISketchInk*, UInt32),
    get_type_info_count : Proc(ISketchInk*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISketchInk*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISketchInk*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISketchInk*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b4563688-98eb-4646-b279-44da14d45748")]
  record ISketchInk, lpVtbl : ISketchInkVtbl* do
    GUID = LibC::GUID.new(0xb4563688_u32, 0x98eb_u16, 0x4646_u16, StaticArray[0xb2_u8, 0x79_u8, 0x44_u8, 0xda_u8, 0x14_u8, 0xd4_u8, 0x57_u8, 0x48_u8])
    def query_interface(this : ISketchInk*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISketchInk*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISketchInk*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISketchInk*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISketchInk*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISketchInk*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISketchInk*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInkDividerVtbl,
    query_interface : Proc(IInkDivider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDivider*, UInt32),
    release : Proc(IInkDivider*, UInt32),
    get_type_info_count : Proc(IInkDivider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDivider*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDivider*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDivider*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkDivider*, Void**, Win32cr::Foundation::HRESULT),
    putref_Strokes : Proc(IInkDivider*, Void*, Win32cr::Foundation::HRESULT),
    get_RecognizerContext : Proc(IInkDivider*, Void**, Win32cr::Foundation::HRESULT),
    putref_RecognizerContext : Proc(IInkDivider*, Void*, Win32cr::Foundation::HRESULT),
    get_LineHeight : Proc(IInkDivider*, Int32*, Win32cr::Foundation::HRESULT),
    put_LineHeight : Proc(IInkDivider*, Int32, Win32cr::Foundation::HRESULT),
    divide : Proc(IInkDivider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5de00405-f9a4-4651-b0c5-c317defd58b9")]
  record IInkDivider, lpVtbl : IInkDividerVtbl* do
    GUID = LibC::GUID.new(0x5de00405_u32, 0xf9a4_u16, 0x4651_u16, StaticArray[0xb0_u8, 0xc5_u8, 0xc3_u8, 0x17_u8, 0xde_u8, 0xfd_u8, 0x58_u8, 0xb9_u8])
    def query_interface(this : IInkDivider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDivider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDivider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDivider*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDivider*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDivider*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDivider*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Strokes(this : IInkDivider*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def putref_Strokes(this : IInkDivider*, strokes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Strokes.call(this, strokes)
    end
    def get_RecognizerContext(this : IInkDivider*, recognizer_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecognizerContext.call(this, recognizer_context)
    end
    def putref_RecognizerContext(this : IInkDivider*, recognizer_context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_RecognizerContext.call(this, recognizer_context)
    end
    def get_LineHeight(this : IInkDivider*, line_height : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineHeight.call(this, line_height)
    end
    def put_LineHeight(this : IInkDivider*, line_height : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LineHeight.call(this, line_height)
    end
    def divide(this : IInkDivider*, ink_division_result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.divide.call(this, ink_division_result)
    end

  end

  @[Extern]
  record IInkDivisionResultVtbl,
    query_interface : Proc(IInkDivisionResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDivisionResult*, UInt32),
    release : Proc(IInkDivisionResult*, UInt32),
    get_type_info_count : Proc(IInkDivisionResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDivisionResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDivisionResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDivisionResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkDivisionResult*, Void**, Win32cr::Foundation::HRESULT),
    result_by_type : Proc(IInkDivisionResult*, Win32cr::UI::TabletPC::InkDivisionType, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2dbec0a7-74c7-4b38-81eb-aa8ef0c24900")]
  record IInkDivisionResult, lpVtbl : IInkDivisionResultVtbl* do
    GUID = LibC::GUID.new(0x2dbec0a7_u32, 0x74c7_u16, 0x4b38_u16, StaticArray[0x81_u8, 0xeb_u8, 0xaa_u8, 0x8e_u8, 0xf0_u8, 0xc2_u8, 0x49_u8, 0x0_u8])
    def query_interface(this : IInkDivisionResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDivisionResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDivisionResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDivisionResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDivisionResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDivisionResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDivisionResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Strokes(this : IInkDivisionResult*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def result_by_type(this : IInkDivisionResult*, divisionType : Win32cr::UI::TabletPC::InkDivisionType, ink_division_units : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.result_by_type.call(this, divisionType, ink_division_units)
    end

  end

  @[Extern]
  record IInkDivisionUnitVtbl,
    query_interface : Proc(IInkDivisionUnit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDivisionUnit*, UInt32),
    release : Proc(IInkDivisionUnit*, UInt32),
    get_type_info_count : Proc(IInkDivisionUnit*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDivisionUnit*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDivisionUnit*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDivisionUnit*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Strokes : Proc(IInkDivisionUnit*, Void**, Win32cr::Foundation::HRESULT),
    get_DivisionType : Proc(IInkDivisionUnit*, Win32cr::UI::TabletPC::InkDivisionType*, Win32cr::Foundation::HRESULT),
    get_RecognizedString : Proc(IInkDivisionUnit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RotationTransform : Proc(IInkDivisionUnit*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85aee342-48b0-4244-9dd5-1ed435410fab")]
  record IInkDivisionUnit, lpVtbl : IInkDivisionUnitVtbl* do
    GUID = LibC::GUID.new(0x85aee342_u32, 0x48b0_u16, 0x4244_u16, StaticArray[0x9d_u8, 0xd5_u8, 0x1e_u8, 0xd4_u8, 0x35_u8, 0x41_u8, 0xf_u8, 0xab_u8])
    def query_interface(this : IInkDivisionUnit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDivisionUnit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDivisionUnit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDivisionUnit*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDivisionUnit*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDivisionUnit*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDivisionUnit*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Strokes(this : IInkDivisionUnit*, strokes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Strokes.call(this, strokes)
    end
    def get_DivisionType(this : IInkDivisionUnit*, divisionType : Win32cr::UI::TabletPC::InkDivisionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DivisionType.call(this, divisionType)
    end
    def get_RecognizedString(this : IInkDivisionUnit*, reco_string : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecognizedString.call(this, reco_string)
    end
    def get_RotationTransform(this : IInkDivisionUnit*, rotation_transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RotationTransform.call(this, rotation_transform)
    end

  end

  @[Extern]
  record IInkDivisionUnitsVtbl,
    query_interface : Proc(IInkDivisionUnits*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkDivisionUnits*, UInt32),
    release : Proc(IInkDivisionUnits*, UInt32),
    get_type_info_count : Proc(IInkDivisionUnits*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkDivisionUnits*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkDivisionUnits*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkDivisionUnits*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IInkDivisionUnits*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IInkDivisionUnits*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IInkDivisionUnits*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1bb5ddc2-31cc-4135-ab82-2c66c9f00c41")]
  record IInkDivisionUnits, lpVtbl : IInkDivisionUnitsVtbl* do
    GUID = LibC::GUID.new(0x1bb5ddc2_u32, 0x31cc_u16, 0x4135_u16, StaticArray[0xab_u8, 0x82_u8, 0x2c_u8, 0x66_u8, 0xc9_u8, 0xf0_u8, 0xc_u8, 0x41_u8])
    def query_interface(this : IInkDivisionUnits*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkDivisionUnits*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkDivisionUnits*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkDivisionUnits*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkDivisionUnits*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkDivisionUnits*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkDivisionUnits*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IInkDivisionUnits*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : IInkDivisionUnits*, _new_enum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, _new_enum)
    end
    def item(this : IInkDivisionUnits*, index : Int32, ink_division_unit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ink_division_unit)
    end

  end

  @[Extern]
  record IPenInputPanelVtbl,
    query_interface : Proc(IPenInputPanel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPenInputPanel*, UInt32),
    release : Proc(IPenInputPanel*, UInt32),
    get_type_info_count : Proc(IPenInputPanel*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPenInputPanel*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPenInputPanel*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPenInputPanel*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Busy : Proc(IPenInputPanel*, Int16*, Win32cr::Foundation::HRESULT),
    get_Factoid : Proc(IPenInputPanel*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Factoid : Proc(IPenInputPanel*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AttachedEditWindow : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    put_AttachedEditWindow : Proc(IPenInputPanel*, Int32, Win32cr::Foundation::HRESULT),
    get_CurrentPanel : Proc(IPenInputPanel*, Win32cr::UI::TabletPC::PanelType*, Win32cr::Foundation::HRESULT),
    put_CurrentPanel : Proc(IPenInputPanel*, Win32cr::UI::TabletPC::PanelType, Win32cr::Foundation::HRESULT),
    get_DefaultPanel : Proc(IPenInputPanel*, Win32cr::UI::TabletPC::PanelType*, Win32cr::Foundation::HRESULT),
    put_DefaultPanel : Proc(IPenInputPanel*, Win32cr::UI::TabletPC::PanelType, Win32cr::Foundation::HRESULT),
    get_Visible : Proc(IPenInputPanel*, Int16*, Win32cr::Foundation::HRESULT),
    put_Visible : Proc(IPenInputPanel*, Int16, Win32cr::Foundation::HRESULT),
    get_Top : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    get_Left : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    get_Width : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    get_Height : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    get_VerticalOffset : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    put_VerticalOffset : Proc(IPenInputPanel*, Int32, Win32cr::Foundation::HRESULT),
    get_HorizontalOffset : Proc(IPenInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    put_HorizontalOffset : Proc(IPenInputPanel*, Int32, Win32cr::Foundation::HRESULT),
    get_AutoShow : Proc(IPenInputPanel*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoShow : Proc(IPenInputPanel*, Int16, Win32cr::Foundation::HRESULT),
    move_to : Proc(IPenInputPanel*, Int32, Int32, Win32cr::Foundation::HRESULT),
    commit_pending_input : Proc(IPenInputPanel*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IPenInputPanel*, Win32cr::Foundation::HRESULT),
    enable_tsf : Proc(IPenInputPanel*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fa7a4083-5747-4040-a182-0b0e9fd4fac7")]
  record IPenInputPanel, lpVtbl : IPenInputPanelVtbl* do
    GUID = LibC::GUID.new(0xfa7a4083_u32, 0x5747_u16, 0x4040_u16, StaticArray[0xa1_u8, 0x82_u8, 0xb_u8, 0xe_u8, 0x9f_u8, 0xd4_u8, 0xfa_u8, 0xc7_u8])
    def query_interface(this : IPenInputPanel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPenInputPanel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPenInputPanel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPenInputPanel*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPenInputPanel*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPenInputPanel*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPenInputPanel*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Busy(this : IPenInputPanel*, busy : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Busy.call(this, busy)
    end
    def get_Factoid(this : IPenInputPanel*, factoid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Factoid.call(this, factoid)
    end
    def put_Factoid(this : IPenInputPanel*, factoid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Factoid.call(this, factoid)
    end
    def get_AttachedEditWindow(this : IPenInputPanel*, attached_edit_window : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachedEditWindow.call(this, attached_edit_window)
    end
    def put_AttachedEditWindow(this : IPenInputPanel*, attached_edit_window : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachedEditWindow.call(this, attached_edit_window)
    end
    def get_CurrentPanel(this : IPenInputPanel*, current_panel : Win32cr::UI::TabletPC::PanelType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPanel.call(this, current_panel)
    end
    def put_CurrentPanel(this : IPenInputPanel*, current_panel : Win32cr::UI::TabletPC::PanelType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CurrentPanel.call(this, current_panel)
    end
    def get_DefaultPanel(this : IPenInputPanel*, pDefaultPanel : Win32cr::UI::TabletPC::PanelType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultPanel.call(this, pDefaultPanel)
    end
    def put_DefaultPanel(this : IPenInputPanel*, default_panel : Win32cr::UI::TabletPC::PanelType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultPanel.call(this, default_panel)
    end
    def get_Visible(this : IPenInputPanel*, visible : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Visible.call(this, visible)
    end
    def put_Visible(this : IPenInputPanel*, visible : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Visible.call(this, visible)
    end
    def get_Top(this : IPenInputPanel*, top : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Top.call(this, top)
    end
    def get_Left(this : IPenInputPanel*, left : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Left.call(this, left)
    end
    def get_Width(this : IPenInputPanel*, width : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, width)
    end
    def get_Height(this : IPenInputPanel*, height : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Height.call(this, height)
    end
    def get_VerticalOffset(this : IPenInputPanel*, vertical_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VerticalOffset.call(this, vertical_offset)
    end
    def put_VerticalOffset(this : IPenInputPanel*, vertical_offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_VerticalOffset.call(this, vertical_offset)
    end
    def get_HorizontalOffset(this : IPenInputPanel*, horizontal_offset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HorizontalOffset.call(this, horizontal_offset)
    end
    def put_HorizontalOffset(this : IPenInputPanel*, horizontal_offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HorizontalOffset.call(this, horizontal_offset)
    end
    def get_AutoShow(this : IPenInputPanel*, pAutoShow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoShow.call(this, pAutoShow)
    end
    def put_AutoShow(this : IPenInputPanel*, auto_show : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoShow.call(this, auto_show)
    end
    def move_to(this : IPenInputPanel*, left : Int32, top : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to.call(this, left, top)
    end
    def commit_pending_input(this : IPenInputPanel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_pending_input.call(this)
    end
    def refresh(this : IPenInputPanel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def enable_tsf(this : IPenInputPanel*, enable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_tsf.call(this, enable)
    end

  end

  @[Extern]
  record IPenInputPanelEvents_Vtbl,
    query_interface : Proc(IPenInputPanelEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPenInputPanelEvents_*, UInt32),
    release : Proc(IPenInputPanelEvents_*, UInt32),
    get_type_info_count : Proc(IPenInputPanelEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPenInputPanelEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPenInputPanelEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPenInputPanelEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b7e489da-3719-439f-848f-e7acbd820f17")]
  record IPenInputPanelEvents_, lpVtbl : IPenInputPanelEvents_Vtbl* do
    GUID = LibC::GUID.new(0xb7e489da_u32, 0x3719_u16, 0x439f_u16, StaticArray[0x84_u8, 0x8f_u8, 0xe7_u8, 0xac_u8, 0xbd_u8, 0x82_u8, 0xf_u8, 0x17_u8])
    def query_interface(this : IPenInputPanelEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPenInputPanelEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPenInputPanelEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPenInputPanelEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPenInputPanelEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPenInputPanelEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPenInputPanelEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IHandwrittenTextInsertionVtbl,
    query_interface : Proc(IHandwrittenTextInsertion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHandwrittenTextInsertion*, UInt32),
    release : Proc(IHandwrittenTextInsertion*, UInt32),
    insert_recognition_results_array : Proc(IHandwrittenTextInsertion*, Win32cr::System::Com::SAFEARRAY*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    insert_ink_recognition_result : Proc(IHandwrittenTextInsertion*, Void*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56fdea97-ecd6-43e7-aa3a-816be7785860")]
  record IHandwrittenTextInsertion, lpVtbl : IHandwrittenTextInsertionVtbl* do
    GUID = LibC::GUID.new(0x56fdea97_u32, 0xecd6_u16, 0x43e7_u16, StaticArray[0xaa_u8, 0x3a_u8, 0x81_u8, 0x6b_u8, 0xe7_u8, 0x78_u8, 0x58_u8, 0x60_u8])
    def query_interface(this : IHandwrittenTextInsertion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHandwrittenTextInsertion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHandwrittenTextInsertion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_recognition_results_array(this : IHandwrittenTextInsertion*, psaAlternates : Win32cr::System::Com::SAFEARRAY*, locale : UInt32, fAlternateContainsAutoSpacingInformation : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_recognition_results_array.call(this, psaAlternates, locale, fAlternateContainsAutoSpacingInformation)
    end
    def insert_ink_recognition_result(this : IHandwrittenTextInsertion*, pIInkRecoResult : Void*, locale : UInt32, fAlternateContainsAutoSpacingInformation : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_ink_recognition_result.call(this, pIInkRecoResult, locale, fAlternateContainsAutoSpacingInformation)
    end

  end

  @[Extern]
  record ITextInputPanelEventSinkVtbl,
    query_interface : Proc(ITextInputPanelEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextInputPanelEventSink*, UInt32),
    release : Proc(ITextInputPanelEventSink*, UInt32),
    in_place_state_changing : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::InPlaceState, Win32cr::UI::TabletPC::InPlaceState, Win32cr::Foundation::HRESULT),
    in_place_state_changed : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::InPlaceState, Win32cr::UI::TabletPC::InPlaceState, Win32cr::Foundation::HRESULT),
    in_place_size_changing : Proc(ITextInputPanelEventSink*, Win32cr::Foundation::RECT, Win32cr::Foundation::RECT, Win32cr::Foundation::HRESULT),
    in_place_size_changed : Proc(ITextInputPanelEventSink*, Win32cr::Foundation::RECT, Win32cr::Foundation::RECT, Win32cr::Foundation::HRESULT),
    input_area_changing : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::PanelInputArea, Win32cr::UI::TabletPC::PanelInputArea, Win32cr::Foundation::HRESULT),
    input_area_changed : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::PanelInputArea, Win32cr::UI::TabletPC::PanelInputArea, Win32cr::Foundation::HRESULT),
    correction_mode_changing : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::CorrectionMode, Win32cr::UI::TabletPC::CorrectionMode, Win32cr::Foundation::HRESULT),
    correction_mode_changed : Proc(ITextInputPanelEventSink*, Win32cr::UI::TabletPC::CorrectionMode, Win32cr::UI::TabletPC::CorrectionMode, Win32cr::Foundation::HRESULT),
    in_place_visibility_changing : Proc(ITextInputPanelEventSink*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    in_place_visibility_changed : Proc(ITextInputPanelEventSink*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    text_inserting : Proc(ITextInputPanelEventSink*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    text_inserted : Proc(ITextInputPanelEventSink*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("27560408-8e64-4fe1-804e-421201584b31")]
  record ITextInputPanelEventSink, lpVtbl : ITextInputPanelEventSinkVtbl* do
    GUID = LibC::GUID.new(0x27560408_u32, 0x8e64_u16, 0x4fe1_u16, StaticArray[0x80_u8, 0x4e_u8, 0x42_u8, 0x12_u8, 0x1_u8, 0x58_u8, 0x4b_u8, 0x31_u8])
    def query_interface(this : ITextInputPanelEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextInputPanelEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextInputPanelEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def in_place_state_changing(this : ITextInputPanelEventSink*, oldInPlaceState : Win32cr::UI::TabletPC::InPlaceState, newInPlaceState : Win32cr::UI::TabletPC::InPlaceState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_state_changing.call(this, oldInPlaceState, newInPlaceState)
    end
    def in_place_state_changed(this : ITextInputPanelEventSink*, oldInPlaceState : Win32cr::UI::TabletPC::InPlaceState, newInPlaceState : Win32cr::UI::TabletPC::InPlaceState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_state_changed.call(this, oldInPlaceState, newInPlaceState)
    end
    def in_place_size_changing(this : ITextInputPanelEventSink*, oldBoundingRectangle : Win32cr::Foundation::RECT, newBoundingRectangle : Win32cr::Foundation::RECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_size_changing.call(this, oldBoundingRectangle, newBoundingRectangle)
    end
    def in_place_size_changed(this : ITextInputPanelEventSink*, oldBoundingRectangle : Win32cr::Foundation::RECT, newBoundingRectangle : Win32cr::Foundation::RECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_size_changed.call(this, oldBoundingRectangle, newBoundingRectangle)
    end
    def input_area_changing(this : ITextInputPanelEventSink*, oldInputArea : Win32cr::UI::TabletPC::PanelInputArea, newInputArea : Win32cr::UI::TabletPC::PanelInputArea) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.input_area_changing.call(this, oldInputArea, newInputArea)
    end
    def input_area_changed(this : ITextInputPanelEventSink*, oldInputArea : Win32cr::UI::TabletPC::PanelInputArea, newInputArea : Win32cr::UI::TabletPC::PanelInputArea) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.input_area_changed.call(this, oldInputArea, newInputArea)
    end
    def correction_mode_changing(this : ITextInputPanelEventSink*, oldCorrectionMode : Win32cr::UI::TabletPC::CorrectionMode, newCorrectionMode : Win32cr::UI::TabletPC::CorrectionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.correction_mode_changing.call(this, oldCorrectionMode, newCorrectionMode)
    end
    def correction_mode_changed(this : ITextInputPanelEventSink*, oldCorrectionMode : Win32cr::UI::TabletPC::CorrectionMode, newCorrectionMode : Win32cr::UI::TabletPC::CorrectionMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.correction_mode_changed.call(this, oldCorrectionMode, newCorrectionMode)
    end
    def in_place_visibility_changing(this : ITextInputPanelEventSink*, oldVisible : Win32cr::Foundation::BOOL, newVisible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_visibility_changing.call(this, oldVisible, newVisible)
    end
    def in_place_visibility_changed(this : ITextInputPanelEventSink*, oldVisible : Win32cr::Foundation::BOOL, newVisible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_visibility_changed.call(this, oldVisible, newVisible)
    end
    def text_inserting(this : ITextInputPanelEventSink*, ink : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.text_inserting.call(this, ink)
    end
    def text_inserted(this : ITextInputPanelEventSink*, ink : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.text_inserted.call(this, ink)
    end

  end

  @[Extern]
  record ITextInputPanelVtbl,
    query_interface : Proc(ITextInputPanel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextInputPanel*, UInt32),
    release : Proc(ITextInputPanel*, UInt32),
    get_AttachedEditWindow : Proc(ITextInputPanel*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_AttachedEditWindow : Proc(ITextInputPanel*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_CurrentInteractionMode : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InteractionMode*, Win32cr::Foundation::HRESULT),
    get_DefaultInPlaceState : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InPlaceState*, Win32cr::Foundation::HRESULT),
    put_DefaultInPlaceState : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InPlaceState, Win32cr::Foundation::HRESULT),
    get_CurrentInPlaceState : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InPlaceState*, Win32cr::Foundation::HRESULT),
    get_DefaultInputArea : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::PanelInputArea*, Win32cr::Foundation::HRESULT),
    put_DefaultInputArea : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::PanelInputArea, Win32cr::Foundation::HRESULT),
    get_CurrentInputArea : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::PanelInputArea*, Win32cr::Foundation::HRESULT),
    get_CurrentCorrectionMode : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::CorrectionMode*, Win32cr::Foundation::HRESULT),
    get_PreferredInPlaceDirection : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InPlaceDirection*, Win32cr::Foundation::HRESULT),
    put_PreferredInPlaceDirection : Proc(ITextInputPanel*, Win32cr::UI::TabletPC::InPlaceDirection, Win32cr::Foundation::HRESULT),
    get_ExpandPostInsertionCorrection : Proc(ITextInputPanel*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ExpandPostInsertionCorrection : Proc(ITextInputPanel*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_InPlaceVisibleOnFocus : Proc(ITextInputPanel*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_InPlaceVisibleOnFocus : Proc(ITextInputPanel*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_InPlaceBoundingRectangle : Proc(ITextInputPanel*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_PopUpCorrectionHeight : Proc(ITextInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    get_PopDownCorrectionHeight : Proc(ITextInputPanel*, Int32*, Win32cr::Foundation::HRESULT),
    commit_pending_input : Proc(ITextInputPanel*, Win32cr::Foundation::HRESULT),
    set_in_place_visibility : Proc(ITextInputPanel*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_in_place_position : Proc(ITextInputPanel*, Int32, Int32, Win32cr::UI::TabletPC::CorrectionPosition, Win32cr::Foundation::HRESULT),
    set_in_place_hover_target_position : Proc(ITextInputPanel*, Int32, Int32, Win32cr::Foundation::HRESULT),
    advise : Proc(ITextInputPanel*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unadvise : Proc(ITextInputPanel*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6b6a65a5-6af3-46c2-b6ea-56cd1f80df71")]
  record ITextInputPanel, lpVtbl : ITextInputPanelVtbl* do
    GUID = LibC::GUID.new(0x6b6a65a5_u32, 0x6af3_u16, 0x46c2_u16, StaticArray[0xb6_u8, 0xea_u8, 0x56_u8, 0xcd_u8, 0x1f_u8, 0x80_u8, 0xdf_u8, 0x71_u8])
    def query_interface(this : ITextInputPanel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextInputPanel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextInputPanel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_AttachedEditWindow(this : ITextInputPanel*, attached_edit_window : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachedEditWindow.call(this, attached_edit_window)
    end
    def put_AttachedEditWindow(this : ITextInputPanel*, attached_edit_window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachedEditWindow.call(this, attached_edit_window)
    end
    def get_CurrentInteractionMode(this : ITextInputPanel*, current_interaction_mode : Win32cr::UI::TabletPC::InteractionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentInteractionMode.call(this, current_interaction_mode)
    end
    def get_DefaultInPlaceState(this : ITextInputPanel*, state : Win32cr::UI::TabletPC::InPlaceState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultInPlaceState.call(this, state)
    end
    def put_DefaultInPlaceState(this : ITextInputPanel*, state : Win32cr::UI::TabletPC::InPlaceState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultInPlaceState.call(this, state)
    end
    def get_CurrentInPlaceState(this : ITextInputPanel*, state : Win32cr::UI::TabletPC::InPlaceState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentInPlaceState.call(this, state)
    end
    def get_DefaultInputArea(this : ITextInputPanel*, area : Win32cr::UI::TabletPC::PanelInputArea*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultInputArea.call(this, area)
    end
    def put_DefaultInputArea(this : ITextInputPanel*, area : Win32cr::UI::TabletPC::PanelInputArea) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultInputArea.call(this, area)
    end
    def get_CurrentInputArea(this : ITextInputPanel*, area : Win32cr::UI::TabletPC::PanelInputArea*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentInputArea.call(this, area)
    end
    def get_CurrentCorrectionMode(this : ITextInputPanel*, mode : Win32cr::UI::TabletPC::CorrectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCorrectionMode.call(this, mode)
    end
    def get_PreferredInPlaceDirection(this : ITextInputPanel*, direction : Win32cr::UI::TabletPC::InPlaceDirection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredInPlaceDirection.call(this, direction)
    end
    def put_PreferredInPlaceDirection(this : ITextInputPanel*, direction : Win32cr::UI::TabletPC::InPlaceDirection) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreferredInPlaceDirection.call(this, direction)
    end
    def get_ExpandPostInsertionCorrection(this : ITextInputPanel*, expand : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpandPostInsertionCorrection.call(this, expand)
    end
    def put_ExpandPostInsertionCorrection(this : ITextInputPanel*, expand : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExpandPostInsertionCorrection.call(this, expand)
    end
    def get_InPlaceVisibleOnFocus(this : ITextInputPanel*, visible : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InPlaceVisibleOnFocus.call(this, visible)
    end
    def put_InPlaceVisibleOnFocus(this : ITextInputPanel*, visible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InPlaceVisibleOnFocus.call(this, visible)
    end
    def get_InPlaceBoundingRectangle(this : ITextInputPanel*, bounding_rectangle : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InPlaceBoundingRectangle.call(this, bounding_rectangle)
    end
    def get_PopUpCorrectionHeight(this : ITextInputPanel*, height : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PopUpCorrectionHeight.call(this, height)
    end
    def get_PopDownCorrectionHeight(this : ITextInputPanel*, height : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PopDownCorrectionHeight.call(this, height)
    end
    def commit_pending_input(this : ITextInputPanel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_pending_input.call(this)
    end
    def set_in_place_visibility(this : ITextInputPanel*, visible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_in_place_visibility.call(this, visible)
    end
    def set_in_place_position(this : ITextInputPanel*, xPosition : Int32, yPosition : Int32, position : Win32cr::UI::TabletPC::CorrectionPosition) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_in_place_position.call(this, xPosition, yPosition, position)
    end
    def set_in_place_hover_target_position(this : ITextInputPanel*, xPosition : Int32, yPosition : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_in_place_hover_target_position.call(this, xPosition, yPosition)
    end
    def advise(this : ITextInputPanel*, event_sink : Void*, event_mask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, event_sink, event_mask)
    end
    def unadvise(this : ITextInputPanel*, event_sink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, event_sink)
    end

  end

  @[Extern]
  record IInputPanelWindowHandleVtbl,
    query_interface : Proc(IInputPanelWindowHandle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInputPanelWindowHandle*, UInt32),
    release : Proc(IInputPanelWindowHandle*, UInt32),
    get_AttachedEditWindow32 : Proc(IInputPanelWindowHandle*, Int32*, Win32cr::Foundation::HRESULT),
    put_AttachedEditWindow32 : Proc(IInputPanelWindowHandle*, Int32, Win32cr::Foundation::HRESULT),
    get_AttachedEditWindow64 : Proc(IInputPanelWindowHandle*, Int64*, Win32cr::Foundation::HRESULT),
    put_AttachedEditWindow64 : Proc(IInputPanelWindowHandle*, Int64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4af81847-fdc4-4fc3-ad0b-422479c1b935")]
  record IInputPanelWindowHandle, lpVtbl : IInputPanelWindowHandleVtbl* do
    GUID = LibC::GUID.new(0x4af81847_u32, 0xfdc4_u16, 0x4fc3_u16, StaticArray[0xad_u8, 0xb_u8, 0x42_u8, 0x24_u8, 0x79_u8, 0xc1_u8, 0xb9_u8, 0x35_u8])
    def query_interface(this : IInputPanelWindowHandle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInputPanelWindowHandle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInputPanelWindowHandle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_AttachedEditWindow32(this : IInputPanelWindowHandle*, attached_edit_window : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachedEditWindow32.call(this, attached_edit_window)
    end
    def put_AttachedEditWindow32(this : IInputPanelWindowHandle*, attached_edit_window : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachedEditWindow32.call(this, attached_edit_window)
    end
    def get_AttachedEditWindow64(this : IInputPanelWindowHandle*, attached_edit_window : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachedEditWindow64.call(this, attached_edit_window)
    end
    def put_AttachedEditWindow64(this : IInputPanelWindowHandle*, attached_edit_window : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachedEditWindow64.call(this, attached_edit_window)
    end

  end

  @[Extern]
  record ITextInputPanelRunInfoVtbl,
    query_interface : Proc(ITextInputPanelRunInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextInputPanelRunInfo*, UInt32),
    release : Proc(ITextInputPanelRunInfo*, UInt32),
    is_tip_running : Proc(ITextInputPanelRunInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f424568-1920-48cc-9811-a993cbf5adba")]
  record ITextInputPanelRunInfo, lpVtbl : ITextInputPanelRunInfoVtbl* do
    GUID = LibC::GUID.new(0x9f424568_u32, 0x1920_u16, 0x48cc_u16, StaticArray[0x98_u8, 0x11_u8, 0xa9_u8, 0x93_u8, 0xcb_u8, 0xf5_u8, 0xad_u8, 0xba_u8])
    def query_interface(this : ITextInputPanelRunInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextInputPanelRunInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextInputPanelRunInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_tip_running(this : ITextInputPanelRunInfo*, pfRunning : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_tip_running.call(this, pfRunning)
    end

  end

  @[Extern]
  record IInkEditVtbl,
    query_interface : Proc(IInkEdit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkEdit*, UInt32),
    release : Proc(IInkEdit*, UInt32),
    get_type_info_count : Proc(IInkEdit*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkEdit*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkEdit*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkEdit*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkEditStatus*, Win32cr::Foundation::HRESULT),
    get_UseMouseForInput : Proc(IInkEdit*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseMouseForInput : Proc(IInkEdit*, Int16, Win32cr::Foundation::HRESULT),
    get_InkMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkMode*, Win32cr::Foundation::HRESULT),
    put_InkMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkMode, Win32cr::Foundation::HRESULT),
    get_InkInsertMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkInsertMode*, Win32cr::Foundation::HRESULT),
    put_InkInsertMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkInsertMode, Win32cr::Foundation::HRESULT),
    get_DrawingAttributes : Proc(IInkEdit*, Void**, Win32cr::Foundation::HRESULT),
    putref_DrawingAttributes : Proc(IInkEdit*, Void*, Win32cr::Foundation::HRESULT),
    get_RecognitionTimeout : Proc(IInkEdit*, Int32*, Win32cr::Foundation::HRESULT),
    put_RecognitionTimeout : Proc(IInkEdit*, Int32, Win32cr::Foundation::HRESULT),
    get_Recognizer : Proc(IInkEdit*, Void**, Win32cr::Foundation::HRESULT),
    putref_Recognizer : Proc(IInkEdit*, Void*, Win32cr::Foundation::HRESULT),
    get_Factoid : Proc(IInkEdit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Factoid : Proc(IInkEdit*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SelInks : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelInks : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelInksDisplayMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkDisplayMode*, Win32cr::Foundation::HRESULT),
    put_SelInksDisplayMode : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkDisplayMode, Win32cr::Foundation::HRESULT),
    recognize : Proc(IInkEdit*, Win32cr::Foundation::HRESULT),
    get_gesture_status : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16*, Win32cr::Foundation::HRESULT),
    set_gesture_status : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkApplicationGesture, Int16, Win32cr::Foundation::HRESULT),
    put_BackColor : Proc(IInkEdit*, UInt32, Win32cr::Foundation::HRESULT),
    get_BackColor : Proc(IInkEdit*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Appearance : Proc(IInkEdit*, Win32cr::UI::TabletPC::AppearanceConstants*, Win32cr::Foundation::HRESULT),
    put_Appearance : Proc(IInkEdit*, Win32cr::UI::TabletPC::AppearanceConstants, Win32cr::Foundation::HRESULT),
    get_BorderStyle : Proc(IInkEdit*, Win32cr::UI::TabletPC::BorderStyleConstants*, Win32cr::Foundation::HRESULT),
    put_BorderStyle : Proc(IInkEdit*, Win32cr::UI::TabletPC::BorderStyleConstants, Win32cr::Foundation::HRESULT),
    get_Hwnd : Proc(IInkEdit*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Font : Proc(IInkEdit*, Void**, Win32cr::Foundation::HRESULT),
    putref_Font : Proc(IInkEdit*, Void*, Win32cr::Foundation::HRESULT),
    get_Text : Proc(IInkEdit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Text : Proc(IInkEdit*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MouseIcon : Proc(IInkEdit*, Void**, Win32cr::Foundation::HRESULT),
    put_MouseIcon : Proc(IInkEdit*, Void*, Win32cr::Foundation::HRESULT),
    putref_MouseIcon : Proc(IInkEdit*, Void*, Win32cr::Foundation::HRESULT),
    get_MousePointer : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkMousePointer*, Win32cr::Foundation::HRESULT),
    put_MousePointer : Proc(IInkEdit*, Win32cr::UI::TabletPC::InkMousePointer, Win32cr::Foundation::HRESULT),
    get_Locked : Proc(IInkEdit*, Int16*, Win32cr::Foundation::HRESULT),
    put_Locked : Proc(IInkEdit*, Int16, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IInkEdit*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IInkEdit*, Int16, Win32cr::Foundation::HRESULT),
    get_MaxLength : Proc(IInkEdit*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxLength : Proc(IInkEdit*, Int32, Win32cr::Foundation::HRESULT),
    get_MultiLine : Proc(IInkEdit*, Int16*, Win32cr::Foundation::HRESULT),
    put_MultiLine : Proc(IInkEdit*, Int16, Win32cr::Foundation::HRESULT),
    get_ScrollBars : Proc(IInkEdit*, Win32cr::UI::TabletPC::ScrollBarsConstants*, Win32cr::Foundation::HRESULT),
    put_ScrollBars : Proc(IInkEdit*, Win32cr::UI::TabletPC::ScrollBarsConstants, Win32cr::Foundation::HRESULT),
    get_DisableNoScroll : Proc(IInkEdit*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisableNoScroll : Proc(IInkEdit*, Int16, Win32cr::Foundation::HRESULT),
    get_SelAlignment : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelAlignment : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelBold : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelBold : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelItalic : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelItalic : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelUnderline : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelUnderline : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelColor : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelColor : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelFontName : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelFontName : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelFontSize : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelFontSize : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SelCharOffset : Proc(IInkEdit*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SelCharOffset : Proc(IInkEdit*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_TextRTF : Proc(IInkEdit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TextRTF : Proc(IInkEdit*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SelStart : Proc(IInkEdit*, Int32*, Win32cr::Foundation::HRESULT),
    put_SelStart : Proc(IInkEdit*, Int32, Win32cr::Foundation::HRESULT),
    get_SelLength : Proc(IInkEdit*, Int32*, Win32cr::Foundation::HRESULT),
    put_SelLength : Proc(IInkEdit*, Int32, Win32cr::Foundation::HRESULT),
    get_SelText : Proc(IInkEdit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SelText : Proc(IInkEdit*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SelRTF : Proc(IInkEdit*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SelRTF : Proc(IInkEdit*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IInkEdit*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2127a19-fbfb-4aed-8464-3f36d78cfefb")]
  record IInkEdit, lpVtbl : IInkEditVtbl* do
    GUID = LibC::GUID.new(0xf2127a19_u32, 0xfbfb_u16, 0x4aed_u16, StaticArray[0x84_u8, 0x64_u8, 0x3f_u8, 0x36_u8, 0xd7_u8, 0x8c_u8, 0xfe_u8, 0xfb_u8])
    def query_interface(this : IInkEdit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkEdit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkEdit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkEdit*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkEdit*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkEdit*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkEdit*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Status(this : IInkEdit*, pStatus : Win32cr::UI::TabletPC::InkEditStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_UseMouseForInput(this : IInkEdit*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseMouseForInput.call(this, pVal)
    end
    def put_UseMouseForInput(this : IInkEdit*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseMouseForInput.call(this, newVal)
    end
    def get_InkMode(this : IInkEdit*, pVal : Win32cr::UI::TabletPC::InkMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InkMode.call(this, pVal)
    end
    def put_InkMode(this : IInkEdit*, newVal : Win32cr::UI::TabletPC::InkMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InkMode.call(this, newVal)
    end
    def get_InkInsertMode(this : IInkEdit*, pVal : Win32cr::UI::TabletPC::InkInsertMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InkInsertMode.call(this, pVal)
    end
    def put_InkInsertMode(this : IInkEdit*, newVal : Win32cr::UI::TabletPC::InkInsertMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InkInsertMode.call(this, newVal)
    end
    def get_DrawingAttributes(this : IInkEdit*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DrawingAttributes.call(this, pVal)
    end
    def putref_DrawingAttributes(this : IInkEdit*, newVal : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DrawingAttributes.call(this, newVal)
    end
    def get_RecognitionTimeout(this : IInkEdit*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecognitionTimeout.call(this, pVal)
    end
    def put_RecognitionTimeout(this : IInkEdit*, newVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RecognitionTimeout.call(this, newVal)
    end
    def get_Recognizer(this : IInkEdit*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recognizer.call(this, pVal)
    end
    def putref_Recognizer(this : IInkEdit*, newVal : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Recognizer.call(this, newVal)
    end
    def get_Factoid(this : IInkEdit*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Factoid.call(this, pVal)
    end
    def put_Factoid(this : IInkEdit*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Factoid.call(this, newVal)
    end
    def get_SelInks(this : IInkEdit*, pSelInk : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelInks.call(this, pSelInk)
    end
    def put_SelInks(this : IInkEdit*, sel_ink : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelInks.call(this, sel_ink)
    end
    def get_SelInksDisplayMode(this : IInkEdit*, pInkDisplayMode : Win32cr::UI::TabletPC::InkDisplayMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelInksDisplayMode.call(this, pInkDisplayMode)
    end
    def put_SelInksDisplayMode(this : IInkEdit*, ink_display_mode : Win32cr::UI::TabletPC::InkDisplayMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelInksDisplayMode.call(this, ink_display_mode)
    end
    def recognize(this : IInkEdit*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recognize.call(this)
    end
    def get_gesture_status(this : IInkEdit*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, pListen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gesture_status.call(this, gesture, pListen)
    end
    def set_gesture_status(this : IInkEdit*, gesture : Win32cr::UI::TabletPC::InkApplicationGesture, listen : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gesture_status.call(this, gesture, listen)
    end
    def put_BackColor(this : IInkEdit*, clr : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColor.call(this, clr)
    end
    def get_BackColor(this : IInkEdit*, pclr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColor.call(this, pclr)
    end
    def get_Appearance(this : IInkEdit*, pAppearance : Win32cr::UI::TabletPC::AppearanceConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Appearance.call(this, pAppearance)
    end
    def put_Appearance(this : IInkEdit*, pAppearance : Win32cr::UI::TabletPC::AppearanceConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Appearance.call(this, pAppearance)
    end
    def get_BorderStyle(this : IInkEdit*, pBorderStyle : Win32cr::UI::TabletPC::BorderStyleConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BorderStyle.call(this, pBorderStyle)
    end
    def put_BorderStyle(this : IInkEdit*, pBorderStyle : Win32cr::UI::TabletPC::BorderStyleConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BorderStyle.call(this, pBorderStyle)
    end
    def get_Hwnd(this : IInkEdit*, pohHwnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hwnd.call(this, pohHwnd)
    end
    def get_Font(this : IInkEdit*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Font.call(this, ppFont)
    end
    def putref_Font(this : IInkEdit*, ppFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Font.call(this, ppFont)
    end
    def get_Text(this : IInkEdit*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Text.call(this, pbstrText)
    end
    def put_Text(this : IInkEdit*, pbstrText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Text.call(this, pbstrText)
    end
    def get_MouseIcon(this : IInkEdit*, mouse_icon : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MouseIcon.call(this, mouse_icon)
    end
    def put_MouseIcon(this : IInkEdit*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MouseIcon.call(this, mouse_icon)
    end
    def putref_MouseIcon(this : IInkEdit*, mouse_icon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_MouseIcon.call(this, mouse_icon)
    end
    def get_MousePointer(this : IInkEdit*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MousePointer.call(this, mouse_pointer)
    end
    def put_MousePointer(this : IInkEdit*, mouse_pointer : Win32cr::UI::TabletPC::InkMousePointer) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MousePointer.call(this, mouse_pointer)
    end
    def get_Locked(this : IInkEdit*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Locked.call(this, pVal)
    end
    def put_Locked(this : IInkEdit*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Locked.call(this, newVal)
    end
    def get_Enabled(this : IInkEdit*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pVal)
    end
    def put_Enabled(this : IInkEdit*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, newVal)
    end
    def get_MaxLength(this : IInkEdit*, plMaxLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxLength.call(this, plMaxLength)
    end
    def put_MaxLength(this : IInkEdit*, lMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxLength.call(this, lMaxLength)
    end
    def get_MultiLine(this : IInkEdit*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultiLine.call(this, pVal)
    end
    def put_MultiLine(this : IInkEdit*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultiLine.call(this, newVal)
    end
    def get_ScrollBars(this : IInkEdit*, pVal : Win32cr::UI::TabletPC::ScrollBarsConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScrollBars.call(this, pVal)
    end
    def put_ScrollBars(this : IInkEdit*, newVal : Win32cr::UI::TabletPC::ScrollBarsConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScrollBars.call(this, newVal)
    end
    def get_DisableNoScroll(this : IInkEdit*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisableNoScroll.call(this, pVal)
    end
    def put_DisableNoScroll(this : IInkEdit*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisableNoScroll.call(this, newVal)
    end
    def get_SelAlignment(this : IInkEdit*, pvarSelAlignment : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelAlignment.call(this, pvarSelAlignment)
    end
    def put_SelAlignment(this : IInkEdit*, pvarSelAlignment : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelAlignment.call(this, pvarSelAlignment)
    end
    def get_SelBold(this : IInkEdit*, pvarSelBold : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelBold.call(this, pvarSelBold)
    end
    def put_SelBold(this : IInkEdit*, pvarSelBold : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelBold.call(this, pvarSelBold)
    end
    def get_SelItalic(this : IInkEdit*, pvarSelItalic : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelItalic.call(this, pvarSelItalic)
    end
    def put_SelItalic(this : IInkEdit*, pvarSelItalic : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelItalic.call(this, pvarSelItalic)
    end
    def get_SelUnderline(this : IInkEdit*, pvarSelUnderline : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelUnderline.call(this, pvarSelUnderline)
    end
    def put_SelUnderline(this : IInkEdit*, pvarSelUnderline : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelUnderline.call(this, pvarSelUnderline)
    end
    def get_SelColor(this : IInkEdit*, pvarSelColor : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelColor.call(this, pvarSelColor)
    end
    def put_SelColor(this : IInkEdit*, pvarSelColor : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelColor.call(this, pvarSelColor)
    end
    def get_SelFontName(this : IInkEdit*, pvarSelFontName : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelFontName.call(this, pvarSelFontName)
    end
    def put_SelFontName(this : IInkEdit*, pvarSelFontName : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelFontName.call(this, pvarSelFontName)
    end
    def get_SelFontSize(this : IInkEdit*, pvarSelFontSize : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelFontSize.call(this, pvarSelFontSize)
    end
    def put_SelFontSize(this : IInkEdit*, pvarSelFontSize : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelFontSize.call(this, pvarSelFontSize)
    end
    def get_SelCharOffset(this : IInkEdit*, pvarSelCharOffset : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelCharOffset.call(this, pvarSelCharOffset)
    end
    def put_SelCharOffset(this : IInkEdit*, pvarSelCharOffset : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelCharOffset.call(this, pvarSelCharOffset)
    end
    def get_TextRTF(this : IInkEdit*, pbstrTextRTF : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TextRTF.call(this, pbstrTextRTF)
    end
    def put_TextRTF(this : IInkEdit*, pbstrTextRTF : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TextRTF.call(this, pbstrTextRTF)
    end
    def get_SelStart(this : IInkEdit*, plSelStart : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelStart.call(this, plSelStart)
    end
    def put_SelStart(this : IInkEdit*, plSelStart : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelStart.call(this, plSelStart)
    end
    def get_SelLength(this : IInkEdit*, plSelLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelLength.call(this, plSelLength)
    end
    def put_SelLength(this : IInkEdit*, plSelLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelLength.call(this, plSelLength)
    end
    def get_SelText(this : IInkEdit*, pbstrSelText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelText.call(this, pbstrSelText)
    end
    def put_SelText(this : IInkEdit*, pbstrSelText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelText.call(this, pbstrSelText)
    end
    def get_SelRTF(this : IInkEdit*, pbstrSelRTF : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelRTF.call(this, pbstrSelRTF)
    end
    def put_SelRTF(this : IInkEdit*, pbstrSelRTF : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SelRTF.call(this, pbstrSelRTF)
    end
    def refresh(this : IInkEdit*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end

  end

  @[Extern]
  record IInkEditEvents_Vtbl,
    query_interface : Proc(IInkEditEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInkEditEvents_*, UInt32),
    release : Proc(IInkEditEvents_*, UInt32),
    get_type_info_count : Proc(IInkEditEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInkEditEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInkEditEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInkEditEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e3b0b797-a72e-46db-a0d7-6c9eba8e9bbc")]
  record IInkEditEvents_, lpVtbl : IInkEditEvents_Vtbl* do
    GUID = LibC::GUID.new(0xe3b0b797_u32, 0xa72e_u16, 0x46db_u16, StaticArray[0xa0_u8, 0xd7_u8, 0x6c_u8, 0x9e_u8, 0xba_u8, 0x8e_u8, 0x9b_u8, 0xbc_u8])
    def query_interface(this : IInkEditEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInkEditEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInkEditEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInkEditEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInkEditEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInkEditEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInkEditEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IMathInputControlVtbl,
    query_interface : Proc(IMathInputControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMathInputControl*, UInt32),
    release : Proc(IMathInputControl*, UInt32),
    get_type_info_count : Proc(IMathInputControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMathInputControl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMathInputControl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMathInputControl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(IMathInputControl*, Win32cr::Foundation::HRESULT),
    hide : Proc(IMathInputControl*, Win32cr::Foundation::HRESULT),
    is_visible : Proc(IMathInputControl*, Int16*, Win32cr::Foundation::HRESULT),
    get_position : Proc(IMathInputControl*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_position : Proc(IMathInputControl*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    clear : Proc(IMathInputControl*, Win32cr::Foundation::HRESULT),
    set_custom_paint : Proc(IMathInputControl*, Int32, Int16, Win32cr::Foundation::HRESULT),
    set_caption_text : Proc(IMathInputControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    load_ink : Proc(IMathInputControl*, Void*, Win32cr::Foundation::HRESULT),
    set_owner_window : Proc(IMathInputControl*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    enable_extended_buttons : Proc(IMathInputControl*, Int16, Win32cr::Foundation::HRESULT),
    get_preview_height : Proc(IMathInputControl*, Int32*, Win32cr::Foundation::HRESULT),
    set_preview_height : Proc(IMathInputControl*, Int32, Win32cr::Foundation::HRESULT),
    enable_auto_grow : Proc(IMathInputControl*, Int16, Win32cr::Foundation::HRESULT),
    add_function_name : Proc(IMathInputControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_function_name : Proc(IMathInputControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_hover_icon : Proc(IMathInputControl*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eba615aa-fac6-4738-ba5f-ff09e9fe473e")]
  record IMathInputControl, lpVtbl : IMathInputControlVtbl* do
    GUID = LibC::GUID.new(0xeba615aa_u32, 0xfac6_u16, 0x4738_u16, StaticArray[0xba_u8, 0x5f_u8, 0xff_u8, 0x9_u8, 0xe9_u8, 0xfe_u8, 0x47_u8, 0x3e_u8])
    def query_interface(this : IMathInputControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMathInputControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMathInputControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMathInputControl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMathInputControl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMathInputControl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMathInputControl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def show(this : IMathInputControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this)
    end
    def hide(this : IMathInputControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hide.call(this)
    end
    def is_visible(this : IMathInputControl*, pvbShown : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_visible.call(this, pvbShown)
    end
    def get_position(this : IMathInputControl*, left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position.call(this, left, top, right, bottom)
    end
    def set_position(this : IMathInputControl*, left : Int32, top : Int32, right : Int32, bottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position.call(this, left, top, right, bottom)
    end
    def clear(this : IMathInputControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def set_custom_paint(this : IMathInputControl*, element : Int32, paint : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_paint.call(this, element, paint)
    end
    def set_caption_text(this : IMathInputControl*, caption_text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_caption_text.call(this, caption_text)
    end
    def load_ink(this : IMathInputControl*, ink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_ink.call(this, ink)
    end
    def set_owner_window(this : IMathInputControl*, owner_window : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_owner_window.call(this, owner_window)
    end
    def enable_extended_buttons(this : IMathInputControl*, extended : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_extended_buttons.call(this, extended)
    end
    def get_preview_height(this : IMathInputControl*, height : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preview_height.call(this, height)
    end
    def set_preview_height(this : IMathInputControl*, height : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preview_height.call(this, height)
    end
    def enable_auto_grow(this : IMathInputControl*, auto_grow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_auto_grow.call(this, auto_grow)
    end
    def add_function_name(this : IMathInputControl*, function_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_function_name.call(this, function_name)
    end
    def remove_function_name(this : IMathInputControl*, function_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_function_name.call(this, function_name)
    end
    def get_hover_icon(this : IMathInputControl*, hover_image : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hover_icon.call(this, hover_image)
    end

  end

  @[Extern]
  record IMathInputControlEvents_Vtbl,
    query_interface : Proc(IMathInputControlEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMathInputControlEvents_*, UInt32),
    release : Proc(IMathInputControlEvents_*, UInt32),
    get_type_info_count : Proc(IMathInputControlEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMathInputControlEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMathInputControlEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMathInputControlEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683336b5-a47d-4358-96f9-875a472ae70a")]
  record IMathInputControlEvents_, lpVtbl : IMathInputControlEvents_Vtbl* do
    GUID = LibC::GUID.new(0x683336b5_u32, 0xa47d_u16, 0x4358_u16, StaticArray[0x96_u8, 0xf9_u8, 0x87_u8, 0x5a_u8, 0x47_u8, 0x2a_u8, 0xe7_u8, 0xa_u8])
    def query_interface(this : IMathInputControlEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMathInputControlEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMathInputControlEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMathInputControlEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMathInputControlEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMathInputControlEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMathInputControlEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IRealTimeStylusVtbl,
    query_interface : Proc(IRealTimeStylus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRealTimeStylus*, UInt32),
    release : Proc(IRealTimeStylus*, UInt32),
    get_Enabled : Proc(IRealTimeStylus*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IRealTimeStylus*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_HWND : Proc(IRealTimeStylus*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    put_HWND : Proc(IRealTimeStylus*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    get_WindowInputRectangle : Proc(IRealTimeStylus*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    put_WindowInputRectangle : Proc(IRealTimeStylus*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    add_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_all_stylus_sync_plugins : Proc(IRealTimeStylus*, Win32cr::Foundation::HRESULT),
    get_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_stylus_sync_plugin_count : Proc(IRealTimeStylus*, UInt32*, Win32cr::Foundation::HRESULT),
    add_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_all_stylus_async_plugins : Proc(IRealTimeStylus*, Win32cr::Foundation::HRESULT),
    get_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_stylus_async_plugin_count : Proc(IRealTimeStylus*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ChildRealTimeStylusPlugin : Proc(IRealTimeStylus*, Void**, Win32cr::Foundation::HRESULT),
    putref_ChildRealTimeStylusPlugin : Proc(IRealTimeStylus*, Void*, Win32cr::Foundation::HRESULT),
    add_custom_stylus_data_to_queue : Proc(IRealTimeStylus*, Win32cr::UI::TabletPC::StylusQueue, LibC::GUID*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    clear_stylus_queues : Proc(IRealTimeStylus*, Win32cr::Foundation::HRESULT),
    set_all_tablets_mode : Proc(IRealTimeStylus*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_single_tablet_mode : Proc(IRealTimeStylus*, Void*, Win32cr::Foundation::HRESULT),
    get_tablet : Proc(IRealTimeStylus*, Void**, Win32cr::Foundation::HRESULT),
    get_tablet_context_id_from_tablet : Proc(IRealTimeStylus*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_tablet_from_tablet_context_id : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_all_tablet_context_ids : Proc(IRealTimeStylus*, UInt32*, UInt32**, Win32cr::Foundation::HRESULT),
    get_styluses : Proc(IRealTimeStylus*, Void**, Win32cr::Foundation::HRESULT),
    get_stylus_for_id : Proc(IRealTimeStylus*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_desired_packet_description : Proc(IRealTimeStylus*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_desired_packet_description : Proc(IRealTimeStylus*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_packet_description_data : Proc(IRealTimeStylus*, UInt32, Float32*, Float32*, UInt32*, Win32cr::UI::TabletPC::PACKET_PROPERTY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a8bb5d22-3144-4a7b-93cd-f34a16be513a")]
  record IRealTimeStylus, lpVtbl : IRealTimeStylusVtbl* do
    GUID = LibC::GUID.new(0xa8bb5d22_u32, 0x3144_u16, 0x4a7b_u16, StaticArray[0x93_u8, 0xcd_u8, 0xf3_u8, 0x4a_u8, 0x16_u8, 0xbe_u8, 0x51_u8, 0x3a_u8])
    def query_interface(this : IRealTimeStylus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRealTimeStylus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRealTimeStylus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Enabled(this : IRealTimeStylus*, pfEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pfEnable)
    end
    def put_Enabled(this : IRealTimeStylus*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, fEnable)
    end
    def get_HWND(this : IRealTimeStylus*, phwnd : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HWND.call(this, phwnd)
    end
    def put_HWND(this : IRealTimeStylus*, hwnd : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HWND.call(this, hwnd)
    end
    def get_WindowInputRectangle(this : IRealTimeStylus*, prcWndInputRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowInputRectangle.call(this, prcWndInputRect)
    end
    def put_WindowInputRectangle(this : IRealTimeStylus*, prcWndInputRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WindowInputRectangle.call(this, prcWndInputRect)
    end
    def add_stylus_sync_plugin(this : IRealTimeStylus*, iIndex : UInt32, piPlugin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stylus_sync_plugin.call(this, iIndex, piPlugin)
    end
    def remove_stylus_sync_plugin(this : IRealTimeStylus*, iIndex : UInt32, ppiPlugin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stylus_sync_plugin.call(this, iIndex, ppiPlugin)
    end
    def remove_all_stylus_sync_plugins(this : IRealTimeStylus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_stylus_sync_plugins.call(this)
    end
    def get_stylus_sync_plugin(this : IRealTimeStylus*, iIndex : UInt32, ppiPlugin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stylus_sync_plugin.call(this, iIndex, ppiPlugin)
    end
    def get_stylus_sync_plugin_count(this : IRealTimeStylus*, pcPlugins : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stylus_sync_plugin_count.call(this, pcPlugins)
    end
    def add_stylus_async_plugin(this : IRealTimeStylus*, iIndex : UInt32, piPlugin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stylus_async_plugin.call(this, iIndex, piPlugin)
    end
    def remove_stylus_async_plugin(this : IRealTimeStylus*, iIndex : UInt32, ppiPlugin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stylus_async_plugin.call(this, iIndex, ppiPlugin)
    end
    def remove_all_stylus_async_plugins(this : IRealTimeStylus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_stylus_async_plugins.call(this)
    end
    def get_stylus_async_plugin(this : IRealTimeStylus*, iIndex : UInt32, ppiPlugin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stylus_async_plugin.call(this, iIndex, ppiPlugin)
    end
    def get_stylus_async_plugin_count(this : IRealTimeStylus*, pcPlugins : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stylus_async_plugin_count.call(this, pcPlugins)
    end
    def get_ChildRealTimeStylusPlugin(this : IRealTimeStylus*, ppiRTS : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChildRealTimeStylusPlugin.call(this, ppiRTS)
    end
    def putref_ChildRealTimeStylusPlugin(this : IRealTimeStylus*, piRTS : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ChildRealTimeStylusPlugin.call(this, piRTS)
    end
    def add_custom_stylus_data_to_queue(this : IRealTimeStylus*, sq : Win32cr::UI::TabletPC::StylusQueue, pGuidId : LibC::GUID*, cbData : UInt32, pbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_custom_stylus_data_to_queue.call(this, sq, pGuidId, cbData, pbData)
    end
    def clear_stylus_queues(this : IRealTimeStylus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_stylus_queues.call(this)
    end
    def set_all_tablets_mode(this : IRealTimeStylus*, fUseMouseForInput : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_tablets_mode.call(this, fUseMouseForInput)
    end
    def set_single_tablet_mode(this : IRealTimeStylus*, piTablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_single_tablet_mode.call(this, piTablet)
    end
    def get_tablet(this : IRealTimeStylus*, ppiSingleTablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tablet.call(this, ppiSingleTablet)
    end
    def get_tablet_context_id_from_tablet(this : IRealTimeStylus*, piTablet : Void*, ptcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tablet_context_id_from_tablet.call(this, piTablet, ptcid)
    end
    def get_tablet_from_tablet_context_id(this : IRealTimeStylus*, tcid : UInt32, ppiTablet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tablet_from_tablet_context_id.call(this, tcid, ppiTablet)
    end
    def get_all_tablet_context_ids(this : IRealTimeStylus*, pcTcidCount : UInt32*, ppTcids : UInt32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_tablet_context_ids.call(this, pcTcidCount, ppTcids)
    end
    def get_styluses(this : IRealTimeStylus*, ppiInkCursors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_styluses.call(this, ppiInkCursors)
    end
    def get_stylus_for_id(this : IRealTimeStylus*, sid : UInt32, ppiInkCursor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stylus_for_id.call(this, sid, ppiInkCursor)
    end
    def set_desired_packet_description(this : IRealTimeStylus*, cProperties : UInt32, pPropertyGuids : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desired_packet_description.call(this, cProperties, pPropertyGuids)
    end
    def get_desired_packet_description(this : IRealTimeStylus*, pcProperties : UInt32*, ppPropertyGuids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desired_packet_description.call(this, pcProperties, ppPropertyGuids)
    end
    def get_packet_description_data(this : IRealTimeStylus*, tcid : UInt32, pfInkToDeviceScaleX : Float32*, pfInkToDeviceScaleY : Float32*, pcPacketProperties : UInt32*, ppPacketProperties : Win32cr::UI::TabletPC::PACKET_PROPERTY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_packet_description_data.call(this, tcid, pfInkToDeviceScaleX, pfInkToDeviceScaleY, pcPacketProperties, ppPacketProperties)
    end

  end

  @[Extern]
  record IRealTimeStylus2Vtbl,
    query_interface : Proc(IRealTimeStylus2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRealTimeStylus2*, UInt32),
    release : Proc(IRealTimeStylus2*, UInt32),
    get_FlicksEnabled : Proc(IRealTimeStylus2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_FlicksEnabled : Proc(IRealTimeStylus2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b5f2a6cd-3179-4a3e-b9c4-bb5865962be2")]
  record IRealTimeStylus2, lpVtbl : IRealTimeStylus2Vtbl* do
    GUID = LibC::GUID.new(0xb5f2a6cd_u32, 0x3179_u16, 0x4a3e_u16, StaticArray[0xb9_u8, 0xc4_u8, 0xbb_u8, 0x58_u8, 0x65_u8, 0x96_u8, 0x2b_u8, 0xe2_u8])
    def query_interface(this : IRealTimeStylus2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRealTimeStylus2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRealTimeStylus2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_FlicksEnabled(this : IRealTimeStylus2*, pfEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FlicksEnabled.call(this, pfEnable)
    end
    def put_FlicksEnabled(this : IRealTimeStylus2*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FlicksEnabled.call(this, fEnable)
    end

  end

  @[Extern]
  record IRealTimeStylus3Vtbl,
    query_interface : Proc(IRealTimeStylus3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRealTimeStylus3*, UInt32),
    release : Proc(IRealTimeStylus3*, UInt32),
    get_MultiTouchEnabled : Proc(IRealTimeStylus3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_MultiTouchEnabled : Proc(IRealTimeStylus3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d70230a3-6986-4051-b57a-1cf69f4d9db5")]
  record IRealTimeStylus3, lpVtbl : IRealTimeStylus3Vtbl* do
    GUID = LibC::GUID.new(0xd70230a3_u32, 0x6986_u16, 0x4051_u16, StaticArray[0xb5_u8, 0x7a_u8, 0x1c_u8, 0xf6_u8, 0x9f_u8, 0x4d_u8, 0x9d_u8, 0xb5_u8])
    def query_interface(this : IRealTimeStylus3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRealTimeStylus3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRealTimeStylus3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_MultiTouchEnabled(this : IRealTimeStylus3*, pfEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultiTouchEnabled.call(this, pfEnable)
    end
    def put_MultiTouchEnabled(this : IRealTimeStylus3*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultiTouchEnabled.call(this, fEnable)
    end

  end

  @[Extern]
  record IRealTimeStylusSynchronizationVtbl,
    query_interface : Proc(IRealTimeStylusSynchronization*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRealTimeStylusSynchronization*, UInt32),
    release : Proc(IRealTimeStylusSynchronization*, UInt32),
    acquire_lock : Proc(IRealTimeStylusSynchronization*, Win32cr::UI::TabletPC::RealTimeStylusLockType, Win32cr::Foundation::HRESULT),
    release_lock : Proc(IRealTimeStylusSynchronization*, Win32cr::UI::TabletPC::RealTimeStylusLockType, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa87eab8-ab4a-4cea-b5cb-46d84c6a2509")]
  record IRealTimeStylusSynchronization, lpVtbl : IRealTimeStylusSynchronizationVtbl* do
    GUID = LibC::GUID.new(0xaa87eab8_u32, 0xab4a_u16, 0x4cea_u16, StaticArray[0xb5_u8, 0xcb_u8, 0x46_u8, 0xd8_u8, 0x4c_u8, 0x6a_u8, 0x25_u8, 0x9_u8])
    def query_interface(this : IRealTimeStylusSynchronization*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRealTimeStylusSynchronization*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRealTimeStylusSynchronization*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_lock(this : IRealTimeStylusSynchronization*, lock : Win32cr::UI::TabletPC::RealTimeStylusLockType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_lock.call(this, lock)
    end
    def release_lock(this : IRealTimeStylusSynchronization*, lock : Win32cr::UI::TabletPC::RealTimeStylusLockType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_lock.call(this, lock)
    end

  end

  @[Extern]
  record IStrokeBuilderVtbl,
    query_interface : Proc(IStrokeBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStrokeBuilder*, UInt32),
    release : Proc(IStrokeBuilder*, UInt32),
    create_stroke : Proc(IStrokeBuilder*, UInt32, Int32*, UInt32, Win32cr::UI::TabletPC::PACKET_PROPERTY*, Float32, Float32, Void**, Win32cr::Foundation::HRESULT),
    begin_stroke : Proc(IStrokeBuilder*, UInt32, UInt32, Int32*, UInt32, Win32cr::UI::TabletPC::PACKET_PROPERTY*, Float32, Float32, Void**, Win32cr::Foundation::HRESULT),
    append_packets : Proc(IStrokeBuilder*, UInt32, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    end_stroke : Proc(IStrokeBuilder*, UInt32, UInt32, Void**, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_Ink : Proc(IStrokeBuilder*, Void**, Win32cr::Foundation::HRESULT),
    putref_Ink : Proc(IStrokeBuilder*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a5fd4e2d-c44b-4092-9177-260905eb672b")]
  record IStrokeBuilder, lpVtbl : IStrokeBuilderVtbl* do
    GUID = LibC::GUID.new(0xa5fd4e2d_u32, 0xc44b_u16, 0x4092_u16, StaticArray[0x91_u8, 0x77_u8, 0x26_u8, 0x9_u8, 0x5_u8, 0xeb_u8, 0x67_u8, 0x2b_u8])
    def query_interface(this : IStrokeBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStrokeBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStrokeBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_stroke(this : IStrokeBuilder*, cPktBuffLength : UInt32, pPackets : Int32*, cPacketProperties : UInt32, pPacketProperties : Win32cr::UI::TabletPC::PACKET_PROPERTY*, fInkToDeviceScaleX : Float32, fInkToDeviceScaleY : Float32, ppIInkStroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stroke.call(this, cPktBuffLength, pPackets, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke)
    end
    def begin_stroke(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, pPacket : Int32*, cPacketProperties : UInt32, pPacketProperties : Win32cr::UI::TabletPC::PACKET_PROPERTY*, fInkToDeviceScaleX : Float32, fInkToDeviceScaleY : Float32, ppIInkStroke : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_stroke.call(this, tcid, sid, pPacket, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke)
    end
    def append_packets(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, cPktBuffLength : UInt32, pPackets : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append_packets.call(this, tcid, sid, cPktBuffLength, pPackets)
    end
    def end_stroke(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, ppIInkStroke : Void**, pDirtyRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_stroke.call(this, tcid, sid, ppIInkStroke, pDirtyRect)
    end
    def get_Ink(this : IStrokeBuilder*, ppiInkObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ink.call(this, ppiInkObj)
    end
    def putref_Ink(this : IStrokeBuilder*, piInkObj : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Ink.call(this, piInkObj)
    end

  end

  @[Extern]
  record IStylusPluginVtbl,
    query_interface : Proc(IStylusPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStylusPlugin*, UInt32),
    release : Proc(IStylusPlugin*, UInt32),
    real_time_stylus_enabled : Proc(IStylusPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    real_time_stylus_disabled : Proc(IStylusPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    stylus_in_range : Proc(IStylusPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_out_of_range : Proc(IStylusPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_down : Proc(IStylusPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_up : Proc(IStylusPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_button_down : Proc(IStylusPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    stylus_button_up : Proc(IStylusPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    in_air_packets : Proc(IStylusPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    packets : Proc(IStylusPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    custom_stylus_data_added : Proc(IStylusPlugin*, Void*, LibC::GUID*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    system_event : Proc(IStylusPlugin*, Void*, UInt32, UInt32, UInt16, Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA, Win32cr::Foundation::HRESULT),
    tablet_added : Proc(IStylusPlugin*, Void*, Void*, Win32cr::Foundation::HRESULT),
    tablet_removed : Proc(IStylusPlugin*, Void*, Int32, Win32cr::Foundation::HRESULT),
    error : Proc(IStylusPlugin*, Void*, Void*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest, Win32cr::Foundation::HRESULT, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    update_mapping : Proc(IStylusPlugin*, Void*, Win32cr::Foundation::HRESULT),
    data_interest : Proc(IStylusPlugin*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a81436d8-4757-4fd1-a185-133f97c6c545")]
  record IStylusPlugin, lpVtbl : IStylusPluginVtbl* do
    GUID = LibC::GUID.new(0xa81436d8_u32, 0x4757_u16, 0x4fd1_u16, StaticArray[0xa1_u8, 0x85_u8, 0x13_u8, 0x3f_u8, 0x97_u8, 0xc6_u8, 0xc5_u8, 0x45_u8])
    def query_interface(this : IStylusPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStylusPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStylusPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def real_time_stylus_enabled(this : IStylusPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_enabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def real_time_stylus_disabled(this : IStylusPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_disabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def stylus_in_range(this : IStylusPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_in_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_out_of_range(this : IStylusPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_out_of_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_down(this : IStylusPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_down.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_up(this : IStylusPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_up.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_button_down(this : IStylusPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_down.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def stylus_button_up(this : IStylusPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_up.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def in_air_packets(this : IStylusPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_air_packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def packets(this : IStylusPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def custom_stylus_data_added(this : IStylusPlugin*, piRtsSrc : Void*, pGuidId : LibC::GUID*, cbData : UInt32, pbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.custom_stylus_data_added.call(this, piRtsSrc, pGuidId, cbData, pbData)
    end
    def system_event(this : IStylusPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.system_event.call(this, piRtsSrc, tcid, sid, event, eventdata)
    end
    def tablet_added(this : IStylusPlugin*, piRtsSrc : Void*, piTablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_added.call(this, piRtsSrc, piTablet)
    end
    def tablet_removed(this : IStylusPlugin*, piRtsSrc : Void*, iTabletIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_removed.call(this, piRtsSrc, iTabletIndex)
    end
    def error(this : IStylusPlugin*, piRtsSrc : Void*, piPlugin : Void*, dataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest, hrErrorCode : Win32cr::Foundation::HRESULT, lptrKey : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.error.call(this, piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey)
    end
    def update_mapping(this : IStylusPlugin*, piRtsSrc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_mapping.call(this, piRtsSrc)
    end
    def data_interest(this : IStylusPlugin*, pDataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_interest.call(this, pDataInterest)
    end

  end

  @[Extern]
  record IStylusSyncPluginVtbl,
    query_interface : Proc(IStylusSyncPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStylusSyncPlugin*, UInt32),
    release : Proc(IStylusSyncPlugin*, UInt32),
    real_time_stylus_enabled : Proc(IStylusSyncPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    real_time_stylus_disabled : Proc(IStylusSyncPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    stylus_in_range : Proc(IStylusSyncPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_out_of_range : Proc(IStylusSyncPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_down : Proc(IStylusSyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_up : Proc(IStylusSyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_button_down : Proc(IStylusSyncPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    stylus_button_up : Proc(IStylusSyncPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    in_air_packets : Proc(IStylusSyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    packets : Proc(IStylusSyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    custom_stylus_data_added : Proc(IStylusSyncPlugin*, Void*, LibC::GUID*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    system_event : Proc(IStylusSyncPlugin*, Void*, UInt32, UInt32, UInt16, Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA, Win32cr::Foundation::HRESULT),
    tablet_added : Proc(IStylusSyncPlugin*, Void*, Void*, Win32cr::Foundation::HRESULT),
    tablet_removed : Proc(IStylusSyncPlugin*, Void*, Int32, Win32cr::Foundation::HRESULT),
    error : Proc(IStylusSyncPlugin*, Void*, Void*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest, Win32cr::Foundation::HRESULT, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    update_mapping : Proc(IStylusSyncPlugin*, Void*, Win32cr::Foundation::HRESULT),
    data_interest : Proc(IStylusSyncPlugin*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a157b174-482f-4d71-a3f6-3a41ddd11be9")]
  record IStylusSyncPlugin, lpVtbl : IStylusSyncPluginVtbl* do
    GUID = LibC::GUID.new(0xa157b174_u32, 0x482f_u16, 0x4d71_u16, StaticArray[0xa3_u8, 0xf6_u8, 0x3a_u8, 0x41_u8, 0xdd_u8, 0xd1_u8, 0x1b_u8, 0xe9_u8])
    def query_interface(this : IStylusSyncPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStylusSyncPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStylusSyncPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def real_time_stylus_enabled(this : IStylusSyncPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_enabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def real_time_stylus_disabled(this : IStylusSyncPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_disabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def stylus_in_range(this : IStylusSyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_in_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_out_of_range(this : IStylusSyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_out_of_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_down(this : IStylusSyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_down.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_up(this : IStylusSyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_up.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_button_down(this : IStylusSyncPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_down.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def stylus_button_up(this : IStylusSyncPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_up.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def in_air_packets(this : IStylusSyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_air_packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def packets(this : IStylusSyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def custom_stylus_data_added(this : IStylusSyncPlugin*, piRtsSrc : Void*, pGuidId : LibC::GUID*, cbData : UInt32, pbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.custom_stylus_data_added.call(this, piRtsSrc, pGuidId, cbData, pbData)
    end
    def system_event(this : IStylusSyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.system_event.call(this, piRtsSrc, tcid, sid, event, eventdata)
    end
    def tablet_added(this : IStylusSyncPlugin*, piRtsSrc : Void*, piTablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_added.call(this, piRtsSrc, piTablet)
    end
    def tablet_removed(this : IStylusSyncPlugin*, piRtsSrc : Void*, iTabletIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_removed.call(this, piRtsSrc, iTabletIndex)
    end
    def error(this : IStylusSyncPlugin*, piRtsSrc : Void*, piPlugin : Void*, dataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest, hrErrorCode : Win32cr::Foundation::HRESULT, lptrKey : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.error.call(this, piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey)
    end
    def update_mapping(this : IStylusSyncPlugin*, piRtsSrc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_mapping.call(this, piRtsSrc)
    end
    def data_interest(this : IStylusSyncPlugin*, pDataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_interest.call(this, pDataInterest)
    end

  end

  @[Extern]
  record IStylusAsyncPluginVtbl,
    query_interface : Proc(IStylusAsyncPlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStylusAsyncPlugin*, UInt32),
    release : Proc(IStylusAsyncPlugin*, UInt32),
    real_time_stylus_enabled : Proc(IStylusAsyncPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    real_time_stylus_disabled : Proc(IStylusAsyncPlugin*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    stylus_in_range : Proc(IStylusAsyncPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_out_of_range : Proc(IStylusAsyncPlugin*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stylus_down : Proc(IStylusAsyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_up : Proc(IStylusAsyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, Int32*, Int32**, Win32cr::Foundation::HRESULT),
    stylus_button_down : Proc(IStylusAsyncPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    stylus_button_up : Proc(IStylusAsyncPlugin*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    in_air_packets : Proc(IStylusAsyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    packets : Proc(IStylusAsyncPlugin*, Void*, Win32cr::UI::TabletPC::StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, Win32cr::Foundation::HRESULT),
    custom_stylus_data_added : Proc(IStylusAsyncPlugin*, Void*, LibC::GUID*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    system_event : Proc(IStylusAsyncPlugin*, Void*, UInt32, UInt32, UInt16, Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA, Win32cr::Foundation::HRESULT),
    tablet_added : Proc(IStylusAsyncPlugin*, Void*, Void*, Win32cr::Foundation::HRESULT),
    tablet_removed : Proc(IStylusAsyncPlugin*, Void*, Int32, Win32cr::Foundation::HRESULT),
    error : Proc(IStylusAsyncPlugin*, Void*, Void*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest, Win32cr::Foundation::HRESULT, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    update_mapping : Proc(IStylusAsyncPlugin*, Void*, Win32cr::Foundation::HRESULT),
    data_interest : Proc(IStylusAsyncPlugin*, Win32cr::UI::TabletPC::RealTimeStylusDataInterest*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7cca85a-31bc-4cd2-aadc-3289a3af11c8")]
  record IStylusAsyncPlugin, lpVtbl : IStylusAsyncPluginVtbl* do
    GUID = LibC::GUID.new(0xa7cca85a_u32, 0x31bc_u16, 0x4cd2_u16, StaticArray[0xaa_u8, 0xdc_u8, 0x32_u8, 0x89_u8, 0xa3_u8, 0xaf_u8, 0x11_u8, 0xc8_u8])
    def query_interface(this : IStylusAsyncPlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStylusAsyncPlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStylusAsyncPlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def real_time_stylus_enabled(this : IStylusAsyncPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_enabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def real_time_stylus_disabled(this : IStylusAsyncPlugin*, piRtsSrc : Void*, cTcidCount : UInt32, pTcids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.real_time_stylus_disabled.call(this, piRtsSrc, cTcidCount, pTcids)
    end
    def stylus_in_range(this : IStylusAsyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_in_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_out_of_range(this : IStylusAsyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_out_of_range.call(this, piRtsSrc, tcid, sid)
    end
    def stylus_down(this : IStylusAsyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_down.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_up(this : IStylusAsyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPropCountPerPkt : UInt32, pPacket : Int32*, ppInOutPkt : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_up.call(this, piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt)
    end
    def stylus_button_down(this : IStylusAsyncPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_down.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def stylus_button_up(this : IStylusAsyncPlugin*, piRtsSrc : Void*, sid : UInt32, pGuidStylusButton : LibC::GUID*, pStylusPos : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stylus_button_up.call(this, piRtsSrc, sid, pGuidStylusButton, pStylusPos)
    end
    def in_air_packets(this : IStylusAsyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_air_packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def packets(this : IStylusAsyncPlugin*, piRtsSrc : Void*, pStylusInfo : Win32cr::UI::TabletPC::StylusInfo*, cPktCount : UInt32, cPktBuffLength : UInt32, pPackets : Int32*, pcInOutPkts : UInt32*, ppInOutPkts : Int32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.packets.call(this, piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts)
    end
    def custom_stylus_data_added(this : IStylusAsyncPlugin*, piRtsSrc : Void*, pGuidId : LibC::GUID*, cbData : UInt32, pbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.custom_stylus_data_added.call(this, piRtsSrc, pGuidId, cbData, pbData)
    end
    def system_event(this : IStylusAsyncPlugin*, piRtsSrc : Void*, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : Win32cr::UI::TabletPC::SYSTEM_EVENT_DATA) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.system_event.call(this, piRtsSrc, tcid, sid, event, eventdata)
    end
    def tablet_added(this : IStylusAsyncPlugin*, piRtsSrc : Void*, piTablet : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_added.call(this, piRtsSrc, piTablet)
    end
    def tablet_removed(this : IStylusAsyncPlugin*, piRtsSrc : Void*, iTabletIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tablet_removed.call(this, piRtsSrc, iTabletIndex)
    end
    def error(this : IStylusAsyncPlugin*, piRtsSrc : Void*, piPlugin : Void*, dataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest, hrErrorCode : Win32cr::Foundation::HRESULT, lptrKey : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.error.call(this, piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey)
    end
    def update_mapping(this : IStylusAsyncPlugin*, piRtsSrc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_mapping.call(this, piRtsSrc)
    end
    def data_interest(this : IStylusAsyncPlugin*, pDataInterest : Win32cr::UI::TabletPC::RealTimeStylusDataInterest*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_interest.call(this, pDataInterest)
    end

  end

  @[Extern]
  record IDynamicRendererVtbl,
    query_interface : Proc(IDynamicRenderer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDynamicRenderer*, UInt32),
    release : Proc(IDynamicRenderer*, UInt32),
    get_Enabled : Proc(IDynamicRenderer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IDynamicRenderer*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_HWND : Proc(IDynamicRenderer*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    put_HWND : Proc(IDynamicRenderer*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    get_ClipRectangle : Proc(IDynamicRenderer*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    put_ClipRectangle : Proc(IDynamicRenderer*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_ClipRegion : Proc(IDynamicRenderer*, Win32cr::Foundation::HANDLE_PTR*, Win32cr::Foundation::HRESULT),
    put_ClipRegion : Proc(IDynamicRenderer*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT),
    get_DrawingAttributes : Proc(IDynamicRenderer*, Void**, Win32cr::Foundation::HRESULT),
    putref_DrawingAttributes : Proc(IDynamicRenderer*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCacheEnabled : Proc(IDynamicRenderer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_DataCacheEnabled : Proc(IDynamicRenderer*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_cached_data : Proc(IDynamicRenderer*, UInt32, Win32cr::Foundation::HRESULT),
    refresh : Proc(IDynamicRenderer*, Win32cr::Foundation::HRESULT),
    draw : Proc(IDynamicRenderer*, Win32cr::Foundation::HANDLE_PTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a079468e-7165-46f9-b7af-98ad01a93009")]
  record IDynamicRenderer, lpVtbl : IDynamicRendererVtbl* do
    GUID = LibC::GUID.new(0xa079468e_u32, 0x7165_u16, 0x46f9_u16, StaticArray[0xb7_u8, 0xaf_u8, 0x98_u8, 0xad_u8, 0x1_u8, 0xa9_u8, 0x30_u8, 0x9_u8])
    def query_interface(this : IDynamicRenderer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDynamicRenderer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDynamicRenderer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Enabled(this : IDynamicRenderer*, bEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, bEnabled)
    end
    def put_Enabled(this : IDynamicRenderer*, bEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, bEnabled)
    end
    def get_HWND(this : IDynamicRenderer*, hwnd : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HWND.call(this, hwnd)
    end
    def put_HWND(this : IDynamicRenderer*, hwnd : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HWND.call(this, hwnd)
    end
    def get_ClipRectangle(this : IDynamicRenderer*, prcClipRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClipRectangle.call(this, prcClipRect)
    end
    def put_ClipRectangle(this : IDynamicRenderer*, prcClipRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClipRectangle.call(this, prcClipRect)
    end
    def get_ClipRegion(this : IDynamicRenderer*, phClipRgn : Win32cr::Foundation::HANDLE_PTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClipRegion.call(this, phClipRgn)
    end
    def put_ClipRegion(this : IDynamicRenderer*, hClipRgn : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClipRegion.call(this, hClipRgn)
    end
    def get_DrawingAttributes(this : IDynamicRenderer*, ppiDA : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DrawingAttributes.call(this, ppiDA)
    end
    def putref_DrawingAttributes(this : IDynamicRenderer*, piDA : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_DrawingAttributes.call(this, piDA)
    end
    def get_DataCacheEnabled(this : IDynamicRenderer*, pfCacheData : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCacheEnabled.call(this, pfCacheData)
    end
    def put_DataCacheEnabled(this : IDynamicRenderer*, fCacheData : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCacheEnabled.call(this, fCacheData)
    end
    def release_cached_data(this : IDynamicRenderer*, strokeId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_cached_data.call(this, strokeId)
    end
    def refresh(this : IDynamicRenderer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def draw(this : IDynamicRenderer*, hDC : Win32cr::Foundation::HANDLE_PTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw.call(this, hDC)
    end

  end

  @[Extern]
  record IGestureRecognizerVtbl,
    query_interface : Proc(IGestureRecognizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGestureRecognizer*, UInt32),
    release : Proc(IGestureRecognizer*, UInt32),
    get_Enabled : Proc(IGestureRecognizer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IGestureRecognizer*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_MaxStrokeCount : Proc(IGestureRecognizer*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxStrokeCount : Proc(IGestureRecognizer*, Int32, Win32cr::Foundation::HRESULT),
    enable_gestures : Proc(IGestureRecognizer*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IGestureRecognizer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ae9ef86b-7054-45e3-ae22-3174dc8811b7")]
  record IGestureRecognizer, lpVtbl : IGestureRecognizerVtbl* do
    GUID = LibC::GUID.new(0xae9ef86b_u32, 0x7054_u16, 0x45e3_u16, StaticArray[0xae_u8, 0x22_u8, 0x31_u8, 0x74_u8, 0xdc_u8, 0x88_u8, 0x11_u8, 0xb7_u8])
    def query_interface(this : IGestureRecognizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGestureRecognizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGestureRecognizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Enabled(this : IGestureRecognizer*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pfEnabled)
    end
    def put_Enabled(this : IGestureRecognizer*, fEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, fEnabled)
    end
    def get_MaxStrokeCount(this : IGestureRecognizer*, pcStrokes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxStrokeCount.call(this, pcStrokes)
    end
    def put_MaxStrokeCount(this : IGestureRecognizer*, cStrokes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxStrokeCount.call(this, cStrokes)
    end
    def enable_gestures(this : IGestureRecognizer*, cGestures : UInt32, pGestures : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_gestures.call(this, cGestures, pGestures)
    end
    def reset(this : IGestureRecognizer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ITipAutoCompleteProviderVtbl,
    query_interface : Proc(ITipAutoCompleteProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITipAutoCompleteProvider*, UInt32),
    release : Proc(ITipAutoCompleteProvider*, UInt32),
    update_pending_text : Proc(ITipAutoCompleteProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    show : Proc(ITipAutoCompleteProvider*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7c6cf46d-8404-46b9-ad33-f5b6036d4007")]
  record ITipAutoCompleteProvider, lpVtbl : ITipAutoCompleteProviderVtbl* do
    GUID = LibC::GUID.new(0x7c6cf46d_u32, 0x8404_u16, 0x46b9_u16, StaticArray[0xad_u8, 0x33_u8, 0xf5_u8, 0xb6_u8, 0x3_u8, 0x6d_u8, 0x40_u8, 0x7_u8])
    def query_interface(this : ITipAutoCompleteProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITipAutoCompleteProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITipAutoCompleteProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def update_pending_text(this : ITipAutoCompleteProvider*, bstrPendingText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_pending_text.call(this, bstrPendingText)
    end
    def show(this : ITipAutoCompleteProvider*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end

  end

  @[Extern]
  record ITipAutoCompleteClientVtbl,
    query_interface : Proc(ITipAutoCompleteClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITipAutoCompleteClient*, UInt32),
    release : Proc(ITipAutoCompleteClient*, UInt32),
    advise_provider : Proc(ITipAutoCompleteClient*, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::HRESULT),
    unadvise_provider : Proc(ITipAutoCompleteClient*, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::HRESULT),
    user_selection : Proc(ITipAutoCompleteClient*, Win32cr::Foundation::HRESULT),
    preferred_rects : Proc(ITipAutoCompleteClient*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    request_show_ui : Proc(ITipAutoCompleteClient*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5e078e03-8265-4bbe-9487-d242edbef910")]
  record ITipAutoCompleteClient, lpVtbl : ITipAutoCompleteClientVtbl* do
    GUID = LibC::GUID.new(0x5e078e03_u32, 0x8265_u16, 0x4bbe_u16, StaticArray[0x94_u8, 0x87_u8, 0xd2_u8, 0x42_u8, 0xed_u8, 0xbe_u8, 0xf9_u8, 0x10_u8])
    def query_interface(this : ITipAutoCompleteClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITipAutoCompleteClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITipAutoCompleteClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_provider(this : ITipAutoCompleteClient*, hWndField : Win32cr::Foundation::HWND, pIProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_provider.call(this, hWndField, pIProvider)
    end
    def unadvise_provider(this : ITipAutoCompleteClient*, hWndField : Win32cr::Foundation::HWND, pIProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_provider.call(this, hWndField, pIProvider)
    end
    def user_selection(this : ITipAutoCompleteClient*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.user_selection.call(this)
    end
    def preferred_rects(this : ITipAutoCompleteClient*, prcACList : Win32cr::Foundation::RECT*, prcField : Win32cr::Foundation::RECT*, prcModifiedACList : Win32cr::Foundation::RECT*, pfShownAboveTip : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preferred_rects.call(this, prcACList, prcField, prcModifiedACList, pfShownAboveTip)
    end
    def request_show_ui(this : ITipAutoCompleteClient*, hWndList : Win32cr::Foundation::HWND, pfAllowShowing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_show_ui.call(this, hWndList, pfAllowShowing)
    end

  end

  @[Link("inkobjcore")]
  lib C
    fun CreateRecognizer(pCLSID : LibC::GUID*, phrec : Win32cr::UI::TabletPC::HRECOGNIZER*) : Win32cr::Foundation::HRESULT

    fun DestroyRecognizer(hrec : Win32cr::UI::TabletPC::HRECOGNIZER) : Win32cr::Foundation::HRESULT

    fun GetRecoAttributes(hrec : Win32cr::UI::TabletPC::HRECOGNIZER, pRecoAttrs : Win32cr::UI::TabletPC::RECO_ATTRS*) : Win32cr::Foundation::HRESULT

    fun CreateContext(hrec : Win32cr::UI::TabletPC::HRECOGNIZER, phrc : Win32cr::UI::TabletPC::HRECOCONTEXT*) : Win32cr::Foundation::HRESULT

    fun DestroyContext(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT) : Win32cr::Foundation::HRESULT

    fun GetResultPropertyList(hrec : Win32cr::UI::TabletPC::HRECOGNIZER, pPropertyCount : UInt32*, pPropertyGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun GetUnicodeRanges(hrec : Win32cr::UI::TabletPC::HRECOGNIZER, pcRanges : UInt32*, pcr : Win32cr::UI::TabletPC::CHARACTER_RANGE*) : Win32cr::Foundation::HRESULT

    fun AddStroke(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pPacketDesc : Win32cr::UI::TabletPC::PACKET_DESCRIPTION*, cbPacket : UInt32, pPacket : UInt8*, pXForm : Win32cr::Graphics::Gdi::XFORM*) : Win32cr::Foundation::HRESULT

    fun GetBestResultString(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pcSize : UInt32*, pwcBestResult : UInt16*) : Win32cr::Foundation::HRESULT

    fun SetGuide(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pGuide : Win32cr::UI::TabletPC::RECO_GUIDE*, iIndex : UInt32) : Win32cr::Foundation::HRESULT

    fun AdviseInkChange(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, bNewStroke : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun EndInkInput(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT) : Win32cr::Foundation::HRESULT

    fun Process(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pbPartialProcessing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun SetFactoid(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, cwcFactoid : UInt32, pwcFactoid : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SetFlags(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    fun GetLatticePtr(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, ppLattice : Win32cr::UI::TabletPC::RECO_LATTICE**) : Win32cr::Foundation::HRESULT

    fun SetTextContext(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, cwcBefore : UInt32, pwcBefore : UInt16*, cwcAfter : UInt32, pwcAfter : UInt16*) : Win32cr::Foundation::HRESULT

    fun SetEnabledUnicodeRanges(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, cRanges : UInt32, pcr : Win32cr::UI::TabletPC::CHARACTER_RANGE*) : Win32cr::Foundation::HRESULT

    fun IsStringSupported(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, wcString : UInt32, pwcString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SetWordList(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, hwl : Win32cr::UI::TabletPC::HRECOWORDLIST) : Win32cr::Foundation::HRESULT

    fun GetRightSeparator(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pcSize : UInt32*, pwcRightSeparator : UInt16*) : Win32cr::Foundation::HRESULT

    fun GetLeftSeparator(hrc : Win32cr::UI::TabletPC::HRECOCONTEXT, pcSize : UInt32*, pwcLeftSeparator : UInt16*) : Win32cr::Foundation::HRESULT

    fun DestroyWordList(hwl : Win32cr::UI::TabletPC::HRECOWORDLIST) : Win32cr::Foundation::HRESULT

    fun AddWordsToWordList(hwl : Win32cr::UI::TabletPC::HRECOWORDLIST, pwcWords : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun MakeWordList(hrec : Win32cr::UI::TabletPC::HRECOGNIZER, pBuffer : Win32cr::Foundation::PWSTR, phwl : Win32cr::UI::TabletPC::HRECOWORDLIST*) : Win32cr::Foundation::HRESULT

    fun GetAllRecognizers(recognizerClsids : LibC::GUID**, count : UInt32*) : Win32cr::Foundation::HRESULT

    fun LoadCachedAttributes(clsid : LibC::GUID, pRecoAttributes : Win32cr::UI::TabletPC::RECO_ATTRS*) : Win32cr::Foundation::HRESULT

  end
end