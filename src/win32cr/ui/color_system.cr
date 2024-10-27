require "./../graphics/gdi.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./windows_and_messaging.cr"

module Win32cr::UI::ColorSystem
  alias HCOLORSPACE = LibC::IntPtrT
  alias ICMENUMPROCA = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::LPARAM, Int32)*

  alias ICMENUMPROCW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::LPARAM, Int32)*

  alias LPBMCALLBACKFN = Proc(UInt32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)*

  alias PCMSCALLBACKW = Proc(Win32cr::UI::ColorSystem::COLORMATCHSETUPW*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)*

  alias PCMSCALLBACKA = Proc(Win32cr::UI::ColorSystem::COLORMATCHSETUPA*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)*

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

  enum ICM_COMMAND : UInt32
    ICM_ADDPROFILE = 1_u32
    ICM_DELETEPROFILE = 2_u32
    ICM_QUERYPROFILE = 3_u32
    ICM_SETDEFAULTPROFILE = 4_u32
    ICM_REGISTERICMATCHER = 5_u32
    ICM_UNREGISTERICMATCHER = 6_u32
    ICM_QUERYMATCH = 7_u32
  end
  enum ICM_MODE
    ICM_OFF = 1_i32
    ICM_ON = 2_i32
    ICM_QUERY = 3_i32
    ICM_DONE_OUTSIDEDC = 4_i32
  end
  enum COLOR_MATCH_TO_TARGET_ACTION
    CS_ENABLE = 1_i32
    CS_DISABLE = 2_i32
    CS_DELETE_TRANSFORM = 3_i32
  end
  enum COLORTYPE
    COLOR_GRAY = 1_i32
    COLOR_RGB = 2_i32
    COLOR_XYZ = 3_i32
    COLOR_Yxy = 4_i32
    COLOR_Lab = 5_i32
    COLOR_3_CHANNEL = 6_i32
    COLOR_CMYK = 7_i32
    COLOR_5_CHANNEL = 8_i32
    COLOR_6_CHANNEL = 9_i32
    COLOR_7_CHANNEL = 10_i32
    COLOR_8_CHANNEL = 11_i32
    COLOR_NAMED = 12_i32
  end
  enum COLORPROFILETYPE
    CPT_ICC = 0_i32
    CPT_DMP = 1_i32
    CPT_CAMP = 2_i32
    CPT_GMMP = 3_i32
  end
  enum COLORPROFILESUBTYPE
    CPST_PERCEPTUAL = 0_i32
    CPST_RELATIVE_COLORIMETRIC = 1_i32
    CPST_SATURATION = 2_i32
    CPST_ABSOLUTE_COLORIMETRIC = 3_i32
    CPST_NONE = 4_i32
    CPST_RGB_WORKING_SPACE = 5_i32
    CPST_CUSTOM_WORKING_SPACE = 6_i32
    CPST_STANDARD_DISPLAY_COLOR_MODE = 7_i32
    CPST_EXTENDED_DISPLAY_COLOR_MODE = 8_i32
  end
  enum COLORDATATYPE
    COLOR_BYTE = 1_i32
    COLOR_WORD = 2_i32
    COLOR_FLOAT = 3_i32
    COLOR_S2DOT13FIXED = 4_i32
    COLOR_10b_R10G10B10A2 = 5_i32
    COLOR_10b_R10G10B10A2_XR = 6_i32
    COLOR_FLOAT16 = 7_i32
  end
  enum BMFORMAT
    BM_x555RGB = 0_i32
    BM_x555XYZ = 257_i32
    BM_x555Yxy = 258_i32
    BM_x555Lab = 259_i32
    BM_x555G3CH = 260_i32
    BM_RGBTRIPLETS = 2_i32
    BM_BGRTRIPLETS = 4_i32
    BM_XYZTRIPLETS = 513_i32
    BM_YxyTRIPLETS = 514_i32
    BM_LabTRIPLETS = 515_i32
    BM_G3CHTRIPLETS = 516_i32
    BM_5CHANNEL = 517_i32
    BM_6CHANNEL = 518_i32
    BM_7CHANNEL = 519_i32
    BM_8CHANNEL = 520_i32
    BM_GRAY = 521_i32
    BM_xRGBQUADS = 8_i32
    BM_xBGRQUADS = 16_i32
    BM_xG3CHQUADS = 772_i32
    BM_KYMCQUADS = 773_i32
    BM_CMYKQUADS = 32_i32
    BM_10b_RGB = 9_i32
    BM_10b_XYZ = 1025_i32
    BM_10b_Yxy = 1026_i32
    BM_10b_Lab = 1027_i32
    BM_10b_G3CH = 1028_i32
    BM_NAMED_INDEX = 1029_i32
    BM_16b_RGB = 10_i32
    BM_16b_XYZ = 1281_i32
    BM_16b_Yxy = 1282_i32
    BM_16b_Lab = 1283_i32
    BM_16b_G3CH = 1284_i32
    BM_16b_GRAY = 1285_i32
    BM_565RGB = 1_i32
    BM_32b_scRGB = 1537_i32
    BM_32b_scARGB = 1538_i32
    BM_S2DOT13FIXED_scRGB = 1539_i32
    BM_S2DOT13FIXED_scARGB = 1540_i32
    BM_R10G10B10A2 = 1793_i32
    BM_R10G10B10A2_XR = 1794_i32
    BM_R16G16B16A16_FLOAT = 1795_i32
  end
  enum WCS_PROFILE_MANAGEMENT_SCOPE
    WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE = 0_i32
    WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER = 1_i32
  end
  enum WCS_DEVICE_CAPABILITIES_TYPE
    VideoCardGammaTable = 1_i32
    MicrosoftHardwareColorV2 = 2_i32
  end

  @[Extern]
  record LOGCOLORSPACEA,
    lcsSignature : UInt32,
    lcsVersion : UInt32,
    lcsSize : UInt32,
    lcsCSType : Int32,
    lcsIntent : Int32,
    lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE,
    lcsGammaRed : UInt32,
    lcsGammaGreen : UInt32,
    lcsGammaBlue : UInt32,
    lcsFilename : Win32cr::Foundation::CHAR[260]

  @[Extern]
  record LOGCOLORSPACEW,
    lcsSignature : UInt32,
    lcsVersion : UInt32,
    lcsSize : UInt32,
    lcsCSType : Int32,
    lcsIntent : Int32,
    lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE,
    lcsGammaRed : UInt32,
    lcsGammaGreen : UInt32,
    lcsGammaBlue : UInt32,
    lcsFilename : UInt16[260]

  @[Extern]
  record EMRCREATECOLORSPACE,
    emr : Win32cr::Graphics::Gdi::EMR,
    ihCS : UInt32,
    lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA

  @[Extern]
  record EMRCREATECOLORSPACEW,
    emr : Win32cr::Graphics::Gdi::EMR,
    ihCS : UInt32,
    lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW,
    dwFlags : UInt32,
    cbData : UInt32,
    data : UInt8*

  @[Extern]
  record XYZColorF,
    x : Float32,
    y : Float32,
    z : Float32

  @[Extern]
  record JChColorF,
    j : Float32,
    c : Float32,
    h : Float32

  @[Extern]
  record JabColorF,
    j : Float32,
    a : Float32,
    b : Float32

  @[Extern]
  record GamutShellTriangle,
    aVertexIndex : UInt32[3]

  @[Extern]
  record GamutShell,
    j_min : Float32,
    j_max : Float32,
    cVertices : UInt32,
    cTriangles : UInt32,
    pVertices : Win32cr::UI::ColorSystem::JabColorF*,
    pTriangles : Win32cr::UI::ColorSystem::GamutShellTriangle*

  @[Extern]
  record PrimaryJabColors,
    red : Win32cr::UI::ColorSystem::JabColorF,
    yellow : Win32cr::UI::ColorSystem::JabColorF,
    green : Win32cr::UI::ColorSystem::JabColorF,
    cyan : Win32cr::UI::ColorSystem::JabColorF,
    blue : Win32cr::UI::ColorSystem::JabColorF,
    magenta : Win32cr::UI::ColorSystem::JabColorF,
    black : Win32cr::UI::ColorSystem::JabColorF,
    white : Win32cr::UI::ColorSystem::JabColorF

  @[Extern]
  record PrimaryXYZColors,
    red : Win32cr::UI::ColorSystem::XYZColorF,
    yellow : Win32cr::UI::ColorSystem::XYZColorF,
    green : Win32cr::UI::ColorSystem::XYZColorF,
    cyan : Win32cr::UI::ColorSystem::XYZColorF,
    blue : Win32cr::UI::ColorSystem::XYZColorF,
    magenta : Win32cr::UI::ColorSystem::XYZColorF,
    black : Win32cr::UI::ColorSystem::XYZColorF,
    white : Win32cr::UI::ColorSystem::XYZColorF

  @[Extern]
  record GamutBoundaryDescription,
    pPrimaries : Win32cr::UI::ColorSystem::PrimaryJabColors*,
    cNeutralSamples : UInt32,
    pNeutralSamples : Win32cr::UI::ColorSystem::JabColorF*,
    pReferenceShell : Win32cr::UI::ColorSystem::GamutShell*,
    pPlausibleShell : Win32cr::UI::ColorSystem::GamutShell*,
    pPossibleShell : Win32cr::UI::ColorSystem::GamutShell*

  @[Extern]
  record BlackInformation,
    fBlackOnly : Win32cr::Foundation::BOOL,
    blackWeight : Float32

  @[Extern]
  record NAMED_PROFILE_INFO,
    dwFlags : UInt32,
    dwCount : UInt32,
    dwCountDevCoordinates : UInt32,
    szPrefix : Int8[32],
    szSuffix : Int8[32]

  @[Extern]
  record GRAYCOLOR,
    gray : UInt16

  @[Extern]
  record RGBCOLOR,
    red : UInt16,
    green : UInt16,
    blue : UInt16

  @[Extern]
  record CMYKCOLOR,
    cyan : UInt16,
    magenta : UInt16,
    yellow : UInt16,
    black : UInt16

  @[Extern]
  record XYZCOLOR,
    x : UInt16,
    y : UInt16,
    z : UInt16

  @[Extern]
  record YxyCOLOR,
    y : UInt16,
    x : UInt16,
    y_ : UInt16

  @[Extern]
  record LabCOLOR,
    l : UInt16,
    a : UInt16,
    b : UInt16

  @[Extern]
  record GENERIC3CHANNEL,
    ch1 : UInt16,
    ch2 : UInt16,
    ch3 : UInt16

  @[Extern]
  record NAMEDCOLOR,
    dwIndex : UInt32

  @[Extern]
  record HiFiCOLOR,
    channel : UInt8[8]

  @[Extern(union: true)]
  record COLOR,
    gray : Win32cr::UI::ColorSystem::GRAYCOLOR,
    rgb : Win32cr::UI::ColorSystem::RGBCOLOR,
    cmyk : Win32cr::UI::ColorSystem::CMYKCOLOR,
    xyz : Win32cr::UI::ColorSystem::XYZCOLOR,
    yxy : Win32cr::UI::ColorSystem::YxyCOLOR,
    lab : Win32cr::UI::ColorSystem::LabCOLOR,
    gen3ch : Win32cr::UI::ColorSystem::GENERIC3CHANNEL,
    named : Win32cr::UI::ColorSystem::NAMEDCOLOR,
    hifi : Win32cr::UI::ColorSystem::HiFiCOLOR,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      reserved1 : UInt32,
      reserved2 : Void*

  end

  @[Extern]
  record PROFILEHEADER,
    phSize : UInt32,
    phCMMType : UInt32,
    phVersion : UInt32,
    phClass : UInt32,
    phDataColorSpace : UInt32,
    phConnectionSpace : UInt32,
    phDateTime : UInt32[3],
    phSignature : UInt32,
    phPlatform : UInt32,
    phProfileFlags : UInt32,
    phManufacturer : UInt32,
    phModel : UInt32,
    phAttributes : UInt32[2],
    phRenderingIntent : UInt32,
    phIlluminant : Win32cr::Graphics::Gdi::CIEXYZ,
    phCreator : UInt32,
    phReserved : UInt8[44]

  @[Extern]
  record PROFILE,
    dwType : UInt32,
    pProfileData : Void*,
    cbDataSize : UInt32

  @[Extern]
  record ENUMTYPEA,
    dwSize : UInt32,
    dwVersion : UInt32,
    dwFields : UInt32,
    pDeviceName : Win32cr::Foundation::PSTR,
    dwMediaType : UInt32,
    dwDitheringMode : UInt32,
    dwResolution : UInt32[2],
    dwCMMType : UInt32,
    dwClass : UInt32,
    dwDataColorSpace : UInt32,
    dwConnectionSpace : UInt32,
    dwSignature : UInt32,
    dwPlatform : UInt32,
    dwProfileFlags : UInt32,
    dwManufacturer : UInt32,
    dwModel : UInt32,
    dwAttributes : UInt32[2],
    dwRenderingIntent : UInt32,
    dwCreator : UInt32,
    dwDeviceClass : UInt32

  @[Extern]
  record ENUMTYPEW,
    dwSize : UInt32,
    dwVersion : UInt32,
    dwFields : UInt32,
    pDeviceName : Win32cr::Foundation::PWSTR,
    dwMediaType : UInt32,
    dwDitheringMode : UInt32,
    dwResolution : UInt32[2],
    dwCMMType : UInt32,
    dwClass : UInt32,
    dwDataColorSpace : UInt32,
    dwConnectionSpace : UInt32,
    dwSignature : UInt32,
    dwPlatform : UInt32,
    dwProfileFlags : UInt32,
    dwManufacturer : UInt32,
    dwModel : UInt32,
    dwAttributes : UInt32[2],
    dwRenderingIntent : UInt32,
    dwCreator : UInt32,
    dwDeviceClass : UInt32

  @[Extern]
  record COLORMATCHSETUPW,
    dwSize : UInt32,
    dwVersion : UInt32,
    dwFlags : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    pSourceName : Win32cr::Foundation::PWSTR,
    pDisplayName : Win32cr::Foundation::PWSTR,
    pPrinterName : Win32cr::Foundation::PWSTR,
    dwRenderIntent : UInt32,
    dwProofingIntent : UInt32,
    pMonitorProfile : Win32cr::Foundation::PWSTR,
    ccMonitorProfile : UInt32,
    pPrinterProfile : Win32cr::Foundation::PWSTR,
    ccPrinterProfile : UInt32,
    pTargetProfile : Win32cr::Foundation::PWSTR,
    ccTargetProfile : UInt32,
    lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC,
    lParam : Win32cr::Foundation::LPARAM,
    lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKW,
    lParamApplyCallback : Win32cr::Foundation::LPARAM

  @[Extern]
  record COLORMATCHSETUPA,
    dwSize : UInt32,
    dwVersion : UInt32,
    dwFlags : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    pSourceName : Win32cr::Foundation::PSTR,
    pDisplayName : Win32cr::Foundation::PSTR,
    pPrinterName : Win32cr::Foundation::PSTR,
    dwRenderIntent : UInt32,
    dwProofingIntent : UInt32,
    pMonitorProfile : Win32cr::Foundation::PSTR,
    ccMonitorProfile : UInt32,
    pPrinterProfile : Win32cr::Foundation::PSTR,
    ccPrinterProfile : UInt32,
    pTargetProfile : Win32cr::Foundation::PSTR,
    ccTargetProfile : UInt32,
    lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC,
    lParam : Win32cr::Foundation::LPARAM,
    lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKA,
    lParamApplyCallback : Win32cr::Foundation::LPARAM

  @[Extern]
  record WCS_DEVICE_VCGT_CAPABILITIES,
    size : UInt32,
    supports_vcgt : Win32cr::Foundation::BOOL

  @[Extern]
  record WCS_DEVICE_MHC2_CAPABILITIES,
    size : UInt32,
    supports_mhc2 : Win32cr::Foundation::BOOL,
    regamma_lut_entry_count : UInt32,
    csc_xyz_matrix_rows : UInt32,
    csc_xyz_matrix_columns : UInt32

  @[Extern]
  record IDeviceModelPlugInVtbl,
    query_interface : Proc(IDeviceModelPlugIn*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDeviceModelPlugIn*, UInt32),
    release : Proc(IDeviceModelPlugIn*, UInt32),
    initialize__ : Proc(IDeviceModelPlugIn*, Win32cr::Foundation::BSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_num_channels : Proc(IDeviceModelPlugIn*, UInt32*, Win32cr::Foundation::HRESULT),
    device_to_colorimetric_colors : Proc(IDeviceModelPlugIn*, UInt32, UInt32, Float32*, Win32cr::UI::ColorSystem::XYZColorF*, Win32cr::Foundation::HRESULT),
    colorimetric_to_device_colors : Proc(IDeviceModelPlugIn*, UInt32, UInt32, Win32cr::UI::ColorSystem::XYZColorF*, Float32*, Win32cr::Foundation::HRESULT),
    colorimetric_to_device_colors_with_black : Proc(IDeviceModelPlugIn*, UInt32, UInt32, Win32cr::UI::ColorSystem::XYZColorF*, Win32cr::UI::ColorSystem::BlackInformation*, Float32*, Win32cr::Foundation::HRESULT),
    set_transform_device_model_info : Proc(IDeviceModelPlugIn*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_primary_samples : Proc(IDeviceModelPlugIn*, Win32cr::UI::ColorSystem::PrimaryXYZColors*, Win32cr::Foundation::HRESULT),
    get_gamut_boundary_mesh_size : Proc(IDeviceModelPlugIn*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_gamut_boundary_mesh : Proc(IDeviceModelPlugIn*, UInt32, UInt32, UInt32, Float32*, Win32cr::UI::ColorSystem::GamutShellTriangle*, Win32cr::Foundation::HRESULT),
    get_neutral_axis_size : Proc(IDeviceModelPlugIn*, UInt32*, Win32cr::Foundation::HRESULT),
    get_neutral_axis : Proc(IDeviceModelPlugIn*, UInt32, Win32cr::UI::ColorSystem::XYZColorF*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1cd63475-07c4-46fe-a903-d655316d11fd")]
  record IDeviceModelPlugIn, lpVtbl : IDeviceModelPlugInVtbl* do
    GUID = LibC::GUID.new(0x1cd63475_u32, 0x7c4_u16, 0x46fe_u16, StaticArray[0xa9_u8, 0x3_u8, 0xd6_u8, 0x55_u8, 0x31_u8, 0x6d_u8, 0x11_u8, 0xfd_u8])
    def query_interface(this : IDeviceModelPlugIn*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDeviceModelPlugIn*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDeviceModelPlugIn*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IDeviceModelPlugIn*, bstrXml : Win32cr::Foundation::BSTR, cNumModels : UInt32, iModelPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, bstrXml, cNumModels, iModelPosition)
    end
    def get_num_channels(this : IDeviceModelPlugIn*, pNumChannels : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_channels.call(this, pNumChannels)
    end
    def device_to_colorimetric_colors(this : IDeviceModelPlugIn*, cColors : UInt32, cChannels : UInt32, pDeviceValues : Float32*, pXYZColors : Win32cr::UI::ColorSystem::XYZColorF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_to_colorimetric_colors.call(this, cColors, cChannels, pDeviceValues, pXYZColors)
    end
    def colorimetric_to_device_colors(this : IDeviceModelPlugIn*, cColors : UInt32, cChannels : UInt32, pXYZColors : Win32cr::UI::ColorSystem::XYZColorF*, pDeviceValues : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.colorimetric_to_device_colors.call(this, cColors, cChannels, pXYZColors, pDeviceValues)
    end
    def colorimetric_to_device_colors_with_black(this : IDeviceModelPlugIn*, cColors : UInt32, cChannels : UInt32, pXYZColors : Win32cr::UI::ColorSystem::XYZColorF*, pBlackInformation : Win32cr::UI::ColorSystem::BlackInformation*, pDeviceValues : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.colorimetric_to_device_colors_with_black.call(this, cColors, cChannels, pXYZColors, pBlackInformation, pDeviceValues)
    end
    def set_transform_device_model_info(this : IDeviceModelPlugIn*, iModelPosition : UInt32, pIDeviceModelOther : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_device_model_info.call(this, iModelPosition, pIDeviceModelOther)
    end
    def get_primary_samples(this : IDeviceModelPlugIn*, pPrimaryColor : Win32cr::UI::ColorSystem::PrimaryXYZColors*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_primary_samples.call(this, pPrimaryColor)
    end
    def get_gamut_boundary_mesh_size(this : IDeviceModelPlugIn*, pNumVertices : UInt32*, pNumTriangles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamut_boundary_mesh_size.call(this, pNumVertices, pNumTriangles)
    end
    def get_gamut_boundary_mesh(this : IDeviceModelPlugIn*, cChannels : UInt32, cVertices : UInt32, cTriangles : UInt32, pVertices : Float32*, pTriangles : Win32cr::UI::ColorSystem::GamutShellTriangle*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamut_boundary_mesh.call(this, cChannels, cVertices, cTriangles, pVertices, pTriangles)
    end
    def get_neutral_axis_size(this : IDeviceModelPlugIn*, pcColors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_neutral_axis_size.call(this, pcColors)
    end
    def get_neutral_axis(this : IDeviceModelPlugIn*, cColors : UInt32, pXYZColors : Win32cr::UI::ColorSystem::XYZColorF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_neutral_axis.call(this, cColors, pXYZColors)
    end

  end

  @[Extern]
  record IGamutMapModelPlugInVtbl,
    query_interface : Proc(IGamutMapModelPlugIn*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGamutMapModelPlugIn*, UInt32),
    release : Proc(IGamutMapModelPlugIn*, UInt32),
    initialize__ : Proc(IGamutMapModelPlugIn*, Win32cr::Foundation::BSTR, Void*, Void*, Win32cr::UI::ColorSystem::GamutBoundaryDescription*, Win32cr::UI::ColorSystem::GamutBoundaryDescription*, Win32cr::Foundation::HRESULT),
    source_to_destination_appearance_colors : Proc(IGamutMapModelPlugIn*, UInt32, Win32cr::UI::ColorSystem::JChColorF*, Win32cr::UI::ColorSystem::JChColorF*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2dd80115-ad1e-41f6-a219-a4f4b583d1f9")]
  record IGamutMapModelPlugIn, lpVtbl : IGamutMapModelPlugInVtbl* do
    GUID = LibC::GUID.new(0x2dd80115_u32, 0xad1e_u16, 0x41f6_u16, StaticArray[0xa2_u8, 0x19_u8, 0xa4_u8, 0xf4_u8, 0xb5_u8, 0x83_u8, 0xd1_u8, 0xf9_u8])
    def query_interface(this : IGamutMapModelPlugIn*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGamutMapModelPlugIn*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGamutMapModelPlugIn*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IGamutMapModelPlugIn*, bstrXml : Win32cr::Foundation::BSTR, pSrcPlugIn : Void*, pDestPlugIn : Void*, pSrcGBD : Win32cr::UI::ColorSystem::GamutBoundaryDescription*, pDestGBD : Win32cr::UI::ColorSystem::GamutBoundaryDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, bstrXml, pSrcPlugIn, pDestPlugIn, pSrcGBD, pDestGBD)
    end
    def source_to_destination_appearance_colors(this : IGamutMapModelPlugIn*, cColors : UInt32, pInputColors : Win32cr::UI::ColorSystem::JChColorF*, pOutputColors : Win32cr::UI::ColorSystem::JChColorF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.source_to_destination_appearance_colors.call(this, cColors, pInputColors, pOutputColors)
    end

  end

  @[Link("gdi32")]
  @[Link("mscms")]
  @[Link("icmui")]
  @[Link("icm32")]
  lib C
    fun SetICMMode(hdc : Win32cr::Graphics::Gdi::HDC, mode : Win32cr::UI::ColorSystem::ICM_MODE) : Int32

    fun CheckColorsInGamut(hdc : Win32cr::Graphics::Gdi::HDC, lpRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, dlpBuffer : Void*, nCount : UInt32) : Win32cr::Foundation::BOOL

    fun GetColorSpace(hdc : Win32cr::Graphics::Gdi::HDC) : Win32cr::UI::ColorSystem::HCOLORSPACE

    fun GetLogColorSpaceA(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, nSize : UInt32) : Win32cr::Foundation::BOOL

    fun GetLogColorSpaceW(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, nSize : UInt32) : Win32cr::Foundation::BOOL

    fun CreateColorSpaceA(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*) : Win32cr::UI::ColorSystem::HCOLORSPACE

    fun CreateColorSpaceW(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*) : Win32cr::UI::ColorSystem::HCOLORSPACE

    fun SetColorSpace(hdc : Win32cr::Graphics::Gdi::HDC, hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::UI::ColorSystem::HCOLORSPACE

    fun DeleteColorSpace(hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::Foundation::BOOL

    fun GetICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt8*) : Win32cr::Foundation::BOOL

    fun GetICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt16*) : Win32cr::Foundation::BOOL

    fun SetICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL

    fun SetDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL

    fun ColorMatchToTarget(hdc : Win32cr::Graphics::Gdi::HDC, hdcTarget : Win32cr::Graphics::Gdi::HDC, action : Win32cr::UI::ColorSystem::COLOR_MATCH_TO_TARGET_ACTION) : Win32cr::Foundation::BOOL

    fun EnumICMProfilesA(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCA, param2 : Win32cr::Foundation::LPARAM) : Int32

    fun EnumICMProfilesW(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCW, param2 : Win32cr::Foundation::LPARAM) : Int32

    fun UpdateICMRegKeyA(reserved : UInt32, lpszCMID : Win32cr::Foundation::PSTR, lpszFileName : Win32cr::Foundation::PSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL

    fun UpdateICMRegKeyW(reserved : UInt32, lpszCMID : Win32cr::Foundation::PWSTR, lpszFileName : Win32cr::Foundation::PWSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL

    fun ColorCorrectPalette(hdc : Win32cr::Graphics::Gdi::HDC, hPal : Win32cr::Graphics::Gdi::HPALETTE, deFirst : UInt32, num : UInt32) : Win32cr::Foundation::BOOL

    fun OpenColorProfileA(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT

    fun OpenColorProfileW(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT

    fun CloseColorProfile(hProfile : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun GetColorProfileFromHandle(hProfile : LibC::IntPtrT, pProfile : UInt8*, pcbProfile : UInt32*) : Win32cr::Foundation::BOOL

    fun IsColorProfileValid(hProfile : LibC::IntPtrT, pbValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun CreateProfileFromLogColorSpaceA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, pProfile : UInt8**) : Win32cr::Foundation::BOOL

    fun CreateProfileFromLogColorSpaceW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, pProfile : UInt8**) : Win32cr::Foundation::BOOL

    fun GetCountColorProfileElements(hProfile : LibC::IntPtrT, pnElementCount : UInt32*) : Win32cr::Foundation::BOOL

    fun GetColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL

    fun GetColorProfileElementTag(hProfile : LibC::IntPtrT, dwIndex : UInt32, pTag : UInt32*) : Win32cr::Foundation::BOOL

    fun IsColorProfileTagPresent(hProfile : LibC::IntPtrT, tag : UInt32, pbPresent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*, pbReference : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun SetColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL

    fun SetColorProfileElementSize(hProfile : LibC::IntPtrT, tagType : UInt32, pcbElement : UInt32) : Win32cr::Foundation::BOOL

    fun SetColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*) : Win32cr::Foundation::BOOL

    fun SetColorProfileElementReference(hProfile : LibC::IntPtrT, newTag : UInt32, refTag : UInt32) : Win32cr::Foundation::BOOL

    fun GetPS2ColorSpaceArray(hProfile : LibC::IntPtrT, dwIntent : UInt32, dwCSAType : UInt32, pPS2ColorSpaceArray : UInt8*, pcbPS2ColorSpaceArray : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetPS2ColorRenderingIntent(hProfile : LibC::IntPtrT, dwIntent : UInt32, pBuffer : UInt8*, pcbPS2ColorRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL

    fun GetPS2ColorRenderingDictionary(hProfile : LibC::IntPtrT, dwIntent : UInt32, pPS2ColorRenderingDictionary : UInt8*, pcbPS2ColorRenderingDictionary : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL

    fun ConvertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL

    fun ConvertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL

    fun CreateDeviceLinkProfile(hProfile : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, pProfileData : UInt8**, indexPreferredCMM : UInt32) : Win32cr::Foundation::BOOL

    fun CreateColorTransformA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT

    fun CreateColorTransformW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT

    fun CreateMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, indexPreferredCMM : UInt32) : LibC::IntPtrT

    fun DeleteColorTransform(hxform : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun TranslateBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, pDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, pfnCallBack : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun CheckBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, paResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, lpCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun TranslateColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL

    fun CheckColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paResult : UInt8*) : Win32cr::Foundation::BOOL

    fun GetCMMInfo(hColorTransform : LibC::IntPtrT, param1 : UInt32) : UInt32

    fun RegisterCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun RegisterCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun UnregisterCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL

    fun UnregisterCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL

    fun SelectCMM(dwCMMType : UInt32) : Win32cr::Foundation::BOOL

    fun GetColorDirectoryA(pMachineName : Win32cr::Foundation::PSTR, pBuffer : Win32cr::Foundation::PSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    fun GetColorDirectoryW(pMachineName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::Foundation::PWSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    fun InstallColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun InstallColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun UninstallColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun UninstallColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun EnumColorProfilesA(pMachineName : Win32cr::Foundation::PSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEA*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumColorProfilesW(pMachineName : Win32cr::Foundation::PWSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    fun SetStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwProfileID : UInt32, pProfilename : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL

    fun GetStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PWSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL

    fun AssociateColorProfileWithDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun AssociateColorProfileWithDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun DisassociateColorProfileFromDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun DisassociateColorProfileFromDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun SetupColorMatchingW(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPW*) : Win32cr::Foundation::BOOL

    fun SetupColorMatchingA(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPA*) : Win32cr::Foundation::BOOL

    fun WcsAssociateColorProfileWithDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun WcsDisassociateColorProfileFromDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun WcsEnumColorProfilesSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    fun WcsEnumColorProfiles(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pBuffer : UInt8*, dwSize : UInt32, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    fun WcsGetDefaultColorProfileSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pcbProfileName : UInt32*) : Win32cr::Foundation::BOOL

    fun WcsGetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, cbProfileName : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun WcsSetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun WcsSetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, dwRenderingIntent : UInt32) : Win32cr::Foundation::BOOL

    fun WcsGetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pdwRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL

    fun WcsGetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, pUsePerUserProfiles : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun WcsSetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, usePerUserProfiles : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WcsTranslateColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, nOutputChannels : UInt32, cdtOutput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbOutput : UInt32, pOutputData : Void*) : Win32cr::Foundation::BOOL

    fun WcsCheckColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, paResult : UInt8*) : Win32cr::Foundation::BOOL

    fun CMCheckColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaResult : UInt8*) : Win32cr::Foundation::BOOL

    fun CMCheckRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpaResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun CMConvertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL

    fun CMConvertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL

    fun CMCreateDeviceLinkProfile(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32, lpProfileData : UInt8**) : Win32cr::Foundation::BOOL

    fun CMCreateMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    fun CMCreateProfileW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpProfileData : Void**) : Win32cr::Foundation::BOOL

    fun CMCreateTransform(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT

    fun CMCreateTransformW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT

    fun CMCreateTransformExt(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT

    fun CMCheckColorsInGamut(hcmTransform : LibC::IntPtrT, lpaRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, lpaResult : UInt8*, nCount : UInt32) : Win32cr::Foundation::BOOL

    fun CMCreateProfile(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpProfileData : Void**) : Win32cr::Foundation::BOOL

    fun CMTranslateRGB(hcmTransform : LibC::IntPtrT, color_ref : UInt32, lpColorRef : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CMTranslateRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwTranslateDirection : UInt32) : Win32cr::Foundation::BOOL

    fun CMCreateTransformExtW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT

    fun CMDeleteTransform(hcmTransform : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun CMGetInfo(dwInfo : UInt32) : UInt32

    fun CMGetNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL

    fun CMIsProfileValid(hProfile : LibC::IntPtrT, lpbValid : Int32*) : Win32cr::Foundation::BOOL

    fun CMTranslateColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL

    fun CMTranslateRGBsExt(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, lpfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun WcsOpenColorProfileA(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    fun WcsOpenColorProfileW(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    fun WcsCreateIccProfile(hWcsProfile : LibC::IntPtrT, dwOptions : UInt32) : LibC::IntPtrT

    fun WcsGetCalibrationManagementState(pbIsEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun WcsSetCalibrationManagementState(bIsEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ColorProfileAddDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, setAsDefault : Win32cr::Foundation::BOOL, associateAsAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun ColorProfileRemoveDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, dissociateAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun ColorProfileSetDisplayDefaultAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32) : Win32cr::Foundation::HRESULT

    fun ColorProfileGetDisplayList(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileList : Win32cr::Foundation::PWSTR**, profileCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun ColorProfileGetDisplayDefault(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, profileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun ColorProfileGetDisplayUserScope(targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE*) : Win32cr::Foundation::HRESULT

  end
end