require "../graphics/gdi.cr"
require "../foundation.cr"
require "../system/com.cr"
require "../ui/windowsandmessaging.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:gdi32.dll")]
@[Link(ldflags: "/DELAYLOAD:mscms.dll")]
@[Link(ldflags: "/DELAYLOAD:icmui.dll")]
@[Link(ldflags: "/DELAYLOAD:icm32.dll")]
lib LibWin32
  alias HCOLORSPACE = LibC::IntPtrT

  CATID_WcsPlugin = "a0b402e0-8240-405f-8a16-8a5b4df2f0dd"
  MAX_COLOR_CHANNELS = 8_u32
  INTENT_PERCEPTUAL = 0_u32
  INTENT_RELATIVE_COLORIMETRIC = 1_u32
  INTENT_SATURATION = 2_u32
  INTENT_ABSOLUTE_COLORIMETRIC = 3_u32
  FLAG_EMBEDDEDPROFILE = 1_u32
  FLAG_DEPENDENTONDATA = 2_u32
  FLAG_ENABLE_CHROMATIC_ADAPTATION = 33554432_u32
  ATTRIB_TRANSPARENCY = 1_u32
  ATTRIB_MATTE = 2_u32
  PROFILE_FILENAME = 1_u32
  PROFILE_MEMBUFFER = 2_u32
  PROFILE_READ = 1_u32
  PROFILE_READWRITE = 2_u32
  INDEX_DONT_CARE = 0_u32
  CMM_FROM_PROFILE = 0_u32
  ENUM_TYPE_VERSION = 768_u32
  ET_DEVICENAME = 1_u32
  ET_MEDIATYPE = 2_u32
  ET_DITHERMODE = 4_u32
  ET_RESOLUTION = 8_u32
  ET_CMMTYPE = 16_u32
  ET_CLASS = 32_u32
  ET_DATACOLORSPACE = 64_u32
  ET_CONNECTIONSPACE = 128_u32
  ET_SIGNATURE = 256_u32
  ET_PLATFORM = 512_u32
  ET_PROFILEFLAGS = 1024_u32
  ET_MANUFACTURER = 2048_u32
  ET_MODEL = 4096_u32
  ET_ATTRIBUTES = 8192_u32
  ET_RENDERINGINTENT = 16384_u32
  ET_CREATOR = 32768_u32
  ET_DEVICECLASS = 65536_u32
  ET_STANDARDDISPLAYCOLOR = 131072_u32
  ET_EXTENDEDDISPLAYCOLOR = 262144_u32
  PROOF_MODE = 1_u32
  NORMAL_MODE = 2_u32
  BEST_MODE = 3_u32
  ENABLE_GAMUT_CHECKING = 65536_u32
  USE_RELATIVE_COLORIMETRIC = 131072_u32
  FAST_TRANSLATE = 262144_u32
  PRESERVEBLACK = 1048576_u32
  WCS_ALWAYS = 2097152_u32
  SEQUENTIAL_TRANSFORM = 2155872256_u32
  RESERVED = 2147483648_u32
  CSA_A = 1_u32
  CSA_ABC = 2_u32
  CSA_DEF = 3_u32
  CSA_DEFG = 4_u32
  CSA_GRAY = 5_u32
  CSA_RGB = 6_u32
  CSA_CMYK = 7_u32
  CSA_Lab = 8_u32
  CMM_WIN_VERSION = 0_u32
  CMM_IDENT = 1_u32
  CMM_DRIVER_VERSION = 2_u32
  CMM_DLL_VERSION = 3_u32
  CMM_VERSION = 4_u32
  CMM_DESCRIPTION = 5_u32
  CMM_LOGOICON = 6_u32
  CMS_FORWARD = 0_u32
  CMS_BACKWARD = 1_u32
  COLOR_MATCH_VERSION = 512_u32
  CMS_DISABLEICM = 1_u32
  CMS_ENABLEPROOFING = 2_u32
  CMS_SETRENDERINTENT = 4_u32
  CMS_SETPROOFINTENT = 8_u32
  CMS_SETMONITORPROFILE = 16_u32
  CMS_SETPRINTERPROFILE = 32_u32
  CMS_SETTARGETPROFILE = 64_u32
  CMS_USEHOOK = 128_u32
  CMS_USEAPPLYCALLBACK = 256_u32
  CMS_USEDESCRIPTION = 512_u32
  CMS_DISABLEINTENT = 1024_u32
  CMS_DISABLERENDERINTENT = 2048_u32
  CMS_MONITOROVERFLOW = -2147483648_i32
  CMS_PRINTEROVERFLOW = 1073741824_i32
  CMS_TARGETOVERFLOW = 536870912_i32
  DONT_USE_EMBEDDED_WCS_PROFILES = 1_i32
  WCS_DEFAULT = 0_i32
  WCS_ICCONLY = 65536_i32

  alias ICMENUMPROCA = Proc(PSTR, LPARAM, Int32)
  alias ICMENUMPROCW = Proc(LibC::LPWSTR, LPARAM, Int32)
  alias LPBMCALLBACKFN = Proc(UInt32, UInt32, LPARAM, LibC::BOOL)
  alias PCMSCALLBACKW = Proc(COLORMATCHSETUPW*, LPARAM, LibC::BOOL)
  alias PCMSCALLBACKA = Proc(COLORMATCHSETUPA*, LPARAM, LibC::BOOL)


  enum ICM_COMMAND : UInt32
    ICM_ADDPROFILE = 1
    ICM_DELETEPROFILE = 2
    ICM_QUERYPROFILE = 3
    ICM_SETDEFAULTPROFILE = 4
    ICM_REGISTERICMATCHER = 5
    ICM_UNREGISTERICMATCHER = 6
    ICM_QUERYMATCH = 7
  end

  enum COLOR_MATCH_TO_TARGET_ACTION : Int32
    CS_ENABLE = 1
    CS_DISABLE = 2
    CS_DELETE_TRANSFORM = 3
  end

  enum COLORTYPE : Int32
    COLOR_GRAY = 1
    COLOR_RGB = 2
    COLOR_XYZ = 3
    COLOR_Yxy = 4
    COLOR_Lab = 5
    COLOR_3_CHANNEL = 6
    COLOR_CMYK = 7
    COLOR_5_CHANNEL = 8
    COLOR_6_CHANNEL = 9
    COLOR_7_CHANNEL = 10
    COLOR_8_CHANNEL = 11
    COLOR_NAMED = 12
  end

  enum COLORPROFILETYPE : Int32
    CPT_ICC = 0
    CPT_DMP = 1
    CPT_CAMP = 2
    CPT_GMMP = 3
  end

  enum COLORPROFILESUBTYPE : Int32
    CPST_PERCEPTUAL = 0
    CPST_RELATIVE_COLORIMETRIC = 1
    CPST_SATURATION = 2
    CPST_ABSOLUTE_COLORIMETRIC = 3
    CPST_NONE = 4
    CPST_RGB_WORKING_SPACE = 5
    CPST_CUSTOM_WORKING_SPACE = 6
    CPST_STANDARD_DISPLAY_COLOR_MODE = 7
    CPST_EXTENDED_DISPLAY_COLOR_MODE = 8
  end

  enum COLORDATATYPE : Int32
    COLOR_BYTE = 1
    COLOR_WORD = 2
    COLOR_FLOAT = 3
    COLOR_S2DOT13FIXED = 4
    COLOR_10b_R10G10B10A2 = 5
    COLOR_10b_R10G10B10A2_XR = 6
    COLOR_FLOAT16 = 7
  end

  enum BMFORMAT : Int32
    BM_x555RGB = 0
    BM_x555XYZ = 257
    BM_x555Yxy = 258
    BM_x555Lab = 259
    BM_x555G3CH = 260
    BM_RGBTRIPLETS = 2
    BM_BGRTRIPLETS = 4
    BM_XYZTRIPLETS = 513
    BM_YxyTRIPLETS = 514
    BM_LabTRIPLETS = 515
    BM_G3CHTRIPLETS = 516
    BM_5CHANNEL = 517
    BM_6CHANNEL = 518
    BM_7CHANNEL = 519
    BM_8CHANNEL = 520
    BM_GRAY = 521
    BM_xRGBQUADS = 8
    BM_xBGRQUADS = 16
    BM_xG3CHQUADS = 772
    BM_KYMCQUADS = 773
    BM_CMYKQUADS = 32
    BM_10b_RGB = 9
    BM_10b_XYZ = 1025
    BM_10b_Yxy = 1026
    BM_10b_Lab = 1027
    BM_10b_G3CH = 1028
    BM_NAMED_INDEX = 1029
    BM_16b_RGB = 10
    BM_16b_XYZ = 1281
    BM_16b_Yxy = 1282
    BM_16b_Lab = 1283
    BM_16b_G3CH = 1284
    BM_16b_GRAY = 1285
    BM_565RGB = 1
    BM_32b_scRGB = 1537
    BM_32b_scARGB = 1538
    BM_S2DOT13FIXED_scRGB = 1539
    BM_S2DOT13FIXED_scARGB = 1540
    BM_R10G10B10A2 = 1793
    BM_R10G10B10A2_XR = 1794
    BM_R16G16B16A16_FLOAT = 1795
  end

  enum WCS_PROFILE_MANAGEMENT_SCOPE : Int32
    WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE = 0
    WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER = 1
  end

  enum WCS_DEVICE_CAPABILITIES_TYPE : Int32
    VideoCardGammaTable = 1
    MicrosoftHardwareColorV2 = 2
  end

  union COLOR
    gray : GRAYCOLOR
    rgb : RGBCOLOR
    cmyk : CMYKCOLOR
    xyz : XYZCOLOR
    yxy : YxyCOLOR
    lab : LabCOLOR
    gen3ch : GENERIC3CHANNEL
    named : NAMEDCOLOR
    hifi : HiFiCOLOR
    anonymous : COLOR_Anonymous_e__Struct
  end

  struct LOGCOLORSPACEA
    lcs_signature : UInt32
    lcs_version : UInt32
    lcs_size : UInt32
    lcs_cs_type : Int32
    lcs_intent : Int32
    lcs_endpoints : CIEXYZTRIPLE
    lcs_gamma_red : UInt32
    lcs_gamma_green : UInt32
    lcs_gamma_blue : UInt32
    lcs_filename : CHAR[260]*
  end
  struct LOGCOLORSPACEW
    lcs_signature : UInt32
    lcs_version : UInt32
    lcs_size : UInt32
    lcs_cs_type : Int32
    lcs_intent : Int32
    lcs_endpoints : CIEXYZTRIPLE
    lcs_gamma_red : UInt32
    lcs_gamma_green : UInt32
    lcs_gamma_blue : UInt32
    lcs_filename : Char[260]*
  end
  struct EMRCREATECOLORSPACE
    emr : EMR
    ih_cs : UInt32
    lcs : LOGCOLORSPACEA
  end
  struct EMRCREATECOLORSPACEW
    emr : EMR
    ih_cs : UInt32
    lcs : LOGCOLORSPACEW
    dw_flags : UInt32
    cb_data : UInt32
    data : UInt8[0]*
  end
  struct XYZColorF
    x : Float32
    y : Float32
    z : Float32
  end
  struct JChColorF
    j : Float32
    c : Float32
    h : Float32
  end
  struct JabColorF
    j : Float32
    a : Float32
    b : Float32
  end
  struct GamutShellTriangle
    a_vertex_index : UInt32[3]*
  end
  struct GamutShell
    j_min : Float32
    j_max : Float32
    c_vertices : UInt32
    c_triangles : UInt32
    p_vertices : JabColorF*
    p_triangles : GamutShellTriangle*
  end
  struct PrimaryJabColors
    red : JabColorF
    yellow : JabColorF
    green : JabColorF
    cyan : JabColorF
    blue : JabColorF
    magenta : JabColorF
    black : JabColorF
    white : JabColorF
  end
  struct PrimaryXYZColors
    red : XYZColorF
    yellow : XYZColorF
    green : XYZColorF
    cyan : XYZColorF
    blue : XYZColorF
    magenta : XYZColorF
    black : XYZColorF
    white : XYZColorF
  end
  struct GamutBoundaryDescription
    p_primaries : PrimaryJabColors*
    c_neutral_samples : UInt32
    p_neutral_samples : JabColorF*
    p_reference_shell : GamutShell*
    p_plausible_shell : GamutShell*
    p_possible_shell : GamutShell*
  end
  struct BlackInformation
    f_black_only : LibC::BOOL
    black_weight : Float32
  end
  struct NAMED_PROFILE_INFO
    dw_flags : UInt32
    dw_count : UInt32
    dw_count_dev_coordinates : UInt32
    sz_prefix : Int8[32]*
    sz_suffix : Int8[32]*
  end
  struct GRAYCOLOR
    gray : UInt16
  end
  struct RGBCOLOR
    red : UInt16
    green : UInt16
    blue : UInt16
  end
  struct CMYKCOLOR
    cyan : UInt16
    magenta : UInt16
    yellow : UInt16
    black : UInt16
  end
  struct XYZCOLOR
    x : UInt16
    y : UInt16
    z : UInt16
  end
  struct YxyCOLOR
    y : UInt16
    x : UInt16
    y : UInt16
  end
  struct LabCOLOR
    l : UInt16
    a : UInt16
    b : UInt16
  end
  struct GENERIC3CHANNEL
    ch1 : UInt16
    ch2 : UInt16
    ch3 : UInt16
  end
  struct NAMEDCOLOR
    dw_index : UInt32
  end
  struct HiFiCOLOR
    channel : UInt8[8]*
  end
  struct COLOR_Anonymous_e__Struct
    reserved1 : UInt32
    reserved2 : Void*
  end
  struct PROFILEHEADER
    ph_size : UInt32
    ph_cmm_type : UInt32
    ph_version : UInt32
    ph_class : UInt32
    ph_data_color_space : UInt32
    ph_connection_space : UInt32
    ph_date_time : UInt32[3]*
    ph_signature : UInt32
    ph_platform : UInt32
    ph_profile_flags : UInt32
    ph_manufacturer : UInt32
    ph_model : UInt32
    ph_attributes : UInt32[2]*
    ph_rendering_intent : UInt32
    ph_illuminant : CIEXYZ
    ph_creator : UInt32
    ph_reserved : UInt8[44]*
  end
  struct PROFILE
    dw_type : UInt32
    p_profile_data : Void*
    cb_data_size : UInt32
  end
  struct ENUMTYPEA
    dw_size : UInt32
    dw_version : UInt32
    dw_fields : UInt32
    p_device_name : PSTR
    dw_media_type : UInt32
    dw_dithering_mode : UInt32
    dw_resolution : UInt32[2]*
    dw_cmm_type : UInt32
    dw_class : UInt32
    dw_data_color_space : UInt32
    dw_connection_space : UInt32
    dw_signature : UInt32
    dw_platform : UInt32
    dw_profile_flags : UInt32
    dw_manufacturer : UInt32
    dw_model : UInt32
    dw_attributes : UInt32[2]*
    dw_rendering_intent : UInt32
    dw_creator : UInt32
    dw_device_class : UInt32
  end
  struct ENUMTYPEW
    dw_size : UInt32
    dw_version : UInt32
    dw_fields : UInt32
    p_device_name : LibC::LPWSTR
    dw_media_type : UInt32
    dw_dithering_mode : UInt32
    dw_resolution : UInt32[2]*
    dw_cmm_type : UInt32
    dw_class : UInt32
    dw_data_color_space : UInt32
    dw_connection_space : UInt32
    dw_signature : UInt32
    dw_platform : UInt32
    dw_profile_flags : UInt32
    dw_manufacturer : UInt32
    dw_model : UInt32
    dw_attributes : UInt32[2]*
    dw_rendering_intent : UInt32
    dw_creator : UInt32
    dw_device_class : UInt32
  end
  struct COLORMATCHSETUPW
    dw_size : UInt32
    dw_version : UInt32
    dw_flags : UInt32
    hwnd_owner : HANDLE
    p_source_name : LibC::LPWSTR
    p_display_name : LibC::LPWSTR
    p_printer_name : LibC::LPWSTR
    dw_render_intent : UInt32
    dw_proofing_intent : UInt32
    p_monitor_profile : LibC::LPWSTR
    cc_monitor_profile : UInt32
    p_printer_profile : LibC::LPWSTR
    cc_printer_profile : UInt32
    p_target_profile : LibC::LPWSTR
    cc_target_profile : UInt32
    lpfn_hook : DLGPROC
    l_param : LPARAM
    lpfn_apply_callback : PCMSCALLBACKW
    l_param_apply_callback : LPARAM
  end
  struct COLORMATCHSETUPA
    dw_size : UInt32
    dw_version : UInt32
    dw_flags : UInt32
    hwnd_owner : HANDLE
    p_source_name : PSTR
    p_display_name : PSTR
    p_printer_name : PSTR
    dw_render_intent : UInt32
    dw_proofing_intent : UInt32
    p_monitor_profile : PSTR
    cc_monitor_profile : UInt32
    p_printer_profile : PSTR
    cc_printer_profile : UInt32
    p_target_profile : PSTR
    cc_target_profile : UInt32
    lpfn_hook : DLGPROC
    l_param : LPARAM
    lpfn_apply_callback : PCMSCALLBACKA
    l_param_apply_callback : LPARAM
  end
  struct WCS_DEVICE_VCGT_CAPABILITIES
    size : UInt32
    supports_vcgt : LibC::BOOL
  end
  struct WCS_DEVICE_MHC2_CAPABILITIES
    size : UInt32
    supports_mhc2 : LibC::BOOL
    regamma_lut_entry_count : UInt32
    csc_xyz_matrix_rows : UInt32
    csc_xyz_matrix_columns : UInt32
  end


  struct IDeviceModelPlugInVTbl
    query_interface : Proc(IDeviceModelPlugIn*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDeviceModelPlugIn*, UInt32)
    release : Proc(IDeviceModelPlugIn*, UInt32)
    initialize : Proc(IDeviceModelPlugIn*, UInt8*, UInt32, UInt32, HRESULT)
    get_num_channels : Proc(IDeviceModelPlugIn*, UInt32*, HRESULT)
    device_to_colorimetric_colors : Proc(IDeviceModelPlugIn*, UInt32, UInt32, Float32*, XYZColorF*, HRESULT)
    colorimetric_to_device_colors : Proc(IDeviceModelPlugIn*, UInt32, UInt32, XYZColorF*, Float32*, HRESULT)
    colorimetric_to_device_colors_with_black : Proc(IDeviceModelPlugIn*, UInt32, UInt32, XYZColorF*, BlackInformation*, Float32*, HRESULT)
    set_transform_device_model_info : Proc(IDeviceModelPlugIn*, UInt32, IDeviceModelPlugIn, HRESULT)
    get_primary_samples : Proc(IDeviceModelPlugIn*, PrimaryXYZColors*, HRESULT)
    get_gamut_boundary_mesh_size : Proc(IDeviceModelPlugIn*, UInt32*, UInt32*, HRESULT)
    get_gamut_boundary_mesh : Proc(IDeviceModelPlugIn*, UInt32, UInt32, UInt32, Float32*, GamutShellTriangle*, HRESULT)
    get_neutral_axis_size : Proc(IDeviceModelPlugIn*, UInt32*, HRESULT)
    get_neutral_axis : Proc(IDeviceModelPlugIn*, UInt32, XYZColorF*, HRESULT)
  end

  struct IDeviceModelPlugIn
    lpVtbl : IDeviceModelPlugInVTbl*
  end

  struct IGamutMapModelPlugInVTbl
    query_interface : Proc(IGamutMapModelPlugIn*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGamutMapModelPlugIn*, UInt32)
    release : Proc(IGamutMapModelPlugIn*, UInt32)
    initialize : Proc(IGamutMapModelPlugIn*, UInt8*, IDeviceModelPlugIn, IDeviceModelPlugIn, GamutBoundaryDescription*, GamutBoundaryDescription*, HRESULT)
    source_to_destination_appearance_colors : Proc(IGamutMapModelPlugIn*, UInt32, JChColorF*, JChColorF*, HRESULT)
  end

  struct IGamutMapModelPlugIn
    lpVtbl : IGamutMapModelPlugInVTbl*
  end


  # Params # hdc : HDC [In],mode : Int32 [In]
  fun SetICMMode(hdc : HDC, mode : Int32) : Int32

  # Params # hdc : HDC [In],lprgbtriple : RGBTRIPLE* [In],dlpbuffer : Void* [In],ncount : UInt32 [In]
  fun CheckColorsInGamut(hdc : HDC, lprgbtriple : RGBTRIPLE*, dlpbuffer : Void*, ncount : UInt32) : LibC::BOOL

  # Params # hdc : HDC [In]
  fun GetColorSpace(hdc : HDC) : HCOLORSPACE

  # Params # hcolorspace : HCOLORSPACE [In],lpbuffer : LOGCOLORSPACEA* [In],nsize : UInt32 [In]
  fun GetLogColorSpaceA(hcolorspace : HCOLORSPACE, lpbuffer : LOGCOLORSPACEA*, nsize : UInt32) : LibC::BOOL

  # Params # hcolorspace : HCOLORSPACE [In],lpbuffer : LOGCOLORSPACEW* [In],nsize : UInt32 [In]
  fun GetLogColorSpaceW(hcolorspace : HCOLORSPACE, lpbuffer : LOGCOLORSPACEW*, nsize : UInt32) : LibC::BOOL

  # Params # lplcs : LOGCOLORSPACEA* [In]
  fun CreateColorSpaceA(lplcs : LOGCOLORSPACEA*) : HCOLORSPACE

  # Params # lplcs : LOGCOLORSPACEW* [In]
  fun CreateColorSpaceW(lplcs : LOGCOLORSPACEW*) : HCOLORSPACE

  # Params # hdc : HDC [In],hcs : HCOLORSPACE [In]
  fun SetColorSpace(hdc : HDC, hcs : HCOLORSPACE) : HCOLORSPACE

  # Params # hcs : HCOLORSPACE [In]
  fun DeleteColorSpace(hcs : HCOLORSPACE) : LibC::BOOL

  # Params # hdc : HDC [In],pbufsize : UInt32* [In],pszfilename : UInt8* [In]
  fun GetICMProfileA(hdc : HDC, pbufsize : UInt32*, pszfilename : UInt8*) : LibC::BOOL

  # Params # hdc : HDC [In],pbufsize : UInt32* [In],pszfilename : Char* [In]
  fun GetICMProfileW(hdc : HDC, pbufsize : UInt32*, pszfilename : Char*) : LibC::BOOL

  # Params # hdc : HDC [In],lpfilename : PSTR [In]
  fun SetICMProfileA(hdc : HDC, lpfilename : PSTR) : LibC::BOOL

  # Params # hdc : HDC [In],lpfilename : LibC::LPWSTR [In]
  fun SetICMProfileW(hdc : HDC, lpfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # hdc : HDC [In],lpramp : Void* [In]
  fun GetDeviceGammaRamp(hdc : HDC, lpramp : Void*) : LibC::BOOL

  # Params # hdc : HDC [In],lpramp : Void* [In]
  fun SetDeviceGammaRamp(hdc : HDC, lpramp : Void*) : LibC::BOOL

  # Params # hdc : HDC [In],hdctarget : HDC [In],action : COLOR_MATCH_TO_TARGET_ACTION [In]
  fun ColorMatchToTarget(hdc : HDC, hdctarget : HDC, action : COLOR_MATCH_TO_TARGET_ACTION) : LibC::BOOL

  # Params # hdc : HDC [In],proc : ICMENUMPROCA [In],param2 : LPARAM [In]
  fun EnumICMProfilesA(hdc : HDC, proc : ICMENUMPROCA, param2 : LPARAM) : Int32

  # Params # hdc : HDC [In],proc : ICMENUMPROCW [In],param2 : LPARAM [In]
  fun EnumICMProfilesW(hdc : HDC, proc : ICMENUMPROCW, param2 : LPARAM) : Int32

  # Params # reserved : UInt32 [In],lpszcmid : PSTR [In],lpszfilename : PSTR [In],command : ICM_COMMAND [In]
  fun UpdateICMRegKeyA(reserved : UInt32, lpszcmid : PSTR, lpszfilename : PSTR, command : ICM_COMMAND) : LibC::BOOL

  # Params # reserved : UInt32 [In],lpszcmid : LibC::LPWSTR [In],lpszfilename : LibC::LPWSTR [In],command : ICM_COMMAND [In]
  fun UpdateICMRegKeyW(reserved : UInt32, lpszcmid : LibC::LPWSTR, lpszfilename : LibC::LPWSTR, command : ICM_COMMAND) : LibC::BOOL

  # Params # hdc : HDC [In],hpal : HPALETTE [In],defirst : UInt32 [In],num : UInt32 [In]
  fun ColorCorrectPalette(hdc : HDC, hpal : HPALETTE, defirst : UInt32, num : UInt32) : LibC::BOOL

  # Params # pprofile : PROFILE* [In],dwdesiredaccess : UInt32 [In],dwsharemode : UInt32 [In],dwcreationmode : UInt32 [In]
  fun OpenColorProfileA(pprofile : PROFILE*, dwdesiredaccess : UInt32, dwsharemode : UInt32, dwcreationmode : UInt32) : LibC::IntPtrT

  # Params # pprofile : PROFILE* [In],dwdesiredaccess : UInt32 [In],dwsharemode : UInt32 [In],dwcreationmode : UInt32 [In]
  fun OpenColorProfileW(pprofile : PROFILE*, dwdesiredaccess : UInt32, dwsharemode : UInt32, dwcreationmode : UInt32) : LibC::IntPtrT

  # Params # hprofile : LibC::IntPtrT [In]
  fun CloseColorProfile(hprofile : LibC::IntPtrT) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pprofile : UInt8* [In],pcbprofile : UInt32* [In]
  fun GetColorProfileFromHandle(hprofile : LibC::IntPtrT, pprofile : UInt8*, pcbprofile : UInt32*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pbvalid : LibC::BOOL* [In]
  fun IsColorProfileValid(hprofile : LibC::IntPtrT, pbvalid : LibC::BOOL*) : LibC::BOOL

  # Params # plogcolorspace : LOGCOLORSPACEA* [In],pprofile : UInt8** [In]
  fun CreateProfileFromLogColorSpaceA(plogcolorspace : LOGCOLORSPACEA*, pprofile : UInt8**) : LibC::BOOL

  # Params # plogcolorspace : LOGCOLORSPACEW* [In],pprofile : UInt8** [In]
  fun CreateProfileFromLogColorSpaceW(plogcolorspace : LOGCOLORSPACEW*, pprofile : UInt8**) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pnelementcount : UInt32* [In]
  fun GetCountColorProfileElements(hprofile : LibC::IntPtrT, pnelementcount : UInt32*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pheader : PROFILEHEADER* [In]
  fun GetColorProfileHeader(hprofile : LibC::IntPtrT, pheader : PROFILEHEADER*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],dwindex : UInt32 [In],ptag : UInt32* [In]
  fun GetColorProfileElementTag(hprofile : LibC::IntPtrT, dwindex : UInt32, ptag : UInt32*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],tag : UInt32 [In],pbpresent : LibC::BOOL* [In]
  fun IsColorProfileTagPresent(hprofile : LibC::IntPtrT, tag : UInt32, pbpresent : LibC::BOOL*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],tag : UInt32 [In],dwoffset : UInt32 [In],pcbelement : UInt32* [In],pelement : Void* [In],pbreference : LibC::BOOL* [In]
  fun GetColorProfileElement(hprofile : LibC::IntPtrT, tag : UInt32, dwoffset : UInt32, pcbelement : UInt32*, pelement : Void*, pbreference : LibC::BOOL*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pheader : PROFILEHEADER* [In]
  fun SetColorProfileHeader(hprofile : LibC::IntPtrT, pheader : PROFILEHEADER*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],tagtype : UInt32 [In],pcbelement : UInt32 [In]
  fun SetColorProfileElementSize(hprofile : LibC::IntPtrT, tagtype : UInt32, pcbelement : UInt32) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],tag : UInt32 [In],dwoffset : UInt32 [In],pcbelement : UInt32* [In],pelement : Void* [In]
  fun SetColorProfileElement(hprofile : LibC::IntPtrT, tag : UInt32, dwoffset : UInt32, pcbelement : UInt32*, pelement : Void*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],newtag : UInt32 [In],reftag : UInt32 [In]
  fun SetColorProfileElementReference(hprofile : LibC::IntPtrT, newtag : UInt32, reftag : UInt32) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],dwintent : UInt32 [In],dwcsatype : UInt32 [In],pps2colorspacearray : UInt8* [In],pcbps2colorspacearray : UInt32* [In],pbbinary : LibC::BOOL* [In]
  fun GetPS2ColorSpaceArray(hprofile : LibC::IntPtrT, dwintent : UInt32, dwcsatype : UInt32, pps2colorspacearray : UInt8*, pcbps2colorspacearray : UInt32*, pbbinary : LibC::BOOL*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],dwintent : UInt32 [In],pbuffer : UInt8* [In],pcbps2colorrenderingintent : UInt32* [In]
  fun GetPS2ColorRenderingIntent(hprofile : LibC::IntPtrT, dwintent : UInt32, pbuffer : UInt8*, pcbps2colorrenderingintent : UInt32*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],dwintent : UInt32 [In],pps2colorrenderingdictionary : UInt8* [In],pcbps2colorrenderingdictionary : UInt32* [In],pbbinary : LibC::BOOL* [In]
  fun GetPS2ColorRenderingDictionary(hprofile : LibC::IntPtrT, dwintent : UInt32, pps2colorrenderingdictionary : UInt8*, pcbps2colorrenderingdictionary : UInt32*, pbbinary : LibC::BOOL*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pnamedprofileinfo : NAMED_PROFILE_INFO* [In]
  fun GetNamedProfileInfo(hprofile : LibC::IntPtrT, pnamedprofileinfo : NAMED_PROFILE_INFO*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pacolorname : Int8** [In],paindex : UInt32* [In],dwcount : UInt32 [In]
  fun ConvertColorNameToIndex(hprofile : LibC::IntPtrT, pacolorname : Int8**, paindex : UInt32*, dwcount : UInt32) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],paindex : UInt32* [In],pacolorname : Int8** [In],dwcount : UInt32 [In]
  fun ConvertIndexToColorName(hprofile : LibC::IntPtrT, paindex : UInt32*, pacolorname : Int8**, dwcount : UInt32) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT* [In],nprofiles : UInt32 [In],padwintent : UInt32* [In],nintents : UInt32 [In],dwflags : UInt32 [In],pprofiledata : UInt8** [In],indexpreferredcmm : UInt32 [In]
  fun CreateDeviceLinkProfile(hprofile : LibC::IntPtrT*, nprofiles : UInt32, padwintent : UInt32*, nintents : UInt32, dwflags : UInt32, pprofiledata : UInt8**, indexpreferredcmm : UInt32) : LibC::BOOL

  # Params # plogcolorspace : LOGCOLORSPACEA* [In],hdestprofile : LibC::IntPtrT [In],htargetprofile : LibC::IntPtrT [In],dwflags : UInt32 [In]
  fun CreateColorTransformA(plogcolorspace : LOGCOLORSPACEA*, hdestprofile : LibC::IntPtrT, htargetprofile : LibC::IntPtrT, dwflags : UInt32) : LibC::IntPtrT

  # Params # plogcolorspace : LOGCOLORSPACEW* [In],hdestprofile : LibC::IntPtrT [In],htargetprofile : LibC::IntPtrT [In],dwflags : UInt32 [In]
  fun CreateColorTransformW(plogcolorspace : LOGCOLORSPACEW*, hdestprofile : LibC::IntPtrT, htargetprofile : LibC::IntPtrT, dwflags : UInt32) : LibC::IntPtrT

  # Params # pahprofiles : LibC::IntPtrT* [In],nprofiles : UInt32 [In],padwintent : UInt32* [In],nintents : UInt32 [In],dwflags : UInt32 [In],indexpreferredcmm : UInt32 [In]
  fun CreateMultiProfileTransform(pahprofiles : LibC::IntPtrT*, nprofiles : UInt32, padwintent : UInt32*, nintents : UInt32, dwflags : UInt32, indexpreferredcmm : UInt32) : LibC::IntPtrT

  # Params # hxform : LibC::IntPtrT [In]
  fun DeleteColorTransform(hxform : LibC::IntPtrT) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],psrcbits : Void* [In],bminput : BMFORMAT [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwinputstride : UInt32 [In],pdestbits : Void* [In],bmoutput : BMFORMAT [In],dwoutputstride : UInt32 [In],pfncallback : LPBMCALLBACKFN [In],ulcallbackdata : LPARAM [In]
  fun TranslateBitmapBits(hcolortransform : LibC::IntPtrT, psrcbits : Void*, bminput : BMFORMAT, dwwidth : UInt32, dwheight : UInt32, dwinputstride : UInt32, pdestbits : Void*, bmoutput : BMFORMAT, dwoutputstride : UInt32, pfncallback : LPBMCALLBACKFN, ulcallbackdata : LPARAM) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],psrcbits : Void* [In],bminput : BMFORMAT [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwstride : UInt32 [In],paresult : UInt8* [In],pfncallback : LPBMCALLBACKFN [In],lpcallbackdata : LPARAM [In]
  fun CheckBitmapBits(hcolortransform : LibC::IntPtrT, psrcbits : Void*, bminput : BMFORMAT, dwwidth : UInt32, dwheight : UInt32, dwstride : UInt32, paresult : UInt8*, pfncallback : LPBMCALLBACKFN, lpcallbackdata : LPARAM) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],painputcolors : COLOR* [In],ncolors : UInt32 [In],ctinput : COLORTYPE [In],paoutputcolors : COLOR* [In],ctoutput : COLORTYPE [In]
  fun TranslateColors(hcolortransform : LibC::IntPtrT, painputcolors : COLOR*, ncolors : UInt32, ctinput : COLORTYPE, paoutputcolors : COLOR*, ctoutput : COLORTYPE) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],painputcolors : COLOR* [In],ncolors : UInt32 [In],ctinput : COLORTYPE [In],paresult : UInt8* [In]
  fun CheckColors(hcolortransform : LibC::IntPtrT, painputcolors : COLOR*, ncolors : UInt32, ctinput : COLORTYPE, paresult : UInt8*) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],param1 : UInt32 [In]
  fun GetCMMInfo(hcolortransform : LibC::IntPtrT, param1 : UInt32) : UInt32

  # Params # pmachinename : PSTR [In],cmmid : UInt32 [In],pcmmdll : PSTR [In]
  fun RegisterCMMA(pmachinename : PSTR, cmmid : UInt32, pcmmdll : PSTR) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],cmmid : UInt32 [In],pcmmdll : LibC::LPWSTR [In]
  fun RegisterCMMW(pmachinename : LibC::LPWSTR, cmmid : UInt32, pcmmdll : LibC::LPWSTR) : LibC::BOOL

  # Params # pmachinename : PSTR [In],cmmid : UInt32 [In]
  fun UnregisterCMMA(pmachinename : PSTR, cmmid : UInt32) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],cmmid : UInt32 [In]
  fun UnregisterCMMW(pmachinename : LibC::LPWSTR, cmmid : UInt32) : LibC::BOOL

  # Params # dwcmmtype : UInt32 [In]
  fun SelectCMM(dwcmmtype : UInt32) : LibC::BOOL

  # Params # pmachinename : PSTR [In],pbuffer : PSTR [In],pdwsize : UInt32* [In]
  fun GetColorDirectoryA(pmachinename : PSTR, pbuffer : PSTR, pdwsize : UInt32*) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],pbuffer : LibC::LPWSTR [In],pdwsize : UInt32* [In]
  fun GetColorDirectoryW(pmachinename : LibC::LPWSTR, pbuffer : LibC::LPWSTR, pdwsize : UInt32*) : LibC::BOOL

  # Params # pmachinename : PSTR [In],pprofilename : PSTR [In]
  fun InstallColorProfileA(pmachinename : PSTR, pprofilename : PSTR) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],pprofilename : LibC::LPWSTR [In]
  fun InstallColorProfileW(pmachinename : LibC::LPWSTR, pprofilename : LibC::LPWSTR) : LibC::BOOL

  # Params # pmachinename : PSTR [In],pprofilename : PSTR [In],bdelete : LibC::BOOL [In]
  fun UninstallColorProfileA(pmachinename : PSTR, pprofilename : PSTR, bdelete : LibC::BOOL) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],pprofilename : LibC::LPWSTR [In],bdelete : LibC::BOOL [In]
  fun UninstallColorProfileW(pmachinename : LibC::LPWSTR, pprofilename : LibC::LPWSTR, bdelete : LibC::BOOL) : LibC::BOOL

  # Params # pmachinename : PSTR [In],penumrecord : ENUMTYPEA* [In],penumerationbuffer : UInt8* [In],pdwsizeofenumerationbuffer : UInt32* [In],pnprofiles : UInt32* [In]
  fun EnumColorProfilesA(pmachinename : PSTR, penumrecord : ENUMTYPEA*, penumerationbuffer : UInt8*, pdwsizeofenumerationbuffer : UInt32*, pnprofiles : UInt32*) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],penumrecord : ENUMTYPEW* [In],penumerationbuffer : UInt8* [In],pdwsizeofenumerationbuffer : UInt32* [In],pnprofiles : UInt32* [In]
  fun EnumColorProfilesW(pmachinename : LibC::LPWSTR, penumrecord : ENUMTYPEW*, penumerationbuffer : UInt8*, pdwsizeofenumerationbuffer : UInt32*, pnprofiles : UInt32*) : LibC::BOOL

  # Params # pmachinename : PSTR [In],dwprofileid : UInt32 [In],pprofilename : PSTR [In]
  fun SetStandardColorSpaceProfileA(pmachinename : PSTR, dwprofileid : UInt32, pprofilename : PSTR) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],dwprofileid : UInt32 [In],pprofilename : LibC::LPWSTR [In]
  fun SetStandardColorSpaceProfileW(pmachinename : LibC::LPWSTR, dwprofileid : UInt32, pprofilename : LibC::LPWSTR) : LibC::BOOL

  # Params # pmachinename : PSTR [In],dwscs : UInt32 [In],pbuffer : PSTR [In],pcbsize : UInt32* [In]
  fun GetStandardColorSpaceProfileA(pmachinename : PSTR, dwscs : UInt32, pbuffer : PSTR, pcbsize : UInt32*) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],dwscs : UInt32 [In],pbuffer : LibC::LPWSTR [In],pcbsize : UInt32* [In]
  fun GetStandardColorSpaceProfileW(pmachinename : LibC::LPWSTR, dwscs : UInt32, pbuffer : LibC::LPWSTR, pcbsize : UInt32*) : LibC::BOOL

  # Params # pmachinename : PSTR [In],pprofilename : PSTR [In],pdevicename : PSTR [In]
  fun AssociateColorProfileWithDeviceA(pmachinename : PSTR, pprofilename : PSTR, pdevicename : PSTR) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],pprofilename : LibC::LPWSTR [In],pdevicename : LibC::LPWSTR [In]
  fun AssociateColorProfileWithDeviceW(pmachinename : LibC::LPWSTR, pprofilename : LibC::LPWSTR, pdevicename : LibC::LPWSTR) : LibC::BOOL

  # Params # pmachinename : PSTR [In],pprofilename : PSTR [In],pdevicename : PSTR [In]
  fun DisassociateColorProfileFromDeviceA(pmachinename : PSTR, pprofilename : PSTR, pdevicename : PSTR) : LibC::BOOL

  # Params # pmachinename : LibC::LPWSTR [In],pprofilename : LibC::LPWSTR [In],pdevicename : LibC::LPWSTR [In]
  fun DisassociateColorProfileFromDeviceW(pmachinename : LibC::LPWSTR, pprofilename : LibC::LPWSTR, pdevicename : LibC::LPWSTR) : LibC::BOOL

  # Params # pcms : COLORMATCHSETUPW* [In]
  fun SetupColorMatchingW(pcms : COLORMATCHSETUPW*) : LibC::BOOL

  # Params # pcms : COLORMATCHSETUPA* [In]
  fun SetupColorMatchingA(pcms : COLORMATCHSETUPA*) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pprofilename : LibC::LPWSTR [In],pdevicename : LibC::LPWSTR [In]
  fun WcsAssociateColorProfileWithDevice(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pprofilename : LibC::LPWSTR, pdevicename : LibC::LPWSTR) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pprofilename : LibC::LPWSTR [In],pdevicename : LibC::LPWSTR [In]
  fun WcsDisassociateColorProfileFromDevice(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pprofilename : LibC::LPWSTR, pdevicename : LibC::LPWSTR) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],penumrecord : ENUMTYPEW* [In],pdwsize : UInt32* [In]
  fun WcsEnumColorProfilesSize(scope : WCS_PROFILE_MANAGEMENT_SCOPE, penumrecord : ENUMTYPEW*, pdwsize : UInt32*) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],penumrecord : ENUMTYPEW* [In],pbuffer : UInt8* [In],dwsize : UInt32 [In],pnprofiles : UInt32* [In]
  fun WcsEnumColorProfiles(scope : WCS_PROFILE_MANAGEMENT_SCOPE, penumrecord : ENUMTYPEW*, pbuffer : UInt8*, dwsize : UInt32, pnprofiles : UInt32*) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pdevicename : LibC::LPWSTR [In],cptcolorprofiletype : COLORPROFILETYPE [In],cpstcolorprofilesubtype : COLORPROFILESUBTYPE [In],dwprofileid : UInt32 [In],pcbprofilename : UInt32* [In]
  fun WcsGetDefaultColorProfileSize(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pdevicename : LibC::LPWSTR, cptcolorprofiletype : COLORPROFILETYPE, cpstcolorprofilesubtype : COLORPROFILESUBTYPE, dwprofileid : UInt32, pcbprofilename : UInt32*) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pdevicename : LibC::LPWSTR [In],cptcolorprofiletype : COLORPROFILETYPE [In],cpstcolorprofilesubtype : COLORPROFILESUBTYPE [In],dwprofileid : UInt32 [In],cbprofilename : UInt32 [In],pprofilename : LibC::LPWSTR [In]
  fun WcsGetDefaultColorProfile(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pdevicename : LibC::LPWSTR, cptcolorprofiletype : COLORPROFILETYPE, cpstcolorprofilesubtype : COLORPROFILESUBTYPE, dwprofileid : UInt32, cbprofilename : UInt32, pprofilename : LibC::LPWSTR) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pdevicename : LibC::LPWSTR [In],cptcolorprofiletype : COLORPROFILETYPE [In],cpstcolorprofilesubtype : COLORPROFILESUBTYPE [In],dwprofileid : UInt32 [In],pprofilename : LibC::LPWSTR [In]
  fun WcsSetDefaultColorProfile(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pdevicename : LibC::LPWSTR, cptcolorprofiletype : COLORPROFILETYPE, cpstcolorprofilesubtype : COLORPROFILESUBTYPE, dwprofileid : UInt32, pprofilename : LibC::LPWSTR) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],dwrenderingintent : UInt32 [In]
  fun WcsSetDefaultRenderingIntent(scope : WCS_PROFILE_MANAGEMENT_SCOPE, dwrenderingintent : UInt32) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],pdwrenderingintent : UInt32* [In]
  fun WcsGetDefaultRenderingIntent(scope : WCS_PROFILE_MANAGEMENT_SCOPE, pdwrenderingintent : UInt32*) : LibC::BOOL

  # Params # pdevicename : LibC::LPWSTR [In],dwdeviceclass : UInt32 [In],puseperuserprofiles : LibC::BOOL* [In]
  fun WcsGetUsePerUserProfiles(pdevicename : LibC::LPWSTR, dwdeviceclass : UInt32, puseperuserprofiles : LibC::BOOL*) : LibC::BOOL

  # Params # pdevicename : LibC::LPWSTR [In],dwdeviceclass : UInt32 [In],useperuserprofiles : LibC::BOOL [In]
  fun WcsSetUsePerUserProfiles(pdevicename : LibC::LPWSTR, dwdeviceclass : UInt32, useperuserprofiles : LibC::BOOL) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],ncolors : UInt32 [In],ninputchannels : UInt32 [In],cdtinput : COLORDATATYPE [In],cbinput : UInt32 [In],pinputdata : Void* [In],noutputchannels : UInt32 [In],cdtoutput : COLORDATATYPE [In],cboutput : UInt32 [In],poutputdata : Void* [In]
  fun WcsTranslateColors(hcolortransform : LibC::IntPtrT, ncolors : UInt32, ninputchannels : UInt32, cdtinput : COLORDATATYPE, cbinput : UInt32, pinputdata : Void*, noutputchannels : UInt32, cdtoutput : COLORDATATYPE, cboutput : UInt32, poutputdata : Void*) : LibC::BOOL

  # Params # hcolortransform : LibC::IntPtrT [In],ncolors : UInt32 [In],ninputchannels : UInt32 [In],cdtinput : COLORDATATYPE [In],cbinput : UInt32 [In],pinputdata : Void* [In],paresult : UInt8* [In]
  fun WcsCheckColors(hcolortransform : LibC::IntPtrT, ncolors : UInt32, ninputchannels : UInt32, cdtinput : COLORDATATYPE, cbinput : UInt32, pinputdata : Void*, paresult : UInt8*) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],lpainputcolors : COLOR* [In],ncolors : UInt32 [In],ctinput : COLORTYPE [In],lparesult : UInt8* [In]
  fun CMCheckColors(hcmtransform : LibC::IntPtrT, lpainputcolors : COLOR*, ncolors : UInt32, ctinput : COLORTYPE, lparesult : UInt8*) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],lpsrcbits : Void* [In],bminput : BMFORMAT [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwstride : UInt32 [In],lparesult : UInt8* [In],pfncallback : LPBMCALLBACKFN [In],ulcallbackdata : LPARAM [In]
  fun CMCheckRGBs(hcmtransform : LibC::IntPtrT, lpsrcbits : Void*, bminput : BMFORMAT, dwwidth : UInt32, dwheight : UInt32, dwstride : UInt32, lparesult : UInt8*, pfncallback : LPBMCALLBACKFN, ulcallbackdata : LPARAM) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],pacolorname : Int8** [In],paindex : UInt32* [In],dwcount : UInt32 [In]
  fun CMConvertColorNameToIndex(hprofile : LibC::IntPtrT, pacolorname : Int8**, paindex : UInt32*, dwcount : UInt32) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],paindex : UInt32* [In],pacolorname : Int8** [In],dwcount : UInt32 [In]
  fun CMConvertIndexToColorName(hprofile : LibC::IntPtrT, paindex : UInt32*, pacolorname : Int8**, dwcount : UInt32) : LibC::BOOL

  # Params # pahprofiles : LibC::IntPtrT* [In],nprofiles : UInt32 [In],padwintents : UInt32* [In],nintents : UInt32 [In],dwflags : UInt32 [In],lpprofiledata : UInt8** [In]
  fun CMCreateDeviceLinkProfile(pahprofiles : LibC::IntPtrT*, nprofiles : UInt32, padwintents : UInt32*, nintents : UInt32, dwflags : UInt32, lpprofiledata : UInt8**) : LibC::BOOL

  # Params # pahprofiles : LibC::IntPtrT* [In],nprofiles : UInt32 [In],padwintents : UInt32* [In],nintents : UInt32 [In],dwflags : UInt32 [In]
  fun CMCreateMultiProfileTransform(pahprofiles : LibC::IntPtrT*, nprofiles : UInt32, padwintents : UInt32*, nintents : UInt32, dwflags : UInt32) : LibC::IntPtrT

  # Params # lpcolorspace : LOGCOLORSPACEW* [In],lpprofiledata : Void** [In]
  fun CMCreateProfileW(lpcolorspace : LOGCOLORSPACEW*, lpprofiledata : Void**) : LibC::BOOL

  # Params # lpcolorspace : LOGCOLORSPACEA* [In],lpdevcharacter : Void* [In],lptargetdevcharacter : Void* [In]
  fun CMCreateTransform(lpcolorspace : LOGCOLORSPACEA*, lpdevcharacter : Void*, lptargetdevcharacter : Void*) : LibC::IntPtrT

  # Params # lpcolorspace : LOGCOLORSPACEW* [In],lpdevcharacter : Void* [In],lptargetdevcharacter : Void* [In]
  fun CMCreateTransformW(lpcolorspace : LOGCOLORSPACEW*, lpdevcharacter : Void*, lptargetdevcharacter : Void*) : LibC::IntPtrT

  # Params # lpcolorspace : LOGCOLORSPACEA* [In],lpdevcharacter : Void* [In],lptargetdevcharacter : Void* [In],dwflags : UInt32 [In]
  fun CMCreateTransformExt(lpcolorspace : LOGCOLORSPACEA*, lpdevcharacter : Void*, lptargetdevcharacter : Void*, dwflags : UInt32) : LibC::IntPtrT

  # Params # hcmtransform : LibC::IntPtrT [In],lpargbtriple : RGBTRIPLE* [In],lparesult : UInt8* [In],ncount : UInt32 [In]
  fun CMCheckColorsInGamut(hcmtransform : LibC::IntPtrT, lpargbtriple : RGBTRIPLE*, lparesult : UInt8*, ncount : UInt32) : LibC::BOOL

  # Params # lpcolorspace : LOGCOLORSPACEA* [In],lpprofiledata : Void** [In]
  fun CMCreateProfile(lpcolorspace : LOGCOLORSPACEA*, lpprofiledata : Void**) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],colorref : UInt32 [In],lpcolorref : UInt32* [In],dwflags : UInt32 [In]
  fun CMTranslateRGB(hcmtransform : LibC::IntPtrT, colorref : UInt32, lpcolorref : UInt32*, dwflags : UInt32) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],lpsrcbits : Void* [In],bminput : BMFORMAT [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwstride : UInt32 [In],lpdestbits : Void* [In],bmoutput : BMFORMAT [In],dwtranslatedirection : UInt32 [In]
  fun CMTranslateRGBs(hcmtransform : LibC::IntPtrT, lpsrcbits : Void*, bminput : BMFORMAT, dwwidth : UInt32, dwheight : UInt32, dwstride : UInt32, lpdestbits : Void*, bmoutput : BMFORMAT, dwtranslatedirection : UInt32) : LibC::BOOL

  # Params # lpcolorspace : LOGCOLORSPACEW* [In],lpdevcharacter : Void* [In],lptargetdevcharacter : Void* [In],dwflags : UInt32 [In]
  fun CMCreateTransformExtW(lpcolorspace : LOGCOLORSPACEW*, lpdevcharacter : Void*, lptargetdevcharacter : Void*, dwflags : UInt32) : LibC::IntPtrT

  # Params # hcmtransform : LibC::IntPtrT [In]
  fun CMDeleteTransform(hcmtransform : LibC::IntPtrT) : LibC::BOOL

  # Params # dwinfo : UInt32 [In]
  fun CMGetInfo(dwinfo : UInt32) : UInt32

  # Params # hprofile : LibC::IntPtrT [In],pnamedprofileinfo : NAMED_PROFILE_INFO* [In]
  fun CMGetNamedProfileInfo(hprofile : LibC::IntPtrT, pnamedprofileinfo : NAMED_PROFILE_INFO*) : LibC::BOOL

  # Params # hprofile : LibC::IntPtrT [In],lpbvalid : Int32* [In]
  fun CMIsProfileValid(hprofile : LibC::IntPtrT, lpbvalid : Int32*) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],lpainputcolors : COLOR* [In],ncolors : UInt32 [In],ctinput : COLORTYPE [In],lpaoutputcolors : COLOR* [In],ctoutput : COLORTYPE [In]
  fun CMTranslateColors(hcmtransform : LibC::IntPtrT, lpainputcolors : COLOR*, ncolors : UInt32, ctinput : COLORTYPE, lpaoutputcolors : COLOR*, ctoutput : COLORTYPE) : LibC::BOOL

  # Params # hcmtransform : LibC::IntPtrT [In],lpsrcbits : Void* [In],bminput : BMFORMAT [In],dwwidth : UInt32 [In],dwheight : UInt32 [In],dwinputstride : UInt32 [In],lpdestbits : Void* [In],bmoutput : BMFORMAT [In],dwoutputstride : UInt32 [In],lpfncallback : LPBMCALLBACKFN [In],ulcallbackdata : LPARAM [In]
  fun CMTranslateRGBsExt(hcmtransform : LibC::IntPtrT, lpsrcbits : Void*, bminput : BMFORMAT, dwwidth : UInt32, dwheight : UInt32, dwinputstride : UInt32, lpdestbits : Void*, bmoutput : BMFORMAT, dwoutputstride : UInt32, lpfncallback : LPBMCALLBACKFN, ulcallbackdata : LPARAM) : LibC::BOOL

  # Params # pcdmpprofile : PROFILE* [In],pcampprofile : PROFILE* [In],pgmmpprofile : PROFILE* [In],dwdesireaccess : UInt32 [In],dwsharemode : UInt32 [In],dwcreationmode : UInt32 [In],dwflags : UInt32 [In]
  fun WcsOpenColorProfileA(pcdmpprofile : PROFILE*, pcampprofile : PROFILE*, pgmmpprofile : PROFILE*, dwdesireaccess : UInt32, dwsharemode : UInt32, dwcreationmode : UInt32, dwflags : UInt32) : LibC::IntPtrT

  # Params # pcdmpprofile : PROFILE* [In],pcampprofile : PROFILE* [In],pgmmpprofile : PROFILE* [In],dwdesireaccess : UInt32 [In],dwsharemode : UInt32 [In],dwcreationmode : UInt32 [In],dwflags : UInt32 [In]
  fun WcsOpenColorProfileW(pcdmpprofile : PROFILE*, pcampprofile : PROFILE*, pgmmpprofile : PROFILE*, dwdesireaccess : UInt32, dwsharemode : UInt32, dwcreationmode : UInt32, dwflags : UInt32) : LibC::IntPtrT

  # Params # hwcsprofile : LibC::IntPtrT [In],dwoptions : UInt32 [In]
  fun WcsCreateIccProfile(hwcsprofile : LibC::IntPtrT, dwoptions : UInt32) : LibC::IntPtrT

  # Params # pbisenabled : LibC::BOOL* [In]
  fun WcsGetCalibrationManagementState(pbisenabled : LibC::BOOL*) : LibC::BOOL

  # Params # bisenabled : LibC::BOOL [In]
  fun WcsSetCalibrationManagementState(bisenabled : LibC::BOOL) : LibC::BOOL

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],profilename : LibC::LPWSTR [In],targetadapterid : LUID [In],sourceid : UInt32 [In],setasdefault : LibC::BOOL [In],associateasadvancedcolor : LibC::BOOL [In]
  fun ColorProfileAddDisplayAssociation(scope : WCS_PROFILE_MANAGEMENT_SCOPE, profilename : LibC::LPWSTR, targetadapterid : LUID, sourceid : UInt32, setasdefault : LibC::BOOL, associateasadvancedcolor : LibC::BOOL) : HRESULT

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],profilename : LibC::LPWSTR [In],targetadapterid : LUID [In],sourceid : UInt32 [In],dissociateadvancedcolor : LibC::BOOL [In]
  fun ColorProfileRemoveDisplayAssociation(scope : WCS_PROFILE_MANAGEMENT_SCOPE, profilename : LibC::LPWSTR, targetadapterid : LUID, sourceid : UInt32, dissociateadvancedcolor : LibC::BOOL) : HRESULT

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],profilename : LibC::LPWSTR [In],profiletype : COLORPROFILETYPE [In],profilesubtype : COLORPROFILESUBTYPE [In],targetadapterid : LUID [In],sourceid : UInt32 [In]
  fun ColorProfileSetDisplayDefaultAssociation(scope : WCS_PROFILE_MANAGEMENT_SCOPE, profilename : LibC::LPWSTR, profiletype : COLORPROFILETYPE, profilesubtype : COLORPROFILESUBTYPE, targetadapterid : LUID, sourceid : UInt32) : HRESULT

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],targetadapterid : LUID [In],sourceid : UInt32 [In],profilelist : LibC::LPWSTR** [In],profilecount : UInt32* [In]
  fun ColorProfileGetDisplayList(scope : WCS_PROFILE_MANAGEMENT_SCOPE, targetadapterid : LUID, sourceid : UInt32, profilelist : LibC::LPWSTR**, profilecount : UInt32*) : HRESULT

  # Params # scope : WCS_PROFILE_MANAGEMENT_SCOPE [In],targetadapterid : LUID [In],sourceid : UInt32 [In],profiletype : COLORPROFILETYPE [In],profilesubtype : COLORPROFILESUBTYPE [In],profilename : LibC::LPWSTR* [In]
  fun ColorProfileGetDisplayDefault(scope : WCS_PROFILE_MANAGEMENT_SCOPE, targetadapterid : LUID, sourceid : UInt32, profiletype : COLORPROFILETYPE, profilesubtype : COLORPROFILESUBTYPE, profilename : LibC::LPWSTR*) : HRESULT

  # Params # targetadapterid : LUID [In],sourceid : UInt32 [In],scope : WCS_PROFILE_MANAGEMENT_SCOPE* [In]
  fun ColorProfileGetDisplayUserScope(targetadapterid : LUID, sourceid : UInt32, scope : WCS_PROFILE_MANAGEMENT_SCOPE*) : HRESULT
end
