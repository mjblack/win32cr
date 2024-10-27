require "./../../foundation.cr"
require "./../controls.cr"
require "./../../graphics/gdi.cr"
require "./../../system/com.cr"

module Win32cr::UI::Controls::Dialogs
  alias LPOFNHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPCCHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPFRHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPCFHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPPRINTHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPSETUPHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPPAGEPAINTHOOK = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  alias LPPAGESETUPHOOK = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, LibC::UIntPtrT)*

  OFN_SHAREFALLTHROUGH = 2_u32
  OFN_SHARENOWARN = 1_u32
  OFN_SHAREWARN = 0_u32
  CDM_FIRST = 1124_u32
  CDM_LAST = 1224_u32
  CDM_GETSPEC = 1124_u32
  CDM_GETFILEPATH = 1125_u32
  CDM_GETFOLDERPATH = 1126_u32
  CDM_GETFOLDERIDLIST = 1127_u32
  CDM_SETCONTROLTEXT = 1128_u32
  CDM_HIDECONTROL = 1129_u32
  CDM_SETDEFEXT = 1130_u32
  FR_RAW = 131072_u32
  FR_SHOWWRAPAROUND = 262144_u32
  FR_NOWRAPAROUND = 524288_u32
  FR_WRAPAROUND = 1048576_u32
  FRM_FIRST = 1124_u32
  FRM_LAST = 1224_u32
  FRM_SETOPERATIONRESULT = 1124_u32
  FRM_SETOPERATIONRESULTTEXT = 1125_u32
  PS_OPENTYPE_FONTTYPE = 65536_u32
  TT_OPENTYPE_FONTTYPE = 131072_u32
  TYPE1_FONTTYPE = 262144_u32
  SYMBOL_FONTTYPE = 524288_u32
  WM_CHOOSEFONT_GETLOGFONT = 1025_u32
  WM_CHOOSEFONT_SETLOGFONT = 1125_u32
  WM_CHOOSEFONT_SETFLAGS = 1126_u32
  LBSELCHSTRINGA = "commdlg_LBSelChangedNotify"
  SHAREVISTRINGA = "commdlg_ShareViolation"
  FILEOKSTRINGA = "commdlg_FileNameOK"
  COLOROKSTRINGA = "commdlg_ColorOK"
  SETRGBSTRINGA = "commdlg_SetRGBColor"
  HELPMSGSTRINGA = "commdlg_help"
  FINDMSGSTRINGA = "commdlg_FindReplace"
  LBSELCHSTRINGW = "commdlg_LBSelChangedNotify"
  SHAREVISTRINGW = "commdlg_ShareViolation"
  FILEOKSTRINGW = "commdlg_FileNameOK"
  COLOROKSTRINGW = "commdlg_ColorOK"
  SETRGBSTRINGW = "commdlg_SetRGBColor"
  HELPMSGSTRINGW = "commdlg_help"
  FINDMSGSTRINGW = "commdlg_FindReplace"
  LBSELCHSTRING = "commdlg_LBSelChangedNotify"
  SHAREVISTRING = "commdlg_ShareViolation"
  FILEOKSTRING = "commdlg_FileNameOK"
  COLOROKSTRING = "commdlg_ColorOK"
  SETRGBSTRING = "commdlg_SetRGBColor"
  HELPMSGSTRING = "commdlg_help"
  FINDMSGSTRING = "commdlg_FindReplace"
  CD_LBSELNOITEMS = -1_i32
  CD_LBSELCHANGE = 0_u32
  CD_LBSELSUB = 1_u32
  CD_LBSELADD = 2_u32
  START_PAGE_GENERAL = 4294967295_u32
  PD_RESULT_CANCEL = 0_u32
  PD_RESULT_PRINT = 1_u32
  PD_RESULT_APPLY = 2_u32
  DN_DEFAULTPRN = 1_u32
  WM_PSD_FULLPAGERECT = 1025_u32
  WM_PSD_MINMARGINRECT = 1026_u32
  WM_PSD_MARGINRECT = 1027_u32
  WM_PSD_GREEKTEXTRECT = 1028_u32
  WM_PSD_ENVSTAMPRECT = 1029_u32
  WM_PSD_YAFULLPAGERECT = 1030_u32
  DLG_COLOR = 10_u32
  COLOR_HUESCROLL = 700_u32
  COLOR_SATSCROLL = 701_u32
  COLOR_LUMSCROLL = 702_u32
  COLOR_HUE = 703_u32
  COLOR_SAT = 704_u32
  COLOR_LUM = 705_u32
  COLOR_RED = 706_u32
  COLOR_GREEN = 707_u32
  COLOR_BLUE = 708_u32
  COLOR_CURRENT = 709_u32
  COLOR_RAINBOW = 710_u32
  COLOR_SAVE = 711_u32
  COLOR_ADD = 712_u32
  COLOR_SOLID = 713_u32
  COLOR_TUNE = 714_u32
  COLOR_SCHEMES = 715_u32
  COLOR_ELEMENT = 716_u32
  COLOR_SAMPLES = 717_u32
  COLOR_PALETTE = 718_u32
  COLOR_MIX = 719_u32
  COLOR_BOX1 = 720_u32
  COLOR_CUSTOM1 = 721_u32
  COLOR_HUEACCEL = 723_u32
  COLOR_SATACCEL = 724_u32
  COLOR_LUMACCEL = 725_u32
  COLOR_REDACCEL = 726_u32
  COLOR_GREENACCEL = 727_u32
  COLOR_BLUEACCEL = 728_u32
  COLOR_SOLID_LEFT = 730_u32
  COLOR_SOLID_RIGHT = 731_u32
  NUM_BASIC_COLORS = 48_u32
  NUM_CUSTOM_COLORS = 16_u32

  enum COMMON_DLG_ERRORS : UInt32
    CDERR_DIALOGFAILURE = 65535_u32
    CDERR_GENERALCODES = 0_u32
    CDERR_STRUCTSIZE = 1_u32
    CDERR_INITIALIZATION = 2_u32
    CDERR_NOTEMPLATE = 3_u32
    CDERR_NOHINSTANCE = 4_u32
    CDERR_LOADSTRFAILURE = 5_u32
    CDERR_FINDRESFAILURE = 6_u32
    CDERR_LOADRESFAILURE = 7_u32
    CDERR_LOCKRESFAILURE = 8_u32
    CDERR_MEMALLOCFAILURE = 9_u32
    CDERR_MEMLOCKFAILURE = 10_u32
    CDERR_NOHOOK = 11_u32
    CDERR_REGISTERMSGFAIL = 12_u32
    PDERR_PRINTERCODES = 4096_u32
    PDERR_SETUPFAILURE = 4097_u32
    PDERR_PARSEFAILURE = 4098_u32
    PDERR_RETDEFFAILURE = 4099_u32
    PDERR_LOADDRVFAILURE = 4100_u32
    PDERR_GETDEVMODEFAIL = 4101_u32
    PDERR_INITFAILURE = 4102_u32
    PDERR_NODEVICES = 4103_u32
    PDERR_NODEFAULTPRN = 4104_u32
    PDERR_DNDMMISMATCH = 4105_u32
    PDERR_CREATEICFAILURE = 4106_u32
    PDERR_PRINTERNOTFOUND = 4107_u32
    PDERR_DEFAULTDIFFERENT = 4108_u32
    CFERR_CHOOSEFONTCODES = 8192_u32
    CFERR_NOFONTS = 8193_u32
    CFERR_MAXLESSTHANMIN = 8194_u32
    FNERR_FILENAMECODES = 12288_u32
    FNERR_SUBCLASSFAILURE = 12289_u32
    FNERR_INVALIDFILENAME = 12290_u32
    FNERR_BUFFERTOOSMALL = 12291_u32
    FRERR_FINDREPLACECODES = 16384_u32
    FRERR_BUFFERLENGTHZERO = 16385_u32
    CCERR_CHOOSECOLORCODES = 20480_u32
  end
  @[Flags]
  enum OPEN_FILENAME_FLAGS : UInt32
    OFN_READONLY = 1_u32
    OFN_OVERWRITEPROMPT = 2_u32
    OFN_HIDEREADONLY = 4_u32
    OFN_NOCHANGEDIR = 8_u32
    OFN_SHOWHELP = 16_u32
    OFN_ENABLEHOOK = 32_u32
    OFN_ENABLETEMPLATE = 64_u32
    OFN_ENABLETEMPLATEHANDLE = 128_u32
    OFN_NOVALIDATE = 256_u32
    OFN_ALLOWMULTISELECT = 512_u32
    OFN_EXTENSIONDIFFERENT = 1024_u32
    OFN_PATHMUSTEXIST = 2048_u32
    OFN_FILEMUSTEXIST = 4096_u32
    OFN_CREATEPROMPT = 8192_u32
    OFN_SHAREAWARE = 16384_u32
    OFN_NOREADONLYRETURN = 32768_u32
    OFN_NOTESTFILECREATE = 65536_u32
    OFN_NONETWORKBUTTON = 131072_u32
    OFN_NOLONGNAMES = 262144_u32
    OFN_EXPLORER = 524288_u32
    OFN_NODEREFERENCELINKS = 1048576_u32
    OFN_LONGNAMES = 2097152_u32
    OFN_ENABLEINCLUDENOTIFY = 4194304_u32
    OFN_ENABLESIZING = 8388608_u32
    OFN_DONTADDTORECENT = 33554432_u32
    OFN_FORCESHOWHIDDEN = 268435456_u32
  end
  @[Flags]
  enum OPEN_FILENAME_FLAGS_EX : UInt32
    OFN_EX_NONE = 0_u32
    OFN_EX_NOPLACESBAR = 1_u32
  end
  @[Flags]
  enum PAGESETUPDLG_FLAGS : UInt32
    PSD_DEFAULTMINMARGINS = 0_u32
    PSD_DISABLEMARGINS = 16_u32
    PSD_DISABLEORIENTATION = 256_u32
    PSD_DISABLEPAGEPAINTING = 524288_u32
    PSD_DISABLEPAPER = 512_u32
    PSD_DISABLEPRINTER = 32_u32
    PSD_ENABLEPAGEPAINTHOOK = 262144_u32
    PSD_ENABLEPAGESETUPHOOK = 8192_u32
    PSD_ENABLEPAGESETUPTEMPLATE = 32768_u32
    PSD_ENABLEPAGESETUPTEMPLATEHANDLE = 131072_u32
    PSD_INHUNDREDTHSOFMILLIMETERS = 8_u32
    PSD_INTHOUSANDTHSOFINCHES = 4_u32
    PSD_INWININIINTLMEASURE = 0_u32
    PSD_MARGINS = 2_u32
    PSD_MINMARGINS = 1_u32
    PSD_NONETWORKBUTTON = 2097152_u32
    PSD_NOWARNING = 128_u32
    PSD_RETURNDEFAULT = 1024_u32
    PSD_SHOWHELP = 2048_u32
  end
  @[Flags]
  enum CHOOSEFONT_FLAGS : UInt32
    CF_APPLY = 512_u32
    CF_ANSIONLY = 1024_u32
    CF_BOTH = 3_u32
    CF_EFFECTS = 256_u32
    CF_ENABLEHOOK = 8_u32
    CF_ENABLETEMPLATE = 16_u32
    CF_ENABLETEMPLATEHANDLE = 32_u32
    CF_FIXEDPITCHONLY = 16384_u32
    CF_FORCEFONTEXIST = 65536_u32
    CF_INACTIVEFONTS = 33554432_u32
    CF_INITTOLOGFONTSTRUCT = 64_u32
    CF_LIMITSIZE = 8192_u32
    CF_NOOEMFONTS = 2048_u32
    CF_NOFACESEL = 524288_u32
    CF_NOSCRIPTSEL = 8388608_u32
    CF_NOSIMULATIONS = 4096_u32
    CF_NOSIZESEL = 2097152_u32
    CF_NOSTYLESEL = 1048576_u32
    CF_NOVECTORFONTS = 2048_u32
    CF_NOVERTFONTS = 16777216_u32
    CF_PRINTERFONTS = 2_u32
    CF_SCALABLEONLY = 131072_u32
    CF_SCREENFONTS = 1_u32
    CF_SCRIPTSONLY = 1024_u32
    CF_SELECTSCRIPT = 4194304_u32
    CF_SHOWHELP = 4_u32
    CF_TTONLY = 262144_u32
    CF_USESTYLE = 128_u32
    CF_WYSIWYG = 32768_u32
  end
  @[Flags]
  enum FINDREPLACE_FLAGS : UInt32
    FR_DIALOGTERM = 64_u32
    FR_DOWN = 1_u32
    FR_ENABLEHOOK = 256_u32
    FR_ENABLETEMPLATE = 512_u32
    FR_ENABLETEMPLATEHANDLE = 8192_u32
    FR_FINDNEXT = 8_u32
    FR_HIDEUPDOWN = 16384_u32
    FR_HIDEMATCHCASE = 32768_u32
    FR_HIDEWHOLEWORD = 65536_u32
    FR_MATCHCASE = 4_u32
    FR_NOMATCHCASE = 2048_u32
    FR_NOUPDOWN = 1024_u32
    FR_NOWHOLEWORD = 4096_u32
    FR_REPLACE = 16_u32
    FR_REPLACEALL = 32_u32
    FR_SHOWHELP = 128_u32
    FR_WHOLEWORD = 2_u32
  end
  @[Flags]
  enum PRINTDLGEX_FLAGS : UInt32
    PD_ALLPAGES = 0_u32
    PD_COLLATE = 16_u32
    PD_CURRENTPAGE = 4194304_u32
    PD_DISABLEPRINTTOFILE = 524288_u32
    PD_ENABLEPRINTTEMPLATE = 16384_u32
    PD_ENABLEPRINTTEMPLATEHANDLE = 65536_u32
    PD_EXCLUSIONFLAGS = 16777216_u32
    PD_HIDEPRINTTOFILE = 1048576_u32
    PD_NOCURRENTPAGE = 8388608_u32
    PD_NOPAGENUMS = 8_u32
    PD_NOSELECTION = 4_u32
    PD_NOWARNING = 128_u32
    PD_PAGENUMS = 2_u32
    PD_PRINTTOFILE = 32_u32
    PD_RETURNDC = 256_u32
    PD_RETURNDEFAULT = 1024_u32
    PD_RETURNIC = 512_u32
    PD_SELECTION = 1_u32
    PD_USEDEVMODECOPIES = 262144_u32
    PD_USEDEVMODECOPIESANDCOLLATE = 262144_u32
    PD_USELARGETEMPLATE = 268435456_u32
    PD_ENABLEPRINTHOOK = 4096_u32
    PD_ENABLESETUPHOOK = 8192_u32
    PD_ENABLESETUPTEMPLATE = 32768_u32
    PD_ENABLESETUPTEMPLATEHANDLE = 131072_u32
    PD_NONETWORKBUTTON = 2097152_u32
    PD_PRINTSETUP = 64_u32
    PD_SHOWHELP = 2048_u32
  end
  @[Flags]
  enum CHOOSEFONT_FONT_TYPE : UInt16
    BOLD_FONTTYPE = 256_u16
    ITALIC_FONTTYPE = 512_u16
    PRINTER_FONTTYPE = 16384_u16
    REGULAR_FONTTYPE = 1024_u16
    SCREEN_FONTTYPE = 8192_u16
    SIMULATED_FONTTYPE = 32768_u16
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OPENFILENAME_NT4A,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PSTR,
    lpstrCustomFilter : Win32cr::Foundation::PSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PSTR,
    lpstrTitle : Win32cr::Foundation::PSTR,
    flags : UInt32,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OPENFILENAME_NT4W,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PWSTR,
    lpstrCustomFilter : Win32cr::Foundation::PWSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PWSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PWSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PWSTR,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PWSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OPENFILENAMEA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PSTR,
    lpstrCustomFilter : Win32cr::Foundation::PSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PSTR,
    lpstrTitle : Win32cr::Foundation::PSTR,
    flags : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR,
    pvReserved : Void*,
    dwReserved : UInt32,
    flags_ex : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS_EX
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OPENFILENAMEW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PWSTR,
    lpstrCustomFilter : Win32cr::Foundation::PWSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PWSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PWSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PWSTR,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    flags : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PWSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR,
    pvReserved : Void*,
    dwReserved : UInt32,
    flags_ex : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS_EX
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OFNOTIFYA,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*,
    pszFile : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OFNOTIFYW,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*,
    pszFile : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OFNOTIFYEXA,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*,
    psf : Void*,
    pidl : Void*
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record OFNOTIFYEXW,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*,
    psf : Void*,
    pidl : Void*
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record CHOOSECOLORA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HWND,
    rgbResult : UInt32,
    lpCustColors : UInt32*,
    flags : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCCHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record CHOOSECOLORW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HWND,
    rgbResult : UInt32,
    lpCustColors : UInt32*,
    flags : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCCHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record FINDREPLACEA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    flags : Win32cr::UI::Controls::Dialogs::FINDREPLACE_FLAGS,
    lpstrFindWhat : Win32cr::Foundation::PSTR,
    lpstrReplaceWith : Win32cr::Foundation::PSTR,
    wFindWhatLen : UInt16,
    wReplaceWithLen : UInt16,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPFRHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record FINDREPLACEW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    flags : Win32cr::UI::Controls::Dialogs::FINDREPLACE_FLAGS,
    lpstrFindWhat : Win32cr::Foundation::PWSTR,
    lpstrReplaceWith : Win32cr::Foundation::PWSTR,
    wFindWhatLen : UInt16,
    wReplaceWithLen : UInt16,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPFRHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record CHOOSEFONTA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDC : Win32cr::Graphics::Gdi::HDC,
    lpLogFont : Win32cr::Graphics::Gdi::LOGFONTA*,
    iPointSize : Int32,
    flags : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FLAGS,
    rgbColors : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCFHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpszStyle : Win32cr::Foundation::PSTR,
    nFontType : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FONT_TYPE,
    ___missing_alignment__ : UInt16,
    nSizeMin : Int32,
    nSizeMax : Int32
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record CHOOSEFONTW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDC : Win32cr::Graphics::Gdi::HDC,
    lpLogFont : Win32cr::Graphics::Gdi::LOGFONTW*,
    iPointSize : Int32,
    flags : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FLAGS,
    rgbColors : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCFHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpszStyle : Win32cr::Foundation::PWSTR,
    nFontType : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FONT_TYPE,
    ___missing_alignment__ : UInt16,
    nSizeMin : Int32,
    nSizeMax : Int32
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PRINTDLGA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    nFromPage : UInt16,
    nToPage : UInt16,
    nMinPage : UInt16,
    nMaxPage : UInt16,
    nCopies : UInt16,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPrintHook : Win32cr::UI::Controls::Dialogs::LPPRINTHOOKPROC,
    lpfnSetupHook : Win32cr::UI::Controls::Dialogs::LPSETUPHOOKPROC,
    lpPrintTemplateName : Win32cr::Foundation::PSTR,
    lpSetupTemplateName : Win32cr::Foundation::PSTR,
    hPrintTemplate : LibC::IntPtrT,
    hSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PRINTDLGW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    nFromPage : UInt16,
    nToPage : UInt16,
    nMinPage : UInt16,
    nMaxPage : UInt16,
    nCopies : UInt16,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPrintHook : Win32cr::UI::Controls::Dialogs::LPPRINTHOOKPROC,
    lpfnSetupHook : Win32cr::UI::Controls::Dialogs::LPSETUPHOOKPROC,
    lpPrintTemplateName : Win32cr::Foundation::PWSTR,
    lpSetupTemplateName : Win32cr::Foundation::PWSTR,
    hPrintTemplate : LibC::IntPtrT,
    hSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PRINTPAGERANGE,
    nFromPage : UInt32,
    nToPage : UInt32
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PRINTDLGEXA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    flags2 : UInt32,
    exclusion_flags : UInt32,
    nPageRanges : UInt32,
    nMaxPageRanges : UInt32,
    lpPageRanges : Win32cr::UI::Controls::Dialogs::PRINTPAGERANGE*,
    nMinPage : UInt32,
    nMaxPage : UInt32,
    nCopies : UInt32,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpPrintTemplateName : Win32cr::Foundation::PSTR,
    lpCallback : Void*,
    nPropertyPages : UInt32,
    lphPropertyPages : Win32cr::UI::Controls::HPROPSHEETPAGE*,
    nStartPage : UInt32,
    dwResultAction : UInt32
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PRINTDLGEXW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    flags2 : UInt32,
    exclusion_flags : UInt32,
    nPageRanges : UInt32,
    nMaxPageRanges : UInt32,
    lpPageRanges : Win32cr::UI::Controls::Dialogs::PRINTPAGERANGE*,
    nMinPage : UInt32,
    nMaxPage : UInt32,
    nCopies : UInt32,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpPrintTemplateName : Win32cr::Foundation::PWSTR,
    lpCallback : Void*,
    nPropertyPages : UInt32,
    lphPropertyPages : Win32cr::UI::Controls::HPROPSHEETPAGE*,
    nStartPage : UInt32,
    dwResultAction : UInt32
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DEVNAMES,
    wDriverOffset : UInt16,
    wDeviceOffset : UInt16,
    wOutputOffset : UInt16,
    wDefault : UInt16
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PAGESETUPDLGA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    flags : Win32cr::UI::Controls::Dialogs::PAGESETUPDLG_FLAGS,
    ptPaperSize : Win32cr::Foundation::POINT,
    rtMinMargin : Win32cr::Foundation::RECT,
    rtMargin : Win32cr::Foundation::RECT,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPageSetupHook : Win32cr::UI::Controls::Dialogs::LPPAGESETUPHOOK,
    lpfnPagePaintHook : Win32cr::UI::Controls::Dialogs::LPPAGEPAINTHOOK,
    lpPageSetupTemplateName : Win32cr::Foundation::PSTR,
    hPageSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record PAGESETUPDLGW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    flags : Win32cr::UI::Controls::Dialogs::PAGESETUPDLG_FLAGS,
    ptPaperSize : Win32cr::Foundation::POINT,
    rtMinMargin : Win32cr::Foundation::RECT,
    rtMargin : Win32cr::Foundation::RECT,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPageSetupHook : Win32cr::UI::Controls::Dialogs::LPPAGESETUPHOOK,
    lpfnPagePaintHook : Win32cr::UI::Controls::Dialogs::LPPAGEPAINTHOOK,
    lpPageSetupTemplateName : Win32cr::Foundation::PWSTR,
    hPageSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OPENFILENAME_NT4A,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PSTR,
    lpstrCustomFilter : Win32cr::Foundation::PSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PSTR,
    lpstrTitle : Win32cr::Foundation::PSTR,
    flags : UInt32,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OPENFILENAME_NT4W,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PWSTR,
    lpstrCustomFilter : Win32cr::Foundation::PWSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PWSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PWSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PWSTR,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PWSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OPENFILENAMEA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PSTR,
    lpstrCustomFilter : Win32cr::Foundation::PSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PSTR,
    lpstrTitle : Win32cr::Foundation::PSTR,
    flags : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR,
    pvReserved : Void*,
    dwReserved : UInt32,
    flags_ex : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS_EX
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OPENFILENAMEW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpstrFilter : Win32cr::Foundation::PWSTR,
    lpstrCustomFilter : Win32cr::Foundation::PWSTR,
    nMaxCustFilter : UInt32,
    nFilterIndex : UInt32,
    lpstrFile : Win32cr::Foundation::PWSTR,
    nMaxFile : UInt32,
    lpstrFileTitle : Win32cr::Foundation::PWSTR,
    nMaxFileTitle : UInt32,
    lpstrInitialDir : Win32cr::Foundation::PWSTR,
    lpstrTitle : Win32cr::Foundation::PWSTR,
    flags : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS,
    nFileOffset : UInt16,
    nFileExtension : UInt16,
    lpstrDefExt : Win32cr::Foundation::PWSTR,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPOFNHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR,
    pvReserved : Void*,
    dwReserved : UInt32,
    flags_ex : Win32cr::UI::Controls::Dialogs::OPEN_FILENAME_FLAGS_EX
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OFNOTIFYA,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*,
    pszFile : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OFNOTIFYW,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*,
    pszFile : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OFNOTIFYEXA,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*,
    psf : Void*,
    pidl : Void*
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record OFNOTIFYEXW,
    hdr : Win32cr::UI::Controls::NMHDR,
    lpOFN : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*,
    psf : Void*,
    pidl : Void*
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record CHOOSECOLORA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HWND,
    rgbResult : UInt32,
    lpCustColors : UInt32*,
    flags : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCCHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record CHOOSECOLORW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HWND,
    rgbResult : UInt32,
    lpCustColors : UInt32*,
    flags : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCCHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record FINDREPLACEA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    flags : Win32cr::UI::Controls::Dialogs::FINDREPLACE_FLAGS,
    lpstrFindWhat : Win32cr::Foundation::PSTR,
    lpstrReplaceWith : Win32cr::Foundation::PSTR,
    wFindWhatLen : UInt16,
    wReplaceWithLen : UInt16,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPFRHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record FINDREPLACEW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hInstance : Win32cr::Foundation::HINSTANCE,
    flags : Win32cr::UI::Controls::Dialogs::FINDREPLACE_FLAGS,
    lpstrFindWhat : Win32cr::Foundation::PWSTR,
    lpstrReplaceWith : Win32cr::Foundation::PWSTR,
    wFindWhatLen : UInt16,
    wReplaceWithLen : UInt16,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPFRHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record CHOOSEFONTA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDC : Win32cr::Graphics::Gdi::HDC,
    lpLogFont : Win32cr::Graphics::Gdi::LOGFONTA*,
    iPointSize : Int32,
    flags : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FLAGS,
    rgbColors : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCFHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PSTR,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpszStyle : Win32cr::Foundation::PSTR,
    nFontType : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FONT_TYPE,
    ___missing_alignment__ : UInt16,
    nSizeMin : Int32,
    nSizeMax : Int32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record CHOOSEFONTW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDC : Win32cr::Graphics::Gdi::HDC,
    lpLogFont : Win32cr::Graphics::Gdi::LOGFONTW*,
    iPointSize : Int32,
    flags : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FLAGS,
    rgbColors : UInt32,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnHook : Win32cr::UI::Controls::Dialogs::LPCFHOOKPROC,
    lpTemplateName : Win32cr::Foundation::PWSTR,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpszStyle : Win32cr::Foundation::PWSTR,
    nFontType : Win32cr::UI::Controls::Dialogs::CHOOSEFONT_FONT_TYPE,
    ___missing_alignment__ : UInt16,
    nSizeMin : Int32,
    nSizeMax : Int32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PRINTDLGA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    nFromPage : UInt16,
    nToPage : UInt16,
    nMinPage : UInt16,
    nMaxPage : UInt16,
    nCopies : UInt16,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPrintHook : Win32cr::UI::Controls::Dialogs::LPPRINTHOOKPROC,
    lpfnSetupHook : Win32cr::UI::Controls::Dialogs::LPSETUPHOOKPROC,
    lpPrintTemplateName : Win32cr::Foundation::PSTR,
    lpSetupTemplateName : Win32cr::Foundation::PSTR,
    hPrintTemplate : LibC::IntPtrT,
    hSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PRINTDLGW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    nFromPage : UInt16,
    nToPage : UInt16,
    nMinPage : UInt16,
    nMaxPage : UInt16,
    nCopies : UInt16,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPrintHook : Win32cr::UI::Controls::Dialogs::LPPRINTHOOKPROC,
    lpfnSetupHook : Win32cr::UI::Controls::Dialogs::LPSETUPHOOKPROC,
    lpPrintTemplateName : Win32cr::Foundation::PWSTR,
    lpSetupTemplateName : Win32cr::Foundation::PWSTR,
    hPrintTemplate : LibC::IntPtrT,
    hSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PRINTPAGERANGE,
    nFromPage : UInt32,
    nToPage : UInt32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PRINTDLGEXA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    flags2 : UInt32,
    exclusion_flags : UInt32,
    nPageRanges : UInt32,
    nMaxPageRanges : UInt32,
    lpPageRanges : Win32cr::UI::Controls::Dialogs::PRINTPAGERANGE*,
    nMinPage : UInt32,
    nMaxPage : UInt32,
    nCopies : UInt32,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpPrintTemplateName : Win32cr::Foundation::PSTR,
    lpCallback : Void*,
    nPropertyPages : UInt32,
    lphPropertyPages : Win32cr::UI::Controls::HPROPSHEETPAGE*,
    nStartPage : UInt32,
    dwResultAction : UInt32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PRINTDLGEXW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    hDC : Win32cr::Graphics::Gdi::HDC,
    flags : Win32cr::UI::Controls::Dialogs::PRINTDLGEX_FLAGS,
    flags2 : UInt32,
    exclusion_flags : UInt32,
    nPageRanges : UInt32,
    nMaxPageRanges : UInt32,
    lpPageRanges : Win32cr::UI::Controls::Dialogs::PRINTPAGERANGE*,
    nMinPage : UInt32,
    nMaxPage : UInt32,
    nCopies : UInt32,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lpPrintTemplateName : Win32cr::Foundation::PWSTR,
    lpCallback : Void*,
    nPropertyPages : UInt32,
    lphPropertyPages : Win32cr::UI::Controls::HPROPSHEETPAGE*,
    nStartPage : UInt32,
    dwResultAction : UInt32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record DEVNAMES,
    wDriverOffset : UInt16,
    wDeviceOffset : UInt16,
    wOutputOffset : UInt16,
    wDefault : UInt16
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PAGESETUPDLGA,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    flags : Win32cr::UI::Controls::Dialogs::PAGESETUPDLG_FLAGS,
    ptPaperSize : Win32cr::Foundation::POINT,
    rtMinMargin : Win32cr::Foundation::RECT,
    rtMargin : Win32cr::Foundation::RECT,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPageSetupHook : Win32cr::UI::Controls::Dialogs::LPPAGESETUPHOOK,
    lpfnPagePaintHook : Win32cr::UI::Controls::Dialogs::LPPAGEPAINTHOOK,
    lpPageSetupTemplateName : Win32cr::Foundation::PSTR,
    hPageSetupTemplate : LibC::IntPtrT
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record PAGESETUPDLGW,
    lStructSize : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    hDevMode : LibC::IntPtrT,
    hDevNames : LibC::IntPtrT,
    flags : Win32cr::UI::Controls::Dialogs::PAGESETUPDLG_FLAGS,
    ptPaperSize : Win32cr::Foundation::POINT,
    rtMinMargin : Win32cr::Foundation::RECT,
    rtMargin : Win32cr::Foundation::RECT,
    hInstance : Win32cr::Foundation::HINSTANCE,
    lCustData : Win32cr::Foundation::LPARAM,
    lpfnPageSetupHook : Win32cr::UI::Controls::Dialogs::LPPAGESETUPHOOK,
    lpfnPagePaintHook : Win32cr::UI::Controls::Dialogs::LPPAGEPAINTHOOK,
    lpPageSetupTemplateName : Win32cr::Foundation::PWSTR,
    hPageSetupTemplate : LibC::IntPtrT
  {% end %}

  @[Extern]
  record IPrintDialogCallbackVtbl,
    query_interface : Proc(IPrintDialogCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintDialogCallback*, UInt32),
    release : Proc(IPrintDialogCallback*, UInt32),
    init_done : Proc(IPrintDialogCallback*, Win32cr::Foundation::HRESULT),
    selection_change : Proc(IPrintDialogCallback*, Win32cr::Foundation::HRESULT),
    handle_message : Proc(IPrintDialogCallback*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5852a2c3-6530-11d1-b6a3-0000f8757bf9")]
  record IPrintDialogCallback, lpVtbl : IPrintDialogCallbackVtbl* do
    GUID = LibC::GUID.new(0x5852a2c3_u32, 0x6530_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0xa3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7b_u8, 0xf9_u8])
    def query_interface(this : IPrintDialogCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintDialogCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintDialogCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init_done(this : IPrintDialogCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_done.call(this)
    end
    def selection_change(this : IPrintDialogCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.selection_change.call(this)
    end
    def handle_message(this : IPrintDialogCallback*, hDlg : Win32cr::Foundation::HWND, uMsg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_message.call(this, hDlg, uMsg, wParam, lParam, pResult)
    end

  end

  @[Extern]
  record IPrintDialogServicesVtbl,
    query_interface : Proc(IPrintDialogServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintDialogServices*, UInt32),
    release : Proc(IPrintDialogServices*, UInt32),
    get_current_dev_mode : Proc(IPrintDialogServices*, Win32cr::Graphics::Gdi::DEVMODEA*, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_printer_name : Proc(IPrintDialogServices*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_port_name : Proc(IPrintDialogServices*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("509aaeda-5639-11d1-b6a1-0000f8757bf9")]
  record IPrintDialogServices, lpVtbl : IPrintDialogServicesVtbl* do
    GUID = LibC::GUID.new(0x509aaeda_u32, 0x5639_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7b_u8, 0xf9_u8])
    def query_interface(this : IPrintDialogServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintDialogServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintDialogServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_dev_mode(this : IPrintDialogServices*, pDevMode : Win32cr::Graphics::Gdi::DEVMODEA*, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_dev_mode.call(this, pDevMode, pcbSize)
    end
    def get_current_printer_name(this : IPrintDialogServices*, pPrinterName : UInt16*, pcchSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_printer_name.call(this, pPrinterName, pcchSize)
    end
    def get_current_port_name(this : IPrintDialogServices*, pPortName : UInt16*, pcchSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_port_name.call(this, pPortName, pcchSize)
    end

  end

  @[Link("comdlg32")]
  lib C
    fun GetOpenFileNameA(param0 : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*) : Win32cr::Foundation::BOOL

    fun GetOpenFileNameW(param0 : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*) : Win32cr::Foundation::BOOL

    fun GetSaveFileNameA(param0 : Win32cr::UI::Controls::Dialogs::OPENFILENAMEA*) : Win32cr::Foundation::BOOL

    fun GetSaveFileNameW(param0 : Win32cr::UI::Controls::Dialogs::OPENFILENAMEW*) : Win32cr::Foundation::BOOL

    fun GetFileTitleA(param0 : Win32cr::Foundation::PSTR, buf : UInt8*, cchSize : UInt16) : Int16

    fun GetFileTitleW(param0 : Win32cr::Foundation::PWSTR, buf : UInt16*, cchSize : UInt16) : Int16

    fun ChooseColorA(param0 : Win32cr::UI::Controls::Dialogs::CHOOSECOLORA*) : Win32cr::Foundation::BOOL

    fun ChooseColorW(param0 : Win32cr::UI::Controls::Dialogs::CHOOSECOLORW*) : Win32cr::Foundation::BOOL

    fun FindTextA(param0 : Win32cr::UI::Controls::Dialogs::FINDREPLACEA*) : Win32cr::Foundation::HWND

    fun FindTextW(param0 : Win32cr::UI::Controls::Dialogs::FINDREPLACEW*) : Win32cr::Foundation::HWND

    fun ReplaceTextA(param0 : Win32cr::UI::Controls::Dialogs::FINDREPLACEA*) : Win32cr::Foundation::HWND

    fun ReplaceTextW(param0 : Win32cr::UI::Controls::Dialogs::FINDREPLACEW*) : Win32cr::Foundation::HWND

    fun ChooseFontA(param0 : Win32cr::UI::Controls::Dialogs::CHOOSEFONTA*) : Win32cr::Foundation::BOOL

    fun ChooseFontW(param0 : Win32cr::UI::Controls::Dialogs::CHOOSEFONTW*) : Win32cr::Foundation::BOOL

    fun PrintDlgA(pPD : Win32cr::UI::Controls::Dialogs::PRINTDLGA*) : Win32cr::Foundation::BOOL

    fun PrintDlgW(pPD : Win32cr::UI::Controls::Dialogs::PRINTDLGW*) : Win32cr::Foundation::BOOL

    fun PrintDlgExA(pPD : Win32cr::UI::Controls::Dialogs::PRINTDLGEXA*) : Win32cr::Foundation::HRESULT

    fun PrintDlgExW(pPD : Win32cr::UI::Controls::Dialogs::PRINTDLGEXW*) : Win32cr::Foundation::HRESULT

    fun CommDlgExtendedError : Win32cr::UI::Controls::Dialogs::COMMON_DLG_ERRORS

    fun PageSetupDlgA(param0 : Win32cr::UI::Controls::Dialogs::PAGESETUPDLGA*) : Win32cr::Foundation::BOOL

    fun PageSetupDlgW(param0 : Win32cr::UI::Controls::Dialogs::PAGESETUPDLGW*) : Win32cr::Foundation::BOOL

  end
end