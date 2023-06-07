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
  InkDisp = LibC::GUID.new(0x937c1a34_u32, 0x151d_u16, 0x4610_u16, StaticArray[0x9c_u8, 0xa6_u8, 0xa8_u8, 0xcc_u8, 0x9b_u8, 0xdb_u8, 0x5d_u8, 0x83_u8])
  InkOverlay = LibC::GUID.new(0x65d00646_u32, 0xcde3_u16, 0x4a88_u16, StaticArray[0x91_u8, 0x63_u8, 0x67_u8, 0x69_u8, 0xf0_u8, 0xf1_u8, 0xa9_u8, 0x7d_u8])
  InkPicture = LibC::GUID.new(0x4a1e553_u32, 0xfe36_u16, 0x4fde_u16, StaticArray[0x86_u8, 0x5e_u8, 0x34_u8, 0x41_u8, 0x94_u8, 0xe6_u8, 0x94_u8, 0x24_u8])
  InkCollector = LibC::GUID.new(0x43fb1553_u32, 0xad74_u16, 0x4ee8_u16, StaticArray[0x88_u8, 0xe4_u8, 0x3e_u8, 0x6d_u8, 0xaa_u8, 0xc9_u8, 0x15_u8, 0xdb_u8])
  InkDrawingAttributes = LibC::GUID.new(0xd8bf32a2_u32, 0x5a5_u16, 0x44c3_u16, StaticArray[0xb3_u8, 0xaa_u8, 0x5e_u8, 0x80_u8, 0xac_u8, 0x7d_u8, 0x25_u8, 0x76_u8])
  InkRectangle = LibC::GUID.new(0x43b07326_u32, 0xaae0_u16, 0x4b62_u16, StaticArray[0xa8_u8, 0x3d_u8, 0x5f_u8, 0xd7_u8, 0x68_u8, 0xb7_u8, 0x35_u8, 0x3c_u8])
  InkRenderer = LibC::GUID.new(0x9c1cc6e4_u32, 0xd7eb_u16, 0x4eeb_u16, StaticArray[0x90_u8, 0x91_u8, 0x15_u8, 0xa7_u8, 0xc8_u8, 0x79_u8, 0x1e_u8, 0xd9_u8])
  InkTransform = LibC::GUID.new(0xe3d5d93c_u32, 0x1663_u16, 0x4a78_u16, StaticArray[0xa1_u8, 0xa7_u8, 0x22_u8, 0x37_u8, 0x5d_u8, 0xfe_u8, 0xba_u8, 0xee_u8])
  InkRecognizers = LibC::GUID.new(0x9fd4e808_u32, 0xf6e6_u16, 0x4e65_u16, StaticArray[0x98_u8, 0xd3_u8, 0xaa_u8, 0x39_u8, 0x5_u8, 0x4c_u8, 0x12_u8, 0x55_u8])
  InkRecognizerContext = LibC::GUID.new(0xaac46a37_u32, 0x9229_u16, 0x4fc0_u16, StaticArray[0x8c_u8, 0xce_u8, 0x44_u8, 0x97_u8, 0x56_u8, 0x9b_u8, 0xf4_u8, 0xd1_u8])
  InkRecognizerGuide = LibC::GUID.new(0x8770d941_u32, 0xa63a_u16, 0x4671_u16, StaticArray[0xa3_u8, 0x75_u8, 0x28_u8, 0x55_u8, 0xa1_u8, 0x8e_u8, 0xba_u8, 0x73_u8])
  InkTablets = LibC::GUID.new(0x6e4fcb12_u32, 0x510a_u16, 0x4d40_u16, StaticArray[0x93_u8, 0x4_u8, 0x1d_u8, 0xa1_u8, 0xa_u8, 0xe9_u8, 0x14_u8, 0x7c_u8])
  InkWordList = LibC::GUID.new(0x9de85094_u32, 0xf71f_u16, 0x44f1_u16, StaticArray[0x84_u8, 0x71_u8, 0x15_u8, 0xa2_u8, 0xfa_u8, 0x76_u8, 0xfc_u8, 0xf3_u8])
  InkStrokes = LibC::GUID.new(0x48f491bc_u32, 0x240e_u16, 0x4860_u16, StaticArray[0xb0_u8, 0x79_u8, 0xa1_u8, 0xe9_u8, 0x4d_u8, 0x3d_u8, 0x2c_u8, 0x86_u8])
  Ink = LibC::GUID.new(0x13de4a42_u32, 0x8d21_u16, 0x4c8e_u16, StaticArray[0xbf_u8, 0x9c_u8, 0x8f_u8, 0x69_u8, 0xcb_u8, 0x6_u8, 0x8f_u8, 0xca_u8])
  SketchInk = LibC::GUID.new(0xf0291081_u32, 0xe87c_u16, 0x4e07_u16, StaticArray[0x97_u8, 0xda_u8, 0xa0_u8, 0xa0_u8, 0x37_u8, 0x61_u8, 0xe5_u8, 0x86_u8])
  InkDivider = LibC::GUID.new(0x8854f6a0_u32, 0x4683_u16, 0x4ae7_u16, StaticArray[0x91_u8, 0x91_u8, 0x75_u8, 0x2f_u8, 0xe6_u8, 0x46_u8, 0x12_u8, 0xc3_u8])
  HandwrittenTextInsertion = LibC::GUID.new(0x9f074ee2_u32, 0xe6e9_u16, 0x4d8a_u16, StaticArray[0xa0_u8, 0x47_u8, 0xeb_u8, 0x5b_u8, 0x5c_u8, 0x3c_u8, 0x55_u8, 0xda_u8])
  PenInputPanel = LibC::GUID.new(0xf744e496_u32, 0x1b5a_u16, 0x489e_u16, StaticArray[0x81_u8, 0xdc_u8, 0xfb_u8, 0xd7_u8, 0xac_u8, 0x62_u8, 0x98_u8, 0xa8_u8])
  TextInputPanel = LibC::GUID.new(0xf9b189d7_u32, 0x228b_u16, 0x4f2b_u16, StaticArray[0x86_u8, 0x50_u8, 0xb9_u8, 0x7f_u8, 0x59_u8, 0xe0_u8, 0x2c_u8, 0x8c_u8])
  PenInputPanel_Internal = LibC::GUID.new(0x802b1fb9_u32, 0x56b_u16, 0x4720_u16, StaticArray[0xb0_u8, 0xcc_u8, 0x80_u8, 0xd2_u8, 0x3b_u8, 0x71_u8, 0x17_u8, 0x1e_u8])
  InkEdit = LibC::GUID.new(0xe5ca59f5_u32, 0x57c4_u16, 0x4dd8_u16, StaticArray[0x9b_u8, 0xd6_u8, 0x1d_u8, 0xee_u8, 0xed_u8, 0xd2_u8, 0x7a_u8, 0xf4_u8])
  MathInputControl = LibC::GUID.new(0xc561816c_u32, 0x14d8_u16, 0x4090_u16, StaticArray[0x83_u8, 0xc_u8, 0x98_u8, 0xd9_u8, 0x94_u8, 0xb2_u8, 0x1c_u8, 0x7b_u8])
  RealTimeStylus = LibC::GUID.new(0xe26b366d_u32, 0xf998_u16, 0x43ce_u16, StaticArray[0x83_u8, 0x6f_u8, 0xcb_u8, 0x6d_u8, 0x90_u8, 0x44_u8, 0x32_u8, 0xb0_u8])
  DynamicRenderer = LibC::GUID.new(0xecd32aea_u32, 0x746f_u16, 0x4dcb_u16, StaticArray[0xbf_u8, 0x68_u8, 0x8_u8, 0x27_u8, 0x57_u8, 0xfa_u8, 0xff_u8, 0x18_u8])
  GestureRecognizer = LibC::GUID.new(0xea30c654_u32, 0xc62c_u16, 0x441f_u16, StaticArray[0xac_u8, 0x0_u8, 0x95_u8, 0xf9_u8, 0xa1_u8, 0x96_u8, 0x78_u8, 0x2c_u8])
  StrokeBuilder = LibC::GUID.new(0xe810cee7_u32, 0x6e51_u16, 0x4cb0_u16, StaticArray[0xaa_u8, 0x3a_u8, 0xb_u8, 0x98_u8, 0x5b_u8, 0x70_u8, 0xda_u8, 0xf7_u8])
  TipAutoCompleteClient = LibC::GUID.new(0x807c1e6c_u32, 0x1d00_u16, 0x453f_u16, StaticArray[0xb9_u8, 0x20_u8, 0xb6_u8, 0x1b_u8, 0xb7_u8, 0xcd_u8, 0xd9_u8, 0x97_u8])

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

  struct IInkCustomStrokes
    lpVtbl : IInkCustomStrokesVTbl*
  end

  struct IInkStrokesEventsVTbl
    query_interface : Proc(IInkStrokesEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkStrokesEvents*, UInt32)
    release : Proc(IInkStrokesEvents*, UInt32)
    get_type_info_count : Proc(IInkStrokesEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkStrokesEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkStrokesEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkStrokesEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkStrokesEvents
    lpVtbl : IInkStrokesEventsVTbl*
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

  struct IInkDisp
    lpVtbl : IInkDispVTbl*
  end

  struct IInkEventsVTbl
    query_interface : Proc(IInkEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkEvents*, UInt32)
    release : Proc(IInkEvents*, UInt32)
    get_type_info_count : Proc(IInkEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkEvents
    lpVtbl : IInkEventsVTbl*
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

  struct IInkCollector
    lpVtbl : IInkCollectorVTbl*
  end

  struct IInkCollectorEventsVTbl
    query_interface : Proc(IInkCollectorEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkCollectorEvents*, UInt32)
    release : Proc(IInkCollectorEvents*, UInt32)
    get_type_info_count : Proc(IInkCollectorEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkCollectorEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkCollectorEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkCollectorEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkCollectorEvents
    lpVtbl : IInkCollectorEventsVTbl*
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

  struct IInkOverlay
    lpVtbl : IInkOverlayVTbl*
  end

  struct IInkOverlayEventsVTbl
    query_interface : Proc(IInkOverlayEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkOverlayEvents*, UInt32)
    release : Proc(IInkOverlayEvents*, UInt32)
    get_type_info_count : Proc(IInkOverlayEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkOverlayEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkOverlayEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkOverlayEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkOverlayEvents
    lpVtbl : IInkOverlayEventsVTbl*
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

  struct IInkPicture
    lpVtbl : IInkPictureVTbl*
  end

  struct IInkPictureEventsVTbl
    query_interface : Proc(IInkPictureEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkPictureEvents*, UInt32)
    release : Proc(IInkPictureEvents*, UInt32)
    get_type_info_count : Proc(IInkPictureEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkPictureEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkPictureEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkPictureEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkPictureEvents
    lpVtbl : IInkPictureEventsVTbl*
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

  struct IInkRecognizers
    lpVtbl : IInkRecognizersVTbl*
  end

  struct IInkRecognitionEventsVTbl
    query_interface : Proc(IInkRecognitionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkRecognitionEvents*, UInt32)
    release : Proc(IInkRecognitionEvents*, UInt32)
    get_type_info_count : Proc(IInkRecognitionEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkRecognitionEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkRecognitionEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkRecognitionEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkRecognitionEvents
    lpVtbl : IInkRecognitionEventsVTbl*
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

  struct IPenInputPanel
    lpVtbl : IPenInputPanelVTbl*
  end

  struct IPenInputPanelEventsVTbl
    query_interface : Proc(IPenInputPanelEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPenInputPanelEvents*, UInt32)
    release : Proc(IPenInputPanelEvents*, UInt32)
    get_type_info_count : Proc(IPenInputPanelEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IPenInputPanelEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPenInputPanelEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPenInputPanelEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IPenInputPanelEvents
    lpVtbl : IPenInputPanelEventsVTbl*
  end

  struct IHandwrittenTextInsertionVTbl
    query_interface : Proc(IHandwrittenTextInsertion*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHandwrittenTextInsertion*, UInt32)
    release : Proc(IHandwrittenTextInsertion*, UInt32)
    insert_recognition_results_array : Proc(IHandwrittenTextInsertion*, SAFEARRAY*, UInt32, LibC::BOOL, HRESULT)
    insert_ink_recognition_result : Proc(IHandwrittenTextInsertion*, IInkRecognitionResult, UInt32, LibC::BOOL, HRESULT)
  end

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

  struct IInputPanelWindowHandle
    lpVtbl : IInputPanelWindowHandleVTbl*
  end

  struct ITextInputPanelRunInfoVTbl
    query_interface : Proc(ITextInputPanelRunInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextInputPanelRunInfo*, UInt32)
    release : Proc(ITextInputPanelRunInfo*, UInt32)
    is_tip_running : Proc(ITextInputPanelRunInfo*, LibC::BOOL*, HRESULT)
  end

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

  struct IInkEdit
    lpVtbl : IInkEditVTbl*
  end

  struct IInkEditEventsVTbl
    query_interface : Proc(IInkEditEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInkEditEvents*, UInt32)
    release : Proc(IInkEditEvents*, UInt32)
    get_type_info_count : Proc(IInkEditEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IInkEditEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInkEditEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInkEditEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IInkEditEvents
    lpVtbl : IInkEditEventsVTbl*
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

  struct IMathInputControl
    lpVtbl : IMathInputControlVTbl*
  end

  struct IMathInputControlEventsVTbl
    query_interface : Proc(IMathInputControlEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMathInputControlEvents*, UInt32)
    release : Proc(IMathInputControlEvents*, UInt32)
    get_type_info_count : Proc(IMathInputControlEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IMathInputControlEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMathInputControlEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMathInputControlEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct IMathInputControlEvents
    lpVtbl : IMathInputControlEventsVTbl*
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
