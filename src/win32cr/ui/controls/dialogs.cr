require "../../foundation.cr"
require "../../ui/controls.cr"
require "../../graphics/gdi.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:comdlg32.dll")]
{% else %}
@[Link("comdlg32")]
{% end %}
lib LibWin32
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

  alias LPOFNHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPCCHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPFRHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPCFHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPPRINTHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPSETUPHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPPAGEPAINTHOOK = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)
  alias LPPAGESETUPHOOK = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LibC::UINT_PTR)


  enum COMMON_DLG_ERRORS : UInt32
    CDERR_DIALOGFAILURE = 65535
    CDERR_GENERALCODES = 0
    CDERR_STRUCTSIZE = 1
    CDERR_INITIALIZATION = 2
    CDERR_NOTEMPLATE = 3
    CDERR_NOHINSTANCE = 4
    CDERR_LOADSTRFAILURE = 5
    CDERR_FINDRESFAILURE = 6
    CDERR_LOADRESFAILURE = 7
    CDERR_LOCKRESFAILURE = 8
    CDERR_MEMALLOCFAILURE = 9
    CDERR_MEMLOCKFAILURE = 10
    CDERR_NOHOOK = 11
    CDERR_REGISTERMSGFAIL = 12
    PDERR_PRINTERCODES = 4096
    PDERR_SETUPFAILURE = 4097
    PDERR_PARSEFAILURE = 4098
    PDERR_RETDEFFAILURE = 4099
    PDERR_LOADDRVFAILURE = 4100
    PDERR_GETDEVMODEFAIL = 4101
    PDERR_INITFAILURE = 4102
    PDERR_NODEVICES = 4103
    PDERR_NODEFAULTPRN = 4104
    PDERR_DNDMMISMATCH = 4105
    PDERR_CREATEICFAILURE = 4106
    PDERR_PRINTERNOTFOUND = 4107
    PDERR_DEFAULTDIFFERENT = 4108
    CFERR_CHOOSEFONTCODES = 8192
    CFERR_NOFONTS = 8193
    CFERR_MAXLESSTHANMIN = 8194
    FNERR_FILENAMECODES = 12288
    FNERR_SUBCLASSFAILURE = 12289
    FNERR_INVALIDFILENAME = 12290
    FNERR_BUFFERTOOSMALL = 12291
    FRERR_FINDREPLACECODES = 16384
    FRERR_BUFFERLENGTHZERO = 16385
    CCERR_CHOOSECOLORCODES = 20480
  end

  enum OPEN_FILENAME_FLAGS : UInt32
    OFN_READONLY = 1
    OFN_OVERWRITEPROMPT = 2
    OFN_HIDEREADONLY = 4
    OFN_NOCHANGEDIR = 8
    OFN_SHOWHELP = 16
    OFN_ENABLEHOOK = 32
    OFN_ENABLETEMPLATE = 64
    OFN_ENABLETEMPLATEHANDLE = 128
    OFN_NOVALIDATE = 256
    OFN_ALLOWMULTISELECT = 512
    OFN_EXTENSIONDIFFERENT = 1024
    OFN_PATHMUSTEXIST = 2048
    OFN_FILEMUSTEXIST = 4096
    OFN_CREATEPROMPT = 8192
    OFN_SHAREAWARE = 16384
    OFN_NOREADONLYRETURN = 32768
    OFN_NOTESTFILECREATE = 65536
    OFN_NONETWORKBUTTON = 131072
    OFN_NOLONGNAMES = 262144
    OFN_EXPLORER = 524288
    OFN_NODEREFERENCELINKS = 1048576
    OFN_LONGNAMES = 2097152
    OFN_ENABLEINCLUDENOTIFY = 4194304
    OFN_ENABLESIZING = 8388608
    OFN_DONTADDTORECENT = 33554432
    OFN_FORCESHOWHIDDEN = 268435456
  end

  enum OPEN_FILENAME_FLAGS_EX : UInt32
    OFN_EX_NONE = 0
    OFN_EX_NOPLACESBAR = 1
  end

  enum PAGESETUPDLG_FLAGS : UInt32
    PSD_DEFAULTMINMARGINS = 0
    PSD_DISABLEMARGINS = 16
    PSD_DISABLEORIENTATION = 256
    PSD_DISABLEPAGEPAINTING = 524288
    PSD_DISABLEPAPER = 512
    PSD_DISABLEPRINTER = 32
    PSD_ENABLEPAGEPAINTHOOK = 262144
    PSD_ENABLEPAGESETUPHOOK = 8192
    PSD_ENABLEPAGESETUPTEMPLATE = 32768
    PSD_ENABLEPAGESETUPTEMPLATEHANDLE = 131072
    PSD_INHUNDREDTHSOFMILLIMETERS = 8
    PSD_INTHOUSANDTHSOFINCHES = 4
    PSD_INWININIINTLMEASURE = 0
    PSD_MARGINS = 2
    PSD_MINMARGINS = 1
    PSD_NONETWORKBUTTON = 2097152
    PSD_NOWARNING = 128
    PSD_RETURNDEFAULT = 1024
    PSD_SHOWHELP = 2048
  end

  enum CHOOSEFONT_FLAGS : UInt32
    CF_APPLY = 512
    CF_ANSIONLY = 1024
    CF_BOTH = 3
    CF_EFFECTS = 256
    CF_ENABLEHOOK = 8
    CF_ENABLETEMPLATE = 16
    CF_ENABLETEMPLATEHANDLE = 32
    CF_FIXEDPITCHONLY = 16384
    CF_FORCEFONTEXIST = 65536
    CF_INACTIVEFONTS = 33554432
    CF_INITTOLOGFONTSTRUCT = 64
    CF_LIMITSIZE = 8192
    CF_NOOEMFONTS = 2048
    CF_NOFACESEL = 524288
    CF_NOSCRIPTSEL = 8388608
    CF_NOSIMULATIONS = 4096
    CF_NOSIZESEL = 2097152
    CF_NOSTYLESEL = 1048576
    CF_NOVECTORFONTS = 2048
    CF_NOVERTFONTS = 16777216
    CF_PRINTERFONTS = 2
    CF_SCALABLEONLY = 131072
    CF_SCREENFONTS = 1
    CF_SCRIPTSONLY = 1024
    CF_SELECTSCRIPT = 4194304
    CF_SHOWHELP = 4
    CF_TTONLY = 262144
    CF_USESTYLE = 128
    CF_WYSIWYG = 32768
  end

  enum FINDREPLACE_FLAGS : UInt32
    FR_DIALOGTERM = 64
    FR_DOWN = 1
    FR_ENABLEHOOK = 256
    FR_ENABLETEMPLATE = 512
    FR_ENABLETEMPLATEHANDLE = 8192
    FR_FINDNEXT = 8
    FR_HIDEUPDOWN = 16384
    FR_HIDEMATCHCASE = 32768
    FR_HIDEWHOLEWORD = 65536
    FR_MATCHCASE = 4
    FR_NOMATCHCASE = 2048
    FR_NOUPDOWN = 1024
    FR_NOWHOLEWORD = 4096
    FR_REPLACE = 16
    FR_REPLACEALL = 32
    FR_SHOWHELP = 128
    FR_WHOLEWORD = 2
  end

  enum PRINTDLGEX_FLAGS : UInt32
    PD_ALLPAGES = 0
    PD_COLLATE = 16
    PD_CURRENTPAGE = 4194304
    PD_DISABLEPRINTTOFILE = 524288
    PD_ENABLEPRINTTEMPLATE = 16384
    PD_ENABLEPRINTTEMPLATEHANDLE = 65536
    PD_EXCLUSIONFLAGS = 16777216
    PD_HIDEPRINTTOFILE = 1048576
    PD_NOCURRENTPAGE = 8388608
    PD_NOPAGENUMS = 8
    PD_NOSELECTION = 4
    PD_NOWARNING = 128
    PD_PAGENUMS = 2
    PD_PRINTTOFILE = 32
    PD_RETURNDC = 256
    PD_RETURNDEFAULT = 1024
    PD_RETURNIC = 512
    PD_SELECTION = 1
    PD_USEDEVMODECOPIES = 262144
    PD_USEDEVMODECOPIESANDCOLLATE = 262144
    PD_USELARGETEMPLATE = 268435456
    PD_ENABLEPRINTHOOK = 4096
    PD_ENABLESETUPHOOK = 8192
    PD_ENABLESETUPTEMPLATE = 32768
    PD_ENABLESETUPTEMPLATEHANDLE = 131072
    PD_NONETWORKBUTTON = 2097152
    PD_PRINTSETUP = 64
    PD_SHOWHELP = 2048
  end

  enum CHOOSEFONT_FONT_TYPE : UInt16
    BOLD_FONTTYPE = 256
    ITALIC_FONTTYPE = 512
    PRINTER_FONTTYPE = 16384
    REGULAR_FONTTYPE = 1024
    SCREEN_FONTTYPE = 8192
    SIMULATED_FONTTYPE = 32768
  end

  struct OPENFILENAME_NT4A
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    lpstr_filter : PSTR
    lpstr_custom_filter : PSTR
    n_max_cust_filter : UInt32
    n_filter_index : UInt32
    lpstr_file : PSTR
    n_max_file : UInt32
    lpstr_file_title : PSTR
    n_max_file_title : UInt32
    lpstr_initial_dir : PSTR
    lpstr_title : PSTR
    flags : UInt32
    n_file_offset : UInt16
    n_file_extension : UInt16
    lpstr_def_ext : PSTR
    l_cust_data : LPARAM
    lpfn_hook : LPOFNHOOKPROC
    lp_template_name : PSTR
  end
  struct OPENFILENAME_NT4W
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    lpstr_filter : LibC::LPWSTR
    lpstr_custom_filter : LibC::LPWSTR
    n_max_cust_filter : UInt32
    n_filter_index : UInt32
    lpstr_file : LibC::LPWSTR
    n_max_file : UInt32
    lpstr_file_title : LibC::LPWSTR
    n_max_file_title : UInt32
    lpstr_initial_dir : LibC::LPWSTR
    lpstr_title : LibC::LPWSTR
    flags : UInt32
    n_file_offset : UInt16
    n_file_extension : UInt16
    lpstr_def_ext : LibC::LPWSTR
    l_cust_data : LPARAM
    lpfn_hook : LPOFNHOOKPROC
    lp_template_name : LibC::LPWSTR
  end
  struct OPENFILENAMEA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    lpstr_filter : PSTR
    lpstr_custom_filter : PSTR
    n_max_cust_filter : UInt32
    n_filter_index : UInt32
    lpstr_file : PSTR
    n_max_file : UInt32
    lpstr_file_title : PSTR
    n_max_file_title : UInt32
    lpstr_initial_dir : PSTR
    lpstr_title : PSTR
    flags : OPEN_FILENAME_FLAGS
    n_file_offset : UInt16
    n_file_extension : UInt16
    lpstr_def_ext : PSTR
    l_cust_data : LPARAM
    lpfn_hook : LPOFNHOOKPROC
    lp_template_name : PSTR
    pv_reserved : Void*
    dw_reserved : UInt32
    flags_ex : OPEN_FILENAME_FLAGS_EX
  end
  struct OPENFILENAMEW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    lpstr_filter : LibC::LPWSTR
    lpstr_custom_filter : LibC::LPWSTR
    n_max_cust_filter : UInt32
    n_filter_index : UInt32
    lpstr_file : LibC::LPWSTR
    n_max_file : UInt32
    lpstr_file_title : LibC::LPWSTR
    n_max_file_title : UInt32
    lpstr_initial_dir : LibC::LPWSTR
    lpstr_title : LibC::LPWSTR
    flags : OPEN_FILENAME_FLAGS
    n_file_offset : UInt16
    n_file_extension : UInt16
    lpstr_def_ext : LibC::LPWSTR
    l_cust_data : LPARAM
    lpfn_hook : LPOFNHOOKPROC
    lp_template_name : LibC::LPWSTR
    pv_reserved : Void*
    dw_reserved : UInt32
    flags_ex : OPEN_FILENAME_FLAGS_EX
  end
  struct OFNOTIFYA
    hdr : NMHDR
    lp_ofn : OPENFILENAMEA*
    psz_file : PSTR
  end
  struct OFNOTIFYW
    hdr : NMHDR
    lp_ofn : OPENFILENAMEW*
    psz_file : LibC::LPWSTR
  end
  struct OFNOTIFYEXA
    hdr : NMHDR
    lp_ofn : OPENFILENAMEA*
    psf : Void*
    pidl : Void*
  end
  struct OFNOTIFYEXW
    hdr : NMHDR
    lp_ofn : OPENFILENAMEW*
    psf : Void*
    pidl : Void*
  end
  struct CHOOSECOLORA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HANDLE
    rgb_result : UInt32
    lp_cust_colors : UInt32*
    flags : UInt32
    l_cust_data : LPARAM
    lpfn_hook : LPCCHOOKPROC
    lp_template_name : PSTR
  end
  struct CHOOSECOLORW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HANDLE
    rgb_result : UInt32
    lp_cust_colors : UInt32*
    flags : UInt32
    l_cust_data : LPARAM
    lpfn_hook : LPCCHOOKPROC
    lp_template_name : LibC::LPWSTR
  end
  struct FINDREPLACEA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    flags : FINDREPLACE_FLAGS
    lpstr_find_what : PSTR
    lpstr_replace_with : PSTR
    w_find_what_len : UInt16
    w_replace_with_len : UInt16
    l_cust_data : LPARAM
    lpfn_hook : LPFRHOOKPROC
    lp_template_name : PSTR
  end
  struct FINDREPLACEW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_instance : HINSTANCE
    flags : FINDREPLACE_FLAGS
    lpstr_find_what : LibC::LPWSTR
    lpstr_replace_with : LibC::LPWSTR
    w_find_what_len : UInt16
    w_replace_with_len : UInt16
    l_cust_data : LPARAM
    lpfn_hook : LPFRHOOKPROC
    lp_template_name : LibC::LPWSTR
  end
  struct CHOOSEFONTA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dc : HDC
    lp_log_font : LOGFONTA*
    i_point_size : Int32
    flags : CHOOSEFONT_FLAGS
    rgb_colors : UInt32
    l_cust_data : LPARAM
    lpfn_hook : LPCFHOOKPROC
    lp_template_name : PSTR
    h_instance : HINSTANCE
    lpsz_style : PSTR
    n_font_type : CHOOSEFONT_FONT_TYPE
    ___missing_alignment__ : UInt16
    n_size_min : Int32
    n_size_max : Int32
  end
  struct CHOOSEFONTW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dc : HDC
    lp_log_font : LOGFONTW*
    i_point_size : Int32
    flags : CHOOSEFONT_FLAGS
    rgb_colors : UInt32
    l_cust_data : LPARAM
    lpfn_hook : LPCFHOOKPROC
    lp_template_name : LibC::LPWSTR
    h_instance : HINSTANCE
    lpsz_style : LibC::LPWSTR
    n_font_type : CHOOSEFONT_FONT_TYPE
    ___missing_alignment__ : UInt16
    n_size_min : Int32
    n_size_max : Int32
  end
  struct PRINTDLGA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    h_dc : HDC
    flags : PRINTDLGEX_FLAGS
    n_from_page : UInt16
    n_to_page : UInt16
    n_min_page : UInt16
    n_max_page : UInt16
    n_copies : UInt16
    h_instance : HINSTANCE
    l_cust_data : LPARAM
    lpfn_print_hook : LPPRINTHOOKPROC
    lpfn_setup_hook : LPSETUPHOOKPROC
    lp_print_template_name : PSTR
    lp_setup_template_name : PSTR
    h_print_template : LibC::IntPtrT
    h_setup_template : LibC::IntPtrT
  end
  struct PRINTDLGW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    h_dc : HDC
    flags : PRINTDLGEX_FLAGS
    n_from_page : UInt16
    n_to_page : UInt16
    n_min_page : UInt16
    n_max_page : UInt16
    n_copies : UInt16
    h_instance : HINSTANCE
    l_cust_data : LPARAM
    lpfn_print_hook : LPPRINTHOOKPROC
    lpfn_setup_hook : LPSETUPHOOKPROC
    lp_print_template_name : LibC::LPWSTR
    lp_setup_template_name : LibC::LPWSTR
    h_print_template : LibC::IntPtrT
    h_setup_template : LibC::IntPtrT
  end
  struct PRINTPAGERANGE
    n_from_page : UInt32
    n_to_page : UInt32
  end
  struct PRINTDLGEXA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    h_dc : HDC
    flags : PRINTDLGEX_FLAGS
    flags2 : UInt32
    exclusion_flags : UInt32
    n_page_ranges : UInt32
    n_max_page_ranges : UInt32
    lp_page_ranges : PRINTPAGERANGE*
    n_min_page : UInt32
    n_max_page : UInt32
    n_copies : UInt32
    h_instance : HINSTANCE
    lp_print_template_name : PSTR
    lp_callback : IUnknown
    n_property_pages : UInt32
    lph_property_pages : HPROPSHEETPAGE*
    n_start_page : UInt32
    dw_result_action : UInt32
  end
  struct PRINTDLGEXW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    h_dc : HDC
    flags : PRINTDLGEX_FLAGS
    flags2 : UInt32
    exclusion_flags : UInt32
    n_page_ranges : UInt32
    n_max_page_ranges : UInt32
    lp_page_ranges : PRINTPAGERANGE*
    n_min_page : UInt32
    n_max_page : UInt32
    n_copies : UInt32
    h_instance : HINSTANCE
    lp_print_template_name : LibC::LPWSTR
    lp_callback : IUnknown
    n_property_pages : UInt32
    lph_property_pages : HPROPSHEETPAGE*
    n_start_page : UInt32
    dw_result_action : UInt32
  end
  struct DEVNAMES
    w_driver_offset : UInt16
    w_device_offset : UInt16
    w_output_offset : UInt16
    w_default : UInt16
  end
  struct PAGESETUPDLGA
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    flags : PAGESETUPDLG_FLAGS
    pt_paper_size : POINT
    rt_min_margin : RECT
    rt_margin : RECT
    h_instance : HINSTANCE
    l_cust_data : LPARAM
    lpfn_page_setup_hook : LPPAGESETUPHOOK
    lpfn_page_paint_hook : LPPAGEPAINTHOOK
    lp_page_setup_template_name : PSTR
    h_page_setup_template : LibC::IntPtrT
  end
  struct PAGESETUPDLGW
    l_struct_size : UInt32
    hwnd_owner : HANDLE
    h_dev_mode : LibC::IntPtrT
    h_dev_names : LibC::IntPtrT
    flags : PAGESETUPDLG_FLAGS
    pt_paper_size : POINT
    rt_min_margin : RECT
    rt_margin : RECT
    h_instance : HINSTANCE
    l_cust_data : LPARAM
    lpfn_page_setup_hook : LPPAGESETUPHOOK
    lpfn_page_paint_hook : LPPAGEPAINTHOOK
    lp_page_setup_template_name : LibC::LPWSTR
    h_page_setup_template : LibC::IntPtrT
  end


  struct IPrintDialogCallbackVTbl
    query_interface : Proc(IPrintDialogCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDialogCallback*, UInt32)
    release : Proc(IPrintDialogCallback*, UInt32)
    init_done : Proc(IPrintDialogCallback*, HRESULT)
    selection_change : Proc(IPrintDialogCallback*, HRESULT)
    handle_message : Proc(IPrintDialogCallback*, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, LRESULT*, HRESULT)
  end

  struct IPrintDialogCallback
    lpVtbl : IPrintDialogCallbackVTbl*
  end

  struct IPrintDialogServicesVTbl
    query_interface : Proc(IPrintDialogServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDialogServices*, UInt32)
    release : Proc(IPrintDialogServices*, UInt32)
    get_current_dev_mode : Proc(IPrintDialogServices*, DEVMODEA*, UInt32*, HRESULT)
    get_current_printer_name : Proc(IPrintDialogServices*, Char*, UInt32*, HRESULT)
    get_current_port_name : Proc(IPrintDialogServices*, Char*, UInt32*, HRESULT)
  end

  struct IPrintDialogServices
    lpVtbl : IPrintDialogServicesVTbl*
  end


  # Params # param0 : OPENFILENAMEA* [In]
  fun GetOpenFileNameA(param0 : OPENFILENAMEA*) : LibC::BOOL

  # Params # param0 : OPENFILENAMEW* [In]
  fun GetOpenFileNameW(param0 : OPENFILENAMEW*) : LibC::BOOL

  # Params # param0 : OPENFILENAMEA* [In]
  fun GetSaveFileNameA(param0 : OPENFILENAMEA*) : LibC::BOOL

  # Params # param0 : OPENFILENAMEW* [In]
  fun GetSaveFileNameW(param0 : OPENFILENAMEW*) : LibC::BOOL

  # Params # param0 : PSTR [In],buf : UInt8* [In],cchsize : UInt16 [In]
  fun GetFileTitleA(param0 : PSTR, buf : UInt8*, cchsize : UInt16) : Int16

  # Params # param0 : LibC::LPWSTR [In],buf : Char* [In],cchsize : UInt16 [In]
  fun GetFileTitleW(param0 : LibC::LPWSTR, buf : Char*, cchsize : UInt16) : Int16

  # Params # param0 : CHOOSECOLORA* [In]
  fun ChooseColorA(param0 : CHOOSECOLORA*) : LibC::BOOL

  # Params # param0 : CHOOSECOLORW* [In]
  fun ChooseColorW(param0 : CHOOSECOLORW*) : LibC::BOOL

  # Params # param0 : FINDREPLACEA* [In]
  fun FindTextA(param0 : FINDREPLACEA*) : HANDLE

  # Params # param0 : FINDREPLACEW* [In]
  fun FindTextW(param0 : FINDREPLACEW*) : HANDLE

  # Params # param0 : FINDREPLACEA* [In]
  fun ReplaceTextA(param0 : FINDREPLACEA*) : HANDLE

  # Params # param0 : FINDREPLACEW* [In]
  fun ReplaceTextW(param0 : FINDREPLACEW*) : HANDLE

  # Params # param0 : CHOOSEFONTA* [In]
  fun ChooseFontA(param0 : CHOOSEFONTA*) : LibC::BOOL

  # Params # param0 : CHOOSEFONTW* [In]
  fun ChooseFontW(param0 : CHOOSEFONTW*) : LibC::BOOL

  # Params # ppd : PRINTDLGA* [In]
  fun PrintDlgA(ppd : PRINTDLGA*) : LibC::BOOL

  # Params # ppd : PRINTDLGW* [In]
  fun PrintDlgW(ppd : PRINTDLGW*) : LibC::BOOL

  # Params # ppd : PRINTDLGEXA* [In]
  fun PrintDlgExA(ppd : PRINTDLGEXA*) : HRESULT

  # Params # ppd : PRINTDLGEXW* [In]
  fun PrintDlgExW(ppd : PRINTDLGEXW*) : HRESULT

  # Params # 
  fun CommDlgExtendedError : COMMON_DLG_ERRORS

  # Params # param0 : PAGESETUPDLGA* [In]
  fun PageSetupDlgA(param0 : PAGESETUPDLGA*) : LibC::BOOL

  # Params # param0 : PAGESETUPDLGW* [In]
  fun PageSetupDlgW(param0 : PAGESETUPDLGW*) : LibC::BOOL
end
