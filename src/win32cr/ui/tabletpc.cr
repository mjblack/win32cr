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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_top : UInt64
    put_top : UInt64
    get_left : UInt64
    put_left : UInt64
    get_bottom : UInt64
    put_bottom : UInt64
    get_right : UInt64
    put_right : UInt64
    get_data : UInt64
    put_data : UInt64
    get_rectangle : UInt64
    set_rectangle : UInt64
  end

  IInkRectangle_GUID = "9794ff82-6071-4717-8a8b-6ac7c64a686e"
  IID_IInkRectangle = LibC::GUID.new(0x9794ff82_u32, 0x6071_u16, 0x4717_u16, StaticArray[0x8a_u8, 0x8b_u8, 0x6a_u8, 0xc7_u8, 0xc6_u8, 0x4a_u8, 0x68_u8, 0x6e_u8])
  struct IInkRectangle
    lpVtbl : IInkRectangleVTbl*
  end

  struct IInkExtendedPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_guid : UInt64
    get_data : UInt64
    put_data : UInt64
  end

  IInkExtendedProperty_GUID = "db489209-b7c3-411d-90f6-1548cfff271e"
  IID_IInkExtendedProperty = LibC::GUID.new(0xdb489209_u32, 0xb7c3_u16, 0x411d_u16, StaticArray[0x90_u8, 0xf6_u8, 0x15_u8, 0x48_u8, 0xcf_u8, 0xff_u8, 0x27_u8, 0x1e_u8])
  struct IInkExtendedProperty
    lpVtbl : IInkExtendedPropertyVTbl*
  end

  struct IInkExtendedPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    item : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    does_property_exist : UInt64
  end

  IInkExtendedProperties_GUID = "89f2a8be-95a9-4530-8b8f-88e971e3e25f"
  IID_IInkExtendedProperties = LibC::GUID.new(0x89f2a8be_u32, 0x95a9_u16, 0x4530_u16, StaticArray[0x8b_u8, 0x8f_u8, 0x88_u8, 0xe9_u8, 0x71_u8, 0xe3_u8, 0xe2_u8, 0x5f_u8])
  struct IInkExtendedProperties
    lpVtbl : IInkExtendedPropertiesVTbl*
  end

  struct IInkDrawingAttributesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_color : UInt64
    put_color : UInt64
    get_width : UInt64
    put_width : UInt64
    get_height : UInt64
    put_height : UInt64
    get_fit_to_curve : UInt64
    put_fit_to_curve : UInt64
    get_ignore_pressure : UInt64
    put_ignore_pressure : UInt64
    get_anti_aliased : UInt64
    put_anti_aliased : UInt64
    get_transparency : UInt64
    put_transparency : UInt64
    get_raster_operation : UInt64
    put_raster_operation : UInt64
    get_pen_tip : UInt64
    put_pen_tip : UInt64
    get_extended_properties : UInt64
    clone : UInt64
  end

  IInkDrawingAttributes_GUID = "bf519b75-0a15-4623-adc9-c00d436a8092"
  IID_IInkDrawingAttributes = LibC::GUID.new(0xbf519b75_u32, 0xa15_u16, 0x4623_u16, StaticArray[0xad_u8, 0xc9_u8, 0xc0_u8, 0xd_u8, 0x43_u8, 0x6a_u8, 0x80_u8, 0x92_u8])
  struct IInkDrawingAttributes
    lpVtbl : IInkDrawingAttributesVTbl*
  end

  struct IInkTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    reset : UInt64
    translate : UInt64
    rotate : UInt64
    reflect : UInt64
    shear : UInt64
    scale_transform : UInt64
    get_transform : UInt64
    set_transform : UInt64
    get_e_m11 : UInt64
    put_e_m11 : UInt64
    get_e_m12 : UInt64
    put_e_m12 : UInt64
    get_e_m21 : UInt64
    put_e_m21 : UInt64
    get_e_m22 : UInt64
    put_e_m22 : UInt64
    get_e_dx : UInt64
    put_e_dx : UInt64
    get_e_dy : UInt64
    put_e_dy : UInt64
    get_data : UInt64
    put_data : UInt64
  end

  IInkTransform_GUID = "615f1d43-8703-4565-88e2-8201d2ecd7b7"
  IID_IInkTransform = LibC::GUID.new(0x615f1d43_u32, 0x8703_u16, 0x4565_u16, StaticArray[0x88_u8, 0xe2_u8, 0x82_u8, 0x1_u8, 0xd2_u8, 0xec_u8, 0xd7_u8, 0xb7_u8])
  struct IInkTransform
    lpVtbl : IInkTransformVTbl*
  end

  struct IInkGestureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_confidence : UInt64
    get_id : UInt64
    get_hot_point : UInt64
  end

  IInkGesture_GUID = "3bdc0a97-04e5-4e26-b813-18f052d41def"
  IID_IInkGesture = LibC::GUID.new(0x3bdc0a97_u32, 0x4e5_u16, 0x4e26_u16, StaticArray[0xb8_u8, 0x13_u8, 0x18_u8, 0xf0_u8, 0x52_u8, 0xd4_u8, 0x1d_u8, 0xef_u8])
  struct IInkGesture
    lpVtbl : IInkGestureVTbl*
  end

  struct IInkCursorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_id : UInt64
    get_inverted : UInt64
    get_drawing_attributes : UInt64
    putref_drawing_attributes : UInt64
    get_tablet : UInt64
    get_buttons : UInt64
  end

  IInkCursor_GUID = "ad30c630-40c5-4350-8405-9c71012fc558"
  IID_IInkCursor = LibC::GUID.new(0xad30c630_u32, 0x40c5_u16, 0x4350_u16, StaticArray[0x84_u8, 0x5_u8, 0x9c_u8, 0x71_u8, 0x1_u8, 0x2f_u8, 0xc5_u8, 0x58_u8])
  struct IInkCursor
    lpVtbl : IInkCursorVTbl*
  end

  struct IInkCursorsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    item : UInt64
  end

  IInkCursors_GUID = "a248c1ac-c698-4e06-9e5c-d57f77c7e647"
  IID_IInkCursors = LibC::GUID.new(0xa248c1ac_u32, 0xc698_u16, 0x4e06_u16, StaticArray[0x9e_u8, 0x5c_u8, 0xd5_u8, 0x7f_u8, 0x77_u8, 0xc7_u8, 0xe6_u8, 0x47_u8])
  struct IInkCursors
    lpVtbl : IInkCursorsVTbl*
  end

  struct IInkCursorButtonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_id : UInt64
    get_state : UInt64
  end

  IInkCursorButton_GUID = "85ef9417-1d59-49b2-a13c-702c85430894"
  IID_IInkCursorButton = LibC::GUID.new(0x85ef9417_u32, 0x1d59_u16, 0x49b2_u16, StaticArray[0xa1_u8, 0x3c_u8, 0x70_u8, 0x2c_u8, 0x85_u8, 0x43_u8, 0x8_u8, 0x94_u8])
  struct IInkCursorButton
    lpVtbl : IInkCursorButtonVTbl*
  end

  struct IInkCursorButtonsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    item : UInt64
  end

  IInkCursorButtons_GUID = "3671cc40-b624-4671-9fa0-db119d952d54"
  IID_IInkCursorButtons = LibC::GUID.new(0x3671cc40_u32, 0xb624_u16, 0x4671_u16, StaticArray[0x9f_u8, 0xa0_u8, 0xdb_u8, 0x11_u8, 0x9d_u8, 0x95_u8, 0x2d_u8, 0x54_u8])
  struct IInkCursorButtons
    lpVtbl : IInkCursorButtonsVTbl*
  end

  struct IInkTabletVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_plug_and_play_id : UInt64
    get_maximum_input_rectangle : UInt64
    get_hardware_capabilities : UInt64
    is_packet_property_supported : UInt64
    get_property_metrics : UInt64
  end

  IInkTablet_GUID = "2de25eaa-6ef8-42d5-aee9-185bc81b912d"
  IID_IInkTablet = LibC::GUID.new(0x2de25eaa_u32, 0x6ef8_u16, 0x42d5_u16, StaticArray[0xae_u8, 0xe9_u8, 0x18_u8, 0x5b_u8, 0xc8_u8, 0x1b_u8, 0x91_u8, 0x2d_u8])
  struct IInkTablet
    lpVtbl : IInkTabletVTbl*
  end

  struct IInkTablet2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_device_kind : UInt64
  end

  IInkTablet2_GUID = "90c91ad2-fa36-49d6-9516-ce8d570f6f85"
  IID_IInkTablet2 = LibC::GUID.new(0x90c91ad2_u32, 0xfa36_u16, 0x49d6_u16, StaticArray[0x95_u8, 0x16_u8, 0xce_u8, 0x8d_u8, 0x57_u8, 0xf_u8, 0x6f_u8, 0x85_u8])
  struct IInkTablet2
    lpVtbl : IInkTablet2VTbl*
  end

  struct IInkTablet3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_is_multi_touch : UInt64
    get_maximum_cursors : UInt64
  end

  IInkTablet3_GUID = "7e313997-1327-41dd-8ca9-79f24be17250"
  IID_IInkTablet3 = LibC::GUID.new(0x7e313997_u32, 0x1327_u16, 0x41dd_u16, StaticArray[0x8c_u8, 0xa9_u8, 0x79_u8, 0xf2_u8, 0x4b_u8, 0xe1_u8, 0x72_u8, 0x50_u8])
  struct IInkTablet3
    lpVtbl : IInkTablet3VTbl*
  end

  struct IInkTabletsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_default_tablet : UInt64
    item : UInt64
    is_packet_property_supported : UInt64
  end

  IInkTablets_GUID = "112086d9-7779-4535-a699-862b43ac1863"
  IID_IInkTablets = LibC::GUID.new(0x112086d9_u32, 0x7779_u16, 0x4535_u16, StaticArray[0xa6_u8, 0x99_u8, 0x86_u8, 0x2b_u8, 0x43_u8, 0xac_u8, 0x18_u8, 0x63_u8])
  struct IInkTablets
    lpVtbl : IInkTabletsVTbl*
  end

  struct IInkStrokeDispVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_bezier_points : UInt64
    get_drawing_attributes : UInt64
    putref_drawing_attributes : UInt64
    get_ink : UInt64
    get_extended_properties : UInt64
    get_polyline_cusps : UInt64
    get_bezier_cusps : UInt64
    get_self_intersections : UInt64
    get_packet_count : UInt64
    get_packet_size : UInt64
    get_packet_description : UInt64
    get_deleted : UInt64
    get_bounding_box : UInt64
    find_intersections : UInt64
    get_rectangle_intersections : UInt64
    clip : UInt64
    hit_test_circle : UInt64
    nearest_point : UInt64
    split : UInt64
    get_packet_description_property_metrics : UInt64
    get_points : UInt64
    set_points : UInt64
    get_packet_data : UInt64
    get_packet_values_by_property : UInt64
    set_packet_values_by_property : UInt64
    get_flattened_bezier_points : UInt64
    transform : UInt64
    scale_to_rectangle : UInt64
    move : UInt64
    rotate : UInt64
    shear : UInt64
    scale_transform : UInt64
  end

  IInkStrokeDisp_GUID = "43242fea-91d1-4a72-963e-fbb91829cfa2"
  IID_IInkStrokeDisp = LibC::GUID.new(0x43242fea_u32, 0x91d1_u16, 0x4a72_u16, StaticArray[0x96_u8, 0x3e_u8, 0xfb_u8, 0xb9_u8, 0x18_u8, 0x29_u8, 0xcf_u8, 0xa2_u8])
  struct IInkStrokeDisp
    lpVtbl : IInkStrokeDispVTbl*
  end

  struct IInkStrokesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_ink : UInt64
    get_recognition_result : UInt64
    to_string : UInt64
    item : UInt64
    add : UInt64
    add_strokes : UInt64
    remove : UInt64
    remove_strokes : UInt64
    modify_drawing_attributes : UInt64
    get_bounding_box : UInt64
    transform : UInt64
    scale_to_rectangle : UInt64
    move : UInt64
    rotate : UInt64
    shear : UInt64
    scale_transform : UInt64
    clip : UInt64
    remove_recognition_result : UInt64
  end

  IInkStrokes_GUID = "f1f4c9d8-590a-4963-b3ae-1935671bb6f3"
  IID_IInkStrokes = LibC::GUID.new(0xf1f4c9d8_u32, 0x590a_u16, 0x4963_u16, StaticArray[0xb3_u8, 0xae_u8, 0x19_u8, 0x35_u8, 0x67_u8, 0x1b_u8, 0xb6_u8, 0xf3_u8])
  struct IInkStrokes
    lpVtbl : IInkStrokesVTbl*
  end

  struct IInkCustomStrokesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    item : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
  end

  IInkCustomStrokes_GUID = "7e23a88f-c30e-420f-9bdb-28902543f0c1"
  IID_IInkCustomStrokes = LibC::GUID.new(0x7e23a88f_u32, 0xc30e_u16, 0x420f_u16, StaticArray[0x9b_u8, 0xdb_u8, 0x28_u8, 0x90_u8, 0x25_u8, 0x43_u8, 0xf0_u8, 0xc1_u8])
  struct IInkCustomStrokes
    lpVtbl : IInkCustomStrokesVTbl*
  end

  struct IIInkStrokesEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkStrokesEvents_GUID = "f33053ec-5d25-430a-928f-76a6491dde15"
  IID_IIInkStrokesEvents = LibC::GUID.new(0xf33053ec_u32, 0x5d25_u16, 0x430a_u16, StaticArray[0x92_u8, 0x8f_u8, 0x76_u8, 0xa6_u8, 0x49_u8, 0x1d_u8, 0xde_u8, 0x15_u8])
  struct IIInkStrokesEvents
    lpVtbl : IIInkStrokesEventsVTbl*
  end

  struct IInkDispVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_strokes : UInt64
    get_extended_properties : UInt64
    get_dirty : UInt64
    put_dirty : UInt64
    get_custom_strokes : UInt64
    get_bounding_box : UInt64
    delete_strokes : UInt64
    delete_stroke : UInt64
    extract_strokes : UInt64
    extract_with_rectangle : UInt64
    clip : UInt64
    clone : UInt64
    hit_test_circle : UInt64
    hit_test_with_rectangle : UInt64
    hit_test_with_lasso : UInt64
    nearest_point : UInt64
    create_strokes : UInt64
    add_strokes_at_rectangle : UInt64
    save : UInt64
    load : UInt64
    create_stroke : UInt64
    clipboard_copy_with_rectangle : UInt64
    clipboard_copy : UInt64
    can_paste : UInt64
    clipboard_paste : UInt64
  end

  IInkDisp_GUID = "9d398fa0-c4e2-4fcd-9973-975caaf47ea6"
  IID_IInkDisp = LibC::GUID.new(0x9d398fa0_u32, 0xc4e2_u16, 0x4fcd_u16, StaticArray[0x99_u8, 0x73_u8, 0x97_u8, 0x5c_u8, 0xaa_u8, 0xf4_u8, 0x7e_u8, 0xa6_u8])
  struct IInkDisp
    lpVtbl : IInkDispVTbl*
  end

  struct IIInkEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkEvents_GUID = "427b1865-ca3f-479a-83a9-0f420f2a0073"
  IID_IIInkEvents = LibC::GUID.new(0x427b1865_u32, 0xca3f_u16, 0x479a_u16, StaticArray[0x83_u8, 0xa9_u8, 0xf_u8, 0x42_u8, 0xf_u8, 0x2a_u8, 0x0_u8, 0x73_u8])
  struct IIInkEvents
    lpVtbl : IIInkEventsVTbl*
  end

  struct IInkRendererVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_view_transform : UInt64
    set_view_transform : UInt64
    get_object_transform : UInt64
    set_object_transform : UInt64
    draw : UInt64
    draw_stroke : UInt64
    pixel_to_ink_space : UInt64
    ink_space_to_pixel : UInt64
    pixel_to_ink_space_from_points : UInt64
    ink_space_to_pixel_from_points : UInt64
    measure : UInt64
    measure_stroke : UInt64
    move : UInt64
    rotate : UInt64
    scale_transform : UInt64
  end

  IInkRenderer_GUID = "e6257a9c-b511-4f4c-a8b0-a7dbc9506b83"
  IID_IInkRenderer = LibC::GUID.new(0xe6257a9c_u32, 0xb511_u16, 0x4f4c_u16, StaticArray[0xa8_u8, 0xb0_u8, 0xa7_u8, 0xdb_u8, 0xc9_u8, 0x50_u8, 0x6b_u8, 0x83_u8])
  struct IInkRenderer
    lpVtbl : IInkRendererVTbl*
  end

  struct IInkCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_wnd : UInt64
    put_h_wnd : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_default_drawing_attributes : UInt64
    putref_default_drawing_attributes : UInt64
    get_renderer : UInt64
    putref_renderer : UInt64
    get_ink : UInt64
    putref_ink : UInt64
    get_auto_redraw : UInt64
    put_auto_redraw : UInt64
    get_collecting_ink : UInt64
    get_collection_mode : UInt64
    put_collection_mode : UInt64
    get_dynamic_rendering : UInt64
    put_dynamic_rendering : UInt64
    get_desired_packet_description : UInt64
    put_desired_packet_description : UInt64
    get_mouse_icon : UInt64
    put_mouse_icon : UInt64
    putref_mouse_icon : UInt64
    get_mouse_pointer : UInt64
    put_mouse_pointer : UInt64
    get_cursors : UInt64
    get_margin_x : UInt64
    put_margin_x : UInt64
    get_margin_y : UInt64
    put_margin_y : UInt64
    get_tablet : UInt64
    get_support_high_contrast_ink : UInt64
    put_support_high_contrast_ink : UInt64
    set_gesture_status : UInt64
    get_gesture_status : UInt64
    get_window_input_rectangle : UInt64
    set_window_input_rectangle : UInt64
    set_all_tablets_mode : UInt64
    set_single_tablet_integrated_mode : UInt64
    get_event_interest : UInt64
    set_event_interest : UInt64
  end

  IInkCollector_GUID = "f0f060b5-8b1f-4a7c-89ec-880692588a4f"
  IID_IInkCollector = LibC::GUID.new(0xf0f060b5_u32, 0x8b1f_u16, 0x4a7c_u16, StaticArray[0x89_u8, 0xec_u8, 0x88_u8, 0x6_u8, 0x92_u8, 0x58_u8, 0x8a_u8, 0x4f_u8])
  struct IInkCollector
    lpVtbl : IInkCollectorVTbl*
  end

  struct IIInkCollectorEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkCollectorEvents_GUID = "11a583f2-712d-4fea-abcf-ab4af38ea06b"
  IID_IIInkCollectorEvents = LibC::GUID.new(0x11a583f2_u32, 0x712d_u16, 0x4fea_u16, StaticArray[0xab_u8, 0xcf_u8, 0xab_u8, 0x4a_u8, 0xf3_u8, 0x8e_u8, 0xa0_u8, 0x6b_u8])
  struct IIInkCollectorEvents
    lpVtbl : IIInkCollectorEventsVTbl*
  end

  struct IInkOverlayVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_wnd : UInt64
    put_h_wnd : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_default_drawing_attributes : UInt64
    putref_default_drawing_attributes : UInt64
    get_renderer : UInt64
    putref_renderer : UInt64
    get_ink : UInt64
    putref_ink : UInt64
    get_auto_redraw : UInt64
    put_auto_redraw : UInt64
    get_collecting_ink : UInt64
    get_collection_mode : UInt64
    put_collection_mode : UInt64
    get_dynamic_rendering : UInt64
    put_dynamic_rendering : UInt64
    get_desired_packet_description : UInt64
    put_desired_packet_description : UInt64
    get_mouse_icon : UInt64
    put_mouse_icon : UInt64
    putref_mouse_icon : UInt64
    get_mouse_pointer : UInt64
    put_mouse_pointer : UInt64
    get_editing_mode : UInt64
    put_editing_mode : UInt64
    get_selection : UInt64
    put_selection : UInt64
    get_eraser_mode : UInt64
    put_eraser_mode : UInt64
    get_eraser_width : UInt64
    put_eraser_width : UInt64
    get_attach_mode : UInt64
    put_attach_mode : UInt64
    get_cursors : UInt64
    get_margin_x : UInt64
    put_margin_x : UInt64
    get_margin_y : UInt64
    put_margin_y : UInt64
    get_tablet : UInt64
    get_support_high_contrast_ink : UInt64
    put_support_high_contrast_ink : UInt64
    get_support_high_contrast_selection_ui : UInt64
    put_support_high_contrast_selection_ui : UInt64
    hit_test_selection : UInt64
    draw : UInt64
    set_gesture_status : UInt64
    get_gesture_status : UInt64
    get_window_input_rectangle : UInt64
    set_window_input_rectangle : UInt64
    set_all_tablets_mode : UInt64
    set_single_tablet_integrated_mode : UInt64
    get_event_interest : UInt64
    set_event_interest : UInt64
  end

  IInkOverlay_GUID = "b82a463b-c1c5-45a3-997c-deab5651b67a"
  IID_IInkOverlay = LibC::GUID.new(0xb82a463b_u32, 0xc1c5_u16, 0x45a3_u16, StaticArray[0x99_u8, 0x7c_u8, 0xde_u8, 0xab_u8, 0x56_u8, 0x51_u8, 0xb6_u8, 0x7a_u8])
  struct IInkOverlay
    lpVtbl : IInkOverlayVTbl*
  end

  struct IIInkOverlayEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkOverlayEvents_GUID = "31179b69-e563-489e-b16f-712f1e8a0651"
  IID_IIInkOverlayEvents = LibC::GUID.new(0x31179b69_u32, 0xe563_u16, 0x489e_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x71_u8, 0x2f_u8, 0x1e_u8, 0x8a_u8, 0x6_u8, 0x51_u8])
  struct IIInkOverlayEvents
    lpVtbl : IIInkOverlayEventsVTbl*
  end

  struct IInkPictureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_wnd : UInt64
    get_default_drawing_attributes : UInt64
    putref_default_drawing_attributes : UInt64
    get_renderer : UInt64
    putref_renderer : UInt64
    get_ink : UInt64
    putref_ink : UInt64
    get_auto_redraw : UInt64
    put_auto_redraw : UInt64
    get_collecting_ink : UInt64
    get_collection_mode : UInt64
    put_collection_mode : UInt64
    get_dynamic_rendering : UInt64
    put_dynamic_rendering : UInt64
    get_desired_packet_description : UInt64
    put_desired_packet_description : UInt64
    get_mouse_icon : UInt64
    put_mouse_icon : UInt64
    putref_mouse_icon : UInt64
    get_mouse_pointer : UInt64
    put_mouse_pointer : UInt64
    get_editing_mode : UInt64
    put_editing_mode : UInt64
    get_selection : UInt64
    put_selection : UInt64
    get_eraser_mode : UInt64
    put_eraser_mode : UInt64
    get_eraser_width : UInt64
    put_eraser_width : UInt64
    putref_picture : UInt64
    put_picture : UInt64
    get_picture : UInt64
    put_size_mode : UInt64
    get_size_mode : UInt64
    put_back_color : UInt64
    get_back_color : UInt64
    get_cursors : UInt64
    get_margin_x : UInt64
    put_margin_x : UInt64
    get_margin_y : UInt64
    put_margin_y : UInt64
    get_tablet : UInt64
    get_support_high_contrast_ink : UInt64
    put_support_high_contrast_ink : UInt64
    get_support_high_contrast_selection_ui : UInt64
    put_support_high_contrast_selection_ui : UInt64
    hit_test_selection : UInt64
    set_gesture_status : UInt64
    get_gesture_status : UInt64
    get_window_input_rectangle : UInt64
    set_window_input_rectangle : UInt64
    set_all_tablets_mode : UInt64
    set_single_tablet_integrated_mode : UInt64
    get_event_interest : UInt64
    set_event_interest : UInt64
    get_ink_enabled : UInt64
    put_ink_enabled : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  IInkPicture_GUID = "e85662e0-379a-40d7-9b5c-757d233f9923"
  IID_IInkPicture = LibC::GUID.new(0xe85662e0_u32, 0x379a_u16, 0x40d7_u16, StaticArray[0x9b_u8, 0x5c_u8, 0x75_u8, 0x7d_u8, 0x23_u8, 0x3f_u8, 0x99_u8, 0x23_u8])
  struct IInkPicture
    lpVtbl : IInkPictureVTbl*
  end

  struct IIInkPictureEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkPictureEvents_GUID = "60ff4fee-22ff-4484-acc1-d308d9cd7ea3"
  IID_IIInkPictureEvents = LibC::GUID.new(0x60ff4fee_u32, 0x22ff_u16, 0x4484_u16, StaticArray[0xac_u8, 0xc1_u8, 0xd3_u8, 0x8_u8, 0xd9_u8, 0xcd_u8, 0x7e_u8, 0xa3_u8])
  struct IIInkPictureEvents
    lpVtbl : IIInkPictureEventsVTbl*
  end

  struct IInkRecognizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_vendor : UInt64
    get_capabilities : UInt64
    get_languages : UInt64
    get_supported_properties : UInt64
    get_preferred_packet_description : UInt64
    create_recognizer_context : UInt64
  end

  IInkRecognizer_GUID = "782bf7cf-034b-4396-8a32-3a1833cf6b56"
  IID_IInkRecognizer = LibC::GUID.new(0x782bf7cf_u32, 0x34b_u16, 0x4396_u16, StaticArray[0x8a_u8, 0x32_u8, 0x3a_u8, 0x18_u8, 0x33_u8, 0xcf_u8, 0x6b_u8, 0x56_u8])
  struct IInkRecognizer
    lpVtbl : IInkRecognizerVTbl*
  end

  struct IInkRecognizer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_unicode_ranges : UInt64
  end

  IInkRecognizer2_GUID = "6110118a-3a75-4ad6-b2aa-04b2b72bbe65"
  IID_IInkRecognizer2 = LibC::GUID.new(0x6110118a_u32, 0x3a75_u16, 0x4ad6_u16, StaticArray[0xb2_u8, 0xaa_u8, 0x4_u8, 0xb2_u8, 0xb7_u8, 0x2b_u8, 0xbe_u8, 0x65_u8])
  struct IInkRecognizer2
    lpVtbl : IInkRecognizer2VTbl*
  end

  struct IInkRecognizersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_default_recognizer : UInt64
    item : UInt64
  end

  IInkRecognizers_GUID = "9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd"
  IID_IInkRecognizers = LibC::GUID.new(0x9ccc4f12_u32, 0xb0b7_u16, 0x4a8b_u16, StaticArray[0xbf_u8, 0x58_u8, 0x4a_u8, 0xec_u8, 0xa4_u8, 0xe8_u8, 0xce_u8, 0xfd_u8])
  struct IInkRecognizers
    lpVtbl : IInkRecognizersVTbl*
  end

  struct IIInkRecognitionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkRecognitionEvents_GUID = "17bce92f-2e21-47fd-9d33-3c6afbfd8c59"
  IID_IIInkRecognitionEvents = LibC::GUID.new(0x17bce92f_u32, 0x2e21_u16, 0x47fd_u16, StaticArray[0x9d_u8, 0x33_u8, 0x3c_u8, 0x6a_u8, 0xfb_u8, 0xfd_u8, 0x8c_u8, 0x59_u8])
  struct IIInkRecognitionEvents
    lpVtbl : IIInkRecognitionEventsVTbl*
  end

  struct IInkRecognizerContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_strokes : UInt64
    putref_strokes : UInt64
    get_character_auto_completion_mode : UInt64
    put_character_auto_completion_mode : UInt64
    get_factoid : UInt64
    put_factoid : UInt64
    get_guide : UInt64
    putref_guide : UInt64
    get_prefix_text : UInt64
    put_prefix_text : UInt64
    get_suffix_text : UInt64
    put_suffix_text : UInt64
    get_recognition_flags : UInt64
    put_recognition_flags : UInt64
    get_word_list : UInt64
    putref_word_list : UInt64
    get_recognizer : UInt64
    recognize : UInt64
    stop_background_recognition : UInt64
    end_ink_input : UInt64
    background_recognize : UInt64
    background_recognize_with_alternates : UInt64
    clone : UInt64
    is_string_supported : UInt64
  end

  IInkRecognizerContext_GUID = "c68f52f9-32a3-4625-906c-44fc23b40958"
  IID_IInkRecognizerContext = LibC::GUID.new(0xc68f52f9_u32, 0x32a3_u16, 0x4625_u16, StaticArray[0x90_u8, 0x6c_u8, 0x44_u8, 0xfc_u8, 0x23_u8, 0xb4_u8, 0x9_u8, 0x58_u8])
  struct IInkRecognizerContext
    lpVtbl : IInkRecognizerContextVTbl*
  end

  struct IInkRecognizerContext2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_enabled_unicode_ranges : UInt64
    put_enabled_unicode_ranges : UInt64
  end

  IInkRecognizerContext2_GUID = "d6f0e32f-73d8-408e-8e9f-5fea592c363f"
  IID_IInkRecognizerContext2 = LibC::GUID.new(0xd6f0e32f_u32, 0x73d8_u16, 0x408e_u16, StaticArray[0x8e_u8, 0x9f_u8, 0x5f_u8, 0xea_u8, 0x59_u8, 0x2c_u8, 0x36_u8, 0x3f_u8])
  struct IInkRecognizerContext2
    lpVtbl : IInkRecognizerContext2VTbl*
  end

  struct IInkRecognitionResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_top_string : UInt64
    get_top_alternate : UInt64
    get_top_confidence : UInt64
    get_strokes : UInt64
    alternates_from_selection : UInt64
    modify_top_alternate : UInt64
    set_result_on_strokes : UInt64
  end

  IInkRecognitionResult_GUID = "3bc129a8-86cd-45ad-bde8-e0d32d61c16d"
  IID_IInkRecognitionResult = LibC::GUID.new(0x3bc129a8_u32, 0x86cd_u16, 0x45ad_u16, StaticArray[0xbd_u8, 0xe8_u8, 0xe0_u8, 0xd3_u8, 0x2d_u8, 0x61_u8, 0xc1_u8, 0x6d_u8])
  struct IInkRecognitionResult
    lpVtbl : IInkRecognitionResultVTbl*
  end

  struct IInkRecognitionAlternateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_string : UInt64
    get_confidence : UInt64
    get_baseline : UInt64
    get_midline : UInt64
    get_ascender : UInt64
    get_descender : UInt64
    get_line_number : UInt64
    get_strokes : UInt64
    get_line_alternates : UInt64
    get_confidence_alternates : UInt64
    get_strokes_from_stroke_ranges : UInt64
    get_strokes_from_text_range : UInt64
    get_text_range_from_strokes : UInt64
    alternates_with_constant_property_values : UInt64
    get_property_value : UInt64
  end

  IInkRecognitionAlternate_GUID = "b7e660ad-77e4-429b-adda-873780d1fc4a"
  IID_IInkRecognitionAlternate = LibC::GUID.new(0xb7e660ad_u32, 0x77e4_u16, 0x429b_u16, StaticArray[0xad_u8, 0xda_u8, 0x87_u8, 0x37_u8, 0x80_u8, 0xd1_u8, 0xfc_u8, 0x4a_u8])
  struct IInkRecognitionAlternate
    lpVtbl : IInkRecognitionAlternateVTbl*
  end

  struct IInkRecognitionAlternatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_strokes : UInt64
    item : UInt64
  end

  IInkRecognitionAlternates_GUID = "286a167f-9f19-4c61-9d53-4f07be622b84"
  IID_IInkRecognitionAlternates = LibC::GUID.new(0x286a167f_u32, 0x9f19_u16, 0x4c61_u16, StaticArray[0x9d_u8, 0x53_u8, 0x4f_u8, 0x7_u8, 0xbe_u8, 0x62_u8, 0x2b_u8, 0x84_u8])
  struct IInkRecognitionAlternates
    lpVtbl : IInkRecognitionAlternatesVTbl*
  end

  struct IInkRecognizerGuideVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_writing_box : UInt64
    put_writing_box : UInt64
    get_drawn_box : UInt64
    put_drawn_box : UInt64
    get_rows : UInt64
    put_rows : UInt64
    get_columns : UInt64
    put_columns : UInt64
    get_midline : UInt64
    put_midline : UInt64
    get_guide_data : UInt64
    put_guide_data : UInt64
  end

  IInkRecognizerGuide_GUID = "d934be07-7b84-4208-9136-83c20994e905"
  IID_IInkRecognizerGuide = LibC::GUID.new(0xd934be07_u32, 0x7b84_u16, 0x4208_u16, StaticArray[0x91_u8, 0x36_u8, 0x83_u8, 0xc2_u8, 0x9_u8, 0x94_u8, 0xe9_u8, 0x5_u8])
  struct IInkRecognizerGuide
    lpVtbl : IInkRecognizerGuideVTbl*
  end

  struct IInkWordListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    add_word : UInt64
    remove_word : UInt64
    merge : UInt64
  end

  IInkWordList_GUID = "76ba3491-cb2f-406b-9961-0e0c4cdaaef2"
  IID_IInkWordList = LibC::GUID.new(0x76ba3491_u32, 0xcb2f_u16, 0x406b_u16, StaticArray[0x99_u8, 0x61_u8, 0xe_u8, 0xc_u8, 0x4c_u8, 0xda_u8, 0xae_u8, 0xf2_u8])
  struct IInkWordList
    lpVtbl : IInkWordListVTbl*
  end

  struct IInkWordList2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    add_words : UInt64
  end

  IInkWordList2_GUID = "14542586-11bf-4f5f-b6e7-49d0744aab6e"
  IID_IInkWordList2 = LibC::GUID.new(0x14542586_u32, 0x11bf_u16, 0x4f5f_u16, StaticArray[0xb6_u8, 0xe7_u8, 0x49_u8, 0xd0_u8, 0x74_u8, 0x4a_u8, 0xab_u8, 0x6e_u8])
  struct IInkWordList2
    lpVtbl : IInkWordList2VTbl*
  end

  struct IInkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IInk_GUID = "03f8e511-43a1-11d3-8bb6-0080c7d6bad5"
  IID_IInk = LibC::GUID.new(0x3f8e511_u32, 0x43a1_u16, 0x11d3_u16, StaticArray[0x8b_u8, 0xb6_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd6_u8, 0xba_u8, 0xd5_u8])
  struct IInk
    lpVtbl : IInkVTbl*
  end

  struct IInkLineInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_format : UInt64
    get_format : UInt64
    get_ink_extent : UInt64
    get_candidate : UInt64
    set_candidate : UInt64
    recognize : UInt64
  end

  IInkLineInfo_GUID = "9c1c5ad6-f22f-4de4-b453-a2cc482e7c33"
  IID_IInkLineInfo = LibC::GUID.new(0x9c1c5ad6_u32, 0xf22f_u16, 0x4de4_u16, StaticArray[0xb4_u8, 0x53_u8, 0xa2_u8, 0xcc_u8, 0x48_u8, 0x2e_u8, 0x7c_u8, 0x33_u8])
  struct IInkLineInfo
    lpVtbl : IInkLineInfoVTbl*
  end

  struct ISketchInkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  ISketchInk_GUID = "b4563688-98eb-4646-b279-44da14d45748"
  IID_ISketchInk = LibC::GUID.new(0xb4563688_u32, 0x98eb_u16, 0x4646_u16, StaticArray[0xb2_u8, 0x79_u8, 0x44_u8, 0xda_u8, 0x14_u8, 0xd4_u8, 0x57_u8, 0x48_u8])
  struct ISketchInk
    lpVtbl : ISketchInkVTbl*
  end

  struct IInkDividerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_strokes : UInt64
    putref_strokes : UInt64
    get_recognizer_context : UInt64
    putref_recognizer_context : UInt64
    get_line_height : UInt64
    put_line_height : UInt64
    divide : UInt64
  end

  IInkDivider_GUID = "5de00405-f9a4-4651-b0c5-c317defd58b9"
  IID_IInkDivider = LibC::GUID.new(0x5de00405_u32, 0xf9a4_u16, 0x4651_u16, StaticArray[0xb0_u8, 0xc5_u8, 0xc3_u8, 0x17_u8, 0xde_u8, 0xfd_u8, 0x58_u8, 0xb9_u8])
  struct IInkDivider
    lpVtbl : IInkDividerVTbl*
  end

  struct IInkDivisionResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_strokes : UInt64
    result_by_type : UInt64
  end

  IInkDivisionResult_GUID = "2dbec0a7-74c7-4b38-81eb-aa8ef0c24900"
  IID_IInkDivisionResult = LibC::GUID.new(0x2dbec0a7_u32, 0x74c7_u16, 0x4b38_u16, StaticArray[0x81_u8, 0xeb_u8, 0xaa_u8, 0x8e_u8, 0xf0_u8, 0xc2_u8, 0x49_u8, 0x0_u8])
  struct IInkDivisionResult
    lpVtbl : IInkDivisionResultVTbl*
  end

  struct IInkDivisionUnitVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_strokes : UInt64
    get_division_type : UInt64
    get_recognized_string : UInt64
    get_rotation_transform : UInt64
  end

  IInkDivisionUnit_GUID = "85aee342-48b0-4244-9dd5-1ed435410fab"
  IID_IInkDivisionUnit = LibC::GUID.new(0x85aee342_u32, 0x48b0_u16, 0x4244_u16, StaticArray[0x9d_u8, 0xd5_u8, 0x1e_u8, 0xd4_u8, 0x35_u8, 0x41_u8, 0xf_u8, 0xab_u8])
  struct IInkDivisionUnit
    lpVtbl : IInkDivisionUnitVTbl*
  end

  struct IInkDivisionUnitsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    item : UInt64
  end

  IInkDivisionUnits_GUID = "1bb5ddc2-31cc-4135-ab82-2c66c9f00c41"
  IID_IInkDivisionUnits = LibC::GUID.new(0x1bb5ddc2_u32, 0x31cc_u16, 0x4135_u16, StaticArray[0xab_u8, 0x82_u8, 0x2c_u8, 0x66_u8, 0xc9_u8, 0xf0_u8, 0xc_u8, 0x41_u8])
  struct IInkDivisionUnits
    lpVtbl : IInkDivisionUnitsVTbl*
  end

  struct IPenInputPanelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_busy : UInt64
    get_factoid : UInt64
    put_factoid : UInt64
    get_attached_edit_window : UInt64
    put_attached_edit_window : UInt64
    get_current_panel : UInt64
    put_current_panel : UInt64
    get_default_panel : UInt64
    put_default_panel : UInt64
    get_visible : UInt64
    put_visible : UInt64
    get_top : UInt64
    get_left : UInt64
    get_width : UInt64
    get_height : UInt64
    get_vertical_offset : UInt64
    put_vertical_offset : UInt64
    get_horizontal_offset : UInt64
    put_horizontal_offset : UInt64
    get_auto_show : UInt64
    put_auto_show : UInt64
    move_to : UInt64
    commit_pending_input : UInt64
    refresh : UInt64
    enable_tsf : UInt64
  end

  IPenInputPanel_GUID = "fa7a4083-5747-4040-a182-0b0e9fd4fac7"
  IID_IPenInputPanel = LibC::GUID.new(0xfa7a4083_u32, 0x5747_u16, 0x4040_u16, StaticArray[0xa1_u8, 0x82_u8, 0xb_u8, 0xe_u8, 0x9f_u8, 0xd4_u8, 0xfa_u8, 0xc7_u8])
  struct IPenInputPanel
    lpVtbl : IPenInputPanelVTbl*
  end

  struct IIPenInputPanelEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIPenInputPanelEvents_GUID = "b7e489da-3719-439f-848f-e7acbd820f17"
  IID_IIPenInputPanelEvents = LibC::GUID.new(0xb7e489da_u32, 0x3719_u16, 0x439f_u16, StaticArray[0x84_u8, 0x8f_u8, 0xe7_u8, 0xac_u8, 0xbd_u8, 0x82_u8, 0xf_u8, 0x17_u8])
  struct IIPenInputPanelEvents
    lpVtbl : IIPenInputPanelEventsVTbl*
  end

  struct IHandwrittenTextInsertionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_recognition_results_array : UInt64
    insert_ink_recognition_result : UInt64
  end

  IHandwrittenTextInsertion_GUID = "56fdea97-ecd6-43e7-aa3a-816be7785860"
  IID_IHandwrittenTextInsertion = LibC::GUID.new(0x56fdea97_u32, 0xecd6_u16, 0x43e7_u16, StaticArray[0xaa_u8, 0x3a_u8, 0x81_u8, 0x6b_u8, 0xe7_u8, 0x78_u8, 0x58_u8, 0x60_u8])
  struct IHandwrittenTextInsertion
    lpVtbl : IHandwrittenTextInsertionVTbl*
  end

  struct ITextInputPanelEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    in_place_state_changing : UInt64
    in_place_state_changed : UInt64
    in_place_size_changing : UInt64
    in_place_size_changed : UInt64
    input_area_changing : UInt64
    input_area_changed : UInt64
    correction_mode_changing : UInt64
    correction_mode_changed : UInt64
    in_place_visibility_changing : UInt64
    in_place_visibility_changed : UInt64
    text_inserting : UInt64
    text_inserted : UInt64
  end

  ITextInputPanelEventSink_GUID = "27560408-8e64-4fe1-804e-421201584b31"
  IID_ITextInputPanelEventSink = LibC::GUID.new(0x27560408_u32, 0x8e64_u16, 0x4fe1_u16, StaticArray[0x80_u8, 0x4e_u8, 0x42_u8, 0x12_u8, 0x1_u8, 0x58_u8, 0x4b_u8, 0x31_u8])
  struct ITextInputPanelEventSink
    lpVtbl : ITextInputPanelEventSinkVTbl*
  end

  struct ITextInputPanelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attached_edit_window : UInt64
    put_attached_edit_window : UInt64
    get_current_interaction_mode : UInt64
    get_default_in_place_state : UInt64
    put_default_in_place_state : UInt64
    get_current_in_place_state : UInt64
    get_default_input_area : UInt64
    put_default_input_area : UInt64
    get_current_input_area : UInt64
    get_current_correction_mode : UInt64
    get_preferred_in_place_direction : UInt64
    put_preferred_in_place_direction : UInt64
    get_expand_post_insertion_correction : UInt64
    put_expand_post_insertion_correction : UInt64
    get_in_place_visible_on_focus : UInt64
    put_in_place_visible_on_focus : UInt64
    get_in_place_bounding_rectangle : UInt64
    get_pop_up_correction_height : UInt64
    get_pop_down_correction_height : UInt64
    commit_pending_input : UInt64
    set_in_place_visibility : UInt64
    set_in_place_position : UInt64
    set_in_place_hover_target_position : UInt64
    advise : UInt64
    unadvise : UInt64
  end

  ITextInputPanel_GUID = "6b6a65a5-6af3-46c2-b6ea-56cd1f80df71"
  IID_ITextInputPanel = LibC::GUID.new(0x6b6a65a5_u32, 0x6af3_u16, 0x46c2_u16, StaticArray[0xb6_u8, 0xea_u8, 0x56_u8, 0xcd_u8, 0x1f_u8, 0x80_u8, 0xdf_u8, 0x71_u8])
  struct ITextInputPanel
    lpVtbl : ITextInputPanelVTbl*
  end

  struct IInputPanelWindowHandleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attached_edit_window32 : UInt64
    put_attached_edit_window32 : UInt64
    get_attached_edit_window64 : UInt64
    put_attached_edit_window64 : UInt64
  end

  IInputPanelWindowHandle_GUID = "4af81847-fdc4-4fc3-ad0b-422479c1b935"
  IID_IInputPanelWindowHandle = LibC::GUID.new(0x4af81847_u32, 0xfdc4_u16, 0x4fc3_u16, StaticArray[0xad_u8, 0xb_u8, 0x42_u8, 0x24_u8, 0x79_u8, 0xc1_u8, 0xb9_u8, 0x35_u8])
  struct IInputPanelWindowHandle
    lpVtbl : IInputPanelWindowHandleVTbl*
  end

  struct ITextInputPanelRunInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_tip_running : UInt64
  end

  ITextInputPanelRunInfo_GUID = "9f424568-1920-48cc-9811-a993cbf5adba"
  IID_ITextInputPanelRunInfo = LibC::GUID.new(0x9f424568_u32, 0x1920_u16, 0x48cc_u16, StaticArray[0x98_u8, 0x11_u8, 0xa9_u8, 0x93_u8, 0xcb_u8, 0xf5_u8, 0xad_u8, 0xba_u8])
  struct ITextInputPanelRunInfo
    lpVtbl : ITextInputPanelRunInfoVTbl*
  end

  struct IInkEditVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status : UInt64
    get_use_mouse_for_input : UInt64
    put_use_mouse_for_input : UInt64
    get_ink_mode : UInt64
    put_ink_mode : UInt64
    get_ink_insert_mode : UInt64
    put_ink_insert_mode : UInt64
    get_drawing_attributes : UInt64
    putref_drawing_attributes : UInt64
    get_recognition_timeout : UInt64
    put_recognition_timeout : UInt64
    get_recognizer : UInt64
    putref_recognizer : UInt64
    get_factoid : UInt64
    put_factoid : UInt64
    get_sel_inks : UInt64
    put_sel_inks : UInt64
    get_sel_inks_display_mode : UInt64
    put_sel_inks_display_mode : UInt64
    recognize : UInt64
    get_gesture_status : UInt64
    set_gesture_status : UInt64
    put_back_color : UInt64
    get_back_color : UInt64
    get_appearance : UInt64
    put_appearance : UInt64
    get_border_style : UInt64
    put_border_style : UInt64
    get_hwnd : UInt64
    get_font : UInt64
    putref_font : UInt64
    get_text : UInt64
    put_text : UInt64
    get_mouse_icon : UInt64
    put_mouse_icon : UInt64
    putref_mouse_icon : UInt64
    get_mouse_pointer : UInt64
    put_mouse_pointer : UInt64
    get_locked : UInt64
    put_locked : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_max_length : UInt64
    put_max_length : UInt64
    get_multi_line : UInt64
    put_multi_line : UInt64
    get_scroll_bars : UInt64
    put_scroll_bars : UInt64
    get_disable_no_scroll : UInt64
    put_disable_no_scroll : UInt64
    get_sel_alignment : UInt64
    put_sel_alignment : UInt64
    get_sel_bold : UInt64
    put_sel_bold : UInt64
    get_sel_italic : UInt64
    put_sel_italic : UInt64
    get_sel_underline : UInt64
    put_sel_underline : UInt64
    get_sel_color : UInt64
    put_sel_color : UInt64
    get_sel_font_name : UInt64
    put_sel_font_name : UInt64
    get_sel_font_size : UInt64
    put_sel_font_size : UInt64
    get_sel_char_offset : UInt64
    put_sel_char_offset : UInt64
    get_text_rtf : UInt64
    put_text_rtf : UInt64
    get_sel_start : UInt64
    put_sel_start : UInt64
    get_sel_length : UInt64
    put_sel_length : UInt64
    get_sel_text : UInt64
    put_sel_text : UInt64
    get_sel_rtf : UInt64
    put_sel_rtf : UInt64
    refresh : UInt64
  end

  IInkEdit_GUID = "f2127a19-fbfb-4aed-8464-3f36d78cfefb"
  IID_IInkEdit = LibC::GUID.new(0xf2127a19_u32, 0xfbfb_u16, 0x4aed_u16, StaticArray[0x84_u8, 0x64_u8, 0x3f_u8, 0x36_u8, 0xd7_u8, 0x8c_u8, 0xfe_u8, 0xfb_u8])
  struct IInkEdit
    lpVtbl : IInkEditVTbl*
  end

  struct IIInkEditEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIInkEditEvents_GUID = "e3b0b797-a72e-46db-a0d7-6c9eba8e9bbc"
  IID_IIInkEditEvents = LibC::GUID.new(0xe3b0b797_u32, 0xa72e_u16, 0x46db_u16, StaticArray[0xa0_u8, 0xd7_u8, 0x6c_u8, 0x9e_u8, 0xba_u8, 0x8e_u8, 0x9b_u8, 0xbc_u8])
  struct IIInkEditEvents
    lpVtbl : IIInkEditEventsVTbl*
  end

  struct IMathInputControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    show : UInt64
    hide : UInt64
    is_visible : UInt64
    get_position : UInt64
    set_position : UInt64
    clear : UInt64
    set_custom_paint : UInt64
    set_caption_text : UInt64
    load_ink : UInt64
    set_owner_window : UInt64
    enable_extended_buttons : UInt64
    get_preview_height : UInt64
    set_preview_height : UInt64
    enable_auto_grow : UInt64
    add_function_name : UInt64
    remove_function_name : UInt64
    get_hover_icon : UInt64
  end

  IMathInputControl_GUID = "eba615aa-fac6-4738-ba5f-ff09e9fe473e"
  IID_IMathInputControl = LibC::GUID.new(0xeba615aa_u32, 0xfac6_u16, 0x4738_u16, StaticArray[0xba_u8, 0x5f_u8, 0xff_u8, 0x9_u8, 0xe9_u8, 0xfe_u8, 0x47_u8, 0x3e_u8])
  struct IMathInputControl
    lpVtbl : IMathInputControlVTbl*
  end

  struct IIMathInputControlEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIMathInputControlEvents_GUID = "683336b5-a47d-4358-96f9-875a472ae70a"
  IID_IIMathInputControlEvents = LibC::GUID.new(0x683336b5_u32, 0xa47d_u16, 0x4358_u16, StaticArray[0x96_u8, 0xf9_u8, 0x87_u8, 0x5a_u8, 0x47_u8, 0x2a_u8, 0xe7_u8, 0xa_u8])
  struct IIMathInputControlEvents
    lpVtbl : IIMathInputControlEventsVTbl*
  end

  struct IRealTimeStylusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_hwnd : UInt64
    put_hwnd : UInt64
    get_window_input_rectangle : UInt64
    put_window_input_rectangle : UInt64
    add_stylus_sync_plugin : UInt64
    remove_stylus_sync_plugin : UInt64
    remove_all_stylus_sync_plugins : UInt64
    get_stylus_sync_plugin : UInt64
    get_stylus_sync_plugin_count : UInt64
    add_stylus_async_plugin : UInt64
    remove_stylus_async_plugin : UInt64
    remove_all_stylus_async_plugins : UInt64
    get_stylus_async_plugin : UInt64
    get_stylus_async_plugin_count : UInt64
    get_child_real_time_stylus_plugin : UInt64
    putref_child_real_time_stylus_plugin : UInt64
    add_custom_stylus_data_to_queue : UInt64
    clear_stylus_queues : UInt64
    set_all_tablets_mode : UInt64
    set_single_tablet_mode : UInt64
    get_tablet : UInt64
    get_tablet_context_id_from_tablet : UInt64
    get_tablet_from_tablet_context_id : UInt64
    get_all_tablet_context_ids : UInt64
    get_styluses : UInt64
    get_stylus_for_id : UInt64
    set_desired_packet_description : UInt64
    get_desired_packet_description : UInt64
    get_packet_description_data : UInt64
  end

  IRealTimeStylus_GUID = "a8bb5d22-3144-4a7b-93cd-f34a16be513a"
  IID_IRealTimeStylus = LibC::GUID.new(0xa8bb5d22_u32, 0x3144_u16, 0x4a7b_u16, StaticArray[0x93_u8, 0xcd_u8, 0xf3_u8, 0x4a_u8, 0x16_u8, 0xbe_u8, 0x51_u8, 0x3a_u8])
  struct IRealTimeStylus
    lpVtbl : IRealTimeStylusVTbl*
  end

  struct IRealTimeStylus2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_flicks_enabled : UInt64
    put_flicks_enabled : UInt64
  end

  IRealTimeStylus2_GUID = "b5f2a6cd-3179-4a3e-b9c4-bb5865962be2"
  IID_IRealTimeStylus2 = LibC::GUID.new(0xb5f2a6cd_u32, 0x3179_u16, 0x4a3e_u16, StaticArray[0xb9_u8, 0xc4_u8, 0xbb_u8, 0x58_u8, 0x65_u8, 0x96_u8, 0x2b_u8, 0xe2_u8])
  struct IRealTimeStylus2
    lpVtbl : IRealTimeStylus2VTbl*
  end

  struct IRealTimeStylus3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_multi_touch_enabled : UInt64
    put_multi_touch_enabled : UInt64
  end

  IRealTimeStylus3_GUID = "d70230a3-6986-4051-b57a-1cf69f4d9db5"
  IID_IRealTimeStylus3 = LibC::GUID.new(0xd70230a3_u32, 0x6986_u16, 0x4051_u16, StaticArray[0xb5_u8, 0x7a_u8, 0x1c_u8, 0xf6_u8, 0x9f_u8, 0x4d_u8, 0x9d_u8, 0xb5_u8])
  struct IRealTimeStylus3
    lpVtbl : IRealTimeStylus3VTbl*
  end

  struct IRealTimeStylusSynchronizationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_lock : UInt64
    release_lock : UInt64
  end

  IRealTimeStylusSynchronization_GUID = "aa87eab8-ab4a-4cea-b5cb-46d84c6a2509"
  IID_IRealTimeStylusSynchronization = LibC::GUID.new(0xaa87eab8_u32, 0xab4a_u16, 0x4cea_u16, StaticArray[0xb5_u8, 0xcb_u8, 0x46_u8, 0xd8_u8, 0x4c_u8, 0x6a_u8, 0x25_u8, 0x9_u8])
  struct IRealTimeStylusSynchronization
    lpVtbl : IRealTimeStylusSynchronizationVTbl*
  end

  struct IStrokeBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_stroke : UInt64
    begin_stroke : UInt64
    append_packets : UInt64
    end_stroke : UInt64
    get_ink : UInt64
    putref_ink : UInt64
  end

  IStrokeBuilder_GUID = "a5fd4e2d-c44b-4092-9177-260905eb672b"
  IID_IStrokeBuilder = LibC::GUID.new(0xa5fd4e2d_u32, 0xc44b_u16, 0x4092_u16, StaticArray[0x91_u8, 0x77_u8, 0x26_u8, 0x9_u8, 0x5_u8, 0xeb_u8, 0x67_u8, 0x2b_u8])
  struct IStrokeBuilder
    lpVtbl : IStrokeBuilderVTbl*
  end

  struct IStylusPluginVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    real_time_stylus_enabled : UInt64
    real_time_stylus_disabled : UInt64
    stylus_in_range : UInt64
    stylus_out_of_range : UInt64
    stylus_down : UInt64
    stylus_up : UInt64
    stylus_button_down : UInt64
    stylus_button_up : UInt64
    in_air_packets : UInt64
    packets : UInt64
    custom_stylus_data_added : UInt64
    system_event : UInt64
    tablet_added : UInt64
    tablet_removed : UInt64
    error : UInt64
    update_mapping : UInt64
    data_interest : UInt64
  end

  IStylusPlugin_GUID = "a81436d8-4757-4fd1-a185-133f97c6c545"
  IID_IStylusPlugin = LibC::GUID.new(0xa81436d8_u32, 0x4757_u16, 0x4fd1_u16, StaticArray[0xa1_u8, 0x85_u8, 0x13_u8, 0x3f_u8, 0x97_u8, 0xc6_u8, 0xc5_u8, 0x45_u8])
  struct IStylusPlugin
    lpVtbl : IStylusPluginVTbl*
  end

  struct IStylusSyncPluginVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    real_time_stylus_enabled : UInt64
    real_time_stylus_disabled : UInt64
    stylus_in_range : UInt64
    stylus_out_of_range : UInt64
    stylus_down : UInt64
    stylus_up : UInt64
    stylus_button_down : UInt64
    stylus_button_up : UInt64
    in_air_packets : UInt64
    packets : UInt64
    custom_stylus_data_added : UInt64
    system_event : UInt64
    tablet_added : UInt64
    tablet_removed : UInt64
    error : UInt64
    update_mapping : UInt64
    data_interest : UInt64
  end

  IStylusSyncPlugin_GUID = "a157b174-482f-4d71-a3f6-3a41ddd11be9"
  IID_IStylusSyncPlugin = LibC::GUID.new(0xa157b174_u32, 0x482f_u16, 0x4d71_u16, StaticArray[0xa3_u8, 0xf6_u8, 0x3a_u8, 0x41_u8, 0xdd_u8, 0xd1_u8, 0x1b_u8, 0xe9_u8])
  struct IStylusSyncPlugin
    lpVtbl : IStylusSyncPluginVTbl*
  end

  struct IStylusAsyncPluginVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    real_time_stylus_enabled : UInt64
    real_time_stylus_disabled : UInt64
    stylus_in_range : UInt64
    stylus_out_of_range : UInt64
    stylus_down : UInt64
    stylus_up : UInt64
    stylus_button_down : UInt64
    stylus_button_up : UInt64
    in_air_packets : UInt64
    packets : UInt64
    custom_stylus_data_added : UInt64
    system_event : UInt64
    tablet_added : UInt64
    tablet_removed : UInt64
    error : UInt64
    update_mapping : UInt64
    data_interest : UInt64
  end

  IStylusAsyncPlugin_GUID = "a7cca85a-31bc-4cd2-aadc-3289a3af11c8"
  IID_IStylusAsyncPlugin = LibC::GUID.new(0xa7cca85a_u32, 0x31bc_u16, 0x4cd2_u16, StaticArray[0xaa_u8, 0xdc_u8, 0x32_u8, 0x89_u8, 0xa3_u8, 0xaf_u8, 0x11_u8, 0xc8_u8])
  struct IStylusAsyncPlugin
    lpVtbl : IStylusAsyncPluginVTbl*
  end

  struct IDynamicRendererVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_hwnd : UInt64
    put_hwnd : UInt64
    get_clip_rectangle : UInt64
    put_clip_rectangle : UInt64
    get_clip_region : UInt64
    put_clip_region : UInt64
    get_drawing_attributes : UInt64
    putref_drawing_attributes : UInt64
    get_data_cache_enabled : UInt64
    put_data_cache_enabled : UInt64
    release_cached_data : UInt64
    refresh : UInt64
    draw : UInt64
  end

  IDynamicRenderer_GUID = "a079468e-7165-46f9-b7af-98ad01a93009"
  IID_IDynamicRenderer = LibC::GUID.new(0xa079468e_u32, 0x7165_u16, 0x46f9_u16, StaticArray[0xb7_u8, 0xaf_u8, 0x98_u8, 0xad_u8, 0x1_u8, 0xa9_u8, 0x30_u8, 0x9_u8])
  struct IDynamicRenderer
    lpVtbl : IDynamicRendererVTbl*
  end

  struct IGestureRecognizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_max_stroke_count : UInt64
    put_max_stroke_count : UInt64
    enable_gestures : UInt64
    reset : UInt64
  end

  IGestureRecognizer_GUID = "ae9ef86b-7054-45e3-ae22-3174dc8811b7"
  IID_IGestureRecognizer = LibC::GUID.new(0xae9ef86b_u32, 0x7054_u16, 0x45e3_u16, StaticArray[0xae_u8, 0x22_u8, 0x31_u8, 0x74_u8, 0xdc_u8, 0x88_u8, 0x11_u8, 0xb7_u8])
  struct IGestureRecognizer
    lpVtbl : IGestureRecognizerVTbl*
  end

  struct ITipAutoCompleteProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    update_pending_text : UInt64
    show : UInt64
  end

  ITipAutoCompleteProvider_GUID = "7c6cf46d-8404-46b9-ad33-f5b6036d4007"
  IID_ITipAutoCompleteProvider = LibC::GUID.new(0x7c6cf46d_u32, 0x8404_u16, 0x46b9_u16, StaticArray[0xad_u8, 0x33_u8, 0xf5_u8, 0xb6_u8, 0x3_u8, 0x6d_u8, 0x40_u8, 0x7_u8])
  struct ITipAutoCompleteProvider
    lpVtbl : ITipAutoCompleteProviderVTbl*
  end

  struct ITipAutoCompleteClientVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_provider : UInt64
    unadvise_provider : UInt64
    user_selection : UInt64
    preferred_rects : UInt64
    request_show_ui : UInt64
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
  def get_top(units : Int32*) : HRESULT
    @lpVtbl.value.get_top.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_top(units : Int32) : HRESULT
    @lpVtbl.value.put_top.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_left(units : Int32*) : HRESULT
    @lpVtbl.value.get_left.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_left(units : Int32) : HRESULT
    @lpVtbl.value.put_left.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_bottom(units : Int32*) : HRESULT
    @lpVtbl.value.get_bottom.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_bottom(units : Int32) : HRESULT
    @lpVtbl.value.put_bottom.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_right(units : Int32*) : HRESULT
    @lpVtbl.value.get_right.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_right(units : Int32) : HRESULT
    @lpVtbl.value.put_right.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_data(rect : RECT*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(RECT*, HRESULT)).call(rect)
  end
  def put_data(rect : RECT) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(RECT, HRESULT)).call(rect)
  end
  def get_rectangle(top : Int32*, left : Int32*, bottom : Int32*, right : Int32*) : HRESULT
    @lpVtbl.value.get_rectangle.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(top, left, bottom, right)
  end
  def set_rectangle(top : Int32, left : Int32, bottom : Int32, right : Int32) : HRESULT
    @lpVtbl.value.set_rectangle.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(top, left, bottom, right)
  end
