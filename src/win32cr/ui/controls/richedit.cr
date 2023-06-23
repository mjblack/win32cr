require "../../foundation.cr"
require "../../graphics/gdi.cr"
require "../../system/com.cr"
require "../../ui/controls.cr"
require "../../system/ole.cr"
require "../../ui/windowsandmessaging.cr"
require "../../globalization.cr"
require "../../graphics/direct2d.cr"
require "../../system/com/structuredstorage.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tx_send_message : UInt64
    tx_draw : UInt64
    tx_get_h_scroll : UInt64
    tx_get_v_scroll : UInt64
    on_tx_set_cursor : UInt64
    tx_query_hit_point : UInt64
    on_tx_in_place_activate : UInt64
    on_tx_in_place_deactivate : UInt64
    on_tx_ui_activate : UInt64
    on_tx_ui_deactivate : UInt64
    tx_get_text : UInt64
    tx_set_text : UInt64
    tx_get_cur_target_x : UInt64
    tx_get_base_line_pos : UInt64
    tx_get_natural_size : UInt64
    tx_get_drop_target : UInt64
    on_tx_property_bits_change : UInt64
    tx_get_cached_size : UInt64
  end

  struct ITextServices
    lpVtbl : ITextServicesVTbl*
  end

  struct ITextHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tx_get_dc : UInt64
    tx_release_dc : UInt64
    tx_show_scroll_bar : UInt64
    tx_enable_scroll_bar : UInt64
    tx_set_scroll_range : UInt64
    tx_set_scroll_pos : UInt64
    tx_invalidate_rect : UInt64
    tx_view_change : UInt64
    tx_create_caret : UInt64
    tx_show_caret : UInt64
    tx_set_caret_pos : UInt64
    tx_set_timer : UInt64
    tx_kill_timer : UInt64
    tx_scroll_window_ex : UInt64
    tx_set_capture : UInt64
    tx_set_focus : UInt64
    tx_set_cursor : UInt64
    tx_screen_to_client : UInt64
    tx_client_to_screen : UInt64
    tx_activate : UInt64
    tx_deactivate : UInt64
    tx_get_client_rect : UInt64
    tx_get_view_inset : UInt64
    tx_get_char_format : UInt64
    tx_get_para_format : UInt64
    tx_get_sys_color : UInt64
    tx_get_back_style : UInt64
    tx_get_max_length : UInt64
    tx_get_scroll_bars : UInt64
    tx_get_password_char : UInt64
    tx_get_accelerator_pos : UInt64
    tx_get_extent : UInt64
    on_tx_char_format_change : UInt64
    on_tx_para_format_change : UInt64
    tx_get_property_bits : UInt64
    tx_notify : UInt64
    tx_imm_get_context : UInt64
    tx_imm_release_context : UInt64
    tx_get_selection_bar_width : UInt64
  end

  struct ITextHost
    lpVtbl : ITextHostVTbl*
  end

  struct IRicheditUiaOverridesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_override_value : UInt64
  end

  struct IRicheditUiaOverrides
    lpVtbl : IRicheditUiaOverridesVTbl*
  end

  struct ITextHost2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tx_get_dc : UInt64
    tx_release_dc : UInt64
    tx_show_scroll_bar : UInt64
    tx_enable_scroll_bar : UInt64
    tx_set_scroll_range : UInt64
    tx_set_scroll_pos : UInt64
    tx_invalidate_rect : UInt64
    tx_view_change : UInt64
    tx_create_caret : UInt64
    tx_show_caret : UInt64
    tx_set_caret_pos : UInt64
    tx_set_timer : UInt64
    tx_kill_timer : UInt64
    tx_scroll_window_ex : UInt64
    tx_set_capture : UInt64
    tx_set_focus : UInt64
    tx_set_cursor : UInt64
    tx_screen_to_client : UInt64
    tx_client_to_screen : UInt64
    tx_activate : UInt64
    tx_deactivate : UInt64
    tx_get_client_rect : UInt64
    tx_get_view_inset : UInt64
    tx_get_char_format : UInt64
    tx_get_para_format : UInt64
    tx_get_sys_color : UInt64
    tx_get_back_style : UInt64
    tx_get_max_length : UInt64
    tx_get_scroll_bars : UInt64
    tx_get_password_char : UInt64
    tx_get_accelerator_pos : UInt64
    tx_get_extent : UInt64
    on_tx_char_format_change : UInt64
    on_tx_para_format_change : UInt64
    tx_get_property_bits : UInt64
    tx_notify : UInt64
    tx_imm_get_context : UInt64
    tx_imm_release_context : UInt64
    tx_get_selection_bar_width : UInt64
    tx_is_double_click_pending : UInt64
    tx_get_window : UInt64
    tx_set_foreground_window : UInt64
    tx_get_palette : UInt64
    tx_get_east_asian_flags : UInt64
    tx_set_cursor2 : UInt64
    tx_free_text_services_notification : UInt64
    tx_get_edit_style : UInt64
    tx_get_window_styles : UInt64
    tx_show_drop_caret : UInt64
    tx_destroy_caret : UInt64
    tx_get_horz_extent : UInt64
  end

  struct ITextHost2
    lpVtbl : ITextHost2VTbl*
  end

  struct ITextServices2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tx_send_message : UInt64
    tx_draw : UInt64
    tx_get_h_scroll : UInt64
    tx_get_v_scroll : UInt64
    on_tx_set_cursor : UInt64
    tx_query_hit_point : UInt64
    on_tx_in_place_activate : UInt64
    on_tx_in_place_deactivate : UInt64
    on_tx_ui_activate : UInt64
    on_tx_ui_deactivate : UInt64
    tx_get_text : UInt64
    tx_set_text : UInt64
    tx_get_cur_target_x : UInt64
    tx_get_base_line_pos : UInt64
    tx_get_natural_size : UInt64
    tx_get_drop_target : UInt64
    on_tx_property_bits_change : UInt64
    tx_get_cached_size : UInt64
    tx_get_natural_size2 : UInt64
    tx_draw_d2_d : UInt64
  end

  struct ITextServices2
    lpVtbl : ITextServices2VTbl*
  end

  struct IRichEditOleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_site : UInt64
    get_object_count : UInt64
    get_link_count : UInt64
    get_object : UInt64
    insert_object : UInt64
    convert_object : UInt64
    activate_as : UInt64
    set_host_names : UInt64
    set_link_available : UInt64
    set_dvaspect : UInt64
    hands_off_storage : UInt64
    save_completed : UInt64
    in_place_deactivate : UInt64
    context_sensitive_help : UInt64
    get_clipboard_data : UInt64
    import_data_object : UInt64
  end

  IRichEditOle_GUID = "00020d00-0000-0000-c000-000000000046"
  IID_IRichEditOle = LibC::GUID.new(0x20d00_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRichEditOle
    lpVtbl : IRichEditOleVTbl*
  end

  struct IRichEditOleCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_new_storage : UInt64
    get_in_place_context : UInt64
    show_container_ui : UInt64
    query_insert_object : UInt64
    delete_object : UInt64
    query_accept_data : UInt64
    context_sensitive_help : UInt64
    get_clipboard_data : UInt64
    get_drag_drop_effect : UInt64
    get_context_menu : UInt64
  end

  IRichEditOleCallback_GUID = "00020d03-0000-0000-c000-000000000046"
  IID_IRichEditOleCallback = LibC::GUID.new(0x20d03_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRichEditOleCallback
    lpVtbl : IRichEditOleCallbackVTbl*
  end

  struct ITextDocumentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_selection : UInt64
    get_story_count : UInt64
    get_story_ranges : UInt64
    get_saved : UInt64
    set_saved : UInt64
    get_default_tab_stop : UInt64
    set_default_tab_stop : UInt64
    new : UInt64
    open : UInt64
    save : UInt64
    freeze : UInt64
    unfreeze : UInt64
    begin_edit_collection : UInt64
    end_edit_collection : UInt64
    undo : UInt64
    redo : UInt64
    range : UInt64
    range_from_point : UInt64
  end

  ITextDocument_GUID = "8cc497c0-a1df-11ce-8098-00aa0047be5d"
  IID_ITextDocument = LibC::GUID.new(0x8cc497c0_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextDocument
    lpVtbl : ITextDocumentVTbl*
  end

  struct ITextRangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_text : UInt64
    set_text : UInt64
    get_char : UInt64
    set_char : UInt64
    get_duplicate : UInt64
    get_formatted_text : UInt64
    set_formatted_text : UInt64
    get_start : UInt64
    set_start : UInt64
    get_end : UInt64
    set_end : UInt64
    get_font : UInt64
    set_font : UInt64
    get_para : UInt64
    set_para : UInt64
    get_story_length : UInt64
    get_story_type : UInt64
    collapse : UInt64
    expand : UInt64
    get_index : UInt64
    set_index : UInt64
    set_range : UInt64
    in_range : UInt64
    in_story : UInt64
    is_equal : UInt64
    select : UInt64
    start_of : UInt64
    end_of : UInt64
    move : UInt64
    move_start : UInt64
    move_end : UInt64
    move_while : UInt64
    move_start_while : UInt64
    move_end_while : UInt64
    move_until : UInt64
    move_start_until : UInt64
    move_end_until : UInt64
    find_text : UInt64
    find_text_start : UInt64
    find_text_end : UInt64
    delete : UInt64
    cut : UInt64
    copy : UInt64
    paste : UInt64
    can_paste : UInt64
    can_edit : UInt64
    change_case : UInt64
    get_point : UInt64
    set_point : UInt64
    scroll_into_view : UInt64
    get_embedded_object : UInt64
  end

  ITextRange_GUID = "8cc497c2-a1df-11ce-8098-00aa0047be5d"
  IID_ITextRange = LibC::GUID.new(0x8cc497c2_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextRange
    lpVtbl : ITextRangeVTbl*
  end

  struct ITextSelectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_text : UInt64
    set_text : UInt64
    get_char : UInt64
    set_char : UInt64
    get_duplicate : UInt64
    get_formatted_text : UInt64
    set_formatted_text : UInt64
    get_start : UInt64
    set_start : UInt64
    get_end : UInt64
    set_end : UInt64
    get_font : UInt64
    set_font : UInt64
    get_para : UInt64
    set_para : UInt64
    get_story_length : UInt64
    get_story_type : UInt64
    collapse : UInt64
    expand : UInt64
    get_index : UInt64
    set_index : UInt64
    set_range : UInt64
    in_range : UInt64
    in_story : UInt64
    is_equal : UInt64
    select : UInt64
    start_of : UInt64
    end_of : UInt64
    move : UInt64
    move_start : UInt64
    move_end : UInt64
    move_while : UInt64
    move_start_while : UInt64
    move_end_while : UInt64
    move_until : UInt64
    move_start_until : UInt64
    move_end_until : UInt64
    find_text : UInt64
    find_text_start : UInt64
    find_text_end : UInt64
    delete : UInt64
    cut : UInt64
    copy : UInt64
    paste : UInt64
    can_paste : UInt64
    can_edit : UInt64
    change_case : UInt64
    get_point : UInt64
    set_point : UInt64
    scroll_into_view : UInt64
    get_embedded_object : UInt64
    get_flags : UInt64
    set_flags : UInt64
    get_type : UInt64
    move_left : UInt64
    move_right : UInt64
    move_up : UInt64
    move_down : UInt64
    home_key : UInt64
    end_key : UInt64
    type_text : UInt64
  end

  ITextSelection_GUID = "8cc497c1-a1df-11ce-8098-00aa0047be5d"
  IID_ITextSelection = LibC::GUID.new(0x8cc497c1_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextSelection
    lpVtbl : ITextSelectionVTbl*
  end

  struct ITextFontVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_duplicate : UInt64
    set_duplicate : UInt64
    can_change : UInt64
    is_equal : UInt64
    reset : UInt64
    get_style : UInt64
    set_style : UInt64
    get_all_caps : UInt64
    set_all_caps : UInt64
    get_animation : UInt64
    set_animation : UInt64
    get_back_color : UInt64
    set_back_color : UInt64
    get_bold : UInt64
    set_bold : UInt64
    get_emboss : UInt64
    set_emboss : UInt64
    get_fore_color : UInt64
    set_fore_color : UInt64
    get_hidden : UInt64
    set_hidden : UInt64
    get_engrave : UInt64
    set_engrave : UInt64
    get_italic : UInt64
    set_italic : UInt64
    get_kerning : UInt64
    set_kerning : UInt64
    get_language_id : UInt64
    set_language_id : UInt64
    get_name : UInt64
    set_name : UInt64
    get_outline : UInt64
    set_outline : UInt64
    get_position : UInt64
    set_position : UInt64
    get_protected : UInt64
    set_protected : UInt64
    get_shadow : UInt64
    set_shadow : UInt64
    get_size : UInt64
    set_size : UInt64
    get_small_caps : UInt64
    set_small_caps : UInt64
    get_spacing : UInt64
    set_spacing : UInt64
    get_strike_through : UInt64
    set_strike_through : UInt64
    get_subscript : UInt64
    set_subscript : UInt64
    get_superscript : UInt64
    set_superscript : UInt64
    get_underline : UInt64
    set_underline : UInt64
    get_weight : UInt64
    set_weight : UInt64
  end

  ITextFont_GUID = "8cc497c3-a1df-11ce-8098-00aa0047be5d"
  IID_ITextFont = LibC::GUID.new(0x8cc497c3_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextFont
    lpVtbl : ITextFontVTbl*
  end

  struct ITextParaVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_duplicate : UInt64
    set_duplicate : UInt64
    can_change : UInt64
    is_equal : UInt64
    reset : UInt64
    get_style : UInt64
    set_style : UInt64
    get_alignment : UInt64
    set_alignment : UInt64
    get_hyphenation : UInt64
    set_hyphenation : UInt64
    get_first_line_indent : UInt64
    get_keep_together : UInt64
    set_keep_together : UInt64
    get_keep_with_next : UInt64
    set_keep_with_next : UInt64
    get_left_indent : UInt64
    get_line_spacing : UInt64
    get_line_spacing_rule : UInt64
    get_list_alignment : UInt64
    set_list_alignment : UInt64
    get_list_level_index : UInt64
    set_list_level_index : UInt64
    get_list_start : UInt64
    set_list_start : UInt64
    get_list_tab : UInt64
    set_list_tab : UInt64
    get_list_type : UInt64
    set_list_type : UInt64
    get_no_line_number : UInt64
    set_no_line_number : UInt64
    get_page_break_before : UInt64
    set_page_break_before : UInt64
    get_right_indent : UInt64
    set_right_indent : UInt64
    set_indents : UInt64
    set_line_spacing : UInt64
    get_space_after : UInt64
    set_space_after : UInt64
    get_space_before : UInt64
    set_space_before : UInt64
    get_widow_control : UInt64
    set_widow_control : UInt64
    get_tab_count : UInt64
    add_tab : UInt64
    clear_all_tabs : UInt64
    delete_tab : UInt64
    get_tab : UInt64
  end

  ITextPara_GUID = "8cc497c4-a1df-11ce-8098-00aa0047be5d"
  IID_ITextPara = LibC::GUID.new(0x8cc497c4_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextPara
    lpVtbl : ITextParaVTbl*
  end

  struct ITextStoryRangesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    _new_enum : UInt64
    item : UInt64
    get_count : UInt64
  end

  ITextStoryRanges_GUID = "8cc497c5-a1df-11ce-8098-00aa0047be5d"
  IID_ITextStoryRanges = LibC::GUID.new(0x8cc497c5_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
  struct ITextStoryRanges
    lpVtbl : ITextStoryRangesVTbl*
  end

  struct ITextDocument2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_selection : UInt64
    get_story_count : UInt64
    get_story_ranges : UInt64
    get_saved : UInt64
    set_saved : UInt64
    get_default_tab_stop : UInt64
    set_default_tab_stop : UInt64
    new : UInt64
    open : UInt64
    save : UInt64
    freeze : UInt64
    unfreeze : UInt64
    begin_edit_collection : UInt64
    end_edit_collection : UInt64
    undo : UInt64
    redo : UInt64
    range : UInt64
    range_from_point : UInt64
    get_caret_type : UInt64
    set_caret_type : UInt64
    get_displays : UInt64
    get_document_font : UInt64
    set_document_font : UInt64
    get_document_para : UInt64
    set_document_para : UInt64
    get_east_asian_flags : UInt64
    get_generator : UInt64
    set_ime_in_progress : UInt64
    get_notification_mode : UInt64
    set_notification_mode : UInt64
    get_selection2 : UInt64
    get_story_ranges2 : UInt64
    get_typography_options : UInt64
    get_version : UInt64
    get_window : UInt64
    attach_msg_filter : UInt64
    check_text_limit : UInt64
    get_call_manager : UInt64
    get_client_rect : UInt64
    get_effect_color : UInt64
    get_imm_context : UInt64
    get_preferred_font : UInt64
    get_property : UInt64
    get_strings : UInt64
    notify : UInt64
    range2 : UInt64
    range_from_point2 : UInt64
    release_call_manager : UInt64
    release_imm_context : UInt64
    set_effect_color : UInt64
    set_property : UInt64
    set_typography_options : UInt64
    sys_beep : UInt64
    update : UInt64
    update_window : UInt64
    get_math_properties : UInt64
    set_math_properties : UInt64
    get_active_story : UInt64
    set_active_story : UInt64
    get_main_story : UInt64
    get_new_story : UInt64
    get_story : UInt64
  end

  ITextDocument2_GUID = "c241f5e0-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextDocument2 = LibC::GUID.new(0xc241f5e0_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextDocument2
    lpVtbl : ITextDocument2VTbl*
  end

  struct ITextRange2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_text : UInt64
    set_text : UInt64
    get_char : UInt64
    set_char : UInt64
    get_duplicate : UInt64
    get_formatted_text : UInt64
    set_formatted_text : UInt64
    get_start : UInt64
    set_start : UInt64
    get_end : UInt64
    set_end : UInt64
    get_font : UInt64
    set_font : UInt64
    get_para : UInt64
    set_para : UInt64
    get_story_length : UInt64
    get_story_type : UInt64
    collapse : UInt64
    expand : UInt64
    get_index : UInt64
    set_index : UInt64
    set_range : UInt64
    in_range : UInt64
    in_story : UInt64
    is_equal : UInt64
    select : UInt64
    start_of : UInt64
    end_of : UInt64
    move : UInt64
    move_start : UInt64
    move_end : UInt64
    move_while : UInt64
    move_start_while : UInt64
    move_end_while : UInt64
    move_until : UInt64
    move_start_until : UInt64
    move_end_until : UInt64
    find_text : UInt64
    find_text_start : UInt64
    find_text_end : UInt64
    delete : UInt64
    cut : UInt64
    copy : UInt64
    paste : UInt64
    can_paste : UInt64
    can_edit : UInt64
    change_case : UInt64
    get_point : UInt64
    set_point : UInt64
    scroll_into_view : UInt64
    get_embedded_object : UInt64
    get_flags : UInt64
    set_flags : UInt64
    get_type : UInt64
    move_left : UInt64
    move_right : UInt64
    move_up : UInt64
    move_down : UInt64
    home_key : UInt64
    end_key : UInt64
    type_text : UInt64
    get_cch : UInt64
    get_cells : UInt64
    get_column : UInt64
    get_count : UInt64
    get_duplicate2 : UInt64
    get_font2 : UInt64
    set_font2 : UInt64
    get_formatted_text2 : UInt64
    set_formatted_text2 : UInt64
    get_gravity : UInt64
    set_gravity : UInt64
    get_para2 : UInt64
    set_para2 : UInt64
    get_row : UInt64
    get_start_para : UInt64
    get_table : UInt64
    get_url : UInt64
    set_url : UInt64
    add_subrange : UInt64
    build_up_math : UInt64
    delete_subrange : UInt64
    find : UInt64
    get_char2 : UInt64
    get_drop_cap : UInt64
    get_inline_object : UInt64
    get_property : UInt64
    get_rect : UInt64
    get_subrange : UInt64
    get_text2 : UInt64
    hex_to_unicode : UInt64
    insert_table : UInt64
    linearize : UInt64
    set_active_subrange : UInt64
    set_drop_cap : UInt64
    set_property : UInt64
    set_text2 : UInt64
    unicode_to_hex : UInt64
    set_inline_object : UInt64
    get_math_function_type : UInt64
    insert_image : UInt64
  end

  ITextRange2_GUID = "c241f5e2-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextRange2 = LibC::GUID.new(0xc241f5e2_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextRange2
    lpVtbl : ITextRange2VTbl*
  end

  struct ITextSelection2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_text : UInt64
    set_text : UInt64
    get_char : UInt64
    set_char : UInt64
    get_duplicate : UInt64
    get_formatted_text : UInt64
    set_formatted_text : UInt64
    get_start : UInt64
    set_start : UInt64
    get_end : UInt64
    set_end : UInt64
    get_font : UInt64
    set_font : UInt64
    get_para : UInt64
    set_para : UInt64
    get_story_length : UInt64
    get_story_type : UInt64
    collapse : UInt64
    expand : UInt64
    get_index : UInt64
    set_index : UInt64
    set_range : UInt64
    in_range : UInt64
    in_story : UInt64
    is_equal : UInt64
    select : UInt64
    start_of : UInt64
    end_of : UInt64
    move : UInt64
    move_start : UInt64
    move_end : UInt64
    move_while : UInt64
    move_start_while : UInt64
    move_end_while : UInt64
    move_until : UInt64
    move_start_until : UInt64
    move_end_until : UInt64
    find_text : UInt64
    find_text_start : UInt64
    find_text_end : UInt64
    delete : UInt64
    cut : UInt64
    copy : UInt64
    paste : UInt64
    can_paste : UInt64
    can_edit : UInt64
    change_case : UInt64
    get_point : UInt64
    set_point : UInt64
    scroll_into_view : UInt64
    get_embedded_object : UInt64
    get_flags : UInt64
    set_flags : UInt64
    get_type : UInt64
    move_left : UInt64
    move_right : UInt64
    move_up : UInt64
    move_down : UInt64
    home_key : UInt64
    end_key : UInt64
    type_text : UInt64
    get_cch : UInt64
    get_cells : UInt64
    get_column : UInt64
    get_count : UInt64
    get_duplicate2 : UInt64
    get_font2 : UInt64
    set_font2 : UInt64
    get_formatted_text2 : UInt64
    set_formatted_text2 : UInt64
    get_gravity : UInt64
    set_gravity : UInt64
    get_para2 : UInt64
    set_para2 : UInt64
    get_row : UInt64
    get_start_para : UInt64
    get_table : UInt64
    get_url : UInt64
    set_url : UInt64
    add_subrange : UInt64
    build_up_math : UInt64
    delete_subrange : UInt64
    find : UInt64
    get_char2 : UInt64
    get_drop_cap : UInt64
    get_inline_object : UInt64
    get_property : UInt64
    get_rect : UInt64
    get_subrange : UInt64
    get_text2 : UInt64
    hex_to_unicode : UInt64
    insert_table : UInt64
    linearize : UInt64
    set_active_subrange : UInt64
    set_drop_cap : UInt64
    set_property : UInt64
    set_text2 : UInt64
    unicode_to_hex : UInt64
    set_inline_object : UInt64
    get_math_function_type : UInt64
    insert_image : UInt64
  end

  ITextSelection2_GUID = "c241f5e1-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextSelection2 = LibC::GUID.new(0xc241f5e1_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextSelection2
    lpVtbl : ITextSelection2VTbl*
  end

  struct ITextFont2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_duplicate : UInt64
    set_duplicate : UInt64
    can_change : UInt64
    is_equal : UInt64
    reset : UInt64
    get_style : UInt64
    set_style : UInt64
    get_all_caps : UInt64
    set_all_caps : UInt64
    get_animation : UInt64
    set_animation : UInt64
    get_back_color : UInt64
    set_back_color : UInt64
    get_bold : UInt64
    set_bold : UInt64
    get_emboss : UInt64
    set_emboss : UInt64
    get_fore_color : UInt64
    set_fore_color : UInt64
    get_hidden : UInt64
    set_hidden : UInt64
    get_engrave : UInt64
    set_engrave : UInt64
    get_italic : UInt64
    set_italic : UInt64
    get_kerning : UInt64
    set_kerning : UInt64
    get_language_id : UInt64
    set_language_id : UInt64
    get_name : UInt64
    set_name : UInt64
    get_outline : UInt64
    set_outline : UInt64
    get_position : UInt64
    set_position : UInt64
    get_protected : UInt64
    set_protected : UInt64
    get_shadow : UInt64
    set_shadow : UInt64
    get_size : UInt64
    set_size : UInt64
    get_small_caps : UInt64
    set_small_caps : UInt64
    get_spacing : UInt64
    set_spacing : UInt64
    get_strike_through : UInt64
    set_strike_through : UInt64
    get_subscript : UInt64
    set_subscript : UInt64
    get_superscript : UInt64
    set_superscript : UInt64
    get_underline : UInt64
    set_underline : UInt64
    get_weight : UInt64
    set_weight : UInt64
    get_count : UInt64
    get_auto_ligatures : UInt64
    set_auto_ligatures : UInt64
    get_autospace_alpha : UInt64
    set_autospace_alpha : UInt64
    get_autospace_numeric : UInt64
    set_autospace_numeric : UInt64
    get_autospace_parens : UInt64
    set_autospace_parens : UInt64
    get_char_rep : UInt64
    set_char_rep : UInt64
    get_compression_mode : UInt64
    set_compression_mode : UInt64
    get_cookie : UInt64
    set_cookie : UInt64
    get_double_strike : UInt64
    set_double_strike : UInt64
    get_duplicate2 : UInt64
    set_duplicate2 : UInt64
    get_link_type : UInt64
    get_math_zone : UInt64
    set_math_zone : UInt64
    get_mod_width_pairs : UInt64
    set_mod_width_pairs : UInt64
    get_mod_width_space : UInt64
    set_mod_width_space : UInt64
    get_old_numbers : UInt64
    set_old_numbers : UInt64
    get_overlapping : UInt64
    set_overlapping : UInt64
    get_position_sub_super : UInt64
    set_position_sub_super : UInt64
    get_scaling : UInt64
    set_scaling : UInt64
    get_space_extension : UInt64
    set_space_extension : UInt64
    get_underline_position_mode : UInt64
    set_underline_position_mode : UInt64
    get_effects : UInt64
    get_effects2 : UInt64
    get_property : UInt64
    get_property_info : UInt64
    is_equal2 : UInt64
    set_effects : UInt64
    set_effects2 : UInt64
    set_property : UInt64
  end

  ITextFont2_GUID = "c241f5e3-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextFont2 = LibC::GUID.new(0xc241f5e3_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextFont2
    lpVtbl : ITextFont2VTbl*
  end

  struct ITextPara2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_duplicate : UInt64
    set_duplicate : UInt64
    can_change : UInt64
    is_equal : UInt64
    reset : UInt64
    get_style : UInt64
    set_style : UInt64
    get_alignment : UInt64
    set_alignment : UInt64
    get_hyphenation : UInt64
    set_hyphenation : UInt64
    get_first_line_indent : UInt64
    get_keep_together : UInt64
    set_keep_together : UInt64
    get_keep_with_next : UInt64
    set_keep_with_next : UInt64
    get_left_indent : UInt64
    get_line_spacing : UInt64
    get_line_spacing_rule : UInt64
    get_list_alignment : UInt64
    set_list_alignment : UInt64
    get_list_level_index : UInt64
    set_list_level_index : UInt64
    get_list_start : UInt64
    set_list_start : UInt64
    get_list_tab : UInt64
    set_list_tab : UInt64
    get_list_type : UInt64
    set_list_type : UInt64
    get_no_line_number : UInt64
    set_no_line_number : UInt64
    get_page_break_before : UInt64
    set_page_break_before : UInt64
    get_right_indent : UInt64
    set_right_indent : UInt64
    set_indents : UInt64
    set_line_spacing : UInt64
    get_space_after : UInt64
    set_space_after : UInt64
    get_space_before : UInt64
    set_space_before : UInt64
    get_widow_control : UInt64
    set_widow_control : UInt64
    get_tab_count : UInt64
    add_tab : UInt64
    clear_all_tabs : UInt64
    delete_tab : UInt64
    get_tab : UInt64
    get_borders : UInt64
    get_duplicate2 : UInt64
    set_duplicate2 : UInt64
    get_font_alignment : UInt64
    set_font_alignment : UInt64
    get_hanging_punctuation : UInt64
    set_hanging_punctuation : UInt64
    get_snap_to_grid : UInt64
    set_snap_to_grid : UInt64
    get_trim_punctuation_at_start : UInt64
    set_trim_punctuation_at_start : UInt64
    get_effects : UInt64
    get_property : UInt64
    is_equal2 : UInt64
    set_effects : UInt64
    set_property : UInt64
  end

  ITextPara2_GUID = "c241f5e4-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextPara2 = LibC::GUID.new(0xc241f5e4_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextPara2
    lpVtbl : ITextPara2VTbl*
  end

  struct ITextStoryRanges2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    _new_enum : UInt64
    item : UInt64
    get_count : UInt64
    item2 : UInt64
  end

  ITextStoryRanges2_GUID = "c241f5e5-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextStoryRanges2 = LibC::GUID.new(0xc241f5e5_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextStoryRanges2
    lpVtbl : ITextStoryRanges2VTbl*
  end

  struct ITextStoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_active : UInt64
    set_active : UInt64
    get_display : UInt64
    get_index : UInt64
    get_type : UInt64
    set_type : UInt64
    get_property : UInt64
    get_range : UInt64
    get_text : UInt64
    set_formatted_text : UInt64
    set_property : UInt64
    set_text : UInt64
  end

  ITextStory_GUID = "c241f5f3-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextStory = LibC::GUID.new(0xc241f5f3_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextStory
    lpVtbl : ITextStoryVTbl*
  end

  struct ITextStringsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    item : UInt64
    get_count : UInt64
    add : UInt64
    append : UInt64
    cat2 : UInt64
    cat_top2 : UInt64
    delete_range : UInt64
    encode_function : UInt64
    get_cch : UInt64
    insert_null_str : UInt64
    move_boundary : UInt64
    prefix_top : UInt64
    remove : UInt64
    set_formatted_text : UInt64
    set_op_cp : UInt64
    suffix_top : UInt64
    swap : UInt64
  end

  ITextStrings_GUID = "c241f5e7-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextStrings = LibC::GUID.new(0xc241f5e7_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextStrings
    lpVtbl : ITextStringsVTbl*
  end

  struct ITextRowVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_alignment : UInt64
    set_alignment : UInt64
    get_cell_count : UInt64
    set_cell_count : UInt64
    get_cell_count_cache : UInt64
    set_cell_count_cache : UInt64
    get_cell_index : UInt64
    set_cell_index : UInt64
    get_cell_margin : UInt64
    set_cell_margin : UInt64
    get_height : UInt64
    set_height : UInt64
    get_indent : UInt64
    set_indent : UInt64
    get_keep_together : UInt64
    set_keep_together : UInt64
    get_keep_with_next : UInt64
    set_keep_with_next : UInt64
    get_nest_level : UInt64
    get_rtl : UInt64
    set_rtl : UInt64
    get_cell_alignment : UInt64
    set_cell_alignment : UInt64
    get_cell_color_back : UInt64
    set_cell_color_back : UInt64
    get_cell_color_fore : UInt64
    set_cell_color_fore : UInt64
    get_cell_merge_flags : UInt64
    set_cell_merge_flags : UInt64
    get_cell_shading : UInt64
    set_cell_shading : UInt64
    get_cell_vertical_text : UInt64
    set_cell_vertical_text : UInt64
    get_cell_width : UInt64
    set_cell_width : UInt64
    get_cell_border_colors : UInt64
    get_cell_border_widths : UInt64
    set_cell_border_colors : UInt64
    set_cell_border_widths : UInt64
    apply : UInt64
    can_change : UInt64
    get_property : UInt64
    insert : UInt64
    is_equal : UInt64
    reset : UInt64
    set_property : UInt64
  end

  ITextRow_GUID = "c241f5ef-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextRow = LibC::GUID.new(0xc241f5ef_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextRow
    lpVtbl : ITextRowVTbl*
  end

  struct ITextDisplaysVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  ITextDisplays_GUID = "c241f5f2-7206-11d8-a2c7-00a0d1d6c6b3"
  IID_ITextDisplays = LibC::GUID.new(0xc241f5f2_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
  struct ITextDisplays
    lpVtbl : ITextDisplaysVTbl*
  end

  struct ITextDocument2OldVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_selection : UInt64
    get_story_count : UInt64
    get_story_ranges : UInt64
    get_saved : UInt64
    set_saved : UInt64
    get_default_tab_stop : UInt64
    set_default_tab_stop : UInt64
    new : UInt64
    open : UInt64
    save : UInt64
    freeze : UInt64
    unfreeze : UInt64
    begin_edit_collection : UInt64
    end_edit_collection : UInt64
    undo : UInt64
    redo : UInt64
    range : UInt64
    range_from_point : UInt64
    attach_msg_filter : UInt64
    set_effect_color : UInt64
    get_effect_color : UInt64
    get_caret_type : UInt64
    set_caret_type : UInt64
    get_imm_context : UInt64
    release_imm_context : UInt64
    get_preferred_font : UInt64
    get_notification_mode : UInt64
    set_notification_mode : UInt64
    get_client_rect : UInt64
    get_selection2 : UInt64
    get_window : UInt64
    get_fe_flags : UInt64
    update_window : UInt64
    check_text_limit : UInt64
    ime_in_progress : UInt64
    sys_beep : UInt64
    update : UInt64
    notify : UInt64
    get_document_font : UInt64
    get_document_para : UInt64
    get_call_manager : UInt64
    release_call_manager : UInt64
  end

  ITextDocument2Old_GUID = "01c25500-4268-11d1-883a-3c8b00c10000"
  IID_ITextDocument2Old = LibC::GUID.new(0x1c25500_u32, 0x4268_u16, 0x11d1_u16, StaticArray[0x88_u8, 0x3a_u8, 0x3c_u8, 0x8b_u8, 0x0_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
  struct ITextDocument2Old
    lpVtbl : ITextDocument2OldVTbl*
  end

end
struct LibWin32::ITextServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tx_send_message(msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM, plresult : LRESULT*) : HRESULT
    @lpVtbl.value.tx_send_message.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)).call(msg, wparam, lparam, plresult)
  end
  def tx_draw(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcbounds : RECTL*, lprcwbounds : RECTL*, lprcupdate : RECT*, pfncontinue : LibC::IntPtrT, dwcontinue : UInt32, lviewid : Int32) : HRESULT
    @lpVtbl.value.tx_draw.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, RECT*, LibC::IntPtrT, UInt32, Int32, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcbounds, lprcwbounds, lprcupdate, pfncontinue, dwcontinue, lviewid)
  end
  def tx_get_h_scroll(plmin : Int32*, plmax : Int32*, plpos : Int32*, plpage : Int32*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.tx_get_h_scroll.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)).call(plmin, plmax, plpos, plpage, pfenabled)
  end
  def tx_get_v_scroll(plmin : Int32*, plmax : Int32*, plpos : Int32*, plpage : Int32*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.tx_get_v_scroll.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)).call(plmin, plmax, plpos, plpage, pfenabled)
  end
  def on_tx_set_cursor(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcclient : RECT*, x : Int32, y : Int32) : HRESULT
    @lpVtbl.value.on_tx_set_cursor.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcclient, x, y)
  end
  def tx_query_hit_point(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcclient : RECT*, x : Int32, y : Int32, phitresult : UInt32*) : HRESULT
    @lpVtbl.value.tx_query_hit_point.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, UInt32*, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcclient, x, y, phitresult)
  end
  def on_tx_in_place_activate(prcclient : RECT*) : HRESULT
    @lpVtbl.value.on_tx_in_place_activate.unsafe_as(Proc(RECT*, HRESULT)).call(prcclient)
  end
  def on_tx_in_place_deactivate : HRESULT
    @lpVtbl.value.on_tx_in_place_deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def on_tx_ui_activate : HRESULT
    @lpVtbl.value.on_tx_ui_activate.unsafe_as(Proc(HRESULT)).call
  end
  def on_tx_ui_deactivate : HRESULT
    @lpVtbl.value.on_tx_ui_deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def tx_get_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.tx_get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
  def tx_set_text(psztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.tx_set_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztext)
  end
  def tx_get_cur_target_x(param0 : Int32*) : HRESULT
    @lpVtbl.value.tx_get_cur_target_x.unsafe_as(Proc(Int32*, HRESULT)).call(param0)
  end
  def tx_get_base_line_pos(param0 : Int32*) : HRESULT
    @lpVtbl.value.tx_get_base_line_pos.unsafe_as(Proc(Int32*, HRESULT)).call(param0)
  end
  def tx_get_natural_size(dwaspect : UInt32, hdcdraw : HDC, hictargetdev : HDC, ptd : DVTARGETDEVICE*, dwmode : UInt32, psizelextent : SIZE*, pwidth : Int32*, pheight : Int32*) : HRESULT
    @lpVtbl.value.tx_get_natural_size.unsafe_as(Proc(UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, HRESULT)).call(dwaspect, hdcdraw, hictargetdev, ptd, dwmode, psizelextent, pwidth, pheight)
  end
  def tx_get_drop_target(ppdroptarget : IDropTarget*) : HRESULT
    @lpVtbl.value.tx_get_drop_target.unsafe_as(Proc(IDropTarget*, HRESULT)).call(ppdroptarget)
  end
  def on_tx_property_bits_change(dwmask : UInt32, dwbits : UInt32) : HRESULT
    @lpVtbl.value.on_tx_property_bits_change.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwmask, dwbits)
  end
  def tx_get_cached_size(pdwwidth : UInt32*, pdwheight : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_cached_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwwidth, pdwheight)
  end
end
struct LibWin32::ITextHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tx_get_dc : HDC
    @lpVtbl.value.tx_get_dc.unsafe_as(Proc(HDC)).call
  end
  def tx_release_dc(hdc : HDC) : Int32
    @lpVtbl.value.tx_release_dc.unsafe_as(Proc(HDC, Int32)).call(hdc)
  end
  def tx_show_scroll_bar(fnbar : Int32, fshow : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_show_scroll_bar.unsafe_as(Proc(Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, fshow)
  end
  def tx_enable_scroll_bar(fusbflags : SCROLLBAR_CONSTANTS, fuarrowflags : ENABLE_SCROLL_BAR_ARROWS) : LibC::BOOL
    @lpVtbl.value.tx_enable_scroll_bar.unsafe_as(Proc(SCROLLBAR_CONSTANTS, ENABLE_SCROLL_BAR_ARROWS, LibC::BOOL)).call(fusbflags, fuarrowflags)
  end
  def tx_set_scroll_range(fnbar : Int32, nminpos : Int32, nmaxpos : Int32, fredraw : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_set_scroll_range.unsafe_as(Proc(Int32, Int32, Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, nminpos, nmaxpos, fredraw)
  end
  def tx_set_scroll_pos(fnbar : Int32, npos : Int32, fredraw : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_set_scroll_pos.unsafe_as(Proc(Int32, Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, npos, fredraw)
  end
  def tx_invalidate_rect(prc : RECT*, fmode : LibC::BOOL) : Void
    @lpVtbl.value.tx_invalidate_rect.unsafe_as(Proc(RECT*, LibC::BOOL, Void)).call(prc, fmode)
  end
  def tx_view_change(fupdate : LibC::BOOL) : Void
    @lpVtbl.value.tx_view_change.unsafe_as(Proc(LibC::BOOL, Void)).call(fupdate)
  end
  def tx_create_caret(hbmp : HBITMAP, xwidth : Int32, yheight : Int32) : LibC::BOOL
    @lpVtbl.value.tx_create_caret.unsafe_as(Proc(HBITMAP, Int32, Int32, LibC::BOOL)).call(hbmp, xwidth, yheight)
  end
  def tx_show_caret(fshow : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_show_caret.unsafe_as(Proc(LibC::BOOL, LibC::BOOL)).call(fshow)
  end
  def tx_set_caret_pos(x : Int32, y : Int32) : LibC::BOOL
    @lpVtbl.value.tx_set_caret_pos.unsafe_as(Proc(Int32, Int32, LibC::BOOL)).call(x, y)
  end
  def tx_set_timer(idtimer : UInt32, utimeout : UInt32) : LibC::BOOL
    @lpVtbl.value.tx_set_timer.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL)).call(idtimer, utimeout)
  end
  def tx_kill_timer(idtimer : UInt32) : Void
    @lpVtbl.value.tx_kill_timer.unsafe_as(Proc(UInt32, Void)).call(idtimer)
  end
  def tx_scroll_window_ex(dx : Int32, dy : Int32, lprcscroll : RECT*, lprcclip : RECT*, hrgnupdate : HRGN, lprcupdate : RECT*, fuscroll : SHOW_WINDOW_CMD) : Void
    @lpVtbl.value.tx_scroll_window_ex.unsafe_as(Proc(Int32, Int32, RECT*, RECT*, HRGN, RECT*, SHOW_WINDOW_CMD, Void)).call(dx, dy, lprcscroll, lprcclip, hrgnupdate, lprcupdate, fuscroll)
  end
  def tx_set_capture(fcapture : LibC::BOOL) : Void
    @lpVtbl.value.tx_set_capture.unsafe_as(Proc(LibC::BOOL, Void)).call(fcapture)
  end
  def tx_set_focus : Void
    @lpVtbl.value.tx_set_focus.unsafe_as(Proc(Void)).call
  end
  def tx_set_cursor(hcur : LibC::HANDLE, ftext : LibC::BOOL) : Void
    @lpVtbl.value.tx_set_cursor.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, Void)).call(hcur, ftext)
  end
  def tx_screen_to_client(lppt : POINT*) : LibC::BOOL
    @lpVtbl.value.tx_screen_to_client.unsafe_as(Proc(POINT*, LibC::BOOL)).call(lppt)
  end
  def tx_client_to_screen(lppt : POINT*) : LibC::BOOL
    @lpVtbl.value.tx_client_to_screen.unsafe_as(Proc(POINT*, LibC::BOOL)).call(lppt)
  end
  def tx_activate(ploldstate : Int32*) : HRESULT
    @lpVtbl.value.tx_activate.unsafe_as(Proc(Int32*, HRESULT)).call(ploldstate)
  end
  def tx_deactivate(lnewstate : Int32) : HRESULT
    @lpVtbl.value.tx_deactivate.unsafe_as(Proc(Int32, HRESULT)).call(lnewstate)
  end
  def tx_get_client_rect(prc : RECT*) : HRESULT
    @lpVtbl.value.tx_get_client_rect.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def tx_get_view_inset(prc : RECT*) : HRESULT
    @lpVtbl.value.tx_get_view_inset.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def tx_get_char_format(ppcf : CHARFORMATW**) : HRESULT
    @lpVtbl.value.tx_get_char_format.unsafe_as(Proc(CHARFORMATW**, HRESULT)).call(ppcf)
  end
  def tx_get_para_format(pppf : PARAFORMAT**) : HRESULT
    @lpVtbl.value.tx_get_para_format.unsafe_as(Proc(PARAFORMAT**, HRESULT)).call(pppf)
  end
  def tx_get_sys_color(nindex : Int32) : UInt32
    @lpVtbl.value.tx_get_sys_color.unsafe_as(Proc(Int32, UInt32)).call(nindex)
  end
  def tx_get_back_style(pstyle : TXTBACKSTYLE*) : HRESULT
    @lpVtbl.value.tx_get_back_style.unsafe_as(Proc(TXTBACKSTYLE*, HRESULT)).call(pstyle)
  end
  def tx_get_max_length(plength : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(plength)
  end
  def tx_get_scroll_bars(pdwscrollbar : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_scroll_bars.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscrollbar)
  end
  def tx_get_password_char(pch : Int8*) : HRESULT
    @lpVtbl.value.tx_get_password_char.unsafe_as(Proc(Int8*, HRESULT)).call(pch)
  end
  def tx_get_accelerator_pos(pcp : Int32*) : HRESULT
    @lpVtbl.value.tx_get_accelerator_pos.unsafe_as(Proc(Int32*, HRESULT)).call(pcp)
  end
  def tx_get_extent(lpextent : SIZE*) : HRESULT
    @lpVtbl.value.tx_get_extent.unsafe_as(Proc(SIZE*, HRESULT)).call(lpextent)
  end
  def on_tx_char_format_change(pcf : CHARFORMATW*) : HRESULT
    @lpVtbl.value.on_tx_char_format_change.unsafe_as(Proc(CHARFORMATW*, HRESULT)).call(pcf)
  end
  def on_tx_para_format_change(ppf : PARAFORMAT*) : HRESULT
    @lpVtbl.value.on_tx_para_format_change.unsafe_as(Proc(PARAFORMAT*, HRESULT)).call(ppf)
  end
  def tx_get_property_bits(dwmask : UInt32, pdwbits : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_property_bits.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwmask, pdwbits)
  end
  def tx_notify(inotify : UInt32, pv : Void*) : HRESULT
    @lpVtbl.value.tx_notify.unsafe_as(Proc(UInt32, Void*, HRESULT)).call(inotify, pv)
  end
  def tx_imm_get_context : HIMC
    @lpVtbl.value.tx_imm_get_context.unsafe_as(Proc(HIMC)).call
  end
  def tx_imm_release_context(himc : HIMC) : Void
    @lpVtbl.value.tx_imm_release_context.unsafe_as(Proc(HIMC, Void)).call(himc)
  end
  def tx_get_selection_bar_width(lselbarwidth : Int32*) : HRESULT
    @lpVtbl.value.tx_get_selection_bar_width.unsafe_as(Proc(Int32*, HRESULT)).call(lselbarwidth)
  end
end
struct LibWin32::IRicheditUiaOverrides
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_override_value(propertyid : Int32, pretvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_override_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, pretvalue)
  end
end
struct LibWin32::ITextHost2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tx_get_dc : HDC
    @lpVtbl.value.tx_get_dc.unsafe_as(Proc(HDC)).call
  end
  def tx_release_dc(hdc : HDC) : Int32
    @lpVtbl.value.tx_release_dc.unsafe_as(Proc(HDC, Int32)).call(hdc)
  end
  def tx_show_scroll_bar(fnbar : Int32, fshow : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_show_scroll_bar.unsafe_as(Proc(Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, fshow)
  end
  def tx_enable_scroll_bar(fusbflags : SCROLLBAR_CONSTANTS, fuarrowflags : ENABLE_SCROLL_BAR_ARROWS) : LibC::BOOL
    @lpVtbl.value.tx_enable_scroll_bar.unsafe_as(Proc(SCROLLBAR_CONSTANTS, ENABLE_SCROLL_BAR_ARROWS, LibC::BOOL)).call(fusbflags, fuarrowflags)
  end
  def tx_set_scroll_range(fnbar : Int32, nminpos : Int32, nmaxpos : Int32, fredraw : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_set_scroll_range.unsafe_as(Proc(Int32, Int32, Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, nminpos, nmaxpos, fredraw)
  end
  def tx_set_scroll_pos(fnbar : Int32, npos : Int32, fredraw : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_set_scroll_pos.unsafe_as(Proc(Int32, Int32, LibC::BOOL, LibC::BOOL)).call(fnbar, npos, fredraw)
  end
  def tx_invalidate_rect(prc : RECT*, fmode : LibC::BOOL) : Void
    @lpVtbl.value.tx_invalidate_rect.unsafe_as(Proc(RECT*, LibC::BOOL, Void)).call(prc, fmode)
  end
  def tx_view_change(fupdate : LibC::BOOL) : Void
    @lpVtbl.value.tx_view_change.unsafe_as(Proc(LibC::BOOL, Void)).call(fupdate)
  end
  def tx_create_caret(hbmp : HBITMAP, xwidth : Int32, yheight : Int32) : LibC::BOOL
    @lpVtbl.value.tx_create_caret.unsafe_as(Proc(HBITMAP, Int32, Int32, LibC::BOOL)).call(hbmp, xwidth, yheight)
  end
  def tx_show_caret(fshow : LibC::BOOL) : LibC::BOOL
    @lpVtbl.value.tx_show_caret.unsafe_as(Proc(LibC::BOOL, LibC::BOOL)).call(fshow)
  end
  def tx_set_caret_pos(x : Int32, y : Int32) : LibC::BOOL
    @lpVtbl.value.tx_set_caret_pos.unsafe_as(Proc(Int32, Int32, LibC::BOOL)).call(x, y)
  end
  def tx_set_timer(idtimer : UInt32, utimeout : UInt32) : LibC::BOOL
    @lpVtbl.value.tx_set_timer.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL)).call(idtimer, utimeout)
  end
  def tx_kill_timer(idtimer : UInt32) : Void
    @lpVtbl.value.tx_kill_timer.unsafe_as(Proc(UInt32, Void)).call(idtimer)
  end
  def tx_scroll_window_ex(dx : Int32, dy : Int32, lprcscroll : RECT*, lprcclip : RECT*, hrgnupdate : HRGN, lprcupdate : RECT*, fuscroll : SHOW_WINDOW_CMD) : Void
    @lpVtbl.value.tx_scroll_window_ex.unsafe_as(Proc(Int32, Int32, RECT*, RECT*, HRGN, RECT*, SHOW_WINDOW_CMD, Void)).call(dx, dy, lprcscroll, lprcclip, hrgnupdate, lprcupdate, fuscroll)
  end
  def tx_set_capture(fcapture : LibC::BOOL) : Void
    @lpVtbl.value.tx_set_capture.unsafe_as(Proc(LibC::BOOL, Void)).call(fcapture)
  end
  def tx_set_focus : Void
    @lpVtbl.value.tx_set_focus.unsafe_as(Proc(Void)).call
  end
  def tx_set_cursor(hcur : LibC::HANDLE, ftext : LibC::BOOL) : Void
    @lpVtbl.value.tx_set_cursor.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, Void)).call(hcur, ftext)
  end
  def tx_screen_to_client(lppt : POINT*) : LibC::BOOL
    @lpVtbl.value.tx_screen_to_client.unsafe_as(Proc(POINT*, LibC::BOOL)).call(lppt)
  end
  def tx_client_to_screen(lppt : POINT*) : LibC::BOOL
    @lpVtbl.value.tx_client_to_screen.unsafe_as(Proc(POINT*, LibC::BOOL)).call(lppt)
  end
  def tx_activate(ploldstate : Int32*) : HRESULT
    @lpVtbl.value.tx_activate.unsafe_as(Proc(Int32*, HRESULT)).call(ploldstate)
  end
  def tx_deactivate(lnewstate : Int32) : HRESULT
    @lpVtbl.value.tx_deactivate.unsafe_as(Proc(Int32, HRESULT)).call(lnewstate)
  end
  def tx_get_client_rect(prc : RECT*) : HRESULT
    @lpVtbl.value.tx_get_client_rect.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def tx_get_view_inset(prc : RECT*) : HRESULT
    @lpVtbl.value.tx_get_view_inset.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def tx_get_char_format(ppcf : CHARFORMATW**) : HRESULT
    @lpVtbl.value.tx_get_char_format.unsafe_as(Proc(CHARFORMATW**, HRESULT)).call(ppcf)
  end
  def tx_get_para_format(pppf : PARAFORMAT**) : HRESULT
    @lpVtbl.value.tx_get_para_format.unsafe_as(Proc(PARAFORMAT**, HRESULT)).call(pppf)
  end
  def tx_get_sys_color(nindex : Int32) : UInt32
    @lpVtbl.value.tx_get_sys_color.unsafe_as(Proc(Int32, UInt32)).call(nindex)
  end
  def tx_get_back_style(pstyle : TXTBACKSTYLE*) : HRESULT
    @lpVtbl.value.tx_get_back_style.unsafe_as(Proc(TXTBACKSTYLE*, HRESULT)).call(pstyle)
  end
  def tx_get_max_length(plength : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(plength)
  end
  def tx_get_scroll_bars(pdwscrollbar : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_scroll_bars.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscrollbar)
  end
  def tx_get_password_char(pch : Int8*) : HRESULT
    @lpVtbl.value.tx_get_password_char.unsafe_as(Proc(Int8*, HRESULT)).call(pch)
  end
  def tx_get_accelerator_pos(pcp : Int32*) : HRESULT
    @lpVtbl.value.tx_get_accelerator_pos.unsafe_as(Proc(Int32*, HRESULT)).call(pcp)
  end
  def tx_get_extent(lpextent : SIZE*) : HRESULT
    @lpVtbl.value.tx_get_extent.unsafe_as(Proc(SIZE*, HRESULT)).call(lpextent)
  end
  def on_tx_char_format_change(pcf : CHARFORMATW*) : HRESULT
    @lpVtbl.value.on_tx_char_format_change.unsafe_as(Proc(CHARFORMATW*, HRESULT)).call(pcf)
  end
  def on_tx_para_format_change(ppf : PARAFORMAT*) : HRESULT
    @lpVtbl.value.on_tx_para_format_change.unsafe_as(Proc(PARAFORMAT*, HRESULT)).call(ppf)
  end
  def tx_get_property_bits(dwmask : UInt32, pdwbits : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_property_bits.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwmask, pdwbits)
  end
  def tx_notify(inotify : UInt32, pv : Void*) : HRESULT
    @lpVtbl.value.tx_notify.unsafe_as(Proc(UInt32, Void*, HRESULT)).call(inotify, pv)
  end
  def tx_imm_get_context : HIMC
    @lpVtbl.value.tx_imm_get_context.unsafe_as(Proc(HIMC)).call
  end
  def tx_imm_release_context(himc : HIMC) : Void
    @lpVtbl.value.tx_imm_release_context.unsafe_as(Proc(HIMC, Void)).call(himc)
  end
  def tx_get_selection_bar_width(lselbarwidth : Int32*) : HRESULT
    @lpVtbl.value.tx_get_selection_bar_width.unsafe_as(Proc(Int32*, HRESULT)).call(lselbarwidth)
  end
  def tx_is_double_click_pending : LibC::BOOL
    @lpVtbl.value.tx_is_double_click_pending.unsafe_as(Proc(LibC::BOOL)).call
  end
  def tx_get_window(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.tx_get_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
  def tx_set_foreground_window : HRESULT
    @lpVtbl.value.tx_set_foreground_window.unsafe_as(Proc(HRESULT)).call
  end
  def tx_get_palette : HPALETTE
    @lpVtbl.value.tx_get_palette.unsafe_as(Proc(HPALETTE)).call
  end
  def tx_get_east_asian_flags(pflags : Int32*) : HRESULT
    @lpVtbl.value.tx_get_east_asian_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pflags)
  end
  def tx_set_cursor2(hcur : LibC::HANDLE, btext : LibC::BOOL) : HANDLE
    @lpVtbl.value.tx_set_cursor2.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, HANDLE)).call(hcur, btext)
  end
  def tx_free_text_services_notification : Void
    @lpVtbl.value.tx_free_text_services_notification.unsafe_as(Proc(Void)).call
  end
  def tx_get_edit_style(dwitem : UInt32, pdwdata : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_edit_style.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwitem, pdwdata)
  end
  def tx_get_window_styles(pdwstyle : UInt32*, pdwexstyle : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_window_styles.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwstyle, pdwexstyle)
  end
  def tx_show_drop_caret(fshow : LibC::BOOL, hdc : HDC, prc : RECT*) : HRESULT
    @lpVtbl.value.tx_show_drop_caret.unsafe_as(Proc(LibC::BOOL, HDC, RECT*, HRESULT)).call(fshow, hdc, prc)
  end
  def tx_destroy_caret : HRESULT
    @lpVtbl.value.tx_destroy_caret.unsafe_as(Proc(HRESULT)).call
  end
  def tx_get_horz_extent(plhorzextent : Int32*) : HRESULT
    @lpVtbl.value.tx_get_horz_extent.unsafe_as(Proc(Int32*, HRESULT)).call(plhorzextent)
  end
end
struct LibWin32::ITextServices2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tx_send_message(msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM, plresult : LRESULT*) : HRESULT
    @lpVtbl.value.tx_send_message.unsafe_as(Proc(UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)).call(msg, wparam, lparam, plresult)
  end
  def tx_draw(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcbounds : RECTL*, lprcwbounds : RECTL*, lprcupdate : RECT*, pfncontinue : LibC::IntPtrT, dwcontinue : UInt32, lviewid : Int32) : HRESULT
    @lpVtbl.value.tx_draw.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, RECT*, LibC::IntPtrT, UInt32, Int32, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcbounds, lprcwbounds, lprcupdate, pfncontinue, dwcontinue, lviewid)
  end
  def tx_get_h_scroll(plmin : Int32*, plmax : Int32*, plpos : Int32*, plpage : Int32*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.tx_get_h_scroll.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)).call(plmin, plmax, plpos, plpage, pfenabled)
  end
  def tx_get_v_scroll(plmin : Int32*, plmax : Int32*, plpos : Int32*, plpage : Int32*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.tx_get_v_scroll.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, LibC::BOOL*, HRESULT)).call(plmin, plmax, plpos, plpage, pfenabled)
  end
  def on_tx_set_cursor(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcclient : RECT*, x : Int32, y : Int32) : HRESULT
    @lpVtbl.value.on_tx_set_cursor.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcclient, x, y)
  end
  def tx_query_hit_point(dwdrawaspect : DVASPECT, lindex : Int32, pvaspect : Void*, ptd : DVTARGETDEVICE*, hdcdraw : HDC, hictargetdev : HDC, lprcclient : RECT*, x : Int32, y : Int32, phitresult : UInt32*) : HRESULT
    @lpVtbl.value.tx_query_hit_point.unsafe_as(Proc(DVASPECT, Int32, Void*, DVTARGETDEVICE*, HDC, HDC, RECT*, Int32, Int32, UInt32*, HRESULT)).call(dwdrawaspect, lindex, pvaspect, ptd, hdcdraw, hictargetdev, lprcclient, x, y, phitresult)
  end
  def on_tx_in_place_activate(prcclient : RECT*) : HRESULT
    @lpVtbl.value.on_tx_in_place_activate.unsafe_as(Proc(RECT*, HRESULT)).call(prcclient)
  end
  def on_tx_in_place_deactivate : HRESULT
    @lpVtbl.value.on_tx_in_place_deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def on_tx_ui_activate : HRESULT
    @lpVtbl.value.on_tx_ui_activate.unsafe_as(Proc(HRESULT)).call
  end
  def on_tx_ui_deactivate : HRESULT
    @lpVtbl.value.on_tx_ui_deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def tx_get_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.tx_get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
  def tx_set_text(psztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.tx_set_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztext)
  end
  def tx_get_cur_target_x(param0 : Int32*) : HRESULT
    @lpVtbl.value.tx_get_cur_target_x.unsafe_as(Proc(Int32*, HRESULT)).call(param0)
  end
  def tx_get_base_line_pos(param0 : Int32*) : HRESULT
    @lpVtbl.value.tx_get_base_line_pos.unsafe_as(Proc(Int32*, HRESULT)).call(param0)
  end
  def tx_get_natural_size(dwaspect : UInt32, hdcdraw : HDC, hictargetdev : HDC, ptd : DVTARGETDEVICE*, dwmode : UInt32, psizelextent : SIZE*, pwidth : Int32*, pheight : Int32*) : HRESULT
    @lpVtbl.value.tx_get_natural_size.unsafe_as(Proc(UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, HRESULT)).call(dwaspect, hdcdraw, hictargetdev, ptd, dwmode, psizelextent, pwidth, pheight)
  end
  def tx_get_drop_target(ppdroptarget : IDropTarget*) : HRESULT
    @lpVtbl.value.tx_get_drop_target.unsafe_as(Proc(IDropTarget*, HRESULT)).call(ppdroptarget)
  end
  def on_tx_property_bits_change(dwmask : UInt32, dwbits : UInt32) : HRESULT
    @lpVtbl.value.on_tx_property_bits_change.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwmask, dwbits)
  end
  def tx_get_cached_size(pdwwidth : UInt32*, pdwheight : UInt32*) : HRESULT
    @lpVtbl.value.tx_get_cached_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwwidth, pdwheight)
  end
  def tx_get_natural_size2(dwaspect : UInt32, hdcdraw : HDC, hictargetdev : HDC, ptd : DVTARGETDEVICE*, dwmode : UInt32, psizelextent : SIZE*, pwidth : Int32*, pheight : Int32*, pascent : Int32*) : HRESULT
    @lpVtbl.value.tx_get_natural_size2.unsafe_as(Proc(UInt32, HDC, HDC, DVTARGETDEVICE*, UInt32, SIZE*, Int32*, Int32*, Int32*, HRESULT)).call(dwaspect, hdcdraw, hictargetdev, ptd, dwmode, psizelextent, pwidth, pheight, pascent)
  end
  def tx_draw_d2_d(prendertarget : ID2D1RenderTarget, lprcbounds : RECTL*, lprcupdate : RECT*, lviewid : Int32) : HRESULT
    @lpVtbl.value.tx_draw_d2_d.unsafe_as(Proc(ID2D1RenderTarget, RECTL*, RECT*, Int32, HRESULT)).call(prendertarget, lprcbounds, lprcupdate, lviewid)
  end
end
struct LibWin32::IRichEditOle
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_site(lplpolesite : IOleClientSite*) : HRESULT
    @lpVtbl.value.get_client_site.unsafe_as(Proc(IOleClientSite*, HRESULT)).call(lplpolesite)
  end
  def get_object_count : Int32
    @lpVtbl.value.get_object_count.unsafe_as(Proc(Int32)).call
  end
  def get_link_count : Int32
    @lpVtbl.value.get_link_count.unsafe_as(Proc(Int32)).call
  end
  def get_object(iob : Int32, lpreobject : REOBJECT*, dwflags : RICH_EDIT_GET_OBJECT_FLAGS) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(Int32, REOBJECT*, RICH_EDIT_GET_OBJECT_FLAGS, HRESULT)).call(iob, lpreobject, dwflags)
  end
  def insert_object(lpreobject : REOBJECT*) : HRESULT
    @lpVtbl.value.insert_object.unsafe_as(Proc(REOBJECT*, HRESULT)).call(lpreobject)
  end
  def convert_object(iob : Int32, rclsidnew : Guid*, lpstrusertypenew : PSTR) : HRESULT
    @lpVtbl.value.convert_object.unsafe_as(Proc(Int32, Guid*, PSTR, HRESULT)).call(iob, rclsidnew, lpstrusertypenew)
  end
  def activate_as(rclsid : Guid*, rclsidas : Guid*) : HRESULT
    @lpVtbl.value.activate_as.unsafe_as(Proc(Guid*, Guid*, HRESULT)).call(rclsid, rclsidas)
  end
  def set_host_names(lpstrcontainerapp : PSTR, lpstrcontainerobj : PSTR) : HRESULT
    @lpVtbl.value.set_host_names.unsafe_as(Proc(PSTR, PSTR, HRESULT)).call(lpstrcontainerapp, lpstrcontainerobj)
  end
  def set_link_available(iob : Int32, favailable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_link_available.unsafe_as(Proc(Int32, LibC::BOOL, HRESULT)).call(iob, favailable)
  end
  def set_dvaspect(iob : Int32, dvaspect : UInt32) : HRESULT
    @lpVtbl.value.set_dvaspect.unsafe_as(Proc(Int32, UInt32, HRESULT)).call(iob, dvaspect)
  end
  def hands_off_storage(iob : Int32) : HRESULT
    @lpVtbl.value.hands_off_storage.unsafe_as(Proc(Int32, HRESULT)).call(iob)
  end
  def save_completed(iob : Int32, lpstg : IStorage) : HRESULT
    @lpVtbl.value.save_completed.unsafe_as(Proc(Int32, IStorage, HRESULT)).call(iob, lpstg)
  end
  def in_place_deactivate : HRESULT
    @lpVtbl.value.in_place_deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def context_sensitive_help(fentermode : LibC::BOOL) : HRESULT
    @lpVtbl.value.context_sensitive_help.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fentermode)
  end
  def get_clipboard_data(lpchrg : CHARRANGE*, reco : UInt32, lplpdataobj : IDataObject*) : HRESULT
    @lpVtbl.value.get_clipboard_data.unsafe_as(Proc(CHARRANGE*, UInt32, IDataObject*, HRESULT)).call(lpchrg, reco, lplpdataobj)
  end
  def import_data_object(lpdataobj : IDataObject, cf : UInt16, hmetapict : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.import_data_object.unsafe_as(Proc(IDataObject, UInt16, LibC::IntPtrT, HRESULT)).call(lpdataobj, cf, hmetapict)
  end
end
struct LibWin32::IRichEditOleCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_new_storage(lplpstg : IStorage*) : HRESULT
    @lpVtbl.value.get_new_storage.unsafe_as(Proc(IStorage*, HRESULT)).call(lplpstg)
  end
  def get_in_place_context(lplpframe : IOleInPlaceFrame*, lplpdoc : IOleInPlaceUIWindow*, lpframeinfo : OIFI*) : HRESULT
    @lpVtbl.value.get_in_place_context.unsafe_as(Proc(IOleInPlaceFrame*, IOleInPlaceUIWindow*, OIFI*, HRESULT)).call(lplpframe, lplpdoc, lpframeinfo)
  end
  def show_container_ui(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show_container_ui.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def query_insert_object(lpclsid : Guid*, lpstg : IStorage, cp : Int32) : HRESULT
    @lpVtbl.value.query_insert_object.unsafe_as(Proc(Guid*, IStorage, Int32, HRESULT)).call(lpclsid, lpstg, cp)
  end
  def delete_object(lpoleobj : IOleObject) : HRESULT
    @lpVtbl.value.delete_object.unsafe_as(Proc(IOleObject, HRESULT)).call(lpoleobj)
  end
  def query_accept_data(lpdataobj : IDataObject, lpcfformat : UInt16*, reco : UInt32, freally : LibC::BOOL, hmetapict : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.query_accept_data.unsafe_as(Proc(IDataObject, UInt16*, UInt32, LibC::BOOL, LibC::IntPtrT, HRESULT)).call(lpdataobj, lpcfformat, reco, freally, hmetapict)
  end
  def context_sensitive_help(fentermode : LibC::BOOL) : HRESULT
    @lpVtbl.value.context_sensitive_help.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fentermode)
  end
  def get_clipboard_data(lpchrg : CHARRANGE*, reco : UInt32, lplpdataobj : IDataObject*) : HRESULT
    @lpVtbl.value.get_clipboard_data.unsafe_as(Proc(CHARRANGE*, UInt32, IDataObject*, HRESULT)).call(lpchrg, reco, lplpdataobj)
  end
  def get_drag_drop_effect(fdrag : LibC::BOOL, grfkeystate : UInt32, pdweffect : UInt32*) : HRESULT
    @lpVtbl.value.get_drag_drop_effect.unsafe_as(Proc(LibC::BOOL, UInt32, UInt32*, HRESULT)).call(fdrag, grfkeystate, pdweffect)
  end
  def get_context_menu(seltype : RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, lpoleobj : IOleObject, lpchrg : CHARRANGE*, lphmenu : HANDLE*) : HRESULT
    @lpVtbl.value.get_context_menu.unsafe_as(Proc(RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, IOleObject, CHARRANGE*, HANDLE*, HRESULT)).call(seltype, lpoleobj, lpchrg, lphmenu)
  end
end
struct LibWin32::ITextDocument
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
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_selection(ppsel : ITextSelection*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(ITextSelection*, HRESULT)).call(ppsel)
  end
  def get_story_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_ranges(ppstories : ITextStoryRanges*) : HRESULT
    @lpVtbl.value.get_story_ranges.unsafe_as(Proc(ITextStoryRanges*, HRESULT)).call(ppstories)
  end
  def get_saved(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_saved.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_saved(value : Tomconstants) : HRESULT
    @lpVtbl.value.set_saved.unsafe_as(Proc(Tomconstants, HRESULT)).call(value)
  end
  def get_default_tab_stop(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_default_tab_stop.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_default_tab_stop(value : Float32) : HRESULT
    @lpVtbl.value.set_default_tab_stop.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def new : HRESULT
    @lpVtbl.value.new.unsafe_as(Proc(HRESULT)).call
  end
  def open(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def save(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def freeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.freeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def unfreeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.unfreeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def begin_edit_collection : HRESULT
    @lpVtbl.value.begin_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def end_edit_collection : HRESULT
    @lpVtbl.value.end_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def undo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.undo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def redo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.redo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def range(cpactive : Int32, cpanchor : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(cpactive, cpanchor, pprange)
  end
  def range_from_point(x : Int32, y : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(x, y, pprange)
  end
end
struct LibWin32::ITextRange
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
  def get_text(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_char(pchar : Int32*) : HRESULT
    @lpVtbl.value.get_char.unsafe_as(Proc(Int32*, HRESULT)).call(pchar)
  end
  def set_char(char : Int32) : HRESULT
    @lpVtbl.value.set_char.unsafe_as(Proc(Int32, HRESULT)).call(char)
  end
  def get_duplicate(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def get_formatted_text(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def set_formatted_text(prange : ITextRange) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(ITextRange, HRESULT)).call(prange)
  end
  def get_start(pcpfirst : Int32*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(Int32*, HRESULT)).call(pcpfirst)
  end
  def set_start(cpfirst : Int32) : HRESULT
    @lpVtbl.value.set_start.unsafe_as(Proc(Int32, HRESULT)).call(cpfirst)
  end
  def get_end(pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(Int32*, HRESULT)).call(pcplim)
  end
  def set_end(cplim : Int32) : HRESULT
    @lpVtbl.value.set_end.unsafe_as(Proc(Int32, HRESULT)).call(cplim)
  end
  def get_font(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_font(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_font.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def get_para(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_para.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_para(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_para.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def get_story_length(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_story_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def collapse(bstart : Int32) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(Int32, HRESULT)).call(bstart)
  end
  def expand(unit : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pdelta)
  end
  def get_index(unit : Int32, pindex : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pindex)
  end
  def set_index(unit : Int32, index : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_index.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(unit, index, extend)
  end
  def set_range(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def in_range(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_range.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def in_story(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_story.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def is_equal(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def start_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.start_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def move(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_start(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_end(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def find_text(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_start(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_start.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_end(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_end.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def delete(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def cut(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.cut.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def copy(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def paste(pvar : VARIANT*, format : Int32) : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(VARIANT*, Int32, HRESULT)).call(pvar, format)
  end
  def can_paste(pvar : VARIANT*, format : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_paste.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(pvar, format, pvalue)
  end
  def can_edit(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_edit.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def change_case(type : Int32) : HRESULT
    @lpVtbl.value.change_case.unsafe_as(Proc(Int32, HRESULT)).call(type)
  end
  def get_point(type : Int32, px : Int32*, py : Int32*) : HRESULT
    @lpVtbl.value.get_point.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(type, px, py)
  end
  def set_point(x : Int32, y : Int32, type : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_point.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(x, y, type, extend)
  end
  def scroll_into_view(value : Int32) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_embedded_object(ppobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded_object.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppobject)
  end
end
struct LibWin32::ITextSelection
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
  def get_text(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_char(pchar : Int32*) : HRESULT
    @lpVtbl.value.get_char.unsafe_as(Proc(Int32*, HRESULT)).call(pchar)
  end
  def set_char(char : Int32) : HRESULT
    @lpVtbl.value.set_char.unsafe_as(Proc(Int32, HRESULT)).call(char)
  end
  def get_duplicate(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def get_formatted_text(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def set_formatted_text(prange : ITextRange) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(ITextRange, HRESULT)).call(prange)
  end
  def get_start(pcpfirst : Int32*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(Int32*, HRESULT)).call(pcpfirst)
  end
  def set_start(cpfirst : Int32) : HRESULT
    @lpVtbl.value.set_start.unsafe_as(Proc(Int32, HRESULT)).call(cpfirst)
  end
  def get_end(pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(Int32*, HRESULT)).call(pcplim)
  end
  def set_end(cplim : Int32) : HRESULT
    @lpVtbl.value.set_end.unsafe_as(Proc(Int32, HRESULT)).call(cplim)
  end
  def get_font(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_font(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_font.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def get_para(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_para.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_para(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_para.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def get_story_length(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_story_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def collapse(bstart : Int32) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(Int32, HRESULT)).call(bstart)
  end
  def expand(unit : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pdelta)
  end
  def get_index(unit : Int32, pindex : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pindex)
  end
  def set_index(unit : Int32, index : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_index.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(unit, index, extend)
  end
  def set_range(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def in_range(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_range.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def in_story(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_story.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def is_equal(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def start_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.start_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def move(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_start(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_end(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def find_text(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_start(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_start.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_end(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_end.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def delete(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def cut(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.cut.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def copy(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def paste(pvar : VARIANT*, format : Int32) : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(VARIANT*, Int32, HRESULT)).call(pvar, format)
  end
  def can_paste(pvar : VARIANT*, format : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_paste.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(pvar, format, pvalue)
  end
  def can_edit(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_edit.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def change_case(type : Int32) : HRESULT
    @lpVtbl.value.change_case.unsafe_as(Proc(Int32, HRESULT)).call(type)
  end
  def get_point(type : Int32, px : Int32*, py : Int32*) : HRESULT
    @lpVtbl.value.get_point.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(type, px, py)
  end
  def set_point(x : Int32, y : Int32, type : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_point.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(x, y, type, extend)
  end
  def scroll_into_view(value : Int32) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_embedded_object(ppobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded_object.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppobject)
  end
  def get_flags(pflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pflags)
  end
  def set_flags(flags : Int32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def get_type(ptype : Int32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Int32*, HRESULT)).call(ptype)
  end
  def move_left(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_left.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_right(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_right.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_up(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_up.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_down(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_down.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def home_key(unit : Tomconstants, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.home_key.unsafe_as(Proc(Tomconstants, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_key(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_key.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def type_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.type_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
end
struct LibWin32::ITextFont
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
  def get_duplicate(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_duplicate(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_duplicate.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def can_change(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_change.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def is_equal(pfont : ITextFont, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextFont, Int32*, HRESULT)).call(pfont, pvalue)
  end
  def reset(value : Tomconstants) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Tomconstants, HRESULT)).call(value)
  end
  def get_style(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_style.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_style(value : Int32) : HRESULT
    @lpVtbl.value.set_style.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_all_caps(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_all_caps.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_all_caps(value : Int32) : HRESULT
    @lpVtbl.value.set_all_caps.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_animation(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_animation.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_animation(value : Int32) : HRESULT
    @lpVtbl.value.set_animation.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_back_color(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_back_color(value : Int32) : HRESULT
    @lpVtbl.value.set_back_color.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_bold(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_bold.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_bold(value : Int32) : HRESULT
    @lpVtbl.value.set_bold.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_emboss(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_emboss.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_emboss(value : Int32) : HRESULT
    @lpVtbl.value.set_emboss.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_fore_color(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_fore_color.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_fore_color(value : Int32) : HRESULT
    @lpVtbl.value.set_fore_color.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_hidden(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_hidden.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_hidden(value : Int32) : HRESULT
    @lpVtbl.value.set_hidden.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_engrave(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_engrave.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_engrave(value : Int32) : HRESULT
    @lpVtbl.value.set_engrave.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_italic(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_italic.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_italic(value : Int32) : HRESULT
    @lpVtbl.value.set_italic.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_kerning(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_kerning.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_kerning(value : Float32) : HRESULT
    @lpVtbl.value.set_kerning.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_language_id(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_language_id.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_language_id(value : Int32) : HRESULT
    @lpVtbl.value.set_language_id.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_name(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_outline(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_outline.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_outline(value : Int32) : HRESULT
    @lpVtbl.value.set_outline.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_position(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_position.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_position(value : Float32) : HRESULT
    @lpVtbl.value.set_position.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_protected(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_protected.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_protected(value : Int32) : HRESULT
    @lpVtbl.value.set_protected.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_shadow(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_shadow.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_shadow(value : Int32) : HRESULT
    @lpVtbl.value.set_shadow.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_size(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_size(value : Float32) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_small_caps(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_small_caps.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_small_caps(value : Int32) : HRESULT
    @lpVtbl.value.set_small_caps.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_spacing(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_spacing.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_spacing(value : Float32) : HRESULT
    @lpVtbl.value.set_spacing.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_strike_through(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_strike_through.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_strike_through(value : Int32) : HRESULT
    @lpVtbl.value.set_strike_through.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_subscript(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_subscript.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_subscript(value : Int32) : HRESULT
    @lpVtbl.value.set_subscript.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_superscript(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_superscript.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_superscript(value : Int32) : HRESULT
    @lpVtbl.value.set_superscript.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_underline(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_underline.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_underline(value : Int32) : HRESULT
    @lpVtbl.value.set_underline.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_weight(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_weight.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_weight(value : Int32) : HRESULT
    @lpVtbl.value.set_weight.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
end
struct LibWin32::ITextPara
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
  def get_duplicate(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_duplicate(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_duplicate.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def can_change(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_change.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def is_equal(ppara : ITextPara, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextPara, Int32*, HRESULT)).call(ppara, pvalue)
  end
  def reset(value : Int32) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_style(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_style.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_style(value : Int32) : HRESULT
    @lpVtbl.value.set_style.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_hyphenation(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_hyphenation.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_hyphenation(value : Int32) : HRESULT
    @lpVtbl.value.set_hyphenation.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_first_line_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_first_line_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_keep_together(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_keep_together.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_keep_together(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_together.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_keep_with_next(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_keep_with_next.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_keep_with_next(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_with_next.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_left_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_left_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_line_spacing(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_line_spacing.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_line_spacing_rule(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_line_spacing_rule.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_list_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_list_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_level_index(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_level_index.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_level_index(value : Int32) : HRESULT
    @lpVtbl.value.set_list_level_index.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_start(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_start.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_start(value : Int32) : HRESULT
    @lpVtbl.value.set_list_start.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_tab(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_list_tab.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_list_tab(value : Float32) : HRESULT
    @lpVtbl.value.set_list_tab.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_list_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_type(value : Int32) : HRESULT
    @lpVtbl.value.set_list_type.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_no_line_number(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_no_line_number.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_no_line_number(value : Int32) : HRESULT
    @lpVtbl.value.set_no_line_number.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_page_break_before(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_page_break_before.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_page_break_before(value : Int32) : HRESULT
    @lpVtbl.value.set_page_break_before.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_right_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_right_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_right_indent(value : Float32) : HRESULT
    @lpVtbl.value.set_right_indent.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def set_indents(first : Float32, left : Float32, right : Float32) : HRESULT
    @lpVtbl.value.set_indents.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(first, left, right)
  end
  def set_line_spacing(rule : Int32, spacing : Float32) : HRESULT
    @lpVtbl.value.set_line_spacing.unsafe_as(Proc(Int32, Float32, HRESULT)).call(rule, spacing)
  end
  def get_space_after(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_space_after.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_space_after(value : Float32) : HRESULT
    @lpVtbl.value.set_space_after.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_space_before(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_space_before.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_space_before(value : Float32) : HRESULT
    @lpVtbl.value.set_space_before.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_widow_control(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_widow_control.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_widow_control(value : Int32) : HRESULT
    @lpVtbl.value.set_widow_control.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_tab_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_tab_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def add_tab(tbpos : Float32, tbalign : Int32, tbleader : Int32) : HRESULT
    @lpVtbl.value.add_tab.unsafe_as(Proc(Float32, Int32, Int32, HRESULT)).call(tbpos, tbalign, tbleader)
  end
  def clear_all_tabs : HRESULT
    @lpVtbl.value.clear_all_tabs.unsafe_as(Proc(HRESULT)).call
  end
  def delete_tab(tbpos : Float32) : HRESULT
    @lpVtbl.value.delete_tab.unsafe_as(Proc(Float32, HRESULT)).call(tbpos)
  end
  def get_tab(itab : Int32, ptbpos : Float32*, ptbalign : Int32*, ptbleader : Int32*) : HRESULT
    @lpVtbl.value.get_tab.unsafe_as(Proc(Int32, Float32*, Int32*, Int32*, HRESULT)).call(itab, ptbpos, ptbalign, ptbleader)
  end
end
struct LibWin32::ITextStoryRanges
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
  def _new_enum(ppunkenum : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunkenum)
  end
  def item(index : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ITextRange*, HRESULT)).call(index, pprange)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
end
struct LibWin32::ITextDocument2
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
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_selection(ppsel : ITextSelection*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(ITextSelection*, HRESULT)).call(ppsel)
  end
  def get_story_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_ranges(ppstories : ITextStoryRanges*) : HRESULT
    @lpVtbl.value.get_story_ranges.unsafe_as(Proc(ITextStoryRanges*, HRESULT)).call(ppstories)
  end
  def get_saved(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_saved.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_saved(value : Tomconstants) : HRESULT
    @lpVtbl.value.set_saved.unsafe_as(Proc(Tomconstants, HRESULT)).call(value)
  end
  def get_default_tab_stop(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_default_tab_stop.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_default_tab_stop(value : Float32) : HRESULT
    @lpVtbl.value.set_default_tab_stop.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def new : HRESULT
    @lpVtbl.value.new.unsafe_as(Proc(HRESULT)).call
  end
  def open(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def save(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def freeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.freeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def unfreeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.unfreeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def begin_edit_collection : HRESULT
    @lpVtbl.value.begin_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def end_edit_collection : HRESULT
    @lpVtbl.value.end_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def undo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.undo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def redo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.redo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def range(cpactive : Int32, cpanchor : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(cpactive, cpanchor, pprange)
  end
  def range_from_point(x : Int32, y : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(x, y, pprange)
  end
  def get_caret_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_caret_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_caret_type(value : Int32) : HRESULT
    @lpVtbl.value.set_caret_type.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_displays(ppdisplays : ITextDisplays*) : HRESULT
    @lpVtbl.value.get_displays.unsafe_as(Proc(ITextDisplays*, HRESULT)).call(ppdisplays)
  end
  def get_document_font(ppfont : ITextFont2*) : HRESULT
    @lpVtbl.value.get_document_font.unsafe_as(Proc(ITextFont2*, HRESULT)).call(ppfont)
  end
  def set_document_font(pfont : ITextFont2) : HRESULT
    @lpVtbl.value.set_document_font.unsafe_as(Proc(ITextFont2, HRESULT)).call(pfont)
  end
  def get_document_para(pppara : ITextPara2*) : HRESULT
    @lpVtbl.value.get_document_para.unsafe_as(Proc(ITextPara2*, HRESULT)).call(pppara)
  end
  def set_document_para(ppara : ITextPara2) : HRESULT
    @lpVtbl.value.set_document_para.unsafe_as(Proc(ITextPara2, HRESULT)).call(ppara)
  end
  def get_east_asian_flags(pflags : Tomconstants*) : HRESULT
    @lpVtbl.value.get_east_asian_flags.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pflags)
  end
  def get_generator(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_generator.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_ime_in_progress(value : Int32) : HRESULT
    @lpVtbl.value.set_ime_in_progress.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_notification_mode(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_notification_mode.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_notification_mode(value : Int32) : HRESULT
    @lpVtbl.value.set_notification_mode.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_selection2(ppsel : ITextSelection2*) : HRESULT
    @lpVtbl.value.get_selection2.unsafe_as(Proc(ITextSelection2*, HRESULT)).call(ppsel)
  end
  def get_story_ranges2(ppstories : ITextStoryRanges2*) : HRESULT
    @lpVtbl.value.get_story_ranges2.unsafe_as(Proc(ITextStoryRanges2*, HRESULT)).call(ppstories)
  end
  def get_typography_options(poptions : Int32*) : HRESULT
    @lpVtbl.value.get_typography_options.unsafe_as(Proc(Int32*, HRESULT)).call(poptions)
  end
  def get_version(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_window(phwnd : Int64*) : HRESULT
    @lpVtbl.value.get_window.unsafe_as(Proc(Int64*, HRESULT)).call(phwnd)
  end
  def attach_msg_filter(pfilter : IUnknown) : HRESULT
    @lpVtbl.value.attach_msg_filter.unsafe_as(Proc(IUnknown, HRESULT)).call(pfilter)
  end
  def check_text_limit(cch : Int32, pcch : Int32*) : HRESULT
    @lpVtbl.value.check_text_limit.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(cch, pcch)
  end
  def get_call_manager(ppvoid : IUnknown*) : HRESULT
    @lpVtbl.value.get_call_manager.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppvoid)
  end
  def get_client_rect(type : Tomconstants, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : HRESULT
    @lpVtbl.value.get_client_rect.unsafe_as(Proc(Tomconstants, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(type, pleft, ptop, pright, pbottom)
  end
  def get_effect_color(index : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_effect_color.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(index, pvalue)
  end
  def get_imm_context(pcontext : Int64*) : HRESULT
    @lpVtbl.value.get_imm_context.unsafe_as(Proc(Int64*, HRESULT)).call(pcontext)
  end
  def get_preferred_font(cp : Int32, charrep : Int32, options : Int32, curcharrep : Int32, curfontsize : Int32, pbstr : UInt8**, ppitchandfamily : Int32*, pnewfontsize : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_font.unsafe_as(Proc(Int32, Int32, Int32, Int32, Int32, UInt8**, Int32*, Int32*, HRESULT)).call(cp, charrep, options, curcharrep, curfontsize, pbstr, ppitchandfamily, pnewfontsize)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def get_strings(ppstrs : ITextStrings*) : HRESULT
    @lpVtbl.value.get_strings.unsafe_as(Proc(ITextStrings*, HRESULT)).call(ppstrs)
  end
  def notify(notify : Int32) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(Int32, HRESULT)).call(notify)
  end
  def range2(cpactive : Int32, cpanchor : Int32, pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.range2.unsafe_as(Proc(Int32, Int32, ITextRange2*, HRESULT)).call(cpactive, cpanchor, pprange)
  end
  def range_from_point2(x : Int32, y : Int32, type : Int32, pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.range_from_point2.unsafe_as(Proc(Int32, Int32, Int32, ITextRange2*, HRESULT)).call(x, y, type, pprange)
  end
  def release_call_manager(pvoid : IUnknown) : HRESULT
    @lpVtbl.value.release_call_manager.unsafe_as(Proc(IUnknown, HRESULT)).call(pvoid)
  end
  def release_imm_context(context : Int64) : HRESULT
    @lpVtbl.value.release_imm_context.unsafe_as(Proc(Int64, HRESULT)).call(context)
  end
  def set_effect_color(index : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_effect_color.unsafe_as(Proc(Int32, Int32, HRESULT)).call(index, value)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
  def set_typography_options(options : Int32, mask : Int32) : HRESULT
    @lpVtbl.value.set_typography_options.unsafe_as(Proc(Int32, Int32, HRESULT)).call(options, mask)
  end
  def sys_beep : HRESULT
    @lpVtbl.value.sys_beep.unsafe_as(Proc(HRESULT)).call
  end
  def update(value : Int32) : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def update_window : HRESULT
    @lpVtbl.value.update_window.unsafe_as(Proc(HRESULT)).call
  end
  def get_math_properties(poptions : Int32*) : HRESULT
    @lpVtbl.value.get_math_properties.unsafe_as(Proc(Int32*, HRESULT)).call(poptions)
  end
  def set_math_properties(options : Int32, mask : Int32) : HRESULT
    @lpVtbl.value.set_math_properties.unsafe_as(Proc(Int32, Int32, HRESULT)).call(options, mask)
  end
  def get_active_story(ppstory : ITextStory*) : HRESULT
    @lpVtbl.value.get_active_story.unsafe_as(Proc(ITextStory*, HRESULT)).call(ppstory)
  end
  def set_active_story(pstory : ITextStory) : HRESULT
    @lpVtbl.value.set_active_story.unsafe_as(Proc(ITextStory, HRESULT)).call(pstory)
  end
  def get_main_story(ppstory : ITextStory*) : HRESULT
    @lpVtbl.value.get_main_story.unsafe_as(Proc(ITextStory*, HRESULT)).call(ppstory)
  end
  def get_new_story(ppstory : ITextStory*) : HRESULT
    @lpVtbl.value.get_new_story.unsafe_as(Proc(ITextStory*, HRESULT)).call(ppstory)
  end
  def get_story(index : Int32, ppstory : ITextStory*) : HRESULT
    @lpVtbl.value.get_story.unsafe_as(Proc(Int32, ITextStory*, HRESULT)).call(index, ppstory)
  end
end
struct LibWin32::ITextRange2
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
  def get_text(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_char(pchar : Int32*) : HRESULT
    @lpVtbl.value.get_char.unsafe_as(Proc(Int32*, HRESULT)).call(pchar)
  end
  def set_char(char : Int32) : HRESULT
    @lpVtbl.value.set_char.unsafe_as(Proc(Int32, HRESULT)).call(char)
  end
  def get_duplicate(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def get_formatted_text(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def set_formatted_text(prange : ITextRange) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(ITextRange, HRESULT)).call(prange)
  end
  def get_start(pcpfirst : Int32*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(Int32*, HRESULT)).call(pcpfirst)
  end
  def set_start(cpfirst : Int32) : HRESULT
    @lpVtbl.value.set_start.unsafe_as(Proc(Int32, HRESULT)).call(cpfirst)
  end
  def get_end(pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(Int32*, HRESULT)).call(pcplim)
  end
  def set_end(cplim : Int32) : HRESULT
    @lpVtbl.value.set_end.unsafe_as(Proc(Int32, HRESULT)).call(cplim)
  end
  def get_font(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_font(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_font.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def get_para(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_para.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_para(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_para.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def get_story_length(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_story_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def collapse(bstart : Int32) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(Int32, HRESULT)).call(bstart)
  end
  def expand(unit : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pdelta)
  end
  def get_index(unit : Int32, pindex : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pindex)
  end
  def set_index(unit : Int32, index : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_index.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(unit, index, extend)
  end
  def set_range(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def in_range(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_range.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def in_story(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_story.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def is_equal(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def start_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.start_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def move(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_start(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_end(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def find_text(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_start(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_start.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_end(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_end.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def delete(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def cut(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.cut.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def copy(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def paste(pvar : VARIANT*, format : Int32) : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(VARIANT*, Int32, HRESULT)).call(pvar, format)
  end
  def can_paste(pvar : VARIANT*, format : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_paste.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(pvar, format, pvalue)
  end
  def can_edit(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_edit.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def change_case(type : Int32) : HRESULT
    @lpVtbl.value.change_case.unsafe_as(Proc(Int32, HRESULT)).call(type)
  end
  def get_point(type : Int32, px : Int32*, py : Int32*) : HRESULT
    @lpVtbl.value.get_point.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(type, px, py)
  end
  def set_point(x : Int32, y : Int32, type : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_point.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(x, y, type, extend)
  end
  def scroll_into_view(value : Int32) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_embedded_object(ppobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded_object.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppobject)
  end
  def get_flags(pflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pflags)
  end
  def set_flags(flags : Int32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def get_type(ptype : Int32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Int32*, HRESULT)).call(ptype)
  end
  def move_left(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_left.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_right(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_right.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_up(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_up.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_down(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_down.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def home_key(unit : Tomconstants, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.home_key.unsafe_as(Proc(Tomconstants, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_key(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_key.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def type_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.type_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_cch(pcch : Int32*) : HRESULT
    @lpVtbl.value.get_cch.unsafe_as(Proc(Int32*, HRESULT)).call(pcch)
  end
  def get_cells(ppcells : IUnknown*) : HRESULT
    @lpVtbl.value.get_cells.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcells)
  end
  def get_column(ppcolumn : IUnknown*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcolumn)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_duplicate2(pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.get_duplicate2.unsafe_as(Proc(ITextRange2*, HRESULT)).call(pprange)
  end
  def get_font2(ppfont : ITextFont2*) : HRESULT
    @lpVtbl.value.get_font2.unsafe_as(Proc(ITextFont2*, HRESULT)).call(ppfont)
  end
  def set_font2(pfont : ITextFont2) : HRESULT
    @lpVtbl.value.set_font2.unsafe_as(Proc(ITextFont2, HRESULT)).call(pfont)
  end
  def get_formatted_text2(pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.get_formatted_text2.unsafe_as(Proc(ITextRange2*, HRESULT)).call(pprange)
  end
  def set_formatted_text2(prange : ITextRange2) : HRESULT
    @lpVtbl.value.set_formatted_text2.unsafe_as(Proc(ITextRange2, HRESULT)).call(prange)
  end
  def get_gravity(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_gravity.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_gravity(value : Int32) : HRESULT
    @lpVtbl.value.set_gravity.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_para2(pppara : ITextPara2*) : HRESULT
    @lpVtbl.value.get_para2.unsafe_as(Proc(ITextPara2*, HRESULT)).call(pppara)
  end
  def set_para2(ppara : ITextPara2) : HRESULT
    @lpVtbl.value.set_para2.unsafe_as(Proc(ITextPara2, HRESULT)).call(ppara)
  end
  def get_row(pprow : ITextRow*) : HRESULT
    @lpVtbl.value.get_row.unsafe_as(Proc(ITextRow*, HRESULT)).call(pprow)
  end
  def get_start_para(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_start_para.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_table(pptable : IUnknown*) : HRESULT
    @lpVtbl.value.get_table.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptable)
  end
  def get_url(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_url(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_url.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def add_subrange(cp1 : Int32, cp2 : Int32, activate : Int32) : HRESULT
    @lpVtbl.value.add_subrange.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(cp1, cp2, activate)
  end
  def build_up_math(flags : Int32) : HRESULT
    @lpVtbl.value.build_up_math.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def delete_subrange(cpfirst : Int32, cplim : Int32) : HRESULT
    @lpVtbl.value.delete_subrange.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpfirst, cplim)
  end
  def find(prange : ITextRange2, count : Int32, flags : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.find.unsafe_as(Proc(ITextRange2, Int32, Int32, Int32*, HRESULT)).call(prange, count, flags, pdelta)
  end
  def get_char2(pchar : Int32*, offset : Int32) : HRESULT
    @lpVtbl.value.get_char2.unsafe_as(Proc(Int32*, Int32, HRESULT)).call(pchar, offset)
  end
  def get_drop_cap(pcline : Int32*, pposition : Int32*) : HRESULT
    @lpVtbl.value.get_drop_cap.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pcline, pposition)
  end
  def get_inline_object(ptype : Int32*, palign : Int32*, pchar : Int32*, pchar1 : Int32*, pchar2 : Int32*, pcount : Int32*, ptexstyle : Int32*, pccol : Int32*, plevel : Int32*) : HRESULT
    @lpVtbl.value.get_inline_object.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(ptype, palign, pchar, pchar1, pchar2, pcount, ptexstyle, pccol, plevel)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def get_rect(type : Int32, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*, phit : Int32*) : HRESULT
    @lpVtbl.value.get_rect.unsafe_as(Proc(Int32, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(type, pleft, ptop, pright, pbottom, phit)
  end
  def get_subrange(isubrange : Int32, pcpfirst : Int32*, pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_subrange.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(isubrange, pcpfirst, pcplim)
  end
  def get_text2(flags : Int32, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text2.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(flags, pbstr)
  end
  def hex_to_unicode : HRESULT
    @lpVtbl.value.hex_to_unicode.unsafe_as(Proc(HRESULT)).call
  end
  def insert_table(ccol : Int32, crow : Int32, autofit : Int32) : HRESULT
    @lpVtbl.value.insert_table.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(ccol, crow, autofit)
  end
  def linearize(flags : Int32) : HRESULT
    @lpVtbl.value.linearize.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def set_active_subrange(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_active_subrange.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def set_drop_cap(cline : Int32, position : Int32) : HRESULT
    @lpVtbl.value.set_drop_cap.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cline, position)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
  def set_text2(flags : Int32, bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text2.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(flags, bstr)
  end
  def unicode_to_hex : HRESULT
    @lpVtbl.value.unicode_to_hex.unsafe_as(Proc(HRESULT)).call
  end
  def set_inline_object(type : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, texstyle : Int32, ccol : Int32) : HRESULT
    @lpVtbl.value.set_inline_object.unsafe_as(Proc(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, HRESULT)).call(type, align, char, char1, char2, count, texstyle, ccol)
  end
  def get_math_function_type(bstr : UInt8*, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_math_function_type.unsafe_as(Proc(UInt8*, Int32*, HRESULT)).call(bstr, pvalue)
  end
  def insert_image(width : Int32, height : Int32, ascent : Int32, type : TEXT_ALIGN_OPTIONS, bstralttext : UInt8*, pstream : IStream) : HRESULT
    @lpVtbl.value.insert_image.unsafe_as(Proc(Int32, Int32, Int32, TEXT_ALIGN_OPTIONS, UInt8*, IStream, HRESULT)).call(width, height, ascent, type, bstralttext, pstream)
  end
end
struct LibWin32::ITextSelection2
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
  def get_text(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_char(pchar : Int32*) : HRESULT
    @lpVtbl.value.get_char.unsafe_as(Proc(Int32*, HRESULT)).call(pchar)
  end
  def set_char(char : Int32) : HRESULT
    @lpVtbl.value.set_char.unsafe_as(Proc(Int32, HRESULT)).call(char)
  end
  def get_duplicate(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def get_formatted_text(pprange : ITextRange*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(ITextRange*, HRESULT)).call(pprange)
  end
  def set_formatted_text(prange : ITextRange) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(ITextRange, HRESULT)).call(prange)
  end
  def get_start(pcpfirst : Int32*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(Int32*, HRESULT)).call(pcpfirst)
  end
  def set_start(cpfirst : Int32) : HRESULT
    @lpVtbl.value.set_start.unsafe_as(Proc(Int32, HRESULT)).call(cpfirst)
  end
  def get_end(pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(Int32*, HRESULT)).call(pcplim)
  end
  def set_end(cplim : Int32) : HRESULT
    @lpVtbl.value.set_end.unsafe_as(Proc(Int32, HRESULT)).call(cplim)
  end
  def get_font(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_font(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_font.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def get_para(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_para.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_para(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_para.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def get_story_length(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_story_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def collapse(bstart : Int32) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(Int32, HRESULT)).call(bstart)
  end
  def expand(unit : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pdelta)
  end
  def get_index(unit : Int32, pindex : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(unit, pindex)
  end
  def set_index(unit : Int32, index : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_index.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(unit, index, extend)
  end
  def set_range(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def in_range(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_range.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def in_story(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.in_story.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def is_equal(prange : ITextRange, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextRange, Int32*, HRESULT)).call(prange, pvalue)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def start_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.start_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_of(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_of.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def move(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_start(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_end(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def move_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_while(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_while.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_start_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_start_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def move_end_until(cset : VARIANT*, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_end_until.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(cset, count, pdelta)
  end
  def find_text(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_start(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_start.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def find_text_end(bstr : UInt8*, count : Int32, flags : Int32, plength : Int32*) : HRESULT
    @lpVtbl.value.find_text_end.unsafe_as(Proc(UInt8*, Int32, Int32, Int32*, HRESULT)).call(bstr, count, flags, plength)
  end
  def delete(unit : Int32, count : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, count, pdelta)
  end
  def cut(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.cut.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def copy(pvar : VARIANT*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvar)
  end
  def paste(pvar : VARIANT*, format : Int32) : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(VARIANT*, Int32, HRESULT)).call(pvar, format)
  end
  def can_paste(pvar : VARIANT*, format : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_paste.unsafe_as(Proc(VARIANT*, Int32, Int32*, HRESULT)).call(pvar, format, pvalue)
  end
  def can_edit(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_edit.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def change_case(type : Int32) : HRESULT
    @lpVtbl.value.change_case.unsafe_as(Proc(Int32, HRESULT)).call(type)
  end
  def get_point(type : Int32, px : Int32*, py : Int32*) : HRESULT
    @lpVtbl.value.get_point.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(type, px, py)
  end
  def set_point(x : Int32, y : Int32, type : Int32, extend : Int32) : HRESULT
    @lpVtbl.value.set_point.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(x, y, type, extend)
  end
  def scroll_into_view(value : Int32) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_embedded_object(ppobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded_object.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppobject)
  end
  def get_flags(pflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pflags)
  end
  def set_flags(flags : Int32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def get_type(ptype : Int32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Int32*, HRESULT)).call(ptype)
  end
  def move_left(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_left.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_right(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_right.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_up(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_up.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def move_down(unit : Int32, count : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.move_down.unsafe_as(Proc(Int32, Int32, Int32, Int32*, HRESULT)).call(unit, count, extend, pdelta)
  end
  def home_key(unit : Tomconstants, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.home_key.unsafe_as(Proc(Tomconstants, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def end_key(unit : Int32, extend : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.end_key.unsafe_as(Proc(Int32, Int32, Int32*, HRESULT)).call(unit, extend, pdelta)
  end
  def type_text(bstr : UInt8*) : HRESULT
    @lpVtbl.value.type_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_cch(pcch : Int32*) : HRESULT
    @lpVtbl.value.get_cch.unsafe_as(Proc(Int32*, HRESULT)).call(pcch)
  end
  def get_cells(ppcells : IUnknown*) : HRESULT
    @lpVtbl.value.get_cells.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcells)
  end
  def get_column(ppcolumn : IUnknown*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcolumn)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_duplicate2(pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.get_duplicate2.unsafe_as(Proc(ITextRange2*, HRESULT)).call(pprange)
  end
  def get_font2(ppfont : ITextFont2*) : HRESULT
    @lpVtbl.value.get_font2.unsafe_as(Proc(ITextFont2*, HRESULT)).call(ppfont)
  end
  def set_font2(pfont : ITextFont2) : HRESULT
    @lpVtbl.value.set_font2.unsafe_as(Proc(ITextFont2, HRESULT)).call(pfont)
  end
  def get_formatted_text2(pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.get_formatted_text2.unsafe_as(Proc(ITextRange2*, HRESULT)).call(pprange)
  end
  def set_formatted_text2(prange : ITextRange2) : HRESULT
    @lpVtbl.value.set_formatted_text2.unsafe_as(Proc(ITextRange2, HRESULT)).call(prange)
  end
  def get_gravity(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_gravity.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_gravity(value : Int32) : HRESULT
    @lpVtbl.value.set_gravity.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_para2(pppara : ITextPara2*) : HRESULT
    @lpVtbl.value.get_para2.unsafe_as(Proc(ITextPara2*, HRESULT)).call(pppara)
  end
  def set_para2(ppara : ITextPara2) : HRESULT
    @lpVtbl.value.set_para2.unsafe_as(Proc(ITextPara2, HRESULT)).call(ppara)
  end
  def get_row(pprow : ITextRow*) : HRESULT
    @lpVtbl.value.get_row.unsafe_as(Proc(ITextRow*, HRESULT)).call(pprow)
  end
  def get_start_para(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_start_para.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_table(pptable : IUnknown*) : HRESULT
    @lpVtbl.value.get_table.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptable)
  end
  def get_url(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_url(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_url.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def add_subrange(cp1 : Int32, cp2 : Int32, activate : Int32) : HRESULT
    @lpVtbl.value.add_subrange.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(cp1, cp2, activate)
  end
  def build_up_math(flags : Int32) : HRESULT
    @lpVtbl.value.build_up_math.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def delete_subrange(cpfirst : Int32, cplim : Int32) : HRESULT
    @lpVtbl.value.delete_subrange.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpfirst, cplim)
  end
  def find(prange : ITextRange2, count : Int32, flags : Int32, pdelta : Int32*) : HRESULT
    @lpVtbl.value.find.unsafe_as(Proc(ITextRange2, Int32, Int32, Int32*, HRESULT)).call(prange, count, flags, pdelta)
  end
  def get_char2(pchar : Int32*, offset : Int32) : HRESULT
    @lpVtbl.value.get_char2.unsafe_as(Proc(Int32*, Int32, HRESULT)).call(pchar, offset)
  end
  def get_drop_cap(pcline : Int32*, pposition : Int32*) : HRESULT
    @lpVtbl.value.get_drop_cap.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pcline, pposition)
  end
  def get_inline_object(ptype : Int32*, palign : Int32*, pchar : Int32*, pchar1 : Int32*, pchar2 : Int32*, pcount : Int32*, ptexstyle : Int32*, pccol : Int32*, plevel : Int32*) : HRESULT
    @lpVtbl.value.get_inline_object.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(ptype, palign, pchar, pchar1, pchar2, pcount, ptexstyle, pccol, plevel)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def get_rect(type : Int32, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*, phit : Int32*) : HRESULT
    @lpVtbl.value.get_rect.unsafe_as(Proc(Int32, Int32*, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(type, pleft, ptop, pright, pbottom, phit)
  end
  def get_subrange(isubrange : Int32, pcpfirst : Int32*, pcplim : Int32*) : HRESULT
    @lpVtbl.value.get_subrange.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(isubrange, pcpfirst, pcplim)
  end
  def get_text2(flags : Int32, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text2.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(flags, pbstr)
  end
  def hex_to_unicode : HRESULT
    @lpVtbl.value.hex_to_unicode.unsafe_as(Proc(HRESULT)).call
  end
  def insert_table(ccol : Int32, crow : Int32, autofit : Int32) : HRESULT
    @lpVtbl.value.insert_table.unsafe_as(Proc(Int32, Int32, Int32, HRESULT)).call(ccol, crow, autofit)
  end
  def linearize(flags : Int32) : HRESULT
    @lpVtbl.value.linearize.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def set_active_subrange(cpanchor : Int32, cpactive : Int32) : HRESULT
    @lpVtbl.value.set_active_subrange.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cpanchor, cpactive)
  end
  def set_drop_cap(cline : Int32, position : Int32) : HRESULT
    @lpVtbl.value.set_drop_cap.unsafe_as(Proc(Int32, Int32, HRESULT)).call(cline, position)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
  def set_text2(flags : Int32, bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text2.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(flags, bstr)
  end
  def unicode_to_hex : HRESULT
    @lpVtbl.value.unicode_to_hex.unsafe_as(Proc(HRESULT)).call
  end
  def set_inline_object(type : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, texstyle : Int32, ccol : Int32) : HRESULT
    @lpVtbl.value.set_inline_object.unsafe_as(Proc(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, HRESULT)).call(type, align, char, char1, char2, count, texstyle, ccol)
  end
  def get_math_function_type(bstr : UInt8*, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_math_function_type.unsafe_as(Proc(UInt8*, Int32*, HRESULT)).call(bstr, pvalue)
  end
  def insert_image(width : Int32, height : Int32, ascent : Int32, type : TEXT_ALIGN_OPTIONS, bstralttext : UInt8*, pstream : IStream) : HRESULT
    @lpVtbl.value.insert_image.unsafe_as(Proc(Int32, Int32, Int32, TEXT_ALIGN_OPTIONS, UInt8*, IStream, HRESULT)).call(width, height, ascent, type, bstralttext, pstream)
  end
end
struct LibWin32::ITextFont2
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
  def get_duplicate(ppfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppfont)
  end
  def set_duplicate(pfont : ITextFont) : HRESULT
    @lpVtbl.value.set_duplicate.unsafe_as(Proc(ITextFont, HRESULT)).call(pfont)
  end
  def can_change(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_change.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def is_equal(pfont : ITextFont, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextFont, Int32*, HRESULT)).call(pfont, pvalue)
  end
  def reset(value : Tomconstants) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Tomconstants, HRESULT)).call(value)
  end
  def get_style(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_style.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_style(value : Int32) : HRESULT
    @lpVtbl.value.set_style.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_all_caps(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_all_caps.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_all_caps(value : Int32) : HRESULT
    @lpVtbl.value.set_all_caps.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_animation(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_animation.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_animation(value : Int32) : HRESULT
    @lpVtbl.value.set_animation.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_back_color(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_back_color(value : Int32) : HRESULT
    @lpVtbl.value.set_back_color.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_bold(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_bold.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_bold(value : Int32) : HRESULT
    @lpVtbl.value.set_bold.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_emboss(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_emboss.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_emboss(value : Int32) : HRESULT
    @lpVtbl.value.set_emboss.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_fore_color(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_fore_color.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_fore_color(value : Int32) : HRESULT
    @lpVtbl.value.set_fore_color.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_hidden(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_hidden.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_hidden(value : Int32) : HRESULT
    @lpVtbl.value.set_hidden.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_engrave(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_engrave.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_engrave(value : Int32) : HRESULT
    @lpVtbl.value.set_engrave.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_italic(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_italic.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_italic(value : Int32) : HRESULT
    @lpVtbl.value.set_italic.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_kerning(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_kerning.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_kerning(value : Float32) : HRESULT
    @lpVtbl.value.set_kerning.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_language_id(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_language_id.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_language_id(value : Int32) : HRESULT
    @lpVtbl.value.set_language_id.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def set_name(bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def get_outline(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_outline.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_outline(value : Int32) : HRESULT
    @lpVtbl.value.set_outline.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_position(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_position.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_position(value : Float32) : HRESULT
    @lpVtbl.value.set_position.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_protected(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_protected.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_protected(value : Int32) : HRESULT
    @lpVtbl.value.set_protected.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_shadow(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_shadow.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_shadow(value : Int32) : HRESULT
    @lpVtbl.value.set_shadow.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_size(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_size(value : Float32) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_small_caps(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_small_caps.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_small_caps(value : Int32) : HRESULT
    @lpVtbl.value.set_small_caps.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_spacing(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_spacing.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_spacing(value : Float32) : HRESULT
    @lpVtbl.value.set_spacing.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_strike_through(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_strike_through.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_strike_through(value : Int32) : HRESULT
    @lpVtbl.value.set_strike_through.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_subscript(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_subscript.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_subscript(value : Int32) : HRESULT
    @lpVtbl.value.set_subscript.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_superscript(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_superscript.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_superscript(value : Int32) : HRESULT
    @lpVtbl.value.set_superscript.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_underline(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_underline.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_underline(value : Int32) : HRESULT
    @lpVtbl.value.set_underline.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_weight(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_weight.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_weight(value : Int32) : HRESULT
    @lpVtbl.value.set_weight.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_auto_ligatures(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_auto_ligatures.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_auto_ligatures(value : Int32) : HRESULT
    @lpVtbl.value.set_auto_ligatures.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_autospace_alpha(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_autospace_alpha.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_autospace_alpha(value : Int32) : HRESULT
    @lpVtbl.value.set_autospace_alpha.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_autospace_numeric(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_autospace_numeric.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_autospace_numeric(value : Int32) : HRESULT
    @lpVtbl.value.set_autospace_numeric.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_autospace_parens(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_autospace_parens.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_autospace_parens(value : Int32) : HRESULT
    @lpVtbl.value.set_autospace_parens.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_char_rep(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_char_rep.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_char_rep(value : Int32) : HRESULT
    @lpVtbl.value.set_char_rep.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_compression_mode(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_compression_mode.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_compression_mode(value : Int32) : HRESULT
    @lpVtbl.value.set_compression_mode.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cookie(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cookie.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cookie(value : Int32) : HRESULT
    @lpVtbl.value.set_cookie.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_double_strike(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_double_strike.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_double_strike(value : Int32) : HRESULT
    @lpVtbl.value.set_double_strike.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_duplicate2(ppfont : ITextFont2*) : HRESULT
    @lpVtbl.value.get_duplicate2.unsafe_as(Proc(ITextFont2*, HRESULT)).call(ppfont)
  end
  def set_duplicate2(pfont : ITextFont2) : HRESULT
    @lpVtbl.value.set_duplicate2.unsafe_as(Proc(ITextFont2, HRESULT)).call(pfont)
  end
  def get_link_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_link_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_math_zone(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_math_zone.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_math_zone(value : Int32) : HRESULT
    @lpVtbl.value.set_math_zone.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_mod_width_pairs(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_mod_width_pairs.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_mod_width_pairs(value : Int32) : HRESULT
    @lpVtbl.value.set_mod_width_pairs.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_mod_width_space(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_mod_width_space.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_mod_width_space(value : Int32) : HRESULT
    @lpVtbl.value.set_mod_width_space.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_old_numbers(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_old_numbers.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_old_numbers(value : Int32) : HRESULT
    @lpVtbl.value.set_old_numbers.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_overlapping(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_overlapping.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_overlapping(value : Int32) : HRESULT
    @lpVtbl.value.set_overlapping.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_position_sub_super(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_position_sub_super.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_position_sub_super(value : Int32) : HRESULT
    @lpVtbl.value.set_position_sub_super.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_scaling(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_scaling.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_scaling(value : Int32) : HRESULT
    @lpVtbl.value.set_scaling.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_space_extension(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_space_extension.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_space_extension(value : Float32) : HRESULT
    @lpVtbl.value.set_space_extension.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_underline_position_mode(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_underline_position_mode.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_underline_position_mode(value : Int32) : HRESULT
    @lpVtbl.value.set_underline_position_mode.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_effects(pvalue : Int32*, pmask : Int32*) : HRESULT
    @lpVtbl.value.get_effects.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pvalue, pmask)
  end
  def get_effects2(pvalue : Int32*, pmask : Int32*) : HRESULT
    @lpVtbl.value.get_effects2.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pvalue, pmask)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def get_property_info(index : Int32, ptype : Int32*, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property_info.unsafe_as(Proc(Int32, Int32*, Int32*, HRESULT)).call(index, ptype, pvalue)
  end
  def is_equal2(pfont : ITextFont2, pb : Int32*) : HRESULT
    @lpVtbl.value.is_equal2.unsafe_as(Proc(ITextFont2, Int32*, HRESULT)).call(pfont, pb)
  end
  def set_effects(value : Int32, mask : Int32) : HRESULT
    @lpVtbl.value.set_effects.unsafe_as(Proc(Int32, Int32, HRESULT)).call(value, mask)
  end
  def set_effects2(value : Int32, mask : Int32) : HRESULT
    @lpVtbl.value.set_effects2.unsafe_as(Proc(Int32, Int32, HRESULT)).call(value, mask)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
end
struct LibWin32::ITextPara2
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
  def get_duplicate(pppara : ITextPara*) : HRESULT
    @lpVtbl.value.get_duplicate.unsafe_as(Proc(ITextPara*, HRESULT)).call(pppara)
  end
  def set_duplicate(ppara : ITextPara) : HRESULT
    @lpVtbl.value.set_duplicate.unsafe_as(Proc(ITextPara, HRESULT)).call(ppara)
  end
  def can_change(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_change.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def is_equal(ppara : ITextPara, pvalue : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextPara, Int32*, HRESULT)).call(ppara, pvalue)
  end
  def reset(value : Int32) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_style(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_style.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_style(value : Int32) : HRESULT
    @lpVtbl.value.set_style.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_hyphenation(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_hyphenation.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_hyphenation(value : Int32) : HRESULT
    @lpVtbl.value.set_hyphenation.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_first_line_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_first_line_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_keep_together(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_keep_together.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_keep_together(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_together.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_keep_with_next(pvalue : Tomconstants*) : HRESULT
    @lpVtbl.value.get_keep_with_next.unsafe_as(Proc(Tomconstants*, HRESULT)).call(pvalue)
  end
  def set_keep_with_next(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_with_next.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_left_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_left_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_line_spacing(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_line_spacing.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def get_line_spacing_rule(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_line_spacing_rule.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_list_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_list_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_level_index(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_level_index.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_level_index(value : Int32) : HRESULT
    @lpVtbl.value.set_list_level_index.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_start(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_start.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_start(value : Int32) : HRESULT
    @lpVtbl.value.set_list_start.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_list_tab(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_list_tab.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_list_tab(value : Float32) : HRESULT
    @lpVtbl.value.set_list_tab.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_list_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_list_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_list_type(value : Int32) : HRESULT
    @lpVtbl.value.set_list_type.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_no_line_number(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_no_line_number.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_no_line_number(value : Int32) : HRESULT
    @lpVtbl.value.set_no_line_number.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_page_break_before(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_page_break_before.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_page_break_before(value : Int32) : HRESULT
    @lpVtbl.value.set_page_break_before.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_right_indent(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_right_indent.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_right_indent(value : Float32) : HRESULT
    @lpVtbl.value.set_right_indent.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def set_indents(first : Float32, left : Float32, right : Float32) : HRESULT
    @lpVtbl.value.set_indents.unsafe_as(Proc(Float32, Float32, Float32, HRESULT)).call(first, left, right)
  end
  def set_line_spacing(rule : Int32, spacing : Float32) : HRESULT
    @lpVtbl.value.set_line_spacing.unsafe_as(Proc(Int32, Float32, HRESULT)).call(rule, spacing)
  end
  def get_space_after(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_space_after.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_space_after(value : Float32) : HRESULT
    @lpVtbl.value.set_space_after.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_space_before(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_space_before.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_space_before(value : Float32) : HRESULT
    @lpVtbl.value.set_space_before.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def get_widow_control(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_widow_control.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_widow_control(value : Int32) : HRESULT
    @lpVtbl.value.set_widow_control.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_tab_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_tab_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def add_tab(tbpos : Float32, tbalign : Int32, tbleader : Int32) : HRESULT
    @lpVtbl.value.add_tab.unsafe_as(Proc(Float32, Int32, Int32, HRESULT)).call(tbpos, tbalign, tbleader)
  end
  def clear_all_tabs : HRESULT
    @lpVtbl.value.clear_all_tabs.unsafe_as(Proc(HRESULT)).call
  end
  def delete_tab(tbpos : Float32) : HRESULT
    @lpVtbl.value.delete_tab.unsafe_as(Proc(Float32, HRESULT)).call(tbpos)
  end
  def get_tab(itab : Int32, ptbpos : Float32*, ptbalign : Int32*, ptbleader : Int32*) : HRESULT
    @lpVtbl.value.get_tab.unsafe_as(Proc(Int32, Float32*, Int32*, Int32*, HRESULT)).call(itab, ptbpos, ptbalign, ptbleader)
  end
  def get_borders(ppborders : IUnknown*) : HRESULT
    @lpVtbl.value.get_borders.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppborders)
  end
  def get_duplicate2(pppara : ITextPara2*) : HRESULT
    @lpVtbl.value.get_duplicate2.unsafe_as(Proc(ITextPara2*, HRESULT)).call(pppara)
  end
  def set_duplicate2(ppara : ITextPara2) : HRESULT
    @lpVtbl.value.set_duplicate2.unsafe_as(Proc(ITextPara2, HRESULT)).call(ppara)
  end
  def get_font_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_font_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_font_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_font_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_hanging_punctuation(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_hanging_punctuation.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_hanging_punctuation(value : Int32) : HRESULT
    @lpVtbl.value.set_hanging_punctuation.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_snap_to_grid(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_snap_to_grid.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_snap_to_grid(value : Int32) : HRESULT
    @lpVtbl.value.set_snap_to_grid.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_trim_punctuation_at_start(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_trim_punctuation_at_start.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_trim_punctuation_at_start(value : Int32) : HRESULT
    @lpVtbl.value.set_trim_punctuation_at_start.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_effects(pvalue : Int32*, pmask : Int32*) : HRESULT
    @lpVtbl.value.get_effects.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pvalue, pmask)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def is_equal2(ppara : ITextPara2, pb : Int32*) : HRESULT
    @lpVtbl.value.is_equal2.unsafe_as(Proc(ITextPara2, Int32*, HRESULT)).call(ppara, pb)
  end
  def set_effects(value : Int32, mask : Int32) : HRESULT
    @lpVtbl.value.set_effects.unsafe_as(Proc(Int32, Int32, HRESULT)).call(value, mask)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
end
struct LibWin32::ITextStoryRanges2
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
  def _new_enum(ppunkenum : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunkenum)
  end
  def item(index : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ITextRange*, HRESULT)).call(index, pprange)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def item2(index : Int32, pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.item2.unsafe_as(Proc(Int32, ITextRange2*, HRESULT)).call(index, pprange)
  end
end
struct LibWin32::ITextStory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_active(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_active.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_active(value : Int32) : HRESULT
    @lpVtbl.value.set_active.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_display(ppdisplay : IUnknown*) : HRESULT
    @lpVtbl.value.get_display.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppdisplay)
  end
  def get_index(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_type(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_type(value : Int32) : HRESULT
    @lpVtbl.value.set_type.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def get_range(cpactive : Int32, cpanchor : Int32, pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.get_range.unsafe_as(Proc(Int32, Int32, ITextRange2*, HRESULT)).call(cpactive, cpanchor, pprange)
  end
  def get_text(flags : Int32, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(flags, pbstr)
  end
  def set_formatted_text(punk : IUnknown) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
  def set_text(flags : Int32, bstr : UInt8*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(flags, bstr)
  end
end
struct LibWin32::ITextStrings
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
  def item(index : Int32, pprange : ITextRange2*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, ITextRange2*, HRESULT)).call(index, pprange)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def add(bstr : UInt8*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def append(prange : ITextRange2, istring : Int32) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(ITextRange2, Int32, HRESULT)).call(prange, istring)
  end
  def cat2(istring : Int32) : HRESULT
    @lpVtbl.value.cat2.unsafe_as(Proc(Int32, HRESULT)).call(istring)
  end
  def cat_top2(bstr : UInt8*) : HRESULT
    @lpVtbl.value.cat_top2.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def delete_range(prange : ITextRange2) : HRESULT
    @lpVtbl.value.delete_range.unsafe_as(Proc(ITextRange2, HRESULT)).call(prange)
  end
  def encode_function(type : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, texstyle : Int32, ccol : Int32, prange : ITextRange2) : HRESULT
    @lpVtbl.value.encode_function.unsafe_as(Proc(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, ITextRange2, HRESULT)).call(type, align, char, char1, char2, count, texstyle, ccol, prange)
  end
  def get_cch(istring : Int32, pcch : Int32*) : HRESULT
    @lpVtbl.value.get_cch.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(istring, pcch)
  end
  def insert_null_str(istring : Int32) : HRESULT
    @lpVtbl.value.insert_null_str.unsafe_as(Proc(Int32, HRESULT)).call(istring)
  end
  def move_boundary(istring : Int32, cch : Int32) : HRESULT
    @lpVtbl.value.move_boundary.unsafe_as(Proc(Int32, Int32, HRESULT)).call(istring, cch)
  end
  def prefix_top(bstr : UInt8*) : HRESULT
    @lpVtbl.value.prefix_top.unsafe_as(Proc(UInt8*, HRESULT)).call(bstr)
  end
  def remove(istring : Int32, cstring : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, Int32, HRESULT)).call(istring, cstring)
  end
  def set_formatted_text(pranged : ITextRange2, pranges : ITextRange2) : HRESULT
    @lpVtbl.value.set_formatted_text.unsafe_as(Proc(ITextRange2, ITextRange2, HRESULT)).call(pranged, pranges)
  end
  def set_op_cp(istring : Int32, cp : Int32) : HRESULT
    @lpVtbl.value.set_op_cp.unsafe_as(Proc(Int32, Int32, HRESULT)).call(istring, cp)
  end
  def suffix_top(bstr : UInt8*, prange : ITextRange2) : HRESULT
    @lpVtbl.value.suffix_top.unsafe_as(Proc(UInt8*, ITextRange2, HRESULT)).call(bstr, prange)
  end
  def swap : HRESULT
    @lpVtbl.value.swap.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITextRow
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
  def get_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_count(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_count.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_count(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_count.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_count_cache(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_count_cache.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_count_cache(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_count_cache.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_index(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_index.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_index(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_index.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_margin(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_margin.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_margin(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_margin.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_height(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_height.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_height(value : Int32) : HRESULT
    @lpVtbl.value.set_height.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_indent(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_indent.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_indent(value : Int32) : HRESULT
    @lpVtbl.value.set_indent.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_keep_together(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_keep_together.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_keep_together(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_together.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_keep_with_next(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_keep_with_next.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_keep_with_next(value : Int32) : HRESULT
    @lpVtbl.value.set_keep_with_next.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_nest_level(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_nest_level.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_rtl(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_rtl.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_rtl(value : Int32) : HRESULT
    @lpVtbl.value.set_rtl.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_alignment(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_alignment.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_alignment(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_alignment.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_color_back(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_color_back.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_color_back(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_color_back.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_color_fore(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_color_fore.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_color_fore(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_color_fore.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_merge_flags(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_merge_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_merge_flags(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_merge_flags.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_shading(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_shading.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_shading(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_shading.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_vertical_text(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_vertical_text.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_vertical_text(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_vertical_text.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_width(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_cell_width.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_cell_width(value : Int32) : HRESULT
    @lpVtbl.value.set_cell_width.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def get_cell_border_colors(pcrleft : Int32*, pcrtop : Int32*, pcrright : Int32*, pcrbottom : Int32*) : HRESULT
    @lpVtbl.value.get_cell_border_colors.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(pcrleft, pcrtop, pcrright, pcrbottom)
  end
  def get_cell_border_widths(pduleft : Int32*, pdutop : Int32*, pduright : Int32*, pdubottom : Int32*) : HRESULT
    @lpVtbl.value.get_cell_border_widths.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(pduleft, pdutop, pduright, pdubottom)
  end
  def set_cell_border_colors(crleft : Int32, crtop : Int32, crright : Int32, crbottom : Int32) : HRESULT
    @lpVtbl.value.set_cell_border_colors.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(crleft, crtop, crright, crbottom)
  end
  def set_cell_border_widths(duleft : Int32, dutop : Int32, duright : Int32, dubottom : Int32) : HRESULT
    @lpVtbl.value.set_cell_border_widths.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(duleft, dutop, duright, dubottom)
  end
  def apply(crow : Int32, flags : Tomconstants) : HRESULT
    @lpVtbl.value.apply.unsafe_as(Proc(Int32, Tomconstants, HRESULT)).call(crow, flags)
  end
  def can_change(pvalue : Int32*) : HRESULT
    @lpVtbl.value.can_change.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def get_property(type : Int32, pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(type, pvalue)
  end
  def insert(crow : Int32) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(Int32, HRESULT)).call(crow)
  end
  def is_equal(prow : ITextRow, pb : Int32*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(ITextRow, Int32*, HRESULT)).call(prow, pb)
  end
  def reset(value : Int32) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def set_property(type : Int32, value : Int32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Int32, Int32, HRESULT)).call(type, value)
  end
end
struct LibWin32::ITextDisplays
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
struct LibWin32::ITextDocument2Old
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
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_selection(ppsel : ITextSelection*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(ITextSelection*, HRESULT)).call(ppsel)
  end
  def get_story_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_story_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_story_ranges(ppstories : ITextStoryRanges*) : HRESULT
    @lpVtbl.value.get_story_ranges.unsafe_as(Proc(ITextStoryRanges*, HRESULT)).call(ppstories)
  end
  def get_saved(pvalue : Int32*) : HRESULT
    @lpVtbl.value.get_saved.unsafe_as(Proc(Int32*, HRESULT)).call(pvalue)
  end
  def set_saved(value : Tomconstants) : HRESULT
    @lpVtbl.value.set_saved.unsafe_as(Proc(Tomconstants, HRESULT)).call(value)
  end
  def get_default_tab_stop(pvalue : Float32*) : HRESULT
    @lpVtbl.value.get_default_tab_stop.unsafe_as(Proc(Float32*, HRESULT)).call(pvalue)
  end
  def set_default_tab_stop(value : Float32) : HRESULT
    @lpVtbl.value.set_default_tab_stop.unsafe_as(Proc(Float32, HRESULT)).call(value)
  end
  def new : HRESULT
    @lpVtbl.value.new.unsafe_as(Proc(HRESULT)).call
  end
  def open(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def save(pvar : VARIANT*, flags : Int32, codepage : Int32) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(VARIANT*, Int32, Int32, HRESULT)).call(pvar, flags, codepage)
  end
  def freeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.freeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def unfreeze(pcount : Int32*) : HRESULT
    @lpVtbl.value.unfreeze.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def begin_edit_collection : HRESULT
    @lpVtbl.value.begin_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def end_edit_collection : HRESULT
    @lpVtbl.value.end_edit_collection.unsafe_as(Proc(HRESULT)).call
  end
  def undo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.undo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def redo(count : Int32, pcount : Int32*) : HRESULT
    @lpVtbl.value.redo.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(count, pcount)
  end
  def range(cpactive : Int32, cpanchor : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(cpactive, cpanchor, pprange)
  end
  def range_from_point(x : Int32, y : Int32, pprange : ITextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(Int32, Int32, ITextRange*, HRESULT)).call(x, y, pprange)
  end
  def attach_msg_filter(pfilter : IUnknown) : HRESULT
    @lpVtbl.value.attach_msg_filter.unsafe_as(Proc(IUnknown, HRESULT)).call(pfilter)
  end
  def set_effect_color(index : Int32, cr : UInt32) : HRESULT
    @lpVtbl.value.set_effect_color.unsafe_as(Proc(Int32, UInt32, HRESULT)).call(index, cr)
  end
  def get_effect_color(index : Int32, pcr : UInt32*) : HRESULT
    @lpVtbl.value.get_effect_color.unsafe_as(Proc(Int32, UInt32*, HRESULT)).call(index, pcr)
  end
  def get_caret_type(pcarettype : Int32*) : HRESULT
    @lpVtbl.value.get_caret_type.unsafe_as(Proc(Int32*, HRESULT)).call(pcarettype)
  end
  def set_caret_type(carettype : Int32) : HRESULT
    @lpVtbl.value.set_caret_type.unsafe_as(Proc(Int32, HRESULT)).call(carettype)
  end
  def get_imm_context(pcontext : Int64*) : HRESULT
    @lpVtbl.value.get_imm_context.unsafe_as(Proc(Int64*, HRESULT)).call(pcontext)
  end
  def release_imm_context(context : Int64) : HRESULT
    @lpVtbl.value.release_imm_context.unsafe_as(Proc(Int64, HRESULT)).call(context)
  end
  def get_preferred_font(cp : Int32, charrep : Int32, option : Int32, charrepcur : Int32, curfontsize : Int32, pbstr : UInt8**, ppitchandfamily : Int32*, pnewfontsize : Int32*) : HRESULT
    @lpVtbl.value.get_preferred_font.unsafe_as(Proc(Int32, Int32, Int32, Int32, Int32, UInt8**, Int32*, Int32*, HRESULT)).call(cp, charrep, option, charrepcur, curfontsize, pbstr, ppitchandfamily, pnewfontsize)
  end
  def get_notification_mode(pmode : Int32*) : HRESULT
    @lpVtbl.value.get_notification_mode.unsafe_as(Proc(Int32*, HRESULT)).call(pmode)
  end
  def set_notification_mode(mode : Int32) : HRESULT
    @lpVtbl.value.set_notification_mode.unsafe_as(Proc(Int32, HRESULT)).call(mode)
  end
  def get_client_rect(type : Int32, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : HRESULT
    @lpVtbl.value.get_client_rect.unsafe_as(Proc(Int32, Int32*, Int32*, Int32*, Int32*, HRESULT)).call(type, pleft, ptop, pright, pbottom)
  end
  def get_selection2(ppsel : ITextSelection*) : HRESULT
    @lpVtbl.value.get_selection2.unsafe_as(Proc(ITextSelection*, HRESULT)).call(ppsel)
  end
  def get_window(phwnd : Int32*) : HRESULT
    @lpVtbl.value.get_window.unsafe_as(Proc(Int32*, HRESULT)).call(phwnd)
  end
  def get_fe_flags(pflags : Int32*) : HRESULT
    @lpVtbl.value.get_fe_flags.unsafe_as(Proc(Int32*, HRESULT)).call(pflags)
  end
  def update_window : HRESULT
    @lpVtbl.value.update_window.unsafe_as(Proc(HRESULT)).call
  end
  def check_text_limit(cch : Int32, pcch : Int32*) : HRESULT
    @lpVtbl.value.check_text_limit.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(cch, pcch)
  end
  def ime_in_progress(value : Int32) : HRESULT
    @lpVtbl.value.ime_in_progress.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def sys_beep : HRESULT
    @lpVtbl.value.sys_beep.unsafe_as(Proc(HRESULT)).call
  end
  def update(mode : Int32) : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(Int32, HRESULT)).call(mode)
  end
  def notify(notify : Int32) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(Int32, HRESULT)).call(notify)
  end
  def get_document_font(ppitextfont : ITextFont*) : HRESULT
    @lpVtbl.value.get_document_font.unsafe_as(Proc(ITextFont*, HRESULT)).call(ppitextfont)
  end
  def get_document_para(ppitextpara : ITextPara*) : HRESULT
    @lpVtbl.value.get_document_para.unsafe_as(Proc(ITextPara*, HRESULT)).call(ppitextpara)
  end
  def get_call_manager(ppvoid : IUnknown*) : HRESULT
    @lpVtbl.value.get_call_manager.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppvoid)
  end
  def release_call_manager(pvoid : IUnknown) : HRESULT
    @lpVtbl.value.release_call_manager.unsafe_as(Proc(IUnknown, HRESULT)).call(pvoid)
  end
end
