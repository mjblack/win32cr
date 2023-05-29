require "../../foundation.cr"
require "../../graphics/gdi.cr"
require "../../system/com.cr"
require "../../ui/controls.cr"
require "../../system/ole.cr"
require "../../ui/windowsandmessaging.cr"
require "../../globalization.cr"
require "../../graphics/direct2d.cr"
require "../../system/com/structuredstorage.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  WM_CONTEXTMENU = 123_u32
  WM_UNICHAR = 265_u32
  WM_PRINTCLIENT = 792_u32
  EM_CANPASTE = 1074_u32
  EM_DISPLAYBAND = 1075_u32
  EM_EXGETSEL = 1076_u32
  EM_EXLIMITTEXT = 1077_u32
  EM_EXLINEFROMCHAR = 1078_u32
  EM_EXSETSEL = 1079_u32
  EM_FINDTEXT = 1080_u32
  EM_FORMATRANGE = 1081_u32
  EM_GETCHARFORMAT = 1082_u32
  EM_GETEVENTMASK = 1083_u32
  EM_GETOLEINTERFACE = 1084_u32
  EM_GETPARAFORMAT = 1085_u32
  EM_GETSELTEXT = 1086_u32
  EM_HIDESELECTION = 1087_u32
  EM_PASTESPECIAL = 1088_u32
  EM_REQUESTRESIZE = 1089_u32
  EM_SELECTIONTYPE = 1090_u32
  EM_SETBKGNDCOLOR = 1091_u32
  EM_SETCHARFORMAT = 1092_u32
  EM_SETEVENTMASK = 1093_u32
  EM_SETOLECALLBACK = 1094_u32
  EM_SETPARAFORMAT = 1095_u32
  EM_SETTARGETDEVICE = 1096_u32
  EM_STREAMIN = 1097_u32
  EM_STREAMOUT = 1098_u32
  EM_GETTEXTRANGE = 1099_u32
  EM_FINDWORDBREAK = 1100_u32
  EM_SETOPTIONS = 1101_u32
  EM_GETOPTIONS = 1102_u32
  EM_FINDTEXTEX = 1103_u32
  EM_GETWORDBREAKPROCEX = 1104_u32
  EM_SETWORDBREAKPROCEX = 1105_u32
  EM_SETUNDOLIMIT = 1106_u32
  EM_REDO = 1108_u32
  EM_CANREDO = 1109_u32
  EM_GETUNDONAME = 1110_u32
  EM_GETREDONAME = 1111_u32
  EM_STOPGROUPTYPING = 1112_u32
  EM_SETTEXTMODE = 1113_u32
  EM_GETTEXTMODE = 1114_u32
  EM_AUTOURLDETECT = 1115_u32
  AURL_ENABLEURL = 1_u32
  AURL_ENABLEEMAILADDR = 2_u32
  AURL_ENABLETELNO = 4_u32
  AURL_ENABLEEAURLS = 8_u32
  AURL_ENABLEDRIVELETTERS = 16_u32
  AURL_DISABLEMIXEDLGC = 32_u32
  EM_GETAUTOURLDETECT = 1116_u32
  EM_SETPALETTE = 1117_u32
  EM_GETTEXTEX = 1118_u32
  EM_GETTEXTLENGTHEX = 1119_u32
  EM_SHOWSCROLLBAR = 1120_u32
  EM_SETTEXTEX = 1121_u32
  EM_SETPUNCTUATION = 1124_u32
  EM_GETPUNCTUATION = 1125_u32
  EM_SETWORDWRAPMODE = 1126_u32
  EM_GETWORDWRAPMODE = 1127_u32
  EM_SETIMECOLOR = 1128_u32
  EM_GETIMECOLOR = 1129_u32
  EM_SETIMEOPTIONS = 1130_u32
  EM_GETIMEOPTIONS = 1131_u32
  EM_CONVPOSITION = 1132_u32
  EM_SETLANGOPTIONS = 1144_u32
  EM_GETLANGOPTIONS = 1145_u32
  EM_GETIMECOMPMODE = 1146_u32
  EM_FINDTEXTW = 1147_u32
  EM_FINDTEXTEXW = 1148_u32
  EM_RECONVERSION = 1149_u32
  EM_SETIMEMODEBIAS = 1150_u32
  EM_GETIMEMODEBIAS = 1151_u32
  EM_SETBIDIOPTIONS = 1224_u32
  EM_GETBIDIOPTIONS = 1225_u32
  EM_SETTYPOGRAPHYOPTIONS = 1226_u32
  EM_GETTYPOGRAPHYOPTIONS = 1227_u32
  EM_SETEDITSTYLE = 1228_u32
  EM_GETEDITSTYLE = 1229_u32
  SES_EMULATESYSEDIT = 1_u32
  SES_BEEPONMAXTEXT = 2_u32
  SES_EXTENDBACKCOLOR = 4_u32
  SES_MAPCPS = 8_u32
  SES_HYPERLINKTOOLTIPS = 8_u32
  SES_EMULATE10 = 16_u32
  SES_DEFAULTLATINLIGA = 16_u32
  SES_USECRLF = 32_u32
  SES_NOFOCUSLINKNOTIFY = 32_u32
  SES_USEAIMM = 64_u32
  SES_NOIME = 128_u32
  SES_ALLOWBEEPS = 256_u32
  SES_UPPERCASE = 512_u32
  SES_LOWERCASE = 1024_u32
  SES_NOINPUTSEQUENCECHK = 2048_u32
  SES_BIDI = 4096_u32
  SES_SCROLLONKILLFOCUS = 8192_u32
  SES_XLTCRCRLFTOCR = 16384_u32
  SES_DRAFTMODE = 32768_u32
  SES_USECTF = 65536_u32
  SES_HIDEGRIDLINES = 131072_u32
  SES_USEATFONT = 262144_u32
  SES_CUSTOMLOOK = 524288_u32
  SES_LBSCROLLNOTIFY = 1048576_u32
  SES_CTFALLOWEMBED = 2097152_u32
  SES_CTFALLOWSMARTTAG = 4194304_u32
  SES_CTFALLOWPROOFING = 8388608_u32
  SES_LOGICALCARET = 16777216_u32
  SES_WORDDRAGDROP = 33554432_u32
  SES_SMARTDRAGDROP = 67108864_u32
  SES_MULTISELECT = 134217728_u32
  SES_CTFNOLOCK = 268435456_u32
  SES_NOEALINEHEIGHTADJUST = 536870912_u32
  SES_MAX = 536870912_u32
  IMF_AUTOKEYBOARD = 1_u32
  IMF_AUTOFONT = 2_u32
  IMF_IMECANCELCOMPLETE = 4_u32
  IMF_IMEALWAYSSENDNOTIFY = 8_u32
  IMF_AUTOFONTSIZEADJUST = 16_u32
  IMF_UIFONTS = 32_u32
  IMF_NOIMPLICITLANG = 64_u32
  IMF_DUALFONT = 128_u32
  IMF_NOKBDLIDFIXUP = 512_u32
  IMF_NORTFFONTSUBSTITUTE = 1024_u32
  IMF_SPELLCHECKING = 2048_u32
  IMF_TKBPREDICTION = 4096_u32
  IMF_IMEUIINTEGRATION = 8192_u32
  ICM_NOTOPEN = 0_u32
  ICM_LEVEL3 = 1_u32
  ICM_LEVEL2 = 2_u32
  ICM_LEVEL2_5 = 3_u32
  ICM_LEVEL2_SUI = 4_u32
  ICM_CTF = 5_u32
  TO_ADVANCEDTYPOGRAPHY = 1_u32
  TO_SIMPLELINEBREAK = 2_u32
  TO_DISABLECUSTOMTEXTOUT = 4_u32
  TO_ADVANCEDLAYOUT = 8_u32
  EM_OUTLINE = 1244_u32
  EM_GETSCROLLPOS = 1245_u32
  EM_SETSCROLLPOS = 1246_u32
  EM_SETFONTSIZE = 1247_u32
  EM_GETZOOM = 1248_u32
  EM_SETZOOM = 1249_u32
  EM_GETVIEWKIND = 1250_u32
  EM_SETVIEWKIND = 1251_u32
  EM_GETPAGE = 1252_u32
  EM_SETPAGE = 1253_u32
  EM_GETHYPHENATEINFO = 1254_u32
  EM_SETHYPHENATEINFO = 1255_u32
  EM_GETPAGEROTATE = 1259_u32
  EM_SETPAGEROTATE = 1260_u32
  EM_GETCTFMODEBIAS = 1261_u32
  EM_SETCTFMODEBIAS = 1262_u32
  EM_GETCTFOPENSTATUS = 1264_u32
  EM_SETCTFOPENSTATUS = 1265_u32
  EM_GETIMECOMPTEXT = 1266_u32
  EM_ISIME = 1267_u32
  EM_GETIMEPROPERTY = 1268_u32
  EM_GETQUERYRTFOBJ = 1293_u32
  EM_SETQUERYRTFOBJ = 1294_u32
  EPR_0 = 0_u32
  EPR_270 = 1_u32
  EPR_180 = 2_u32
  EPR_90 = 3_u32
  EPR_SE = 5_u32
  CTFMODEBIAS_DEFAULT = 0_u32
  CTFMODEBIAS_FILENAME = 1_u32
  CTFMODEBIAS_NAME = 2_u32
  CTFMODEBIAS_READING = 3_u32
  CTFMODEBIAS_DATETIME = 4_u32
  CTFMODEBIAS_CONVERSATION = 5_u32
  CTFMODEBIAS_NUMERIC = 6_u32
  CTFMODEBIAS_HIRAGANA = 7_u32
  CTFMODEBIAS_KATAKANA = 8_u32
  CTFMODEBIAS_HANGUL = 9_u32
  CTFMODEBIAS_HALFWIDTHKATAKANA = 10_u32
  CTFMODEBIAS_FULLWIDTHALPHANUMERIC = 11_u32
  CTFMODEBIAS_HALFWIDTHALPHANUMERIC = 12_u32
  IMF_SMODE_PLAURALCLAUSE = 1_u32
  IMF_SMODE_NONE = 2_u32
  EMO_EXIT = 0_u32
  EMO_ENTER = 1_u32
  EMO_PROMOTE = 2_u32
  EMO_EXPAND = 3_u32
  EMO_MOVESELECTION = 4_u32
  EMO_GETVIEWMODE = 5_u32
  EMO_EXPANDSELECTION = 0_u32
  EMO_EXPANDDOCUMENT = 1_u32
  VM_NORMAL = 4_u32
  VM_OUTLINE = 2_u32
  VM_PAGE = 9_u32
  EM_INSERTTABLE = 1256_u32
  EM_GETAUTOCORRECTPROC = 1257_u32
  EM_SETAUTOCORRECTPROC = 1258_u32
  EM_CALLAUTOCORRECTPROC = 1279_u32
  ATP_NOCHANGE = 0_u32
  ATP_CHANGE = 1_u32
  ATP_NODELIMITER = 2_u32
  ATP_REPLACEALLTEXT = 4_u32
  EM_GETTABLEPARMS = 1289_u32
  EM_SETEDITSTYLEEX = 1299_u32
  EM_GETEDITSTYLEEX = 1300_u32
  SES_EX_NOTABLE = 4_u32
  SES_EX_NOMATH = 64_u32
  SES_EX_HANDLEFRIENDLYURL = 256_u32
  SES_EX_NOTHEMING = 524288_u32
  SES_EX_NOACETATESELECTION = 1048576_u32
  SES_EX_USESINGLELINE = 2097152_u32
  SES_EX_MULTITOUCH = 134217728_u32
  SES_EX_HIDETEMPFORMAT = 268435456_u32
  SES_EX_USEMOUSEWPARAM = 536870912_u32
  EM_GETSTORYTYPE = 1314_u32
  EM_SETSTORYTYPE = 1315_u32
  EM_GETELLIPSISMODE = 1329_u32
  EM_SETELLIPSISMODE = 1330_u32
  ELLIPSIS_MASK = 3_u32
  ELLIPSIS_NONE = 0_u32
  ELLIPSIS_END = 1_u32
  ELLIPSIS_WORD = 3_u32
  EM_SETTABLEPARMS = 1331_u32
  EM_GETTOUCHOPTIONS = 1334_u32
  EM_SETTOUCHOPTIONS = 1335_u32
  EM_INSERTIMAGE = 1338_u32
  EM_SETUIANAME = 1344_u32
  EM_GETELLIPSISSTATE = 1346_u32
  RTO_SHOWHANDLES = 1_u32
  RTO_DISABLEHANDLES = 2_u32
  RTO_READINGMODE = 3_u32
  EN_MSGFILTER = 1792_u32
  EN_REQUESTRESIZE = 1793_u32
  EN_SELCHANGE = 1794_u32
  EN_DROPFILES = 1795_u32
  EN_PROTECTED = 1796_u32
  EN_CORRECTTEXT = 1797_u32
  EN_STOPNOUNDO = 1798_u32
  EN_IMECHANGE = 1799_u32
  EN_SAVECLIPBOARD = 1800_u32
  EN_OLEOPFAILED = 1801_u32
  EN_OBJECTPOSITIONS = 1802_u32
  EN_LINK = 1803_u32
  EN_DRAGDROPDONE = 1804_u32
  EN_PARAGRAPHEXPANDED = 1805_u32
  EN_PAGECHANGE = 1806_u32
  EN_LOWFIRTF = 1807_u32
  EN_ALIGNLTR = 1808_u32
  EN_ALIGNRTL = 1809_u32
  EN_CLIPFORMAT = 1810_u32
  EN_STARTCOMPOSITION = 1811_u32
  EN_ENDCOMPOSITION = 1812_u32
  ENM_NONE = 0_u32
  ENM_CHANGE = 1_u32
  ENM_UPDATE = 2_u32
  ENM_SCROLL = 4_u32
  ENM_SCROLLEVENTS = 8_u32
  ENM_DRAGDROPDONE = 16_u32
  ENM_PARAGRAPHEXPANDED = 32_u32
  ENM_PAGECHANGE = 64_u32
  ENM_CLIPFORMAT = 128_u32
  ENM_KEYEVENTS = 65536_u32
  ENM_MOUSEEVENTS = 131072_u32
  ENM_REQUESTRESIZE = 262144_u32
  ENM_SELCHANGE = 524288_u32
  ENM_DROPFILES = 1048576_u32
  ENM_PROTECTED = 2097152_u32
  ENM_CORRECTTEXT = 4194304_u32
  ENM_IMECHANGE = 8388608_u32
  ENM_LANGCHANGE = 16777216_u32
  ENM_OBJECTPOSITIONS = 33554432_u32
  ENM_LINK = 67108864_u32
  ENM_LOWFIRTF = 134217728_u32
  ENM_STARTCOMPOSITION = 268435456_u32
  ENM_ENDCOMPOSITION = 536870912_u32
  ENM_GROUPTYPINGCHANGE = 1073741824_u32
  ENM_HIDELINKTOOLTIP = 2147483648_u32
  ES_SAVESEL = 32768_u32
  ES_SUNKEN = 16384_u32
  ES_DISABLENOSCROLL = 8192_u32
  ES_SELECTIONBAR = 16777216_u32
  ES_NOOLEDRAGDROP = 8_u32
  ES_EX_NOCALLOLEINIT = 0_u32
  ES_VERTICAL = 4194304_u32
  ES_NOIME = 524288_u32
  ES_SELFIME = 262144_u32
  ECO_AUTOWORDSELECTION = 1_u32
  ECO_AUTOVSCROLL = 64_u32
  ECO_AUTOHSCROLL = 128_u32
  ECO_NOHIDESEL = 256_u32
  ECO_READONLY = 2048_u32
  ECO_WANTRETURN = 4096_u32
  ECO_SAVESEL = 32768_u32
  ECO_SELECTIONBAR = 16777216_u32
  ECO_VERTICAL = 4194304_u32
  ECOOP_SET = 1_u32
  ECOOP_OR = 2_u32
  ECOOP_AND = 3_u32
  ECOOP_XOR = 4_u32
  WB_MOVEWORDPREV = 4_u32
  WB_MOVEWORDNEXT = 5_u32
  WB_PREVBREAK = 6_u32
  WB_NEXTBREAK = 7_u32
  PC_FOLLOWING = 1_u32
  PC_LEADING = 2_u32
  PC_OVERFLOW = 3_u32
  PC_DELIMITER = 4_u32
  WBF_WORDWRAP = 16_u32
  WBF_WORDBREAK = 32_u32
  WBF_OVERFLOW = 64_u32
  WBF_LEVEL1 = 128_u32
  WBF_LEVEL2 = 256_u32
  WBF_CUSTOM = 512_u32
  IMF_FORCENONE = 1_u32
  IMF_FORCEENABLE = 2_u32
  IMF_FORCEDISABLE = 4_u32
  IMF_CLOSESTATUSWINDOW = 8_u32
  IMF_VERTICAL = 32_u32
  IMF_FORCEACTIVE = 64_u32
  IMF_FORCEINACTIVE = 128_u32
  IMF_FORCEREMEMBER = 256_u32
  IMF_MULTIPLEEDIT = 1024_u32
  SCF_SELECTION = 1_u32
  SCF_WORD = 2_u32
  SCF_DEFAULT = 0_u32
  SCF_ALL = 4_u32
  SCF_USEUIRULES = 8_u32
  SCF_ASSOCIATEFONT = 16_u32
  SCF_NOKBUPDATE = 32_u32
  SCF_ASSOCIATEFONT2 = 64_u32
  SCF_SMARTFONT = 128_u32
  SCF_CHARREPFROMLCID = 256_u32
  SPF_DONTSETDEFAULT = 2_u32
  SPF_SETDEFAULT = 4_u32
  SF_TEXT = 1_u32
  SF_RTF = 2_u32
  SF_RTFNOOBJS = 3_u32
  SF_TEXTIZED = 4_u32
  SF_UNICODE = 16_u32
  SF_USECODEPAGE = 32_u32
  SF_NCRFORNONASCII = 64_u32
  SFF_WRITEXTRAPAR = 128_u32
  SFF_SELECTION = 32768_u32
  SFF_PLAINRTF = 16384_u32
  SFF_PERSISTVIEWSCALE = 8192_u32
  SFF_KEEPDOCINFO = 4096_u32
  SFF_PWD = 2048_u32
  SF_RTFVAL = 1792_u32
  MAX_TAB_STOPS = 32_u32
  MAX_TABLE_CELLS = 63_u32
  PFM_SPACEBEFORE = 64_u32
  PFM_SPACEAFTER = 128_u32
  PFM_LINESPACING = 256_u32
  PFM_STYLE = 1024_u32
  PFM_BORDER = 2048_u32
  PFM_SHADING = 4096_u32
  PFM_NUMBERINGSTYLE = 8192_u32
  PFM_NUMBERINGTAB = 16384_u32
  PFM_NUMBERINGSTART = 32768_u32
  PFM_KEEP = 131072_u32
  PFM_KEEPNEXT = 262144_u32
  PFM_PAGEBREAKBEFORE = 524288_u32
  PFM_NOLINENUMBER = 1048576_u32
  PFM_NOWIDOWCONTROL = 2097152_u32
  PFM_DONOTHYPHEN = 4194304_u32
  PFM_SIDEBYSIDE = 8388608_u32
  PFM_COLLAPSED = 16777216_u32
  PFM_OUTLINELEVEL = 33554432_u32
  PFM_BOX = 67108864_u32
  PFM_RESERVED2 = 134217728_u32
  PFM_TABLEROWDELIMITER = 268435456_u32
  PFM_TEXTWRAPPINGBREAK = 536870912_u32
  PFM_TABLE = 1073741824_u32
  PFN_BULLET = 1_u32
  PFN_ARABIC = 2_u32
  PFN_LCLETTER = 3_u32
  PFN_UCLETTER = 4_u32
  PFN_LCROMAN = 5_u32
  PFN_UCROMAN = 6_u32
  PFA_JUSTIFY = 4_u32
  PFA_FULL_INTERWORD = 4_u32
  WM_NOTIFY = 78_u32
  GCMF_GRIPPER = 1_u32
  GCMF_SPELLING = 2_u32
  GCMF_TOUCHMENU = 16384_u32
  GCMF_MOUSEMENU = 8192_u32
  OLEOP_DOVERB = 1_u32
  ST_DEFAULT = 0_u32
  ST_KEEPUNDO = 1_u32
  ST_SELECTION = 2_u32
  ST_NEWCHARS = 4_u32
  ST_UNICODE = 8_u32
  BOM_DEFPARADIR = 1_u32
  BOM_PLAINTEXT = 2_u32
  BOM_NEUTRALOVERRIDE = 4_u32
  BOM_CONTEXTREADING = 8_u32
  BOM_CONTEXTALIGNMENT = 16_u32
  BOM_LEGACYBIDICLASS = 64_u32
  BOM_UNICODEBIDI = 128_u32
  BOE_RTLDIR = 1_u32
  BOE_PLAINTEXT = 2_u32
  BOE_NEUTRALOVERRIDE = 4_u32
  BOE_CONTEXTREADING = 8_u32
  BOE_CONTEXTALIGNMENT = 16_u32
  BOE_FORCERECALC = 32_u32
  BOE_LEGACYBIDICLASS = 64_u32
  BOE_UNICODEBIDI = 128_u32
  FR_MATCHDIAC = 536870912_u32
  FR_MATCHKASHIDA = 1073741824_u32
  FR_MATCHALEFHAMZA = 2147483648_u32
  PFA_FULL_NEWSPAPER = 5_u32
  PFA_FULL_INTERLETTER = 6_u32
  PFA_FULL_SCALED = 7_u32
  PFA_FULL_GLYPHS = 8_u32
  AURL_ENABLEEA = 1_u32
  GCM_TOUCHMENU = 16384_u32
  GCM_MOUSEMENU = 8192_u32
  S_MSG_KEY_IGNORED = 262657_i32
  TXTBIT_RICHTEXT = 1_u32
  TXTBIT_MULTILINE = 2_u32
  TXTBIT_READONLY = 4_u32
  TXTBIT_SHOWACCELERATOR = 8_u32
  TXTBIT_USEPASSWORD = 16_u32
  TXTBIT_HIDESELECTION = 32_u32
  TXTBIT_SAVESELECTION = 64_u32
  TXTBIT_AUTOWORDSEL = 128_u32
  TXTBIT_VERTICAL = 256_u32
  TXTBIT_SELBARCHANGE = 512_u32
  TXTBIT_WORDWRAP = 1024_u32
  TXTBIT_ALLOWBEEP = 2048_u32
  TXTBIT_DISABLEDRAG = 4096_u32
  TXTBIT_VIEWINSETCHANGE = 8192_u32
  TXTBIT_BACKSTYLECHANGE = 16384_u32
  TXTBIT_MAXLENGTHCHANGE = 32768_u32
  TXTBIT_SCROLLBARCHANGE = 65536_u32
  TXTBIT_CHARFORMATCHANGE = 131072_u32
  TXTBIT_PARAFORMATCHANGE = 262144_u32
  TXTBIT_EXTENTCHANGE = 524288_u32
  TXTBIT_CLIENTRECTCHANGE = 1048576_u32
  TXTBIT_USECURRENTBKG = 2097152_u32
  TXTBIT_NOTHREADREFCOUNT = 4194304_u32
  TXTBIT_SHOWPASSWORD = 8388608_u32
  TXTBIT_D2DDWRITE = 16777216_u32
  TXTBIT_D2DSIMPLETYPOGRAPHY = 33554432_u32
  TXTBIT_D2DPIXELSNAPPED = 67108864_u32
  TXTBIT_D2DSUBPIXELLINES = 134217728_u32
  TXTBIT_FLASHLASTPASSWORDCHAR = 268435456_u32
  TXTBIT_ADVANCEDINPUT = 536870912_u32
  TXES_ISDIALOG = 1_u32
  REO_NULL = 0_i32
  REO_READWRITEMASK = 2047_i32
  RECO_PASTE = 0_i32
  RECO_DROP = 1_i32
  RECO_COPY = 2_i32
  RECO_CUT = 3_i32
  RECO_DRAG = 4_i32

  alias AutoCorrectProc = Proc(UInt16, LibC::LPWSTR, LibC::LPWSTR, Int32, Int32*, Int32)
  alias EDITWORDBREAKPROCEX = Proc(PSTR, Int32, UInt8, Int32, Int32)
  alias EDITSTREAMCALLBACK = Proc(LibC::UINT_PTR, UInt8*, Int32, Int32*, UInt32)
  alias PCreateTextServices = Proc(IUnknown, ITextHost, IUnknown*, HRESULT)
  alias PShutdownTextServices = Proc(IUnknown, HRESULT)


  enum CFM_MASK : UInt32
    CFM_SUBSCRIPT = 196608
    CFM_SUPERSCRIPT = 196608
    CFM_EFFECTS = 1073741887
    CFM_ALL = 4160749631
    CFM_BOLD = 1
    CFM_CHARSET = 134217728
    CFM_COLOR = 1073741824
    CFM_FACE = 536870912
    CFM_ITALIC = 2
    CFM_OFFSET = 268435456
    CFM_PROTECTED = 16
    CFM_SIZE = 2147483648
    CFM_STRIKEOUT = 8
    CFM_UNDERLINE = 4
    CFM_LINK = 32
    CFM_SMALLCAPS = 64
    CFM_ALLCAPS = 128
    CFM_HIDDEN = 256
    CFM_OUTLINE = 512
    CFM_SHADOW = 1024
    CFM_EMBOSS = 2048
    CFM_IMPRINT = 4096
    CFM_DISABLED = 8192
    CFM_REVISED = 16384
    CFM_REVAUTHOR = 32768
    CFM_ANIMATION = 262144
    CFM_STYLE = 524288
    CFM_KERNING = 1048576
    CFM_SPACING = 2097152
    CFM_WEIGHT = 4194304
    CFM_UNDERLINETYPE = 8388608
    CFM_COOKIE = 16777216
    CFM_LCID = 33554432
    CFM_BACKCOLOR = 67108864
    CFM_EFFECTS2 = 1141080063
    CFM_ALL2 = 4294967295
    CFM_FONTBOUND = 1048576
    CFM_LINKPROTECTED = 8388608
    CFM_EXTENDED = 33554432
    CFM_MATHNOBUILDUP = 134217728
    CFM_MATH = 268435456
    CFM_MATHORDINARY = 536870912
    CFM_ALLEFFECTS = 2115207167
  end

  enum CFE_EFFECTS : UInt32
    CFE_ALLCAPS = 128
    CFE_AUTOBACKCOLOR = 67108864
    CFE_DISABLED = 8192
    CFE_EMBOSS = 2048
    CFE_HIDDEN = 256
    CFE_IMPRINT = 4096
    CFE_OUTLINE = 512
    CFE_REVISED = 16384
    CFE_SHADOW = 1024
    CFE_SMALLCAPS = 64
    CFE_AUTOCOLOR = 1073741824
    CFE_BOLD = 1
    CFE_ITALIC = 2
    CFE_STRIKEOUT = 8
    CFE_UNDERLINE = 4
    CFE_PROTECTED = 16
    CFE_LINK = 32
    CFE_SUBSCRIPT = 65536
    CFE_SUPERSCRIPT = 131072
    CFE_FONTBOUND = 1048576
    CFE_LINKPROTECTED = 8388608
    CFE_EXTENDED = 33554432
    CFE_MATHNOBUILDUP = 134217728
    CFE_MATH = 268435456
    CFE_MATHORDINARY = 536870912
  end

  enum PARAFORMAT_MASK : UInt32
    PFM_ALIGNMENT = 8
    PFM_NUMBERING = 32
    PFM_OFFSET = 4
    PFM_OFFSETINDENT = 2147483648
    PFM_RIGHTINDENT = 2
    PFM_RTLPARA = 65536
    PFM_STARTINDENT = 1
    PFM_TABSTOPS = 16
  end

  enum RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE : UInt16
    SEL_EMPTY = 0
    SEL_TEXT = 1
    SEL_OBJECT = 2
    SEL_MULTICHAR = 4
    SEL_MULTIOBJECT = 8
    GCM_RIGHTMOUSEDROP = 32768
  end

  enum RICH_EDIT_GET_OBJECT_FLAGS : UInt32
    REO_GETOBJ_POLEOBJ = 1
    REO_GETOBJ_PSTG = 2
    REO_GETOBJ_POLESITE = 4
    REO_GETOBJ_NO_INTERFACES = 0
    REO_GETOBJ_ALL_INTERFACES = 7
  end

  enum PARAFORMAT_BORDERS : UInt16
    PARAFORMAT_BORDERS_LEFT = 1
    PARAFORMAT_BORDERS_RIGHT = 2
    PARAFORMAT_BORDERS_TOP = 4
    PARAFORMAT_BORDERS_BOTTOM = 8
    PARAFORMAT_BORDERS_INSIDE = 16
    PARAFORMAT_BORDERS_OUTSIDE = 32
    PARAFORMAT_BORDERS_AUTOCOLOR = 64
  end

  enum PARAFORMAT_SHADING_STYLE : UInt16
    PARAFORMAT_SHADING_STYLE_NONE = 0
    PARAFORMAT_SHADING_STYLE_DARK_HORIZ = 1
    PARAFORMAT_SHADING_STYLE_DARK_VERT = 2
    PARAFORMAT_SHADING_STYLE_DARK_DOWN_DIAG = 3
    PARAFORMAT_SHADING_STYLE_DARK_UP_DIAG = 4
    PARAFORMAT_SHADING_STYLE_DARK_GRID = 5
    PARAFORMAT_SHADING_STYLE_DARK_TRELLIS = 6
    PARAFORMAT_SHADING_STYLE_LIGHT_HORZ = 7
    PARAFORMAT_SHADING_STYLE_LIGHT_VERT = 8
    PARAFORMAT_SHADING_STYLE_LIGHT_DOWN_DIAG = 9
    PARAFORMAT_SHADING_STYLE_LIGHT_UP_DIAG = 10
    PARAFORMAT_SHADING_STYLE_LIGHT_GRID = 11
    PARAFORMAT_SHADING_STYLE_LIGHT_TRELLIS = 12
  end

  enum GETTEXTEX_FLAGS : UInt32
    GT_DEFAULT = 0
    GT_NOHIDDENTEXT = 8
    GT_RAWTEXT = 4
    GT_SELECTION = 2
    GT_USECRLF = 1
  end

  enum ENDCOMPOSITIONNOTIFY_CODE : UInt32
    ECN_ENDCOMPOSITION = 1
    ECN_NEWTEXT = 2
  end

  enum IMECOMPTEXT_FLAGS : UInt32
    ICT_RESULTREADSTR = 1
  end

  enum GETTEXTLENGTHEX_FLAGS : UInt32
    GTL_DEFAULT = 0
    GTL_USECRLF = 1
    GTL_PRECISE = 2
    GTL_CLOSE = 4
    GTL_NUMCHARS = 8
    GTL_NUMBYTES = 16
  end

  enum REOBJECT_FLAGS : UInt32
    REO_ALIGNTORIGHT = 256
    REO_BELOWBASELINE = 2
    REO_BLANK = 16
    REO_CANROTATE = 128
    REO_DONTNEEDPALETTE = 32
    REO_DYNAMICSIZE = 8
    REO_GETMETAFILE = 4194304
    REO_HILITED = 16777216
    REO_INPLACEACTIVE = 33554432
    REO_INVERTEDSELECT = 4
    REO_LINK = 2147483648
    REO_LINKAVAILABLE = 8388608
    REO_OPEN = 67108864
    REO_OWNERDRAWSELECT = 64
    REO_RESIZABLE = 1
    REO_SELECTED = 134217728
    REO_STATIC = 1073741824
    REO_USEASBACKGROUND = 1024
    REO_WRAPTEXTAROUND = 512
  end

  enum PARAFORMAT_NUMBERING_STYLE : UInt16
    PFNS_PAREN = 0
    PFNS_PARENS = 256
    PFNS_PERIOD = 512
    PFNS_PLAIN = 768
    PFNS_NONUMBER = 1024
    PFNS_NEWNUMBER = 32768
  end

  enum PARAFORMAT_ALIGNMENT : UInt16
    PFA_CENTER = 3
    PFA_LEFT = 1
    PFA_RIGHT = 2
  end

  enum TEXTMODE : Int32
    TM_PLAINTEXT = 1
    TM_RICHTEXT = 2
    TM_SINGLELEVELUNDO = 4
    TM_MULTILEVELUNDO = 8
    TM_SINGLECODEPAGE = 16
    TM_MULTICODEPAGE = 32
  end

  enum UNDONAMEID : Int32
    UID_UNKNOWN = 0
    UID_TYPING = 1
    UID_DELETE = 2
    UID_DRAGDROP = 3
    UID_CUT = 4
    UID_PASTE = 5
    UID_AUTOTABLE = 6
  end

  enum KHYPH : Int32
    Khyphnil = 0
    Khyphnormal = 1
    Khyphaddbefore = 2
    Khyphchangebefore = 3
    Khyphdeletebefore = 4
    Khyphchangeafter = 5
    Khyphdelandchange = 6
  end

  enum TXTBACKSTYLE : Int32
    TXTBACK_TRANSPARENT = 0
    TXTBACK_OPAQUE = 1
  end

  enum TXTHITRESULT : Int32
    TXTHITRESULT_NOHIT = 0
    TXTHITRESULT_TRANSPARENT = 1
    TXTHITRESULT_CLOSE = 2
    TXTHITRESULT_HIT = 3
  end

  enum TXTNATURALSIZE : Int32
    TXTNS_FITTOCONTENT2 = 0
    TXTNS_FITTOCONTENT = 1
    TXTNS_ROUNDTOLINE = 2
    TXTNS_FITTOCONTENT3 = 3
    TXTNS_FITTOCONTENTWSP = 4
    TXTNS_INCLUDELASTLINE = 1073741824
    TXTNS_EMU = -2147483648
  end

  enum TXTVIEW : Int32
    TXTVIEW_ACTIVE = 0
    TXTVIEW_INACTIVE = -1
  end

  enum CHANGETYPE : Int32
    CN_GENERIC = 0
    CN_TEXTCHANGED = 1
    CN_NEWUNDO = 2
    CN_NEWREDO = 4
  end

  enum CARET_FLAGS : Int32
    CARET_NONE = 0
    CARET_CUSTOM = 1
    CARET_RTL = 2
    CARET_ITALIC = 32
    CARET_NULL = 64
    CARET_ROTATE90 = 128
  end

  enum Tomconstants : Int32
    Tomfalse = 0
    Tomtrue = -1
    Tomundefined = -9999999
    Tomtoggle = -9999998
    Tomautocolor = -9999997
    Tomdefault = -9999996
    Tomsuspend = -9999995
    Tomresume = -9999994
    Tomapplynow = 0
    Tomapplylater = 1
    Tomtrackparms = 2
    Tomcacheparms = 3
    Tomapplytmp = 4
    Tomdisablesmartfont = 8
    Tomenablesmartfont = 9
    Tomusepoints = 10
    Tomusetwips = 11
    Tombackward = -1073741823
    Tomforward = 1073741823
    Tommove = 0
    Tomextend = 1
    Tomnoselection = 0
    Tomselectionip = 1
    Tomselectionnormal = 2
    Tomselectionframe = 3
    Tomselectioncolumn = 4
    Tomselectionrow = 5
    Tomselectionblock = 6
    Tomselectioninlineshape = 7
    Tomselectionshape = 8
    Tomselstartactive = 1
    Tomselateol = 2
    Tomselovertype = 4
    Tomselactive = 8
    Tomselreplace = 16
    Tomend = 0
    Tomstart = 32
    Tomcollapseend = 0
    Tomcollapsestart = 1
    Tomclientcoord = 256
    Tomallowoffclient = 512
    Tomtransform = 1024
    Tomobjectarg = 2048
    Tomatend = 4096
    Tomnone = 0
    Tomsingle = 1
    Tomwords = 2
    Tomdouble = 3
    Tomdotted = 4
    Tomdash = 5
    Tomdashdot = 6
    Tomdashdotdot = 7
    Tomwave = 8
    Tomthick = 9
    Tomhair = 10
    Tomdoublewave = 11
    Tomheavywave = 12
    Tomlongdash = 13
    Tomthickdash = 14
    Tomthickdashdot = 15
    Tomthickdashdotdot = 16
    Tomthickdotted = 17
    Tomthicklongdash = 18
    Tomlinespacesingle = 0
    Tomlinespace1pt5 = 1
    Tomlinespacedouble = 2
    Tomlinespaceatleast = 3
    Tomlinespaceexactly = 4
    Tomlinespacemultiple = 5
    Tomlinespacepercent = 6
    Tomalignleft = 0
    Tomaligncenter = 1
    Tomalignright = 2
    Tomalignjustify = 3
    Tomaligndecimal = 3
    Tomalignbar = 4
    Tomdefaulttab = 5
    Tomaligninterword = 3
    Tomalignnewspaper = 4
    Tomaligninterletter = 5
    Tomalignscaled = 6
    Tomspaces = 0
    Tomdots = 1
    Tomdashes = 2
    Tomlines = 3
    Tomthicklines = 4
    Tomequals = 5
    Tomtabback = -3
    Tomtabnext = -2
    Tomtabhere = -1
    Tomlistnone = 0
    Tomlistbullet = 1
    Tomlistnumberasarabic = 2
    Tomlistnumberaslcletter = 3
    Tomlistnumberasucletter = 4
    Tomlistnumberaslcroman = 5
    Tomlistnumberasucroman = 6
    Tomlistnumberassequence = 7
    Tomlistnumberedcircle = 8
    Tomlistnumberedblackcirclewingding = 9
    Tomlistnumberedwhitecirclewingding = 10
    Tomlistnumberedarabicwide = 11
    Tomlistnumberedchs = 12
    Tomlistnumberedcht = 13
    Tomlistnumberedjpnchs = 14
    Tomlistnumberedjpnkor = 15
    Tomlistnumberedarabic1 = 16
    Tomlistnumberedarabic2 = 17
    Tomlistnumberedhebrew = 18
    Tomlistnumberedthaialpha = 19
    Tomlistnumberedthainum = 20
    Tomlistnumberedhindialpha = 21
    Tomlistnumberedhindialpha1 = 22
    Tomlistnumberedhindinum = 23
    Tomlistparentheses = 65536
    Tomlistperiod = 131072
    Tomlistplain = 196608
    Tomlistnonumber = 262144
    Tomlistminus = 524288
    Tomignorenumberstyle = 16777216
    Tomparastylenormal = -1
    Tomparastyleheading1 = -2
    Tomparastyleheading2 = -3
    Tomparastyleheading3 = -4
    Tomparastyleheading4 = -5
    Tomparastyleheading5 = -6
    Tomparastyleheading6 = -7
    Tomparastyleheading7 = -8
    Tomparastyleheading8 = -9
    Tomparastyleheading9 = -10
    Tomcharacter = 1
    Tomword = 2
    Tomsentence = 3
    Tomparagraph = 4
    Tomline = 5
    Tomstory = 6
    Tomscreen = 7
    Tomsection = 8
    Tomtablecolumn = 9
    Tomcolumn = 9
    Tomrow = 10
    Tomwindow = 11
    Tomcell = 12
    Tomcharformat = 13
    Tomparaformat = 14
    Tomtable = 15
    Tomobject = 16
    Tompage = 17
    Tomhardparagraph = 18
    Tomcluster = 19
    Tominlineobject = 20
    Tominlineobjectarg = 21
    Tomleafline = 22
    Tomlayoutcolumn = 23
    Tomprocessid = 1073741825
    Tommatchword = 2
    Tommatchcase = 4
    Tommatchpattern = 8
    Tomunknownstory = 0
    Tommaintextstory = 1
    Tomfootnotesstory = 2
    Tomendnotesstory = 3
    Tomcommentsstory = 4
    Tomtextframestory = 5
    Tomevenpagesheaderstory = 6
    Tomprimaryheaderstory = 7
    Tomevenpagesfooterstory = 8
    Tomprimaryfooterstory = 9
    Tomfirstpageheaderstory = 10
    Tomfirstpagefooterstory = 11
    Tomscratchstory = 127
    Tomfindstory = 128
    Tomreplacestory = 129
    Tomstoryinactive = 0
    Tomstoryactivedisplay = 1
    Tomstoryactiveui = 2
    Tomstoryactivedisplayui = 3
    Tomnoanimation = 0
    Tomlasvegaslights = 1
    Tomblinkingbackground = 2
    Tomsparkletext = 3
    Tommarchingblackants = 4
    Tommarchingredants = 5
    Tomshimmer = 6
    Tomwipedown = 7
    Tomwiperight = 8
    Tomanimationmax = 8
    Tomlowercase = 0
    Tomuppercase = 1
    Tomtitlecase = 2
    Tomsentencecase = 4
    Tomtogglecase = 5
    Tomreadonly = 256
    Tomsharedenyread = 512
    Tomsharedenywrite = 1024
    Tompastefile = 4096
    Tomcreatenew = 16
    Tomcreatealways = 32
    Tomopenexisting = 48
    Tomopenalways = 64
    Tomtruncateexisting = 80
    Tomrtf = 1
    Tomtext = 2
    Tomhtml = 3
    Tomworddocument = 4
    Tombold = -2147483647
    Tomitalic = -2147483646
    Tomunderline = -2147483644
    Tomstrikeout = -2147483640
    Tomprotected = -2147483632
    Tomlink = -2147483616
    Tomsmallcaps = -2147483584
    Tomallcaps = -2147483520
    Tomhidden = -2147483392
    Tomoutline = -2147483136
    Tomshadow = -2147482624
    Tomemboss = -2147481600
    Tomimprint = -2147479552
    Tomdisabled = -2147475456
    Tomrevised = -2147467264
    Tomsubscriptcf = -2147418112
    Tomsuperscriptcf = -2147352576
    Tomfontbound = -2146435072
    Tomlinkprotected = -2139095040
    Tominlineobjectstart = -2130706432
    Tomextendedchar = -2113929216
    Tomautobackcolor = -2080374784
    Tommathzonenobuildup = -2013265920
    Tommathzone = -1879048192
    Tommathzoneordinary = -1610612736
    Tomautotextcolor = -1073741824
    Tommathzonedisplay = 262144
    Tomparaeffectrtl = 1
    Tomparaeffectkeep = 2
    Tomparaeffectkeepnext = 4
    Tomparaeffectpagebreakbefore = 8
    Tomparaeffectnolinenumber = 16
    Tomparaeffectnowidowcontrol = 32
    Tomparaeffectdonothyphen = 64
    Tomparaeffectsidebyside = 128
    Tomparaeffectcollapsed = 256
    Tomparaeffectoutlinelevel = 512
    Tomparaeffectbox = 1024
    Tomparaeffecttablerowdelimiter = 4096
    Tomparaeffecttable = 16384
    Tommodwidthpairs = 1
    Tommodwidthspace = 2
    Tomautospacealpha = 4
    Tomautospacenumeric = 8
    Tomautospaceparens = 16
    Tomembeddedfont = 32
    Tomdoublestrike = 64
    Tomoverlapping = 128
    Tomnormalcaret = 0
    Tomkoreanblockcaret = 1
    Tomnullcaret = 2
    Tomincludeinset = 1
    Tomunicodebidi = 1
    Tommathcfcheck = 4
    Tomunlink = 8
    Tomunhide = 16
    Tomchecktextlimit = 32
    Tomignorecurrentfont = 0
    Tommatchcharrep = 1
    Tommatchfontsignature = 2
    Tommatchascii = 4
    Tomgetheightonly = 8
    Tommatchmathfont = 16
    Tomcharset = -2147483648
    Tomcharrepfromlcid = 1073741824
    Tomansi = 0
    Tomeasteurope = 1
    Tomcyrillic = 2
    Tomgreek = 3
    Tomturkish = 4
    Tomhebrew = 5
    Tomarabic = 6
    Tombaltic = 7
    Tomvietnamese = 8
    Tomdefaultcharrep = 9
    Tomsymbol = 10
    Tomthai = 11
    Tomshiftjis = 12
    Tomgb2312 = 13
    Tomhangul = 14
    Tombig5 = 15
    Tompc437 = 16
    Tomoem = 17
    Tommac = 18
    Tomarmenian = 19
    Tomsyriac = 20
    Tomthaana = 21
    Tomdevanagari = 22
    Tombengali = 23
    Tomgurmukhi = 24
    Tomgujarati = 25
    Tomoriya = 26
    Tomtamil = 27
    Tomtelugu = 28
    Tomkannada = 29
    Tommalayalam = 30
    Tomsinhala = 31
    Tomlao = 32
    Tomtibetan = 33
    Tommyanmar = 34
    Tomgeorgian = 35
    Tomjamo = 36
    Tomethiopic = 37
    Tomcherokee = 38
    Tomaboriginal = 39
    Tomogham = 40
    Tomrunic = 41
    Tomkhmer = 42
    Tommongolian = 43
    Tombraille = 44
    Tomyi = 45
    Tomlimbu = 46
    Tomtaile = 47
    Tomnewtailue = 48
    Tomsylotinagri = 49
    Tomkharoshthi = 50
    Tomkayahli = 51
    Tomusymbol = 52
    Tomemoji = 53
    Tomglagolitic = 54
    Tomlisu = 55
    Tomvai = 56
    Tomnko = 57
    Tomosmanya = 58
    Tomphagspa = 59
    Tomgothic = 60
    Tomdeseret = 61
    Tomtifinagh = 62
    Tomcharrepmax = 63
    Tomre10mode = 1
    Tomuseatfont = 2
    Tomtextflowmask = 12
    Tomtextflowes = 0
    Tomtextflowsw = 4
    Tomtextflowwn = 8
    Tomtextflowne = 12
    Tomnoime = 524288
    Tomselfime = 262144
    Tomnoupscroll = 65536
    Tomnovpscroll = 262144
    Tomnolink = 0
    Tomclientlink = 1
    Tomfriendlylinkname = 2
    Tomfriendlylinkaddress = 3
    Tomautolinkurl = 4
    Tomautolinkemail = 5
    Tomautolinkphone = 6
    Tomautolinkpath = 7
    Tomcompressnone = 0
    Tomcompresspunctuation = 1
    Tomcompresspunctuationandkana = 2
    Tomcompressmax = 2
    Tomunderlinepositionauto = 0
    Tomunderlinepositionbelow = 1
    Tomunderlinepositionabove = 2
    Tomunderlinepositionmax = 2
    Tomfontalignmentauto = 0
    Tomfontalignmenttop = 1
    Tomfontalignmentbaseline = 2
    Tomfontalignmentbottom = 3
    Tomfontalignmentcenter = 4
    Tomfontalignmentmax = 4
    Tomrubybelow = 128
    Tomrubyaligncenter = 0
    Tomrubyalign010 = 1
    Tomrubyalign121 = 2
    Tomrubyalignleft = 3
    Tomrubyalignright = 4
    Tomlimitsdefault = 0
    Tomlimitsunderover = 1
    Tomlimitssubsup = 2
    Tomupperlimitassuperscript = 3
    Tomlimitsopposite = 4
    Tomshowllimplacehldr = 8
    Tomshowulimplacehldr = 16
    Tomdontgrowwithcontent = 64
    Tomgrowwithcontent = 128
    Tomsubsupalign = 1
    Tomlimitalignmask = 3
    Tomlimitaligncenter = 0
    Tomlimitalignleft = 1
    Tomlimitalignright = 2
    Tomshowdegplacehldr = 8
    Tomaligndefault = 0
    Tomalignmatchascentdescent = 2
    Tommathvariant = 32
    Tomstyledefault = 0
    Tomstylescriptscriptcramped = 1
    Tomstylescriptscript = 2
    Tomstylescriptcramped = 3
    Tomstylescript = 4
    Tomstyletextcramped = 5
    Tomstyletext = 6
    Tomstyledisplaycramped = 7
    Tomstyledisplay = 8
    Tommathrelsize = 64
    Tomdecdecsize = 254
    Tomdecsize = 255
    Tomincsize = 65
    Tomincincsize = 66
    Tomgravityui = 0
    Tomgravityback = 1
    Tomgravityfore = 2
    Tomgravityin = 3
    Tomgravityout = 4
    Tomgravitybackward = 536870912
    Tomgravityforward = 1073741824
    Tomadjustcrlf = 1
    Tomusecrlf = 2
    Tomtextize = 4
    Tomallowfinaleop = 8
    Tomfoldmathalpha = 16
    Tomnohidden = 32
    Tomincludenumbering = 64
    Tomtranslatetablecell = 128
    Tomnomathzonebrackets = 256
    Tomconvertmathchar = 512
    Tomnoucgreekitalic = 1024
    Tomallowmathbold = 2048
    Tomlanguagetag = 4096
    Tomconvertrtf = 8192
    Tomapplyrtfdocprops = 16384
    Tomphantomshow = 1
    Tomphantomzerowidth = 2
    Tomphantomzeroascent = 4
    Tomphantomzerodescent = 8
    Tomphantomtransparent = 16
    Tomphantomasmash = 5
    Tomphantomdsmash = 9
    Tomphantomhsmash = 3
    Tomphantomsmash = 13
    Tomphantomhorz = 12
    Tomphantomvert = 2
    Tomboxhidetop = 1
    Tomboxhidebottom = 2
    Tomboxhideleft = 4
    Tomboxhideright = 8
    Tomboxstrikeh = 16
    Tomboxstrikev = 32
    Tomboxstriketlbr = 64
    Tomboxstrikebltr = 128
    Tomboxaligncenter = 1
    Tomspacemask = 28
    Tomspacedefault = 0
    Tomspaceunary = 4
    Tomspacebinary = 8
    Tomspacerelational = 12
    Tomspaceskip = 16
    Tomspaceord = 20
    Tomspacedifferential = 24
    Tomsizetext = 32
    Tomsizescript = 64
    Tomsizescriptscript = 96
    Tomnobreak = 128
    Tomtransparentforpositioning = 256
    Tomtransparentforspacing = 512
    Tomstretchcharbelow = 0
    Tomstretchcharabove = 1
    Tomstretchbasebelow = 2
    Tomstretchbaseabove = 3
    Tommatrixalignmask = 3
    Tommatrixaligncenter = 0
    Tommatrixaligntoprow = 1
    Tommatrixalignbottomrow = 3
    Tomshowmatplacehldr = 8
    Tomeqarraylayoutwidth = 1
    Tomeqarrayalignmask = 12
    Tomeqarrayaligncenter = 0
    Tomeqarrayaligntoprow = 4
    Tomeqarrayalignbottomrow = 12
    Tommathmanualbreakmask = 127
    Tommathbreakleft = 125
    Tommathbreakcenter = 126
    Tommathbreakright = 127
    Tommatheqalign = 128
    Tommathargshadingstart = 593
    Tommathargshadingend = 594
    Tommathobjshadingstart = 595
    Tommathobjshadingend = 596
    Tomfunctiontypenone = 0
    Tomfunctiontypetakesarg = 1
    Tomfunctiontypetakeslim = 2
    Tomfunctiontypetakeslim2 = 3
    Tomfunctiontypeislim = 4
    Tommathparaaligndefault = 0
    Tommathparaaligncentergroup = 1
    Tommathparaaligncenter = 2
    Tommathparaalignleft = 3
    Tommathparaalignright = 4
    Tommathdispalignmask = 3
    Tommathdispaligncentergroup = 0
    Tommathdispaligncenter = 1
    Tommathdispalignleft = 2
    Tommathdispalignright = 3
    Tommathdispintunderover = 4
    Tommathdispfractex = 8
    Tommathdispnarygrow = 16
    Tommathdocemptyargmask = 96
    Tommathdocemptyargauto = 0
    Tommathdocemptyargalways = 32
    Tommathdocemptyargnever = 64
    Tommathdocsbspopunchanged = 128
    Tommathdocdiffmask = 768
    Tommathdocdiffdefault = 0
    Tommathdocdiffupright = 256
    Tommathdocdiffitalic = 512
    Tommathdocdiffopenitalic = 768
    Tommathdispnarysubsup = 1024
    Tommathdispdef = 2048
    Tommathenablertl = 4096
    Tommathbrkbinmask = 196608
    Tommathbrkbinbefore = 0
    Tommathbrkbinafter = 65536
    Tommathbrkbindup = 131072
    Tommathbrkbinsubmask = 786432
    Tommathbrkbinsubmm = 0
    Tommathbrkbinsubpm = 262144
    Tommathbrkbinsubmp = 524288
    Tomselrange = 597
    Tomhstring = 596
    Tomfontproptexstyle = 828
    Tomfontpropalign = 829
    Tomfontstretch = 830
    Tomfontstyle = 831
    Tomfontstyleupright = 0
    Tomfontstyleoblique = 1
    Tomfontstyleitalic = 2
    Tomfontstretchdefault = 0
    Tomfontstretchultracondensed = 1
    Tomfontstretchextracondensed = 2
    Tomfontstretchcondensed = 3
    Tomfontstretchsemicondensed = 4
    Tomfontstretchnormal = 5
    Tomfontstretchsemiexpanded = 6
    Tomfontstretchexpanded = 7
    Tomfontstretchextraexpanded = 8
    Tomfontstretchultraexpanded = 9
    Tomfontweightdefault = 0
    Tomfontweightthin = 100
    Tomfontweightextralight = 200
    Tomfontweightlight = 300
    Tomfontweightnormal = 400
    Tomfontweightregular = 400
    Tomfontweightmedium = 500
    Tomfontweightsemibold = 600
    Tomfontweightbold = 700
    Tomfontweightextrabold = 800
    Tomfontweightblack = 900
    Tomfontweightheavy = 900
    Tomfontweightextrablack = 950
    Tomparapropmathalign = 1079
    Tomdocmathbuild = 128
    Tommathlmargin = 129
    Tommathrmargin = 130
    Tommathwrapindent = 131
    Tommathwrapright = 132
    Tommathpostspace = 134
    Tommathprespace = 133
    Tommathinterspace = 135
    Tommathintraspace = 136
    Tomcancopy = 137
    Tomcanredo = 138
    Tomcanundo = 139
    Tomundolimit = 140
    Tomdocautolink = 141
    Tomellipsismode = 142
    Tomellipsisstate = 143
    Tomellipsisnone = 0
    Tomellipsisend = 1
    Tomellipsisword = 3
    Tomellipsispresent = 1
    Tomvtopcell = 1
    Tomvlowcell = 2
    Tomhstartcell = 4
    Tomhcontcell = 8
    Tomrowupdate = 1
    Tomrowapplydefault = 0
    Tomcellstructurechangeonly = 1
    Tomrowheightactual = 2059
  end

  enum OBJECTTYPE : Int32
    Tomsimpletext = 0
    Tomruby = 1
    Tomhorzvert = 2
    Tomwarichu = 3
    Tomeq = 9
    Tommath = 10
    Tomaccent = 10
    Tombox = 11
    Tomboxedformula = 12
    Tombrackets = 13
    Tombracketswithseps = 14
    Tomequationarray = 15
    Tomfraction = 16
    Tomfunctionapply = 17
    Tomleftsubsup = 18
    Tomlowerlimit = 19
    Tommatrix = 20
    Tomnary = 21
    Tomopchar = 22
    Tomoverbar = 23
    Tomphantom = 24
    Tomradical = 25
    Tomslashedfraction = 26
    Tomstack = 27
    Tomstretchstack = 28
    Tomsubscript = 29
    Tomsubsup = 30
    Tomsuperscript = 31
    Tomunderbar = 32
    Tomupperlimit = 33
    Tomobjectmax = 33
  end

  enum MANCODE : Int32
    MBOLD = 16
    MITAL = 32
    MGREEK = 64
    MROMN = 0
    MSCRP = 1
    MFRAK = 2
    MOPEN = 3
    MSANS = 4
    MMONO = 5
    MMATH = 6
    MISOL = 7
    MINIT = 8
    MTAIL = 9
    MSTRCH = 10
    MLOOP = 11
    MOPENA = 12
  end

  union CHARFORMAT2W_Anonymous_e__Union
    dw_reserved : UInt32
    dw_cookie : UInt32
  end
  union CHARFORMAT2A_Anonymous_e__Union
    dw_reserved : UInt32
    dw_cookie : UInt32
  end
  union PARAFORMAT_Anonymous_e__Union
    w_reserved : UInt16
    w_effects : UInt16
  end
  union CARET_INFO
    hbitmap : HBITMAP
    caret_flags : CARET_FLAGS
  end

  struct IMECOMPTEXT
    cb : Int32
    flags : IMECOMPTEXT_FLAGS
  end
  struct TABLEROWPARMS
    cb_row : UInt8
    cb_cell : UInt8
    c_cell : UInt8
    c_row : UInt8
    dx_cell_margin : Int32
    dx_indent : Int32
    dy_height : Int32
    _bitfield : UInt32
    cp_start_row : Int32
    b_table_level : UInt8
    i_cell : UInt8
  end
  struct TABLECELLPARMS
    dx_width : Int32
    _bitfield : UInt16
    w_shading : UInt16
    dx_brdr_left : Int16
    dy_brdr_top : Int16
    dx_brdr_right : Int16
    dy_brdr_bottom : Int16
    cr_brdr_left : UInt32
    cr_brdr_top : UInt32
    cr_brdr_right : UInt32
    cr_brdr_bottom : UInt32
    cr_back_pat : UInt32
    cr_fore_pat : UInt32
  end
  struct RICHEDIT_IMAGE_PARAMETERS
    x_width : Int32
    y_height : Int32
    ascent : Int32
    type : TEXT_ALIGN_OPTIONS
    pwsz_alternate_text : LibC::LPWSTR
    p_i_stream : IStream
  end
  struct ENDCOMPOSITIONNOTIFY
    nmhdr : NMHDR
    dw_code : ENDCOMPOSITIONNOTIFY_CODE
  end
  struct CHARFORMATA
    cb_size : UInt32
    dw_mask : CFM_MASK
    dw_effects : CFE_EFFECTS
    y_height : Int32
    y_offset : Int32
    cr_text_color : UInt32
    b_char_set : UInt8
    b_pitch_and_family : UInt8
    sz_face_name : CHAR[32]*
  end
  struct CHARFORMATW
    cb_size : UInt32
    dw_mask : CFM_MASK
    dw_effects : CFE_EFFECTS
    y_height : Int32
    y_offset : Int32
    cr_text_color : UInt32
    b_char_set : UInt8
    b_pitch_and_family : UInt8
    sz_face_name : Char[32]*
  end
  struct CHARFORMAT2W
    __anonymous_base_richedit_l711_c23 : CHARFORMATW
    w_weight : UInt16
    s_spacing : Int16
    cr_back_color : UInt32
    lcid : UInt32
    anonymous : CHARFORMAT2W_Anonymous_e__Union
    s_style : Int16
    w_kerning : UInt16
    b_underline_type : UInt8
    b_animation : UInt8
    b_rev_author : UInt8
    b_underline_color : UInt8
  end
  struct CHARFORMAT2A
    __anonymous_base_richedit_l736_c23 : CHARFORMATA
    w_weight : UInt16
    s_spacing : Int16
    cr_back_color : UInt32
    lcid : UInt32
    anonymous : CHARFORMAT2A_Anonymous_e__Union
    s_style : Int16
    w_kerning : UInt16
    b_underline_type : UInt8
    b_animation : UInt8
    b_rev_author : UInt8
    b_underline_color : UInt8
  end
  struct CHARRANGE
    cp_min : Int32
    cp_max : Int32
  end
  struct TEXTRANGEA
    chrg : CHARRANGE
    lpstr_text : PSTR
  end
  struct TEXTRANGEW
    chrg : CHARRANGE
    lpstr_text : LibC::LPWSTR
  end
  struct EDITSTREAM
    dw_cookie : LibC::UINT_PTR
    dw_error : UInt32
    pfn_callback : EDITSTREAMCALLBACK
  end
  struct FINDTEXTA
    chrg : CHARRANGE
    lpstr_text : PSTR
  end
  struct FINDTEXTW
    chrg : CHARRANGE
    lpstr_text : LibC::LPWSTR
  end
  struct FINDTEXTEXA
    chrg : CHARRANGE
    lpstr_text : PSTR
    chrg_text : CHARRANGE
  end
  struct FINDTEXTEXW
    chrg : CHARRANGE
    lpstr_text : LibC::LPWSTR
    chrg_text : CHARRANGE
  end
  struct FORMATRANGE
    hdc : HDC
    hdc_target : HDC
    rc : RECT
    rc_page : RECT
    chrg : CHARRANGE
  end
  struct PARAFORMAT
    cb_size : UInt32
    dw_mask : PARAFORMAT_MASK
    w_numbering : UInt16
    anonymous : PARAFORMAT_Anonymous_e__Union
    dx_start_indent : Int32
    dx_right_indent : Int32
    dx_offset : Int32
    w_alignment : PARAFORMAT_ALIGNMENT
    c_tab_count : Int16
    rgx_tabs : UInt32[32]*
  end
  struct PARAFORMAT2
    __anonymous_base_richedit_l1149_c22 : PARAFORMAT
    dy_space_before : Int32
    dy_space_after : Int32
    dy_line_spacing : Int32
    s_style : Int16
    b_line_spacing_rule : UInt8
    b_outline_level : UInt8
    w_shading_weight : UInt16
    w_shading_style : PARAFORMAT_SHADING_STYLE
    w_numbering_start : UInt16
    w_numbering_style : PARAFORMAT_NUMBERING_STYLE
    w_numbering_tab : UInt16
    w_border_space : UInt16
    w_border_width : UInt16
    w_borders : PARAFORMAT_BORDERS
  end
  struct MSGFILTER
    nmhdr : NMHDR
    msg : UInt32
    w_param : LibC::UINT_PTR
    l_param : LPARAM
  end
  struct REQRESIZE
    nmhdr : NMHDR
    rc : RECT
  end
  struct SELCHANGE
    nmhdr : NMHDR
    chrg : CHARRANGE
    seltyp : RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE
  end
  struct Grouptypingchange
    nmhdr : NMHDR
    f_group_typing : LibC::BOOL
  end
  struct CLIPBOARDFORMAT
    nmhdr : NMHDR
    cf : UInt16
  end
  struct GETCONTEXTMENUEX
    chrg : CHARRANGE
    dw_flags : UInt32
    pt : POINT
    pv_reserved : Void*
  end
  struct ENDROPFILES
    nmhdr : NMHDR
    h_drop : LibC::HANDLE
    cp : Int32
    f_protected : LibC::BOOL
  end
  struct ENPROTECTED
    nmhdr : NMHDR
    msg : UInt32
    w_param : LibC::UINT_PTR
    l_param : LPARAM
    chrg : CHARRANGE
  end
  struct ENSAVECLIPBOARD
    nmhdr : NMHDR
    c_object_count : Int32
    cch : Int32
  end
  struct ENOLEOPFAILED
    nmhdr : NMHDR
    iob : Int32
    l_oper : Int32
    hr : HRESULT
  end
  struct OBJECTPOSITIONS
    nmhdr : NMHDR
    c_object_count : Int32
    pcp_positions : Int32*
  end
  struct ENLINK
    nmhdr : NMHDR
    msg : UInt32
    w_param : LibC::UINT_PTR
    l_param : LPARAM
    chrg : CHARRANGE
  end
  struct ENLOWFIRTF
    nmhdr : NMHDR
    sz_control : PSTR
  end
  struct ENCORRECTTEXT
    nmhdr : NMHDR
    chrg : CHARRANGE
    seltyp : RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE
  end
  struct PUNCTUATION
    i_size : UInt32
    sz_punctuation : PSTR
  end
  struct COMPCOLOR
    cr_text : UInt32
    cr_background : UInt32
    dw_effects : UInt32
  end
  struct REPASTESPECIAL
    dw_aspect : DVASPECT
    dw_param : LibC::UINT_PTR
  end
  struct SETTEXTEX
    flags : UInt32
    codepage : UInt32
  end
  struct GETTEXTEX
    cb : UInt32
    flags : GETTEXTEX_FLAGS
    codepage : UInt32
    lp_default_char : PSTR
    lp_used_def_char : Int32*
  end
  struct GETTEXTLENGTHEX
    flags : GETTEXTLENGTHEX_FLAGS
    codepage : UInt32
  end
  struct BIDIOPTIONS
    cb_size : UInt32
    w_mask : UInt16
    w_effects : UInt16
  end
  struct Hyphresult
    khyph : KHYPH
    ich_hyph : Int32
    ch_hyph : Char
  end
  struct HYPHENATEINFO
    cb_size : Int16
    dx_hyphenate_zone : Int16
    pfn_hyphenate : LibC::IntPtrT
  end
  struct CHANGENOTIFY
    dw_change_type : CHANGETYPE
    pv_cookie_data : Void*
  end
  struct REOBJECT
    cb_struct : UInt32
    cp : Int32
    clsid : Guid
    poleobj : IOleObject
    pstg : IStorage
    polesite : IOleClientSite
    sizel : SIZE
    dvaspect : UInt32
    dw_flags : REOBJECT_FLAGS
    dw_user : UInt32
  end


  struct ITextServicesVTbl
    query_interface : Proc(ITextServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextServices*, UInt32)
    release : Proc(ITextServices*, UInt32)
    tx_send_message : Proc(ITextServices*, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    tx_draw : Proc(ITextServices*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, RECT*, LibC::IntPtrT, UInt32, Int32, HRESULT)
    tx_get_h_scroll : Proc(ITextServices*, Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)
    tx_get_v_scroll : Proc(ITextServices*, Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)
    on_tx_set_cursor : Proc(ITextServices*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, HRESULT)
    tx_query_hit_point : Proc(ITextServices*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, UInt32*, HRESULT)
    on_tx_in_place_activate : Proc(ITextServices*, RECT*, HRESULT)
    on_tx_in_place_deactivate : Proc(ITextServices*, HRESULT)
    on_tx_ui_activate : Proc(ITextServices*, HRESULT)
    on_tx_ui_deactivate : Proc(ITextServices*, HRESULT)
    tx_get_text : Proc(ITextServices*, UInt8*, HRESULT)
    tx_set_text : Proc(ITextServices*, LibC::LPWSTR, HRESULT)
    tx_get_cur_target_x : Proc(ITextServices*, Int32*, HRESULT)
    tx_get_base_line_pos : Proc(ITextServices*, Int32*, HRESULT)
    tx_get_natural_size : Proc(ITextServices*, UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, HRESULT)
    tx_get_drop_target : Proc(ITextServices*, IDropTarget*, HRESULT)
    on_tx_property_bits_change : Proc(ITextServices*, UInt32, UInt32, HRESULT)
    tx_get_cached_size : Proc(ITextServices*, UInt32*, UInt32*, HRESULT)
  end

  struct ITextServices
    lpVtbl : ITextServicesVTbl*
  end

  struct ITextHostVTbl
    query_interface : Proc(ITextHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextHost*, UInt32)
    release : Proc(ITextHost*, UInt32)
    tx_get_dc : Proc(ITextHost*, HDC)
    tx_release_dc : Proc(ITextHost*, HDC, Int32)
    tx_show_scroll_bar : Proc(ITextHost*, Int32, LibC::BOOL, LibC::BOOL)
    tx_enable_scroll_bar : Proc(ITextHost*, SCROLLBAR_CONSTANTS, ENABLE_SCROLL_BAR_ARROWS, LibC::BOOL)
    tx_set_scroll_range : Proc(ITextHost*, Int32, Int32, Int32, LibC::BOOL, LibC::BOOL)
    tx_set_scroll_pos : Proc(ITextHost*, Int32, Int32, LibC::BOOL, LibC::BOOL)
    tx_invalidate_rect : Proc(ITextHost*, RECT*, LibC::BOOL, Void)
    tx_view_change : Proc(ITextHost*, LibC::BOOL, Void)
    tx_create_caret : Proc(ITextHost*, HBITMAP, Int32, Int32, LibC::BOOL)
    tx_show_caret : Proc(ITextHost*, LibC::BOOL, LibC::BOOL)
    tx_set_caret_pos : Proc(ITextHost*, Int32, Int32, LibC::BOOL)
    tx_set_timer : Proc(ITextHost*, UInt32, UInt32, LibC::BOOL)
    tx_kill_timer : Proc(ITextHost*, UInt32, Void)
    tx_scroll_window_ex : Proc(ITextHost*, Int32, Int32, RECT*, RECT*, HRGN, RECT*, SHOW_WINDOW_CMD, Void)
    tx_set_capture : Proc(ITextHost*, LibC::BOOL, Void)
    tx_set_focus : Proc(ITextHost*, Void)
    tx_set_cursor : Proc(ITextHost*, LibC::HANDLE, LibC::BOOL, Void)
    tx_screen_to_client : Proc(ITextHost*, POINT*, LibC::BOOL)
    tx_client_to_screen : Proc(ITextHost*, POINT*, LibC::BOOL)
    tx_activate : Proc(ITextHost*, Int32*, HRESULT)
    tx_deactivate : Proc(ITextHost*, Int32, HRESULT)
    tx_get_client_rect : Proc(ITextHost*, RECT*, HRESULT)
    tx_get_view_inset : Proc(ITextHost*, RECT*, HRESULT)
    tx_get_char_format : Proc(ITextHost*, CHARFORMATW**, HRESULT)
    tx_get_para_format : Proc(ITextHost*, PARAFORMAT**, HRESULT)
    tx_get_sys_color : Proc(ITextHost*, Int32, UInt32)
    tx_get_back_style : Proc(ITextHost*, TXTBACKSTYLE*, HRESULT)
    tx_get_max_length : Proc(ITextHost*, UInt32*, HRESULT)
    tx_get_scroll_bars : Proc(ITextHost*, UInt32*, HRESULT)
    tx_get_password_char : Proc(ITextHost*, Int8*, HRESULT)
    tx_get_accelerator_pos : Proc(ITextHost*, Int32*, HRESULT)
    tx_get_extent : Proc(ITextHost*, SIZE*, HRESULT)
    on_tx_char_format_change : Proc(ITextHost*, CHARFORMATW*, HRESULT)
    on_tx_para_format_change : Proc(ITextHost*, PARAFORMAT*, HRESULT)
    tx_get_property_bits : Proc(ITextHost*, UInt32, UInt32*, HRESULT)
    tx_notify : Proc(ITextHost*, UInt32, Void*, HRESULT)
    tx_imm_get_context : Proc(ITextHost*, HIMC)
    tx_imm_release_context : Proc(ITextHost*, HIMC, Void)
    tx_get_selection_bar_width : Proc(ITextHost*, Int32*, HRESULT)
  end

  struct ITextHost
    lpVtbl : ITextHostVTbl*
  end

  struct IRicheditUiaOverridesVTbl
    query_interface : Proc(IRicheditUiaOverrides*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRicheditUiaOverrides*, UInt32)
    release : Proc(IRicheditUiaOverrides*, UInt32)
    get_property_override_value : Proc(IRicheditUiaOverrides*, Int32, VARIANT*, HRESULT)
  end

  struct IRicheditUiaOverrides
    lpVtbl : IRicheditUiaOverridesVTbl*
  end

  struct ITextHost2VTbl
    query_interface : Proc(ITextHost2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextHost2*, UInt32)
    release : Proc(ITextHost2*, UInt32)
    tx_get_dc : Proc(ITextHost2*, HDC)
    tx_release_dc : Proc(ITextHost2*, HDC, Int32)
    tx_show_scroll_bar : Proc(ITextHost2*, Int32, LibC::BOOL, LibC::BOOL)
    tx_enable_scroll_bar : Proc(ITextHost2*, SCROLLBAR_CONSTANTS, ENABLE_SCROLL_BAR_ARROWS, LibC::BOOL)
    tx_set_scroll_range : Proc(ITextHost2*, Int32, Int32, Int32, LibC::BOOL, LibC::BOOL)
    tx_set_scroll_pos : Proc(ITextHost2*, Int32, Int32, LibC::BOOL, LibC::BOOL)
    tx_invalidate_rect : Proc(ITextHost2*, RECT*, LibC::BOOL, Void)
    tx_view_change : Proc(ITextHost2*, LibC::BOOL, Void)
    tx_create_caret : Proc(ITextHost2*, HBITMAP, Int32, Int32, LibC::BOOL)
    tx_show_caret : Proc(ITextHost2*, LibC::BOOL, LibC::BOOL)
    tx_set_caret_pos : Proc(ITextHost2*, Int32, Int32, LibC::BOOL)
    tx_set_timer : Proc(ITextHost2*, UInt32, UInt32, LibC::BOOL)
    tx_kill_timer : Proc(ITextHost2*, UInt32, Void)
    tx_scroll_window_ex : Proc(ITextHost2*, Int32, Int32, RECT*, RECT*, HRGN, RECT*, SHOW_WINDOW_CMD, Void)
    tx_set_capture : Proc(ITextHost2*, LibC::BOOL, Void)
    tx_set_focus : Proc(ITextHost2*, Void)
    tx_set_cursor : Proc(ITextHost2*, LibC::HANDLE, LibC::BOOL, Void)
    tx_screen_to_client : Proc(ITextHost2*, POINT*, LibC::BOOL)
    tx_client_to_screen : Proc(ITextHost2*, POINT*, LibC::BOOL)
    tx_activate : Proc(ITextHost2*, Int32*, HRESULT)
    tx_deactivate : Proc(ITextHost2*, Int32, HRESULT)
    tx_get_client_rect : Proc(ITextHost2*, RECT*, HRESULT)
    tx_get_view_inset : Proc(ITextHost2*, RECT*, HRESULT)
    tx_get_char_format : Proc(ITextHost2*, CHARFORMATW**, HRESULT)
    tx_get_para_format : Proc(ITextHost2*, PARAFORMAT**, HRESULT)
    tx_get_sys_color : Proc(ITextHost2*, Int32, UInt32)
    tx_get_back_style : Proc(ITextHost2*, TXTBACKSTYLE*, HRESULT)
    tx_get_max_length : Proc(ITextHost2*, UInt32*, HRESULT)
    tx_get_scroll_bars : Proc(ITextHost2*, UInt32*, HRESULT)
    tx_get_password_char : Proc(ITextHost2*, Int8*, HRESULT)
    tx_get_accelerator_pos : Proc(ITextHost2*, Int32*, HRESULT)
    tx_get_extent : Proc(ITextHost2*, SIZE*, HRESULT)
    on_tx_char_format_change : Proc(ITextHost2*, CHARFORMATW*, HRESULT)
    on_tx_para_format_change : Proc(ITextHost2*, PARAFORMAT*, HRESULT)
    tx_get_property_bits : Proc(ITextHost2*, UInt32, UInt32*, HRESULT)
    tx_notify : Proc(ITextHost2*, UInt32, Void*, HRESULT)
    tx_imm_get_context : Proc(ITextHost2*, HIMC)
    tx_imm_release_context : Proc(ITextHost2*, HIMC, Void)
    tx_get_selection_bar_width : Proc(ITextHost2*, Int32*, HRESULT)
    tx_is_double_click_pending : Proc(ITextHost2*, LibC::BOOL)
    tx_get_window : Proc(ITextHost2*, HANDLE*, HRESULT)
    tx_set_foreground_window : Proc(ITextHost2*, HRESULT)
    tx_get_palette : Proc(ITextHost2*, HPALETTE)
    tx_get_east_asian_flags : Proc(ITextHost2*, Int32*, HRESULT)
    tx_set_cursor2 : Proc(ITextHost2*, LibC::HANDLE, LibC::BOOL, HANDLE)
    tx_free_text_services_notification : Proc(ITextHost2*, Void)
    tx_get_edit_style : Proc(ITextHost2*, UInt32, UInt32*, HRESULT)
    tx_get_window_styles : Proc(ITextHost2*, UInt32*, UInt32*, HRESULT)
    tx_show_drop_caret : Proc(ITextHost2*, LibC::BOOL, HDC, RECT*, HRESULT)
    tx_destroy_caret : Proc(ITextHost2*, HRESULT)
    tx_get_horz_extent : Proc(ITextHost2*, Int32*, HRESULT)
  end

  struct ITextHost2
    lpVtbl : ITextHost2VTbl*
  end

  struct ITextServices2VTbl
    query_interface : Proc(ITextServices2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextServices2*, UInt32)
    release : Proc(ITextServices2*, UInt32)
    tx_send_message : Proc(ITextServices2*, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
    tx_draw : Proc(ITextServices2*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, RECT*, LibC::IntPtrT, UInt32, Int32, HRESULT)
    tx_get_h_scroll : Proc(ITextServices2*, Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)
    tx_get_v_scroll : Proc(ITextServices2*, Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)
    on_tx_set_cursor : Proc(ITextServices2*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, HRESULT)
    tx_query_hit_point : Proc(ITextServices2*, DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, UInt32*, HRESULT)
    on_tx_in_place_activate : Proc(ITextServices2*, RECT*, HRESULT)
    on_tx_in_place_deactivate : Proc(ITextServices2*, HRESULT)
    on_tx_ui_activate : Proc(ITextServices2*, HRESULT)
    on_tx_ui_deactivate : Proc(ITextServices2*, HRESULT)
    tx_get_text : Proc(ITextServices2*, UInt8*, HRESULT)
    tx_set_text : Proc(ITextServices2*, LibC::LPWSTR, HRESULT)
    tx_get_cur_target_x : Proc(ITextServices2*, Int32*, HRESULT)
    tx_get_base_line_pos : Proc(ITextServices2*, Int32*, HRESULT)
    tx_get_natural_size : Proc(ITextServices2*, UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, HRESULT)
    tx_get_drop_target : Proc(ITextServices2*, IDropTarget*, HRESULT)
    on_tx_property_bits_change : Proc(ITextServices2*, UInt32, UInt32, HRESULT)
    tx_get_cached_size : Proc(ITextServices2*, UInt32*, UInt32*, HRESULT)
    tx_get_natural_size2 : Proc(ITextServices2*, UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, Int32*, HRESULT)
    tx_draw_d2_d : Proc(ITextServices2*, ID2D1RenderTarget, RECTL*, RECT*, Int32, HRESULT)
  end

  struct ITextServices2
    lpVtbl : ITextServices2VTbl*
  end

  struct IRichEditOleVTbl
    query_interface : Proc(IRichEditOle*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRichEditOle*, UInt32)
    release : Proc(IRichEditOle*, UInt32)
    get_client_site : Proc(IRichEditOle*, IOleClientSite*, HRESULT)
    get_object_count : Proc(IRichEditOle*, Int32)
    get_link_count : Proc(IRichEditOle*, Int32)
    get_object : Proc(IRichEditOle*, Int32, REOBJECT*, RICH_EDIT_GET_OBJECT_FLAGS, HRESULT)
    insert_object : Proc(IRichEditOle*, REOBJECT*, HRESULT)
    convert_object : Proc(IRichEditOle*, Int32, Guid*, PSTR, HRESULT)
    activate_as : Proc(IRichEditOle*, Guid*, Guid*, HRESULT)
    set_host_names : Proc(IRichEditOle*, PSTR, PSTR, HRESULT)
    set_link_available : Proc(IRichEditOle*, Int32, LibC::BOOL, HRESULT)
    set_dvaspect : Proc(IRichEditOle*, Int32, UInt32, HRESULT)
    hands_off_storage : Proc(IRichEditOle*, Int32, HRESULT)
    save_completed : Proc(IRichEditOle*, Int32, IStorage, HRESULT)
    in_place_deactivate : Proc(IRichEditOle*, HRESULT)
    context_sensitive_help : Proc(IRichEditOle*, LibC::BOOL, HRESULT)
    get_clipboard_data : Proc(IRichEditOle*, CHARRANGE*, UInt32, IDataObject*, HRESULT)
    import_data_object : Proc(IRichEditOle*, IDataObject, UInt16, LibC::IntPtrT, HRESULT)
  end

  struct IRichEditOle
    lpVtbl : IRichEditOleVTbl*
  end

  struct IRichEditOleCallbackVTbl
    query_interface : Proc(IRichEditOleCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRichEditOleCallback*, UInt32)
    release : Proc(IRichEditOleCallback*, UInt32)
    get_new_storage : Proc(IRichEditOleCallback*, IStorage*, HRESULT)
    get_in_place_context : Proc(IRichEditOleCallback*, IOleInPlaceFrame*, IOleInPlaceUIWindow*, OIFI*, HRESULT)
    show_container_ui : Proc(IRichEditOleCallback*, LibC::BOOL, HRESULT)
    query_insert_object : Proc(IRichEditOleCallback*, Guid*, IStorage, Int32, HRESULT)
    delete_object : Proc(IRichEditOleCallback*, IOleObject, HRESULT)
    query_accept_data : Proc(IRichEditOleCallback*, IDataObject, UInt16*, UInt32, LibC::BOOL, LibC::IntPtrT, HRESULT)
    context_sensitive_help : Proc(IRichEditOleCallback*, LibC::BOOL, HRESULT)
    get_clipboard_data : Proc(IRichEditOleCallback*, CHARRANGE*, UInt32, IDataObject*, HRESULT)
    get_drag_drop_effect : Proc(IRichEditOleCallback*, LibC::BOOL, UInt32, UInt32*, HRESULT)
    get_context_menu : Proc(IRichEditOleCallback*, RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, IOleObject, CHARRANGE*, HANDLE*, HRESULT)
  end

  struct IRichEditOleCallback
    lpVtbl : IRichEditOleCallbackVTbl*
  end

  struct ITextDocumentVTbl
    query_interface : Proc(ITextDocument*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextDocument*, UInt32)
    release : Proc(ITextDocument*, UInt32)
    get_type_info_count : Proc(ITextDocument*, UInt32*, HRESULT)
    get_type_info : Proc(ITextDocument*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextDocument*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextDocument*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ITextDocument*, UInt8*, HRESULT)
    get_selection : Proc(ITextDocument*, ITextSelection*, HRESULT)
    get_story_count : Proc(ITextDocument*, Int32*, HRESULT)
    get_story_ranges : Proc(ITextDocument*, ITextStoryRanges*, HRESULT)
    get_saved : Proc(ITextDocument*, Int32*, HRESULT)
    set_saved : Proc(ITextDocument*, Tomconstants, HRESULT)
    get_default_tab_stop : Proc(ITextDocument*, Float32*, HRESULT)
    set_default_tab_stop : Proc(ITextDocument*, Float32, HRESULT)
    new : Proc(ITextDocument*, HRESULT)
    open : Proc(ITextDocument*, VARIANT*, Int32, Int32, HRESULT)
    save : Proc(ITextDocument*, VARIANT*, Int32, Int32, HRESULT)
    freeze : Proc(ITextDocument*, Int32*, HRESULT)
    unfreeze : Proc(ITextDocument*, Int32*, HRESULT)
    begin_edit_collection : Proc(ITextDocument*, HRESULT)
    end_edit_collection : Proc(ITextDocument*, HRESULT)
    undo : Proc(ITextDocument*, Int32, Int32*, HRESULT)
    redo : Proc(ITextDocument*, Int32, Int32*, HRESULT)
    range : Proc(ITextDocument*, Int32, Int32, ITextRange*, HRESULT)
    range_from_point : Proc(ITextDocument*, Int32, Int32, ITextRange*, HRESULT)
  end

  struct ITextDocument
    lpVtbl : ITextDocumentVTbl*
  end

  struct ITextRangeVTbl
    query_interface : Proc(ITextRange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextRange*, UInt32)
    release : Proc(ITextRange*, UInt32)
    get_type_info_count : Proc(ITextRange*, UInt32*, HRESULT)
    get_type_info : Proc(ITextRange*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextRange*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextRange*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_text : Proc(ITextRange*, UInt8*, HRESULT)
    set_text : Proc(ITextRange*, UInt8, HRESULT)
    get_char : Proc(ITextRange*, Int32*, HRESULT)
    set_char : Proc(ITextRange*, Int32, HRESULT)
    get_duplicate : Proc(ITextRange*, ITextRange*, HRESULT)
    get_formatted_text : Proc(ITextRange*, ITextRange*, HRESULT)
    set_formatted_text : Proc(ITextRange*, ITextRange, HRESULT)
    get_start : Proc(ITextRange*, Int32*, HRESULT)
    set_start : Proc(ITextRange*, Int32, HRESULT)
    get_end : Proc(ITextRange*, Int32*, HRESULT)
    set_end : Proc(ITextRange*, Int32, HRESULT)
    get_font : Proc(ITextRange*, ITextFont*, HRESULT)
    set_font : Proc(ITextRange*, ITextFont, HRESULT)
    get_para : Proc(ITextRange*, ITextPara*, HRESULT)
    set_para : Proc(ITextRange*, ITextPara, HRESULT)
    get_story_length : Proc(ITextRange*, Int32*, HRESULT)
    get_story_type : Proc(ITextRange*, Int32*, HRESULT)
    collapse : Proc(ITextRange*, Int32, HRESULT)
    expand : Proc(ITextRange*, Int32, Int32*, HRESULT)
    get_index : Proc(ITextRange*, Int32, Int32*, HRESULT)
    set_index : Proc(ITextRange*, Int32, Int32, Int32, HRESULT)
    set_range : Proc(ITextRange*, Int32, Int32, HRESULT)
    in_range : Proc(ITextRange*, ITextRange, Int32*, HRESULT)
    in_story : Proc(ITextRange*, ITextRange, Int32*, HRESULT)
    is_equal : Proc(ITextRange*, ITextRange, Int32*, HRESULT)
    select : Proc(ITextRange*, HRESULT)
    start_of : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    end_of : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    move : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    move_start : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    move_end : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    move_while : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_while : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_while : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    move_until : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_until : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_until : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    find_text : Proc(ITextRange*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_start : Proc(ITextRange*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_end : Proc(ITextRange*, UInt8, Int32, Int32, Int32*, HRESULT)
    delete : Proc(ITextRange*, Int32, Int32, Int32*, HRESULT)
    cut : Proc(ITextRange*, VARIANT*, HRESULT)
    copy : Proc(ITextRange*, VARIANT*, HRESULT)
    paste : Proc(ITextRange*, VARIANT*, Int32, HRESULT)
    can_paste : Proc(ITextRange*, VARIANT*, Int32, Int32*, HRESULT)
    can_edit : Proc(ITextRange*, Int32*, HRESULT)
    change_case : Proc(ITextRange*, Int32, HRESULT)
    get_point : Proc(ITextRange*, Int32, Int32*, Int32*, HRESULT)
    set_point : Proc(ITextRange*, Int32, Int32, Int32, Int32, HRESULT)
    scroll_into_view : Proc(ITextRange*, Int32, HRESULT)
    get_embedded_object : Proc(ITextRange*, IUnknown*, HRESULT)
  end

  struct ITextRange
    lpVtbl : ITextRangeVTbl*
  end

  struct ITextSelectionVTbl
    query_interface : Proc(ITextSelection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextSelection*, UInt32)
    release : Proc(ITextSelection*, UInt32)
    get_type_info_count : Proc(ITextSelection*, UInt32*, HRESULT)
    get_type_info : Proc(ITextSelection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextSelection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextSelection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_text : Proc(ITextSelection*, UInt8*, HRESULT)
    set_text : Proc(ITextSelection*, UInt8, HRESULT)
    get_char : Proc(ITextSelection*, Int32*, HRESULT)
    set_char : Proc(ITextSelection*, Int32, HRESULT)
    get_duplicate : Proc(ITextSelection*, ITextRange*, HRESULT)
    get_formatted_text : Proc(ITextSelection*, ITextRange*, HRESULT)
    set_formatted_text : Proc(ITextSelection*, ITextRange, HRESULT)
    get_start : Proc(ITextSelection*, Int32*, HRESULT)
    set_start : Proc(ITextSelection*, Int32, HRESULT)
    get_end : Proc(ITextSelection*, Int32*, HRESULT)
    set_end : Proc(ITextSelection*, Int32, HRESULT)
    get_font : Proc(ITextSelection*, ITextFont*, HRESULT)
    set_font : Proc(ITextSelection*, ITextFont, HRESULT)
    get_para : Proc(ITextSelection*, ITextPara*, HRESULT)
    set_para : Proc(ITextSelection*, ITextPara, HRESULT)
    get_story_length : Proc(ITextSelection*, Int32*, HRESULT)
    get_story_type : Proc(ITextSelection*, Int32*, HRESULT)
    collapse : Proc(ITextSelection*, Int32, HRESULT)
    expand : Proc(ITextSelection*, Int32, Int32*, HRESULT)
    get_index : Proc(ITextSelection*, Int32, Int32*, HRESULT)
    set_index : Proc(ITextSelection*, Int32, Int32, Int32, HRESULT)
    set_range : Proc(ITextSelection*, Int32, Int32, HRESULT)
    in_range : Proc(ITextSelection*, ITextRange, Int32*, HRESULT)
    in_story : Proc(ITextSelection*, ITextRange, Int32*, HRESULT)
    is_equal : Proc(ITextSelection*, ITextRange, Int32*, HRESULT)
    select : Proc(ITextSelection*, HRESULT)
    start_of : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    end_of : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    move : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    move_start : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    move_end : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    move_while : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_while : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_while : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    move_until : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_until : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_until : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    find_text : Proc(ITextSelection*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_start : Proc(ITextSelection*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_end : Proc(ITextSelection*, UInt8, Int32, Int32, Int32*, HRESULT)
    delete : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    cut : Proc(ITextSelection*, VARIANT*, HRESULT)
    copy : Proc(ITextSelection*, VARIANT*, HRESULT)
    paste : Proc(ITextSelection*, VARIANT*, Int32, HRESULT)
    can_paste : Proc(ITextSelection*, VARIANT*, Int32, Int32*, HRESULT)
    can_edit : Proc(ITextSelection*, Int32*, HRESULT)
    change_case : Proc(ITextSelection*, Int32, HRESULT)
    get_point : Proc(ITextSelection*, Int32, Int32*, Int32*, HRESULT)
    set_point : Proc(ITextSelection*, Int32, Int32, Int32, Int32, HRESULT)
    scroll_into_view : Proc(ITextSelection*, Int32, HRESULT)
    get_embedded_object : Proc(ITextSelection*, IUnknown*, HRESULT)
    get_flags : Proc(ITextSelection*, Int32*, HRESULT)
    set_flags : Proc(ITextSelection*, Int32, HRESULT)
    get_type : Proc(ITextSelection*, Int32*, HRESULT)
    move_left : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, HRESULT)
    move_right : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, HRESULT)
    move_up : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, HRESULT)
    move_down : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, HRESULT)
    home_key : Proc(ITextSelection*, Tomconstants, Int32, Int32*, HRESULT)
    end_key : Proc(ITextSelection*, Int32, Int32, Int32*, HRESULT)
    type_text : Proc(ITextSelection*, UInt8, HRESULT)
  end

  struct ITextSelection
    lpVtbl : ITextSelectionVTbl*
  end

  struct ITextFontVTbl
    query_interface : Proc(ITextFont*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextFont*, UInt32)
    release : Proc(ITextFont*, UInt32)
    get_type_info_count : Proc(ITextFont*, UInt32*, HRESULT)
    get_type_info : Proc(ITextFont*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextFont*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextFont*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_duplicate : Proc(ITextFont*, ITextFont*, HRESULT)
    set_duplicate : Proc(ITextFont*, ITextFont, HRESULT)
    can_change : Proc(ITextFont*, Int32*, HRESULT)
    is_equal : Proc(ITextFont*, ITextFont, Int32*, HRESULT)
    reset : Proc(ITextFont*, Tomconstants, HRESULT)
    get_style : Proc(ITextFont*, Int32*, HRESULT)
    set_style : Proc(ITextFont*, Int32, HRESULT)
    get_all_caps : Proc(ITextFont*, Int32*, HRESULT)
    set_all_caps : Proc(ITextFont*, Int32, HRESULT)
    get_animation : Proc(ITextFont*, Int32*, HRESULT)
    set_animation : Proc(ITextFont*, Int32, HRESULT)
    get_back_color : Proc(ITextFont*, Int32*, HRESULT)
    set_back_color : Proc(ITextFont*, Int32, HRESULT)
    get_bold : Proc(ITextFont*, Int32*, HRESULT)
    set_bold : Proc(ITextFont*, Int32, HRESULT)
    get_emboss : Proc(ITextFont*, Int32*, HRESULT)
    set_emboss : Proc(ITextFont*, Int32, HRESULT)
    get_fore_color : Proc(ITextFont*, Int32*, HRESULT)
    set_fore_color : Proc(ITextFont*, Int32, HRESULT)
    get_hidden : Proc(ITextFont*, Int32*, HRESULT)
    set_hidden : Proc(ITextFont*, Int32, HRESULT)
    get_engrave : Proc(ITextFont*, Int32*, HRESULT)
    set_engrave : Proc(ITextFont*, Int32, HRESULT)
    get_italic : Proc(ITextFont*, Int32*, HRESULT)
    set_italic : Proc(ITextFont*, Int32, HRESULT)
    get_kerning : Proc(ITextFont*, Float32*, HRESULT)
    set_kerning : Proc(ITextFont*, Float32, HRESULT)
    get_language_id : Proc(ITextFont*, Int32*, HRESULT)
    set_language_id : Proc(ITextFont*, Int32, HRESULT)
    get_name : Proc(ITextFont*, UInt8*, HRESULT)
    set_name : Proc(ITextFont*, UInt8, HRESULT)
    get_outline : Proc(ITextFont*, Int32*, HRESULT)
    set_outline : Proc(ITextFont*, Int32, HRESULT)
    get_position : Proc(ITextFont*, Float32*, HRESULT)
    set_position : Proc(ITextFont*, Float32, HRESULT)
    get_protected : Proc(ITextFont*, Int32*, HRESULT)
    set_protected : Proc(ITextFont*, Int32, HRESULT)
    get_shadow : Proc(ITextFont*, Int32*, HRESULT)
    set_shadow : Proc(ITextFont*, Int32, HRESULT)
    get_size : Proc(ITextFont*, Float32*, HRESULT)
    set_size : Proc(ITextFont*, Float32, HRESULT)
    get_small_caps : Proc(ITextFont*, Int32*, HRESULT)
    set_small_caps : Proc(ITextFont*, Int32, HRESULT)
    get_spacing : Proc(ITextFont*, Float32*, HRESULT)
    set_spacing : Proc(ITextFont*, Float32, HRESULT)
    get_strike_through : Proc(ITextFont*, Int32*, HRESULT)
    set_strike_through : Proc(ITextFont*, Int32, HRESULT)
    get_subscript : Proc(ITextFont*, Int32*, HRESULT)
    set_subscript : Proc(ITextFont*, Int32, HRESULT)
    get_superscript : Proc(ITextFont*, Int32*, HRESULT)
    set_superscript : Proc(ITextFont*, Int32, HRESULT)
    get_underline : Proc(ITextFont*, Int32*, HRESULT)
    set_underline : Proc(ITextFont*, Int32, HRESULT)
    get_weight : Proc(ITextFont*, Int32*, HRESULT)
    set_weight : Proc(ITextFont*, Int32, HRESULT)
  end

  struct ITextFont
    lpVtbl : ITextFontVTbl*
  end

  struct ITextParaVTbl
    query_interface : Proc(ITextPara*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextPara*, UInt32)
    release : Proc(ITextPara*, UInt32)
    get_type_info_count : Proc(ITextPara*, UInt32*, HRESULT)
    get_type_info : Proc(ITextPara*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextPara*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextPara*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_duplicate : Proc(ITextPara*, ITextPara*, HRESULT)
    set_duplicate : Proc(ITextPara*, ITextPara, HRESULT)
    can_change : Proc(ITextPara*, Int32*, HRESULT)
    is_equal : Proc(ITextPara*, ITextPara, Int32*, HRESULT)
    reset : Proc(ITextPara*, Int32, HRESULT)
    get_style : Proc(ITextPara*, Int32*, HRESULT)
    set_style : Proc(ITextPara*, Int32, HRESULT)
    get_alignment : Proc(ITextPara*, Int32*, HRESULT)
    set_alignment : Proc(ITextPara*, Int32, HRESULT)
    get_hyphenation : Proc(ITextPara*, Tomconstants*, HRESULT)
    set_hyphenation : Proc(ITextPara*, Int32, HRESULT)
    get_first_line_indent : Proc(ITextPara*, Float32*, HRESULT)
    get_keep_together : Proc(ITextPara*, Tomconstants*, HRESULT)
    set_keep_together : Proc(ITextPara*, Int32, HRESULT)
    get_keep_with_next : Proc(ITextPara*, Tomconstants*, HRESULT)
    set_keep_with_next : Proc(ITextPara*, Int32, HRESULT)
    get_left_indent : Proc(ITextPara*, Float32*, HRESULT)
    get_line_spacing : Proc(ITextPara*, Float32*, HRESULT)
    get_line_spacing_rule : Proc(ITextPara*, Int32*, HRESULT)
    get_list_alignment : Proc(ITextPara*, Int32*, HRESULT)
    set_list_alignment : Proc(ITextPara*, Int32, HRESULT)
    get_list_level_index : Proc(ITextPara*, Int32*, HRESULT)
    set_list_level_index : Proc(ITextPara*, Int32, HRESULT)
    get_list_start : Proc(ITextPara*, Int32*, HRESULT)
    set_list_start : Proc(ITextPara*, Int32, HRESULT)
    get_list_tab : Proc(ITextPara*, Float32*, HRESULT)
    set_list_tab : Proc(ITextPara*, Float32, HRESULT)
    get_list_type : Proc(ITextPara*, Int32*, HRESULT)
    set_list_type : Proc(ITextPara*, Int32, HRESULT)
    get_no_line_number : Proc(ITextPara*, Int32*, HRESULT)
    set_no_line_number : Proc(ITextPara*, Int32, HRESULT)
    get_page_break_before : Proc(ITextPara*, Int32*, HRESULT)
    set_page_break_before : Proc(ITextPara*, Int32, HRESULT)
    get_right_indent : Proc(ITextPara*, Float32*, HRESULT)
    set_right_indent : Proc(ITextPara*, Float32, HRESULT)
    set_indents : Proc(ITextPara*, Float32, Float32, Float32, HRESULT)
    set_line_spacing : Proc(ITextPara*, Int32, Float32, HRESULT)
    get_space_after : Proc(ITextPara*, Float32*, HRESULT)
    set_space_after : Proc(ITextPara*, Float32, HRESULT)
    get_space_before : Proc(ITextPara*, Float32*, HRESULT)
    set_space_before : Proc(ITextPara*, Float32, HRESULT)
    get_widow_control : Proc(ITextPara*, Int32*, HRESULT)
    set_widow_control : Proc(ITextPara*, Int32, HRESULT)
    get_tab_count : Proc(ITextPara*, Int32*, HRESULT)
    add_tab : Proc(ITextPara*, Float32, Int32, Int32, HRESULT)
    clear_all_tabs : Proc(ITextPara*, HRESULT)
    delete_tab : Proc(ITextPara*, Float32, HRESULT)
    get_tab : Proc(ITextPara*, Int32, Float32*, Int32*, Int32*, HRESULT)
  end

  struct ITextPara
    lpVtbl : ITextParaVTbl*
  end

  struct ITextStoryRangesVTbl
    query_interface : Proc(ITextStoryRanges*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoryRanges*, UInt32)
    release : Proc(ITextStoryRanges*, UInt32)
    get_type_info_count : Proc(ITextStoryRanges*, UInt32*, HRESULT)
    get_type_info : Proc(ITextStoryRanges*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextStoryRanges*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextStoryRanges*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    _new_enum : Proc(ITextStoryRanges*, IUnknown*, HRESULT)
    item : Proc(ITextStoryRanges*, Int32, ITextRange*, HRESULT)
    get_count : Proc(ITextStoryRanges*, Int32*, HRESULT)
  end

  struct ITextStoryRanges
    lpVtbl : ITextStoryRangesVTbl*
  end

  struct ITextDocument2VTbl
    query_interface : Proc(ITextDocument2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextDocument2*, UInt32)
    release : Proc(ITextDocument2*, UInt32)
    get_type_info_count : Proc(ITextDocument2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextDocument2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextDocument2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextDocument2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ITextDocument2*, UInt8*, HRESULT)
    get_selection : Proc(ITextDocument2*, ITextSelection*, HRESULT)
    get_story_count : Proc(ITextDocument2*, Int32*, HRESULT)
    get_story_ranges : Proc(ITextDocument2*, ITextStoryRanges*, HRESULT)
    get_saved : Proc(ITextDocument2*, Int32*, HRESULT)
    set_saved : Proc(ITextDocument2*, Tomconstants, HRESULT)
    get_default_tab_stop : Proc(ITextDocument2*, Float32*, HRESULT)
    set_default_tab_stop : Proc(ITextDocument2*, Float32, HRESULT)
    new : Proc(ITextDocument2*, HRESULT)
    open : Proc(ITextDocument2*, VARIANT*, Int32, Int32, HRESULT)
    save : Proc(ITextDocument2*, VARIANT*, Int32, Int32, HRESULT)
    freeze : Proc(ITextDocument2*, Int32*, HRESULT)
    unfreeze : Proc(ITextDocument2*, Int32*, HRESULT)
    begin_edit_collection : Proc(ITextDocument2*, HRESULT)
    end_edit_collection : Proc(ITextDocument2*, HRESULT)
    undo : Proc(ITextDocument2*, Int32, Int32*, HRESULT)
    redo : Proc(ITextDocument2*, Int32, Int32*, HRESULT)
    range : Proc(ITextDocument2*, Int32, Int32, ITextRange*, HRESULT)
    range_from_point : Proc(ITextDocument2*, Int32, Int32, ITextRange*, HRESULT)
    get_caret_type : Proc(ITextDocument2*, Int32*, HRESULT)
    set_caret_type : Proc(ITextDocument2*, Int32, HRESULT)
    get_displays : Proc(ITextDocument2*, ITextDisplays*, HRESULT)
    get_document_font : Proc(ITextDocument2*, ITextFont2*, HRESULT)
    set_document_font : Proc(ITextDocument2*, ITextFont2, HRESULT)
    get_document_para : Proc(ITextDocument2*, ITextPara2*, HRESULT)
    set_document_para : Proc(ITextDocument2*, ITextPara2, HRESULT)
    get_east_asian_flags : Proc(ITextDocument2*, Tomconstants*, HRESULT)
    get_generator : Proc(ITextDocument2*, UInt8*, HRESULT)
    set_ime_in_progress : Proc(ITextDocument2*, Int32, HRESULT)
    get_notification_mode : Proc(ITextDocument2*, Int32*, HRESULT)
    set_notification_mode : Proc(ITextDocument2*, Int32, HRESULT)
    get_selection2 : Proc(ITextDocument2*, ITextSelection2*, HRESULT)
    get_story_ranges2 : Proc(ITextDocument2*, ITextStoryRanges2*, HRESULT)
    get_typography_options : Proc(ITextDocument2*, Int32*, HRESULT)
    get_version : Proc(ITextDocument2*, Int32*, HRESULT)
    get_window : Proc(ITextDocument2*, Int64*, HRESULT)
    attach_msg_filter : Proc(ITextDocument2*, IUnknown, HRESULT)
    check_text_limit : Proc(ITextDocument2*, Int32, Int32*, HRESULT)
    get_call_manager : Proc(ITextDocument2*, IUnknown*, HRESULT)
    get_client_rect : Proc(ITextDocument2*, Tomconstants, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_effect_color : Proc(ITextDocument2*, Int32, Int32*, HRESULT)
    get_imm_context : Proc(ITextDocument2*, Int64*, HRESULT)
    get_preferred_font : Proc(ITextDocument2*, Int32, Int32, Int32, Int32, Int32, UInt8*, Int32*, Int32*, HRESULT)
    get_property : Proc(ITextDocument2*, Int32, Int32*, HRESULT)
    get_strings : Proc(ITextDocument2*, ITextStrings*, HRESULT)
    notify : Proc(ITextDocument2*, Int32, HRESULT)
    range2 : Proc(ITextDocument2*, Int32, Int32, ITextRange2*, HRESULT)
    range_from_point2 : Proc(ITextDocument2*, Int32, Int32, Int32, ITextRange2*, HRESULT)
    release_call_manager : Proc(ITextDocument2*, IUnknown, HRESULT)
    release_imm_context : Proc(ITextDocument2*, Int64, HRESULT)
    set_effect_color : Proc(ITextDocument2*, Int32, Int32, HRESULT)
    set_property : Proc(ITextDocument2*, Int32, Int32, HRESULT)
    set_typography_options : Proc(ITextDocument2*, Int32, Int32, HRESULT)
    sys_beep : Proc(ITextDocument2*, HRESULT)
    update : Proc(ITextDocument2*, Int32, HRESULT)
    update_window : Proc(ITextDocument2*, HRESULT)
    get_math_properties : Proc(ITextDocument2*, Int32*, HRESULT)
    set_math_properties : Proc(ITextDocument2*, Int32, Int32, HRESULT)
    get_active_story : Proc(ITextDocument2*, ITextStory*, HRESULT)
    set_active_story : Proc(ITextDocument2*, ITextStory, HRESULT)
    get_main_story : Proc(ITextDocument2*, ITextStory*, HRESULT)
    get_new_story : Proc(ITextDocument2*, ITextStory*, HRESULT)
    get_story : Proc(ITextDocument2*, Int32, ITextStory*, HRESULT)
  end

  struct ITextDocument2
    lpVtbl : ITextDocument2VTbl*
  end

  struct ITextRange2VTbl
    query_interface : Proc(ITextRange2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextRange2*, UInt32)
    release : Proc(ITextRange2*, UInt32)
    get_type_info_count : Proc(ITextRange2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextRange2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextRange2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextRange2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_text : Proc(ITextRange2*, UInt8*, HRESULT)
    set_text : Proc(ITextRange2*, UInt8, HRESULT)
    get_char : Proc(ITextRange2*, Int32*, HRESULT)
    set_char : Proc(ITextRange2*, Int32, HRESULT)
    get_duplicate : Proc(ITextRange2*, ITextRange*, HRESULT)
    get_formatted_text : Proc(ITextRange2*, ITextRange*, HRESULT)
    set_formatted_text : Proc(ITextRange2*, ITextRange, HRESULT)
    get_start : Proc(ITextRange2*, Int32*, HRESULT)
    set_start : Proc(ITextRange2*, Int32, HRESULT)
    get_end : Proc(ITextRange2*, Int32*, HRESULT)
    set_end : Proc(ITextRange2*, Int32, HRESULT)
    get_font : Proc(ITextRange2*, ITextFont*, HRESULT)
    set_font : Proc(ITextRange2*, ITextFont, HRESULT)
    get_para : Proc(ITextRange2*, ITextPara*, HRESULT)
    set_para : Proc(ITextRange2*, ITextPara, HRESULT)
    get_story_length : Proc(ITextRange2*, Int32*, HRESULT)
    get_story_type : Proc(ITextRange2*, Int32*, HRESULT)
    collapse : Proc(ITextRange2*, Int32, HRESULT)
    expand : Proc(ITextRange2*, Int32, Int32*, HRESULT)
    get_index : Proc(ITextRange2*, Int32, Int32*, HRESULT)
    set_index : Proc(ITextRange2*, Int32, Int32, Int32, HRESULT)
    set_range : Proc(ITextRange2*, Int32, Int32, HRESULT)
    in_range : Proc(ITextRange2*, ITextRange, Int32*, HRESULT)
    in_story : Proc(ITextRange2*, ITextRange, Int32*, HRESULT)
    is_equal : Proc(ITextRange2*, ITextRange, Int32*, HRESULT)
    select : Proc(ITextRange2*, HRESULT)
    start_of : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    end_of : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    move : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    move_start : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    move_end : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    move_while : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_while : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_while : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    move_until : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_until : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_until : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    find_text : Proc(ITextRange2*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_start : Proc(ITextRange2*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_end : Proc(ITextRange2*, UInt8, Int32, Int32, Int32*, HRESULT)
    delete : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    cut : Proc(ITextRange2*, VARIANT*, HRESULT)
    copy : Proc(ITextRange2*, VARIANT*, HRESULT)
    paste : Proc(ITextRange2*, VARIANT*, Int32, HRESULT)
    can_paste : Proc(ITextRange2*, VARIANT*, Int32, Int32*, HRESULT)
    can_edit : Proc(ITextRange2*, Int32*, HRESULT)
    change_case : Proc(ITextRange2*, Int32, HRESULT)
    get_point : Proc(ITextRange2*, Int32, Int32*, Int32*, HRESULT)
    set_point : Proc(ITextRange2*, Int32, Int32, Int32, Int32, HRESULT)
    scroll_into_view : Proc(ITextRange2*, Int32, HRESULT)
    get_embedded_object : Proc(ITextRange2*, IUnknown*, HRESULT)
    get_flags : Proc(ITextRange2*, Int32*, HRESULT)
    set_flags : Proc(ITextRange2*, Int32, HRESULT)
    get_type : Proc(ITextRange2*, Int32*, HRESULT)
    move_left : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_right : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_up : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_down : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, HRESULT)
    home_key : Proc(ITextRange2*, Tomconstants, Int32, Int32*, HRESULT)
    end_key : Proc(ITextRange2*, Int32, Int32, Int32*, HRESULT)
    type_text : Proc(ITextRange2*, UInt8, HRESULT)
    get_cch : Proc(ITextRange2*, Int32*, HRESULT)
    get_cells : Proc(ITextRange2*, IUnknown*, HRESULT)
    get_column : Proc(ITextRange2*, IUnknown*, HRESULT)
    get_count : Proc(ITextRange2*, Int32*, HRESULT)
    get_duplicate2 : Proc(ITextRange2*, ITextRange2*, HRESULT)
    get_font2 : Proc(ITextRange2*, ITextFont2*, HRESULT)
    set_font2 : Proc(ITextRange2*, ITextFont2, HRESULT)
    get_formatted_text2 : Proc(ITextRange2*, ITextRange2*, HRESULT)
    set_formatted_text2 : Proc(ITextRange2*, ITextRange2, HRESULT)
    get_gravity : Proc(ITextRange2*, Int32*, HRESULT)
    set_gravity : Proc(ITextRange2*, Int32, HRESULT)
    get_para2 : Proc(ITextRange2*, ITextPara2*, HRESULT)
    set_para2 : Proc(ITextRange2*, ITextPara2, HRESULT)
    get_row : Proc(ITextRange2*, ITextRow*, HRESULT)
    get_start_para : Proc(ITextRange2*, Int32*, HRESULT)
    get_table : Proc(ITextRange2*, IUnknown*, HRESULT)
    get_url : Proc(ITextRange2*, UInt8*, HRESULT)
    set_url : Proc(ITextRange2*, UInt8, HRESULT)
    add_subrange : Proc(ITextRange2*, Int32, Int32, Int32, HRESULT)
    build_up_math : Proc(ITextRange2*, Int32, HRESULT)
    delete_subrange : Proc(ITextRange2*, Int32, Int32, HRESULT)
    find : Proc(ITextRange2*, ITextRange2, Int32, Int32, Int32*, HRESULT)
    get_char2 : Proc(ITextRange2*, Int32*, Int32, HRESULT)
    get_drop_cap : Proc(ITextRange2*, Int32*, Int32*, HRESULT)
    get_inline_object : Proc(ITextRange2*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_property : Proc(ITextRange2*, Int32, Int32*, HRESULT)
    get_rect : Proc(ITextRange2*, Int32, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_subrange : Proc(ITextRange2*, Int32, Int32*, Int32*, HRESULT)
    get_text2 : Proc(ITextRange2*, Int32, UInt8*, HRESULT)
    hex_to_unicode : Proc(ITextRange2*, HRESULT)
    insert_table : Proc(ITextRange2*, Int32, Int32, Int32, HRESULT)
    linearize : Proc(ITextRange2*, Int32, HRESULT)
    set_active_subrange : Proc(ITextRange2*, Int32, Int32, HRESULT)
    set_drop_cap : Proc(ITextRange2*, Int32, Int32, HRESULT)
    set_property : Proc(ITextRange2*, Int32, Int32, HRESULT)
    set_text2 : Proc(ITextRange2*, Int32, UInt8, HRESULT)
    unicode_to_hex : Proc(ITextRange2*, HRESULT)
    set_inline_object : Proc(ITextRange2*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, HRESULT)
    get_math_function_type : Proc(ITextRange2*, UInt8, Int32*, HRESULT)
    insert_image : Proc(ITextRange2*, Int32, Int32, Int32, TEXT_ALIGN_OPTIONS, UInt8, IStream, HRESULT)
  end

  struct ITextRange2
    lpVtbl : ITextRange2VTbl*
  end

  struct ITextSelection2VTbl
    query_interface : Proc(ITextSelection2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextSelection2*, UInt32)
    release : Proc(ITextSelection2*, UInt32)
    get_type_info_count : Proc(ITextSelection2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextSelection2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextSelection2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextSelection2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_text : Proc(ITextSelection2*, UInt8*, HRESULT)
    set_text : Proc(ITextSelection2*, UInt8, HRESULT)
    get_char : Proc(ITextSelection2*, Int32*, HRESULT)
    set_char : Proc(ITextSelection2*, Int32, HRESULT)
    get_duplicate : Proc(ITextSelection2*, ITextRange*, HRESULT)
    get_formatted_text : Proc(ITextSelection2*, ITextRange*, HRESULT)
    set_formatted_text : Proc(ITextSelection2*, ITextRange, HRESULT)
    get_start : Proc(ITextSelection2*, Int32*, HRESULT)
    set_start : Proc(ITextSelection2*, Int32, HRESULT)
    get_end : Proc(ITextSelection2*, Int32*, HRESULT)
    set_end : Proc(ITextSelection2*, Int32, HRESULT)
    get_font : Proc(ITextSelection2*, ITextFont*, HRESULT)
    set_font : Proc(ITextSelection2*, ITextFont, HRESULT)
    get_para : Proc(ITextSelection2*, ITextPara*, HRESULT)
    set_para : Proc(ITextSelection2*, ITextPara, HRESULT)
    get_story_length : Proc(ITextSelection2*, Int32*, HRESULT)
    get_story_type : Proc(ITextSelection2*, Int32*, HRESULT)
    collapse : Proc(ITextSelection2*, Int32, HRESULT)
    expand : Proc(ITextSelection2*, Int32, Int32*, HRESULT)
    get_index : Proc(ITextSelection2*, Int32, Int32*, HRESULT)
    set_index : Proc(ITextSelection2*, Int32, Int32, Int32, HRESULT)
    set_range : Proc(ITextSelection2*, Int32, Int32, HRESULT)
    in_range : Proc(ITextSelection2*, ITextRange, Int32*, HRESULT)
    in_story : Proc(ITextSelection2*, ITextRange, Int32*, HRESULT)
    is_equal : Proc(ITextSelection2*, ITextRange, Int32*, HRESULT)
    select : Proc(ITextSelection2*, HRESULT)
    start_of : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    end_of : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    move : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    move_start : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    move_end : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    move_while : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_while : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_while : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    move_until : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    move_start_until : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    move_end_until : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    find_text : Proc(ITextSelection2*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_start : Proc(ITextSelection2*, UInt8, Int32, Int32, Int32*, HRESULT)
    find_text_end : Proc(ITextSelection2*, UInt8, Int32, Int32, Int32*, HRESULT)
    delete : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    cut : Proc(ITextSelection2*, VARIANT*, HRESULT)
    copy : Proc(ITextSelection2*, VARIANT*, HRESULT)
    paste : Proc(ITextSelection2*, VARIANT*, Int32, HRESULT)
    can_paste : Proc(ITextSelection2*, VARIANT*, Int32, Int32*, HRESULT)
    can_edit : Proc(ITextSelection2*, Int32*, HRESULT)
    change_case : Proc(ITextSelection2*, Int32, HRESULT)
    get_point : Proc(ITextSelection2*, Int32, Int32*, Int32*, HRESULT)
    set_point : Proc(ITextSelection2*, Int32, Int32, Int32, Int32, HRESULT)
    scroll_into_view : Proc(ITextSelection2*, Int32, HRESULT)
    get_embedded_object : Proc(ITextSelection2*, IUnknown*, HRESULT)
    get_flags : Proc(ITextSelection2*, Int32*, HRESULT)
    set_flags : Proc(ITextSelection2*, Int32, HRESULT)
    get_type : Proc(ITextSelection2*, Int32*, HRESULT)
    move_left : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_right : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_up : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, HRESULT)
    move_down : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, HRESULT)
    home_key : Proc(ITextSelection2*, Tomconstants, Int32, Int32*, HRESULT)
    end_key : Proc(ITextSelection2*, Int32, Int32, Int32*, HRESULT)
    type_text : Proc(ITextSelection2*, UInt8, HRESULT)
    get_cch : Proc(ITextSelection2*, Int32*, HRESULT)
    get_cells : Proc(ITextSelection2*, IUnknown*, HRESULT)
    get_column : Proc(ITextSelection2*, IUnknown*, HRESULT)
    get_count : Proc(ITextSelection2*, Int32*, HRESULT)
    get_duplicate2 : Proc(ITextSelection2*, ITextRange2*, HRESULT)
    get_font2 : Proc(ITextSelection2*, ITextFont2*, HRESULT)
    set_font2 : Proc(ITextSelection2*, ITextFont2, HRESULT)
    get_formatted_text2 : Proc(ITextSelection2*, ITextRange2*, HRESULT)
    set_formatted_text2 : Proc(ITextSelection2*, ITextRange2, HRESULT)
    get_gravity : Proc(ITextSelection2*, Int32*, HRESULT)
    set_gravity : Proc(ITextSelection2*, Int32, HRESULT)
    get_para2 : Proc(ITextSelection2*, ITextPara2*, HRESULT)
    set_para2 : Proc(ITextSelection2*, ITextPara2, HRESULT)
    get_row : Proc(ITextSelection2*, ITextRow*, HRESULT)
    get_start_para : Proc(ITextSelection2*, Int32*, HRESULT)
    get_table : Proc(ITextSelection2*, IUnknown*, HRESULT)
    get_url : Proc(ITextSelection2*, UInt8*, HRESULT)
    set_url : Proc(ITextSelection2*, UInt8, HRESULT)
    add_subrange : Proc(ITextSelection2*, Int32, Int32, Int32, HRESULT)
    build_up_math : Proc(ITextSelection2*, Int32, HRESULT)
    delete_subrange : Proc(ITextSelection2*, Int32, Int32, HRESULT)
    find : Proc(ITextSelection2*, ITextRange2, Int32, Int32, Int32*, HRESULT)
    get_char2 : Proc(ITextSelection2*, Int32*, Int32, HRESULT)
    get_drop_cap : Proc(ITextSelection2*, Int32*, Int32*, HRESULT)
    get_inline_object : Proc(ITextSelection2*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_property : Proc(ITextSelection2*, Int32, Int32*, HRESULT)
    get_rect : Proc(ITextSelection2*, Int32, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_subrange : Proc(ITextSelection2*, Int32, Int32*, Int32*, HRESULT)
    get_text2 : Proc(ITextSelection2*, Int32, UInt8*, HRESULT)
    hex_to_unicode : Proc(ITextSelection2*, HRESULT)
    insert_table : Proc(ITextSelection2*, Int32, Int32, Int32, HRESULT)
    linearize : Proc(ITextSelection2*, Int32, HRESULT)
    set_active_subrange : Proc(ITextSelection2*, Int32, Int32, HRESULT)
    set_drop_cap : Proc(ITextSelection2*, Int32, Int32, HRESULT)
    set_property : Proc(ITextSelection2*, Int32, Int32, HRESULT)
    set_text2 : Proc(ITextSelection2*, Int32, UInt8, HRESULT)
    unicode_to_hex : Proc(ITextSelection2*, HRESULT)
    set_inline_object : Proc(ITextSelection2*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, HRESULT)
    get_math_function_type : Proc(ITextSelection2*, UInt8, Int32*, HRESULT)
    insert_image : Proc(ITextSelection2*, Int32, Int32, Int32, TEXT_ALIGN_OPTIONS, UInt8, IStream, HRESULT)
  end

  struct ITextSelection2
    lpVtbl : ITextSelection2VTbl*
  end

  struct ITextFont2VTbl
    query_interface : Proc(ITextFont2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextFont2*, UInt32)
    release : Proc(ITextFont2*, UInt32)
    get_type_info_count : Proc(ITextFont2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextFont2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextFont2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextFont2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_duplicate : Proc(ITextFont2*, ITextFont*, HRESULT)
    set_duplicate : Proc(ITextFont2*, ITextFont, HRESULT)
    can_change : Proc(ITextFont2*, Int32*, HRESULT)
    is_equal : Proc(ITextFont2*, ITextFont, Int32*, HRESULT)
    reset : Proc(ITextFont2*, Tomconstants, HRESULT)
    get_style : Proc(ITextFont2*, Int32*, HRESULT)
    set_style : Proc(ITextFont2*, Int32, HRESULT)
    get_all_caps : Proc(ITextFont2*, Int32*, HRESULT)
    set_all_caps : Proc(ITextFont2*, Int32, HRESULT)
    get_animation : Proc(ITextFont2*, Int32*, HRESULT)
    set_animation : Proc(ITextFont2*, Int32, HRESULT)
    get_back_color : Proc(ITextFont2*, Int32*, HRESULT)
    set_back_color : Proc(ITextFont2*, Int32, HRESULT)
    get_bold : Proc(ITextFont2*, Int32*, HRESULT)
    set_bold : Proc(ITextFont2*, Int32, HRESULT)
    get_emboss : Proc(ITextFont2*, Int32*, HRESULT)
    set_emboss : Proc(ITextFont2*, Int32, HRESULT)
    get_fore_color : Proc(ITextFont2*, Int32*, HRESULT)
    set_fore_color : Proc(ITextFont2*, Int32, HRESULT)
    get_hidden : Proc(ITextFont2*, Int32*, HRESULT)
    set_hidden : Proc(ITextFont2*, Int32, HRESULT)
    get_engrave : Proc(ITextFont2*, Int32*, HRESULT)
    set_engrave : Proc(ITextFont2*, Int32, HRESULT)
    get_italic : Proc(ITextFont2*, Int32*, HRESULT)
    set_italic : Proc(ITextFont2*, Int32, HRESULT)
    get_kerning : Proc(ITextFont2*, Float32*, HRESULT)
    set_kerning : Proc(ITextFont2*, Float32, HRESULT)
    get_language_id : Proc(ITextFont2*, Int32*, HRESULT)
    set_language_id : Proc(ITextFont2*, Int32, HRESULT)
    get_name : Proc(ITextFont2*, UInt8*, HRESULT)
    set_name : Proc(ITextFont2*, UInt8, HRESULT)
    get_outline : Proc(ITextFont2*, Int32*, HRESULT)
    set_outline : Proc(ITextFont2*, Int32, HRESULT)
    get_position : Proc(ITextFont2*, Float32*, HRESULT)
    set_position : Proc(ITextFont2*, Float32, HRESULT)
    get_protected : Proc(ITextFont2*, Int32*, HRESULT)
    set_protected : Proc(ITextFont2*, Int32, HRESULT)
    get_shadow : Proc(ITextFont2*, Int32*, HRESULT)
    set_shadow : Proc(ITextFont2*, Int32, HRESULT)
    get_size : Proc(ITextFont2*, Float32*, HRESULT)
    set_size : Proc(ITextFont2*, Float32, HRESULT)
    get_small_caps : Proc(ITextFont2*, Int32*, HRESULT)
    set_small_caps : Proc(ITextFont2*, Int32, HRESULT)
    get_spacing : Proc(ITextFont2*, Float32*, HRESULT)
    set_spacing : Proc(ITextFont2*, Float32, HRESULT)
    get_strike_through : Proc(ITextFont2*, Int32*, HRESULT)
    set_strike_through : Proc(ITextFont2*, Int32, HRESULT)
    get_subscript : Proc(ITextFont2*, Int32*, HRESULT)
    set_subscript : Proc(ITextFont2*, Int32, HRESULT)
    get_superscript : Proc(ITextFont2*, Int32*, HRESULT)
    set_superscript : Proc(ITextFont2*, Int32, HRESULT)
    get_underline : Proc(ITextFont2*, Int32*, HRESULT)
    set_underline : Proc(ITextFont2*, Int32, HRESULT)
    get_weight : Proc(ITextFont2*, Int32*, HRESULT)
    set_weight : Proc(ITextFont2*, Int32, HRESULT)
    get_count : Proc(ITextFont2*, Int32*, HRESULT)
    get_auto_ligatures : Proc(ITextFont2*, Int32*, HRESULT)
    set_auto_ligatures : Proc(ITextFont2*, Int32, HRESULT)
    get_autospace_alpha : Proc(ITextFont2*, Int32*, HRESULT)
    set_autospace_alpha : Proc(ITextFont2*, Int32, HRESULT)
    get_autospace_numeric : Proc(ITextFont2*, Int32*, HRESULT)
    set_autospace_numeric : Proc(ITextFont2*, Int32, HRESULT)
    get_autospace_parens : Proc(ITextFont2*, Int32*, HRESULT)
    set_autospace_parens : Proc(ITextFont2*, Int32, HRESULT)
    get_char_rep : Proc(ITextFont2*, Int32*, HRESULT)
    set_char_rep : Proc(ITextFont2*, Int32, HRESULT)
    get_compression_mode : Proc(ITextFont2*, Int32*, HRESULT)
    set_compression_mode : Proc(ITextFont2*, Int32, HRESULT)
    get_cookie : Proc(ITextFont2*, Int32*, HRESULT)
    set_cookie : Proc(ITextFont2*, Int32, HRESULT)
    get_double_strike : Proc(ITextFont2*, Int32*, HRESULT)
    set_double_strike : Proc(ITextFont2*, Int32, HRESULT)
    get_duplicate2 : Proc(ITextFont2*, ITextFont2*, HRESULT)
    set_duplicate2 : Proc(ITextFont2*, ITextFont2, HRESULT)
    get_link_type : Proc(ITextFont2*, Int32*, HRESULT)
    get_math_zone : Proc(ITextFont2*, Int32*, HRESULT)
    set_math_zone : Proc(ITextFont2*, Int32, HRESULT)
    get_mod_width_pairs : Proc(ITextFont2*, Int32*, HRESULT)
    set_mod_width_pairs : Proc(ITextFont2*, Int32, HRESULT)
    get_mod_width_space : Proc(ITextFont2*, Int32*, HRESULT)
    set_mod_width_space : Proc(ITextFont2*, Int32, HRESULT)
    get_old_numbers : Proc(ITextFont2*, Int32*, HRESULT)
    set_old_numbers : Proc(ITextFont2*, Int32, HRESULT)
    get_overlapping : Proc(ITextFont2*, Int32*, HRESULT)
    set_overlapping : Proc(ITextFont2*, Int32, HRESULT)
    get_position_sub_super : Proc(ITextFont2*, Int32*, HRESULT)
    set_position_sub_super : Proc(ITextFont2*, Int32, HRESULT)
    get_scaling : Proc(ITextFont2*, Int32*, HRESULT)
    set_scaling : Proc(ITextFont2*, Int32, HRESULT)
    get_space_extension : Proc(ITextFont2*, Float32*, HRESULT)
    set_space_extension : Proc(ITextFont2*, Float32, HRESULT)
    get_underline_position_mode : Proc(ITextFont2*, Int32*, HRESULT)
    set_underline_position_mode : Proc(ITextFont2*, Int32, HRESULT)
    get_effects : Proc(ITextFont2*, Int32*, Int32*, HRESULT)
    get_effects2 : Proc(ITextFont2*, Int32*, Int32*, HRESULT)
    get_property : Proc(ITextFont2*, Int32, Int32*, HRESULT)
    get_property_info : Proc(ITextFont2*, Int32, Int32*, Int32*, HRESULT)
    is_equal2 : Proc(ITextFont2*, ITextFont2, Int32*, HRESULT)
    set_effects : Proc(ITextFont2*, Int32, Int32, HRESULT)
    set_effects2 : Proc(ITextFont2*, Int32, Int32, HRESULT)
    set_property : Proc(ITextFont2*, Int32, Int32, HRESULT)
  end

  struct ITextFont2
    lpVtbl : ITextFont2VTbl*
  end

  struct ITextPara2VTbl
    query_interface : Proc(ITextPara2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextPara2*, UInt32)
    release : Proc(ITextPara2*, UInt32)
    get_type_info_count : Proc(ITextPara2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextPara2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextPara2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextPara2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_duplicate : Proc(ITextPara2*, ITextPara*, HRESULT)
    set_duplicate : Proc(ITextPara2*, ITextPara, HRESULT)
    can_change : Proc(ITextPara2*, Int32*, HRESULT)
    is_equal : Proc(ITextPara2*, ITextPara, Int32*, HRESULT)
    reset : Proc(ITextPara2*, Int32, HRESULT)
    get_style : Proc(ITextPara2*, Int32*, HRESULT)
    set_style : Proc(ITextPara2*, Int32, HRESULT)
    get_alignment : Proc(ITextPara2*, Int32*, HRESULT)
    set_alignment : Proc(ITextPara2*, Int32, HRESULT)
    get_hyphenation : Proc(ITextPara2*, Tomconstants*, HRESULT)
    set_hyphenation : Proc(ITextPara2*, Int32, HRESULT)
    get_first_line_indent : Proc(ITextPara2*, Float32*, HRESULT)
    get_keep_together : Proc(ITextPara2*, Tomconstants*, HRESULT)
    set_keep_together : Proc(ITextPara2*, Int32, HRESULT)
    get_keep_with_next : Proc(ITextPara2*, Tomconstants*, HRESULT)
    set_keep_with_next : Proc(ITextPara2*, Int32, HRESULT)
    get_left_indent : Proc(ITextPara2*, Float32*, HRESULT)
    get_line_spacing : Proc(ITextPara2*, Float32*, HRESULT)
    get_line_spacing_rule : Proc(ITextPara2*, Int32*, HRESULT)
    get_list_alignment : Proc(ITextPara2*, Int32*, HRESULT)
    set_list_alignment : Proc(ITextPara2*, Int32, HRESULT)
    get_list_level_index : Proc(ITextPara2*, Int32*, HRESULT)
    set_list_level_index : Proc(ITextPara2*, Int32, HRESULT)
    get_list_start : Proc(ITextPara2*, Int32*, HRESULT)
    set_list_start : Proc(ITextPara2*, Int32, HRESULT)
    get_list_tab : Proc(ITextPara2*, Float32*, HRESULT)
    set_list_tab : Proc(ITextPara2*, Float32, HRESULT)
    get_list_type : Proc(ITextPara2*, Int32*, HRESULT)
    set_list_type : Proc(ITextPara2*, Int32, HRESULT)
    get_no_line_number : Proc(ITextPara2*, Int32*, HRESULT)
    set_no_line_number : Proc(ITextPara2*, Int32, HRESULT)
    get_page_break_before : Proc(ITextPara2*, Int32*, HRESULT)
    set_page_break_before : Proc(ITextPara2*, Int32, HRESULT)
    get_right_indent : Proc(ITextPara2*, Float32*, HRESULT)
    set_right_indent : Proc(ITextPara2*, Float32, HRESULT)
    set_indents : Proc(ITextPara2*, Float32, Float32, Float32, HRESULT)
    set_line_spacing : Proc(ITextPara2*, Int32, Float32, HRESULT)
    get_space_after : Proc(ITextPara2*, Float32*, HRESULT)
    set_space_after : Proc(ITextPara2*, Float32, HRESULT)
    get_space_before : Proc(ITextPara2*, Float32*, HRESULT)
    set_space_before : Proc(ITextPara2*, Float32, HRESULT)
    get_widow_control : Proc(ITextPara2*, Int32*, HRESULT)
    set_widow_control : Proc(ITextPara2*, Int32, HRESULT)
    get_tab_count : Proc(ITextPara2*, Int32*, HRESULT)
    add_tab : Proc(ITextPara2*, Float32, Int32, Int32, HRESULT)
    clear_all_tabs : Proc(ITextPara2*, HRESULT)
    delete_tab : Proc(ITextPara2*, Float32, HRESULT)
    get_tab : Proc(ITextPara2*, Int32, Float32*, Int32*, Int32*, HRESULT)
    get_borders : Proc(ITextPara2*, IUnknown*, HRESULT)
    get_duplicate2 : Proc(ITextPara2*, ITextPara2*, HRESULT)
    set_duplicate2 : Proc(ITextPara2*, ITextPara2, HRESULT)
    get_font_alignment : Proc(ITextPara2*, Int32*, HRESULT)
    set_font_alignment : Proc(ITextPara2*, Int32, HRESULT)
    get_hanging_punctuation : Proc(ITextPara2*, Int32*, HRESULT)
    set_hanging_punctuation : Proc(ITextPara2*, Int32, HRESULT)
    get_snap_to_grid : Proc(ITextPara2*, Int32*, HRESULT)
    set_snap_to_grid : Proc(ITextPara2*, Int32, HRESULT)
    get_trim_punctuation_at_start : Proc(ITextPara2*, Int32*, HRESULT)
    set_trim_punctuation_at_start : Proc(ITextPara2*, Int32, HRESULT)
    get_effects : Proc(ITextPara2*, Int32*, Int32*, HRESULT)
    get_property : Proc(ITextPara2*, Int32, Int32*, HRESULT)
    is_equal2 : Proc(ITextPara2*, ITextPara2, Int32*, HRESULT)
    set_effects : Proc(ITextPara2*, Int32, Int32, HRESULT)
    set_property : Proc(ITextPara2*, Int32, Int32, HRESULT)
  end

  struct ITextPara2
    lpVtbl : ITextPara2VTbl*
  end

  struct ITextStoryRanges2VTbl
    query_interface : Proc(ITextStoryRanges2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoryRanges2*, UInt32)
    release : Proc(ITextStoryRanges2*, UInt32)
    get_type_info_count : Proc(ITextStoryRanges2*, UInt32*, HRESULT)
    get_type_info : Proc(ITextStoryRanges2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextStoryRanges2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextStoryRanges2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    _new_enum : Proc(ITextStoryRanges2*, IUnknown*, HRESULT)
    item : Proc(ITextStoryRanges2*, Int32, ITextRange*, HRESULT)
    get_count : Proc(ITextStoryRanges2*, Int32*, HRESULT)
    item2 : Proc(ITextStoryRanges2*, Int32, ITextRange2*, HRESULT)
  end

  struct ITextStoryRanges2
    lpVtbl : ITextStoryRanges2VTbl*
  end

  struct ITextStoryVTbl
    query_interface : Proc(ITextStory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStory*, UInt32)
    release : Proc(ITextStory*, UInt32)
    get_active : Proc(ITextStory*, Int32*, HRESULT)
    set_active : Proc(ITextStory*, Int32, HRESULT)
    get_display : Proc(ITextStory*, IUnknown*, HRESULT)
    get_index : Proc(ITextStory*, Int32*, HRESULT)
    get_type : Proc(ITextStory*, Int32*, HRESULT)
    set_type : Proc(ITextStory*, Int32, HRESULT)
    get_property : Proc(ITextStory*, Int32, Int32*, HRESULT)
    get_range : Proc(ITextStory*, Int32, Int32, ITextRange2*, HRESULT)
    get_text : Proc(ITextStory*, Int32, UInt8*, HRESULT)
    set_formatted_text : Proc(ITextStory*, IUnknown, HRESULT)
    set_property : Proc(ITextStory*, Int32, Int32, HRESULT)
    set_text : Proc(ITextStory*, Int32, UInt8, HRESULT)
  end

  struct ITextStory
    lpVtbl : ITextStoryVTbl*
  end

  struct ITextStringsVTbl
    query_interface : Proc(ITextStrings*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStrings*, UInt32)
    release : Proc(ITextStrings*, UInt32)
    get_type_info_count : Proc(ITextStrings*, UInt32*, HRESULT)
    get_type_info : Proc(ITextStrings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextStrings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextStrings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    item : Proc(ITextStrings*, Int32, ITextRange2*, HRESULT)
    get_count : Proc(ITextStrings*, Int32*, HRESULT)
    add : Proc(ITextStrings*, UInt8, HRESULT)
    append : Proc(ITextStrings*, ITextRange2, Int32, HRESULT)
    cat2 : Proc(ITextStrings*, Int32, HRESULT)
    cat_top2 : Proc(ITextStrings*, UInt8, HRESULT)
    delete_range : Proc(ITextStrings*, ITextRange2, HRESULT)
    encode_function : Proc(ITextStrings*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, ITextRange2, HRESULT)
    get_cch : Proc(ITextStrings*, Int32, Int32*, HRESULT)
    insert_null_str : Proc(ITextStrings*, Int32, HRESULT)
    move_boundary : Proc(ITextStrings*, Int32, Int32, HRESULT)
    prefix_top : Proc(ITextStrings*, UInt8, HRESULT)
    remove : Proc(ITextStrings*, Int32, Int32, HRESULT)
    set_formatted_text : Proc(ITextStrings*, ITextRange2, ITextRange2, HRESULT)
    set_op_cp : Proc(ITextStrings*, Int32, Int32, HRESULT)
    suffix_top : Proc(ITextStrings*, UInt8, ITextRange2, HRESULT)
    swap : Proc(ITextStrings*, HRESULT)
  end

  struct ITextStrings
    lpVtbl : ITextStringsVTbl*
  end

  struct ITextRowVTbl
    query_interface : Proc(ITextRow*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextRow*, UInt32)
    release : Proc(ITextRow*, UInt32)
    get_type_info_count : Proc(ITextRow*, UInt32*, HRESULT)
    get_type_info : Proc(ITextRow*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextRow*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextRow*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_alignment : Proc(ITextRow*, Int32*, HRESULT)
    set_alignment : Proc(ITextRow*, Int32, HRESULT)
    get_cell_count : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_count : Proc(ITextRow*, Int32, HRESULT)
    get_cell_count_cache : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_count_cache : Proc(ITextRow*, Int32, HRESULT)
    get_cell_index : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_index : Proc(ITextRow*, Int32, HRESULT)
    get_cell_margin : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_margin : Proc(ITextRow*, Int32, HRESULT)
    get_height : Proc(ITextRow*, Int32*, HRESULT)
    set_height : Proc(ITextRow*, Int32, HRESULT)
    get_indent : Proc(ITextRow*, Int32*, HRESULT)
    set_indent : Proc(ITextRow*, Int32, HRESULT)
    get_keep_together : Proc(ITextRow*, Int32*, HRESULT)
    set_keep_together : Proc(ITextRow*, Int32, HRESULT)
    get_keep_with_next : Proc(ITextRow*, Int32*, HRESULT)
    set_keep_with_next : Proc(ITextRow*, Int32, HRESULT)
    get_nest_level : Proc(ITextRow*, Int32*, HRESULT)
    get_rtl : Proc(ITextRow*, Int32*, HRESULT)
    set_rtl : Proc(ITextRow*, Int32, HRESULT)
    get_cell_alignment : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_alignment : Proc(ITextRow*, Int32, HRESULT)
    get_cell_color_back : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_color_back : Proc(ITextRow*, Int32, HRESULT)
    get_cell_color_fore : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_color_fore : Proc(ITextRow*, Int32, HRESULT)
    get_cell_merge_flags : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_merge_flags : Proc(ITextRow*, Int32, HRESULT)
    get_cell_shading : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_shading : Proc(ITextRow*, Int32, HRESULT)
    get_cell_vertical_text : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_vertical_text : Proc(ITextRow*, Int32, HRESULT)
    get_cell_width : Proc(ITextRow*, Int32*, HRESULT)
    set_cell_width : Proc(ITextRow*, Int32, HRESULT)
    get_cell_border_colors : Proc(ITextRow*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_cell_border_widths : Proc(ITextRow*, Int32*, Int32*, Int32*, Int32*, HRESULT)
    set_cell_border_colors : Proc(ITextRow*, Int32, Int32, Int32, Int32, HRESULT)
    set_cell_border_widths : Proc(ITextRow*, Int32, Int32, Int32, Int32, HRESULT)
    apply : Proc(ITextRow*, Int32, Tomconstants, HRESULT)
    can_change : Proc(ITextRow*, Int32*, HRESULT)
    get_property : Proc(ITextRow*, Int32, Int32*, HRESULT)
    insert : Proc(ITextRow*, Int32, HRESULT)
    is_equal : Proc(ITextRow*, ITextRow, Int32*, HRESULT)
    reset : Proc(ITextRow*, Int32, HRESULT)
    set_property : Proc(ITextRow*, Int32, Int32, HRESULT)
  end

  struct ITextRow
    lpVtbl : ITextRowVTbl*
  end

  struct ITextDisplaysVTbl
    query_interface : Proc(ITextDisplays*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextDisplays*, UInt32)
    release : Proc(ITextDisplays*, UInt32)
    get_type_info_count : Proc(ITextDisplays*, UInt32*, HRESULT)
    get_type_info : Proc(ITextDisplays*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextDisplays*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextDisplays*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct ITextDisplays
    lpVtbl : ITextDisplaysVTbl*
  end

  struct ITextDocument2OldVTbl
    query_interface : Proc(ITextDocument2Old*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextDocument2Old*, UInt32)
    release : Proc(ITextDocument2Old*, UInt32)
    get_type_info_count : Proc(ITextDocument2Old*, UInt32*, HRESULT)
    get_type_info : Proc(ITextDocument2Old*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITextDocument2Old*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITextDocument2Old*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ITextDocument2Old*, UInt8*, HRESULT)
    get_selection : Proc(ITextDocument2Old*, ITextSelection*, HRESULT)
    get_story_count : Proc(ITextDocument2Old*, Int32*, HRESULT)
    get_story_ranges : Proc(ITextDocument2Old*, ITextStoryRanges*, HRESULT)
    get_saved : Proc(ITextDocument2Old*, Int32*, HRESULT)
    set_saved : Proc(ITextDocument2Old*, Tomconstants, HRESULT)
    get_default_tab_stop : Proc(ITextDocument2Old*, Float32*, HRESULT)
    set_default_tab_stop : Proc(ITextDocument2Old*, Float32, HRESULT)
    new : Proc(ITextDocument2Old*, HRESULT)
    open : Proc(ITextDocument2Old*, VARIANT*, Int32, Int32, HRESULT)
    save : Proc(ITextDocument2Old*, VARIANT*, Int32, Int32, HRESULT)
    freeze : Proc(ITextDocument2Old*, Int32*, HRESULT)
    unfreeze : Proc(ITextDocument2Old*, Int32*, HRESULT)
    begin_edit_collection : Proc(ITextDocument2Old*, HRESULT)
    end_edit_collection : Proc(ITextDocument2Old*, HRESULT)
    undo : Proc(ITextDocument2Old*, Int32, Int32*, HRESULT)
    redo : Proc(ITextDocument2Old*, Int32, Int32*, HRESULT)
    range : Proc(ITextDocument2Old*, Int32, Int32, ITextRange*, HRESULT)
    range_from_point : Proc(ITextDocument2Old*, Int32, Int32, ITextRange*, HRESULT)
    attach_msg_filter : Proc(ITextDocument2Old*, IUnknown, HRESULT)
    set_effect_color : Proc(ITextDocument2Old*, Int32, UInt32, HRESULT)
    get_effect_color : Proc(ITextDocument2Old*, Int32, UInt32*, HRESULT)
    get_caret_type : Proc(ITextDocument2Old*, Int32*, HRESULT)
    set_caret_type : Proc(ITextDocument2Old*, Int32, HRESULT)
    get_imm_context : Proc(ITextDocument2Old*, Int64*, HRESULT)
    release_imm_context : Proc(ITextDocument2Old*, Int64, HRESULT)
    get_preferred_font : Proc(ITextDocument2Old*, Int32, Int32, Int32, Int32, Int32, UInt8*, Int32*, Int32*, HRESULT)
    get_notification_mode : Proc(ITextDocument2Old*, Int32*, HRESULT)
    set_notification_mode : Proc(ITextDocument2Old*, Int32, HRESULT)
    get_client_rect : Proc(ITextDocument2Old*, Int32, Int32*, Int32*, Int32*, Int32*, HRESULT)
    get_selection2 : Proc(ITextDocument2Old*, ITextSelection*, HRESULT)
    get_window : Proc(ITextDocument2Old*, Int32*, HRESULT)
    get_fe_flags : Proc(ITextDocument2Old*, Int32*, HRESULT)
    update_window : Proc(ITextDocument2Old*, HRESULT)
    check_text_limit : Proc(ITextDocument2Old*, Int32, Int32*, HRESULT)
    ime_in_progress : Proc(ITextDocument2Old*, Int32, HRESULT)
    sys_beep : Proc(ITextDocument2Old*, HRESULT)
    update : Proc(ITextDocument2Old*, Int32, HRESULT)
    notify : Proc(ITextDocument2Old*, Int32, HRESULT)
    get_document_font : Proc(ITextDocument2Old*, ITextFont*, HRESULT)
    get_document_para : Proc(ITextDocument2Old*, ITextPara*, HRESULT)
    get_call_manager : Proc(ITextDocument2Old*, IUnknown*, HRESULT)
    release_call_manager : Proc(ITextDocument2Old*, IUnknown, HRESULT)
  end

  struct ITextDocument2Old
    lpVtbl : ITextDocument2OldVTbl*
  end

end
