require "../foundation.cr"
require "../system/com.cr"
require "../graphics/gdi.cr"
require "../system/ole.cr"
require "../ui/controls.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:inkobjcore.dll")]
{% else %}
@[Link("inkobjcore")]
{% end %}
lib LibWin32
  alias HRECOALT = LibC::IntPtrT
  alias HRECOCONTEXT = LibC::IntPtrT
  alias HRECOGNIZER = LibC::IntPtrT
  alias HRECOLATTICE = LibC::IntPtrT
  alias HRECOWORDLIST = LibC::IntPtrT

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

  alias PfnRecoCallback = Proc(UInt32, UInt8*, HRECOCONTEXT, HRESULT)


  enum PROPERTY_UNITS : Int32
    PROPERTY_UNITS_DEFAULT = 0
    PROPERTY_UNITS_INCHES = 1
    PROPERTY_UNITS_CENTIMETERS = 2
    PROPERTY_UNITS_DEGREES = 3
    PROPERTY_UNITS_RADIANS = 4
    PROPERTY_UNITS_SECONDS = 5
    PROPERTY_UNITS_POUNDS = 6
    PROPERTY_UNITS_GRAMS = 7
    PROPERTY_UNITS_SILINEAR = 8
    PROPERTY_UNITS_SIROTATION = 9
    PROPERTY_UNITS_ENGLINEAR = 10
    PROPERTY_UNITS_ENGROTATION = 11
    PROPERTY_UNITS_SLUGS = 12
    PROPERTY_UNITS_KELVIN = 13
    PROPERTY_UNITS_FAHRENHEIT = 14
    PROPERTY_UNITS_AMPERE = 15
    PROPERTY_UNITS_CANDELA = 16
  end

  enum Enuminkmetric_flags : Int32
    IMF_FONT_SELECTED_IN_HDC = 1
    IMF_ITALIC = 2
    IMF_BOLD = 4
  end

  enum Enumgetcandidateflags : Int32
    TCF_ALLOW_RECOGNITION = 1
    TCF_FORCE_RECOGNITION = 2
  end

  enum InkSelectionConstants : Int32
    ISC_FirstElement = 0
    ISC_AllElements = -1
  end

  enum InkBoundingBoxMode : Int32
    IBBM_Default = 0
    IBBM_NoCurveFit = 1
    IBBM_CurveFit = 2
    IBBM_PointsOnly = 3
    IBBM_Union = 4
  end

  enum InkExtractFlags : Int32
    IEF_CopyFromOriginal = 0
    IEF_RemoveFromOriginal = 1
    IEF_Default = 1
  end

  enum InkPersistenceFormat : Int32
    IPF_InkSerializedFormat = 0
    IPF_Base64InkSerializedFormat = 1
    IPF_GIF = 2
    IPF_Base64GIF = 3
  end

  enum InkPersistenceCompressionMode : Int32
    IPCM_Default = 0
    IPCM_MaximumCompression = 1
    IPCM_NoCompression = 2
  end

  enum InkPenTip : Int32
    IPT_Ball = 0
    IPT_Rectangle = 1
  end

  enum InkRasterOperation : Int32
    IRO_Black = 1
    IRO_NotMergePen = 2
    IRO_MaskNotPen = 3
    IRO_NotCopyPen = 4
    IRO_MaskPenNot = 5
    IRO_Not = 6
    IRO_XOrPen = 7
    IRO_NotMaskPen = 8
    IRO_MaskPen = 9
    IRO_NotXOrPen = 10
    IRO_NoOperation = 11
    IRO_MergeNotPen = 12
    IRO_CopyPen = 13
    IRO_MergePenNot = 14
    IRO_MergePen = 15
    IRO_White = 16
  end

  enum InkMousePointer : Int32
    IMP_Default = 0
    IMP_Arrow = 1
    IMP_Crosshair = 2
    IMP_Ibeam = 3
    IMP_SizeNESW = 4
    IMP_SizeNS = 5
    IMP_SizeNWSE = 6
    IMP_SizeWE = 7
    IMP_UpArrow = 8
    IMP_Hourglass = 9
    IMP_NoDrop = 10
    IMP_ArrowHourglass = 11
    IMP_ArrowQuestion = 12
    IMP_SizeAll = 13
    IMP_Hand = 14
    IMP_Custom = 99
  end

  enum InkClipboardModes : Int32
    ICB_Copy = 0
    ICB_Cut = 1
    ICB_ExtractOnly = 48
    ICB_DelayedCopy = 32
    ICB_Default = 0
  end

  enum InkClipboardFormats : Int32
    ICF_None = 0
    ICF_InkSerializedFormat = 1
    ICF_SketchInk = 2
    ICF_TextInk = 6
    ICF_EnhancedMetafile = 8
    ICF_Metafile = 32
    ICF_Bitmap = 64
    ICF_PasteMask = 7
    ICF_CopyMask = 127
    ICF_Default = 127
  end

  enum SelectionHitResult : Int32
    SHR_None = 0
    SHR_NW = 1
    SHR_SE = 2
    SHR_NE = 3
    SHR_SW = 4
    SHR_E = 5
    SHR_W = 6
    SHR_N = 7
    SHR_S = 8
    SHR_Selection = 9
  end

  enum InkRecognitionStatus : Int32
    IRS_NoError = 0
    IRS_Interrupted = 1
    IRS_ProcessFailed = 2
    IRS_InkAddedFailed = 4
    IRS_SetAutoCompletionModeFailed = 8
    IRS_SetStrokesFailed = 16
    IRS_SetGuideFailed = 32
    IRS_SetFlagsFailed = 64
    IRS_SetFactoidFailed = 128
    IRS_SetPrefixSuffixFailed = 256
    IRS_SetWordListFailed = 512
  end

  enum DISPID_InkRectangle : Int32
    DISPID_IRTop = 1
    DISPID_IRLeft = 2
    DISPID_IRBottom = 3
    DISPID_IRRight = 4
    DISPID_IRGetRectangle = 5
    DISPID_IRSetRectangle = 6
    DISPID_IRData = 7
  end

  enum DISPID_InkExtendedProperty : Int32
    DISPID_IEPGuid = 1
    DISPID_IEPData = 2
  end

  enum DISPID_InkExtendedProperties : Int32
    DISPID_IEPs_NewEnum = -4
    DISPID_IEPsItem = 0
    DISPID_IEPsCount = 1
    DISPID_IEPsAdd = 2
    DISPID_IEPsRemove = 3
    DISPID_IEPsClear = 4
    DISPID_IEPsDoesPropertyExist = 5
  end

  enum DISPID_InkDrawingAttributes : Int32
    DISPID_DAHeight = 1
    DISPID_DAColor = 2
    DISPID_DAWidth = 3
    DISPID_DAFitToCurve = 4
    DISPID_DAIgnorePressure = 5
    DISPID_DAAntiAliased = 6
    DISPID_DATransparency = 7
    DISPID_DARasterOperation = 8
    DISPID_DAPenTip = 9
    DISPID_DAClone = 10
    DISPID_DAExtendedProperties = 11
  end

  enum DISPID_InkTransform : Int32
    DISPID_ITReset = 1
    DISPID_ITTranslate = 2
    DISPID_ITRotate = 3
    DISPID_ITReflect = 4
    DISPID_ITShear = 5
    DISPID_ITScale = 6
    DISPID_ITeM11 = 7
    DISPID_ITeM12 = 8
    DISPID_ITeM21 = 9
    DISPID_ITeM22 = 10
    DISPID_ITeDx = 11
    DISPID_ITeDy = 12
    DISPID_ITGetTransform = 13
    DISPID_ITSetTransform = 14
    DISPID_ITData = 15
  end

  enum InkApplicationGesture : Int32
    IAG_AllGestures = 0
    IAG_NoGesture = 61440
    IAG_Scratchout = 61441
    IAG_Triangle = 61442
    IAG_Square = 61443
    IAG_Star = 61444
    IAG_Check = 61445
    IAG_Curlicue = 61456
    IAG_DoubleCurlicue = 61457
    IAG_Circle = 61472
    IAG_DoubleCircle = 61473
    IAG_SemiCircleLeft = 61480
    IAG_SemiCircleRight = 61481
    IAG_ChevronUp = 61488
    IAG_ChevronDown = 61489
    IAG_ChevronLeft = 61490
    IAG_ChevronRight = 61491
    IAG_ArrowUp = 61496
    IAG_ArrowDown = 61497
    IAG_ArrowLeft = 61498
    IAG_ArrowRight = 61499
    IAG_Up = 61528
    IAG_Down = 61529
    IAG_Left = 61530
    IAG_Right = 61531
    IAG_UpDown = 61536
    IAG_DownUp = 61537
    IAG_LeftRight = 61538
    IAG_RightLeft = 61539
    IAG_UpLeftLong = 61540
    IAG_UpRightLong = 61541
    IAG_DownLeftLong = 61542
    IAG_DownRightLong = 61543
    IAG_UpLeft = 61544
    IAG_UpRight = 61545
    IAG_DownLeft = 61546
    IAG_DownRight = 61547
    IAG_LeftUp = 61548
    IAG_LeftDown = 61549
    IAG_RightUp = 61550
    IAG_RightDown = 61551
    IAG_Exclamation = 61604
    IAG_Tap = 61680
    IAG_DoubleTap = 61681
  end

  enum InkSystemGesture : Int32
    ISG_Tap = 16
    ISG_DoubleTap = 17
    ISG_RightTap = 18
    ISG_Drag = 19
    ISG_RightDrag = 20
    ISG_HoldEnter = 21
    ISG_HoldLeave = 22
    ISG_HoverEnter = 23
    ISG_HoverLeave = 24
    ISG_Flick = 31
  end

  enum InkRecognitionConfidence : Int32
    IRC_Strong = 0
    IRC_Intermediate = 1
    IRC_Poor = 2
  end

  enum DISPID_InkGesture : Int32
    DISPID_IGId = 0
    DISPID_IGGetHotPoint = 1
    DISPID_IGConfidence = 2
  end

  enum DISPID_InkCursor : Int32
    DISPID_ICsrName = 0
    DISPID_ICsrId = 1
    DISPID_ICsrDrawingAttributes = 2
    DISPID_ICsrButtons = 3
    DISPID_ICsrInverted = 4
    DISPID_ICsrTablet = 5
  end

  enum DISPID_InkCursors : Int32
    DISPID_ICs_NewEnum = -4
    DISPID_ICsItem = 0
    DISPID_ICsCount = 1
  end

  enum InkCursorButtonState : Int32
    ICBS_Unavailable = 0
    ICBS_Up = 1
    ICBS_Down = 2
  end

  enum DISPID_InkCursorButton : Int32
    DISPID_ICBName = 0
    DISPID_ICBId = 1
    DISPID_ICBState = 2
  end

  enum DISPID_InkCursorButtons : Int32
    DISPID_ICBs_NewEnum = -4
    DISPID_ICBsItem = 0
    DISPID_ICBsCount = 1
  end

  enum TabletHardwareCapabilities : Int32
    THWC_Integrated = 1
    THWC_CursorMustTouch = 2
    THWC_HardProximity = 4
    THWC_CursorsHavePhysicalIds = 8
  end

  enum TabletPropertyMetricUnit : Int32
    TPMU_Default = 0
    TPMU_Inches = 1
    TPMU_Centimeters = 2
    TPMU_Degrees = 3
    TPMU_Radians = 4
    TPMU_Seconds = 5
    TPMU_Pounds = 6
    TPMU_Grams = 7
  end

  enum DISPID_InkTablet : Int32
    DISPID_ITName = 0
    DISPID_ITPlugAndPlayId = 1
    DISPID_ITPropertyMetrics = 2
    DISPID_ITIsPacketPropertySupported = 3
    DISPID_ITMaximumInputRectangle = 4
    DISPID_ITHardwareCapabilities = 5
  end

  enum TabletDeviceKind : Int32
    TDK_Mouse = 0
    TDK_Pen = 1
    TDK_Touch = 2
  end

  enum DISPID_InkTablet2 : Int32
    DISPID_IT2DeviceKind = 0
  end

  enum DISPID_InkTablet3 : Int32
    DISPID_IT3IsMultiTouch = 0
    DISPID_IT3MaximumCursors = 1
  end

  enum DISPID_InkTablets : Int32
    DISPID_ITs_NewEnum = -4
    DISPID_ITsItem = 0
    DISPID_ITsDefaultTablet = 1
    DISPID_ITsCount = 2
    DISPID_ITsIsPacketPropertySupported = 3
  end

  enum DISPID_InkStrokeDisp : Int32
    DISPID_ISDInkIndex = 1
    DISPID_ISDID = 2
    DISPID_ISDGetBoundingBox = 3
    DISPID_ISDDrawingAttributes = 4
    DISPID_ISDFindIntersections = 5
    DISPID_ISDGetRectangleIntersections = 6
    DISPID_ISDClip = 7
    DISPID_ISDHitTestCircle = 8
    DISPID_ISDNearestPoint = 9
    DISPID_ISDSplit = 10
    DISPID_ISDExtendedProperties = 11
    DISPID_ISDInk = 12
    DISPID_ISDBezierPoints = 13
    DISPID_ISDPolylineCusps = 14
    DISPID_ISDBezierCusps = 15
    DISPID_ISDSelfIntersections = 16
    DISPID_ISDPacketCount = 17
    DISPID_ISDPacketSize = 18
    DISPID_ISDPacketDescription = 19
    DISPID_ISDDeleted = 20
    DISPID_ISDGetPacketDescriptionPropertyMetrics = 21
    DISPID_ISDGetPoints = 22
    DISPID_ISDSetPoints = 23
    DISPID_ISDGetPacketData = 24
    DISPID_ISDGetPacketValuesByProperty = 25
    DISPID_ISDSetPacketValuesByProperty = 26
    DISPID_ISDGetFlattenedBezierPoints = 27
    DISPID_ISDScaleToRectangle = 28
    DISPID_ISDTransform = 29
    DISPID_ISDMove = 30
    DISPID_ISDRotate = 31
    DISPID_ISDShear = 32
    DISPID_ISDScale = 33
  end

  enum DISPID_InkStrokes : Int32
    DISPID_ISs_NewEnum = -4
    DISPID_ISsItem = 0
    DISPID_ISsCount = 1
    DISPID_ISsValid = 2
    DISPID_ISsInk = 3
    DISPID_ISsAdd = 4
    DISPID_ISsAddStrokes = 5
    DISPID_ISsRemove = 6
    DISPID_ISsRemoveStrokes = 7
    DISPID_ISsToString = 8
    DISPID_ISsModifyDrawingAttributes = 9
    DISPID_ISsGetBoundingBox = 10
    DISPID_ISsScaleToRectangle = 11
    DISPID_ISsTransform = 12
    DISPID_ISsMove = 13
    DISPID_ISsRotate = 14
    DISPID_ISsShear = 15
    DISPID_ISsScale = 16
    DISPID_ISsClip = 17
    DISPID_ISsRecognitionResult = 18
    DISPID_ISsRemoveRecognitionResult = 19
  end

  enum DISPID_InkCustomStrokes : Int32
    DISPID_ICSs_NewEnum = -4
    DISPID_ICSsItem = 0
    DISPID_ICSsCount = 1
    DISPID_ICSsAdd = 2
    DISPID_ICSsRemove = 3
    DISPID_ICSsClear = 4
  end

  enum DISPID_StrokeEvent : Int32
    DISPID_SEStrokesAdded = 1
    DISPID_SEStrokesRemoved = 2
  end

  enum DISPID_Ink : Int32
    DISPID_IStrokes = 1
    DISPID_IExtendedProperties = 2
    DISPID_IGetBoundingBox = 3
    DISPID_IDeleteStrokes = 4
    DISPID_IDeleteStroke = 5
    DISPID_IExtractStrokes = 6
    DISPID_IExtractWithRectangle = 7
    DISPID_IDirty = 8
    DISPID_ICustomStrokes = 9
    DISPID_IClone = 10
    DISPID_IHitTestCircle = 11
    DISPID_IHitTestWithRectangle = 12
    DISPID_IHitTestWithLasso = 13
    DISPID_INearestPoint = 14
    DISPID_ICreateStrokes = 15
    DISPID_ICreateStroke = 16
    DISPID_IAddStrokesAtRectangle = 17
    DISPID_IClip = 18
    DISPID_ISave = 19
    DISPID_ILoad = 20
    DISPID_ICreateStrokeFromPoints = 21
    DISPID_IClipboardCopyWithRectangle = 22
    DISPID_IClipboardCopy = 23
    DISPID_ICanPaste = 24
    DISPID_IClipboardPaste = 25
  end

  enum DISPID_InkEvent : Int32
    DISPID_IEInkAdded = 1
    DISPID_IEInkDeleted = 2
  end

  enum DISPID_InkRenderer : Int32
    DISPID_IRGetViewTransform = 1
    DISPID_IRSetViewTransform = 2
    DISPID_IRGetObjectTransform = 3
    DISPID_IRSetObjectTransform = 4
    DISPID_IRDraw = 5
    DISPID_IRDrawStroke = 6
    DISPID_IRPixelToInkSpace = 7
    DISPID_IRInkSpaceToPixel = 8
    DISPID_IRPixelToInkSpaceFromPoints = 9
    DISPID_IRInkSpaceToPixelFromPoints = 10
    DISPID_IRMeasure = 11
    DISPID_IRMeasureStroke = 12
    DISPID_IRMove = 13
    DISPID_IRRotate = 14
    DISPID_IRScale = 15
  end

  enum InkCollectorEventInterest : Int32
    ICEI_DefaultEvents = -1
    ICEI_CursorDown = 0
    ICEI_Stroke = 1
    ICEI_NewPackets = 2
    ICEI_NewInAirPackets = 3
    ICEI_CursorButtonDown = 4
    ICEI_CursorButtonUp = 5
    ICEI_CursorInRange = 6
    ICEI_CursorOutOfRange = 7
    ICEI_SystemGesture = 8
    ICEI_TabletAdded = 9
    ICEI_TabletRemoved = 10
    ICEI_MouseDown = 11
    ICEI_MouseMove = 12
    ICEI_MouseUp = 13
    ICEI_MouseWheel = 14
    ICEI_DblClick = 15
    ICEI_AllEvents = 16
  end

  enum InkMouseButton : Int32
    IMF_Left = 1
    IMF_Right = 2
    IMF_Middle = 4
  end

  enum InkShiftKeyModifierFlags : Int32
    IKM_Shift = 1
    IKM_Control = 2
    IKM_Alt = 4
  end

  enum DISPID_InkCollectorEvent : Int32
    DISPID_ICEStroke = 1
    DISPID_ICECursorDown = 2
    DISPID_ICENewPackets = 3
    DISPID_ICENewInAirPackets = 4
    DISPID_ICECursorButtonDown = 5
    DISPID_ICECursorButtonUp = 6
    DISPID_ICECursorInRange = 7
    DISPID_ICECursorOutOfRange = 8
    DISPID_ICESystemGesture = 9
    DISPID_ICEGesture = 10
    DISPID_ICETabletAdded = 11
    DISPID_ICETabletRemoved = 12
    DISPID_IOEPainting = 13
    DISPID_IOEPainted = 14
    DISPID_IOESelectionChanging = 15
    DISPID_IOESelectionChanged = 16
    DISPID_IOESelectionMoving = 17
    DISPID_IOESelectionMoved = 18
    DISPID_IOESelectionResizing = 19
    DISPID_IOESelectionResized = 20
    DISPID_IOEStrokesDeleting = 21
    DISPID_IOEStrokesDeleted = 22
    DISPID_IPEChangeUICues = 23
    DISPID_IPEClick = 24
    DISPID_IPEDblClick = 25
    DISPID_IPEInvalidated = 26
    DISPID_IPEMouseDown = 27
    DISPID_IPEMouseEnter = 28
    DISPID_IPEMouseHover = 29
    DISPID_IPEMouseLeave = 30
    DISPID_IPEMouseMove = 31
    DISPID_IPEMouseUp = 32
    DISPID_IPEMouseWheel = 33
    DISPID_IPESizeModeChanged = 34
    DISPID_IPEStyleChanged = 35
    DISPID_IPESystemColorsChanged = 36
    DISPID_IPEKeyDown = 37
    DISPID_IPEKeyPress = 38
    DISPID_IPEKeyUp = 39
    DISPID_IPEResize = 40
    DISPID_IPESizeChanged = 41
  end

  enum InkOverlayEditingMode : Int32
    IOEM_Ink = 0
    IOEM_Delete = 1
    IOEM_Select = 2
  end

  enum InkOverlayAttachMode : Int32
    IOAM_Behind = 0
    IOAM_InFront = 1
  end

  enum InkPictureSizeMode : Int32
    IPSM_AutoSize = 0
    IPSM_CenterImage = 1
    IPSM_Normal = 2
    IPSM_StretchImage = 3
  end

  enum InkOverlayEraserMode : Int32
    IOERM_StrokeErase = 0
    IOERM_PointErase = 1
  end

  enum InkCollectionMode : Int32
    ICM_InkOnly = 0
    ICM_GestureOnly = 1
    ICM_InkAndGesture = 2
  end

  enum DISPID_InkCollector : Int32
    DISPID_ICEnabled = 1
    DISPID_ICHwnd = 2
    DISPID_ICPaint = 3
    DISPID_ICText = 4
    DISPID_ICDefaultDrawingAttributes = 5
    DISPID_ICRenderer = 6
    DISPID_ICInk = 7
    DISPID_ICAutoRedraw = 8
    DISPID_ICCollectingInk = 9
    DISPID_ICSetEventInterest = 10
    DISPID_ICGetEventInterest = 11
    DISPID_IOEditingMode = 12
    DISPID_IOSelection = 13
    DISPID_IOAttachMode = 14
    DISPID_IOHitTestSelection = 15
    DISPID_IODraw = 16
    DISPID_IPPicture = 17
    DISPID_IPSizeMode = 18
    DISPID_IPBackColor = 19
    DISPID_ICCursors = 20
    DISPID_ICMarginX = 21
    DISPID_ICMarginY = 22
    DISPID_ICSetWindowInputRectangle = 23
    DISPID_ICGetWindowInputRectangle = 24
    DISPID_ICTablet = 25
    DISPID_ICSetAllTabletsMode = 26
    DISPID_ICSetSingleTabletIntegratedMode = 27
    DISPID_ICCollectionMode = 28
    DISPID_ICSetGestureStatus = 29
    DISPID_ICGetGestureStatus = 30
    DISPID_ICDynamicRendering = 31
    DISPID_ICDesiredPacketDescription = 32
    DISPID_IOEraserMode = 33
    DISPID_IOEraserWidth = 34
    DISPID_ICMouseIcon = 35
    DISPID_ICMousePointer = 36
    DISPID_IPInkEnabled = 37
    DISPID_ICSupportHighContrastInk = 38
    DISPID_IOSupportHighContrastSelectionUI = 39
  end

  enum DISPID_InkRecognizer : Int32
    DISPID_RecoClsid = 1
    DISPID_RecoName = 2
    DISPID_RecoVendor = 3
    DISPID_RecoCapabilities = 4
    DISPID_RecoLanguageID = 5
    DISPID_RecoPreferredPacketDescription = 6
    DISPID_RecoCreateRecognizerContext = 7
    DISPID_RecoSupportedProperties = 8
  end

  enum InkRecognizerCapabilities : Int32
    IRC_DontCare = 1
    IRC_Object = 2
    IRC_FreeInput = 4
    IRC_LinedInput = 8
    IRC_BoxedInput = 16
    IRC_CharacterAutoCompletionInput = 32
    IRC_RightAndDown = 64
    IRC_LeftAndDown = 128
    IRC_DownAndLeft = 256
    IRC_DownAndRight = 512
    IRC_ArbitraryAngle = 1024
    IRC_Lattice = 2048
    IRC_AdviseInkChange = 4096
    IRC_StrokeReorder = 8192
    IRC_Personalizable = 16384
    IRC_PrefersArbitraryAngle = 32768
    IRC_PrefersParagraphBreaking = 65536
    IRC_PrefersSegmentation = 131072
    IRC_Cursive = 262144
    IRC_TextPrediction = 524288
    IRC_Alpha = 1048576
    IRC_Beta = 2097152
  end

  enum DISPID_InkRecognizer2 : Int32
    DISPID_RecoId = 0
    DISPID_RecoUnicodeRanges = 1
  end

  enum DISPID_InkRecognizers : Int32
    DISPID_IRecos_NewEnum = -4
    DISPID_IRecosItem = 0
    DISPID_IRecosCount = 1
    DISPID_IRecosGetDefaultRecognizer = 2
  end

  enum InkRecognizerCharacterAutoCompletionMode : Int32
    IRCACM_Full = 0
    IRCACM_Prefix = 1
    IRCACM_Random = 2
  end

  enum InkRecognitionModes : Int32
    IRM_None = 0
    IRM_WordModeOnly = 1
    IRM_Coerce = 2
    IRM_TopInkBreaksOnly = 4
    IRM_PrefixOk = 8
    IRM_LineMode = 16
    IRM_DisablePersonalization = 32
    IRM_AutoSpace = 64
    IRM_Max = 128
  end

  enum DISPID_InkRecognitionEvent : Int32
    DISPID_IRERecognitionWithAlternates = 1
    DISPID_IRERecognition = 2
  end

  enum DISPID_InkRecoContext : Int32
    DISPID_IRecoCtx_Strokes = 1
    DISPID_IRecoCtx_CharacterAutoCompletionMode = 2
    DISPID_IRecoCtx_Factoid = 3
    DISPID_IRecoCtx_WordList = 4
    DISPID_IRecoCtx_Recognizer = 5
    DISPID_IRecoCtx_Guide = 6
    DISPID_IRecoCtx_Flags = 7
    DISPID_IRecoCtx_PrefixText = 8
    DISPID_IRecoCtx_SuffixText = 9
    DISPID_IRecoCtx_StopRecognition = 10
    DISPID_IRecoCtx_Clone = 11
    DISPID_IRecoCtx_Recognize = 12
    DISPID_IRecoCtx_StopBackgroundRecognition = 13
    DISPID_IRecoCtx_EndInkInput = 14
    DISPID_IRecoCtx_BackgroundRecognize = 15
    DISPID_IRecoCtx_BackgroundRecognizeWithAlternates = 16
    DISPID_IRecoCtx_IsStringSupported = 17
  end

  enum DISPID_InkRecoContext2 : Int32
    DISPID_IRecoCtx2_EnabledUnicodeRanges = 0
  end

  enum InkRecognitionAlternatesSelection : Int32
    IRAS_Start = 0
    IRAS_DefaultCount = 10
    IRAS_All = -1
  end

  enum DISPID_InkRecognitionResult : Int32
    DISPID_InkRecognitionResult_TopString = 1
    DISPID_InkRecognitionResult_TopAlternate = 2
    DISPID_InkRecognitionResult_Strokes = 3
    DISPID_InkRecognitionResult_TopConfidence = 4
    DISPID_InkRecognitionResult_AlternatesFromSelection = 5
    DISPID_InkRecognitionResult_ModifyTopAlternate = 6
    DISPID_InkRecognitionResult_SetResultOnStrokes = 7
  end

  enum DISPID_InkRecoAlternate : Int32
    DISPID_InkRecoAlternate_String = 1
    DISPID_InkRecoAlternate_LineNumber = 2
    DISPID_InkRecoAlternate_Baseline = 3
    DISPID_InkRecoAlternate_Midline = 4
    DISPID_InkRecoAlternate_Ascender = 5
    DISPID_InkRecoAlternate_Descender = 6
    DISPID_InkRecoAlternate_Confidence = 7
    DISPID_InkRecoAlternate_Strokes = 8
    DISPID_InkRecoAlternate_GetStrokesFromStrokeRanges = 9
    DISPID_InkRecoAlternate_GetStrokesFromTextRange = 10
    DISPID_InkRecoAlternate_GetTextRangeFromStrokes = 11
    DISPID_InkRecoAlternate_GetPropertyValue = 12
    DISPID_InkRecoAlternate_LineAlternates = 13
    DISPID_InkRecoAlternate_ConfidenceAlternates = 14
    DISPID_InkRecoAlternate_AlternatesWithConstantPropertyValues = 15
  end

  enum DISPID_InkRecognitionAlternates : Int32
    DISPID_InkRecognitionAlternates_NewEnum = -4
    DISPID_InkRecognitionAlternates_Item = 0
    DISPID_InkRecognitionAlternates_Count = 1
    DISPID_InkRecognitionAlternates_Strokes = 2
  end

  enum DISPID_InkRecognizerGuide : Int32
    DISPID_IRGWritingBox = 1
    DISPID_IRGDrawnBox = 2
    DISPID_IRGRows = 3
    DISPID_IRGColumns = 4
    DISPID_IRGMidline = 5
    DISPID_IRGGuideData = 6
  end

  enum DISPID_InkWordList : Int32
    DISPID_InkWordList_AddWord = 0
    DISPID_InkWordList_RemoveWord = 1
    DISPID_InkWordList_Merge = 2
  end

  enum DISPID_InkWordList2 : Int32
    DISPID_InkWordList2_AddWords = 3
  end

  enum InkDivisionType : Int32
    IDT_Segment = 0
    IDT_Line = 1
    IDT_Paragraph = 2
    IDT_Drawing = 3
  end

  enum DISPID_InkDivider : Int32
    DISPID_IInkDivider_Strokes = 1
    DISPID_IInkDivider_RecognizerContext = 2
    DISPID_IInkDivider_LineHeight = 3
    DISPID_IInkDivider_Divide = 4
  end

  enum DISPID_InkDivisionResult : Int32
    DISPID_IInkDivisionResult_Strokes = 1
    DISPID_IInkDivisionResult_ResultByType = 2
  end

  enum DISPID_InkDivisionUnit : Int32
    DISPID_IInkDivisionUnit_Strokes = 1
    DISPID_IInkDivisionUnit_DivisionType = 2
    DISPID_IInkDivisionUnit_RecognizedString = 3
    DISPID_IInkDivisionUnit_RotationTransform = 4
  end

  enum DISPID_InkDivisionUnits : Int32
    DISPID_IInkDivisionUnits_NewEnum = -4
    DISPID_IInkDivisionUnits_Item = 0
    DISPID_IInkDivisionUnits_Count = 1
  end

  enum DISPID_PenInputPanel : Int32
    DISPID_PIPAttachedEditWindow = 0
    DISPID_PIPFactoid = 1
    DISPID_PIPCurrentPanel = 2
    DISPID_PIPDefaultPanel = 3
    DISPID_PIPVisible = 4
    DISPID_PIPTop = 5
    DISPID_PIPLeft = 6
    DISPID_PIPWidth = 7
    DISPID_PIPHeight = 8
    DISPID_PIPMoveTo = 9
    DISPID_PIPCommitPendingInput = 10
    DISPID_PIPRefresh = 11
    DISPID_PIPBusy = 12
    DISPID_PIPVerticalOffset = 13
    DISPID_PIPHorizontalOffset = 14
    DISPID_PIPEnableTsf = 15
    DISPID_PIPAutoShow = 16
  end

  enum DISPID_PenInputPanelEvents : Int32
    DISPID_PIPEVisibleChanged = 0
    DISPID_PIPEPanelChanged = 1
    DISPID_PIPEInputFailed = 2
    DISPID_PIPEPanelMoving = 3
  end

  enum VisualState : Int32
    InPlace = 0
    Floating = 1
    DockedTop = 2
    DockedBottom = 3
    Closed = 4
  end

  enum InteractionMode : Int32
    InteractionMode_InPlace = 0
    InteractionMode_Floating = 1
    InteractionMode_DockedTop = 2
    InteractionMode_DockedBottom = 3
  end

  enum InPlaceState : Int32
    InPlaceState_Auto = 0
    InPlaceState_HoverTarget = 1
    InPlaceState_Expanded = 2
  end

  enum PanelInputArea : Int32
    PanelInputArea_Auto = 0
    PanelInputArea_Keyboard = 1
    PanelInputArea_WritingPad = 2
    PanelInputArea_CharacterPad = 3
  end

  enum CorrectionMode : Int32
    CorrectionMode_NotVisible = 0
    CorrectionMode_PreInsertion = 1
    CorrectionMode_PostInsertionCollapsed = 2
    CorrectionMode_PostInsertionExpanded = 3
  end

  enum CorrectionPosition : Int32
    CorrectionPosition_Auto = 0
    CorrectionPosition_Bottom = 1
    CorrectionPosition_Top = 2
  end

  enum InPlaceDirection : Int32
    InPlaceDirection_Auto = 0
    InPlaceDirection_Bottom = 1
    InPlaceDirection_Top = 2
  end

  enum EventMask : Int32
    EventMask_InPlaceStateChanging = 1
    EventMask_InPlaceStateChanged = 2
    EventMask_InPlaceSizeChanging = 4
    EventMask_InPlaceSizeChanged = 8
    EventMask_InputAreaChanging = 16
    EventMask_InputAreaChanged = 32
    EventMask_CorrectionModeChanging = 64
    EventMask_CorrectionModeChanged = 128
    EventMask_InPlaceVisibilityChanging = 256
    EventMask_InPlaceVisibilityChanged = 512
    EventMask_TextInserting = 1024
    EventMask_TextInserted = 2048
    EventMask_All = 4095
  end

  enum PanelType : Int32
    PT_Default = 0
    PT_Inactive = 1
    PT_Handwriting = 2
    PT_Keyboard = 3
  end

  enum FLICKDIRECTION : Int32
    FLICKDIRECTION_MIN = 0
    FLICKDIRECTION_RIGHT = 0
    FLICKDIRECTION_UPRIGHT = 1
    FLICKDIRECTION_UP = 2
    FLICKDIRECTION_UPLEFT = 3
    FLICKDIRECTION_LEFT = 4
    FLICKDIRECTION_DOWNLEFT = 5
    FLICKDIRECTION_DOWN = 6
    FLICKDIRECTION_DOWNRIGHT = 7
    FLICKDIRECTION_INVALID = 8
  end

  enum FLICKMODE : Int32
    FLICKMODE_MIN = 0
    FLICKMODE_OFF = 0
    FLICKMODE_ON = 1
    FLICKMODE_LEARNING = 2
    FLICKMODE_MAX = 2
    FLICKMODE_DEFAULT = 1
  end

  enum FLICKACTION_COMMANDCODE : Int32
    FLICKACTION_COMMANDCODE_NULL = 0
    FLICKACTION_COMMANDCODE_SCROLL = 1
    FLICKACTION_COMMANDCODE_APPCOMMAND = 2
    FLICKACTION_COMMANDCODE_CUSTOMKEY = 3
    FLICKACTION_COMMANDCODE_KEYMODIFIER = 4
  end

  enum SCROLLDIRECTION : Int32
    SCROLLDIRECTION_UP = 0
    SCROLLDIRECTION_DOWN = 1
  end

  enum KEYMODIFIER : Int32
    KEYMODIFIER_CONTROL = 1
    KEYMODIFIER_MENU = 2
    KEYMODIFIER_SHIFT = 4
    KEYMODIFIER_WIN = 8
    KEYMODIFIER_ALTGR = 16
    KEYMODIFIER_EXT = 32
  end

  enum MouseButton : Int32
    NO_BUTTON = 0
    LEFT_BUTTON = 1
    RIGHT_BUTTON = 2
    MIDDLE_BUTTON = 4
  end

  enum SelAlignmentConstants : Int32
    Rtfleft = 0
    Rtfright = 1
    Rtfcenter = 2
  end

  enum DISPID_InkEdit : Int32
    DISPID_Text = 0
    DISPID_TextRTF = 1
    DISPID_Hwnd = 2
    DISPID_DisableNoScroll = 3
    DISPID_Locked = 4
    DISPID_Enabled = 5
    DISPID_MaxLength = 6
    DISPID_MultiLine = 7
    DISPID_ScrollBars = 8
    DISPID_RTSelStart = 9
    DISPID_RTSelLength = 10
    DISPID_RTSelText = 11
    DISPID_SelAlignment = 12
    DISPID_SelBold = 13
    DISPID_SelCharOffset = 14
    DISPID_SelColor = 15
    DISPID_SelFontName = 16
    DISPID_SelFontSize = 17
    DISPID_SelItalic = 18
    DISPID_SelRTF = 19
    DISPID_SelUnderline = 20
    DISPID_DragIcon = 21
    DISPID_Status = 22
    DISPID_UseMouseForInput = 23
    DISPID_InkMode = 24
    DISPID_InkInsertMode = 25
    DISPID_RecoTimeout = 26
    DISPID_DrawAttr = 27
    DISPID_Recognizer = 28
    DISPID_Factoid = 29
    DISPID_SelInk = 30
    DISPID_SelInksDisplayMode = 31
    DISPID_Recognize = 32
    DISPID_GetGestStatus = 33
    DISPID_SetGestStatus = 34
    DISPID_Refresh = 35
  end

  enum DISPID_InkEditEvents : Int32
    DISPID_IeeChange = 1
    DISPID_IeeSelChange = 2
    DISPID_IeeKeyDown = 3
    DISPID_IeeKeyUp = 4
    DISPID_IeeMouseUp = 5
    DISPID_IeeMouseDown = 6
    DISPID_IeeKeyPress = 7
    DISPID_IeeDblClick = 8
    DISPID_IeeClick = 9
    DISPID_IeeMouseMove = 10
    DISPID_IeeCursorDown = 21
    DISPID_IeeStroke = 22
    DISPID_IeeGesture = 23
    DISPID_IeeRecognitionResult = 24
  end

  enum InkMode : Int32
    IEM_Disabled = 0
    IEM_Ink = 1
    IEM_InkAndGesture = 2
  end

  enum InkInsertMode : Int32
    IEM_InsertText = 0
    IEM_InsertInk = 1
  end

  enum InkEditStatus : Int32
    IES_Idle = 0
    IES_Collecting = 1
    IES_Recognizing = 2
  end

  enum InkDisplayMode : Int32
    IDM_Ink = 0
    IDM_Text = 1
  end

  enum AppearanceConstants : Int32
    Rtfflat = 0
    Rtfthreed = 1
  end

  enum BorderStyleConstants : Int32
    Rtfnoborder = 0
    Rtffixedsingle = 1
  end

  enum ScrollBarsConstants : Int32
    Rtfnone = 0
    Rtfhorizontal = 1
    Rtfvertical = 2
    Rtfboth = 3
  end

  enum MICUIELEMENT : Int32
    MICUIELEMENT_BUTTON_WRITE = 1
    MICUIELEMENT_BUTTON_ERASE = 2
    MICUIELEMENT_BUTTON_CORRECT = 4
    MICUIELEMENT_BUTTON_CLEAR = 8
    MICUIELEMENT_BUTTON_UNDO = 16
    MICUIELEMENT_BUTTON_REDO = 32
    MICUIELEMENT_BUTTON_INSERT = 64
    MICUIELEMENT_BUTTON_CANCEL = 128
    MICUIELEMENT_INKPANEL_BACKGROUND = 256
    MICUIELEMENT_RESULTPANEL_BACKGROUND = 512
  end

  enum MICUIELEMENTSTATE : Int32
    MICUIELEMENTSTATE_NORMAL = 1
    MICUIELEMENTSTATE_HOT = 2
    MICUIELEMENTSTATE_PRESSED = 3
    MICUIELEMENTSTATE_DISABLED = 4
  end

  enum DISPID_MathInputControlEvents : Int32
    DISPID_MICInsert = 0
    DISPID_MICClose = 1
    DISPID_MICPaint = 2
    DISPID_MICClear = 3
  end

  enum RealTimeStylusDataInterest : Int32
    RTSDI_AllData = -1
    RTSDI_None = 0
    RTSDI_Error = 1
    RTSDI_RealTimeStylusEnabled = 2
    RTSDI_RealTimeStylusDisabled = 4
    RTSDI_StylusNew = 8
    RTSDI_StylusInRange = 16
    RTSDI_InAirPackets = 32
    RTSDI_StylusOutOfRange = 64
    RTSDI_StylusDown = 128
    RTSDI_Packets = 256
    RTSDI_StylusUp = 512
    RTSDI_StylusButtonUp = 1024
    RTSDI_StylusButtonDown = 2048
    RTSDI_SystemEvents = 4096
    RTSDI_TabletAdded = 8192
    RTSDI_TabletRemoved = 16384
    RTSDI_CustomStylusDataAdded = 32768
    RTSDI_UpdateMapping = 65536
    RTSDI_DefaultEvents = 37766
  end

  enum StylusQueue : Int32
    SyncStylusQueue = 1
    AsyncStylusQueueImmediate = 2
    AsyncStylusQueue = 3
  end

  enum RealTimeStylusLockType : Int32
    RTSLT_ObjLock = 1
    RTSLT_SyncEventLock = 2
    RTSLT_AsyncEventLock = 4
    RTSLT_ExcludeCallback = 8
    RTSLT_SyncObjLock = 11
    RTSLT_AsyncObjLock = 13
  end

  enum LINE_METRICS : Int32
    LM_BASELINE = 0
    LM_MIDLINE = 1
    LM_ASCENDER = 2
    LM_DESCENDER = 3
  end

  enum CONFIDENCE_LEVEL : Int32
    CFL_STRONG = 0
    CFL_INTERMEDIATE = 1
    CFL_POOR = 2
  end

  enum ALT_BREAKS : Int32
    ALT_BREAKS_SAME = 0
    ALT_BREAKS_UNIQUE = 1
    ALT_BREAKS_FULL = 2
  end

  enum Enumreco_type : Int32
    RECO_TYPE_WSTRING = 0
    RECO_TYPE_WCHAR = 1
  end

  struct SYSTEM_EVENT_DATA
    b_modifier : UInt8
    w_key : Char
    x_pos : Int32
    y_pos : Int32
    b_cursor_mode : UInt8
    dw_button_state : UInt32
  end
  struct STROKE_RANGE
    i_stroke_begin : UInt32
    i_stroke_end : UInt32
  end
  struct PROPERTY_METRICS
    n_logical_min : Int32
    n_logical_max : Int32
    units : PROPERTY_UNITS
    f_resolution : Float32
  end
  struct PACKET_PROPERTY
    guid : Guid
    property_metrics : PROPERTY_METRICS
  end
  struct PACKET_DESCRIPTION
    cb_packet_size : UInt32
    c_packet_properties : UInt32
    p_packet_properties : PACKET_PROPERTY*
    c_buttons : UInt32
    pguid_buttons : Guid*
  end
  struct INKMETRIC
    i_height : Int32
    i_font_ascent : Int32
    i_font_descent : Int32
    dw_flags : UInt32
    color : UInt32
  end
  struct InkRecoGuide
    rect_writing_box : RECT
    rect_drawn_box : RECT
    c_rows : Int32
    c_columns : Int32
    midline : Int32
  end
  struct FLICK_POINT
    _bitfield : Int32
  end
  struct FLICK_DATA
    _bitfield : Int32
  end
  struct IEC_STROKEINFO
    nmhdr : NMHDR
    cursor : IInkCursor
    stroke : IInkStrokeDisp
  end
  struct IEC_GESTUREINFO
    nmhdr : NMHDR
    cursor : IInkCursor
    strokes : IInkStrokes
    gestures : VARIANT
  end
  struct IEC_RECOGNITIONRESULTINFO
    nmhdr : NMHDR
    recognition_result : IInkRecognitionResult
  end
  struct StylusInfo
    tcid : UInt32
    cid : UInt32
    b_is_inverted_cursor : LibC::BOOL
  end
  struct GESTURE_DATA
    gesture_id : Int32
    reco_confidence : Int32
    stroke_count : Int32
  end
  struct DYNAMIC_RENDERER_CACHED_DATA
    stroke_id : Int32
    dynamic_renderer : IDynamicRenderer
  end
  struct RECO_GUIDE
    x_origin : Int32
    y_origin : Int32
    cx_box : Int32
    cy_box : Int32
    cx_base : Int32
    cy_base : Int32
    c_horz_box : Int32
    c_vert_box : Int32
    cy_mid : Int32
  end
  struct RECO_ATTRS
    dw_reco_capability_flags : UInt32
    awc_vendor_name : Char[32]*
    awc_friendly_name : Char[64]*
    aw_language_id : UInt16[64]*
  end
  struct RECO_RANGE
    iwc_begin : UInt32
    c_count : UInt32
  end
  struct LINE_SEGMENT
    pt_a : POINT
    pt_b : POINT
  end
  struct LATTICE_METRICS
    ls_baseline : LINE_SEGMENT
    i_midline_offset : Int16
  end
  struct RECO_LATTICE_PROPERTY
    guid_property : Guid
    cb_property_value : UInt16
    p_property_value : UInt8*
  end
  struct RECO_LATTICE_PROPERTIES
    c_properties : UInt32
    ap_props : RECO_LATTICE_PROPERTY**
  end
  struct RECO_LATTICE_ELEMENT
    score : Int32
    type : UInt16
    p_data : UInt8*
    ul_next_column : UInt32
    ul_stroke_number : UInt32
    ep_prop : RECO_LATTICE_PROPERTIES
  end
  struct RECO_LATTICE_COLUMN
    key : UInt32
    cp_prop : RECO_LATTICE_PROPERTIES
    c_strokes : UInt32
    p_strokes : UInt32*
    c_lattice_elements : UInt32
    p_lattice_elements : RECO_LATTICE_ELEMENT*
  end
  struct RECO_LATTICE
    ul_column_count : UInt32
    p_lattice_columns : RECO_LATTICE_COLUMN*
    ul_property_count : UInt32
    p_guid_properties : Guid*
    ul_best_result_column_count : UInt32
    pul_best_result_columns : UInt32*
    pul_best_result_indexes : UInt32*
  end
  struct CHARACTER_RANGE
    wc_low : Char
    c_chars : UInt16
  end


  struct IInkRectangleVTbl
    query_interface : Proc(IInkRectangle*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRectangle*, UInt32)
    release : Proc(IInkRectangle*, UInt32)
    get_type_info_count : Proc(IInkRectangle*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRectangle*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRectangle*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRectangle*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_top : Proc(IInkRectangle*, Int32*, HRESULT)
    put_top : Proc(IInkRectangle*, Int32, HRESULT)
    get_left : Proc(IInkRectangle*, Int32*, HRESULT)
    put_left : Proc(IInkRectangle*, Int32, HRESULT)
    get_bottom : Proc(IInkRectangle*, Int32*, HRESULT)
    put_bottom : Proc(IInkRectangle*, Int32, HRESULT)
    get_right : Proc(IInkRectangle*, Int32*, HRESULT)
    put_right : Proc(IInkRectangle*, Int32, HRESULT)
    get_data : Proc(IInkRectangle*, RECT*, HRESULT)
    put_data : Proc(IInkRectangle*, RECT, HRESULT)
    get_rectangle : Proc(IInkRectangle*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    set_rectangle : Proc(IInkRectangle*, Int32, Int32, Int32, Int32, HRESULT)
  end

  IInkRectangle_GUID = "9794ff82-6071-4717-8a8b-6ac7c64a686e"
  IID_IInkRectangle = LibC::GUID.new(0x9794ff82_u32, 0x6071_u16, 0x4717_u16, StaticArray[0x8a_u8, 0x8b_u8, 0x6a_u8, 0xc7_u8, 0xc6_u8, 0x4a_u8, 0x68_u8, 0x6e_u8])
  struct IInkRectangle
    lpVtbl : IInkRectangleVTbl*
  end

  struct IInkExtendedPropertyVTbl
    query_interface : Proc(IInkExtendedProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkExtendedProperty*, UInt32)
    release : Proc(IInkExtendedProperty*, UInt32)
    get_type_info_count : Proc(IInkExtendedProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IInkExtendedProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkExtendedProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkExtendedProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_guid : Proc(IInkExtendedProperty*, UInt8**, HRESULT)
    get_data : Proc(IInkExtendedProperty*, VARIANT*, HRESULT)
    put_data : Proc(IInkExtendedProperty*, VARIANT, HRESULT)
  end

  IInkExtendedProperty_GUID = "db489209-b7c3-411d-90f6-1548cfff271e"
  IID_IInkExtendedProperty = LibC::GUID.new(0xdb489209_u32, 0xb7c3_u16, 0x411d_u16, StaticArray[0x90_u8, 0xf6_u8, 0x15_u8, 0x48_u8, 0xcf_u8, 0xff_u8, 0x27_u8, 0x1e_u8])
  struct IInkExtendedProperty
    lpVtbl : IInkExtendedPropertyVTbl*
  end

  struct IInkExtendedPropertiesVTbl
    query_interface : Proc(IInkExtendedProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkExtendedProperties*, UInt32)
    release : Proc(IInkExtendedProperties*, UInt32)
    get_type_info_count : Proc(IInkExtendedProperties*, UInt32*, HRESULT)
    get_type_info : Proc(IInkExtendedProperties*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkExtendedProperties*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkExtendedProperties*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkExtendedProperties*, Int32*, HRESULT)
    get__new_enum : Proc(IInkExtendedProperties*, IUnknown*, HRESULT)
    item : Proc(IInkExtendedProperties*, VARIANT, IInkExtendedProperty*, HRESULT)
    add : Proc(IInkExtendedProperties*, UInt8*, VARIANT, IInkExtendedProperty*, HRESULT)
    remove : Proc(IInkExtendedProperties*, VARIANT, HRESULT)
    clear : Proc(IInkExtendedProperties*, HRESULT)
    does_property_exist : Proc(IInkExtendedProperties*, UInt8*, Int16*, HRESULT)
  end

  IInkExtendedProperties_GUID = "89f2a8be-95a9-4530-8b8f-88e971e3e25f"
  IID_IInkExtendedProperties = LibC::GUID.new(0x89f2a8be_u32, 0x95a9_u16, 0x4530_u16, StaticArray[0x8b_u8, 0x8f_u8, 0x88_u8, 0xe9_u8, 0x71_u8, 0xe3_u8, 0xe2_u8, 0x5f_u8])
  struct IInkExtendedProperties
    lpVtbl : IInkExtendedPropertiesVTbl*
  end

  struct IInkDrawingAttributesVTbl
    query_interface : Proc(IInkDrawingAttributes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDrawingAttributes*, UInt32)
    release : Proc(IInkDrawingAttributes*, UInt32)
    get_type_info_count : Proc(IInkDrawingAttributes*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDrawingAttributes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDrawingAttributes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDrawingAttributes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_color : Proc(IInkDrawingAttributes*, Int32*, HRESULT)
    put_color : Proc(IInkDrawingAttributes*, Int32, HRESULT)
    get_width : Proc(IInkDrawingAttributes*, Float32*, HRESULT)
    put_width : Proc(IInkDrawingAttributes*, Float32, HRESULT)
    get_height : Proc(IInkDrawingAttributes*, Float32*, HRESULT)
    put_height : Proc(IInkDrawingAttributes*, Float32, HRESULT)
    get_fit_to_curve : Proc(IInkDrawingAttributes*, Int16*, HRESULT)
    put_fit_to_curve : Proc(IInkDrawingAttributes*, Int16, HRESULT)
    get_ignore_pressure : Proc(IInkDrawingAttributes*, Int16*, HRESULT)
    put_ignore_pressure : Proc(IInkDrawingAttributes*, Int16, HRESULT)
    get_anti_aliased : Proc(IInkDrawingAttributes*, Int16*, HRESULT)
    put_anti_aliased : Proc(IInkDrawingAttributes*, Int16, HRESULT)
    get_transparency : Proc(IInkDrawingAttributes*, Int32*, HRESULT)
    put_transparency : Proc(IInkDrawingAttributes*, Int32, HRESULT)
    get_raster_operation : Proc(IInkDrawingAttributes*, InkRasterOperation*, HRESULT)
    put_raster_operation : Proc(IInkDrawingAttributes*, InkRasterOperation, HRESULT)
    get_pen_tip : Proc(IInkDrawingAttributes*, InkPenTip*, HRESULT)
    put_pen_tip : Proc(IInkDrawingAttributes*, InkPenTip, HRESULT)
    get_extended_properties : Proc(IInkDrawingAttributes*, IInkExtendedProperties*, HRESULT)
    clone : Proc(IInkDrawingAttributes*, IInkDrawingAttributes*, HRESULT)
  end

  IInkDrawingAttributes_GUID = "bf519b75-0a15-4623-adc9-c00d436a8092"
  IID_IInkDrawingAttributes = LibC::GUID.new(0xbf519b75_u32, 0xa15_u16, 0x4623_u16, StaticArray[0xad_u8, 0xc9_u8, 0xc0_u8, 0xd_u8, 0x43_u8, 0x6a_u8, 0x80_u8, 0x92_u8])
  struct IInkDrawingAttributes
    lpVtbl : IInkDrawingAttributesVTbl*
  end

  struct IInkTransformVTbl
    query_interface : Proc(IInkTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkTransform*, UInt32)
    release : Proc(IInkTransform*, UInt32)
    get_type_info_count : Proc(IInkTransform*, UInt32*, HRESULT)
    get_type_info : Proc(IInkTransform*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkTransform*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkTransform*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(IInkTransform*, HRESULT)
    translate : Proc(IInkTransform*, Float32, Float32, HRESULT)
    rotate : Proc(IInkTransform*, Float32, Float32, Float32, HRESULT)
    reflect : Proc(IInkTransform*, Int16, Int16, HRESULT)
    shear : Proc(IInkTransform*, Float32, Float32, HRESULT)
    scale_transform : Proc(IInkTransform*, Float32, Float32, HRESULT)
    get_transform : Proc(IInkTransform*, Float32*, Float32*, Float32*, Float32*, Float32*, Float32*, HRESULT)
    set_transform : Proc(IInkTransform*, Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)
    get_e_m11 : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_m11 : Proc(IInkTransform*, Float32, HRESULT)
    get_e_m12 : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_m12 : Proc(IInkTransform*, Float32, HRESULT)
    get_e_m21 : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_m21 : Proc(IInkTransform*, Float32, HRESULT)
    get_e_m22 : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_m22 : Proc(IInkTransform*, Float32, HRESULT)
    get_e_dx : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_dx : Proc(IInkTransform*, Float32, HRESULT)
    get_e_dy : Proc(IInkTransform*, Float32*, HRESULT)
    put_e_dy : Proc(IInkTransform*, Float32, HRESULT)
    get_data : Proc(IInkTransform*, XFORM*, HRESULT)
    put_data : Proc(IInkTransform*, XFORM, HRESULT)
  end

  IInkTransform_GUID = "615f1d43-8703-4565-88e2-8201d2ecd7b7"
  IID_IInkTransform = LibC::GUID.new(0x615f1d43_u32, 0x8703_u16, 0x4565_u16, StaticArray[0x88_u8, 0xe2_u8, 0x82_u8, 0x1_u8, 0xd2_u8, 0xec_u8, 0xd7_u8, 0xb7_u8])
  struct IInkTransform
    lpVtbl : IInkTransformVTbl*
  end

  struct IInkGestureVTbl
    query_interface : Proc(IInkGesture*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkGesture*, UInt32)
    release : Proc(IInkGesture*, UInt32)
    get_type_info_count : Proc(IInkGesture*, UInt32*, HRESULT)
    get_type_info : Proc(IInkGesture*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkGesture*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkGesture*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_confidence : Proc(IInkGesture*, InkRecognitionConfidence*, HRESULT)
    get_id : Proc(IInkGesture*, InkApplicationGesture*, HRESULT)
    get_hot_point : Proc(IInkGesture*, Int32*, Int32*, HRESULT)
  end

  IInkGesture_GUID = "3bdc0a97-04e5-4e26-b813-18f052d41def"
  IID_IInkGesture = LibC::GUID.new(0x3bdc0a97_u32, 0x4e5_u16, 0x4e26_u16, StaticArray[0xb8_u8, 0x13_u8, 0x18_u8, 0xf0_u8, 0x52_u8, 0xd4_u8, 0x1d_u8, 0xef_u8])
  struct IInkGesture
    lpVtbl : IInkGestureVTbl*
  end

  struct IInkCursorVTbl
    query_interface : Proc(IInkCursor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCursor*, UInt32)
    release : Proc(IInkCursor*, UInt32)
    get_type_info_count : Proc(IInkCursor*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCursor*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCursor*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCursor*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IInkCursor*, UInt8**, HRESULT)
    get_id : Proc(IInkCursor*, Int32*, HRESULT)
    get_inverted : Proc(IInkCursor*, Int16*, HRESULT)
    get_drawing_attributes : Proc(IInkCursor*, IInkDrawingAttributes*, HRESULT)
    putref_drawing_attributes : Proc(IInkCursor*, IInkDrawingAttributes, HRESULT)
    get_tablet : Proc(IInkCursor*, IInkTablet*, HRESULT)
    get_buttons : Proc(IInkCursor*, IInkCursorButtons*, HRESULT)
  end

  IInkCursor_GUID = "ad30c630-40c5-4350-8405-9c71012fc558"
  IID_IInkCursor = LibC::GUID.new(0xad30c630_u32, 0x40c5_u16, 0x4350_u16, StaticArray[0x84_u8, 0x5_u8, 0x9c_u8, 0x71_u8, 0x1_u8, 0x2f_u8, 0xc5_u8, 0x58_u8])
  struct IInkCursor
    lpVtbl : IInkCursorVTbl*
  end

  struct IInkCursorsVTbl
    query_interface : Proc(IInkCursors*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCursors*, UInt32)
    release : Proc(IInkCursors*, UInt32)
    get_type_info_count : Proc(IInkCursors*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCursors*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCursors*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCursors*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkCursors*, Int32*, HRESULT)
    get__new_enum : Proc(IInkCursors*, IUnknown*, HRESULT)
    item : Proc(IInkCursors*, Int32, IInkCursor*, HRESULT)
  end

  IInkCursors_GUID = "a248c1ac-c698-4e06-9e5c-d57f77c7e647"
  IID_IInkCursors = LibC::GUID.new(0xa248c1ac_u32, 0xc698_u16, 0x4e06_u16, StaticArray[0x9e_u8, 0x5c_u8, 0xd5_u8, 0x7f_u8, 0x77_u8, 0xc7_u8, 0xe6_u8, 0x47_u8])
  struct IInkCursors
    lpVtbl : IInkCursorsVTbl*
  end

  struct IInkCursorButtonVTbl
    query_interface : Proc(IInkCursorButton*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCursorButton*, UInt32)
    release : Proc(IInkCursorButton*, UInt32)
    get_type_info_count : Proc(IInkCursorButton*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCursorButton*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCursorButton*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCursorButton*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IInkCursorButton*, UInt8**, HRESULT)
    get_id : Proc(IInkCursorButton*, UInt8**, HRESULT)
    get_state : Proc(IInkCursorButton*, InkCursorButtonState*, HRESULT)
  end

  IInkCursorButton_GUID = "85ef9417-1d59-49b2-a13c-702c85430894"
  IID_IInkCursorButton = LibC::GUID.new(0x85ef9417_u32, 0x1d59_u16, 0x49b2_u16, StaticArray[0xa1_u8, 0x3c_u8, 0x70_u8, 0x2c_u8, 0x85_u8, 0x43_u8, 0x8_u8, 0x94_u8])
  struct IInkCursorButton
    lpVtbl : IInkCursorButtonVTbl*
  end

  struct IInkCursorButtonsVTbl
    query_interface : Proc(IInkCursorButtons*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCursorButtons*, UInt32)
    release : Proc(IInkCursorButtons*, UInt32)
    get_type_info_count : Proc(IInkCursorButtons*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCursorButtons*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCursorButtons*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCursorButtons*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkCursorButtons*, Int32*, HRESULT)
    get__new_enum : Proc(IInkCursorButtons*, IUnknown*, HRESULT)
    item : Proc(IInkCursorButtons*, VARIANT, IInkCursorButton*, HRESULT)
  end

  IInkCursorButtons_GUID = "3671cc40-b624-4671-9fa0-db119d952d54"
  IID_IInkCursorButtons = LibC::GUID.new(0x3671cc40_u32, 0xb624_u16, 0x4671_u16, StaticArray[0x9f_u8, 0xa0_u8, 0xdb_u8, 0x11_u8, 0x9d_u8, 0x95_u8, 0x2d_u8, 0x54_u8])
  struct IInkCursorButtons
    lpVtbl : IInkCursorButtonsVTbl*
  end

  struct IInkTabletVTbl
    query_interface : Proc(IInkTablet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkTablet*, UInt32)
    release : Proc(IInkTablet*, UInt32)
    get_type_info_count : Proc(IInkTablet*, UInt32*, HRESULT)
    get_type_info : Proc(IInkTablet*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkTablet*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkTablet*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IInkTablet*, UInt8**, HRESULT)
    get_plug_and_play_id : Proc(IInkTablet*, UInt8**, HRESULT)
    get_maximum_input_rectangle : Proc(IInkTablet*, IInkRectangle*, HRESULT)
    get_hardware_capabilities : Proc(IInkTablet*, TabletHardwareCapabilities*, HRESULT)
    is_packet_property_supported : Proc(IInkTablet*, UInt8*, Int16*, HRESULT)
    get_property_metrics : Proc(IInkTablet*, UInt8*, Int32*, Int32*, TabletPropertyMetricUnit*, Float32*, HRESULT)
  end

  IInkTablet_GUID = "2de25eaa-6ef8-42d5-aee9-185bc81b912d"
  IID_IInkTablet = LibC::GUID.new(0x2de25eaa_u32, 0x6ef8_u16, 0x42d5_u16, StaticArray[0xae_u8, 0xe9_u8, 0x18_u8, 0x5b_u8, 0xc8_u8, 0x1b_u8, 0x91_u8, 0x2d_u8])
  struct IInkTablet
    lpVtbl : IInkTabletVTbl*
  end

  struct IInkTablet2VTbl
    query_interface : Proc(IInkTablet2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkTablet2*, UInt32)
    release : Proc(IInkTablet2*, UInt32)
    get_type_info_count : Proc(IInkTablet2*, UInt32*, HRESULT)
    get_type_info : Proc(IInkTablet2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkTablet2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkTablet2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_device_kind : Proc(IInkTablet2*, TabletDeviceKind*, HRESULT)
  end

  IInkTablet2_GUID = "90c91ad2-fa36-49d6-9516-ce8d570f6f85"
  IID_IInkTablet2 = LibC::GUID.new(0x90c91ad2_u32, 0xfa36_u16, 0x49d6_u16, StaticArray[0x95_u8, 0x16_u8, 0xce_u8, 0x8d_u8, 0x57_u8, 0xf_u8, 0x6f_u8, 0x85_u8])
  struct IInkTablet2
    lpVtbl : IInkTablet2VTbl*
  end

  struct IInkTablet3VTbl
    query_interface : Proc(IInkTablet3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkTablet3*, UInt32)
    release : Proc(IInkTablet3*, UInt32)
    get_type_info_count : Proc(IInkTablet3*, UInt32*, HRESULT)
    get_type_info : Proc(IInkTablet3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkTablet3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkTablet3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_is_multi_touch : Proc(IInkTablet3*, Int16*, HRESULT)
    get_maximum_cursors : Proc(IInkTablet3*, UInt32*, HRESULT)
  end

  IInkTablet3_GUID = "7e313997-1327-41dd-8ca9-79f24be17250"
  IID_IInkTablet3 = LibC::GUID.new(0x7e313997_u32, 0x1327_u16, 0x41dd_u16, StaticArray[0x8c_u8, 0xa9_u8, 0x79_u8, 0xf2_u8, 0x4b_u8, 0xe1_u8, 0x72_u8, 0x50_u8])
  struct IInkTablet3
    lpVtbl : IInkTablet3VTbl*
  end

  struct IInkTabletsVTbl
    query_interface : Proc(IInkTablets*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkTablets*, UInt32)
    release : Proc(IInkTablets*, UInt32)
    get_type_info_count : Proc(IInkTablets*, UInt32*, HRESULT)
    get_type_info : Proc(IInkTablets*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkTablets*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkTablets*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkTablets*, Int32*, HRESULT)
    get__new_enum : Proc(IInkTablets*, IUnknown*, HRESULT)
    get_default_tablet : Proc(IInkTablets*, IInkTablet*, HRESULT)
    item : Proc(IInkTablets*, Int32, IInkTablet*, HRESULT)
    is_packet_property_supported : Proc(IInkTablets*, UInt8*, Int16*, HRESULT)
  end

  IInkTablets_GUID = "112086d9-7779-4535-a699-862b43ac1863"
  IID_IInkTablets = LibC::GUID.new(0x112086d9_u32, 0x7779_u16, 0x4535_u16, StaticArray[0xa6_u8, 0x99_u8, 0x86_u8, 0x2b_u8, 0x43_u8, 0xac_u8, 0x18_u8, 0x63_u8])
  struct IInkTablets
    lpVtbl : IInkTabletsVTbl*
  end

  struct IInkStrokeDispVTbl
    query_interface : Proc(IInkStrokeDisp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkStrokeDisp*, UInt32)
    release : Proc(IInkStrokeDisp*, UInt32)
    get_type_info_count : Proc(IInkStrokeDisp*, UInt32*, HRESULT)
    get_type_info : Proc(IInkStrokeDisp*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkStrokeDisp*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkStrokeDisp*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IInkStrokeDisp*, Int32*, HRESULT)
    get_bezier_points : Proc(IInkStrokeDisp*, VARIANT*, HRESULT)
    get_drawing_attributes : Proc(IInkStrokeDisp*, IInkDrawingAttributes*, HRESULT)
    putref_drawing_attributes : Proc(IInkStrokeDisp*, IInkDrawingAttributes, HRESULT)
    get_ink : Proc(IInkStrokeDisp*, IInkDisp*, HRESULT)
    get_extended_properties : Proc(IInkStrokeDisp*, IInkExtendedProperties*, HRESULT)
    get_polyline_cusps : Proc(IInkStrokeDisp*, VARIANT*, HRESULT)
    get_bezier_cusps : Proc(IInkStrokeDisp*, VARIANT*, HRESULT)
    get_self_intersections : Proc(IInkStrokeDisp*, VARIANT*, HRESULT)
    get_packet_count : Proc(IInkStrokeDisp*, Int32*, HRESULT)
    get_packet_size : Proc(IInkStrokeDisp*, Int32*, HRESULT)
    get_packet_description : Proc(IInkStrokeDisp*, VARIANT*, HRESULT)
    get_deleted : Proc(IInkStrokeDisp*, Int16*, HRESULT)
    get_bounding_box : Proc(IInkStrokeDisp*, InkBoundingBoxMode, IInkRectangle*, HRESULT)
    find_intersections : Proc(IInkStrokeDisp*, IInkStrokes, VARIANT*, HRESULT)
    get_rectangle_intersections : Proc(IInkStrokeDisp*, IInkRectangle, VARIANT*, HRESULT)
    clip : Proc(IInkStrokeDisp*, IInkRectangle, HRESULT)
    hit_test_circle : Proc(IInkStrokeDisp*, Int32, Int32, Float32, Int16*, HRESULT)
    nearest_point : Proc(IInkStrokeDisp*, Int32, Int32, Float32*, Float32*, HRESULT)
    split : Proc(IInkStrokeDisp*, Float32, IInkStrokeDisp*, HRESULT)
    get_packet_description_property_metrics : Proc(IInkStrokeDisp*, UInt8*, Int32*, Int32*, TabletPropertyMetricUnit*, Float32*, HRESULT)
    get_points : Proc(IInkStrokeDisp*, Int32, Int32, VARIANT*, HRESULT)
    set_points : Proc(IInkStrokeDisp*, VARIANT, Int32, Int32, Int32*, HRESULT)
    get_packet_data : Proc(IInkStrokeDisp*, Int32, Int32, VARIANT*, HRESULT)
    get_packet_values_by_property : Proc(IInkStrokeDisp*, UInt8*, Int32, Int32, VARIANT*, HRESULT)
    set_packet_values_by_property : Proc(IInkStrokeDisp*, UInt8*, VARIANT, Int32, Int32, Int32*, HRESULT)
    get_flattened_bezier_points : Proc(IInkStrokeDisp*, Int32, VARIANT*, HRESULT)
    transform : Proc(IInkStrokeDisp*, IInkTransform, Int16, HRESULT)
    scale_to_rectangle : Proc(IInkStrokeDisp*, IInkRectangle, HRESULT)
    move : Proc(IInkStrokeDisp*, Float32, Float32, HRESULT)
    rotate : Proc(IInkStrokeDisp*, Float32, Float32, Float32, HRESULT)
    shear : Proc(IInkStrokeDisp*, Float32, Float32, HRESULT)
    scale_transform : Proc(IInkStrokeDisp*, Float32, Float32, HRESULT)
  end

  IInkStrokeDisp_GUID = "43242fea-91d1-4a72-963e-fbb91829cfa2"
  IID_IInkStrokeDisp = LibC::GUID.new(0x43242fea_u32, 0x91d1_u16, 0x4a72_u16, StaticArray[0x96_u8, 0x3e_u8, 0xfb_u8, 0xb9_u8, 0x18_u8, 0x29_u8, 0xcf_u8, 0xa2_u8])
  struct IInkStrokeDisp
    lpVtbl : IInkStrokeDispVTbl*
  end

  struct IInkStrokesVTbl
    query_interface : Proc(IInkStrokes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkStrokes*, UInt32)
    release : Proc(IInkStrokes*, UInt32)
    get_type_info_count : Proc(IInkStrokes*, UInt32*, HRESULT)
    get_type_info : Proc(IInkStrokes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkStrokes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkStrokes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkStrokes*, Int32*, HRESULT)
    get__new_enum : Proc(IInkStrokes*, IUnknown*, HRESULT)
    get_ink : Proc(IInkStrokes*, IInkDisp*, HRESULT)
    get_recognition_result : Proc(IInkStrokes*, IInkRecognitionResult*, HRESULT)
    to_string : Proc(IInkStrokes*, UInt8**, HRESULT)
    item : Proc(IInkStrokes*, Int32, IInkStrokeDisp*, HRESULT)
    add : Proc(IInkStrokes*, IInkStrokeDisp, HRESULT)
    add_strokes : Proc(IInkStrokes*, IInkStrokes, HRESULT)
    remove : Proc(IInkStrokes*, IInkStrokeDisp, HRESULT)
    remove_strokes : Proc(IInkStrokes*, IInkStrokes, HRESULT)
    modify_drawing_attributes : Proc(IInkStrokes*, IInkDrawingAttributes, HRESULT)
    get_bounding_box : Proc(IInkStrokes*, InkBoundingBoxMode, IInkRectangle*, HRESULT)
    transform : Proc(IInkStrokes*, IInkTransform, Int16, HRESULT)
    scale_to_rectangle : Proc(IInkStrokes*, IInkRectangle, HRESULT)
    move : Proc(IInkStrokes*, Float32, Float32, HRESULT)
    rotate : Proc(IInkStrokes*, Float32, Float32, Float32, HRESULT)
    shear : Proc(IInkStrokes*, Float32, Float32, HRESULT)
    scale_transform : Proc(IInkStrokes*, Float32, Float32, HRESULT)
    clip : Proc(IInkStrokes*, IInkRectangle, HRESULT)
    remove_recognition_result : Proc(IInkStrokes*, HRESULT)
  end

  IInkStrokes_GUID = "f1f4c9d8-590a-4963-b3ae-1935671bb6f3"
  IID_IInkStrokes = LibC::GUID.new(0xf1f4c9d8_u32, 0x590a_u16, 0x4963_u16, StaticArray[0xb3_u8, 0xae_u8, 0x19_u8, 0x35_u8, 0x67_u8, 0x1b_u8, 0xb6_u8, 0xf3_u8])
  struct IInkStrokes
    lpVtbl : IInkStrokesVTbl*
  end

  struct IInkCustomStrokesVTbl
    query_interface : Proc(IInkCustomStrokes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCustomStrokes*, UInt32)
    release : Proc(IInkCustomStrokes*, UInt32)
    get_type_info_count : Proc(IInkCustomStrokes*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCustomStrokes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCustomStrokes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCustomStrokes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkCustomStrokes*, Int32*, HRESULT)
    get__new_enum : Proc(IInkCustomStrokes*, IUnknown*, HRESULT)
    item : Proc(IInkCustomStrokes*, VARIANT, IInkStrokes*, HRESULT)
    add : Proc(IInkCustomStrokes*, UInt8*, IInkStrokes, HRESULT)
    remove : Proc(IInkCustomStrokes*, VARIANT, HRESULT)
    clear : Proc(IInkCustomStrokes*, HRESULT)
  end

  IInkCustomStrokes_GUID = "7e23a88f-c30e-420f-9bdb-28902543f0c1"
  IID_IInkCustomStrokes = LibC::GUID.new(0x7e23a88f_u32, 0xc30e_u16, 0x420f_u16, StaticArray[0x9b_u8, 0xdb_u8, 0x28_u8, 0x90_u8, 0x25_u8, 0x43_u8, 0xf0_u8, 0xc1_u8])
  struct IInkCustomStrokes
    lpVtbl : IInkCustomStrokesVTbl*
  end

  struct IIInkStrokesEventsVTbl
    query_interface : Proc(IIInkStrokesEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkStrokesEvents*, UInt32)
    release : Proc(IIInkStrokesEvents*, UInt32)
    get_type_info_count : Proc(IIInkStrokesEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkStrokesEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkStrokesEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkStrokesEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkStrokesEvents_GUID = "f33053ec-5d25-430a-928f-76a6491dde15"
  IID_IIInkStrokesEvents = LibC::GUID.new(0xf33053ec_u32, 0x5d25_u16, 0x430a_u16, StaticArray[0x92_u8, 0x8f_u8, 0x76_u8, 0xa6_u8, 0x49_u8, 0x1d_u8, 0xde_u8, 0x15_u8])
  struct IIInkStrokesEvents
    lpVtbl : IIInkStrokesEventsVTbl*
  end

  struct IInkDispVTbl
    query_interface : Proc(IInkDisp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDisp*, UInt32)
    release : Proc(IInkDisp*, UInt32)
    get_type_info_count : Proc(IInkDisp*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDisp*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDisp*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDisp*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_strokes : Proc(IInkDisp*, IInkStrokes*, HRESULT)
    get_extended_properties : Proc(IInkDisp*, IInkExtendedProperties*, HRESULT)
    get_dirty : Proc(IInkDisp*, Int16*, HRESULT)
    put_dirty : Proc(IInkDisp*, Int16, HRESULT)
    get_custom_strokes : Proc(IInkDisp*, IInkCustomStrokes*, HRESULT)
    get_bounding_box : Proc(IInkDisp*, InkBoundingBoxMode, IInkRectangle*, HRESULT)
    delete_strokes : Proc(IInkDisp*, IInkStrokes, HRESULT)
    delete_stroke : Proc(IInkDisp*, IInkStrokeDisp, HRESULT)
    extract_strokes : Proc(IInkDisp*, IInkStrokes, InkExtractFlags, IInkDisp*, HRESULT)
    extract_with_rectangle : Proc(IInkDisp*, IInkRectangle, InkExtractFlags, IInkDisp*, HRESULT)
    clip : Proc(IInkDisp*, IInkRectangle, HRESULT)
    clone : Proc(IInkDisp*, IInkDisp*, HRESULT)
    hit_test_circle : Proc(IInkDisp*, Int32, Int32, Float32, IInkStrokes*, HRESULT)
    hit_test_with_rectangle : Proc(IInkDisp*, IInkRectangle, Float32, IInkStrokes*, HRESULT)
    hit_test_with_lasso : Proc(IInkDisp*, VARIANT, Float32, VARIANT*, IInkStrokes*, HRESULT)
    nearest_point : Proc(IInkDisp*, Int32, Int32, Float32*, Float32*, IInkStrokeDisp*, HRESULT)
    create_strokes : Proc(IInkDisp*, VARIANT, IInkStrokes*, HRESULT)
    add_strokes_at_rectangle : Proc(IInkDisp*, IInkStrokes, IInkRectangle, HRESULT)
    save : Proc(IInkDisp*, InkPersistenceFormat, InkPersistenceCompressionMode, VARIANT*, HRESULT)
    load : Proc(IInkDisp*, VARIANT, HRESULT)
    create_stroke : Proc(IInkDisp*, VARIANT, VARIANT, IInkStrokeDisp*, HRESULT)
    clipboard_copy_with_rectangle : Proc(IInkDisp*, IInkRectangle, InkClipboardFormats, InkClipboardModes, IDataObject*, HRESULT)
    clipboard_copy : Proc(IInkDisp*, IInkStrokes, InkClipboardFormats, InkClipboardModes, IDataObject*, HRESULT)
    can_paste : Proc(IInkDisp*, IDataObject, Int16*, HRESULT)
    clipboard_paste : Proc(IInkDisp*, Int32, Int32, IDataObject, IInkStrokes*, HRESULT)
  end

  IInkDisp_GUID = "9d398fa0-c4e2-4fcd-9973-975caaf47ea6"
  IID_IInkDisp = LibC::GUID.new(0x9d398fa0_u32, 0xc4e2_u16, 0x4fcd_u16, StaticArray[0x99_u8, 0x73_u8, 0x97_u8, 0x5c_u8, 0xaa_u8, 0xf4_u8, 0x7e_u8, 0xa6_u8])
  struct IInkDisp
    lpVtbl : IInkDispVTbl*
  end

  struct IIInkEventsVTbl
    query_interface : Proc(IIInkEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkEvents*, UInt32)
    release : Proc(IIInkEvents*, UInt32)
    get_type_info_count : Proc(IIInkEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkEvents_GUID = "427b1865-ca3f-479a-83a9-0f420f2a0073"
  IID_IIInkEvents = LibC::GUID.new(0x427b1865_u32, 0xca3f_u16, 0x479a_u16, StaticArray[0x83_u8, 0xa9_u8, 0xf_u8, 0x42_u8, 0xf_u8, 0x2a_u8, 0x0_u8, 0x73_u8])
  struct IIInkEvents
    lpVtbl : IIInkEventsVTbl*
  end

  struct IInkRendererVTbl
    query_interface : Proc(IInkRenderer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRenderer*, UInt32)
    release : Proc(IInkRenderer*, UInt32)
    get_type_info_count : Proc(IInkRenderer*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRenderer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRenderer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRenderer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_view_transform : Proc(IInkRenderer*, IInkTransform, HRESULT)
    set_view_transform : Proc(IInkRenderer*, IInkTransform, HRESULT)
    get_object_transform : Proc(IInkRenderer*, IInkTransform, HRESULT)
    set_object_transform : Proc(IInkRenderer*, IInkTransform, HRESULT)
    draw : Proc(IInkRenderer*, LibC::IntPtrT, IInkStrokes, HRESULT)
    draw_stroke : Proc(IInkRenderer*, LibC::IntPtrT, IInkStrokeDisp, IInkDrawingAttributes, HRESULT)
    pixel_to_ink_space : Proc(IInkRenderer*, LibC::IntPtrT, Int32*, Int32*, HRESULT)
    ink_space_to_pixel : Proc(IInkRenderer*, LibC::IntPtrT, Int32*, Int32*, HRESULT)
    pixel_to_ink_space_from_points : Proc(IInkRenderer*, LibC::IntPtrT, VARIANT*, HRESULT)
    ink_space_to_pixel_from_points : Proc(IInkRenderer*, LibC::IntPtrT, VARIANT*, HRESULT)
    measure : Proc(IInkRenderer*, IInkStrokes, IInkRectangle*, HRESULT)
    measure_stroke : Proc(IInkRenderer*, IInkStrokeDisp, IInkDrawingAttributes, IInkRectangle*, HRESULT)
    move : Proc(IInkRenderer*, Float32, Float32, HRESULT)
    rotate : Proc(IInkRenderer*, Float32, Float32, Float32, HRESULT)
    scale_transform : Proc(IInkRenderer*, Float32, Float32, Int16, HRESULT)
  end

  IInkRenderer_GUID = "e6257a9c-b511-4f4c-a8b0-a7dbc9506b83"
  IID_IInkRenderer = LibC::GUID.new(0xe6257a9c_u32, 0xb511_u16, 0x4f4c_u16, StaticArray[0xa8_u8, 0xb0_u8, 0xa7_u8, 0xdb_u8, 0xc9_u8, 0x50_u8, 0x6b_u8, 0x83_u8])
  struct IInkRenderer
    lpVtbl : IInkRendererVTbl*
  end

  struct IInkCollectorVTbl
    query_interface : Proc(IInkCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCollector*, UInt32)
    release : Proc(IInkCollector*, UInt32)
    get_type_info_count : Proc(IInkCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_wnd : Proc(IInkCollector*, LibC::IntPtrT*, HRESULT)
    put_h_wnd : Proc(IInkCollector*, LibC::IntPtrT, HRESULT)
    get_enabled : Proc(IInkCollector*, Int16*, HRESULT)
    put_enabled : Proc(IInkCollector*, Int16, HRESULT)
    get_default_drawing_attributes : Proc(IInkCollector*, IInkDrawingAttributes*, HRESULT)
    putref_default_drawing_attributes : Proc(IInkCollector*, IInkDrawingAttributes, HRESULT)
    get_renderer : Proc(IInkCollector*, IInkRenderer*, HRESULT)
    putref_renderer : Proc(IInkCollector*, IInkRenderer, HRESULT)
    get_ink : Proc(IInkCollector*, IInkDisp*, HRESULT)
    putref_ink : Proc(IInkCollector*, IInkDisp, HRESULT)
    get_auto_redraw : Proc(IInkCollector*, Int16*, HRESULT)
    put_auto_redraw : Proc(IInkCollector*, Int16, HRESULT)
    get_collecting_ink : Proc(IInkCollector*, Int16*, HRESULT)
    get_collection_mode : Proc(IInkCollector*, InkCollectionMode*, HRESULT)
    put_collection_mode : Proc(IInkCollector*, InkCollectionMode, HRESULT)
    get_dynamic_rendering : Proc(IInkCollector*, Int16*, HRESULT)
    put_dynamic_rendering : Proc(IInkCollector*, Int16, HRESULT)
    get_desired_packet_description : Proc(IInkCollector*, VARIANT*, HRESULT)
    put_desired_packet_description : Proc(IInkCollector*, VARIANT, HRESULT)
    get_mouse_icon : Proc(IInkCollector*, IPictureDisp*, HRESULT)
    put_mouse_icon : Proc(IInkCollector*, IPictureDisp, HRESULT)
    putref_mouse_icon : Proc(IInkCollector*, IPictureDisp, HRESULT)
    get_mouse_pointer : Proc(IInkCollector*, InkMousePointer*, HRESULT)
    put_mouse_pointer : Proc(IInkCollector*, InkMousePointer, HRESULT)
    get_cursors : Proc(IInkCollector*, IInkCursors*, HRESULT)
    get_margin_x : Proc(IInkCollector*, Int32*, HRESULT)
    put_margin_x : Proc(IInkCollector*, Int32, HRESULT)
    get_margin_y : Proc(IInkCollector*, Int32*, HRESULT)
    put_margin_y : Proc(IInkCollector*, Int32, HRESULT)
    get_tablet : Proc(IInkCollector*, IInkTablet*, HRESULT)
    get_support_high_contrast_ink : Proc(IInkCollector*, Int16*, HRESULT)
    put_support_high_contrast_ink : Proc(IInkCollector*, Int16, HRESULT)
    set_gesture_status : Proc(IInkCollector*, InkApplicationGesture, Int16, HRESULT)
    get_gesture_status : Proc(IInkCollector*, InkApplicationGesture, Int16*, HRESULT)
    get_window_input_rectangle : Proc(IInkCollector*, IInkRectangle*, HRESULT)
    set_window_input_rectangle : Proc(IInkCollector*, IInkRectangle, HRESULT)
    set_all_tablets_mode : Proc(IInkCollector*, Int16, HRESULT)
    set_single_tablet_integrated_mode : Proc(IInkCollector*, IInkTablet, HRESULT)
    get_event_interest : Proc(IInkCollector*, InkCollectorEventInterest, Int16*, HRESULT)
    set_event_interest : Proc(IInkCollector*, InkCollectorEventInterest, Int16, HRESULT)
  end

  IInkCollector_GUID = "f0f060b5-8b1f-4a7c-89ec-880692588a4f"
  IID_IInkCollector = LibC::GUID.new(0xf0f060b5_u32, 0x8b1f_u16, 0x4a7c_u16, StaticArray[0x89_u8, 0xec_u8, 0x88_u8, 0x6_u8, 0x92_u8, 0x58_u8, 0x8a_u8, 0x4f_u8])
  struct IInkCollector
    lpVtbl : IInkCollectorVTbl*
  end

  struct IIInkCollectorEventsVTbl
    query_interface : Proc(IIInkCollectorEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkCollectorEvents*, UInt32)
    release : Proc(IIInkCollectorEvents*, UInt32)
    get_type_info_count : Proc(IIInkCollectorEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkCollectorEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkCollectorEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkCollectorEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkCollectorEvents_GUID = "11a583f2-712d-4fea-abcf-ab4af38ea06b"
  IID_IIInkCollectorEvents = LibC::GUID.new(0x11a583f2_u32, 0x712d_u16, 0x4fea_u16, StaticArray[0xab_u8, 0xcf_u8, 0xab_u8, 0x4a_u8, 0xf3_u8, 0x8e_u8, 0xa0_u8, 0x6b_u8])
  struct IIInkCollectorEvents
    lpVtbl : IIInkCollectorEventsVTbl*
  end

  struct IInkOverlayVTbl
    query_interface : Proc(IInkOverlay*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkOverlay*, UInt32)
    release : Proc(IInkOverlay*, UInt32)
    get_type_info_count : Proc(IInkOverlay*, UInt32*, HRESULT)
    get_type_info : Proc(IInkOverlay*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkOverlay*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkOverlay*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_wnd : Proc(IInkOverlay*, LibC::IntPtrT*, HRESULT)
    put_h_wnd : Proc(IInkOverlay*, LibC::IntPtrT, HRESULT)
    get_enabled : Proc(IInkOverlay*, Int16*, HRESULT)
    put_enabled : Proc(IInkOverlay*, Int16, HRESULT)
    get_default_drawing_attributes : Proc(IInkOverlay*, IInkDrawingAttributes*, HRESULT)
    putref_default_drawing_attributes : Proc(IInkOverlay*, IInkDrawingAttributes, HRESULT)
    get_renderer : Proc(IInkOverlay*, IInkRenderer*, HRESULT)
    putref_renderer : Proc(IInkOverlay*, IInkRenderer, HRESULT)
    get_ink : Proc(IInkOverlay*, IInkDisp*, HRESULT)
    putref_ink : Proc(IInkOverlay*, IInkDisp, HRESULT)
    get_auto_redraw : Proc(IInkOverlay*, Int16*, HRESULT)
    put_auto_redraw : Proc(IInkOverlay*, Int16, HRESULT)
    get_collecting_ink : Proc(IInkOverlay*, Int16*, HRESULT)
    get_collection_mode : Proc(IInkOverlay*, InkCollectionMode*, HRESULT)
    put_collection_mode : Proc(IInkOverlay*, InkCollectionMode, HRESULT)
    get_dynamic_rendering : Proc(IInkOverlay*, Int16*, HRESULT)
    put_dynamic_rendering : Proc(IInkOverlay*, Int16, HRESULT)
    get_desired_packet_description : Proc(IInkOverlay*, VARIANT*, HRESULT)
    put_desired_packet_description : Proc(IInkOverlay*, VARIANT, HRESULT)
    get_mouse_icon : Proc(IInkOverlay*, IPictureDisp*, HRESULT)
    put_mouse_icon : Proc(IInkOverlay*, IPictureDisp, HRESULT)
    putref_mouse_icon : Proc(IInkOverlay*, IPictureDisp, HRESULT)
    get_mouse_pointer : Proc(IInkOverlay*, InkMousePointer*, HRESULT)
    put_mouse_pointer : Proc(IInkOverlay*, InkMousePointer, HRESULT)
    get_editing_mode : Proc(IInkOverlay*, InkOverlayEditingMode*, HRESULT)
    put_editing_mode : Proc(IInkOverlay*, InkOverlayEditingMode, HRESULT)
    get_selection : Proc(IInkOverlay*, IInkStrokes*, HRESULT)
    put_selection : Proc(IInkOverlay*, IInkStrokes, HRESULT)
    get_eraser_mode : Proc(IInkOverlay*, InkOverlayEraserMode*, HRESULT)
    put_eraser_mode : Proc(IInkOverlay*, InkOverlayEraserMode, HRESULT)
    get_eraser_width : Proc(IInkOverlay*, Int32*, HRESULT)
    put_eraser_width : Proc(IInkOverlay*, Int32, HRESULT)
    get_attach_mode : Proc(IInkOverlay*, InkOverlayAttachMode*, HRESULT)
    put_attach_mode : Proc(IInkOverlay*, InkOverlayAttachMode, HRESULT)
    get_cursors : Proc(IInkOverlay*, IInkCursors*, HRESULT)
    get_margin_x : Proc(IInkOverlay*, Int32*, HRESULT)
    put_margin_x : Proc(IInkOverlay*, Int32, HRESULT)
    get_margin_y : Proc(IInkOverlay*, Int32*, HRESULT)
    put_margin_y : Proc(IInkOverlay*, Int32, HRESULT)
    get_tablet : Proc(IInkOverlay*, IInkTablet*, HRESULT)
    get_support_high_contrast_ink : Proc(IInkOverlay*, Int16*, HRESULT)
    put_support_high_contrast_ink : Proc(IInkOverlay*, Int16, HRESULT)
    get_support_high_contrast_selection_ui : Proc(IInkOverlay*, Int16*, HRESULT)
    put_support_high_contrast_selection_ui : Proc(IInkOverlay*, Int16, HRESULT)
    hit_test_selection : Proc(IInkOverlay*, Int32, Int32, SelectionHitResult*, HRESULT)
    draw : Proc(IInkOverlay*, IInkRectangle, HRESULT)
    set_gesture_status : Proc(IInkOverlay*, InkApplicationGesture, Int16, HRESULT)
    get_gesture_status : Proc(IInkOverlay*, InkApplicationGesture, Int16*, HRESULT)
    get_window_input_rectangle : Proc(IInkOverlay*, IInkRectangle*, HRESULT)
    set_window_input_rectangle : Proc(IInkOverlay*, IInkRectangle, HRESULT)
    set_all_tablets_mode : Proc(IInkOverlay*, Int16, HRESULT)
    set_single_tablet_integrated_mode : Proc(IInkOverlay*, IInkTablet, HRESULT)
    get_event_interest : Proc(IInkOverlay*, InkCollectorEventInterest, Int16*, HRESULT)
    set_event_interest : Proc(IInkOverlay*, InkCollectorEventInterest, Int16, HRESULT)
  end

  IInkOverlay_GUID = "b82a463b-c1c5-45a3-997c-deab5651b67a"
  IID_IInkOverlay = LibC::GUID.new(0xb82a463b_u32, 0xc1c5_u16, 0x45a3_u16, StaticArray[0x99_u8, 0x7c_u8, 0xde_u8, 0xab_u8, 0x56_u8, 0x51_u8, 0xb6_u8, 0x7a_u8])
  struct IInkOverlay
    lpVtbl : IInkOverlayVTbl*
  end

  struct IIInkOverlayEventsVTbl
    query_interface : Proc(IIInkOverlayEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkOverlayEvents*, UInt32)
    release : Proc(IIInkOverlayEvents*, UInt32)
    get_type_info_count : Proc(IIInkOverlayEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkOverlayEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkOverlayEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkOverlayEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkOverlayEvents_GUID = "31179b69-e563-489e-b16f-712f1e8a0651"
  IID_IIInkOverlayEvents = LibC::GUID.new(0x31179b69_u32, 0xe563_u16, 0x489e_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x71_u8, 0x2f_u8, 0x1e_u8, 0x8a_u8, 0x6_u8, 0x51_u8])
  struct IIInkOverlayEvents
    lpVtbl : IIInkOverlayEventsVTbl*
  end

  struct IInkPictureVTbl
    query_interface : Proc(IInkPicture*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkPicture*, UInt32)
    release : Proc(IInkPicture*, UInt32)
    get_type_info_count : Proc(IInkPicture*, UInt32*, HRESULT)
    get_type_info : Proc(IInkPicture*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkPicture*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkPicture*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_wnd : Proc(IInkPicture*, LibC::IntPtrT*, HRESULT)
    get_default_drawing_attributes : Proc(IInkPicture*, IInkDrawingAttributes*, HRESULT)
    putref_default_drawing_attributes : Proc(IInkPicture*, IInkDrawingAttributes, HRESULT)
    get_renderer : Proc(IInkPicture*, IInkRenderer*, HRESULT)
    putref_renderer : Proc(IInkPicture*, IInkRenderer, HRESULT)
    get_ink : Proc(IInkPicture*, IInkDisp*, HRESULT)
    putref_ink : Proc(IInkPicture*, IInkDisp, HRESULT)
    get_auto_redraw : Proc(IInkPicture*, Int16*, HRESULT)
    put_auto_redraw : Proc(IInkPicture*, Int16, HRESULT)
    get_collecting_ink : Proc(IInkPicture*, Int16*, HRESULT)
    get_collection_mode : Proc(IInkPicture*, InkCollectionMode*, HRESULT)
    put_collection_mode : Proc(IInkPicture*, InkCollectionMode, HRESULT)
    get_dynamic_rendering : Proc(IInkPicture*, Int16*, HRESULT)
    put_dynamic_rendering : Proc(IInkPicture*, Int16, HRESULT)
    get_desired_packet_description : Proc(IInkPicture*, VARIANT*, HRESULT)
    put_desired_packet_description : Proc(IInkPicture*, VARIANT, HRESULT)
    get_mouse_icon : Proc(IInkPicture*, IPictureDisp*, HRESULT)
    put_mouse_icon : Proc(IInkPicture*, IPictureDisp, HRESULT)
    putref_mouse_icon : Proc(IInkPicture*, IPictureDisp, HRESULT)
    get_mouse_pointer : Proc(IInkPicture*, InkMousePointer*, HRESULT)
    put_mouse_pointer : Proc(IInkPicture*, InkMousePointer, HRESULT)
    get_editing_mode : Proc(IInkPicture*, InkOverlayEditingMode*, HRESULT)
    put_editing_mode : Proc(IInkPicture*, InkOverlayEditingMode, HRESULT)
    get_selection : Proc(IInkPicture*, IInkStrokes*, HRESULT)
    put_selection : Proc(IInkPicture*, IInkStrokes, HRESULT)
    get_eraser_mode : Proc(IInkPicture*, InkOverlayEraserMode*, HRESULT)
    put_eraser_mode : Proc(IInkPicture*, InkOverlayEraserMode, HRESULT)
    get_eraser_width : Proc(IInkPicture*, Int32*, HRESULT)
    put_eraser_width : Proc(IInkPicture*, Int32, HRESULT)
    putref_picture : Proc(IInkPicture*, IPictureDisp, HRESULT)
    put_picture : Proc(IInkPicture*, IPictureDisp, HRESULT)
    get_picture : Proc(IInkPicture*, IPictureDisp*, HRESULT)
    put_size_mode : Proc(IInkPicture*, InkPictureSizeMode, HRESULT)
    get_size_mode : Proc(IInkPicture*, InkPictureSizeMode*, HRESULT)
    put_back_color : Proc(IInkPicture*, UInt32, HRESULT)
    get_back_color : Proc(IInkPicture*, UInt32*, HRESULT)
    get_cursors : Proc(IInkPicture*, IInkCursors*, HRESULT)
    get_margin_x : Proc(IInkPicture*, Int32*, HRESULT)
    put_margin_x : Proc(IInkPicture*, Int32, HRESULT)
    get_margin_y : Proc(IInkPicture*, Int32*, HRESULT)
    put_margin_y : Proc(IInkPicture*, Int32, HRESULT)
    get_tablet : Proc(IInkPicture*, IInkTablet*, HRESULT)
    get_support_high_contrast_ink : Proc(IInkPicture*, Int16*, HRESULT)
    put_support_high_contrast_ink : Proc(IInkPicture*, Int16, HRESULT)
    get_support_high_contrast_selection_ui : Proc(IInkPicture*, Int16*, HRESULT)
    put_support_high_contrast_selection_ui : Proc(IInkPicture*, Int16, HRESULT)
    hit_test_selection : Proc(IInkPicture*, Int32, Int32, SelectionHitResult*, HRESULT)
    set_gesture_status : Proc(IInkPicture*, InkApplicationGesture, Int16, HRESULT)
    get_gesture_status : Proc(IInkPicture*, InkApplicationGesture, Int16*, HRESULT)
    get_window_input_rectangle : Proc(IInkPicture*, IInkRectangle*, HRESULT)
    set_window_input_rectangle : Proc(IInkPicture*, IInkRectangle, HRESULT)
    set_all_tablets_mode : Proc(IInkPicture*, Int16, HRESULT)
    set_single_tablet_integrated_mode : Proc(IInkPicture*, IInkTablet, HRESULT)
    get_event_interest : Proc(IInkPicture*, InkCollectorEventInterest, Int16*, HRESULT)
    set_event_interest : Proc(IInkPicture*, InkCollectorEventInterest, Int16, HRESULT)
    get_ink_enabled : Proc(IInkPicture*, Int16*, HRESULT)
    put_ink_enabled : Proc(IInkPicture*, Int16, HRESULT)
    get_enabled : Proc(IInkPicture*, Int16*, HRESULT)
    put_enabled : Proc(IInkPicture*, Int16, HRESULT)
  end

  IInkPicture_GUID = "e85662e0-379a-40d7-9b5c-757d233f9923"
  IID_IInkPicture = LibC::GUID.new(0xe85662e0_u32, 0x379a_u16, 0x40d7_u16, StaticArray[0x9b_u8, 0x5c_u8, 0x75_u8, 0x7d_u8, 0x23_u8, 0x3f_u8, 0x99_u8, 0x23_u8])
  struct IInkPicture
    lpVtbl : IInkPictureVTbl*
  end

  struct IIInkPictureEventsVTbl
    query_interface : Proc(IIInkPictureEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkPictureEvents*, UInt32)
    release : Proc(IIInkPictureEvents*, UInt32)
    get_type_info_count : Proc(IIInkPictureEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkPictureEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkPictureEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkPictureEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkPictureEvents_GUID = "60ff4fee-22ff-4484-acc1-d308d9cd7ea3"
  IID_IIInkPictureEvents = LibC::GUID.new(0x60ff4fee_u32, 0x22ff_u16, 0x4484_u16, StaticArray[0xac_u8, 0xc1_u8, 0xd3_u8, 0x8_u8, 0xd9_u8, 0xcd_u8, 0x7e_u8, 0xa3_u8])
  struct IIInkPictureEvents
    lpVtbl : IIInkPictureEventsVTbl*
  end

  struct IInkRecognizerVTbl
    query_interface : Proc(IInkRecognizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizer*, UInt32)
    release : Proc(IInkRecognizer*, UInt32)
    get_type_info_count : Proc(IInkRecognizer*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IInkRecognizer*, UInt8**, HRESULT)
    get_vendor : Proc(IInkRecognizer*, UInt8**, HRESULT)
    get_capabilities : Proc(IInkRecognizer*, InkRecognizerCapabilities*, HRESULT)
    get_languages : Proc(IInkRecognizer*, VARIANT*, HRESULT)
    get_supported_properties : Proc(IInkRecognizer*, VARIANT*, HRESULT)
    get_preferred_packet_description : Proc(IInkRecognizer*, VARIANT*, HRESULT)
    create_recognizer_context : Proc(IInkRecognizer*, IInkRecognizerContext*, HRESULT)
  end

  IInkRecognizer_GUID = "782bf7cf-034b-4396-8a32-3a1833cf6b56"
  IID_IInkRecognizer = LibC::GUID.new(0x782bf7cf_u32, 0x34b_u16, 0x4396_u16, StaticArray[0x8a_u8, 0x32_u8, 0x3a_u8, 0x18_u8, 0x33_u8, 0xcf_u8, 0x6b_u8, 0x56_u8])
  struct IInkRecognizer
    lpVtbl : IInkRecognizerVTbl*
  end

  struct IInkRecognizer2VTbl
    query_interface : Proc(IInkRecognizer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizer2*, UInt32)
    release : Proc(IInkRecognizer2*, UInt32)
    get_type_info_count : Proc(IInkRecognizer2*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizer2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizer2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizer2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IInkRecognizer2*, UInt8**, HRESULT)
    get_unicode_ranges : Proc(IInkRecognizer2*, VARIANT*, HRESULT)
  end

  IInkRecognizer2_GUID = "6110118a-3a75-4ad6-b2aa-04b2b72bbe65"
  IID_IInkRecognizer2 = LibC::GUID.new(0x6110118a_u32, 0x3a75_u16, 0x4ad6_u16, StaticArray[0xb2_u8, 0xaa_u8, 0x4_u8, 0xb2_u8, 0xb7_u8, 0x2b_u8, 0xbe_u8, 0x65_u8])
  struct IInkRecognizer2
    lpVtbl : IInkRecognizer2VTbl*
  end

  struct IInkRecognizersVTbl
    query_interface : Proc(IInkRecognizers*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizers*, UInt32)
    release : Proc(IInkRecognizers*, UInt32)
    get_type_info_count : Proc(IInkRecognizers*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizers*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizers*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizers*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkRecognizers*, Int32*, HRESULT)
    get__new_enum : Proc(IInkRecognizers*, IUnknown*, HRESULT)
    get_default_recognizer : Proc(IInkRecognizers*, Int32, IInkRecognizer*, HRESULT)
    item : Proc(IInkRecognizers*, Int32, IInkRecognizer*, HRESULT)
  end

  IInkRecognizers_GUID = "9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd"
  IID_IInkRecognizers = LibC::GUID.new(0x9ccc4f12_u32, 0xb0b7_u16, 0x4a8b_u16, StaticArray[0xbf_u8, 0x58_u8, 0x4a_u8, 0xec_u8, 0xa4_u8, 0xe8_u8, 0xce_u8, 0xfd_u8])
  struct IInkRecognizers
    lpVtbl : IInkRecognizersVTbl*
  end

  struct IIInkRecognitionEventsVTbl
    query_interface : Proc(IIInkRecognitionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkRecognitionEvents*, UInt32)
    release : Proc(IIInkRecognitionEvents*, UInt32)
    get_type_info_count : Proc(IIInkRecognitionEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkRecognitionEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkRecognitionEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkRecognitionEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkRecognitionEvents_GUID = "17bce92f-2e21-47fd-9d33-3c6afbfd8c59"
  IID_IIInkRecognitionEvents = LibC::GUID.new(0x17bce92f_u32, 0x2e21_u16, 0x47fd_u16, StaticArray[0x9d_u8, 0x33_u8, 0x3c_u8, 0x6a_u8, 0xfb_u8, 0xfd_u8, 0x8c_u8, 0x59_u8])
  struct IIInkRecognitionEvents
    lpVtbl : IIInkRecognitionEventsVTbl*
  end

  struct IInkRecognizerContextVTbl
    query_interface : Proc(IInkRecognizerContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizerContext*, UInt32)
    release : Proc(IInkRecognizerContext*, UInt32)
    get_type_info_count : Proc(IInkRecognizerContext*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizerContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizerContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizerContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_strokes : Proc(IInkRecognizerContext*, IInkStrokes*, HRESULT)
    putref_strokes : Proc(IInkRecognizerContext*, IInkStrokes, HRESULT)
    get_character_auto_completion_mode : Proc(IInkRecognizerContext*, InkRecognizerCharacterAutoCompletionMode*, HRESULT)
    put_character_auto_completion_mode : Proc(IInkRecognizerContext*, InkRecognizerCharacterAutoCompletionMode, HRESULT)
    get_factoid : Proc(IInkRecognizerContext*, UInt8**, HRESULT)
    put_factoid : Proc(IInkRecognizerContext*, UInt8*, HRESULT)
    get_guide : Proc(IInkRecognizerContext*, IInkRecognizerGuide*, HRESULT)
    putref_guide : Proc(IInkRecognizerContext*, IInkRecognizerGuide, HRESULT)
    get_prefix_text : Proc(IInkRecognizerContext*, UInt8**, HRESULT)
    put_prefix_text : Proc(IInkRecognizerContext*, UInt8*, HRESULT)
    get_suffix_text : Proc(IInkRecognizerContext*, UInt8**, HRESULT)
    put_suffix_text : Proc(IInkRecognizerContext*, UInt8*, HRESULT)
    get_recognition_flags : Proc(IInkRecognizerContext*, InkRecognitionModes*, HRESULT)
    put_recognition_flags : Proc(IInkRecognizerContext*, InkRecognitionModes, HRESULT)
    get_word_list : Proc(IInkRecognizerContext*, IInkWordList*, HRESULT)
    putref_word_list : Proc(IInkRecognizerContext*, IInkWordList, HRESULT)
    get_recognizer : Proc(IInkRecognizerContext*, IInkRecognizer*, HRESULT)
    recognize : Proc(IInkRecognizerContext*, InkRecognitionStatus*, IInkRecognitionResult*, HRESULT)
    stop_background_recognition : Proc(IInkRecognizerContext*, HRESULT)
    end_ink_input : Proc(IInkRecognizerContext*, HRESULT)
    background_recognize : Proc(IInkRecognizerContext*, VARIANT, HRESULT)
    background_recognize_with_alternates : Proc(IInkRecognizerContext*, VARIANT, HRESULT)
    clone : Proc(IInkRecognizerContext*, IInkRecognizerContext*, HRESULT)
    is_string_supported : Proc(IInkRecognizerContext*, UInt8*, Int16*, HRESULT)
  end

  IInkRecognizerContext_GUID = "c68f52f9-32a3-4625-906c-44fc23b40958"
  IID_IInkRecognizerContext = LibC::GUID.new(0xc68f52f9_u32, 0x32a3_u16, 0x4625_u16, StaticArray[0x90_u8, 0x6c_u8, 0x44_u8, 0xfc_u8, 0x23_u8, 0xb4_u8, 0x9_u8, 0x58_u8])
  struct IInkRecognizerContext
    lpVtbl : IInkRecognizerContextVTbl*
  end

  struct IInkRecognizerContext2VTbl
    query_interface : Proc(IInkRecognizerContext2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizerContext2*, UInt32)
    release : Proc(IInkRecognizerContext2*, UInt32)
    get_type_info_count : Proc(IInkRecognizerContext2*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizerContext2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizerContext2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizerContext2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_enabled_unicode_ranges : Proc(IInkRecognizerContext2*, VARIANT*, HRESULT)
    put_enabled_unicode_ranges : Proc(IInkRecognizerContext2*, VARIANT, HRESULT)
  end

  IInkRecognizerContext2_GUID = "d6f0e32f-73d8-408e-8e9f-5fea592c363f"
  IID_IInkRecognizerContext2 = LibC::GUID.new(0xd6f0e32f_u32, 0x73d8_u16, 0x408e_u16, StaticArray[0x8e_u8, 0x9f_u8, 0x5f_u8, 0xea_u8, 0x59_u8, 0x2c_u8, 0x36_u8, 0x3f_u8])
  struct IInkRecognizerContext2
    lpVtbl : IInkRecognizerContext2VTbl*
  end

  struct IInkRecognitionResultVTbl
    query_interface : Proc(IInkRecognitionResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognitionResult*, UInt32)
    release : Proc(IInkRecognitionResult*, UInt32)
    get_type_info_count : Proc(IInkRecognitionResult*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognitionResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognitionResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognitionResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_top_string : Proc(IInkRecognitionResult*, UInt8**, HRESULT)
    get_top_alternate : Proc(IInkRecognitionResult*, IInkRecognitionAlternate*, HRESULT)
    get_top_confidence : Proc(IInkRecognitionResult*, InkRecognitionConfidence*, HRESULT)
    get_strokes : Proc(IInkRecognitionResult*, IInkStrokes*, HRESULT)
    alternates_from_selection : Proc(IInkRecognitionResult*, Int32, Int32, Int32, IInkRecognitionAlternates*, HRESULT)
    modify_top_alternate : Proc(IInkRecognitionResult*, IInkRecognitionAlternate, HRESULT)
    set_result_on_strokes : Proc(IInkRecognitionResult*, HRESULT)
  end

  IInkRecognitionResult_GUID = "3bc129a8-86cd-45ad-bde8-e0d32d61c16d"
  IID_IInkRecognitionResult = LibC::GUID.new(0x3bc129a8_u32, 0x86cd_u16, 0x45ad_u16, StaticArray[0xbd_u8, 0xe8_u8, 0xe0_u8, 0xd3_u8, 0x2d_u8, 0x61_u8, 0xc1_u8, 0x6d_u8])
  struct IInkRecognitionResult
    lpVtbl : IInkRecognitionResultVTbl*
  end

  struct IInkRecognitionAlternateVTbl
    query_interface : Proc(IInkRecognitionAlternate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognitionAlternate*, UInt32)
    release : Proc(IInkRecognitionAlternate*, UInt32)
    get_type_info_count : Proc(IInkRecognitionAlternate*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognitionAlternate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognitionAlternate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognitionAlternate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_string : Proc(IInkRecognitionAlternate*, UInt8**, HRESULT)
    get_confidence : Proc(IInkRecognitionAlternate*, InkRecognitionConfidence*, HRESULT)
    get_baseline : Proc(IInkRecognitionAlternate*, VARIANT*, HRESULT)
    get_midline : Proc(IInkRecognitionAlternate*, VARIANT*, HRESULT)
    get_ascender : Proc(IInkRecognitionAlternate*, VARIANT*, HRESULT)
    get_descender : Proc(IInkRecognitionAlternate*, VARIANT*, HRESULT)
    get_line_number : Proc(IInkRecognitionAlternate*, Int32*, HRESULT)
    get_strokes : Proc(IInkRecognitionAlternate*, IInkStrokes*, HRESULT)
    get_line_alternates : Proc(IInkRecognitionAlternate*, IInkRecognitionAlternates*, HRESULT)
    get_confidence_alternates : Proc(IInkRecognitionAlternate*, IInkRecognitionAlternates*, HRESULT)
    get_strokes_from_stroke_ranges : Proc(IInkRecognitionAlternate*, IInkStrokes, IInkStrokes*, HRESULT)
    get_strokes_from_text_range : Proc(IInkRecognitionAlternate*, Int32*, Int32*, IInkStrokes*, HRESULT)
    get_text_range_from_strokes : Proc(IInkRecognitionAlternate*, IInkStrokes, Int32*, Int32*, HRESULT)
    alternates_with_constant_property_values : Proc(IInkRecognitionAlternate*, UInt8*, IInkRecognitionAlternates*, HRESULT)
    get_property_value : Proc(IInkRecognitionAlternate*, UInt8*, VARIANT*, HRESULT)
  end

  IInkRecognitionAlternate_GUID = "b7e660ad-77e4-429b-adda-873780d1fc4a"
  IID_IInkRecognitionAlternate = LibC::GUID.new(0xb7e660ad_u32, 0x77e4_u16, 0x429b_u16, StaticArray[0xad_u8, 0xda_u8, 0x87_u8, 0x37_u8, 0x80_u8, 0xd1_u8, 0xfc_u8, 0x4a_u8])
  struct IInkRecognitionAlternate
    lpVtbl : IInkRecognitionAlternateVTbl*
  end

  struct IInkRecognitionAlternatesVTbl
    query_interface : Proc(IInkRecognitionAlternates*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognitionAlternates*, UInt32)
    release : Proc(IInkRecognitionAlternates*, UInt32)
    get_type_info_count : Proc(IInkRecognitionAlternates*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognitionAlternates*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognitionAlternates*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognitionAlternates*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkRecognitionAlternates*, Int32*, HRESULT)
    get__new_enum : Proc(IInkRecognitionAlternates*, IUnknown*, HRESULT)
    get_strokes : Proc(IInkRecognitionAlternates*, IInkStrokes*, HRESULT)
    item : Proc(IInkRecognitionAlternates*, Int32, IInkRecognitionAlternate*, HRESULT)
  end

  IInkRecognitionAlternates_GUID = "286a167f-9f19-4c61-9d53-4f07be622b84"
  IID_IInkRecognitionAlternates = LibC::GUID.new(0x286a167f_u32, 0x9f19_u16, 0x4c61_u16, StaticArray[0x9d_u8, 0x53_u8, 0x4f_u8, 0x7_u8, 0xbe_u8, 0x62_u8, 0x2b_u8, 0x84_u8])
  struct IInkRecognitionAlternates
    lpVtbl : IInkRecognitionAlternatesVTbl*
  end

  struct IInkRecognizerGuideVTbl
    query_interface : Proc(IInkRecognizerGuide*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognizerGuide*, UInt32)
    release : Proc(IInkRecognizerGuide*, UInt32)
    get_type_info_count : Proc(IInkRecognizerGuide*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognizerGuide*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognizerGuide*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognizerGuide*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_writing_box : Proc(IInkRecognizerGuide*, IInkRectangle*, HRESULT)
    put_writing_box : Proc(IInkRecognizerGuide*, IInkRectangle, HRESULT)
    get_drawn_box : Proc(IInkRecognizerGuide*, IInkRectangle*, HRESULT)
    put_drawn_box : Proc(IInkRecognizerGuide*, IInkRectangle, HRESULT)
    get_rows : Proc(IInkRecognizerGuide*, Int32*, HRESULT)
    put_rows : Proc(IInkRecognizerGuide*, Int32, HRESULT)
    get_columns : Proc(IInkRecognizerGuide*, Int32*, HRESULT)
    put_columns : Proc(IInkRecognizerGuide*, Int32, HRESULT)
    get_midline : Proc(IInkRecognizerGuide*, Int32*, HRESULT)
    put_midline : Proc(IInkRecognizerGuide*, Int32, HRESULT)
    get_guide_data : Proc(IInkRecognizerGuide*, InkRecoGuide*, HRESULT)
    put_guide_data : Proc(IInkRecognizerGuide*, InkRecoGuide, HRESULT)
  end

  IInkRecognizerGuide_GUID = "d934be07-7b84-4208-9136-83c20994e905"
  IID_IInkRecognizerGuide = LibC::GUID.new(0xd934be07_u32, 0x7b84_u16, 0x4208_u16, StaticArray[0x91_u8, 0x36_u8, 0x83_u8, 0xc2_u8, 0x9_u8, 0x94_u8, 0xe9_u8, 0x5_u8])
  struct IInkRecognizerGuide
    lpVtbl : IInkRecognizerGuideVTbl*
  end

  struct IInkWordListVTbl
    query_interface : Proc(IInkWordList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkWordList*, UInt32)
    release : Proc(IInkWordList*, UInt32)
    get_type_info_count : Proc(IInkWordList*, UInt32*, HRESULT)
    get_type_info : Proc(IInkWordList*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkWordList*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkWordList*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_word : Proc(IInkWordList*, UInt8*, HRESULT)
    remove_word : Proc(IInkWordList*, UInt8*, HRESULT)
    merge : Proc(IInkWordList*, IInkWordList, HRESULT)
  end

  IInkWordList_GUID = "76ba3491-cb2f-406b-9961-0e0c4cdaaef2"
  IID_IInkWordList = LibC::GUID.new(0x76ba3491_u32, 0xcb2f_u16, 0x406b_u16, StaticArray[0x99_u8, 0x61_u8, 0xe_u8, 0xc_u8, 0x4c_u8, 0xda_u8, 0xae_u8, 0xf2_u8])
  struct IInkWordList
    lpVtbl : IInkWordListVTbl*
  end

  struct IInkWordList2VTbl
    query_interface : Proc(IInkWordList2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkWordList2*, UInt32)
    release : Proc(IInkWordList2*, UInt32)
    get_type_info_count : Proc(IInkWordList2*, UInt32*, HRESULT)
    get_type_info : Proc(IInkWordList2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkWordList2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkWordList2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_words : Proc(IInkWordList2*, UInt8*, HRESULT)
  end

  IInkWordList2_GUID = "14542586-11bf-4f5f-b6e7-49d0744aab6e"
  IID_IInkWordList2 = LibC::GUID.new(0x14542586_u32, 0x11bf_u16, 0x4f5f_u16, StaticArray[0xb6_u8, 0xe7_u8, 0x49_u8, 0xd0_u8, 0x74_u8, 0x4a_u8, 0xab_u8, 0x6e_u8])
  struct IInkWordList2
    lpVtbl : IInkWordList2VTbl*
  end

  struct IInkVTbl
    query_interface : Proc(IInk*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInk*, UInt32)
    release : Proc(IInk*, UInt32)
    get_type_info_count : Proc(IInk*, UInt32*, HRESULT)
    get_type_info : Proc(IInk*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInk*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInk*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IInk_GUID = "03f8e511-43a1-11d3-8bb6-0080c7d6bad5"
  IID_IInk = LibC::GUID.new(0x3f8e511_u32, 0x43a1_u16, 0x11d3_u16, StaticArray[0x8b_u8, 0xb6_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd6_u8, 0xba_u8, 0xd5_u8])
  struct IInk
    lpVtbl : IInkVTbl*
  end

  struct IInkLineInfoVTbl
    query_interface : Proc(IInkLineInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkLineInfo*, UInt32)
    release : Proc(IInkLineInfo*, UInt32)
    set_format : Proc(IInkLineInfo*, INKMETRIC*, HRESULT)
    get_format : Proc(IInkLineInfo*, INKMETRIC*, HRESULT)
    get_ink_extent : Proc(IInkLineInfo*, INKMETRIC*, UInt32*, HRESULT)
    get_candidate : Proc(IInkLineInfo*, UInt32, LibC::LPWSTR, UInt32*, UInt32, HRESULT)
    set_candidate : Proc(IInkLineInfo*, UInt32, LibC::LPWSTR, HRESULT)
    recognize : Proc(IInkLineInfo*, HRESULT)
  end

  IInkLineInfo_GUID = "9c1c5ad6-f22f-4de4-b453-a2cc482e7c33"
  IID_IInkLineInfo = LibC::GUID.new(0x9c1c5ad6_u32, 0xf22f_u16, 0x4de4_u16, StaticArray[0xb4_u8, 0x53_u8, 0xa2_u8, 0xcc_u8, 0x48_u8, 0x2e_u8, 0x7c_u8, 0x33_u8])
  struct IInkLineInfo
    lpVtbl : IInkLineInfoVTbl*
  end

  struct ISketchInkVTbl
    query_interface : Proc(ISketchInk*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISketchInk*, UInt32)
    release : Proc(ISketchInk*, UInt32)
    get_type_info_count : Proc(ISketchInk*, UInt32*, HRESULT)
    get_type_info : Proc(ISketchInk*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISketchInk*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISketchInk*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  ISketchInk_GUID = "b4563688-98eb-4646-b279-44da14d45748"
  IID_ISketchInk = LibC::GUID.new(0xb4563688_u32, 0x98eb_u16, 0x4646_u16, StaticArray[0xb2_u8, 0x79_u8, 0x44_u8, 0xda_u8, 0x14_u8, 0xd4_u8, 0x57_u8, 0x48_u8])
  struct ISketchInk
    lpVtbl : ISketchInkVTbl*
  end

  struct IInkDividerVTbl
    query_interface : Proc(IInkDivider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDivider*, UInt32)
    release : Proc(IInkDivider*, UInt32)
    get_type_info_count : Proc(IInkDivider*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDivider*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDivider*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDivider*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_strokes : Proc(IInkDivider*, IInkStrokes*, HRESULT)
    putref_strokes : Proc(IInkDivider*, IInkStrokes, HRESULT)
    get_recognizer_context : Proc(IInkDivider*, IInkRecognizerContext*, HRESULT)
    putref_recognizer_context : Proc(IInkDivider*, IInkRecognizerContext, HRESULT)
    get_line_height : Proc(IInkDivider*, Int32*, HRESULT)
    put_line_height : Proc(IInkDivider*, Int32, HRESULT)
    divide : Proc(IInkDivider*, IInkDivisionResult*, HRESULT)
  end

  IInkDivider_GUID = "5de00405-f9a4-4651-b0c5-c317defd58b9"
  IID_IInkDivider = LibC::GUID.new(0x5de00405_u32, 0xf9a4_u16, 0x4651_u16, StaticArray[0xb0_u8, 0xc5_u8, 0xc3_u8, 0x17_u8, 0xde_u8, 0xfd_u8, 0x58_u8, 0xb9_u8])
  struct IInkDivider
    lpVtbl : IInkDividerVTbl*
  end

  struct IInkDivisionResultVTbl
    query_interface : Proc(IInkDivisionResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDivisionResult*, UInt32)
    release : Proc(IInkDivisionResult*, UInt32)
    get_type_info_count : Proc(IInkDivisionResult*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDivisionResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDivisionResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDivisionResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_strokes : Proc(IInkDivisionResult*, IInkStrokes*, HRESULT)
    result_by_type : Proc(IInkDivisionResult*, InkDivisionType, IInkDivisionUnits*, HRESULT)
  end

  IInkDivisionResult_GUID = "2dbec0a7-74c7-4b38-81eb-aa8ef0c24900"
  IID_IInkDivisionResult = LibC::GUID.new(0x2dbec0a7_u32, 0x74c7_u16, 0x4b38_u16, StaticArray[0x81_u8, 0xeb_u8, 0xaa_u8, 0x8e_u8, 0xf0_u8, 0xc2_u8, 0x49_u8, 0x0_u8])
  struct IInkDivisionResult
    lpVtbl : IInkDivisionResultVTbl*
  end

  struct IInkDivisionUnitVTbl
    query_interface : Proc(IInkDivisionUnit*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDivisionUnit*, UInt32)
    release : Proc(IInkDivisionUnit*, UInt32)
    get_type_info_count : Proc(IInkDivisionUnit*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDivisionUnit*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDivisionUnit*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDivisionUnit*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_strokes : Proc(IInkDivisionUnit*, IInkStrokes*, HRESULT)
    get_division_type : Proc(IInkDivisionUnit*, InkDivisionType*, HRESULT)
    get_recognized_string : Proc(IInkDivisionUnit*, UInt8**, HRESULT)
    get_rotation_transform : Proc(IInkDivisionUnit*, IInkTransform*, HRESULT)
  end

  IInkDivisionUnit_GUID = "85aee342-48b0-4244-9dd5-1ed435410fab"
  IID_IInkDivisionUnit = LibC::GUID.new(0x85aee342_u32, 0x48b0_u16, 0x4244_u16, StaticArray[0x9d_u8, 0xd5_u8, 0x1e_u8, 0xd4_u8, 0x35_u8, 0x41_u8, 0xf_u8, 0xab_u8])
  struct IInkDivisionUnit
    lpVtbl : IInkDivisionUnitVTbl*
  end

  struct IInkDivisionUnitsVTbl
    query_interface : Proc(IInkDivisionUnits*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkDivisionUnits*, UInt32)
    release : Proc(IInkDivisionUnits*, UInt32)
    get_type_info_count : Proc(IInkDivisionUnits*, UInt32*, HRESULT)
    get_type_info : Proc(IInkDivisionUnits*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkDivisionUnits*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkDivisionUnits*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IInkDivisionUnits*, Int32*, HRESULT)
    get__new_enum : Proc(IInkDivisionUnits*, IUnknown*, HRESULT)
    item : Proc(IInkDivisionUnits*, Int32, IInkDivisionUnit*, HRESULT)
  end

  IInkDivisionUnits_GUID = "1bb5ddc2-31cc-4135-ab82-2c66c9f00c41"
  IID_IInkDivisionUnits = LibC::GUID.new(0x1bb5ddc2_u32, 0x31cc_u16, 0x4135_u16, StaticArray[0xab_u8, 0x82_u8, 0x2c_u8, 0x66_u8, 0xc9_u8, 0xf0_u8, 0xc_u8, 0x41_u8])
  struct IInkDivisionUnits
    lpVtbl : IInkDivisionUnitsVTbl*
  end

  struct IPenInputPanelVTbl
    query_interface : Proc(IPenInputPanel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPenInputPanel*, UInt32)
    release : Proc(IPenInputPanel*, UInt32)
    get_type_info_count : Proc(IPenInputPanel*, UInt32*, HRESULT)
    get_type_info : Proc(IPenInputPanel*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPenInputPanel*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPenInputPanel*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_busy : Proc(IPenInputPanel*, Int16*, HRESULT)
    get_factoid : Proc(IPenInputPanel*, UInt8**, HRESULT)
    put_factoid : Proc(IPenInputPanel*, UInt8*, HRESULT)
    get_attached_edit_window : Proc(IPenInputPanel*, Int32*, HRESULT)
    put_attached_edit_window : Proc(IPenInputPanel*, Int32, HRESULT)
    get_current_panel : Proc(IPenInputPanel*, PanelType*, HRESULT)
    put_current_panel : Proc(IPenInputPanel*, PanelType, HRESULT)
    get_default_panel : Proc(IPenInputPanel*, PanelType*, HRESULT)
    put_default_panel : Proc(IPenInputPanel*, PanelType, HRESULT)
    get_visible : Proc(IPenInputPanel*, Int16*, HRESULT)
    put_visible : Proc(IPenInputPanel*, Int16, HRESULT)
    get_top : Proc(IPenInputPanel*, Int32*, HRESULT)
    get_left : Proc(IPenInputPanel*, Int32*, HRESULT)
    get_width : Proc(IPenInputPanel*, Int32*, HRESULT)
    get_height : Proc(IPenInputPanel*, Int32*, HRESULT)
    get_vertical_offset : Proc(IPenInputPanel*, Int32*, HRESULT)
    put_vertical_offset : Proc(IPenInputPanel*, Int32, HRESULT)
    get_horizontal_offset : Proc(IPenInputPanel*, Int32*, HRESULT)
    put_horizontal_offset : Proc(IPenInputPanel*, Int32, HRESULT)
    get_auto_show : Proc(IPenInputPanel*, Int16*, HRESULT)
    put_auto_show : Proc(IPenInputPanel*, Int16, HRESULT)
    move_to : Proc(IPenInputPanel*, Int32, Int32, HRESULT)
    commit_pending_input : Proc(IPenInputPanel*, HRESULT)
    refresh : Proc(IPenInputPanel*, HRESULT)
    enable_tsf : Proc(IPenInputPanel*, Int16, HRESULT)
  end

  IPenInputPanel_GUID = "fa7a4083-5747-4040-a182-0b0e9fd4fac7"
  IID_IPenInputPanel = LibC::GUID.new(0xfa7a4083_u32, 0x5747_u16, 0x4040_u16, StaticArray[0xa1_u8, 0x82_u8, 0xb_u8, 0xe_u8, 0x9f_u8, 0xd4_u8, 0xfa_u8, 0xc7_u8])
  struct IPenInputPanel
    lpVtbl : IPenInputPanelVTbl*
  end

  struct IIPenInputPanelEventsVTbl
    query_interface : Proc(IIPenInputPanelEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIPenInputPanelEvents*, UInt32)
    release : Proc(IIPenInputPanelEvents*, UInt32)
    get_type_info_count : Proc(IIPenInputPanelEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIPenInputPanelEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIPenInputPanelEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIPenInputPanelEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIPenInputPanelEvents_GUID = "b7e489da-3719-439f-848f-e7acbd820f17"
  IID_IIPenInputPanelEvents = LibC::GUID.new(0xb7e489da_u32, 0x3719_u16, 0x439f_u16, StaticArray[0x84_u8, 0x8f_u8, 0xe7_u8, 0xac_u8, 0xbd_u8, 0x82_u8, 0xf_u8, 0x17_u8])
  struct IIPenInputPanelEvents
    lpVtbl : IIPenInputPanelEventsVTbl*
  end

  struct IHandwrittenTextInsertionVTbl
    query_interface : Proc(IHandwrittenTextInsertion*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHandwrittenTextInsertion*, UInt32)
    release : Proc(IHandwrittenTextInsertion*, UInt32)
    insert_recognition_results_array : Proc(IHandwrittenTextInsertion*, SAFEARRAY*, UInt32, LibC::BOOL, HRESULT)
    insert_ink_recognition_result : Proc(IHandwrittenTextInsertion*, IInkRecognitionResult, UInt32, LibC::BOOL, HRESULT)
  end

  IHandwrittenTextInsertion_GUID = "56fdea97-ecd6-43e7-aa3a-816be7785860"
  IID_IHandwrittenTextInsertion = LibC::GUID.new(0x56fdea97_u32, 0xecd6_u16, 0x43e7_u16, StaticArray[0xaa_u8, 0x3a_u8, 0x81_u8, 0x6b_u8, 0xe7_u8, 0x78_u8, 0x58_u8, 0x60_u8])
  struct IHandwrittenTextInsertion
    lpVtbl : IHandwrittenTextInsertionVTbl*
  end

  struct ITextInputPanelEventSinkVTbl
    query_interface : Proc(ITextInputPanelEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextInputPanelEventSink*, UInt32)
    release : Proc(ITextInputPanelEventSink*, UInt32)
    in_place_state_changing : Proc(ITextInputPanelEventSink*, InPlaceState, InPlaceState, HRESULT)
    in_place_state_changed : Proc(ITextInputPanelEventSink*, InPlaceState, InPlaceState, HRESULT)
    in_place_size_changing : Proc(ITextInputPanelEventSink*, RECT, RECT, HRESULT)
    in_place_size_changed : Proc(ITextInputPanelEventSink*, RECT, RECT, HRESULT)
    input_area_changing : Proc(ITextInputPanelEventSink*, PanelInputArea, PanelInputArea, HRESULT)
    input_area_changed : Proc(ITextInputPanelEventSink*, PanelInputArea, PanelInputArea, HRESULT)
    correction_mode_changing : Proc(ITextInputPanelEventSink*, CorrectionMode, CorrectionMode, HRESULT)
    correction_mode_changed : Proc(ITextInputPanelEventSink*, CorrectionMode, CorrectionMode, HRESULT)
    in_place_visibility_changing : Proc(ITextInputPanelEventSink*, LibC::BOOL, LibC::BOOL, HRESULT)
    in_place_visibility_changed : Proc(ITextInputPanelEventSink*, LibC::BOOL, LibC::BOOL, HRESULT)
    text_inserting : Proc(ITextInputPanelEventSink*, SAFEARRAY*, HRESULT)
    text_inserted : Proc(ITextInputPanelEventSink*, SAFEARRAY*, HRESULT)
  end

  ITextInputPanelEventSink_GUID = "27560408-8e64-4fe1-804e-421201584b31"
  IID_ITextInputPanelEventSink = LibC::GUID.new(0x27560408_u32, 0x8e64_u16, 0x4fe1_u16, StaticArray[0x80_u8, 0x4e_u8, 0x42_u8, 0x12_u8, 0x1_u8, 0x58_u8, 0x4b_u8, 0x31_u8])
  struct ITextInputPanelEventSink
    lpVtbl : ITextInputPanelEventSinkVTbl*
  end

  struct ITextInputPanelVTbl
    query_interface : Proc(ITextInputPanel*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextInputPanel*, UInt32)
    release : Proc(ITextInputPanel*, UInt32)
    get_attached_edit_window : Proc(ITextInputPanel*, HANDLE*, HRESULT)
    put_attached_edit_window : Proc(ITextInputPanel*, LibC::HANDLE, HRESULT)
    get_current_interaction_mode : Proc(ITextInputPanel*, InteractionMode*, HRESULT)
    get_default_in_place_state : Proc(ITextInputPanel*, InPlaceState*, HRESULT)
    put_default_in_place_state : Proc(ITextInputPanel*, InPlaceState, HRESULT)
    get_current_in_place_state : Proc(ITextInputPanel*, InPlaceState*, HRESULT)
    get_default_input_area : Proc(ITextInputPanel*, PanelInputArea*, HRESULT)
    put_default_input_area : Proc(ITextInputPanel*, PanelInputArea, HRESULT)
    get_current_input_area : Proc(ITextInputPanel*, PanelInputArea*, HRESULT)
    get_current_correction_mode : Proc(ITextInputPanel*, CorrectionMode*, HRESULT)
    get_preferred_in_place_direction : Proc(ITextInputPanel*, InPlaceDirection*, HRESULT)
    put_preferred_in_place_direction : Proc(ITextInputPanel*, InPlaceDirection, HRESULT)
    get_expand_post_insertion_correction : Proc(ITextInputPanel*, LibC::BOOL*, HRESULT)
    put_expand_post_insertion_correction : Proc(ITextInputPanel*, LibC::BOOL, HRESULT)
    get_in_place_visible_on_focus : Proc(ITextInputPanel*, LibC::BOOL*, HRESULT)
    put_in_place_visible_on_focus : Proc(ITextInputPanel*, LibC::BOOL, HRESULT)
    get_in_place_bounding_rectangle : Proc(ITextInputPanel*, RECT*, HRESULT)
    get_pop_up_correction_height : Proc(ITextInputPanel*, Int32*, HRESULT)
    get_pop_down_correction_height : Proc(ITextInputPanel*, Int32*, HRESULT)
    commit_pending_input : Proc(ITextInputPanel*, HRESULT)
    set_in_place_visibility : Proc(ITextInputPanel*, LibC::BOOL, HRESULT)
    set_in_place_position : Proc(ITextInputPanel*, Int32, Int32, CorrectionPosition, HRESULT)
    set_in_place_hover_target_position : Proc(ITextInputPanel*, Int32, Int32, HRESULT)
    advise : Proc(ITextInputPanel*, ITextInputPanelEventSink, UInt32, HRESULT)
    unadvise : Proc(ITextInputPanel*, ITextInputPanelEventSink, HRESULT)
  end

  ITextInputPanel_GUID = "6b6a65a5-6af3-46c2-b6ea-56cd1f80df71"
  IID_ITextInputPanel = LibC::GUID.new(0x6b6a65a5_u32, 0x6af3_u16, 0x46c2_u16, StaticArray[0xb6_u8, 0xea_u8, 0x56_u8, 0xcd_u8, 0x1f_u8, 0x80_u8, 0xdf_u8, 0x71_u8])
  struct ITextInputPanel
    lpVtbl : ITextInputPanelVTbl*
  end

  struct IInputPanelWindowHandleVTbl
    query_interface : Proc(IInputPanelWindowHandle*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInputPanelWindowHandle*, UInt32)
    release : Proc(IInputPanelWindowHandle*, UInt32)
    get_attached_edit_window32 : Proc(IInputPanelWindowHandle*, Int32*, HRESULT)
    put_attached_edit_window32 : Proc(IInputPanelWindowHandle*, Int32, HRESULT)
    get_attached_edit_window64 : Proc(IInputPanelWindowHandle*, Int64*, HRESULT)
    put_attached_edit_window64 : Proc(IInputPanelWindowHandle*, Int64, HRESULT)
  end

  IInputPanelWindowHandle_GUID = "4af81847-fdc4-4fc3-ad0b-422479c1b935"
  IID_IInputPanelWindowHandle = LibC::GUID.new(0x4af81847_u32, 0xfdc4_u16, 0x4fc3_u16, StaticArray[0xad_u8, 0xb_u8, 0x42_u8, 0x24_u8, 0x79_u8, 0xc1_u8, 0xb9_u8, 0x35_u8])
  struct IInputPanelWindowHandle
    lpVtbl : IInputPanelWindowHandleVTbl*
  end

  struct ITextInputPanelRunInfoVTbl
    query_interface : Proc(ITextInputPanelRunInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextInputPanelRunInfo*, UInt32)
    release : Proc(ITextInputPanelRunInfo*, UInt32)
    is_tip_running : Proc(ITextInputPanelRunInfo*, LibC::BOOL*, HRESULT)
  end

  ITextInputPanelRunInfo_GUID = "9f424568-1920-48cc-9811-a993cbf5adba"
  IID_ITextInputPanelRunInfo = LibC::GUID.new(0x9f424568_u32, 0x1920_u16, 0x48cc_u16, StaticArray[0x98_u8, 0x11_u8, 0xa9_u8, 0x93_u8, 0xcb_u8, 0xf5_u8, 0xad_u8, 0xba_u8])
  struct ITextInputPanelRunInfo
    lpVtbl : ITextInputPanelRunInfoVTbl*
  end

  struct IInkEditVTbl
    query_interface : Proc(IInkEdit*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkEdit*, UInt32)
    release : Proc(IInkEdit*, UInt32)
    get_type_info_count : Proc(IInkEdit*, UInt32*, HRESULT)
    get_type_info : Proc(IInkEdit*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkEdit*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkEdit*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status : Proc(IInkEdit*, InkEditStatus*, HRESULT)
    get_use_mouse_for_input : Proc(IInkEdit*, Int16*, HRESULT)
    put_use_mouse_for_input : Proc(IInkEdit*, Int16, HRESULT)
    get_ink_mode : Proc(IInkEdit*, InkMode*, HRESULT)
    put_ink_mode : Proc(IInkEdit*, InkMode, HRESULT)
    get_ink_insert_mode : Proc(IInkEdit*, InkInsertMode*, HRESULT)
    put_ink_insert_mode : Proc(IInkEdit*, InkInsertMode, HRESULT)
    get_drawing_attributes : Proc(IInkEdit*, IInkDrawingAttributes*, HRESULT)
    putref_drawing_attributes : Proc(IInkEdit*, IInkDrawingAttributes, HRESULT)
    get_recognition_timeout : Proc(IInkEdit*, Int32*, HRESULT)
    put_recognition_timeout : Proc(IInkEdit*, Int32, HRESULT)
    get_recognizer : Proc(IInkEdit*, IInkRecognizer*, HRESULT)
    putref_recognizer : Proc(IInkEdit*, IInkRecognizer, HRESULT)
    get_factoid : Proc(IInkEdit*, UInt8**, HRESULT)
    put_factoid : Proc(IInkEdit*, UInt8*, HRESULT)
    get_sel_inks : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_inks : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_inks_display_mode : Proc(IInkEdit*, InkDisplayMode*, HRESULT)
    put_sel_inks_display_mode : Proc(IInkEdit*, InkDisplayMode, HRESULT)
    recognize : Proc(IInkEdit*, HRESULT)
    get_gesture_status : Proc(IInkEdit*, InkApplicationGesture, Int16*, HRESULT)
    set_gesture_status : Proc(IInkEdit*, InkApplicationGesture, Int16, HRESULT)
    put_back_color : Proc(IInkEdit*, UInt32, HRESULT)
    get_back_color : Proc(IInkEdit*, UInt32*, HRESULT)
    get_appearance : Proc(IInkEdit*, AppearanceConstants*, HRESULT)
    put_appearance : Proc(IInkEdit*, AppearanceConstants, HRESULT)
    get_border_style : Proc(IInkEdit*, BorderStyleConstants*, HRESULT)
    put_border_style : Proc(IInkEdit*, BorderStyleConstants, HRESULT)
    get_hwnd : Proc(IInkEdit*, UInt32*, HRESULT)
    get_font : Proc(IInkEdit*, IFontDisp*, HRESULT)
    putref_font : Proc(IInkEdit*, IFontDisp, HRESULT)
    get_text : Proc(IInkEdit*, UInt8**, HRESULT)
    put_text : Proc(IInkEdit*, UInt8*, HRESULT)
    get_mouse_icon : Proc(IInkEdit*, IPictureDisp*, HRESULT)
    put_mouse_icon : Proc(IInkEdit*, IPictureDisp, HRESULT)
    putref_mouse_icon : Proc(IInkEdit*, IPictureDisp, HRESULT)
    get_mouse_pointer : Proc(IInkEdit*, InkMousePointer*, HRESULT)
    put_mouse_pointer : Proc(IInkEdit*, InkMousePointer, HRESULT)
    get_locked : Proc(IInkEdit*, Int16*, HRESULT)
    put_locked : Proc(IInkEdit*, Int16, HRESULT)
    get_enabled : Proc(IInkEdit*, Int16*, HRESULT)
    put_enabled : Proc(IInkEdit*, Int16, HRESULT)
    get_max_length : Proc(IInkEdit*, Int32*, HRESULT)
    put_max_length : Proc(IInkEdit*, Int32, HRESULT)
    get_multi_line : Proc(IInkEdit*, Int16*, HRESULT)
    put_multi_line : Proc(IInkEdit*, Int16, HRESULT)
    get_scroll_bars : Proc(IInkEdit*, ScrollBarsConstants*, HRESULT)
    put_scroll_bars : Proc(IInkEdit*, ScrollBarsConstants, HRESULT)
    get_disable_no_scroll : Proc(IInkEdit*, Int16*, HRESULT)
    put_disable_no_scroll : Proc(IInkEdit*, Int16, HRESULT)
    get_sel_alignment : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_alignment : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_bold : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_bold : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_italic : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_italic : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_underline : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_underline : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_color : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_color : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_font_name : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_font_name : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_font_size : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_font_size : Proc(IInkEdit*, VARIANT, HRESULT)
    get_sel_char_offset : Proc(IInkEdit*, VARIANT*, HRESULT)
    put_sel_char_offset : Proc(IInkEdit*, VARIANT, HRESULT)
    get_text_rtf : Proc(IInkEdit*, UInt8**, HRESULT)
    put_text_rtf : Proc(IInkEdit*, UInt8*, HRESULT)
    get_sel_start : Proc(IInkEdit*, Int32*, HRESULT)
    put_sel_start : Proc(IInkEdit*, Int32, HRESULT)
    get_sel_length : Proc(IInkEdit*, Int32*, HRESULT)
    put_sel_length : Proc(IInkEdit*, Int32, HRESULT)
    get_sel_text : Proc(IInkEdit*, UInt8**, HRESULT)
    put_sel_text : Proc(IInkEdit*, UInt8*, HRESULT)
    get_sel_rtf : Proc(IInkEdit*, UInt8**, HRESULT)
    put_sel_rtf : Proc(IInkEdit*, UInt8*, HRESULT)
    refresh : Proc(IInkEdit*, HRESULT)
  end

  IInkEdit_GUID = "f2127a19-fbfb-4aed-8464-3f36d78cfefb"
  IID_IInkEdit = LibC::GUID.new(0xf2127a19_u32, 0xfbfb_u16, 0x4aed_u16, StaticArray[0x84_u8, 0x64_u8, 0x3f_u8, 0x36_u8, 0xd7_u8, 0x8c_u8, 0xfe_u8, 0xfb_u8])
  struct IInkEdit
    lpVtbl : IInkEditVTbl*
  end

  struct IIInkEditEventsVTbl
    query_interface : Proc(IIInkEditEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIInkEditEvents*, UInt32)
    release : Proc(IIInkEditEvents*, UInt32)
    get_type_info_count : Proc(IIInkEditEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIInkEditEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIInkEditEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIInkEditEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIInkEditEvents_GUID = "e3b0b797-a72e-46db-a0d7-6c9eba8e9bbc"
  IID_IIInkEditEvents = LibC::GUID.new(0xe3b0b797_u32, 0xa72e_u16, 0x46db_u16, StaticArray[0xa0_u8, 0xd7_u8, 0x6c_u8, 0x9e_u8, 0xba_u8, 0x8e_u8, 0x9b_u8, 0xbc_u8])
  struct IIInkEditEvents
    lpVtbl : IIInkEditEventsVTbl*
  end

  struct IMathInputControlVTbl
    query_interface : Proc(IMathInputControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMathInputControl*, UInt32)
    release : Proc(IMathInputControl*, UInt32)
    get_type_info_count : Proc(IMathInputControl*, UInt32*, HRESULT)
    get_type_info : Proc(IMathInputControl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMathInputControl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMathInputControl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    show : Proc(IMathInputControl*, HRESULT)
    hide : Proc(IMathInputControl*, HRESULT)
    is_visible : Proc(IMathInputControl*, Int16*, HRESULT)
    get_position : Proc(IMathInputControl*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    set_position : Proc(IMathInputControl*, Int32, Int32, Int32, Int32, HRESULT)
    clear : Proc(IMathInputControl*, HRESULT)
    set_custom_paint : Proc(IMathInputControl*, Int32, Int16, HRESULT)
    set_caption_text : Proc(IMathInputControl*, UInt8*, HRESULT)
    load_ink : Proc(IMathInputControl*, IInkDisp, HRESULT)
    set_owner_window : Proc(IMathInputControl*, LibC::IntPtrT, HRESULT)
    enable_extended_buttons : Proc(IMathInputControl*, Int16, HRESULT)
    get_preview_height : Proc(IMathInputControl*, Int32*, HRESULT)
    set_preview_height : Proc(IMathInputControl*, Int32, HRESULT)
    enable_auto_grow : Proc(IMathInputControl*, Int16, HRESULT)
    add_function_name : Proc(IMathInputControl*, UInt8*, HRESULT)
    remove_function_name : Proc(IMathInputControl*, UInt8*, HRESULT)
    get_hover_icon : Proc(IMathInputControl*, IPictureDisp*, HRESULT)
  end

  IMathInputControl_GUID = "eba615aa-fac6-4738-ba5f-ff09e9fe473e"
  IID_IMathInputControl = LibC::GUID.new(0xeba615aa_u32, 0xfac6_u16, 0x4738_u16, StaticArray[0xba_u8, 0x5f_u8, 0xff_u8, 0x9_u8, 0xe9_u8, 0xfe_u8, 0x47_u8, 0x3e_u8])
  struct IMathInputControl
    lpVtbl : IMathInputControlVTbl*
  end

  struct IIMathInputControlEventsVTbl
    query_interface : Proc(IIMathInputControlEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIMathInputControlEvents*, UInt32)
    release : Proc(IIMathInputControlEvents*, UInt32)
    get_type_info_count : Proc(IIMathInputControlEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IIMathInputControlEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIMathInputControlEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIMathInputControlEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IIMathInputControlEvents_GUID = "683336b5-a47d-4358-96f9-875a472ae70a"
  IID_IIMathInputControlEvents = LibC::GUID.new(0x683336b5_u32, 0xa47d_u16, 0x4358_u16, StaticArray[0x96_u8, 0xf9_u8, 0x87_u8, 0x5a_u8, 0x47_u8, 0x2a_u8, 0xe7_u8, 0xa_u8])
  struct IIMathInputControlEvents
    lpVtbl : IIMathInputControlEventsVTbl*
  end

  struct IRealTimeStylusVTbl
    query_interface : Proc(IRealTimeStylus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRealTimeStylus*, UInt32)
    release : Proc(IRealTimeStylus*, UInt32)
    get_enabled : Proc(IRealTimeStylus*, LibC::BOOL*, HRESULT)
    put_enabled : Proc(IRealTimeStylus*, LibC::BOOL, HRESULT)
    get_hwnd : Proc(IRealTimeStylus*, HANDLE_PTR*, HRESULT)
    put_hwnd : Proc(IRealTimeStylus*, HANDLE_PTR, HRESULT)
    get_window_input_rectangle : Proc(IRealTimeStylus*, RECT*, HRESULT)
    put_window_input_rectangle : Proc(IRealTimeStylus*, RECT*, HRESULT)
    add_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, IStylusSyncPlugin, HRESULT)
    remove_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, IStylusSyncPlugin*, HRESULT)
    remove_all_stylus_sync_plugins : Proc(IRealTimeStylus*, HRESULT)
    get_stylus_sync_plugin : Proc(IRealTimeStylus*, UInt32, IStylusSyncPlugin*, HRESULT)
    get_stylus_sync_plugin_count : Proc(IRealTimeStylus*, UInt32*, HRESULT)
    add_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, IStylusAsyncPlugin, HRESULT)
    remove_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, IStylusAsyncPlugin*, HRESULT)
    remove_all_stylus_async_plugins : Proc(IRealTimeStylus*, HRESULT)
    get_stylus_async_plugin : Proc(IRealTimeStylus*, UInt32, IStylusAsyncPlugin*, HRESULT)
    get_stylus_async_plugin_count : Proc(IRealTimeStylus*, UInt32*, HRESULT)
    get_child_real_time_stylus_plugin : Proc(IRealTimeStylus*, IRealTimeStylus*, HRESULT)
    putref_child_real_time_stylus_plugin : Proc(IRealTimeStylus*, IRealTimeStylus, HRESULT)
    add_custom_stylus_data_to_queue : Proc(IRealTimeStylus*, StylusQueue, Guid*, UInt32, UInt8*, HRESULT)
    clear_stylus_queues : Proc(IRealTimeStylus*, HRESULT)
    set_all_tablets_mode : Proc(IRealTimeStylus*, LibC::BOOL, HRESULT)
    set_single_tablet_mode : Proc(IRealTimeStylus*, IInkTablet, HRESULT)
    get_tablet : Proc(IRealTimeStylus*, IInkTablet*, HRESULT)
    get_tablet_context_id_from_tablet : Proc(IRealTimeStylus*, IInkTablet, UInt32*, HRESULT)
    get_tablet_from_tablet_context_id : Proc(IRealTimeStylus*, UInt32, IInkTablet*, HRESULT)
    get_all_tablet_context_ids : Proc(IRealTimeStylus*, UInt32*, UInt32**, HRESULT)
    get_styluses : Proc(IRealTimeStylus*, IInkCursors*, HRESULT)
    get_stylus_for_id : Proc(IRealTimeStylus*, UInt32, IInkCursor*, HRESULT)
    set_desired_packet_description : Proc(IRealTimeStylus*, UInt32, Guid*, HRESULT)
    get_desired_packet_description : Proc(IRealTimeStylus*, UInt32*, Guid**, HRESULT)
    get_packet_description_data : Proc(IRealTimeStylus*, UInt32, Float32*, Float32*, UInt32*, PACKET_PROPERTY**, HRESULT)
  end

  IRealTimeStylus_GUID = "a8bb5d22-3144-4a7b-93cd-f34a16be513a"
  IID_IRealTimeStylus = LibC::GUID.new(0xa8bb5d22_u32, 0x3144_u16, 0x4a7b_u16, StaticArray[0x93_u8, 0xcd_u8, 0xf3_u8, 0x4a_u8, 0x16_u8, 0xbe_u8, 0x51_u8, 0x3a_u8])
  struct IRealTimeStylus
    lpVtbl : IRealTimeStylusVTbl*
  end

  struct IRealTimeStylus2VTbl
    query_interface : Proc(IRealTimeStylus2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRealTimeStylus2*, UInt32)
    release : Proc(IRealTimeStylus2*, UInt32)
    get_flicks_enabled : Proc(IRealTimeStylus2*, LibC::BOOL*, HRESULT)
    put_flicks_enabled : Proc(IRealTimeStylus2*, LibC::BOOL, HRESULT)
  end

  IRealTimeStylus2_GUID = "b5f2a6cd-3179-4a3e-b9c4-bb5865962be2"
  IID_IRealTimeStylus2 = LibC::GUID.new(0xb5f2a6cd_u32, 0x3179_u16, 0x4a3e_u16, StaticArray[0xb9_u8, 0xc4_u8, 0xbb_u8, 0x58_u8, 0x65_u8, 0x96_u8, 0x2b_u8, 0xe2_u8])
  struct IRealTimeStylus2
    lpVtbl : IRealTimeStylus2VTbl*
  end

  struct IRealTimeStylus3VTbl
    query_interface : Proc(IRealTimeStylus3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRealTimeStylus3*, UInt32)
    release : Proc(IRealTimeStylus3*, UInt32)
    get_multi_touch_enabled : Proc(IRealTimeStylus3*, LibC::BOOL*, HRESULT)
    put_multi_touch_enabled : Proc(IRealTimeStylus3*, LibC::BOOL, HRESULT)
  end

  IRealTimeStylus3_GUID = "d70230a3-6986-4051-b57a-1cf69f4d9db5"
  IID_IRealTimeStylus3 = LibC::GUID.new(0xd70230a3_u32, 0x6986_u16, 0x4051_u16, StaticArray[0xb5_u8, 0x7a_u8, 0x1c_u8, 0xf6_u8, 0x9f_u8, 0x4d_u8, 0x9d_u8, 0xb5_u8])
  struct IRealTimeStylus3
    lpVtbl : IRealTimeStylus3VTbl*
  end

  struct IRealTimeStylusSynchronizationVTbl
    query_interface : Proc(IRealTimeStylusSynchronization*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRealTimeStylusSynchronization*, UInt32)
    release : Proc(IRealTimeStylusSynchronization*, UInt32)
    acquire_lock : Proc(IRealTimeStylusSynchronization*, RealTimeStylusLockType, HRESULT)
    release_lock : Proc(IRealTimeStylusSynchronization*, RealTimeStylusLockType, HRESULT)
  end

  IRealTimeStylusSynchronization_GUID = "aa87eab8-ab4a-4cea-b5cb-46d84c6a2509"
  IID_IRealTimeStylusSynchronization = LibC::GUID.new(0xaa87eab8_u32, 0xab4a_u16, 0x4cea_u16, StaticArray[0xb5_u8, 0xcb_u8, 0x46_u8, 0xd8_u8, 0x4c_u8, 0x6a_u8, 0x25_u8, 0x9_u8])
  struct IRealTimeStylusSynchronization
    lpVtbl : IRealTimeStylusSynchronizationVTbl*
  end

  struct IStrokeBuilderVTbl
    query_interface : Proc(IStrokeBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStrokeBuilder*, UInt32)
    release : Proc(IStrokeBuilder*, UInt32)
    create_stroke : Proc(IStrokeBuilder*, UInt32, Int32*, UInt32, PACKET_PROPERTY*, Float32, Float32, IInkStrokeDisp*, HRESULT)
    begin_stroke : Proc(IStrokeBuilder*, UInt32, UInt32, Int32*, UInt32, PACKET_PROPERTY*, Float32, Float32, IInkStrokeDisp*, HRESULT)
    append_packets : Proc(IStrokeBuilder*, UInt32, UInt32, UInt32, Int32*, HRESULT)
    end_stroke : Proc(IStrokeBuilder*, UInt32, UInt32, IInkStrokeDisp*, RECT*, HRESULT)
    get_ink : Proc(IStrokeBuilder*, IInkDisp*, HRESULT)
    putref_ink : Proc(IStrokeBuilder*, IInkDisp, HRESULT)
  end

  IStrokeBuilder_GUID = "a5fd4e2d-c44b-4092-9177-260905eb672b"
  IID_IStrokeBuilder = LibC::GUID.new(0xa5fd4e2d_u32, 0xc44b_u16, 0x4092_u16, StaticArray[0x91_u8, 0x77_u8, 0x26_u8, 0x9_u8, 0x5_u8, 0xeb_u8, 0x67_u8, 0x2b_u8])
  struct IStrokeBuilder
    lpVtbl : IStrokeBuilderVTbl*
  end

  struct IStylusPluginVTbl
    query_interface : Proc(IStylusPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStylusPlugin*, UInt32)
    release : Proc(IStylusPlugin*, UInt32)
    real_time_stylus_enabled : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    real_time_stylus_disabled : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    stylus_in_range : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_out_of_range : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_down : Proc(IStylusPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_up : Proc(IStylusPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_button_down : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    stylus_button_up : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    in_air_packets : Proc(IStylusPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    packets : Proc(IStylusPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    custom_stylus_data_added : Proc(IStylusPlugin*, IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)
    system_event : Proc(IStylusPlugin*, IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)
    tablet_added : Proc(IStylusPlugin*, IRealTimeStylus, IInkTablet, HRESULT)
    tablet_removed : Proc(IStylusPlugin*, IRealTimeStylus, Int32, HRESULT)
    error : Proc(IStylusPlugin*, IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)
    update_mapping : Proc(IStylusPlugin*, IRealTimeStylus, HRESULT)
    data_interest : Proc(IStylusPlugin*, RealTimeStylusDataInterest*, HRESULT)
  end

  IStylusPlugin_GUID = "a81436d8-4757-4fd1-a185-133f97c6c545"
  IID_IStylusPlugin = LibC::GUID.new(0xa81436d8_u32, 0x4757_u16, 0x4fd1_u16, StaticArray[0xa1_u8, 0x85_u8, 0x13_u8, 0x3f_u8, 0x97_u8, 0xc6_u8, 0xc5_u8, 0x45_u8])
  struct IStylusPlugin
    lpVtbl : IStylusPluginVTbl*
  end

  struct IStylusSyncPluginVTbl
    query_interface : Proc(IStylusSyncPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStylusSyncPlugin*, UInt32)
    release : Proc(IStylusSyncPlugin*, UInt32)
    real_time_stylus_enabled : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    real_time_stylus_disabled : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    stylus_in_range : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_out_of_range : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_down : Proc(IStylusSyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_up : Proc(IStylusSyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_button_down : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    stylus_button_up : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    in_air_packets : Proc(IStylusSyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    packets : Proc(IStylusSyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    custom_stylus_data_added : Proc(IStylusSyncPlugin*, IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)
    system_event : Proc(IStylusSyncPlugin*, IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)
    tablet_added : Proc(IStylusSyncPlugin*, IRealTimeStylus, IInkTablet, HRESULT)
    tablet_removed : Proc(IStylusSyncPlugin*, IRealTimeStylus, Int32, HRESULT)
    error : Proc(IStylusSyncPlugin*, IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)
    update_mapping : Proc(IStylusSyncPlugin*, IRealTimeStylus, HRESULT)
    data_interest : Proc(IStylusSyncPlugin*, RealTimeStylusDataInterest*, HRESULT)
  end

  IStylusSyncPlugin_GUID = "a157b174-482f-4d71-a3f6-3a41ddd11be9"
  IID_IStylusSyncPlugin = LibC::GUID.new(0xa157b174_u32, 0x482f_u16, 0x4d71_u16, StaticArray[0xa3_u8, 0xf6_u8, 0x3a_u8, 0x41_u8, 0xdd_u8, 0xd1_u8, 0x1b_u8, 0xe9_u8])
  struct IStylusSyncPlugin
    lpVtbl : IStylusSyncPluginVTbl*
  end

  struct IStylusAsyncPluginVTbl
    query_interface : Proc(IStylusAsyncPlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStylusAsyncPlugin*, UInt32)
    release : Proc(IStylusAsyncPlugin*, UInt32)
    real_time_stylus_enabled : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    real_time_stylus_disabled : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, UInt32*, HRESULT)
    stylus_in_range : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_out_of_range : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, UInt32, HRESULT)
    stylus_down : Proc(IStylusAsyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_up : Proc(IStylusAsyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)
    stylus_button_down : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    stylus_button_up : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)
    in_air_packets : Proc(IStylusAsyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    packets : Proc(IStylusAsyncPlugin*, IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)
    custom_stylus_data_added : Proc(IStylusAsyncPlugin*, IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)
    system_event : Proc(IStylusAsyncPlugin*, IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)
    tablet_added : Proc(IStylusAsyncPlugin*, IRealTimeStylus, IInkTablet, HRESULT)
    tablet_removed : Proc(IStylusAsyncPlugin*, IRealTimeStylus, Int32, HRESULT)
    error : Proc(IStylusAsyncPlugin*, IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)
    update_mapping : Proc(IStylusAsyncPlugin*, IRealTimeStylus, HRESULT)
    data_interest : Proc(IStylusAsyncPlugin*, RealTimeStylusDataInterest*, HRESULT)
  end

  IStylusAsyncPlugin_GUID = "a7cca85a-31bc-4cd2-aadc-3289a3af11c8"
  IID_IStylusAsyncPlugin = LibC::GUID.new(0xa7cca85a_u32, 0x31bc_u16, 0x4cd2_u16, StaticArray[0xaa_u8, 0xdc_u8, 0x32_u8, 0x89_u8, 0xa3_u8, 0xaf_u8, 0x11_u8, 0xc8_u8])
  struct IStylusAsyncPlugin
    lpVtbl : IStylusAsyncPluginVTbl*
  end

  struct IDynamicRendererVTbl
    query_interface : Proc(IDynamicRenderer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDynamicRenderer*, UInt32)
    release : Proc(IDynamicRenderer*, UInt32)
    get_enabled : Proc(IDynamicRenderer*, LibC::BOOL*, HRESULT)
    put_enabled : Proc(IDynamicRenderer*, LibC::BOOL, HRESULT)
    get_hwnd : Proc(IDynamicRenderer*, HANDLE_PTR*, HRESULT)
    put_hwnd : Proc(IDynamicRenderer*, HANDLE_PTR, HRESULT)
    get_clip_rectangle : Proc(IDynamicRenderer*, RECT*, HRESULT)
    put_clip_rectangle : Proc(IDynamicRenderer*, RECT*, HRESULT)
    get_clip_region : Proc(IDynamicRenderer*, HANDLE_PTR*, HRESULT)
    put_clip_region : Proc(IDynamicRenderer*, HANDLE_PTR, HRESULT)
    get_drawing_attributes : Proc(IDynamicRenderer*, IInkDrawingAttributes*, HRESULT)
    putref_drawing_attributes : Proc(IDynamicRenderer*, IInkDrawingAttributes, HRESULT)
    get_data_cache_enabled : Proc(IDynamicRenderer*, LibC::BOOL*, HRESULT)
    put_data_cache_enabled : Proc(IDynamicRenderer*, LibC::BOOL, HRESULT)
    release_cached_data : Proc(IDynamicRenderer*, UInt32, HRESULT)
    refresh : Proc(IDynamicRenderer*, HRESULT)
    draw : Proc(IDynamicRenderer*, HANDLE_PTR, HRESULT)
  end

  IDynamicRenderer_GUID = "a079468e-7165-46f9-b7af-98ad01a93009"
  IID_IDynamicRenderer = LibC::GUID.new(0xa079468e_u32, 0x7165_u16, 0x46f9_u16, StaticArray[0xb7_u8, 0xaf_u8, 0x98_u8, 0xad_u8, 0x1_u8, 0xa9_u8, 0x30_u8, 0x9_u8])
  struct IDynamicRenderer
    lpVtbl : IDynamicRendererVTbl*
  end

  struct IGestureRecognizerVTbl
    query_interface : Proc(IGestureRecognizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGestureRecognizer*, UInt32)
    release : Proc(IGestureRecognizer*, UInt32)
    get_enabled : Proc(IGestureRecognizer*, LibC::BOOL*, HRESULT)
    put_enabled : Proc(IGestureRecognizer*, LibC::BOOL, HRESULT)
    get_max_stroke_count : Proc(IGestureRecognizer*, Int32*, HRESULT)
    put_max_stroke_count : Proc(IGestureRecognizer*, Int32, HRESULT)
    enable_gestures : Proc(IGestureRecognizer*, UInt32, Int32*, HRESULT)
    reset : Proc(IGestureRecognizer*, HRESULT)
  end

  IGestureRecognizer_GUID = "ae9ef86b-7054-45e3-ae22-3174dc8811b7"
  IID_IGestureRecognizer = LibC::GUID.new(0xae9ef86b_u32, 0x7054_u16, 0x45e3_u16, StaticArray[0xae_u8, 0x22_u8, 0x31_u8, 0x74_u8, 0xdc_u8, 0x88_u8, 0x11_u8, 0xb7_u8])
  struct IGestureRecognizer
    lpVtbl : IGestureRecognizerVTbl*
  end

  struct ITipAutoCompleteProviderVTbl
    query_interface : Proc(ITipAutoCompleteProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipAutoCompleteProvider*, UInt32)
    release : Proc(ITipAutoCompleteProvider*, UInt32)
    update_pending_text : Proc(ITipAutoCompleteProvider*, UInt8*, HRESULT)
    show : Proc(ITipAutoCompleteProvider*, LibC::BOOL, HRESULT)
  end

  ITipAutoCompleteProvider_GUID = "7c6cf46d-8404-46b9-ad33-f5b6036d4007"
  IID_ITipAutoCompleteProvider = LibC::GUID.new(0x7c6cf46d_u32, 0x8404_u16, 0x46b9_u16, StaticArray[0xad_u8, 0x33_u8, 0xf5_u8, 0xb6_u8, 0x3_u8, 0x6d_u8, 0x40_u8, 0x7_u8])
  struct ITipAutoCompleteProvider
    lpVtbl : ITipAutoCompleteProviderVTbl*
  end

  struct ITipAutoCompleteClientVTbl
    query_interface : Proc(ITipAutoCompleteClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipAutoCompleteClient*, UInt32)
    release : Proc(ITipAutoCompleteClient*, UInt32)
    advise_provider : Proc(ITipAutoCompleteClient*, LibC::HANDLE, ITipAutoCompleteProvider, HRESULT)
    unadvise_provider : Proc(ITipAutoCompleteClient*, LibC::HANDLE, ITipAutoCompleteProvider, HRESULT)
    user_selection : Proc(ITipAutoCompleteClient*, HRESULT)
    preferred_rects : Proc(ITipAutoCompleteClient*, RECT*, RECT*, RECT*, LibC::BOOL*, HRESULT)
    request_show_ui : Proc(ITipAutoCompleteClient*, LibC::HANDLE, LibC::BOOL*, HRESULT)
  end

  ITipAutoCompleteClient_GUID = "5e078e03-8265-4bbe-9487-d242edbef910"
  IID_ITipAutoCompleteClient = LibC::GUID.new(0x5e078e03_u32, 0x8265_u16, 0x4bbe_u16, StaticArray[0x94_u8, 0x87_u8, 0xd2_u8, 0x42_u8, 0xed_u8, 0xbe_u8, 0xf9_u8, 0x10_u8])
  struct ITipAutoCompleteClient
    lpVtbl : ITipAutoCompleteClientVTbl*
  end


  # Params # pclsid : Guid* [In],phrec : HRECOGNIZER* [In]
  fun CreateRecognizer(pclsid : Guid*, phrec : HRECOGNIZER*) : HRESULT

  # Params # hrec : HRECOGNIZER [In]
  fun DestroyRecognizer(hrec : HRECOGNIZER) : HRESULT

  # Params # hrec : HRECOGNIZER [In],precoattrs : RECO_ATTRS* [In]
  fun GetRecoAttributes(hrec : HRECOGNIZER, precoattrs : RECO_ATTRS*) : HRESULT

  # Params # hrec : HRECOGNIZER [In],phrc : HRECOCONTEXT* [In]
  fun CreateContext(hrec : HRECOGNIZER, phrc : HRECOCONTEXT*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In]
  fun DestroyContext(hrc : HRECOCONTEXT) : HRESULT

  # Params # hrec : HRECOGNIZER [In],ppropertycount : UInt32* [In],ppropertyguid : Guid* [In]
  fun GetResultPropertyList(hrec : HRECOGNIZER, ppropertycount : UInt32*, ppropertyguid : Guid*) : HRESULT

  # Params # hrec : HRECOGNIZER [In],pcranges : UInt32* [In],pcr : CHARACTER_RANGE* [In]
  fun GetUnicodeRanges(hrec : HRECOGNIZER, pcranges : UInt32*, pcr : CHARACTER_RANGE*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],ppacketdesc : PACKET_DESCRIPTION* [In],cbpacket : UInt32 [In],ppacket : UInt8* [In],pxform : XFORM* [In]
  fun AddStroke(hrc : HRECOCONTEXT, ppacketdesc : PACKET_DESCRIPTION*, cbpacket : UInt32, ppacket : UInt8*, pxform : XFORM*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pcsize : UInt32* [In],pwcbestresult : Char* [In]
  fun GetBestResultString(hrc : HRECOCONTEXT, pcsize : UInt32*, pwcbestresult : Char*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pguide : RECO_GUIDE* [In],iindex : UInt32 [In]
  fun SetGuide(hrc : HRECOCONTEXT, pguide : RECO_GUIDE*, iindex : UInt32) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],bnewstroke : LibC::BOOL [In]
  fun AdviseInkChange(hrc : HRECOCONTEXT, bnewstroke : LibC::BOOL) : HRESULT

  # Params # hrc : HRECOCONTEXT [In]
  fun EndInkInput(hrc : HRECOCONTEXT) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pbpartialprocessing : LibC::BOOL* [In]
  fun Process(hrc : HRECOCONTEXT, pbpartialprocessing : LibC::BOOL*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],cwcfactoid : UInt32 [In],pwcfactoid : LibC::LPWSTR [In]
  fun SetFactoid(hrc : HRECOCONTEXT, cwcfactoid : UInt32, pwcfactoid : LibC::LPWSTR) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],dwflags : UInt32 [In]
  fun SetFlags(hrc : HRECOCONTEXT, dwflags : UInt32) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pplattice : RECO_LATTICE** [In]
  fun GetLatticePtr(hrc : HRECOCONTEXT, pplattice : RECO_LATTICE**) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],cwcbefore : UInt32 [In],pwcbefore : Char* [In],cwcafter : UInt32 [In],pwcafter : Char* [In]
  fun SetTextContext(hrc : HRECOCONTEXT, cwcbefore : UInt32, pwcbefore : Char*, cwcafter : UInt32, pwcafter : Char*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],cranges : UInt32 [In],pcr : CHARACTER_RANGE* [In]
  fun SetEnabledUnicodeRanges(hrc : HRECOCONTEXT, cranges : UInt32, pcr : CHARACTER_RANGE*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],wcstring : UInt32 [In],pwcstring : LibC::LPWSTR [In]
  fun IsStringSupported(hrc : HRECOCONTEXT, wcstring : UInt32, pwcstring : LibC::LPWSTR) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],hwl : HRECOWORDLIST [In]
  fun SetWordList(hrc : HRECOCONTEXT, hwl : HRECOWORDLIST) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pcsize : UInt32* [In],pwcrightseparator : Char* [In]
  fun GetRightSeparator(hrc : HRECOCONTEXT, pcsize : UInt32*, pwcrightseparator : Char*) : HRESULT

  # Params # hrc : HRECOCONTEXT [In],pcsize : UInt32* [In],pwcleftseparator : Char* [In]
  fun GetLeftSeparator(hrc : HRECOCONTEXT, pcsize : UInt32*, pwcleftseparator : Char*) : HRESULT

  # Params # hwl : HRECOWORDLIST [In]
  fun DestroyWordList(hwl : HRECOWORDLIST) : HRESULT

  # Params # hwl : HRECOWORDLIST [In],pwcwords : LibC::LPWSTR [In]
  fun AddWordsToWordList(hwl : HRECOWORDLIST, pwcwords : LibC::LPWSTR) : HRESULT

  # Params # hrec : HRECOGNIZER [In],pbuffer : LibC::LPWSTR [In],phwl : HRECOWORDLIST* [In]
  fun MakeWordList(hrec : HRECOGNIZER, pbuffer : LibC::LPWSTR, phwl : HRECOWORDLIST*) : HRESULT

  # Params # recognizerclsids : Guid** [In],count : UInt32* [In]
  fun GetAllRecognizers(recognizerclsids : Guid**, count : UInt32*) : HRESULT

  # Params # clsid : Guid [In],precoattributes : RECO_ATTRS* [In]
  fun LoadCachedAttributes(clsid : Guid, precoattributes : RECO_ATTRS*) : HRESULT
end
struct LibWin32::IInkRectangle
  def query_interface(this : IInkRectangle*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRectangle*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRectangle*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRectangle*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRectangle*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRectangle*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRectangle*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_top(this : IInkRectangle*, units : Int32*) : HRESULT
    @lpVtbl.value.get_top.call(this, units)
  end
  def put_top(this : IInkRectangle*, units : Int32) : HRESULT
    @lpVtbl.value.put_top.call(this, units)
  end
  def get_left(this : IInkRectangle*, units : Int32*) : HRESULT
    @lpVtbl.value.get_left.call(this, units)
  end
  def put_left(this : IInkRectangle*, units : Int32) : HRESULT
    @lpVtbl.value.put_left.call(this, units)
  end
  def get_bottom(this : IInkRectangle*, units : Int32*) : HRESULT
    @lpVtbl.value.get_bottom.call(this, units)
  end
  def put_bottom(this : IInkRectangle*, units : Int32) : HRESULT
    @lpVtbl.value.put_bottom.call(this, units)
  end
  def get_right(this : IInkRectangle*, units : Int32*) : HRESULT
    @lpVtbl.value.get_right.call(this, units)
  end
  def put_right(this : IInkRectangle*, units : Int32) : HRESULT
    @lpVtbl.value.put_right.call(this, units)
  end
  def get_data(this : IInkRectangle*, rect : RECT*) : HRESULT
    @lpVtbl.value.get_data.call(this, rect)
  end
  def put_data(this : IInkRectangle*, rect : RECT) : HRESULT
    @lpVtbl.value.put_data.call(this, rect)
  end
  def get_rectangle(this : IInkRectangle*, top : Int32*, left : Int32*, bottom : Int32*, right : Int32*) : HRESULT
    @lpVtbl.value.get_rectangle.call(this, top, left, bottom, right)
  end
  def set_rectangle(this : IInkRectangle*, top : Int32, left : Int32, bottom : Int32, right : Int32) : HRESULT
    @lpVtbl.value.set_rectangle.call(this, top, left, bottom, right)
  end
end
struct LibWin32::IInkExtendedProperty
  def query_interface(this : IInkExtendedProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkExtendedProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkExtendedProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkExtendedProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkExtendedProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkExtendedProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkExtendedProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_guid(this : IInkExtendedProperty*, guid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.call(this, guid)
  end
  def get_data(this : IInkExtendedProperty*, data : VARIANT*) : HRESULT
    @lpVtbl.value.get_data.call(this, data)
  end
  def put_data(this : IInkExtendedProperty*, data : VARIANT) : HRESULT
    @lpVtbl.value.put_data.call(this, data)
  end
end
struct LibWin32::IInkExtendedProperties
  def query_interface(this : IInkExtendedProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkExtendedProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkExtendedProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkExtendedProperties*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkExtendedProperties*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkExtendedProperties*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkExtendedProperties*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkExtendedProperties*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkExtendedProperties*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def item(this : IInkExtendedProperties*, identifier : VARIANT, item : IInkExtendedProperty*) : HRESULT
    @lpVtbl.value.item.call(this, identifier, item)
  end
  def add(this : IInkExtendedProperties*, guid : UInt8*, data : VARIANT, inkextendedproperty : IInkExtendedProperty*) : HRESULT
    @lpVtbl.value.add.call(this, guid, data, inkextendedproperty)
  end
  def remove(this : IInkExtendedProperties*, identifier : VARIANT) : HRESULT
    @lpVtbl.value.remove.call(this, identifier)
  end
  def clear(this : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
  def does_property_exist(this : IInkExtendedProperties*, guid : UInt8*, doespropertyexist : Int16*) : HRESULT
    @lpVtbl.value.does_property_exist.call(this, guid, doespropertyexist)
  end
end
struct LibWin32::IInkDrawingAttributes
  def query_interface(this : IInkDrawingAttributes*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDrawingAttributes*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDrawingAttributes*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDrawingAttributes*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDrawingAttributes*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDrawingAttributes*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDrawingAttributes*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_color(this : IInkDrawingAttributes*, currentcolor : Int32*) : HRESULT
    @lpVtbl.value.get_color.call(this, currentcolor)
  end
  def put_color(this : IInkDrawingAttributes*, newcolor : Int32) : HRESULT
    @lpVtbl.value.put_color.call(this, newcolor)
  end
  def get_width(this : IInkDrawingAttributes*, currentwidth : Float32*) : HRESULT
    @lpVtbl.value.get_width.call(this, currentwidth)
  end
  def put_width(this : IInkDrawingAttributes*, newwidth : Float32) : HRESULT
    @lpVtbl.value.put_width.call(this, newwidth)
  end
  def get_height(this : IInkDrawingAttributes*, currentheight : Float32*) : HRESULT
    @lpVtbl.value.get_height.call(this, currentheight)
  end
  def put_height(this : IInkDrawingAttributes*, newheight : Float32) : HRESULT
    @lpVtbl.value.put_height.call(this, newheight)
  end
  def get_fit_to_curve(this : IInkDrawingAttributes*, flag : Int16*) : HRESULT
    @lpVtbl.value.get_fit_to_curve.call(this, flag)
  end
  def put_fit_to_curve(this : IInkDrawingAttributes*, flag : Int16) : HRESULT
    @lpVtbl.value.put_fit_to_curve.call(this, flag)
  end
  def get_ignore_pressure(this : IInkDrawingAttributes*, flag : Int16*) : HRESULT
    @lpVtbl.value.get_ignore_pressure.call(this, flag)
  end
  def put_ignore_pressure(this : IInkDrawingAttributes*, flag : Int16) : HRESULT
    @lpVtbl.value.put_ignore_pressure.call(this, flag)
  end
  def get_anti_aliased(this : IInkDrawingAttributes*, flag : Int16*) : HRESULT
    @lpVtbl.value.get_anti_aliased.call(this, flag)
  end
  def put_anti_aliased(this : IInkDrawingAttributes*, flag : Int16) : HRESULT
    @lpVtbl.value.put_anti_aliased.call(this, flag)
  end
  def get_transparency(this : IInkDrawingAttributes*, currenttransparency : Int32*) : HRESULT
    @lpVtbl.value.get_transparency.call(this, currenttransparency)
  end
  def put_transparency(this : IInkDrawingAttributes*, newtransparency : Int32) : HRESULT
    @lpVtbl.value.put_transparency.call(this, newtransparency)
  end
  def get_raster_operation(this : IInkDrawingAttributes*, currentrasteroperation : InkRasterOperation*) : HRESULT
    @lpVtbl.value.get_raster_operation.call(this, currentrasteroperation)
  end
  def put_raster_operation(this : IInkDrawingAttributes*, newrasteroperation : InkRasterOperation) : HRESULT
    @lpVtbl.value.put_raster_operation.call(this, newrasteroperation)
  end
  def get_pen_tip(this : IInkDrawingAttributes*, currentpentip : InkPenTip*) : HRESULT
    @lpVtbl.value.get_pen_tip.call(this, currentpentip)
  end
  def put_pen_tip(this : IInkDrawingAttributes*, newpentip : InkPenTip) : HRESULT
    @lpVtbl.value.put_pen_tip.call(this, newpentip)
  end
  def get_extended_properties(this : IInkDrawingAttributes*, properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.call(this, properties)
  end
  def clone(this : IInkDrawingAttributes*, drawingattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.clone.call(this, drawingattributes)
  end
end
struct LibWin32::IInkTransform
  def query_interface(this : IInkTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkTransform*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkTransform*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkTransform*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkTransform*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def reset(this : IInkTransform*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def translate(this : IInkTransform*, horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.translate.call(this, horizontalcomponent, verticalcomponent)
  end
  def rotate(this : IInkTransform*, degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees, x, y)
  end
  def reflect(this : IInkTransform*, horizontally : Int16, vertically : Int16) : HRESULT
    @lpVtbl.value.reflect.call(this, horizontally, vertically)
  end
  def shear(this : IInkTransform*, horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.shear.call(this, horizontalcomponent, verticalcomponent)
  end
  def scale_transform(this : IInkTransform*, horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.call(this, horizontalmultiplier, verticalmultiplier)
  end
  def get_transform(this : IInkTransform*, em11 : Float32*, em12 : Float32*, em21 : Float32*, em22 : Float32*, edx : Float32*, edy : Float32*) : HRESULT
    @lpVtbl.value.get_transform.call(this, em11, em12, em21, em22, edx, edy)
  end
  def set_transform(this : IInkTransform*, em11 : Float32, em12 : Float32, em21 : Float32, em22 : Float32, edx : Float32, edy : Float32) : HRESULT
    @lpVtbl.value.set_transform.call(this, em11, em12, em21, em22, edx, edy)
  end
  def get_e_m11(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m11.call(this, value)
  end
  def put_e_m11(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_m11.call(this, value)
  end
  def get_e_m12(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m12.call(this, value)
  end
  def put_e_m12(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_m12.call(this, value)
  end
  def get_e_m21(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m21.call(this, value)
  end
  def put_e_m21(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_m21.call(this, value)
  end
  def get_e_m22(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m22.call(this, value)
  end
  def put_e_m22(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_m22.call(this, value)
  end
  def get_e_dx(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_dx.call(this, value)
  end
  def put_e_dx(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_dx.call(this, value)
  end
  def get_e_dy(this : IInkTransform*, value : Float32*) : HRESULT
    @lpVtbl.value.get_e_dy.call(this, value)
  end
  def put_e_dy(this : IInkTransform*, value : Float32) : HRESULT
    @lpVtbl.value.put_e_dy.call(this, value)
  end
  def get_data(this : IInkTransform*, xform : XFORM*) : HRESULT
    @lpVtbl.value.get_data.call(this, xform)
  end
  def put_data(this : IInkTransform*, xform : XFORM) : HRESULT
    @lpVtbl.value.put_data.call(this, xform)
  end
end
struct LibWin32::IInkGesture
  def query_interface(this : IInkGesture*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkGesture*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkGesture*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkGesture*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkGesture*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkGesture*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkGesture*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_confidence(this : IInkGesture*, confidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.call(this, confidence)
  end
  def get_id(this : IInkGesture*, id : InkApplicationGesture*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_hot_point(this : IInkGesture*, x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.get_hot_point.call(this, x, y)
  end
end
struct LibWin32::IInkCursor
  def query_interface(this : IInkCursor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCursor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCursor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCursor*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCursor*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCursor*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCursor*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IInkCursor*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_id(this : IInkCursor*, id : Int32*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_inverted(this : IInkCursor*, status : Int16*) : HRESULT
    @lpVtbl.value.get_inverted.call(this, status)
  end
  def get_drawing_attributes(this : IInkCursor*, attributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.call(this, attributes)
  end
  def putref_drawing_attributes(this : IInkCursor*, attributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.call(this, attributes)
  end
  def get_tablet(this : IInkCursor*, tablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.call(this, tablet)
  end
  def get_buttons(this : IInkCursor*, buttons : IInkCursorButtons*) : HRESULT
    @lpVtbl.value.get_buttons.call(this, buttons)
  end
end
struct LibWin32::IInkCursors
  def query_interface(this : IInkCursors*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCursors*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCursors*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCursors*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCursors*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCursors*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCursors*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkCursors*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkCursors*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def item(this : IInkCursors*, index : Int32, cursor : IInkCursor*) : HRESULT
    @lpVtbl.value.item.call(this, index, cursor)
  end
end
struct LibWin32::IInkCursorButton
  def query_interface(this : IInkCursorButton*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCursorButton*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCursorButton*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCursorButton*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCursorButton*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCursorButton*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCursorButton*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IInkCursorButton*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_id(this : IInkCursorButton*, id : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_state(this : IInkCursorButton*, currentstate : InkCursorButtonState*) : HRESULT
    @lpVtbl.value.get_state.call(this, currentstate)
  end
end
struct LibWin32::IInkCursorButtons
  def query_interface(this : IInkCursorButtons*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCursorButtons*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCursorButtons*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCursorButtons*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCursorButtons*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCursorButtons*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCursorButtons*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkCursorButtons*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkCursorButtons*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def item(this : IInkCursorButtons*, identifier : VARIANT, button : IInkCursorButton*) : HRESULT
    @lpVtbl.value.item.call(this, identifier, button)
  end
end
struct LibWin32::IInkTablet
  def query_interface(this : IInkTablet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkTablet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkTablet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkTablet*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkTablet*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkTablet*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkTablet*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IInkTablet*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_plug_and_play_id(this : IInkTablet*, id : UInt8**) : HRESULT
    @lpVtbl.value.get_plug_and_play_id.call(this, id)
  end
  def get_maximum_input_rectangle(this : IInkTablet*, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_maximum_input_rectangle.call(this, rectangle)
  end
  def get_hardware_capabilities(this : IInkTablet*, capabilities : TabletHardwareCapabilities*) : HRESULT
    @lpVtbl.value.get_hardware_capabilities.call(this, capabilities)
  end
  def is_packet_property_supported(this : IInkTablet*, packetpropertyname : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_packet_property_supported.call(this, packetpropertyname, supported)
  end
  def get_property_metrics(this : IInkTablet*, propertyname : UInt8*, minimum : Int32*, maximum : Int32*, units : TabletPropertyMetricUnit*, resolution : Float32*) : HRESULT
    @lpVtbl.value.get_property_metrics.call(this, propertyname, minimum, maximum, units, resolution)
  end
end
struct LibWin32::IInkTablet2
  def query_interface(this : IInkTablet2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkTablet2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkTablet2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkTablet2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkTablet2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkTablet2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkTablet2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_device_kind(this : IInkTablet2*, kind : TabletDeviceKind*) : HRESULT
    @lpVtbl.value.get_device_kind.call(this, kind)
  end
end
struct LibWin32::IInkTablet3
  def query_interface(this : IInkTablet3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkTablet3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkTablet3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkTablet3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkTablet3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkTablet3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkTablet3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_is_multi_touch(this : IInkTablet3*, pismultitouch : Int16*) : HRESULT
    @lpVtbl.value.get_is_multi_touch.call(this, pismultitouch)
  end
  def get_maximum_cursors(this : IInkTablet3*, pmaximumcursors : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_cursors.call(this, pmaximumcursors)
  end
end
struct LibWin32::IInkTablets
  def query_interface(this : IInkTablets*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkTablets*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkTablets*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkTablets*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkTablets*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkTablets*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkTablets*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkTablets*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkTablets*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def get_default_tablet(this : IInkTablets*, defaulttablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_default_tablet.call(this, defaulttablet)
  end
  def item(this : IInkTablets*, index : Int32, tablet : IInkTablet*) : HRESULT
    @lpVtbl.value.item.call(this, index, tablet)
  end
  def is_packet_property_supported(this : IInkTablets*, packetpropertyname : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_packet_property_supported.call(this, packetpropertyname, supported)
  end
end
struct LibWin32::IInkStrokeDisp
  def query_interface(this : IInkStrokeDisp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkStrokeDisp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkStrokeDisp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkStrokeDisp*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkStrokeDisp*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkStrokeDisp*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkStrokeDisp*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IInkStrokeDisp*, id : Int32*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_bezier_points(this : IInkStrokeDisp*, points : VARIANT*) : HRESULT
    @lpVtbl.value.get_bezier_points.call(this, points)
  end
  def get_drawing_attributes(this : IInkStrokeDisp*, drawattrs : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.call(this, drawattrs)
  end
  def putref_drawing_attributes(this : IInkStrokeDisp*, drawattrs : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.call(this, drawattrs)
  end
  def get_ink(this : IInkStrokeDisp*, ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ink)
  end
  def get_extended_properties(this : IInkStrokeDisp*, properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.call(this, properties)
  end
  def get_polyline_cusps(this : IInkStrokeDisp*, cusps : VARIANT*) : HRESULT
    @lpVtbl.value.get_polyline_cusps.call(this, cusps)
  end
  def get_bezier_cusps(this : IInkStrokeDisp*, cusps : VARIANT*) : HRESULT
    @lpVtbl.value.get_bezier_cusps.call(this, cusps)
  end
  def get_self_intersections(this : IInkStrokeDisp*, intersections : VARIANT*) : HRESULT
    @lpVtbl.value.get_self_intersections.call(this, intersections)
  end
  def get_packet_count(this : IInkStrokeDisp*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_packet_count.call(this, plcount)
  end
  def get_packet_size(this : IInkStrokeDisp*, plsize : Int32*) : HRESULT
    @lpVtbl.value.get_packet_size.call(this, plsize)
  end
  def get_packet_description(this : IInkStrokeDisp*, packetdescription : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_description.call(this, packetdescription)
  end
  def get_deleted(this : IInkStrokeDisp*, deleted : Int16*) : HRESULT
    @lpVtbl.value.get_deleted.call(this, deleted)
  end
  def get_bounding_box(this : IInkStrokeDisp*, boundingboxmode : InkBoundingBoxMode, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.call(this, boundingboxmode, rectangle)
  end
  def find_intersections(this : IInkStrokeDisp*, strokes : IInkStrokes, intersections : VARIANT*) : HRESULT
    @lpVtbl.value.find_intersections.call(this, strokes, intersections)
  end
  def get_rectangle_intersections(this : IInkStrokeDisp*, rectangle : IInkRectangle, intersections : VARIANT*) : HRESULT
    @lpVtbl.value.get_rectangle_intersections.call(this, rectangle, intersections)
  end
  def clip(this : IInkStrokeDisp*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.call(this, rectangle)
  end
  def hit_test_circle(this : IInkStrokeDisp*, x : Int32, y : Int32, radius : Float32, intersects : Int16*) : HRESULT
    @lpVtbl.value.hit_test_circle.call(this, x, y, radius, intersects)
  end
  def nearest_point(this : IInkStrokeDisp*, x : Int32, y : Int32, distance : Float32*, point : Float32*) : HRESULT
    @lpVtbl.value.nearest_point.call(this, x, y, distance, point)
  end
  def split(this : IInkStrokeDisp*, splitat : Float32, newstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.split.call(this, splitat, newstroke)
  end
  def get_packet_description_property_metrics(this : IInkStrokeDisp*, propertyname : UInt8*, minimum : Int32*, maximum : Int32*, units : TabletPropertyMetricUnit*, resolution : Float32*) : HRESULT
    @lpVtbl.value.get_packet_description_property_metrics.call(this, propertyname, minimum, maximum, units, resolution)
  end
  def get_points(this : IInkStrokeDisp*, index : Int32, count : Int32, points : VARIANT*) : HRESULT
    @lpVtbl.value.get_points.call(this, index, count, points)
  end
  def set_points(this : IInkStrokeDisp*, points : VARIANT, index : Int32, count : Int32, numberofpointsset : Int32*) : HRESULT
    @lpVtbl.value.set_points.call(this, points, index, count, numberofpointsset)
  end
  def get_packet_data(this : IInkStrokeDisp*, index : Int32, count : Int32, packetdata : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_data.call(this, index, count, packetdata)
  end
  def get_packet_values_by_property(this : IInkStrokeDisp*, propertyname : UInt8*, index : Int32, count : Int32, packetvalues : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_values_by_property.call(this, propertyname, index, count, packetvalues)
  end
  def set_packet_values_by_property(this : IInkStrokeDisp*, bstrpropertyname : UInt8*, packetvalues : VARIANT, index : Int32, count : Int32, numberofpacketsset : Int32*) : HRESULT
    @lpVtbl.value.set_packet_values_by_property.call(this, bstrpropertyname, packetvalues, index, count, numberofpacketsset)
  end
  def get_flattened_bezier_points(this : IInkStrokeDisp*, fittingerror : Int32, flattenedbezierpoints : VARIANT*) : HRESULT
    @lpVtbl.value.get_flattened_bezier_points.call(this, fittingerror, flattenedbezierpoints)
  end
  def transform(this : IInkStrokeDisp*, transform : IInkTransform, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.transform.call(this, transform, applyonpenwidth)
  end
  def scale_to_rectangle(this : IInkStrokeDisp*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.scale_to_rectangle.call(this, rectangle)
  end
  def move(this : IInkStrokeDisp*, horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.call(this, horizontalcomponent, verticalcomponent)
  end
  def rotate(this : IInkStrokeDisp*, degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees, x, y)
  end
  def shear(this : IInkStrokeDisp*, horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.shear.call(this, horizontalmultiplier, verticalmultiplier)
  end
  def scale_transform(this : IInkStrokeDisp*, horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.call(this, horizontalmultiplier, verticalmultiplier)
  end
end
struct LibWin32::IInkStrokes
  def query_interface(this : IInkStrokes*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkStrokes*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkStrokes*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkStrokes*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkStrokes*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkStrokes*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkStrokes*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkStrokes*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkStrokes*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def get_ink(this : IInkStrokes*, ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ink)
  end
  def get_recognition_result(this : IInkStrokes*, recognitionresult : IInkRecognitionResult*) : HRESULT
    @lpVtbl.value.get_recognition_result.call(this, recognitionresult)
  end
  def to_string(this : IInkStrokes*, tostring : UInt8**) : HRESULT
    @lpVtbl.value.to_string.call(this, tostring)
  end
  def item(this : IInkStrokes*, index : Int32, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.item.call(this, index, stroke)
  end
  def add(this : IInkStrokes*, inkstroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.add.call(this, inkstroke)
  end
  def add_strokes(this : IInkStrokes*, inkstrokes : IInkStrokes) : HRESULT
    @lpVtbl.value.add_strokes.call(this, inkstrokes)
  end
  def remove(this : IInkStrokes*, inkstroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.remove.call(this, inkstroke)
  end
  def remove_strokes(this : IInkStrokes*, inkstrokes : IInkStrokes) : HRESULT
    @lpVtbl.value.remove_strokes.call(this, inkstrokes)
  end
  def modify_drawing_attributes(this : IInkStrokes*, drawattrs : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.modify_drawing_attributes.call(this, drawattrs)
  end
  def get_bounding_box(this : IInkStrokes*, boundingboxmode : InkBoundingBoxMode, boundingbox : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.call(this, boundingboxmode, boundingbox)
  end
  def transform(this : IInkStrokes*, transform : IInkTransform, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.transform.call(this, transform, applyonpenwidth)
  end
  def scale_to_rectangle(this : IInkStrokes*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.scale_to_rectangle.call(this, rectangle)
  end
  def move(this : IInkStrokes*, horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.call(this, horizontalcomponent, verticalcomponent)
  end
  def rotate(this : IInkStrokes*, degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees, x, y)
  end
  def shear(this : IInkStrokes*, horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.shear.call(this, horizontalmultiplier, verticalmultiplier)
  end
  def scale_transform(this : IInkStrokes*, horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.call(this, horizontalmultiplier, verticalmultiplier)
  end
  def clip(this : IInkStrokes*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.call(this, rectangle)
  end
  def remove_recognition_result(this : IInkStrokes*) : HRESULT
    @lpVtbl.value.remove_recognition_result.call(this)
  end
end
struct LibWin32::IInkCustomStrokes
  def query_interface(this : IInkCustomStrokes*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCustomStrokes*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCustomStrokes*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCustomStrokes*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCustomStrokes*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCustomStrokes*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCustomStrokes*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkCustomStrokes*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkCustomStrokes*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def item(this : IInkCustomStrokes*, identifier : VARIANT, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.item.call(this, identifier, strokes)
  end
  def add(this : IInkCustomStrokes*, name : UInt8*, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.add.call(this, name, strokes)
  end
  def remove(this : IInkCustomStrokes*, identifier : VARIANT) : HRESULT
    @lpVtbl.value.remove.call(this, identifier)
  end
  def clear(this : IInkCustomStrokes*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IIInkStrokesEvents
  def query_interface(this : IIInkStrokesEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkStrokesEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkStrokesEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkStrokesEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkStrokesEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkStrokesEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkStrokesEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkDisp
  def query_interface(this : IInkDisp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDisp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDisp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDisp*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDisp*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDisp*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDisp*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_strokes(this : IInkDisp*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def get_extended_properties(this : IInkDisp*, properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.call(this, properties)
  end
  def get_dirty(this : IInkDisp*, dirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.call(this, dirty)
  end
  def put_dirty(this : IInkDisp*, dirty : Int16) : HRESULT
    @lpVtbl.value.put_dirty.call(this, dirty)
  end
  def get_custom_strokes(this : IInkDisp*, ppunkinkcustomstrokes : IInkCustomStrokes*) : HRESULT
    @lpVtbl.value.get_custom_strokes.call(this, ppunkinkcustomstrokes)
  end
  def get_bounding_box(this : IInkDisp*, boundingboxmode : InkBoundingBoxMode, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.call(this, boundingboxmode, rectangle)
  end
  def delete_strokes(this : IInkDisp*, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.delete_strokes.call(this, strokes)
  end
  def delete_stroke(this : IInkDisp*, stroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.delete_stroke.call(this, stroke)
  end
  def extract_strokes(this : IInkDisp*, strokes : IInkStrokes, extractflags : InkExtractFlags, extractedink : IInkDisp*) : HRESULT
    @lpVtbl.value.extract_strokes.call(this, strokes, extractflags, extractedink)
  end
  def extract_with_rectangle(this : IInkDisp*, rectangle : IInkRectangle, extractflags : InkExtractFlags, extractedink : IInkDisp*) : HRESULT
    @lpVtbl.value.extract_with_rectangle.call(this, rectangle, extractflags, extractedink)
  end
  def clip(this : IInkDisp*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.call(this, rectangle)
  end
  def clone(this : IInkDisp*, newink : IInkDisp*) : HRESULT
    @lpVtbl.value.clone.call(this, newink)
  end
  def hit_test_circle(this : IInkDisp*, x : Int32, y : Int32, radius : Float32, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_circle.call(this, x, y, radius, strokes)
  end
  def hit_test_with_rectangle(this : IInkDisp*, selectionrectangle : IInkRectangle, intersectpercent : Float32, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_with_rectangle.call(this, selectionrectangle, intersectpercent, strokes)
  end
  def hit_test_with_lasso(this : IInkDisp*, points : VARIANT, intersectpercent : Float32, lassopoints : VARIANT*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_with_lasso.call(this, points, intersectpercent, lassopoints, strokes)
  end
  def nearest_point(this : IInkDisp*, x : Int32, y : Int32, pointonstroke : Float32*, distancefrompacket : Float32*, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.nearest_point.call(this, x, y, pointonstroke, distancefrompacket, stroke)
  end
  def create_strokes(this : IInkDisp*, strokeids : VARIANT, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.create_strokes.call(this, strokeids, strokes)
  end
  def add_strokes_at_rectangle(this : IInkDisp*, sourcestrokes : IInkStrokes, targetrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.add_strokes_at_rectangle.call(this, sourcestrokes, targetrectangle)
  end
  def save(this : IInkDisp*, persistenceformat : InkPersistenceFormat, compressionmode : InkPersistenceCompressionMode, data : VARIANT*) : HRESULT
    @lpVtbl.value.save.call(this, persistenceformat, compressionmode, data)
  end
  def load(this : IInkDisp*, data : VARIANT) : HRESULT
    @lpVtbl.value.load.call(this, data)
  end
  def create_stroke(this : IInkDisp*, packetdata : VARIANT, packetdescription : VARIANT, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.create_stroke.call(this, packetdata, packetdescription, stroke)
  end
  def clipboard_copy_with_rectangle(this : IInkDisp*, rectangle : IInkRectangle, clipboardformats : InkClipboardFormats, clipboardmodes : InkClipboardModes, dataobject : IDataObject*) : HRESULT
    @lpVtbl.value.clipboard_copy_with_rectangle.call(this, rectangle, clipboardformats, clipboardmodes, dataobject)
  end
  def clipboard_copy(this : IInkDisp*, strokes : IInkStrokes, clipboardformats : InkClipboardFormats, clipboardmodes : InkClipboardModes, dataobject : IDataObject*) : HRESULT
    @lpVtbl.value.clipboard_copy.call(this, strokes, clipboardformats, clipboardmodes, dataobject)
  end
  def can_paste(this : IInkDisp*, dataobject : IDataObject, canpaste : Int16*) : HRESULT
    @lpVtbl.value.can_paste.call(this, dataobject, canpaste)
  end
  def clipboard_paste(this : IInkDisp*, x : Int32, y : Int32, dataobject : IDataObject, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.clipboard_paste.call(this, x, y, dataobject, strokes)
  end
end
struct LibWin32::IIInkEvents
  def query_interface(this : IIInkEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkRenderer
  def query_interface(this : IInkRenderer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRenderer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRenderer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRenderer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRenderer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRenderer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRenderer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_view_transform(this : IInkRenderer*, viewtransform : IInkTransform) : HRESULT
    @lpVtbl.value.get_view_transform.call(this, viewtransform)
  end
  def set_view_transform(this : IInkRenderer*, viewtransform : IInkTransform) : HRESULT
    @lpVtbl.value.set_view_transform.call(this, viewtransform)
  end
  def get_object_transform(this : IInkRenderer*, objecttransform : IInkTransform) : HRESULT
    @lpVtbl.value.get_object_transform.call(this, objecttransform)
  end
  def set_object_transform(this : IInkRenderer*, objecttransform : IInkTransform) : HRESULT
    @lpVtbl.value.set_object_transform.call(this, objecttransform)
  end
  def draw(this : IInkRenderer*, hdc : LibC::IntPtrT, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.draw.call(this, hdc, strokes)
  end
  def draw_stroke(this : IInkRenderer*, hdc : LibC::IntPtrT, stroke : IInkStrokeDisp, drawingattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.draw_stroke.call(this, hdc, stroke, drawingattributes)
  end
  def pixel_to_ink_space(this : IInkRenderer*, hdc : LibC::IntPtrT, x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.pixel_to_ink_space.call(this, hdc, x, y)
  end
  def ink_space_to_pixel(this : IInkRenderer*, hdcdisplay : LibC::IntPtrT, x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.ink_space_to_pixel.call(this, hdcdisplay, x, y)
  end
  def pixel_to_ink_space_from_points(this : IInkRenderer*, hdc : LibC::IntPtrT, points : VARIANT*) : HRESULT
    @lpVtbl.value.pixel_to_ink_space_from_points.call(this, hdc, points)
  end
  def ink_space_to_pixel_from_points(this : IInkRenderer*, hdc : LibC::IntPtrT, points : VARIANT*) : HRESULT
    @lpVtbl.value.ink_space_to_pixel_from_points.call(this, hdc, points)
  end
  def measure(this : IInkRenderer*, strokes : IInkStrokes, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.measure.call(this, strokes, rectangle)
  end
  def measure_stroke(this : IInkRenderer*, stroke : IInkStrokeDisp, drawingattributes : IInkDrawingAttributes, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.measure_stroke.call(this, stroke, drawingattributes, rectangle)
  end
  def move(this : IInkRenderer*, horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.call(this, horizontalcomponent, verticalcomponent)
  end
  def rotate(this : IInkRenderer*, degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees, x, y)
  end
  def scale_transform(this : IInkRenderer*, horizontalmultiplier : Float32, verticalmultiplier : Float32, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.scale_transform.call(this, horizontalmultiplier, verticalmultiplier, applyonpenwidth)
  end
end
struct LibWin32::IInkCollector
  def query_interface(this : IInkCollector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkCollector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkCollector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkCollector*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkCollector*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkCollector*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkCollector*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_h_wnd(this : IInkCollector*, currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.call(this, currentwindow)
  end
  def put_h_wnd(this : IInkCollector*, newwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.put_h_wnd.call(this, newwindow)
  end
  def get_enabled(this : IInkCollector*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, collecting)
  end
  def put_enabled(this : IInkCollector*, collecting : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, collecting)
  end
  def get_default_drawing_attributes(this : IInkCollector*, currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.call(this, currentattributes)
  end
  def putref_default_drawing_attributes(this : IInkCollector*, newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.call(this, newattributes)
  end
  def get_renderer(this : IInkCollector*, currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.call(this, currentinkrenderer)
  end
  def putref_renderer(this : IInkCollector*, newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.call(this, newinkrenderer)
  end
  def get_ink(this : IInkCollector*, ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ink)
  end
  def putref_ink(this : IInkCollector*, newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.call(this, newink)
  end
  def get_auto_redraw(this : IInkCollector*, autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.call(this, autoredraw)
  end
  def put_auto_redraw(this : IInkCollector*, autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.call(this, autoredraw)
  end
  def get_collecting_ink(this : IInkCollector*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.call(this, collecting)
  end
  def get_collection_mode(this : IInkCollector*, mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.call(this, mode)
  end
  def put_collection_mode(this : IInkCollector*, mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.call(this, mode)
  end
  def get_dynamic_rendering(this : IInkCollector*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.call(this, enabled)
  end
  def put_dynamic_rendering(this : IInkCollector*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.call(this, enabled)
  end
  def get_desired_packet_description(this : IInkCollector*, packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.call(this, packetguids)
  end
  def put_desired_packet_description(this : IInkCollector*, packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.call(this, packetguids)
  end
  def get_mouse_icon(this : IInkCollector*, mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.call(this, mouseicon)
  end
  def put_mouse_icon(this : IInkCollector*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.call(this, mouseicon)
  end
  def putref_mouse_icon(this : IInkCollector*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.call(this, mouseicon)
  end
  def get_mouse_pointer(this : IInkCollector*, mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.call(this, mousepointer)
  end
  def put_mouse_pointer(this : IInkCollector*, mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.call(this, mousepointer)
  end
  def get_cursors(this : IInkCollector*, cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.call(this, cursors)
  end
  def get_margin_x(this : IInkCollector*, marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.call(this, marginx)
  end
  def put_margin_x(this : IInkCollector*, marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.call(this, marginx)
  end
  def get_margin_y(this : IInkCollector*, marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.call(this, marginy)
  end
  def put_margin_y(this : IInkCollector*, marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.call(this, marginy)
  end
  def get_tablet(this : IInkCollector*, singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.call(this, singletablet)
  end
  def get_support_high_contrast_ink(this : IInkCollector*, support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.call(this, support)
  end
  def put_support_high_contrast_ink(this : IInkCollector*, support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.call(this, support)
  end
  def set_gesture_status(this : IInkCollector*, gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.call(this, gesture, listen)
  end
  def get_gesture_status(this : IInkCollector*, gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.call(this, gesture, listening)
  end
  def get_window_input_rectangle(this : IInkCollector*, windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_window_input_rectangle(this : IInkCollector*, windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_all_tablets_mode(this : IInkCollector*, usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.call(this, usemouseforinput)
  end
  def set_single_tablet_integrated_mode(this : IInkCollector*, tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.call(this, tablet)
  end
  def get_event_interest(this : IInkCollector*, eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.call(this, eventid, listen)
  end
  def set_event_interest(this : IInkCollector*, eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.call(this, eventid, listen)
  end
end
struct LibWin32::IIInkCollectorEvents
  def query_interface(this : IIInkCollectorEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkCollectorEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkCollectorEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkCollectorEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkCollectorEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkCollectorEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkCollectorEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkOverlay
  def query_interface(this : IInkOverlay*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkOverlay*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkOverlay*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkOverlay*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkOverlay*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkOverlay*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkOverlay*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_h_wnd(this : IInkOverlay*, currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.call(this, currentwindow)
  end
  def put_h_wnd(this : IInkOverlay*, newwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.put_h_wnd.call(this, newwindow)
  end
  def get_enabled(this : IInkOverlay*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, collecting)
  end
  def put_enabled(this : IInkOverlay*, collecting : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, collecting)
  end
  def get_default_drawing_attributes(this : IInkOverlay*, currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.call(this, currentattributes)
  end
  def putref_default_drawing_attributes(this : IInkOverlay*, newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.call(this, newattributes)
  end
  def get_renderer(this : IInkOverlay*, currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.call(this, currentinkrenderer)
  end
  def putref_renderer(this : IInkOverlay*, newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.call(this, newinkrenderer)
  end
  def get_ink(this : IInkOverlay*, ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ink)
  end
  def putref_ink(this : IInkOverlay*, newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.call(this, newink)
  end
  def get_auto_redraw(this : IInkOverlay*, autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.call(this, autoredraw)
  end
  def put_auto_redraw(this : IInkOverlay*, autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.call(this, autoredraw)
  end
  def get_collecting_ink(this : IInkOverlay*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.call(this, collecting)
  end
  def get_collection_mode(this : IInkOverlay*, mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.call(this, mode)
  end
  def put_collection_mode(this : IInkOverlay*, mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.call(this, mode)
  end
  def get_dynamic_rendering(this : IInkOverlay*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.call(this, enabled)
  end
  def put_dynamic_rendering(this : IInkOverlay*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.call(this, enabled)
  end
  def get_desired_packet_description(this : IInkOverlay*, packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.call(this, packetguids)
  end
  def put_desired_packet_description(this : IInkOverlay*, packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.call(this, packetguids)
  end
  def get_mouse_icon(this : IInkOverlay*, mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.call(this, mouseicon)
  end
  def put_mouse_icon(this : IInkOverlay*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.call(this, mouseicon)
  end
  def putref_mouse_icon(this : IInkOverlay*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.call(this, mouseicon)
  end
  def get_mouse_pointer(this : IInkOverlay*, mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.call(this, mousepointer)
  end
  def put_mouse_pointer(this : IInkOverlay*, mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.call(this, mousepointer)
  end
  def get_editing_mode(this : IInkOverlay*, editingmode : InkOverlayEditingMode*) : HRESULT
    @lpVtbl.value.get_editing_mode.call(this, editingmode)
  end
  def put_editing_mode(this : IInkOverlay*, editingmode : InkOverlayEditingMode) : HRESULT
    @lpVtbl.value.put_editing_mode.call(this, editingmode)
  end
  def get_selection(this : IInkOverlay*, selection : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_selection.call(this, selection)
  end
  def put_selection(this : IInkOverlay*, selection : IInkStrokes) : HRESULT
    @lpVtbl.value.put_selection.call(this, selection)
  end
  def get_eraser_mode(this : IInkOverlay*, erasermode : InkOverlayEraserMode*) : HRESULT
    @lpVtbl.value.get_eraser_mode.call(this, erasermode)
  end
  def put_eraser_mode(this : IInkOverlay*, erasermode : InkOverlayEraserMode) : HRESULT
    @lpVtbl.value.put_eraser_mode.call(this, erasermode)
  end
  def get_eraser_width(this : IInkOverlay*, eraserwidth : Int32*) : HRESULT
    @lpVtbl.value.get_eraser_width.call(this, eraserwidth)
  end
  def put_eraser_width(this : IInkOverlay*, neweraserwidth : Int32) : HRESULT
    @lpVtbl.value.put_eraser_width.call(this, neweraserwidth)
  end
  def get_attach_mode(this : IInkOverlay*, attachmode : InkOverlayAttachMode*) : HRESULT
    @lpVtbl.value.get_attach_mode.call(this, attachmode)
  end
  def put_attach_mode(this : IInkOverlay*, attachmode : InkOverlayAttachMode) : HRESULT
    @lpVtbl.value.put_attach_mode.call(this, attachmode)
  end
  def get_cursors(this : IInkOverlay*, cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.call(this, cursors)
  end
  def get_margin_x(this : IInkOverlay*, marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.call(this, marginx)
  end
  def put_margin_x(this : IInkOverlay*, marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.call(this, marginx)
  end
  def get_margin_y(this : IInkOverlay*, marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.call(this, marginy)
  end
  def put_margin_y(this : IInkOverlay*, marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.call(this, marginy)
  end
  def get_tablet(this : IInkOverlay*, singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.call(this, singletablet)
  end
  def get_support_high_contrast_ink(this : IInkOverlay*, support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.call(this, support)
  end
  def put_support_high_contrast_ink(this : IInkOverlay*, support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.call(this, support)
  end
  def get_support_high_contrast_selection_ui(this : IInkOverlay*, support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_selection_ui.call(this, support)
  end
  def put_support_high_contrast_selection_ui(this : IInkOverlay*, support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_selection_ui.call(this, support)
  end
  def hit_test_selection(this : IInkOverlay*, x : Int32, y : Int32, selarea : SelectionHitResult*) : HRESULT
    @lpVtbl.value.hit_test_selection.call(this, x, y, selarea)
  end
  def draw(this : IInkOverlay*, rect : IInkRectangle) : HRESULT
    @lpVtbl.value.draw.call(this, rect)
  end
  def set_gesture_status(this : IInkOverlay*, gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.call(this, gesture, listen)
  end
  def get_gesture_status(this : IInkOverlay*, gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.call(this, gesture, listening)
  end
  def get_window_input_rectangle(this : IInkOverlay*, windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_window_input_rectangle(this : IInkOverlay*, windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_all_tablets_mode(this : IInkOverlay*, usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.call(this, usemouseforinput)
  end
  def set_single_tablet_integrated_mode(this : IInkOverlay*, tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.call(this, tablet)
  end
  def get_event_interest(this : IInkOverlay*, eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.call(this, eventid, listen)
  end
  def set_event_interest(this : IInkOverlay*, eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.call(this, eventid, listen)
  end
end
struct LibWin32::IIInkOverlayEvents
  def query_interface(this : IIInkOverlayEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkOverlayEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkOverlayEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkOverlayEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkOverlayEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkOverlayEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkOverlayEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkPicture
  def query_interface(this : IInkPicture*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkPicture*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkPicture*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkPicture*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkPicture*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkPicture*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkPicture*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_h_wnd(this : IInkPicture*, currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.call(this, currentwindow)
  end
  def get_default_drawing_attributes(this : IInkPicture*, currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.call(this, currentattributes)
  end
  def putref_default_drawing_attributes(this : IInkPicture*, newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.call(this, newattributes)
  end
  def get_renderer(this : IInkPicture*, currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.call(this, currentinkrenderer)
  end
  def putref_renderer(this : IInkPicture*, newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.call(this, newinkrenderer)
  end
  def get_ink(this : IInkPicture*, ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ink)
  end
  def putref_ink(this : IInkPicture*, newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.call(this, newink)
  end
  def get_auto_redraw(this : IInkPicture*, autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.call(this, autoredraw)
  end
  def put_auto_redraw(this : IInkPicture*, autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.call(this, autoredraw)
  end
  def get_collecting_ink(this : IInkPicture*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.call(this, collecting)
  end
  def get_collection_mode(this : IInkPicture*, mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.call(this, mode)
  end
  def put_collection_mode(this : IInkPicture*, mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.call(this, mode)
  end
  def get_dynamic_rendering(this : IInkPicture*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.call(this, enabled)
  end
  def put_dynamic_rendering(this : IInkPicture*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.call(this, enabled)
  end
  def get_desired_packet_description(this : IInkPicture*, packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.call(this, packetguids)
  end
  def put_desired_packet_description(this : IInkPicture*, packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.call(this, packetguids)
  end
  def get_mouse_icon(this : IInkPicture*, mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.call(this, mouseicon)
  end
  def put_mouse_icon(this : IInkPicture*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.call(this, mouseicon)
  end
  def putref_mouse_icon(this : IInkPicture*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.call(this, mouseicon)
  end
  def get_mouse_pointer(this : IInkPicture*, mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.call(this, mousepointer)
  end
  def put_mouse_pointer(this : IInkPicture*, mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.call(this, mousepointer)
  end
  def get_editing_mode(this : IInkPicture*, editingmode : InkOverlayEditingMode*) : HRESULT
    @lpVtbl.value.get_editing_mode.call(this, editingmode)
  end
  def put_editing_mode(this : IInkPicture*, editingmode : InkOverlayEditingMode) : HRESULT
    @lpVtbl.value.put_editing_mode.call(this, editingmode)
  end
  def get_selection(this : IInkPicture*, selection : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_selection.call(this, selection)
  end
  def put_selection(this : IInkPicture*, selection : IInkStrokes) : HRESULT
    @lpVtbl.value.put_selection.call(this, selection)
  end
  def get_eraser_mode(this : IInkPicture*, erasermode : InkOverlayEraserMode*) : HRESULT
    @lpVtbl.value.get_eraser_mode.call(this, erasermode)
  end
  def put_eraser_mode(this : IInkPicture*, erasermode : InkOverlayEraserMode) : HRESULT
    @lpVtbl.value.put_eraser_mode.call(this, erasermode)
  end
  def get_eraser_width(this : IInkPicture*, eraserwidth : Int32*) : HRESULT
    @lpVtbl.value.get_eraser_width.call(this, eraserwidth)
  end
  def put_eraser_width(this : IInkPicture*, neweraserwidth : Int32) : HRESULT
    @lpVtbl.value.put_eraser_width.call(this, neweraserwidth)
  end
  def putref_picture(this : IInkPicture*, ppicture : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_picture.call(this, ppicture)
  end
  def put_picture(this : IInkPicture*, ppicture : IPictureDisp) : HRESULT
    @lpVtbl.value.put_picture.call(this, ppicture)
  end
  def get_picture(this : IInkPicture*, pppicture : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_picture.call(this, pppicture)
  end
  def put_size_mode(this : IInkPicture*, smnewsizemode : InkPictureSizeMode) : HRESULT
    @lpVtbl.value.put_size_mode.call(this, smnewsizemode)
  end
  def get_size_mode(this : IInkPicture*, smsizemode : InkPictureSizeMode*) : HRESULT
    @lpVtbl.value.get_size_mode.call(this, smsizemode)
  end
  def put_back_color(this : IInkPicture*, newcolor : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.call(this, newcolor)
  end
  def get_back_color(this : IInkPicture*, pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.call(this, pcolor)
  end
  def get_cursors(this : IInkPicture*, cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.call(this, cursors)
  end
  def get_margin_x(this : IInkPicture*, marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.call(this, marginx)
  end
  def put_margin_x(this : IInkPicture*, marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.call(this, marginx)
  end
  def get_margin_y(this : IInkPicture*, marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.call(this, marginy)
  end
  def put_margin_y(this : IInkPicture*, marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.call(this, marginy)
  end
  def get_tablet(this : IInkPicture*, singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.call(this, singletablet)
  end
  def get_support_high_contrast_ink(this : IInkPicture*, support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.call(this, support)
  end
  def put_support_high_contrast_ink(this : IInkPicture*, support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.call(this, support)
  end
  def get_support_high_contrast_selection_ui(this : IInkPicture*, support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_selection_ui.call(this, support)
  end
  def put_support_high_contrast_selection_ui(this : IInkPicture*, support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_selection_ui.call(this, support)
  end
  def hit_test_selection(this : IInkPicture*, x : Int32, y : Int32, selarea : SelectionHitResult*) : HRESULT
    @lpVtbl.value.hit_test_selection.call(this, x, y, selarea)
  end
  def set_gesture_status(this : IInkPicture*, gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.call(this, gesture, listen)
  end
  def get_gesture_status(this : IInkPicture*, gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.call(this, gesture, listening)
  end
  def get_window_input_rectangle(this : IInkPicture*, windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_window_input_rectangle(this : IInkPicture*, windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.call(this, windowinputrectangle)
  end
  def set_all_tablets_mode(this : IInkPicture*, usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.call(this, usemouseforinput)
  end
  def set_single_tablet_integrated_mode(this : IInkPicture*, tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.call(this, tablet)
  end
  def get_event_interest(this : IInkPicture*, eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.call(this, eventid, listen)
  end
  def set_event_interest(this : IInkPicture*, eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.call(this, eventid, listen)
  end
  def get_ink_enabled(this : IInkPicture*, collecting : Int16*) : HRESULT
    @lpVtbl.value.get_ink_enabled.call(this, collecting)
  end
  def put_ink_enabled(this : IInkPicture*, collecting : Int16) : HRESULT
    @lpVtbl.value.put_ink_enabled.call(this, collecting)
  end
  def get_enabled(this : IInkPicture*, pbool : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pbool)
  end
  def put_enabled(this : IInkPicture*, vbool : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, vbool)
  end
end
struct LibWin32::IIInkPictureEvents
  def query_interface(this : IIInkPictureEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkPictureEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkPictureEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkPictureEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkPictureEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkPictureEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkPictureEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkRecognizer
  def query_interface(this : IInkRecognizer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IInkRecognizer*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_vendor(this : IInkRecognizer*, vendor : UInt8**) : HRESULT
    @lpVtbl.value.get_vendor.call(this, vendor)
  end
  def get_capabilities(this : IInkRecognizer*, capabilitiesflags : InkRecognizerCapabilities*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, capabilitiesflags)
  end
  def get_languages(this : IInkRecognizer*, languages : VARIANT*) : HRESULT
    @lpVtbl.value.get_languages.call(this, languages)
  end
  def get_supported_properties(this : IInkRecognizer*, supportedproperties : VARIANT*) : HRESULT
    @lpVtbl.value.get_supported_properties.call(this, supportedproperties)
  end
  def get_preferred_packet_description(this : IInkRecognizer*, preferredpacketdescription : VARIANT*) : HRESULT
    @lpVtbl.value.get_preferred_packet_description.call(this, preferredpacketdescription)
  end
  def create_recognizer_context(this : IInkRecognizer*, context : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.create_recognizer_context.call(this, context)
  end
end
struct LibWin32::IInkRecognizer2
  def query_interface(this : IInkRecognizer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizer2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizer2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizer2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizer2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IInkRecognizer2*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_unicode_ranges(this : IInkRecognizer2*, unicoderanges : VARIANT*) : HRESULT
    @lpVtbl.value.get_unicode_ranges.call(this, unicoderanges)
  end
end
struct LibWin32::IInkRecognizers
  def query_interface(this : IInkRecognizers*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizers*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizers*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizers*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizers*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizers*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizers*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkRecognizers*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkRecognizers*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def get_default_recognizer(this : IInkRecognizers*, lcid : Int32, defaultrecognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_default_recognizer.call(this, lcid, defaultrecognizer)
  end
  def item(this : IInkRecognizers*, index : Int32, inkrecognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.item.call(this, index, inkrecognizer)
  end
end
struct LibWin32::IIInkRecognitionEvents
  def query_interface(this : IIInkRecognitionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkRecognitionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkRecognitionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkRecognitionEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkRecognitionEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkRecognitionEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkRecognitionEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkRecognizerContext
  def query_interface(this : IInkRecognizerContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizerContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizerContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizerContext*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizerContext*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizerContext*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizerContext*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_strokes(this : IInkRecognizerContext*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def putref_strokes(this : IInkRecognizerContext*, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.putref_strokes.call(this, strokes)
  end
  def get_character_auto_completion_mode(this : IInkRecognizerContext*, mode : InkRecognizerCharacterAutoCompletionMode*) : HRESULT
    @lpVtbl.value.get_character_auto_completion_mode.call(this, mode)
  end
  def put_character_auto_completion_mode(this : IInkRecognizerContext*, mode : InkRecognizerCharacterAutoCompletionMode) : HRESULT
    @lpVtbl.value.put_character_auto_completion_mode.call(this, mode)
  end
  def get_factoid(this : IInkRecognizerContext*, factoid : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.call(this, factoid)
  end
  def put_factoid(this : IInkRecognizerContext*, factoid : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.call(this, factoid)
  end
  def get_guide(this : IInkRecognizerContext*, recognizerguide : IInkRecognizerGuide*) : HRESULT
    @lpVtbl.value.get_guide.call(this, recognizerguide)
  end
  def putref_guide(this : IInkRecognizerContext*, recognizerguide : IInkRecognizerGuide) : HRESULT
    @lpVtbl.value.putref_guide.call(this, recognizerguide)
  end
  def get_prefix_text(this : IInkRecognizerContext*, prefix : UInt8**) : HRESULT
    @lpVtbl.value.get_prefix_text.call(this, prefix)
  end
  def put_prefix_text(this : IInkRecognizerContext*, prefix : UInt8*) : HRESULT
    @lpVtbl.value.put_prefix_text.call(this, prefix)
  end
  def get_suffix_text(this : IInkRecognizerContext*, suffix : UInt8**) : HRESULT
    @lpVtbl.value.get_suffix_text.call(this, suffix)
  end
  def put_suffix_text(this : IInkRecognizerContext*, suffix : UInt8*) : HRESULT
    @lpVtbl.value.put_suffix_text.call(this, suffix)
  end
  def get_recognition_flags(this : IInkRecognizerContext*, modes : InkRecognitionModes*) : HRESULT
    @lpVtbl.value.get_recognition_flags.call(this, modes)
  end
  def put_recognition_flags(this : IInkRecognizerContext*, modes : InkRecognitionModes) : HRESULT
    @lpVtbl.value.put_recognition_flags.call(this, modes)
  end
  def get_word_list(this : IInkRecognizerContext*, wordlist : IInkWordList*) : HRESULT
    @lpVtbl.value.get_word_list.call(this, wordlist)
  end
  def putref_word_list(this : IInkRecognizerContext*, wordlist : IInkWordList) : HRESULT
    @lpVtbl.value.putref_word_list.call(this, wordlist)
  end
  def get_recognizer(this : IInkRecognizerContext*, recognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.call(this, recognizer)
  end
  def recognize(this : IInkRecognizerContext*, recognitionstatus : InkRecognitionStatus*, recognitionresult : IInkRecognitionResult*) : HRESULT
    @lpVtbl.value.recognize.call(this, recognitionstatus, recognitionresult)
  end
  def stop_background_recognition(this : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.stop_background_recognition.call(this)
  end
  def end_ink_input(this : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.end_ink_input.call(this)
  end
  def background_recognize(this : IInkRecognizerContext*, customdata : VARIANT) : HRESULT
    @lpVtbl.value.background_recognize.call(this, customdata)
  end
  def background_recognize_with_alternates(this : IInkRecognizerContext*, customdata : VARIANT) : HRESULT
    @lpVtbl.value.background_recognize_with_alternates.call(this, customdata)
  end
  def clone(this : IInkRecognizerContext*, recocontext : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.clone.call(this, recocontext)
  end
  def is_string_supported(this : IInkRecognizerContext*, string : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_string_supported.call(this, string, supported)
  end
end
struct LibWin32::IInkRecognizerContext2
  def query_interface(this : IInkRecognizerContext2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizerContext2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizerContext2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizerContext2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizerContext2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizerContext2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizerContext2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_enabled_unicode_ranges(this : IInkRecognizerContext2*, unicoderanges : VARIANT*) : HRESULT
    @lpVtbl.value.get_enabled_unicode_ranges.call(this, unicoderanges)
  end
  def put_enabled_unicode_ranges(this : IInkRecognizerContext2*, unicoderanges : VARIANT) : HRESULT
    @lpVtbl.value.put_enabled_unicode_ranges.call(this, unicoderanges)
  end
end
struct LibWin32::IInkRecognitionResult
  def query_interface(this : IInkRecognitionResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognitionResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognitionResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognitionResult*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognitionResult*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognitionResult*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognitionResult*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_top_string(this : IInkRecognitionResult*, topstring : UInt8**) : HRESULT
    @lpVtbl.value.get_top_string.call(this, topstring)
  end
  def get_top_alternate(this : IInkRecognitionResult*, topalternate : IInkRecognitionAlternate*) : HRESULT
    @lpVtbl.value.get_top_alternate.call(this, topalternate)
  end
  def get_top_confidence(this : IInkRecognitionResult*, topconfidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_top_confidence.call(this, topconfidence)
  end
  def get_strokes(this : IInkRecognitionResult*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def alternates_from_selection(this : IInkRecognitionResult*, selectionstart : Int32, selectionlength : Int32, maximumalternates : Int32, alternatesfromselection : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.alternates_from_selection.call(this, selectionstart, selectionlength, maximumalternates, alternatesfromselection)
  end
  def modify_top_alternate(this : IInkRecognitionResult*, alternate : IInkRecognitionAlternate) : HRESULT
    @lpVtbl.value.modify_top_alternate.call(this, alternate)
  end
  def set_result_on_strokes(this : IInkRecognitionResult*) : HRESULT
    @lpVtbl.value.set_result_on_strokes.call(this)
  end
end
struct LibWin32::IInkRecognitionAlternate
  def query_interface(this : IInkRecognitionAlternate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognitionAlternate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognitionAlternate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognitionAlternate*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognitionAlternate*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognitionAlternate*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognitionAlternate*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_string(this : IInkRecognitionAlternate*, recostring : UInt8**) : HRESULT
    @lpVtbl.value.get_string.call(this, recostring)
  end
  def get_confidence(this : IInkRecognitionAlternate*, confidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.call(this, confidence)
  end
  def get_baseline(this : IInkRecognitionAlternate*, baseline : VARIANT*) : HRESULT
    @lpVtbl.value.get_baseline.call(this, baseline)
  end
  def get_midline(this : IInkRecognitionAlternate*, midline : VARIANT*) : HRESULT
    @lpVtbl.value.get_midline.call(this, midline)
  end
  def get_ascender(this : IInkRecognitionAlternate*, ascender : VARIANT*) : HRESULT
    @lpVtbl.value.get_ascender.call(this, ascender)
  end
  def get_descender(this : IInkRecognitionAlternate*, descender : VARIANT*) : HRESULT
    @lpVtbl.value.get_descender.call(this, descender)
  end
  def get_line_number(this : IInkRecognitionAlternate*, linenumber : Int32*) : HRESULT
    @lpVtbl.value.get_line_number.call(this, linenumber)
  end
  def get_strokes(this : IInkRecognitionAlternate*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def get_line_alternates(this : IInkRecognitionAlternate*, linealternates : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.get_line_alternates.call(this, linealternates)
  end
  def get_confidence_alternates(this : IInkRecognitionAlternate*, confidencealternates : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.get_confidence_alternates.call(this, confidencealternates)
  end
  def get_strokes_from_stroke_ranges(this : IInkRecognitionAlternate*, strokes : IInkStrokes, getstrokesfromstrokeranges : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes_from_stroke_ranges.call(this, strokes, getstrokesfromstrokeranges)
  end
  def get_strokes_from_text_range(this : IInkRecognitionAlternate*, selectionstart : Int32*, selectionlength : Int32*, getstrokesfromtextrange : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes_from_text_range.call(this, selectionstart, selectionlength, getstrokesfromtextrange)
  end
  def get_text_range_from_strokes(this : IInkRecognitionAlternate*, strokes : IInkStrokes, selectionstart : Int32*, selectionlength : Int32*) : HRESULT
    @lpVtbl.value.get_text_range_from_strokes.call(this, strokes, selectionstart, selectionlength)
  end
  def alternates_with_constant_property_values(this : IInkRecognitionAlternate*, propertytype : UInt8*, alternateswithconstantpropertyvalues : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.alternates_with_constant_property_values.call(this, propertytype, alternateswithconstantpropertyvalues)
  end
  def get_property_value(this : IInkRecognitionAlternate*, propertytype : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.call(this, propertytype, propertyvalue)
  end
end
struct LibWin32::IInkRecognitionAlternates
  def query_interface(this : IInkRecognitionAlternates*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognitionAlternates*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognitionAlternates*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognitionAlternates*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognitionAlternates*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognitionAlternates*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognitionAlternates*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkRecognitionAlternates*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkRecognitionAlternates*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def get_strokes(this : IInkRecognitionAlternates*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def item(this : IInkRecognitionAlternates*, index : Int32, inkrecoalternate : IInkRecognitionAlternate*) : HRESULT
    @lpVtbl.value.item.call(this, index, inkrecoalternate)
  end
end
struct LibWin32::IInkRecognizerGuide
  def query_interface(this : IInkRecognizerGuide*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkRecognizerGuide*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkRecognizerGuide*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkRecognizerGuide*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkRecognizerGuide*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkRecognizerGuide*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkRecognizerGuide*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_writing_box(this : IInkRecognizerGuide*, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_writing_box.call(this, rectangle)
  end
  def put_writing_box(this : IInkRecognizerGuide*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.put_writing_box.call(this, rectangle)
  end
  def get_drawn_box(this : IInkRecognizerGuide*, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_drawn_box.call(this, rectangle)
  end
  def put_drawn_box(this : IInkRecognizerGuide*, rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.put_drawn_box.call(this, rectangle)
  end
  def get_rows(this : IInkRecognizerGuide*, units : Int32*) : HRESULT
    @lpVtbl.value.get_rows.call(this, units)
  end
  def put_rows(this : IInkRecognizerGuide*, units : Int32) : HRESULT
    @lpVtbl.value.put_rows.call(this, units)
  end
  def get_columns(this : IInkRecognizerGuide*, units : Int32*) : HRESULT
    @lpVtbl.value.get_columns.call(this, units)
  end
  def put_columns(this : IInkRecognizerGuide*, units : Int32) : HRESULT
    @lpVtbl.value.put_columns.call(this, units)
  end
  def get_midline(this : IInkRecognizerGuide*, units : Int32*) : HRESULT
    @lpVtbl.value.get_midline.call(this, units)
  end
  def put_midline(this : IInkRecognizerGuide*, units : Int32) : HRESULT
    @lpVtbl.value.put_midline.call(this, units)
  end
  def get_guide_data(this : IInkRecognizerGuide*, precoguide : InkRecoGuide*) : HRESULT
    @lpVtbl.value.get_guide_data.call(this, precoguide)
  end
  def put_guide_data(this : IInkRecognizerGuide*, recoguide : InkRecoGuide) : HRESULT
    @lpVtbl.value.put_guide_data.call(this, recoguide)
  end
end
struct LibWin32::IInkWordList
  def query_interface(this : IInkWordList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkWordList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkWordList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkWordList*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkWordList*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkWordList*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkWordList*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def add_word(this : IInkWordList*, newword : UInt8*) : HRESULT
    @lpVtbl.value.add_word.call(this, newword)
  end
  def remove_word(this : IInkWordList*, removeword : UInt8*) : HRESULT
    @lpVtbl.value.remove_word.call(this, removeword)
  end
  def merge(this : IInkWordList*, mergewordlist : IInkWordList) : HRESULT
    @lpVtbl.value.merge.call(this, mergewordlist)
  end
end
struct LibWin32::IInkWordList2
  def query_interface(this : IInkWordList2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkWordList2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkWordList2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkWordList2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkWordList2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkWordList2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkWordList2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def add_words(this : IInkWordList2*, newwords : UInt8*) : HRESULT
    @lpVtbl.value.add_words.call(this, newwords)
  end
end
struct LibWin32::IInk
  def query_interface(this : IInk*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInk*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInk*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInk*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInk*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInk*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInk*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkLineInfo
  def query_interface(this : IInkLineInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkLineInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkLineInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_format(this : IInkLineInfo*, pim : INKMETRIC*) : HRESULT
    @lpVtbl.value.set_format.call(this, pim)
  end
  def get_format(this : IInkLineInfo*, pim : INKMETRIC*) : HRESULT
    @lpVtbl.value.get_format.call(this, pim)
  end
  def get_ink_extent(this : IInkLineInfo*, pim : INKMETRIC*, pnwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_ink_extent.call(this, pim, pnwidth)
  end
  def get_candidate(this : IInkLineInfo*, ncandidatenum : UInt32, pwcrecogword : LibC::LPWSTR, pcwcrecogword : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_candidate.call(this, ncandidatenum, pwcrecogword, pcwcrecogword, dwflags)
  end
  def set_candidate(this : IInkLineInfo*, ncandidatenum : UInt32, strrecogword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_candidate.call(this, ncandidatenum, strrecogword)
  end
  def recognize(this : IInkLineInfo*) : HRESULT
    @lpVtbl.value.recognize.call(this)
  end
end
struct LibWin32::ISketchInk
  def query_interface(this : ISketchInk*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISketchInk*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISketchInk*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISketchInk*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISketchInk*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISketchInk*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISketchInk*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IInkDivider
  def query_interface(this : IInkDivider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDivider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDivider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDivider*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDivider*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDivider*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDivider*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_strokes(this : IInkDivider*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def putref_strokes(this : IInkDivider*, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.putref_strokes.call(this, strokes)
  end
  def get_recognizer_context(this : IInkDivider*, recognizercontext : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.get_recognizer_context.call(this, recognizercontext)
  end
  def putref_recognizer_context(this : IInkDivider*, recognizercontext : IInkRecognizerContext) : HRESULT
    @lpVtbl.value.putref_recognizer_context.call(this, recognizercontext)
  end
  def get_line_height(this : IInkDivider*, lineheight : Int32*) : HRESULT
    @lpVtbl.value.get_line_height.call(this, lineheight)
  end
  def put_line_height(this : IInkDivider*, lineheight : Int32) : HRESULT
    @lpVtbl.value.put_line_height.call(this, lineheight)
  end
  def divide(this : IInkDivider*, inkdivisionresult : IInkDivisionResult*) : HRESULT
    @lpVtbl.value.divide.call(this, inkdivisionresult)
  end
end
struct LibWin32::IInkDivisionResult
  def query_interface(this : IInkDivisionResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDivisionResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDivisionResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDivisionResult*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDivisionResult*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDivisionResult*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDivisionResult*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_strokes(this : IInkDivisionResult*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def result_by_type(this : IInkDivisionResult*, divisiontype : InkDivisionType, inkdivisionunits : IInkDivisionUnits*) : HRESULT
    @lpVtbl.value.result_by_type.call(this, divisiontype, inkdivisionunits)
  end
end
struct LibWin32::IInkDivisionUnit
  def query_interface(this : IInkDivisionUnit*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDivisionUnit*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDivisionUnit*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDivisionUnit*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDivisionUnit*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDivisionUnit*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDivisionUnit*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_strokes(this : IInkDivisionUnit*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.call(this, strokes)
  end
  def get_division_type(this : IInkDivisionUnit*, divisiontype : InkDivisionType*) : HRESULT
    @lpVtbl.value.get_division_type.call(this, divisiontype)
  end
  def get_recognized_string(this : IInkDivisionUnit*, recostring : UInt8**) : HRESULT
    @lpVtbl.value.get_recognized_string.call(this, recostring)
  end
  def get_rotation_transform(this : IInkDivisionUnit*, rotationtransform : IInkTransform*) : HRESULT
    @lpVtbl.value.get_rotation_transform.call(this, rotationtransform)
  end
end
struct LibWin32::IInkDivisionUnits
  def query_interface(this : IInkDivisionUnits*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkDivisionUnits*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkDivisionUnits*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkDivisionUnits*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkDivisionUnits*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkDivisionUnits*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkDivisionUnits*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IInkDivisionUnits*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : IInkDivisionUnits*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
  def item(this : IInkDivisionUnits*, index : Int32, inkdivisionunit : IInkDivisionUnit*) : HRESULT
    @lpVtbl.value.item.call(this, index, inkdivisionunit)
  end
end
struct LibWin32::IPenInputPanel
  def query_interface(this : IPenInputPanel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPenInputPanel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPenInputPanel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPenInputPanel*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPenInputPanel*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPenInputPanel*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPenInputPanel*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_busy(this : IPenInputPanel*, busy : Int16*) : HRESULT
    @lpVtbl.value.get_busy.call(this, busy)
  end
  def get_factoid(this : IPenInputPanel*, factoid : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.call(this, factoid)
  end
  def put_factoid(this : IPenInputPanel*, factoid : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.call(this, factoid)
  end
  def get_attached_edit_window(this : IPenInputPanel*, attachededitwindow : Int32*) : HRESULT
    @lpVtbl.value.get_attached_edit_window.call(this, attachededitwindow)
  end
  def put_attached_edit_window(this : IPenInputPanel*, attachededitwindow : Int32) : HRESULT
    @lpVtbl.value.put_attached_edit_window.call(this, attachededitwindow)
  end
  def get_current_panel(this : IPenInputPanel*, currentpanel : PanelType*) : HRESULT
    @lpVtbl.value.get_current_panel.call(this, currentpanel)
  end
  def put_current_panel(this : IPenInputPanel*, currentpanel : PanelType) : HRESULT
    @lpVtbl.value.put_current_panel.call(this, currentpanel)
  end
  def get_default_panel(this : IPenInputPanel*, pdefaultpanel : PanelType*) : HRESULT
    @lpVtbl.value.get_default_panel.call(this, pdefaultpanel)
  end
  def put_default_panel(this : IPenInputPanel*, defaultpanel : PanelType) : HRESULT
    @lpVtbl.value.put_default_panel.call(this, defaultpanel)
  end
  def get_visible(this : IPenInputPanel*, visible : Int16*) : HRESULT
    @lpVtbl.value.get_visible.call(this, visible)
  end
  def put_visible(this : IPenInputPanel*, visible : Int16) : HRESULT
    @lpVtbl.value.put_visible.call(this, visible)
  end
  def get_top(this : IPenInputPanel*, top : Int32*) : HRESULT
    @lpVtbl.value.get_top.call(this, top)
  end
  def get_left(this : IPenInputPanel*, left : Int32*) : HRESULT
    @lpVtbl.value.get_left.call(this, left)
  end
  def get_width(this : IPenInputPanel*, width : Int32*) : HRESULT
    @lpVtbl.value.get_width.call(this, width)
  end
  def get_height(this : IPenInputPanel*, height : Int32*) : HRESULT
    @lpVtbl.value.get_height.call(this, height)
  end
  def get_vertical_offset(this : IPenInputPanel*, verticaloffset : Int32*) : HRESULT
    @lpVtbl.value.get_vertical_offset.call(this, verticaloffset)
  end
  def put_vertical_offset(this : IPenInputPanel*, verticaloffset : Int32) : HRESULT
    @lpVtbl.value.put_vertical_offset.call(this, verticaloffset)
  end
  def get_horizontal_offset(this : IPenInputPanel*, horizontaloffset : Int32*) : HRESULT
    @lpVtbl.value.get_horizontal_offset.call(this, horizontaloffset)
  end
  def put_horizontal_offset(this : IPenInputPanel*, horizontaloffset : Int32) : HRESULT
    @lpVtbl.value.put_horizontal_offset.call(this, horizontaloffset)
  end
  def get_auto_show(this : IPenInputPanel*, pautoshow : Int16*) : HRESULT
    @lpVtbl.value.get_auto_show.call(this, pautoshow)
  end
  def put_auto_show(this : IPenInputPanel*, autoshow : Int16) : HRESULT
    @lpVtbl.value.put_auto_show.call(this, autoshow)
  end
  def move_to(this : IPenInputPanel*, left : Int32, top : Int32) : HRESULT
    @lpVtbl.value.move_to.call(this, left, top)
  end
  def commit_pending_input(this : IPenInputPanel*) : HRESULT
    @lpVtbl.value.commit_pending_input.call(this)
  end
  def refresh(this : IPenInputPanel*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def enable_tsf(this : IPenInputPanel*, enable : Int16) : HRESULT
    @lpVtbl.value.enable_tsf.call(this, enable)
  end
end
struct LibWin32::IIPenInputPanelEvents
  def query_interface(this : IIPenInputPanelEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIPenInputPanelEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIPenInputPanelEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIPenInputPanelEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIPenInputPanelEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIPenInputPanelEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIPenInputPanelEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IHandwrittenTextInsertion
  def query_interface(this : IHandwrittenTextInsertion*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHandwrittenTextInsertion*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHandwrittenTextInsertion*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_recognition_results_array(this : IHandwrittenTextInsertion*, psaalternates : SAFEARRAY*, locale : UInt32, falternatecontainsautospacinginformation : LibC::BOOL) : HRESULT
    @lpVtbl.value.insert_recognition_results_array.call(this, psaalternates, locale, falternatecontainsautospacinginformation)
  end
  def insert_ink_recognition_result(this : IHandwrittenTextInsertion*, piinkrecoresult : IInkRecognitionResult, locale : UInt32, falternatecontainsautospacinginformation : LibC::BOOL) : HRESULT
    @lpVtbl.value.insert_ink_recognition_result.call(this, piinkrecoresult, locale, falternatecontainsautospacinginformation)
  end
end
struct LibWin32::ITextInputPanelEventSink
  def query_interface(this : ITextInputPanelEventSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextInputPanelEventSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextInputPanelEventSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def in_place_state_changing(this : ITextInputPanelEventSink*, oldinplacestate : InPlaceState, newinplacestate : InPlaceState) : HRESULT
    @lpVtbl.value.in_place_state_changing.call(this, oldinplacestate, newinplacestate)
  end
  def in_place_state_changed(this : ITextInputPanelEventSink*, oldinplacestate : InPlaceState, newinplacestate : InPlaceState) : HRESULT
    @lpVtbl.value.in_place_state_changed.call(this, oldinplacestate, newinplacestate)
  end
  def in_place_size_changing(this : ITextInputPanelEventSink*, oldboundingrectangle : RECT, newboundingrectangle : RECT) : HRESULT
    @lpVtbl.value.in_place_size_changing.call(this, oldboundingrectangle, newboundingrectangle)
  end
  def in_place_size_changed(this : ITextInputPanelEventSink*, oldboundingrectangle : RECT, newboundingrectangle : RECT) : HRESULT
    @lpVtbl.value.in_place_size_changed.call(this, oldboundingrectangle, newboundingrectangle)
  end
  def input_area_changing(this : ITextInputPanelEventSink*, oldinputarea : PanelInputArea, newinputarea : PanelInputArea) : HRESULT
    @lpVtbl.value.input_area_changing.call(this, oldinputarea, newinputarea)
  end
  def input_area_changed(this : ITextInputPanelEventSink*, oldinputarea : PanelInputArea, newinputarea : PanelInputArea) : HRESULT
    @lpVtbl.value.input_area_changed.call(this, oldinputarea, newinputarea)
  end
  def correction_mode_changing(this : ITextInputPanelEventSink*, oldcorrectionmode : CorrectionMode, newcorrectionmode : CorrectionMode) : HRESULT
    @lpVtbl.value.correction_mode_changing.call(this, oldcorrectionmode, newcorrectionmode)
  end
  def correction_mode_changed(this : ITextInputPanelEventSink*, oldcorrectionmode : CorrectionMode, newcorrectionmode : CorrectionMode) : HRESULT
    @lpVtbl.value.correction_mode_changed.call(this, oldcorrectionmode, newcorrectionmode)
  end
  def in_place_visibility_changing(this : ITextInputPanelEventSink*, oldvisible : LibC::BOOL, newvisible : LibC::BOOL) : HRESULT
    @lpVtbl.value.in_place_visibility_changing.call(this, oldvisible, newvisible)
  end
  def in_place_visibility_changed(this : ITextInputPanelEventSink*, oldvisible : LibC::BOOL, newvisible : LibC::BOOL) : HRESULT
    @lpVtbl.value.in_place_visibility_changed.call(this, oldvisible, newvisible)
  end
  def text_inserting(this : ITextInputPanelEventSink*, ink : SAFEARRAY*) : HRESULT
    @lpVtbl.value.text_inserting.call(this, ink)
  end
  def text_inserted(this : ITextInputPanelEventSink*, ink : SAFEARRAY*) : HRESULT
    @lpVtbl.value.text_inserted.call(this, ink)
  end
end
struct LibWin32::ITextInputPanel
  def query_interface(this : ITextInputPanel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextInputPanel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextInputPanel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attached_edit_window(this : ITextInputPanel*, attachededitwindow : HANDLE*) : HRESULT
    @lpVtbl.value.get_attached_edit_window.call(this, attachededitwindow)
  end
  def put_attached_edit_window(this : ITextInputPanel*, attachededitwindow : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_attached_edit_window.call(this, attachededitwindow)
  end
  def get_current_interaction_mode(this : ITextInputPanel*, currentinteractionmode : InteractionMode*) : HRESULT
    @lpVtbl.value.get_current_interaction_mode.call(this, currentinteractionmode)
  end
  def get_default_in_place_state(this : ITextInputPanel*, state : InPlaceState*) : HRESULT
    @lpVtbl.value.get_default_in_place_state.call(this, state)
  end
  def put_default_in_place_state(this : ITextInputPanel*, state : InPlaceState) : HRESULT
    @lpVtbl.value.put_default_in_place_state.call(this, state)
  end
  def get_current_in_place_state(this : ITextInputPanel*, state : InPlaceState*) : HRESULT
    @lpVtbl.value.get_current_in_place_state.call(this, state)
  end
  def get_default_input_area(this : ITextInputPanel*, area : PanelInputArea*) : HRESULT
    @lpVtbl.value.get_default_input_area.call(this, area)
  end
  def put_default_input_area(this : ITextInputPanel*, area : PanelInputArea) : HRESULT
    @lpVtbl.value.put_default_input_area.call(this, area)
  end
  def get_current_input_area(this : ITextInputPanel*, area : PanelInputArea*) : HRESULT
    @lpVtbl.value.get_current_input_area.call(this, area)
  end
  def get_current_correction_mode(this : ITextInputPanel*, mode : CorrectionMode*) : HRESULT
    @lpVtbl.value.get_current_correction_mode.call(this, mode)
  end
  def get_preferred_in_place_direction(this : ITextInputPanel*, direction : InPlaceDirection*) : HRESULT
    @lpVtbl.value.get_preferred_in_place_direction.call(this, direction)
  end
  def put_preferred_in_place_direction(this : ITextInputPanel*, direction : InPlaceDirection) : HRESULT
    @lpVtbl.value.put_preferred_in_place_direction.call(this, direction)
  end
  def get_expand_post_insertion_correction(this : ITextInputPanel*, expand : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_expand_post_insertion_correction.call(this, expand)
  end
  def put_expand_post_insertion_correction(this : ITextInputPanel*, expand : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_expand_post_insertion_correction.call(this, expand)
  end
  def get_in_place_visible_on_focus(this : ITextInputPanel*, visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_in_place_visible_on_focus.call(this, visible)
  end
  def put_in_place_visible_on_focus(this : ITextInputPanel*, visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_in_place_visible_on_focus.call(this, visible)
  end
  def get_in_place_bounding_rectangle(this : ITextInputPanel*, boundingrectangle : RECT*) : HRESULT
    @lpVtbl.value.get_in_place_bounding_rectangle.call(this, boundingrectangle)
  end
  def get_pop_up_correction_height(this : ITextInputPanel*, height : Int32*) : HRESULT
    @lpVtbl.value.get_pop_up_correction_height.call(this, height)
  end
  def get_pop_down_correction_height(this : ITextInputPanel*, height : Int32*) : HRESULT
    @lpVtbl.value.get_pop_down_correction_height.call(this, height)
  end
  def commit_pending_input(this : ITextInputPanel*) : HRESULT
    @lpVtbl.value.commit_pending_input.call(this)
  end
  def set_in_place_visibility(this : ITextInputPanel*, visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_in_place_visibility.call(this, visible)
  end
  def set_in_place_position(this : ITextInputPanel*, xposition : Int32, yposition : Int32, position : CorrectionPosition) : HRESULT
    @lpVtbl.value.set_in_place_position.call(this, xposition, yposition, position)
  end
  def set_in_place_hover_target_position(this : ITextInputPanel*, xposition : Int32, yposition : Int32) : HRESULT
    @lpVtbl.value.set_in_place_hover_target_position.call(this, xposition, yposition)
  end
  def advise(this : ITextInputPanel*, eventsink : ITextInputPanelEventSink, eventmask : UInt32) : HRESULT
    @lpVtbl.value.advise.call(this, eventsink, eventmask)
  end
  def unadvise(this : ITextInputPanel*, eventsink : ITextInputPanelEventSink) : HRESULT
    @lpVtbl.value.unadvise.call(this, eventsink)
  end
end
struct LibWin32::IInputPanelWindowHandle
  def query_interface(this : IInputPanelWindowHandle*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInputPanelWindowHandle*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInputPanelWindowHandle*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attached_edit_window32(this : IInputPanelWindowHandle*, attachededitwindow : Int32*) : HRESULT
    @lpVtbl.value.get_attached_edit_window32.call(this, attachededitwindow)
  end
  def put_attached_edit_window32(this : IInputPanelWindowHandle*, attachededitwindow : Int32) : HRESULT
    @lpVtbl.value.put_attached_edit_window32.call(this, attachededitwindow)
  end
  def get_attached_edit_window64(this : IInputPanelWindowHandle*, attachededitwindow : Int64*) : HRESULT
    @lpVtbl.value.get_attached_edit_window64.call(this, attachededitwindow)
  end
  def put_attached_edit_window64(this : IInputPanelWindowHandle*, attachededitwindow : Int64) : HRESULT
    @lpVtbl.value.put_attached_edit_window64.call(this, attachededitwindow)
  end
end
struct LibWin32::ITextInputPanelRunInfo
  def query_interface(this : ITextInputPanelRunInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextInputPanelRunInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextInputPanelRunInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_tip_running(this : ITextInputPanelRunInfo*, pfrunning : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_tip_running.call(this, pfrunning)
  end
end
struct LibWin32::IInkEdit
  def query_interface(this : IInkEdit*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInkEdit*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInkEdit*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IInkEdit*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IInkEdit*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IInkEdit*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IInkEdit*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(this : IInkEdit*, pstatus : InkEditStatus*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_use_mouse_for_input(this : IInkEdit*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_use_mouse_for_input.call(this, pval)
  end
  def put_use_mouse_for_input(this : IInkEdit*, newval : Int16) : HRESULT
    @lpVtbl.value.put_use_mouse_for_input.call(this, newval)
  end
  def get_ink_mode(this : IInkEdit*, pval : InkMode*) : HRESULT
    @lpVtbl.value.get_ink_mode.call(this, pval)
  end
  def put_ink_mode(this : IInkEdit*, newval : InkMode) : HRESULT
    @lpVtbl.value.put_ink_mode.call(this, newval)
  end
  def get_ink_insert_mode(this : IInkEdit*, pval : InkInsertMode*) : HRESULT
    @lpVtbl.value.get_ink_insert_mode.call(this, pval)
  end
  def put_ink_insert_mode(this : IInkEdit*, newval : InkInsertMode) : HRESULT
    @lpVtbl.value.put_ink_insert_mode.call(this, newval)
  end
  def get_drawing_attributes(this : IInkEdit*, pval : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.call(this, pval)
  end
  def putref_drawing_attributes(this : IInkEdit*, newval : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.call(this, newval)
  end
  def get_recognition_timeout(this : IInkEdit*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_recognition_timeout.call(this, pval)
  end
  def put_recognition_timeout(this : IInkEdit*, newval : Int32) : HRESULT
    @lpVtbl.value.put_recognition_timeout.call(this, newval)
  end
  def get_recognizer(this : IInkEdit*, pval : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.call(this, pval)
  end
  def putref_recognizer(this : IInkEdit*, newval : IInkRecognizer) : HRESULT
    @lpVtbl.value.putref_recognizer.call(this, newval)
  end
  def get_factoid(this : IInkEdit*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.call(this, pval)
  end
  def put_factoid(this : IInkEdit*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.call(this, newval)
  end
  def get_sel_inks(this : IInkEdit*, pselink : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_inks.call(this, pselink)
  end
  def put_sel_inks(this : IInkEdit*, selink : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_inks.call(this, selink)
  end
  def get_sel_inks_display_mode(this : IInkEdit*, pinkdisplaymode : InkDisplayMode*) : HRESULT
    @lpVtbl.value.get_sel_inks_display_mode.call(this, pinkdisplaymode)
  end
  def put_sel_inks_display_mode(this : IInkEdit*, inkdisplaymode : InkDisplayMode) : HRESULT
    @lpVtbl.value.put_sel_inks_display_mode.call(this, inkdisplaymode)
  end
  def recognize(this : IInkEdit*) : HRESULT
    @lpVtbl.value.recognize.call(this)
  end
  def get_gesture_status(this : IInkEdit*, gesture : InkApplicationGesture, plisten : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.call(this, gesture, plisten)
  end
  def set_gesture_status(this : IInkEdit*, gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.call(this, gesture, listen)
  end
  def put_back_color(this : IInkEdit*, clr : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.call(this, clr)
  end
  def get_back_color(this : IInkEdit*, pclr : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.call(this, pclr)
  end
  def get_appearance(this : IInkEdit*, pappearance : AppearanceConstants*) : HRESULT
    @lpVtbl.value.get_appearance.call(this, pappearance)
  end
  def put_appearance(this : IInkEdit*, pappearance : AppearanceConstants) : HRESULT
    @lpVtbl.value.put_appearance.call(this, pappearance)
  end
  def get_border_style(this : IInkEdit*, pborderstyle : BorderStyleConstants*) : HRESULT
    @lpVtbl.value.get_border_style.call(this, pborderstyle)
  end
  def put_border_style(this : IInkEdit*, pborderstyle : BorderStyleConstants) : HRESULT
    @lpVtbl.value.put_border_style.call(this, pborderstyle)
  end
  def get_hwnd(this : IInkEdit*, pohhwnd : UInt32*) : HRESULT
    @lpVtbl.value.get_hwnd.call(this, pohhwnd)
  end
  def get_font(this : IInkEdit*, ppfont : IFontDisp*) : HRESULT
    @lpVtbl.value.get_font.call(this, ppfont)
  end
  def putref_font(this : IInkEdit*, ppfont : IFontDisp) : HRESULT
    @lpVtbl.value.putref_font.call(this, ppfont)
  end
  def get_text(this : IInkEdit*, pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, pbstrtext)
  end
  def put_text(this : IInkEdit*, pbstrtext : UInt8*) : HRESULT
    @lpVtbl.value.put_text.call(this, pbstrtext)
  end
  def get_mouse_icon(this : IInkEdit*, mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.call(this, mouseicon)
  end
  def put_mouse_icon(this : IInkEdit*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.call(this, mouseicon)
  end
  def putref_mouse_icon(this : IInkEdit*, mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.call(this, mouseicon)
  end
  def get_mouse_pointer(this : IInkEdit*, mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.call(this, mousepointer)
  end
  def put_mouse_pointer(this : IInkEdit*, mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.call(this, mousepointer)
  end
  def get_locked(this : IInkEdit*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_locked.call(this, pval)
  end
  def put_locked(this : IInkEdit*, newval : Int16) : HRESULT
    @lpVtbl.value.put_locked.call(this, newval)
  end
  def get_enabled(this : IInkEdit*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pval)
  end
  def put_enabled(this : IInkEdit*, newval : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, newval)
  end
  def get_max_length(this : IInkEdit*, plmaxlength : Int32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, plmaxlength)
  end
  def put_max_length(this : IInkEdit*, lmaxlength : Int32) : HRESULT
    @lpVtbl.value.put_max_length.call(this, lmaxlength)
  end
  def get_multi_line(this : IInkEdit*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_multi_line.call(this, pval)
  end
  def put_multi_line(this : IInkEdit*, newval : Int16) : HRESULT
    @lpVtbl.value.put_multi_line.call(this, newval)
  end
  def get_scroll_bars(this : IInkEdit*, pval : ScrollBarsConstants*) : HRESULT
    @lpVtbl.value.get_scroll_bars.call(this, pval)
  end
  def put_scroll_bars(this : IInkEdit*, newval : ScrollBarsConstants) : HRESULT
    @lpVtbl.value.put_scroll_bars.call(this, newval)
  end
  def get_disable_no_scroll(this : IInkEdit*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_disable_no_scroll.call(this, pval)
  end
  def put_disable_no_scroll(this : IInkEdit*, newval : Int16) : HRESULT
    @lpVtbl.value.put_disable_no_scroll.call(this, newval)
  end
  def get_sel_alignment(this : IInkEdit*, pvarselalignment : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_alignment.call(this, pvarselalignment)
  end
  def put_sel_alignment(this : IInkEdit*, pvarselalignment : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_alignment.call(this, pvarselalignment)
  end
  def get_sel_bold(this : IInkEdit*, pvarselbold : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_bold.call(this, pvarselbold)
  end
  def put_sel_bold(this : IInkEdit*, pvarselbold : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_bold.call(this, pvarselbold)
  end
  def get_sel_italic(this : IInkEdit*, pvarselitalic : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_italic.call(this, pvarselitalic)
  end
  def put_sel_italic(this : IInkEdit*, pvarselitalic : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_italic.call(this, pvarselitalic)
  end
  def get_sel_underline(this : IInkEdit*, pvarselunderline : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_underline.call(this, pvarselunderline)
  end
  def put_sel_underline(this : IInkEdit*, pvarselunderline : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_underline.call(this, pvarselunderline)
  end
  def get_sel_color(this : IInkEdit*, pvarselcolor : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_color.call(this, pvarselcolor)
  end
  def put_sel_color(this : IInkEdit*, pvarselcolor : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_color.call(this, pvarselcolor)
  end
  def get_sel_font_name(this : IInkEdit*, pvarselfontname : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_font_name.call(this, pvarselfontname)
  end
  def put_sel_font_name(this : IInkEdit*, pvarselfontname : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_font_name.call(this, pvarselfontname)
  end
  def get_sel_font_size(this : IInkEdit*, pvarselfontsize : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_font_size.call(this, pvarselfontsize)
  end
  def put_sel_font_size(this : IInkEdit*, pvarselfontsize : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_font_size.call(this, pvarselfontsize)
  end
  def get_sel_char_offset(this : IInkEdit*, pvarselcharoffset : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_char_offset.call(this, pvarselcharoffset)
  end
  def put_sel_char_offset(this : IInkEdit*, pvarselcharoffset : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_char_offset.call(this, pvarselcharoffset)
  end
  def get_text_rtf(this : IInkEdit*, pbstrtextrtf : UInt8**) : HRESULT
    @lpVtbl.value.get_text_rtf.call(this, pbstrtextrtf)
  end
  def put_text_rtf(this : IInkEdit*, pbstrtextrtf : UInt8*) : HRESULT
    @lpVtbl.value.put_text_rtf.call(this, pbstrtextrtf)
  end
  def get_sel_start(this : IInkEdit*, plselstart : Int32*) : HRESULT
    @lpVtbl.value.get_sel_start.call(this, plselstart)
  end
  def put_sel_start(this : IInkEdit*, plselstart : Int32) : HRESULT
    @lpVtbl.value.put_sel_start.call(this, plselstart)
  end
  def get_sel_length(this : IInkEdit*, plsellength : Int32*) : HRESULT
    @lpVtbl.value.get_sel_length.call(this, plsellength)
  end
  def put_sel_length(this : IInkEdit*, plsellength : Int32) : HRESULT
    @lpVtbl.value.put_sel_length.call(this, plsellength)
  end
  def get_sel_text(this : IInkEdit*, pbstrseltext : UInt8**) : HRESULT
    @lpVtbl.value.get_sel_text.call(this, pbstrseltext)
  end
  def put_sel_text(this : IInkEdit*, pbstrseltext : UInt8*) : HRESULT
    @lpVtbl.value.put_sel_text.call(this, pbstrseltext)
  end
  def get_sel_rtf(this : IInkEdit*, pbstrselrtf : UInt8**) : HRESULT
    @lpVtbl.value.get_sel_rtf.call(this, pbstrselrtf)
  end
  def put_sel_rtf(this : IInkEdit*, pbstrselrtf : UInt8*) : HRESULT
    @lpVtbl.value.put_sel_rtf.call(this, pbstrselrtf)
  end
  def refresh(this : IInkEdit*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
end
struct LibWin32::IIInkEditEvents
  def query_interface(this : IIInkEditEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIInkEditEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIInkEditEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIInkEditEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIInkEditEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIInkEditEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIInkEditEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IMathInputControl
  def query_interface(this : IMathInputControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMathInputControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMathInputControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMathInputControl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMathInputControl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMathInputControl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMathInputControl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def show(this : IMathInputControl*) : HRESULT
    @lpVtbl.value.show.call(this)
  end
  def hide(this : IMathInputControl*) : HRESULT
    @lpVtbl.value.hide.call(this)
  end
  def is_visible(this : IMathInputControl*, pvbshown : Int16*) : HRESULT
    @lpVtbl.value.is_visible.call(this, pvbshown)
  end
  def get_position(this : IMathInputControl*, left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : HRESULT
    @lpVtbl.value.get_position.call(this, left, top, right, bottom)
  end
  def set_position(this : IMathInputControl*, left : Int32, top : Int32, right : Int32, bottom : Int32) : HRESULT
    @lpVtbl.value.set_position.call(this, left, top, right, bottom)
  end
  def clear(this : IMathInputControl*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
  def set_custom_paint(this : IMathInputControl*, element : Int32, paint : Int16) : HRESULT
    @lpVtbl.value.set_custom_paint.call(this, element, paint)
  end
  def set_caption_text(this : IMathInputControl*, captiontext : UInt8*) : HRESULT
    @lpVtbl.value.set_caption_text.call(this, captiontext)
  end
  def load_ink(this : IMathInputControl*, ink : IInkDisp) : HRESULT
    @lpVtbl.value.load_ink.call(this, ink)
  end
  def set_owner_window(this : IMathInputControl*, ownerwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_owner_window.call(this, ownerwindow)
  end
  def enable_extended_buttons(this : IMathInputControl*, extended : Int16) : HRESULT
    @lpVtbl.value.enable_extended_buttons.call(this, extended)
  end
  def get_preview_height(this : IMathInputControl*, height : Int32*) : HRESULT
    @lpVtbl.value.get_preview_height.call(this, height)
  end
  def set_preview_height(this : IMathInputControl*, height : Int32) : HRESULT
    @lpVtbl.value.set_preview_height.call(this, height)
  end
  def enable_auto_grow(this : IMathInputControl*, autogrow : Int16) : HRESULT
    @lpVtbl.value.enable_auto_grow.call(this, autogrow)
  end
  def add_function_name(this : IMathInputControl*, functionname : UInt8*) : HRESULT
    @lpVtbl.value.add_function_name.call(this, functionname)
  end
  def remove_function_name(this : IMathInputControl*, functionname : UInt8*) : HRESULT
    @lpVtbl.value.remove_function_name.call(this, functionname)
  end
  def get_hover_icon(this : IMathInputControl*, hoverimage : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_hover_icon.call(this, hoverimage)
  end
end
struct LibWin32::IIMathInputControlEvents
  def query_interface(this : IIMathInputControlEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIMathInputControlEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIMathInputControlEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIMathInputControlEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIMathInputControlEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIMathInputControlEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIMathInputControlEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IRealTimeStylus
  def query_interface(this : IRealTimeStylus*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRealTimeStylus*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRealTimeStylus*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_enabled(this : IRealTimeStylus*, pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pfenable)
  end
  def put_enabled(this : IRealTimeStylus*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.call(this, fenable)
  end
  def get_hwnd(this : IRealTimeStylus*, phwnd : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_hwnd.call(this, phwnd)
  end
  def put_hwnd(this : IRealTimeStylus*, hwnd : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_hwnd.call(this, hwnd)
  end
  def get_window_input_rectangle(this : IRealTimeStylus*, prcwndinputrect : RECT*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.call(this, prcwndinputrect)
  end
  def put_window_input_rectangle(this : IRealTimeStylus*, prcwndinputrect : RECT*) : HRESULT
    @lpVtbl.value.put_window_input_rectangle.call(this, prcwndinputrect)
  end
  def add_stylus_sync_plugin(this : IRealTimeStylus*, iindex : UInt32, piplugin : IStylusSyncPlugin) : HRESULT
    @lpVtbl.value.add_stylus_sync_plugin.call(this, iindex, piplugin)
  end
  def remove_stylus_sync_plugin(this : IRealTimeStylus*, iindex : UInt32, ppiplugin : IStylusSyncPlugin*) : HRESULT
    @lpVtbl.value.remove_stylus_sync_plugin.call(this, iindex, ppiplugin)
  end
  def remove_all_stylus_sync_plugins(this : IRealTimeStylus*) : HRESULT
    @lpVtbl.value.remove_all_stylus_sync_plugins.call(this)
  end
  def get_stylus_sync_plugin(this : IRealTimeStylus*, iindex : UInt32, ppiplugin : IStylusSyncPlugin*) : HRESULT
    @lpVtbl.value.get_stylus_sync_plugin.call(this, iindex, ppiplugin)
  end
  def get_stylus_sync_plugin_count(this : IRealTimeStylus*, pcplugins : UInt32*) : HRESULT
    @lpVtbl.value.get_stylus_sync_plugin_count.call(this, pcplugins)
  end
  def add_stylus_async_plugin(this : IRealTimeStylus*, iindex : UInt32, piplugin : IStylusAsyncPlugin) : HRESULT
    @lpVtbl.value.add_stylus_async_plugin.call(this, iindex, piplugin)
  end
  def remove_stylus_async_plugin(this : IRealTimeStylus*, iindex : UInt32, ppiplugin : IStylusAsyncPlugin*) : HRESULT
    @lpVtbl.value.remove_stylus_async_plugin.call(this, iindex, ppiplugin)
  end
  def remove_all_stylus_async_plugins(this : IRealTimeStylus*) : HRESULT
    @lpVtbl.value.remove_all_stylus_async_plugins.call(this)
  end
  def get_stylus_async_plugin(this : IRealTimeStylus*, iindex : UInt32, ppiplugin : IStylusAsyncPlugin*) : HRESULT
    @lpVtbl.value.get_stylus_async_plugin.call(this, iindex, ppiplugin)
  end
  def get_stylus_async_plugin_count(this : IRealTimeStylus*, pcplugins : UInt32*) : HRESULT
    @lpVtbl.value.get_stylus_async_plugin_count.call(this, pcplugins)
  end
  def get_child_real_time_stylus_plugin(this : IRealTimeStylus*, ppirts : IRealTimeStylus*) : HRESULT
    @lpVtbl.value.get_child_real_time_stylus_plugin.call(this, ppirts)
  end
  def putref_child_real_time_stylus_plugin(this : IRealTimeStylus*, pirts : IRealTimeStylus) : HRESULT
    @lpVtbl.value.putref_child_real_time_stylus_plugin.call(this, pirts)
  end
  def add_custom_stylus_data_to_queue(this : IRealTimeStylus*, sq : StylusQueue, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.add_custom_stylus_data_to_queue.call(this, sq, pguidid, cbdata, pbdata)
  end
  def clear_stylus_queues(this : IRealTimeStylus*) : HRESULT
    @lpVtbl.value.clear_stylus_queues.call(this)
  end
  def set_all_tablets_mode(this : IRealTimeStylus*, fusemouseforinput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.call(this, fusemouseforinput)
  end
  def set_single_tablet_mode(this : IRealTimeStylus*, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_mode.call(this, pitablet)
  end
  def get_tablet(this : IRealTimeStylus*, ppisingletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.call(this, ppisingletablet)
  end
  def get_tablet_context_id_from_tablet(this : IRealTimeStylus*, pitablet : IInkTablet, ptcid : UInt32*) : HRESULT
    @lpVtbl.value.get_tablet_context_id_from_tablet.call(this, pitablet, ptcid)
  end
  def get_tablet_from_tablet_context_id(this : IRealTimeStylus*, tcid : UInt32, ppitablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet_from_tablet_context_id.call(this, tcid, ppitablet)
  end
  def get_all_tablet_context_ids(this : IRealTimeStylus*, pctcidcount : UInt32*, pptcids : UInt32**) : HRESULT
    @lpVtbl.value.get_all_tablet_context_ids.call(this, pctcidcount, pptcids)
  end
  def get_styluses(this : IRealTimeStylus*, ppiinkcursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_styluses.call(this, ppiinkcursors)
  end
  def get_stylus_for_id(this : IRealTimeStylus*, sid : UInt32, ppiinkcursor : IInkCursor*) : HRESULT
    @lpVtbl.value.get_stylus_for_id.call(this, sid, ppiinkcursor)
  end
  def set_desired_packet_description(this : IRealTimeStylus*, cproperties : UInt32, ppropertyguids : Guid*) : HRESULT
    @lpVtbl.value.set_desired_packet_description.call(this, cproperties, ppropertyguids)
  end
  def get_desired_packet_description(this : IRealTimeStylus*, pcproperties : UInt32*, pppropertyguids : Guid**) : HRESULT
    @lpVtbl.value.get_desired_packet_description.call(this, pcproperties, pppropertyguids)
  end
  def get_packet_description_data(this : IRealTimeStylus*, tcid : UInt32, pfinktodevicescalex : Float32*, pfinktodevicescaley : Float32*, pcpacketproperties : UInt32*, pppacketproperties : PACKET_PROPERTY**) : HRESULT
    @lpVtbl.value.get_packet_description_data.call(this, tcid, pfinktodevicescalex, pfinktodevicescaley, pcpacketproperties, pppacketproperties)
  end
end
struct LibWin32::IRealTimeStylus2
  def query_interface(this : IRealTimeStylus2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRealTimeStylus2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRealTimeStylus2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_flicks_enabled(this : IRealTimeStylus2*, pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_flicks_enabled.call(this, pfenable)
  end
  def put_flicks_enabled(this : IRealTimeStylus2*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_flicks_enabled.call(this, fenable)
  end
end
struct LibWin32::IRealTimeStylus3
  def query_interface(this : IRealTimeStylus3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRealTimeStylus3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRealTimeStylus3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_multi_touch_enabled(this : IRealTimeStylus3*, pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_multi_touch_enabled.call(this, pfenable)
  end
  def put_multi_touch_enabled(this : IRealTimeStylus3*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_multi_touch_enabled.call(this, fenable)
  end
end
struct LibWin32::IRealTimeStylusSynchronization
  def query_interface(this : IRealTimeStylusSynchronization*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRealTimeStylusSynchronization*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRealTimeStylusSynchronization*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_lock(this : IRealTimeStylusSynchronization*, lock : RealTimeStylusLockType) : HRESULT
    @lpVtbl.value.acquire_lock.call(this, lock)
  end
  def release_lock(this : IRealTimeStylusSynchronization*, lock : RealTimeStylusLockType) : HRESULT
    @lpVtbl.value.release_lock.call(this, lock)
  end
end
struct LibWin32::IStrokeBuilder
  def query_interface(this : IStrokeBuilder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStrokeBuilder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStrokeBuilder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_stroke(this : IStrokeBuilder*, cpktbufflength : UInt32, ppackets : Int32*, cpacketproperties : UInt32, ppacketproperties : PACKET_PROPERTY*, finktodevicescalex : Float32, finktodevicescaley : Float32, ppiinkstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.create_stroke.call(this, cpktbufflength, ppackets, cpacketproperties, ppacketproperties, finktodevicescalex, finktodevicescaley, ppiinkstroke)
  end
  def begin_stroke(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, ppacket : Int32*, cpacketproperties : UInt32, ppacketproperties : PACKET_PROPERTY*, finktodevicescalex : Float32, finktodevicescaley : Float32, ppiinkstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.begin_stroke.call(this, tcid, sid, ppacket, cpacketproperties, ppacketproperties, finktodevicescalex, finktodevicescaley, ppiinkstroke)
  end
  def append_packets(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, cpktbufflength : UInt32, ppackets : Int32*) : HRESULT
    @lpVtbl.value.append_packets.call(this, tcid, sid, cpktbufflength, ppackets)
  end
  def end_stroke(this : IStrokeBuilder*, tcid : UInt32, sid : UInt32, ppiinkstroke : IInkStrokeDisp*, pdirtyrect : RECT*) : HRESULT
    @lpVtbl.value.end_stroke.call(this, tcid, sid, ppiinkstroke, pdirtyrect)
  end
  def get_ink(this : IStrokeBuilder*, ppiinkobj : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.call(this, ppiinkobj)
  end
  def putref_ink(this : IStrokeBuilder*, piinkobj : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.call(this, piinkobj)
  end
end
struct LibWin32::IStylusPlugin
  def query_interface(this : IStylusPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStylusPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStylusPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def real_time_stylus_enabled(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_down(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.call(this, pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.call(this, pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.call(this, pirtssrc, pitablet)
  end
  def tablet_removed(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.call(this, pirtssrc, itabletindex)
  end
  def error(this : IStylusPlugin*, pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.call(this, pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(this : IStylusPlugin*, pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.call(this, pirtssrc)
  end
  def data_interest(this : IStylusPlugin*, pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.call(this, pdatainterest)
  end
end
struct LibWin32::IStylusSyncPlugin
  def query_interface(this : IStylusSyncPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStylusSyncPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStylusSyncPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def real_time_stylus_enabled(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_down(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.call(this, pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.call(this, pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.call(this, pirtssrc, pitablet)
  end
  def tablet_removed(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.call(this, pirtssrc, itabletindex)
  end
  def error(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.call(this, pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(this : IStylusSyncPlugin*, pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.call(this, pirtssrc)
  end
  def data_interest(this : IStylusSyncPlugin*, pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.call(this, pdatainterest)
  end
end
struct LibWin32::IStylusAsyncPlugin
  def query_interface(this : IStylusAsyncPlugin*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStylusAsyncPlugin*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStylusAsyncPlugin*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def real_time_stylus_enabled(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.call(this, pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.call(this, pirtssrc, tcid, sid)
  end
  def stylus_down(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.call(this, pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.call(this, pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.call(this, pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.call(this, pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.call(this, pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.call(this, pirtssrc, pitablet)
  end
  def tablet_removed(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.call(this, pirtssrc, itabletindex)
  end
  def error(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.call(this, pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(this : IStylusAsyncPlugin*, pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.call(this, pirtssrc)
  end
  def data_interest(this : IStylusAsyncPlugin*, pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.call(this, pdatainterest)
  end
end
struct LibWin32::IDynamicRenderer
  def query_interface(this : IDynamicRenderer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDynamicRenderer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDynamicRenderer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_enabled(this : IDynamicRenderer*, benabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, benabled)
  end
  def put_enabled(this : IDynamicRenderer*, benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.call(this, benabled)
  end
  def get_hwnd(this : IDynamicRenderer*, hwnd : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_hwnd.call(this, hwnd)
  end
  def put_hwnd(this : IDynamicRenderer*, hwnd : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_hwnd.call(this, hwnd)
  end
  def get_clip_rectangle(this : IDynamicRenderer*, prccliprect : RECT*) : HRESULT
    @lpVtbl.value.get_clip_rectangle.call(this, prccliprect)
  end
  def put_clip_rectangle(this : IDynamicRenderer*, prccliprect : RECT*) : HRESULT
    @lpVtbl.value.put_clip_rectangle.call(this, prccliprect)
  end
  def get_clip_region(this : IDynamicRenderer*, phcliprgn : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_clip_region.call(this, phcliprgn)
  end
  def put_clip_region(this : IDynamicRenderer*, hcliprgn : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_clip_region.call(this, hcliprgn)
  end
  def get_drawing_attributes(this : IDynamicRenderer*, ppida : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.call(this, ppida)
  end
  def putref_drawing_attributes(this : IDynamicRenderer*, pida : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.call(this, pida)
  end
  def get_data_cache_enabled(this : IDynamicRenderer*, pfcachedata : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_data_cache_enabled.call(this, pfcachedata)
  end
  def put_data_cache_enabled(this : IDynamicRenderer*, fcachedata : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_data_cache_enabled.call(this, fcachedata)
  end
  def release_cached_data(this : IDynamicRenderer*, strokeid : UInt32) : HRESULT
    @lpVtbl.value.release_cached_data.call(this, strokeid)
  end
  def refresh(this : IDynamicRenderer*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def draw(this : IDynamicRenderer*, hdc : HANDLE_PTR) : HRESULT
    @lpVtbl.value.draw.call(this, hdc)
  end
end
struct LibWin32::IGestureRecognizer
  def query_interface(this : IGestureRecognizer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGestureRecognizer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGestureRecognizer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_enabled(this : IGestureRecognizer*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pfenabled)
  end
  def put_enabled(this : IGestureRecognizer*, fenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.call(this, fenabled)
  end
  def get_max_stroke_count(this : IGestureRecognizer*, pcstrokes : Int32*) : HRESULT
    @lpVtbl.value.get_max_stroke_count.call(this, pcstrokes)
  end
  def put_max_stroke_count(this : IGestureRecognizer*, cstrokes : Int32) : HRESULT
    @lpVtbl.value.put_max_stroke_count.call(this, cstrokes)
  end
  def enable_gestures(this : IGestureRecognizer*, cgestures : UInt32, pgestures : Int32*) : HRESULT
    @lpVtbl.value.enable_gestures.call(this, cgestures, pgestures)
  end
  def reset(this : IGestureRecognizer*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::ITipAutoCompleteProvider
  def query_interface(this : ITipAutoCompleteProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITipAutoCompleteProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITipAutoCompleteProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def update_pending_text(this : ITipAutoCompleteProvider*, bstrpendingtext : UInt8*) : HRESULT
    @lpVtbl.value.update_pending_text.call(this, bstrpendingtext)
  end
  def show(this : ITipAutoCompleteProvider*, fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.call(this, fshow)
  end
end
struct LibWin32::ITipAutoCompleteClient
  def query_interface(this : ITipAutoCompleteClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITipAutoCompleteClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITipAutoCompleteClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise_provider(this : ITipAutoCompleteClient*, hwndfield : LibC::HANDLE, piprovider : ITipAutoCompleteProvider) : HRESULT
    @lpVtbl.value.advise_provider.call(this, hwndfield, piprovider)
  end
  def unadvise_provider(this : ITipAutoCompleteClient*, hwndfield : LibC::HANDLE, piprovider : ITipAutoCompleteProvider) : HRESULT
    @lpVtbl.value.unadvise_provider.call(this, hwndfield, piprovider)
  end
  def user_selection(this : ITipAutoCompleteClient*) : HRESULT
    @lpVtbl.value.user_selection.call(this)
  end
  def preferred_rects(this : ITipAutoCompleteClient*, prcaclist : RECT*, prcfield : RECT*, prcmodifiedaclist : RECT*, pfshownabovetip : LibC::BOOL*) : HRESULT
    @lpVtbl.value.preferred_rects.call(this, prcaclist, prcfield, prcmodifiedaclist, pfshownabovetip)
  end
  def request_show_ui(this : ITipAutoCompleteClient*, hwndlist : LibC::HANDLE, pfallowshowing : LibC::BOOL*) : HRESULT
    @lpVtbl.value.request_show_ui.call(this, hwndlist, pfallowshowing)
  end
end
