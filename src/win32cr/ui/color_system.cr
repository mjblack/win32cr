require "./../graphics/gdi.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./windows_and_messaging.cr"

module Win32cr::UI::ColorSystem
  extend self
  alias HCOLORSPACE = LibC::IntPtrT
  alias ICMENUMPROCA = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::LPARAM, Int32)

  alias ICMENUMPROCW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::LPARAM, Int32)

  alias LPBMCALLBACKFN = Proc(UInt32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias PCMSCALLBACKW = Proc(Win32cr::UI::ColorSystem::COLORMATCHSETUPW*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias PCMSCALLBACKA = Proc(Win32cr::UI::ColorSystem::COLORMATCHSETUPA*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

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
  struct LOGCOLORSPACEA
    property lcsSignature : UInt32
    property lcsVersion : UInt32
    property lcsSize : UInt32
    property lcsCSType : Int32
    property lcsIntent : Int32
    property lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE
    property lcsGammaRed : UInt32
    property lcsGammaGreen : UInt32
    property lcsGammaBlue : UInt32
    property lcsFilename : Win32cr::Foundation::CHAR[260]
    def initialize(@lcsSignature : UInt32, @lcsVersion : UInt32, @lcsSize : UInt32, @lcsCSType : Int32, @lcsIntent : Int32, @lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE, @lcsGammaRed : UInt32, @lcsGammaGreen : UInt32, @lcsGammaBlue : UInt32, @lcsFilename : Win32cr::Foundation::CHAR[260])
    end
  end

  @[Extern]
  struct LOGCOLORSPACEW
    property lcsSignature : UInt32
    property lcsVersion : UInt32
    property lcsSize : UInt32
    property lcsCSType : Int32
    property lcsIntent : Int32
    property lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE
    property lcsGammaRed : UInt32
    property lcsGammaGreen : UInt32
    property lcsGammaBlue : UInt32
    property lcsFilename : UInt16[260]
    def initialize(@lcsSignature : UInt32, @lcsVersion : UInt32, @lcsSize : UInt32, @lcsCSType : Int32, @lcsIntent : Int32, @lcsEndpoints : Win32cr::Graphics::Gdi::CIEXYZTRIPLE, @lcsGammaRed : UInt32, @lcsGammaGreen : UInt32, @lcsGammaBlue : UInt32, @lcsFilename : UInt16[260])
    end
  end

  @[Extern]
  struct EMRCREATECOLORSPACE
    property emr : Win32cr::Graphics::Gdi::EMR
    property ihCS : UInt32
    property lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA
    def initialize(@emr : Win32cr::Graphics::Gdi::EMR, @ihCS : UInt32, @lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA)
    end
  end

  @[Extern]
  struct EMRCREATECOLORSPACEW
    property emr : Win32cr::Graphics::Gdi::EMR
    property ihCS : UInt32
    property lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW
    property dwFlags : UInt32
    property cbData : UInt32
    property data : UInt8*
    def initialize(@emr : Win32cr::Graphics::Gdi::EMR, @ihCS : UInt32, @lcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW, @dwFlags : UInt32, @cbData : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct XYZColorF
    property x : Float32
    property y : Float32
    property z : Float32
    def initialize(@x : Float32, @y : Float32, @z : Float32)
    end
  end

  @[Extern]
  struct JChColorF
    property j : Float32
    property c : Float32
    property h : Float32
    def initialize(@j : Float32, @c : Float32, @h : Float32)
    end
  end

  @[Extern]
  struct JabColorF
    property j : Float32
    property a : Float32
    property b : Float32
    def initialize(@j : Float32, @a : Float32, @b : Float32)
    end
  end

  @[Extern]
  struct GamutShellTriangle
    property aVertexIndex : UInt32[3]
    def initialize(@aVertexIndex : UInt32[3])
    end
  end

  @[Extern]
  struct GamutShell
    property j_min : Float32
    property j_max : Float32
    property cVertices : UInt32
    property cTriangles : UInt32
    property pVertices : Win32cr::UI::ColorSystem::JabColorF*
    property pTriangles : Win32cr::UI::ColorSystem::GamutShellTriangle*
    def initialize(@j_min : Float32, @j_max : Float32, @cVertices : UInt32, @cTriangles : UInt32, @pVertices : Win32cr::UI::ColorSystem::JabColorF*, @pTriangles : Win32cr::UI::ColorSystem::GamutShellTriangle*)
    end
  end

  @[Extern]
  struct PrimaryJabColors
    property red : Win32cr::UI::ColorSystem::JabColorF
    property yellow : Win32cr::UI::ColorSystem::JabColorF
    property green : Win32cr::UI::ColorSystem::JabColorF
    property cyan : Win32cr::UI::ColorSystem::JabColorF
    property blue : Win32cr::UI::ColorSystem::JabColorF
    property magenta : Win32cr::UI::ColorSystem::JabColorF
    property black : Win32cr::UI::ColorSystem::JabColorF
    property white : Win32cr::UI::ColorSystem::JabColorF
    def initialize(@red : Win32cr::UI::ColorSystem::JabColorF, @yellow : Win32cr::UI::ColorSystem::JabColorF, @green : Win32cr::UI::ColorSystem::JabColorF, @cyan : Win32cr::UI::ColorSystem::JabColorF, @blue : Win32cr::UI::ColorSystem::JabColorF, @magenta : Win32cr::UI::ColorSystem::JabColorF, @black : Win32cr::UI::ColorSystem::JabColorF, @white : Win32cr::UI::ColorSystem::JabColorF)
    end
  end

  @[Extern]
  struct PrimaryXYZColors
    property red : Win32cr::UI::ColorSystem::XYZColorF
    property yellow : Win32cr::UI::ColorSystem::XYZColorF
    property green : Win32cr::UI::ColorSystem::XYZColorF
    property cyan : Win32cr::UI::ColorSystem::XYZColorF
    property blue : Win32cr::UI::ColorSystem::XYZColorF
    property magenta : Win32cr::UI::ColorSystem::XYZColorF
    property black : Win32cr::UI::ColorSystem::XYZColorF
    property white : Win32cr::UI::ColorSystem::XYZColorF
    def initialize(@red : Win32cr::UI::ColorSystem::XYZColorF, @yellow : Win32cr::UI::ColorSystem::XYZColorF, @green : Win32cr::UI::ColorSystem::XYZColorF, @cyan : Win32cr::UI::ColorSystem::XYZColorF, @blue : Win32cr::UI::ColorSystem::XYZColorF, @magenta : Win32cr::UI::ColorSystem::XYZColorF, @black : Win32cr::UI::ColorSystem::XYZColorF, @white : Win32cr::UI::ColorSystem::XYZColorF)
    end
  end

  @[Extern]
  struct GamutBoundaryDescription
    property pPrimaries : Win32cr::UI::ColorSystem::PrimaryJabColors*
    property cNeutralSamples : UInt32
    property pNeutralSamples : Win32cr::UI::ColorSystem::JabColorF*
    property pReferenceShell : Win32cr::UI::ColorSystem::GamutShell*
    property pPlausibleShell : Win32cr::UI::ColorSystem::GamutShell*
    property pPossibleShell : Win32cr::UI::ColorSystem::GamutShell*
    def initialize(@pPrimaries : Win32cr::UI::ColorSystem::PrimaryJabColors*, @cNeutralSamples : UInt32, @pNeutralSamples : Win32cr::UI::ColorSystem::JabColorF*, @pReferenceShell : Win32cr::UI::ColorSystem::GamutShell*, @pPlausibleShell : Win32cr::UI::ColorSystem::GamutShell*, @pPossibleShell : Win32cr::UI::ColorSystem::GamutShell*)
    end
  end

  @[Extern]
  struct BlackInformation
    property fBlackOnly : Win32cr::Foundation::BOOL
    property blackWeight : Float32
    def initialize(@fBlackOnly : Win32cr::Foundation::BOOL, @blackWeight : Float32)
    end
  end

  @[Extern]
  struct NAMED_PROFILE_INFO
    property dwFlags : UInt32
    property dwCount : UInt32
    property dwCountDevCoordinates : UInt32
    property szPrefix : Int8[32]
    property szSuffix : Int8[32]
    def initialize(@dwFlags : UInt32, @dwCount : UInt32, @dwCountDevCoordinates : UInt32, @szPrefix : Int8[32], @szSuffix : Int8[32])
    end
  end

  @[Extern]
  struct GRAYCOLOR
    property gray : UInt16
    def initialize(@gray : UInt16)
    end
  end

  @[Extern]
  struct RGBCOLOR
    property red : UInt16
    property green : UInt16
    property blue : UInt16
    def initialize(@red : UInt16, @green : UInt16, @blue : UInt16)
    end
  end

  @[Extern]
  struct CMYKCOLOR
    property cyan : UInt16
    property magenta : UInt16
    property yellow : UInt16
    property black : UInt16
    def initialize(@cyan : UInt16, @magenta : UInt16, @yellow : UInt16, @black : UInt16)
    end
  end

  @[Extern]
  struct XYZCOLOR
    property x : UInt16
    property y : UInt16
    property z : UInt16
    def initialize(@x : UInt16, @y : UInt16, @z : UInt16)
    end
  end

  @[Extern]
  struct YxyCOLOR
    property y : UInt16
    property x : UInt16
    property y_ : UInt16
    def initialize(@y : UInt16, @x : UInt16, @y_ : UInt16)
    end
  end

  @[Extern]
  struct LabCOLOR
    property l : UInt16
    property a : UInt16
    property b : UInt16
    def initialize(@l : UInt16, @a : UInt16, @b : UInt16)
    end
  end

  @[Extern]
  struct GENERIC3CHANNEL
    property ch1 : UInt16
    property ch2 : UInt16
    property ch3 : UInt16
    def initialize(@ch1 : UInt16, @ch2 : UInt16, @ch3 : UInt16)
    end
  end

  @[Extern]
  struct NAMEDCOLOR
    property dwIndex : UInt32
    def initialize(@dwIndex : UInt32)
    end
  end

  @[Extern]
  struct HiFiCOLOR
    property channel : UInt8[8]
    def initialize(@channel : UInt8[8])
    end
  end

  @[Extern(union: true)]
  struct COLOR
    property gray : Win32cr::UI::ColorSystem::GRAYCOLOR
    property rgb : Win32cr::UI::ColorSystem::RGBCOLOR
    property cmyk : Win32cr::UI::ColorSystem::CMYKCOLOR
    property xyz : Win32cr::UI::ColorSystem::XYZCOLOR
    property yxy : Win32cr::UI::ColorSystem::YxyCOLOR
    property lab : Win32cr::UI::ColorSystem::LabCOLOR
    property gen3ch : Win32cr::UI::ColorSystem::GENERIC3CHANNEL
    property named : Win32cr::UI::ColorSystem::NAMEDCOLOR
    property hifi : Win32cr::UI::ColorSystem::HiFiCOLOR
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property reserved1 : UInt32
    property reserved2 : Void*
    def initialize(@reserved1 : UInt32, @reserved2 : Void*)
    end
    end

    def initialize(@gray : Win32cr::UI::ColorSystem::GRAYCOLOR, @rgb : Win32cr::UI::ColorSystem::RGBCOLOR, @cmyk : Win32cr::UI::ColorSystem::CMYKCOLOR, @xyz : Win32cr::UI::ColorSystem::XYZCOLOR, @yxy : Win32cr::UI::ColorSystem::YxyCOLOR, @lab : Win32cr::UI::ColorSystem::LabCOLOR, @gen3ch : Win32cr::UI::ColorSystem::GENERIC3CHANNEL, @named : Win32cr::UI::ColorSystem::NAMEDCOLOR, @hifi : Win32cr::UI::ColorSystem::HiFiCOLOR, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern]
  struct PROFILEHEADER
    property phSize : UInt32
    property phCMMType : UInt32
    property phVersion : UInt32
    property phClass : UInt32
    property phDataColorSpace : UInt32
    property phConnectionSpace : UInt32
    property phDateTime : UInt32[3]
    property phSignature : UInt32
    property phPlatform : UInt32
    property phProfileFlags : UInt32
    property phManufacturer : UInt32
    property phModel : UInt32
    property phAttributes : UInt32[2]
    property phRenderingIntent : UInt32
    property phIlluminant : Win32cr::Graphics::Gdi::CIEXYZ
    property phCreator : UInt32
    property phReserved : UInt8[44]
    def initialize(@phSize : UInt32, @phCMMType : UInt32, @phVersion : UInt32, @phClass : UInt32, @phDataColorSpace : UInt32, @phConnectionSpace : UInt32, @phDateTime : UInt32[3], @phSignature : UInt32, @phPlatform : UInt32, @phProfileFlags : UInt32, @phManufacturer : UInt32, @phModel : UInt32, @phAttributes : UInt32[2], @phRenderingIntent : UInt32, @phIlluminant : Win32cr::Graphics::Gdi::CIEXYZ, @phCreator : UInt32, @phReserved : UInt8[44])
    end
  end

  @[Extern]
  struct PROFILE
    property dwType : UInt32
    property pProfileData : Void*
    property cbDataSize : UInt32
    def initialize(@dwType : UInt32, @pProfileData : Void*, @cbDataSize : UInt32)
    end
  end

  @[Extern]
  struct ENUMTYPEA
    property dwSize : UInt32
    property dwVersion : UInt32
    property dwFields : UInt32
    property pDeviceName : Win32cr::Foundation::PSTR
    property dwMediaType : UInt32
    property dwDitheringMode : UInt32
    property dwResolution : UInt32[2]
    property dwCMMType : UInt32
    property dwClass : UInt32
    property dwDataColorSpace : UInt32
    property dwConnectionSpace : UInt32
    property dwSignature : UInt32
    property dwPlatform : UInt32
    property dwProfileFlags : UInt32
    property dwManufacturer : UInt32
    property dwModel : UInt32
    property dwAttributes : UInt32[2]
    property dwRenderingIntent : UInt32
    property dwCreator : UInt32
    property dwDeviceClass : UInt32
    def initialize(@dwSize : UInt32, @dwVersion : UInt32, @dwFields : UInt32, @pDeviceName : Win32cr::Foundation::PSTR, @dwMediaType : UInt32, @dwDitheringMode : UInt32, @dwResolution : UInt32[2], @dwCMMType : UInt32, @dwClass : UInt32, @dwDataColorSpace : UInt32, @dwConnectionSpace : UInt32, @dwSignature : UInt32, @dwPlatform : UInt32, @dwProfileFlags : UInt32, @dwManufacturer : UInt32, @dwModel : UInt32, @dwAttributes : UInt32[2], @dwRenderingIntent : UInt32, @dwCreator : UInt32, @dwDeviceClass : UInt32)
    end
  end

  @[Extern]
  struct ENUMTYPEW
    property dwSize : UInt32
    property dwVersion : UInt32
    property dwFields : UInt32
    property pDeviceName : Win32cr::Foundation::PWSTR
    property dwMediaType : UInt32
    property dwDitheringMode : UInt32
    property dwResolution : UInt32[2]
    property dwCMMType : UInt32
    property dwClass : UInt32
    property dwDataColorSpace : UInt32
    property dwConnectionSpace : UInt32
    property dwSignature : UInt32
    property dwPlatform : UInt32
    property dwProfileFlags : UInt32
    property dwManufacturer : UInt32
    property dwModel : UInt32
    property dwAttributes : UInt32[2]
    property dwRenderingIntent : UInt32
    property dwCreator : UInt32
    property dwDeviceClass : UInt32
    def initialize(@dwSize : UInt32, @dwVersion : UInt32, @dwFields : UInt32, @pDeviceName : Win32cr::Foundation::PWSTR, @dwMediaType : UInt32, @dwDitheringMode : UInt32, @dwResolution : UInt32[2], @dwCMMType : UInt32, @dwClass : UInt32, @dwDataColorSpace : UInt32, @dwConnectionSpace : UInt32, @dwSignature : UInt32, @dwPlatform : UInt32, @dwProfileFlags : UInt32, @dwManufacturer : UInt32, @dwModel : UInt32, @dwAttributes : UInt32[2], @dwRenderingIntent : UInt32, @dwCreator : UInt32, @dwDeviceClass : UInt32)
    end
  end

  @[Extern]
  struct COLORMATCHSETUPW
    property dwSize : UInt32
    property dwVersion : UInt32
    property dwFlags : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property pSourceName : Win32cr::Foundation::PWSTR
    property pDisplayName : Win32cr::Foundation::PWSTR
    property pPrinterName : Win32cr::Foundation::PWSTR
    property dwRenderIntent : UInt32
    property dwProofingIntent : UInt32
    property pMonitorProfile : Win32cr::Foundation::PWSTR
    property ccMonitorProfile : UInt32
    property pPrinterProfile : Win32cr::Foundation::PWSTR
    property ccPrinterProfile : UInt32
    property pTargetProfile : Win32cr::Foundation::PWSTR
    property ccTargetProfile : UInt32
    property lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC
    property lParam : Win32cr::Foundation::LPARAM
    property lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKW
    property lParamApplyCallback : Win32cr::Foundation::LPARAM
    def initialize(@dwSize : UInt32, @dwVersion : UInt32, @dwFlags : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @pSourceName : Win32cr::Foundation::PWSTR, @pDisplayName : Win32cr::Foundation::PWSTR, @pPrinterName : Win32cr::Foundation::PWSTR, @dwRenderIntent : UInt32, @dwProofingIntent : UInt32, @pMonitorProfile : Win32cr::Foundation::PWSTR, @ccMonitorProfile : UInt32, @pPrinterProfile : Win32cr::Foundation::PWSTR, @ccPrinterProfile : UInt32, @pTargetProfile : Win32cr::Foundation::PWSTR, @ccTargetProfile : UInt32, @lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC, @lParam : Win32cr::Foundation::LPARAM, @lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKW, @lParamApplyCallback : Win32cr::Foundation::LPARAM)
    end
  end

  @[Extern]
  struct COLORMATCHSETUPA
    property dwSize : UInt32
    property dwVersion : UInt32
    property dwFlags : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property pSourceName : Win32cr::Foundation::PSTR
    property pDisplayName : Win32cr::Foundation::PSTR
    property pPrinterName : Win32cr::Foundation::PSTR
    property dwRenderIntent : UInt32
    property dwProofingIntent : UInt32
    property pMonitorProfile : Win32cr::Foundation::PSTR
    property ccMonitorProfile : UInt32
    property pPrinterProfile : Win32cr::Foundation::PSTR
    property ccPrinterProfile : UInt32
    property pTargetProfile : Win32cr::Foundation::PSTR
    property ccTargetProfile : UInt32
    property lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC
    property lParam : Win32cr::Foundation::LPARAM
    property lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKA
    property lParamApplyCallback : Win32cr::Foundation::LPARAM
    def initialize(@dwSize : UInt32, @dwVersion : UInt32, @dwFlags : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @pSourceName : Win32cr::Foundation::PSTR, @pDisplayName : Win32cr::Foundation::PSTR, @pPrinterName : Win32cr::Foundation::PSTR, @dwRenderIntent : UInt32, @dwProofingIntent : UInt32, @pMonitorProfile : Win32cr::Foundation::PSTR, @ccMonitorProfile : UInt32, @pPrinterProfile : Win32cr::Foundation::PSTR, @ccPrinterProfile : UInt32, @pTargetProfile : Win32cr::Foundation::PSTR, @ccTargetProfile : UInt32, @lpfnHook : Win32cr::UI::WindowsAndMessaging::DLGPROC, @lParam : Win32cr::Foundation::LPARAM, @lpfnApplyCallback : Win32cr::UI::ColorSystem::PCMSCALLBACKA, @lParamApplyCallback : Win32cr::Foundation::LPARAM)
    end
  end

  @[Extern]
  struct WCS_DEVICE_VCGT_CAPABILITIES
    property size : UInt32
    property supports_vcgt : Win32cr::Foundation::BOOL
    def initialize(@size : UInt32, @supports_vcgt : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WCS_DEVICE_MHC2_CAPABILITIES
    property size : UInt32
    property supports_mhc2 : Win32cr::Foundation::BOOL
    property regamma_lut_entry_count : UInt32
    property csc_xyz_matrix_rows : UInt32
    property csc_xyz_matrix_columns : UInt32
    def initialize(@size : UInt32, @supports_mhc2 : Win32cr::Foundation::BOOL, @regamma_lut_entry_count : UInt32, @csc_xyz_matrix_rows : UInt32, @csc_xyz_matrix_columns : UInt32)
    end
  end

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

  def setICMMode(hdc : Win32cr::Graphics::Gdi::HDC, mode : Win32cr::UI::ColorSystem::ICM_MODE) : Int32
    C.SetICMMode(hdc, mode)
  end

  def checkColorsInGamut(hdc : Win32cr::Graphics::Gdi::HDC, lpRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, dlpBuffer : Void*, nCount : UInt32) : Win32cr::Foundation::BOOL
    C.CheckColorsInGamut(hdc, lpRGBTriple, dlpBuffer, nCount)
  end

  def getColorSpace(hdc : Win32cr::Graphics::Gdi::HDC) : Win32cr::UI::ColorSystem::HCOLORSPACE
    C.GetColorSpace(hdc)
  end

  def getLogColorSpaceA(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, nSize : UInt32) : Win32cr::Foundation::BOOL
    C.GetLogColorSpaceA(hColorSpace, lpBuffer, nSize)
  end

  def getLogColorSpaceW(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, nSize : UInt32) : Win32cr::Foundation::BOOL
    C.GetLogColorSpaceW(hColorSpace, lpBuffer, nSize)
  end

  def createColorSpaceA(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*) : Win32cr::UI::ColorSystem::HCOLORSPACE
    C.CreateColorSpaceA(lplcs)
  end

  def createColorSpaceW(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*) : Win32cr::UI::ColorSystem::HCOLORSPACE
    C.CreateColorSpaceW(lplcs)
  end

  def setColorSpace(hdc : Win32cr::Graphics::Gdi::HDC, hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::UI::ColorSystem::HCOLORSPACE
    C.SetColorSpace(hdc, hcs)
  end

  def deleteColorSpace(hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::Foundation::BOOL
    C.DeleteColorSpace(hcs)
  end

  def getICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt8*) : Win32cr::Foundation::BOOL
    C.GetICMProfileA(hdc, pBufSize, pszFilename)
  end

  def getICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt16*) : Win32cr::Foundation::BOOL
    C.GetICMProfileW(hdc, pBufSize, pszFilename)
  end

  def setICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetICMProfileA(hdc, lpFileName)
  end

  def setICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.SetICMProfileW(hdc, lpFileName)
  end

  def getDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL
    C.GetDeviceGammaRamp(hdc, lpRamp)
  end

  def setDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL
    C.SetDeviceGammaRamp(hdc, lpRamp)
  end

  def colorMatchToTarget(hdc : Win32cr::Graphics::Gdi::HDC, hdcTarget : Win32cr::Graphics::Gdi::HDC, action : Win32cr::UI::ColorSystem::COLOR_MATCH_TO_TARGET_ACTION) : Win32cr::Foundation::BOOL
    C.ColorMatchToTarget(hdc, hdcTarget, action)
  end

  def enumICMProfilesA(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCA, param2 : Win32cr::Foundation::LPARAM) : Int32
    C.EnumICMProfilesA(hdc, proc, param2)
  end

  def enumICMProfilesW(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCW, param2 : Win32cr::Foundation::LPARAM) : Int32
    C.EnumICMProfilesW(hdc, proc, param2)
  end

  def updateICMRegKeyA(reserved : UInt32, lpszCMID : Win32cr::Foundation::PSTR, lpszFileName : Win32cr::Foundation::PSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL
    C.UpdateICMRegKeyA(reserved, lpszCMID, lpszFileName, command)
  end

  def updateICMRegKeyW(reserved : UInt32, lpszCMID : Win32cr::Foundation::PWSTR, lpszFileName : Win32cr::Foundation::PWSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL
    C.UpdateICMRegKeyW(reserved, lpszCMID, lpszFileName, command)
  end

  def colorCorrectPalette(hdc : Win32cr::Graphics::Gdi::HDC, hPal : Win32cr::Graphics::Gdi::HPALETTE, deFirst : UInt32, num : UInt32) : Win32cr::Foundation::BOOL
    C.ColorCorrectPalette(hdc, hPal, deFirst, num)
  end

  def openColorProfileA(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT
    C.OpenColorProfileA(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode)
  end

  def openColorProfileW(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT
    C.OpenColorProfileW(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode)
  end

  def closeColorProfile(hProfile : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.CloseColorProfile(hProfile)
  end

  def getColorProfileFromHandle(hProfile : LibC::IntPtrT, pProfile : UInt8*, pcbProfile : UInt32*) : Win32cr::Foundation::BOOL
    C.GetColorProfileFromHandle(hProfile, pProfile, pcbProfile)
  end

  def isColorProfileValid(hProfile : LibC::IntPtrT, pbValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsColorProfileValid(hProfile, pbValid)
  end

  def createProfileFromLogColorSpaceA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, pProfile : UInt8**) : Win32cr::Foundation::BOOL
    C.CreateProfileFromLogColorSpaceA(pLogColorSpace, pProfile)
  end

  def createProfileFromLogColorSpaceW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, pProfile : UInt8**) : Win32cr::Foundation::BOOL
    C.CreateProfileFromLogColorSpaceW(pLogColorSpace, pProfile)
  end

  def getCountColorProfileElements(hProfile : LibC::IntPtrT, pnElementCount : UInt32*) : Win32cr::Foundation::BOOL
    C.GetCountColorProfileElements(hProfile, pnElementCount)
  end

  def getColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL
    C.GetColorProfileHeader(hProfile, pHeader)
  end

  def getColorProfileElementTag(hProfile : LibC::IntPtrT, dwIndex : UInt32, pTag : UInt32*) : Win32cr::Foundation::BOOL
    C.GetColorProfileElementTag(hProfile, dwIndex, pTag)
  end

  def isColorProfileTagPresent(hProfile : LibC::IntPtrT, tag : UInt32, pbPresent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsColorProfileTagPresent(hProfile, tag, pbPresent)
  end

  def getColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*, pbReference : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement, pbReference)
  end

  def setColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL
    C.SetColorProfileHeader(hProfile, pHeader)
  end

  def setColorProfileElementSize(hProfile : LibC::IntPtrT, tagType : UInt32, pcbElement : UInt32) : Win32cr::Foundation::BOOL
    C.SetColorProfileElementSize(hProfile, tagType, pcbElement)
  end

  def setColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*) : Win32cr::Foundation::BOOL
    C.SetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement)
  end

  def setColorProfileElementReference(hProfile : LibC::IntPtrT, newTag : UInt32, refTag : UInt32) : Win32cr::Foundation::BOOL
    C.SetColorProfileElementReference(hProfile, newTag, refTag)
  end

  def getPS2ColorSpaceArray(hProfile : LibC::IntPtrT, dwIntent : UInt32, dwCSAType : UInt32, pPS2ColorSpaceArray : UInt8*, pcbPS2ColorSpaceArray : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetPS2ColorSpaceArray(hProfile, dwIntent, dwCSAType, pPS2ColorSpaceArray, pcbPS2ColorSpaceArray, pbBinary)
  end

  def getPS2ColorRenderingIntent(hProfile : LibC::IntPtrT, dwIntent : UInt32, pBuffer : UInt8*, pcbPS2ColorRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL
    C.GetPS2ColorRenderingIntent(hProfile, dwIntent, pBuffer, pcbPS2ColorRenderingIntent)
  end

  def getPS2ColorRenderingDictionary(hProfile : LibC::IntPtrT, dwIntent : UInt32, pPS2ColorRenderingDictionary : UInt8*, pcbPS2ColorRenderingDictionary : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetPS2ColorRenderingDictionary(hProfile, dwIntent, pPS2ColorRenderingDictionary, pcbPS2ColorRenderingDictionary, pbBinary)
  end

  def getNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL
    C.GetNamedProfileInfo(hProfile, pNamedProfileInfo)
  end

  def convertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL
    C.ConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount)
  end

  def convertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL
    C.ConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount)
  end

  def createDeviceLinkProfile(hProfile : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, pProfileData : UInt8**, indexPreferredCMM : UInt32) : Win32cr::Foundation::BOOL
    C.CreateDeviceLinkProfile(hProfile, nProfiles, padwIntent, nIntents, dwFlags, pProfileData, indexPreferredCMM)
  end

  def createColorTransformA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT
    C.CreateColorTransformA(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags)
  end

  def createColorTransformW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT
    C.CreateColorTransformW(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags)
  end

  def createMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, indexPreferredCMM : UInt32) : LibC::IntPtrT
    C.CreateMultiProfileTransform(pahProfiles, nProfiles, padwIntent, nIntents, dwFlags, indexPreferredCMM)
  end

  def deleteColorTransform(hxform : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.DeleteColorTransform(hxform)
  end

  def translateBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, pDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, pfnCallBack : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.TranslateBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, pDestBits, bmOutput, dwOutputStride, pfnCallBack, ulCallbackData)
  end

  def checkBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, paResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, lpCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.CheckBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwStride, paResult, pfnCallback, lpCallbackData)
  end

  def translateColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL
    C.TranslateColors(hColorTransform, paInputColors, nColors, ctInput, paOutputColors, ctOutput)
  end

  def checkColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paResult : UInt8*) : Win32cr::Foundation::BOOL
    C.CheckColors(hColorTransform, paInputColors, nColors, ctInput, paResult)
  end

  def getCMMInfo(hColorTransform : LibC::IntPtrT, param1 : UInt32) : UInt32
    C.GetCMMInfo(hColorTransform, param1)
  end

  def registerCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.RegisterCMMA(pMachineName, cmmID, pCMMdll)
  end

  def registerCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.RegisterCMMW(pMachineName, cmmID, pCMMdll)
  end

  def unregisterCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL
    C.UnregisterCMMA(pMachineName, cmmID)
  end

  def unregisterCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL
    C.UnregisterCMMW(pMachineName, cmmID)
  end

  def selectCMM(dwCMMType : UInt32) : Win32cr::Foundation::BOOL
    C.SelectCMM(dwCMMType)
  end

  def getColorDirectoryA(pMachineName : Win32cr::Foundation::PSTR, pBuffer : Win32cr::Foundation::PSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetColorDirectoryA(pMachineName, pBuffer, pdwSize)
  end

  def getColorDirectoryW(pMachineName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::Foundation::PWSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetColorDirectoryW(pMachineName, pBuffer, pdwSize)
  end

  def installColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.InstallColorProfileA(pMachineName, pProfileName)
  end

  def installColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.InstallColorProfileW(pMachineName, pProfileName)
  end

  def uninstallColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.UninstallColorProfileA(pMachineName, pProfileName, bDelete)
  end

  def uninstallColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.UninstallColorProfileW(pMachineName, pProfileName, bDelete)
  end

  def enumColorProfilesA(pMachineName : Win32cr::Foundation::PSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEA*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL
    C.EnumColorProfilesA(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles)
  end

  def enumColorProfilesW(pMachineName : Win32cr::Foundation::PWSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL
    C.EnumColorProfilesW(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles)
  end

  def setStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwProfileID : UInt32, pProfilename : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetStandardColorSpaceProfileA(pMachineName, dwProfileID, pProfilename)
  end

  def setStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.SetStandardColorSpaceProfileW(pMachineName, dwProfileID, pProfileName)
  end

  def getStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetStandardColorSpaceProfileA(pMachineName, dwSCS, pBuffer, pcbSize)
  end

  def getStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PWSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetStandardColorSpaceProfileW(pMachineName, dwSCS, pBuffer, pcbSize)
  end

  def associateColorProfileWithDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.AssociateColorProfileWithDeviceA(pMachineName, pProfileName, pDeviceName)
  end

  def associateColorProfileWithDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.AssociateColorProfileWithDeviceW(pMachineName, pProfileName, pDeviceName)
  end

  def disassociateColorProfileFromDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.DisassociateColorProfileFromDeviceA(pMachineName, pProfileName, pDeviceName)
  end

  def disassociateColorProfileFromDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.DisassociateColorProfileFromDeviceW(pMachineName, pProfileName, pDeviceName)
  end

  def setupColorMatchingW(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPW*) : Win32cr::Foundation::BOOL
    C.SetupColorMatchingW(pcms)
  end

  def setupColorMatchingA(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPA*) : Win32cr::Foundation::BOOL
    C.SetupColorMatchingA(pcms)
  end

  def wcsAssociateColorProfileWithDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WcsAssociateColorProfileWithDevice(scope, pProfileName, pDeviceName)
  end

  def wcsDisassociateColorProfileFromDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WcsDisassociateColorProfileFromDevice(scope, pProfileName, pDeviceName)
  end

  def wcsEnumColorProfilesSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.WcsEnumColorProfilesSize(scope, pEnumRecord, pdwSize)
  end

  def wcsEnumColorProfiles(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pBuffer : UInt8*, dwSize : UInt32, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL
    C.WcsEnumColorProfiles(scope, pEnumRecord, pBuffer, dwSize, pnProfiles)
  end

  def wcsGetDefaultColorProfileSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pcbProfileName : UInt32*) : Win32cr::Foundation::BOOL
    C.WcsGetDefaultColorProfileSize(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pcbProfileName)
  end

  def wcsGetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, cbProfileName : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WcsGetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, cbProfileName, pProfileName)
  end

  def wcsSetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WcsSetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pProfileName)
  end

  def wcsSetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, dwRenderingIntent : UInt32) : Win32cr::Foundation::BOOL
    C.WcsSetDefaultRenderingIntent(scope, dwRenderingIntent)
  end

  def wcsGetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pdwRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL
    C.WcsGetDefaultRenderingIntent(scope, pdwRenderingIntent)
  end

  def wcsGetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, pUsePerUserProfiles : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.WcsGetUsePerUserProfiles(pDeviceName, dwDeviceClass, pUsePerUserProfiles)
  end

  def wcsSetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, usePerUserProfiles : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.WcsSetUsePerUserProfiles(pDeviceName, dwDeviceClass, usePerUserProfiles)
  end

  def wcsTranslateColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, nOutputChannels : UInt32, cdtOutput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbOutput : UInt32, pOutputData : Void*) : Win32cr::Foundation::BOOL
    C.WcsTranslateColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, nOutputChannels, cdtOutput, cbOutput, pOutputData)
  end

  def wcsCheckColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, paResult : UInt8*) : Win32cr::Foundation::BOOL
    C.WcsCheckColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, paResult)
  end

  def cMCheckColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaResult : UInt8*) : Win32cr::Foundation::BOOL
    C.CMCheckColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaResult)
  end

  def cMCheckRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpaResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.CMCheckRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpaResult, pfnCallback, ulCallbackData)
  end

  def cMConvertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL
    C.CMConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount)
  end

  def cMConvertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL
    C.CMConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount)
  end

  def cMCreateDeviceLinkProfile(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32, lpProfileData : UInt8**) : Win32cr::Foundation::BOOL
    C.CMCreateDeviceLinkProfile(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags, lpProfileData)
  end

  def cMCreateMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32) : LibC::IntPtrT
    C.CMCreateMultiProfileTransform(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags)
  end

  def cMCreateProfileW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpProfileData : Void**) : Win32cr::Foundation::BOOL
    C.CMCreateProfileW(lpColorSpace, lpProfileData)
  end

  def cMCreateTransform(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT
    C.CMCreateTransform(lpColorSpace, lpDevCharacter, lpTargetDevCharacter)
  end

  def cMCreateTransformW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT
    C.CMCreateTransformW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter)
  end

  def cMCreateTransformExt(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT
    C.CMCreateTransformExt(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags)
  end

  def cMCheckColorsInGamut(hcmTransform : LibC::IntPtrT, lpaRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, lpaResult : UInt8*, nCount : UInt32) : Win32cr::Foundation::BOOL
    C.CMCheckColorsInGamut(hcmTransform, lpaRGBTriple, lpaResult, nCount)
  end

  def cMCreateProfile(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpProfileData : Void**) : Win32cr::Foundation::BOOL
    C.CMCreateProfile(lpColorSpace, lpProfileData)
  end

  def cMTranslateRGB(hcmTransform : LibC::IntPtrT, color_ref : UInt32, lpColorRef : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CMTranslateRGB(hcmTransform, color_ref, lpColorRef, dwFlags)
  end

  def cMTranslateRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwTranslateDirection : UInt32) : Win32cr::Foundation::BOOL
    C.CMTranslateRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpDestBits, bmOutput, dwTranslateDirection)
  end

  def cMCreateTransformExtW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT
    C.CMCreateTransformExtW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags)
  end

  def cMDeleteTransform(hcmTransform : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.CMDeleteTransform(hcmTransform)
  end

  def cMGetInfo(dwInfo : UInt32) : UInt32
    C.CMGetInfo(dwInfo)
  end

  def cMGetNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL
    C.CMGetNamedProfileInfo(hProfile, pNamedProfileInfo)
  end

  def cMIsProfileValid(hProfile : LibC::IntPtrT, lpbValid : Int32*) : Win32cr::Foundation::BOOL
    C.CMIsProfileValid(hProfile, lpbValid)
  end

  def cMTranslateColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL
    C.CMTranslateColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaOutputColors, ctOutput)
  end

  def cMTranslateRGBsExt(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, lpfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.CMTranslateRGBsExt(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, lpDestBits, bmOutput, dwOutputStride, lpfnCallback, ulCallbackData)
  end

  def wcsOpenColorProfileA(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT
    C.WcsOpenColorProfileA(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags)
  end

  def wcsOpenColorProfileW(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT
    C.WcsOpenColorProfileW(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags)
  end

  def wcsCreateIccProfile(hWcsProfile : LibC::IntPtrT, dwOptions : UInt32) : LibC::IntPtrT
    C.WcsCreateIccProfile(hWcsProfile, dwOptions)
  end

  def wcsGetCalibrationManagementState(pbIsEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.WcsGetCalibrationManagementState(pbIsEnabled)
  end

  def wcsSetCalibrationManagementState(bIsEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.WcsSetCalibrationManagementState(bIsEnabled)
  end

  def colorProfileAddDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, setAsDefault : Win32cr::Foundation::BOOL, associateAsAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.ColorProfileAddDisplayAssociation(scope, profileName, targetAdapterID, sourceID, setAsDefault, associateAsAdvancedColor)
  end

  def colorProfileRemoveDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, dissociateAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.ColorProfileRemoveDisplayAssociation(scope, profileName, targetAdapterID, sourceID, dissociateAdvancedColor)
  end

  def colorProfileSetDisplayDefaultAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32) : Win32cr::Foundation::HRESULT
    C.ColorProfileSetDisplayDefaultAssociation(scope, profileName, profileType, profileSubType, targetAdapterID, sourceID)
  end

  def colorProfileGetDisplayList(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileList : Win32cr::Foundation::PWSTR**, profileCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.ColorProfileGetDisplayList(scope, targetAdapterID, sourceID, profileList, profileCount)
  end

  def colorProfileGetDisplayDefault(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, profileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.ColorProfileGetDisplayDefault(scope, targetAdapterID, sourceID, profileType, profileSubType, profileName)
  end

  def colorProfileGetDisplayUserScope(targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE*) : Win32cr::Foundation::HRESULT
    C.ColorProfileGetDisplayUserScope(targetAdapterID, sourceID, scope)
  end

  @[Link("gdi32")]
  @[Link("mscms")]
  @[Link("icmui")]
  @[Link("icm32")]
  lib C
    # :nodoc:
    fun SetICMMode(hdc : Win32cr::Graphics::Gdi::HDC, mode : Win32cr::UI::ColorSystem::ICM_MODE) : Int32

    # :nodoc:
    fun CheckColorsInGamut(hdc : Win32cr::Graphics::Gdi::HDC, lpRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, dlpBuffer : Void*, nCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorSpace(hdc : Win32cr::Graphics::Gdi::HDC) : Win32cr::UI::ColorSystem::HCOLORSPACE

    # :nodoc:
    fun GetLogColorSpaceA(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetLogColorSpaceW(hColorSpace : Win32cr::UI::ColorSystem::HCOLORSPACE, lpBuffer : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateColorSpaceA(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*) : Win32cr::UI::ColorSystem::HCOLORSPACE

    # :nodoc:
    fun CreateColorSpaceW(lplcs : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*) : Win32cr::UI::ColorSystem::HCOLORSPACE

    # :nodoc:
    fun SetColorSpace(hdc : Win32cr::Graphics::Gdi::HDC, hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::UI::ColorSystem::HCOLORSPACE

    # :nodoc:
    fun DeleteColorSpace(hcs : Win32cr::UI::ColorSystem::HCOLORSPACE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, pBufSize : UInt32*, pszFilename : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetICMProfileA(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetICMProfileW(hdc : Win32cr::Graphics::Gdi::HDC, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDeviceGammaRamp(hdc : Win32cr::Graphics::Gdi::HDC, lpRamp : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ColorMatchToTarget(hdc : Win32cr::Graphics::Gdi::HDC, hdcTarget : Win32cr::Graphics::Gdi::HDC, action : Win32cr::UI::ColorSystem::COLOR_MATCH_TO_TARGET_ACTION) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumICMProfilesA(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCA, param2 : Win32cr::Foundation::LPARAM) : Int32

    # :nodoc:
    fun EnumICMProfilesW(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::UI::ColorSystem::ICMENUMPROCW, param2 : Win32cr::Foundation::LPARAM) : Int32

    # :nodoc:
    fun UpdateICMRegKeyA(reserved : UInt32, lpszCMID : Win32cr::Foundation::PSTR, lpszFileName : Win32cr::Foundation::PSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UpdateICMRegKeyW(reserved : UInt32, lpszCMID : Win32cr::Foundation::PWSTR, lpszFileName : Win32cr::Foundation::PWSTR, command : Win32cr::UI::ColorSystem::ICM_COMMAND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ColorCorrectPalette(hdc : Win32cr::Graphics::Gdi::HDC, hPal : Win32cr::Graphics::Gdi::HPALETTE, deFirst : UInt32, num : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenColorProfileA(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun OpenColorProfileW(pProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesiredAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CloseColorProfile(hProfile : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorProfileFromHandle(hProfile : LibC::IntPtrT, pProfile : UInt8*, pcbProfile : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsColorProfileValid(hProfile : LibC::IntPtrT, pbValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateProfileFromLogColorSpaceA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, pProfile : UInt8**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateProfileFromLogColorSpaceW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, pProfile : UInt8**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCountColorProfileElements(hProfile : LibC::IntPtrT, pnElementCount : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorProfileElementTag(hProfile : LibC::IntPtrT, dwIndex : UInt32, pTag : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsColorProfileTagPresent(hProfile : LibC::IntPtrT, tag : UInt32, pbPresent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*, pbReference : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetColorProfileHeader(hProfile : LibC::IntPtrT, pHeader : Win32cr::UI::ColorSystem::PROFILEHEADER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetColorProfileElementSize(hProfile : LibC::IntPtrT, tagType : UInt32, pcbElement : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetColorProfileElement(hProfile : LibC::IntPtrT, tag : UInt32, dwOffset : UInt32, pcbElement : UInt32*, pElement : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetColorProfileElementReference(hProfile : LibC::IntPtrT, newTag : UInt32, refTag : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPS2ColorSpaceArray(hProfile : LibC::IntPtrT, dwIntent : UInt32, dwCSAType : UInt32, pPS2ColorSpaceArray : UInt8*, pcbPS2ColorSpaceArray : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPS2ColorRenderingIntent(hProfile : LibC::IntPtrT, dwIntent : UInt32, pBuffer : UInt8*, pcbPS2ColorRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPS2ColorRenderingDictionary(hProfile : LibC::IntPtrT, dwIntent : UInt32, pPS2ColorRenderingDictionary : UInt8*, pcbPS2ColorRenderingDictionary : UInt32*, pbBinary : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConvertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateDeviceLinkProfile(hProfile : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, pProfileData : UInt8**, indexPreferredCMM : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateColorTransformA(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CreateColorTransformW(pLogColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, hDestProfile : LibC::IntPtrT, hTargetProfile : LibC::IntPtrT, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CreateMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntent : UInt32*, nIntents : UInt32, dwFlags : UInt32, indexPreferredCMM : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun DeleteColorTransform(hxform : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TranslateBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, pDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, pfnCallBack : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckBitmapBits(hColorTransform : LibC::IntPtrT, pSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, paResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, lpCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TranslateColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckColors(hColorTransform : LibC::IntPtrT, paInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, paResult : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCMMInfo(hColorTransform : LibC::IntPtrT, param1 : UInt32) : UInt32

    # :nodoc:
    fun RegisterCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32, pCMMdll : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterCMMA(pMachineName : Win32cr::Foundation::PSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterCMMW(pMachineName : Win32cr::Foundation::PWSTR, cmmID : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SelectCMM(dwCMMType : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorDirectoryA(pMachineName : Win32cr::Foundation::PSTR, pBuffer : Win32cr::Foundation::PSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetColorDirectoryW(pMachineName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::Foundation::PWSTR, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InstallColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InstallColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UninstallColorProfileA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UninstallColorProfileW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, bDelete : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumColorProfilesA(pMachineName : Win32cr::Foundation::PSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEA*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumColorProfilesW(pMachineName : Win32cr::Foundation::PWSTR, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pEnumerationBuffer : UInt8*, pdwSizeOfEnumerationBuffer : UInt32*, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwProfileID : UInt32, pProfilename : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetStandardColorSpaceProfileA(pMachineName : Win32cr::Foundation::PSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetStandardColorSpaceProfileW(pMachineName : Win32cr::Foundation::PWSTR, dwSCS : UInt32, pBuffer : Win32cr::Foundation::PWSTR, pcbSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AssociateColorProfileWithDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AssociateColorProfileWithDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DisassociateColorProfileFromDeviceA(pMachineName : Win32cr::Foundation::PSTR, pProfileName : Win32cr::Foundation::PSTR, pDeviceName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DisassociateColorProfileFromDeviceW(pMachineName : Win32cr::Foundation::PWSTR, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetupColorMatchingW(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetupColorMatchingA(pcms : Win32cr::UI::ColorSystem::COLORMATCHSETUPA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsAssociateColorProfileWithDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsDisassociateColorProfileFromDevice(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pProfileName : Win32cr::Foundation::PWSTR, pDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsEnumColorProfilesSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsEnumColorProfiles(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pEnumRecord : Win32cr::UI::ColorSystem::ENUMTYPEW*, pBuffer : UInt8*, dwSize : UInt32, pnProfiles : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsGetDefaultColorProfileSize(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pcbProfileName : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsGetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, cbProfileName : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsSetDefaultColorProfile(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pDeviceName : Win32cr::Foundation::PWSTR, cptColorProfileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, cpstColorProfileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, dwProfileID : UInt32, pProfileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsSetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, dwRenderingIntent : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsGetDefaultRenderingIntent(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, pdwRenderingIntent : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsGetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, pUsePerUserProfiles : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsSetUsePerUserProfiles(pDeviceName : Win32cr::Foundation::PWSTR, dwDeviceClass : UInt32, usePerUserProfiles : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsTranslateColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, nOutputChannels : UInt32, cdtOutput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbOutput : UInt32, pOutputData : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsCheckColors(hColorTransform : LibC::IntPtrT, nColors : UInt32, nInputChannels : UInt32, cdtInput : Win32cr::UI::ColorSystem::COLORDATATYPE, cbInput : UInt32, pInputData : Void*, paResult : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCheckColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaResult : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCheckRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpaResult : UInt8*, pfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMConvertColorNameToIndex(hProfile : LibC::IntPtrT, paColorName : Int8**, paIndex : UInt32*, dwCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMConvertIndexToColorName(hProfile : LibC::IntPtrT, paIndex : UInt32*, paColorName : Int8**, dwCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCreateDeviceLinkProfile(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32, lpProfileData : UInt8**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCreateMultiProfileTransform(pahProfiles : LibC::IntPtrT*, nProfiles : UInt32, padwIntents : UInt32*, nIntents : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CMCreateProfileW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpProfileData : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCreateTransform(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT

    # :nodoc:
    fun CMCreateTransformW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*) : LibC::IntPtrT

    # :nodoc:
    fun CMCreateTransformExt(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CMCheckColorsInGamut(hcmTransform : LibC::IntPtrT, lpaRGBTriple : Win32cr::Graphics::Gdi::RGBTRIPLE*, lpaResult : UInt8*, nCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCreateProfile(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEA*, lpProfileData : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMTranslateRGB(hcmTransform : LibC::IntPtrT, color_ref : UInt32, lpColorRef : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMTranslateRGBs(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwTranslateDirection : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMCreateTransformExtW(lpColorSpace : Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, lpDevCharacter : Void*, lpTargetDevCharacter : Void*, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CMDeleteTransform(hcmTransform : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMGetInfo(dwInfo : UInt32) : UInt32

    # :nodoc:
    fun CMGetNamedProfileInfo(hProfile : LibC::IntPtrT, pNamedProfileInfo : Win32cr::UI::ColorSystem::NAMED_PROFILE_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMIsProfileValid(hProfile : LibC::IntPtrT, lpbValid : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMTranslateColors(hcmTransform : LibC::IntPtrT, lpaInputColors : Win32cr::UI::ColorSystem::COLOR*, nColors : UInt32, ctInput : Win32cr::UI::ColorSystem::COLORTYPE, lpaOutputColors : Win32cr::UI::ColorSystem::COLOR*, ctOutput : Win32cr::UI::ColorSystem::COLORTYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CMTranslateRGBsExt(hcmTransform : LibC::IntPtrT, lpSrcBits : Void*, bmInput : Win32cr::UI::ColorSystem::BMFORMAT, dwWidth : UInt32, dwHeight : UInt32, dwInputStride : UInt32, lpDestBits : Void*, bmOutput : Win32cr::UI::ColorSystem::BMFORMAT, dwOutputStride : UInt32, lpfnCallback : Win32cr::UI::ColorSystem::LPBMCALLBACKFN, ulCallbackData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsOpenColorProfileA(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun WcsOpenColorProfileW(pCDMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pCAMPProfile : Win32cr::UI::ColorSystem::PROFILE*, pGMMPProfile : Win32cr::UI::ColorSystem::PROFILE*, dwDesireAccess : UInt32, dwShareMode : UInt32, dwCreationMode : UInt32, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun WcsCreateIccProfile(hWcsProfile : LibC::IntPtrT, dwOptions : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun WcsGetCalibrationManagementState(pbIsEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WcsSetCalibrationManagementState(bIsEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ColorProfileAddDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, setAsDefault : Win32cr::Foundation::BOOL, associateAsAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ColorProfileRemoveDisplayAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, dissociateAdvancedColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ColorProfileSetDisplayDefaultAssociation(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, profileName : Win32cr::Foundation::PWSTR, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ColorProfileGetDisplayList(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileList : Win32cr::Foundation::PWSTR**, profileCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ColorProfileGetDisplayDefault(scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE, targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, profileType : Win32cr::UI::ColorSystem::COLORPROFILETYPE, profileSubType : Win32cr::UI::ColorSystem::COLORPROFILESUBTYPE, profileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ColorProfileGetDisplayUserScope(targetAdapterID : Win32cr::Foundation::LUID, sourceID : UInt32, scope : Win32cr::UI::ColorSystem::WCS_PROFILE_MANAGEMENT_SCOPE*) : Win32cr::Foundation::HRESULT

  end
end