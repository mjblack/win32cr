require "./../system/com.cr"
require "./../foundation.cr"
require "./ms_html.cr"
require "./../system/ole.cr"
require "./../graphics/dxgi/common.cr"
require "./../system/win_rt.cr"
require "./../system/variant.cr"
require "./../ui/windows_and_messaging.cr"
require "./../graphics/gdi.cr"
require "./../system/registry.cr"
require "./../system/threading.cr"
require "./../security.cr"
require "./../storage/file_system.cr"
require "./../graphics/direct_draw.cr"

module Win32cr::Web::InternetExplorer
  extend self
  DISPID_AMBIENT_OFFLINEIFNOTCONNECTED = -5501_i32
  DISPID_AMBIENT_SILENT = -5502_i32
  DISPID_BEFORENAVIGATE = 100_u32
  DISPID_NAVIGATECOMPLETE = 101_u32
  DISPID_STATUSTEXTCHANGE = 102_u32
  DISPID_QUIT = 103_u32
  DISPID_DOWNLOADCOMPLETE = 104_u32
  DISPID_COMMANDSTATECHANGE = 105_u32
  DISPID_DOWNLOADBEGIN = 106_u32
  DISPID_NEWWINDOW = 107_u32
  DISPID_PROGRESSCHANGE = 108_u32
  DISPID_WINDOWMOVE = 109_u32
  DISPID_WINDOWRESIZE = 110_u32
  DISPID_WINDOWACTIVATE = 111_u32
  DISPID_PROPERTYCHANGE = 112_u32
  DISPID_TITLECHANGE = 113_u32
  DISPID_TITLEICONCHANGE = 114_u32
  DISPID_FRAMEBEFORENAVIGATE = 200_u32
  DISPID_FRAMENAVIGATECOMPLETE = 201_u32
  DISPID_FRAMENEWWINDOW = 204_u32
  DISPID_BEFORENAVIGATE2 = 250_u32
  DISPID_NEWWINDOW2 = 251_u32
  DISPID_NAVIGATECOMPLETE2 = 252_u32
  DISPID_ONQUIT = 253_u32
  DISPID_ONVISIBLE = 254_u32
  DISPID_ONTOOLBAR = 255_u32
  DISPID_ONMENUBAR = 256_u32
  DISPID_ONSTATUSBAR = 257_u32
  DISPID_ONFULLSCREEN = 258_u32
  DISPID_DOCUMENTCOMPLETE = 259_u32
  DISPID_ONTHEATERMODE = 260_u32
  DISPID_ONADDRESSBAR = 261_u32
  DISPID_WINDOWSETRESIZABLE = 262_u32
  DISPID_WINDOWCLOSING = 263_u32
  DISPID_WINDOWSETLEFT = 264_u32
  DISPID_WINDOWSETTOP = 265_u32
  DISPID_WINDOWSETWIDTH = 266_u32
  DISPID_WINDOWSETHEIGHT = 267_u32
  DISPID_CLIENTTOHOSTWINDOW = 268_u32
  DISPID_SETSECURELOCKICON = 269_u32
  DISPID_FILEDOWNLOAD = 270_u32
  DISPID_NAVIGATEERROR = 271_u32
  DISPID_PRIVACYIMPACTEDSTATECHANGE = 272_u32
  DISPID_NEWWINDOW3 = 273_u32
  DISPID_VIEWUPDATE = 281_u32
  DISPID_SETPHISHINGFILTERSTATUS = 282_u32
  DISPID_WINDOWSTATECHANGED = 283_u32
  DISPID_NEWPROCESS = 284_u32
  DISPID_THIRDPARTYURLBLOCKED = 285_u32
  DISPID_REDIRECTXDOMAINBLOCKED = 286_u32
  DISPID_WEBWORKERSTARTED = 288_u32
  DISPID_WEBWORKERFINISHED = 289_u32
  DISPID_BEFORESCRIPTEXECUTE = 290_u32
  DISPID_PRINTTEMPLATEINSTANTIATION = 225_u32
  DISPID_PRINTTEMPLATETEARDOWN = 226_u32
  DISPID_UPDATEPAGESTATUS = 227_u32
  DISPID_WINDOWREGISTERED = 200_u32
  DISPID_WINDOWREVOKED = 201_u32
  DISPID_RESETFIRSTBOOTMODE = 1_u32
  DISPID_RESETSAFEMODE = 2_u32
  DISPID_REFRESHOFFLINEDESKTOP = 3_u32
  DISPID_ADDFAVORITE = 4_u32
  DISPID_ADDCHANNEL = 5_u32
  DISPID_ADDDESKTOPCOMPONENT = 6_u32
  DISPID_ISSUBSCRIBED = 7_u32
  DISPID_NAVIGATEANDFIND = 8_u32
  DISPID_IMPORTEXPORTFAVORITES = 9_u32
  DISPID_AUTOCOMPLETESAVEFORM = 10_u32
  DISPID_AUTOSCAN = 11_u32
  DISPID_AUTOCOMPLETEATTACH = 12_u32
  DISPID_SHOWBROWSERUI = 13_u32
  DISPID_ADDSEARCHPROVIDER = 14_u32
  DISPID_RUNONCESHOWN = 15_u32
  DISPID_SKIPRUNONCE = 16_u32
  DISPID_CUSTOMIZESETTINGS = 17_u32
  DISPID_SQMENABLED = 18_u32
  DISPID_PHISHINGENABLED = 19_u32
  DISPID_BRANDIMAGEURI = 20_u32
  DISPID_SKIPTABSWELCOME = 21_u32
  DISPID_DIAGNOSECONNECTION = 22_u32
  DISPID_CUSTOMIZECLEARTYPE = 23_u32
  DISPID_ISSEARCHPROVIDERINSTALLED = 24_u32
  DISPID_ISSEARCHMIGRATED = 25_u32
  DISPID_DEFAULTSEARCHPROVIDER = 26_u32
  DISPID_RUNONCEREQUIREDSETTINGSCOMPLETE = 27_u32
  DISPID_RUNONCEHASSHOWN = 28_u32
  DISPID_SEARCHGUIDEURL = 29_u32
  DISPID_ADDSERVICE = 30_u32
  DISPID_ISSERVICEINSTALLED = 31_u32
  DISPID_ADDTOFAVORITESBAR = 32_u32
  DISPID_BUILDNEWTABPAGE = 33_u32
  DISPID_SETRECENTLYCLOSEDVISIBLE = 34_u32
  DISPID_SETACTIVITIESVISIBLE = 35_u32
  DISPID_CONTENTDISCOVERYRESET = 36_u32
  DISPID_INPRIVATEFILTERINGENABLED = 37_u32
  DISPID_SUGGESTEDSITESENABLED = 38_u32
  DISPID_ENABLESUGGESTEDSITES = 39_u32
  DISPID_NAVIGATETOSUGGESTEDSITES = 40_u32
  DISPID_SHOWTABSHELP = 41_u32
  DISPID_SHOWINPRIVATEHELP = 42_u32
  DISPID_ISSITEMODE = 43_u32
  DISPID_SETSITEMODEICONOVERLAY = 44_u32
  DISPID_CLEARSITEMODEICONOVERLAY = 45_u32
  DISPID_UPDATETHUMBNAILBUTTON = 46_u32
  DISPID_SETTHUMBNAILBUTTONS = 47_u32
  DISPID_ADDTHUMBNAILBUTTONS = 48_u32
  DISPID_ADDSITEMODE = 49_u32
  DISPID_SETSITEMODEPROPERTIES = 50_u32
  DISPID_SITEMODECREATEJUMPLIST = 51_u32
  DISPID_SITEMODEADDJUMPLISTITEM = 52_u32
  DISPID_SITEMODECLEARJUMPLIST = 53_u32
  DISPID_SITEMODEADDBUTTONSTYLE = 54_u32
  DISPID_SITEMODESHOWBUTTONSTYLE = 55_u32
  DISPID_SITEMODESHOWJUMPLIST = 56_u32
  DISPID_ADDTRACKINGPROTECTIONLIST = 57_u32
  DISPID_SITEMODEACTIVATE = 58_u32
  DISPID_ISSITEMODEFIRSTRUN = 59_u32
  DISPID_TRACKINGPROTECTIONENABLED = 60_u32
  DISPID_ACTIVEXFILTERINGENABLED = 61_u32
  DISPID_PROVISIONNETWORKS = 62_u32
  DISPID_REPORTSAFEURL = 63_u32
  DISPID_SITEMODEREFRESHBADGE = 64_u32
  DISPID_SITEMODECLEARBADGE = 65_u32
  DISPID_DIAGNOSECONNECTIONUILESS = 66_u32
  DISPID_LAUNCHNETWORKCLIENTHELP = 67_u32
  DISPID_CHANGEDEFAULTBROWSER = 68_u32
  DISPID_STOPPERIODICUPDATE = 69_u32
  DISPID_STARTPERIODICUPDATE = 70_u32
  DISPID_CLEARNOTIFICATION = 71_u32
  DISPID_ENABLENOTIFICATIONQUEUE = 72_u32
  DISPID_PINNEDSITESTATE = 73_u32
  DISPID_LAUNCHINTERNETOPTIONS = 74_u32
  DISPID_STARTPERIODICUPDATEBATCH = 75_u32
  DISPID_ENABLENOTIFICATIONQUEUESQUARE = 76_u32
  DISPID_ENABLENOTIFICATIONQUEUEWIDE = 77_u32
  DISPID_ENABLENOTIFICATIONQUEUELARGE = 78_u32
  DISPID_SCHEDULEDTILENOTIFICATION = 79_u32
  DISPID_REMOVESCHEDULEDTILENOTIFICATION = 80_u32
  DISPID_STARTBADGEUPDATE = 81_u32
  DISPID_STOPBADGEUPDATE = 82_u32
  DISPID_ISMETAREFERRERAVAILABLE = 83_u32
  DISPID_SETEXPERIMENTALFLAG = 84_u32
  DISPID_GETEXPERIMENTALFLAG = 85_u32
  DISPID_SETEXPERIMENTALVALUE = 86_u32
  DISPID_GETEXPERIMENTALVALUE = 87_u32
  DISPID_HASNEEDIEAUTOLAUNCHFLAG = 88_u32
  DISPID_GETNEEDIEAUTOLAUNCHFLAG = 89_u32
  DISPID_SETNEEDIEAUTOLAUNCHFLAG = 90_u32
  DISPID_LAUNCHIE = 91_u32
  DISPID_RESETEXPERIMENTALFLAGS = 92_u32
  DISPID_GETCVLISTDATA = 93_u32
  DISPID_GETCVLISTLOCALDATA = 94_u32
  DISPID_GETEMIELISTDATA = 95_u32
  DISPID_GETEMIELISTLOCALDATA = 96_u32
  DISPID_OPENFAVORITESPANE = 97_u32
  DISPID_OPENFAVORITESSETTINGS = 98_u32
  DISPID_LAUNCHINHVSI = 99_u32
  DISPID_GETNEEDHVSIAUTOLAUNCHFLAG = 100_u32
  DISPID_SETNEEDHVSIAUTOLAUNCHFLAG = 101_u32
  DISPID_HASNEEDHVSIAUTOLAUNCHFLAG = 102_u32
  DISPID_GETOSSKU = 103_u32
  DISPID_SETMSDEFAULTS = 104_u32
  DISPID_SHELLUIHELPERLAST = 105_u32
  DISPID_ADVANCEERROR = 10_u32
  DISPID_RETREATERROR = 11_u32
  DISPID_CANADVANCEERROR = 12_u32
  DISPID_CANRETREATERROR = 13_u32
  DISPID_GETERRORLINE = 14_u32
  DISPID_GETERRORCHAR = 15_u32
  DISPID_GETERRORCODE = 16_u32
  DISPID_GETERRORMSG = 17_u32
  DISPID_GETERRORURL = 18_u32
  DISPID_GETDETAILSSTATE = 19_u32
  DISPID_SETDETAILSSTATE = 20_u32
  DISPID_GETPERERRSTATE = 21_u32
  DISPID_SETPERERRSTATE = 22_u32
  DISPID_GETALWAYSSHOWLOCKSTATE = 23_u32
  DISPID_FAVSELECTIONCHANGE = 1_u32
  DISPID_SELECTIONCHANGE = 2_u32
  DISPID_DOUBLECLICK = 3_u32
  DISPID_INITIALIZED = 4_u32
  DISPID_MOVESELECTIONUP = 1_u32
  DISPID_MOVESELECTIONDOWN = 2_u32
  DISPID_RESETSORT = 3_u32
  DISPID_NEWFOLDER = 4_u32
  DISPID_SYNCHRONIZE = 5_u32
  DISPID_IMPORT = 6_u32
  DISPID_EXPORT = 7_u32
  DISPID_INVOKECONTEXTMENU = 8_u32
  DISPID_MOVESELECTIONTO = 9_u32
  DISPID_SUBSCRIPTIONSENABLED = 10_u32
  DISPID_CREATESUBSCRIPTION = 11_u32
  DISPID_DELETESUBSCRIPTION = 12_u32
  DISPID_SETROOT = 13_u32
  DISPID_ENUMOPTIONS = 14_u32
  DISPID_SELECTEDITEM = 15_u32
  DISPID_ROOT = 16_u32
  DISPID_DEPTH = 17_u32
  DISPID_MODE = 18_u32
  DISPID_FLAGS = 19_u32
  DISPID_TVFLAGS = 20_u32
  DISPID_NSCOLUMNS = 21_u32
  DISPID_COUNTVIEWTYPES = 22_u32
  DISPID_SETVIEWTYPE = 23_u32
  DISPID_SELECTEDITEMS = 24_u32
  DISPID_EXPAND = 25_u32
  DISPID_UNSELECTALL = 26_u32
  TF_NAVIGATE = 2142153644_u32
  TARGET_NOTIFY_OBJECT_NAME = "863a99a0-21bc-11d0-82b4-00a0c90c29c5"
  IEPROCESS_MODULE_NAME = "IERtUtil.dll"
  IEGetProcessModule_PROC_NAME = "IEGetProcessModule"
  IEGetTabWindowExports_PROC_NAME = "IEGetTabWindowExports"
  TSZMICROSOFTPATH = "Software\\Microsoft"
  SZ_IE_MAIN = "Main"
  REGSTR_VAL_SMOOTHSCROLL = "SmoothScroll"
  REGSTR_VAL_SMOOTHSCROLL_DEF = 1_u32
  REGSTR_VAL_SHOWTOOLBAR = "Show_ToolBar"
  REGSTR_VAL_SHOWADDRESSBAR = "Show_URLToolBar"
  REGSTR_VAL_STARTPAGE = "Start Page"
  REGSTRA_VAL_STARTPAGE = "Start Page"
  REGSTR_VAL_SEARCHPAGE = "Search Page"
  REGSTR_VAL_LOCALPAGE = "Local Page"
  REGSTR_VAL_USESTYLESHEETS = "Use Stylesheets"
  REGSTR_VAL_USESTYLESHEETS_DEF = "yes"
  REGSTR_VAL_USEICM = "UseICM"
  REGSTR_VAL_USEICM_DEF = 0_u32
  REGSTR_VAL_SHOWFOCUS = "Tabstop - MouseDown"
  REGSTR_VAL_SHOWFOCUS_DEF = "no"
  REGSTR_VAL_LOADIMAGES = "Display Inline Images"
  REGSTR_VAL_PLAYSOUNDS = "Play_Background_Sounds"
  REGSTR_VAL_PLAYVIDEOS = "Display Inline Videos"
  REGSTR_VAL_ANCHORUNDERLINE = "Anchor Underline"
  REGSTR_VAL_USEDLGCOLORS = "Use_DlgBox_Colors"
  REGSTR_VAL_CHECKASSOC = "Check_Associations"
  REGSTR_VAL_SHOWFULLURLS = "Show_FullURL"
  REGSTR_VAL_AUTOSEARCH = "Do404Search"
  REGSTR_VAL_AUTONAVIGATE = "SearchForExtensions"
  REGSTR_VAL_HTTP_ERRORS = "Friendly http errors"
  REGSTR_VAL_USEIBAR = "UseBar"
  SZ_IE_SETTINGS = "Settings"
  REGSTR_VAL_IE_CUSTOMCOLORS = "Custom Colors"
  REGSTR_VAL_ANCHORCOLOR = "Anchor Color"
  REGSTR_VAL_ANCHORCOLORVISITED = "Anchor Color Visited"
  REGSTR_VAL_BACKGROUNDCOLOR = "Background Color"
  REGSTR_VAL_TEXTCOLOR = "Text Color"
  REGSTR_VAL_ANCHORCOLORHOVER = "Anchor Color Hover"
  REGSTR_VAL_USEHOVERCOLOR = "Use Anchor Hover Color"
  SZ_IE_SECURITY = "Security"
  REGSTR_VAL_SAFETYWARNINGLEVEL = "Safety Warning Level"
  SZ_IE_DEFAULT_HTML_EDITOR = "Default HTML Editor"
  REGSTR_VAL_USEAUTOAPPEND = "Append Completion"
  REGSTR_VAL_USEAUTOSUGGEST = "AutoSuggest"
  REGSTR_VAL_USEAUTOCOMPLETE = "Use AutoComplete"
  SZ_IE_IBAR = "Bar"
  SZ_IE_IBAR_BANDS = "Bands"
  REGSTR_VAL_USERAGENT = "User Agent"
  REGSTR_VAL_INTERNETENTRY = "InternetProfile"
  REGSTR_VAL_INTERNETPROFILE = "InternetProfile"
  REGSTR_VAL_INTERNETENTRYBKUP = "BackupInternetProfile"
  REGSTR_VAL_CODEDOWNLOAD = "Code Download"
  REGSTR_VAL_CODEDOWNLOAD_DEF = "yes"
  REGSTR_PATH_INETCPL_RESTRICTIONS = "Software\\Policies\\Microsoft\\Internet Explorer\\Control Panel"
  REGSTR_VAL_INETCPL_GENERALTAB = "GeneralTab"
  REGSTR_VAL_INETCPL_SECURITYTAB = "SecurityTab"
  REGSTR_VAL_INETCPL_CONTENTTAB = "ContentTab"
  REGSTR_VAL_INETCPL_CONNECTIONSTAB = "ConnectionsTab"
  REGSTR_VAL_INETCPL_PROGRAMSTAB = "ProgramsTab"
  REGSTR_VAL_INETCPL_ADVANCEDTAB = "AdvancedTab"
  REGSTR_VAL_INETCPL_PRIVACYTAB = "PrivacyTab"
  REGSTR_VAL_INETCPL_IEAK = "IEAKContext"
  REGSTR_VAL_DIRECTORY = "Directory"
  REGSTR_VAL_NEWDIRECTORY = "NewDirectory"
  REGSTR_VAL_CACHEPREFIX = "CachePrefix"
  SZ_IE_SEARCHSTRINGS = "UrlTemplate"
  MAX_SEARCH_FORMAT_STRING = 255_u32
  SZ_IE_THRESHOLDS = "ErrorThresholds"
  REGSTR_VAL_ACCESSMEDIUM = "AccessMedium"
  REGSTR_VAL_ACCESSTYPE = "AccessType"
  REGSTR_VAL_AUTODIALDLLNAME = "AutodialDllName"
  REGSTR_VAL_AUTODIALFCNNAME = "AutodialFcnName"
  REGSTR_VAL_AUTODIAL_MONITORCLASSNAME = "MS_AutodialMonitor"
  REGSTR_VAL_AUTODIAL_TRYONLYONCE = "TryAutodialOnce"
  REGSTR_PATH_REMOTEACCESS = "RemoteAccess"
  REGSTR_PATH_REMOTEACESS = "RemoteAccess"
  REGSTR_VAL_RNAINSTALLED = "Installed"
  REGSTR_VAL_ENABLEAUTODIAL = "EnableAutodial"
  REGSTR_VAL_ENABLEUNATTENDED = "EnableUnattended"
  REGSTR_VAL_NONETAUTODIAL = "NoNetAutodial"
  REGSTR_VAL_REDIALATTEMPTS = "RedialAttempts"
  REGSTR_VAL_REDIALINTERVAL = "RedialWait"
  REGSTR_VAL_ENABLEAUTODIALDISCONNECT = "EnableAutodisconnect"
  REGSTR_VAL_ENABLEAUTODISCONNECT = "EnableAutodisconnect"
  REGSTR_VAL_ENABLEEXITDISCONNECT = "EnableExitDisconnect"
  REGSTR_VAL_ENABLESECURITYCHECK = "EnableSecurityCheck"
  REGSTR_VAL_COVEREXCLUDE = "CoverExclude"
  REGSTR_VAL_DISCONNECTIDLETIME = "DisconnectIdleTime"
  REGSTR_VAL_MOSDISCONNECT = "DisconnectTimeout"
  REGSTR_VAL_PROXYENABLE = "ProxyEnable"
  REGSTR_VAL_PROXYSERVER = "ProxyServer"
  REGSTR_VAL_PROXYOVERRIDE = "ProxyOverride"
  REGSTR_VAL_BYPASSAUTOCONFIG = "BypassAutoconfig"
  SZTRUSTWARNLEVEL = "Trust Warning Level"
  REGSTR_VAL_TRUSTWARNINGLEVEL_HIGH = "High"
  REGSTR_VAL_TRUSTWARNINGLEVEL_MED = "Medium"
  REGSTR_VAL_TRUSTWARNINGLEVEL_LOW = "No Security"
  REGSTR_VAL_SECURITYWARNONSEND = "WarnOnPost"
  REGSTR_VAL_SECURITYWARNONSEND_DEF = 1_u32
  REGSTR_VAL_SECURITYWARNONSENDALWAYS = "WarnAlwaysOnPost"
  REGSTR_VAL_SECURITYWARNONSENDALWAYS_DEF = 1_u32
  REGSTR_VAL_SECURITYWARNONVIEW = "WarnOnView"
  REGSTR_VAL_SECURITYWARNONVIEW_DEF = 1_u32
  REGSTR_VAL_SECURITYALLOWCOOKIES = "AllowCookies"
  REGSTR_VAL_SECURITYALLOWCOOKIES_DEF = 1_u32
  REGSTR_VAL_SECURITYWARNONZONECROSSING = "WarnOnZoneCrossing"
  REGSTR_VAL_SECURITYWARNONZONECROSSING_DEF = 1_u32
  REGSTR_VAL_SECURITYWARNONBADCERTVIEWING = "WarnOnBadCertRecving"
  REGSTR_VAL_SECURITYWARNONBADCERTVIEWING_DEF = 1_u32
  REGSTR_VAL_SECURITYWARNONBADCERTSENDING = "WarnOnBadCertSending"
  REGSTR_VAL_SECURITYWARNONBADCERTSENDING_DEF = 1_u32
  REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES = "DisableCachingOfSSLPages"
  REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES_DEF = 0_u32
  REGSTR_VAL_SECURITYACTIVEX = "Security_RunActiveXControls"
  REGSTR_VAL_SECURITYACTIVEX_DEF = 1_u32
  REGSTR_VAL_SECURITYACTICEXSCRIPTS = "Security_RunScripts"
  REGSTR_VAL_SECURITYACTICEXSCRIPTS_DEF = 1_u32
  REGSTR_VAL_SECURITYJAVA = "Security_RunJavaApplets"
  REGSTR_VAL_SECURITYJAVA_DEF = 1_u32
  SZJAVAVMPATH = "\\Java VM"
  REGSTR_VAL_JAVAJIT = "EnableJIT"
  REGSTR_VAL_JAVAJIT_DEF = 0_u32
  REGSTR_VAL_JAVALOGGING = "EnableLogging"
  REGSTR_VAL_JAVALOGGING_DEF = 0_u32
  SZTOOLBAR = "\\Toolbar"
  REGSTR_VAL_DAYSTOKEEP = "DaysToKeep"
  SZNOTEXT = "NoText"
  SZVISIBLE = "VisibleBands"
  REGSTR_VAL_VISIBLEBANDS = "VisibleBands"
  REGSTR_VAL_VISIBLEBANDS_DEF = 7_u32
  TOOLSBAND = 1_u32
  ADDRESSBAND = 2_u32
  LINKSBAND = 4_u32
  SZBACKBITMAP = "BackBitmap"
  REGSTR_VAL_BACKBITMAP = "BackBitmap"
  REGSTR_SHIFTQUICKSUFFIX = "ShiftQuickCompleteSuffix"
  TSZSCHANNELPATH = "SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL"
  REGSTR_VAL_SCHANNELENABLEPROTOCOL = "Enabled"
  REGSTR_VAL_SCHANNELENABLEPROTOCOL_DEF = 1_u32
  TSZINTERNETCLIENTSPATH = "Software\\Microsoft\\Internet Explorer\\Unix"
  REGSTR_PATH_DEFAULT = "default"
  REGSTR_PATH_CURRENT = "current"
  IE_USE_OE_PRESENT_HKEY = -2147483646_i32
  IE_USE_OE_PRESENT_KEY = "Software\\Microsoft\\Windows\\CurrentVersion\\app.paths\\msimn.exe"
  IE_USE_OE_MAIL_HKEY = -2147483647_i32
  IE_USE_OE_MAIL_KEY = "Software\\Microsoft\\Internet Explorer\\Mail"
  IE_USE_OE_MAIL_VALUE = "Use Outlook Express"
  IE_USE_OE_NEWS_HKEY = -2147483647_i32
  IE_USE_OE_NEWS_KEY = "Software\\Microsoft\\Internet Explorer\\News"
  IE_USE_OE_NEWS_VALUE = "Use Outlook Express"
  TSZPROTOCOLSPATH = "Protocols\\"
  TSZMAILTOPROTOCOL = "mailto"
  TSZNEWSPROTOCOL = "news"
  TSZCALLTOPROTOCOL = "callto"
  TSZLDAPPROTOCOL = "ldap"
  TSZCALENDARPROTOCOL = "unk"
  TSZVSOURCEPROTOCOL = "view source"
  REGSTR_VAL_DEFAULT_CODEPAGE = "Default_CodePage"
  REGSTR_VAL_DEFAULT_SCRIPT = "Default_Script"
  REGSTR_VAL_ACCEPT_LANGUAGE = "AcceptLanguage"
  REGSTR_VAL_FONT_SCRIPTS = "Scripts"
  REGSTR_VAL_FONT_SCRIPT = "Script"
  REGSTR_VAL_FONT_SCRIPT_NAME = "Script"
  REGSTR_VAL_DEF_ENCODING = "Default_Encoding"
  REGSTR_VAL_DEF_INETENCODING = "Default_InternetEncoding"
  REGSTR_VAL_FIXED_FONT = "IEFixedFontName"
  REGSTR_VAL_SCRIPT_FIXED_FONT = "IEFixedFontName"
  REGSTR_VAL_PROP_FONT = "IEPropFontName"
  REGSTR_VAL_SCRIPT_PROP_FONT = "IEPropFontName"
  REGSTR_VAL_FONT_SIZE = "IEFontSize"
  REGSTR_VAL_FONT_SIZE_DEF = 2_u32
  REGSTR_VAL_AUTODETECT = "AutoDetect"
  REGSTR_PATH_MIME_DATABASE = "MIME\\Database"
  REGSTR_VAL_CODEPAGE = "CodePage"
  REGSTR_VAL_INETENCODING = "InternetEncoding"
  REGSTR_VAL_FAMILY = "Family"
  REGSTR_VAL_LEVEL = "Level"
  REGSTR_VAL_ALIASTO = "AliasForCharset"
  REGSTR_VAL_ENCODENAME = "EncodingName"
  REGSTR_VAL_DESCRIPTION = "Description"
  REGSTR_VAL_WEBCHARSET = "WebCharset"
  REGSTR_VAL_BODYCHARSET = "BodyCharset"
  REGSTR_VAL_HEADERCHARSET = "HeaderCharset"
  REGSTR_VAL_FIXEDWIDTHFONT = "FixedWidthFont"
  REGSTR_VAL_PROPORTIONALFONT = "ProportionalFont"
  REGSTR_VAL_PRIVCONVERTER = "PrivConverter"
  IECMDID_CLEAR_AUTOCOMPLETE_FOR_FORMS = 0_u32
  IECMDID_SETID_AUTOCOMPLETE_FOR_FORMS = 1_u32
  IECMDID_BEFORENAVIGATE_GETSHELLBROWSE = 2_u32
  IECMDID_BEFORENAVIGATE_DOEXTERNALBROWSE = 3_u32
  IECMDID_BEFORENAVIGATE_GETIDLIST = 4_u32
  IECMDID_SET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 5_u32
  IECMDID_GET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 6_u32
  IECMDID_ARG_CLEAR_FORMS_ALL = 0_u32
  IECMDID_ARG_CLEAR_FORMS_ALL_BUT_PASSWORDS = 1_u32
  IECMDID_ARG_CLEAR_FORMS_PASSWORDS_ONLY = 2_u32
  CATID_MSOfficeAntiVirus = LibC::GUID.new(0x56ffcc30_u32, 0xd398_u16, 0x11d0_u16, StaticArray[0xb2_u8, 0xae_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0xfa_u8, 0x49_u8])
  Msoedmenable = 1_u32
  Msoedmdisable = 2_u32
  Msoedmdontopen = 3_u32
  Msoslundefined = 0_u32
  Msoslnone = 1_u32
  Msoslmedium = 2_u32
  Msoslhigh = 3_u32
  Msodsvnomacros = 0_u32
  Msodsvunsigned = 1_u32
  Msodsvpassedtrusted = 2_u32
  Msodsvfailed = 3_u32
  Msodsvlowsecuritylevel = 4_u32
  Msodsvpassedtrustedcert = 5_u32
  STATURL_QUERYFLAG_ISCACHED = 65536_u32
  STATURL_QUERYFLAG_NOURL = 131072_u32
  STATURL_QUERYFLAG_NOTITLE = 262144_u32
  STATURL_QUERYFLAG_TOPLEVEL = 524288_u32
  STATURLFLAG_ISCACHED = 1_u32
  STATURLFLAG_ISTOPLEVEL = 2_u32
  SURFACE_LOCK_EXCLUSIVE = 1_u32
  SURFACE_LOCK_ALLOW_DISCARD = 2_u32
  SURFACE_LOCK_WAIT = 4_u32
  E_SURFACE_NOSURFACE = -2147434496_i32
  E_SURFACE_UNKNOWN_FORMAT = -2147434495_i32
  E_SURFACE_NOTMYPOINTER = -2147434494_i32
  E_SURFACE_DISCARDED = -2147434493_i32
  E_SURFACE_NODC = -2147434492_i32
  E_SURFACE_NOTMYDC = -2147434491_i32
  S_SURFACE_DISCARDED = 49155_i32
  COLOR_NO_TRANSPARENT = 4294967295_u32
  IMGDECODE_EVENT_PROGRESS = 1_u32
  IMGDECODE_EVENT_PALETTE = 2_u32
  IMGDECODE_EVENT_BEGINBITS = 4_u32
  IMGDECODE_EVENT_BITSCOMPLETE = 8_u32
  IMGDECODE_EVENT_USEDDRAW = 16_u32
  IMGDECODE_HINT_TOPDOWN = 1_u32
  IMGDECODE_HINT_BOTTOMUP = 2_u32
  IMGDECODE_HINT_FULLWIDTH = 4_u32
  MAPMIME_DEFAULT = 0_u32
  MAPMIME_CLSID = 1_u32
  MAPMIME_DISABLE = 2_u32
  MAPMIME_DEFAULT_ALWAYS = 3_u32
  TIMERMODE_NORMAL = 0_u32
  TIMERMODE_VISIBILITYAWARE = 1_u32

  CLSID_HomePageSetting = LibC::GUID.new(0x374cede0_u32, 0x873a_u16, 0x4c4f_u16, StaticArray[0xbc_u8, 0x86_u8, 0xbc_u8, 0xc8_u8, 0xcf_u8, 0x51_u8, 0x16_u8, 0xa3_u8])

  CLSID_InternetExplorerManager = LibC::GUID.new(0xdf4fcc34_u32, 0x67a_u16, 0x4e0a_u16, StaticArray[0x83_u8, 0x52_u8, 0x4a_u8, 0x1a_u8, 0x50_u8, 0x95_u8, 0x34_u8, 0x6e_u8])

  CLSID_IEWebDriverManager = LibC::GUID.new(0x90314af2_u32, 0x5250_u16, 0x47b3_u16, StaticArray[0x89_u8, 0xd8_u8, 0x62_u8, 0x95_u8, 0xfc_u8, 0x23_u8, 0xbc_u8, 0x22_u8])

  CLSID_PeerFactory = LibC::GUID.new(0x3050f4cf_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_IntelliForms = LibC::GUID.new(0x613ab92e_u32, 0x16bf_u16, 0x11d2_u16, StaticArray[0xbc_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x29_u8, 0xdb_u8])

  CLSID_HomePage = LibC::GUID.new(0x766bf2ae_u32, 0xd650_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x11_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x1d_u8, 0x2e_u8])

  CLSID_CPersistUserData = LibC::GUID.new(0x3050f48e_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CPersistDataPeer = LibC::GUID.new(0x3050f487_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CPersistShortcut = LibC::GUID.new(0x3050f4c6_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CPersistHistory = LibC::GUID.new(0x3050f4c8_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CPersistSnapshot = LibC::GUID.new(0x3050f4c9_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CDownloadBehavior = LibC::GUID.new(0x3050f5be_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_wfolders = LibC::GUID.new(0xbae31f9a_u32, 0x1b81_u16, 0x11d2_u16, StaticArray[0xa9_u8, 0x7a_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcb_u8, 0x2_u8])

  CLSID_AnchorClick = LibC::GUID.new(0x13d5413c_u32, 0x33b9_u16, 0x11d2_u16, StaticArray[0x95_u8, 0xa7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcb_u8, 0x2_u8])

  CLSID_CLayoutRect = LibC::GUID.new(0x3050f664_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CDeviceRect = LibC::GUID.new(0x3050f6d4_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_CHeaderFooter = LibC::GUID.new(0x3050f6cd_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])

  CLSID_OpenServiceManager = LibC::GUID.new(0x98870b6_u32, 0x39ea_u16, 0x480b_u16, StaticArray[0xb8_u8, 0xb5_u8, 0xdd_u8, 0x1_u8, 0x67_u8, 0xc4_u8, 0xdb_u8, 0x59_u8])

  CLSID_OpenServiceActivityManager = LibC::GUID.new(0xc5efd803_u32, 0x50f8_u16, 0x43cd_u16, StaticArray[0x9a_u8, 0xb8_u8, 0xaa_u8, 0xfc_u8, 0x13_u8, 0x94_u8, 0xc9_u8, 0xe0_u8])

  CLSID_CoDitherToRGB8 = LibC::GUID.new(0xa860ce50_u32, 0x3910_u16, 0x11d0_u16, StaticArray[0x86_u8, 0xfc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x13_u8, 0xf7_u8, 0x50_u8])

  CLSID_CoSniffStream = LibC::GUID.new(0x6a01fda0_u32, 0x30df_u16, 0x11d0_u16, StaticArray[0xb7_u8, 0x24_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x1a_u8, 0x1_u8])

  CLSID_CoMapMIMEToCLSID = LibC::GUID.new(0x30c3b080_u32, 0x30fb_u16, 0x11d0_u16, StaticArray[0xb7_u8, 0x24_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x1a_u8, 0x1_u8])

  enum ExtensionValidationContexts
    ExtensionValidationContextNone = 0_i32
    ExtensionValidationContextDynamic = 1_i32
    ExtensionValidationContextParsed = 2_i32
  end
  enum ExtensionValidationResults
    ExtensionValidationResultNone = 0_i32
    ExtensionValidationResultDoNotInstantiate = 1_i32
    ExtensionValidationResultArrestPageLoad = 2_i32
  end
  enum FINDFRAME_FLAGS
    FINDFRAME_NONE = 0_i32
    FINDFRAME_JUSTTESTEXISTENCE = 1_i32
    FINDFRAME_INTERNAL = -2147483648_i32
  end
  enum FRAMEOPTIONS_FLAGS
    FRAMEOPTIONS_SCROLL_YES = 1_i32
    FRAMEOPTIONS_SCROLL_NO = 2_i32
    FRAMEOPTIONS_SCROLL_AUTO = 4_i32
    FRAMEOPTIONS_NORESIZE = 8_i32
    FRAMEOPTIONS_NO3DBORDER = 16_i32
    FRAMEOPTIONS_DESKTOP = 32_i32
    FRAMEOPTIONS_BROWSERBAND = 64_i32
  end
  enum NAVIGATEFRAME_FLAGS
    NAVIGATEFRAME_FL_RECORD = 1_i32
    NAVIGATEFRAME_FL_POST = 2_i32
    NAVIGATEFRAME_FL_NO_DOC_CACHE = 4_i32
    NAVIGATEFRAME_FL_NO_IMAGE_CACHE = 8_i32
    NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK = 16_i32
    NAVIGATEFRAME_FL_SENDING_FROM_FORM = 32_i32
    NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM = 64_i32
  end
  enum MEDIA_ACTIVITY_NOTIFY_TYPE
    MediaPlayback = 0_i32
    MediaRecording = 1_i32
    MediaCasting = 2_i32
  end
  enum SCROLLABLECONTEXTMENU_PLACEMENT
    SCMP_TOP = 0_i32
    SCMP_BOTTOM = 1_i32
    SCMP_LEFT = 2_i32
    SCMP_RIGHT = 3_i32
    SCMP_FULL = 4_i32
  end
  enum INTERNETEXPLORERCONFIGURATION
    INTERNETEXPLORERCONFIGURATION_HOST = 1_i32
    INTERNETEXPLORERCONFIGURATION_WEB_DRIVER = 2_i32
    INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE = 4_i32
  end
  enum IELAUNCHOPTION_FLAGS
    IELAUNCHOPTION_SCRIPTDEBUG = 1_i32
    IELAUNCHOPTION_FORCE_COMPAT = 2_i32
    IELAUNCHOPTION_FORCE_EDGE = 4_i32
    IELAUNCHOPTION_LOCK_ENGINE = 8_i32
  end
  enum OpenServiceErrors
    OS_E_NOTFOUND = -2147287038_i32
    OS_E_NOTSUPPORTED = -2147467231_i32
    OS_E_CANCELLED = -2147471631_i32
    OS_E_GPDISABLED = -1072886820_i32
  end
  enum OpenServiceActivityContentType
    ActivityContentNone = -1_i32
    ActivityContentDocument = 0_i32
    ActivityContentSelection = 1_i32
    ActivityContentLink = 2_i32
    ActivityContentCount = 3_i32
  end
  enum ADDURL_FLAG
    ADDURL_FIRST = 0_i32
    ADDURL_ADDTOHISTORYANDCACHE = 0_i32
    ADDURL_ADDTOCACHE = 1_i32
    ADDURL_Max = 2147483647_i32
  end

  @[Extern]
  struct NAVIGATEDATA
    property ulTarget : UInt32
    property ulURL : UInt32
    property ulRefURL : UInt32
    property ulPostData : UInt32
    property dwFlags : UInt32
    def initialize(@ulTarget : UInt32, @ulURL : UInt32, @ulRefURL : UInt32, @ulPostData : UInt32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct IELAUNCHURLINFO
    property cbSize : UInt32
    property dwCreationFlags : UInt32
    property dwLaunchOptionFlags : UInt32
    def initialize(@cbSize : UInt32, @dwCreationFlags : UInt32, @dwLaunchOptionFlags : UInt32)
    end
  end

  @[Extern]
  struct STATURL
    property cbSize : UInt32
    property pwcsUrl : Win32cr::Foundation::PWSTR
    property pwcsTitle : Win32cr::Foundation::PWSTR
    property ftLastVisited : Win32cr::Foundation::FILETIME
    property ftLastUpdated : Win32cr::Foundation::FILETIME
    property ftExpires : Win32cr::Foundation::FILETIME
    property dwFlags : UInt32
    def initialize(@cbSize : UInt32, @pwcsUrl : Win32cr::Foundation::PWSTR, @pwcsTitle : Win32cr::Foundation::PWSTR, @ftLastVisited : Win32cr::Foundation::FILETIME, @ftLastUpdated : Win32cr::Foundation::FILETIME, @ftExpires : Win32cr::Foundation::FILETIME, @dwFlags : UInt32)
    end
  end

  @[Extern]

  record IDocObjectServiceVtable,
    query_interface : Proc(IDocObjectService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDocObjectService*, UInt32),
    release : Proc(IDocObjectService*, UInt32),
    fire_before_navigate2 : Proc(IDocObjectService*, Void*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    fire_navigate_complete2 : Proc(IDocObjectService*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    fire_download_begin : Proc(IDocObjectService*, Win32cr::Foundation::HRESULT),
    fire_download_complete : Proc(IDocObjectService*, Win32cr::Foundation::HRESULT),
    fire_document_complete : Proc(IDocObjectService*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    update_desktop_component : Proc(IDocObjectService*, Void*, Win32cr::Foundation::HRESULT),
    get_pending_url : Proc(IDocObjectService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    active_element_changed : Proc(IDocObjectService*, Void*, Win32cr::Foundation::HRESULT),
    get_url_search_component : Proc(IDocObjectService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_error_url : Proc(IDocObjectService*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDocObjectService, lpVtbl : IDocObjectServiceVtable* do
    GUID = LibC::GUID.new(0x3050f801_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IDocObjectService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDocObjectService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDocObjectService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def fire_before_navigate2(this : IDocObjectService*, pDispatch : Void*, lpszUrl : Win32cr::Foundation::PWSTR, dwFlags : UInt32, lpszFrameName : Win32cr::Foundation::PWSTR, pPostData : UInt8*, cbPostData : UInt32, lpszHeaders : Win32cr::Foundation::PWSTR, fPlayNavSound : Win32cr::Foundation::BOOL, pfCancel : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_before_navigate2.call(this, pDispatch, lpszUrl, dwFlags, lpszFrameName, pPostData, cbPostData, lpszHeaders, fPlayNavSound, pfCancel)
    end
    def fire_navigate_complete2(this : IDocObjectService*, pHTMLWindow2 : Void*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_navigate_complete2.call(this, pHTMLWindow2, dwFlags)
    end
    def fire_download_begin(this : IDocObjectService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_download_begin.call(this)
    end
    def fire_download_complete(this : IDocObjectService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_download_complete.call(this)
    end
    def fire_document_complete(this : IDocObjectService*, pHTMLWindow : Void*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_document_complete.call(this, pHTMLWindow, dwFlags)
    end
    def update_desktop_component(this : IDocObjectService*, pHTMLWindow : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_desktop_component.call(this, pHTMLWindow)
    end
    def get_pending_url(this : IDocObjectService*, pbstrPendingUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pending_url.call(this, pbstrPendingUrl)
    end
    def active_element_changed(this : IDocObjectService*, pHTMLElement : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.active_element_changed.call(this, pHTMLElement)
    end
    def get_url_search_component(this : IDocObjectService*, pbstrSearch : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url_search_component.call(this, pbstrSearch)
    end
    def is_error_url(this : IDocObjectService*, lpszUrl : Win32cr::Foundation::PWSTR, pfIsError : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_error_url.call(this, lpszUrl, pfIsError)
    end

  end

  @[Extern]

  record IDownloadManagerVtable,
    query_interface : Proc(IDownloadManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadManager*, UInt32),
    release : Proc(IDownloadManager*, UInt32),
    download : Proc(IDownloadManager*, Void*, Void*, UInt32, Int32, Win32cr::System::Com::BINDINFO*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDownloadManager, lpVtbl : IDownloadManagerVtable* do
    GUID = LibC::GUID.new(0x988934a4_u32, 0x64b_u16, 0x11d3_u16, StaticArray[0xbb_u8, 0x80_u8, 0x0_u8, 0x10_u8, 0x4b_u8, 0x35_u8, 0xe7_u8, 0xf9_u8])
    def query_interface(this : IDownloadManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def download(this : IDownloadManager*, pmk : Void*, pbc : Void*, dwBindVerb : UInt32, grfBINDF : Int32, pBindInfo : Win32cr::System::Com::BINDINFO*, pszHeaders : Win32cr::Foundation::PWSTR, pszRedir : Win32cr::Foundation::PWSTR, uiCP : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download.call(this, pmk, pbc, dwBindVerb, grfBINDF, pBindInfo, pszHeaders, pszRedir, uiCP)
    end

  end

  @[Extern]

  record IExtensionValidationVtable,
    query_interface : Proc(IExtensionValidation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtensionValidation*, UInt32),
    release : Proc(IExtensionValidation*, UInt32),
    validate : Proc(IExtensionValidation*, LibC::GUID*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, Void*, Void*, Win32cr::Web::InternetExplorer::ExtensionValidationContexts, Win32cr::Web::InternetExplorer::ExtensionValidationResults*, Win32cr::Foundation::HRESULT),
    display_name : Proc(IExtensionValidation*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtensionValidation, lpVtbl : IExtensionValidationVtable* do
    GUID = LibC::GUID.new(0x7d33f73d_u32, 0x8525_u16, 0x4e0f_u16, StaticArray[0x87_u8, 0xdb_u8, 0x83_u8, 0x2_u8, 0x88_u8, 0xba_u8, 0xff_u8, 0x44_u8])
    def query_interface(this : IExtensionValidation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtensionValidation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtensionValidation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validate(this : IExtensionValidation*, extensionGuid : LibC::GUID*, extensionModulePath : Win32cr::Foundation::PWSTR, extensionFileVersionMS : UInt32, extensionFileVersionLS : UInt32, htmlDocumentTop : Void*, htmlDocumentSubframe : Void*, htmlElement : Void*, contexts : Win32cr::Web::InternetExplorer::ExtensionValidationContexts, results : Win32cr::Web::InternetExplorer::ExtensionValidationResults*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, extensionGuid, extensionModulePath, extensionFileVersionMS, extensionFileVersionLS, htmlDocumentTop, htmlDocumentSubframe, htmlElement, contexts, results)
    end
    def display_name(this : IExtensionValidation*, displayName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_name.call(this, displayName)
    end

  end

  @[Extern]

  record IHomePageSettingVtable,
    query_interface : Proc(IHomePageSetting*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHomePageSetting*, UInt32),
    release : Proc(IHomePageSetting*, UInt32),
    set_home_page : Proc(IHomePageSetting*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    is_home_page : Proc(IHomePageSetting*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_home_page_to_browser_default : Proc(IHomePageSetting*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHomePageSetting, lpVtbl : IHomePageSettingVtable* do
    GUID = LibC::GUID.new(0xfdfc244f_u32, 0x18fa_u16, 0x4ff2_u16, StaticArray[0xb0_u8, 0x8e_u8, 0x1d_u8, 0x61_u8, 0x8f_u8, 0x3f_u8, 0xfb_u8, 0xe4_u8])
    def query_interface(this : IHomePageSetting*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHomePageSetting*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHomePageSetting*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_home_page(this : IHomePageSetting*, hwnd : Win32cr::Foundation::HWND, homePageUri : Win32cr::Foundation::PWSTR, brandingMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_home_page.call(this, hwnd, homePageUri, brandingMessage)
    end
    def is_home_page(this : IHomePageSetting*, uri : Win32cr::Foundation::PWSTR, isDefault : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_home_page.call(this, uri, isDefault)
    end
    def set_home_page_to_browser_default(this : IHomePageSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_home_page_to_browser_default.call(this)
    end

  end

  @[Extern]

  record ITargetNotifyVtable,
    query_interface : Proc(ITargetNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetNotify*, UInt32),
    release : Proc(ITargetNotify*, UInt32),
    on_create : Proc(ITargetNotify*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    on_reuse : Proc(ITargetNotify*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetNotify, lpVtbl : ITargetNotifyVtable* do
    GUID = LibC::GUID.new(0x863a99a0_u32, 0x21bc_u16, 0x11d0_u16, StaticArray[0x82_u8, 0xb4_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xc_u8, 0x29_u8, 0xc5_u8])
    def query_interface(this : ITargetNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_create(this : ITargetNotify*, pUnkDestination : Void*, cbCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_create.call(this, pUnkDestination, cbCookie)
    end
    def on_reuse(this : ITargetNotify*, pUnkDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_reuse.call(this, pUnkDestination)
    end

  end

  @[Extern]

  record ITargetNotify2Vtable,
    query_interface : Proc(ITargetNotify2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetNotify2*, UInt32),
    release : Proc(ITargetNotify2*, UInt32),
    on_create : Proc(ITargetNotify2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    on_reuse : Proc(ITargetNotify2*, Void*, Win32cr::Foundation::HRESULT),
    get_option_string : Proc(ITargetNotify2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetNotify2, lpVtbl : ITargetNotify2Vtable* do
    GUID = LibC::GUID.new(0x3050f6b1_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITargetNotify2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetNotify2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetNotify2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_create(this : ITargetNotify2*, pUnkDestination : Void*, cbCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_create.call(this, pUnkDestination, cbCookie)
    end
    def on_reuse(this : ITargetNotify2*, pUnkDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_reuse.call(this, pUnkDestination)
    end
    def get_option_string(this : ITargetNotify2*, pbstrOptions : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option_string.call(this, pbstrOptions)
    end

  end

  @[Extern]

  record ITargetFrame2Vtable,
    query_interface : Proc(ITargetFrame2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetFrame2*, UInt32),
    release : Proc(ITargetFrame2*, UInt32),
    set_frame_name : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_frame_name : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_frame : Proc(ITargetFrame2*, Void**, Win32cr::Foundation::HRESULT),
    set_frame_src : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_frame_src : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_frames_container : Proc(ITargetFrame2*, Void**, Win32cr::Foundation::HRESULT),
    set_frame_options : Proc(ITargetFrame2*, UInt32, Win32cr::Foundation::HRESULT),
    get_frame_options : Proc(ITargetFrame2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_frame_margins : Proc(ITargetFrame2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_frame_margins : Proc(ITargetFrame2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    find_frame : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_target_alias : Proc(ITargetFrame2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetFrame2, lpVtbl : ITargetFrame2Vtable* do
    GUID = LibC::GUID.new(0x86d52e11_u32, 0x94a8_u16, 0x11d0_u16, StaticArray[0x82_u8, 0xaf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd5_u8, 0xae_u8, 0x38_u8])
    def query_interface(this : ITargetFrame2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetFrame2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetFrame2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_frame_name(this : ITargetFrame2*, pszFrameName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_name.call(this, pszFrameName)
    end
    def get_frame_name(this : ITargetFrame2*, ppszFrameName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_name.call(this, ppszFrameName)
    end
    def get_parent_frame(this : ITargetFrame2*, ppunkParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_frame.call(this, ppunkParent)
    end
    def set_frame_src(this : ITargetFrame2*, pszFrameSrc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_src.call(this, pszFrameSrc)
    end
    def get_frame_src(this : ITargetFrame2*, ppszFrameSrc : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_src.call(this, ppszFrameSrc)
    end
    def get_frames_container(this : ITargetFrame2*, ppContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frames_container.call(this, ppContainer)
    end
    def set_frame_options(this : ITargetFrame2*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_options.call(this, dwFlags)
    end
    def get_frame_options(this : ITargetFrame2*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_options.call(this, pdwFlags)
    end
    def set_frame_margins(this : ITargetFrame2*, dwWidth : UInt32, dwHeight : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_margins.call(this, dwWidth, dwHeight)
    end
    def get_frame_margins(this : ITargetFrame2*, pdwWidth : UInt32*, pdwHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_margins.call(this, pdwWidth, pdwHeight)
    end
    def find_frame(this : ITargetFrame2*, pszTargetName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame.call(this, pszTargetName, dwFlags, ppunkTargetFrame)
    end
    def get_target_alias(this : ITargetFrame2*, pszTargetName : Win32cr::Foundation::PWSTR, ppszTargetAlias : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_alias.call(this, pszTargetName, ppszTargetAlias)
    end

  end

  @[Extern]

  record ITargetContainerVtable,
    query_interface : Proc(ITargetContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetContainer*, UInt32),
    release : Proc(ITargetContainer*, UInt32),
    get_frame_url : Proc(ITargetContainer*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_frames_container : Proc(ITargetContainer*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetContainer, lpVtbl : ITargetContainerVtable* do
    GUID = LibC::GUID.new(0x7847ec01_u32, 0x2bec_u16, 0x11d0_u16, StaticArray[0x82_u8, 0xb4_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xc_u8, 0x29_u8, 0xc5_u8])
    def query_interface(this : ITargetContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_frame_url(this : ITargetContainer*, ppszFrameSrc : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_url.call(this, ppszFrameSrc)
    end
    def get_frames_container(this : ITargetContainer*, ppContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frames_container.call(this, ppContainer)
    end

  end

  @[Extern]

  record ITargetFrameVtable,
    query_interface : Proc(ITargetFrame*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetFrame*, UInt32),
    release : Proc(ITargetFrame*, UInt32),
    set_frame_name : Proc(ITargetFrame*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_frame_name : Proc(ITargetFrame*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_parent_frame : Proc(ITargetFrame*, Void**, Win32cr::Foundation::HRESULT),
    find_frame : Proc(ITargetFrame*, Win32cr::Foundation::PWSTR, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_frame_src : Proc(ITargetFrame*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_frame_src : Proc(ITargetFrame*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_frames_container : Proc(ITargetFrame*, Void**, Win32cr::Foundation::HRESULT),
    set_frame_options : Proc(ITargetFrame*, UInt32, Win32cr::Foundation::HRESULT),
    get_frame_options : Proc(ITargetFrame*, UInt32*, Win32cr::Foundation::HRESULT),
    set_frame_margins : Proc(ITargetFrame*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_frame_margins : Proc(ITargetFrame*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    remote_navigate : Proc(ITargetFrame*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    on_child_frame_activate : Proc(ITargetFrame*, Void*, Win32cr::Foundation::HRESULT),
    on_child_frame_deactivate : Proc(ITargetFrame*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetFrame, lpVtbl : ITargetFrameVtable* do
    GUID = LibC::GUID.new(0xd5f78c80_u32, 0x5252_u16, 0x11cf_u16, StaticArray[0x90_u8, 0xfa_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x42_u8, 0x10_u8, 0x6e_u8])
    def query_interface(this : ITargetFrame*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetFrame*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetFrame*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_frame_name(this : ITargetFrame*, pszFrameName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_name.call(this, pszFrameName)
    end
    def get_frame_name(this : ITargetFrame*, ppszFrameName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_name.call(this, ppszFrameName)
    end
    def get_parent_frame(this : ITargetFrame*, ppunkParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_frame.call(this, ppunkParent)
    end
    def find_frame(this : ITargetFrame*, pszTargetName : Win32cr::Foundation::PWSTR, ppunkContextFrame : Void*, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame.call(this, pszTargetName, ppunkContextFrame, dwFlags, ppunkTargetFrame)
    end
    def set_frame_src(this : ITargetFrame*, pszFrameSrc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_src.call(this, pszFrameSrc)
    end
    def get_frame_src(this : ITargetFrame*, ppszFrameSrc : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_src.call(this, ppszFrameSrc)
    end
    def get_frames_container(this : ITargetFrame*, ppContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frames_container.call(this, ppContainer)
    end
    def set_frame_options(this : ITargetFrame*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_options.call(this, dwFlags)
    end
    def get_frame_options(this : ITargetFrame*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_options.call(this, pdwFlags)
    end
    def set_frame_margins(this : ITargetFrame*, dwWidth : UInt32, dwHeight : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_margins.call(this, dwWidth, dwHeight)
    end
    def get_frame_margins(this : ITargetFrame*, pdwWidth : UInt32*, pdwHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_margins.call(this, pdwWidth, pdwHeight)
    end
    def remote_navigate(this : ITargetFrame*, cLength : UInt32, pulData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remote_navigate.call(this, cLength, pulData)
    end
    def on_child_frame_activate(this : ITargetFrame*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_activate.call(this, pUnkChildFrame)
    end
    def on_child_frame_deactivate(this : ITargetFrame*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_deactivate.call(this, pUnkChildFrame)
    end

  end

  @[Extern]

  record ITargetEmbeddingVtable,
    query_interface : Proc(ITargetEmbedding*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetEmbedding*, UInt32),
    release : Proc(ITargetEmbedding*, UInt32),
    get_target_frame : Proc(ITargetEmbedding*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetEmbedding, lpVtbl : ITargetEmbeddingVtable* do
    GUID = LibC::GUID.new(0x548793c0_u32, 0x9e74_u16, 0x11cf_u16, StaticArray[0x96_u8, 0x55_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0x49_u8, 0x23_u8])
    def query_interface(this : ITargetEmbedding*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetEmbedding*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetEmbedding*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_target_frame(this : ITargetEmbedding*, ppTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_frame.call(this, ppTargetFrame)
    end

  end

  @[Extern]

  record ITargetFramePrivVtable,
    query_interface : Proc(ITargetFramePriv*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetFramePriv*, UInt32),
    release : Proc(ITargetFramePriv*, UInt32),
    find_frame_downwards : Proc(ITargetFramePriv*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    find_frame_in_context : Proc(ITargetFramePriv*, Win32cr::Foundation::PWSTR, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_child_frame_activate : Proc(ITargetFramePriv*, Void*, Win32cr::Foundation::HRESULT),
    on_child_frame_deactivate : Proc(ITargetFramePriv*, Void*, Win32cr::Foundation::HRESULT),
    navigate_hack : Proc(ITargetFramePriv*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    find_browser_by_index : Proc(ITargetFramePriv*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetFramePriv, lpVtbl : ITargetFramePrivVtable* do
    GUID = LibC::GUID.new(0x9216e421_u32, 0x2bf5_u16, 0x11d0_u16, StaticArray[0x82_u8, 0xb4_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xc_u8, 0x29_u8, 0xc5_u8])
    def query_interface(this : ITargetFramePriv*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetFramePriv*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetFramePriv*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_frame_downwards(this : ITargetFramePriv*, pszTargetName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame_downwards.call(this, pszTargetName, dwFlags, ppunkTargetFrame)
    end
    def find_frame_in_context(this : ITargetFramePriv*, pszTargetName : Win32cr::Foundation::PWSTR, punkContextFrame : Void*, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame_in_context.call(this, pszTargetName, punkContextFrame, dwFlags, ppunkTargetFrame)
    end
    def on_child_frame_activate(this : ITargetFramePriv*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_activate.call(this, pUnkChildFrame)
    end
    def on_child_frame_deactivate(this : ITargetFramePriv*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_deactivate.call(this, pUnkChildFrame)
    end
    def navigate_hack(this : ITargetFramePriv*, grfHLNF : UInt32, pbc : Void*, pibsc : Void*, pszTargetName : Win32cr::Foundation::PWSTR, pszUrl : Win32cr::Foundation::PWSTR, pszLocation : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate_hack.call(this, grfHLNF, pbc, pibsc, pszTargetName, pszUrl, pszLocation)
    end
    def find_browser_by_index(this : ITargetFramePriv*, dwID : UInt32, ppunkBrowser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_browser_by_index.call(this, dwID, ppunkBrowser)
    end

  end

  @[Extern]

  record ITargetFramePriv2Vtable,
    query_interface : Proc(ITargetFramePriv2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetFramePriv2*, UInt32),
    release : Proc(ITargetFramePriv2*, UInt32),
    find_frame_downwards : Proc(ITargetFramePriv2*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    find_frame_in_context : Proc(ITargetFramePriv2*, Win32cr::Foundation::PWSTR, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_child_frame_activate : Proc(ITargetFramePriv2*, Void*, Win32cr::Foundation::HRESULT),
    on_child_frame_deactivate : Proc(ITargetFramePriv2*, Void*, Win32cr::Foundation::HRESULT),
    navigate_hack : Proc(ITargetFramePriv2*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    find_browser_by_index : Proc(ITargetFramePriv2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    aggregated_navigation2 : Proc(ITargetFramePriv2*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITargetFramePriv2, lpVtbl : ITargetFramePriv2Vtable* do
    GUID = LibC::GUID.new(0xb2c867e6_u32, 0x69d6_u16, 0x46f2_u16, StaticArray[0xa6_u8, 0x11_u8, 0xde_u8, 0xd9_u8, 0xa4_u8, 0xbd_u8, 0x7f_u8, 0xef_u8])
    def query_interface(this : ITargetFramePriv2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetFramePriv2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetFramePriv2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_frame_downwards(this : ITargetFramePriv2*, pszTargetName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame_downwards.call(this, pszTargetName, dwFlags, ppunkTargetFrame)
    end
    def find_frame_in_context(this : ITargetFramePriv2*, pszTargetName : Win32cr::Foundation::PWSTR, punkContextFrame : Void*, dwFlags : UInt32, ppunkTargetFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_frame_in_context.call(this, pszTargetName, punkContextFrame, dwFlags, ppunkTargetFrame)
    end
    def on_child_frame_activate(this : ITargetFramePriv2*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_activate.call(this, pUnkChildFrame)
    end
    def on_child_frame_deactivate(this : ITargetFramePriv2*, pUnkChildFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_child_frame_deactivate.call(this, pUnkChildFrame)
    end
    def navigate_hack(this : ITargetFramePriv2*, grfHLNF : UInt32, pbc : Void*, pibsc : Void*, pszTargetName : Win32cr::Foundation::PWSTR, pszUrl : Win32cr::Foundation::PWSTR, pszLocation : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate_hack.call(this, grfHLNF, pbc, pibsc, pszTargetName, pszUrl, pszLocation)
    end
    def find_browser_by_index(this : ITargetFramePriv2*, dwID : UInt32, ppunkBrowser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_browser_by_index.call(this, dwID, ppunkBrowser)
    end
    def aggregated_navigation2(this : ITargetFramePriv2*, grfHLNF : UInt32, pbc : Void*, pibsc : Void*, pszTargetName : Win32cr::Foundation::PWSTR, pUri : Void*, pszLocation : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.aggregated_navigation2.call(this, grfHLNF, pbc, pibsc, pszTargetName, pUri, pszLocation)
    end

  end

  @[Extern]

  record ISurfacePresenterFlipBufferVtable,
    query_interface : Proc(ISurfacePresenterFlipBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfacePresenterFlipBuffer*, UInt32),
    release : Proc(ISurfacePresenterFlipBuffer*, UInt32),
    begin_draw : Proc(ISurfacePresenterFlipBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    end_draw : Proc(ISurfacePresenterFlipBuffer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfacePresenterFlipBuffer, lpVtbl : ISurfacePresenterFlipBufferVtable* do
    GUID = LibC::GUID.new(0xe43f4a08_u32, 0x8bbc_u16, 0x4665_u16, StaticArray[0xac_u8, 0x92_u8, 0xc5_u8, 0x5c_u8, 0xe6_u8, 0x1f_u8, 0xd7_u8, 0xe7_u8])
    def query_interface(this : ISurfacePresenterFlipBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfacePresenterFlipBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfacePresenterFlipBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_draw(this : ISurfacePresenterFlipBuffer*, riid : LibC::GUID*, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, riid, ppBuffer)
    end
    def end_draw(this : ISurfacePresenterFlipBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end

  end

  @[Extern]

  record ISurfacePresenterFlipVtable,
    query_interface : Proc(ISurfacePresenterFlip*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfacePresenterFlip*, UInt32),
    release : Proc(ISurfacePresenterFlip*, UInt32),
    present : Proc(ISurfacePresenterFlip*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(ISurfacePresenterFlip*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfacePresenterFlip, lpVtbl : ISurfacePresenterFlipVtable* do
    GUID = LibC::GUID.new(0x30510848_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ISurfacePresenterFlip*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfacePresenterFlip*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfacePresenterFlip*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def present(this : ISurfacePresenterFlip*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this)
    end
    def get_buffer(this : ISurfacePresenterFlip*, backBufferIndex : UInt32, riid : LibC::GUID*, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, backBufferIndex, riid, ppBuffer)
    end

  end

  @[Extern]

  record ISurfacePresenterFlip2Vtable,
    query_interface : Proc(ISurfacePresenterFlip2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurfacePresenterFlip2*, UInt32),
    release : Proc(ISurfacePresenterFlip2*, UInt32),
    set_rotation : Proc(ISurfacePresenterFlip2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISurfacePresenterFlip2, lpVtbl : ISurfacePresenterFlip2Vtable* do
    GUID = LibC::GUID.new(0x30510865_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ISurfacePresenterFlip2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurfacePresenterFlip2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurfacePresenterFlip2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_rotation(this : ISurfacePresenterFlip2*, dxgiRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, dxgiRotation)
    end

  end

  @[Extern]

  record IViewObjectPresentFlipSiteVtable,
    query_interface : Proc(IViewObjectPresentFlipSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewObjectPresentFlipSite*, UInt32),
    release : Proc(IViewObjectPresentFlipSite*, UInt32),
    create_surface_presenter_flip : Proc(IViewObjectPresentFlipSite*, Void*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Web::MsHtml::VIEW_OBJECT_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    get_device_luid : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    enter_full_screen : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::HRESULT),
    exit_full_screen : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::HRESULT),
    is_full_screen : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_bounding_rect : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_metrics : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::POINT*, Win32cr::Foundation::SIZE*, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    get_full_screen_size : Proc(IViewObjectPresentFlipSite*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewObjectPresentFlipSite, lpVtbl : IViewObjectPresentFlipSiteVtable* do
    GUID = LibC::GUID.new(0x30510846_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IViewObjectPresentFlipSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewObjectPresentFlipSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewObjectPresentFlipSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_surface_presenter_flip(this : IViewObjectPresentFlipSite*, pDevice : Void*, width : UInt32, height : UInt32, backBufferCount : UInt32, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, mode : Win32cr::Web::MsHtml::VIEW_OBJECT_ALPHA_MODE, ppSPFlip : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_presenter_flip.call(this, pDevice, width, height, backBufferCount, format, mode, ppSPFlip)
    end
    def get_device_luid(this : IViewObjectPresentFlipSite*, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_luid.call(this, pLuid)
    end
    def enter_full_screen(this : IViewObjectPresentFlipSite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enter_full_screen.call(this)
    end
    def exit_full_screen(this : IViewObjectPresentFlipSite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exit_full_screen.call(this)
    end
    def is_full_screen(this : IViewObjectPresentFlipSite*, pfFullScreen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_full_screen.call(this, pfFullScreen)
    end
    def get_bounding_rect(this : IViewObjectPresentFlipSite*, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rect.call(this, pRect)
    end
    def get_metrics(this : IViewObjectPresentFlipSite*, pPos : Win32cr::Foundation::POINT*, pSize : Win32cr::Foundation::SIZE*, pScaleX : Float32*, pScaleY : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metrics.call(this, pPos, pSize, pScaleX, pScaleY)
    end
    def get_full_screen_size(this : IViewObjectPresentFlipSite*, pSize : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_full_screen_size.call(this, pSize)
    end

  end

  @[Extern]

  record IViewObjectPresentFlipSite2Vtable,
    query_interface : Proc(IViewObjectPresentFlipSite2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewObjectPresentFlipSite2*, UInt32),
    release : Proc(IViewObjectPresentFlipSite2*, UInt32),
    get_rotation_for_current_output : Proc(IViewObjectPresentFlipSite2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewObjectPresentFlipSite2, lpVtbl : IViewObjectPresentFlipSite2Vtable* do
    GUID = LibC::GUID.new(0xaad0cbf1_u32, 0xe7fd_u16, 0x4f12_u16, StaticArray[0x89_u8, 0x2_u8, 0xc7_u8, 0x81_u8, 0x32_u8, 0xa8_u8, 0xe0_u8, 0x1d_u8])
    def query_interface(this : IViewObjectPresentFlipSite2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewObjectPresentFlipSite2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewObjectPresentFlipSite2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_rotation_for_current_output(this : IViewObjectPresentFlipSite2*, pDxgiRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation_for_current_output.call(this, pDxgiRotation)
    end

  end

  @[Extern]

  record IViewObjectPresentFlipVtable,
    query_interface : Proc(IViewObjectPresentFlip*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewObjectPresentFlip*, UInt32),
    release : Proc(IViewObjectPresentFlip*, UInt32),
    notify_render : Proc(IViewObjectPresentFlip*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    render_object_to_bitmap : Proc(IViewObjectPresentFlip*, Void*, Win32cr::Foundation::HRESULT),
    render_object_to_shared_buffer : Proc(IViewObjectPresentFlip*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewObjectPresentFlip, lpVtbl : IViewObjectPresentFlipVtable* do
    GUID = LibC::GUID.new(0x30510847_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IViewObjectPresentFlip*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewObjectPresentFlip*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewObjectPresentFlip*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_render(this : IViewObjectPresentFlip*, fRecreatePresenter : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_render.call(this, fRecreatePresenter)
    end
    def render_object_to_bitmap(this : IViewObjectPresentFlip*, pBitmap : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_object_to_bitmap.call(this, pBitmap)
    end
    def render_object_to_shared_buffer(this : IViewObjectPresentFlip*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_object_to_shared_buffer.call(this, pBuffer)
    end

  end

  @[Extern]

  record IViewObjectPresentFlip2Vtable,
    query_interface : Proc(IViewObjectPresentFlip2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewObjectPresentFlip2*, UInt32),
    release : Proc(IViewObjectPresentFlip2*, UInt32),
    notify_leaving_view : Proc(IViewObjectPresentFlip2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewObjectPresentFlip2, lpVtbl : IViewObjectPresentFlip2Vtable* do
    GUID = LibC::GUID.new(0x30510856_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IViewObjectPresentFlip2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewObjectPresentFlip2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewObjectPresentFlip2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_leaving_view(this : IViewObjectPresentFlip2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_leaving_view.call(this)
    end

  end

  @[Extern]

  record IActiveXUIHandlerSite2Vtable,
    query_interface : Proc(IActiveXUIHandlerSite2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveXUIHandlerSite2*, UInt32),
    release : Proc(IActiveXUIHandlerSite2*, UInt32),
    add_suspension_exemption : Proc(IActiveXUIHandlerSite2*, UInt64*, Win32cr::Foundation::HRESULT),
    remove_suspension_exemption : Proc(IActiveXUIHandlerSite2*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveXUIHandlerSite2, lpVtbl : IActiveXUIHandlerSite2Vtable* do
    GUID = LibC::GUID.new(0x7e3707b2_u32, 0xd087_u16, 0x4542_u16, StaticArray[0xac_u8, 0x1f_u8, 0xa0_u8, 0xd2_u8, 0xfc_u8, 0xd0_u8, 0x80_u8, 0xfd_u8])
    def query_interface(this : IActiveXUIHandlerSite2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveXUIHandlerSite2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveXUIHandlerSite2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_suspension_exemption(this : IActiveXUIHandlerSite2*, pullCookie : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_suspension_exemption.call(this, pullCookie)
    end
    def remove_suspension_exemption(this : IActiveXUIHandlerSite2*, ullCookie : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_suspension_exemption.call(this, ullCookie)
    end

  end

  @[Extern]

  record ICaretPositionProviderVtable,
    query_interface : Proc(ICaretPositionProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICaretPositionProvider*, UInt32),
    release : Proc(ICaretPositionProvider*, UInt32),
    get_caret_position : Proc(ICaretPositionProvider*, Win32cr::Foundation::POINT*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICaretPositionProvider, lpVtbl : ICaretPositionProviderVtable* do
    GUID = LibC::GUID.new(0x58da43a2_u32, 0x108e_u16, 0x4d5b_u16, StaticArray[0x9f_u8, 0x75_u8, 0xe5_u8, 0xf7_u8, 0x4f_u8, 0x93_u8, 0xff_u8, 0xf5_u8])
    def query_interface(this : ICaretPositionProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICaretPositionProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICaretPositionProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_caret_position(this : ICaretPositionProvider*, pptCaret : Win32cr::Foundation::POINT*, pflHeight : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caret_position.call(this, pptCaret, pflHeight)
    end

  end

  @[Extern]

  record ITridentTouchInputVtable,
    query_interface : Proc(ITridentTouchInput*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITridentTouchInput*, UInt32),
    release : Proc(ITridentTouchInput*, UInt32),
    on_pointer_message : Proc(ITridentTouchInput*, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITridentTouchInput, lpVtbl : ITridentTouchInputVtable* do
    GUID = LibC::GUID.new(0x30510850_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITridentTouchInput*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITridentTouchInput*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITridentTouchInput*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_pointer_message(this : ITridentTouchInput*, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfAllowManipulations : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_pointer_message.call(this, msg, wParam, lParam, pfAllowManipulations)
    end

  end

  @[Extern]

  record ITridentTouchInputSiteVtable,
    query_interface : Proc(ITridentTouchInputSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITridentTouchInputSite*, UInt32),
    release : Proc(ITridentTouchInputSite*, UInt32),
    set_manipulation_mode : Proc(ITridentTouchInputSite*, Win32cr::Web::MsHtml::Stylemstouchaction, Win32cr::Foundation::HRESULT),
    zoom_to_point : Proc(ITridentTouchInputSite*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITridentTouchInputSite, lpVtbl : ITridentTouchInputSiteVtable* do
    GUID = LibC::GUID.new(0x30510849_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITridentTouchInputSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITridentTouchInputSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITridentTouchInputSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_manipulation_mode(this : ITridentTouchInputSite*, msTouchAction : Win32cr::Web::MsHtml::Stylemstouchaction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manipulation_mode.call(this, msTouchAction)
    end
    def zoom_to_point(this : ITridentTouchInputSite*, x : Int32, y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom_to_point.call(this, x, y)
    end

  end

  @[Extern]

  record IMediaActivityNotifySiteVtable,
    query_interface : Proc(IMediaActivityNotifySite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaActivityNotifySite*, UInt32),
    release : Proc(IMediaActivityNotifySite*, UInt32),
    on_media_activity_started : Proc(IMediaActivityNotifySite*, Win32cr::Web::InternetExplorer::MEDIA_ACTIVITY_NOTIFY_TYPE, Win32cr::Foundation::HRESULT),
    on_media_activity_stopped : Proc(IMediaActivityNotifySite*, Win32cr::Web::InternetExplorer::MEDIA_ACTIVITY_NOTIFY_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMediaActivityNotifySite, lpVtbl : IMediaActivityNotifySiteVtable* do
    GUID = LibC::GUID.new(0x8165cfef_u32, 0x179d_u16, 0x46c2_u16, StaticArray[0xbc_u8, 0x71_u8, 0x3f_u8, 0xa7_u8, 0x26_u8, 0xdc_u8, 0x1f_u8, 0x8d_u8])
    def query_interface(this : IMediaActivityNotifySite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaActivityNotifySite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaActivityNotifySite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_media_activity_started(this : IMediaActivityNotifySite*, mediaActivityType : Win32cr::Web::InternetExplorer::MEDIA_ACTIVITY_NOTIFY_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_media_activity_started.call(this, mediaActivityType)
    end
    def on_media_activity_stopped(this : IMediaActivityNotifySite*, mediaActivityType : Win32cr::Web::InternetExplorer::MEDIA_ACTIVITY_NOTIFY_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_media_activity_stopped.call(this, mediaActivityType)
    end

  end

  @[Extern]

  record IAudioSessionSiteVtable,
    query_interface : Proc(IAudioSessionSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioSessionSite*, UInt32),
    release : Proc(IAudioSessionSite*, UInt32),
    get_audio_session_guid : Proc(IAudioSessionSite*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_audio_stream_created : Proc(IAudioSessionSite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_audio_stream_destroyed : Proc(IAudioSessionSite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAudioSessionSite, lpVtbl : IAudioSessionSiteVtable* do
    GUID = LibC::GUID.new(0xd7d8b684_u32, 0xd02d_u16, 0x4517_u16, StaticArray[0xb6_u8, 0xb7_u8, 0x19_u8, 0xe3_u8, 0xdf_u8, 0xe2_u8, 0x9c_u8, 0x45_u8])
    def query_interface(this : IAudioSessionSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioSessionSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioSessionSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_audio_session_guid(this : IAudioSessionSite*, audioSessionGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_audio_session_guid.call(this, audioSessionGuid)
    end
    def on_audio_stream_created(this : IAudioSessionSite*, endpointID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_audio_stream_created.call(this, endpointID)
    end
    def on_audio_stream_destroyed(this : IAudioSessionSite*, endpointID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_audio_stream_destroyed.call(this, endpointID)
    end

  end

  @[Extern]

  record IPrintTaskRequestHandlerVtable,
    query_interface : Proc(IPrintTaskRequestHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintTaskRequestHandler*, UInt32),
    release : Proc(IPrintTaskRequestHandler*, UInt32),
    handle_print_task_request : Proc(IPrintTaskRequestHandler*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPrintTaskRequestHandler, lpVtbl : IPrintTaskRequestHandlerVtable* do
    GUID = LibC::GUID.new(0x191cd340_u32, 0xcf36_u16, 0x44ff_u16, StaticArray[0xbd_u8, 0x53_u8, 0xd1_u8, 0xb7_u8, 0x1_u8, 0x79_u8, 0x9d_u8, 0x9b_u8])
    def query_interface(this : IPrintTaskRequestHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintTaskRequestHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintTaskRequestHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_print_task_request(this : IPrintTaskRequestHandler*, pPrintTaskRequest : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_print_task_request.call(this, pPrintTaskRequest)
    end

  end

  @[Extern]

  record IPrintTaskRequestFactoryVtable,
    query_interface : Proc(IPrintTaskRequestFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintTaskRequestFactory*, UInt32),
    release : Proc(IPrintTaskRequestFactory*, UInt32),
    create_print_task_request : Proc(IPrintTaskRequestFactory*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPrintTaskRequestFactory, lpVtbl : IPrintTaskRequestFactoryVtable* do
    GUID = LibC::GUID.new(0xbb516745_u32, 0x8c34_u16, 0x4f8b_u16, StaticArray[0x96_u8, 0x5_u8, 0x68_u8, 0x4d_u8, 0xcb_u8, 0x14_u8, 0x4b_u8, 0xe5_u8])
    def query_interface(this : IPrintTaskRequestFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintTaskRequestFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintTaskRequestFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_print_task_request(this : IPrintTaskRequestFactory*, pPrintTaskRequestHandler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_print_task_request.call(this, pPrintTaskRequestHandler)
    end

  end

  @[Extern]

  record IScrollableContextMenuVtable,
    query_interface : Proc(IScrollableContextMenu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScrollableContextMenu*, UInt32),
    release : Proc(IScrollableContextMenu*, UInt32),
    add_item : Proc(IScrollableContextMenu*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    show_modal : Proc(IScrollableContextMenu*, Int32, Int32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScrollableContextMenu, lpVtbl : IScrollableContextMenuVtable* do
    GUID = LibC::GUID.new(0x30510854_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IScrollableContextMenu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScrollableContextMenu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScrollableContextMenu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IScrollableContextMenu*, itemText : Win32cr::Foundation::PWSTR, cmdID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, itemText, cmdID)
    end
    def show_modal(this : IScrollableContextMenu*, x : Int32, y : Int32, cmdID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_modal.call(this, x, y, cmdID)
    end

  end

  @[Extern]

  record IScrollableContextMenu2Vtable,
    query_interface : Proc(IScrollableContextMenu2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScrollableContextMenu2*, UInt32),
    release : Proc(IScrollableContextMenu2*, UInt32),
    add_item : Proc(IScrollableContextMenu2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    show_modal : Proc(IScrollableContextMenu2*, Int32, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    add_separator : Proc(IScrollableContextMenu2*, Win32cr::Foundation::HRESULT),
    set_placement : Proc(IScrollableContextMenu2*, Win32cr::Web::InternetExplorer::SCROLLABLECONTEXTMENU_PLACEMENT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScrollableContextMenu2, lpVtbl : IScrollableContextMenu2Vtable* do
    GUID = LibC::GUID.new(0xf77e9056_u32, 0x8674_u16, 0x4936_u16, StaticArray[0x92_u8, 0x4c_u8, 0xe_u8, 0x4a_u8, 0x6_u8, 0xfa_u8, 0x63_u8, 0x4a_u8])
    def query_interface(this : IScrollableContextMenu2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScrollableContextMenu2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScrollableContextMenu2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IScrollableContextMenu2*, itemText : Win32cr::Foundation::PWSTR, cmdID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, itemText, cmdID)
    end
    def show_modal(this : IScrollableContextMenu2*, x : Int32, y : Int32, cmdID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_modal.call(this, x, y, cmdID)
    end
    def add_separator(this : IScrollableContextMenu2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_separator.call(this)
    end
    def set_placement(this : IScrollableContextMenu2*, scmp : Win32cr::Web::InternetExplorer::SCROLLABLECONTEXTMENU_PLACEMENT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_placement.call(this, scmp)
    end

  end

  @[Extern]

  record IActiveXUIHandlerSiteVtable,
    query_interface : Proc(IActiveXUIHandlerSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveXUIHandlerSite*, UInt32),
    release : Proc(IActiveXUIHandlerSite*, UInt32),
    create_scrollable_context_menu : Proc(IActiveXUIHandlerSite*, Void**, Win32cr::Foundation::HRESULT),
    pick_file_and_get_result : Proc(IActiveXUIHandlerSite*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveXUIHandlerSite, lpVtbl : IActiveXUIHandlerSiteVtable* do
    GUID = LibC::GUID.new(0x30510853_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IActiveXUIHandlerSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveXUIHandlerSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveXUIHandlerSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_scrollable_context_menu(this : IActiveXUIHandlerSite*, scrollableContextMenu : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scrollable_context_menu.call(this, scrollableContextMenu)
    end
    def pick_file_and_get_result(this : IActiveXUIHandlerSite*, filePicker : Void*, allowMultipleSelections : Win32cr::Foundation::BOOL, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pick_file_and_get_result.call(this, filePicker, allowMultipleSelections, result)
    end

  end

  @[Extern]

  record IActiveXUIHandlerSite3Vtable,
    query_interface : Proc(IActiveXUIHandlerSite3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveXUIHandlerSite3*, UInt32),
    release : Proc(IActiveXUIHandlerSite3*, UInt32),
    message_box_w : Proc(IActiveXUIHandlerSite3*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveXUIHandlerSite3, lpVtbl : IActiveXUIHandlerSite3Vtable* do
    GUID = LibC::GUID.new(0x7904009a_u32, 0x1238_u16, 0x47f4_u16, StaticArray[0x90_u8, 0x1c_u8, 0x87_u8, 0x13_u8, 0x75_u8, 0xc3_u8, 0x46_u8, 0x8_u8])
    def query_interface(this : IActiveXUIHandlerSite3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveXUIHandlerSite3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveXUIHandlerSite3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def message_box_w(this : IActiveXUIHandlerSite3*, hwnd : Win32cr::Foundation::HWND, text : Win32cr::Foundation::PWSTR, caption : Win32cr::Foundation::PWSTR, type__ : UInt32, result : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.message_box_w.call(this, hwnd, text, caption, type__, result)
    end

  end

  @[Extern]

  record IEnumManagerFramesVtable,
    query_interface : Proc(IEnumManagerFrames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumManagerFrames*, UInt32),
    release : Proc(IEnumManagerFrames*, UInt32),
    next__ : Proc(IEnumManagerFrames*, UInt32, Win32cr::Foundation::HWND**, UInt32*, Win32cr::Foundation::HRESULT),
    count : Proc(IEnumManagerFrames*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumManagerFrames*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumManagerFrames*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumManagerFrames*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumManagerFrames, lpVtbl : IEnumManagerFramesVtable* do
    GUID = LibC::GUID.new(0x3caa826a_u32, 0x9b1f_u16, 0x4a79_u16, StaticArray[0xbc_u8, 0x81_u8, 0xf0_u8, 0x43_u8, 0xd_u8, 0xed_u8, 0x16_u8, 0x48_u8])
    def query_interface(this : IEnumManagerFrames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumManagerFrames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumManagerFrames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumManagerFrames*, celt : UInt32, ppWindows : Win32cr::Foundation::HWND**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppWindows, pceltFetched)
    end
    def count(this : IEnumManagerFrames*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count.call(this, pcelt)
    end
    def skip(this : IEnumManagerFrames*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumManagerFrames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumManagerFrames*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]

  record IInternetExplorerManagerVtable,
    query_interface : Proc(IInternetExplorerManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInternetExplorerManager*, UInt32),
    release : Proc(IInternetExplorerManager*, UInt32),
    create_object : Proc(IInternetExplorerManager*, UInt32, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInternetExplorerManager, lpVtbl : IInternetExplorerManagerVtable* do
    GUID = LibC::GUID.new(0xacc84351_u32, 0x4ff_u16, 0x44f9_u16, StaticArray[0xb2_u8, 0x3f_u8, 0x65_u8, 0x5e_u8, 0xd1_u8, 0x68_u8, 0xc6_u8, 0xd5_u8])
    def query_interface(this : IInternetExplorerManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInternetExplorerManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInternetExplorerManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_object(this : IInternetExplorerManager*, dwConfig : UInt32, pszURL : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object.call(this, dwConfig, pszURL, riid, ppv)
    end

  end

  @[Extern]

  record IInternetExplorerManager2Vtable,
    query_interface : Proc(IInternetExplorerManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInternetExplorerManager2*, UInt32),
    release : Proc(IInternetExplorerManager2*, UInt32),
    enum_frame_windows : Proc(IInternetExplorerManager2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInternetExplorerManager2, lpVtbl : IInternetExplorerManager2Vtable* do
    GUID = LibC::GUID.new(0xdfbb5136_u32, 0x9259_u16, 0x4895_u16, StaticArray[0xb4_u8, 0xa7_u8, 0xc1_u8, 0x93_u8, 0x44_u8, 0x29_u8, 0x91_u8, 0x9a_u8])
    def query_interface(this : IInternetExplorerManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInternetExplorerManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInternetExplorerManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_frame_windows(this : IInternetExplorerManager2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_frame_windows.call(this, ppEnum)
    end

  end

  @[Extern]

  record IIEWebDriverSiteVtable,
    query_interface : Proc(IIEWebDriverSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIEWebDriverSite*, UInt32),
    release : Proc(IIEWebDriverSite*, UInt32),
    get_type_info_count : Proc(IIEWebDriverSite*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IIEWebDriverSite*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IIEWebDriverSite*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IIEWebDriverSite*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    window_operation : Proc(IIEWebDriverSite*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    detach_webdriver : Proc(IIEWebDriverSite*, Void*, Win32cr::Foundation::HRESULT),
    get_capability_value : Proc(IIEWebDriverSite*, Void*, Win32cr::Foundation::PWSTR, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIEWebDriverSite, lpVtbl : IIEWebDriverSiteVtable* do
    GUID = LibC::GUID.new(0xffb84444_u32, 0x453d_u16, 0x4fbc_u16, StaticArray[0x9f_u8, 0x9d_u8, 0x8d_u8, 0xb5_u8, 0xc4_u8, 0x71_u8, 0xec_u8, 0x75_u8])
    def query_interface(this : IIEWebDriverSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIEWebDriverSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIEWebDriverSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IIEWebDriverSite*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IIEWebDriverSite*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IIEWebDriverSite*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IIEWebDriverSite*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def window_operation(this : IIEWebDriverSite*, operationCode : UInt32, hWnd : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.window_operation.call(this, operationCode, hWnd)
    end
    def detach_webdriver(this : IIEWebDriverSite*, pUnkWD : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach_webdriver.call(this, pUnkWD)
    end
    def get_capability_value(this : IIEWebDriverSite*, pUnkWD : Void*, capName : Win32cr::Foundation::PWSTR, capValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capability_value.call(this, pUnkWD, capName, capValue)
    end

  end

  @[Extern]

  record IIEWebDriverManagerVtable,
    query_interface : Proc(IIEWebDriverManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIEWebDriverManager*, UInt32),
    release : Proc(IIEWebDriverManager*, UInt32),
    get_type_info_count : Proc(IIEWebDriverManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IIEWebDriverManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IIEWebDriverManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IIEWebDriverManager*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    execute_command : Proc(IIEWebDriverManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIEWebDriverManager, lpVtbl : IIEWebDriverManagerVtable* do
    GUID = LibC::GUID.new(0xbd1dc630_u32, 0x6590_u16, 0x4ca2_u16, StaticArray[0xa2_u8, 0x93_u8, 0x6b_u8, 0xc7_u8, 0x2b_u8, 0x24_u8, 0x38_u8, 0xd8_u8])
    def query_interface(this : IIEWebDriverManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIEWebDriverManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIEWebDriverManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IIEWebDriverManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IIEWebDriverManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IIEWebDriverManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IIEWebDriverManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def execute_command(this : IIEWebDriverManager*, command : Win32cr::Foundation::PWSTR, response : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_command.call(this, command, response)
    end

  end

  @[Extern]

  record IPeerFactoryVtable,
    query_interface : Proc(IPeerFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPeerFactory*, UInt32),
    release : Proc(IPeerFactory*, UInt32)


  @[Extern]
  record IPeerFactory, lpVtbl : IPeerFactoryVtable* do
    GUID = LibC::GUID.new(0x6663f9d3_u32, 0xb482_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xc6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xbf_u8, 0xc4_u8])
    def query_interface(this : IPeerFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPeerFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPeerFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]

  record IHomePageVtable,
    query_interface : Proc(IHomePage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHomePage*, UInt32),
    release : Proc(IHomePage*, UInt32),
    get_type_info_count : Proc(IHomePage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IHomePage*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IHomePage*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IHomePage*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    navigateHomePage : Proc(IHomePage*, Win32cr::Foundation::HRESULT),
    setHomePage : Proc(IHomePage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    isHomePage : Proc(IHomePage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHomePage, lpVtbl : IHomePageVtable* do
    GUID = LibC::GUID.new(0x766bf2af_u32, 0xd650_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x11_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x1d_u8, 0x2e_u8])
    def query_interface(this : IHomePage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHomePage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHomePage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IHomePage*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IHomePage*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IHomePage*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IHomePage*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def navigateHomePage(this : IHomePage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigateHomePage.call(this)
    end
    def setHomePage(this : IHomePage*, bstrURL : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setHomePage.call(this, bstrURL)
    end
    def isHomePage(this : IHomePage*, bstrURL : Win32cr::Foundation::BSTR, p : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.isHomePage.call(this, bstrURL, p)
    end

  end

  @[Extern]

  record IIntelliFormsVtable,
    query_interface : Proc(IIntelliForms*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIntelliForms*, UInt32),
    release : Proc(IIntelliForms*, UInt32),
    get_type_info_count : Proc(IIntelliForms*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IIntelliForms*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IIntelliForms*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IIntelliForms*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_enabled : Proc(IIntelliForms*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    put_enabled : Proc(IIntelliForms*, Win32cr::Foundation::VARIANT_BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIntelliForms, lpVtbl : IIntelliFormsVtable* do
    GUID = LibC::GUID.new(0x9b9f68e6_u32, 0x1aaa_u16, 0x11d2_u16, StaticArray[0xbc_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x29_u8, 0xdb_u8])
    def query_interface(this : IIntelliForms*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIntelliForms*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIntelliForms*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IIntelliForms*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IIntelliForms*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IIntelliForms*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IIntelliForms*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_enabled(this : IIntelliForms*, pVal : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enabled.call(this, pVal)
    end
    def put_enabled(this : IIntelliForms*, bVal : Win32cr::Foundation::VARIANT_BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_enabled.call(this, bVal)
    end

  end

  @[Extern]

  record IwfoldersVtable,
    query_interface : Proc(Iwfolders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Iwfolders*, UInt32),
    release : Proc(Iwfolders*, UInt32),
    get_type_info_count : Proc(Iwfolders*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Iwfolders*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Iwfolders*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(Iwfolders*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    navigate : Proc(Iwfolders*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    navigateFrame : Proc(Iwfolders*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    navigateNoSite : Proc(Iwfolders*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Iwfolders, lpVtbl : IwfoldersVtable* do
    GUID = LibC::GUID.new(0xbae31f98_u32, 0x1b81_u16, 0x11d2_u16, StaticArray[0xa9_u8, 0x7a_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcb_u8, 0x2_u8])
    def query_interface(this : Iwfolders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Iwfolders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Iwfolders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Iwfolders*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Iwfolders*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Iwfolders*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : Iwfolders*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def navigate(this : Iwfolders*, bstrUrl : Win32cr::Foundation::BSTR, pbstrRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate.call(this, bstrUrl, pbstrRetVal)
    end
    def navigateFrame(this : Iwfolders*, bstrUrl : Win32cr::Foundation::BSTR, bstrTargetFrame : Win32cr::Foundation::BSTR, pbstrRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigateFrame.call(this, bstrUrl, bstrTargetFrame, pbstrRetVal)
    end
    def navigateNoSite(this : Iwfolders*, bstrUrl : Win32cr::Foundation::BSTR, bstrTargetFrame : Win32cr::Foundation::BSTR, dwhwnd : UInt32, pwb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigateNoSite.call(this, bstrUrl, bstrTargetFrame, dwhwnd, pwb)
    end

  end

  @[Extern]

  record IAnchorClickVtable,
    query_interface : Proc(IAnchorClick*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAnchorClick*, UInt32),
    release : Proc(IAnchorClick*, UInt32),
    get_type_info_count : Proc(IAnchorClick*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAnchorClick*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAnchorClick*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IAnchorClick*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    proc_on_click : Proc(IAnchorClick*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAnchorClick, lpVtbl : IAnchorClickVtable* do
    GUID = LibC::GUID.new(0x13d5413b_u32, 0x33b9_u16, 0x11d2_u16, StaticArray[0x95_u8, 0xa7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcb_u8, 0x2_u8])
    def query_interface(this : IAnchorClick*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAnchorClick*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAnchorClick*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAnchorClick*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAnchorClick*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAnchorClick*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IAnchorClick*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def proc_on_click(this : IAnchorClick*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.proc_on_click.call(this)
    end

  end

  @[Extern]

  record IHTMLUserDataOMVtable,
    query_interface : Proc(IHTMLUserDataOM*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHTMLUserDataOM*, UInt32),
    release : Proc(IHTMLUserDataOM*, UInt32),
    get_type_info_count : Proc(IHTMLUserDataOM*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IHTMLUserDataOM*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IHTMLUserDataOM*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IHTMLUserDataOM*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_XMLDocument : Proc(IHTMLUserDataOM*, Void**, Win32cr::Foundation::HRESULT),
    save : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    load : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    getAttribute : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    setAttribute : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::System::Variant::VARIANT, Win32cr::Foundation::HRESULT),
    removeAttribute : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_expires : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_expires : Proc(IHTMLUserDataOM*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHTMLUserDataOM, lpVtbl : IHTMLUserDataOMVtable* do
    GUID = LibC::GUID.new(0x3050f48f_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IHTMLUserDataOM*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHTMLUserDataOM*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHTMLUserDataOM*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IHTMLUserDataOM*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IHTMLUserDataOM*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IHTMLUserDataOM*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IHTMLUserDataOM*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_XMLDocument(this : IHTMLUserDataOM*, p : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XMLDocument.call(this, p)
    end
    def save(this : IHTMLUserDataOM*, strName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, strName)
    end
    def load(this : IHTMLUserDataOM*, strName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, strName)
    end
    def getAttribute(this : IHTMLUserDataOM*, name : Win32cr::Foundation::BSTR, pValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.getAttribute.call(this, name, pValue)
    end
    def setAttribute(this : IHTMLUserDataOM*, name : Win32cr::Foundation::BSTR, value : Win32cr::System::Variant::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setAttribute.call(this, name, value)
    end
    def removeAttribute(this : IHTMLUserDataOM*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.removeAttribute.call(this, name)
    end
    def put_expires(this : IHTMLUserDataOM*, bstr : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_expires.call(this, bstr)
    end
    def get_expires(this : IHTMLUserDataOM*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_expires.call(this, pbstr)
    end

  end

  @[Extern]

  record IHTMLPersistDataOMVtable,
    query_interface : Proc(IHTMLPersistDataOM*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHTMLPersistDataOM*, UInt32),
    release : Proc(IHTMLPersistDataOM*, UInt32),
    get_type_info_count : Proc(IHTMLPersistDataOM*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IHTMLPersistDataOM*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IHTMLPersistDataOM*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IHTMLPersistDataOM*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_XMLDocument : Proc(IHTMLPersistDataOM*, Void**, Win32cr::Foundation::HRESULT),
    getAttribute : Proc(IHTMLPersistDataOM*, Win32cr::Foundation::BSTR, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    setAttribute : Proc(IHTMLPersistDataOM*, Win32cr::Foundation::BSTR, Win32cr::System::Variant::VARIANT, Win32cr::Foundation::HRESULT),
    removeAttribute : Proc(IHTMLPersistDataOM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHTMLPersistDataOM, lpVtbl : IHTMLPersistDataOMVtable* do
    GUID = LibC::GUID.new(0x3050f4c0_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IHTMLPersistDataOM*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHTMLPersistDataOM*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHTMLPersistDataOM*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IHTMLPersistDataOM*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IHTMLPersistDataOM*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IHTMLPersistDataOM*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IHTMLPersistDataOM*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_XMLDocument(this : IHTMLPersistDataOM*, p : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XMLDocument.call(this, p)
    end
    def getAttribute(this : IHTMLPersistDataOM*, name : Win32cr::Foundation::BSTR, pValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.getAttribute.call(this, name, pValue)
    end
    def setAttribute(this : IHTMLPersistDataOM*, name : Win32cr::Foundation::BSTR, value : Win32cr::System::Variant::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setAttribute.call(this, name, value)
    end
    def removeAttribute(this : IHTMLPersistDataOM*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.removeAttribute.call(this, name)
    end

  end

  @[Extern]

  record IHTMLPersistDataVtable,
    query_interface : Proc(IHTMLPersistData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHTMLPersistData*, UInt32),
    release : Proc(IHTMLPersistData*, UInt32),
    save : Proc(IHTMLPersistData*, Void*, Int32, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    load : Proc(IHTMLPersistData*, Void*, Int32, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    queryType : Proc(IHTMLPersistData*, Int32, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHTMLPersistData, lpVtbl : IHTMLPersistDataVtable* do
    GUID = LibC::GUID.new(0x3050f4c5_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IHTMLPersistData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHTMLPersistData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHTMLPersistData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def save(this : IHTMLPersistData*, pUnk : Void*, lType : Int32, fContinueBroacast : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pUnk, lType, fContinueBroacast)
    end
    def load(this : IHTMLPersistData*, pUnk : Void*, lType : Int32, fDoDefault : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pUnk, lType, fDoDefault)
    end
    def queryType(this : IHTMLPersistData*, lType : Int32, pfSupportsType : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queryType.call(this, lType, pfSupportsType)
    end

  end

  @[Extern]

  record IDownloadBehaviorVtable,
    query_interface : Proc(IDownloadBehavior*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadBehavior*, UInt32),
    release : Proc(IDownloadBehavior*, UInt32),
    get_type_info_count : Proc(IDownloadBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadBehavior*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadBehavior*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IDownloadBehavior*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    startDownload : Proc(IDownloadBehavior*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDownloadBehavior, lpVtbl : IDownloadBehaviorVtable* do
    GUID = LibC::GUID.new(0x3050f5bd_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IDownloadBehavior*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadBehavior*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadBehavior*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadBehavior*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadBehavior*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadBehavior*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IDownloadBehavior*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def startDownload(this : IDownloadBehavior*, bstrUrl : Win32cr::Foundation::BSTR, pdispCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.startDownload.call(this, bstrUrl, pdispCallback)
    end

  end

  @[Extern]

  record ILayoutRectVtable,
    query_interface : Proc(ILayoutRect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILayoutRect*, UInt32),
    release : Proc(ILayoutRect*, UInt32),
    get_type_info_count : Proc(ILayoutRect*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILayoutRect*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILayoutRect*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(ILayoutRect*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_nextRect : Proc(ILayoutRect*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_nextRect : Proc(ILayoutRect*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_contentSrc : Proc(ILayoutRect*, Win32cr::System::Variant::VARIANT, Win32cr::Foundation::HRESULT),
    get_contentSrc : Proc(ILayoutRect*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    put_honorPageBreaks : Proc(ILayoutRect*, Win32cr::Foundation::VARIANT_BOOL, Win32cr::Foundation::HRESULT),
    get_honorPageBreaks : Proc(ILayoutRect*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    put_honorPageRules : Proc(ILayoutRect*, Win32cr::Foundation::VARIANT_BOOL, Win32cr::Foundation::HRESULT),
    get_honorPageRules : Proc(ILayoutRect*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    put_nextRectElement : Proc(ILayoutRect*, Void*, Win32cr::Foundation::HRESULT),
    get_nextRectElement : Proc(ILayoutRect*, Void**, Win32cr::Foundation::HRESULT),
    get_contentDocument : Proc(ILayoutRect*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILayoutRect, lpVtbl : ILayoutRectVtable* do
    GUID = LibC::GUID.new(0x3050f665_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ILayoutRect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILayoutRect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILayoutRect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILayoutRect*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILayoutRect*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILayoutRect*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : ILayoutRect*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_nextRect(this : ILayoutRect*, bstrElementId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_nextRect.call(this, bstrElementId)
    end
    def get_nextRect(this : ILayoutRect*, pbstrElementId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_nextRect.call(this, pbstrElementId)
    end
    def put_contentSrc(this : ILayoutRect*, varContentSrc : Win32cr::System::Variant::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_contentSrc.call(this, varContentSrc)
    end
    def get_contentSrc(this : ILayoutRect*, pvarContentSrc : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contentSrc.call(this, pvarContentSrc)
    end
    def put_honorPageBreaks(this : ILayoutRect*, v : Win32cr::Foundation::VARIANT_BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_honorPageBreaks.call(this, v)
    end
    def get_honorPageBreaks(this : ILayoutRect*, p : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_honorPageBreaks.call(this, p)
    end
    def put_honorPageRules(this : ILayoutRect*, v : Win32cr::Foundation::VARIANT_BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_honorPageRules.call(this, v)
    end
    def get_honorPageRules(this : ILayoutRect*, p : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_honorPageRules.call(this, p)
    end
    def put_nextRectElement(this : ILayoutRect*, pElem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_nextRectElement.call(this, pElem)
    end
    def get_nextRectElement(this : ILayoutRect*, ppElem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_nextRectElement.call(this, ppElem)
    end
    def get_contentDocument(this : ILayoutRect*, pDoc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contentDocument.call(this, pDoc)
    end

  end

  @[Extern]

  record IDeviceRectVtable,
    query_interface : Proc(IDeviceRect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDeviceRect*, UInt32),
    release : Proc(IDeviceRect*, UInt32),
    get_type_info_count : Proc(IDeviceRect*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDeviceRect*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDeviceRect*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IDeviceRect*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDeviceRect, lpVtbl : IDeviceRectVtable* do
    GUID = LibC::GUID.new(0x3050f6d5_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IDeviceRect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDeviceRect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDeviceRect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDeviceRect*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDeviceRect*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDeviceRect*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IDeviceRect*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]

  record IHeaderFooterVtable,
    query_interface : Proc(IHeaderFooter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHeaderFooter*, UInt32),
    release : Proc(IHeaderFooter*, UInt32),
    get_type_info_count : Proc(IHeaderFooter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IHeaderFooter*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IHeaderFooter*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IHeaderFooter*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_htmlHead : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_htmlFoot : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_textHead : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_textHead : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_textFoot : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_textFoot : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_page : Proc(IHeaderFooter*, UInt32, Win32cr::Foundation::HRESULT),
    get_page : Proc(IHeaderFooter*, UInt32*, Win32cr::Foundation::HRESULT),
    put_pageTotal : Proc(IHeaderFooter*, UInt32, Win32cr::Foundation::HRESULT),
    get_pageTotal : Proc(IHeaderFooter*, UInt32*, Win32cr::Foundation::HRESULT),
    put_URL : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_URL : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_title : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_title : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_dateShort : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dateShort : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_dateLong : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dateLong : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_timeShort : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_timeShort : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_timeLong : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_timeLong : Proc(IHeaderFooter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHeaderFooter, lpVtbl : IHeaderFooterVtable* do
    GUID = LibC::GUID.new(0x3050f6ce_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IHeaderFooter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHeaderFooter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHeaderFooter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IHeaderFooter*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IHeaderFooter*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IHeaderFooter*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IHeaderFooter*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_htmlHead(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_htmlHead.call(this, p)
    end
    def get_htmlFoot(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_htmlFoot.call(this, p)
    end
    def put_textHead(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_textHead.call(this, v)
    end
    def get_textHead(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_textHead.call(this, p)
    end
    def put_textFoot(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_textFoot.call(this, v)
    end
    def get_textFoot(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_textFoot.call(this, p)
    end
    def put_page(this : IHeaderFooter*, v : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_page.call(this, v)
    end
    def get_page(this : IHeaderFooter*, p : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page.call(this, p)
    end
    def put_pageTotal(this : IHeaderFooter*, v : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_pageTotal.call(this, v)
    end
    def get_pageTotal(this : IHeaderFooter*, p : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pageTotal.call(this, p)
    end
    def put_URL(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_URL.call(this, v)
    end
    def get_URL(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_URL.call(this, p)
    end
    def put_title(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_title.call(this, v)
    end
    def get_title(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_title.call(this, p)
    end
    def put_dateShort(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_dateShort.call(this, v)
    end
    def get_dateShort(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dateShort.call(this, p)
    end
    def put_dateLong(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_dateLong.call(this, v)
    end
    def get_dateLong(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dateLong.call(this, p)
    end
    def put_timeShort(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_timeShort.call(this, v)
    end
    def get_timeShort(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timeShort.call(this, p)
    end
    def put_timeLong(this : IHeaderFooter*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_timeLong.call(this, v)
    end
    def get_timeLong(this : IHeaderFooter*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timeLong.call(this, p)
    end

  end

  @[Extern]

  record IHeaderFooter2Vtable,
    query_interface : Proc(IHeaderFooter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHeaderFooter2*, UInt32),
    release : Proc(IHeaderFooter2*, UInt32),
    get_type_info_count : Proc(IHeaderFooter2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IHeaderFooter2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IHeaderFooter2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IHeaderFooter2*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_htmlHead : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_htmlFoot : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_textHead : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_textHead : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_textFoot : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_textFoot : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_page : Proc(IHeaderFooter2*, UInt32, Win32cr::Foundation::HRESULT),
    get_page : Proc(IHeaderFooter2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_pageTotal : Proc(IHeaderFooter2*, UInt32, Win32cr::Foundation::HRESULT),
    get_pageTotal : Proc(IHeaderFooter2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_URL : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_URL : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_title : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_title : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_dateShort : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dateShort : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_dateLong : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_dateLong : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_timeShort : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_timeShort : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_timeLong : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_timeLong : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_font : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_font : Proc(IHeaderFooter2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHeaderFooter2, lpVtbl : IHeaderFooter2Vtable* do
    GUID = LibC::GUID.new(0x305104a5_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : IHeaderFooter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHeaderFooter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHeaderFooter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IHeaderFooter2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IHeaderFooter2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IHeaderFooter2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IHeaderFooter2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_htmlHead(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_htmlHead.call(this, p)
    end
    def get_htmlFoot(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_htmlFoot.call(this, p)
    end
    def put_textHead(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_textHead.call(this, v)
    end
    def get_textHead(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_textHead.call(this, p)
    end
    def put_textFoot(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_textFoot.call(this, v)
    end
    def get_textFoot(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_textFoot.call(this, p)
    end
    def put_page(this : IHeaderFooter2*, v : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_page.call(this, v)
    end
    def get_page(this : IHeaderFooter2*, p : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page.call(this, p)
    end
    def put_pageTotal(this : IHeaderFooter2*, v : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_pageTotal.call(this, v)
    end
    def get_pageTotal(this : IHeaderFooter2*, p : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pageTotal.call(this, p)
    end
    def put_URL(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_URL.call(this, v)
    end
    def get_URL(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_URL.call(this, p)
    end
    def put_title(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_title.call(this, v)
    end
    def get_title(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_title.call(this, p)
    end
    def put_dateShort(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_dateShort.call(this, v)
    end
    def get_dateShort(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dateShort.call(this, p)
    end
    def put_dateLong(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_dateLong.call(this, v)
    end
    def get_dateLong(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dateLong.call(this, p)
    end
    def put_timeShort(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_timeShort.call(this, v)
    end
    def get_timeShort(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timeShort.call(this, p)
    end
    def put_timeLong(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_timeLong.call(this, v)
    end
    def get_timeLong(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timeLong.call(this, p)
    end
    def put_font(this : IHeaderFooter2*, v : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_font.call(this, v)
    end
    def get_font(this : IHeaderFooter2*, p : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font.call(this, p)
    end

  end

  @[Extern]

  record IOpenServiceActivityInputVtable,
    query_interface : Proc(IOpenServiceActivityInput*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceActivityInput*, UInt32),
    release : Proc(IOpenServiceActivityInput*, UInt32),
    get_variable : Proc(IOpenServiceActivityInput*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    has_variable : Proc(IOpenServiceActivityInput*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IOpenServiceActivityInput*, Win32cr::Web::InternetExplorer::OpenServiceActivityContentType*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceActivityInput, lpVtbl : IOpenServiceActivityInputVtable* do
    GUID = LibC::GUID.new(0x75cb4db9_u32, 0x6da0_u16, 0x4da3_u16, StaticArray[0x83_u8, 0xce_u8, 0x42_u8, 0x2b_u8, 0x6a_u8, 0x43_u8, 0x33_u8, 0x46_u8])
    def query_interface(this : IOpenServiceActivityInput*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceActivityInput*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceActivityInput*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_variable(this : IOpenServiceActivityInput*, pwzVariableName : Win32cr::Foundation::PWSTR, pwzVariableType : Win32cr::Foundation::PWSTR, pbstrVariableContent : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_variable.call(this, pwzVariableName, pwzVariableType, pbstrVariableContent)
    end
    def has_variable(this : IOpenServiceActivityInput*, pwzVariableName : Win32cr::Foundation::PWSTR, pwzVariableType : Win32cr::Foundation::PWSTR, pfHasVariable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_variable.call(this, pwzVariableName, pwzVariableType, pfHasVariable)
    end
    def get_type(this : IOpenServiceActivityInput*, pType : Win32cr::Web::InternetExplorer::OpenServiceActivityContentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pType)
    end

  end

  @[Extern]

  record IOpenServiceActivityOutputContextVtable,
    query_interface : Proc(IOpenServiceActivityOutputContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceActivityOutputContext*, UInt32),
    release : Proc(IOpenServiceActivityOutputContext*, UInt32),
    navigate : Proc(IOpenServiceActivityOutputContext*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    can_navigate : Proc(IOpenServiceActivityOutputContext*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceActivityOutputContext, lpVtbl : IOpenServiceActivityOutputContextVtable* do
    GUID = LibC::GUID.new(0xe289deab_u32, 0xf709_u16, 0x49a9_u16, StaticArray[0xb9_u8, 0x9e_u8, 0x28_u8, 0x23_u8, 0x64_u8, 0x7_u8, 0x45_u8, 0x71_u8])
    def query_interface(this : IOpenServiceActivityOutputContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceActivityOutputContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceActivityOutputContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def navigate(this : IOpenServiceActivityOutputContext*, pwzUri : Win32cr::Foundation::PWSTR, pwzMethod : Win32cr::Foundation::PWSTR, pwzHeaders : Win32cr::Foundation::PWSTR, pPostData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate.call(this, pwzUri, pwzMethod, pwzHeaders, pPostData)
    end
    def can_navigate(this : IOpenServiceActivityOutputContext*, pwzUri : Win32cr::Foundation::PWSTR, pwzMethod : Win32cr::Foundation::PWSTR, pwzHeaders : Win32cr::Foundation::PWSTR, pPostData : Void*, pfCanNavigate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_navigate.call(this, pwzUri, pwzMethod, pwzHeaders, pPostData, pfCanNavigate)
    end

  end

  @[Extern]

  record IOpenServiceVtable,
    query_interface : Proc(IOpenService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenService*, UInt32),
    release : Proc(IOpenService*, UInt32),
    is_default : Proc(IOpenService*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_default : Proc(IOpenService*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_id : Proc(IOpenService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenService, lpVtbl : IOpenServiceVtable* do
    GUID = LibC::GUID.new(0xc2952ed1_u32, 0x6a89_u16, 0x4606_u16, StaticArray[0x92_u8, 0x5f_u8, 0x1e_u8, 0xd8_u8, 0xb4_u8, 0xbe_u8, 0x6_u8, 0x30_u8])
    def query_interface(this : IOpenService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_default(this : IOpenService*, pfIsDefault : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_default.call(this, pfIsDefault)
    end
    def set_default(this : IOpenService*, fDefault : Win32cr::Foundation::BOOL, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default.call(this, fDefault, hwnd)
    end
    def get_id(this : IOpenService*, pbstrID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pbstrID)
    end

  end

  @[Extern]

  record IOpenServiceManagerVtable,
    query_interface : Proc(IOpenServiceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceManager*, UInt32),
    release : Proc(IOpenServiceManager*, UInt32),
    install_service : Proc(IOpenServiceManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    uninstall_service : Proc(IOpenServiceManager*, Void*, Win32cr::Foundation::HRESULT),
    get_service_by_id : Proc(IOpenServiceManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceManager, lpVtbl : IOpenServiceManagerVtable* do
    GUID = LibC::GUID.new(0x5664125f_u32, 0x4e10_u16, 0x4e90_u16, StaticArray[0x98_u8, 0xe4_u8, 0xe4_u8, 0x51_u8, 0x3d_u8, 0x95_u8, 0x5a_u8, 0x14_u8])
    def query_interface(this : IOpenServiceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def install_service(this : IOpenServiceManager*, pwzServiceUrl : Win32cr::Foundation::PWSTR, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_service.call(this, pwzServiceUrl, ppService)
    end
    def uninstall_service(this : IOpenServiceManager*, pService : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall_service.call(this, pService)
    end
    def get_service_by_id(this : IOpenServiceManager*, pwzID : Win32cr::Foundation::PWSTR, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_by_id.call(this, pwzID, ppService)
    end

  end

  @[Extern]

  record IOpenServiceActivityVtable,
    query_interface : Proc(IOpenServiceActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceActivity*, UInt32),
    release : Proc(IOpenServiceActivity*, UInt32),
    is_default : Proc(IOpenServiceActivity*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_default : Proc(IOpenServiceActivity*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_id : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    execute : Proc(IOpenServiceActivity*, Void*, Void*, Win32cr::Foundation::HRESULT),
    can_execute : Proc(IOpenServiceActivity*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    can_execute_type : Proc(IOpenServiceActivity*, Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    preview : Proc(IOpenServiceActivity*, Void*, Void*, Win32cr::Foundation::HRESULT),
    can_preview : Proc(IOpenServiceActivity*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    can_preview_type : Proc(IOpenServiceActivity*, Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_status_text : Proc(IOpenServiceActivity*, Void*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_homepage_url : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_description : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_category_name : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_icon_path : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_icon : Proc(IOpenServiceActivity*, Win32cr::Foundation::BOOL, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT),
    get_description_file_path : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_download_url : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_install_url : Proc(IOpenServiceActivity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_enabled : Proc(IOpenServiceActivity*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enabled : Proc(IOpenServiceActivity*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceActivity, lpVtbl : IOpenServiceActivityVtable* do
    GUID = LibC::GUID.new(0x13645c88_u32, 0x221a_u16, 0x4905_u16, StaticArray[0x8e_u8, 0xd1_u8, 0x4f_u8, 0x51_u8, 0x12_u8, 0xcf_u8, 0xc1_u8, 0x8_u8])
    def query_interface(this : IOpenServiceActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_default(this : IOpenServiceActivity*, pfIsDefault : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_default.call(this, pfIsDefault)
    end
    def set_default(this : IOpenServiceActivity*, fDefault : Win32cr::Foundation::BOOL, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default.call(this, fDefault, hwnd)
    end
    def get_id(this : IOpenServiceActivity*, pbstrID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pbstrID)
    end
    def execute(this : IOpenServiceActivity*, pInput : Void*, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this, pInput, pOutput)
    end
    def can_execute(this : IOpenServiceActivity*, pInput : Void*, pOutput : Void*, pfCanExecute : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_execute.call(this, pInput, pOutput, pfCanExecute)
    end
    def can_execute_type(this : IOpenServiceActivity*, type__ : Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, pfCanExecute : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_execute_type.call(this, type__, pfCanExecute)
    end
    def preview(this : IOpenServiceActivity*, pInput : Void*, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preview.call(this, pInput, pOutput)
    end
    def can_preview(this : IOpenServiceActivity*, pInput : Void*, pOutput : Void*, pfCanPreview : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_preview.call(this, pInput, pOutput, pfCanPreview)
    end
    def can_preview_type(this : IOpenServiceActivity*, type__ : Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, pfCanPreview : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_preview_type.call(this, type__, pfCanPreview)
    end
    def get_status_text(this : IOpenServiceActivity*, pInput : Void*, pbstrStatusText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status_text.call(this, pInput, pbstrStatusText)
    end
    def get_homepage_url(this : IOpenServiceActivity*, pbstrHomepageUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_homepage_url.call(this, pbstrHomepageUrl)
    end
    def get_display_name(this : IOpenServiceActivity*, pbstrDisplayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrDisplayName)
    end
    def get_description(this : IOpenServiceActivity*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_category_name(this : IOpenServiceActivity*, pbstrCategoryName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category_name.call(this, pbstrCategoryName)
    end
    def get_icon_path(this : IOpenServiceActivity*, pbstrIconPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_icon_path.call(this, pbstrIconPath)
    end
    def get_icon(this : IOpenServiceActivity*, fSmallIcon : Win32cr::Foundation::BOOL, phIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_icon.call(this, fSmallIcon, phIcon)
    end
    def get_description_file_path(this : IOpenServiceActivity*, pbstrXmlPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_file_path.call(this, pbstrXmlPath)
    end
    def get_download_url(this : IOpenServiceActivity*, pbstrXmlUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_url.call(this, pbstrXmlUri)
    end
    def get_install_url(this : IOpenServiceActivity*, pbstrInstallUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_install_url.call(this, pbstrInstallUri)
    end
    def is_enabled(this : IOpenServiceActivity*, pfIsEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled.call(this, pfIsEnabled)
    end
    def set_enabled(this : IOpenServiceActivity*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enabled.call(this, fEnable)
    end

  end

  @[Extern]

  record IEnumOpenServiceActivityVtable,
    query_interface : Proc(IEnumOpenServiceActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumOpenServiceActivity*, UInt32),
    release : Proc(IEnumOpenServiceActivity*, UInt32),
    next__ : Proc(IEnumOpenServiceActivity*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumOpenServiceActivity*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumOpenServiceActivity*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumOpenServiceActivity*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumOpenServiceActivity, lpVtbl : IEnumOpenServiceActivityVtable* do
    GUID = LibC::GUID.new(0xa436d7d2_u32, 0x17c3_u16, 0x4ef4_u16, StaticArray[0xa1_u8, 0xe8_u8, 0x5c_u8, 0x86_u8, 0xfa_u8, 0xff_u8, 0x26_u8, 0xc0_u8])
    def query_interface(this : IEnumOpenServiceActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumOpenServiceActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumOpenServiceActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumOpenServiceActivity*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumOpenServiceActivity*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumOpenServiceActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumOpenServiceActivity*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]

  record IOpenServiceActivityCategoryVtable,
    query_interface : Proc(IOpenServiceActivityCategory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceActivityCategory*, UInt32),
    release : Proc(IOpenServiceActivityCategory*, UInt32),
    has_default_activity : Proc(IOpenServiceActivityCategory*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_default_activity : Proc(IOpenServiceActivityCategory*, Void**, Win32cr::Foundation::HRESULT),
    set_default_activity : Proc(IOpenServiceActivityCategory*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_name : Proc(IOpenServiceActivityCategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_activity_enumerator : Proc(IOpenServiceActivityCategory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceActivityCategory, lpVtbl : IOpenServiceActivityCategoryVtable* do
    GUID = LibC::GUID.new(0x850af9d6_u32, 0x7309_u16, 0x40b5_u16, StaticArray[0xbd_u8, 0xb8_u8, 0x78_u8, 0x6c_u8, 0x10_u8, 0x6b_u8, 0x21_u8, 0x53_u8])
    def query_interface(this : IOpenServiceActivityCategory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceActivityCategory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceActivityCategory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def has_default_activity(this : IOpenServiceActivityCategory*, pfHasDefaultActivity : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_default_activity.call(this, pfHasDefaultActivity)
    end
    def get_default_activity(this : IOpenServiceActivityCategory*, ppDefaultActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_activity.call(this, ppDefaultActivity)
    end
    def set_default_activity(this : IOpenServiceActivityCategory*, pActivity : Void*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_activity.call(this, pActivity, hwnd)
    end
    def get_name(this : IOpenServiceActivityCategory*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstrName)
    end
    def get_activity_enumerator(this : IOpenServiceActivityCategory*, pInput : Void*, pOutput : Void*, ppEnumActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_enumerator.call(this, pInput, pOutput, ppEnumActivity)
    end

  end

  @[Extern]

  record IEnumOpenServiceActivityCategoryVtable,
    query_interface : Proc(IEnumOpenServiceActivityCategory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumOpenServiceActivityCategory*, UInt32),
    release : Proc(IEnumOpenServiceActivityCategory*, UInt32),
    next__ : Proc(IEnumOpenServiceActivityCategory*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumOpenServiceActivityCategory*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumOpenServiceActivityCategory*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumOpenServiceActivityCategory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumOpenServiceActivityCategory, lpVtbl : IEnumOpenServiceActivityCategoryVtable* do
    GUID = LibC::GUID.new(0x33627a56_u32, 0x8c9a_u16, 0x4430_u16, StaticArray[0x8f_u8, 0xd1_u8, 0xb5_u8, 0xf5_u8, 0xc7_u8, 0x71_u8, 0xaf_u8, 0xb6_u8])
    def query_interface(this : IEnumOpenServiceActivityCategory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumOpenServiceActivityCategory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumOpenServiceActivityCategory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumOpenServiceActivityCategory*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumOpenServiceActivityCategory*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumOpenServiceActivityCategory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumOpenServiceActivityCategory*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]

  record IOpenServiceActivityManagerVtable,
    query_interface : Proc(IOpenServiceActivityManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpenServiceActivityManager*, UInt32),
    release : Proc(IOpenServiceActivityManager*, UInt32),
    get_category_enumerator : Proc(IOpenServiceActivityManager*, Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, Void**, Win32cr::Foundation::HRESULT),
    get_activity_by_id : Proc(IOpenServiceActivityManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_activity_by_homepage_and_category : Proc(IOpenServiceActivityManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_version_cookie : Proc(IOpenServiceActivityManager*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOpenServiceActivityManager, lpVtbl : IOpenServiceActivityManagerVtable* do
    GUID = LibC::GUID.new(0x8a2d0a9d_u32, 0xe920_u16, 0x4bdc_u16, StaticArray[0xa2_u8, 0x91_u8, 0xd3_u8, 0xf_u8, 0x65_u8, 0xb_u8, 0xc4_u8, 0xf1_u8])
    def query_interface(this : IOpenServiceActivityManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpenServiceActivityManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpenServiceActivityManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_category_enumerator(this : IOpenServiceActivityManager*, eType : Win32cr::Web::InternetExplorer::OpenServiceActivityContentType, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category_enumerator.call(this, eType, ppEnum)
    end
    def get_activity_by_id(this : IOpenServiceActivityManager*, pwzActivityID : Win32cr::Foundation::PWSTR, ppActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_by_id.call(this, pwzActivityID, ppActivity)
    end
    def get_activity_by_homepage_and_category(this : IOpenServiceActivityManager*, pwzHomepage : Win32cr::Foundation::PWSTR, pwzCategory : Win32cr::Foundation::PWSTR, ppActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_by_homepage_and_category.call(this, pwzHomepage, pwzCategory, ppActivity)
    end
    def get_version_cookie(this : IOpenServiceActivityManager*, pdwVersionCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_cookie.call(this, pdwVersionCookie)
    end

  end

  @[Extern]

  record IPersistHistoryVtable,
    query_interface : Proc(IPersistHistory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistHistory*, UInt32),
    release : Proc(IPersistHistory*, UInt32),
    get_class_id : Proc(IPersistHistory*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    load_history : Proc(IPersistHistory*, Void*, Void*, Win32cr::Foundation::HRESULT),
    save_history : Proc(IPersistHistory*, Void*, Win32cr::Foundation::HRESULT),
    set_position_cookie : Proc(IPersistHistory*, UInt32, Win32cr::Foundation::HRESULT),
    get_position_cookie : Proc(IPersistHistory*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPersistHistory, lpVtbl : IPersistHistoryVtable* do
    GUID = LibC::GUID.new(0x91a565c1_u32, 0xe38f_u16, 0x11d0_u16, StaticArray[0x94_u8, 0xbf_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x5c_u8, 0xbf_u8])
    def query_interface(this : IPersistHistory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistHistory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistHistory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistHistory*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def load_history(this : IPersistHistory*, pStream : Void*, pbc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_history.call(this, pStream, pbc)
    end
    def save_history(this : IPersistHistory*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_history.call(this, pStream)
    end
    def set_position_cookie(this : IPersistHistory*, dwPositioncookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_position_cookie.call(this, dwPositioncookie)
    end
    def get_position_cookie(this : IPersistHistory*, pdwPositioncookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_cookie.call(this, pdwPositioncookie)
    end

  end

  @[Extern]

  record IEnumSTATURLVtable,
    query_interface : Proc(IEnumSTATURL*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSTATURL*, UInt32),
    release : Proc(IEnumSTATURL*, UInt32),
    next__ : Proc(IEnumSTATURL*, UInt32, Win32cr::Web::InternetExplorer::STATURL*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSTATURL*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSTATURL*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSTATURL*, Void**, Win32cr::Foundation::HRESULT),
    set_filter : Proc(IEnumSTATURL*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSTATURL, lpVtbl : IEnumSTATURLVtable* do
    GUID = LibC::GUID.new(0x3c374a42_u32, 0xbae4_u16, 0x11cf_u16, StaticArray[0xbf_u8, 0x7d_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x69_u8, 0x46_u8, 0xee_u8])
    def query_interface(this : IEnumSTATURL*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSTATURL*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSTATURL*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSTATURL*, celt : UInt32, rgelt : Win32cr::Web::InternetExplorer::STATURL*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumSTATURL*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSTATURL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSTATURL*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end
    def set_filter(this : IEnumSTATURL*, poszFilter : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter.call(this, poszFilter, dwFlags)
    end

  end

  @[Extern]

  record IUrlHistoryStgVtable,
    query_interface : Proc(IUrlHistoryStg*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUrlHistoryStg*, UInt32),
    release : Proc(IUrlHistoryStg*, UInt32),
    add_url : Proc(IUrlHistoryStg*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_url : Proc(IUrlHistoryStg*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    query_url : Proc(IUrlHistoryStg*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Web::InternetExplorer::STATURL*, Win32cr::Foundation::HRESULT),
    bind_to_object : Proc(IUrlHistoryStg*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_urls : Proc(IUrlHistoryStg*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUrlHistoryStg, lpVtbl : IUrlHistoryStgVtable* do
    GUID = LibC::GUID.new(0x3c374a41_u32, 0xbae4_u16, 0x11cf_u16, StaticArray[0xbf_u8, 0x7d_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x69_u8, 0x46_u8, 0xee_u8])
    def query_interface(this : IUrlHistoryStg*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUrlHistoryStg*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUrlHistoryStg*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_url(this : IUrlHistoryStg*, pocsUrl : Win32cr::Foundation::PWSTR, pocsTitle : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_url.call(this, pocsUrl, pocsTitle, dwFlags)
    end
    def delete_url(this : IUrlHistoryStg*, pocsUrl : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_url.call(this, pocsUrl, dwFlags)
    end
    def query_url(this : IUrlHistoryStg*, pocsUrl : Win32cr::Foundation::PWSTR, dwFlags : UInt32, lpSTATURL : Win32cr::Web::InternetExplorer::STATURL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_url.call(this, pocsUrl, dwFlags, lpSTATURL)
    end
    def bind_to_object(this : IUrlHistoryStg*, pocsUrl : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppvOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_object.call(this, pocsUrl, riid, ppvOut)
    end
    def enum_urls(this : IUrlHistoryStg*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_urls.call(this, ppEnum)
    end

  end

  @[Extern]

  record IUrlHistoryStg2Vtable,
    query_interface : Proc(IUrlHistoryStg2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUrlHistoryStg2*, UInt32),
    release : Proc(IUrlHistoryStg2*, UInt32),
    add_url : Proc(IUrlHistoryStg2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_url : Proc(IUrlHistoryStg2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    query_url : Proc(IUrlHistoryStg2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Web::InternetExplorer::STATURL*, Win32cr::Foundation::HRESULT),
    bind_to_object : Proc(IUrlHistoryStg2*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_urls : Proc(IUrlHistoryStg2*, Void**, Win32cr::Foundation::HRESULT),
    add_url_and_notify : Proc(IUrlHistoryStg2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, Void*, Void*, Win32cr::Foundation::HRESULT),
    clear_history : Proc(IUrlHistoryStg2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUrlHistoryStg2, lpVtbl : IUrlHistoryStg2Vtable* do
    GUID = LibC::GUID.new(0xafa0dc11_u32, 0xc313_u16, 0x11d0_u16, StaticArray[0x83_u8, 0x1a_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd5_u8, 0xae_u8, 0x38_u8])
    def query_interface(this : IUrlHistoryStg2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUrlHistoryStg2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUrlHistoryStg2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_url(this : IUrlHistoryStg2*, pocsUrl : Win32cr::Foundation::PWSTR, pocsTitle : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_url.call(this, pocsUrl, pocsTitle, dwFlags)
    end
    def delete_url(this : IUrlHistoryStg2*, pocsUrl : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_url.call(this, pocsUrl, dwFlags)
    end
    def query_url(this : IUrlHistoryStg2*, pocsUrl : Win32cr::Foundation::PWSTR, dwFlags : UInt32, lpSTATURL : Win32cr::Web::InternetExplorer::STATURL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_url.call(this, pocsUrl, dwFlags, lpSTATURL)
    end
    def bind_to_object(this : IUrlHistoryStg2*, pocsUrl : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppvOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_object.call(this, pocsUrl, riid, ppvOut)
    end
    def enum_urls(this : IUrlHistoryStg2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_urls.call(this, ppEnum)
    end
    def add_url_and_notify(this : IUrlHistoryStg2*, pocsUrl : Win32cr::Foundation::PWSTR, pocsTitle : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fWriteHistory : Win32cr::Foundation::BOOL, poctNotify : Void*, punkISFolder : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_url_and_notify.call(this, pocsUrl, pocsTitle, dwFlags, fWriteHistory, poctNotify, punkISFolder)
    end
    def clear_history(this : IUrlHistoryStg2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_history.call(this)
    end

  end

  @[Extern]

  record IUrlHistoryNotifyVtable,
    query_interface : Proc(IUrlHistoryNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUrlHistoryNotify*, UInt32),
    release : Proc(IUrlHistoryNotify*, UInt32),
    query_status : Proc(IUrlHistoryNotify*, LibC::GUID*, UInt32, Win32cr::System::Ole::OLECMD*, Win32cr::System::Ole::OLECMDTEXT*, Win32cr::Foundation::HRESULT),
    exec : Proc(IUrlHistoryNotify*, LibC::GUID*, UInt32, UInt32, Win32cr::System::Variant::VARIANT*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUrlHistoryNotify, lpVtbl : IUrlHistoryNotifyVtable* do
    GUID = LibC::GUID.new(0xbc40bec1_u32, 0xc493_u16, 0x11d0_u16, StaticArray[0x83_u8, 0x1b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd5_u8, 0xae_u8, 0x38_u8])
    def query_interface(this : IUrlHistoryNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUrlHistoryNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUrlHistoryNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_status(this : IUrlHistoryNotify*, pguidCmdGroup : LibC::GUID*, cCmds : UInt32, prgCmds : Win32cr::System::Ole::OLECMD*, pCmdText : Win32cr::System::Ole::OLECMDTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_status.call(this, pguidCmdGroup, cCmds, prgCmds, pCmdText)
    end
    def exec(this : IUrlHistoryNotify*, pguidCmdGroup : LibC::GUID*, nCmdID : UInt32, nCmdexecopt : UInt32, pvaIn : Win32cr::System::Variant::VARIANT*, pvaOut : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exec.call(this, pguidCmdGroup, nCmdID, nCmdexecopt, pvaIn, pvaOut)
    end

  end

  @[Extern]

  record IWebBrowserEventsServiceVtable,
    query_interface : Proc(IWebBrowserEventsService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebBrowserEventsService*, UInt32),
    release : Proc(IWebBrowserEventsService*, UInt32),
    fire_before_navigate2_event : Proc(IWebBrowserEventsService*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    fire_navigate_complete2_event : Proc(IWebBrowserEventsService*, Win32cr::Foundation::HRESULT),
    fire_download_begin_event : Proc(IWebBrowserEventsService*, Win32cr::Foundation::HRESULT),
    fire_download_complete_event : Proc(IWebBrowserEventsService*, Win32cr::Foundation::HRESULT),
    fire_document_complete_event : Proc(IWebBrowserEventsService*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebBrowserEventsService, lpVtbl : IWebBrowserEventsServiceVtable* do
    GUID = LibC::GUID.new(0x54a8f188_u32, 0x9ebd_u16, 0x4795_u16, StaticArray[0xad_u8, 0x16_u8, 0x9b_u8, 0x49_u8, 0x45_u8, 0x11_u8, 0x96_u8, 0x36_u8])
    def query_interface(this : IWebBrowserEventsService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebBrowserEventsService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebBrowserEventsService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def fire_before_navigate2_event(this : IWebBrowserEventsService*, pfCancel : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_before_navigate2_event.call(this, pfCancel)
    end
    def fire_navigate_complete2_event(this : IWebBrowserEventsService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_navigate_complete2_event.call(this)
    end
    def fire_download_begin_event(this : IWebBrowserEventsService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_download_begin_event.call(this)
    end
    def fire_download_complete_event(this : IWebBrowserEventsService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_download_complete_event.call(this)
    end
    def fire_document_complete_event(this : IWebBrowserEventsService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_document_complete_event.call(this)
    end

  end

  @[Extern]

  record IWebBrowserEventsUrlServiceVtable,
    query_interface : Proc(IWebBrowserEventsUrlService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebBrowserEventsUrlService*, UInt32),
    release : Proc(IWebBrowserEventsUrlService*, UInt32),
    get_url_for_events : Proc(IWebBrowserEventsUrlService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebBrowserEventsUrlService, lpVtbl : IWebBrowserEventsUrlServiceVtable* do
    GUID = LibC::GUID.new(0x87cc5d04_u32, 0xeafa_u16, 0x4833_u16, StaticArray[0x98_u8, 0x20_u8, 0x8f_u8, 0x98_u8, 0x65_u8, 0x30_u8, 0xcc_u8, 0x0_u8])
    def query_interface(this : IWebBrowserEventsUrlService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebBrowserEventsUrlService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebBrowserEventsUrlService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_url_for_events(this : IWebBrowserEventsUrlService*, pUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url_for_events.call(this, pUrl)
    end

  end

  @[Extern]

  record ITimerServiceVtable,
    query_interface : Proc(ITimerService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimerService*, UInt32),
    release : Proc(ITimerService*, UInt32),
    create_timer : Proc(ITimerService*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_named_timer : Proc(ITimerService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_named_timer_reference : Proc(ITimerService*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITimerService, lpVtbl : ITimerServiceVtable* do
    GUID = LibC::GUID.new(0x3050f35f_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITimerService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimerService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimerService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_timer(this : ITimerService*, pReferenceTimer : Void*, ppNewTimer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_timer.call(this, pReferenceTimer, ppNewTimer)
    end
    def get_named_timer(this : ITimerService*, rguidName : LibC::GUID*, ppTimer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_named_timer.call(this, rguidName, ppTimer)
    end
    def set_named_timer_reference(this : ITimerService*, rguidName : LibC::GUID*, pReferenceTimer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_named_timer_reference.call(this, rguidName, pReferenceTimer)
    end

  end

  @[Extern]

  record ITimerVtable,
    query_interface : Proc(ITimer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimer*, UInt32),
    release : Proc(ITimer*, UInt32),
    advise : Proc(ITimer*, Win32cr::System::Variant::VARIANT, Win32cr::System::Variant::VARIANT, Win32cr::System::Variant::VARIANT, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(ITimer*, UInt32, Win32cr::Foundation::HRESULT),
    freeze : Proc(ITimer*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_time : Proc(ITimer*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITimer, lpVtbl : ITimerVtable* do
    GUID = LibC::GUID.new(0x3050f360_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITimer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise(this : ITimer*, vtimeMin : Win32cr::System::Variant::VARIANT, vtimeMax : Win32cr::System::Variant::VARIANT, vtimeInterval : Win32cr::System::Variant::VARIANT, dwFlags : UInt32, pTimerSink : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink, pdwCookie)
    end
    def unadvise(this : ITimer*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwCookie)
    end
    def freeze(this : ITimer*, fFreeze : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.freeze.call(this, fFreeze)
    end
    def get_time(this : ITimer*, pvtime : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, pvtime)
    end

  end

  @[Extern]

  record ITimerExVtable,
    query_interface : Proc(ITimerEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimerEx*, UInt32),
    release : Proc(ITimerEx*, UInt32),
    advise : Proc(ITimerEx*, Win32cr::System::Variant::VARIANT, Win32cr::System::Variant::VARIANT, Win32cr::System::Variant::VARIANT, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(ITimerEx*, UInt32, Win32cr::Foundation::HRESULT),
    freeze : Proc(ITimerEx*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_time : Proc(ITimerEx*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    set_mode : Proc(ITimerEx*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITimerEx, lpVtbl : ITimerExVtable* do
    GUID = LibC::GUID.new(0x30510414_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITimerEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimerEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimerEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise(this : ITimerEx*, vtimeMin : Win32cr::System::Variant::VARIANT, vtimeMax : Win32cr::System::Variant::VARIANT, vtimeInterval : Win32cr::System::Variant::VARIANT, dwFlags : UInt32, pTimerSink : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink, pdwCookie)
    end
    def unadvise(this : ITimerEx*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwCookie)
    end
    def freeze(this : ITimerEx*, fFreeze : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.freeze.call(this, fFreeze)
    end
    def get_time(this : ITimerEx*, pvtime : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, pvtime)
    end
    def set_mode(this : ITimerEx*, dwMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mode.call(this, dwMode)
    end

  end

  @[Extern]

  record ITimerSinkVtable,
    query_interface : Proc(ITimerSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimerSink*, UInt32),
    release : Proc(ITimerSink*, UInt32),
    on_timer : Proc(ITimerSink*, Win32cr::System::Variant::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITimerSink, lpVtbl : ITimerSinkVtable* do
    GUID = LibC::GUID.new(0x3050f361_u32, 0x98b5_u16, 0x11cf_u16, StaticArray[0xbb_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbd_u8, 0xce_u8, 0xb_u8])
    def query_interface(this : ITimerSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimerSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimerSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_timer(this : ITimerSink*, vtimeAdvise : Win32cr::System::Variant::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_timer.call(this, vtimeAdvise)
    end

  end

  @[Extern]

  record IMapMIMEToCLSIDVtable,
    query_interface : Proc(IMapMIMEToCLSID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMapMIMEToCLSID*, UInt32),
    release : Proc(IMapMIMEToCLSID*, UInt32),
    enable_default_mappings : Proc(IMapMIMEToCLSID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    map_mime_to_clsid : Proc(IMapMIMEToCLSID*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_mapping : Proc(IMapMIMEToCLSID*, Win32cr::Foundation::PWSTR, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMapMIMEToCLSID, lpVtbl : IMapMIMEToCLSIDVtable* do
    GUID = LibC::GUID.new(0xd9e89500_u32, 0x30fa_u16, 0x11d0_u16, StaticArray[0xb7_u8, 0x24_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x1a_u8, 0x1_u8])
    def query_interface(this : IMapMIMEToCLSID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMapMIMEToCLSID*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMapMIMEToCLSID*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_default_mappings(this : IMapMIMEToCLSID*, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_default_mappings.call(this, bEnable)
    end
    def map_mime_to_clsid(this : IMapMIMEToCLSID*, pszMIMEType : Win32cr::Foundation::PWSTR, pCLSID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_mime_to_clsid.call(this, pszMIMEType, pCLSID)
    end
    def set_mapping(this : IMapMIMEToCLSID*, pszMIMEType : Win32cr::Foundation::PWSTR, dwMapMode : UInt32, clsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mapping.call(this, pszMIMEType, dwMapMode, clsid)
    end

  end

  @[Extern]

  record IImageDecodeFilterVtable,
    query_interface : Proc(IImageDecodeFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageDecodeFilter*, UInt32),
    release : Proc(IImageDecodeFilter*, UInt32),
    initialize__ : Proc(IImageDecodeFilter*, Void*, Win32cr::Foundation::HRESULT),
    process : Proc(IImageDecodeFilter*, Void*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IImageDecodeFilter*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IImageDecodeFilter, lpVtbl : IImageDecodeFilterVtable* do
    GUID = LibC::GUID.new(0xa3ccedf3_u32, 0x2de2_u16, 0x11d0_u16, StaticArray[0x86_u8, 0xf4_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x13_u8, 0xf7_u8, 0x50_u8])
    def query_interface(this : IImageDecodeFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageDecodeFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageDecodeFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IImageDecodeFilter*, pEventSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pEventSink)
    end
    def process(this : IImageDecodeFilter*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process.call(this, pStream)
    end
    def terminate(this : IImageDecodeFilter*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hrStatus)
    end

  end

  @[Extern]

  record IImageDecodeEventSinkVtable,
    query_interface : Proc(IImageDecodeEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageDecodeEventSink*, UInt32),
    release : Proc(IImageDecodeEventSink*, UInt32),
    get_surface : Proc(IImageDecodeEventSink*, Int32, Int32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_begin_decode : Proc(IImageDecodeEventSink*, UInt32*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    on_bits_complete : Proc(IImageDecodeEventSink*, Win32cr::Foundation::HRESULT),
    on_decode_complete : Proc(IImageDecodeEventSink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_palette : Proc(IImageDecodeEventSink*, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IImageDecodeEventSink*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IImageDecodeEventSink, lpVtbl : IImageDecodeEventSinkVtable* do
    GUID = LibC::GUID.new(0xbaa342a0_u32, 0x2ded_u16, 0x11d0_u16, StaticArray[0x86_u8, 0xf4_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x13_u8, 0xf7_u8, 0x50_u8])
    def query_interface(this : IImageDecodeEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageDecodeEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageDecodeEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_surface(this : IImageDecodeEventSink*, nWidth : Int32, nHeight : Int32, bfid : LibC::GUID*, nPasses : UInt32, dwHints : UInt32, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_surface.call(this, nWidth, nHeight, bfid, nPasses, dwHints, ppSurface)
    end
    def on_begin_decode(this : IImageDecodeEventSink*, pdwEvents : UInt32*, pnFormats : UInt32*, ppFormats : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_decode.call(this, pdwEvents, pnFormats, ppFormats)
    end
    def on_bits_complete(this : IImageDecodeEventSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_bits_complete.call(this)
    end
    def on_decode_complete(this : IImageDecodeEventSink*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_decode_complete.call(this, hrStatus)
    end
    def on_palette(this : IImageDecodeEventSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_palette.call(this)
    end
    def on_progress(this : IImageDecodeEventSink*, pBounds : Win32cr::Foundation::RECT*, bComplete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, pBounds, bComplete)
    end

  end

  @[Extern]

  record IImageDecodeEventSink2Vtable,
    query_interface : Proc(IImageDecodeEventSink2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageDecodeEventSink2*, UInt32),
    release : Proc(IImageDecodeEventSink2*, UInt32),
    get_surface : Proc(IImageDecodeEventSink2*, Int32, Int32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_begin_decode : Proc(IImageDecodeEventSink2*, UInt32*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    on_bits_complete : Proc(IImageDecodeEventSink2*, Win32cr::Foundation::HRESULT),
    on_decode_complete : Proc(IImageDecodeEventSink2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_palette : Proc(IImageDecodeEventSink2*, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IImageDecodeEventSink2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_alpha_premult_required : Proc(IImageDecodeEventSink2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IImageDecodeEventSink2, lpVtbl : IImageDecodeEventSink2Vtable* do
    GUID = LibC::GUID.new(0x8ebd8a57_u32, 0x8a96_u16, 0x48c9_u16, StaticArray[0x84_u8, 0xa6_u8, 0x96_u8, 0x2e_u8, 0x2d_u8, 0xb9_u8, 0xc9_u8, 0x31_u8])
    def query_interface(this : IImageDecodeEventSink2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageDecodeEventSink2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageDecodeEventSink2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_surface(this : IImageDecodeEventSink2*, nWidth : Int32, nHeight : Int32, bfid : LibC::GUID*, nPasses : UInt32, dwHints : UInt32, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_surface.call(this, nWidth, nHeight, bfid, nPasses, dwHints, ppSurface)
    end
    def on_begin_decode(this : IImageDecodeEventSink2*, pdwEvents : UInt32*, pnFormats : UInt32*, ppFormats : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_decode.call(this, pdwEvents, pnFormats, ppFormats)
    end
    def on_bits_complete(this : IImageDecodeEventSink2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_bits_complete.call(this)
    end
    def on_decode_complete(this : IImageDecodeEventSink2*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_decode_complete.call(this, hrStatus)
    end
    def on_palette(this : IImageDecodeEventSink2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_palette.call(this)
    end
    def on_progress(this : IImageDecodeEventSink2*, pBounds : Win32cr::Foundation::RECT*, bComplete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, pBounds, bComplete)
    end
    def is_alpha_premult_required(this : IImageDecodeEventSink2*, pfPremultAlpha : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_alpha_premult_required.call(this, pfPremultAlpha)
    end

  end

  @[Extern]

  record ISniffStreamVtable,
    query_interface : Proc(ISniffStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISniffStream*, UInt32),
    release : Proc(ISniffStream*, UInt32),
    init : Proc(ISniffStream*, Void*, Win32cr::Foundation::HRESULT),
    peek : Proc(ISniffStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISniffStream, lpVtbl : ISniffStreamVtable* do
    GUID = LibC::GUID.new(0x4ef17940_u32, 0x30e0_u16, 0x11d0_u16, StaticArray[0xb7_u8, 0x24_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x1a_u8, 0x1_u8])
    def query_interface(this : ISniffStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISniffStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISniffStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : ISniffStream*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pStream)
    end
    def peek(this : ISniffStream*, pBuffer : Void*, nBytes : UInt32, pnBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek.call(this, pBuffer, nBytes, pnBytesRead)
    end

  end

  @[Extern]

  record IDithererImplVtable,
    query_interface : Proc(IDithererImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDithererImpl*, UInt32),
    release : Proc(IDithererImpl*, UInt32),
    set_dest_color_table : Proc(IDithererImpl*, UInt32, Win32cr::Graphics::Gdi::RGBQUAD*, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(IDithererImpl*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDithererImpl, lpVtbl : IDithererImplVtable* do
    GUID = LibC::GUID.new(0x7c48e840_u32, 0x3910_u16, 0x11d0_u16, StaticArray[0x86_u8, 0xfc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x13_u8, 0xf7_u8, 0x50_u8])
    def query_interface(this : IDithererImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDithererImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDithererImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_dest_color_table(this : IDithererImpl*, nColors : UInt32, prgbColors : Win32cr::Graphics::Gdi::RGBQUAD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dest_color_table.call(this, nColors, prgbColors)
    end
    def set_event_sink(this : IDithererImpl*, pEventSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_sink.call(this, pEventSink)
    end

  end

  def iEAssociateThreadWithTab(dwTabThreadID : UInt32, dwAssociatedThreadID : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEAssociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID)
    {% end %}
  end

  def iEDisassociateThreadWithTab(dwTabThreadID : UInt32, dwAssociatedThreadID : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEDisassociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID)
    {% end %}
  end

  def iEIsInPrivateBrowsing : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IEIsInPrivateBrowsing
    {% end %}
  end

  def iEInPrivateFilteringEnabled : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IEInPrivateFilteringEnabled
    {% end %}
  end

  def iETrackingProtectionEnabled : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IETrackingProtectionEnabled
    {% end %}
  end

  def iESaveFile(hState : Win32cr::Foundation::HANDLE, lpwstrSourceFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IESaveFile(hState, lpwstrSourceFile)
    {% end %}
  end

  def iECancelSaveFile(hState : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IECancelSaveFile(hState)
    {% end %}
  end

  def iEShowSaveFileDialog(hwnd : Win32cr::Foundation::HWND, lpwstrInitialFileName : Win32cr::Foundation::PWSTR, lpwstrInitialDir : Win32cr::Foundation::PWSTR, lpwstrFilter : Win32cr::Foundation::PWSTR, lpwstrDefExt : Win32cr::Foundation::PWSTR, dwFilterIndex : UInt32, dwFlags : UInt32, lppwstrDestinationFilePath : Win32cr::Foundation::PWSTR*, phState : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEShowSaveFileDialog(hwnd, lpwstrInitialFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags, lppwstrDestinationFilePath, phState)
    {% end %}
  end

  def iEShowOpenFileDialog(hwnd : Win32cr::Foundation::HWND, lpwstrFileName : Win32cr::Foundation::PWSTR, cchMaxFileName : UInt32, lpwstrInitialDir : Win32cr::Foundation::PWSTR, lpwstrFilter : Win32cr::Foundation::PWSTR, lpwstrDefExt : Win32cr::Foundation::PWSTR, dwFilterIndex : UInt32, dwFlags : UInt32, phFile : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEShowOpenFileDialog(hwnd, lpwstrFileName, cchMaxFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags, phFile)
    {% end %}
  end

  def iEGetWriteableLowHKCU(pHKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEGetWriteableLowHKCU(pHKey)
    {% end %}
  end

  def iEGetWriteableFolderPath(clsidFolderID : LibC::GUID*, lppwstrPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEGetWriteableFolderPath(clsidFolderID, lppwstrPath)
    {% end %}
  end

  def iEIsProtectedModeProcess(pbResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEIsProtectedModeProcess(pbResult)
    {% end %}
  end

  def iEIsProtectedModeURL(lpwstrUrl : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEIsProtectedModeURL(lpwstrUrl)
    {% end %}
  end

  def iELaunchURL(lpwstrUrl : Win32cr::Foundation::PWSTR, lpProcInfo : Win32cr::System::Threading::PROCESS_INFORMATION*, lpInfo : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IELaunchURL(lpwstrUrl, lpProcInfo, lpInfo)
    {% end %}
  end

  def iERefreshElevationPolicy : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IERefreshElevationPolicy
    {% end %}
  end

  def iEGetProtectedModeCookie(lpszURL : Win32cr::Foundation::PWSTR, lpszCookieName : Win32cr::Foundation::PWSTR, lpszCookieData : Win32cr::Foundation::PWSTR, pcchCookieData : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEGetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, pcchCookieData, dwFlags)
    {% end %}
  end

  def iESetProtectedModeCookie(lpszURL : Win32cr::Foundation::PWSTR, lpszCookieName : Win32cr::Foundation::PWSTR, lpszCookieData : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IESetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, dwFlags)
    {% end %}
  end

  def iERegisterWritableRegistryKey(guid : LibC::GUID, lpSubkey : Win32cr::Foundation::PWSTR, fSubkeyAllowed : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IERegisterWritableRegistryKey(guid, lpSubkey, fSubkeyAllowed)
    {% end %}
  end

  def iERegisterWritableRegistryValue(guid : LibC::GUID, lpPath : Win32cr::Foundation::PWSTR, lpValueName : Win32cr::Foundation::PWSTR, dwType : UInt32, lpData : UInt8*, cbMaxData : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IERegisterWritableRegistryValue(guid, lpPath, lpValueName, dwType, lpData, cbMaxData)
    {% end %}
  end

  def iEUnregisterWritableRegistry(guid : LibC::GUID) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IEUnregisterWritableRegistry(guid)
    {% end %}
  end

  def iERegCreateKeyEx(lpSubKey : Win32cr::Foundation::PWSTR, reserved : UInt32, lpClass : Win32cr::Foundation::PWSTR, dwOptions : UInt32, samDesired : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, phkResult : Win32cr::System::Registry::HKEY*, lpdwDisposition : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IERegCreateKeyEx(lpSubKey, reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition)
    {% end %}
  end

  def iERegSetValueEx(lpSubKey : Win32cr::Foundation::PWSTR, lpValueName : Win32cr::Foundation::PWSTR, reserved : UInt32, dwType : UInt32, lpData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IERegSetValueEx(lpSubKey, lpValueName, reserved, dwType, lpData, cbData)
    {% end %}
  end

  def iECreateFile(lpFileName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwCreationDisposition : UInt32, dwFlagsAndAttributes : UInt32, hTemplateFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.IECreateFile(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile)
    {% end %}
  end

  def iEDeleteFile(lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IEDeleteFile(lpFileName)
    {% end %}
  end

  def iERemoveDirectory(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IERemoveDirectory(lpPathName)
    {% end %}
  end

  def iEMoveFileEx(lpExistingFileName : Win32cr::Foundation::PWSTR, lpNewFileName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IEMoveFileEx(lpExistingFileName, lpNewFileName, dwFlags)
    {% end %}
  end

  def iECreateDirectory(lpPathName : Win32cr::Foundation::PWSTR, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IECreateDirectory(lpPathName, lpSecurityAttributes)
    {% end %}
  end

  def iEGetFileAttributesEx(lpFileName : Win32cr::Foundation::PWSTR, fInfoLevelId : Win32cr::Storage::FileSystem::GET_FILEEX_INFO_LEVELS, lpFileInformation : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IEGetFileAttributesEx(lpFileName, fInfoLevelId, lpFileInformation)
    {% end %}
  end

  def iEFindFirstFile(lpFileName : Win32cr::Foundation::PWSTR, lpFindFileData : Win32cr::Storage::FileSystem::WIN32_FIND_DATAA*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.IEFindFirstFile(lpFileName, lpFindFileData)
    {% end %}
  end

  def ratingEnable(hwndParent : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingEnable(hwndParent, pszUsername, fEnable)
    {% end %}
  end

  def ratingEnableW(hwndParent : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingEnableW(hwndParent, pszUsername, fEnable)
    {% end %}
  end

  def ratingCheckUserAccess(pszUsername : Win32cr::Foundation::PSTR, pszURL : Win32cr::Foundation::PSTR, pszRatingInfo : Win32cr::Foundation::PSTR, pData : UInt8*, cbData : UInt32, ppRatingDetails : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingCheckUserAccess(pszUsername, pszURL, pszRatingInfo, pData, cbData, ppRatingDetails)
    {% end %}
  end

  def ratingCheckUserAccessW(pszUsername : Win32cr::Foundation::PWSTR, pszURL : Win32cr::Foundation::PWSTR, pszRatingInfo : Win32cr::Foundation::PWSTR, pData : UInt8*, cbData : UInt32, ppRatingDetails : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingCheckUserAccessW(pszUsername, pszURL, pszRatingInfo, pData, cbData, ppRatingDetails)
    {% end %}
  end

  def ratingAccessDeniedDialog(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, pszContentDescription : Win32cr::Foundation::PSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingAccessDeniedDialog(hDlg, pszUsername, pszContentDescription, pRatingDetails)
    {% end %}
  end

  def ratingAccessDeniedDialogW(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, pszContentDescription : Win32cr::Foundation::PWSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingAccessDeniedDialogW(hDlg, pszUsername, pszContentDescription, pRatingDetails)
    {% end %}
  end

  def ratingAccessDeniedDialog2(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingAccessDeniedDialog2(hDlg, pszUsername, pRatingDetails)
    {% end %}
  end

  def ratingAccessDeniedDialog2W(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingAccessDeniedDialog2W(hDlg, pszUsername, pRatingDetails)
    {% end %}
  end

  def ratingFreeDetails(pRatingDetails : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingFreeDetails(pRatingDetails)
    {% end %}
  end

  def ratingObtainCancel(hRatingObtainQuery : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingObtainCancel(hRatingObtainQuery)
    {% end %}
  end

  def ratingObtainQuery(pszTargetUrl : Win32cr::Foundation::PSTR, dwUserData : UInt32, fCallback : LibC::IntPtrT, phRatingObtainQuery : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingObtainQuery(pszTargetUrl, dwUserData, fCallback, phRatingObtainQuery)
    {% end %}
  end

  def ratingObtainQueryW(pszTargetUrl : Win32cr::Foundation::PWSTR, dwUserData : UInt32, fCallback : LibC::IntPtrT, phRatingObtainQuery : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingObtainQueryW(pszTargetUrl, dwUserData, fCallback, phRatingObtainQuery)
    {% end %}
  end

  def ratingSetupUI(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingSetupUI(hDlg, pszUsername)
    {% end %}
  end

  def ratingSetupUIW(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingSetupUIW(hDlg, pszUsername)
    {% end %}
  end

  def ratingAddToApprovedSites(hDlg : Win32cr::Foundation::HWND, cbPasswordBlob : UInt32, pbPasswordBlob : UInt8*, lpszUrl : Win32cr::Foundation::PWSTR, fAlwaysNever : Win32cr::Foundation::BOOL, fSitePage : Win32cr::Foundation::BOOL, fApprovedSitesEnforced : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingAddToApprovedSites(hDlg, cbPasswordBlob, pbPasswordBlob, lpszUrl, fAlwaysNever, fSitePage, fApprovedSitesEnforced)
    {% end %}
  end

  def ratingClickedOnPRFInternal(hWndOwner : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::HINSTANCE, lpszFileName : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingClickedOnPRFInternal(hWndOwner, param1, lpszFileName, nShow)
    {% end %}
  end

  def ratingClickedOnRATInternal(hWndOwner : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::HINSTANCE, lpszFileName : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingClickedOnRATInternal(hWndOwner, param1, lpszFileName, nShow)
    {% end %}
  end

  def ratingEnabledQuery : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingEnabledQuery
    {% end %}
  end

  def ratingInit : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RatingInit
    {% end %}
  end

  def createMIMEMap(ppMap : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateMIMEMap(ppMap)
    {% end %}
  end

  def decodeImage(pStream : Void*, pMap : Void*, pEventSink : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DecodeImage(pStream, pMap, pEventSink)
    {% end %}
  end

  def sniffStream(pInStream : Void*, pnFormat : UInt32*, ppOutStream : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.SniffStream(pInStream, pnFormat, ppOutStream)
    {% end %}
  end

  def getMaxMIMEIDBytes(pnMaxBytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetMaxMIMEIDBytes(pnMaxBytes)
    {% end %}
  end

  def identifyMIMEType(pbBytes : UInt8*, nBytes : UInt32, pnFormat : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IdentifyMIMEType(pbBytes, nBytes, pnFormat)
    {% end %}
  end

  def computeInvCMAP(pRGBColors : Win32cr::Graphics::Gdi::RGBQUAD*, nColors : UInt32, pInvTable : UInt8*, cbTable : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ComputeInvCMAP(pRGBColors, nColors, pInvTable, cbTable)
    {% end %}
  end

  def ditherTo8(pDestBits : UInt8*, nDestPitch : Int32, pSrcBits : UInt8*, nSrcPitch : Int32, bfidSrc : LibC::GUID*, prgbDestColors : Win32cr::Graphics::Gdi::RGBQUAD*, prgbSrcColors : Win32cr::Graphics::Gdi::RGBQUAD*, pbDestInvMap : UInt8*, x : Int32, y : Int32, cx : Int32, cy : Int32, lDestTrans : Int32, lSrcTrans : Int32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DitherTo8(pDestBits, nDestPitch, pSrcBits, nSrcPitch, bfidSrc, prgbDestColors, prgbSrcColors, pbDestInvMap, x, y, cx, cy, lDestTrans, lSrcTrans)
    {% end %}
  end

  def createDDrawSurfaceOnDIB(hbmDib : Win32cr::Graphics::Gdi::HBITMAP, ppSurface : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateDDrawSurfaceOnDIB(hbmDib, ppSurface)
    {% end %}
  end

  def decodeImageEx(pStream : Void*, pMap : Void*, pEventSink : Void*, pszMIMETypeParam : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DecodeImageEx(pStream, pMap, pEventSink, pszMIMETypeParam)
    {% end %}
  end

  @[Link("ieframe")]
  @[Link("msrating")]
  @[Link("imgutil")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun IEAssociateThreadWithTab(dwTabThreadID : UInt32, dwAssociatedThreadID : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEDisassociateThreadWithTab(dwTabThreadID : UInt32, dwAssociatedThreadID : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEIsInPrivateBrowsing : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IEInPrivateFilteringEnabled : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IETrackingProtectionEnabled : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IESaveFile(hState : Win32cr::Foundation::HANDLE, lpwstrSourceFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IECancelSaveFile(hState : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEShowSaveFileDialog(hwnd : Win32cr::Foundation::HWND, lpwstrInitialFileName : Win32cr::Foundation::PWSTR, lpwstrInitialDir : Win32cr::Foundation::PWSTR, lpwstrFilter : Win32cr::Foundation::PWSTR, lpwstrDefExt : Win32cr::Foundation::PWSTR, dwFilterIndex : UInt32, dwFlags : UInt32, lppwstrDestinationFilePath : Win32cr::Foundation::PWSTR*, phState : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEShowOpenFileDialog(hwnd : Win32cr::Foundation::HWND, lpwstrFileName : Win32cr::Foundation::PWSTR, cchMaxFileName : UInt32, lpwstrInitialDir : Win32cr::Foundation::PWSTR, lpwstrFilter : Win32cr::Foundation::PWSTR, lpwstrDefExt : Win32cr::Foundation::PWSTR, dwFilterIndex : UInt32, dwFlags : UInt32, phFile : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEGetWriteableLowHKCU(pHKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEGetWriteableFolderPath(clsidFolderID : LibC::GUID*, lppwstrPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEIsProtectedModeProcess(pbResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEIsProtectedModeURL(lpwstrUrl : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IELaunchURL(lpwstrUrl : Win32cr::Foundation::PWSTR, lpProcInfo : Win32cr::System::Threading::PROCESS_INFORMATION*, lpInfo : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IERefreshElevationPolicy : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEGetProtectedModeCookie(lpszURL : Win32cr::Foundation::PWSTR, lpszCookieName : Win32cr::Foundation::PWSTR, lpszCookieData : Win32cr::Foundation::PWSTR, pcchCookieData : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IESetProtectedModeCookie(lpszURL : Win32cr::Foundation::PWSTR, lpszCookieName : Win32cr::Foundation::PWSTR, lpszCookieData : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IERegisterWritableRegistryKey(guid : LibC::GUID, lpSubkey : Win32cr::Foundation::PWSTR, fSubkeyAllowed : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IERegisterWritableRegistryValue(guid : LibC::GUID, lpPath : Win32cr::Foundation::PWSTR, lpValueName : Win32cr::Foundation::PWSTR, dwType : UInt32, lpData : UInt8*, cbMaxData : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IEUnregisterWritableRegistry(guid : LibC::GUID) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IERegCreateKeyEx(lpSubKey : Win32cr::Foundation::PWSTR, reserved : UInt32, lpClass : Win32cr::Foundation::PWSTR, dwOptions : UInt32, samDesired : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, phkResult : Win32cr::System::Registry::HKEY*, lpdwDisposition : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IERegSetValueEx(lpSubKey : Win32cr::Foundation::PWSTR, lpValueName : Win32cr::Foundation::PWSTR, reserved : UInt32, dwType : UInt32, lpData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IECreateFile(lpFileName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, dwShareMode : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwCreationDisposition : UInt32, dwFlagsAndAttributes : UInt32, hTemplateFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun IEDeleteFile(lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IERemoveDirectory(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IEMoveFileEx(lpExistingFileName : Win32cr::Foundation::PWSTR, lpNewFileName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IECreateDirectory(lpPathName : Win32cr::Foundation::PWSTR, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IEGetFileAttributesEx(lpFileName : Win32cr::Foundation::PWSTR, fInfoLevelId : Win32cr::Storage::FileSystem::GET_FILEEX_INFO_LEVELS, lpFileInformation : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IEFindFirstFile(lpFileName : Win32cr::Foundation::PWSTR, lpFindFileData : Win32cr::Storage::FileSystem::WIN32_FIND_DATAA*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun RatingEnable(hwndParent : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingEnableW(hwndParent : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingCheckUserAccess(pszUsername : Win32cr::Foundation::PSTR, pszURL : Win32cr::Foundation::PSTR, pszRatingInfo : Win32cr::Foundation::PSTR, pData : UInt8*, cbData : UInt32, ppRatingDetails : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingCheckUserAccessW(pszUsername : Win32cr::Foundation::PWSTR, pszURL : Win32cr::Foundation::PWSTR, pszRatingInfo : Win32cr::Foundation::PWSTR, pData : UInt8*, cbData : UInt32, ppRatingDetails : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingAccessDeniedDialog(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, pszContentDescription : Win32cr::Foundation::PSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingAccessDeniedDialogW(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, pszContentDescription : Win32cr::Foundation::PWSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingAccessDeniedDialog2(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingAccessDeniedDialog2W(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR, pRatingDetails : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingFreeDetails(pRatingDetails : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingObtainCancel(hRatingObtainQuery : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingObtainQuery(pszTargetUrl : Win32cr::Foundation::PSTR, dwUserData : UInt32, fCallback : LibC::IntPtrT, phRatingObtainQuery : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingObtainQueryW(pszTargetUrl : Win32cr::Foundation::PWSTR, dwUserData : UInt32, fCallback : LibC::IntPtrT, phRatingObtainQuery : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingSetupUI(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingSetupUIW(hDlg : Win32cr::Foundation::HWND, pszUsername : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingAddToApprovedSites(hDlg : Win32cr::Foundation::HWND, cbPasswordBlob : UInt32, pbPasswordBlob : UInt8*, lpszUrl : Win32cr::Foundation::PWSTR, fAlwaysNever : Win32cr::Foundation::BOOL, fSitePage : Win32cr::Foundation::BOOL, fApprovedSitesEnforced : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingClickedOnPRFInternal(hWndOwner : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::HINSTANCE, lpszFileName : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingClickedOnRATInternal(hWndOwner : Win32cr::Foundation::HWND, param1 : Win32cr::Foundation::HINSTANCE, lpszFileName : Win32cr::Foundation::PSTR, nShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingEnabledQuery : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RatingInit : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateMIMEMap(ppMap : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DecodeImage(pStream : Void*, pMap : Void*, pEventSink : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SniffStream(pInStream : Void*, pnFormat : UInt32*, ppOutStream : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetMaxMIMEIDBytes(pnMaxBytes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IdentifyMIMEType(pbBytes : UInt8*, nBytes : UInt32, pnFormat : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ComputeInvCMAP(pRGBColors : Win32cr::Graphics::Gdi::RGBQUAD*, nColors : UInt32, pInvTable : UInt8*, cbTable : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DitherTo8(pDestBits : UInt8*, nDestPitch : Int32, pSrcBits : UInt8*, nSrcPitch : Int32, bfidSrc : LibC::GUID*, prgbDestColors : Win32cr::Graphics::Gdi::RGBQUAD*, prgbSrcColors : Win32cr::Graphics::Gdi::RGBQUAD*, pbDestInvMap : UInt8*, x : Int32, y : Int32, cx : Int32, cy : Int32, lDestTrans : Int32, lSrcTrans : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateDDrawSurfaceOnDIB(hbmDib : Win32cr::Graphics::Gdi::HBITMAP, ppSurface : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DecodeImageEx(pStream : Void*, pMap : Void*, pEventSink : Void*, pszMIMETypeParam : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end