end
struct LibWin32::IInkExtendedProperty
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
  def get_guid(guid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(guid)
  end
  def get_data(data : VARIANT*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(VARIANT*, HRESULT)).call(data)
  end
  def put_data(data : VARIANT) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(VARIANT, HRESULT)).call(data)
  end
end
struct LibWin32::IInkExtendedProperties
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def item(identifier : VARIANT, item : IInkExtendedProperty*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(VARIANT, IInkExtendedProperty*, HRESULT)).call(identifier, item)
  end
  def add(guid : UInt8*, data : VARIANT, inkextendedproperty : IInkExtendedProperty*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, VARIANT, IInkExtendedProperty*, HRESULT)).call(guid, data, inkextendedproperty)
  end
  def remove(identifier : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(identifier)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def does_property_exist(guid : UInt8*, doespropertyexist : Int16*) : HRESULT
    @lpVtbl.value.does_property_exist.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(guid, doespropertyexist)
  end
end
struct LibWin32::IInkDrawingAttributes
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
  def get_color(currentcolor : Int32*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(Int32*, HRESULT)).call(currentcolor)
  end
  def put_color(newcolor : Int32) : HRESULT
    @lpVtbl.value.put_color.unsafe_as(Proc(Int32, HRESULT)).call(newcolor)
  end
  def get_width(currentwidth : Float32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Float32*, HRESULT)).call(currentwidth)
  end
  def put_width(newwidth : Float32) : HRESULT
    @lpVtbl.value.put_width.unsafe_as(Proc(Float32, HRESULT)).call(newwidth)
  end
  def get_height(currentheight : Float32*) : HRESULT
    @lpVtbl.value.get_height.unsafe_as(Proc(Float32*, HRESULT)).call(currentheight)
  end
  def put_height(newheight : Float32) : HRESULT
    @lpVtbl.value.put_height.unsafe_as(Proc(Float32, HRESULT)).call(newheight)
  end
  def get_fit_to_curve(flag : Int16*) : HRESULT
    @lpVtbl.value.get_fit_to_curve.unsafe_as(Proc(Int16*, HRESULT)).call(flag)
  end
  def put_fit_to_curve(flag : Int16) : HRESULT
    @lpVtbl.value.put_fit_to_curve.unsafe_as(Proc(Int16, HRESULT)).call(flag)
  end
  def get_ignore_pressure(flag : Int16*) : HRESULT
    @lpVtbl.value.get_ignore_pressure.unsafe_as(Proc(Int16*, HRESULT)).call(flag)
  end
  def put_ignore_pressure(flag : Int16) : HRESULT
    @lpVtbl.value.put_ignore_pressure.unsafe_as(Proc(Int16, HRESULT)).call(flag)
  end
  def get_anti_aliased(flag : Int16*) : HRESULT
    @lpVtbl.value.get_anti_aliased.unsafe_as(Proc(Int16*, HRESULT)).call(flag)
  end
  def put_anti_aliased(flag : Int16) : HRESULT
    @lpVtbl.value.put_anti_aliased.unsafe_as(Proc(Int16, HRESULT)).call(flag)
  end
  def get_transparency(currenttransparency : Int32*) : HRESULT
    @lpVtbl.value.get_transparency.unsafe_as(Proc(Int32*, HRESULT)).call(currenttransparency)
  end
  def put_transparency(newtransparency : Int32) : HRESULT
    @lpVtbl.value.put_transparency.unsafe_as(Proc(Int32, HRESULT)).call(newtransparency)
  end
  def get_raster_operation(currentrasteroperation : InkRasterOperation*) : HRESULT
    @lpVtbl.value.get_raster_operation.unsafe_as(Proc(InkRasterOperation*, HRESULT)).call(currentrasteroperation)
  end
  def put_raster_operation(newrasteroperation : InkRasterOperation) : HRESULT
    @lpVtbl.value.put_raster_operation.unsafe_as(Proc(InkRasterOperation, HRESULT)).call(newrasteroperation)
  end
  def get_pen_tip(currentpentip : InkPenTip*) : HRESULT
    @lpVtbl.value.get_pen_tip.unsafe_as(Proc(InkPenTip*, HRESULT)).call(currentpentip)
  end
  def put_pen_tip(newpentip : InkPenTip) : HRESULT
    @lpVtbl.value.put_pen_tip.unsafe_as(Proc(InkPenTip, HRESULT)).call(newpentip)
  end
  def get_extended_properties(properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.unsafe_as(Proc(IInkExtendedProperties*, HRESULT)).call(properties)
  end
  def clone(drawingattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(drawingattributes)
  end
end
struct LibWin32::IInkTransform
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
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def translate(horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.translate.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalcomponent, verticalcomponent)
  end
  def rotate(degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(degrees, x, y)
  end
  def reflect(horizontally : Int16, vertically : Int16) : HRESULT
    @lpVtbl.value.reflect.unsafe_as(Proc(Int16, Int16, HRESULT)).call(horizontally, vertically)
  end
  def shear(horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.shear.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalcomponent, verticalcomponent)
  end
  def scale_transform(horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalmultiplier, verticalmultiplier)
  end
  def get_transform(em11 : Float32*, em12 : Float32*, em21 : Float32*, em22 : Float32*, edx : Float32*, edy : Float32*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(Float32*, Float32*, Float32*, Float32*, Float32*, Float32*, HRESULT)).call(em11, em12, em21, em22, edx, edy)
  end
  def set_transform(em11 : Float32, em12 : Float32, em21 : Float32, em22 : Float32, edx : Float32, edy : Float32) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)).call(em11, em12, em21, em22, edx, edy)
  end
  def get_e_m11(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m11.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_m11(value : Float32) : HRESULT
    @lpVtbl.value.put_e_m11.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_e_m12(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m12.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_m12(value : Float32) : HRESULT
    @lpVtbl.value.put_e_m12.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_e_m21(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m21.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_m21(value : Float32) : HRESULT
    @lpVtbl.value.put_e_m21.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_e_m22(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_m22.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_m22(value : Float32) : HRESULT
    @lpVtbl.value.put_e_m22.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_e_dx(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_dx.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_dx(value : Float32) : HRESULT
    @lpVtbl.value.put_e_dx.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_e_dy(value : Float32*) : HRESULT
    @lpVtbl.value.get_e_dy.unsafe_as(Proc(Float32*, HRESULT)).call(value)
  end
  def put_e_dy(value : Float32) : HRESULT
    @lpVtbl.value.put_e_dy.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_data(xform : XFORM*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(XFORM*, HRESULT)).call(xform)
  end
  def put_data(xform : XFORM) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(XFORM, HRESULT)).call(xform)
  end
end
struct LibWin32::IInkGesture
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
  def get_confidence(confidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.unsafe_as(Proc(InkRecognitionConfidence*, HRESULT)).call(confidence)
  end
  def get_id(id : InkApplicationGesture*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(InkApplicationGesture*, HRESULT)).call(id)
  end
  def get_hot_point(x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.get_hot_point.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(x, y)
  end
end
struct LibWin32::IInkCursor
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
  def get_inverted(status : Int16*) : HRESULT
    @lpVtbl.value.get_inverted.unsafe_as(Proc(Int16*, HRESULT)).call(status)
  end
  def get_drawing_attributes(attributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(attributes)
  end
  def putref_drawing_attributes(attributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(attributes)
  end
  def get_tablet(tablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(tablet)
  end
  def get_buttons(buttons : IInkCursorButtons*) : HRESULT
    @lpVtbl.value.get_buttons.unsafe_as(Proc(IInkCursorButtons*, HRESULT)).call(buttons)
  end
end
struct LibWin32::IInkCursors
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def item(index : Int32, cursor : IInkCursor*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkCursor*, HRESULT)).call(index, cursor)
  end
end
struct LibWin32::IInkCursorButton
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
  def get_id(id : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(id)
  end
  def get_state(currentstate : InkCursorButtonState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(InkCursorButtonState*, HRESULT)).call(currentstate)
  end
end
struct LibWin32::IInkCursorButtons
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def item(identifier : VARIANT, button : IInkCursorButton*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(VARIANT, IInkCursorButton*, HRESULT)).call(identifier, button)
  end
end
struct LibWin32::IInkTablet
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
  def get_plug_and_play_id(id : UInt8**) : HRESULT
    @lpVtbl.value.get_plug_and_play_id.unsafe_as(Proc(UInt8**, HRESULT)).call(id)
  end
  def get_maximum_input_rectangle(rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_maximum_input_rectangle.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(rectangle)
  end
  def get_hardware_capabilities(capabilities : TabletHardwareCapabilities*) : HRESULT
    @lpVtbl.value.get_hardware_capabilities.unsafe_as(Proc(TabletHardwareCapabilities*, HRESULT)).call(capabilities)
  end
  def is_packet_property_supported(packetpropertyname : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_packet_property_supported.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(packetpropertyname, supported)
  end
  def get_property_metrics(propertyname : UInt8*, minimum : Int32*, maximum : Int32*, units : TabletPropertyMetricUnit*, resolution : Float32*) : HRESULT
    @lpVtbl.value.get_property_metrics.unsafe_as(Proc(UInt8*, Int32*, Int32*, TabletPropertyMetricUnit*, Float32*, HRESULT)).call(propertyname, minimum, maximum, units, resolution)
  end
end
struct LibWin32::IInkTablet2
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
  def get_device_kind(kind : TabletDeviceKind*) : HRESULT
    @lpVtbl.value.get_device_kind.unsafe_as(Proc(TabletDeviceKind*, HRESULT)).call(kind)
  end
end
struct LibWin32::IInkTablet3
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
  def get_is_multi_touch(pismultitouch : Int16*) : HRESULT
    @lpVtbl.value.get_is_multi_touch.unsafe_as(Proc(Int16*, HRESULT)).call(pismultitouch)
  end
  def get_maximum_cursors(pmaximumcursors : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_cursors.unsafe_as(Proc(UInt32*, HRESULT)).call(pmaximumcursors)
  end
end
struct LibWin32::IInkTablets
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def get_default_tablet(defaulttablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_default_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(defaulttablet)
  end
  def item(index : Int32, tablet : IInkTablet*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkTablet*, HRESULT)).call(index, tablet)
  end
  def is_packet_property_supported(packetpropertyname : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_packet_property_supported.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(packetpropertyname, supported)
  end
end
struct LibWin32::IInkStrokeDisp
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
  def get_id(id : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(id)
  end
  def get_bezier_points(points : VARIANT*) : HRESULT
    @lpVtbl.value.get_bezier_points.unsafe_as(Proc(VARIANT*, HRESULT)).call(points)
  end
  def get_drawing_attributes(drawattrs : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(drawattrs)
  end
  def putref_drawing_attributes(drawattrs : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(drawattrs)
  end
  def get_ink(ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ink)
  end
  def get_extended_properties(properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.unsafe_as(Proc(IInkExtendedProperties*, HRESULT)).call(properties)
  end
  def get_polyline_cusps(cusps : VARIANT*) : HRESULT
    @lpVtbl.value.get_polyline_cusps.unsafe_as(Proc(VARIANT*, HRESULT)).call(cusps)
  end
  def get_bezier_cusps(cusps : VARIANT*) : HRESULT
    @lpVtbl.value.get_bezier_cusps.unsafe_as(Proc(VARIANT*, HRESULT)).call(cusps)
  end
  def get_self_intersections(intersections : VARIANT*) : HRESULT
    @lpVtbl.value.get_self_intersections.unsafe_as(Proc(VARIANT*, HRESULT)).call(intersections)
  end
  def get_packet_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_packet_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_packet_size(plsize : Int32*) : HRESULT
    @lpVtbl.value.get_packet_size.unsafe_as(Proc(Int32*, HRESULT)).call(plsize)
  end
  def get_packet_description(packetdescription : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_description.unsafe_as(Proc(VARIANT*, HRESULT)).call(packetdescription)
  end
  def get_deleted(deleted : Int16*) : HRESULT
    @lpVtbl.value.get_deleted.unsafe_as(Proc(Int16*, HRESULT)).call(deleted)
  end
  def get_bounding_box(boundingboxmode : InkBoundingBoxMode, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.unsafe_as(Proc(InkBoundingBoxMode, IInkRectangle*, HRESULT)).call(boundingboxmode, rectangle)
  end
  def find_intersections(strokes : IInkStrokes, intersections : VARIANT*) : HRESULT
    @lpVtbl.value.find_intersections.unsafe_as(Proc(IInkStrokes, VARIANT*, HRESULT)).call(strokes, intersections)
  end
  def get_rectangle_intersections(rectangle : IInkRectangle, intersections : VARIANT*) : HRESULT
    @lpVtbl.value.get_rectangle_intersections.unsafe_as(Proc(IInkRectangle, VARIANT*, HRESULT)).call(rectangle, intersections)
  end
  def clip(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def hit_test_circle(x : Int32, y : Int32, radius : Float32, intersects : Int16*) : HRESULT
    @lpVtbl.value.hit_test_circle.unsafe_as(Proc(Int32, Int32, Float32, Int16*, HRESULT)).call(x, y, radius, intersects)
  end
  def nearest_point(x : Int32, y : Int32, distance : Float32*, point : Float32*) : HRESULT
    @lpVtbl.value.nearest_point.unsafe_as(Proc(Int32, Int32, Float32*, Float32*, HRESULT)).call(x, y, distance, point)
  end
  def split(splitat : Float32, newstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.split.unsafe_as(Proc(Float32, IInkStrokeDisp*, HRESULT)).call(splitat, newstroke)
  end
  def get_packet_description_property_metrics(propertyname : UInt8*, minimum : Int32*, maximum : Int32*, units : TabletPropertyMetricUnit*, resolution : Float32*) : HRESULT
    @lpVtbl.value.get_packet_description_property_metrics.unsafe_as(Proc(UInt8*, Int32*, Int32*, TabletPropertyMetricUnit*, Float32*, HRESULT)).call(propertyname, minimum, maximum, units, resolution)
  end
  def get_points(index : Int32, count : Int32, points : VARIANT*) : HRESULT
    @lpVtbl.value.get_points.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(index, count, points)
  end
  def set_points(points : VARIANT, index : Int32, count : Int32, numberofpointsset : Int32*) : HRESULT
    @lpVtbl.value.set_points.unsafe_as(Proc(VARIANT, Int32, Int32, Int32*, HRESULT)).call(points, index, count, numberofpointsset)
  end
  def get_packet_data(index : Int32, count : Int32, packetdata : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_data.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(index, count, packetdata)
  end
  def get_packet_values_by_property(propertyname : UInt8*, index : Int32, count : Int32, packetvalues : VARIANT*) : HRESULT
    @lpVtbl.value.get_packet_values_by_property.unsafe_as(Proc(UInt8*, Int32, Int32, VARIANT*, HRESULT)).call(propertyname, index, count, packetvalues)
  end
  def set_packet_values_by_property(bstrpropertyname : UInt8*, packetvalues : VARIANT, index : Int32, count : Int32, numberofpacketsset : Int32*) : HRESULT
    @lpVtbl.value.set_packet_values_by_property.unsafe_as(Proc(UInt8*, VARIANT, Int32, Int32, Int32*, HRESULT)).call(bstrpropertyname, packetvalues, index, count, numberofpacketsset)
  end
  def get_flattened_bezier_points(fittingerror : Int32, flattenedbezierpoints : VARIANT*) : HRESULT
    @lpVtbl.value.get_flattened_bezier_points.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(fittingerror, flattenedbezierpoints)
  end
  def transform(transform : IInkTransform, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.transform.unsafe_as(Proc(IInkTransform, Int16, HRESULT)).call(transform, applyonpenwidth)
  end
  def scale_to_rectangle(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.scale_to_rectangle.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def move(horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalcomponent, verticalcomponent)
  end
  def rotate(degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(degrees, x, y)
  end
  def shear(horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.shear.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalmultiplier, verticalmultiplier)
  end
  def scale_transform(horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalmultiplier, verticalmultiplier)
  end
end
struct LibWin32::IInkStrokes
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def get_ink(ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ink)
  end
  def get_recognition_result(recognitionresult : IInkRecognitionResult*) : HRESULT
    @lpVtbl.value.get_recognition_result.unsafe_as(Proc(IInkRecognitionResult*, HRESULT)).call(recognitionresult)
  end
  def to_string(tostring : UInt8**) : HRESULT
    @lpVtbl.value.to_string.unsafe_as(Proc(UInt8**, HRESULT)).call(tostring)
  end
  def item(index : Int32, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkStrokeDisp*, HRESULT)).call(index, stroke)
  end
  def add(inkstroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IInkStrokeDisp, HRESULT)).call(inkstroke)
  end
  def add_strokes(inkstrokes : IInkStrokes) : HRESULT
    @lpVtbl.value.add_strokes.unsafe_as(Proc(IInkStrokes, HRESULT)).call(inkstrokes)
  end
  def remove(inkstroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(IInkStrokeDisp, HRESULT)).call(inkstroke)
  end
  def remove_strokes(inkstrokes : IInkStrokes) : HRESULT
    @lpVtbl.value.remove_strokes.unsafe_as(Proc(IInkStrokes, HRESULT)).call(inkstrokes)
  end
  def modify_drawing_attributes(drawattrs : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.modify_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(drawattrs)
  end
  def get_bounding_box(boundingboxmode : InkBoundingBoxMode, boundingbox : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.unsafe_as(Proc(InkBoundingBoxMode, IInkRectangle*, HRESULT)).call(boundingboxmode, boundingbox)
  end
  def transform(transform : IInkTransform, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.transform.unsafe_as(Proc(IInkTransform, Int16, HRESULT)).call(transform, applyonpenwidth)
  end
  def scale_to_rectangle(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.scale_to_rectangle.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def move(horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalcomponent, verticalcomponent)
  end
  def rotate(degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(degrees, x, y)
  end
  def shear(horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.shear.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalmultiplier, verticalmultiplier)
  end
  def scale_transform(horizontalmultiplier : Float32, verticalmultiplier : Float32) : HRESULT
    @lpVtbl.value.scale_transform.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalmultiplier, verticalmultiplier)
  end
  def clip(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def remove_recognition_result : HRESULT
    @lpVtbl.value.remove_recognition_result.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInkCustomStrokes
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def item(identifier : VARIANT, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(VARIANT, IInkStrokes*, HRESULT)).call(identifier, strokes)
  end
  def add(name : UInt8*, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, IInkStrokes, HRESULT)).call(name, strokes)
  end
  def remove(identifier : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(identifier)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IIInkStrokesEvents
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
struct LibWin32::IInkDisp
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
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def get_extended_properties(properties : IInkExtendedProperties*) : HRESULT
    @lpVtbl.value.get_extended_properties.unsafe_as(Proc(IInkExtendedProperties*, HRESULT)).call(properties)
  end
  def get_dirty(dirty : Int16*) : HRESULT
    @lpVtbl.value.get_dirty.unsafe_as(Proc(Int16*, HRESULT)).call(dirty)
  end
  def put_dirty(dirty : Int16) : HRESULT
    @lpVtbl.value.put_dirty.unsafe_as(Proc(Int16, HRESULT)).call(dirty)
  end
  def get_custom_strokes(ppunkinkcustomstrokes : IInkCustomStrokes*) : HRESULT
    @lpVtbl.value.get_custom_strokes.unsafe_as(Proc(IInkCustomStrokes*, HRESULT)).call(ppunkinkcustomstrokes)
  end
  def get_bounding_box(boundingboxmode : InkBoundingBoxMode, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_bounding_box.unsafe_as(Proc(InkBoundingBoxMode, IInkRectangle*, HRESULT)).call(boundingboxmode, rectangle)
  end
  def delete_strokes(strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.delete_strokes.unsafe_as(Proc(IInkStrokes, HRESULT)).call(strokes)
  end
  def delete_stroke(stroke : IInkStrokeDisp) : HRESULT
    @lpVtbl.value.delete_stroke.unsafe_as(Proc(IInkStrokeDisp, HRESULT)).call(stroke)
  end
  def extract_strokes(strokes : IInkStrokes, extractflags : InkExtractFlags, extractedink : IInkDisp*) : HRESULT
    @lpVtbl.value.extract_strokes.unsafe_as(Proc(IInkStrokes, InkExtractFlags, IInkDisp*, HRESULT)).call(strokes, extractflags, extractedink)
  end
  def extract_with_rectangle(rectangle : IInkRectangle, extractflags : InkExtractFlags, extractedink : IInkDisp*) : HRESULT
    @lpVtbl.value.extract_with_rectangle.unsafe_as(Proc(IInkRectangle, InkExtractFlags, IInkDisp*, HRESULT)).call(rectangle, extractflags, extractedink)
  end
  def clip(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.clip.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def clone(newink : IInkDisp*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IInkDisp*, HRESULT)).call(newink)
  end
  def hit_test_circle(x : Int32, y : Int32, radius : Float32, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_circle.unsafe_as(Proc(Int32, Int32, Float32, IInkStrokes*, HRESULT)).call(x, y, radius, strokes)
  end
  def hit_test_with_rectangle(selectionrectangle : IInkRectangle, intersectpercent : Float32, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_with_rectangle.unsafe_as(Proc(IInkRectangle, Float32, IInkStrokes*, HRESULT)).call(selectionrectangle, intersectpercent, strokes)
  end
  def hit_test_with_lasso(points : VARIANT, intersectpercent : Float32, lassopoints : VARIANT*, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.hit_test_with_lasso.unsafe_as(Proc(VARIANT, Float32, VARIANT*, IInkStrokes*, HRESULT)).call(points, intersectpercent, lassopoints, strokes)
  end
  def nearest_point(x : Int32, y : Int32, pointonstroke : Float32*, distancefrompacket : Float32*, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.nearest_point.unsafe_as(Proc(Int32, Int32, Float32*, Float32*, IInkStrokeDisp*, HRESULT)).call(x, y, pointonstroke, distancefrompacket, stroke)
  end
  def create_strokes(strokeids : VARIANT, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.create_strokes.unsafe_as(Proc(VARIANT, IInkStrokes*, HRESULT)).call(strokeids, strokes)
  end
  def add_strokes_at_rectangle(sourcestrokes : IInkStrokes, targetrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.add_strokes_at_rectangle.unsafe_as(Proc(IInkStrokes, IInkRectangle, HRESULT)).call(sourcestrokes, targetrectangle)
  end
  def save(persistenceformat : InkPersistenceFormat, compressionmode : InkPersistenceCompressionMode, data : VARIANT*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(InkPersistenceFormat, InkPersistenceCompressionMode, VARIANT*, HRESULT)).call(persistenceformat, compressionmode, data)
  end
  def load(data : VARIANT) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(VARIANT, HRESULT)).call(data)
  end
  def create_stroke(packetdata : VARIANT, packetdescription : VARIANT, stroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.create_stroke.unsafe_as(Proc(VARIANT, VARIANT, IInkStrokeDisp*, HRESULT)).call(packetdata, packetdescription, stroke)
  end
  def clipboard_copy_with_rectangle(rectangle : IInkRectangle, clipboardformats : InkClipboardFormats, clipboardmodes : InkClipboardModes, dataobject : IDataObject*) : HRESULT
    @lpVtbl.value.clipboard_copy_with_rectangle.unsafe_as(Proc(IInkRectangle, InkClipboardFormats, InkClipboardModes, IDataObject*, HRESULT)).call(rectangle, clipboardformats, clipboardmodes, dataobject)
  end
  def clipboard_copy(strokes : IInkStrokes, clipboardformats : InkClipboardFormats, clipboardmodes : InkClipboardModes, dataobject : IDataObject*) : HRESULT
    @lpVtbl.value.clipboard_copy.unsafe_as(Proc(IInkStrokes, InkClipboardFormats, InkClipboardModes, IDataObject*, HRESULT)).call(strokes, clipboardformats, clipboardmodes, dataobject)
  end
  def can_paste(dataobject : IDataObject, canpaste : Int16*) : HRESULT
    @lpVtbl.value.can_paste.unsafe_as(Proc(IDataObject, Int16*, HRESULT)).call(dataobject, canpaste)
  end
  def clipboard_paste(x : Int32, y : Int32, dataobject : IDataObject, strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.clipboard_paste.unsafe_as(Proc(Int32, Int32, IDataObject, IInkStrokes*, HRESULT)).call(x, y, dataobject, strokes)
  end
end
struct LibWin32::IIInkEvents
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
struct LibWin32::IInkRenderer
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
  def get_view_transform(viewtransform : IInkTransform) : HRESULT
    @lpVtbl.value.get_view_transform.unsafe_as(Proc(IInkTransform, HRESULT)).call(viewtransform)
  end
  def set_view_transform(viewtransform : IInkTransform) : HRESULT
    @lpVtbl.value.set_view_transform.unsafe_as(Proc(IInkTransform, HRESULT)).call(viewtransform)
  end
  def get_object_transform(objecttransform : IInkTransform) : HRESULT
    @lpVtbl.value.get_object_transform.unsafe_as(Proc(IInkTransform, HRESULT)).call(objecttransform)
  end
  def set_object_transform(objecttransform : IInkTransform) : HRESULT
    @lpVtbl.value.set_object_transform.unsafe_as(Proc(IInkTransform, HRESULT)).call(objecttransform)
  end
  def draw(hdc : LibC::IntPtrT, strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.draw.unsafe_as(Proc(LibC::IntPtrT, IInkStrokes, HRESULT)).call(hdc, strokes)
  end
  def draw_stroke(hdc : LibC::IntPtrT, stroke : IInkStrokeDisp, drawingattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.draw_stroke.unsafe_as(Proc(LibC::IntPtrT, IInkStrokeDisp, IInkDrawingAttributes, HRESULT)).call(hdc, stroke, drawingattributes)
  end
  def pixel_to_ink_space(hdc : LibC::IntPtrT, x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.pixel_to_ink_space.unsafe_as(Proc(LibC::IntPtrT, Int32*, Int32*, HRESULT)).call(hdc, x, y)
  end
  def ink_space_to_pixel(hdcdisplay : LibC::IntPtrT, x : Int32*, y : Int32*) : HRESULT
    @lpVtbl.value.ink_space_to_pixel.unsafe_as(Proc(LibC::IntPtrT, Int32*, Int32*, HRESULT)).call(hdcdisplay, x, y)
  end
  def pixel_to_ink_space_from_points(hdc : LibC::IntPtrT, points : VARIANT*) : HRESULT
    @lpVtbl.value.pixel_to_ink_space_from_points.unsafe_as(Proc(LibC::IntPtrT, VARIANT*, HRESULT)).call(hdc, points)
  end
  def ink_space_to_pixel_from_points(hdc : LibC::IntPtrT, points : VARIANT*) : HRESULT
    @lpVtbl.value.ink_space_to_pixel_from_points.unsafe_as(Proc(LibC::IntPtrT, VARIANT*, HRESULT)).call(hdc, points)
  end
  def measure(strokes : IInkStrokes, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.measure.unsafe_as(Proc(IInkStrokes, IInkRectangle*, HRESULT)).call(strokes, rectangle)
  end
  def measure_stroke(stroke : IInkStrokeDisp, drawingattributes : IInkDrawingAttributes, rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.measure_stroke.unsafe_as(Proc(IInkStrokeDisp, IInkDrawingAttributes, IInkRectangle*, HRESULT)).call(stroke, drawingattributes, rectangle)
  end
  def move(horizontalcomponent : Float32, verticalcomponent : Float32) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float32, Float32, HRESULT)).call(horizontalcomponent, verticalcomponent)
  end
  def rotate(degrees : Float32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(degrees, x, y)
  end
  def scale_transform(horizontalmultiplier : Float32, verticalmultiplier : Float32, applyonpenwidth : Int16) : HRESULT
    @lpVtbl.value.scale_transform.unsafe_as(Proc(Float32, Float32, Int16, HRESULT)).call(horizontalmultiplier, verticalmultiplier, applyonpenwidth)
  end
end
struct LibWin32::IInkCollector
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
  def get_h_wnd(currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(currentwindow)
  end
  def put_h_wnd(newwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.put_h_wnd.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(newwindow)
  end
  def get_enabled(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def put_enabled(collecting : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(collecting)
  end
  def get_default_drawing_attributes(currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(currentattributes)
  end
  def putref_default_drawing_attributes(newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(newattributes)
  end
  def get_renderer(currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.unsafe_as(Proc(IInkRenderer*, HRESULT)).call(currentinkrenderer)
  end
  def putref_renderer(newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.unsafe_as(Proc(IInkRenderer, HRESULT)).call(newinkrenderer)
  end
  def get_ink(ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ink)
  end
  def putref_ink(newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.unsafe_as(Proc(IInkDisp, HRESULT)).call(newink)
  end
  def get_auto_redraw(autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.unsafe_as(Proc(Int16*, HRESULT)).call(autoredraw)
  end
  def put_auto_redraw(autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.unsafe_as(Proc(Int16, HRESULT)).call(autoredraw)
  end
  def get_collecting_ink(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def get_collection_mode(mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.unsafe_as(Proc(InkCollectionMode*, HRESULT)).call(mode)
  end
  def put_collection_mode(mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.unsafe_as(Proc(InkCollectionMode, HRESULT)).call(mode)
  end
  def get_dynamic_rendering(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_dynamic_rendering(enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_desired_packet_description(packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.unsafe_as(Proc(VARIANT*, HRESULT)).call(packetguids)
  end
  def put_desired_packet_description(packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.unsafe_as(Proc(VARIANT, HRESULT)).call(packetguids)
  end
  def get_mouse_icon(mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(mouseicon)
  end
  def put_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def putref_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def get_mouse_pointer(mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.unsafe_as(Proc(InkMousePointer*, HRESULT)).call(mousepointer)
  end
  def put_mouse_pointer(mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.unsafe_as(Proc(InkMousePointer, HRESULT)).call(mousepointer)
  end
  def get_cursors(cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.unsafe_as(Proc(IInkCursors*, HRESULT)).call(cursors)
  end
  def get_margin_x(marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.unsafe_as(Proc(Int32*, HRESULT)).call(marginx)
  end
  def put_margin_x(marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.unsafe_as(Proc(Int32, HRESULT)).call(marginx)
  end
  def get_margin_y(marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.unsafe_as(Proc(Int32*, HRESULT)).call(marginy)
  end
  def put_margin_y(marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.unsafe_as(Proc(Int32, HRESULT)).call(marginy)
  end
  def get_tablet(singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(singletablet)
  end
  def get_support_high_contrast_ink(support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.unsafe_as(Proc(Int16*, HRESULT)).call(support)
  end
  def put_support_high_contrast_ink(support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.unsafe_as(Proc(Int16, HRESULT)).call(support)
  end
  def set_gesture_status(gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16, HRESULT)).call(gesture, listen)
  end
  def get_gesture_status(gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16*, HRESULT)).call(gesture, listening)
  end
  def get_window_input_rectangle(windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(windowinputrectangle)
  end
  def set_window_input_rectangle(windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.unsafe_as(Proc(IInkRectangle, HRESULT)).call(windowinputrectangle)
  end
  def set_all_tablets_mode(usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.unsafe_as(Proc(Int16, HRESULT)).call(usemouseforinput)
  end
  def set_single_tablet_integrated_mode(tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.unsafe_as(Proc(IInkTablet, HRESULT)).call(tablet)
  end
  def get_event_interest(eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16*, HRESULT)).call(eventid, listen)
  end
  def set_event_interest(eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16, HRESULT)).call(eventid, listen)
  end
end
struct LibWin32::IIInkCollectorEvents
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
struct LibWin32::IInkOverlay
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
  def get_h_wnd(currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(currentwindow)
  end
  def put_h_wnd(newwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.put_h_wnd.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(newwindow)
  end
  def get_enabled(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def put_enabled(collecting : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(collecting)
  end
  def get_default_drawing_attributes(currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(currentattributes)
  end
  def putref_default_drawing_attributes(newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(newattributes)
  end
  def get_renderer(currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.unsafe_as(Proc(IInkRenderer*, HRESULT)).call(currentinkrenderer)
  end
  def putref_renderer(newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.unsafe_as(Proc(IInkRenderer, HRESULT)).call(newinkrenderer)
  end
  def get_ink(ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ink)
  end
  def putref_ink(newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.unsafe_as(Proc(IInkDisp, HRESULT)).call(newink)
  end
  def get_auto_redraw(autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.unsafe_as(Proc(Int16*, HRESULT)).call(autoredraw)
  end
  def put_auto_redraw(autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.unsafe_as(Proc(Int16, HRESULT)).call(autoredraw)
  end
  def get_collecting_ink(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def get_collection_mode(mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.unsafe_as(Proc(InkCollectionMode*, HRESULT)).call(mode)
  end
  def put_collection_mode(mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.unsafe_as(Proc(InkCollectionMode, HRESULT)).call(mode)
  end
  def get_dynamic_rendering(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_dynamic_rendering(enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_desired_packet_description(packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.unsafe_as(Proc(VARIANT*, HRESULT)).call(packetguids)
  end
  def put_desired_packet_description(packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.unsafe_as(Proc(VARIANT, HRESULT)).call(packetguids)
  end
  def get_mouse_icon(mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(mouseicon)
  end
  def put_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def putref_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def get_mouse_pointer(mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.unsafe_as(Proc(InkMousePointer*, HRESULT)).call(mousepointer)
  end
  def put_mouse_pointer(mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.unsafe_as(Proc(InkMousePointer, HRESULT)).call(mousepointer)
  end
  def get_editing_mode(editingmode : InkOverlayEditingMode*) : HRESULT
    @lpVtbl.value.get_editing_mode.unsafe_as(Proc(InkOverlayEditingMode*, HRESULT)).call(editingmode)
  end
  def put_editing_mode(editingmode : InkOverlayEditingMode) : HRESULT
    @lpVtbl.value.put_editing_mode.unsafe_as(Proc(InkOverlayEditingMode, HRESULT)).call(editingmode)
  end
  def get_selection(selection : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(selection)
  end
  def put_selection(selection : IInkStrokes) : HRESULT
    @lpVtbl.value.put_selection.unsafe_as(Proc(IInkStrokes, HRESULT)).call(selection)
  end
  def get_eraser_mode(erasermode : InkOverlayEraserMode*) : HRESULT
    @lpVtbl.value.get_eraser_mode.unsafe_as(Proc(InkOverlayEraserMode*, HRESULT)).call(erasermode)
  end
  def put_eraser_mode(erasermode : InkOverlayEraserMode) : HRESULT
    @lpVtbl.value.put_eraser_mode.unsafe_as(Proc(InkOverlayEraserMode, HRESULT)).call(erasermode)
  end
  def get_eraser_width(eraserwidth : Int32*) : HRESULT
    @lpVtbl.value.get_eraser_width.unsafe_as(Proc(Int32*, HRESULT)).call(eraserwidth)
  end
  def put_eraser_width(neweraserwidth : Int32) : HRESULT
    @lpVtbl.value.put_eraser_width.unsafe_as(Proc(Int32, HRESULT)).call(neweraserwidth)
  end
  def get_attach_mode(attachmode : InkOverlayAttachMode*) : HRESULT
    @lpVtbl.value.get_attach_mode.unsafe_as(Proc(InkOverlayAttachMode*, HRESULT)).call(attachmode)
  end
  def put_attach_mode(attachmode : InkOverlayAttachMode) : HRESULT
    @lpVtbl.value.put_attach_mode.unsafe_as(Proc(InkOverlayAttachMode, HRESULT)).call(attachmode)
  end
  def get_cursors(cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.unsafe_as(Proc(IInkCursors*, HRESULT)).call(cursors)
  end
  def get_margin_x(marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.unsafe_as(Proc(Int32*, HRESULT)).call(marginx)
  end
  def put_margin_x(marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.unsafe_as(Proc(Int32, HRESULT)).call(marginx)
  end
  def get_margin_y(marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.unsafe_as(Proc(Int32*, HRESULT)).call(marginy)
  end
  def put_margin_y(marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.unsafe_as(Proc(Int32, HRESULT)).call(marginy)
  end
  def get_tablet(singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(singletablet)
  end
  def get_support_high_contrast_ink(support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.unsafe_as(Proc(Int16*, HRESULT)).call(support)
  end
  def put_support_high_contrast_ink(support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.unsafe_as(Proc(Int16, HRESULT)).call(support)
  end
  def get_support_high_contrast_selection_ui(support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_selection_ui.unsafe_as(Proc(Int16*, HRESULT)).call(support)
  end
  def put_support_high_contrast_selection_ui(support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_selection_ui.unsafe_as(Proc(Int16, HRESULT)).call(support)
  end
  def hit_test_selection(x : Int32, y : Int32, selarea : SelectionHitResult*) : HRESULT
    @lpVtbl.value.hit_test_selection.unsafe_as(Proc(Int32, Int32, SelectionHitResult*, HRESULT)).call(x, y, selarea)
  end
  def draw(rect : IInkRectangle) : HRESULT
    @lpVtbl.value.draw.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rect)
  end
  def set_gesture_status(gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16, HRESULT)).call(gesture, listen)
  end
  def get_gesture_status(gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16*, HRESULT)).call(gesture, listening)
  end
  def get_window_input_rectangle(windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(windowinputrectangle)
  end
  def set_window_input_rectangle(windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.unsafe_as(Proc(IInkRectangle, HRESULT)).call(windowinputrectangle)
  end
  def set_all_tablets_mode(usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.unsafe_as(Proc(Int16, HRESULT)).call(usemouseforinput)
  end
  def set_single_tablet_integrated_mode(tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.unsafe_as(Proc(IInkTablet, HRESULT)).call(tablet)
  end
  def get_event_interest(eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16*, HRESULT)).call(eventid, listen)
  end
  def set_event_interest(eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16, HRESULT)).call(eventid, listen)
  end
end
struct LibWin32::IIInkOverlayEvents
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
struct LibWin32::IInkPicture
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
  def get_h_wnd(currentwindow : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_h_wnd.unsafe_as(Proc(LibC::IntPtrT*, HRESULT)).call(currentwindow)
  end
  def get_default_drawing_attributes(currentattributes : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(currentattributes)
  end
  def putref_default_drawing_attributes(newattributes : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_default_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(newattributes)
  end
  def get_renderer(currentinkrenderer : IInkRenderer*) : HRESULT
    @lpVtbl.value.get_renderer.unsafe_as(Proc(IInkRenderer*, HRESULT)).call(currentinkrenderer)
  end
  def putref_renderer(newinkrenderer : IInkRenderer) : HRESULT
    @lpVtbl.value.putref_renderer.unsafe_as(Proc(IInkRenderer, HRESULT)).call(newinkrenderer)
  end
  def get_ink(ink : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ink)
  end
  def putref_ink(newink : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.unsafe_as(Proc(IInkDisp, HRESULT)).call(newink)
  end
  def get_auto_redraw(autoredraw : Int16*) : HRESULT
    @lpVtbl.value.get_auto_redraw.unsafe_as(Proc(Int16*, HRESULT)).call(autoredraw)
  end
  def put_auto_redraw(autoredraw : Int16) : HRESULT
    @lpVtbl.value.put_auto_redraw.unsafe_as(Proc(Int16, HRESULT)).call(autoredraw)
  end
  def get_collecting_ink(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_collecting_ink.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def get_collection_mode(mode : InkCollectionMode*) : HRESULT
    @lpVtbl.value.get_collection_mode.unsafe_as(Proc(InkCollectionMode*, HRESULT)).call(mode)
  end
  def put_collection_mode(mode : InkCollectionMode) : HRESULT
    @lpVtbl.value.put_collection_mode.unsafe_as(Proc(InkCollectionMode, HRESULT)).call(mode)
  end
  def get_dynamic_rendering(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_dynamic_rendering.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_dynamic_rendering(enabled : Int16) : HRESULT
    @lpVtbl.value.put_dynamic_rendering.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_desired_packet_description(packetguids : VARIANT*) : HRESULT
    @lpVtbl.value.get_desired_packet_description.unsafe_as(Proc(VARIANT*, HRESULT)).call(packetguids)
  end
  def put_desired_packet_description(packetguids : VARIANT) : HRESULT
    @lpVtbl.value.put_desired_packet_description.unsafe_as(Proc(VARIANT, HRESULT)).call(packetguids)
  end
  def get_mouse_icon(mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(mouseicon)
  end
  def put_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def putref_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def get_mouse_pointer(mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.unsafe_as(Proc(InkMousePointer*, HRESULT)).call(mousepointer)
  end
  def put_mouse_pointer(mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.unsafe_as(Proc(InkMousePointer, HRESULT)).call(mousepointer)
  end
  def get_editing_mode(editingmode : InkOverlayEditingMode*) : HRESULT
    @lpVtbl.value.get_editing_mode.unsafe_as(Proc(InkOverlayEditingMode*, HRESULT)).call(editingmode)
  end
  def put_editing_mode(editingmode : InkOverlayEditingMode) : HRESULT
    @lpVtbl.value.put_editing_mode.unsafe_as(Proc(InkOverlayEditingMode, HRESULT)).call(editingmode)
  end
  def get_selection(selection : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(selection)
  end
  def put_selection(selection : IInkStrokes) : HRESULT
    @lpVtbl.value.put_selection.unsafe_as(Proc(IInkStrokes, HRESULT)).call(selection)
  end
  def get_eraser_mode(erasermode : InkOverlayEraserMode*) : HRESULT
    @lpVtbl.value.get_eraser_mode.unsafe_as(Proc(InkOverlayEraserMode*, HRESULT)).call(erasermode)
  end
  def put_eraser_mode(erasermode : InkOverlayEraserMode) : HRESULT
    @lpVtbl.value.put_eraser_mode.unsafe_as(Proc(InkOverlayEraserMode, HRESULT)).call(erasermode)
  end
  def get_eraser_width(eraserwidth : Int32*) : HRESULT
    @lpVtbl.value.get_eraser_width.unsafe_as(Proc(Int32*, HRESULT)).call(eraserwidth)
  end
  def put_eraser_width(neweraserwidth : Int32) : HRESULT
    @lpVtbl.value.put_eraser_width.unsafe_as(Proc(Int32, HRESULT)).call(neweraserwidth)
  end
  def putref_picture(ppicture : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_picture.unsafe_as(Proc(IPictureDisp, HRESULT)).call(ppicture)
  end
  def put_picture(ppicture : IPictureDisp) : HRESULT
    @lpVtbl.value.put_picture.unsafe_as(Proc(IPictureDisp, HRESULT)).call(ppicture)
  end
  def get_picture(pppicture : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_picture.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(pppicture)
  end
  def put_size_mode(smnewsizemode : InkPictureSizeMode) : HRESULT
    @lpVtbl.value.put_size_mode.unsafe_as(Proc(InkPictureSizeMode, HRESULT)).call(smnewsizemode)
  end
  def get_size_mode(smsizemode : InkPictureSizeMode*) : HRESULT
    @lpVtbl.value.get_size_mode.unsafe_as(Proc(InkPictureSizeMode*, HRESULT)).call(smsizemode)
  end
  def put_back_color(newcolor : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.unsafe_as(Proc(UInt32, HRESULT)).call(newcolor)
  end
  def get_back_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def get_cursors(cursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_cursors.unsafe_as(Proc(IInkCursors*, HRESULT)).call(cursors)
  end
  def get_margin_x(marginx : Int32*) : HRESULT
    @lpVtbl.value.get_margin_x.unsafe_as(Proc(Int32*, HRESULT)).call(marginx)
  end
  def put_margin_x(marginx : Int32) : HRESULT
    @lpVtbl.value.put_margin_x.unsafe_as(Proc(Int32, HRESULT)).call(marginx)
  end
  def get_margin_y(marginy : Int32*) : HRESULT
    @lpVtbl.value.get_margin_y.unsafe_as(Proc(Int32*, HRESULT)).call(marginy)
  end
  def put_margin_y(marginy : Int32) : HRESULT
    @lpVtbl.value.put_margin_y.unsafe_as(Proc(Int32, HRESULT)).call(marginy)
  end
  def get_tablet(singletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(singletablet)
  end
  def get_support_high_contrast_ink(support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_ink.unsafe_as(Proc(Int16*, HRESULT)).call(support)
  end
  def put_support_high_contrast_ink(support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_ink.unsafe_as(Proc(Int16, HRESULT)).call(support)
  end
  def get_support_high_contrast_selection_ui(support : Int16*) : HRESULT
    @lpVtbl.value.get_support_high_contrast_selection_ui.unsafe_as(Proc(Int16*, HRESULT)).call(support)
  end
  def put_support_high_contrast_selection_ui(support : Int16) : HRESULT
    @lpVtbl.value.put_support_high_contrast_selection_ui.unsafe_as(Proc(Int16, HRESULT)).call(support)
  end
  def hit_test_selection(x : Int32, y : Int32, selarea : SelectionHitResult*) : HRESULT
    @lpVtbl.value.hit_test_selection.unsafe_as(Proc(Int32, Int32, SelectionHitResult*, HRESULT)).call(x, y, selarea)
  end
  def set_gesture_status(gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16, HRESULT)).call(gesture, listen)
  end
  def get_gesture_status(gesture : InkApplicationGesture, listening : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16*, HRESULT)).call(gesture, listening)
  end
  def get_window_input_rectangle(windowinputrectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(windowinputrectangle)
  end
  def set_window_input_rectangle(windowinputrectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.set_window_input_rectangle.unsafe_as(Proc(IInkRectangle, HRESULT)).call(windowinputrectangle)
  end
  def set_all_tablets_mode(usemouseforinput : Int16) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.unsafe_as(Proc(Int16, HRESULT)).call(usemouseforinput)
  end
  def set_single_tablet_integrated_mode(tablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_integrated_mode.unsafe_as(Proc(IInkTablet, HRESULT)).call(tablet)
  end
  def get_event_interest(eventid : InkCollectorEventInterest, listen : Int16*) : HRESULT
    @lpVtbl.value.get_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16*, HRESULT)).call(eventid, listen)
  end
  def set_event_interest(eventid : InkCollectorEventInterest, listen : Int16) : HRESULT
    @lpVtbl.value.set_event_interest.unsafe_as(Proc(InkCollectorEventInterest, Int16, HRESULT)).call(eventid, listen)
  end
  def get_ink_enabled(collecting : Int16*) : HRESULT
    @lpVtbl.value.get_ink_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(collecting)
  end
  def put_ink_enabled(collecting : Int16) : HRESULT
    @lpVtbl.value.put_ink_enabled.unsafe_as(Proc(Int16, HRESULT)).call(collecting)
  end
  def get_enabled(pbool : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbool)
  end
  def put_enabled(vbool : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbool)
  end
end
struct LibWin32::IIInkPictureEvents
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
struct LibWin32::IInkRecognizer
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
  def get_vendor(vendor : UInt8**) : HRESULT
    @lpVtbl.value.get_vendor.unsafe_as(Proc(UInt8**, HRESULT)).call(vendor)
  end
  def get_capabilities(capabilitiesflags : InkRecognizerCapabilities*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(InkRecognizerCapabilities*, HRESULT)).call(capabilitiesflags)
  end
  def get_languages(languages : VARIANT*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(VARIANT*, HRESULT)).call(languages)
  end
  def get_supported_properties(supportedproperties : VARIANT*) : HRESULT
    @lpVtbl.value.get_supported_properties.unsafe_as(Proc(VARIANT*, HRESULT)).call(supportedproperties)
  end
  def get_preferred_packet_description(preferredpacketdescription : VARIANT*) : HRESULT
    @lpVtbl.value.get_preferred_packet_description.unsafe_as(Proc(VARIANT*, HRESULT)).call(preferredpacketdescription)
  end
  def create_recognizer_context(context : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.create_recognizer_context.unsafe_as(Proc(IInkRecognizerContext*, HRESULT)).call(context)
  end
end
struct LibWin32::IInkRecognizer2
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
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_unicode_ranges(unicoderanges : VARIANT*) : HRESULT
    @lpVtbl.value.get_unicode_ranges.unsafe_as(Proc(VARIANT*, HRESULT)).call(unicoderanges)
  end
end
struct LibWin32::IInkRecognizers
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def get_default_recognizer(lcid : Int32, defaultrecognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_default_recognizer.unsafe_as(Proc(Int32, IInkRecognizer*, HRESULT)).call(lcid, defaultrecognizer)
  end
  def item(index : Int32, inkrecognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkRecognizer*, HRESULT)).call(index, inkrecognizer)
  end
end
struct LibWin32::IIInkRecognitionEvents
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
struct LibWin32::IInkRecognizerContext
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
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def putref_strokes(strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.putref_strokes.unsafe_as(Proc(IInkStrokes, HRESULT)).call(strokes)
  end
  def get_character_auto_completion_mode(mode : InkRecognizerCharacterAutoCompletionMode*) : HRESULT
    @lpVtbl.value.get_character_auto_completion_mode.unsafe_as(Proc(InkRecognizerCharacterAutoCompletionMode*, HRESULT)).call(mode)
  end
  def put_character_auto_completion_mode(mode : InkRecognizerCharacterAutoCompletionMode) : HRESULT
    @lpVtbl.value.put_character_auto_completion_mode.unsafe_as(Proc(InkRecognizerCharacterAutoCompletionMode, HRESULT)).call(mode)
  end
  def get_factoid(factoid : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.unsafe_as(Proc(UInt8**, HRESULT)).call(factoid)
  end
  def put_factoid(factoid : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.unsafe_as(Proc(UInt8*, HRESULT)).call(factoid)
  end
  def get_guide(recognizerguide : IInkRecognizerGuide*) : HRESULT
    @lpVtbl.value.get_guide.unsafe_as(Proc(IInkRecognizerGuide*, HRESULT)).call(recognizerguide)
  end
  def putref_guide(recognizerguide : IInkRecognizerGuide) : HRESULT
    @lpVtbl.value.putref_guide.unsafe_as(Proc(IInkRecognizerGuide, HRESULT)).call(recognizerguide)
  end
  def get_prefix_text(prefix : UInt8**) : HRESULT
    @lpVtbl.value.get_prefix_text.unsafe_as(Proc(UInt8**, HRESULT)).call(prefix)
  end
  def put_prefix_text(prefix : UInt8*) : HRESULT
    @lpVtbl.value.put_prefix_text.unsafe_as(Proc(UInt8*, HRESULT)).call(prefix)
  end
  def get_suffix_text(suffix : UInt8**) : HRESULT
    @lpVtbl.value.get_suffix_text.unsafe_as(Proc(UInt8**, HRESULT)).call(suffix)
  end
  def put_suffix_text(suffix : UInt8*) : HRESULT
    @lpVtbl.value.put_suffix_text.unsafe_as(Proc(UInt8*, HRESULT)).call(suffix)
  end
  def get_recognition_flags(modes : InkRecognitionModes*) : HRESULT
    @lpVtbl.value.get_recognition_flags.unsafe_as(Proc(InkRecognitionModes*, HRESULT)).call(modes)
  end
  def put_recognition_flags(modes : InkRecognitionModes) : HRESULT
    @lpVtbl.value.put_recognition_flags.unsafe_as(Proc(InkRecognitionModes, HRESULT)).call(modes)
  end
  def get_word_list(wordlist : IInkWordList*) : HRESULT
    @lpVtbl.value.get_word_list.unsafe_as(Proc(IInkWordList*, HRESULT)).call(wordlist)
  end
  def putref_word_list(wordlist : IInkWordList) : HRESULT
    @lpVtbl.value.putref_word_list.unsafe_as(Proc(IInkWordList, HRESULT)).call(wordlist)
  end
  def get_recognizer(recognizer : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(IInkRecognizer*, HRESULT)).call(recognizer)
  end
  def recognize(recognitionstatus : InkRecognitionStatus*, recognitionresult : IInkRecognitionResult*) : HRESULT
    @lpVtbl.value.recognize.unsafe_as(Proc(InkRecognitionStatus*, IInkRecognitionResult*, HRESULT)).call(recognitionstatus, recognitionresult)
  end
  def stop_background_recognition : HRESULT
    @lpVtbl.value.stop_background_recognition.unsafe_as(Proc(HRESULT)).call
  end
  def end_ink_input : HRESULT
    @lpVtbl.value.end_ink_input.unsafe_as(Proc(HRESULT)).call
  end
  def background_recognize(customdata : VARIANT) : HRESULT
    @lpVtbl.value.background_recognize.unsafe_as(Proc(VARIANT, HRESULT)).call(customdata)
  end
  def background_recognize_with_alternates(customdata : VARIANT) : HRESULT
    @lpVtbl.value.background_recognize_with_alternates.unsafe_as(Proc(VARIANT, HRESULT)).call(customdata)
  end
  def clone(recocontext : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IInkRecognizerContext*, HRESULT)).call(recocontext)
  end
  def is_string_supported(string : UInt8*, supported : Int16*) : HRESULT
    @lpVtbl.value.is_string_supported.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(string, supported)
  end
end
struct LibWin32::IInkRecognizerContext2
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
  def get_enabled_unicode_ranges(unicoderanges : VARIANT*) : HRESULT
    @lpVtbl.value.get_enabled_unicode_ranges.unsafe_as(Proc(VARIANT*, HRESULT)).call(unicoderanges)
  end
  def put_enabled_unicode_ranges(unicoderanges : VARIANT) : HRESULT
    @lpVtbl.value.put_enabled_unicode_ranges.unsafe_as(Proc(VARIANT, HRESULT)).call(unicoderanges)
  end
end
struct LibWin32::IInkRecognitionResult
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
  def get_top_string(topstring : UInt8**) : HRESULT
    @lpVtbl.value.get_top_string.unsafe_as(Proc(UInt8**, HRESULT)).call(topstring)
  end
  def get_top_alternate(topalternate : IInkRecognitionAlternate*) : HRESULT
    @lpVtbl.value.get_top_alternate.unsafe_as(Proc(IInkRecognitionAlternate*, HRESULT)).call(topalternate)
  end
  def get_top_confidence(topconfidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_top_confidence.unsafe_as(Proc(InkRecognitionConfidence*, HRESULT)).call(topconfidence)
  end
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def alternates_from_selection(selectionstart : Int32, selectionlength : Int32, maximumalternates : Int32, alternatesfromselection : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.alternates_from_selection.unsafe_as(Proc(Int32, Int32, Int32, IInkRecognitionAlternates*, HRESULT)).call(selectionstart, selectionlength, maximumalternates, alternatesfromselection)
  end
  def modify_top_alternate(alternate : IInkRecognitionAlternate) : HRESULT
    @lpVtbl.value.modify_top_alternate.unsafe_as(Proc(IInkRecognitionAlternate, HRESULT)).call(alternate)
  end
  def set_result_on_strokes : HRESULT
    @lpVtbl.value.set_result_on_strokes.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInkRecognitionAlternate
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
  def get_string(recostring : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt8**, HRESULT)).call(recostring)
  end
  def get_confidence(confidence : InkRecognitionConfidence*) : HRESULT
    @lpVtbl.value.get_confidence.unsafe_as(Proc(InkRecognitionConfidence*, HRESULT)).call(confidence)
  end
  def get_baseline(baseline : VARIANT*) : HRESULT
    @lpVtbl.value.get_baseline.unsafe_as(Proc(VARIANT*, HRESULT)).call(baseline)
  end
  def get_midline(midline : VARIANT*) : HRESULT
    @lpVtbl.value.get_midline.unsafe_as(Proc(VARIANT*, HRESULT)).call(midline)
  end
  def get_ascender(ascender : VARIANT*) : HRESULT
    @lpVtbl.value.get_ascender.unsafe_as(Proc(VARIANT*, HRESULT)).call(ascender)
  end
  def get_descender(descender : VARIANT*) : HRESULT
    @lpVtbl.value.get_descender.unsafe_as(Proc(VARIANT*, HRESULT)).call(descender)
  end
  def get_line_number(linenumber : Int32*) : HRESULT
    @lpVtbl.value.get_line_number.unsafe_as(Proc(Int32*, HRESULT)).call(linenumber)
  end
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def get_line_alternates(linealternates : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.get_line_alternates.unsafe_as(Proc(IInkRecognitionAlternates*, HRESULT)).call(linealternates)
  end
  def get_confidence_alternates(confidencealternates : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.get_confidence_alternates.unsafe_as(Proc(IInkRecognitionAlternates*, HRESULT)).call(confidencealternates)
  end
  def get_strokes_from_stroke_ranges(strokes : IInkStrokes, getstrokesfromstrokeranges : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes_from_stroke_ranges.unsafe_as(Proc(IInkStrokes, IInkStrokes*, HRESULT)).call(strokes, getstrokesfromstrokeranges)
  end
  def get_strokes_from_text_range(selectionstart : Int32*, selectionlength : Int32*, getstrokesfromtextrange : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes_from_text_range.unsafe_as(Proc(Int32*, Int32*, IInkStrokes*, HRESULT)).call(selectionstart, selectionlength, getstrokesfromtextrange)
  end
  def get_text_range_from_strokes(strokes : IInkStrokes, selectionstart : Int32*, selectionlength : Int32*) : HRESULT
    @lpVtbl.value.get_text_range_from_strokes.unsafe_as(Proc(IInkStrokes, Int32*, Int32*, HRESULT)).call(strokes, selectionstart, selectionlength)
  end
  def alternates_with_constant_property_values(propertytype : UInt8*, alternateswithconstantpropertyvalues : IInkRecognitionAlternates*) : HRESULT
    @lpVtbl.value.alternates_with_constant_property_values.unsafe_as(Proc(UInt8*, IInkRecognitionAlternates*, HRESULT)).call(propertytype, alternateswithconstantpropertyvalues)
  end
  def get_property_value(propertytype : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(propertytype, propertyvalue)
  end
end
struct LibWin32::IInkRecognitionAlternates
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def item(index : Int32, inkrecoalternate : IInkRecognitionAlternate*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkRecognitionAlternate*, HRESULT)).call(index, inkrecoalternate)
  end
end
struct LibWin32::IInkRecognizerGuide
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
  def get_writing_box(rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_writing_box.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(rectangle)
  end
  def put_writing_box(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.put_writing_box.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def get_drawn_box(rectangle : IInkRectangle*) : HRESULT
    @lpVtbl.value.get_drawn_box.unsafe_as(Proc(IInkRectangle*, HRESULT)).call(rectangle)
  end
  def put_drawn_box(rectangle : IInkRectangle) : HRESULT
    @lpVtbl.value.put_drawn_box.unsafe_as(Proc(IInkRectangle, HRESULT)).call(rectangle)
  end
  def get_rows(units : Int32*) : HRESULT
    @lpVtbl.value.get_rows.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_rows(units : Int32) : HRESULT
    @lpVtbl.value.put_rows.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_columns(units : Int32*) : HRESULT
    @lpVtbl.value.get_columns.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_columns(units : Int32) : HRESULT
    @lpVtbl.value.put_columns.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_midline(units : Int32*) : HRESULT
    @lpVtbl.value.get_midline.unsafe_as(Proc(Int32*, HRESULT)).call(units)
  end
  def put_midline(units : Int32) : HRESULT
    @lpVtbl.value.put_midline.unsafe_as(Proc(Int32, HRESULT)).call(units)
  end
  def get_guide_data(precoguide : InkRecoGuide*) : HRESULT
    @lpVtbl.value.get_guide_data.unsafe_as(Proc(InkRecoGuide*, HRESULT)).call(precoguide)
  end
  def put_guide_data(recoguide : InkRecoGuide) : HRESULT
    @lpVtbl.value.put_guide_data.unsafe_as(Proc(InkRecoGuide, HRESULT)).call(recoguide)
  end
end
struct LibWin32::IInkWordList
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
  def add_word(newword : UInt8*) : HRESULT
    @lpVtbl.value.add_word.unsafe_as(Proc(UInt8*, HRESULT)).call(newword)
  end
  def remove_word(removeword : UInt8*) : HRESULT
    @lpVtbl.value.remove_word.unsafe_as(Proc(UInt8*, HRESULT)).call(removeword)
  end
  def merge(mergewordlist : IInkWordList) : HRESULT
    @lpVtbl.value.merge.unsafe_as(Proc(IInkWordList, HRESULT)).call(mergewordlist)
  end
end
struct LibWin32::IInkWordList2
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
  def add_words(newwords : UInt8*) : HRESULT
    @lpVtbl.value.add_words.unsafe_as(Proc(UInt8*, HRESULT)).call(newwords)
  end
end
struct LibWin32::IInk
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
struct LibWin32::IInkLineInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_format(pim : INKMETRIC*) : HRESULT
    @lpVtbl.value.set_format.unsafe_as(Proc(INKMETRIC*, HRESULT)).call(pim)
  end
  def get_format(pim : INKMETRIC*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(INKMETRIC*, HRESULT)).call(pim)
  end
  def get_ink_extent(pim : INKMETRIC*, pnwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_ink_extent.unsafe_as(Proc(INKMETRIC*, UInt32*, HRESULT)).call(pim, pnwidth)
  end
  def get_candidate(ncandidatenum : UInt32, pwcrecogword : LibC::LPWSTR, pcwcrecogword : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_candidate.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt32*, UInt32, HRESULT)).call(ncandidatenum, pwcrecogword, pcwcrecogword, dwflags)
  end
  def set_candidate(ncandidatenum : UInt32, strrecogword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_candidate.unsafe_as(Proc(UInt32, LibC::LPWSTR, HRESULT)).call(ncandidatenum, strrecogword)
  end
  def recognize : HRESULT
    @lpVtbl.value.recognize.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISketchInk
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
struct LibWin32::IInkDivider
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
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def putref_strokes(strokes : IInkStrokes) : HRESULT
    @lpVtbl.value.putref_strokes.unsafe_as(Proc(IInkStrokes, HRESULT)).call(strokes)
  end
  def get_recognizer_context(recognizercontext : IInkRecognizerContext*) : HRESULT
    @lpVtbl.value.get_recognizer_context.unsafe_as(Proc(IInkRecognizerContext*, HRESULT)).call(recognizercontext)
  end
  def putref_recognizer_context(recognizercontext : IInkRecognizerContext) : HRESULT
    @lpVtbl.value.putref_recognizer_context.unsafe_as(Proc(IInkRecognizerContext, HRESULT)).call(recognizercontext)
  end
  def get_line_height(lineheight : Int32*) : HRESULT
    @lpVtbl.value.get_line_height.unsafe_as(Proc(Int32*, HRESULT)).call(lineheight)
  end
  def put_line_height(lineheight : Int32) : HRESULT
    @lpVtbl.value.put_line_height.unsafe_as(Proc(Int32, HRESULT)).call(lineheight)
  end
  def divide(inkdivisionresult : IInkDivisionResult*) : HRESULT
    @lpVtbl.value.divide.unsafe_as(Proc(IInkDivisionResult*, HRESULT)).call(inkdivisionresult)
  end
end
struct LibWin32::IInkDivisionResult
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
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def result_by_type(divisiontype : InkDivisionType, inkdivisionunits : IInkDivisionUnits*) : HRESULT
    @lpVtbl.value.result_by_type.unsafe_as(Proc(InkDivisionType, IInkDivisionUnits*, HRESULT)).call(divisiontype, inkdivisionunits)
  end
end
struct LibWin32::IInkDivisionUnit
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
  def get_strokes(strokes : IInkStrokes*) : HRESULT
    @lpVtbl.value.get_strokes.unsafe_as(Proc(IInkStrokes*, HRESULT)).call(strokes)
  end
  def get_division_type(divisiontype : InkDivisionType*) : HRESULT
    @lpVtbl.value.get_division_type.unsafe_as(Proc(InkDivisionType*, HRESULT)).call(divisiontype)
  end
  def get_recognized_string(recostring : UInt8**) : HRESULT
    @lpVtbl.value.get_recognized_string.unsafe_as(Proc(UInt8**, HRESULT)).call(recostring)
  end
  def get_rotation_transform(rotationtransform : IInkTransform*) : HRESULT
    @lpVtbl.value.get_rotation_transform.unsafe_as(Proc(IInkTransform*, HRESULT)).call(rotationtransform)
  end
end
struct LibWin32::IInkDivisionUnits
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
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
  def item(index : Int32, inkdivisionunit : IInkDivisionUnit*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IInkDivisionUnit*, HRESULT)).call(index, inkdivisionunit)
  end
end
struct LibWin32::IPenInputPanel
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
  def get_busy(busy : Int16*) : HRESULT
    @lpVtbl.value.get_busy.unsafe_as(Proc(Int16*, HRESULT)).call(busy)
  end
  def get_factoid(factoid : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.unsafe_as(Proc(UInt8**, HRESULT)).call(factoid)
  end
  def put_factoid(factoid : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.unsafe_as(Proc(UInt8*, HRESULT)).call(factoid)
  end
  def get_attached_edit_window(attachededitwindow : Int32*) : HRESULT
    @lpVtbl.value.get_attached_edit_window.unsafe_as(Proc(Int32*, HRESULT)).call(attachededitwindow)
  end
  def put_attached_edit_window(attachededitwindow : Int32) : HRESULT
    @lpVtbl.value.put_attached_edit_window.unsafe_as(Proc(Int32, HRESULT)).call(attachededitwindow)
  end
  def get_current_panel(currentpanel : PanelType*) : HRESULT
    @lpVtbl.value.get_current_panel.unsafe_as(Proc(PanelType*, HRESULT)).call(currentpanel)
  end
  def put_current_panel(currentpanel : PanelType) : HRESULT
    @lpVtbl.value.put_current_panel.unsafe_as(Proc(PanelType, HRESULT)).call(currentpanel)
  end
  def get_default_panel(pdefaultpanel : PanelType*) : HRESULT
    @lpVtbl.value.get_default_panel.unsafe_as(Proc(PanelType*, HRESULT)).call(pdefaultpanel)
  end
  def put_default_panel(defaultpanel : PanelType) : HRESULT
    @lpVtbl.value.put_default_panel.unsafe_as(Proc(PanelType, HRESULT)).call(defaultpanel)
  end
  def get_visible(visible : Int16*) : HRESULT
    @lpVtbl.value.get_visible.unsafe_as(Proc(Int16*, HRESULT)).call(visible)
  end
  def put_visible(visible : Int16) : HRESULT
    @lpVtbl.value.put_visible.unsafe_as(Proc(Int16, HRESULT)).call(visible)
  end
  def get_top(top : Int32*) : HRESULT
    @lpVtbl.value.get_top.unsafe_as(Proc(Int32*, HRESULT)).call(top)
  end
  def get_left(left : Int32*) : HRESULT
    @lpVtbl.value.get_left.unsafe_as(Proc(Int32*, HRESULT)).call(left)
  end
  def get_width(width : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(width)
  end
  def get_height(height : Int32*) : HRESULT
    @lpVtbl.value.get_height.unsafe_as(Proc(Int32*, HRESULT)).call(height)
  end
  def get_vertical_offset(verticaloffset : Int32*) : HRESULT
    @lpVtbl.value.get_vertical_offset.unsafe_as(Proc(Int32*, HRESULT)).call(verticaloffset)
  end
  def put_vertical_offset(verticaloffset : Int32) : HRESULT
    @lpVtbl.value.put_vertical_offset.unsafe_as(Proc(Int32, HRESULT)).call(verticaloffset)
  end
  def get_horizontal_offset(horizontaloffset : Int32*) : HRESULT
    @lpVtbl.value.get_horizontal_offset.unsafe_as(Proc(Int32*, HRESULT)).call(horizontaloffset)
  end
  def put_horizontal_offset(horizontaloffset : Int32) : HRESULT
    @lpVtbl.value.put_horizontal_offset.unsafe_as(Proc(Int32, HRESULT)).call(horizontaloffset)
  end
  def get_auto_show(pautoshow : Int16*) : HRESULT
    @lpVtbl.value.get_auto_show.unsafe_as(Proc(Int16*, HRESULT)).call(pautoshow)
  end
  def put_auto_show(autoshow : Int16) : HRESULT
    @lpVtbl.value.put_auto_show.unsafe_as(Proc(Int16, HRESULT)).call(autoshow)
  end
  def move_to(left : Int32, top : Int32) : HRESULT
    @lpVtbl.value.move_to.unsafe_as(Proc(Int32, Int32, HRESULT)).call(left, top)
  end
  def commit_pending_input : HRESULT
    @lpVtbl.value.commit_pending_input.unsafe_as(Proc(HRESULT)).call
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def enable_tsf(enable : Int16) : HRESULT
    @lpVtbl.value.enable_tsf.unsafe_as(Proc(Int16, HRESULT)).call(enable)
  end
end
struct LibWin32::IIPenInputPanelEvents
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
struct LibWin32::IHandwrittenTextInsertion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_recognition_results_array(psaalternates : SAFEARRAY*, locale : UInt32, falternatecontainsautospacinginformation : LibC::BOOL) : HRESULT
    @lpVtbl.value.insert_recognition_results_array.unsafe_as(Proc(SAFEARRAY*, UInt32, LibC::BOOL, HRESULT)).call(psaalternates, locale, falternatecontainsautospacinginformation)
  end
  def insert_ink_recognition_result(piinkrecoresult : IInkRecognitionResult, locale : UInt32, falternatecontainsautospacinginformation : LibC::BOOL) : HRESULT
    @lpVtbl.value.insert_ink_recognition_result.unsafe_as(Proc(IInkRecognitionResult, UInt32, LibC::BOOL, HRESULT)).call(piinkrecoresult, locale, falternatecontainsautospacinginformation)
  end
end
struct LibWin32::ITextInputPanelEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def in_place_state_changing(oldinplacestate : InPlaceState, newinplacestate : InPlaceState) : HRESULT
    @lpVtbl.value.in_place_state_changing.unsafe_as(Proc(InPlaceState, InPlaceState, HRESULT)).call(oldinplacestate, newinplacestate)
  end
  def in_place_state_changed(oldinplacestate : InPlaceState, newinplacestate : InPlaceState) : HRESULT
    @lpVtbl.value.in_place_state_changed.unsafe_as(Proc(InPlaceState, InPlaceState, HRESULT)).call(oldinplacestate, newinplacestate)
  end
  def in_place_size_changing(oldboundingrectangle : RECT, newboundingrectangle : RECT) : HRESULT
    @lpVtbl.value.in_place_size_changing.unsafe_as(Proc(RECT, RECT, HRESULT)).call(oldboundingrectangle, newboundingrectangle)
  end
  def in_place_size_changed(oldboundingrectangle : RECT, newboundingrectangle : RECT) : HRESULT
    @lpVtbl.value.in_place_size_changed.unsafe_as(Proc(RECT, RECT, HRESULT)).call(oldboundingrectangle, newboundingrectangle)
  end
  def input_area_changing(oldinputarea : PanelInputArea, newinputarea : PanelInputArea) : HRESULT
    @lpVtbl.value.input_area_changing.unsafe_as(Proc(PanelInputArea, PanelInputArea, HRESULT)).call(oldinputarea, newinputarea)
  end
  def input_area_changed(oldinputarea : PanelInputArea, newinputarea : PanelInputArea) : HRESULT
    @lpVtbl.value.input_area_changed.unsafe_as(Proc(PanelInputArea, PanelInputArea, HRESULT)).call(oldinputarea, newinputarea)
  end
  def correction_mode_changing(oldcorrectionmode : CorrectionMode, newcorrectionmode : CorrectionMode) : HRESULT
    @lpVtbl.value.correction_mode_changing.unsafe_as(Proc(CorrectionMode, CorrectionMode, HRESULT)).call(oldcorrectionmode, newcorrectionmode)
  end
  def correction_mode_changed(oldcorrectionmode : CorrectionMode, newcorrectionmode : CorrectionMode) : HRESULT
    @lpVtbl.value.correction_mode_changed.unsafe_as(Proc(CorrectionMode, CorrectionMode, HRESULT)).call(oldcorrectionmode, newcorrectionmode)
  end
  def in_place_visibility_changing(oldvisible : LibC::BOOL, newvisible : LibC::BOOL) : HRESULT
    @lpVtbl.value.in_place_visibility_changing.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, HRESULT)).call(oldvisible, newvisible)
  end
  def in_place_visibility_changed(oldvisible : LibC::BOOL, newvisible : LibC::BOOL) : HRESULT
    @lpVtbl.value.in_place_visibility_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, HRESULT)).call(oldvisible, newvisible)
  end
  def text_inserting(ink : SAFEARRAY*) : HRESULT
    @lpVtbl.value.text_inserting.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(ink)
  end
  def text_inserted(ink : SAFEARRAY*) : HRESULT
    @lpVtbl.value.text_inserted.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(ink)
  end
end
struct LibWin32::ITextInputPanel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attached_edit_window(attachededitwindow : HANDLE*) : HRESULT
    @lpVtbl.value.get_attached_edit_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(attachededitwindow)
  end
  def put_attached_edit_window(attachededitwindow : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_attached_edit_window.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(attachededitwindow)
  end
  def get_current_interaction_mode(currentinteractionmode : InteractionMode*) : HRESULT
    @lpVtbl.value.get_current_interaction_mode.unsafe_as(Proc(InteractionMode*, HRESULT)).call(currentinteractionmode)
  end
  def get_default_in_place_state(state : InPlaceState*) : HRESULT
    @lpVtbl.value.get_default_in_place_state.unsafe_as(Proc(InPlaceState*, HRESULT)).call(state)
  end
  def put_default_in_place_state(state : InPlaceState) : HRESULT
    @lpVtbl.value.put_default_in_place_state.unsafe_as(Proc(InPlaceState, HRESULT)).call(state)
  end
  def get_current_in_place_state(state : InPlaceState*) : HRESULT
    @lpVtbl.value.get_current_in_place_state.unsafe_as(Proc(InPlaceState*, HRESULT)).call(state)
  end
  def get_default_input_area(area : PanelInputArea*) : HRESULT
    @lpVtbl.value.get_default_input_area.unsafe_as(Proc(PanelInputArea*, HRESULT)).call(area)
  end
  def put_default_input_area(area : PanelInputArea) : HRESULT
    @lpVtbl.value.put_default_input_area.unsafe_as(Proc(PanelInputArea, HRESULT)).call(area)
  end
  def get_current_input_area(area : PanelInputArea*) : HRESULT
    @lpVtbl.value.get_current_input_area.unsafe_as(Proc(PanelInputArea*, HRESULT)).call(area)
  end
  def get_current_correction_mode(mode : CorrectionMode*) : HRESULT
    @lpVtbl.value.get_current_correction_mode.unsafe_as(Proc(CorrectionMode*, HRESULT)).call(mode)
  end
  def get_preferred_in_place_direction(direction : InPlaceDirection*) : HRESULT
    @lpVtbl.value.get_preferred_in_place_direction.unsafe_as(Proc(InPlaceDirection*, HRESULT)).call(direction)
  end
  def put_preferred_in_place_direction(direction : InPlaceDirection) : HRESULT
    @lpVtbl.value.put_preferred_in_place_direction.unsafe_as(Proc(InPlaceDirection, HRESULT)).call(direction)
  end
  def get_expand_post_insertion_correction(expand : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_expand_post_insertion_correction.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(expand)
  end
  def put_expand_post_insertion_correction(expand : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_expand_post_insertion_correction.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(expand)
  end
  def get_in_place_visible_on_focus(visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_in_place_visible_on_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(visible)
  end
  def put_in_place_visible_on_focus(visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_in_place_visible_on_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(visible)
  end
  def get_in_place_bounding_rectangle(boundingrectangle : RECT*) : HRESULT
    @lpVtbl.value.get_in_place_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(boundingrectangle)
  end
  def get_pop_up_correction_height(height : Int32*) : HRESULT
    @lpVtbl.value.get_pop_up_correction_height.unsafe_as(Proc(Int32*, HRESULT)).call(height)
  end
  def get_pop_down_correction_height(height : Int32*) : HRESULT
    @lpVtbl.value.get_pop_down_correction_height.unsafe_as(Proc(Int32*, HRESULT)).call(height)
  end
  def commit_pending_input : HRESULT
    @lpVtbl.value.commit_pending_input.unsafe_as(Proc(HRESULT)).call
  end
  def set_in_place_visibility(visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_in_place_visibility.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(visible)
  end
  def set_in_place_position(xposition : Int32, yposition : Int32, position : CorrectionPosition) : HRESULT
    @lpVtbl.value.set_in_place_position.unsafe_as(Proc(Int32, Int32, CorrectionPosition, HRESULT)).call(xposition, yposition, position)
  end
  def set_in_place_hover_target_position(xposition : Int32, yposition : Int32) : HRESULT
    @lpVtbl.value.set_in_place_hover_target_position.unsafe_as(Proc(Int32, Int32, HRESULT)).call(xposition, yposition)
  end
  def advise(eventsink : ITextInputPanelEventSink, eventmask : UInt32) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(ITextInputPanelEventSink, UInt32, HRESULT)).call(eventsink, eventmask)
  end
  def unadvise(eventsink : ITextInputPanelEventSink) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(ITextInputPanelEventSink, HRESULT)).call(eventsink)
  end
end
struct LibWin32::IInputPanelWindowHandle
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attached_edit_window32(attachededitwindow : Int32*) : HRESULT
    @lpVtbl.value.get_attached_edit_window32.unsafe_as(Proc(Int32*, HRESULT)).call(attachededitwindow)
  end
  def put_attached_edit_window32(attachededitwindow : Int32) : HRESULT
    @lpVtbl.value.put_attached_edit_window32.unsafe_as(Proc(Int32, HRESULT)).call(attachededitwindow)
  end
  def get_attached_edit_window64(attachededitwindow : Int64*) : HRESULT
    @lpVtbl.value.get_attached_edit_window64.unsafe_as(Proc(Int64*, HRESULT)).call(attachededitwindow)
  end
  def put_attached_edit_window64(attachededitwindow : Int64) : HRESULT
    @lpVtbl.value.put_attached_edit_window64.unsafe_as(Proc(Int64, HRESULT)).call(attachededitwindow)
  end
end
struct LibWin32::ITextInputPanelRunInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_tip_running(pfrunning : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_tip_running.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrunning)
  end
end
struct LibWin32::IInkEdit
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
  def get_status(pstatus : InkEditStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(InkEditStatus*, HRESULT)).call(pstatus)
  end
  def get_use_mouse_for_input(pval : Int16*) : HRESULT
    @lpVtbl.value.get_use_mouse_for_input.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_use_mouse_for_input(newval : Int16) : HRESULT
    @lpVtbl.value.put_use_mouse_for_input.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_ink_mode(pval : InkMode*) : HRESULT
    @lpVtbl.value.get_ink_mode.unsafe_as(Proc(InkMode*, HRESULT)).call(pval)
  end
  def put_ink_mode(newval : InkMode) : HRESULT
    @lpVtbl.value.put_ink_mode.unsafe_as(Proc(InkMode, HRESULT)).call(newval)
  end
  def get_ink_insert_mode(pval : InkInsertMode*) : HRESULT
    @lpVtbl.value.get_ink_insert_mode.unsafe_as(Proc(InkInsertMode*, HRESULT)).call(pval)
  end
  def put_ink_insert_mode(newval : InkInsertMode) : HRESULT
    @lpVtbl.value.put_ink_insert_mode.unsafe_as(Proc(InkInsertMode, HRESULT)).call(newval)
  end
  def get_drawing_attributes(pval : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(pval)
  end
  def putref_drawing_attributes(newval : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(newval)
  end
  def get_recognition_timeout(pval : Int32*) : HRESULT
    @lpVtbl.value.get_recognition_timeout.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def put_recognition_timeout(newval : Int32) : HRESULT
    @lpVtbl.value.put_recognition_timeout.unsafe_as(Proc(Int32, HRESULT)).call(newval)
  end
  def get_recognizer(pval : IInkRecognizer*) : HRESULT
    @lpVtbl.value.get_recognizer.unsafe_as(Proc(IInkRecognizer*, HRESULT)).call(pval)
  end
  def putref_recognizer(newval : IInkRecognizer) : HRESULT
    @lpVtbl.value.putref_recognizer.unsafe_as(Proc(IInkRecognizer, HRESULT)).call(newval)
  end
  def get_factoid(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_factoid.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_factoid(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_factoid.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_sel_inks(pselink : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_inks.unsafe_as(Proc(VARIANT*, HRESULT)).call(pselink)
  end
  def put_sel_inks(selink : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_inks.unsafe_as(Proc(VARIANT, HRESULT)).call(selink)
  end
  def get_sel_inks_display_mode(pinkdisplaymode : InkDisplayMode*) : HRESULT
    @lpVtbl.value.get_sel_inks_display_mode.unsafe_as(Proc(InkDisplayMode*, HRESULT)).call(pinkdisplaymode)
  end
  def put_sel_inks_display_mode(inkdisplaymode : InkDisplayMode) : HRESULT
    @lpVtbl.value.put_sel_inks_display_mode.unsafe_as(Proc(InkDisplayMode, HRESULT)).call(inkdisplaymode)
  end
  def recognize : HRESULT
    @lpVtbl.value.recognize.unsafe_as(Proc(HRESULT)).call
  end
  def get_gesture_status(gesture : InkApplicationGesture, plisten : Int16*) : HRESULT
    @lpVtbl.value.get_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16*, HRESULT)).call(gesture, plisten)
  end
  def set_gesture_status(gesture : InkApplicationGesture, listen : Int16) : HRESULT
    @lpVtbl.value.set_gesture_status.unsafe_as(Proc(InkApplicationGesture, Int16, HRESULT)).call(gesture, listen)
  end
  def put_back_color(clr : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.unsafe_as(Proc(UInt32, HRESULT)).call(clr)
  end
  def get_back_color(pclr : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pclr)
  end
  def get_appearance(pappearance : AppearanceConstants*) : HRESULT
    @lpVtbl.value.get_appearance.unsafe_as(Proc(AppearanceConstants*, HRESULT)).call(pappearance)
  end
  def put_appearance(pappearance : AppearanceConstants) : HRESULT
    @lpVtbl.value.put_appearance.unsafe_as(Proc(AppearanceConstants, HRESULT)).call(pappearance)
  end
  def get_border_style(pborderstyle : BorderStyleConstants*) : HRESULT
    @lpVtbl.value.get_border_style.unsafe_as(Proc(BorderStyleConstants*, HRESULT)).call(pborderstyle)
  end
  def put_border_style(pborderstyle : BorderStyleConstants) : HRESULT
    @lpVtbl.value.put_border_style.unsafe_as(Proc(BorderStyleConstants, HRESULT)).call(pborderstyle)
  end
  def get_hwnd(pohhwnd : UInt32*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(UInt32*, HRESULT)).call(pohhwnd)
  end
  def get_font(ppfont : IFontDisp*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(IFontDisp*, HRESULT)).call(ppfont)
  end
  def putref_font(ppfont : IFontDisp) : HRESULT
    @lpVtbl.value.putref_font.unsafe_as(Proc(IFontDisp, HRESULT)).call(ppfont)
  end
  def get_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
  def put_text(pbstrtext : UInt8*) : HRESULT
    @lpVtbl.value.put_text.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrtext)
  end
  def get_mouse_icon(mouseicon : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_mouse_icon.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(mouseicon)
  end
  def put_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.put_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def putref_mouse_icon(mouseicon : IPictureDisp) : HRESULT
    @lpVtbl.value.putref_mouse_icon.unsafe_as(Proc(IPictureDisp, HRESULT)).call(mouseicon)
  end
  def get_mouse_pointer(mousepointer : InkMousePointer*) : HRESULT
    @lpVtbl.value.get_mouse_pointer.unsafe_as(Proc(InkMousePointer*, HRESULT)).call(mousepointer)
  end
  def put_mouse_pointer(mousepointer : InkMousePointer) : HRESULT
    @lpVtbl.value.put_mouse_pointer.unsafe_as(Proc(InkMousePointer, HRESULT)).call(mousepointer)
  end
  def get_locked(pval : Int16*) : HRESULT
    @lpVtbl.value.get_locked.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_locked(newval : Int16) : HRESULT
    @lpVtbl.value.put_locked.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_enabled(pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_enabled(newval : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_max_length(plmaxlength : Int32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxlength)
  end
  def put_max_length(lmaxlength : Int32) : HRESULT
    @lpVtbl.value.put_max_length.unsafe_as(Proc(Int32, HRESULT)).call(lmaxlength)
  end
  def get_multi_line(pval : Int16*) : HRESULT
    @lpVtbl.value.get_multi_line.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_multi_line(newval : Int16) : HRESULT
    @lpVtbl.value.put_multi_line.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_scroll_bars(pval : ScrollBarsConstants*) : HRESULT
    @lpVtbl.value.get_scroll_bars.unsafe_as(Proc(ScrollBarsConstants*, HRESULT)).call(pval)
  end
  def put_scroll_bars(newval : ScrollBarsConstants) : HRESULT
    @lpVtbl.value.put_scroll_bars.unsafe_as(Proc(ScrollBarsConstants, HRESULT)).call(newval)
  end
  def get_disable_no_scroll(pval : Int16*) : HRESULT
    @lpVtbl.value.get_disable_no_scroll.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_disable_no_scroll(newval : Int16) : HRESULT
    @lpVtbl.value.put_disable_no_scroll.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_sel_alignment(pvarselalignment : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_alignment.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselalignment)
  end
  def put_sel_alignment(pvarselalignment : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_alignment.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselalignment)
  end
  def get_sel_bold(pvarselbold : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_bold.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselbold)
  end
  def put_sel_bold(pvarselbold : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_bold.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselbold)
  end
  def get_sel_italic(pvarselitalic : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_italic.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselitalic)
  end
  def put_sel_italic(pvarselitalic : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_italic.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselitalic)
  end
  def get_sel_underline(pvarselunderline : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_underline.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselunderline)
  end
  def put_sel_underline(pvarselunderline : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_underline.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselunderline)
  end
  def get_sel_color(pvarselcolor : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_color.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselcolor)
  end
  def put_sel_color(pvarselcolor : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_color.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselcolor)
  end
  def get_sel_font_name(pvarselfontname : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_font_name.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselfontname)
  end
  def put_sel_font_name(pvarselfontname : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_font_name.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselfontname)
  end
  def get_sel_font_size(pvarselfontsize : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_font_size.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselfontsize)
  end
  def put_sel_font_size(pvarselfontsize : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_font_size.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselfontsize)
  end
  def get_sel_char_offset(pvarselcharoffset : VARIANT*) : HRESULT
    @lpVtbl.value.get_sel_char_offset.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarselcharoffset)
  end
  def put_sel_char_offset(pvarselcharoffset : VARIANT) : HRESULT
    @lpVtbl.value.put_sel_char_offset.unsafe_as(Proc(VARIANT, HRESULT)).call(pvarselcharoffset)
  end
  def get_text_rtf(pbstrtextrtf : UInt8**) : HRESULT
    @lpVtbl.value.get_text_rtf.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtextrtf)
  end
  def put_text_rtf(pbstrtextrtf : UInt8*) : HRESULT
    @lpVtbl.value.put_text_rtf.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrtextrtf)
  end
  def get_sel_start(plselstart : Int32*) : HRESULT
    @lpVtbl.value.get_sel_start.unsafe_as(Proc(Int32*, HRESULT)).call(plselstart)
  end
  def put_sel_start(plselstart : Int32) : HRESULT
    @lpVtbl.value.put_sel_start.unsafe_as(Proc(Int32, HRESULT)).call(plselstart)
  end
  def get_sel_length(plsellength : Int32*) : HRESULT
    @lpVtbl.value.get_sel_length.unsafe_as(Proc(Int32*, HRESULT)).call(plsellength)
  end
  def put_sel_length(plsellength : Int32) : HRESULT
    @lpVtbl.value.put_sel_length.unsafe_as(Proc(Int32, HRESULT)).call(plsellength)
  end
  def get_sel_text(pbstrseltext : UInt8**) : HRESULT
    @lpVtbl.value.get_sel_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrseltext)
  end
  def put_sel_text(pbstrseltext : UInt8*) : HRESULT
    @lpVtbl.value.put_sel_text.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrseltext)
  end
  def get_sel_rtf(pbstrselrtf : UInt8**) : HRESULT
    @lpVtbl.value.get_sel_rtf.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrselrtf)
  end
  def put_sel_rtf(pbstrselrtf : UInt8*) : HRESULT
    @lpVtbl.value.put_sel_rtf.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrselrtf)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IIInkEditEvents
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
struct LibWin32::IMathInputControl
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
  def show : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(HRESULT)).call
  end
  def hide : HRESULT
    @lpVtbl.value.hide.unsafe_as(Proc(HRESULT)).call
  end
  def is_visible(pvbshown : Int16*) : HRESULT
    @lpVtbl.value.is_visible.unsafe_as(Proc(Int16*, HRESULT)).call(pvbshown)
  end
  def get_position(left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : HRESULT
    @lpVtbl.value.get_position.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(left, top, right, bottom)
  end
  def set_position(left : Int32, top : Int32, right : Int32, bottom : Int32) : HRESULT
    @lpVtbl.value.set_position.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(left, top, right, bottom)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def set_custom_paint(element : Int32, paint : Int16) : HRESULT
    @lpVtbl.value.set_custom_paint.unsafe_as(Proc(Int32, Int16, HRESULT)).call(element, paint)
  end
  def set_caption_text(captiontext : UInt8*) : HRESULT
    @lpVtbl.value.set_caption_text.unsafe_as(Proc(UInt8*, HRESULT)).call(captiontext)
  end
  def load_ink(ink : IInkDisp) : HRESULT
    @lpVtbl.value.load_ink.unsafe_as(Proc(IInkDisp, HRESULT)).call(ink)
  end
  def set_owner_window(ownerwindow : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_owner_window.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(ownerwindow)
  end
  def enable_extended_buttons(extended : Int16) : HRESULT
    @lpVtbl.value.enable_extended_buttons.unsafe_as(Proc(Int16, HRESULT)).call(extended)
  end
  def get_preview_height(height : Int32*) : HRESULT
    @lpVtbl.value.get_preview_height.unsafe_as(Proc(Int32*, HRESULT)).call(height)
  end
  def set_preview_height(height : Int32) : HRESULT
    @lpVtbl.value.set_preview_height.unsafe_as(Proc(Int32, HRESULT)).call(height)
  end
  def enable_auto_grow(autogrow : Int16) : HRESULT
    @lpVtbl.value.enable_auto_grow.unsafe_as(Proc(Int16, HRESULT)).call(autogrow)
  end
  def add_function_name(functionname : UInt8*) : HRESULT
    @lpVtbl.value.add_function_name.unsafe_as(Proc(UInt8*, HRESULT)).call(functionname)
  end
  def remove_function_name(functionname : UInt8*) : HRESULT
    @lpVtbl.value.remove_function_name.unsafe_as(Proc(UInt8*, HRESULT)).call(functionname)
  end
  def get_hover_icon(hoverimage : IPictureDisp*) : HRESULT
    @lpVtbl.value.get_hover_icon.unsafe_as(Proc(IPictureDisp*, HRESULT)).call(hoverimage)
  end
end
struct LibWin32::IIMathInputControlEvents
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
struct LibWin32::IRealTimeStylus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_enabled(pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenable)
  end
  def put_enabled(fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenable)
  end
  def get_hwnd(phwnd : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(HANDLE_PTR*, HRESULT)).call(phwnd)
  end
  def put_hwnd(hwnd : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_hwnd.unsafe_as(Proc(HANDLE_PTR, HRESULT)).call(hwnd)
  end
  def get_window_input_rectangle(prcwndinputrect : RECT*) : HRESULT
    @lpVtbl.value.get_window_input_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(prcwndinputrect)
  end
  def put_window_input_rectangle(prcwndinputrect : RECT*) : HRESULT
    @lpVtbl.value.put_window_input_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(prcwndinputrect)
  end
  def add_stylus_sync_plugin(iindex : UInt32, piplugin : IStylusSyncPlugin) : HRESULT
    @lpVtbl.value.add_stylus_sync_plugin.unsafe_as(Proc(UInt32, IStylusSyncPlugin, HRESULT)).call(iindex, piplugin)
  end
  def remove_stylus_sync_plugin(iindex : UInt32, ppiplugin : IStylusSyncPlugin*) : HRESULT
    @lpVtbl.value.remove_stylus_sync_plugin.unsafe_as(Proc(UInt32, IStylusSyncPlugin*, HRESULT)).call(iindex, ppiplugin)
  end
  def remove_all_stylus_sync_plugins : HRESULT
    @lpVtbl.value.remove_all_stylus_sync_plugins.unsafe_as(Proc(HRESULT)).call
  end
  def get_stylus_sync_plugin(iindex : UInt32, ppiplugin : IStylusSyncPlugin*) : HRESULT
    @lpVtbl.value.get_stylus_sync_plugin.unsafe_as(Proc(UInt32, IStylusSyncPlugin*, HRESULT)).call(iindex, ppiplugin)
  end
  def get_stylus_sync_plugin_count(pcplugins : UInt32*) : HRESULT
    @lpVtbl.value.get_stylus_sync_plugin_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcplugins)
  end
  def add_stylus_async_plugin(iindex : UInt32, piplugin : IStylusAsyncPlugin) : HRESULT
    @lpVtbl.value.add_stylus_async_plugin.unsafe_as(Proc(UInt32, IStylusAsyncPlugin, HRESULT)).call(iindex, piplugin)
  end
  def remove_stylus_async_plugin(iindex : UInt32, ppiplugin : IStylusAsyncPlugin*) : HRESULT
    @lpVtbl.value.remove_stylus_async_plugin.unsafe_as(Proc(UInt32, IStylusAsyncPlugin*, HRESULT)).call(iindex, ppiplugin)
  end
  def remove_all_stylus_async_plugins : HRESULT
    @lpVtbl.value.remove_all_stylus_async_plugins.unsafe_as(Proc(HRESULT)).call
  end
  def get_stylus_async_plugin(iindex : UInt32, ppiplugin : IStylusAsyncPlugin*) : HRESULT
    @lpVtbl.value.get_stylus_async_plugin.unsafe_as(Proc(UInt32, IStylusAsyncPlugin*, HRESULT)).call(iindex, ppiplugin)
  end
  def get_stylus_async_plugin_count(pcplugins : UInt32*) : HRESULT
    @lpVtbl.value.get_stylus_async_plugin_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcplugins)
  end
  def get_child_real_time_stylus_plugin(ppirts : IRealTimeStylus*) : HRESULT
    @lpVtbl.value.get_child_real_time_stylus_plugin.unsafe_as(Proc(IRealTimeStylus*, HRESULT)).call(ppirts)
  end
  def putref_child_real_time_stylus_plugin(pirts : IRealTimeStylus) : HRESULT
    @lpVtbl.value.putref_child_real_time_stylus_plugin.unsafe_as(Proc(IRealTimeStylus, HRESULT)).call(pirts)
  end
  def add_custom_stylus_data_to_queue(sq : StylusQueue, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.add_custom_stylus_data_to_queue.unsafe_as(Proc(StylusQueue, Guid*, UInt32, UInt8*, HRESULT)).call(sq, pguidid, cbdata, pbdata)
  end
  def clear_stylus_queues : HRESULT
    @lpVtbl.value.clear_stylus_queues.unsafe_as(Proc(HRESULT)).call
  end
  def set_all_tablets_mode(fusemouseforinput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_all_tablets_mode.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fusemouseforinput)
  end
  def set_single_tablet_mode(pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.set_single_tablet_mode.unsafe_as(Proc(IInkTablet, HRESULT)).call(pitablet)
  end
  def get_tablet(ppisingletablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet.unsafe_as(Proc(IInkTablet*, HRESULT)).call(ppisingletablet)
  end
  def get_tablet_context_id_from_tablet(pitablet : IInkTablet, ptcid : UInt32*) : HRESULT
    @lpVtbl.value.get_tablet_context_id_from_tablet.unsafe_as(Proc(IInkTablet, UInt32*, HRESULT)).call(pitablet, ptcid)
  end
  def get_tablet_from_tablet_context_id(tcid : UInt32, ppitablet : IInkTablet*) : HRESULT
    @lpVtbl.value.get_tablet_from_tablet_context_id.unsafe_as(Proc(UInt32, IInkTablet*, HRESULT)).call(tcid, ppitablet)
  end
  def get_all_tablet_context_ids(pctcidcount : UInt32*, pptcids : UInt32**) : HRESULT
    @lpVtbl.value.get_all_tablet_context_ids.unsafe_as(Proc(UInt32*, UInt32**, HRESULT)).call(pctcidcount, pptcids)
  end
  def get_styluses(ppiinkcursors : IInkCursors*) : HRESULT
    @lpVtbl.value.get_styluses.unsafe_as(Proc(IInkCursors*, HRESULT)).call(ppiinkcursors)
  end
  def get_stylus_for_id(sid : UInt32, ppiinkcursor : IInkCursor*) : HRESULT
    @lpVtbl.value.get_stylus_for_id.unsafe_as(Proc(UInt32, IInkCursor*, HRESULT)).call(sid, ppiinkcursor)
  end
  def set_desired_packet_description(cproperties : UInt32, ppropertyguids : Guid*) : HRESULT
    @lpVtbl.value.set_desired_packet_description.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(cproperties, ppropertyguids)
  end
  def get_desired_packet_description(pcproperties : UInt32*, pppropertyguids : Guid**) : HRESULT
    @lpVtbl.value.get_desired_packet_description.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(pcproperties, pppropertyguids)
  end
  def get_packet_description_data(tcid : UInt32, pfinktodevicescalex : Float32*, pfinktodevicescaley : Float32*, pcpacketproperties : UInt32*, pppacketproperties : PACKET_PROPERTY**) : HRESULT
    @lpVtbl.value.get_packet_description_data.unsafe_as(Proc(UInt32, Float32*, Float32*, UInt32*, PACKET_PROPERTY**, HRESULT)).call(tcid, pfinktodevicescalex, pfinktodevicescaley, pcpacketproperties, pppacketproperties)
  end
end
struct LibWin32::IRealTimeStylus2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_flicks_enabled(pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_flicks_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenable)
  end
  def put_flicks_enabled(fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_flicks_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenable)
  end
end
struct LibWin32::IRealTimeStylus3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_multi_touch_enabled(pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_multi_touch_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenable)
  end
  def put_multi_touch_enabled(fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_multi_touch_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenable)
  end
end
struct LibWin32::IRealTimeStylusSynchronization
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_lock(lock : RealTimeStylusLockType) : HRESULT
    @lpVtbl.value.acquire_lock.unsafe_as(Proc(RealTimeStylusLockType, HRESULT)).call(lock)
  end
  def release_lock(lock : RealTimeStylusLockType) : HRESULT
    @lpVtbl.value.release_lock.unsafe_as(Proc(RealTimeStylusLockType, HRESULT)).call(lock)
  end
end
struct LibWin32::IStrokeBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_stroke(cpktbufflength : UInt32, ppackets : Int32*, cpacketproperties : UInt32, ppacketproperties : PACKET_PROPERTY*, finktodevicescalex : Float32, finktodevicescaley : Float32, ppiinkstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.create_stroke.unsafe_as(Proc(UInt32, Int32*, UInt32, PACKET_PROPERTY*, Float32, Float32, IInkStrokeDisp*, HRESULT)).call(cpktbufflength, ppackets, cpacketproperties, ppacketproperties, finktodevicescalex, finktodevicescaley, ppiinkstroke)
  end
  def begin_stroke(tcid : UInt32, sid : UInt32, ppacket : Int32*, cpacketproperties : UInt32, ppacketproperties : PACKET_PROPERTY*, finktodevicescalex : Float32, finktodevicescaley : Float32, ppiinkstroke : IInkStrokeDisp*) : HRESULT
    @lpVtbl.value.begin_stroke.unsafe_as(Proc(UInt32, UInt32, Int32*, UInt32, PACKET_PROPERTY*, Float32, Float32, IInkStrokeDisp*, HRESULT)).call(tcid, sid, ppacket, cpacketproperties, ppacketproperties, finktodevicescalex, finktodevicescaley, ppiinkstroke)
  end
  def append_packets(tcid : UInt32, sid : UInt32, cpktbufflength : UInt32, ppackets : Int32*) : HRESULT
    @lpVtbl.value.append_packets.unsafe_as(Proc(UInt32, UInt32, UInt32, Int32*, HRESULT)).call(tcid, sid, cpktbufflength, ppackets)
  end
  def end_stroke(tcid : UInt32, sid : UInt32, ppiinkstroke : IInkStrokeDisp*, pdirtyrect : RECT*) : HRESULT
    @lpVtbl.value.end_stroke.unsafe_as(Proc(UInt32, UInt32, IInkStrokeDisp*, RECT*, HRESULT)).call(tcid, sid, ppiinkstroke, pdirtyrect)
  end
  def get_ink(ppiinkobj : IInkDisp*) : HRESULT
    @lpVtbl.value.get_ink.unsafe_as(Proc(IInkDisp*, HRESULT)).call(ppiinkobj)
  end
  def putref_ink(piinkobj : IInkDisp) : HRESULT
    @lpVtbl.value.putref_ink.unsafe_as(Proc(IInkDisp, HRESULT)).call(piinkobj)
  end
end
struct LibWin32::IStylusPlugin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def real_time_stylus_enabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_down(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.unsafe_as(Proc(IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)).call(pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)).call(pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.unsafe_as(Proc(IRealTimeStylus, IInkTablet, HRESULT)).call(pirtssrc, pitablet)
  end
  def tablet_removed(pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.unsafe_as(Proc(IRealTimeStylus, Int32, HRESULT)).call(pirtssrc, itabletindex)
  end
  def error(pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.unsafe_as(Proc(IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)).call(pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.unsafe_as(Proc(IRealTimeStylus, HRESULT)).call(pirtssrc)
  end
  def data_interest(pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.unsafe_as(Proc(RealTimeStylusDataInterest*, HRESULT)).call(pdatainterest)
  end
end
struct LibWin32::IStylusSyncPlugin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def real_time_stylus_enabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_down(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.unsafe_as(Proc(IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)).call(pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)).call(pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.unsafe_as(Proc(IRealTimeStylus, IInkTablet, HRESULT)).call(pirtssrc, pitablet)
  end
  def tablet_removed(pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.unsafe_as(Proc(IRealTimeStylus, Int32, HRESULT)).call(pirtssrc, itabletindex)
  end
  def error(pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.unsafe_as(Proc(IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)).call(pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.unsafe_as(Proc(IRealTimeStylus, HRESULT)).call(pirtssrc)
  end
  def data_interest(pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.unsafe_as(Proc(RealTimeStylusDataInterest*, HRESULT)).call(pdatainterest)
  end
end
struct LibWin32::IStylusAsyncPlugin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def real_time_stylus_enabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_enabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def real_time_stylus_disabled(pirtssrc : IRealTimeStylus, ctcidcount : UInt32, ptcids : UInt32*) : HRESULT
    @lpVtbl.value.real_time_stylus_disabled.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32*, HRESULT)).call(pirtssrc, ctcidcount, ptcids)
  end
  def stylus_in_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_in_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_out_of_range(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32) : HRESULT
    @lpVtbl.value.stylus_out_of_range.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, HRESULT)).call(pirtssrc, tcid, sid)
  end
  def stylus_down(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_down.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_up(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpropcountperpkt : UInt32, ppacket : Int32*, ppinoutpkt : Int32**) : HRESULT
    @lpVtbl.value.stylus_up.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, Int32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpropcountperpkt, ppacket, ppinoutpkt)
  end
  def stylus_button_down(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_down.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def stylus_button_up(pirtssrc : IRealTimeStylus, sid : UInt32, pguidstylusbutton : Guid*, pstyluspos : POINT*) : HRESULT
    @lpVtbl.value.stylus_button_up.unsafe_as(Proc(IRealTimeStylus, UInt32, Guid*, POINT*, HRESULT)).call(pirtssrc, sid, pguidstylusbutton, pstyluspos)
  end
  def in_air_packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.in_air_packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def packets(pirtssrc : IRealTimeStylus, pstylusinfo : StylusInfo*, cpktcount : UInt32, cpktbufflength : UInt32, ppackets : Int32*, pcinoutpkts : UInt32*, ppinoutpkts : Int32**) : HRESULT
    @lpVtbl.value.packets.unsafe_as(Proc(IRealTimeStylus, StylusInfo*, UInt32, UInt32, Int32*, UInt32*, Int32**, HRESULT)).call(pirtssrc, pstylusinfo, cpktcount, cpktbufflength, ppackets, pcinoutpkts, ppinoutpkts)
  end
  def custom_stylus_data_added(pirtssrc : IRealTimeStylus, pguidid : Guid*, cbdata : UInt32, pbdata : UInt8*) : HRESULT
    @lpVtbl.value.custom_stylus_data_added.unsafe_as(Proc(IRealTimeStylus, Guid*, UInt32, UInt8*, HRESULT)).call(pirtssrc, pguidid, cbdata, pbdata)
  end
  def system_event(pirtssrc : IRealTimeStylus, tcid : UInt32, sid : UInt32, event : UInt16, eventdata : SYSTEM_EVENT_DATA) : HRESULT
    @lpVtbl.value.system_event.unsafe_as(Proc(IRealTimeStylus, UInt32, UInt32, UInt16, SYSTEM_EVENT_DATA, HRESULT)).call(pirtssrc, tcid, sid, event, eventdata)
  end
  def tablet_added(pirtssrc : IRealTimeStylus, pitablet : IInkTablet) : HRESULT
    @lpVtbl.value.tablet_added.unsafe_as(Proc(IRealTimeStylus, IInkTablet, HRESULT)).call(pirtssrc, pitablet)
  end
  def tablet_removed(pirtssrc : IRealTimeStylus, itabletindex : Int32) : HRESULT
    @lpVtbl.value.tablet_removed.unsafe_as(Proc(IRealTimeStylus, Int32, HRESULT)).call(pirtssrc, itabletindex)
  end
  def error(pirtssrc : IRealTimeStylus, piplugin : IStylusPlugin, datainterest : RealTimeStylusDataInterest, hrerrorcode : HRESULT, lptrkey : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.error.unsafe_as(Proc(IRealTimeStylus, IStylusPlugin, RealTimeStylusDataInterest, HRESULT, LibC::IntPtrT*, HRESULT)).call(pirtssrc, piplugin, datainterest, hrerrorcode, lptrkey)
  end
  def update_mapping(pirtssrc : IRealTimeStylus) : HRESULT
    @lpVtbl.value.update_mapping.unsafe_as(Proc(IRealTimeStylus, HRESULT)).call(pirtssrc)
  end
  def data_interest(pdatainterest : RealTimeStylusDataInterest*) : HRESULT
    @lpVtbl.value.data_interest.unsafe_as(Proc(RealTimeStylusDataInterest*, HRESULT)).call(pdatainterest)
  end
end
struct LibWin32::IDynamicRenderer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_enabled(benabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(benabled)
  end
  def put_enabled(benabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(benabled)
  end
  def get_hwnd(hwnd : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(HANDLE_PTR*, HRESULT)).call(hwnd)
  end
  def put_hwnd(hwnd : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_hwnd.unsafe_as(Proc(HANDLE_PTR, HRESULT)).call(hwnd)
  end
  def get_clip_rectangle(prccliprect : RECT*) : HRESULT
    @lpVtbl.value.get_clip_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(prccliprect)
  end
  def put_clip_rectangle(prccliprect : RECT*) : HRESULT
    @lpVtbl.value.put_clip_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(prccliprect)
  end
  def get_clip_region(phcliprgn : HANDLE_PTR*) : HRESULT
    @lpVtbl.value.get_clip_region.unsafe_as(Proc(HANDLE_PTR*, HRESULT)).call(phcliprgn)
  end
  def put_clip_region(hcliprgn : HANDLE_PTR) : HRESULT
    @lpVtbl.value.put_clip_region.unsafe_as(Proc(HANDLE_PTR, HRESULT)).call(hcliprgn)
  end
  def get_drawing_attributes(ppida : IInkDrawingAttributes*) : HRESULT
    @lpVtbl.value.get_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes*, HRESULT)).call(ppida)
  end
  def putref_drawing_attributes(pida : IInkDrawingAttributes) : HRESULT
    @lpVtbl.value.putref_drawing_attributes.unsafe_as(Proc(IInkDrawingAttributes, HRESULT)).call(pida)
  end
  def get_data_cache_enabled(pfcachedata : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_data_cache_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcachedata)
  end
  def put_data_cache_enabled(fcachedata : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_data_cache_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fcachedata)
  end
  def release_cached_data(strokeid : UInt32) : HRESULT
    @lpVtbl.value.release_cached_data.unsafe_as(Proc(UInt32, HRESULT)).call(strokeid)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def draw(hdc : HANDLE_PTR) : HRESULT
    @lpVtbl.value.draw.unsafe_as(Proc(HANDLE_PTR, HRESULT)).call(hdc)
  end
end
struct LibWin32::IGestureRecognizer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_enabled(pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenabled)
  end
  def put_enabled(fenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenabled)
  end
  def get_max_stroke_count(pcstrokes : Int32*) : HRESULT
    @lpVtbl.value.get_max_stroke_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcstrokes)
  end
  def put_max_stroke_count(cstrokes : Int32) : HRESULT
    @lpVtbl.value.put_max_stroke_count.unsafe_as(Proc(Int32, HRESULT)).call(cstrokes)
  end
  def enable_gestures(cgestures : UInt32, pgestures : Int32*) : HRESULT
    @lpVtbl.value.enable_gestures.unsafe_as(Proc(UInt32, Int32*, HRESULT)).call(cgestures, pgestures)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITipAutoCompleteProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def update_pending_text(bstrpendingtext : UInt8*) : HRESULT
    @lpVtbl.value.update_pending_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpendingtext)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
end
struct LibWin32::ITipAutoCompleteClient
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_provider(hwndfield : LibC::HANDLE, piprovider : ITipAutoCompleteProvider) : HRESULT
    @lpVtbl.value.advise_provider.unsafe_as(Proc(LibC::HANDLE, ITipAutoCompleteProvider, HRESULT)).call(hwndfield, piprovider)
  end
  def unadvise_provider(hwndfield : LibC::HANDLE, piprovider : ITipAutoCompleteProvider) : HRESULT
    @lpVtbl.value.unadvise_provider.unsafe_as(Proc(LibC::HANDLE, ITipAutoCompleteProvider, HRESULT)).call(hwndfield, piprovider)
  end
  def user_selection : HRESULT
    @lpVtbl.value.user_selection.unsafe_as(Proc(HRESULT)).call
  end
  def preferred_rects(prcaclist : RECT*, prcfield : RECT*, prcmodifiedaclist : RECT*, pfshownabovetip : LibC::BOOL*) : HRESULT
    @lpVtbl.value.preferred_rects.unsafe_as(Proc(RECT*, RECT*, RECT*, LibC::BOOL*, HRESULT)).call(prcaclist, prcfield, prcmodifiedaclist, pfshownabovetip)
  end
  def request_show_ui(hwndlist : LibC::HANDLE, pfallowshowing : LibC::BOOL*) : HRESULT
    @lpVtbl.value.request_show_ui.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL*, HRESULT)).call(hwndlist, pfallowshowing)
  end
end
