require "./../../foundation.cr"
require "./../../graphics/gdi.cr"
require "./../../system/com.cr"
require "./../controls.cr"
require "./../../system/ole.cr"
require "./../windows_and_messaging.cr"
require "./../../globalization.cr"
require "./../../graphics/direct2_d.cr"
require "./../../system/com/structured_storage.cr"

module Win32cr::UI::Controls::RichEdit
  alias AutoCorrectProc = Proc(UInt16, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Int32, Int32*, Int32)*

  alias EDITWORDBREAKPROCEX = Proc(Win32cr::Foundation::PSTR, Int32, UInt8, Int32, Int32)*

  alias EDITSTREAMCALLBACK = Proc(LibC::UIntPtrT, UInt8*, Int32, Int32*, UInt32)*

  alias PCreateTextServices = Proc(Void*, Void*, Void**, Win32cr::Foundation::HRESULT)*

  alias PShutdownTextServices = Proc(Void*, Win32cr::Foundation::HRESULT)*

  Cchtextlimitdefault = 32767_u32
  MSFTEDIT_CLASS = "RICHEDIT50W"
  CERICHEDIT_CLASSA = "RichEditCEA"
  CERICHEDIT_CLASSW = "RichEditCEW"
  RICHEDIT_CLASSA = "RichEdit20A"
  RICHEDIT_CLASS10A = "RICHEDIT"
  RICHEDIT_CLASSW = "RichEdit20W"
  RICHEDIT_CLASS = "RichEdit20W"
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
  Yheightcharptsmost = 1638_u32
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
  Ldefaulttab = 720_u32
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
  GCMF_GRIPPER = 1_u32
  GCMF_SPELLING = 2_u32
  GCMF_TOUCHMENU = 16384_u32
  GCMF_MOUSEMENU = 8192_u32
  OLEOP_DOVERB = 1_u32
  CF_RTF = "Rich Text Format"
  CF_RTFNOOBJS = "Rich Text Format Without Objects"
  CF_RETEXTOBJ = "RichEdit Text and Objects"
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
  RICHEDIT60_CLASS = "RICHEDIT60W"
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

  @[Flags]
  enum CFM_MASK : UInt32
    CFM_SUBSCRIPT = 196608_u32
    CFM_SUPERSCRIPT = 196608_u32
    CFM_EFFECTS = 1073741887_u32
    CFM_ALL = 4160749631_u32
    CFM_BOLD = 1_u32
    CFM_CHARSET = 134217728_u32
    CFM_COLOR = 1073741824_u32
    CFM_FACE = 536870912_u32
    CFM_ITALIC = 2_u32
    CFM_OFFSET = 268435456_u32
    CFM_PROTECTED = 16_u32
    CFM_SIZE = 2147483648_u32
    CFM_STRIKEOUT = 8_u32
    CFM_UNDERLINE = 4_u32
    CFM_LINK = 32_u32
    CFM_SMALLCAPS = 64_u32
    CFM_ALLCAPS = 128_u32
    CFM_HIDDEN = 256_u32
    CFM_OUTLINE = 512_u32
    CFM_SHADOW = 1024_u32
    CFM_EMBOSS = 2048_u32
    CFM_IMPRINT = 4096_u32
    CFM_DISABLED = 8192_u32
    CFM_REVISED = 16384_u32
    CFM_REVAUTHOR = 32768_u32
    CFM_ANIMATION = 262144_u32
    CFM_STYLE = 524288_u32
    CFM_KERNING = 1048576_u32
    CFM_SPACING = 2097152_u32
    CFM_WEIGHT = 4194304_u32
    CFM_UNDERLINETYPE = 8388608_u32
    CFM_COOKIE = 16777216_u32
    CFM_LCID = 33554432_u32
    CFM_BACKCOLOR = 67108864_u32
    CFM_EFFECTS2 = 1141080063_u32
    CFM_ALL2 = 4294967295_u32
    CFM_FONTBOUND = 1048576_u32
    CFM_LINKPROTECTED = 8388608_u32
    CFM_EXTENDED = 33554432_u32
    CFM_MATHNOBUILDUP = 134217728_u32
    CFM_MATH = 268435456_u32
    CFM_MATHORDINARY = 536870912_u32
    CFM_ALLEFFECTS = 2115207167_u32
  end
  @[Flags]
  enum CFE_EFFECTS : UInt32
    CFE_ALLCAPS = 128_u32
    CFE_AUTOBACKCOLOR = 67108864_u32
    CFE_DISABLED = 8192_u32
    CFE_EMBOSS = 2048_u32
    CFE_HIDDEN = 256_u32
    CFE_IMPRINT = 4096_u32
    CFE_OUTLINE = 512_u32
    CFE_REVISED = 16384_u32
    CFE_SHADOW = 1024_u32
    CFE_SMALLCAPS = 64_u32
    CFE_AUTOCOLOR = 1073741824_u32
    CFE_BOLD = 1_u32
    CFE_ITALIC = 2_u32
    CFE_STRIKEOUT = 8_u32
    CFE_UNDERLINE = 4_u32
    CFE_PROTECTED = 16_u32
    CFE_LINK = 32_u32
    CFE_SUBSCRIPT = 65536_u32
    CFE_SUPERSCRIPT = 131072_u32
    CFE_FONTBOUND = 1048576_u32
    CFE_LINKPROTECTED = 8388608_u32
    CFE_EXTENDED = 33554432_u32
    CFE_MATHNOBUILDUP = 134217728_u32
    CFE_MATH = 268435456_u32
    CFE_MATHORDINARY = 536870912_u32
  end
  @[Flags]
  enum PARAFORMAT_MASK : UInt32
    PFM_ALIGNMENT = 8_u32
    PFM_NUMBERING = 32_u32
    PFM_OFFSET = 4_u32
    PFM_OFFSETINDENT = 2147483648_u32
    PFM_RIGHTINDENT = 2_u32
    PFM_RTLPARA = 65536_u32
    PFM_STARTINDENT = 1_u32
    PFM_TABSTOPS = 16_u32
  end
  @[Flags]
  enum RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE : UInt16
    SEL_EMPTY = 0_u16
    SEL_TEXT = 1_u16
    SEL_OBJECT = 2_u16
    SEL_MULTICHAR = 4_u16
    SEL_MULTIOBJECT = 8_u16
    GCM_RIGHTMOUSEDROP = 32768_u16
  end
  @[Flags]
  enum RICH_EDIT_GET_OBJECT_FLAGS : UInt32
    REO_GETOBJ_POLEOBJ = 1_u32
    REO_GETOBJ_PSTG = 2_u32
    REO_GETOBJ_POLESITE = 4_u32
    REO_GETOBJ_NO_INTERFACES = 0_u32
    REO_GETOBJ_ALL_INTERFACES = 7_u32
  end
  @[Flags]
  enum PARAFORMAT_BORDERS : UInt16
    PARAFORMAT_BORDERS_LEFT = 1_u16
    PARAFORMAT_BORDERS_RIGHT = 2_u16
    PARAFORMAT_BORDERS_TOP = 4_u16
    PARAFORMAT_BORDERS_BOTTOM = 8_u16
    PARAFORMAT_BORDERS_INSIDE = 16_u16
    PARAFORMAT_BORDERS_OUTSIDE = 32_u16
    PARAFORMAT_BORDERS_AUTOCOLOR = 64_u16
  end
  enum PARAFORMAT_SHADING_STYLE : UInt16
    PARAFORMAT_SHADING_STYLE_NONE = 0_u16
    PARAFORMAT_SHADING_STYLE_DARK_HORIZ = 1_u16
    PARAFORMAT_SHADING_STYLE_DARK_VERT = 2_u16
    PARAFORMAT_SHADING_STYLE_DARK_DOWN_DIAG = 3_u16
    PARAFORMAT_SHADING_STYLE_DARK_UP_DIAG = 4_u16
    PARAFORMAT_SHADING_STYLE_DARK_GRID = 5_u16
    PARAFORMAT_SHADING_STYLE_DARK_TRELLIS = 6_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_HORZ = 7_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_VERT = 8_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_DOWN_DIAG = 9_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_UP_DIAG = 10_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_GRID = 11_u16
    PARAFORMAT_SHADING_STYLE_LIGHT_TRELLIS = 12_u16
  end
  enum GETTEXTEX_FLAGS : UInt32
    GT_DEFAULT = 0_u32
    GT_NOHIDDENTEXT = 8_u32
    GT_RAWTEXT = 4_u32
    GT_SELECTION = 2_u32
    GT_USECRLF = 1_u32
  end
  enum ENDCOMPOSITIONNOTIFY_CODE : UInt32
    ECN_ENDCOMPOSITION = 1_u32
    ECN_NEWTEXT = 2_u32
  end
  enum IMECOMPTEXT_FLAGS : UInt32
    ICT_RESULTREADSTR = 1_u32
  end
  @[Flags]
  enum GETTEXTLENGTHEX_FLAGS : UInt32
    GTL_DEFAULT = 0_u32
    GTL_USECRLF = 1_u32
    GTL_PRECISE = 2_u32
    GTL_CLOSE = 4_u32
    GTL_NUMCHARS = 8_u32
    GTL_NUMBYTES = 16_u32
  end
  @[Flags]
  enum REOBJECT_FLAGS : UInt32
    REO_ALIGNTORIGHT = 256_u32
    REO_BELOWBASELINE = 2_u32
    REO_BLANK = 16_u32
    REO_CANROTATE = 128_u32
    REO_DONTNEEDPALETTE = 32_u32
    REO_DYNAMICSIZE = 8_u32
    REO_GETMETAFILE = 4194304_u32
    REO_HILITED = 16777216_u32
    REO_INPLACEACTIVE = 33554432_u32
    REO_INVERTEDSELECT = 4_u32
    REO_LINK = 2147483648_u32
    REO_LINKAVAILABLE = 8388608_u32
    REO_OPEN = 67108864_u32
    REO_OWNERDRAWSELECT = 64_u32
    REO_RESIZABLE = 1_u32
    REO_SELECTED = 134217728_u32
    REO_STATIC = 1073741824_u32
    REO_USEASBACKGROUND = 1024_u32
    REO_WRAPTEXTAROUND = 512_u32
  end
  enum PARAFORMAT_NUMBERING_STYLE : UInt16
    PFNS_PAREN = 0_u16
    PFNS_PARENS = 256_u16
    PFNS_PERIOD = 512_u16
    PFNS_PLAIN = 768_u16
    PFNS_NONUMBER = 1024_u16
    PFNS_NEWNUMBER = 32768_u16
  end
  enum PARAFORMAT_ALIGNMENT : UInt16
    PFA_CENTER = 3_u16
    PFA_LEFT = 1_u16
    PFA_RIGHT = 2_u16
  end
  enum TEXTMODE
    TM_PLAINTEXT = 1_i32
    TM_RICHTEXT = 2_i32
    TM_SINGLELEVELUNDO = 4_i32
    TM_MULTILEVELUNDO = 8_i32
    TM_SINGLECODEPAGE = 16_i32
    TM_MULTICODEPAGE = 32_i32
  end
  enum UNDONAMEID
    UID_UNKNOWN = 0_i32
    UID_TYPING = 1_i32
    UID_DELETE = 2_i32
    UID_DRAGDROP = 3_i32
    UID_CUT = 4_i32
    UID_PASTE = 5_i32
    UID_AUTOTABLE = 6_i32
  end
  enum KHYPH
    Khyphnil = 0_i32
    Khyphnormal = 1_i32
    Khyphaddbefore = 2_i32
    Khyphchangebefore = 3_i32
    Khyphdeletebefore = 4_i32
    Khyphchangeafter = 5_i32
    Khyphdelandchange = 6_i32
  end
  enum TXTBACKSTYLE
    TXTBACK_TRANSPARENT = 0_i32
    TXTBACK_OPAQUE = 1_i32
  end
  enum TXTHITRESULT
    TXTHITRESULT_NOHIT = 0_i32
    TXTHITRESULT_TRANSPARENT = 1_i32
    TXTHITRESULT_CLOSE = 2_i32
    TXTHITRESULT_HIT = 3_i32
  end
  enum TXTNATURALSIZE
    TXTNS_FITTOCONTENT2 = 0_i32
    TXTNS_FITTOCONTENT = 1_i32
    TXTNS_ROUNDTOLINE = 2_i32
    TXTNS_FITTOCONTENT3 = 3_i32
    TXTNS_FITTOCONTENTWSP = 4_i32
    TXTNS_INCLUDELASTLINE = 1073741824_i32
    TXTNS_EMU = -2147483648_i32
  end
  enum TXTVIEW
    TXTVIEW_ACTIVE = 0_i32
    TXTVIEW_INACTIVE = -1_i32
  end
  enum CHANGETYPE
    CN_GENERIC = 0_i32
    CN_TEXTCHANGED = 1_i32
    CN_NEWUNDO = 2_i32
    CN_NEWREDO = 4_i32
  end
  enum CARET_FLAGS
    CARET_NONE = 0_i32
    CARET_CUSTOM = 1_i32
    CARET_RTL = 2_i32
    CARET_ITALIC = 32_i32
    CARET_NULL = 64_i32
    CARET_ROTATE90 = 128_i32
  end
  enum Tomconstants
    Tomfalse = 0_i32
    Tomtrue = -1_i32
    Tomundefined = -9999999_i32
    Tomtoggle = -9999998_i32
    Tomautocolor = -9999997_i32
    Tomdefault = -9999996_i32
    Tomsuspend = -9999995_i32
    Tomresume = -9999994_i32
    Tomapplynow = 0_i32
    Tomapplylater = 1_i32
    Tomtrackparms = 2_i32
    Tomcacheparms = 3_i32
    Tomapplytmp = 4_i32
    Tomdisablesmartfont = 8_i32
    Tomenablesmartfont = 9_i32
    Tomusepoints = 10_i32
    Tomusetwips = 11_i32
    Tombackward = -1073741823_i32
    Tomforward = 1073741823_i32
    Tommove = 0_i32
    Tomextend = 1_i32
    Tomnoselection = 0_i32
    Tomselectionip = 1_i32
    Tomselectionnormal = 2_i32
    Tomselectionframe = 3_i32
    Tomselectioncolumn = 4_i32
    Tomselectionrow = 5_i32
    Tomselectionblock = 6_i32
    Tomselectioninlineshape = 7_i32
    Tomselectionshape = 8_i32
    Tomselstartactive = 1_i32
    Tomselateol = 2_i32
    Tomselovertype = 4_i32
    Tomselactive = 8_i32
    Tomselreplace = 16_i32
    Tomend = 0_i32
    Tomstart = 32_i32
    Tomcollapseend = 0_i32
    Tomcollapsestart = 1_i32
    Tomclientcoord = 256_i32
    Tomallowoffclient = 512_i32
    Tomtransform = 1024_i32
    Tomobjectarg = 2048_i32
    Tomatend = 4096_i32
    Tomnone = 0_i32
    Tomsingle = 1_i32
    Tomwords = 2_i32
    Tomdouble = 3_i32
    Tomdotted = 4_i32
    Tomdash = 5_i32
    Tomdashdot = 6_i32
    Tomdashdotdot = 7_i32
    Tomwave = 8_i32
    Tomthick = 9_i32
    Tomhair = 10_i32
    Tomdoublewave = 11_i32
    Tomheavywave = 12_i32
    Tomlongdash = 13_i32
    Tomthickdash = 14_i32
    Tomthickdashdot = 15_i32
    Tomthickdashdotdot = 16_i32
    Tomthickdotted = 17_i32
    Tomthicklongdash = 18_i32
    Tomlinespacesingle = 0_i32
    Tomlinespace1pt5 = 1_i32
    Tomlinespacedouble = 2_i32
    Tomlinespaceatleast = 3_i32
    Tomlinespaceexactly = 4_i32
    Tomlinespacemultiple = 5_i32
    Tomlinespacepercent = 6_i32
    Tomalignleft = 0_i32
    Tomaligncenter = 1_i32
    Tomalignright = 2_i32
    Tomalignjustify = 3_i32
    Tomaligndecimal = 3_i32
    Tomalignbar = 4_i32
    Tomdefaulttab = 5_i32
    Tomaligninterword = 3_i32
    Tomalignnewspaper = 4_i32
    Tomaligninterletter = 5_i32
    Tomalignscaled = 6_i32
    Tomspaces = 0_i32
    Tomdots = 1_i32
    Tomdashes = 2_i32
    Tomlines = 3_i32
    Tomthicklines = 4_i32
    Tomequals = 5_i32
    Tomtabback = -3_i32
    Tomtabnext = -2_i32
    Tomtabhere = -1_i32
    Tomlistnone = 0_i32
    Tomlistbullet = 1_i32
    Tomlistnumberasarabic = 2_i32
    Tomlistnumberaslcletter = 3_i32
    Tomlistnumberasucletter = 4_i32
    Tomlistnumberaslcroman = 5_i32
    Tomlistnumberasucroman = 6_i32
    Tomlistnumberassequence = 7_i32
    Tomlistnumberedcircle = 8_i32
    Tomlistnumberedblackcirclewingding = 9_i32
    Tomlistnumberedwhitecirclewingding = 10_i32
    Tomlistnumberedarabicwide = 11_i32
    Tomlistnumberedchs = 12_i32
    Tomlistnumberedcht = 13_i32
    Tomlistnumberedjpnchs = 14_i32
    Tomlistnumberedjpnkor = 15_i32
    Tomlistnumberedarabic1 = 16_i32
    Tomlistnumberedarabic2 = 17_i32
    Tomlistnumberedhebrew = 18_i32
    Tomlistnumberedthaialpha = 19_i32
    Tomlistnumberedthainum = 20_i32
    Tomlistnumberedhindialpha = 21_i32
    Tomlistnumberedhindialpha1 = 22_i32
    Tomlistnumberedhindinum = 23_i32
    Tomlistparentheses = 65536_i32
    Tomlistperiod = 131072_i32
    Tomlistplain = 196608_i32
    Tomlistnonumber = 262144_i32
    Tomlistminus = 524288_i32
    Tomignorenumberstyle = 16777216_i32
    Tomparastylenormal = -1_i32
    Tomparastyleheading1 = -2_i32
    Tomparastyleheading2 = -3_i32
    Tomparastyleheading3 = -4_i32
    Tomparastyleheading4 = -5_i32
    Tomparastyleheading5 = -6_i32
    Tomparastyleheading6 = -7_i32
    Tomparastyleheading7 = -8_i32
    Tomparastyleheading8 = -9_i32
    Tomparastyleheading9 = -10_i32
    Tomcharacter = 1_i32
    Tomword = 2_i32
    Tomsentence = 3_i32
    Tomparagraph = 4_i32
    Tomline = 5_i32
    Tomstory = 6_i32
    Tomscreen = 7_i32
    Tomsection = 8_i32
    Tomtablecolumn = 9_i32
    Tomcolumn = 9_i32
    Tomrow = 10_i32
    Tomwindow = 11_i32
    Tomcell = 12_i32
    Tomcharformat = 13_i32
    Tomparaformat = 14_i32
    Tomtable = 15_i32
    Tomobject = 16_i32
    Tompage = 17_i32
    Tomhardparagraph = 18_i32
    Tomcluster = 19_i32
    Tominlineobject = 20_i32
    Tominlineobjectarg = 21_i32
    Tomleafline = 22_i32
    Tomlayoutcolumn = 23_i32
    Tomprocessid = 1073741825_i32
    Tommatchword = 2_i32
    Tommatchcase = 4_i32
    Tommatchpattern = 8_i32
    Tomunknownstory = 0_i32
    Tommaintextstory = 1_i32
    Tomfootnotesstory = 2_i32
    Tomendnotesstory = 3_i32
    Tomcommentsstory = 4_i32
    Tomtextframestory = 5_i32
    Tomevenpagesheaderstory = 6_i32
    Tomprimaryheaderstory = 7_i32
    Tomevenpagesfooterstory = 8_i32
    Tomprimaryfooterstory = 9_i32
    Tomfirstpageheaderstory = 10_i32
    Tomfirstpagefooterstory = 11_i32
    Tomscratchstory = 127_i32
    Tomfindstory = 128_i32
    Tomreplacestory = 129_i32
    Tomstoryinactive = 0_i32
    Tomstoryactivedisplay = 1_i32
    Tomstoryactiveui = 2_i32
    Tomstoryactivedisplayui = 3_i32
    Tomnoanimation = 0_i32
    Tomlasvegaslights = 1_i32
    Tomblinkingbackground = 2_i32
    Tomsparkletext = 3_i32
    Tommarchingblackants = 4_i32
    Tommarchingredants = 5_i32
    Tomshimmer = 6_i32
    Tomwipedown = 7_i32
    Tomwiperight = 8_i32
    Tomanimationmax = 8_i32
    Tomlowercase = 0_i32
    Tomuppercase = 1_i32
    Tomtitlecase = 2_i32
    Tomsentencecase = 4_i32
    Tomtogglecase = 5_i32
    Tomreadonly = 256_i32
    Tomsharedenyread = 512_i32
    Tomsharedenywrite = 1024_i32
    Tompastefile = 4096_i32
    Tomcreatenew = 16_i32
    Tomcreatealways = 32_i32
    Tomopenexisting = 48_i32
    Tomopenalways = 64_i32
    Tomtruncateexisting = 80_i32
    Tomrtf = 1_i32
    Tomtext = 2_i32
    Tomhtml = 3_i32
    Tomworddocument = 4_i32
    Tombold = -2147483647_i32
    Tomitalic = -2147483646_i32
    Tomunderline = -2147483644_i32
    Tomstrikeout = -2147483640_i32
    Tomprotected = -2147483632_i32
    Tomlink = -2147483616_i32
    Tomsmallcaps = -2147483584_i32
    Tomallcaps = -2147483520_i32
    Tomhidden = -2147483392_i32
    Tomoutline = -2147483136_i32
    Tomshadow = -2147482624_i32
    Tomemboss = -2147481600_i32
    Tomimprint = -2147479552_i32
    Tomdisabled = -2147475456_i32
    Tomrevised = -2147467264_i32
    Tomsubscriptcf = -2147418112_i32
    Tomsuperscriptcf = -2147352576_i32
    Tomfontbound = -2146435072_i32
    Tomlinkprotected = -2139095040_i32
    Tominlineobjectstart = -2130706432_i32
    Tomextendedchar = -2113929216_i32
    Tomautobackcolor = -2080374784_i32
    Tommathzonenobuildup = -2013265920_i32
    Tommathzone = -1879048192_i32
    Tommathzoneordinary = -1610612736_i32
    Tomautotextcolor = -1073741824_i32
    Tommathzonedisplay = 262144_i32
    Tomparaeffectrtl = 1_i32
    Tomparaeffectkeep = 2_i32
    Tomparaeffectkeepnext = 4_i32
    Tomparaeffectpagebreakbefore = 8_i32
    Tomparaeffectnolinenumber = 16_i32
    Tomparaeffectnowidowcontrol = 32_i32
    Tomparaeffectdonothyphen = 64_i32
    Tomparaeffectsidebyside = 128_i32
    Tomparaeffectcollapsed = 256_i32
    Tomparaeffectoutlinelevel = 512_i32
    Tomparaeffectbox = 1024_i32
    Tomparaeffecttablerowdelimiter = 4096_i32
    Tomparaeffecttable = 16384_i32
    Tommodwidthpairs = 1_i32
    Tommodwidthspace = 2_i32
    Tomautospacealpha = 4_i32
    Tomautospacenumeric = 8_i32
    Tomautospaceparens = 16_i32
    Tomembeddedfont = 32_i32
    Tomdoublestrike = 64_i32
    Tomoverlapping = 128_i32
    Tomnormalcaret = 0_i32
    Tomkoreanblockcaret = 1_i32
    Tomnullcaret = 2_i32
    Tomincludeinset = 1_i32
    Tomunicodebidi = 1_i32
    Tommathcfcheck = 4_i32
    Tomunlink = 8_i32
    Tomunhide = 16_i32
    Tomchecktextlimit = 32_i32
    Tomignorecurrentfont = 0_i32
    Tommatchcharrep = 1_i32
    Tommatchfontsignature = 2_i32
    Tommatchascii = 4_i32
    Tomgetheightonly = 8_i32
    Tommatchmathfont = 16_i32
    Tomcharset = -2147483648_i32
    Tomcharrepfromlcid = 1073741824_i32
    Tomansi = 0_i32
    Tomeasteurope = 1_i32
    Tomcyrillic = 2_i32
    Tomgreek = 3_i32
    Tomturkish = 4_i32
    Tomhebrew = 5_i32
    Tomarabic = 6_i32
    Tombaltic = 7_i32
    Tomvietnamese = 8_i32
    Tomdefaultcharrep = 9_i32
    Tomsymbol = 10_i32
    Tomthai = 11_i32
    Tomshiftjis = 12_i32
    Tomgb2312 = 13_i32
    Tomhangul = 14_i32
    Tombig5 = 15_i32
    Tompc437 = 16_i32
    Tomoem = 17_i32
    Tommac = 18_i32
    Tomarmenian = 19_i32
    Tomsyriac = 20_i32
    Tomthaana = 21_i32
    Tomdevanagari = 22_i32
    Tombengali = 23_i32
    Tomgurmukhi = 24_i32
    Tomgujarati = 25_i32
    Tomoriya = 26_i32
    Tomtamil = 27_i32
    Tomtelugu = 28_i32
    Tomkannada = 29_i32
    Tommalayalam = 30_i32
    Tomsinhala = 31_i32
    Tomlao = 32_i32
    Tomtibetan = 33_i32
    Tommyanmar = 34_i32
    Tomgeorgian = 35_i32
    Tomjamo = 36_i32
    Tomethiopic = 37_i32
    Tomcherokee = 38_i32
    Tomaboriginal = 39_i32
    Tomogham = 40_i32
    Tomrunic = 41_i32
    Tomkhmer = 42_i32
    Tommongolian = 43_i32
    Tombraille = 44_i32
    Tomyi = 45_i32
    Tomlimbu = 46_i32
    Tomtaile = 47_i32
    Tomnewtailue = 48_i32
    Tomsylotinagri = 49_i32
    Tomkharoshthi = 50_i32
    Tomkayahli = 51_i32
    Tomusymbol = 52_i32
    Tomemoji = 53_i32
    Tomglagolitic = 54_i32
    Tomlisu = 55_i32
    Tomvai = 56_i32
    Tomnko = 57_i32
    Tomosmanya = 58_i32
    Tomphagspa = 59_i32
    Tomgothic = 60_i32
    Tomdeseret = 61_i32
    Tomtifinagh = 62_i32
    Tomcharrepmax = 63_i32
    Tomre10mode = 1_i32
    Tomuseatfont = 2_i32
    Tomtextflowmask = 12_i32
    Tomtextflowes = 0_i32
    Tomtextflowsw = 4_i32
    Tomtextflowwn = 8_i32
    Tomtextflowne = 12_i32
    Tomnoime = 524288_i32
    Tomselfime = 262144_i32
    Tomnoupscroll = 65536_i32
    Tomnovpscroll = 262144_i32
    Tomnolink = 0_i32
    Tomclientlink = 1_i32
    Tomfriendlylinkname = 2_i32
    Tomfriendlylinkaddress = 3_i32
    Tomautolinkurl = 4_i32
    Tomautolinkemail = 5_i32
    Tomautolinkphone = 6_i32
    Tomautolinkpath = 7_i32
    Tomcompressnone = 0_i32
    Tomcompresspunctuation = 1_i32
    Tomcompresspunctuationandkana = 2_i32
    Tomcompressmax = 2_i32
    Tomunderlinepositionauto = 0_i32
    Tomunderlinepositionbelow = 1_i32
    Tomunderlinepositionabove = 2_i32
    Tomunderlinepositionmax = 2_i32
    Tomfontalignmentauto = 0_i32
    Tomfontalignmenttop = 1_i32
    Tomfontalignmentbaseline = 2_i32
    Tomfontalignmentbottom = 3_i32
    Tomfontalignmentcenter = 4_i32
    Tomfontalignmentmax = 4_i32
    Tomrubybelow = 128_i32
    Tomrubyaligncenter = 0_i32
    Tomrubyalign010 = 1_i32
    Tomrubyalign121 = 2_i32
    Tomrubyalignleft = 3_i32
    Tomrubyalignright = 4_i32
    Tomlimitsdefault = 0_i32
    Tomlimitsunderover = 1_i32
    Tomlimitssubsup = 2_i32
    Tomupperlimitassuperscript = 3_i32
    Tomlimitsopposite = 4_i32
    Tomshowllimplacehldr = 8_i32
    Tomshowulimplacehldr = 16_i32
    Tomdontgrowwithcontent = 64_i32
    Tomgrowwithcontent = 128_i32
    Tomsubsupalign = 1_i32
    Tomlimitalignmask = 3_i32
    Tomlimitaligncenter = 0_i32
    Tomlimitalignleft = 1_i32
    Tomlimitalignright = 2_i32
    Tomshowdegplacehldr = 8_i32
    Tomaligndefault = 0_i32
    Tomalignmatchascentdescent = 2_i32
    Tommathvariant = 32_i32
    Tomstyledefault = 0_i32
    Tomstylescriptscriptcramped = 1_i32
    Tomstylescriptscript = 2_i32
    Tomstylescriptcramped = 3_i32
    Tomstylescript = 4_i32
    Tomstyletextcramped = 5_i32
    Tomstyletext = 6_i32
    Tomstyledisplaycramped = 7_i32
    Tomstyledisplay = 8_i32
    Tommathrelsize = 64_i32
    Tomdecdecsize = 254_i32
    Tomdecsize = 255_i32
    Tomincsize = 65_i32
    Tomincincsize = 66_i32
    Tomgravityui = 0_i32
    Tomgravityback = 1_i32
    Tomgravityfore = 2_i32
    Tomgravityin = 3_i32
    Tomgravityout = 4_i32
    Tomgravitybackward = 536870912_i32
    Tomgravityforward = 1073741824_i32
    Tomadjustcrlf = 1_i32
    Tomusecrlf = 2_i32
    Tomtextize = 4_i32
    Tomallowfinaleop = 8_i32
    Tomfoldmathalpha = 16_i32
    Tomnohidden = 32_i32
    Tomincludenumbering = 64_i32
    Tomtranslatetablecell = 128_i32
    Tomnomathzonebrackets = 256_i32
    Tomconvertmathchar = 512_i32
    Tomnoucgreekitalic = 1024_i32
    Tomallowmathbold = 2048_i32
    Tomlanguagetag = 4096_i32
    Tomconvertrtf = 8192_i32
    Tomapplyrtfdocprops = 16384_i32
    Tomphantomshow = 1_i32
    Tomphantomzerowidth = 2_i32
    Tomphantomzeroascent = 4_i32
    Tomphantomzerodescent = 8_i32
    Tomphantomtransparent = 16_i32
    Tomphantomasmash = 5_i32
    Tomphantomdsmash = 9_i32
    Tomphantomhsmash = 3_i32
    Tomphantomsmash = 13_i32
    Tomphantomhorz = 12_i32
    Tomphantomvert = 2_i32
    Tomboxhidetop = 1_i32
    Tomboxhidebottom = 2_i32
    Tomboxhideleft = 4_i32
    Tomboxhideright = 8_i32
    Tomboxstrikeh = 16_i32
    Tomboxstrikev = 32_i32
    Tomboxstriketlbr = 64_i32
    Tomboxstrikebltr = 128_i32
    Tomboxaligncenter = 1_i32
    Tomspacemask = 28_i32
    Tomspacedefault = 0_i32
    Tomspaceunary = 4_i32
    Tomspacebinary = 8_i32
    Tomspacerelational = 12_i32
    Tomspaceskip = 16_i32
    Tomspaceord = 20_i32
    Tomspacedifferential = 24_i32
    Tomsizetext = 32_i32
    Tomsizescript = 64_i32
    Tomsizescriptscript = 96_i32
    Tomnobreak = 128_i32
    Tomtransparentforpositioning = 256_i32
    Tomtransparentforspacing = 512_i32
    Tomstretchcharbelow = 0_i32
    Tomstretchcharabove = 1_i32
    Tomstretchbasebelow = 2_i32
    Tomstretchbaseabove = 3_i32
    Tommatrixalignmask = 3_i32
    Tommatrixaligncenter = 0_i32
    Tommatrixaligntoprow = 1_i32
    Tommatrixalignbottomrow = 3_i32
    Tomshowmatplacehldr = 8_i32
    Tomeqarraylayoutwidth = 1_i32
    Tomeqarrayalignmask = 12_i32
    Tomeqarrayaligncenter = 0_i32
    Tomeqarrayaligntoprow = 4_i32
    Tomeqarrayalignbottomrow = 12_i32
    Tommathmanualbreakmask = 127_i32
    Tommathbreakleft = 125_i32
    Tommathbreakcenter = 126_i32
    Tommathbreakright = 127_i32
    Tommatheqalign = 128_i32
    Tommathargshadingstart = 593_i32
    Tommathargshadingend = 594_i32
    Tommathobjshadingstart = 595_i32
    Tommathobjshadingend = 596_i32
    Tomfunctiontypenone = 0_i32
    Tomfunctiontypetakesarg = 1_i32
    Tomfunctiontypetakeslim = 2_i32
    Tomfunctiontypetakeslim2 = 3_i32
    Tomfunctiontypeislim = 4_i32
    Tommathparaaligndefault = 0_i32
    Tommathparaaligncentergroup = 1_i32
    Tommathparaaligncenter = 2_i32
    Tommathparaalignleft = 3_i32
    Tommathparaalignright = 4_i32
    Tommathdispalignmask = 3_i32
    Tommathdispaligncentergroup = 0_i32
    Tommathdispaligncenter = 1_i32
    Tommathdispalignleft = 2_i32
    Tommathdispalignright = 3_i32
    Tommathdispintunderover = 4_i32
    Tommathdispfractex = 8_i32
    Tommathdispnarygrow = 16_i32
    Tommathdocemptyargmask = 96_i32
    Tommathdocemptyargauto = 0_i32
    Tommathdocemptyargalways = 32_i32
    Tommathdocemptyargnever = 64_i32
    Tommathdocsbspopunchanged = 128_i32
    Tommathdocdiffmask = 768_i32
    Tommathdocdiffdefault = 0_i32
    Tommathdocdiffupright = 256_i32
    Tommathdocdiffitalic = 512_i32
    Tommathdocdiffopenitalic = 768_i32
    Tommathdispnarysubsup = 1024_i32
    Tommathdispdef = 2048_i32
    Tommathenablertl = 4096_i32
    Tommathbrkbinmask = 196608_i32
    Tommathbrkbinbefore = 0_i32
    Tommathbrkbinafter = 65536_i32
    Tommathbrkbindup = 131072_i32
    Tommathbrkbinsubmask = 786432_i32
    Tommathbrkbinsubmm = 0_i32
    Tommathbrkbinsubpm = 262144_i32
    Tommathbrkbinsubmp = 524288_i32
    Tomselrange = 597_i32
    Tomhstring = 596_i32
    Tomfontproptexstyle = 828_i32
    Tomfontpropalign = 829_i32
    Tomfontstretch = 830_i32
    Tomfontstyle = 831_i32
    Tomfontstyleupright = 0_i32
    Tomfontstyleoblique = 1_i32
    Tomfontstyleitalic = 2_i32
    Tomfontstretchdefault = 0_i32
    Tomfontstretchultracondensed = 1_i32
    Tomfontstretchextracondensed = 2_i32
    Tomfontstretchcondensed = 3_i32
    Tomfontstretchsemicondensed = 4_i32
    Tomfontstretchnormal = 5_i32
    Tomfontstretchsemiexpanded = 6_i32
    Tomfontstretchexpanded = 7_i32
    Tomfontstretchextraexpanded = 8_i32
    Tomfontstretchultraexpanded = 9_i32
    Tomfontweightdefault = 0_i32
    Tomfontweightthin = 100_i32
    Tomfontweightextralight = 200_i32
    Tomfontweightlight = 300_i32
    Tomfontweightnormal = 400_i32
    Tomfontweightregular = 400_i32
    Tomfontweightmedium = 500_i32
    Tomfontweightsemibold = 600_i32
    Tomfontweightbold = 700_i32
    Tomfontweightextrabold = 800_i32
    Tomfontweightblack = 900_i32
    Tomfontweightheavy = 900_i32
    Tomfontweightextrablack = 950_i32
    Tomparapropmathalign = 1079_i32
    Tomdocmathbuild = 128_i32
    Tommathlmargin = 129_i32
    Tommathrmargin = 130_i32
    Tommathwrapindent = 131_i32
    Tommathwrapright = 132_i32
    Tommathpostspace = 134_i32
    Tommathprespace = 133_i32
    Tommathinterspace = 135_i32
    Tommathintraspace = 136_i32
    Tomcancopy = 137_i32
    Tomcanredo = 138_i32
    Tomcanundo = 139_i32
    Tomundolimit = 140_i32
    Tomdocautolink = 141_i32
    Tomellipsismode = 142_i32
    Tomellipsisstate = 143_i32
    Tomellipsisnone = 0_i32
    Tomellipsisend = 1_i32
    Tomellipsisword = 3_i32
    Tomellipsispresent = 1_i32
    Tomvtopcell = 1_i32
    Tomvlowcell = 2_i32
    Tomhstartcell = 4_i32
    Tomhcontcell = 8_i32
    Tomrowupdate = 1_i32
    Tomrowapplydefault = 0_i32
    Tomcellstructurechangeonly = 1_i32
    Tomrowheightactual = 2059_i32
  end
  enum OBJECTTYPE
    Tomsimpletext = 0_i32
    Tomruby = 1_i32
    Tomhorzvert = 2_i32
    Tomwarichu = 3_i32
    Tomeq = 9_i32
    Tommath = 10_i32
    Tomaccent = 10_i32
    Tombox = 11_i32
    Tomboxedformula = 12_i32
    Tombrackets = 13_i32
    Tombracketswithseps = 14_i32
    Tomequationarray = 15_i32
    Tomfraction = 16_i32
    Tomfunctionapply = 17_i32
    Tomleftsubsup = 18_i32
    Tomlowerlimit = 19_i32
    Tommatrix = 20_i32
    Tomnary = 21_i32
    Tomopchar = 22_i32
    Tomoverbar = 23_i32
    Tomphantom = 24_i32
    Tomradical = 25_i32
    Tomslashedfraction = 26_i32
    Tomstack = 27_i32
    Tomstretchstack = 28_i32
    Tomsubscript = 29_i32
    Tomsubsup = 30_i32
    Tomsuperscript = 31_i32
    Tomunderbar = 32_i32
    Tomupperlimit = 33_i32
    Tomobjectmax = 33_i32
  end
  enum MANCODE
    MBOLD = 16_i32
    MITAL = 32_i32
    MGREEK = 64_i32
    MROMN = 0_i32
    MSCRP = 1_i32
    MFRAK = 2_i32
    MOPEN = 3_i32
    MSANS = 4_i32
    MMONO = 5_i32
    MMATH = 6_i32
    MISOL = 7_i32
    MINIT = 8_i32
    MTAIL = 9_i32
    MSTRCH = 10_i32
    MLOOP = 11_i32
    MOPENA = 12_i32
  end

  @[Extern]
  record IMECOMPTEXT,
    cb : Int32,
    flags : Win32cr::UI::Controls::RichEdit::IMECOMPTEXT_FLAGS

  @[Extern]
  record TABLEROWPARMS,
    cbRow : UInt8,
    cbCell : UInt8,
    cCell : UInt8,
    cRow : UInt8,
    dxCellMargin : Int32,
    dxIndent : Int32,
    dyHeight : Int32,
    _bitfield : UInt32,
    cpStartRow : Int32,
    bTableLevel : UInt8,
    iCell : UInt8

  @[Extern]
  record TABLECELLPARMS,
    dxWidth : Int32,
    _bitfield : UInt16,
    wShading : UInt16,
    dxBrdrLeft : Int16,
    dyBrdrTop : Int16,
    dxBrdrRight : Int16,
    dyBrdrBottom : Int16,
    crBrdrLeft : UInt32,
    crBrdrTop : UInt32,
    crBrdrRight : UInt32,
    crBrdrBottom : UInt32,
    crBackPat : UInt32,
    crForePat : UInt32

  @[Extern]
  record RICHEDIT_IMAGE_PARAMETERS,
    xWidth : Int32,
    yHeight : Int32,
    ascent : Int32,
    type__ : Win32cr::Graphics::Gdi::TEXT_ALIGN_OPTIONS,
    pwszAlternateText : Win32cr::Foundation::PWSTR,
    pIStream : Void*

  @[Extern]
  record ENDCOMPOSITIONNOTIFY,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    dwCode : Win32cr::UI::Controls::RichEdit::ENDCOMPOSITIONNOTIFY_CODE

  @[Extern]
  record CHARFORMATA,
    cbSize : UInt32,
    dwMask : Win32cr::UI::Controls::RichEdit::CFM_MASK,
    dwEffects : Win32cr::UI::Controls::RichEdit::CFE_EFFECTS,
    yHeight : Int32,
    yOffset : Int32,
    crTextColor : UInt32,
    bCharSet : UInt8,
    bPitchAndFamily : UInt8,
    szFaceName : Win32cr::Foundation::CHAR[32]

  @[Extern]
  record CHARFORMATW,
    cbSize : UInt32,
    dwMask : Win32cr::UI::Controls::RichEdit::CFM_MASK,
    dwEffects : Win32cr::UI::Controls::RichEdit::CFE_EFFECTS,
    yHeight : Int32,
    yOffset : Int32,
    crTextColor : UInt32,
    bCharSet : UInt8,
    bPitchAndFamily : UInt8,
    szFaceName : UInt16[32]

  @[Extern]
  record CHARFORMAT2W,
    __anonymous_base_richedit_l711_c23 : Win32cr::UI::Controls::RichEdit::CHARFORMATW,
    wWeight : UInt16,
    sSpacing : Int16,
    crBackColor : UInt32,
    lcid : UInt32,
    anonymous : Anonymous_e__Union,
    sStyle : Int16,
    wKerning : UInt16,
    bUnderlineType : UInt8,
    bAnimation : UInt8,
    bRevAuthor : UInt8,
    bUnderlineColor : UInt8 do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dwReserved : UInt32,
      dwCookie : UInt32

  end

  @[Extern]
  record CHARFORMAT2A,
    __anonymous_base_richedit_l736_c23 : Win32cr::UI::Controls::RichEdit::CHARFORMATA,
    wWeight : UInt16,
    sSpacing : Int16,
    crBackColor : UInt32,
    lcid : UInt32,
    anonymous : Anonymous_e__Union,
    sStyle : Int16,
    wKerning : UInt16,
    bUnderlineType : UInt8,
    bAnimation : UInt8,
    bRevAuthor : UInt8,
    bUnderlineColor : UInt8 do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dwReserved : UInt32,
      dwCookie : UInt32

  end

  @[Extern]
  record CHARRANGE,
    cpMin : Int32,
    cpMax : Int32

  @[Extern]
  record TEXTRANGEA,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PSTR

  @[Extern]
  record TEXTRANGEW,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PWSTR

  @[Extern]
  record EDITSTREAM,
    dwCookie : LibC::UIntPtrT,
    dwError : UInt32,
    pfnCallback : Win32cr::UI::Controls::RichEdit::EDITSTREAMCALLBACK

  @[Extern]
  record FINDTEXTA,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PSTR

  @[Extern]
  record FINDTEXTW,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PWSTR

  @[Extern]
  record FINDTEXTEXA,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PSTR,
    chrgText : Win32cr::UI::Controls::RichEdit::CHARRANGE

  @[Extern]
  record FINDTEXTEXW,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    lpstrText : Win32cr::Foundation::PWSTR,
    chrgText : Win32cr::UI::Controls::RichEdit::CHARRANGE

  @[Extern]
  record FORMATRANGE,
    hdc : Win32cr::Graphics::Gdi::HDC,
    hdcTarget : Win32cr::Graphics::Gdi::HDC,
    rc : Win32cr::Foundation::RECT,
    rcPage : Win32cr::Foundation::RECT,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE

  @[Extern]
  record PARAFORMAT,
    cbSize : UInt32,
    dwMask : Win32cr::UI::Controls::RichEdit::PARAFORMAT_MASK,
    wNumbering : UInt16,
    anonymous : Anonymous_e__Union,
    dxStartIndent : Int32,
    dxRightIndent : Int32,
    dxOffset : Int32,
    wAlignment : Win32cr::UI::Controls::RichEdit::PARAFORMAT_ALIGNMENT,
    cTabCount : Int16,
    rgxTabs : UInt32[32] do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      wReserved : UInt16,
      wEffects : UInt16

  end

  @[Extern]
  record PARAFORMAT2,
    __anonymous_base_richedit_l1149_c22 : Win32cr::UI::Controls::RichEdit::PARAFORMAT,
    dySpaceBefore : Int32,
    dySpaceAfter : Int32,
    dyLineSpacing : Int32,
    sStyle : Int16,
    bLineSpacingRule : UInt8,
    bOutlineLevel : UInt8,
    wShadingWeight : UInt16,
    wShadingStyle : Win32cr::UI::Controls::RichEdit::PARAFORMAT_SHADING_STYLE,
    wNumberingStart : UInt16,
    wNumberingStyle : Win32cr::UI::Controls::RichEdit::PARAFORMAT_NUMBERING_STYLE,
    wNumberingTab : UInt16,
    wBorderSpace : UInt16,
    wBorderWidth : UInt16,
    wBorders : Win32cr::UI::Controls::RichEdit::PARAFORMAT_BORDERS

  @[Extern]
  record MSGFILTER,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    msg : UInt32,
    wParam : Win32cr::Foundation::WPARAM,
    lParam : Win32cr::Foundation::LPARAM

  @[Extern]
  record REQRESIZE,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    rc : Win32cr::Foundation::RECT

  @[Extern]
  record SELCHANGE,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    seltyp : Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE

  @[Extern]
  record Grouptypingchange,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    fGroupTyping : Win32cr::Foundation::BOOL

  @[Extern]
  record CLIPBOARDFORMAT,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    cf : UInt16

  @[Extern]
  record GETCONTEXTMENUEX,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    dwFlags : UInt32,
    pt : Win32cr::Foundation::POINT,
    pvReserved : Void*

  @[Extern]
  record ENDROPFILES,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    hDrop : Win32cr::Foundation::HANDLE,
    cp : Int32,
    fProtected : Win32cr::Foundation::BOOL

  @[Extern]
  record ENPROTECTED,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    msg : UInt32,
    wParam : Win32cr::Foundation::WPARAM,
    lParam : Win32cr::Foundation::LPARAM,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE

  @[Extern]
  record ENSAVECLIPBOARD,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    cObjectCount : Int32,
    cch : Int32

  @[Extern]
  record ENOLEOPFAILED,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    iob : Int32,
    lOper : Int32,
    hr : Win32cr::Foundation::HRESULT

  @[Extern]
  record OBJECTPOSITIONS,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    cObjectCount : Int32,
    pcpPositions : Int32*

  @[Extern]
  record ENLINK,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    msg : UInt32,
    wParam : Win32cr::Foundation::WPARAM,
    lParam : Win32cr::Foundation::LPARAM,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE

  @[Extern]
  record ENLOWFIRTF,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    szControl : Win32cr::Foundation::PSTR

  @[Extern]
  record ENCORRECTTEXT,
    nmhdr : Win32cr::UI::Controls::NMHDR,
    chrg : Win32cr::UI::Controls::RichEdit::CHARRANGE,
    seltyp : Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE

  @[Extern]
  record PUNCTUATION,
    iSize : UInt32,
    szPunctuation : Win32cr::Foundation::PSTR

  @[Extern]
  record COMPCOLOR,
    crText : UInt32,
    crBackground : UInt32,
    dwEffects : UInt32

  @[Extern]
  record REPASTESPECIAL,
    dwAspect : Win32cr::System::Com::DVASPECT,
    dwParam : LibC::UIntPtrT

  @[Extern]
  record SETTEXTEX,
    flags : UInt32,
    codepage : UInt32

  @[Extern]
  record GETTEXTEX,
    cb : UInt32,
    flags : Win32cr::UI::Controls::RichEdit::GETTEXTEX_FLAGS,
    codepage : UInt32,
    lpDefaultChar : Win32cr::Foundation::PSTR,
    lpUsedDefChar : Int32*

  @[Extern]
  record GETTEXTLENGTHEX,
    flags : Win32cr::UI::Controls::RichEdit::GETTEXTLENGTHEX_FLAGS,
    codepage : UInt32

  @[Extern]
  record BIDIOPTIONS,
    cbSize : UInt32,
    wMask : UInt16,
    wEffects : UInt16

  @[Extern]
  record Hyphresult,
    khyph : Win32cr::UI::Controls::RichEdit::KHYPH,
    ichHyph : Int32,
    chHyph : UInt16

  @[Extern]
  record HYPHENATEINFO,
    cbSize : Int16,
    dxHyphenateZone : Int16,
    pfnHyphenate : LibC::IntPtrT

  @[Extern]
  record CHANGENOTIFY,
    dwChangeType : Win32cr::UI::Controls::RichEdit::CHANGETYPE,
    pvCookieData : Void*

  @[Extern(union: true)]
  record CARET_INFO,
    hbitmap : Win32cr::Graphics::Gdi::HBITMAP,
    caretFlags : Win32cr::UI::Controls::RichEdit::CARET_FLAGS

  @[Extern]
  record REOBJECT,
    cbStruct : UInt32,
    cp : Int32,
    clsid : LibC::GUID,
    poleobj : Void*,
    pstg : Void*,
    polesite : Void*,
    sizel : Win32cr::Foundation::SIZE,
    dvaspect : UInt32,
    dwFlags : Win32cr::UI::Controls::RichEdit::REOBJECT_FLAGS,
    dwUser : UInt32

  @[Extern]
  record ITextServicesVtbl,
    query_interface : Proc(ITextServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextServices*, UInt32),
    release : Proc(ITextServices*, UInt32),
    tx_send_message : Proc(ITextServices*, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    tx_draw : Proc(ITextServices*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECT*, LibC::IntPtrT, UInt32, Int32, Win32cr::Foundation::HRESULT),
    tx_get_h_scroll : Proc(ITextServices*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    tx_get_v_scroll : Proc(ITextServices*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_tx_set_cursor : Proc(ITextServices*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    tx_query_hit_point : Proc(ITextServices*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECT*, Int32, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    on_tx_in_place_activate : Proc(ITextServices*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_tx_in_place_deactivate : Proc(ITextServices*, Win32cr::Foundation::HRESULT),
    on_tx_ui_activate : Proc(ITextServices*, Win32cr::Foundation::HRESULT),
    on_tx_ui_deactivate : Proc(ITextServices*, Win32cr::Foundation::HRESULT),
    tx_get_text : Proc(ITextServices*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    tx_set_text : Proc(ITextServices*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    tx_get_cur_target_x : Proc(ITextServices*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_base_line_pos : Proc(ITextServices*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_natural_size : Proc(ITextServices*, UInt32, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::System::Com::DVTARGETDEVICE*, UInt32, Win32cr::Foundation::SIZE*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_drop_target : Proc(ITextServices*, Void**, Win32cr::Foundation::HRESULT),
    on_tx_property_bits_change : Proc(ITextServices*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    tx_get_cached_size : Proc(ITextServices*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextServices, lpVtbl : ITextServicesVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITextServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tx_send_message(this : ITextServices*, msg : UInt32, wparam : Win32cr::Foundation::WPARAM, lparam : Win32cr::Foundation::LPARAM, plresult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_send_message.call(this, msg, wparam, lparam, plresult)
    end
    def tx_draw(this : ITextServices*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcBounds : Win32cr::Foundation::RECTL*, lprcWBounds : Win32cr::Foundation::RECTL*, lprcUpdate : Win32cr::Foundation::RECT*, pfnContinue : LibC::IntPtrT, dwContinue : UInt32, lViewId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_draw.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewId)
    end
    def tx_get_h_scroll(this : ITextServices*, plMin : Int32*, plMax : Int32*, plPos : Int32*, plPage : Int32*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_h_scroll.call(this, plMin, plMax, plPos, plPage, pfEnabled)
    end
    def tx_get_v_scroll(this : ITextServices*, plMin : Int32*, plMax : Int32*, plPos : Int32*, plPage : Int32*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_v_scroll.call(this, plMin, plMax, plPos, plPage, pfEnabled)
    end
    def on_tx_set_cursor(this : ITextServices*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcClient : Win32cr::Foundation::RECT*, x : Int32, y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_set_cursor.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y)
    end
    def tx_query_hit_point(this : ITextServices*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcClient : Win32cr::Foundation::RECT*, x : Int32, y : Int32, pHitResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_query_hit_point.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult)
    end
    def on_tx_in_place_activate(this : ITextServices*, prcClient : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_in_place_activate.call(this, prcClient)
    end
    def on_tx_in_place_deactivate(this : ITextServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_in_place_deactivate.call(this)
    end
    def on_tx_ui_activate(this : ITextServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_ui_activate.call(this)
    end
    def on_tx_ui_deactivate(this : ITextServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_ui_deactivate.call(this)
    end
    def tx_get_text(this : ITextServices*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_text.call(this, pbstrText)
    end
    def tx_set_text(this : ITextServices*, pszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_set_text.call(this, pszText)
    end
    def tx_get_cur_target_x(this : ITextServices*, param0 : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_cur_target_x.call(this, param0)
    end
    def tx_get_base_line_pos(this : ITextServices*, param0 : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_base_line_pos.call(this, param0)
    end
    def tx_get_natural_size(this : ITextServices*, dwAspect : UInt32, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, ptd : Win32cr::System::Com::DVTARGETDEVICE*, dwMode : UInt32, psizelExtent : Win32cr::Foundation::SIZE*, pwidth : Int32*, pheight : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_natural_size.call(this, dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight)
    end
    def tx_get_drop_target(this : ITextServices*, ppDropTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_drop_target.call(this, ppDropTarget)
    end
    def on_tx_property_bits_change(this : ITextServices*, dwMask : UInt32, dwBits : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_property_bits_change.call(this, dwMask, dwBits)
    end
    def tx_get_cached_size(this : ITextServices*, pdwWidth : UInt32*, pdwHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_cached_size.call(this, pdwWidth, pdwHeight)
    end

  end

  @[Extern]
  record ITextHostVtbl,
    query_interface : Proc(ITextHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextHost*, UInt32),
    release : Proc(ITextHost*, UInt32),
    tx_get_dc : Proc(ITextHost*, Win32cr::Graphics::Gdi::HDC),
    tx_release_dc : Proc(ITextHost*, Win32cr::Graphics::Gdi::HDC, Int32),
    tx_show_scroll_bar : Proc(ITextHost*, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_enable_scroll_bar : Proc(ITextHost*, Win32cr::UI::WindowsAndMessaging::SCROLLBAR_CONSTANTS, Win32cr::UI::Controls::ENABLE_SCROLL_BAR_ARROWS, Win32cr::Foundation::BOOL),
    tx_set_scroll_range : Proc(ITextHost*, Int32, Int32, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_set_scroll_pos : Proc(ITextHost*, Int32, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_invalidate_rect : Proc(ITextHost*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL, Void),
    tx_view_change : Proc(ITextHost*, Win32cr::Foundation::BOOL, Void),
    tx_create_caret : Proc(ITextHost*, Win32cr::Graphics::Gdi::HBITMAP, Int32, Int32, Win32cr::Foundation::BOOL),
    tx_show_caret : Proc(ITextHost*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_set_caret_pos : Proc(ITextHost*, Int32, Int32, Win32cr::Foundation::BOOL),
    tx_set_timer : Proc(ITextHost*, UInt32, UInt32, Win32cr::Foundation::BOOL),
    tx_kill_timer : Proc(ITextHost*, UInt32, Void),
    tx_scroll_window_ex : Proc(ITextHost*, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Win32cr::Graphics::Gdi::HRGN, Win32cr::Foundation::RECT*, Win32cr::UI::WindowsAndMessaging::SHOW_WINDOW_CMD, Void),
    tx_set_capture : Proc(ITextHost*, Win32cr::Foundation::BOOL, Void),
    tx_set_focus : Proc(ITextHost*, Void),
    tx_set_cursor : Proc(ITextHost*, Win32cr::UI::WindowsAndMessaging::HCURSOR, Win32cr::Foundation::BOOL, Void),
    tx_screen_to_client : Proc(ITextHost*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL),
    tx_client_to_screen : Proc(ITextHost*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL),
    tx_activate : Proc(ITextHost*, Int32*, Win32cr::Foundation::HRESULT),
    tx_deactivate : Proc(ITextHost*, Int32, Win32cr::Foundation::HRESULT),
    tx_get_client_rect : Proc(ITextHost*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    tx_get_view_inset : Proc(ITextHost*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    tx_get_char_format : Proc(ITextHost*, Win32cr::UI::Controls::RichEdit::CHARFORMATW**, Win32cr::Foundation::HRESULT),
    tx_get_para_format : Proc(ITextHost*, Win32cr::UI::Controls::RichEdit::PARAFORMAT**, Win32cr::Foundation::HRESULT),
    tx_get_sys_color : Proc(ITextHost*, Int32, UInt32),
    tx_get_back_style : Proc(ITextHost*, Win32cr::UI::Controls::RichEdit::TXTBACKSTYLE*, Win32cr::Foundation::HRESULT),
    tx_get_max_length : Proc(ITextHost*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_scroll_bars : Proc(ITextHost*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_password_char : Proc(ITextHost*, Int8*, Win32cr::Foundation::HRESULT),
    tx_get_accelerator_pos : Proc(ITextHost*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_extent : Proc(ITextHost*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT),
    on_tx_char_format_change : Proc(ITextHost*, Win32cr::UI::Controls::RichEdit::CHARFORMATW*, Win32cr::Foundation::HRESULT),
    on_tx_para_format_change : Proc(ITextHost*, Win32cr::UI::Controls::RichEdit::PARAFORMAT*, Win32cr::Foundation::HRESULT),
    tx_get_property_bits : Proc(ITextHost*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    tx_notify : Proc(ITextHost*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    tx_imm_get_context : Proc(ITextHost*, Win32cr::Globalization::HIMC),
    tx_imm_release_context : Proc(ITextHost*, Win32cr::Globalization::HIMC, Void),
    tx_get_selection_bar_width : Proc(ITextHost*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextHost, lpVtbl : ITextHostVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITextHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tx_get_dc(this : ITextHost*) : Win32cr::Graphics::Gdi::HDC
      @lpVtbl.try &.value.tx_get_dc.call(this)
    end
    def tx_release_dc(this : ITextHost*, hdc : Win32cr::Graphics::Gdi::HDC) : Int32
      @lpVtbl.try &.value.tx_release_dc.call(this, hdc)
    end
    def tx_show_scroll_bar(this : ITextHost*, fnBar : Int32, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_show_scroll_bar.call(this, fnBar, fShow)
    end
    def tx_enable_scroll_bar(this : ITextHost*, fuSBFlags : Win32cr::UI::WindowsAndMessaging::SCROLLBAR_CONSTANTS, fuArrowflags : Win32cr::UI::Controls::ENABLE_SCROLL_BAR_ARROWS) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_enable_scroll_bar.call(this, fuSBFlags, fuArrowflags)
    end
    def tx_set_scroll_range(this : ITextHost*, fnBar : Int32, nMinPos : Int32, nMaxPos : Int32, fRedraw : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_scroll_range.call(this, fnBar, nMinPos, nMaxPos, fRedraw)
    end
    def tx_set_scroll_pos(this : ITextHost*, fnBar : Int32, nPos : Int32, fRedraw : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_scroll_pos.call(this, fnBar, nPos, fRedraw)
    end
    def tx_invalidate_rect(this : ITextHost*, prc : Win32cr::Foundation::RECT*, fMode : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_invalidate_rect.call(this, prc, fMode)
    end
    def tx_view_change(this : ITextHost*, fUpdate : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_view_change.call(this, fUpdate)
    end
    def tx_create_caret(this : ITextHost*, hbmp : Win32cr::Graphics::Gdi::HBITMAP, xWidth : Int32, yHeight : Int32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_create_caret.call(this, hbmp, xWidth, yHeight)
    end
    def tx_show_caret(this : ITextHost*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_show_caret.call(this, fShow)
    end
    def tx_set_caret_pos(this : ITextHost*, x : Int32, y : Int32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_caret_pos.call(this, x, y)
    end
    def tx_set_timer(this : ITextHost*, idTimer : UInt32, uTimeout : UInt32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_timer.call(this, idTimer, uTimeout)
    end
    def tx_kill_timer(this : ITextHost*, idTimer : UInt32) : Void
      @lpVtbl.try &.value.tx_kill_timer.call(this, idTimer)
    end
    def tx_scroll_window_ex(this : ITextHost*, dx : Int32, dy : Int32, lprcScroll : Win32cr::Foundation::RECT*, lprcClip : Win32cr::Foundation::RECT*, hrgnUpdate : Win32cr::Graphics::Gdi::HRGN, lprcUpdate : Win32cr::Foundation::RECT*, fuScroll : Win32cr::UI::WindowsAndMessaging::SHOW_WINDOW_CMD) : Void
      @lpVtbl.try &.value.tx_scroll_window_ex.call(this, dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll)
    end
    def tx_set_capture(this : ITextHost*, fCapture : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_set_capture.call(this, fCapture)
    end
    def tx_set_focus(this : ITextHost*) : Void
      @lpVtbl.try &.value.tx_set_focus.call(this)
    end
    def tx_set_cursor(this : ITextHost*, hcur : Win32cr::UI::WindowsAndMessaging::HCURSOR, fText : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_set_cursor.call(this, hcur, fText)
    end
    def tx_screen_to_client(this : ITextHost*, lppt : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_screen_to_client.call(this, lppt)
    end
    def tx_client_to_screen(this : ITextHost*, lppt : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_client_to_screen.call(this, lppt)
    end
    def tx_activate(this : ITextHost*, plOldState : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_activate.call(this, plOldState)
    end
    def tx_deactivate(this : ITextHost*, lNewState : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_deactivate.call(this, lNewState)
    end
    def tx_get_client_rect(this : ITextHost*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_client_rect.call(this, prc)
    end
    def tx_get_view_inset(this : ITextHost*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_view_inset.call(this, prc)
    end
    def tx_get_char_format(this : ITextHost*, ppCF : Win32cr::UI::Controls::RichEdit::CHARFORMATW**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_char_format.call(this, ppCF)
    end
    def tx_get_para_format(this : ITextHost*, ppPF : Win32cr::UI::Controls::RichEdit::PARAFORMAT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_para_format.call(this, ppPF)
    end
    def tx_get_sys_color(this : ITextHost*, nIndex : Int32) : UInt32
      @lpVtbl.try &.value.tx_get_sys_color.call(this, nIndex)
    end
    def tx_get_back_style(this : ITextHost*, pstyle : Win32cr::UI::Controls::RichEdit::TXTBACKSTYLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_back_style.call(this, pstyle)
    end
    def tx_get_max_length(this : ITextHost*, plength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_max_length.call(this, plength)
    end
    def tx_get_scroll_bars(this : ITextHost*, pdwScrollBar : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_scroll_bars.call(this, pdwScrollBar)
    end
    def tx_get_password_char(this : ITextHost*, pch : Int8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_password_char.call(this, pch)
    end
    def tx_get_accelerator_pos(this : ITextHost*, pcp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_accelerator_pos.call(this, pcp)
    end
    def tx_get_extent(this : ITextHost*, lpExtent : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_extent.call(this, lpExtent)
    end
    def on_tx_char_format_change(this : ITextHost*, pCF : Win32cr::UI::Controls::RichEdit::CHARFORMATW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_char_format_change.call(this, pCF)
    end
    def on_tx_para_format_change(this : ITextHost*, pPF : Win32cr::UI::Controls::RichEdit::PARAFORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_para_format_change.call(this, pPF)
    end
    def tx_get_property_bits(this : ITextHost*, dwMask : UInt32, pdwBits : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_property_bits.call(this, dwMask, pdwBits)
    end
    def tx_notify(this : ITextHost*, iNotify : UInt32, pv : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_notify.call(this, iNotify, pv)
    end
    def tx_imm_get_context(this : ITextHost*) : Win32cr::Globalization::HIMC
      @lpVtbl.try &.value.tx_imm_get_context.call(this)
    end
    def tx_imm_release_context(this : ITextHost*, himc : Win32cr::Globalization::HIMC) : Void
      @lpVtbl.try &.value.tx_imm_release_context.call(this, himc)
    end
    def tx_get_selection_bar_width(this : ITextHost*, lSelBarWidth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_selection_bar_width.call(this, lSelBarWidth)
    end

  end

  @[Extern]
  record IRicheditUiaOverridesVtbl,
    query_interface : Proc(IRicheditUiaOverrides*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRicheditUiaOverrides*, UInt32),
    release : Proc(IRicheditUiaOverrides*, UInt32),
    get_property_override_value : Proc(IRicheditUiaOverrides*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRicheditUiaOverrides, lpVtbl : IRicheditUiaOverridesVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IRicheditUiaOverrides*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRicheditUiaOverrides*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRicheditUiaOverrides*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_override_value(this : IRicheditUiaOverrides*, propertyId : Int32, pRetValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_override_value.call(this, propertyId, pRetValue)
    end

  end

  @[Extern]
  record ITextHost2Vtbl,
    query_interface : Proc(ITextHost2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextHost2*, UInt32),
    release : Proc(ITextHost2*, UInt32),
    tx_get_dc : Proc(ITextHost2*, Win32cr::Graphics::Gdi::HDC),
    tx_release_dc : Proc(ITextHost2*, Win32cr::Graphics::Gdi::HDC, Int32),
    tx_show_scroll_bar : Proc(ITextHost2*, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_enable_scroll_bar : Proc(ITextHost2*, Win32cr::UI::WindowsAndMessaging::SCROLLBAR_CONSTANTS, Win32cr::UI::Controls::ENABLE_SCROLL_BAR_ARROWS, Win32cr::Foundation::BOOL),
    tx_set_scroll_range : Proc(ITextHost2*, Int32, Int32, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_set_scroll_pos : Proc(ITextHost2*, Int32, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_invalidate_rect : Proc(ITextHost2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL, Void),
    tx_view_change : Proc(ITextHost2*, Win32cr::Foundation::BOOL, Void),
    tx_create_caret : Proc(ITextHost2*, Win32cr::Graphics::Gdi::HBITMAP, Int32, Int32, Win32cr::Foundation::BOOL),
    tx_show_caret : Proc(ITextHost2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL),
    tx_set_caret_pos : Proc(ITextHost2*, Int32, Int32, Win32cr::Foundation::BOOL),
    tx_set_timer : Proc(ITextHost2*, UInt32, UInt32, Win32cr::Foundation::BOOL),
    tx_kill_timer : Proc(ITextHost2*, UInt32, Void),
    tx_scroll_window_ex : Proc(ITextHost2*, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Win32cr::Graphics::Gdi::HRGN, Win32cr::Foundation::RECT*, Win32cr::UI::WindowsAndMessaging::SHOW_WINDOW_CMD, Void),
    tx_set_capture : Proc(ITextHost2*, Win32cr::Foundation::BOOL, Void),
    tx_set_focus : Proc(ITextHost2*, Void),
    tx_set_cursor : Proc(ITextHost2*, Win32cr::UI::WindowsAndMessaging::HCURSOR, Win32cr::Foundation::BOOL, Void),
    tx_screen_to_client : Proc(ITextHost2*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL),
    tx_client_to_screen : Proc(ITextHost2*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL),
    tx_activate : Proc(ITextHost2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_deactivate : Proc(ITextHost2*, Int32, Win32cr::Foundation::HRESULT),
    tx_get_client_rect : Proc(ITextHost2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    tx_get_view_inset : Proc(ITextHost2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    tx_get_char_format : Proc(ITextHost2*, Win32cr::UI::Controls::RichEdit::CHARFORMATW**, Win32cr::Foundation::HRESULT),
    tx_get_para_format : Proc(ITextHost2*, Win32cr::UI::Controls::RichEdit::PARAFORMAT**, Win32cr::Foundation::HRESULT),
    tx_get_sys_color : Proc(ITextHost2*, Int32, UInt32),
    tx_get_back_style : Proc(ITextHost2*, Win32cr::UI::Controls::RichEdit::TXTBACKSTYLE*, Win32cr::Foundation::HRESULT),
    tx_get_max_length : Proc(ITextHost2*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_scroll_bars : Proc(ITextHost2*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_password_char : Proc(ITextHost2*, Int8*, Win32cr::Foundation::HRESULT),
    tx_get_accelerator_pos : Proc(ITextHost2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_extent : Proc(ITextHost2*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT),
    on_tx_char_format_change : Proc(ITextHost2*, Win32cr::UI::Controls::RichEdit::CHARFORMATW*, Win32cr::Foundation::HRESULT),
    on_tx_para_format_change : Proc(ITextHost2*, Win32cr::UI::Controls::RichEdit::PARAFORMAT*, Win32cr::Foundation::HRESULT),
    tx_get_property_bits : Proc(ITextHost2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    tx_notify : Proc(ITextHost2*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    tx_imm_get_context : Proc(ITextHost2*, Win32cr::Globalization::HIMC),
    tx_imm_release_context : Proc(ITextHost2*, Win32cr::Globalization::HIMC, Void),
    tx_get_selection_bar_width : Proc(ITextHost2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_is_double_click_pending : Proc(ITextHost2*, Win32cr::Foundation::BOOL),
    tx_get_window : Proc(ITextHost2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    tx_set_foreground_window : Proc(ITextHost2*, Win32cr::Foundation::HRESULT),
    tx_get_palette : Proc(ITextHost2*, Win32cr::Graphics::Gdi::HPALETTE),
    tx_get_east_asian_flags : Proc(ITextHost2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_set_cursor2 : Proc(ITextHost2*, Win32cr::UI::WindowsAndMessaging::HCURSOR, Win32cr::Foundation::BOOL, Win32cr::UI::WindowsAndMessaging::HCURSOR),
    tx_free_text_services_notification : Proc(ITextHost2*, Void),
    tx_get_edit_style : Proc(ITextHost2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_window_styles : Proc(ITextHost2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_show_drop_caret : Proc(ITextHost2*, Win32cr::Foundation::BOOL, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    tx_destroy_caret : Proc(ITextHost2*, Win32cr::Foundation::HRESULT),
    tx_get_horz_extent : Proc(ITextHost2*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextHost2, lpVtbl : ITextHost2Vtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITextHost2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextHost2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextHost2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tx_get_dc(this : ITextHost2*) : Win32cr::Graphics::Gdi::HDC
      @lpVtbl.try &.value.tx_get_dc.call(this)
    end
    def tx_release_dc(this : ITextHost2*, hdc : Win32cr::Graphics::Gdi::HDC) : Int32
      @lpVtbl.try &.value.tx_release_dc.call(this, hdc)
    end
    def tx_show_scroll_bar(this : ITextHost2*, fnBar : Int32, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_show_scroll_bar.call(this, fnBar, fShow)
    end
    def tx_enable_scroll_bar(this : ITextHost2*, fuSBFlags : Win32cr::UI::WindowsAndMessaging::SCROLLBAR_CONSTANTS, fuArrowflags : Win32cr::UI::Controls::ENABLE_SCROLL_BAR_ARROWS) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_enable_scroll_bar.call(this, fuSBFlags, fuArrowflags)
    end
    def tx_set_scroll_range(this : ITextHost2*, fnBar : Int32, nMinPos : Int32, nMaxPos : Int32, fRedraw : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_scroll_range.call(this, fnBar, nMinPos, nMaxPos, fRedraw)
    end
    def tx_set_scroll_pos(this : ITextHost2*, fnBar : Int32, nPos : Int32, fRedraw : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_scroll_pos.call(this, fnBar, nPos, fRedraw)
    end
    def tx_invalidate_rect(this : ITextHost2*, prc : Win32cr::Foundation::RECT*, fMode : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_invalidate_rect.call(this, prc, fMode)
    end
    def tx_view_change(this : ITextHost2*, fUpdate : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_view_change.call(this, fUpdate)
    end
    def tx_create_caret(this : ITextHost2*, hbmp : Win32cr::Graphics::Gdi::HBITMAP, xWidth : Int32, yHeight : Int32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_create_caret.call(this, hbmp, xWidth, yHeight)
    end
    def tx_show_caret(this : ITextHost2*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_show_caret.call(this, fShow)
    end
    def tx_set_caret_pos(this : ITextHost2*, x : Int32, y : Int32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_caret_pos.call(this, x, y)
    end
    def tx_set_timer(this : ITextHost2*, idTimer : UInt32, uTimeout : UInt32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_set_timer.call(this, idTimer, uTimeout)
    end
    def tx_kill_timer(this : ITextHost2*, idTimer : UInt32) : Void
      @lpVtbl.try &.value.tx_kill_timer.call(this, idTimer)
    end
    def tx_scroll_window_ex(this : ITextHost2*, dx : Int32, dy : Int32, lprcScroll : Win32cr::Foundation::RECT*, lprcClip : Win32cr::Foundation::RECT*, hrgnUpdate : Win32cr::Graphics::Gdi::HRGN, lprcUpdate : Win32cr::Foundation::RECT*, fuScroll : Win32cr::UI::WindowsAndMessaging::SHOW_WINDOW_CMD) : Void
      @lpVtbl.try &.value.tx_scroll_window_ex.call(this, dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll)
    end
    def tx_set_capture(this : ITextHost2*, fCapture : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_set_capture.call(this, fCapture)
    end
    def tx_set_focus(this : ITextHost2*) : Void
      @lpVtbl.try &.value.tx_set_focus.call(this)
    end
    def tx_set_cursor(this : ITextHost2*, hcur : Win32cr::UI::WindowsAndMessaging::HCURSOR, fText : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.tx_set_cursor.call(this, hcur, fText)
    end
    def tx_screen_to_client(this : ITextHost2*, lppt : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_screen_to_client.call(this, lppt)
    end
    def tx_client_to_screen(this : ITextHost2*, lppt : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_client_to_screen.call(this, lppt)
    end
    def tx_activate(this : ITextHost2*, plOldState : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_activate.call(this, plOldState)
    end
    def tx_deactivate(this : ITextHost2*, lNewState : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_deactivate.call(this, lNewState)
    end
    def tx_get_client_rect(this : ITextHost2*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_client_rect.call(this, prc)
    end
    def tx_get_view_inset(this : ITextHost2*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_view_inset.call(this, prc)
    end
    def tx_get_char_format(this : ITextHost2*, ppCF : Win32cr::UI::Controls::RichEdit::CHARFORMATW**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_char_format.call(this, ppCF)
    end
    def tx_get_para_format(this : ITextHost2*, ppPF : Win32cr::UI::Controls::RichEdit::PARAFORMAT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_para_format.call(this, ppPF)
    end
    def tx_get_sys_color(this : ITextHost2*, nIndex : Int32) : UInt32
      @lpVtbl.try &.value.tx_get_sys_color.call(this, nIndex)
    end
    def tx_get_back_style(this : ITextHost2*, pstyle : Win32cr::UI::Controls::RichEdit::TXTBACKSTYLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_back_style.call(this, pstyle)
    end
    def tx_get_max_length(this : ITextHost2*, plength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_max_length.call(this, plength)
    end
    def tx_get_scroll_bars(this : ITextHost2*, pdwScrollBar : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_scroll_bars.call(this, pdwScrollBar)
    end
    def tx_get_password_char(this : ITextHost2*, pch : Int8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_password_char.call(this, pch)
    end
    def tx_get_accelerator_pos(this : ITextHost2*, pcp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_accelerator_pos.call(this, pcp)
    end
    def tx_get_extent(this : ITextHost2*, lpExtent : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_extent.call(this, lpExtent)
    end
    def on_tx_char_format_change(this : ITextHost2*, pCF : Win32cr::UI::Controls::RichEdit::CHARFORMATW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_char_format_change.call(this, pCF)
    end
    def on_tx_para_format_change(this : ITextHost2*, pPF : Win32cr::UI::Controls::RichEdit::PARAFORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_para_format_change.call(this, pPF)
    end
    def tx_get_property_bits(this : ITextHost2*, dwMask : UInt32, pdwBits : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_property_bits.call(this, dwMask, pdwBits)
    end
    def tx_notify(this : ITextHost2*, iNotify : UInt32, pv : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_notify.call(this, iNotify, pv)
    end
    def tx_imm_get_context(this : ITextHost2*) : Win32cr::Globalization::HIMC
      @lpVtbl.try &.value.tx_imm_get_context.call(this)
    end
    def tx_imm_release_context(this : ITextHost2*, himc : Win32cr::Globalization::HIMC) : Void
      @lpVtbl.try &.value.tx_imm_release_context.call(this, himc)
    end
    def tx_get_selection_bar_width(this : ITextHost2*, lSelBarWidth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_selection_bar_width.call(this, lSelBarWidth)
    end
    def tx_is_double_click_pending(this : ITextHost2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.tx_is_double_click_pending.call(this)
    end
    def tx_get_window(this : ITextHost2*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_window.call(this, phwnd)
    end
    def tx_set_foreground_window(this : ITextHost2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_set_foreground_window.call(this)
    end
    def tx_get_palette(this : ITextHost2*) : Win32cr::Graphics::Gdi::HPALETTE
      @lpVtbl.try &.value.tx_get_palette.call(this)
    end
    def tx_get_east_asian_flags(this : ITextHost2*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_east_asian_flags.call(this, pFlags)
    end
    def tx_set_cursor2(this : ITextHost2*, hcur : Win32cr::UI::WindowsAndMessaging::HCURSOR, bText : Win32cr::Foundation::BOOL) : Win32cr::UI::WindowsAndMessaging::HCURSOR
      @lpVtbl.try &.value.tx_set_cursor2.call(this, hcur, bText)
    end
    def tx_free_text_services_notification(this : ITextHost2*) : Void
      @lpVtbl.try &.value.tx_free_text_services_notification.call(this)
    end
    def tx_get_edit_style(this : ITextHost2*, dwItem : UInt32, pdwData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_edit_style.call(this, dwItem, pdwData)
    end
    def tx_get_window_styles(this : ITextHost2*, pdwStyle : UInt32*, pdwExStyle : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_window_styles.call(this, pdwStyle, pdwExStyle)
    end
    def tx_show_drop_caret(this : ITextHost2*, fShow : Win32cr::Foundation::BOOL, hdc : Win32cr::Graphics::Gdi::HDC, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_show_drop_caret.call(this, fShow, hdc, prc)
    end
    def tx_destroy_caret(this : ITextHost2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_destroy_caret.call(this)
    end
    def tx_get_horz_extent(this : ITextHost2*, plHorzExtent : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_horz_extent.call(this, plHorzExtent)
    end

  end

  @[Extern]
  record ITextServices2Vtbl,
    query_interface : Proc(ITextServices2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextServices2*, UInt32),
    release : Proc(ITextServices2*, UInt32),
    tx_send_message : Proc(ITextServices2*, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT),
    tx_draw : Proc(ITextServices2*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECT*, LibC::IntPtrT, UInt32, Int32, Win32cr::Foundation::HRESULT),
    tx_get_h_scroll : Proc(ITextServices2*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    tx_get_v_scroll : Proc(ITextServices2*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_tx_set_cursor : Proc(ITextServices2*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    tx_query_hit_point : Proc(ITextServices2*, Win32cr::System::Com::DVASPECT, Int32, Void*, Win32cr::System::Com::DVTARGETDEVICE*, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::RECT*, Int32, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    on_tx_in_place_activate : Proc(ITextServices2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_tx_in_place_deactivate : Proc(ITextServices2*, Win32cr::Foundation::HRESULT),
    on_tx_ui_activate : Proc(ITextServices2*, Win32cr::Foundation::HRESULT),
    on_tx_ui_deactivate : Proc(ITextServices2*, Win32cr::Foundation::HRESULT),
    tx_get_text : Proc(ITextServices2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    tx_set_text : Proc(ITextServices2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    tx_get_cur_target_x : Proc(ITextServices2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_base_line_pos : Proc(ITextServices2*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_natural_size : Proc(ITextServices2*, UInt32, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::System::Com::DVTARGETDEVICE*, UInt32, Win32cr::Foundation::SIZE*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    tx_get_drop_target : Proc(ITextServices2*, Void**, Win32cr::Foundation::HRESULT),
    on_tx_property_bits_change : Proc(ITextServices2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    tx_get_cached_size : Proc(ITextServices2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    tx_get_natural_size2 : Proc(ITextServices2*, UInt32, Win32cr::Graphics::Gdi::HDC, Win32cr::Graphics::Gdi::HDC, Win32cr::System::Com::DVTARGETDEVICE*, UInt32, Win32cr::Foundation::SIZE*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    tx_draw_d2_d : Proc(ITextServices2*, Void*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECT*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextServices2, lpVtbl : ITextServices2Vtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITextServices2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextServices2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextServices2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tx_send_message(this : ITextServices2*, msg : UInt32, wparam : Win32cr::Foundation::WPARAM, lparam : Win32cr::Foundation::LPARAM, plresult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_send_message.call(this, msg, wparam, lparam, plresult)
    end
    def tx_draw(this : ITextServices2*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcBounds : Win32cr::Foundation::RECTL*, lprcWBounds : Win32cr::Foundation::RECTL*, lprcUpdate : Win32cr::Foundation::RECT*, pfnContinue : LibC::IntPtrT, dwContinue : UInt32, lViewId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_draw.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewId)
    end
    def tx_get_h_scroll(this : ITextServices2*, plMin : Int32*, plMax : Int32*, plPos : Int32*, plPage : Int32*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_h_scroll.call(this, plMin, plMax, plPos, plPage, pfEnabled)
    end
    def tx_get_v_scroll(this : ITextServices2*, plMin : Int32*, plMax : Int32*, plPos : Int32*, plPage : Int32*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_v_scroll.call(this, plMin, plMax, plPos, plPage, pfEnabled)
    end
    def on_tx_set_cursor(this : ITextServices2*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcClient : Win32cr::Foundation::RECT*, x : Int32, y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_set_cursor.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y)
    end
    def tx_query_hit_point(this : ITextServices2*, dwDrawAspect : Win32cr::System::Com::DVASPECT, lindex : Int32, pvAspect : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, lprcClient : Win32cr::Foundation::RECT*, x : Int32, y : Int32, pHitResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_query_hit_point.call(this, dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult)
    end
    def on_tx_in_place_activate(this : ITextServices2*, prcClient : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_in_place_activate.call(this, prcClient)
    end
    def on_tx_in_place_deactivate(this : ITextServices2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_in_place_deactivate.call(this)
    end
    def on_tx_ui_activate(this : ITextServices2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_ui_activate.call(this)
    end
    def on_tx_ui_deactivate(this : ITextServices2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_ui_deactivate.call(this)
    end
    def tx_get_text(this : ITextServices2*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_text.call(this, pbstrText)
    end
    def tx_set_text(this : ITextServices2*, pszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_set_text.call(this, pszText)
    end
    def tx_get_cur_target_x(this : ITextServices2*, param0 : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_cur_target_x.call(this, param0)
    end
    def tx_get_base_line_pos(this : ITextServices2*, param0 : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_base_line_pos.call(this, param0)
    end
    def tx_get_natural_size(this : ITextServices2*, dwAspect : UInt32, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, ptd : Win32cr::System::Com::DVTARGETDEVICE*, dwMode : UInt32, psizelExtent : Win32cr::Foundation::SIZE*, pwidth : Int32*, pheight : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_natural_size.call(this, dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight)
    end
    def tx_get_drop_target(this : ITextServices2*, ppDropTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_drop_target.call(this, ppDropTarget)
    end
    def on_tx_property_bits_change(this : ITextServices2*, dwMask : UInt32, dwBits : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_tx_property_bits_change.call(this, dwMask, dwBits)
    end
    def tx_get_cached_size(this : ITextServices2*, pdwWidth : UInt32*, pdwHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_cached_size.call(this, pdwWidth, pdwHeight)
    end
    def tx_get_natural_size2(this : ITextServices2*, dwAspect : UInt32, hdcDraw : Win32cr::Graphics::Gdi::HDC, hicTargetDev : Win32cr::Graphics::Gdi::HDC, ptd : Win32cr::System::Com::DVTARGETDEVICE*, dwMode : UInt32, psizelExtent : Win32cr::Foundation::SIZE*, pwidth : Int32*, pheight : Int32*, pascent : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_get_natural_size2.call(this, dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight, pascent)
    end
    def tx_draw_d2_d(this : ITextServices2*, pRenderTarget : Void*, lprcBounds : Win32cr::Foundation::RECTL*, lprcUpdate : Win32cr::Foundation::RECT*, lViewId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tx_draw_d2_d.call(this, pRenderTarget, lprcBounds, lprcUpdate, lViewId)
    end

  end

  @[Extern]
  record IRichEditOleVtbl,
    query_interface : Proc(IRichEditOle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRichEditOle*, UInt32),
    release : Proc(IRichEditOle*, UInt32),
    get_client_site : Proc(IRichEditOle*, Void**, Win32cr::Foundation::HRESULT),
    get_object_count : Proc(IRichEditOle*, Int32),
    get_link_count : Proc(IRichEditOle*, Int32),
    get_object : Proc(IRichEditOle*, Int32, Win32cr::UI::Controls::RichEdit::REOBJECT*, Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_OBJECT_FLAGS, Win32cr::Foundation::HRESULT),
    insert_object : Proc(IRichEditOle*, Win32cr::UI::Controls::RichEdit::REOBJECT*, Win32cr::Foundation::HRESULT),
    convert_object : Proc(IRichEditOle*, Int32, LibC::GUID*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    activate_as : Proc(IRichEditOle*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_host_names : Proc(IRichEditOle*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    set_link_available : Proc(IRichEditOle*, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_dvaspect : Proc(IRichEditOle*, Int32, UInt32, Win32cr::Foundation::HRESULT),
    hands_off_storage : Proc(IRichEditOle*, Int32, Win32cr::Foundation::HRESULT),
    save_completed : Proc(IRichEditOle*, Int32, Void*, Win32cr::Foundation::HRESULT),
    in_place_deactivate : Proc(IRichEditOle*, Win32cr::Foundation::HRESULT),
    context_sensitive_help : Proc(IRichEditOle*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_clipboard_data : Proc(IRichEditOle*, Win32cr::UI::Controls::RichEdit::CHARRANGE*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    import_data_object : Proc(IRichEditOle*, Void*, UInt16, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020d00-0000-0000-c000-000000000046")]
  record IRichEditOle, lpVtbl : IRichEditOleVtbl* do
    GUID = LibC::GUID.new(0x20d00_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRichEditOle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRichEditOle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRichEditOle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_site(this : IRichEditOle*, lplpolesite : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_site.call(this, lplpolesite)
    end
    def get_object_count(this : IRichEditOle*) : Int32
      @lpVtbl.try &.value.get_object_count.call(this)
    end
    def get_link_count(this : IRichEditOle*) : Int32
      @lpVtbl.try &.value.get_link_count.call(this)
    end
    def get_object(this : IRichEditOle*, iob : Int32, lpreobject : Win32cr::UI::Controls::RichEdit::REOBJECT*, dwFlags : Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_OBJECT_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, iob, lpreobject, dwFlags)
    end
    def insert_object(this : IRichEditOle*, lpreobject : Win32cr::UI::Controls::RichEdit::REOBJECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_object.call(this, lpreobject)
    end
    def convert_object(this : IRichEditOle*, iob : Int32, rclsidNew : LibC::GUID*, lpstrUserTypeNew : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_object.call(this, iob, rclsidNew, lpstrUserTypeNew)
    end
    def activate_as(this : IRichEditOle*, rclsid : LibC::GUID*, rclsidAs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_as.call(this, rclsid, rclsidAs)
    end
    def set_host_names(this : IRichEditOle*, lpstrContainerApp : Win32cr::Foundation::PSTR, lpstrContainerObj : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_host_names.call(this, lpstrContainerApp, lpstrContainerObj)
    end
    def set_link_available(this : IRichEditOle*, iob : Int32, fAvailable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_link_available.call(this, iob, fAvailable)
    end
    def set_dvaspect(this : IRichEditOle*, iob : Int32, dvaspect : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dvaspect.call(this, iob, dvaspect)
    end
    def hands_off_storage(this : IRichEditOle*, iob : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hands_off_storage.call(this, iob)
    end
    def save_completed(this : IRichEditOle*, iob : Int32, lpstg : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_completed.call(this, iob, lpstg)
    end
    def in_place_deactivate(this : IRichEditOle*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_place_deactivate.call(this)
    end
    def context_sensitive_help(this : IRichEditOle*, fEnterMode : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.context_sensitive_help.call(this, fEnterMode)
    end
    def get_clipboard_data(this : IRichEditOle*, lpchrg : Win32cr::UI::Controls::RichEdit::CHARRANGE*, reco : UInt32, lplpdataobj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clipboard_data.call(this, lpchrg, reco, lplpdataobj)
    end
    def import_data_object(this : IRichEditOle*, lpdataobj : Void*, cf : UInt16, hMetaPict : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_data_object.call(this, lpdataobj, cf, hMetaPict)
    end

  end

  @[Extern]
  record IRichEditOleCallbackVtbl,
    query_interface : Proc(IRichEditOleCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRichEditOleCallback*, UInt32),
    release : Proc(IRichEditOleCallback*, UInt32),
    get_new_storage : Proc(IRichEditOleCallback*, Void**, Win32cr::Foundation::HRESULT),
    get_in_place_context : Proc(IRichEditOleCallback*, Void**, Void**, Win32cr::System::Ole::OIFI*, Win32cr::Foundation::HRESULT),
    show_container_ui : Proc(IRichEditOleCallback*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    query_insert_object : Proc(IRichEditOleCallback*, LibC::GUID*, Void*, Int32, Win32cr::Foundation::HRESULT),
    delete_object : Proc(IRichEditOleCallback*, Void*, Win32cr::Foundation::HRESULT),
    query_accept_data : Proc(IRichEditOleCallback*, Void*, UInt16*, UInt32, Win32cr::Foundation::BOOL, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    context_sensitive_help : Proc(IRichEditOleCallback*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_clipboard_data : Proc(IRichEditOleCallback*, Win32cr::UI::Controls::RichEdit::CHARRANGE*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_drag_drop_effect : Proc(IRichEditOleCallback*, Win32cr::Foundation::BOOL, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_context_menu : Proc(IRichEditOleCallback*, Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, Void*, Win32cr::UI::Controls::RichEdit::CHARRANGE*, Win32cr::UI::WindowsAndMessaging::HMENU*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020d03-0000-0000-c000-000000000046")]
  record IRichEditOleCallback, lpVtbl : IRichEditOleCallbackVtbl* do
    GUID = LibC::GUID.new(0x20d03_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRichEditOleCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRichEditOleCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRichEditOleCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_new_storage(this : IRichEditOleCallback*, lplpstg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_storage.call(this, lplpstg)
    end
    def get_in_place_context(this : IRichEditOleCallback*, lplpFrame : Void**, lplpDoc : Void**, lpFrameInfo : Win32cr::System::Ole::OIFI*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_place_context.call(this, lplpFrame, lplpDoc, lpFrameInfo)
    end
    def show_container_ui(this : IRichEditOleCallback*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_container_ui.call(this, fShow)
    end
    def query_insert_object(this : IRichEditOleCallback*, lpclsid : LibC::GUID*, lpstg : Void*, cp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert_object.call(this, lpclsid, lpstg, cp)
    end
    def delete_object(this : IRichEditOleCallback*, lpoleobj : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_object.call(this, lpoleobj)
    end
    def query_accept_data(this : IRichEditOleCallback*, lpdataobj : Void*, lpcfFormat : UInt16*, reco : UInt32, fReally : Win32cr::Foundation::BOOL, hMetaPict : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_accept_data.call(this, lpdataobj, lpcfFormat, reco, fReally, hMetaPict)
    end
    def context_sensitive_help(this : IRichEditOleCallback*, fEnterMode : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.context_sensitive_help.call(this, fEnterMode)
    end
    def get_clipboard_data(this : IRichEditOleCallback*, lpchrg : Win32cr::UI::Controls::RichEdit::CHARRANGE*, reco : UInt32, lplpdataobj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clipboard_data.call(this, lpchrg, reco, lplpdataobj)
    end
    def get_drag_drop_effect(this : IRichEditOleCallback*, fDrag : Win32cr::Foundation::BOOL, grfKeyState : UInt32, pdwEffect : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drag_drop_effect.call(this, fDrag, grfKeyState, pdwEffect)
    end
    def get_context_menu(this : IRichEditOleCallback*, seltype : Win32cr::UI::Controls::RichEdit::RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE, lpoleobj : Void*, lpchrg : Win32cr::UI::Controls::RichEdit::CHARRANGE*, lphmenu : Win32cr::UI::WindowsAndMessaging::HMENU*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_menu.call(this, seltype, lpoleobj, lpchrg, lphmenu)
    end

  end

  @[Extern]
  record ITextDocumentVtbl,
    query_interface : Proc(ITextDocument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextDocument*, UInt32),
    release : Proc(ITextDocument*, UInt32),
    get_type_info_count : Proc(ITextDocument*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextDocument*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextDocument*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextDocument*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name : Proc(ITextDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_story_count : Proc(ITextDocument*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_ranges : Proc(ITextDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_saved : Proc(ITextDocument*, Int32*, Win32cr::Foundation::HRESULT),
    set_saved : Proc(ITextDocument*, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    get_default_tab_stop : Proc(ITextDocument*, Float32*, Win32cr::Foundation::HRESULT),
    set_default_tab_stop : Proc(ITextDocument*, Float32, Win32cr::Foundation::HRESULT),
    new : Proc(ITextDocument*, Win32cr::Foundation::HRESULT),
    open : Proc(ITextDocument*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    save : Proc(ITextDocument*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    freeze : Proc(ITextDocument*, Int32*, Win32cr::Foundation::HRESULT),
    unfreeze : Proc(ITextDocument*, Int32*, Win32cr::Foundation::HRESULT),
    begin_edit_collection : Proc(ITextDocument*, Win32cr::Foundation::HRESULT),
    end_edit_collection : Proc(ITextDocument*, Win32cr::Foundation::HRESULT),
    undo : Proc(ITextDocument*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    redo : Proc(ITextDocument*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    range : Proc(ITextDocument*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextDocument*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c0-a1df-11ce-8098-00aa0047be5d")]
  record ITextDocument, lpVtbl : ITextDocumentVtbl* do
    GUID = LibC::GUID.new(0x8cc497c0_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextDocument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextDocument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextDocument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextDocument*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextDocument*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextDocument*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextDocument*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_name(this : ITextDocument*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pName)
    end
    def get_selection(this : ITextDocument*, ppSel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ppSel)
    end
    def get_story_count(this : ITextDocument*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_count.call(this, pCount)
    end
    def get_story_ranges(this : ITextDocument*, ppStories : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_ranges.call(this, ppStories)
    end
    def get_saved(this : ITextDocument*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_saved.call(this, pValue)
    end
    def set_saved(this : ITextDocument*, value : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saved.call(this, value)
    end
    def get_default_tab_stop(this : ITextDocument*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_tab_stop.call(this, pValue)
    end
    def set_default_tab_stop(this : ITextDocument*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_tab_stop.call(this, value)
    end
    def new(this : ITextDocument*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new.call(this)
    end
    def open(this : ITextDocument*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pVar, flags, code_page)
    end
    def save(this : ITextDocument*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pVar, flags, code_page)
    end
    def freeze(this : ITextDocument*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.freeze.call(this, pCount)
    end
    def unfreeze(this : ITextDocument*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unfreeze.call(this, pCount)
    end
    def begin_edit_collection(this : ITextDocument*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_edit_collection.call(this)
    end
    def end_edit_collection(this : ITextDocument*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_edit_collection.call(this)
    end
    def undo(this : ITextDocument*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.undo.call(this, count, pCount)
    end
    def redo(this : ITextDocument*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redo.call(this, count, pCount)
    end
    def range(this : ITextDocument*, cpActive : Int32, cpAnchor : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range.call(this, cpActive, cpAnchor, ppRange)
    end
    def range_from_point(this : ITextDocument*, x : Int32, y : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, x, y, ppRange)
    end

  end

  @[Extern]
  record ITextRangeVtbl,
    query_interface : Proc(ITextRange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextRange*, UInt32),
    release : Proc(ITextRange*, UInt32),
    get_type_info_count : Proc(ITextRange*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextRange*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextRange*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextRange*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextRange*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextRange*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_char : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    set_char : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextRange*, Void**, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextRange*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextRange*, Void*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    set_start : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    set_end : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    get_font : Proc(ITextRange*, Void**, Win32cr::Foundation::HRESULT),
    set_font : Proc(ITextRange*, Void*, Win32cr::Foundation::HRESULT),
    get_para : Proc(ITextRange*, Void**, Win32cr::Foundation::HRESULT),
    set_para : Proc(ITextRange*, Void*, Win32cr::Foundation::HRESULT),
    get_story_length : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_type : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    expand : Proc(ITextRange*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITextRange*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    set_index : Proc(ITextRange*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_range : Proc(ITextRange*, Int32, Int32, Win32cr::Foundation::HRESULT),
    in_range : Proc(ITextRange*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    in_story : Proc(ITextRange*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextRange*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextRange*, Win32cr::Foundation::HRESULT),
    start_of : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_of : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_while : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_while : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_while : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_until : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_until : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_until : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextRange*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_start : Proc(ITextRange*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_end : Proc(ITextRange*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    delete : Proc(ITextRange*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    cut : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    copy : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    paste : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    can_paste : Proc(ITextRange*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    can_edit : Proc(ITextRange*, Int32*, Win32cr::Foundation::HRESULT),
    change_case : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    get_point : Proc(ITextRange*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_point : Proc(ITextRange*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextRange*, Int32, Win32cr::Foundation::HRESULT),
    get_embedded_object : Proc(ITextRange*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c2-a1df-11ce-8098-00aa0047be5d")]
  record ITextRange, lpVtbl : ITextRangeVtbl* do
    GUID = LibC::GUID.new(0x8cc497c2_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextRange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextRange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextRange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextRange*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextRange*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextRange*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextRange*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_text(this : ITextRange*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : ITextRange*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, bstr)
    end
    def get_char(this : ITextRange*, pChar : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char.call(this, pChar)
    end
    def set_char(this : ITextRange*, char : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_char.call(this, char)
    end
    def get_duplicate(this : ITextRange*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppRange)
    end
    def get_formatted_text(this : ITextRange*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ppRange)
    end
    def set_formatted_text(this : ITextRange*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pRange)
    end
    def get_start(this : ITextRange*, pcpFirst : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, pcpFirst)
    end
    def set_start(this : ITextRange*, cpFirst : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start.call(this, cpFirst)
    end
    def get_end(this : ITextRange*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, pcpLim)
    end
    def set_end(this : ITextRange*, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_end.call(this, cpLim)
    end
    def get_font(this : ITextRange*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font.call(this, ppFont)
    end
    def set_font(this : ITextRange*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font.call(this, pFont)
    end
    def get_para(this : ITextRange*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para.call(this, ppPara)
    end
    def set_para(this : ITextRange*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para.call(this, pPara)
    end
    def get_story_length(this : ITextRange*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_length.call(this, pCount)
    end
    def get_story_type(this : ITextRange*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_type.call(this, pValue)
    end
    def collapse(this : ITextRange*, bStart : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, bStart)
    end
    def expand(this : ITextRange*, unit : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, unit, pDelta)
    end
    def get_index(this : ITextRange*, unit : Int32, pIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, unit, pIndex)
    end
    def set_index(this : ITextRange*, unit : Int32, index : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_index.call(this, unit, index, extend__)
    end
    def set_range(this : ITextRange*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cpAnchor, cpActive)
    end
    def in_range(this : ITextRange*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_range.call(this, pRange, pValue)
    end
    def in_story(this : ITextRange*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_story.call(this, pRange, pValue)
    end
    def is_equal(this : ITextRange*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pRange, pValue)
    end
    def select__(this : ITextRange*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def start_of(this : ITextRange*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_of.call(this, unit, extend__, pDelta)
    end
    def end_of(this : ITextRange*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_of.call(this, unit, extend__, pDelta)
    end
    def move(this : ITextRange*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pDelta)
    end
    def move_start(this : ITextRange*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start.call(this, unit, count, pDelta)
    end
    def move_end(this : ITextRange*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end.call(this, unit, count, pDelta)
    end
    def move_while(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_while.call(this, cset, count, pDelta)
    end
    def move_start_while(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_while.call(this, cset, count, pDelta)
    end
    def move_end_while(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_while.call(this, cset, count, pDelta)
    end
    def move_until(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_until.call(this, cset, count, pDelta)
    end
    def move_start_until(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_until.call(this, cset, count, pDelta)
    end
    def move_end_until(this : ITextRange*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_until.call(this, cset, count, pDelta)
    end
    def find_text(this : ITextRange*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, bstr, count, flags, pLength)
    end
    def find_text_start(this : ITextRange*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_start.call(this, bstr, count, flags, pLength)
    end
    def find_text_end(this : ITextRange*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_end.call(this, bstr, count, flags, pLength)
    end
    def delete(this : ITextRange*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, unit, count, pDelta)
    end
    def cut(this : ITextRange*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cut.call(this, pVar)
    end
    def copy(this : ITextRange*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pVar)
    end
    def paste(this : ITextRange*, pVar : Win32cr::System::Com::VARIANT*, format : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this, pVar, format)
    end
    def can_paste(this : ITextRange*, pVar : Win32cr::System::Com::VARIANT*, format : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_paste.call(this, pVar, format, pValue)
    end
    def can_edit(this : ITextRange*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_edit.call(this, pValue)
    end
    def change_case(this : ITextRange*, type__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_case.call(this, type__)
    end
    def get_point(this : ITextRange*, type__ : Int32, px : Int32*, py : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_point.call(this, type__, px, py)
    end
    def set_point(this : ITextRange*, x : Int32, y : Int32, type__ : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_point.call(this, x, y, type__, extend__)
    end
    def scroll_into_view(this : ITextRange*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, value)
    end
    def get_embedded_object(this : ITextRange*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_object.call(this, ppObject)
    end

  end

  @[Extern]
  record ITextSelectionVtbl,
    query_interface : Proc(ITextSelection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextSelection*, UInt32),
    release : Proc(ITextSelection*, UInt32),
    get_type_info_count : Proc(ITextSelection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextSelection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextSelection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextSelection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextSelection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextSelection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_char : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    set_char : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextSelection*, Void**, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextSelection*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextSelection*, Void*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    set_start : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    set_end : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_font : Proc(ITextSelection*, Void**, Win32cr::Foundation::HRESULT),
    set_font : Proc(ITextSelection*, Void*, Win32cr::Foundation::HRESULT),
    get_para : Proc(ITextSelection*, Void**, Win32cr::Foundation::HRESULT),
    set_para : Proc(ITextSelection*, Void*, Win32cr::Foundation::HRESULT),
    get_story_length : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_type : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    expand : Proc(ITextSelection*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITextSelection*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    set_index : Proc(ITextSelection*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_range : Proc(ITextSelection*, Int32, Int32, Win32cr::Foundation::HRESULT),
    in_range : Proc(ITextSelection*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    in_story : Proc(ITextSelection*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextSelection*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextSelection*, Win32cr::Foundation::HRESULT),
    start_of : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_of : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_while : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_while : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_while : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_until : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_until : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_until : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextSelection*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_start : Proc(ITextSelection*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_end : Proc(ITextSelection*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    delete : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    cut : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    copy : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    paste : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    can_paste : Proc(ITextSelection*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    can_edit : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    change_case : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_point : Proc(ITextSelection*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_point : Proc(ITextSelection*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_embedded_object : Proc(ITextSelection*, Void**, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(ITextSelection*, Int32, Win32cr::Foundation::HRESULT),
    get_type : Proc(ITextSelection*, Int32*, Win32cr::Foundation::HRESULT),
    move_left : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_right : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_up : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_down : Proc(ITextSelection*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    home_key : Proc(ITextSelection*, Win32cr::UI::Controls::RichEdit::Tomconstants, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_key : Proc(ITextSelection*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    type_text : Proc(ITextSelection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c1-a1df-11ce-8098-00aa0047be5d")]
  record ITextSelection, lpVtbl : ITextSelectionVtbl* do
    GUID = LibC::GUID.new(0x8cc497c1_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextSelection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextSelection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextSelection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextSelection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextSelection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextSelection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextSelection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_text(this : ITextSelection*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : ITextSelection*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, bstr)
    end
    def get_char(this : ITextSelection*, pChar : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char.call(this, pChar)
    end
    def set_char(this : ITextSelection*, char : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_char.call(this, char)
    end
    def get_duplicate(this : ITextSelection*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppRange)
    end
    def get_formatted_text(this : ITextSelection*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ppRange)
    end
    def set_formatted_text(this : ITextSelection*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pRange)
    end
    def get_start(this : ITextSelection*, pcpFirst : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, pcpFirst)
    end
    def set_start(this : ITextSelection*, cpFirst : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start.call(this, cpFirst)
    end
    def get_end(this : ITextSelection*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, pcpLim)
    end
    def set_end(this : ITextSelection*, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_end.call(this, cpLim)
    end
    def get_font(this : ITextSelection*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font.call(this, ppFont)
    end
    def set_font(this : ITextSelection*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font.call(this, pFont)
    end
    def get_para(this : ITextSelection*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para.call(this, ppPara)
    end
    def set_para(this : ITextSelection*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para.call(this, pPara)
    end
    def get_story_length(this : ITextSelection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_length.call(this, pCount)
    end
    def get_story_type(this : ITextSelection*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_type.call(this, pValue)
    end
    def collapse(this : ITextSelection*, bStart : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, bStart)
    end
    def expand(this : ITextSelection*, unit : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, unit, pDelta)
    end
    def get_index(this : ITextSelection*, unit : Int32, pIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, unit, pIndex)
    end
    def set_index(this : ITextSelection*, unit : Int32, index : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_index.call(this, unit, index, extend__)
    end
    def set_range(this : ITextSelection*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cpAnchor, cpActive)
    end
    def in_range(this : ITextSelection*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_range.call(this, pRange, pValue)
    end
    def in_story(this : ITextSelection*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_story.call(this, pRange, pValue)
    end
    def is_equal(this : ITextSelection*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pRange, pValue)
    end
    def select__(this : ITextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def start_of(this : ITextSelection*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_of.call(this, unit, extend__, pDelta)
    end
    def end_of(this : ITextSelection*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_of.call(this, unit, extend__, pDelta)
    end
    def move(this : ITextSelection*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pDelta)
    end
    def move_start(this : ITextSelection*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start.call(this, unit, count, pDelta)
    end
    def move_end(this : ITextSelection*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end.call(this, unit, count, pDelta)
    end
    def move_while(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_while.call(this, cset, count, pDelta)
    end
    def move_start_while(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_while.call(this, cset, count, pDelta)
    end
    def move_end_while(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_while.call(this, cset, count, pDelta)
    end
    def move_until(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_until.call(this, cset, count, pDelta)
    end
    def move_start_until(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_until.call(this, cset, count, pDelta)
    end
    def move_end_until(this : ITextSelection*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_until.call(this, cset, count, pDelta)
    end
    def find_text(this : ITextSelection*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, bstr, count, flags, pLength)
    end
    def find_text_start(this : ITextSelection*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_start.call(this, bstr, count, flags, pLength)
    end
    def find_text_end(this : ITextSelection*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_end.call(this, bstr, count, flags, pLength)
    end
    def delete(this : ITextSelection*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, unit, count, pDelta)
    end
    def cut(this : ITextSelection*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cut.call(this, pVar)
    end
    def copy(this : ITextSelection*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pVar)
    end
    def paste(this : ITextSelection*, pVar : Win32cr::System::Com::VARIANT*, format : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this, pVar, format)
    end
    def can_paste(this : ITextSelection*, pVar : Win32cr::System::Com::VARIANT*, format : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_paste.call(this, pVar, format, pValue)
    end
    def can_edit(this : ITextSelection*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_edit.call(this, pValue)
    end
    def change_case(this : ITextSelection*, type__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_case.call(this, type__)
    end
    def get_point(this : ITextSelection*, type__ : Int32, px : Int32*, py : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_point.call(this, type__, px, py)
    end
    def set_point(this : ITextSelection*, x : Int32, y : Int32, type__ : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_point.call(this, x, y, type__, extend__)
    end
    def scroll_into_view(this : ITextSelection*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, value)
    end
    def get_embedded_object(this : ITextSelection*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_object.call(this, ppObject)
    end
    def get_flags(this : ITextSelection*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end
    def set_flags(this : ITextSelection*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end
    def get_type(this : ITextSelection*, pType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pType)
    end
    def move_left(this : ITextSelection*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_left.call(this, unit, count, extend__, pDelta)
    end
    def move_right(this : ITextSelection*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_right.call(this, unit, count, extend__, pDelta)
    end
    def move_up(this : ITextSelection*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_up.call(this, unit, count, extend__, pDelta)
    end
    def move_down(this : ITextSelection*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_down.call(this, unit, count, extend__, pDelta)
    end
    def home_key(this : ITextSelection*, unit : Win32cr::UI::Controls::RichEdit::Tomconstants, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.home_key.call(this, unit, extend__, pDelta)
    end
    def end_key(this : ITextSelection*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_key.call(this, unit, extend__, pDelta)
    end
    def type_text(this : ITextSelection*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.type_text.call(this, bstr)
    end

  end

  @[Extern]
  record ITextFontVtbl,
    query_interface : Proc(ITextFont*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextFont*, UInt32),
    release : Proc(ITextFont*, UInt32),
    get_type_info_count : Proc(ITextFont*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextFont*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextFont*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextFont*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextFont*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate : Proc(ITextFont*, Void*, Win32cr::Foundation::HRESULT),
    can_change : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextFont*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITextFont*, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    get_style : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_style : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_all_caps : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_all_caps : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_animation : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_animation : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_back_color : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_back_color : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_bold : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_bold : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_emboss : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_emboss : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_fore_color : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_fore_color : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_hidden : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_hidden : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_engrave : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_engrave : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_italic : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_italic : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_kerning : Proc(ITextFont*, Float32*, Win32cr::Foundation::HRESULT),
    set_kerning : Proc(ITextFont*, Float32, Win32cr::Foundation::HRESULT),
    get_language_id : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_language_id : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_name : Proc(ITextFont*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(ITextFont*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_outline : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_outline : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_position : Proc(ITextFont*, Float32*, Win32cr::Foundation::HRESULT),
    set_position : Proc(ITextFont*, Float32, Win32cr::Foundation::HRESULT),
    get_protected : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_protected : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_shadow : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_shadow : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_size : Proc(ITextFont*, Float32*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ITextFont*, Float32, Win32cr::Foundation::HRESULT),
    get_small_caps : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_small_caps : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_spacing : Proc(ITextFont*, Float32*, Win32cr::Foundation::HRESULT),
    set_spacing : Proc(ITextFont*, Float32, Win32cr::Foundation::HRESULT),
    get_strike_through : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_strike_through : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_subscript : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_subscript : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_superscript : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_superscript : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_underline : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_underline : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT),
    get_weight : Proc(ITextFont*, Int32*, Win32cr::Foundation::HRESULT),
    set_weight : Proc(ITextFont*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c3-a1df-11ce-8098-00aa0047be5d")]
  record ITextFont, lpVtbl : ITextFontVtbl* do
    GUID = LibC::GUID.new(0x8cc497c3_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextFont*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextFont*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextFont*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextFont*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextFont*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextFont*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextFont*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_duplicate(this : ITextFont*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppFont)
    end
    def set_duplicate(this : ITextFont*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate.call(this, pFont)
    end
    def can_change(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_change.call(this, pValue)
    end
    def is_equal(this : ITextFont*, pFont : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pFont, pValue)
    end
    def reset(this : ITextFont*, value : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, value)
    end
    def get_style(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_style.call(this, pValue)
    end
    def set_style(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_style.call(this, value)
    end
    def get_all_caps(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_caps.call(this, pValue)
    end
    def set_all_caps(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_caps.call(this, value)
    end
    def get_animation(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_animation.call(this, pValue)
    end
    def set_animation(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_animation.call(this, value)
    end
    def get_back_color(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_back_color.call(this, pValue)
    end
    def set_back_color(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_back_color.call(this, value)
    end
    def get_bold(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bold.call(this, pValue)
    end
    def set_bold(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bold.call(this, value)
    end
    def get_emboss(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_emboss.call(this, pValue)
    end
    def set_emboss(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_emboss.call(this, value)
    end
    def get_fore_color(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fore_color.call(this, pValue)
    end
    def set_fore_color(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fore_color.call(this, value)
    end
    def get_hidden(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hidden.call(this, pValue)
    end
    def set_hidden(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hidden.call(this, value)
    end
    def get_engrave(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_engrave.call(this, pValue)
    end
    def set_engrave(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_engrave.call(this, value)
    end
    def get_italic(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_italic.call(this, pValue)
    end
    def set_italic(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_italic.call(this, value)
    end
    def get_kerning(this : ITextFont*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_kerning.call(this, pValue)
    end
    def set_kerning(this : ITextFont*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_kerning.call(this, value)
    end
    def get_language_id(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_id.call(this, pValue)
    end
    def set_language_id(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language_id.call(this, value)
    end
    def get_name(this : ITextFont*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstr)
    end
    def set_name(this : ITextFont*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, bstr)
    end
    def get_outline(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_outline.call(this, pValue)
    end
    def set_outline(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_outline.call(this, value)
    end
    def get_position(this : ITextFont*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position.call(this, pValue)
    end
    def set_position(this : ITextFont*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position.call(this, value)
    end
    def get_protected(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protected.call(this, pValue)
    end
    def set_protected(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_protected.call(this, value)
    end
    def get_shadow(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shadow.call(this, pValue)
    end
    def set_shadow(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_shadow.call(this, value)
    end
    def get_size(this : ITextFont*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pValue)
    end
    def set_size(this : ITextFont*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, value)
    end
    def get_small_caps(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_small_caps.call(this, pValue)
    end
    def set_small_caps(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_small_caps.call(this, value)
    end
    def get_spacing(this : ITextFont*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spacing.call(this, pValue)
    end
    def set_spacing(this : ITextFont*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spacing.call(this, value)
    end
    def get_strike_through(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_strike_through.call(this, pValue)
    end
    def set_strike_through(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_strike_through.call(this, value)
    end
    def get_subscript(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscript.call(this, pValue)
    end
    def set_subscript(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_subscript.call(this, value)
    end
    def get_superscript(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_superscript.call(this, pValue)
    end
    def set_superscript(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_superscript.call(this, value)
    end
    def get_underline(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_underline.call(this, pValue)
    end
    def set_underline(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_underline.call(this, value)
    end
    def get_weight(this : ITextFont*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_weight.call(this, pValue)
    end
    def set_weight(this : ITextFont*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_weight.call(this, value)
    end

  end

  @[Extern]
  record ITextParaVtbl,
    query_interface : Proc(ITextPara*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextPara*, UInt32),
    release : Proc(ITextPara*, UInt32),
    get_type_info_count : Proc(ITextPara*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextPara*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextPara*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextPara*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextPara*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate : Proc(ITextPara*, Void*, Win32cr::Foundation::HRESULT),
    can_change : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextPara*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_style : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_style : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_alignment : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_alignment : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_hyphenation : Proc(ITextPara*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_hyphenation : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_first_line_indent : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    get_keep_together : Proc(ITextPara*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_keep_together : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_keep_with_next : Proc(ITextPara*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_keep_with_next : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_left_indent : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    get_line_spacing : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    get_line_spacing_rule : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    get_list_alignment : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_alignment : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_list_level_index : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_level_index : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_list_start : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_start : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_list_tab : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    set_list_tab : Proc(ITextPara*, Float32, Win32cr::Foundation::HRESULT),
    get_list_type : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_type : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_no_line_number : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_no_line_number : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_page_break_before : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_page_break_before : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_right_indent : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    set_right_indent : Proc(ITextPara*, Float32, Win32cr::Foundation::HRESULT),
    set_indents : Proc(ITextPara*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    set_line_spacing : Proc(ITextPara*, Int32, Float32, Win32cr::Foundation::HRESULT),
    get_space_after : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    set_space_after : Proc(ITextPara*, Float32, Win32cr::Foundation::HRESULT),
    get_space_before : Proc(ITextPara*, Float32*, Win32cr::Foundation::HRESULT),
    set_space_before : Proc(ITextPara*, Float32, Win32cr::Foundation::HRESULT),
    get_widow_control : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    set_widow_control : Proc(ITextPara*, Int32, Win32cr::Foundation::HRESULT),
    get_tab_count : Proc(ITextPara*, Int32*, Win32cr::Foundation::HRESULT),
    add_tab : Proc(ITextPara*, Float32, Int32, Int32, Win32cr::Foundation::HRESULT),
    clear_all_tabs : Proc(ITextPara*, Win32cr::Foundation::HRESULT),
    delete_tab : Proc(ITextPara*, Float32, Win32cr::Foundation::HRESULT),
    get_tab : Proc(ITextPara*, Int32, Float32*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c4-a1df-11ce-8098-00aa0047be5d")]
  record ITextPara, lpVtbl : ITextParaVtbl* do
    GUID = LibC::GUID.new(0x8cc497c4_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextPara*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextPara*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextPara*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextPara*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextPara*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextPara*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextPara*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_duplicate(this : ITextPara*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppPara)
    end
    def set_duplicate(this : ITextPara*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate.call(this, pPara)
    end
    def can_change(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_change.call(this, pValue)
    end
    def is_equal(this : ITextPara*, pPara : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pPara, pValue)
    end
    def reset(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, value)
    end
    def get_style(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_style.call(this, pValue)
    end
    def set_style(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_style.call(this, value)
    end
    def get_alignment(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alignment.call(this, pValue)
    end
    def set_alignment(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alignment.call(this, value)
    end
    def get_hyphenation(this : ITextPara*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyphenation.call(this, pValue)
    end
    def set_hyphenation(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyphenation.call(this, value)
    end
    def get_first_line_indent(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_line_indent.call(this, pValue)
    end
    def get_keep_together(this : ITextPara*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_together.call(this, pValue)
    end
    def set_keep_together(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_together.call(this, value)
    end
    def get_keep_with_next(this : ITextPara*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_with_next.call(this, pValue)
    end
    def set_keep_with_next(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_with_next.call(this, value)
    end
    def get_left_indent(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_left_indent.call(this, pValue)
    end
    def get_line_spacing(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_spacing.call(this, pValue)
    end
    def get_line_spacing_rule(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_spacing_rule.call(this, pValue)
    end
    def get_list_alignment(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_alignment.call(this, pValue)
    end
    def set_list_alignment(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_alignment.call(this, value)
    end
    def get_list_level_index(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_level_index.call(this, pValue)
    end
    def set_list_level_index(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_level_index.call(this, value)
    end
    def get_list_start(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_start.call(this, pValue)
    end
    def set_list_start(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_start.call(this, value)
    end
    def get_list_tab(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_tab.call(this, pValue)
    end
    def set_list_tab(this : ITextPara*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_tab.call(this, value)
    end
    def get_list_type(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_type.call(this, pValue)
    end
    def set_list_type(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_type.call(this, value)
    end
    def get_no_line_number(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_line_number.call(this, pValue)
    end
    def set_no_line_number(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_line_number.call(this, value)
    end
    def get_page_break_before(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_break_before.call(this, pValue)
    end
    def set_page_break_before(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_break_before.call(this, value)
    end
    def get_right_indent(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_right_indent.call(this, pValue)
    end
    def set_right_indent(this : ITextPara*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_right_indent.call(this, value)
    end
    def set_indents(this : ITextPara*, first : Float32, left : Float32, right : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_indents.call(this, first, left, right)
    end
    def set_line_spacing(this : ITextPara*, rule : Int32, spacing : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_line_spacing.call(this, rule, spacing)
    end
    def get_space_after(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_after.call(this, pValue)
    end
    def set_space_after(this : ITextPara*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_space_after.call(this, value)
    end
    def get_space_before(this : ITextPara*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_before.call(this, pValue)
    end
    def set_space_before(this : ITextPara*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_space_before.call(this, value)
    end
    def get_widow_control(this : ITextPara*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_widow_control.call(this, pValue)
    end
    def set_widow_control(this : ITextPara*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_widow_control.call(this, value)
    end
    def get_tab_count(this : ITextPara*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tab_count.call(this, pCount)
    end
    def add_tab(this : ITextPara*, tbPos : Float32, tbAlign : Int32, tbLeader : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_tab.call(this, tbPos, tbAlign, tbLeader)
    end
    def clear_all_tabs(this : ITextPara*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_all_tabs.call(this)
    end
    def delete_tab(this : ITextPara*, tbPos : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_tab.call(this, tbPos)
    end
    def get_tab(this : ITextPara*, iTab : Int32, ptbPos : Float32*, ptbAlign : Int32*, ptbLeader : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tab.call(this, iTab, ptbPos, ptbAlign, ptbLeader)
    end

  end

  @[Extern]
  record ITextStoryRangesVtbl,
    query_interface : Proc(ITextStoryRanges*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoryRanges*, UInt32),
    release : Proc(ITextStoryRanges*, UInt32),
    get_type_info_count : Proc(ITextStoryRanges*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextStoryRanges*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextStoryRanges*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextStoryRanges*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    _new_enum : Proc(ITextStoryRanges*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(ITextStoryRanges*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextStoryRanges*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cc497c5-a1df-11ce-8098-00aa0047be5d")]
  record ITextStoryRanges, lpVtbl : ITextStoryRangesVtbl* do
    GUID = LibC::GUID.new(0x8cc497c5_u32, 0xa1df_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xbe_u8, 0x5d_u8])
    def query_interface(this : ITextStoryRanges*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoryRanges*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoryRanges*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextStoryRanges*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextStoryRanges*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextStoryRanges*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextStoryRanges*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def _new_enum(this : ITextStoryRanges*, ppunkEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value._new_enum.call(this, ppunkEnum)
    end
    def item(this : ITextStoryRanges*, index : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ppRange)
    end
    def get_count(this : ITextStoryRanges*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end

  end

  @[Extern]
  record ITextDocument2Vtbl,
    query_interface : Proc(ITextDocument2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextDocument2*, UInt32),
    release : Proc(ITextDocument2*, UInt32),
    get_type_info_count : Proc(ITextDocument2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextDocument2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextDocument2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextDocument2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name : Proc(ITextDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_story_count : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_ranges : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_saved : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    set_saved : Proc(ITextDocument2*, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    get_default_tab_stop : Proc(ITextDocument2*, Float32*, Win32cr::Foundation::HRESULT),
    set_default_tab_stop : Proc(ITextDocument2*, Float32, Win32cr::Foundation::HRESULT),
    new : Proc(ITextDocument2*, Win32cr::Foundation::HRESULT),
    open : Proc(ITextDocument2*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    save : Proc(ITextDocument2*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    freeze : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    unfreeze : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    begin_edit_collection : Proc(ITextDocument2*, Win32cr::Foundation::HRESULT),
    end_edit_collection : Proc(ITextDocument2*, Win32cr::Foundation::HRESULT),
    undo : Proc(ITextDocument2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    redo : Proc(ITextDocument2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    range : Proc(ITextDocument2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextDocument2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_caret_type : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    set_caret_type : Proc(ITextDocument2*, Int32, Win32cr::Foundation::HRESULT),
    get_displays : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_document_font : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    set_document_font : Proc(ITextDocument2*, Void*, Win32cr::Foundation::HRESULT),
    get_document_para : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    set_document_para : Proc(ITextDocument2*, Void*, Win32cr::Foundation::HRESULT),
    get_east_asian_flags : Proc(ITextDocument2*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    get_generator : Proc(ITextDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_ime_in_progress : Proc(ITextDocument2*, Int32, Win32cr::Foundation::HRESULT),
    get_notification_mode : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    set_notification_mode : Proc(ITextDocument2*, Int32, Win32cr::Foundation::HRESULT),
    get_selection2 : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_story_ranges2 : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_typography_options : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    get_version : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    get_window : Proc(ITextDocument2*, Int64*, Win32cr::Foundation::HRESULT),
    attach_msg_filter : Proc(ITextDocument2*, Void*, Win32cr::Foundation::HRESULT),
    check_text_limit : Proc(ITextDocument2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_call_manager : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_client_rect : Proc(ITextDocument2*, Win32cr::UI::Controls::RichEdit::Tomconstants, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_effect_color : Proc(ITextDocument2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_imm_context : Proc(ITextDocument2*, Int64*, Win32cr::Foundation::HRESULT),
    get_preferred_font : Proc(ITextDocument2*, Int32, Int32, Int32, Int32, Int32, Win32cr::Foundation::BSTR*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextDocument2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_strings : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    notify : Proc(ITextDocument2*, Int32, Win32cr::Foundation::HRESULT),
    range2 : Proc(ITextDocument2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    range_from_point2 : Proc(ITextDocument2*, Int32, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    release_call_manager : Proc(ITextDocument2*, Void*, Win32cr::Foundation::HRESULT),
    release_imm_context : Proc(ITextDocument2*, Int64, Win32cr::Foundation::HRESULT),
    set_effect_color : Proc(ITextDocument2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextDocument2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_typography_options : Proc(ITextDocument2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    sys_beep : Proc(ITextDocument2*, Win32cr::Foundation::HRESULT),
    update : Proc(ITextDocument2*, Int32, Win32cr::Foundation::HRESULT),
    update_window : Proc(ITextDocument2*, Win32cr::Foundation::HRESULT),
    get_math_properties : Proc(ITextDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    set_math_properties : Proc(ITextDocument2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_active_story : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    set_active_story : Proc(ITextDocument2*, Void*, Win32cr::Foundation::HRESULT),
    get_main_story : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_new_story : Proc(ITextDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_story : Proc(ITextDocument2*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e0-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextDocument2, lpVtbl : ITextDocument2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e0_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextDocument2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextDocument2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextDocument2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextDocument2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextDocument2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextDocument2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextDocument2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_name(this : ITextDocument2*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pName)
    end
    def get_selection(this : ITextDocument2*, ppSel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ppSel)
    end
    def get_story_count(this : ITextDocument2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_count.call(this, pCount)
    end
    def get_story_ranges(this : ITextDocument2*, ppStories : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_ranges.call(this, ppStories)
    end
    def get_saved(this : ITextDocument2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_saved.call(this, pValue)
    end
    def set_saved(this : ITextDocument2*, value : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saved.call(this, value)
    end
    def get_default_tab_stop(this : ITextDocument2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_tab_stop.call(this, pValue)
    end
    def set_default_tab_stop(this : ITextDocument2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_tab_stop.call(this, value)
    end
    def new(this : ITextDocument2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new.call(this)
    end
    def open(this : ITextDocument2*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pVar, flags, code_page)
    end
    def save(this : ITextDocument2*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pVar, flags, code_page)
    end
    def freeze(this : ITextDocument2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.freeze.call(this, pCount)
    end
    def unfreeze(this : ITextDocument2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unfreeze.call(this, pCount)
    end
    def begin_edit_collection(this : ITextDocument2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_edit_collection.call(this)
    end
    def end_edit_collection(this : ITextDocument2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_edit_collection.call(this)
    end
    def undo(this : ITextDocument2*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.undo.call(this, count, pCount)
    end
    def redo(this : ITextDocument2*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redo.call(this, count, pCount)
    end
    def range(this : ITextDocument2*, cpActive : Int32, cpAnchor : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range.call(this, cpActive, cpAnchor, ppRange)
    end
    def range_from_point(this : ITextDocument2*, x : Int32, y : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, x, y, ppRange)
    end
    def get_caret_type(this : ITextDocument2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caret_type.call(this, pValue)
    end
    def set_caret_type(this : ITextDocument2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_caret_type.call(this, value)
    end
    def get_displays(this : ITextDocument2*, ppDisplays : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_displays.call(this, ppDisplays)
    end
    def get_document_font(this : ITextDocument2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_font.call(this, ppFont)
    end
    def set_document_font(this : ITextDocument2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_font.call(this, pFont)
    end
    def get_document_para(this : ITextDocument2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_para.call(this, ppPara)
    end
    def set_document_para(this : ITextDocument2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_para.call(this, pPara)
    end
    def get_east_asian_flags(this : ITextDocument2*, pFlags : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_east_asian_flags.call(this, pFlags)
    end
    def get_generator(this : ITextDocument2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generator.call(this, pbstr)
    end
    def set_ime_in_progress(this : ITextDocument2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_ime_in_progress.call(this, value)
    end
    def get_notification_mode(this : ITextDocument2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notification_mode.call(this, pValue)
    end
    def set_notification_mode(this : ITextDocument2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_mode.call(this, value)
    end
    def get_selection2(this : ITextDocument2*, ppSel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection2.call(this, ppSel)
    end
    def get_story_ranges2(this : ITextDocument2*, ppStories : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_ranges2.call(this, ppStories)
    end
    def get_typography_options(this : ITextDocument2*, pOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_typography_options.call(this, pOptions)
    end
    def get_version(this : ITextDocument2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pValue)
    end
    def get_window(this : ITextDocument2*, pHwnd : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, pHwnd)
    end
    def attach_msg_filter(this : ITextDocument2*, pFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_msg_filter.call(this, pFilter)
    end
    def check_text_limit(this : ITextDocument2*, cch : Int32, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_text_limit.call(this, cch, pcch)
    end
    def get_call_manager(this : ITextDocument2*, ppVoid : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_call_manager.call(this, ppVoid)
    end
    def get_client_rect(this : ITextDocument2*, type__ : Win32cr::UI::Controls::RichEdit::Tomconstants, pLeft : Int32*, pTop : Int32*, pRight : Int32*, pBottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_rect.call(this, type__, pLeft, pTop, pRight, pBottom)
    end
    def get_effect_color(this : ITextDocument2*, index : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_color.call(this, index, pValue)
    end
    def get_imm_context(this : ITextDocument2*, pContext : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_imm_context.call(this, pContext)
    end
    def get_preferred_font(this : ITextDocument2*, cp : Int32, char_rep : Int32, options : Int32, curCharRep : Int32, curFontSize : Int32, pbstr : Win32cr::Foundation::BSTR*, pPitchAndFamily : Int32*, pNewFontSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_font.call(this, cp, char_rep, options, curCharRep, curFontSize, pbstr, pPitchAndFamily, pNewFontSize)
    end
    def get_property(this : ITextDocument2*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def get_strings(this : ITextDocument2*, ppStrs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_strings.call(this, ppStrs)
    end
    def notify(this : ITextDocument2*, notify : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, notify)
    end
    def range2(this : ITextDocument2*, cpActive : Int32, cpAnchor : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range2.call(this, cpActive, cpAnchor, ppRange)
    end
    def range_from_point2(this : ITextDocument2*, x : Int32, y : Int32, type__ : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point2.call(this, x, y, type__, ppRange)
    end
    def release_call_manager(this : ITextDocument2*, pVoid : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_call_manager.call(this, pVoid)
    end
    def release_imm_context(this : ITextDocument2*, context : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_imm_context.call(this, context)
    end
    def set_effect_color(this : ITextDocument2*, index : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_color.call(this, index, value)
    end
    def set_property(this : ITextDocument2*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end
    def set_typography_options(this : ITextDocument2*, options : Int32, mask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_typography_options.call(this, options, mask)
    end
    def sys_beep(this : ITextDocument2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sys_beep.call(this)
    end
    def update(this : ITextDocument2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this, value)
    end
    def update_window(this : ITextDocument2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_window.call(this)
    end
    def get_math_properties(this : ITextDocument2*, pOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_math_properties.call(this, pOptions)
    end
    def set_math_properties(this : ITextDocument2*, options : Int32, mask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_math_properties.call(this, options, mask)
    end
    def get_active_story(this : ITextDocument2*, ppStory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_story.call(this, ppStory)
    end
    def set_active_story(this : ITextDocument2*, pStory : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_story.call(this, pStory)
    end
    def get_main_story(this : ITextDocument2*, ppStory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_story.call(this, ppStory)
    end
    def get_new_story(this : ITextDocument2*, ppStory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_new_story.call(this, ppStory)
    end
    def get_story(this : ITextDocument2*, index : Int32, ppStory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story.call(this, index, ppStory)
    end

  end

  @[Extern]
  record ITextRange2Vtbl,
    query_interface : Proc(ITextRange2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextRange2*, UInt32),
    release : Proc(ITextRange2*, UInt32),
    get_type_info_count : Proc(ITextRange2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextRange2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextRange2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextRange2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextRange2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_char : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    set_char : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    set_start : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    set_end : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_font : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_font : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_para : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_para : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_story_length : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_type : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    expand : Proc(ITextRange2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITextRange2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    set_index : Proc(ITextRange2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_range : Proc(ITextRange2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    in_range : Proc(ITextRange2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    in_story : Proc(ITextRange2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextRange2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextRange2*, Win32cr::Foundation::HRESULT),
    start_of : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_of : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_while : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_while : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_while : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_until : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_until : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_until : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_start : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_end : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    delete : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    cut : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    copy : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    paste : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    can_paste : Proc(ITextRange2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    can_edit : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    change_case : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_point : Proc(ITextRange2*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_point : Proc(ITextRange2*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_embedded_object : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_type : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    move_left : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_right : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_up : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_down : Proc(ITextRange2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    home_key : Proc(ITextRange2*, Win32cr::UI::Controls::RichEdit::Tomconstants, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_key : Proc(ITextRange2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    type_text : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_cch : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    get_cells : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_column : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    get_duplicate2 : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_font2 : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_font2 : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_formatted_text2 : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text2 : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_gravity : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    set_gravity : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    get_para2 : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    set_para2 : Proc(ITextRange2*, Void*, Win32cr::Foundation::HRESULT),
    get_row : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_start_para : Proc(ITextRange2*, Int32*, Win32cr::Foundation::HRESULT),
    get_table : Proc(ITextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_url : Proc(ITextRange2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_url : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_subrange : Proc(ITextRange2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    build_up_math : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    delete_subrange : Proc(ITextRange2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    find : Proc(ITextRange2*, Void*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_char2 : Proc(ITextRange2*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    get_drop_cap : Proc(ITextRange2*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_inline_object : Proc(ITextRange2*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextRange2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_rect : Proc(ITextRange2*, Int32, Int32*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_subrange : Proc(ITextRange2*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_text2 : Proc(ITextRange2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    hex_to_unicode : Proc(ITextRange2*, Win32cr::Foundation::HRESULT),
    insert_table : Proc(ITextRange2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    linearize : Proc(ITextRange2*, Int32, Win32cr::Foundation::HRESULT),
    set_active_subrange : Proc(ITextRange2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_drop_cap : Proc(ITextRange2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextRange2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_text2 : Proc(ITextRange2*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    unicode_to_hex : Proc(ITextRange2*, Win32cr::Foundation::HRESULT),
    set_inline_object : Proc(ITextRange2*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_math_function_type : Proc(ITextRange2*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    insert_image : Proc(ITextRange2*, Int32, Int32, Int32, Win32cr::Graphics::Gdi::TEXT_ALIGN_OPTIONS, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e2-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextRange2, lpVtbl : ITextRange2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e2_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextRange2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextRange2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextRange2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextRange2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextRange2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextRange2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextRange2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_text(this : ITextRange2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, bstr)
    end
    def get_char(this : ITextRange2*, pChar : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char.call(this, pChar)
    end
    def set_char(this : ITextRange2*, char : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_char.call(this, char)
    end
    def get_duplicate(this : ITextRange2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppRange)
    end
    def get_formatted_text(this : ITextRange2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ppRange)
    end
    def set_formatted_text(this : ITextRange2*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pRange)
    end
    def get_start(this : ITextRange2*, pcpFirst : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, pcpFirst)
    end
    def set_start(this : ITextRange2*, cpFirst : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start.call(this, cpFirst)
    end
    def get_end(this : ITextRange2*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, pcpLim)
    end
    def set_end(this : ITextRange2*, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_end.call(this, cpLim)
    end
    def get_font(this : ITextRange2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font.call(this, ppFont)
    end
    def set_font(this : ITextRange2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font.call(this, pFont)
    end
    def get_para(this : ITextRange2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para.call(this, ppPara)
    end
    def set_para(this : ITextRange2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para.call(this, pPara)
    end
    def get_story_length(this : ITextRange2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_length.call(this, pCount)
    end
    def get_story_type(this : ITextRange2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_type.call(this, pValue)
    end
    def collapse(this : ITextRange2*, bStart : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, bStart)
    end
    def expand(this : ITextRange2*, unit : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, unit, pDelta)
    end
    def get_index(this : ITextRange2*, unit : Int32, pIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, unit, pIndex)
    end
    def set_index(this : ITextRange2*, unit : Int32, index : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_index.call(this, unit, index, extend__)
    end
    def set_range(this : ITextRange2*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cpAnchor, cpActive)
    end
    def in_range(this : ITextRange2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_range.call(this, pRange, pValue)
    end
    def in_story(this : ITextRange2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_story.call(this, pRange, pValue)
    end
    def is_equal(this : ITextRange2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pRange, pValue)
    end
    def select__(this : ITextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def start_of(this : ITextRange2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_of.call(this, unit, extend__, pDelta)
    end
    def end_of(this : ITextRange2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_of.call(this, unit, extend__, pDelta)
    end
    def move(this : ITextRange2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pDelta)
    end
    def move_start(this : ITextRange2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start.call(this, unit, count, pDelta)
    end
    def move_end(this : ITextRange2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end.call(this, unit, count, pDelta)
    end
    def move_while(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_while.call(this, cset, count, pDelta)
    end
    def move_start_while(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_while.call(this, cset, count, pDelta)
    end
    def move_end_while(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_while.call(this, cset, count, pDelta)
    end
    def move_until(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_until.call(this, cset, count, pDelta)
    end
    def move_start_until(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_until.call(this, cset, count, pDelta)
    end
    def move_end_until(this : ITextRange2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_until.call(this, cset, count, pDelta)
    end
    def find_text(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, bstr, count, flags, pLength)
    end
    def find_text_start(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_start.call(this, bstr, count, flags, pLength)
    end
    def find_text_end(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_end.call(this, bstr, count, flags, pLength)
    end
    def delete(this : ITextRange2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, unit, count, pDelta)
    end
    def cut(this : ITextRange2*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cut.call(this, pVar)
    end
    def copy(this : ITextRange2*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pVar)
    end
    def paste(this : ITextRange2*, pVar : Win32cr::System::Com::VARIANT*, format : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this, pVar, format)
    end
    def can_paste(this : ITextRange2*, pVar : Win32cr::System::Com::VARIANT*, format : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_paste.call(this, pVar, format, pValue)
    end
    def can_edit(this : ITextRange2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_edit.call(this, pValue)
    end
    def change_case(this : ITextRange2*, type__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_case.call(this, type__)
    end
    def get_point(this : ITextRange2*, type__ : Int32, px : Int32*, py : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_point.call(this, type__, px, py)
    end
    def set_point(this : ITextRange2*, x : Int32, y : Int32, type__ : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_point.call(this, x, y, type__, extend__)
    end
    def scroll_into_view(this : ITextRange2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, value)
    end
    def get_embedded_object(this : ITextRange2*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_object.call(this, ppObject)
    end
    def get_flags(this : ITextRange2*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end
    def set_flags(this : ITextRange2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end
    def get_type(this : ITextRange2*, pType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pType)
    end
    def move_left(this : ITextRange2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_left.call(this, unit, count, extend__, pDelta)
    end
    def move_right(this : ITextRange2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_right.call(this, unit, count, extend__, pDelta)
    end
    def move_up(this : ITextRange2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_up.call(this, unit, count, extend__, pDelta)
    end
    def move_down(this : ITextRange2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_down.call(this, unit, count, extend__, pDelta)
    end
    def home_key(this : ITextRange2*, unit : Win32cr::UI::Controls::RichEdit::Tomconstants, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.home_key.call(this, unit, extend__, pDelta)
    end
    def end_key(this : ITextRange2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_key.call(this, unit, extend__, pDelta)
    end
    def type_text(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.type_text.call(this, bstr)
    end
    def get_cch(this : ITextRange2*, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cch.call(this, pcch)
    end
    def get_cells(this : ITextRange2*, ppCells : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cells.call(this, ppCells)
    end
    def get_column(this : ITextRange2*, ppColumn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, ppColumn)
    end
    def get_count(this : ITextRange2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def get_duplicate2(this : ITextRange2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate2.call(this, ppRange)
    end
    def get_font2(this : ITextRange2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font2.call(this, ppFont)
    end
    def set_font2(this : ITextRange2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font2.call(this, pFont)
    end
    def get_formatted_text2(this : ITextRange2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text2.call(this, ppRange)
    end
    def set_formatted_text2(this : ITextRange2*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text2.call(this, pRange)
    end
    def get_gravity(this : ITextRange2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gravity.call(this, pValue)
    end
    def set_gravity(this : ITextRange2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gravity.call(this, value)
    end
    def get_para2(this : ITextRange2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para2.call(this, ppPara)
    end
    def set_para2(this : ITextRange2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para2.call(this, pPara)
    end
    def get_row(this : ITextRange2*, ppRow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row.call(this, ppRow)
    end
    def get_start_para(this : ITextRange2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start_para.call(this, pValue)
    end
    def get_table(this : ITextRange2*, ppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table.call(this, ppTable)
    end
    def get_url(this : ITextRange2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, pbstr)
    end
    def set_url(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_url.call(this, bstr)
    end
    def add_subrange(this : ITextRange2*, cp1 : Int32, cp2 : Int32, activate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_subrange.call(this, cp1, cp2, activate)
    end
    def build_up_math(this : ITextRange2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_up_math.call(this, flags)
    end
    def delete_subrange(this : ITextRange2*, cpFirst : Int32, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_subrange.call(this, cpFirst, cpLim)
    end
    def find(this : ITextRange2*, pRange : Void*, count : Int32, flags : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find.call(this, pRange, count, flags, pDelta)
    end
    def get_char2(this : ITextRange2*, pChar : Int32*, offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char2.call(this, pChar, offset)
    end
    def get_drop_cap(this : ITextRange2*, pcLine : Int32*, pPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drop_cap.call(this, pcLine, pPosition)
    end
    def get_inline_object(this : ITextRange2*, pType : Int32*, pAlign : Int32*, pChar : Int32*, pChar1 : Int32*, pChar2 : Int32*, pCount : Int32*, pTeXStyle : Int32*, pcCol : Int32*, pLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inline_object.call(this, pType, pAlign, pChar, pChar1, pChar2, pCount, pTeXStyle, pcCol, pLevel)
    end
    def get_property(this : ITextRange2*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def get_rect(this : ITextRange2*, type__ : Int32, pLeft : Int32*, pTop : Int32*, pRight : Int32*, pBottom : Int32*, pHit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rect.call(this, type__, pLeft, pTop, pRight, pBottom, pHit)
    end
    def get_subrange(this : ITextRange2*, iSubrange : Int32, pcpFirst : Int32*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subrange.call(this, iSubrange, pcpFirst, pcpLim)
    end
    def get_text2(this : ITextRange2*, flags : Int32, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text2.call(this, flags, pbstr)
    end
    def hex_to_unicode(this : ITextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hex_to_unicode.call(this)
    end
    def insert_table(this : ITextRange2*, cCol : Int32, cRow : Int32, auto_fit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_table.call(this, cCol, cRow, auto_fit)
    end
    def linearize(this : ITextRange2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.linearize.call(this, flags)
    end
    def set_active_subrange(this : ITextRange2*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_subrange.call(this, cpAnchor, cpActive)
    end
    def set_drop_cap(this : ITextRange2*, cLine : Int32, position : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drop_cap.call(this, cLine, position)
    end
    def set_property(this : ITextRange2*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end
    def set_text2(this : ITextRange2*, flags : Int32, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text2.call(this, flags, bstr)
    end
    def unicode_to_hex(this : ITextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unicode_to_hex.call(this)
    end
    def set_inline_object(this : ITextRange2*, type__ : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, te_x_style : Int32, cCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_inline_object.call(this, type__, align, char, char1, char2, count, te_x_style, cCol)
    end
    def get_math_function_type(this : ITextRange2*, bstr : Win32cr::Foundation::BSTR, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_math_function_type.call(this, bstr, pValue)
    end
    def insert_image(this : ITextRange2*, width : Int32, height : Int32, ascent : Int32, type__ : Win32cr::Graphics::Gdi::TEXT_ALIGN_OPTIONS, bstrAltText : Win32cr::Foundation::BSTR, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_image.call(this, width, height, ascent, type__, bstrAltText, pStream)
    end

  end

  @[Extern]
  record ITextSelection2Vtbl,
    query_interface : Proc(ITextSelection2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextSelection2*, UInt32),
    release : Proc(ITextSelection2*, UInt32),
    get_type_info_count : Proc(ITextSelection2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextSelection2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextSelection2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextSelection2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextSelection2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_char : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    set_char : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    set_start : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    set_end : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_font : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_font : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_para : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_para : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_story_length : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_type : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    expand : Proc(ITextSelection2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITextSelection2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    set_index : Proc(ITextSelection2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_range : Proc(ITextSelection2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    in_range : Proc(ITextSelection2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    in_story : Proc(ITextSelection2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextSelection2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextSelection2*, Win32cr::Foundation::HRESULT),
    start_of : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_of : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_while : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_while : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_while : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_until : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_start_until : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_end_until : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_start : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    find_text_end : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    delete : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    cut : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    copy : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    paste : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    can_paste : Proc(ITextSelection2*, Win32cr::System::Com::VARIANT*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    can_edit : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    change_case : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_point : Proc(ITextSelection2*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_point : Proc(ITextSelection2*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_embedded_object : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_type : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    move_left : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_right : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_up : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_down : Proc(ITextSelection2*, Int32, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    home_key : Proc(ITextSelection2*, Win32cr::UI::Controls::RichEdit::Tomconstants, Int32, Int32*, Win32cr::Foundation::HRESULT),
    end_key : Proc(ITextSelection2*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    type_text : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_cch : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    get_cells : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_column : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    get_duplicate2 : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_font2 : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_font2 : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_formatted_text2 : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_formatted_text2 : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_gravity : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    set_gravity : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    get_para2 : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    set_para2 : Proc(ITextSelection2*, Void*, Win32cr::Foundation::HRESULT),
    get_row : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_start_para : Proc(ITextSelection2*, Int32*, Win32cr::Foundation::HRESULT),
    get_table : Proc(ITextSelection2*, Void**, Win32cr::Foundation::HRESULT),
    get_url : Proc(ITextSelection2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_url : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_subrange : Proc(ITextSelection2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    build_up_math : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    delete_subrange : Proc(ITextSelection2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    find : Proc(ITextSelection2*, Void*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_char2 : Proc(ITextSelection2*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    get_drop_cap : Proc(ITextSelection2*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_inline_object : Proc(ITextSelection2*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextSelection2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_rect : Proc(ITextSelection2*, Int32, Int32*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_subrange : Proc(ITextSelection2*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_text2 : Proc(ITextSelection2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    hex_to_unicode : Proc(ITextSelection2*, Win32cr::Foundation::HRESULT),
    insert_table : Proc(ITextSelection2*, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    linearize : Proc(ITextSelection2*, Int32, Win32cr::Foundation::HRESULT),
    set_active_subrange : Proc(ITextSelection2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_drop_cap : Proc(ITextSelection2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextSelection2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_text2 : Proc(ITextSelection2*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    unicode_to_hex : Proc(ITextSelection2*, Win32cr::Foundation::HRESULT),
    set_inline_object : Proc(ITextSelection2*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_math_function_type : Proc(ITextSelection2*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    insert_image : Proc(ITextSelection2*, Int32, Int32, Int32, Win32cr::Graphics::Gdi::TEXT_ALIGN_OPTIONS, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e1-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextSelection2, lpVtbl : ITextSelection2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e1_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextSelection2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextSelection2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextSelection2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextSelection2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextSelection2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextSelection2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextSelection2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_text(this : ITextSelection2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, bstr)
    end
    def get_char(this : ITextSelection2*, pChar : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char.call(this, pChar)
    end
    def set_char(this : ITextSelection2*, char : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_char.call(this, char)
    end
    def get_duplicate(this : ITextSelection2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppRange)
    end
    def get_formatted_text(this : ITextSelection2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ppRange)
    end
    def set_formatted_text(this : ITextSelection2*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pRange)
    end
    def get_start(this : ITextSelection2*, pcpFirst : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, pcpFirst)
    end
    def set_start(this : ITextSelection2*, cpFirst : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start.call(this, cpFirst)
    end
    def get_end(this : ITextSelection2*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, pcpLim)
    end
    def set_end(this : ITextSelection2*, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_end.call(this, cpLim)
    end
    def get_font(this : ITextSelection2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font.call(this, ppFont)
    end
    def set_font(this : ITextSelection2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font.call(this, pFont)
    end
    def get_para(this : ITextSelection2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para.call(this, ppPara)
    end
    def set_para(this : ITextSelection2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para.call(this, pPara)
    end
    def get_story_length(this : ITextSelection2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_length.call(this, pCount)
    end
    def get_story_type(this : ITextSelection2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_type.call(this, pValue)
    end
    def collapse(this : ITextSelection2*, bStart : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, bStart)
    end
    def expand(this : ITextSelection2*, unit : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, unit, pDelta)
    end
    def get_index(this : ITextSelection2*, unit : Int32, pIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, unit, pIndex)
    end
    def set_index(this : ITextSelection2*, unit : Int32, index : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_index.call(this, unit, index, extend__)
    end
    def set_range(this : ITextSelection2*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cpAnchor, cpActive)
    end
    def in_range(this : ITextSelection2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_range.call(this, pRange, pValue)
    end
    def in_story(this : ITextSelection2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_story.call(this, pRange, pValue)
    end
    def is_equal(this : ITextSelection2*, pRange : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pRange, pValue)
    end
    def select__(this : ITextSelection2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def start_of(this : ITextSelection2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_of.call(this, unit, extend__, pDelta)
    end
    def end_of(this : ITextSelection2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_of.call(this, unit, extend__, pDelta)
    end
    def move(this : ITextSelection2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pDelta)
    end
    def move_start(this : ITextSelection2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start.call(this, unit, count, pDelta)
    end
    def move_end(this : ITextSelection2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end.call(this, unit, count, pDelta)
    end
    def move_while(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_while.call(this, cset, count, pDelta)
    end
    def move_start_while(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_while.call(this, cset, count, pDelta)
    end
    def move_end_while(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_while.call(this, cset, count, pDelta)
    end
    def move_until(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_until.call(this, cset, count, pDelta)
    end
    def move_start_until(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_start_until.call(this, cset, count, pDelta)
    end
    def move_end_until(this : ITextSelection2*, cset : Win32cr::System::Com::VARIANT*, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_end_until.call(this, cset, count, pDelta)
    end
    def find_text(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, bstr, count, flags, pLength)
    end
    def find_text_start(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_start.call(this, bstr, count, flags, pLength)
    end
    def find_text_end(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR, count : Int32, flags : Int32, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text_end.call(this, bstr, count, flags, pLength)
    end
    def delete(this : ITextSelection2*, unit : Int32, count : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, unit, count, pDelta)
    end
    def cut(this : ITextSelection2*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cut.call(this, pVar)
    end
    def copy(this : ITextSelection2*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pVar)
    end
    def paste(this : ITextSelection2*, pVar : Win32cr::System::Com::VARIANT*, format : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this, pVar, format)
    end
    def can_paste(this : ITextSelection2*, pVar : Win32cr::System::Com::VARIANT*, format : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_paste.call(this, pVar, format, pValue)
    end
    def can_edit(this : ITextSelection2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_edit.call(this, pValue)
    end
    def change_case(this : ITextSelection2*, type__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_case.call(this, type__)
    end
    def get_point(this : ITextSelection2*, type__ : Int32, px : Int32*, py : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_point.call(this, type__, px, py)
    end
    def set_point(this : ITextSelection2*, x : Int32, y : Int32, type__ : Int32, extend__ : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_point.call(this, x, y, type__, extend__)
    end
    def scroll_into_view(this : ITextSelection2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, value)
    end
    def get_embedded_object(this : ITextSelection2*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_object.call(this, ppObject)
    end
    def get_flags(this : ITextSelection2*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end
    def set_flags(this : ITextSelection2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end
    def get_type(this : ITextSelection2*, pType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pType)
    end
    def move_left(this : ITextSelection2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_left.call(this, unit, count, extend__, pDelta)
    end
    def move_right(this : ITextSelection2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_right.call(this, unit, count, extend__, pDelta)
    end
    def move_up(this : ITextSelection2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_up.call(this, unit, count, extend__, pDelta)
    end
    def move_down(this : ITextSelection2*, unit : Int32, count : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_down.call(this, unit, count, extend__, pDelta)
    end
    def home_key(this : ITextSelection2*, unit : Win32cr::UI::Controls::RichEdit::Tomconstants, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.home_key.call(this, unit, extend__, pDelta)
    end
    def end_key(this : ITextSelection2*, unit : Int32, extend__ : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_key.call(this, unit, extend__, pDelta)
    end
    def type_text(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.type_text.call(this, bstr)
    end
    def get_cch(this : ITextSelection2*, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cch.call(this, pcch)
    end
    def get_cells(this : ITextSelection2*, ppCells : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cells.call(this, ppCells)
    end
    def get_column(this : ITextSelection2*, ppColumn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, ppColumn)
    end
    def get_count(this : ITextSelection2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def get_duplicate2(this : ITextSelection2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate2.call(this, ppRange)
    end
    def get_font2(this : ITextSelection2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font2.call(this, ppFont)
    end
    def set_font2(this : ITextSelection2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font2.call(this, pFont)
    end
    def get_formatted_text2(this : ITextSelection2*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text2.call(this, ppRange)
    end
    def set_formatted_text2(this : ITextSelection2*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text2.call(this, pRange)
    end
    def get_gravity(this : ITextSelection2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gravity.call(this, pValue)
    end
    def set_gravity(this : ITextSelection2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gravity.call(this, value)
    end
    def get_para2(this : ITextSelection2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_para2.call(this, ppPara)
    end
    def set_para2(this : ITextSelection2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_para2.call(this, pPara)
    end
    def get_row(this : ITextSelection2*, ppRow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row.call(this, ppRow)
    end
    def get_start_para(this : ITextSelection2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start_para.call(this, pValue)
    end
    def get_table(this : ITextSelection2*, ppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table.call(this, ppTable)
    end
    def get_url(this : ITextSelection2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, pbstr)
    end
    def set_url(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_url.call(this, bstr)
    end
    def add_subrange(this : ITextSelection2*, cp1 : Int32, cp2 : Int32, activate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_subrange.call(this, cp1, cp2, activate)
    end
    def build_up_math(this : ITextSelection2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_up_math.call(this, flags)
    end
    def delete_subrange(this : ITextSelection2*, cpFirst : Int32, cpLim : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_subrange.call(this, cpFirst, cpLim)
    end
    def find(this : ITextSelection2*, pRange : Void*, count : Int32, flags : Int32, pDelta : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find.call(this, pRange, count, flags, pDelta)
    end
    def get_char2(this : ITextSelection2*, pChar : Int32*, offset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char2.call(this, pChar, offset)
    end
    def get_drop_cap(this : ITextSelection2*, pcLine : Int32*, pPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drop_cap.call(this, pcLine, pPosition)
    end
    def get_inline_object(this : ITextSelection2*, pType : Int32*, pAlign : Int32*, pChar : Int32*, pChar1 : Int32*, pChar2 : Int32*, pCount : Int32*, pTeXStyle : Int32*, pcCol : Int32*, pLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inline_object.call(this, pType, pAlign, pChar, pChar1, pChar2, pCount, pTeXStyle, pcCol, pLevel)
    end
    def get_property(this : ITextSelection2*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def get_rect(this : ITextSelection2*, type__ : Int32, pLeft : Int32*, pTop : Int32*, pRight : Int32*, pBottom : Int32*, pHit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rect.call(this, type__, pLeft, pTop, pRight, pBottom, pHit)
    end
    def get_subrange(this : ITextSelection2*, iSubrange : Int32, pcpFirst : Int32*, pcpLim : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subrange.call(this, iSubrange, pcpFirst, pcpLim)
    end
    def get_text2(this : ITextSelection2*, flags : Int32, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text2.call(this, flags, pbstr)
    end
    def hex_to_unicode(this : ITextSelection2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hex_to_unicode.call(this)
    end
    def insert_table(this : ITextSelection2*, cCol : Int32, cRow : Int32, auto_fit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_table.call(this, cCol, cRow, auto_fit)
    end
    def linearize(this : ITextSelection2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.linearize.call(this, flags)
    end
    def set_active_subrange(this : ITextSelection2*, cpAnchor : Int32, cpActive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_subrange.call(this, cpAnchor, cpActive)
    end
    def set_drop_cap(this : ITextSelection2*, cLine : Int32, position : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drop_cap.call(this, cLine, position)
    end
    def set_property(this : ITextSelection2*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end
    def set_text2(this : ITextSelection2*, flags : Int32, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text2.call(this, flags, bstr)
    end
    def unicode_to_hex(this : ITextSelection2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unicode_to_hex.call(this)
    end
    def set_inline_object(this : ITextSelection2*, type__ : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, te_x_style : Int32, cCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_inline_object.call(this, type__, align, char, char1, char2, count, te_x_style, cCol)
    end
    def get_math_function_type(this : ITextSelection2*, bstr : Win32cr::Foundation::BSTR, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_math_function_type.call(this, bstr, pValue)
    end
    def insert_image(this : ITextSelection2*, width : Int32, height : Int32, ascent : Int32, type__ : Win32cr::Graphics::Gdi::TEXT_ALIGN_OPTIONS, bstrAltText : Win32cr::Foundation::BSTR, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_image.call(this, width, height, ascent, type__, bstrAltText, pStream)
    end

  end

  @[Extern]
  record ITextFont2Vtbl,
    query_interface : Proc(ITextFont2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextFont2*, UInt32),
    release : Proc(ITextFont2*, UInt32),
    get_type_info_count : Proc(ITextFont2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextFont2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextFont2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextFont2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextFont2*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate : Proc(ITextFont2*, Void*, Win32cr::Foundation::HRESULT),
    can_change : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextFont2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITextFont2*, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    get_style : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_style : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_all_caps : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_all_caps : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_animation : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_animation : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_back_color : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_back_color : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_bold : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_bold : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_emboss : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_emboss : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_fore_color : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_fore_color : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_hidden : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_hidden : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_engrave : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_engrave : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_italic : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_italic : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_kerning : Proc(ITextFont2*, Float32*, Win32cr::Foundation::HRESULT),
    set_kerning : Proc(ITextFont2*, Float32, Win32cr::Foundation::HRESULT),
    get_language_id : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_language_id : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_name : Proc(ITextFont2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(ITextFont2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_outline : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_outline : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_position : Proc(ITextFont2*, Float32*, Win32cr::Foundation::HRESULT),
    set_position : Proc(ITextFont2*, Float32, Win32cr::Foundation::HRESULT),
    get_protected : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_protected : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_shadow : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_shadow : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_size : Proc(ITextFont2*, Float32*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ITextFont2*, Float32, Win32cr::Foundation::HRESULT),
    get_small_caps : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_small_caps : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_spacing : Proc(ITextFont2*, Float32*, Win32cr::Foundation::HRESULT),
    set_spacing : Proc(ITextFont2*, Float32, Win32cr::Foundation::HRESULT),
    get_strike_through : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_strike_through : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_subscript : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_subscript : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_superscript : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_superscript : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_underline : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_underline : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_weight : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_weight : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    get_auto_ligatures : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_auto_ligatures : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_autospace_alpha : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_autospace_alpha : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_autospace_numeric : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_autospace_numeric : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_autospace_parens : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_autospace_parens : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_char_rep : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_char_rep : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_compression_mode : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_compression_mode : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_cookie : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_cookie : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_double_strike : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_double_strike : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_duplicate2 : Proc(ITextFont2*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate2 : Proc(ITextFont2*, Void*, Win32cr::Foundation::HRESULT),
    get_link_type : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    get_math_zone : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_math_zone : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_mod_width_pairs : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_mod_width_pairs : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_mod_width_space : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_mod_width_space : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_old_numbers : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_old_numbers : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_overlapping : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_overlapping : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_position_sub_super : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_position_sub_super : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_scaling : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_scaling : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_space_extension : Proc(ITextFont2*, Float32*, Win32cr::Foundation::HRESULT),
    set_space_extension : Proc(ITextFont2*, Float32, Win32cr::Foundation::HRESULT),
    get_underline_position_mode : Proc(ITextFont2*, Int32*, Win32cr::Foundation::HRESULT),
    set_underline_position_mode : Proc(ITextFont2*, Int32, Win32cr::Foundation::HRESULT),
    get_effects : Proc(ITextFont2*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_effects2 : Proc(ITextFont2*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextFont2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_property_info : Proc(ITextFont2*, Int32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal2 : Proc(ITextFont2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    set_effects : Proc(ITextFont2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_effects2 : Proc(ITextFont2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextFont2*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e3-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextFont2, lpVtbl : ITextFont2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e3_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextFont2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextFont2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextFont2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextFont2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextFont2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextFont2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextFont2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_duplicate(this : ITextFont2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppFont)
    end
    def set_duplicate(this : ITextFont2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate.call(this, pFont)
    end
    def can_change(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_change.call(this, pValue)
    end
    def is_equal(this : ITextFont2*, pFont : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pFont, pValue)
    end
    def reset(this : ITextFont2*, value : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, value)
    end
    def get_style(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_style.call(this, pValue)
    end
    def set_style(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_style.call(this, value)
    end
    def get_all_caps(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_caps.call(this, pValue)
    end
    def set_all_caps(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_caps.call(this, value)
    end
    def get_animation(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_animation.call(this, pValue)
    end
    def set_animation(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_animation.call(this, value)
    end
    def get_back_color(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_back_color.call(this, pValue)
    end
    def set_back_color(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_back_color.call(this, value)
    end
    def get_bold(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bold.call(this, pValue)
    end
    def set_bold(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bold.call(this, value)
    end
    def get_emboss(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_emboss.call(this, pValue)
    end
    def set_emboss(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_emboss.call(this, value)
    end
    def get_fore_color(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fore_color.call(this, pValue)
    end
    def set_fore_color(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fore_color.call(this, value)
    end
    def get_hidden(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hidden.call(this, pValue)
    end
    def set_hidden(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hidden.call(this, value)
    end
    def get_engrave(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_engrave.call(this, pValue)
    end
    def set_engrave(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_engrave.call(this, value)
    end
    def get_italic(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_italic.call(this, pValue)
    end
    def set_italic(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_italic.call(this, value)
    end
    def get_kerning(this : ITextFont2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_kerning.call(this, pValue)
    end
    def set_kerning(this : ITextFont2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_kerning.call(this, value)
    end
    def get_language_id(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_id.call(this, pValue)
    end
    def set_language_id(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language_id.call(this, value)
    end
    def get_name(this : ITextFont2*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstr)
    end
    def set_name(this : ITextFont2*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, bstr)
    end
    def get_outline(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_outline.call(this, pValue)
    end
    def set_outline(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_outline.call(this, value)
    end
    def get_position(this : ITextFont2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position.call(this, pValue)
    end
    def set_position(this : ITextFont2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position.call(this, value)
    end
    def get_protected(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protected.call(this, pValue)
    end
    def set_protected(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_protected.call(this, value)
    end
    def get_shadow(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shadow.call(this, pValue)
    end
    def set_shadow(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_shadow.call(this, value)
    end
    def get_size(this : ITextFont2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pValue)
    end
    def set_size(this : ITextFont2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, value)
    end
    def get_small_caps(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_small_caps.call(this, pValue)
    end
    def set_small_caps(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_small_caps.call(this, value)
    end
    def get_spacing(this : ITextFont2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spacing.call(this, pValue)
    end
    def set_spacing(this : ITextFont2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spacing.call(this, value)
    end
    def get_strike_through(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_strike_through.call(this, pValue)
    end
    def set_strike_through(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_strike_through.call(this, value)
    end
    def get_subscript(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscript.call(this, pValue)
    end
    def set_subscript(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_subscript.call(this, value)
    end
    def get_superscript(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_superscript.call(this, pValue)
    end
    def set_superscript(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_superscript.call(this, value)
    end
    def get_underline(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_underline.call(this, pValue)
    end
    def set_underline(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_underline.call(this, value)
    end
    def get_weight(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_weight.call(this, pValue)
    end
    def set_weight(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_weight.call(this, value)
    end
    def get_count(this : ITextFont2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def get_auto_ligatures(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auto_ligatures.call(this, pValue)
    end
    def set_auto_ligatures(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_auto_ligatures.call(this, value)
    end
    def get_autospace_alpha(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_autospace_alpha.call(this, pValue)
    end
    def set_autospace_alpha(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_autospace_alpha.call(this, value)
    end
    def get_autospace_numeric(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_autospace_numeric.call(this, pValue)
    end
    def set_autospace_numeric(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_autospace_numeric.call(this, value)
    end
    def get_autospace_parens(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_autospace_parens.call(this, pValue)
    end
    def set_autospace_parens(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_autospace_parens.call(this, value)
    end
    def get_char_rep(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_char_rep.call(this, pValue)
    end
    def set_char_rep(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_char_rep.call(this, value)
    end
    def get_compression_mode(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_compression_mode.call(this, pValue)
    end
    def set_compression_mode(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_compression_mode.call(this, value)
    end
    def get_cookie(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cookie.call(this, pValue)
    end
    def set_cookie(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cookie.call(this, value)
    end
    def get_double_strike(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_double_strike.call(this, pValue)
    end
    def set_double_strike(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_double_strike.call(this, value)
    end
    def get_duplicate2(this : ITextFont2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate2.call(this, ppFont)
    end
    def set_duplicate2(this : ITextFont2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate2.call(this, pFont)
    end
    def get_link_type(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_link_type.call(this, pValue)
    end
    def get_math_zone(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_math_zone.call(this, pValue)
    end
    def set_math_zone(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_math_zone.call(this, value)
    end
    def get_mod_width_pairs(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mod_width_pairs.call(this, pValue)
    end
    def set_mod_width_pairs(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mod_width_pairs.call(this, value)
    end
    def get_mod_width_space(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mod_width_space.call(this, pValue)
    end
    def set_mod_width_space(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mod_width_space.call(this, value)
    end
    def get_old_numbers(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_old_numbers.call(this, pValue)
    end
    def set_old_numbers(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_old_numbers.call(this, value)
    end
    def get_overlapping(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_overlapping.call(this, pValue)
    end
    def set_overlapping(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_overlapping.call(this, value)
    end
    def get_position_sub_super(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_sub_super.call(this, pValue)
    end
    def set_position_sub_super(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position_sub_super.call(this, value)
    end
    def get_scaling(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scaling.call(this, pValue)
    end
    def set_scaling(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scaling.call(this, value)
    end
    def get_space_extension(this : ITextFont2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_extension.call(this, pValue)
    end
    def set_space_extension(this : ITextFont2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_space_extension.call(this, value)
    end
    def get_underline_position_mode(this : ITextFont2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_underline_position_mode.call(this, pValue)
    end
    def set_underline_position_mode(this : ITextFont2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_underline_position_mode.call(this, value)
    end
    def get_effects(this : ITextFont2*, pValue : Int32*, pMask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effects.call(this, pValue, pMask)
    end
    def get_effects2(this : ITextFont2*, pValue : Int32*, pMask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effects2.call(this, pValue, pMask)
    end
    def get_property(this : ITextFont2*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def get_property_info(this : ITextFont2*, index : Int32, pType : Int32*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_info.call(this, index, pType, pValue)
    end
    def is_equal2(this : ITextFont2*, pFont : Void*, pB : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal2.call(this, pFont, pB)
    end
    def set_effects(this : ITextFont2*, value : Int32, mask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effects.call(this, value, mask)
    end
    def set_effects2(this : ITextFont2*, value : Int32, mask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effects2.call(this, value, mask)
    end
    def set_property(this : ITextFont2*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end

  end

  @[Extern]
  record ITextPara2Vtbl,
    query_interface : Proc(ITextPara2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextPara2*, UInt32),
    release : Proc(ITextPara2*, UInt32),
    get_type_info_count : Proc(ITextPara2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextPara2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextPara2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextPara2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_duplicate : Proc(ITextPara2*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate : Proc(ITextPara2*, Void*, Win32cr::Foundation::HRESULT),
    can_change : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextPara2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_style : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_style : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_alignment : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_alignment : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_hyphenation : Proc(ITextPara2*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_hyphenation : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_first_line_indent : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    get_keep_together : Proc(ITextPara2*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_keep_together : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_keep_with_next : Proc(ITextPara2*, Win32cr::UI::Controls::RichEdit::Tomconstants*, Win32cr::Foundation::HRESULT),
    set_keep_with_next : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_left_indent : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    get_line_spacing : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    get_line_spacing_rule : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    get_list_alignment : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_alignment : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_list_level_index : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_level_index : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_list_start : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_start : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_list_tab : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    set_list_tab : Proc(ITextPara2*, Float32, Win32cr::Foundation::HRESULT),
    get_list_type : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_list_type : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_no_line_number : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_no_line_number : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_page_break_before : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_page_break_before : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_right_indent : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    set_right_indent : Proc(ITextPara2*, Float32, Win32cr::Foundation::HRESULT),
    set_indents : Proc(ITextPara2*, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    set_line_spacing : Proc(ITextPara2*, Int32, Float32, Win32cr::Foundation::HRESULT),
    get_space_after : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    set_space_after : Proc(ITextPara2*, Float32, Win32cr::Foundation::HRESULT),
    get_space_before : Proc(ITextPara2*, Float32*, Win32cr::Foundation::HRESULT),
    set_space_before : Proc(ITextPara2*, Float32, Win32cr::Foundation::HRESULT),
    get_widow_control : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_widow_control : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_tab_count : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    add_tab : Proc(ITextPara2*, Float32, Int32, Int32, Win32cr::Foundation::HRESULT),
    clear_all_tabs : Proc(ITextPara2*, Win32cr::Foundation::HRESULT),
    delete_tab : Proc(ITextPara2*, Float32, Win32cr::Foundation::HRESULT),
    get_tab : Proc(ITextPara2*, Int32, Float32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_borders : Proc(ITextPara2*, Void**, Win32cr::Foundation::HRESULT),
    get_duplicate2 : Proc(ITextPara2*, Void**, Win32cr::Foundation::HRESULT),
    set_duplicate2 : Proc(ITextPara2*, Void*, Win32cr::Foundation::HRESULT),
    get_font_alignment : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_font_alignment : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_hanging_punctuation : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_hanging_punctuation : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_snap_to_grid : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_snap_to_grid : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_trim_punctuation_at_start : Proc(ITextPara2*, Int32*, Win32cr::Foundation::HRESULT),
    set_trim_punctuation_at_start : Proc(ITextPara2*, Int32, Win32cr::Foundation::HRESULT),
    get_effects : Proc(ITextPara2*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextPara2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    is_equal2 : Proc(ITextPara2*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    set_effects : Proc(ITextPara2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextPara2*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e4-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextPara2, lpVtbl : ITextPara2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e4_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextPara2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextPara2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextPara2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextPara2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextPara2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextPara2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextPara2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_duplicate(this : ITextPara2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate.call(this, ppPara)
    end
    def set_duplicate(this : ITextPara2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate.call(this, pPara)
    end
    def can_change(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_change.call(this, pValue)
    end
    def is_equal(this : ITextPara2*, pPara : Void*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pPara, pValue)
    end
    def reset(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, value)
    end
    def get_style(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_style.call(this, pValue)
    end
    def set_style(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_style.call(this, value)
    end
    def get_alignment(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alignment.call(this, pValue)
    end
    def set_alignment(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alignment.call(this, value)
    end
    def get_hyphenation(this : ITextPara2*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyphenation.call(this, pValue)
    end
    def set_hyphenation(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyphenation.call(this, value)
    end
    def get_first_line_indent(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_line_indent.call(this, pValue)
    end
    def get_keep_together(this : ITextPara2*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_together.call(this, pValue)
    end
    def set_keep_together(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_together.call(this, value)
    end
    def get_keep_with_next(this : ITextPara2*, pValue : Win32cr::UI::Controls::RichEdit::Tomconstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_with_next.call(this, pValue)
    end
    def set_keep_with_next(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_with_next.call(this, value)
    end
    def get_left_indent(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_left_indent.call(this, pValue)
    end
    def get_line_spacing(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_spacing.call(this, pValue)
    end
    def get_line_spacing_rule(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_spacing_rule.call(this, pValue)
    end
    def get_list_alignment(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_alignment.call(this, pValue)
    end
    def set_list_alignment(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_alignment.call(this, value)
    end
    def get_list_level_index(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_level_index.call(this, pValue)
    end
    def set_list_level_index(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_level_index.call(this, value)
    end
    def get_list_start(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_start.call(this, pValue)
    end
    def set_list_start(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_start.call(this, value)
    end
    def get_list_tab(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_tab.call(this, pValue)
    end
    def set_list_tab(this : ITextPara2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_tab.call(this, value)
    end
    def get_list_type(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_type.call(this, pValue)
    end
    def set_list_type(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_list_type.call(this, value)
    end
    def get_no_line_number(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_no_line_number.call(this, pValue)
    end
    def set_no_line_number(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_no_line_number.call(this, value)
    end
    def get_page_break_before(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_break_before.call(this, pValue)
    end
    def set_page_break_before(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_break_before.call(this, value)
    end
    def get_right_indent(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_right_indent.call(this, pValue)
    end
    def set_right_indent(this : ITextPara2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_right_indent.call(this, value)
    end
    def set_indents(this : ITextPara2*, first : Float32, left : Float32, right : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_indents.call(this, first, left, right)
    end
    def set_line_spacing(this : ITextPara2*, rule : Int32, spacing : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_line_spacing.call(this, rule, spacing)
    end
    def get_space_after(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_after.call(this, pValue)
    end
    def set_space_after(this : ITextPara2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_space_after.call(this, value)
    end
    def get_space_before(this : ITextPara2*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_before.call(this, pValue)
    end
    def set_space_before(this : ITextPara2*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_space_before.call(this, value)
    end
    def get_widow_control(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_widow_control.call(this, pValue)
    end
    def set_widow_control(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_widow_control.call(this, value)
    end
    def get_tab_count(this : ITextPara2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tab_count.call(this, pCount)
    end
    def add_tab(this : ITextPara2*, tbPos : Float32, tbAlign : Int32, tbLeader : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_tab.call(this, tbPos, tbAlign, tbLeader)
    end
    def clear_all_tabs(this : ITextPara2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_all_tabs.call(this)
    end
    def delete_tab(this : ITextPara2*, tbPos : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_tab.call(this, tbPos)
    end
    def get_tab(this : ITextPara2*, iTab : Int32, ptbPos : Float32*, ptbAlign : Int32*, ptbLeader : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tab.call(this, iTab, ptbPos, ptbAlign, ptbLeader)
    end
    def get_borders(this : ITextPara2*, ppBorders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_borders.call(this, ppBorders)
    end
    def get_duplicate2(this : ITextPara2*, ppPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duplicate2.call(this, ppPara)
    end
    def set_duplicate2(this : ITextPara2*, pPara : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duplicate2.call(this, pPara)
    end
    def get_font_alignment(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font_alignment.call(this, pValue)
    end
    def set_font_alignment(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font_alignment.call(this, value)
    end
    def get_hanging_punctuation(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hanging_punctuation.call(this, pValue)
    end
    def set_hanging_punctuation(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hanging_punctuation.call(this, value)
    end
    def get_snap_to_grid(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snap_to_grid.call(this, pValue)
    end
    def set_snap_to_grid(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snap_to_grid.call(this, value)
    end
    def get_trim_punctuation_at_start(this : ITextPara2*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trim_punctuation_at_start.call(this, pValue)
    end
    def set_trim_punctuation_at_start(this : ITextPara2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_trim_punctuation_at_start.call(this, value)
    end
    def get_effects(this : ITextPara2*, pValue : Int32*, pMask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effects.call(this, pValue, pMask)
    end
    def get_property(this : ITextPara2*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def is_equal2(this : ITextPara2*, pPara : Void*, pB : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal2.call(this, pPara, pB)
    end
    def set_effects(this : ITextPara2*, value : Int32, mask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effects.call(this, value, mask)
    end
    def set_property(this : ITextPara2*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end

  end

  @[Extern]
  record ITextStoryRanges2Vtbl,
    query_interface : Proc(ITextStoryRanges2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoryRanges2*, UInt32),
    release : Proc(ITextStoryRanges2*, UInt32),
    get_type_info_count : Proc(ITextStoryRanges2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextStoryRanges2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextStoryRanges2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextStoryRanges2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    _new_enum : Proc(ITextStoryRanges2*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(ITextStoryRanges2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextStoryRanges2*, Int32*, Win32cr::Foundation::HRESULT),
    item2 : Proc(ITextStoryRanges2*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e5-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextStoryRanges2, lpVtbl : ITextStoryRanges2Vtbl* do
    GUID = LibC::GUID.new(0xc241f5e5_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextStoryRanges2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoryRanges2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoryRanges2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextStoryRanges2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextStoryRanges2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextStoryRanges2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextStoryRanges2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def _new_enum(this : ITextStoryRanges2*, ppunkEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value._new_enum.call(this, ppunkEnum)
    end
    def item(this : ITextStoryRanges2*, index : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ppRange)
    end
    def get_count(this : ITextStoryRanges2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def item2(this : ITextStoryRanges2*, index : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item2.call(this, index, ppRange)
    end

  end

  @[Extern]
  record ITextStoryVtbl,
    query_interface : Proc(ITextStory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStory*, UInt32),
    release : Proc(ITextStory*, UInt32),
    get_active : Proc(ITextStory*, Int32*, Win32cr::Foundation::HRESULT),
    set_active : Proc(ITextStory*, Int32, Win32cr::Foundation::HRESULT),
    get_display : Proc(ITextStory*, Void**, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITextStory*, Int32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(ITextStory*, Int32*, Win32cr::Foundation::HRESULT),
    set_type : Proc(ITextStory*, Int32, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextStory*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_range : Proc(ITextStory*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextStory*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextStory*, Void*, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextStory*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextStory*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5f3-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextStory, lpVtbl : ITextStoryVtbl* do
    GUID = LibC::GUID.new(0xc241f5f3_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextStory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_active(this : ITextStory*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active.call(this, pValue)
    end
    def set_active(this : ITextStory*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active.call(this, value)
    end
    def get_display(this : ITextStory*, ppDisplay : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display.call(this, ppDisplay)
    end
    def get_index(this : ITextStory*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, pValue)
    end
    def get_type(this : ITextStory*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pValue)
    end
    def set_type(this : ITextStory*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type.call(this, value)
    end
    def get_property(this : ITextStory*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def get_range(this : ITextStory*, cpActive : Int32, cpAnchor : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range.call(this, cpActive, cpAnchor, ppRange)
    end
    def get_text(this : ITextStory*, flags : Int32, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, flags, pbstr)
    end
    def set_formatted_text(this : ITextStory*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pUnk)
    end
    def set_property(this : ITextStory*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end
    def set_text(this : ITextStory*, flags : Int32, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, flags, bstr)
    end

  end

  @[Extern]
  record ITextStringsVtbl,
    query_interface : Proc(ITextStrings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStrings*, UInt32),
    release : Proc(ITextStrings*, UInt32),
    get_type_info_count : Proc(ITextStrings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextStrings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextStrings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextStrings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(ITextStrings*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITextStrings*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(ITextStrings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    append : Proc(ITextStrings*, Void*, Int32, Win32cr::Foundation::HRESULT),
    cat2 : Proc(ITextStrings*, Int32, Win32cr::Foundation::HRESULT),
    cat_top2 : Proc(ITextStrings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_range : Proc(ITextStrings*, Void*, Win32cr::Foundation::HRESULT),
    encode_function : Proc(ITextStrings*, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Void*, Win32cr::Foundation::HRESULT),
    get_cch : Proc(ITextStrings*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    insert_null_str : Proc(ITextStrings*, Int32, Win32cr::Foundation::HRESULT),
    move_boundary : Proc(ITextStrings*, Int32, Int32, Win32cr::Foundation::HRESULT),
    prefix_top : Proc(ITextStrings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove : Proc(ITextStrings*, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_formatted_text : Proc(ITextStrings*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_op_cp : Proc(ITextStrings*, Int32, Int32, Win32cr::Foundation::HRESULT),
    suffix_top : Proc(ITextStrings*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    swap : Proc(ITextStrings*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5e7-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextStrings, lpVtbl : ITextStringsVtbl* do
    GUID = LibC::GUID.new(0xc241f5e7_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextStrings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStrings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStrings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextStrings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextStrings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextStrings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextStrings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def item(this : ITextStrings*, index : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, ppRange)
    end
    def get_count(this : ITextStrings*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def add(this : ITextStrings*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, bstr)
    end
    def append(this : ITextStrings*, pRange : Void*, iString : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, pRange, iString)
    end
    def cat2(this : ITextStrings*, iString : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cat2.call(this, iString)
    end
    def cat_top2(this : ITextStrings*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cat_top2.call(this, bstr)
    end
    def delete_range(this : ITextStrings*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_range.call(this, pRange)
    end
    def encode_function(this : ITextStrings*, type__ : Int32, align : Int32, char : Int32, char1 : Int32, char2 : Int32, count : Int32, te_x_style : Int32, cCol : Int32, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encode_function.call(this, type__, align, char, char1, char2, count, te_x_style, cCol, pRange)
    end
    def get_cch(this : ITextStrings*, iString : Int32, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cch.call(this, iString, pcch)
    end
    def insert_null_str(this : ITextStrings*, iString : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_null_str.call(this, iString)
    end
    def move_boundary(this : ITextStrings*, iString : Int32, cch : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_boundary.call(this, iString, cch)
    end
    def prefix_top(this : ITextStrings*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prefix_top.call(this, bstr)
    end
    def remove(this : ITextStrings*, iString : Int32, cString : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, iString, cString)
    end
    def set_formatted_text(this : ITextStrings*, pRangeD : Void*, pRangeS : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_formatted_text.call(this, pRangeD, pRangeS)
    end
    def set_op_cp(this : ITextStrings*, iString : Int32, cp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_op_cp.call(this, iString, cp)
    end
    def suffix_top(this : ITextStrings*, bstr : Win32cr::Foundation::BSTR, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suffix_top.call(this, bstr, pRange)
    end
    def swap(this : ITextStrings*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.swap.call(this)
    end

  end

  @[Extern]
  record ITextRowVtbl,
    query_interface : Proc(ITextRow*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextRow*, UInt32),
    release : Proc(ITextRow*, UInt32),
    get_type_info_count : Proc(ITextRow*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextRow*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextRow*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextRow*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_alignment : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_alignment : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_count : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_count : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_count_cache : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_count_cache : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_index : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_index : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_margin : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_margin : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_height : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_height : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_indent : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_indent : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_keep_together : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_keep_together : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_keep_with_next : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_keep_with_next : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_nest_level : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    get_rtl : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_rtl : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_alignment : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_alignment : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_color_back : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_color_back : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_color_fore : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_color_fore : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_merge_flags : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_merge_flags : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_shading : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_shading : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_vertical_text : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_vertical_text : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_width : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_width : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    get_cell_border_colors : Proc(ITextRow*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_cell_border_widths : Proc(ITextRow*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_cell_border_colors : Proc(ITextRow*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    set_cell_border_widths : Proc(ITextRow*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    apply : Proc(ITextRow*, Int32, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    can_change : Proc(ITextRow*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITextRow*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    insert : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    is_equal : Proc(ITextRow*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITextRow*, Int32, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITextRow*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5ef-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextRow, lpVtbl : ITextRowVtbl* do
    GUID = LibC::GUID.new(0xc241f5ef_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextRow*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextRow*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextRow*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextRow*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextRow*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextRow*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextRow*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_alignment(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alignment.call(this, pValue)
    end
    def set_alignment(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alignment.call(this, value)
    end
    def get_cell_count(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_count.call(this, pValue)
    end
    def set_cell_count(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_count.call(this, value)
    end
    def get_cell_count_cache(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_count_cache.call(this, pValue)
    end
    def set_cell_count_cache(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_count_cache.call(this, value)
    end
    def get_cell_index(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_index.call(this, pValue)
    end
    def set_cell_index(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_index.call(this, value)
    end
    def get_cell_margin(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_margin.call(this, pValue)
    end
    def set_cell_margin(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_margin.call(this, value)
    end
    def get_height(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_height.call(this, pValue)
    end
    def set_height(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_height.call(this, value)
    end
    def get_indent(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_indent.call(this, pValue)
    end
    def set_indent(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_indent.call(this, value)
    end
    def get_keep_together(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_together.call(this, pValue)
    end
    def set_keep_together(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_together.call(this, value)
    end
    def get_keep_with_next(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keep_with_next.call(this, pValue)
    end
    def set_keep_with_next(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keep_with_next.call(this, value)
    end
    def get_nest_level(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_nest_level.call(this, pValue)
    end
    def get_rtl(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rtl.call(this, pValue)
    end
    def set_rtl(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rtl.call(this, value)
    end
    def get_cell_alignment(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_alignment.call(this, pValue)
    end
    def set_cell_alignment(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_alignment.call(this, value)
    end
    def get_cell_color_back(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_color_back.call(this, pValue)
    end
    def set_cell_color_back(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_color_back.call(this, value)
    end
    def get_cell_color_fore(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_color_fore.call(this, pValue)
    end
    def set_cell_color_fore(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_color_fore.call(this, value)
    end
    def get_cell_merge_flags(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_merge_flags.call(this, pValue)
    end
    def set_cell_merge_flags(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_merge_flags.call(this, value)
    end
    def get_cell_shading(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_shading.call(this, pValue)
    end
    def set_cell_shading(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_shading.call(this, value)
    end
    def get_cell_vertical_text(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_vertical_text.call(this, pValue)
    end
    def set_cell_vertical_text(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_vertical_text.call(this, value)
    end
    def get_cell_width(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_width.call(this, pValue)
    end
    def set_cell_width(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_width.call(this, value)
    end
    def get_cell_border_colors(this : ITextRow*, pcrLeft : Int32*, pcrTop : Int32*, pcrRight : Int32*, pcrBottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_border_colors.call(this, pcrLeft, pcrTop, pcrRight, pcrBottom)
    end
    def get_cell_border_widths(this : ITextRow*, pduLeft : Int32*, pduTop : Int32*, pduRight : Int32*, pduBottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cell_border_widths.call(this, pduLeft, pduTop, pduRight, pduBottom)
    end
    def set_cell_border_colors(this : ITextRow*, crLeft : Int32, crTop : Int32, crRight : Int32, crBottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_border_colors.call(this, crLeft, crTop, crRight, crBottom)
    end
    def set_cell_border_widths(this : ITextRow*, duLeft : Int32, duTop : Int32, duRight : Int32, duBottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cell_border_widths.call(this, duLeft, duTop, duRight, duBottom)
    end
    def apply(this : ITextRow*, cRow : Int32, flags : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply.call(this, cRow, flags)
    end
    def can_change(this : ITextRow*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_change.call(this, pValue)
    end
    def get_property(this : ITextRow*, type__ : Int32, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, type__, pValue)
    end
    def insert(this : ITextRow*, cRow : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, cRow)
    end
    def is_equal(this : ITextRow*, pRow : Void*, pB : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pRow, pB)
    end
    def reset(this : ITextRow*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, value)
    end
    def set_property(this : ITextRow*, type__ : Int32, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, type__, value)
    end

  end

  @[Extern]
  record ITextDisplaysVtbl,
    query_interface : Proc(ITextDisplays*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextDisplays*, UInt32),
    release : Proc(ITextDisplays*, UInt32),
    get_type_info_count : Proc(ITextDisplays*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextDisplays*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextDisplays*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextDisplays*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c241f5f2-7206-11d8-a2c7-00a0d1d6c6b3")]
  record ITextDisplays, lpVtbl : ITextDisplaysVtbl* do
    GUID = LibC::GUID.new(0xc241f5f2_u32, 0x7206_u16, 0x11d8_u16, StaticArray[0xa2_u8, 0xc7_u8, 0x0_u8, 0xa0_u8, 0xd1_u8, 0xd6_u8, 0xc6_u8, 0xb3_u8])
    def query_interface(this : ITextDisplays*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextDisplays*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextDisplays*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextDisplays*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextDisplays*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextDisplays*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextDisplays*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ITextDocument2OldVtbl,
    query_interface : Proc(ITextDocument2Old*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextDocument2Old*, UInt32),
    release : Proc(ITextDocument2Old*, UInt32),
    get_type_info_count : Proc(ITextDocument2Old*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITextDocument2Old*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITextDocument2Old*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITextDocument2Old*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name : Proc(ITextDocument2Old*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    get_story_count : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    get_story_ranges : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    get_saved : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    set_saved : Proc(ITextDocument2Old*, Win32cr::UI::Controls::RichEdit::Tomconstants, Win32cr::Foundation::HRESULT),
    get_default_tab_stop : Proc(ITextDocument2Old*, Float32*, Win32cr::Foundation::HRESULT),
    set_default_tab_stop : Proc(ITextDocument2Old*, Float32, Win32cr::Foundation::HRESULT),
    new : Proc(ITextDocument2Old*, Win32cr::Foundation::HRESULT),
    open : Proc(ITextDocument2Old*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    save : Proc(ITextDocument2Old*, Win32cr::System::Com::VARIANT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    freeze : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    unfreeze : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    begin_edit_collection : Proc(ITextDocument2Old*, Win32cr::Foundation::HRESULT),
    end_edit_collection : Proc(ITextDocument2Old*, Win32cr::Foundation::HRESULT),
    undo : Proc(ITextDocument2Old*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    redo : Proc(ITextDocument2Old*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    range : Proc(ITextDocument2Old*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextDocument2Old*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    attach_msg_filter : Proc(ITextDocument2Old*, Void*, Win32cr::Foundation::HRESULT),
    set_effect_color : Proc(ITextDocument2Old*, Int32, UInt32, Win32cr::Foundation::HRESULT),
    get_effect_color : Proc(ITextDocument2Old*, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    get_caret_type : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    set_caret_type : Proc(ITextDocument2Old*, Int32, Win32cr::Foundation::HRESULT),
    get_imm_context : Proc(ITextDocument2Old*, Int64*, Win32cr::Foundation::HRESULT),
    release_imm_context : Proc(ITextDocument2Old*, Int64, Win32cr::Foundation::HRESULT),
    get_preferred_font : Proc(ITextDocument2Old*, Int32, Int32, Int32, Int32, Int32, Win32cr::Foundation::BSTR*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_notification_mode : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    set_notification_mode : Proc(ITextDocument2Old*, Int32, Win32cr::Foundation::HRESULT),
    get_client_rect : Proc(ITextDocument2Old*, Int32, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_selection2 : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    get_window : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    get_fe_flags : Proc(ITextDocument2Old*, Int32*, Win32cr::Foundation::HRESULT),
    update_window : Proc(ITextDocument2Old*, Win32cr::Foundation::HRESULT),
    check_text_limit : Proc(ITextDocument2Old*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    ime_in_progress : Proc(ITextDocument2Old*, Int32, Win32cr::Foundation::HRESULT),
    sys_beep : Proc(ITextDocument2Old*, Win32cr::Foundation::HRESULT),
    update : Proc(ITextDocument2Old*, Int32, Win32cr::Foundation::HRESULT),
    notify : Proc(ITextDocument2Old*, Int32, Win32cr::Foundation::HRESULT),
    get_document_font : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    get_document_para : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    get_call_manager : Proc(ITextDocument2Old*, Void**, Win32cr::Foundation::HRESULT),
    release_call_manager : Proc(ITextDocument2Old*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("01c25500-4268-11d1-883a-3c8b00c10000")]
  record ITextDocument2Old, lpVtbl : ITextDocument2OldVtbl* do
    GUID = LibC::GUID.new(0x1c25500_u32, 0x4268_u16, 0x11d1_u16, StaticArray[0x88_u8, 0x3a_u8, 0x3c_u8, 0x8b_u8, 0x0_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITextDocument2Old*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextDocument2Old*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextDocument2Old*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITextDocument2Old*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITextDocument2Old*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITextDocument2Old*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITextDocument2Old*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_name(this : ITextDocument2Old*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pName)
    end
    def get_selection(this : ITextDocument2Old*, ppSel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ppSel)
    end
    def get_story_count(this : ITextDocument2Old*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_count.call(this, pCount)
    end
    def get_story_ranges(this : ITextDocument2Old*, ppStories : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_ranges.call(this, ppStories)
    end
    def get_saved(this : ITextDocument2Old*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_saved.call(this, pValue)
    end
    def set_saved(this : ITextDocument2Old*, value : Win32cr::UI::Controls::RichEdit::Tomconstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saved.call(this, value)
    end
    def get_default_tab_stop(this : ITextDocument2Old*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_tab_stop.call(this, pValue)
    end
    def set_default_tab_stop(this : ITextDocument2Old*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_tab_stop.call(this, value)
    end
    def new(this : ITextDocument2Old*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new.call(this)
    end
    def open(this : ITextDocument2Old*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pVar, flags, code_page)
    end
    def save(this : ITextDocument2Old*, pVar : Win32cr::System::Com::VARIANT*, flags : Int32, code_page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pVar, flags, code_page)
    end
    def freeze(this : ITextDocument2Old*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.freeze.call(this, pCount)
    end
    def unfreeze(this : ITextDocument2Old*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unfreeze.call(this, pCount)
    end
    def begin_edit_collection(this : ITextDocument2Old*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_edit_collection.call(this)
    end
    def end_edit_collection(this : ITextDocument2Old*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_edit_collection.call(this)
    end
    def undo(this : ITextDocument2Old*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.undo.call(this, count, pCount)
    end
    def redo(this : ITextDocument2Old*, count : Int32, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.redo.call(this, count, pCount)
    end
    def range(this : ITextDocument2Old*, cpActive : Int32, cpAnchor : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range.call(this, cpActive, cpAnchor, ppRange)
    end
    def range_from_point(this : ITextDocument2Old*, x : Int32, y : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, x, y, ppRange)
    end
    def attach_msg_filter(this : ITextDocument2Old*, pFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_msg_filter.call(this, pFilter)
    end
    def set_effect_color(this : ITextDocument2Old*, index : Int32, cr : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect_color.call(this, index, cr)
    end
    def get_effect_color(this : ITextDocument2Old*, index : Int32, pcr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_color.call(this, index, pcr)
    end
    def get_caret_type(this : ITextDocument2Old*, pCaretType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caret_type.call(this, pCaretType)
    end
    def set_caret_type(this : ITextDocument2Old*, caret_type : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_caret_type.call(this, caret_type)
    end
    def get_imm_context(this : ITextDocument2Old*, pContext : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_imm_context.call(this, pContext)
    end
    def release_imm_context(this : ITextDocument2Old*, context : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_imm_context.call(this, context)
    end
    def get_preferred_font(this : ITextDocument2Old*, cp : Int32, char_rep : Int32, option : Int32, char_rep_cur : Int32, curFontSize : Int32, pbstr : Win32cr::Foundation::BSTR*, pPitchAndFamily : Int32*, pNewFontSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_font.call(this, cp, char_rep, option, char_rep_cur, curFontSize, pbstr, pPitchAndFamily, pNewFontSize)
    end
    def get_notification_mode(this : ITextDocument2Old*, pMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notification_mode.call(this, pMode)
    end
    def set_notification_mode(this : ITextDocument2Old*, mode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_mode.call(this, mode)
    end
    def get_client_rect(this : ITextDocument2Old*, type__ : Int32, pLeft : Int32*, pTop : Int32*, pRight : Int32*, pBottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_rect.call(this, type__, pLeft, pTop, pRight, pBottom)
    end
    def get_selection2(this : ITextDocument2Old*, ppSel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection2.call(this, ppSel)
    end
    def get_window(this : ITextDocument2Old*, phWnd : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, phWnd)
    end
    def get_fe_flags(this : ITextDocument2Old*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fe_flags.call(this, pFlags)
    end
    def update_window(this : ITextDocument2Old*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_window.call(this)
    end
    def check_text_limit(this : ITextDocument2Old*, cch : Int32, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_text_limit.call(this, cch, pcch)
    end
    def ime_in_progress(this : ITextDocument2Old*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ime_in_progress.call(this, value)
    end
    def sys_beep(this : ITextDocument2Old*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sys_beep.call(this)
    end
    def update(this : ITextDocument2Old*, mode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this, mode)
    end
    def notify(this : ITextDocument2Old*, notify : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, notify)
    end
    def get_document_font(this : ITextDocument2Old*, ppITextFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_font.call(this, ppITextFont)
    end
    def get_document_para(this : ITextDocument2Old*, ppITextPara : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_para.call(this, ppITextPara)
    end
    def get_call_manager(this : ITextDocument2Old*, ppVoid : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_call_manager.call(this, ppVoid)
    end
    def release_call_manager(this : ITextDocument2Old*, pVoid : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_call_manager.call(this, pVoid)
    end

  end

end