require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../system/com.cr"
require "./packaging/opc.cr"
require "./../security.cr"
require "./../security/cryptography.cr"

module Win32cr::Storage::Xps
  extend self
  alias HPTPROVIDER = LibC::IntPtrT
  alias ABORTPROC = Proc(Win32cr::Graphics::Gdi::HDC, Int32, Win32cr::Foundation::BOOL)

  XPS_E_SIGREQUESTID_DUP = -2142108795_i32
  XPS_E_PACKAGE_NOT_OPENED = -2142108794_i32
  XPS_E_PACKAGE_ALREADY_OPENED = -2142108793_i32
  XPS_E_SIGNATUREID_DUP = -2142108792_i32
  XPS_E_MARKUP_COMPATIBILITY_ELEMENTS = -2142108791_i32
  XPS_E_OBJECT_DETACHED = -2142108790_i32
  XPS_E_INVALID_SIGNATUREBLOCK_MARKUP = -2142108789_i32
  XPS_E_INVALID_NUMBER_OF_POINTS_IN_CURVE_SEGMENTS = -2142108160_i32
  XPS_E_ABSOLUTE_REFERENCE = -2142108159_i32
  XPS_E_INVALID_NUMBER_OF_COLOR_CHANNELS = -2142108158_i32
  XPS_E_INVALID_LANGUAGE = -2142109696_i32
  XPS_E_INVALID_NAME = -2142109695_i32
  XPS_E_INVALID_RESOURCE_KEY = -2142109694_i32
  XPS_E_INVALID_PAGE_SIZE = -2142109693_i32
  XPS_E_INVALID_BLEED_BOX = -2142109692_i32
  XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE = -2142109691_i32
  XPS_E_INVALID_LOOKUP_TYPE = -2142109690_i32
  XPS_E_INVALID_FLOAT = -2142109689_i32
  XPS_E_UNEXPECTED_CONTENT_TYPE = -2142109688_i32
  XPS_E_INVALID_FONT_URI = -2142109686_i32
  XPS_E_INVALID_CONTENT_BOX = -2142109685_i32
  XPS_E_INVALID_MARKUP = -2142109684_i32
  XPS_E_INVALID_XML_ENCODING = -2142109683_i32
  XPS_E_INVALID_CONTENT_TYPE = -2142109682_i32
  XPS_E_INVALID_OBFUSCATED_FONT_URI = -2142109681_i32
  XPS_E_UNEXPECTED_RELATIONSHIP_TYPE = -2142109680_i32
  XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP = -2142109679_i32
  XPS_E_MISSING_NAME = -2142109440_i32
  XPS_E_MISSING_LOOKUP = -2142109439_i32
  XPS_E_MISSING_GLYPHS = -2142109438_i32
  XPS_E_MISSING_SEGMENT_DATA = -2142109437_i32
  XPS_E_MISSING_COLORPROFILE = -2142109436_i32
  XPS_E_MISSING_RELATIONSHIP_TARGET = -2142109435_i32
  XPS_E_MISSING_RESOURCE_RELATIONSHIP = -2142109434_i32
  XPS_E_MISSING_FONTURI = -2142109433_i32
  XPS_E_MISSING_DOCUMENTSEQUENCE_RELATIONSHIP = -2142109432_i32
  XPS_E_MISSING_DOCUMENT = -2142109431_i32
  XPS_E_MISSING_REFERRED_DOCUMENT = -2142109430_i32
  XPS_E_MISSING_REFERRED_PAGE = -2142109429_i32
  XPS_E_MISSING_PAGE_IN_DOCUMENT = -2142109428_i32
  XPS_E_MISSING_PAGE_IN_PAGEREFERENCE = -2142109427_i32
  XPS_E_MISSING_IMAGE_IN_IMAGEBRUSH = -2142109426_i32
  XPS_E_MISSING_RESOURCE_KEY = -2142109425_i32
  XPS_E_MISSING_PART_REFERENCE = -2142109424_i32
  XPS_E_MISSING_RESTRICTED_FONT_RELATIONSHIP = -2142109423_i32
  XPS_E_MISSING_DISCARDCONTROL = -2142109422_i32
  XPS_E_MISSING_PART_STREAM = -2142109421_i32
  XPS_E_UNAVAILABLE_PACKAGE = -2142109420_i32
  XPS_E_DUPLICATE_RESOURCE_KEYS = -2142109184_i32
  XPS_E_MULTIPLE_RESOURCES = -2142109183_i32
  XPS_E_MULTIPLE_DOCUMENTSEQUENCE_RELATIONSHIPS = -2142109182_i32
  XPS_E_MULTIPLE_THUMBNAILS_ON_PAGE = -2142109181_i32
  XPS_E_MULTIPLE_THUMBNAILS_ON_PACKAGE = -2142109180_i32
  XPS_E_MULTIPLE_PRINTTICKETS_ON_PAGE = -2142109179_i32
  XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENT = -2142109178_i32
  XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENTSEQUENCE = -2142109177_i32
  XPS_E_MULTIPLE_REFERENCES_TO_PART = -2142109176_i32
  XPS_E_DUPLICATE_NAMES = -2142109175_i32
  XPS_E_STRING_TOO_LONG = -2142108928_i32
  XPS_E_TOO_MANY_INDICES = -2142108927_i32
  XPS_E_MAPPING_OUT_OF_ORDER = -2142108926_i32
  XPS_E_MAPPING_OUTSIDE_STRING = -2142108925_i32
  XPS_E_MAPPING_OUTSIDE_INDICES = -2142108924_i32
  XPS_E_CARET_OUTSIDE_STRING = -2142108923_i32
  XPS_E_CARET_OUT_OF_ORDER = -2142108922_i32
  XPS_E_ODD_BIDILEVEL = -2142108921_i32
  XPS_E_ONE_TO_ONE_MAPPING_EXPECTED = -2142108920_i32
  XPS_E_RESTRICTED_FONT_NOT_OBFUSCATED = -2142108919_i32
  XPS_E_NEGATIVE_FLOAT = -2142108918_i32
  XPS_E_XKEY_ATTR_PRESENT_OUTSIDE_RES_DICT = -2142108672_i32
  XPS_E_DICTIONARY_ITEM_NAMED = -2142108671_i32
  XPS_E_NESTED_REMOTE_DICTIONARY = -2142108670_i32
  XPS_E_INDEX_OUT_OF_RANGE = -2142108416_i32
  XPS_E_VISUAL_CIRCULAR_REF = -2142108415_i32
  XPS_E_NO_CUSTOM_OBJECTS = -2142108414_i32
  XPS_E_ALREADY_OWNED = -2142108413_i32
  XPS_E_RESOURCE_NOT_OWNED = -2142108412_i32
  XPS_E_UNEXPECTED_COLORPROFILE = -2142108411_i32
  XPS_E_COLOR_COMPONENT_OUT_OF_RANGE = -2142108410_i32
  XPS_E_BOTH_PATHFIGURE_AND_ABBR_SYNTAX_PRESENT = -2142108409_i32
  XPS_E_BOTH_RESOURCE_AND_SOURCEATTR_PRESENT = -2142108408_i32
  XPS_E_BLEED_BOX_PAGE_DIMENSIONS_NOT_IN_SYNC = -2142108407_i32
  XPS_E_RELATIONSHIP_EXTERNAL = -2142108406_i32
  XPS_E_NOT_ENOUGH_GRADIENT_STOPS = -2142108405_i32
  XPS_E_PACKAGE_WRITER_NOT_CLOSED = -2142108404_i32

  CLSID_XpsOMObjectFactory = LibC::GUID.new(0xe974d26d_u32, 0x3d9b_u16, 0x4d47_u16, StaticArray[0x88_u8, 0xcc_u8, 0x38_u8, 0x72_u8, 0xf2_u8, 0xdc_u8, 0x35_u8, 0x85_u8])

  CLSID_XpsOMThumbnailGenerator = LibC::GUID.new(0x7e4a23e2_u32, 0xb969_u16, 0x4761_u16, StaticArray[0xbe_u8, 0x35_u8, 0x1a_u8, 0x8c_u8, 0xed_u8, 0x58_u8, 0xe3_u8, 0x23_u8])

  CLSID_XpsSignatureManager = LibC::GUID.new(0xb0c43320_u32, 0x2315_u16, 0x44a2_u16, StaticArray[0xb7_u8, 0xa_u8, 0x9_u8, 0x43_u8, 0xa1_u8, 0x40_u8, 0xa8_u8, 0xee_u8])

  enum PRINT_WINDOW_FLAGS : UInt32
    PW_CLIENTONLY = 1_u32
  end
  enum DEVICE_CAPABILITIES : UInt32
    DC_BINNAMES = 12_u32
    DC_BINS = 6_u32
    DC_COLLATE = 22_u32
    DC_COLORDEVICE = 32_u32
    DC_COPIES = 18_u32
    DC_DRIVER = 11_u32
    DC_DUPLEX = 7_u32
    DC_ENUMRESOLUTIONS = 13_u32
    DC_EXTRA = 9_u32
    DC_FIELDS = 1_u32
    DC_FILEDEPENDENCIES = 14_u32
    DC_MAXEXTENT = 5_u32
    DC_MEDIAREADY = 29_u32
    DC_MEDIATYPENAMES = 34_u32
    DC_MEDIATYPES = 35_u32
    DC_MINEXTENT = 4_u32
    DC_ORIENTATION = 17_u32
    DC_NUP = 33_u32
    DC_PAPERNAMES = 16_u32
    DC_PAPERS = 2_u32
    DC_PAPERSIZE = 3_u32
    DC_PERSONALITY = 25_u32
    DC_PRINTERMEM = 28_u32
    DC_PRINTRATE = 26_u32
    DC_PRINTRATEPPM = 31_u32
    DC_PRINTRATEUNIT = 27_u32
    DC_SIZE = 8_u32
    DC_STAPLE = 30_u32
    DC_TRUETYPE = 15_u32
    DC_VERSION = 10_u32
  end
  @[Flags]
  enum PSINJECT_POINT : UInt16
    PSINJECT_BEGINSTREAM = 1_u16
    PSINJECT_PSADOBE = 2_u16
    PSINJECT_PAGESATEND = 3_u16
    PSINJECT_PAGES = 4_u16
    PSINJECT_DOCNEEDEDRES = 5_u16
    PSINJECT_DOCSUPPLIEDRES = 6_u16
    PSINJECT_PAGEORDER = 7_u16
    PSINJECT_ORIENTATION = 8_u16
    PSINJECT_BOUNDINGBOX = 9_u16
    PSINJECT_DOCUMENTPROCESSCOLORS = 10_u16
    PSINJECT_COMMENTS = 11_u16
    PSINJECT_BEGINDEFAULTS = 12_u16
    PSINJECT_ENDDEFAULTS = 13_u16
    PSINJECT_BEGINPROLOG = 14_u16
    PSINJECT_ENDPROLOG = 15_u16
    PSINJECT_BEGINSETUP = 16_u16
    PSINJECT_ENDSETUP = 17_u16
    PSINJECT_TRAILER = 18_u16
    PSINJECT_EOF = 19_u16
    PSINJECT_ENDSTREAM = 20_u16
    PSINJECT_DOCUMENTPROCESSCOLORSATEND = 21_u16
    PSINJECT_PAGENUMBER = 100_u16
    PSINJECT_BEGINPAGESETUP = 101_u16
    PSINJECT_ENDPAGESETUP = 102_u16
    PSINJECT_PAGETRAILER = 103_u16
    PSINJECT_PLATECOLOR = 104_u16
    PSINJECT_SHOWPAGE = 105_u16
    PSINJECT_PAGEBBOX = 106_u16
    PSINJECT_ENDPAGECOMMENTS = 107_u16
    PSINJECT_VMSAVE = 200_u16
    PSINJECT_VMRESTORE = 201_u16
  end
  enum XPS_TILE_MODE
    XPS_TILE_MODE_NONE = 1_i32
    XPS_TILE_MODE_TILE = 2_i32
    XPS_TILE_MODE_FLIPX = 3_i32
    XPS_TILE_MODE_FLIPY = 4_i32
    XPS_TILE_MODE_FLIPXY = 5_i32
  end
  enum XPS_COLOR_INTERPOLATION
    XPS_COLOR_INTERPOLATION_SCRGBLINEAR = 1_i32
    XPS_COLOR_INTERPOLATION_SRGBLINEAR = 2_i32
  end
  enum XPS_SPREAD_METHOD
    XPS_SPREAD_METHOD_PAD = 1_i32
    XPS_SPREAD_METHOD_REFLECT = 2_i32
    XPS_SPREAD_METHOD_REPEAT = 3_i32
  end
  enum XPS_STYLE_SIMULATION
    XPS_STYLE_SIMULATION_NONE = 1_i32
    XPS_STYLE_SIMULATION_ITALIC = 2_i32
    XPS_STYLE_SIMULATION_BOLD = 3_i32
    XPS_STYLE_SIMULATION_BOLDITALIC = 4_i32
  end
  enum XPS_LINE_CAP
    XPS_LINE_CAP_FLAT = 1_i32
    XPS_LINE_CAP_ROUND = 2_i32
    XPS_LINE_CAP_SQUARE = 3_i32
    XPS_LINE_CAP_TRIANGLE = 4_i32
  end
  enum XPS_DASH_CAP
    XPS_DASH_CAP_FLAT = 1_i32
    XPS_DASH_CAP_ROUND = 2_i32
    XPS_DASH_CAP_SQUARE = 3_i32
    XPS_DASH_CAP_TRIANGLE = 4_i32
  end
  enum XPS_LINE_JOIN
    XPS_LINE_JOIN_MITER = 1_i32
    XPS_LINE_JOIN_BEVEL = 2_i32
    XPS_LINE_JOIN_ROUND = 3_i32
  end
  enum XPS_IMAGE_TYPE
    XPS_IMAGE_TYPE_JPEG = 1_i32
    XPS_IMAGE_TYPE_PNG = 2_i32
    XPS_IMAGE_TYPE_TIFF = 3_i32
    XPS_IMAGE_TYPE_WDP = 4_i32
    XPS_IMAGE_TYPE_JXR = 5_i32
  end
  enum XPS_COLOR_TYPE
    XPS_COLOR_TYPE_SRGB = 1_i32
    XPS_COLOR_TYPE_SCRGB = 2_i32
    XPS_COLOR_TYPE_CONTEXT = 3_i32
  end
  enum XPS_FILL_RULE
    XPS_FILL_RULE_EVENODD = 1_i32
    XPS_FILL_RULE_NONZERO = 2_i32
  end
  enum XPS_SEGMENT_TYPE
    XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE = 1_i32
    XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE = 2_i32
    XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE = 3_i32
    XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE = 4_i32
    XPS_SEGMENT_TYPE_BEZIER = 5_i32
    XPS_SEGMENT_TYPE_LINE = 6_i32
    XPS_SEGMENT_TYPE_QUADRATIC_BEZIER = 7_i32
  end
  enum XPS_SEGMENT_STROKE_PATTERN
    XPS_SEGMENT_STROKE_PATTERN_ALL = 1_i32
    XPS_SEGMENT_STROKE_PATTERN_NONE = 2_i32
    XPS_SEGMENT_STROKE_PATTERN_MIXED = 3_i32
  end
  enum XPS_FONT_EMBEDDING
    XPS_FONT_EMBEDDING_NORMAL = 1_i32
    XPS_FONT_EMBEDDING_OBFUSCATED = 2_i32
    XPS_FONT_EMBEDDING_RESTRICTED = 3_i32
    XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED = 4_i32
  end
  enum XPS_OBJECT_TYPE
    XPS_OBJECT_TYPE_CANVAS = 1_i32
    XPS_OBJECT_TYPE_GLYPHS = 2_i32
    XPS_OBJECT_TYPE_PATH = 3_i32
    XPS_OBJECT_TYPE_MATRIX_TRANSFORM = 4_i32
    XPS_OBJECT_TYPE_GEOMETRY = 5_i32
    XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH = 6_i32
    XPS_OBJECT_TYPE_IMAGE_BRUSH = 7_i32
    XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH = 8_i32
    XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH = 9_i32
    XPS_OBJECT_TYPE_VISUAL_BRUSH = 10_i32
  end
  enum XPS_THUMBNAIL_SIZE
    XPS_THUMBNAIL_SIZE_VERYSMALL = 1_i32
    XPS_THUMBNAIL_SIZE_SMALL = 2_i32
    XPS_THUMBNAIL_SIZE_MEDIUM = 3_i32
    XPS_THUMBNAIL_SIZE_LARGE = 4_i32
  end
  enum XPS_INTERLEAVING
    XPS_INTERLEAVING_OFF = 1_i32
    XPS_INTERLEAVING_ON = 2_i32
  end
  enum XPS_DOCUMENT_TYPE
    XPS_DOCUMENT_TYPE_UNSPECIFIED = 1_i32
    XPS_DOCUMENT_TYPE_XPS = 2_i32
    XPS_DOCUMENT_TYPE_OPENXPS = 3_i32
  end
  enum XPS_SIGNATURE_STATUS
    XPS_SIGNATURE_STATUS_INCOMPLIANT = 1_i32
    XPS_SIGNATURE_STATUS_INCOMPLETE = 2_i32
    XPS_SIGNATURE_STATUS_BROKEN = 3_i32
    XPS_SIGNATURE_STATUS_QUESTIONABLE = 4_i32
    XPS_SIGNATURE_STATUS_VALID = 5_i32
  end
  enum XPS_SIGN_POLICY
    XPS_SIGN_POLICY_NONE = 0_i32
    XPS_SIGN_POLICY_CORE_PROPERTIES = 1_i32
    XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS = 2_i32
    XPS_SIGN_POLICY_PRINT_TICKET = 4_i32
    XPS_SIGN_POLICY_DISCARD_CONTROL = 8_i32
    XPS_SIGN_POLICY_ALL = 15_i32
  end
  enum XPS_SIGN_FLAGS
    XPS_SIGN_FLAGS_NONE = 0_i32
    XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY = 1_i32
  end

  @[Extern]
  struct DRAWPATRECT
    property ptPosition : Win32cr::Foundation::POINT
    property ptSize : Win32cr::Foundation::POINT
    property wStyle : UInt16
    property wPattern : UInt16
    def initialize(@ptPosition : Win32cr::Foundation::POINT, @ptSize : Win32cr::Foundation::POINT, @wStyle : UInt16, @wPattern : UInt16)
    end
  end

  @[Extern]
  struct PSINJECTDATA
    property data_bytes : UInt32
    property injection_point : Win32cr::Storage::Xps::PSINJECT_POINT
    property page_number : UInt16
    def initialize(@data_bytes : UInt32, @injection_point : Win32cr::Storage::Xps::PSINJECT_POINT, @page_number : UInt16)
    end
  end

  @[Extern]
  struct PSFEATURE_OUTPUT
    property bPageIndependent : Win32cr::Foundation::BOOL
    property bSetPageDevice : Win32cr::Foundation::BOOL
    def initialize(@bPageIndependent : Win32cr::Foundation::BOOL, @bSetPageDevice : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct PSFEATURE_CUSTPAPER
    property lOrientation : Int32
    property lWidth : Int32
    property lHeight : Int32
    property lWidthOffset : Int32
    property lHeightOffset : Int32
    def initialize(@lOrientation : Int32, @lWidth : Int32, @lHeight : Int32, @lWidthOffset : Int32, @lHeightOffset : Int32)
    end
  end

  @[Extern]
  struct DOCINFOA
    property cbSize : Int32
    property lpszDocName : Win32cr::Foundation::PSTR
    property lpszOutput : Win32cr::Foundation::PSTR
    property lpszDatatype : Win32cr::Foundation::PSTR
    property fwType : UInt32
    def initialize(@cbSize : Int32, @lpszDocName : Win32cr::Foundation::PSTR, @lpszOutput : Win32cr::Foundation::PSTR, @lpszDatatype : Win32cr::Foundation::PSTR, @fwType : UInt32)
    end
  end

  @[Extern]
  struct DOCINFOW
    property cbSize : Int32
    property lpszDocName : Win32cr::Foundation::PWSTR
    property lpszOutput : Win32cr::Foundation::PWSTR
    property lpszDatatype : Win32cr::Foundation::PWSTR
    property fwType : UInt32
    def initialize(@cbSize : Int32, @lpszDocName : Win32cr::Foundation::PWSTR, @lpszOutput : Win32cr::Foundation::PWSTR, @lpszDatatype : Win32cr::Foundation::PWSTR, @fwType : UInt32)
    end
  end

  @[Extern]
  struct XPS_POINT
    property x : Float32
    property y : Float32
    def initialize(@x : Float32, @y : Float32)
    end
  end

  @[Extern]
  struct XPS_SIZE
    property width : Float32
    property height : Float32
    def initialize(@width : Float32, @height : Float32)
    end
  end

  @[Extern]
  struct XPS_RECT
    property x : Float32
    property y : Float32
    property width : Float32
    property height : Float32
    def initialize(@x : Float32, @y : Float32, @width : Float32, @height : Float32)
    end
  end

  @[Extern]
  struct XPS_DASH
    property length : Float32
    property gap : Float32
    def initialize(@length : Float32, @gap : Float32)
    end
  end

  @[Extern]
  struct XPS_GLYPH_INDEX
    property index : Int32
    property advanceWidth : Float32
    property horizontalOffset : Float32
    property verticalOffset : Float32
    def initialize(@index : Int32, @advanceWidth : Float32, @horizontalOffset : Float32, @verticalOffset : Float32)
    end
  end

  @[Extern]
  struct XPS_GLYPH_MAPPING
    property unicodeStringStart : UInt32
    property unicodeStringLength : UInt16
    property glyphIndicesStart : UInt32
    property glyphIndicesLength : UInt16
    def initialize(@unicodeStringStart : UInt32, @unicodeStringLength : UInt16, @glyphIndicesStart : UInt32, @glyphIndicesLength : UInt16)
    end
  end

  @[Extern]
  struct XPS_MATRIX
    property m11 : Float32
    property m12 : Float32
    property m21 : Float32
    property m22 : Float32
    property m31 : Float32
    property m32 : Float32
    def initialize(@m11 : Float32, @m12 : Float32, @m21 : Float32, @m22 : Float32, @m31 : Float32, @m32 : Float32)
    end
  end

  @[Extern]
  struct XPS_COLOR
    property colorType : Win32cr::Storage::Xps::XPS_COLOR_TYPE
    property value : XPS_COLOR_VALUE

    # Nested Type XPS_COLOR_VALUE
    @[Extern(union: true)]
    struct XPS_COLOR_VALUE
    property sRGB : Srgb_e__struct_
    property scRGB : Scrgb_e__struct_
    property context : Context_e__struct_

      # Nested Type Scrgb_e__struct_
      @[Extern]
      struct Scrgb_e__struct_
    property alpha : Float32
    property red : Float32
    property green : Float32
    property blue : Float32
    def initialize(@alpha : Float32, @red : Float32, @green : Float32, @blue : Float32)
    end
      end


      # Nested Type Srgb_e__struct_
      @[Extern]
      struct Srgb_e__struct_
    property alpha : UInt8
    property red : UInt8
    property green : UInt8
    property blue : UInt8
    def initialize(@alpha : UInt8, @red : UInt8, @green : UInt8, @blue : UInt8)
    end
      end


      # Nested Type Context_e__struct_
      @[Extern]
      struct Context_e__struct_
    property channelCount : UInt8
    property channels : Float32[9]
    def initialize(@channelCount : UInt8, @channels : Float32[9])
    end
      end

    def initialize(@sRGB : Srgb_e__struct_, @scRGB : Scrgb_e__struct_, @context : Context_e__struct_)
    end
    end

    def initialize(@colorType : Win32cr::Storage::Xps::XPS_COLOR_TYPE, @value : XPS_COLOR_VALUE)
    end
  end

  @[Extern]
  record IXpsOMShareableVtbl,
    query_interface : Proc(IXpsOMShareable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMShareable*, UInt32),
    release : Proc(IXpsOMShareable*, UInt32),
    get_owner : Proc(IXpsOMShareable*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMShareable*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMShareable, lpVtbl : IXpsOMShareableVtbl* do
    GUID = LibC::GUID.new(0x7137398f_u32, 0x2fc1_u16, 0x454d_u16, StaticArray[0x8c_u8, 0x6a_u8, 0x2c_u8, 0x31_u8, 0x15_u8, 0xa1_u8, 0x6e_u8, 0xce_u8])
    def query_interface(this : IXpsOMShareable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMShareable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMShareable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMShareable*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMShareable*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end

  end

  @[Extern]
  record IXpsOMVisualVtbl,
    query_interface : Proc(IXpsOMVisual*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMVisual*, UInt32),
    release : Proc(IXpsOMVisual*, UInt32),
    get_owner : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMVisual*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMVisual*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_clip_geometry : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    get_clip_geometry_local : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    set_clip_geometry_local : Proc(IXpsOMVisual*, Void*, Win32cr::Foundation::HRESULT),
    get_clip_geometry_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_clip_geometry_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMVisual*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMVisual*, Float32, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_local : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_local : Proc(IXpsOMVisual*, Void*, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_lookup : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMVisual*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMVisual*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_hyperlink_navigate_uri : Proc(IXpsOMVisual*, Void**, Win32cr::Foundation::HRESULT),
    set_hyperlink_navigate_uri : Proc(IXpsOMVisual*, Void*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMVisual*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMVisual, lpVtbl : IXpsOMVisualVtbl* do
    GUID = LibC::GUID.new(0xbc3e7333_u32, 0xfb0b_u16, 0x4af3_u16, StaticArray[0xa8_u8, 0x19_u8, 0xb_u8, 0x4e_u8, 0xaa_u8, 0xd0_u8, 0xd2_u8, 0xfd_u8])
    def query_interface(this : IXpsOMVisual*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMVisual*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMVisual*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMVisual*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMVisual*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_transform(this : IXpsOMVisual*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, matrixTransform)
    end
    def get_transform_local(this : IXpsOMVisual*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, matrixTransform)
    end
    def set_transform_local(this : IXpsOMVisual*, matrixTransform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, matrixTransform)
    end
    def get_transform_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_clip_geometry(this : IXpsOMVisual*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry.call(this, clipGeometry)
    end
    def get_clip_geometry_local(this : IXpsOMVisual*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_local.call(this, clipGeometry)
    end
    def set_clip_geometry_local(this : IXpsOMVisual*, clipGeometry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_local.call(this, clipGeometry)
    end
    def get_clip_geometry_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_lookup.call(this, key)
    end
    def set_clip_geometry_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_lookup.call(this, key)
    end
    def get_opacity(this : IXpsOMVisual*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMVisual*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_opacity_mask_brush(this : IXpsOMVisual*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_local(this : IXpsOMVisual*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def set_opacity_mask_brush_local(this : IXpsOMVisual*, opacityMaskBrush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_lookup.call(this, key)
    end
    def set_opacity_mask_brush_lookup(this : IXpsOMVisual*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_lookup.call(this, key)
    end
    def get_name(this : IXpsOMVisual*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMVisual*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMVisual*, isHyperlink : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlink)
    end
    def set_is_hyperlink_target(this : IXpsOMVisual*, isHyperlink : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlink)
    end
    def get_hyperlink_navigate_uri(this : IXpsOMVisual*, hyperlinkUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def set_hyperlink_navigate_uri(this : IXpsOMVisual*, hyperlinkUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def get_language(this : IXpsOMVisual*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMVisual*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end

  end

  @[Extern]
  record IXpsOMPartVtbl,
    query_interface : Proc(IXpsOMPart*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPart*, UInt32),
    release : Proc(IXpsOMPart*, UInt32),
    get_part_name : Proc(IXpsOMPart*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMPart*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPart, lpVtbl : IXpsOMPartVtbl* do
    GUID = LibC::GUID.new(0x74eb2f0b_u32, 0xa91e_u16, 0x4486_u16, StaticArray[0xaf_u8, 0xac_u8, 0xf_u8, 0xab_u8, 0xec_u8, 0xa3_u8, 0xdf_u8, 0xc6_u8])
    def query_interface(this : IXpsOMPart*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPart*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPart*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMPart*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMPart*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end

  end

  @[Extern]
  record IXpsOMGlyphsEditorVtbl,
    query_interface : Proc(IXpsOMGlyphsEditor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGlyphsEditor*, UInt32),
    release : Proc(IXpsOMGlyphsEditor*, UInt32),
    apply_edits : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::HRESULT),
    get_unicode_string : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_unicode_string : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_glyph_index_count : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_glyph_indices : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Storage::Xps::XPS_GLYPH_INDEX*, Win32cr::Foundation::HRESULT),
    set_glyph_indices : Proc(IXpsOMGlyphsEditor*, UInt32, Win32cr::Storage::Xps::XPS_GLYPH_INDEX*, Win32cr::Foundation::HRESULT),
    get_glyph_mapping_count : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_glyph_mappings : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*, Win32cr::Foundation::HRESULT),
    set_glyph_mappings : Proc(IXpsOMGlyphsEditor*, UInt32, Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*, Win32cr::Foundation::HRESULT),
    get_prohibited_caret_stop_count : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prohibited_caret_stops : Proc(IXpsOMGlyphsEditor*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_prohibited_caret_stops : Proc(IXpsOMGlyphsEditor*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_bidi_level : Proc(IXpsOMGlyphsEditor*, UInt32*, Win32cr::Foundation::HRESULT),
    set_bidi_level : Proc(IXpsOMGlyphsEditor*, UInt32, Win32cr::Foundation::HRESULT),
    get_is_sideways : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_sideways : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_device_font_name : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_device_font_name : Proc(IXpsOMGlyphsEditor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGlyphsEditor, lpVtbl : IXpsOMGlyphsEditorVtbl* do
    GUID = LibC::GUID.new(0xa5ab8616_u32, 0x5b16_u16, 0x4b9f_u16, StaticArray[0x96_u8, 0x29_u8, 0x89_u8, 0xb3_u8, 0x23_u8, 0xed_u8, 0x79_u8, 0x9_u8])
    def query_interface(this : IXpsOMGlyphsEditor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGlyphsEditor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGlyphsEditor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def apply_edits(this : IXpsOMGlyphsEditor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_edits.call(this)
    end
    def get_unicode_string(this : IXpsOMGlyphsEditor*, unicodeString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unicode_string.call(this, unicodeString)
    end
    def set_unicode_string(this : IXpsOMGlyphsEditor*, unicodeString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_unicode_string.call(this, unicodeString)
    end
    def get_glyph_index_count(this : IXpsOMGlyphsEditor*, indexCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_index_count.call(this, indexCount)
    end
    def get_glyph_indices(this : IXpsOMGlyphsEditor*, indexCount : UInt32*, glyphIndices : Win32cr::Storage::Xps::XPS_GLYPH_INDEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_indices.call(this, indexCount, glyphIndices)
    end
    def set_glyph_indices(this : IXpsOMGlyphsEditor*, indexCount : UInt32, glyphIndices : Win32cr::Storage::Xps::XPS_GLYPH_INDEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_glyph_indices.call(this, indexCount, glyphIndices)
    end
    def get_glyph_mapping_count(this : IXpsOMGlyphsEditor*, glyphMappingCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_mapping_count.call(this, glyphMappingCount)
    end
    def get_glyph_mappings(this : IXpsOMGlyphsEditor*, glyphMappingCount : UInt32*, glyphMappings : Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_mappings.call(this, glyphMappingCount, glyphMappings)
    end
    def set_glyph_mappings(this : IXpsOMGlyphsEditor*, glyphMappingCount : UInt32, glyphMappings : Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_glyph_mappings.call(this, glyphMappingCount, glyphMappings)
    end
    def get_prohibited_caret_stop_count(this : IXpsOMGlyphsEditor*, prohibitedCaretStopCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prohibited_caret_stop_count.call(this, prohibitedCaretStopCount)
    end
    def get_prohibited_caret_stops(this : IXpsOMGlyphsEditor*, count : UInt32*, prohibitedCaretStops : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prohibited_caret_stops.call(this, count, prohibitedCaretStops)
    end
    def set_prohibited_caret_stops(this : IXpsOMGlyphsEditor*, count : UInt32, prohibitedCaretStops : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prohibited_caret_stops.call(this, count, prohibitedCaretStops)
    end
    def get_bidi_level(this : IXpsOMGlyphsEditor*, bidiLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bidi_level.call(this, bidiLevel)
    end
    def set_bidi_level(this : IXpsOMGlyphsEditor*, bidiLevel : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bidi_level.call(this, bidiLevel)
    end
    def get_is_sideways(this : IXpsOMGlyphsEditor*, isSideways : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_sideways.call(this, isSideways)
    end
    def set_is_sideways(this : IXpsOMGlyphsEditor*, isSideways : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_sideways.call(this, isSideways)
    end
    def get_device_font_name(this : IXpsOMGlyphsEditor*, deviceFontName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_font_name.call(this, deviceFontName)
    end
    def set_device_font_name(this : IXpsOMGlyphsEditor*, deviceFontName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device_font_name.call(this, deviceFontName)
    end

  end

  @[Extern]
  record IXpsOMGlyphsVtbl,
    query_interface : Proc(IXpsOMGlyphs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGlyphs*, UInt32),
    release : Proc(IXpsOMGlyphs*, UInt32),
    get_owner : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMGlyphs*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_clip_geometry : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    get_clip_geometry_local : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_clip_geometry_local : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_clip_geometry_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_clip_geometry_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMGlyphs*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMGlyphs*, Float32, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_local : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_local : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMGlyphs*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMGlyphs*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_hyperlink_navigate_uri : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_hyperlink_navigate_uri : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_unicode_string : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_glyph_index_count : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_glyph_indices : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Storage::Xps::XPS_GLYPH_INDEX*, Win32cr::Foundation::HRESULT),
    get_glyph_mapping_count : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_glyph_mappings : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*, Win32cr::Foundation::HRESULT),
    get_prohibited_caret_stop_count : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prohibited_caret_stops : Proc(IXpsOMGlyphs*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_bidi_level : Proc(IXpsOMGlyphs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_is_sideways : Proc(IXpsOMGlyphs*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_device_font_name : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_style_simulations : Proc(IXpsOMGlyphs*, Win32cr::Storage::Xps::XPS_STYLE_SIMULATION*, Win32cr::Foundation::HRESULT),
    set_style_simulations : Proc(IXpsOMGlyphs*, Win32cr::Storage::Xps::XPS_STYLE_SIMULATION, Win32cr::Foundation::HRESULT),
    get_origin : Proc(IXpsOMGlyphs*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_origin : Proc(IXpsOMGlyphs*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    get_font_rendering_em_size : Proc(IXpsOMGlyphs*, Float32*, Win32cr::Foundation::HRESULT),
    set_font_rendering_em_size : Proc(IXpsOMGlyphs*, Float32, Win32cr::Foundation::HRESULT),
    get_font_resource : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_font_resource : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_font_face_index : Proc(IXpsOMGlyphs*, Int16*, Win32cr::Foundation::HRESULT),
    set_font_face_index : Proc(IXpsOMGlyphs*, Int16, Win32cr::Foundation::HRESULT),
    get_fill_brush : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    get_fill_brush_local : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    set_fill_brush_local : Proc(IXpsOMGlyphs*, Void*, Win32cr::Foundation::HRESULT),
    get_fill_brush_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_fill_brush_lookup : Proc(IXpsOMGlyphs*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_glyphs_editor : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMGlyphs*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGlyphs, lpVtbl : IXpsOMGlyphsVtbl* do
    GUID = LibC::GUID.new(0x819b3199_u32, 0xa5a_u16, 0x4b64_u16, StaticArray[0xbe_u8, 0xc7_u8, 0xa9_u8, 0xe1_u8, 0x7e_u8, 0x78_u8, 0xd_u8, 0xe2_u8])
    def query_interface(this : IXpsOMGlyphs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGlyphs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGlyphs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMGlyphs*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMGlyphs*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_transform(this : IXpsOMGlyphs*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, matrixTransform)
    end
    def get_transform_local(this : IXpsOMGlyphs*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, matrixTransform)
    end
    def set_transform_local(this : IXpsOMGlyphs*, matrixTransform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, matrixTransform)
    end
    def get_transform_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_clip_geometry(this : IXpsOMGlyphs*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry.call(this, clipGeometry)
    end
    def get_clip_geometry_local(this : IXpsOMGlyphs*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_local.call(this, clipGeometry)
    end
    def set_clip_geometry_local(this : IXpsOMGlyphs*, clipGeometry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_local.call(this, clipGeometry)
    end
    def get_clip_geometry_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_lookup.call(this, key)
    end
    def set_clip_geometry_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_lookup.call(this, key)
    end
    def get_opacity(this : IXpsOMGlyphs*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMGlyphs*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_opacity_mask_brush(this : IXpsOMGlyphs*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_local(this : IXpsOMGlyphs*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def set_opacity_mask_brush_local(this : IXpsOMGlyphs*, opacityMaskBrush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_lookup.call(this, key)
    end
    def set_opacity_mask_brush_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_lookup.call(this, key)
    end
    def get_name(this : IXpsOMGlyphs*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMGlyphs*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMGlyphs*, isHyperlink : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlink)
    end
    def set_is_hyperlink_target(this : IXpsOMGlyphs*, isHyperlink : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlink)
    end
    def get_hyperlink_navigate_uri(this : IXpsOMGlyphs*, hyperlinkUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def set_hyperlink_navigate_uri(this : IXpsOMGlyphs*, hyperlinkUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def get_language(this : IXpsOMGlyphs*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMGlyphs*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_unicode_string(this : IXpsOMGlyphs*, unicodeString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unicode_string.call(this, unicodeString)
    end
    def get_glyph_index_count(this : IXpsOMGlyphs*, indexCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_index_count.call(this, indexCount)
    end
    def get_glyph_indices(this : IXpsOMGlyphs*, indexCount : UInt32*, glyphIndices : Win32cr::Storage::Xps::XPS_GLYPH_INDEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_indices.call(this, indexCount, glyphIndices)
    end
    def get_glyph_mapping_count(this : IXpsOMGlyphs*, glyphMappingCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_mapping_count.call(this, glyphMappingCount)
    end
    def get_glyph_mappings(this : IXpsOMGlyphs*, glyphMappingCount : UInt32*, glyphMappings : Win32cr::Storage::Xps::XPS_GLYPH_MAPPING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyph_mappings.call(this, glyphMappingCount, glyphMappings)
    end
    def get_prohibited_caret_stop_count(this : IXpsOMGlyphs*, prohibitedCaretStopCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prohibited_caret_stop_count.call(this, prohibitedCaretStopCount)
    end
    def get_prohibited_caret_stops(this : IXpsOMGlyphs*, prohibitedCaretStopCount : UInt32*, prohibitedCaretStops : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prohibited_caret_stops.call(this, prohibitedCaretStopCount, prohibitedCaretStops)
    end
    def get_bidi_level(this : IXpsOMGlyphs*, bidiLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bidi_level.call(this, bidiLevel)
    end
    def get_is_sideways(this : IXpsOMGlyphs*, isSideways : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_sideways.call(this, isSideways)
    end
    def get_device_font_name(this : IXpsOMGlyphs*, deviceFontName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_font_name.call(this, deviceFontName)
    end
    def get_style_simulations(this : IXpsOMGlyphs*, styleSimulations : Win32cr::Storage::Xps::XPS_STYLE_SIMULATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_style_simulations.call(this, styleSimulations)
    end
    def set_style_simulations(this : IXpsOMGlyphs*, styleSimulations : Win32cr::Storage::Xps::XPS_STYLE_SIMULATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_style_simulations.call(this, styleSimulations)
    end
    def get_origin(this : IXpsOMGlyphs*, origin : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_origin.call(this, origin)
    end
    def set_origin(this : IXpsOMGlyphs*, origin : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_origin.call(this, origin)
    end
    def get_font_rendering_em_size(this : IXpsOMGlyphs*, fontRenderingEmSize : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font_rendering_em_size.call(this, fontRenderingEmSize)
    end
    def set_font_rendering_em_size(this : IXpsOMGlyphs*, fontRenderingEmSize : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font_rendering_em_size.call(this, fontRenderingEmSize)
    end
    def get_font_resource(this : IXpsOMGlyphs*, fontResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font_resource.call(this, fontResource)
    end
    def set_font_resource(this : IXpsOMGlyphs*, fontResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font_resource.call(this, fontResource)
    end
    def get_font_face_index(this : IXpsOMGlyphs*, fontFaceIndex : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font_face_index.call(this, fontFaceIndex)
    end
    def set_font_face_index(this : IXpsOMGlyphs*, fontFaceIndex : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_font_face_index.call(this, fontFaceIndex)
    end
    def get_fill_brush(this : IXpsOMGlyphs*, fillBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush.call(this, fillBrush)
    end
    def get_fill_brush_local(this : IXpsOMGlyphs*, fillBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush_local.call(this, fillBrush)
    end
    def set_fill_brush_local(this : IXpsOMGlyphs*, fillBrush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_brush_local.call(this, fillBrush)
    end
    def get_fill_brush_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush_lookup.call(this, key)
    end
    def set_fill_brush_lookup(this : IXpsOMGlyphs*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_brush_lookup.call(this, key)
    end
    def get_glyphs_editor(this : IXpsOMGlyphs*, editor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_glyphs_editor.call(this, editor)
    end
    def clone(this : IXpsOMGlyphs*, glyphs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, glyphs)
    end

  end

  @[Extern]
  record IXpsOMDashCollectionVtbl,
    query_interface : Proc(IXpsOMDashCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDashCollection*, UInt32),
    release : Proc(IXpsOMDashCollection*, UInt32),
    get_count : Proc(IXpsOMDashCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMDashCollection*, UInt32, Win32cr::Storage::Xps::XPS_DASH*, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMDashCollection*, UInt32, Win32cr::Storage::Xps::XPS_DASH*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMDashCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMDashCollection*, UInt32, Win32cr::Storage::Xps::XPS_DASH*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMDashCollection*, Win32cr::Storage::Xps::XPS_DASH*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDashCollection, lpVtbl : IXpsOMDashCollectionVtbl* do
    GUID = LibC::GUID.new(0x81613f4_u32, 0x74eb_u16, 0x48f2_u16, StaticArray[0x83_u8, 0xb3_u8, 0x37_u8, 0xa9_u8, 0xce_u8, 0x2d_u8, 0x7d_u8, 0xc6_u8])
    def query_interface(this : IXpsOMDashCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDashCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDashCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMDashCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMDashCollection*, index : UInt32, dash : Win32cr::Storage::Xps::XPS_DASH*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, dash)
    end
    def insert_at(this : IXpsOMDashCollection*, index : UInt32, dash : Win32cr::Storage::Xps::XPS_DASH*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, dash)
    end
    def remove_at(this : IXpsOMDashCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMDashCollection*, index : UInt32, dash : Win32cr::Storage::Xps::XPS_DASH*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, dash)
    end
    def append(this : IXpsOMDashCollection*, dash : Win32cr::Storage::Xps::XPS_DASH*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, dash)
    end

  end

  @[Extern]
  record IXpsOMMatrixTransformVtbl,
    query_interface : Proc(IXpsOMMatrixTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMMatrixTransform*, UInt32),
    release : Proc(IXpsOMMatrixTransform*, UInt32),
    get_owner : Proc(IXpsOMMatrixTransform*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMMatrixTransform*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_matrix : Proc(IXpsOMMatrixTransform*, Win32cr::Storage::Xps::XPS_MATRIX*, Win32cr::Foundation::HRESULT),
    set_matrix : Proc(IXpsOMMatrixTransform*, Win32cr::Storage::Xps::XPS_MATRIX*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMMatrixTransform*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMMatrixTransform, lpVtbl : IXpsOMMatrixTransformVtbl* do
    GUID = LibC::GUID.new(0xb77330ff_u32, 0xbb37_u16, 0x4501_u16, StaticArray[0xa9_u8, 0x3e_u8, 0xf1_u8, 0xb1_u8, 0xe5_u8, 0xb_u8, 0xfc_u8, 0x46_u8])
    def query_interface(this : IXpsOMMatrixTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMMatrixTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMMatrixTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMMatrixTransform*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMMatrixTransform*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_matrix(this : IXpsOMMatrixTransform*, matrix : Win32cr::Storage::Xps::XPS_MATRIX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matrix.call(this, matrix)
    end
    def set_matrix(this : IXpsOMMatrixTransform*, matrix : Win32cr::Storage::Xps::XPS_MATRIX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix.call(this, matrix)
    end
    def clone(this : IXpsOMMatrixTransform*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, matrixTransform)
    end

  end

  @[Extern]
  record IXpsOMGeometryVtbl,
    query_interface : Proc(IXpsOMGeometry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGeometry*, UInt32),
    release : Proc(IXpsOMGeometry*, UInt32),
    get_owner : Proc(IXpsOMGeometry*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMGeometry*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_figures : Proc(IXpsOMGeometry*, Void**, Win32cr::Foundation::HRESULT),
    get_fill_rule : Proc(IXpsOMGeometry*, Win32cr::Storage::Xps::XPS_FILL_RULE*, Win32cr::Foundation::HRESULT),
    set_fill_rule : Proc(IXpsOMGeometry*, Win32cr::Storage::Xps::XPS_FILL_RULE, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMGeometry*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMGeometry*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMGeometry*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMGeometry*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMGeometry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMGeometry*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGeometry, lpVtbl : IXpsOMGeometryVtbl* do
    GUID = LibC::GUID.new(0x64fcf3d7_u32, 0x4d58_u16, 0x44ba_u16, StaticArray[0xad_u8, 0x73_u8, 0xa1_u8, 0x3a_u8, 0xf6_u8, 0x49_u8, 0x20_u8, 0x72_u8])
    def query_interface(this : IXpsOMGeometry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGeometry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGeometry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMGeometry*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMGeometry*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_figures(this : IXpsOMGeometry*, figures : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_figures.call(this, figures)
    end
    def get_fill_rule(this : IXpsOMGeometry*, fillRule : Win32cr::Storage::Xps::XPS_FILL_RULE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_rule.call(this, fillRule)
    end
    def set_fill_rule(this : IXpsOMGeometry*, fillRule : Win32cr::Storage::Xps::XPS_FILL_RULE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_rule.call(this, fillRule)
    end
    def get_transform(this : IXpsOMGeometry*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMGeometry*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMGeometry*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMGeometry*, lookup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, lookup)
    end
    def set_transform_lookup(this : IXpsOMGeometry*, lookup : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, lookup)
    end
    def clone(this : IXpsOMGeometry*, geometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, geometry)
    end

  end

  @[Extern]
  record IXpsOMGeometryFigureVtbl,
    query_interface : Proc(IXpsOMGeometryFigure*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGeometryFigure*, UInt32),
    release : Proc(IXpsOMGeometryFigure*, UInt32),
    get_owner : Proc(IXpsOMGeometryFigure*, Void**, Win32cr::Foundation::HRESULT),
    get_segment_data : Proc(IXpsOMGeometryFigure*, UInt32*, Float32*, Win32cr::Foundation::HRESULT),
    get_segment_types : Proc(IXpsOMGeometryFigure*, UInt32*, Win32cr::Storage::Xps::XPS_SEGMENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_segment_strokes : Proc(IXpsOMGeometryFigure*, UInt32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_segments : Proc(IXpsOMGeometryFigure*, UInt32, UInt32, Win32cr::Storage::Xps::XPS_SEGMENT_TYPE*, Float32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_start_point : Proc(IXpsOMGeometryFigure*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_start_point : Proc(IXpsOMGeometryFigure*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    get_is_closed : Proc(IXpsOMGeometryFigure*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_closed : Proc(IXpsOMGeometryFigure*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_is_filled : Proc(IXpsOMGeometryFigure*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_filled : Proc(IXpsOMGeometryFigure*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_segment_count : Proc(IXpsOMGeometryFigure*, UInt32*, Win32cr::Foundation::HRESULT),
    get_segment_data_count : Proc(IXpsOMGeometryFigure*, UInt32*, Win32cr::Foundation::HRESULT),
    get_segment_stroke_pattern : Proc(IXpsOMGeometryFigure*, Win32cr::Storage::Xps::XPS_SEGMENT_STROKE_PATTERN*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMGeometryFigure*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGeometryFigure, lpVtbl : IXpsOMGeometryFigureVtbl* do
    GUID = LibC::GUID.new(0xd410dc83_u32, 0x908c_u16, 0x443e_u16, StaticArray[0x89_u8, 0x47_u8, 0xb1_u8, 0x79_u8, 0x5d_u8, 0x3c_u8, 0x16_u8, 0x5a_u8])
    def query_interface(this : IXpsOMGeometryFigure*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGeometryFigure*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGeometryFigure*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMGeometryFigure*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_segment_data(this : IXpsOMGeometryFigure*, dataCount : UInt32*, segmentData : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_data.call(this, dataCount, segmentData)
    end
    def get_segment_types(this : IXpsOMGeometryFigure*, segmentCount : UInt32*, segmentTypes : Win32cr::Storage::Xps::XPS_SEGMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_types.call(this, segmentCount, segmentTypes)
    end
    def get_segment_strokes(this : IXpsOMGeometryFigure*, segmentCount : UInt32*, segmentStrokes : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_strokes.call(this, segmentCount, segmentStrokes)
    end
    def set_segments(this : IXpsOMGeometryFigure*, segmentCount : UInt32, segmentDataCount : UInt32, segmentTypes : Win32cr::Storage::Xps::XPS_SEGMENT_TYPE*, segmentData : Float32*, segmentStrokes : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_segments.call(this, segmentCount, segmentDataCount, segmentTypes, segmentData, segmentStrokes)
    end
    def get_start_point(this : IXpsOMGeometryFigure*, startPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start_point.call(this, startPoint)
    end
    def set_start_point(this : IXpsOMGeometryFigure*, startPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start_point.call(this, startPoint)
    end
    def get_is_closed(this : IXpsOMGeometryFigure*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_closed.call(this, isClosed)
    end
    def set_is_closed(this : IXpsOMGeometryFigure*, isClosed : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_closed.call(this, isClosed)
    end
    def get_is_filled(this : IXpsOMGeometryFigure*, isFilled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_filled.call(this, isFilled)
    end
    def set_is_filled(this : IXpsOMGeometryFigure*, isFilled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_filled.call(this, isFilled)
    end
    def get_segment_count(this : IXpsOMGeometryFigure*, segmentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_count.call(this, segmentCount)
    end
    def get_segment_data_count(this : IXpsOMGeometryFigure*, segmentDataCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_data_count.call(this, segmentDataCount)
    end
    def get_segment_stroke_pattern(this : IXpsOMGeometryFigure*, segmentStrokePattern : Win32cr::Storage::Xps::XPS_SEGMENT_STROKE_PATTERN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_segment_stroke_pattern.call(this, segmentStrokePattern)
    end
    def clone(this : IXpsOMGeometryFigure*, geometryFigure : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, geometryFigure)
    end

  end

  @[Extern]
  record IXpsOMGeometryFigureCollectionVtbl,
    query_interface : Proc(IXpsOMGeometryFigureCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGeometryFigureCollection*, UInt32),
    release : Proc(IXpsOMGeometryFigureCollection*, UInt32),
    get_count : Proc(IXpsOMGeometryFigureCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMGeometryFigureCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGeometryFigureCollection, lpVtbl : IXpsOMGeometryFigureCollectionVtbl* do
    GUID = LibC::GUID.new(0xfd48c3f3_u32, 0xa58e_u16, 0x4b5a_u16, StaticArray[0x88_u8, 0x26_u8, 0x1d_u8, 0xe5_u8, 0x4a_u8, 0xbe_u8, 0x72_u8, 0xb2_u8])
    def query_interface(this : IXpsOMGeometryFigureCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGeometryFigureCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGeometryFigureCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMGeometryFigureCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMGeometryFigureCollection*, index : UInt32, geometryFigure : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, geometryFigure)
    end
    def insert_at(this : IXpsOMGeometryFigureCollection*, index : UInt32, geometryFigure : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, geometryFigure)
    end
    def remove_at(this : IXpsOMGeometryFigureCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMGeometryFigureCollection*, index : UInt32, geometryFigure : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, geometryFigure)
    end
    def append(this : IXpsOMGeometryFigureCollection*, geometryFigure : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, geometryFigure)
    end

  end

  @[Extern]
  record IXpsOMPathVtbl,
    query_interface : Proc(IXpsOMPath*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPath*, UInt32),
    release : Proc(IXpsOMPath*, UInt32),
    get_owner : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_clip_geometry : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_clip_geometry_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_clip_geometry_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_clip_geometry_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_clip_geometry_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMPath*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMPath*, Float32, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMPath*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMPath*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_hyperlink_navigate_uri : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_hyperlink_navigate_uri : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_geometry : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_geometry_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_geometry_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_geometry_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_geometry_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_accessibility_short_description : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_accessibility_short_description : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_accessibility_long_description : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_accessibility_long_description : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_snaps_to_pixels : Proc(IXpsOMPath*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_snaps_to_pixels : Proc(IXpsOMPath*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_stroke_brush : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_stroke_brush_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_stroke_brush_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_stroke_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_stroke_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_stroke_dashes : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_stroke_dash_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_DASH_CAP*, Win32cr::Foundation::HRESULT),
    set_stroke_dash_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_DASH_CAP, Win32cr::Foundation::HRESULT),
    get_stroke_dash_offset : Proc(IXpsOMPath*, Float32*, Win32cr::Foundation::HRESULT),
    set_stroke_dash_offset : Proc(IXpsOMPath*, Float32, Win32cr::Foundation::HRESULT),
    get_stroke_start_line_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_CAP*, Win32cr::Foundation::HRESULT),
    set_stroke_start_line_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_CAP, Win32cr::Foundation::HRESULT),
    get_stroke_end_line_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_CAP*, Win32cr::Foundation::HRESULT),
    set_stroke_end_line_cap : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_CAP, Win32cr::Foundation::HRESULT),
    get_stroke_line_join : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_JOIN*, Win32cr::Foundation::HRESULT),
    set_stroke_line_join : Proc(IXpsOMPath*, Win32cr::Storage::Xps::XPS_LINE_JOIN, Win32cr::Foundation::HRESULT),
    get_stroke_miter_limit : Proc(IXpsOMPath*, Float32*, Win32cr::Foundation::HRESULT),
    set_stroke_miter_limit : Proc(IXpsOMPath*, Float32, Win32cr::Foundation::HRESULT),
    get_stroke_thickness : Proc(IXpsOMPath*, Float32*, Win32cr::Foundation::HRESULT),
    set_stroke_thickness : Proc(IXpsOMPath*, Float32, Win32cr::Foundation::HRESULT),
    get_fill_brush : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    get_fill_brush_local : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT),
    set_fill_brush_local : Proc(IXpsOMPath*, Void*, Win32cr::Foundation::HRESULT),
    get_fill_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_fill_brush_lookup : Proc(IXpsOMPath*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMPath*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPath, lpVtbl : IXpsOMPathVtbl* do
    GUID = LibC::GUID.new(0x37d38bb6_u32, 0x3ee9_u16, 0x4110_u16, StaticArray[0x93_u8, 0x12_u8, 0x14_u8, 0xb1_u8, 0x94_u8, 0x16_u8, 0x33_u8, 0x37_u8])
    def query_interface(this : IXpsOMPath*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPath*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPath*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMPath*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMPath*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_transform(this : IXpsOMPath*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, matrixTransform)
    end
    def get_transform_local(this : IXpsOMPath*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, matrixTransform)
    end
    def set_transform_local(this : IXpsOMPath*, matrixTransform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, matrixTransform)
    end
    def get_transform_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_clip_geometry(this : IXpsOMPath*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry.call(this, clipGeometry)
    end
    def get_clip_geometry_local(this : IXpsOMPath*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_local.call(this, clipGeometry)
    end
    def set_clip_geometry_local(this : IXpsOMPath*, clipGeometry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_local.call(this, clipGeometry)
    end
    def get_clip_geometry_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_lookup.call(this, key)
    end
    def set_clip_geometry_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_lookup.call(this, key)
    end
    def get_opacity(this : IXpsOMPath*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMPath*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_opacity_mask_brush(this : IXpsOMPath*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_local(this : IXpsOMPath*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def set_opacity_mask_brush_local(this : IXpsOMPath*, opacityMaskBrush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_lookup.call(this, key)
    end
    def set_opacity_mask_brush_lookup(this : IXpsOMPath*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_lookup.call(this, key)
    end
    def get_name(this : IXpsOMPath*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMPath*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMPath*, isHyperlink : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlink)
    end
    def set_is_hyperlink_target(this : IXpsOMPath*, isHyperlink : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlink)
    end
    def get_hyperlink_navigate_uri(this : IXpsOMPath*, hyperlinkUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def set_hyperlink_navigate_uri(this : IXpsOMPath*, hyperlinkUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def get_language(this : IXpsOMPath*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMPath*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_geometry(this : IXpsOMPath*, geometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_geometry.call(this, geometry)
    end
    def get_geometry_local(this : IXpsOMPath*, geometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_geometry_local.call(this, geometry)
    end
    def set_geometry_local(this : IXpsOMPath*, geometry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_geometry_local.call(this, geometry)
    end
    def get_geometry_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_geometry_lookup.call(this, lookup)
    end
    def set_geometry_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_geometry_lookup.call(this, lookup)
    end
    def get_accessibility_short_description(this : IXpsOMPath*, shortDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accessibility_short_description.call(this, shortDescription)
    end
    def set_accessibility_short_description(this : IXpsOMPath*, shortDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accessibility_short_description.call(this, shortDescription)
    end
    def get_accessibility_long_description(this : IXpsOMPath*, longDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accessibility_long_description.call(this, longDescription)
    end
    def set_accessibility_long_description(this : IXpsOMPath*, longDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accessibility_long_description.call(this, longDescription)
    end
    def get_snaps_to_pixels(this : IXpsOMPath*, snapsToPixels : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snaps_to_pixels.call(this, snapsToPixels)
    end
    def set_snaps_to_pixels(this : IXpsOMPath*, snapsToPixels : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snaps_to_pixels.call(this, snapsToPixels)
    end
    def get_stroke_brush(this : IXpsOMPath*, brush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_brush.call(this, brush)
    end
    def get_stroke_brush_local(this : IXpsOMPath*, brush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_brush_local.call(this, brush)
    end
    def set_stroke_brush_local(this : IXpsOMPath*, brush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_brush_local.call(this, brush)
    end
    def get_stroke_brush_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_brush_lookup.call(this, lookup)
    end
    def set_stroke_brush_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_brush_lookup.call(this, lookup)
    end
    def get_stroke_dashes(this : IXpsOMPath*, strokeDashes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_dashes.call(this, strokeDashes)
    end
    def get_stroke_dash_cap(this : IXpsOMPath*, strokeDashCap : Win32cr::Storage::Xps::XPS_DASH_CAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_dash_cap.call(this, strokeDashCap)
    end
    def set_stroke_dash_cap(this : IXpsOMPath*, strokeDashCap : Win32cr::Storage::Xps::XPS_DASH_CAP) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_dash_cap.call(this, strokeDashCap)
    end
    def get_stroke_dash_offset(this : IXpsOMPath*, strokeDashOffset : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_dash_offset.call(this, strokeDashOffset)
    end
    def set_stroke_dash_offset(this : IXpsOMPath*, strokeDashOffset : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_dash_offset.call(this, strokeDashOffset)
    end
    def get_stroke_start_line_cap(this : IXpsOMPath*, strokeStartLineCap : Win32cr::Storage::Xps::XPS_LINE_CAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_start_line_cap.call(this, strokeStartLineCap)
    end
    def set_stroke_start_line_cap(this : IXpsOMPath*, strokeStartLineCap : Win32cr::Storage::Xps::XPS_LINE_CAP) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_start_line_cap.call(this, strokeStartLineCap)
    end
    def get_stroke_end_line_cap(this : IXpsOMPath*, strokeEndLineCap : Win32cr::Storage::Xps::XPS_LINE_CAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_end_line_cap.call(this, strokeEndLineCap)
    end
    def set_stroke_end_line_cap(this : IXpsOMPath*, strokeEndLineCap : Win32cr::Storage::Xps::XPS_LINE_CAP) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_end_line_cap.call(this, strokeEndLineCap)
    end
    def get_stroke_line_join(this : IXpsOMPath*, strokeLineJoin : Win32cr::Storage::Xps::XPS_LINE_JOIN*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_line_join.call(this, strokeLineJoin)
    end
    def set_stroke_line_join(this : IXpsOMPath*, strokeLineJoin : Win32cr::Storage::Xps::XPS_LINE_JOIN) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_line_join.call(this, strokeLineJoin)
    end
    def get_stroke_miter_limit(this : IXpsOMPath*, strokeMiterLimit : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_miter_limit.call(this, strokeMiterLimit)
    end
    def set_stroke_miter_limit(this : IXpsOMPath*, strokeMiterLimit : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_miter_limit.call(this, strokeMiterLimit)
    end
    def get_stroke_thickness(this : IXpsOMPath*, strokeThickness : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stroke_thickness.call(this, strokeThickness)
    end
    def set_stroke_thickness(this : IXpsOMPath*, strokeThickness : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stroke_thickness.call(this, strokeThickness)
    end
    def get_fill_brush(this : IXpsOMPath*, brush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush.call(this, brush)
    end
    def get_fill_brush_local(this : IXpsOMPath*, brush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush_local.call(this, brush)
    end
    def set_fill_brush_local(this : IXpsOMPath*, brush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_brush_local.call(this, brush)
    end
    def get_fill_brush_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fill_brush_lookup.call(this, lookup)
    end
    def set_fill_brush_lookup(this : IXpsOMPath*, lookup : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_brush_lookup.call(this, lookup)
    end
    def clone(this : IXpsOMPath*, path : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, path)
    end

  end

  @[Extern]
  record IXpsOMBrushVtbl,
    query_interface : Proc(IXpsOMBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMBrush*, UInt32),
    release : Proc(IXpsOMBrush*, UInt32),
    get_owner : Proc(IXpsOMBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMBrush*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMBrush, lpVtbl : IXpsOMBrushVtbl* do
    GUID = LibC::GUID.new(0x56a3f80c_u32, 0xea4c_u16, 0x4187_u16, StaticArray[0xa5_u8, 0x7b_u8, 0xa2_u8, 0xa4_u8, 0x73_u8, 0xb2_u8, 0xb4_u8, 0x2b_u8])
    def query_interface(this : IXpsOMBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end

  end

  @[Extern]
  record IXpsOMGradientStopCollectionVtbl,
    query_interface : Proc(IXpsOMGradientStopCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGradientStopCollection*, UInt32),
    release : Proc(IXpsOMGradientStopCollection*, UInt32),
    get_count : Proc(IXpsOMGradientStopCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMGradientStopCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMGradientStopCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMGradientStopCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMGradientStopCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMGradientStopCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGradientStopCollection, lpVtbl : IXpsOMGradientStopCollectionVtbl* do
    GUID = LibC::GUID.new(0xc9174c3a_u32, 0x3cd3_u16, 0x4319_u16, StaticArray[0xbd_u8, 0xa4_u8, 0x11_u8, 0xa3_u8, 0x93_u8, 0x92_u8, 0xce_u8, 0xef_u8])
    def query_interface(this : IXpsOMGradientStopCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGradientStopCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGradientStopCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMGradientStopCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMGradientStopCollection*, index : UInt32, stop : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, stop)
    end
    def insert_at(this : IXpsOMGradientStopCollection*, index : UInt32, stop : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, stop)
    end
    def remove_at(this : IXpsOMGradientStopCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMGradientStopCollection*, index : UInt32, stop : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, stop)
    end
    def append(this : IXpsOMGradientStopCollection*, stop : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, stop)
    end

  end

  @[Extern]
  record IXpsOMSolidColorBrushVtbl,
    query_interface : Proc(IXpsOMSolidColorBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMSolidColorBrush*, UInt32),
    release : Proc(IXpsOMSolidColorBrush*, UInt32),
    get_owner : Proc(IXpsOMSolidColorBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMSolidColorBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMSolidColorBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMSolidColorBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_color : Proc(IXpsOMSolidColorBrush*, Win32cr::Storage::Xps::XPS_COLOR*, Void**, Win32cr::Foundation::HRESULT),
    set_color : Proc(IXpsOMSolidColorBrush*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMSolidColorBrush*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMSolidColorBrush, lpVtbl : IXpsOMSolidColorBrushVtbl* do
    GUID = LibC::GUID.new(0xa06f9f05_u32, 0x3be9_u16, 0x4763_u16, StaticArray[0x98_u8, 0xa8_u8, 0x9_u8, 0x4f_u8, 0xc6_u8, 0x72_u8, 0xe4_u8, 0x88_u8])
    def query_interface(this : IXpsOMSolidColorBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMSolidColorBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMSolidColorBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMSolidColorBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMSolidColorBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMSolidColorBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMSolidColorBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_color(this : IXpsOMSolidColorBrush*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color.call(this, color, colorProfile)
    end
    def set_color(this : IXpsOMSolidColorBrush*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color.call(this, color, colorProfile)
    end
    def clone(this : IXpsOMSolidColorBrush*, solidColorBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, solidColorBrush)
    end

  end

  @[Extern]
  record IXpsOMTileBrushVtbl,
    query_interface : Proc(IXpsOMTileBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMTileBrush*, UInt32),
    release : Proc(IXpsOMTileBrush*, UInt32),
    get_owner : Proc(IXpsOMTileBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMTileBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMTileBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMTileBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMTileBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMTileBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMTileBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMTileBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_viewbox : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewbox : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_viewport : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewport : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_tile_mode : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE*, Win32cr::Foundation::HRESULT),
    set_tile_mode : Proc(IXpsOMTileBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMTileBrush, lpVtbl : IXpsOMTileBrushVtbl* do
    GUID = LibC::GUID.new(0xfc2328d_u32, 0xd722_u16, 0x4a54_u16, StaticArray[0xb2_u8, 0xec_u8, 0xbe_u8, 0x90_u8, 0x21_u8, 0x8a_u8, 0x78_u8, 0x9e_u8])
    def query_interface(this : IXpsOMTileBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMTileBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMTileBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMTileBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMTileBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMTileBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMTileBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_transform(this : IXpsOMTileBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMTileBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMTileBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMTileBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMTileBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_viewbox(this : IXpsOMTileBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewbox.call(this, viewbox)
    end
    def set_viewbox(this : IXpsOMTileBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewbox.call(this, viewbox)
    end
    def get_viewport(this : IXpsOMTileBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport.call(this, viewport)
    end
    def set_viewport(this : IXpsOMTileBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport.call(this, viewport)
    end
    def get_tile_mode(this : IXpsOMTileBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tile_mode.call(this, tileMode)
    end
    def set_tile_mode(this : IXpsOMTileBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tile_mode.call(this, tileMode)
    end

  end

  @[Extern]
  record IXpsOMVisualBrushVtbl,
    query_interface : Proc(IXpsOMVisualBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMVisualBrush*, UInt32),
    release : Proc(IXpsOMVisualBrush*, UInt32),
    get_owner : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMVisualBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMVisualBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMVisualBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMVisualBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMVisualBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_viewbox : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewbox : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_viewport : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewport : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_tile_mode : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE*, Win32cr::Foundation::HRESULT),
    set_tile_mode : Proc(IXpsOMVisualBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE, Win32cr::Foundation::HRESULT),
    get_visual : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_visual_local : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_visual_local : Proc(IXpsOMVisualBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_visual_lookup : Proc(IXpsOMVisualBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_visual_lookup : Proc(IXpsOMVisualBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMVisualBrush*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMVisualBrush, lpVtbl : IXpsOMVisualBrushVtbl* do
    GUID = LibC::GUID.new(0x97e294af_u32, 0x5b37_u16, 0x46b4_u16, StaticArray[0x80_u8, 0x57_u8, 0x87_u8, 0x4d_u8, 0x2f_u8, 0x64_u8, 0x11_u8, 0x9b_u8])
    def query_interface(this : IXpsOMVisualBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMVisualBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMVisualBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMVisualBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMVisualBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMVisualBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMVisualBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_transform(this : IXpsOMVisualBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMVisualBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMVisualBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMVisualBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMVisualBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_viewbox(this : IXpsOMVisualBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewbox.call(this, viewbox)
    end
    def set_viewbox(this : IXpsOMVisualBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewbox.call(this, viewbox)
    end
    def get_viewport(this : IXpsOMVisualBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport.call(this, viewport)
    end
    def set_viewport(this : IXpsOMVisualBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport.call(this, viewport)
    end
    def get_tile_mode(this : IXpsOMVisualBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tile_mode.call(this, tileMode)
    end
    def set_tile_mode(this : IXpsOMVisualBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tile_mode.call(this, tileMode)
    end
    def get_visual(this : IXpsOMVisualBrush*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visual.call(this, visual)
    end
    def get_visual_local(this : IXpsOMVisualBrush*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visual_local.call(this, visual)
    end
    def set_visual_local(this : IXpsOMVisualBrush*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_visual_local.call(this, visual)
    end
    def get_visual_lookup(this : IXpsOMVisualBrush*, lookup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visual_lookup.call(this, lookup)
    end
    def set_visual_lookup(this : IXpsOMVisualBrush*, lookup : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_visual_lookup.call(this, lookup)
    end
    def clone(this : IXpsOMVisualBrush*, visualBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, visualBrush)
    end

  end

  @[Extern]
  record IXpsOMImageBrushVtbl,
    query_interface : Proc(IXpsOMImageBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMImageBrush*, UInt32),
    release : Proc(IXpsOMImageBrush*, UInt32),
    get_owner : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMImageBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMImageBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMImageBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMImageBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMImageBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_viewbox : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewbox : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_viewport : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_viewport : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_tile_mode : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE*, Win32cr::Foundation::HRESULT),
    set_tile_mode : Proc(IXpsOMImageBrush*, Win32cr::Storage::Xps::XPS_TILE_MODE, Win32cr::Foundation::HRESULT),
    get_image_resource : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_image_resource : Proc(IXpsOMImageBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_color_profile_resource : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_color_profile_resource : Proc(IXpsOMImageBrush*, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMImageBrush*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMImageBrush, lpVtbl : IXpsOMImageBrushVtbl* do
    GUID = LibC::GUID.new(0x3df0b466_u32, 0xd382_u16, 0x49ef_u16, StaticArray[0x85_u8, 0x50_u8, 0xdd_u8, 0x94_u8, 0xc8_u8, 0x2_u8, 0x42_u8, 0xe4_u8])
    def query_interface(this : IXpsOMImageBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMImageBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMImageBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMImageBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMImageBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMImageBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMImageBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_transform(this : IXpsOMImageBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMImageBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMImageBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMImageBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMImageBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_viewbox(this : IXpsOMImageBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewbox.call(this, viewbox)
    end
    def set_viewbox(this : IXpsOMImageBrush*, viewbox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewbox.call(this, viewbox)
    end
    def get_viewport(this : IXpsOMImageBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport.call(this, viewport)
    end
    def set_viewport(this : IXpsOMImageBrush*, viewport : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport.call(this, viewport)
    end
    def get_tile_mode(this : IXpsOMImageBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tile_mode.call(this, tileMode)
    end
    def set_tile_mode(this : IXpsOMImageBrush*, tileMode : Win32cr::Storage::Xps::XPS_TILE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tile_mode.call(this, tileMode)
    end
    def get_image_resource(this : IXpsOMImageBrush*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_resource.call(this, imageResource)
    end
    def set_image_resource(this : IXpsOMImageBrush*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_image_resource.call(this, imageResource)
    end
    def get_color_profile_resource(this : IXpsOMImageBrush*, colorProfileResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_profile_resource.call(this, colorProfileResource)
    end
    def set_color_profile_resource(this : IXpsOMImageBrush*, colorProfileResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_profile_resource.call(this, colorProfileResource)
    end
    def clone(this : IXpsOMImageBrush*, imageBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, imageBrush)
    end

  end

  @[Extern]
  record IXpsOMGradientStopVtbl,
    query_interface : Proc(IXpsOMGradientStop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGradientStop*, UInt32),
    release : Proc(IXpsOMGradientStop*, UInt32),
    get_owner : Proc(IXpsOMGradientStop*, Void**, Win32cr::Foundation::HRESULT),
    get_offset : Proc(IXpsOMGradientStop*, Float32*, Win32cr::Foundation::HRESULT),
    set_offset : Proc(IXpsOMGradientStop*, Float32, Win32cr::Foundation::HRESULT),
    get_color : Proc(IXpsOMGradientStop*, Win32cr::Storage::Xps::XPS_COLOR*, Void**, Win32cr::Foundation::HRESULT),
    set_color : Proc(IXpsOMGradientStop*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMGradientStop*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGradientStop, lpVtbl : IXpsOMGradientStopVtbl* do
    GUID = LibC::GUID.new(0x5cf4f5cc_u32, 0x3969_u16, 0x49b5_u16, StaticArray[0xa7_u8, 0xa_u8, 0x55_u8, 0x50_u8, 0xb6_u8, 0x18_u8, 0xfe_u8, 0x49_u8])
    def query_interface(this : IXpsOMGradientStop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGradientStop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGradientStop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMGradientStop*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_offset(this : IXpsOMGradientStop*, offset : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_offset.call(this, offset)
    end
    def set_offset(this : IXpsOMGradientStop*, offset : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset.call(this, offset)
    end
    def get_color(this : IXpsOMGradientStop*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color.call(this, color, colorProfile)
    end
    def set_color(this : IXpsOMGradientStop*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color.call(this, color, colorProfile)
    end
    def clone(this : IXpsOMGradientStop*, gradientStop : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, gradientStop)
    end

  end

  @[Extern]
  record IXpsOMGradientBrushVtbl,
    query_interface : Proc(IXpsOMGradientBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMGradientBrush*, UInt32),
    release : Proc(IXpsOMGradientBrush*, UInt32),
    get_owner : Proc(IXpsOMGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMGradientBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMGradientBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMGradientBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_gradient_stops : Proc(IXpsOMGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMGradientBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMGradientBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMGradientBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_spread_method : Proc(IXpsOMGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD*, Win32cr::Foundation::HRESULT),
    set_spread_method : Proc(IXpsOMGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD, Win32cr::Foundation::HRESULT),
    get_color_interpolation_mode : Proc(IXpsOMGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*, Win32cr::Foundation::HRESULT),
    set_color_interpolation_mode : Proc(IXpsOMGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMGradientBrush, lpVtbl : IXpsOMGradientBrushVtbl* do
    GUID = LibC::GUID.new(0xedb59622_u32, 0x61a2_u16, 0x42c3_u16, StaticArray[0xba_u8, 0xce_u8, 0xac_u8, 0xf2_u8, 0x28_u8, 0x6c_u8, 0x6_u8, 0xbf_u8])
    def query_interface(this : IXpsOMGradientBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMGradientBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMGradientBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMGradientBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMGradientBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMGradientBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMGradientBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_gradient_stops(this : IXpsOMGradientBrush*, gradientStops : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gradient_stops.call(this, gradientStops)
    end
    def get_transform(this : IXpsOMGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMGradientBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMGradientBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMGradientBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_spread_method(this : IXpsOMGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spread_method.call(this, spreadMethod)
    end
    def set_spread_method(this : IXpsOMGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spread_method.call(this, spreadMethod)
    end
    def get_color_interpolation_mode(this : IXpsOMGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_interpolation_mode.call(this, colorInterpolationMode)
    end
    def set_color_interpolation_mode(this : IXpsOMGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_interpolation_mode.call(this, colorInterpolationMode)
    end

  end

  @[Extern]
  record IXpsOMLinearGradientBrushVtbl,
    query_interface : Proc(IXpsOMLinearGradientBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMLinearGradientBrush*, UInt32),
    release : Proc(IXpsOMLinearGradientBrush*, UInt32),
    get_owner : Proc(IXpsOMLinearGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMLinearGradientBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMLinearGradientBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_gradient_stops : Proc(IXpsOMLinearGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMLinearGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMLinearGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMLinearGradientBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMLinearGradientBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMLinearGradientBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_spread_method : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD*, Win32cr::Foundation::HRESULT),
    set_spread_method : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD, Win32cr::Foundation::HRESULT),
    get_color_interpolation_mode : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*, Win32cr::Foundation::HRESULT),
    set_color_interpolation_mode : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION, Win32cr::Foundation::HRESULT),
    get_start_point : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_start_point : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    get_end_point : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_end_point : Proc(IXpsOMLinearGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMLinearGradientBrush*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMLinearGradientBrush, lpVtbl : IXpsOMLinearGradientBrushVtbl* do
    GUID = LibC::GUID.new(0x5e279f_u32, 0xc30d_u16, 0x40ff_u16, StaticArray[0x93_u8, 0xec_u8, 0x19_u8, 0x50_u8, 0xd3_u8, 0xc5_u8, 0x28_u8, 0xdb_u8])
    def query_interface(this : IXpsOMLinearGradientBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMLinearGradientBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMLinearGradientBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMLinearGradientBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMLinearGradientBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMLinearGradientBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMLinearGradientBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_gradient_stops(this : IXpsOMLinearGradientBrush*, gradientStops : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gradient_stops.call(this, gradientStops)
    end
    def get_transform(this : IXpsOMLinearGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMLinearGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMLinearGradientBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMLinearGradientBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMLinearGradientBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_spread_method(this : IXpsOMLinearGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spread_method.call(this, spreadMethod)
    end
    def set_spread_method(this : IXpsOMLinearGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spread_method.call(this, spreadMethod)
    end
    def get_color_interpolation_mode(this : IXpsOMLinearGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_interpolation_mode.call(this, colorInterpolationMode)
    end
    def set_color_interpolation_mode(this : IXpsOMLinearGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_interpolation_mode.call(this, colorInterpolationMode)
    end
    def get_start_point(this : IXpsOMLinearGradientBrush*, startPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start_point.call(this, startPoint)
    end
    def set_start_point(this : IXpsOMLinearGradientBrush*, startPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_start_point.call(this, startPoint)
    end
    def get_end_point(this : IXpsOMLinearGradientBrush*, endPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end_point.call(this, endPoint)
    end
    def set_end_point(this : IXpsOMLinearGradientBrush*, endPoint : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_end_point.call(this, endPoint)
    end
    def clone(this : IXpsOMLinearGradientBrush*, linearGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, linearGradientBrush)
    end

  end

  @[Extern]
  record IXpsOMRadialGradientBrushVtbl,
    query_interface : Proc(IXpsOMRadialGradientBrush*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMRadialGradientBrush*, UInt32),
    release : Proc(IXpsOMRadialGradientBrush*, UInt32),
    get_owner : Proc(IXpsOMRadialGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMRadialGradientBrush*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMRadialGradientBrush*, Float32, Win32cr::Foundation::HRESULT),
    get_gradient_stops : Proc(IXpsOMRadialGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMRadialGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMRadialGradientBrush*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMRadialGradientBrush*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMRadialGradientBrush*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMRadialGradientBrush*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_spread_method : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD*, Win32cr::Foundation::HRESULT),
    set_spread_method : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_SPREAD_METHOD, Win32cr::Foundation::HRESULT),
    get_color_interpolation_mode : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*, Win32cr::Foundation::HRESULT),
    set_color_interpolation_mode : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION, Win32cr::Foundation::HRESULT),
    get_center : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_center : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    get_radii_sizes : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    set_radii_sizes : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    get_gradient_origin : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    set_gradient_origin : Proc(IXpsOMRadialGradientBrush*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMRadialGradientBrush*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMRadialGradientBrush, lpVtbl : IXpsOMRadialGradientBrushVtbl* do
    GUID = LibC::GUID.new(0x75f207e5_u32, 0x8bf_u16, 0x413c_u16, StaticArray[0x96_u8, 0xb1_u8, 0xb8_u8, 0x2b_u8, 0x40_u8, 0x64_u8, 0x17_u8, 0x6b_u8])
    def query_interface(this : IXpsOMRadialGradientBrush*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMRadialGradientBrush*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMRadialGradientBrush*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMRadialGradientBrush*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMRadialGradientBrush*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_opacity(this : IXpsOMRadialGradientBrush*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMRadialGradientBrush*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_gradient_stops(this : IXpsOMRadialGradientBrush*, gradientStops : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gradient_stops.call(this, gradientStops)
    end
    def get_transform(this : IXpsOMRadialGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, transform)
    end
    def get_transform_local(this : IXpsOMRadialGradientBrush*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, transform)
    end
    def set_transform_local(this : IXpsOMRadialGradientBrush*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, transform)
    end
    def get_transform_lookup(this : IXpsOMRadialGradientBrush*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMRadialGradientBrush*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_spread_method(this : IXpsOMRadialGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spread_method.call(this, spreadMethod)
    end
    def set_spread_method(this : IXpsOMRadialGradientBrush*, spreadMethod : Win32cr::Storage::Xps::XPS_SPREAD_METHOD) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spread_method.call(this, spreadMethod)
    end
    def get_color_interpolation_mode(this : IXpsOMRadialGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_interpolation_mode.call(this, colorInterpolationMode)
    end
    def set_color_interpolation_mode(this : IXpsOMRadialGradientBrush*, colorInterpolationMode : Win32cr::Storage::Xps::XPS_COLOR_INTERPOLATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_interpolation_mode.call(this, colorInterpolationMode)
    end
    def get_center(this : IXpsOMRadialGradientBrush*, center : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_center.call(this, center)
    end
    def set_center(this : IXpsOMRadialGradientBrush*, center : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center.call(this, center)
    end
    def get_radii_sizes(this : IXpsOMRadialGradientBrush*, radiiSizes : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_radii_sizes.call(this, radiiSizes)
    end
    def set_radii_sizes(this : IXpsOMRadialGradientBrush*, radiiSizes : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_radii_sizes.call(this, radiiSizes)
    end
    def get_gradient_origin(this : IXpsOMRadialGradientBrush*, origin : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gradient_origin.call(this, origin)
    end
    def set_gradient_origin(this : IXpsOMRadialGradientBrush*, origin : Win32cr::Storage::Xps::XPS_POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gradient_origin.call(this, origin)
    end
    def clone(this : IXpsOMRadialGradientBrush*, radialGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, radialGradientBrush)
    end

  end

  @[Extern]
  record IXpsOMResourceVtbl,
    query_interface : Proc(IXpsOMResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMResource*, UInt32),
    release : Proc(IXpsOMResource*, UInt32),
    get_part_name : Proc(IXpsOMResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMResource*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMResource, lpVtbl : IXpsOMResourceVtbl* do
    GUID = LibC::GUID.new(0xda2ac0a2_u32, 0x73a2_u16, 0x4975_u16, StaticArray[0xad_u8, 0x14_u8, 0x74_u8, 0x9_u8, 0x7c_u8, 0x3f_u8, 0xf3_u8, 0xa5_u8])
    def query_interface(this : IXpsOMResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end

  end

  @[Extern]
  record IXpsOMPartResourcesVtbl,
    query_interface : Proc(IXpsOMPartResources*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPartResources*, UInt32),
    release : Proc(IXpsOMPartResources*, UInt32),
    get_font_resources : Proc(IXpsOMPartResources*, Void**, Win32cr::Foundation::HRESULT),
    get_image_resources : Proc(IXpsOMPartResources*, Void**, Win32cr::Foundation::HRESULT),
    get_color_profile_resources : Proc(IXpsOMPartResources*, Void**, Win32cr::Foundation::HRESULT),
    get_remote_dictionary_resources : Proc(IXpsOMPartResources*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPartResources, lpVtbl : IXpsOMPartResourcesVtbl* do
    GUID = LibC::GUID.new(0xf4cf7729_u32, 0x4864_u16, 0x4275_u16, StaticArray[0x99_u8, 0xb3_u8, 0xa8_u8, 0x71_u8, 0x71_u8, 0x63_u8, 0xec_u8, 0xaf_u8])
    def query_interface(this : IXpsOMPartResources*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPartResources*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPartResources*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_font_resources(this : IXpsOMPartResources*, fontResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_font_resources.call(this, fontResources)
    end
    def get_image_resources(this : IXpsOMPartResources*, imageResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_resources.call(this, imageResources)
    end
    def get_color_profile_resources(this : IXpsOMPartResources*, colorProfileResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_profile_resources.call(this, colorProfileResources)
    end
    def get_remote_dictionary_resources(this : IXpsOMPartResources*, dictionaryResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_dictionary_resources.call(this, dictionaryResources)
    end

  end

  @[Extern]
  record IXpsOMDictionaryVtbl,
    query_interface : Proc(IXpsOMDictionary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDictionary*, UInt32),
    release : Proc(IXpsOMDictionary*, UInt32),
    get_owner : Proc(IXpsOMDictionary*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IXpsOMDictionary*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMDictionary*, UInt32, Win32cr::Foundation::PWSTR*, Void**, Win32cr::Foundation::HRESULT),
    get_by_key : Proc(IXpsOMDictionary*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_index : Proc(IXpsOMDictionary*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMDictionary*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMDictionary*, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMDictionary*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMDictionary*, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMDictionary*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDictionary, lpVtbl : IXpsOMDictionaryVtbl* do
    GUID = LibC::GUID.new(0x897c86b8_u32, 0x8eaf_u16, 0x4ae3_u16, StaticArray[0xbd_u8, 0xde_u8, 0x56_u8, 0x41_u8, 0x9f_u8, 0xcf_u8, 0x42_u8, 0x36_u8])
    def query_interface(this : IXpsOMDictionary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDictionary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDictionary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMDictionary*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_count(this : IXpsOMDictionary*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMDictionary*, index : UInt32, key : Win32cr::Foundation::PWSTR*, entry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, key, entry)
    end
    def get_by_key(this : IXpsOMDictionary*, key : Win32cr::Foundation::PWSTR, beforeEntry : Void*, entry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_key.call(this, key, beforeEntry, entry)
    end
    def get_index(this : IXpsOMDictionary*, entry : Void*, index : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, entry, index)
    end
    def append(this : IXpsOMDictionary*, key : Win32cr::Foundation::PWSTR, entry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, key, entry)
    end
    def insert_at(this : IXpsOMDictionary*, index : UInt32, key : Win32cr::Foundation::PWSTR, entry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, key, entry)
    end
    def remove_at(this : IXpsOMDictionary*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMDictionary*, index : UInt32, key : Win32cr::Foundation::PWSTR, entry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, key, entry)
    end
    def clone(this : IXpsOMDictionary*, dictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, dictionary)
    end

  end

  @[Extern]
  record IXpsOMFontResourceVtbl,
    query_interface : Proc(IXpsOMFontResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMFontResource*, UInt32),
    release : Proc(IXpsOMFontResource*, UInt32),
    get_part_name : Proc(IXpsOMFontResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMFontResource*, Void*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMFontResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMFontResource*, Void*, Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, Void*, Win32cr::Foundation::HRESULT),
    get_embedding_option : Proc(IXpsOMFontResource*, Win32cr::Storage::Xps::XPS_FONT_EMBEDDING*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMFontResource, lpVtbl : IXpsOMFontResourceVtbl* do
    GUID = LibC::GUID.new(0xa8c45708_u32, 0x47d9_u16, 0x4af4_u16, StaticArray[0x8d_u8, 0x20_u8, 0x33_u8, 0xb4_u8, 0x8c_u8, 0x9b_u8, 0x84_u8, 0x85_u8])
    def query_interface(this : IXpsOMFontResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMFontResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMFontResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMFontResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMFontResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_stream(this : IXpsOMFontResource*, readerStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, readerStream)
    end
    def set_content(this : IXpsOMFontResource*, sourceStream : Void*, embeddingOption : Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, embeddingOption, partName)
    end
    def get_embedding_option(this : IXpsOMFontResource*, embeddingOption : Win32cr::Storage::Xps::XPS_FONT_EMBEDDING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedding_option.call(this, embeddingOption)
    end

  end

  @[Extern]
  record IXpsOMFontResourceCollectionVtbl,
    query_interface : Proc(IXpsOMFontResourceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMFontResourceCollection*, UInt32),
    release : Proc(IXpsOMFontResourceCollection*, UInt32),
    get_count : Proc(IXpsOMFontResourceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMFontResourceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMFontResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMFontResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMFontResourceCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMFontResourceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    get_by_part_name : Proc(IXpsOMFontResourceCollection*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMFontResourceCollection, lpVtbl : IXpsOMFontResourceCollectionVtbl* do
    GUID = LibC::GUID.new(0x70b4a6bb_u32, 0x88d4_u16, 0x4fa8_u16, StaticArray[0xaa_u8, 0xf9_u8, 0x6d_u8, 0x9c_u8, 0x59_u8, 0x6f_u8, 0xdb_u8, 0xad_u8])
    def query_interface(this : IXpsOMFontResourceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMFontResourceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMFontResourceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMFontResourceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMFontResourceCollection*, index : UInt32, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, value)
    end
    def set_at(this : IXpsOMFontResourceCollection*, index : UInt32, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, value)
    end
    def insert_at(this : IXpsOMFontResourceCollection*, index : UInt32, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, value)
    end
    def append(this : IXpsOMFontResourceCollection*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, value)
    end
    def remove_at(this : IXpsOMFontResourceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def get_by_part_name(this : IXpsOMFontResourceCollection*, partName : Void*, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_part_name.call(this, partName, part)
    end

  end

  @[Extern]
  record IXpsOMImageResourceVtbl,
    query_interface : Proc(IXpsOMImageResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMImageResource*, UInt32),
    release : Proc(IXpsOMImageResource*, UInt32),
    get_part_name : Proc(IXpsOMImageResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMImageResource*, Void*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMImageResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMImageResource*, Void*, Win32cr::Storage::Xps::XPS_IMAGE_TYPE, Void*, Win32cr::Foundation::HRESULT),
    get_image_type : Proc(IXpsOMImageResource*, Win32cr::Storage::Xps::XPS_IMAGE_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMImageResource, lpVtbl : IXpsOMImageResourceVtbl* do
    GUID = LibC::GUID.new(0x3db8417d_u32, 0xae50_u16, 0x485e_u16, StaticArray[0x9a_u8, 0x44_u8, 0xd7_u8, 0x75_u8, 0x8f_u8, 0x78_u8, 0xa2_u8, 0x3f_u8])
    def query_interface(this : IXpsOMImageResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMImageResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMImageResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMImageResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMImageResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_stream(this : IXpsOMImageResource*, readerStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, readerStream)
    end
    def set_content(this : IXpsOMImageResource*, sourceStream : Void*, imageType : Win32cr::Storage::Xps::XPS_IMAGE_TYPE, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, imageType, partName)
    end
    def get_image_type(this : IXpsOMImageResource*, imageType : Win32cr::Storage::Xps::XPS_IMAGE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_type.call(this, imageType)
    end

  end

  @[Extern]
  record IXpsOMImageResourceCollectionVtbl,
    query_interface : Proc(IXpsOMImageResourceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMImageResourceCollection*, UInt32),
    release : Proc(IXpsOMImageResourceCollection*, UInt32),
    get_count : Proc(IXpsOMImageResourceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMImageResourceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMImageResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMImageResourceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMImageResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMImageResourceCollection*, Void*, Win32cr::Foundation::HRESULT),
    get_by_part_name : Proc(IXpsOMImageResourceCollection*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMImageResourceCollection, lpVtbl : IXpsOMImageResourceCollectionVtbl* do
    GUID = LibC::GUID.new(0x7a4a1a71_u32, 0x9cde_u16, 0x4b71_u16, StaticArray[0xb3_u8, 0x3f_u8, 0x62_u8, 0xde_u8, 0x84_u8, 0x3e_u8, 0xab_u8, 0xfe_u8])
    def query_interface(this : IXpsOMImageResourceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMImageResourceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMImageResourceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMImageResourceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMImageResourceCollection*, index : UInt32, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, object)
    end
    def insert_at(this : IXpsOMImageResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, object)
    end
    def remove_at(this : IXpsOMImageResourceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMImageResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, object)
    end
    def append(this : IXpsOMImageResourceCollection*, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, object)
    end
    def get_by_part_name(this : IXpsOMImageResourceCollection*, partName : Void*, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_part_name.call(this, partName, part)
    end

  end

  @[Extern]
  record IXpsOMColorProfileResourceVtbl,
    query_interface : Proc(IXpsOMColorProfileResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMColorProfileResource*, UInt32),
    release : Proc(IXpsOMColorProfileResource*, UInt32),
    get_part_name : Proc(IXpsOMColorProfileResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMColorProfileResource*, Void*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMColorProfileResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMColorProfileResource*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMColorProfileResource, lpVtbl : IXpsOMColorProfileResourceVtbl* do
    GUID = LibC::GUID.new(0x67bd7d69_u32, 0x1eef_u16, 0x4bb1_u16, StaticArray[0xb5_u8, 0xe7_u8, 0x6f_u8, 0x4f_u8, 0x87_u8, 0xbe_u8, 0x8a_u8, 0xbe_u8])
    def query_interface(this : IXpsOMColorProfileResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMColorProfileResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMColorProfileResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMColorProfileResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMColorProfileResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_stream(this : IXpsOMColorProfileResource*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end
    def set_content(this : IXpsOMColorProfileResource*, sourceStream : Void*, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, partName)
    end

  end

  @[Extern]
  record IXpsOMColorProfileResourceCollectionVtbl,
    query_interface : Proc(IXpsOMColorProfileResourceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMColorProfileResourceCollection*, UInt32),
    release : Proc(IXpsOMColorProfileResourceCollection*, UInt32),
    get_count : Proc(IXpsOMColorProfileResourceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMColorProfileResourceCollection*, Void*, Win32cr::Foundation::HRESULT),
    get_by_part_name : Proc(IXpsOMColorProfileResourceCollection*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMColorProfileResourceCollection, lpVtbl : IXpsOMColorProfileResourceCollectionVtbl* do
    GUID = LibC::GUID.new(0x12759630_u32, 0x5fba_u16, 0x4283_u16, StaticArray[0x8f_u8, 0x7d_u8, 0xcc_u8, 0xa8_u8, 0x49_u8, 0x80_u8, 0x9e_u8, 0xdb_u8])
    def query_interface(this : IXpsOMColorProfileResourceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMColorProfileResourceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMColorProfileResourceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMColorProfileResourceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMColorProfileResourceCollection*, index : UInt32, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, object)
    end
    def insert_at(this : IXpsOMColorProfileResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, object)
    end
    def remove_at(this : IXpsOMColorProfileResourceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMColorProfileResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, object)
    end
    def append(this : IXpsOMColorProfileResourceCollection*, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, object)
    end
    def get_by_part_name(this : IXpsOMColorProfileResourceCollection*, partName : Void*, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_part_name.call(this, partName, part)
    end

  end

  @[Extern]
  record IXpsOMPrintTicketResourceVtbl,
    query_interface : Proc(IXpsOMPrintTicketResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPrintTicketResource*, UInt32),
    release : Proc(IXpsOMPrintTicketResource*, UInt32),
    get_part_name : Proc(IXpsOMPrintTicketResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMPrintTicketResource*, Void*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMPrintTicketResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMPrintTicketResource*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPrintTicketResource, lpVtbl : IXpsOMPrintTicketResourceVtbl* do
    GUID = LibC::GUID.new(0xe7ff32d2_u32, 0x34aa_u16, 0x499b_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x9c_u8, 0xd4_u8, 0xee_u8, 0x6c_u8, 0x59_u8, 0xf7_u8])
    def query_interface(this : IXpsOMPrintTicketResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPrintTicketResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPrintTicketResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMPrintTicketResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMPrintTicketResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_stream(this : IXpsOMPrintTicketResource*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end
    def set_content(this : IXpsOMPrintTicketResource*, sourceStream : Void*, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, partName)
    end

  end

  @[Extern]
  record IXpsOMRemoteDictionaryResourceVtbl,
    query_interface : Proc(IXpsOMRemoteDictionaryResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMRemoteDictionaryResource*, UInt32),
    release : Proc(IXpsOMRemoteDictionaryResource*, UInt32),
    get_part_name : Proc(IXpsOMRemoteDictionaryResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMRemoteDictionaryResource*, Void*, Win32cr::Foundation::HRESULT),
    get_dictionary : Proc(IXpsOMRemoteDictionaryResource*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary : Proc(IXpsOMRemoteDictionaryResource*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMRemoteDictionaryResource, lpVtbl : IXpsOMRemoteDictionaryResourceVtbl* do
    GUID = LibC::GUID.new(0xc9bd7cd4_u32, 0xe16a_u16, 0x4bf8_u16, StaticArray[0x8c_u8, 0x84_u8, 0xc9_u8, 0x50_u8, 0xaf_u8, 0x7a_u8, 0x30_u8, 0x61_u8])
    def query_interface(this : IXpsOMRemoteDictionaryResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMRemoteDictionaryResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMRemoteDictionaryResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMRemoteDictionaryResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMRemoteDictionaryResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_dictionary(this : IXpsOMRemoteDictionaryResource*, dictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary.call(this, dictionary)
    end
    def set_dictionary(this : IXpsOMRemoteDictionaryResource*, dictionary : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary.call(this, dictionary)
    end

  end

  @[Extern]
  record IXpsOMRemoteDictionaryResourceCollectionVtbl,
    query_interface : Proc(IXpsOMRemoteDictionaryResourceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32),
    release : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32),
    get_count : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMRemoteDictionaryResourceCollection*, Void*, Win32cr::Foundation::HRESULT),
    get_by_part_name : Proc(IXpsOMRemoteDictionaryResourceCollection*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMRemoteDictionaryResourceCollection, lpVtbl : IXpsOMRemoteDictionaryResourceCollectionVtbl* do
    GUID = LibC::GUID.new(0x5c38db61_u32, 0x7fec_u16, 0x464a_u16, StaticArray[0x87_u8, 0xbd_u8, 0x41_u8, 0xe3_u8, 0xbe_u8, 0xf0_u8, 0x18_u8, 0xbe_u8])
    def query_interface(this : IXpsOMRemoteDictionaryResourceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMRemoteDictionaryResourceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMRemoteDictionaryResourceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMRemoteDictionaryResourceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMRemoteDictionaryResourceCollection*, index : UInt32, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, object)
    end
    def insert_at(this : IXpsOMRemoteDictionaryResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, object)
    end
    def remove_at(this : IXpsOMRemoteDictionaryResourceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMRemoteDictionaryResourceCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, object)
    end
    def append(this : IXpsOMRemoteDictionaryResourceCollection*, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, object)
    end
    def get_by_part_name(this : IXpsOMRemoteDictionaryResourceCollection*, partName : Void*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_part_name.call(this, partName, remoteDictionaryResource)
    end

  end

  @[Extern]
  record IXpsOMSignatureBlockResourceCollectionVtbl,
    query_interface : Proc(IXpsOMSignatureBlockResourceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32),
    release : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32),
    get_count : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMSignatureBlockResourceCollection*, Void*, Win32cr::Foundation::HRESULT),
    get_by_part_name : Proc(IXpsOMSignatureBlockResourceCollection*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMSignatureBlockResourceCollection, lpVtbl : IXpsOMSignatureBlockResourceCollectionVtbl* do
    GUID = LibC::GUID.new(0xab8f5d8e_u32, 0x351b_u16, 0x4d33_u16, StaticArray[0xaa_u8, 0xed_u8, 0xfa_u8, 0x56_u8, 0xf0_u8, 0x2_u8, 0x29_u8, 0x31_u8])
    def query_interface(this : IXpsOMSignatureBlockResourceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMSignatureBlockResourceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMSignatureBlockResourceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMSignatureBlockResourceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMSignatureBlockResourceCollection*, index : UInt32, signatureBlockResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, signatureBlockResource)
    end
    def insert_at(this : IXpsOMSignatureBlockResourceCollection*, index : UInt32, signatureBlockResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, signatureBlockResource)
    end
    def remove_at(this : IXpsOMSignatureBlockResourceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMSignatureBlockResourceCollection*, index : UInt32, signatureBlockResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, signatureBlockResource)
    end
    def append(this : IXpsOMSignatureBlockResourceCollection*, signatureBlockResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, signatureBlockResource)
    end
    def get_by_part_name(this : IXpsOMSignatureBlockResourceCollection*, partName : Void*, signatureBlockResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_part_name.call(this, partName, signatureBlockResource)
    end

  end

  @[Extern]
  record IXpsOMDocumentStructureResourceVtbl,
    query_interface : Proc(IXpsOMDocumentStructureResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDocumentStructureResource*, UInt32),
    release : Proc(IXpsOMDocumentStructureResource*, UInt32),
    get_part_name : Proc(IXpsOMDocumentStructureResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMDocumentStructureResource*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMDocumentStructureResource*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMDocumentStructureResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMDocumentStructureResource*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDocumentStructureResource, lpVtbl : IXpsOMDocumentStructureResourceVtbl* do
    GUID = LibC::GUID.new(0x85febc8a_u32, 0x6b63_u16, 0x48a9_u16, StaticArray[0xaf_u8, 0x7_u8, 0x70_u8, 0x64_u8, 0xe4_u8, 0xec_u8, 0xff_u8, 0x30_u8])
    def query_interface(this : IXpsOMDocumentStructureResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDocumentStructureResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDocumentStructureResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMDocumentStructureResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMDocumentStructureResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMDocumentStructureResource*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_stream(this : IXpsOMDocumentStructureResource*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end
    def set_content(this : IXpsOMDocumentStructureResource*, sourceStream : Void*, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, partName)
    end

  end

  @[Extern]
  record IXpsOMStoryFragmentsResourceVtbl,
    query_interface : Proc(IXpsOMStoryFragmentsResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMStoryFragmentsResource*, UInt32),
    release : Proc(IXpsOMStoryFragmentsResource*, UInt32),
    get_part_name : Proc(IXpsOMStoryFragmentsResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMStoryFragmentsResource*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMStoryFragmentsResource*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMStoryFragmentsResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMStoryFragmentsResource*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMStoryFragmentsResource, lpVtbl : IXpsOMStoryFragmentsResourceVtbl* do
    GUID = LibC::GUID.new(0xc2b3ca09_u32, 0x473_u16, 0x4282_u16, StaticArray[0x87_u8, 0xae_u8, 0x17_u8, 0x80_u8, 0x86_u8, 0x32_u8, 0x23_u8, 0xf0_u8])
    def query_interface(this : IXpsOMStoryFragmentsResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMStoryFragmentsResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMStoryFragmentsResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMStoryFragmentsResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMStoryFragmentsResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMStoryFragmentsResource*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_stream(this : IXpsOMStoryFragmentsResource*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end
    def set_content(this : IXpsOMStoryFragmentsResource*, sourceStream : Void*, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, partName)
    end

  end

  @[Extern]
  record IXpsOMSignatureBlockResourceVtbl,
    query_interface : Proc(IXpsOMSignatureBlockResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMSignatureBlockResource*, UInt32),
    release : Proc(IXpsOMSignatureBlockResource*, UInt32),
    get_part_name : Proc(IXpsOMSignatureBlockResource*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMSignatureBlockResource*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMSignatureBlockResource*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IXpsOMSignatureBlockResource*, Void**, Win32cr::Foundation::HRESULT),
    set_content : Proc(IXpsOMSignatureBlockResource*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMSignatureBlockResource, lpVtbl : IXpsOMSignatureBlockResourceVtbl* do
    GUID = LibC::GUID.new(0x4776ad35_u32, 0x2e04_u16, 0x4357_u16, StaticArray[0x87_u8, 0x43_u8, 0xeb_u8, 0xf6_u8, 0xc1_u8, 0x71_u8, 0xa9_u8, 0x5_u8])
    def query_interface(this : IXpsOMSignatureBlockResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMSignatureBlockResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMSignatureBlockResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMSignatureBlockResource*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMSignatureBlockResource*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMSignatureBlockResource*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_stream(this : IXpsOMSignatureBlockResource*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end
    def set_content(this : IXpsOMSignatureBlockResource*, sourceStream : Void*, partName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, sourceStream, partName)
    end

  end

  @[Extern]
  record IXpsOMVisualCollectionVtbl,
    query_interface : Proc(IXpsOMVisualCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMVisualCollection*, UInt32),
    release : Proc(IXpsOMVisualCollection*, UInt32),
    get_count : Proc(IXpsOMVisualCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMVisualCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMVisualCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMVisualCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMVisualCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMVisualCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMVisualCollection, lpVtbl : IXpsOMVisualCollectionVtbl* do
    GUID = LibC::GUID.new(0x94d8abde_u32, 0xab91_u16, 0x46a8_u16, StaticArray[0x82_u8, 0xb7_u8, 0xf5_u8, 0xb0_u8, 0x5e_u8, 0xf0_u8, 0x1a_u8, 0x96_u8])
    def query_interface(this : IXpsOMVisualCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMVisualCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMVisualCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMVisualCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMVisualCollection*, index : UInt32, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, object)
    end
    def insert_at(this : IXpsOMVisualCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, object)
    end
    def remove_at(this : IXpsOMVisualCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMVisualCollection*, index : UInt32, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, object)
    end
    def append(this : IXpsOMVisualCollection*, object : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, object)
    end

  end

  @[Extern]
  record IXpsOMCanvasVtbl,
    query_interface : Proc(IXpsOMCanvas*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMCanvas*, UInt32),
    release : Proc(IXpsOMCanvas*, UInt32),
    get_owner : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IXpsOMCanvas*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_transform_local : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_transform_local : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    get_transform_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_transform_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_clip_geometry : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_clip_geometry_local : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_clip_geometry_local : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    get_clip_geometry_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_clip_geometry_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_opacity : Proc(IXpsOMCanvas*, Float32*, Win32cr::Foundation::HRESULT),
    set_opacity : Proc(IXpsOMCanvas*, Float32, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_local : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_local : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    get_opacity_mask_brush_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_opacity_mask_brush_lookup : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMCanvas*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMCanvas*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_hyperlink_navigate_uri : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_hyperlink_navigate_uri : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_visuals : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_use_aliased_edge_mode : Proc(IXpsOMCanvas*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_use_aliased_edge_mode : Proc(IXpsOMCanvas*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_accessibility_short_description : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_accessibility_short_description : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_accessibility_long_description : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_accessibility_long_description : Proc(IXpsOMCanvas*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_dictionary : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    get_dictionary_local : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_local : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    get_dictionary_resource : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_resource : Proc(IXpsOMCanvas*, Void*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMCanvas*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMCanvas, lpVtbl : IXpsOMCanvasVtbl* do
    GUID = LibC::GUID.new(0x221d1452_u32, 0x331e_u16, 0x47c6_u16, StaticArray[0x87_u8, 0xe9_u8, 0x6c_u8, 0xce_u8, 0xfb_u8, 0x9b_u8, 0x5b_u8, 0xa3_u8])
    def query_interface(this : IXpsOMCanvas*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMCanvas*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMCanvas*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMCanvas*, owner : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, owner)
    end
    def get_type(this : IXpsOMCanvas*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_transform(this : IXpsOMCanvas*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, matrixTransform)
    end
    def get_transform_local(this : IXpsOMCanvas*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_local.call(this, matrixTransform)
    end
    def set_transform_local(this : IXpsOMCanvas*, matrixTransform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_local.call(this, matrixTransform)
    end
    def get_transform_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_lookup.call(this, key)
    end
    def set_transform_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_lookup.call(this, key)
    end
    def get_clip_geometry(this : IXpsOMCanvas*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry.call(this, clipGeometry)
    end
    def get_clip_geometry_local(this : IXpsOMCanvas*, clipGeometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_local.call(this, clipGeometry)
    end
    def set_clip_geometry_local(this : IXpsOMCanvas*, clipGeometry : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_local.call(this, clipGeometry)
    end
    def get_clip_geometry_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clip_geometry_lookup.call(this, key)
    end
    def set_clip_geometry_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_geometry_lookup.call(this, key)
    end
    def get_opacity(this : IXpsOMCanvas*, opacity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity.call(this, opacity)
    end
    def set_opacity(this : IXpsOMCanvas*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity.call(this, opacity)
    end
    def get_opacity_mask_brush(this : IXpsOMCanvas*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_local(this : IXpsOMCanvas*, opacityMaskBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def set_opacity_mask_brush_local(this : IXpsOMCanvas*, opacityMaskBrush : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_local.call(this, opacityMaskBrush)
    end
    def get_opacity_mask_brush_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_opacity_mask_brush_lookup.call(this, key)
    end
    def set_opacity_mask_brush_lookup(this : IXpsOMCanvas*, key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mask_brush_lookup.call(this, key)
    end
    def get_name(this : IXpsOMCanvas*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMCanvas*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMCanvas*, isHyperlink : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlink)
    end
    def set_is_hyperlink_target(this : IXpsOMCanvas*, isHyperlink : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlink)
    end
    def get_hyperlink_navigate_uri(this : IXpsOMCanvas*, hyperlinkUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def set_hyperlink_navigate_uri(this : IXpsOMCanvas*, hyperlinkUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hyperlink_navigate_uri.call(this, hyperlinkUri)
    end
    def get_language(this : IXpsOMCanvas*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMCanvas*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_visuals(this : IXpsOMCanvas*, visuals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visuals.call(this, visuals)
    end
    def get_use_aliased_edge_mode(this : IXpsOMCanvas*, useAliasedEdgeMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_use_aliased_edge_mode.call(this, useAliasedEdgeMode)
    end
    def set_use_aliased_edge_mode(this : IXpsOMCanvas*, useAliasedEdgeMode : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_use_aliased_edge_mode.call(this, useAliasedEdgeMode)
    end
    def get_accessibility_short_description(this : IXpsOMCanvas*, shortDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accessibility_short_description.call(this, shortDescription)
    end
    def set_accessibility_short_description(this : IXpsOMCanvas*, shortDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accessibility_short_description.call(this, shortDescription)
    end
    def get_accessibility_long_description(this : IXpsOMCanvas*, longDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accessibility_long_description.call(this, longDescription)
    end
    def set_accessibility_long_description(this : IXpsOMCanvas*, longDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accessibility_long_description.call(this, longDescription)
    end
    def get_dictionary(this : IXpsOMCanvas*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary.call(this, resourceDictionary)
    end
    def get_dictionary_local(this : IXpsOMCanvas*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_local.call(this, resourceDictionary)
    end
    def set_dictionary_local(this : IXpsOMCanvas*, resourceDictionary : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_local.call(this, resourceDictionary)
    end
    def get_dictionary_resource(this : IXpsOMCanvas*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def set_dictionary_resource(this : IXpsOMCanvas*, remoteDictionaryResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def clone(this : IXpsOMCanvas*, canvas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, canvas)
    end

  end

  @[Extern]
  record IXpsOMPageVtbl,
    query_interface : Proc(IXpsOMPage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPage*, UInt32),
    release : Proc(IXpsOMPage*, UInt32),
    get_part_name : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMPage*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    get_visuals : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    get_page_dimensions : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    set_page_dimensions : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    get_content_box : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_content_box : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_bleed_box : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_bleed_box : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMPage*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMPage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMPage*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMPage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMPage*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMPage*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_dictionary : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    get_dictionary_local : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_local : Proc(IXpsOMPage*, Void*, Win32cr::Foundation::HRESULT),
    get_dictionary_resource : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_resource : Proc(IXpsOMPage*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(IXpsOMPage*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    generate_unused_lookup_key : Proc(IXpsOMPage*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMPage*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPage, lpVtbl : IXpsOMPageVtbl* do
    GUID = LibC::GUID.new(0xd3e18888_u32, 0xf120_u16, 0x4fee_u16, StaticArray[0x8c_u8, 0x68_u8, 0x35_u8, 0x29_u8, 0x6e_u8, 0xae_u8, 0x91_u8, 0xd4_u8])
    def query_interface(this : IXpsOMPage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMPage*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMPage*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMPage*, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pageReference)
    end
    def get_visuals(this : IXpsOMPage*, visuals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visuals.call(this, visuals)
    end
    def get_page_dimensions(this : IXpsOMPage*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_dimensions.call(this, pageDimensions)
    end
    def set_page_dimensions(this : IXpsOMPage*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_dimensions.call(this, pageDimensions)
    end
    def get_content_box(this : IXpsOMPage*, contentBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_box.call(this, contentBox)
    end
    def set_content_box(this : IXpsOMPage*, contentBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content_box.call(this, contentBox)
    end
    def get_bleed_box(this : IXpsOMPage*, bleedBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bleed_box.call(this, bleedBox)
    end
    def set_bleed_box(this : IXpsOMPage*, bleedBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bleed_box.call(this, bleedBox)
    end
    def get_language(this : IXpsOMPage*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMPage*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_name(this : IXpsOMPage*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMPage*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMPage*, isHyperlinkTarget : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlinkTarget)
    end
    def set_is_hyperlink_target(this : IXpsOMPage*, isHyperlinkTarget : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlinkTarget)
    end
    def get_dictionary(this : IXpsOMPage*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary.call(this, resourceDictionary)
    end
    def get_dictionary_local(this : IXpsOMPage*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_local.call(this, resourceDictionary)
    end
    def set_dictionary_local(this : IXpsOMPage*, resourceDictionary : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_local.call(this, resourceDictionary)
    end
    def get_dictionary_resource(this : IXpsOMPage*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def set_dictionary_resource(this : IXpsOMPage*, remoteDictionaryResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def write(this : IXpsOMPage*, stream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, stream, optimizeMarkupSize)
    end
    def generate_unused_lookup_key(this : IXpsOMPage*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_unused_lookup_key.call(this, type__, key)
    end
    def clone(this : IXpsOMPage*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, page)
    end

  end

  @[Extern]
  record IXpsOMPageReferenceVtbl,
    query_interface : Proc(IXpsOMPageReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPageReference*, UInt32),
    release : Proc(IXpsOMPageReference*, UInt32),
    get_owner : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    get_page : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    set_page : Proc(IXpsOMPageReference*, Void*, Win32cr::Foundation::HRESULT),
    discard_page : Proc(IXpsOMPageReference*, Win32cr::Foundation::HRESULT),
    is_page_loaded : Proc(IXpsOMPageReference*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_advisory_page_dimensions : Proc(IXpsOMPageReference*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    set_advisory_page_dimensions : Proc(IXpsOMPageReference*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    get_story_fragments_resource : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    set_story_fragments_resource : Proc(IXpsOMPageReference*, Void*, Win32cr::Foundation::HRESULT),
    get_print_ticket_resource : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    set_print_ticket_resource : Proc(IXpsOMPageReference*, Void*, Win32cr::Foundation::HRESULT),
    get_thumbnail_resource : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    set_thumbnail_resource : Proc(IXpsOMPageReference*, Void*, Win32cr::Foundation::HRESULT),
    collect_link_targets : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    collect_part_resources : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT),
    has_restricted_fonts : Proc(IXpsOMPageReference*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMPageReference*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPageReference, lpVtbl : IXpsOMPageReferenceVtbl* do
    GUID = LibC::GUID.new(0xed360180_u32, 0x6f92_u16, 0x4998_u16, StaticArray[0x89_u8, 0xd_u8, 0x2f_u8, 0x20_u8, 0x85_u8, 0x31_u8, 0xa0_u8, 0xa0_u8])
    def query_interface(this : IXpsOMPageReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPageReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPageReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner(this : IXpsOMPageReference*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, document)
    end
    def get_page(this : IXpsOMPageReference*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page.call(this, page)
    end
    def set_page(this : IXpsOMPageReference*, page : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page.call(this, page)
    end
    def discard_page(this : IXpsOMPageReference*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.discard_page.call(this)
    end
    def is_page_loaded(this : IXpsOMPageReference*, isPageLoaded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_page_loaded.call(this, isPageLoaded)
    end
    def get_advisory_page_dimensions(this : IXpsOMPageReference*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_advisory_page_dimensions.call(this, pageDimensions)
    end
    def set_advisory_page_dimensions(this : IXpsOMPageReference*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_advisory_page_dimensions.call(this, pageDimensions)
    end
    def get_story_fragments_resource(this : IXpsOMPageReference*, storyFragmentsResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_story_fragments_resource.call(this, storyFragmentsResource)
    end
    def set_story_fragments_resource(this : IXpsOMPageReference*, storyFragmentsResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_story_fragments_resource.call(this, storyFragmentsResource)
    end
    def get_print_ticket_resource(this : IXpsOMPageReference*, printTicketResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_print_ticket_resource.call(this, printTicketResource)
    end
    def set_print_ticket_resource(this : IXpsOMPageReference*, printTicketResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_print_ticket_resource.call(this, printTicketResource)
    end
    def get_thumbnail_resource(this : IXpsOMPageReference*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail_resource.call(this, imageResource)
    end
    def set_thumbnail_resource(this : IXpsOMPageReference*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thumbnail_resource.call(this, imageResource)
    end
    def collect_link_targets(this : IXpsOMPageReference*, linkTargets : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_link_targets.call(this, linkTargets)
    end
    def collect_part_resources(this : IXpsOMPageReference*, partResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_part_resources.call(this, partResources)
    end
    def has_restricted_fonts(this : IXpsOMPageReference*, restrictedFonts : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_restricted_fonts.call(this, restrictedFonts)
    end
    def clone(this : IXpsOMPageReference*, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pageReference)
    end

  end

  @[Extern]
  record IXpsOMPageReferenceCollectionVtbl,
    query_interface : Proc(IXpsOMPageReferenceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPageReferenceCollection*, UInt32),
    release : Proc(IXpsOMPageReferenceCollection*, UInt32),
    get_count : Proc(IXpsOMPageReferenceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMPageReferenceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMPageReferenceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMPageReferenceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMPageReferenceCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMPageReferenceCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPageReferenceCollection, lpVtbl : IXpsOMPageReferenceCollectionVtbl* do
    GUID = LibC::GUID.new(0xca16ba4d_u32, 0xe7b9_u16, 0x45c5_u16, StaticArray[0x95_u8, 0x8b_u8, 0xf9_u8, 0x80_u8, 0x22_u8, 0x47_u8, 0x37_u8, 0x45_u8])
    def query_interface(this : IXpsOMPageReferenceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPageReferenceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPageReferenceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMPageReferenceCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMPageReferenceCollection*, index : UInt32, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, pageReference)
    end
    def insert_at(this : IXpsOMPageReferenceCollection*, index : UInt32, pageReference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, pageReference)
    end
    def remove_at(this : IXpsOMPageReferenceCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMPageReferenceCollection*, index : UInt32, pageReference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, pageReference)
    end
    def append(this : IXpsOMPageReferenceCollection*, pageReference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, pageReference)
    end

  end

  @[Extern]
  record IXpsOMDocumentVtbl,
    query_interface : Proc(IXpsOMDocument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDocument*, UInt32),
    release : Proc(IXpsOMDocument*, UInt32),
    get_part_name : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMDocument*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_page_references : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_print_ticket_resource : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    set_print_ticket_resource : Proc(IXpsOMDocument*, Void*, Win32cr::Foundation::HRESULT),
    get_document_structure_resource : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    set_document_structure_resource : Proc(IXpsOMDocument*, Void*, Win32cr::Foundation::HRESULT),
    get_signature_block_resources : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMDocument*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDocument, lpVtbl : IXpsOMDocumentVtbl* do
    GUID = LibC::GUID.new(0x2c2c94cb_u32, 0xac5f_u16, 0x4254_u16, StaticArray[0x8e_u8, 0xe9_u8, 0x23_u8, 0x94_u8, 0x83_u8, 0x9_u8, 0xd9_u8, 0xf0_u8])
    def query_interface(this : IXpsOMDocument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDocument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDocument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMDocument*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMDocument*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMDocument*, documentSequence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, documentSequence)
    end
    def get_page_references(this : IXpsOMDocument*, pageReferences : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_references.call(this, pageReferences)
    end
    def get_print_ticket_resource(this : IXpsOMDocument*, printTicketResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_print_ticket_resource.call(this, printTicketResource)
    end
    def set_print_ticket_resource(this : IXpsOMDocument*, printTicketResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_print_ticket_resource.call(this, printTicketResource)
    end
    def get_document_structure_resource(this : IXpsOMDocument*, documentStructureResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_structure_resource.call(this, documentStructureResource)
    end
    def set_document_structure_resource(this : IXpsOMDocument*, documentStructureResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_structure_resource.call(this, documentStructureResource)
    end
    def get_signature_block_resources(this : IXpsOMDocument*, signatureBlockResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_block_resources.call(this, signatureBlockResources)
    end
    def clone(this : IXpsOMDocument*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, document)
    end

  end

  @[Extern]
  record IXpsOMDocumentCollectionVtbl,
    query_interface : Proc(IXpsOMDocumentCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDocumentCollection*, UInt32),
    release : Proc(IXpsOMDocumentCollection*, UInt32),
    get_count : Proc(IXpsOMDocumentCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMDocumentCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMDocumentCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMDocumentCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMDocumentCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMDocumentCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDocumentCollection, lpVtbl : IXpsOMDocumentCollectionVtbl* do
    GUID = LibC::GUID.new(0xd1c87f0d_u32, 0xe947_u16, 0x4754_u16, StaticArray[0x8a_u8, 0x25_u8, 0x97_u8, 0x14_u8, 0x78_u8, 0xf7_u8, 0xe8_u8, 0x3e_u8])
    def query_interface(this : IXpsOMDocumentCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDocumentCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDocumentCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMDocumentCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMDocumentCollection*, index : UInt32, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, document)
    end
    def insert_at(this : IXpsOMDocumentCollection*, index : UInt32, document : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, document)
    end
    def remove_at(this : IXpsOMDocumentCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMDocumentCollection*, index : UInt32, document : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, document)
    end
    def append(this : IXpsOMDocumentCollection*, document : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, document)
    end

  end

  @[Extern]
  record IXpsOMDocumentSequenceVtbl,
    query_interface : Proc(IXpsOMDocumentSequence*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMDocumentSequence*, UInt32),
    release : Proc(IXpsOMDocumentSequence*, UInt32),
    get_part_name : Proc(IXpsOMDocumentSequence*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMDocumentSequence*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMDocumentSequence*, Void**, Win32cr::Foundation::HRESULT),
    get_documents : Proc(IXpsOMDocumentSequence*, Void**, Win32cr::Foundation::HRESULT),
    get_print_ticket_resource : Proc(IXpsOMDocumentSequence*, Void**, Win32cr::Foundation::HRESULT),
    set_print_ticket_resource : Proc(IXpsOMDocumentSequence*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMDocumentSequence, lpVtbl : IXpsOMDocumentSequenceVtbl* do
    GUID = LibC::GUID.new(0x56492eb4_u32, 0xd8d5_u16, 0x425e_u16, StaticArray[0x82_u8, 0x56_u8, 0x4c_u8, 0x2b_u8, 0x64_u8, 0xad_u8, 0x2_u8, 0x64_u8])
    def query_interface(this : IXpsOMDocumentSequence*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMDocumentSequence*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMDocumentSequence*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMDocumentSequence*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMDocumentSequence*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMDocumentSequence*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, package)
    end
    def get_documents(this : IXpsOMDocumentSequence*, documents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documents.call(this, documents)
    end
    def get_print_ticket_resource(this : IXpsOMDocumentSequence*, printTicketResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_print_ticket_resource.call(this, printTicketResource)
    end
    def set_print_ticket_resource(this : IXpsOMDocumentSequence*, printTicketResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_print_ticket_resource.call(this, printTicketResource)
    end

  end

  @[Extern]
  record IXpsOMCorePropertiesVtbl,
    query_interface : Proc(IXpsOMCoreProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMCoreProperties*, UInt32),
    release : Proc(IXpsOMCoreProperties*, UInt32),
    get_part_name : Proc(IXpsOMCoreProperties*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMCoreProperties*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMCoreProperties*, Void**, Win32cr::Foundation::HRESULT),
    get_category : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_category : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_content_status : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_content_status : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_content_type : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_content_type : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_created : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    set_created : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_creator : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_creator : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_identifier : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_identifier : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_keywords : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_keywords : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_last_modified_by : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_last_modified_by : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_last_printed : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    set_last_printed : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_modified : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    set_modified : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_revision : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_revision : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_subject : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_subject : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_title : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_title : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_version : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_version : Proc(IXpsOMCoreProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMCoreProperties*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMCoreProperties, lpVtbl : IXpsOMCorePropertiesVtbl* do
    GUID = LibC::GUID.new(0x3340fe8f_u32, 0x4027_u16, 0x4aa1_u16, StaticArray[0x8f_u8, 0x5f_u8, 0xd3_u8, 0x5a_u8, 0xe4_u8, 0x5f_u8, 0xe5_u8, 0x97_u8])
    def query_interface(this : IXpsOMCoreProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMCoreProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMCoreProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMCoreProperties*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMCoreProperties*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMCoreProperties*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, package)
    end
    def get_category(this : IXpsOMCoreProperties*, category : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, category)
    end
    def set_category(this : IXpsOMCoreProperties*, category : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_category.call(this, category)
    end
    def get_content_status(this : IXpsOMCoreProperties*, contentStatus : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_status.call(this, contentStatus)
    end
    def set_content_status(this : IXpsOMCoreProperties*, contentStatus : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content_status.call(this, contentStatus)
    end
    def get_content_type(this : IXpsOMCoreProperties*, contentType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_type.call(this, contentType)
    end
    def set_content_type(this : IXpsOMCoreProperties*, contentType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content_type.call(this, contentType)
    end
    def get_created(this : IXpsOMCoreProperties*, created : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_created.call(this, created)
    end
    def set_created(this : IXpsOMCoreProperties*, created : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_created.call(this, created)
    end
    def get_creator(this : IXpsOMCoreProperties*, creator : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_creator.call(this, creator)
    end
    def set_creator(this : IXpsOMCoreProperties*, creator : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_creator.call(this, creator)
    end
    def get_description(this : IXpsOMCoreProperties*, description : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, description)
    end
    def set_description(this : IXpsOMCoreProperties*, description : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, description)
    end
    def get_identifier(this : IXpsOMCoreProperties*, identifier : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_identifier.call(this, identifier)
    end
    def set_identifier(this : IXpsOMCoreProperties*, identifier : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_identifier.call(this, identifier)
    end
    def get_keywords(this : IXpsOMCoreProperties*, keywords : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_keywords.call(this, keywords)
    end
    def set_keywords(this : IXpsOMCoreProperties*, keywords : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_keywords.call(this, keywords)
    end
    def get_language(this : IXpsOMCoreProperties*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMCoreProperties*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_last_modified_by(this : IXpsOMCoreProperties*, lastModifiedBy : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_modified_by.call(this, lastModifiedBy)
    end
    def set_last_modified_by(this : IXpsOMCoreProperties*, lastModifiedBy : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_modified_by.call(this, lastModifiedBy)
    end
    def get_last_printed(this : IXpsOMCoreProperties*, lastPrinted : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_printed.call(this, lastPrinted)
    end
    def set_last_printed(this : IXpsOMCoreProperties*, lastPrinted : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_printed.call(this, lastPrinted)
    end
    def get_modified(this : IXpsOMCoreProperties*, modified : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modified.call(this, modified)
    end
    def set_modified(this : IXpsOMCoreProperties*, modified : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_modified.call(this, modified)
    end
    def get_revision(this : IXpsOMCoreProperties*, revision : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revision.call(this, revision)
    end
    def set_revision(this : IXpsOMCoreProperties*, revision : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_revision.call(this, revision)
    end
    def get_subject(this : IXpsOMCoreProperties*, subject : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subject.call(this, subject)
    end
    def set_subject(this : IXpsOMCoreProperties*, subject : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_subject.call(this, subject)
    end
    def get_title(this : IXpsOMCoreProperties*, title : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_title.call(this, title)
    end
    def set_title(this : IXpsOMCoreProperties*, title : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_title.call(this, title)
    end
    def get_version(this : IXpsOMCoreProperties*, version : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, version)
    end
    def set_version(this : IXpsOMCoreProperties*, version : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_version.call(this, version)
    end
    def clone(this : IXpsOMCoreProperties*, coreProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, coreProperties)
    end

  end

  @[Extern]
  record IXpsOMPackageVtbl,
    query_interface : Proc(IXpsOMPackage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPackage*, UInt32),
    release : Proc(IXpsOMPackage*, UInt32),
    get_document_sequence : Proc(IXpsOMPackage*, Void**, Win32cr::Foundation::HRESULT),
    set_document_sequence : Proc(IXpsOMPackage*, Void*, Win32cr::Foundation::HRESULT),
    get_core_properties : Proc(IXpsOMPackage*, Void**, Win32cr::Foundation::HRESULT),
    set_core_properties : Proc(IXpsOMPackage*, Void*, Win32cr::Foundation::HRESULT),
    get_discard_control_part_name : Proc(IXpsOMPackage*, Void**, Win32cr::Foundation::HRESULT),
    set_discard_control_part_name : Proc(IXpsOMPackage*, Void*, Win32cr::Foundation::HRESULT),
    get_thumbnail_resource : Proc(IXpsOMPackage*, Void**, Win32cr::Foundation::HRESULT),
    set_thumbnail_resource : Proc(IXpsOMPackage*, Void*, Win32cr::Foundation::HRESULT),
    write_to_file : Proc(IXpsOMPackage*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_to_stream : Proc(IXpsOMPackage*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPackage, lpVtbl : IXpsOMPackageVtbl* do
    GUID = LibC::GUID.new(0x18c3df65_u32, 0x81e1_u16, 0x4674_u16, StaticArray[0x91_u8, 0xdc_u8, 0xfc_u8, 0x45_u8, 0x2f_u8, 0x5a_u8, 0x41_u8, 0x6f_u8])
    def query_interface(this : IXpsOMPackage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPackage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPackage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_sequence(this : IXpsOMPackage*, documentSequence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_sequence.call(this, documentSequence)
    end
    def set_document_sequence(this : IXpsOMPackage*, documentSequence : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence.call(this, documentSequence)
    end
    def get_core_properties(this : IXpsOMPackage*, coreProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_properties.call(this, coreProperties)
    end
    def set_core_properties(this : IXpsOMPackage*, coreProperties : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_core_properties.call(this, coreProperties)
    end
    def get_discard_control_part_name(this : IXpsOMPackage*, discardControlPartUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_discard_control_part_name.call(this, discardControlPartUri)
    end
    def set_discard_control_part_name(this : IXpsOMPackage*, discardControlPartUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_discard_control_part_name.call(this, discardControlPartUri)
    end
    def get_thumbnail_resource(this : IXpsOMPackage*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail_resource.call(this, imageResource)
    end
    def set_thumbnail_resource(this : IXpsOMPackage*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thumbnail_resource.call(this, imageResource)
    end
    def write_to_file(this : IXpsOMPackage*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_file.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize)
    end
    def write_to_stream(this : IXpsOMPackage*, stream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_stream.call(this, stream, optimizeMarkupSize)
    end

  end

  @[Extern]
  record IXpsOMObjectFactoryVtbl,
    query_interface : Proc(IXpsOMObjectFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMObjectFactory*, UInt32),
    release : Proc(IXpsOMObjectFactory*, UInt32),
    create_package : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_file : Proc(IXpsOMObjectFactory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_stream : Proc(IXpsOMObjectFactory*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_story_fragments_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_document_structure_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_signature_block_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_remote_dictionary_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_remote_dictionary_resource_from_stream : Proc(IXpsOMObjectFactory*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_part_resources : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_document_sequence : Proc(IXpsOMObjectFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_document : Proc(IXpsOMObjectFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_page_reference : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_SIZE*, Void**, Win32cr::Foundation::HRESULT),
    create_page : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_page_from_stream : Proc(IXpsOMObjectFactory*, Void*, Void*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_canvas : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_glyphs : Proc(IXpsOMObjectFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_path : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_geometry : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_geometry_figure : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_POINT*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_MATRIX*, Void**, Win32cr::Foundation::HRESULT),
    create_solid_color_brush : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_color_profile_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_image_brush : Proc(IXpsOMObjectFactory*, Void*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Storage::Xps::XPS_RECT*, Void**, Win32cr::Foundation::HRESULT),
    create_visual_brush : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Storage::Xps::XPS_RECT*, Void**, Win32cr::Foundation::HRESULT),
    create_image_resource : Proc(IXpsOMObjectFactory*, Void*, Win32cr::Storage::Xps::XPS_IMAGE_TYPE, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_print_ticket_resource : Proc(IXpsOMObjectFactory*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_font_resource : Proc(IXpsOMObjectFactory*, Void*, Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_gradient_stop : Proc(IXpsOMObjectFactory*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Float32, Void**, Win32cr::Foundation::HRESULT),
    create_linear_gradient_brush : Proc(IXpsOMObjectFactory*, Void*, Void*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_POINT*, Void**, Win32cr::Foundation::HRESULT),
    create_radial_gradient_brush : Proc(IXpsOMObjectFactory*, Void*, Void*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_SIZE*, Void**, Win32cr::Foundation::HRESULT),
    create_core_properties : Proc(IXpsOMObjectFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_dictionary : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_part_uri_collection : Proc(IXpsOMObjectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_package_writer_on_file : Proc(IXpsOMObjectFactory*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_package_writer_on_stream : Proc(IXpsOMObjectFactory*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_part_uri : Proc(IXpsOMObjectFactory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_read_only_stream_on_file : Proc(IXpsOMObjectFactory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMObjectFactory, lpVtbl : IXpsOMObjectFactoryVtbl* do
    GUID = LibC::GUID.new(0xf9b2a685_u32, 0xa50d_u16, 0x4fc2_u16, StaticArray[0xb7_u8, 0x64_u8, 0xb5_u8, 0x6e_u8, 0x9_u8, 0x3e_u8, 0xa0_u8, 0xca_u8])
    def query_interface(this : IXpsOMObjectFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMObjectFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMObjectFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_package(this : IXpsOMObjectFactory*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package.call(this, package)
    end
    def create_package_from_file(this : IXpsOMObjectFactory*, filename : Win32cr::Foundation::PWSTR, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_file.call(this, filename, reuseObjects, package)
    end
    def create_package_from_stream(this : IXpsOMObjectFactory*, stream : Void*, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_stream.call(this, stream, reuseObjects, package)
    end
    def create_story_fragments_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, partUri : Void*, storyFragmentsResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_story_fragments_resource.call(this, acquiredStream, partUri, storyFragmentsResource)
    end
    def create_document_structure_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, partUri : Void*, documentStructureResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_structure_resource.call(this, acquiredStream, partUri, documentStructureResource)
    end
    def create_signature_block_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, partUri : Void*, signatureBlockResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_signature_block_resource.call(this, acquiredStream, partUri, signatureBlockResource)
    end
    def create_remote_dictionary_resource(this : IXpsOMObjectFactory*, dictionary : Void*, partUri : Void*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_remote_dictionary_resource.call(this, dictionary, partUri, remoteDictionaryResource)
    end
    def create_remote_dictionary_resource_from_stream(this : IXpsOMObjectFactory*, dictionaryMarkupStream : Void*, dictionaryPartUri : Void*, resources : Void*, dictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_remote_dictionary_resource_from_stream.call(this, dictionaryMarkupStream, dictionaryPartUri, resources, dictionaryResource)
    end
    def create_part_resources(this : IXpsOMObjectFactory*, partResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_resources.call(this, partResources)
    end
    def create_document_sequence(this : IXpsOMObjectFactory*, partUri : Void*, documentSequence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_sequence.call(this, partUri, documentSequence)
    end
    def create_document(this : IXpsOMObjectFactory*, partUri : Void*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document.call(this, partUri, document)
    end
    def create_page_reference(this : IXpsOMObjectFactory*, advisoryPageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page_reference.call(this, advisoryPageDimensions, pageReference)
    end
    def create_page(this : IXpsOMObjectFactory*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, language : Win32cr::Foundation::PWSTR, partUri : Void*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page.call(this, pageDimensions, language, partUri, page)
    end
    def create_page_from_stream(this : IXpsOMObjectFactory*, pageMarkupStream : Void*, partUri : Void*, resources : Void*, reuseObjects : Win32cr::Foundation::BOOL, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page_from_stream.call(this, pageMarkupStream, partUri, resources, reuseObjects, page)
    end
    def create_canvas(this : IXpsOMObjectFactory*, canvas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_canvas.call(this, canvas)
    end
    def create_glyphs(this : IXpsOMObjectFactory*, fontResource : Void*, glyphs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_glyphs.call(this, fontResource, glyphs)
    end
    def create_path(this : IXpsOMObjectFactory*, path : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_path.call(this, path)
    end
    def create_geometry(this : IXpsOMObjectFactory*, geometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_geometry.call(this, geometry)
    end
    def create_geometry_figure(this : IXpsOMObjectFactory*, startPoint : Win32cr::Storage::Xps::XPS_POINT*, figure : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_geometry_figure.call(this, startPoint, figure)
    end
    def create_matrix_transform(this : IXpsOMObjectFactory*, matrix : Win32cr::Storage::Xps::XPS_MATRIX*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrix, transform)
    end
    def create_solid_color_brush(this : IXpsOMObjectFactory*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*, solidColorBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_solid_color_brush.call(this, color, colorProfile, solidColorBrush)
    end
    def create_color_profile_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, partUri : Void*, colorProfileResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_profile_resource.call(this, acquiredStream, partUri, colorProfileResource)
    end
    def create_image_brush(this : IXpsOMObjectFactory*, image : Void*, viewBox : Win32cr::Storage::Xps::XPS_RECT*, viewPort : Win32cr::Storage::Xps::XPS_RECT*, imageBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image_brush.call(this, image, viewBox, viewPort, imageBrush)
    end
    def create_visual_brush(this : IXpsOMObjectFactory*, viewBox : Win32cr::Storage::Xps::XPS_RECT*, viewPort : Win32cr::Storage::Xps::XPS_RECT*, visualBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual_brush.call(this, viewBox, viewPort, visualBrush)
    end
    def create_image_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, contentType : Win32cr::Storage::Xps::XPS_IMAGE_TYPE, partUri : Void*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image_resource.call(this, acquiredStream, contentType, partUri, imageResource)
    end
    def create_print_ticket_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, partUri : Void*, printTicketResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_print_ticket_resource.call(this, acquiredStream, partUri, printTicketResource)
    end
    def create_font_resource(this : IXpsOMObjectFactory*, acquiredStream : Void*, fontEmbedding : Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, partUri : Void*, isObfSourceStream : Win32cr::Foundation::BOOL, fontResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_font_resource.call(this, acquiredStream, fontEmbedding, partUri, isObfSourceStream, fontResource)
    end
    def create_gradient_stop(this : IXpsOMObjectFactory*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*, offset : Float32, gradientStop : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gradient_stop.call(this, color, colorProfile, offset, gradientStop)
    end
    def create_linear_gradient_brush(this : IXpsOMObjectFactory*, gradStop1 : Void*, gradStop2 : Void*, startPoint : Win32cr::Storage::Xps::XPS_POINT*, endPoint : Win32cr::Storage::Xps::XPS_POINT*, linearGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_gradient_brush.call(this, gradStop1, gradStop2, startPoint, endPoint, linearGradientBrush)
    end
    def create_radial_gradient_brush(this : IXpsOMObjectFactory*, gradStop1 : Void*, gradStop2 : Void*, centerPoint : Win32cr::Storage::Xps::XPS_POINT*, gradientOrigin : Win32cr::Storage::Xps::XPS_POINT*, radiiSizes : Win32cr::Storage::Xps::XPS_SIZE*, radialGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_radial_gradient_brush.call(this, gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes, radialGradientBrush)
    end
    def create_core_properties(this : IXpsOMObjectFactory*, partUri : Void*, coreProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_core_properties.call(this, partUri, coreProperties)
    end
    def create_dictionary(this : IXpsOMObjectFactory*, dictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_dictionary.call(this, dictionary)
    end
    def create_part_uri_collection(this : IXpsOMObjectFactory*, partUriCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_uri_collection.call(this, partUriCollection)
    end
    def create_package_writer_on_file(this : IXpsOMObjectFactory*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_file.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter)
    end
    def create_package_writer_on_stream(this : IXpsOMObjectFactory*, outputStream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_stream.call(this, outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter)
    end
    def create_part_uri(this : IXpsOMObjectFactory*, uri : Win32cr::Foundation::PWSTR, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_uri.call(this, uri, partUri)
    end
    def create_read_only_stream_on_file(this : IXpsOMObjectFactory*, filename : Win32cr::Foundation::PWSTR, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_read_only_stream_on_file.call(this, filename, stream)
    end

  end

  @[Extern]
  record IXpsOMNameCollectionVtbl,
    query_interface : Proc(IXpsOMNameCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMNameCollection*, UInt32),
    release : Proc(IXpsOMNameCollection*, UInt32),
    get_count : Proc(IXpsOMNameCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMNameCollection*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMNameCollection, lpVtbl : IXpsOMNameCollectionVtbl* do
    GUID = LibC::GUID.new(0x4bddf8ec_u32, 0xc915_u16, 0x421b_u16, StaticArray[0xa1_u8, 0x66_u8, 0xd1_u8, 0x73_u8, 0xd2_u8, 0x56_u8, 0x53_u8, 0xd2_u8])
    def query_interface(this : IXpsOMNameCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMNameCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMNameCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMNameCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMNameCollection*, index : UInt32, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, name)
    end

  end

  @[Extern]
  record IXpsOMPartUriCollectionVtbl,
    query_interface : Proc(IXpsOMPartUriCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPartUriCollection*, UInt32),
    release : Proc(IXpsOMPartUriCollection*, UInt32),
    get_count : Proc(IXpsOMPartUriCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsOMPartUriCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IXpsOMPartUriCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsOMPartUriCollection*, UInt32, Win32cr::Foundation::HRESULT),
    set_at : Proc(IXpsOMPartUriCollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IXpsOMPartUriCollection*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPartUriCollection, lpVtbl : IXpsOMPartUriCollectionVtbl* do
    GUID = LibC::GUID.new(0x57c650d4_u32, 0x67c_u16, 0x4893_u16, StaticArray[0x8c_u8, 0x33_u8, 0xf6_u8, 0x2a_u8, 0x6_u8, 0x33_u8, 0x73_u8, 0xf_u8])
    def query_interface(this : IXpsOMPartUriCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPartUriCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPartUriCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsOMPartUriCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsOMPartUriCollection*, index : UInt32, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, partUri)
    end
    def insert_at(this : IXpsOMPartUriCollection*, index : UInt32, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, index, partUri)
    end
    def remove_at(this : IXpsOMPartUriCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def set_at(this : IXpsOMPartUriCollection*, index : UInt32, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_at.call(this, index, partUri)
    end
    def append(this : IXpsOMPartUriCollection*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, partUri)
    end

  end

  @[Extern]
  record IXpsOMPackageWriterVtbl,
    query_interface : Proc(IXpsOMPackageWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPackageWriter*, UInt32),
    release : Proc(IXpsOMPackageWriter*, UInt32),
    start_new_document : Proc(IXpsOMPackageWriter*, Void*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_page : Proc(IXpsOMPackageWriter*, Void*, Win32cr::Storage::Xps::XPS_SIZE*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_resource : Proc(IXpsOMPackageWriter*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IXpsOMPackageWriter*, Win32cr::Foundation::HRESULT),
    is_closed : Proc(IXpsOMPackageWriter*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPackageWriter, lpVtbl : IXpsOMPackageWriterVtbl* do
    GUID = LibC::GUID.new(0x4e2aa182_u32, 0xa443_u16, 0x42c6_u16, StaticArray[0xb4_u8, 0x1b_u8, 0x4f_u8, 0x8e_u8, 0x9d_u8, 0xe7_u8, 0x3f_u8, 0xf9_u8])
    def query_interface(this : IXpsOMPackageWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPackageWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPackageWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_new_document(this : IXpsOMPackageWriter*, documentPartName : Void*, documentPrintTicket : Void*, documentStructure : Void*, signatureBlockResources : Void*, restrictedFonts : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_new_document.call(this, documentPartName, documentPrintTicket, documentStructure, signatureBlockResources, restrictedFonts)
    end
    def add_page(this : IXpsOMPackageWriter*, page : Void*, advisoryPageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, discardableResourceParts : Void*, storyFragments : Void*, pagePrintTicket : Void*, pageThumbnail : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_page.call(this, page, advisoryPageDimensions, discardableResourceParts, storyFragments, pagePrintTicket, pageThumbnail)
    end
    def add_resource(this : IXpsOMPackageWriter*, resource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, resource)
    end
    def close(this : IXpsOMPackageWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def is_closed(this : IXpsOMPackageWriter*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_closed.call(this, isClosed)
    end

  end

  @[Extern]
  record IXpsOMPackageTargetVtbl,
    query_interface : Proc(IXpsOMPackageTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPackageTarget*, UInt32),
    release : Proc(IXpsOMPackageTarget*, UInt32),
    create_xps_om_package_writer : Proc(IXpsOMPackageTarget*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPackageTarget, lpVtbl : IXpsOMPackageTargetVtbl* do
    GUID = LibC::GUID.new(0x219a9db0_u32, 0x4959_u16, 0x47d0_u16, StaticArray[0x80_u8, 0x34_u8, 0xb1_u8, 0xce_u8, 0x84_u8, 0xf4_u8, 0x1a_u8, 0x4d_u8])
    def query_interface(this : IXpsOMPackageTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPackageTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPackageTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_xps_om_package_writer(this : IXpsOMPackageTarget*, documentSequencePartName : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_xps_om_package_writer.call(this, documentSequencePartName, documentSequencePrintTicket, discardControlPartName, packageWriter)
    end

  end

  @[Extern]
  record IXpsOMThumbnailGeneratorVtbl,
    query_interface : Proc(IXpsOMThumbnailGenerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMThumbnailGenerator*, UInt32),
    release : Proc(IXpsOMThumbnailGenerator*, UInt32),
    generate_thumbnail : Proc(IXpsOMThumbnailGenerator*, Void*, Win32cr::Storage::Xps::XPS_IMAGE_TYPE, Win32cr::Storage::Xps::XPS_THUMBNAIL_SIZE, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMThumbnailGenerator, lpVtbl : IXpsOMThumbnailGeneratorVtbl* do
    GUID = LibC::GUID.new(0x15b873d5_u32, 0x1971_u16, 0x41e8_u16, StaticArray[0x83_u8, 0xa3_u8, 0x65_u8, 0x78_u8, 0x40_u8, 0x30_u8, 0x64_u8, 0xc7_u8])
    def query_interface(this : IXpsOMThumbnailGenerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMThumbnailGenerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMThumbnailGenerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def generate_thumbnail(this : IXpsOMThumbnailGenerator*, page : Void*, thumbnailType : Win32cr::Storage::Xps::XPS_IMAGE_TYPE, thumbnailSize : Win32cr::Storage::Xps::XPS_THUMBNAIL_SIZE, imageResourcePartName : Void*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_thumbnail.call(this, page, thumbnailType, thumbnailSize, imageResourcePartName, imageResource)
    end

  end

  @[Extern]
  record IXpsOMObjectFactory1Vtbl,
    query_interface : Proc(IXpsOMObjectFactory1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMObjectFactory1*, UInt32),
    release : Proc(IXpsOMObjectFactory1*, UInt32),
    create_package : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_file : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_stream : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_story_fragments_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_document_structure_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_signature_block_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_remote_dictionary_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_remote_dictionary_resource_from_stream : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_part_resources : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_document_sequence : Proc(IXpsOMObjectFactory1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_document : Proc(IXpsOMObjectFactory1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_page_reference : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_SIZE*, Void**, Win32cr::Foundation::HRESULT),
    create_page : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_page_from_stream : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_canvas : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_glyphs : Proc(IXpsOMObjectFactory1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_path : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_geometry : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_geometry_figure : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_POINT*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_MATRIX*, Void**, Win32cr::Foundation::HRESULT),
    create_solid_color_brush : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_color_profile_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_image_brush : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Storage::Xps::XPS_RECT*, Void**, Win32cr::Foundation::HRESULT),
    create_visual_brush : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Storage::Xps::XPS_RECT*, Void**, Win32cr::Foundation::HRESULT),
    create_image_resource : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Storage::Xps::XPS_IMAGE_TYPE, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_print_ticket_resource : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_font_resource : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_gradient_stop : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_COLOR*, Void*, Float32, Void**, Win32cr::Foundation::HRESULT),
    create_linear_gradient_brush : Proc(IXpsOMObjectFactory1*, Void*, Void*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_POINT*, Void**, Win32cr::Foundation::HRESULT),
    create_radial_gradient_brush : Proc(IXpsOMObjectFactory1*, Void*, Void*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_POINT*, Win32cr::Storage::Xps::XPS_SIZE*, Void**, Win32cr::Foundation::HRESULT),
    create_core_properties : Proc(IXpsOMObjectFactory1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_dictionary : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_part_uri_collection : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_package_writer_on_file : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_package_writer_on_stream : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_part_uri : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_read_only_stream_on_file : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_document_type_from_file : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT),
    get_document_type_from_stream : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT),
    convert_hd_photo_to_jpeg_xr : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::HRESULT),
    convert_jpeg_xr_to_hd_photo : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::HRESULT),
    create_package_writer_on_file1 : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Void**, Win32cr::Foundation::HRESULT),
    create_package_writer_on_stream1 : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_INTERLEAVING, Void*, Void*, Void*, Void*, Void*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Void**, Win32cr::Foundation::HRESULT),
    create_package1 : Proc(IXpsOMObjectFactory1*, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_stream1 : Proc(IXpsOMObjectFactory1*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_package_from_file1 : Proc(IXpsOMObjectFactory1*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_page1 : Proc(IXpsOMObjectFactory1*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_page_from_stream1 : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_remote_dictionary_resource_from_stream1 : Proc(IXpsOMObjectFactory1*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMObjectFactory1, lpVtbl : IXpsOMObjectFactory1Vtbl* do
    GUID = LibC::GUID.new(0xa91b617_u32, 0xd612_u16, 0x4181_u16, StaticArray[0xbf_u8, 0x7c_u8, 0xbe_u8, 0x58_u8, 0x24_u8, 0xe9_u8, 0xcc_u8, 0x8f_u8])
    def query_interface(this : IXpsOMObjectFactory1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMObjectFactory1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMObjectFactory1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_package(this : IXpsOMObjectFactory1*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package.call(this, package)
    end
    def create_package_from_file(this : IXpsOMObjectFactory1*, filename : Win32cr::Foundation::PWSTR, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_file.call(this, filename, reuseObjects, package)
    end
    def create_package_from_stream(this : IXpsOMObjectFactory1*, stream : Void*, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_stream.call(this, stream, reuseObjects, package)
    end
    def create_story_fragments_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, partUri : Void*, storyFragmentsResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_story_fragments_resource.call(this, acquiredStream, partUri, storyFragmentsResource)
    end
    def create_document_structure_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, partUri : Void*, documentStructureResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_structure_resource.call(this, acquiredStream, partUri, documentStructureResource)
    end
    def create_signature_block_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, partUri : Void*, signatureBlockResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_signature_block_resource.call(this, acquiredStream, partUri, signatureBlockResource)
    end
    def create_remote_dictionary_resource(this : IXpsOMObjectFactory1*, dictionary : Void*, partUri : Void*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_remote_dictionary_resource.call(this, dictionary, partUri, remoteDictionaryResource)
    end
    def create_remote_dictionary_resource_from_stream(this : IXpsOMObjectFactory1*, dictionaryMarkupStream : Void*, dictionaryPartUri : Void*, resources : Void*, dictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_remote_dictionary_resource_from_stream.call(this, dictionaryMarkupStream, dictionaryPartUri, resources, dictionaryResource)
    end
    def create_part_resources(this : IXpsOMObjectFactory1*, partResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_resources.call(this, partResources)
    end
    def create_document_sequence(this : IXpsOMObjectFactory1*, partUri : Void*, documentSequence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_sequence.call(this, partUri, documentSequence)
    end
    def create_document(this : IXpsOMObjectFactory1*, partUri : Void*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document.call(this, partUri, document)
    end
    def create_page_reference(this : IXpsOMObjectFactory1*, advisoryPageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page_reference.call(this, advisoryPageDimensions, pageReference)
    end
    def create_page(this : IXpsOMObjectFactory1*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, language : Win32cr::Foundation::PWSTR, partUri : Void*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page.call(this, pageDimensions, language, partUri, page)
    end
    def create_page_from_stream(this : IXpsOMObjectFactory1*, pageMarkupStream : Void*, partUri : Void*, resources : Void*, reuseObjects : Win32cr::Foundation::BOOL, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page_from_stream.call(this, pageMarkupStream, partUri, resources, reuseObjects, page)
    end
    def create_canvas(this : IXpsOMObjectFactory1*, canvas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_canvas.call(this, canvas)
    end
    def create_glyphs(this : IXpsOMObjectFactory1*, fontResource : Void*, glyphs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_glyphs.call(this, fontResource, glyphs)
    end
    def create_path(this : IXpsOMObjectFactory1*, path : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_path.call(this, path)
    end
    def create_geometry(this : IXpsOMObjectFactory1*, geometry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_geometry.call(this, geometry)
    end
    def create_geometry_figure(this : IXpsOMObjectFactory1*, startPoint : Win32cr::Storage::Xps::XPS_POINT*, figure : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_geometry_figure.call(this, startPoint, figure)
    end
    def create_matrix_transform(this : IXpsOMObjectFactory1*, matrix : Win32cr::Storage::Xps::XPS_MATRIX*, transform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrix, transform)
    end
    def create_solid_color_brush(this : IXpsOMObjectFactory1*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*, solidColorBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_solid_color_brush.call(this, color, colorProfile, solidColorBrush)
    end
    def create_color_profile_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, partUri : Void*, colorProfileResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_profile_resource.call(this, acquiredStream, partUri, colorProfileResource)
    end
    def create_image_brush(this : IXpsOMObjectFactory1*, image : Void*, viewBox : Win32cr::Storage::Xps::XPS_RECT*, viewPort : Win32cr::Storage::Xps::XPS_RECT*, imageBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image_brush.call(this, image, viewBox, viewPort, imageBrush)
    end
    def create_visual_brush(this : IXpsOMObjectFactory1*, viewBox : Win32cr::Storage::Xps::XPS_RECT*, viewPort : Win32cr::Storage::Xps::XPS_RECT*, visualBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual_brush.call(this, viewBox, viewPort, visualBrush)
    end
    def create_image_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, contentType : Win32cr::Storage::Xps::XPS_IMAGE_TYPE, partUri : Void*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image_resource.call(this, acquiredStream, contentType, partUri, imageResource)
    end
    def create_print_ticket_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, partUri : Void*, printTicketResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_print_ticket_resource.call(this, acquiredStream, partUri, printTicketResource)
    end
    def create_font_resource(this : IXpsOMObjectFactory1*, acquiredStream : Void*, fontEmbedding : Win32cr::Storage::Xps::XPS_FONT_EMBEDDING, partUri : Void*, isObfSourceStream : Win32cr::Foundation::BOOL, fontResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_font_resource.call(this, acquiredStream, fontEmbedding, partUri, isObfSourceStream, fontResource)
    end
    def create_gradient_stop(this : IXpsOMObjectFactory1*, color : Win32cr::Storage::Xps::XPS_COLOR*, colorProfile : Void*, offset : Float32, gradientStop : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gradient_stop.call(this, color, colorProfile, offset, gradientStop)
    end
    def create_linear_gradient_brush(this : IXpsOMObjectFactory1*, gradStop1 : Void*, gradStop2 : Void*, startPoint : Win32cr::Storage::Xps::XPS_POINT*, endPoint : Win32cr::Storage::Xps::XPS_POINT*, linearGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_gradient_brush.call(this, gradStop1, gradStop2, startPoint, endPoint, linearGradientBrush)
    end
    def create_radial_gradient_brush(this : IXpsOMObjectFactory1*, gradStop1 : Void*, gradStop2 : Void*, centerPoint : Win32cr::Storage::Xps::XPS_POINT*, gradientOrigin : Win32cr::Storage::Xps::XPS_POINT*, radiiSizes : Win32cr::Storage::Xps::XPS_SIZE*, radialGradientBrush : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_radial_gradient_brush.call(this, gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes, radialGradientBrush)
    end
    def create_core_properties(this : IXpsOMObjectFactory1*, partUri : Void*, coreProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_core_properties.call(this, partUri, coreProperties)
    end
    def create_dictionary(this : IXpsOMObjectFactory1*, dictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_dictionary.call(this, dictionary)
    end
    def create_part_uri_collection(this : IXpsOMObjectFactory1*, partUriCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_uri_collection.call(this, partUriCollection)
    end
    def create_package_writer_on_file(this : IXpsOMObjectFactory1*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_file.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter)
    end
    def create_package_writer_on_stream(this : IXpsOMObjectFactory1*, outputStream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_stream.call(this, outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter)
    end
    def create_part_uri(this : IXpsOMObjectFactory1*, uri : Win32cr::Foundation::PWSTR, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_uri.call(this, uri, partUri)
    end
    def create_read_only_stream_on_file(this : IXpsOMObjectFactory1*, filename : Win32cr::Foundation::PWSTR, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_read_only_stream_on_file.call(this, filename, stream)
    end
    def get_document_type_from_file(this : IXpsOMObjectFactory1*, filename : Win32cr::Foundation::PWSTR, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_type_from_file.call(this, filename, documentType)
    end
    def get_document_type_from_stream(this : IXpsOMObjectFactory1*, xpsDocumentStream : Void*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_type_from_stream.call(this, xpsDocumentStream, documentType)
    end
    def convert_hd_photo_to_jpeg_xr(this : IXpsOMObjectFactory1*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_hd_photo_to_jpeg_xr.call(this, imageResource)
    end
    def convert_jpeg_xr_to_hd_photo(this : IXpsOMObjectFactory1*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_jpeg_xr_to_hd_photo.call(this, imageResource)
    end
    def create_package_writer_on_file1(this : IXpsOMObjectFactory1*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_file1.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter)
    end
    def create_package_writer_on_stream1(this : IXpsOMObjectFactory1*, outputStream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL, interleaving : Win32cr::Storage::Xps::XPS_INTERLEAVING, documentSequencePartName : Void*, coreProperties : Void*, packageThumbnail : Void*, documentSequencePrintTicket : Void*, discardControlPartName : Void*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer_on_stream1.call(this, outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter)
    end
    def create_package1(this : IXpsOMObjectFactory1*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package1.call(this, package)
    end
    def create_package_from_stream1(this : IXpsOMObjectFactory1*, stream : Void*, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_stream1.call(this, stream, reuseObjects, package)
    end
    def create_package_from_file1(this : IXpsOMObjectFactory1*, filename : Win32cr::Foundation::PWSTR, reuseObjects : Win32cr::Foundation::BOOL, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_from_file1.call(this, filename, reuseObjects, package)
    end
    def create_page1(this : IXpsOMObjectFactory1*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, language : Win32cr::Foundation::PWSTR, partUri : Void*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page1.call(this, pageDimensions, language, partUri, page)
    end
    def create_page_from_stream1(this : IXpsOMObjectFactory1*, pageMarkupStream : Void*, partUri : Void*, resources : Void*, reuseObjects : Win32cr::Foundation::BOOL, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_page_from_stream1.call(this, pageMarkupStream, partUri, resources, reuseObjects, page)
    end
    def create_remote_dictionary_resource_from_stream1(this : IXpsOMObjectFactory1*, dictionaryMarkupStream : Void*, partUri : Void*, resources : Void*, dictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_remote_dictionary_resource_from_stream1.call(this, dictionaryMarkupStream, partUri, resources, dictionaryResource)
    end

  end

  @[Extern]
  record IXpsOMPackage1Vtbl,
    query_interface : Proc(IXpsOMPackage1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPackage1*, UInt32),
    release : Proc(IXpsOMPackage1*, UInt32),
    get_document_sequence : Proc(IXpsOMPackage1*, Void**, Win32cr::Foundation::HRESULT),
    set_document_sequence : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::HRESULT),
    get_core_properties : Proc(IXpsOMPackage1*, Void**, Win32cr::Foundation::HRESULT),
    set_core_properties : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::HRESULT),
    get_discard_control_part_name : Proc(IXpsOMPackage1*, Void**, Win32cr::Foundation::HRESULT),
    set_discard_control_part_name : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::HRESULT),
    get_thumbnail_resource : Proc(IXpsOMPackage1*, Void**, Win32cr::Foundation::HRESULT),
    set_thumbnail_resource : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::HRESULT),
    write_to_file : Proc(IXpsOMPackage1*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_to_stream : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_document_type : Proc(IXpsOMPackage1*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT),
    write_to_file1 : Proc(IXpsOMPackage1*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Win32cr::Foundation::HRESULT),
    write_to_stream1 : Proc(IXpsOMPackage1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPackage1, lpVtbl : IXpsOMPackage1Vtbl* do
    GUID = LibC::GUID.new(0x95a9435e_u32, 0x12bb_u16, 0x461b_u16, StaticArray[0x8e_u8, 0x7f_u8, 0xc6_u8, 0xad_u8, 0xb0_u8, 0x4c_u8, 0xd9_u8, 0x6a_u8])
    def query_interface(this : IXpsOMPackage1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPackage1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPackage1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_sequence(this : IXpsOMPackage1*, documentSequence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_sequence.call(this, documentSequence)
    end
    def set_document_sequence(this : IXpsOMPackage1*, documentSequence : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence.call(this, documentSequence)
    end
    def get_core_properties(this : IXpsOMPackage1*, coreProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_properties.call(this, coreProperties)
    end
    def set_core_properties(this : IXpsOMPackage1*, coreProperties : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_core_properties.call(this, coreProperties)
    end
    def get_discard_control_part_name(this : IXpsOMPackage1*, discardControlPartUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_discard_control_part_name.call(this, discardControlPartUri)
    end
    def set_discard_control_part_name(this : IXpsOMPackage1*, discardControlPartUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_discard_control_part_name.call(this, discardControlPartUri)
    end
    def get_thumbnail_resource(this : IXpsOMPackage1*, imageResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail_resource.call(this, imageResource)
    end
    def set_thumbnail_resource(this : IXpsOMPackage1*, imageResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thumbnail_resource.call(this, imageResource)
    end
    def write_to_file(this : IXpsOMPackage1*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_file.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize)
    end
    def write_to_stream(this : IXpsOMPackage1*, stream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_stream.call(this, stream, optimizeMarkupSize)
    end
    def get_document_type(this : IXpsOMPackage1*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_type.call(this, documentType)
    end
    def write_to_file1(this : IXpsOMPackage1*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32, optimizeMarkupSize : Win32cr::Foundation::BOOL, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_file1.call(this, fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, documentType)
    end
    def write_to_stream1(this : IXpsOMPackage1*, outputStream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_stream1.call(this, outputStream, optimizeMarkupSize, documentType)
    end

  end

  @[Extern]
  record IXpsOMPage1Vtbl,
    query_interface : Proc(IXpsOMPage1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPage1*, UInt32),
    release : Proc(IXpsOMPage1*, UInt32),
    get_part_name : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMPage1*, Void*, Win32cr::Foundation::HRESULT),
    get_owner : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    get_visuals : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    get_page_dimensions : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    set_page_dimensions : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_SIZE*, Win32cr::Foundation::HRESULT),
    get_content_box : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_content_box : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_bleed_box : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    set_bleed_box : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_RECT*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IXpsOMPage1*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IXpsOMPage1*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IXpsOMPage1*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IXpsOMPage1*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_is_hyperlink_target : Proc(IXpsOMPage1*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_is_hyperlink_target : Proc(IXpsOMPage1*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_dictionary : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    get_dictionary_local : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_local : Proc(IXpsOMPage1*, Void*, Win32cr::Foundation::HRESULT),
    get_dictionary_resource : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary_resource : Proc(IXpsOMPage1*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(IXpsOMPage1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    generate_unused_lookup_key : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_OBJECT_TYPE, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    clone : Proc(IXpsOMPage1*, Void**, Win32cr::Foundation::HRESULT),
    get_document_type : Proc(IXpsOMPage1*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT),
    write1 : Proc(IXpsOMPage1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPage1, lpVtbl : IXpsOMPage1Vtbl* do
    GUID = LibC::GUID.new(0x305b60ef_u32, 0x6892_u16, 0x4dda_u16, StaticArray[0x9c_u8, 0xbb_u8, 0x3a_u8, 0xa6_u8, 0x59_u8, 0x74_u8, 0x50_u8, 0x8a_u8])
    def query_interface(this : IXpsOMPage1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPage1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPage1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMPage1*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMPage1*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_owner(this : IXpsOMPage1*, pageReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner.call(this, pageReference)
    end
    def get_visuals(this : IXpsOMPage1*, visuals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visuals.call(this, visuals)
    end
    def get_page_dimensions(this : IXpsOMPage1*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_dimensions.call(this, pageDimensions)
    end
    def set_page_dimensions(this : IXpsOMPage1*, pageDimensions : Win32cr::Storage::Xps::XPS_SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_dimensions.call(this, pageDimensions)
    end
    def get_content_box(this : IXpsOMPage1*, contentBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_box.call(this, contentBox)
    end
    def set_content_box(this : IXpsOMPage1*, contentBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content_box.call(this, contentBox)
    end
    def get_bleed_box(this : IXpsOMPage1*, bleedBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bleed_box.call(this, bleedBox)
    end
    def set_bleed_box(this : IXpsOMPage1*, bleedBox : Win32cr::Storage::Xps::XPS_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bleed_box.call(this, bleedBox)
    end
    def get_language(this : IXpsOMPage1*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def set_language(this : IXpsOMPage1*, language : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, language)
    end
    def get_name(this : IXpsOMPage1*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def set_name(this : IXpsOMPage1*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_is_hyperlink_target(this : IXpsOMPage1*, isHyperlinkTarget : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_hyperlink_target.call(this, isHyperlinkTarget)
    end
    def set_is_hyperlink_target(this : IXpsOMPage1*, isHyperlinkTarget : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_is_hyperlink_target.call(this, isHyperlinkTarget)
    end
    def get_dictionary(this : IXpsOMPage1*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary.call(this, resourceDictionary)
    end
    def get_dictionary_local(this : IXpsOMPage1*, resourceDictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_local.call(this, resourceDictionary)
    end
    def set_dictionary_local(this : IXpsOMPage1*, resourceDictionary : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_local.call(this, resourceDictionary)
    end
    def get_dictionary_resource(this : IXpsOMPage1*, remoteDictionaryResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def set_dictionary_resource(this : IXpsOMPage1*, remoteDictionaryResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary_resource.call(this, remoteDictionaryResource)
    end
    def write(this : IXpsOMPage1*, stream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, stream, optimizeMarkupSize)
    end
    def generate_unused_lookup_key(this : IXpsOMPage1*, type__ : Win32cr::Storage::Xps::XPS_OBJECT_TYPE, key : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_unused_lookup_key.call(this, type__, key)
    end
    def clone(this : IXpsOMPage1*, page : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, page)
    end
    def get_document_type(this : IXpsOMPage1*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_type.call(this, documentType)
    end
    def write1(this : IXpsOMPage1*, stream : Void*, optimizeMarkupSize : Win32cr::Foundation::BOOL, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write1.call(this, stream, optimizeMarkupSize, documentType)
    end

  end

  @[Extern]
  record IXpsDocumentPackageTargetVtbl,
    query_interface : Proc(IXpsDocumentPackageTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsDocumentPackageTarget*, UInt32),
    release : Proc(IXpsDocumentPackageTarget*, UInt32),
    get_xps_om_package_writer : Proc(IXpsDocumentPackageTarget*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_xps_om_factory : Proc(IXpsDocumentPackageTarget*, Void**, Win32cr::Foundation::HRESULT),
    get_xps_type : Proc(IXpsDocumentPackageTarget*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsDocumentPackageTarget, lpVtbl : IXpsDocumentPackageTargetVtbl* do
    GUID = LibC::GUID.new(0x3b0b6d38_u32, 0x53ad_u16, 0x41da_u16, StaticArray[0xb2_u8, 0x12_u8, 0xd3_u8, 0x76_u8, 0x37_u8, 0xa6_u8, 0x71_u8, 0x4e_u8])
    def query_interface(this : IXpsDocumentPackageTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsDocumentPackageTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsDocumentPackageTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_xps_om_package_writer(this : IXpsDocumentPackageTarget*, documentSequencePartName : Void*, discardControlPartName : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xps_om_package_writer.call(this, documentSequencePartName, discardControlPartName, packageWriter)
    end
    def get_xps_om_factory(this : IXpsDocumentPackageTarget*, xpsFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xps_om_factory.call(this, xpsFactory)
    end
    def get_xps_type(this : IXpsDocumentPackageTarget*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xps_type.call(this, documentType)
    end

  end

  @[Extern]
  record IXpsOMRemoteDictionaryResource1Vtbl,
    query_interface : Proc(IXpsOMRemoteDictionaryResource1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMRemoteDictionaryResource1*, UInt32),
    release : Proc(IXpsOMRemoteDictionaryResource1*, UInt32),
    get_part_name : Proc(IXpsOMRemoteDictionaryResource1*, Void**, Win32cr::Foundation::HRESULT),
    set_part_name : Proc(IXpsOMRemoteDictionaryResource1*, Void*, Win32cr::Foundation::HRESULT),
    get_dictionary : Proc(IXpsOMRemoteDictionaryResource1*, Void**, Win32cr::Foundation::HRESULT),
    set_dictionary : Proc(IXpsOMRemoteDictionaryResource1*, Void*, Win32cr::Foundation::HRESULT),
    get_document_type : Proc(IXpsOMRemoteDictionaryResource1*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*, Win32cr::Foundation::HRESULT),
    write1 : Proc(IXpsOMRemoteDictionaryResource1*, Void*, Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMRemoteDictionaryResource1, lpVtbl : IXpsOMRemoteDictionaryResource1Vtbl* do
    GUID = LibC::GUID.new(0xbf8fc1d4_u32, 0x9d46_u16, 0x4141_u16, StaticArray[0xba_u8, 0x5f_u8, 0x94_u8, 0xbb_u8, 0x92_u8, 0x50_u8, 0xd0_u8, 0x41_u8])
    def query_interface(this : IXpsOMRemoteDictionaryResource1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMRemoteDictionaryResource1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMRemoteDictionaryResource1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IXpsOMRemoteDictionaryResource1*, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partUri)
    end
    def set_part_name(this : IXpsOMRemoteDictionaryResource1*, partUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_part_name.call(this, partUri)
    end
    def get_dictionary(this : IXpsOMRemoteDictionaryResource1*, dictionary : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary.call(this, dictionary)
    end
    def set_dictionary(this : IXpsOMRemoteDictionaryResource1*, dictionary : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dictionary.call(this, dictionary)
    end
    def get_document_type(this : IXpsOMRemoteDictionaryResource1*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_type.call(this, documentType)
    end
    def write1(this : IXpsOMRemoteDictionaryResource1*, stream : Void*, documentType : Win32cr::Storage::Xps::XPS_DOCUMENT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write1.call(this, stream, documentType)
    end

  end

  @[Extern]
  record IXpsOMPackageWriter3DVtbl,
    query_interface : Proc(IXpsOMPackageWriter3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsOMPackageWriter3D*, UInt32),
    release : Proc(IXpsOMPackageWriter3D*, UInt32),
    start_new_document : Proc(IXpsOMPackageWriter3D*, Void*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_page : Proc(IXpsOMPackageWriter3D*, Void*, Win32cr::Storage::Xps::XPS_SIZE*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_resource : Proc(IXpsOMPackageWriter3D*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IXpsOMPackageWriter3D*, Win32cr::Foundation::HRESULT),
    is_closed : Proc(IXpsOMPackageWriter3D*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    add_model_texture : Proc(IXpsOMPackageWriter3D*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_model_print_ticket : Proc(IXpsOMPackageWriter3D*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsOMPackageWriter3D, lpVtbl : IXpsOMPackageWriter3DVtbl* do
    GUID = LibC::GUID.new(0xe8a45033_u32, 0x640e_u16, 0x43fa_u16, StaticArray[0x9b_u8, 0xdf_u8, 0xfd_u8, 0xde_u8, 0xaa_u8, 0x31_u8, 0xc6_u8, 0xa0_u8])
    def query_interface(this : IXpsOMPackageWriter3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsOMPackageWriter3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsOMPackageWriter3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_new_document(this : IXpsOMPackageWriter3D*, documentPartName : Void*, documentPrintTicket : Void*, documentStructure : Void*, signatureBlockResources : Void*, restrictedFonts : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_new_document.call(this, documentPartName, documentPrintTicket, documentStructure, signatureBlockResources, restrictedFonts)
    end
    def add_page(this : IXpsOMPackageWriter3D*, page : Void*, advisoryPageDimensions : Win32cr::Storage::Xps::XPS_SIZE*, discardableResourceParts : Void*, storyFragments : Void*, pagePrintTicket : Void*, pageThumbnail : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_page.call(this, page, advisoryPageDimensions, discardableResourceParts, storyFragments, pagePrintTicket, pageThumbnail)
    end
    def add_resource(this : IXpsOMPackageWriter3D*, resource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource.call(this, resource)
    end
    def close(this : IXpsOMPackageWriter3D*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def is_closed(this : IXpsOMPackageWriter3D*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_closed.call(this, isClosed)
    end
    def add_model_texture(this : IXpsOMPackageWriter3D*, texturePartName : Void*, textureData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_model_texture.call(this, texturePartName, textureData)
    end
    def set_model_print_ticket(this : IXpsOMPackageWriter3D*, printTicketPartName : Void*, printTicketData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_model_print_ticket.call(this, printTicketPartName, printTicketData)
    end

  end

  @[Extern]
  record IXpsDocumentPackageTarget3DVtbl,
    query_interface : Proc(IXpsDocumentPackageTarget3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsDocumentPackageTarget3D*, UInt32),
    release : Proc(IXpsDocumentPackageTarget3D*, UInt32),
    get_xps_om_package_writer3_d : Proc(IXpsDocumentPackageTarget3D*, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_xps_om_factory : Proc(IXpsDocumentPackageTarget3D*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsDocumentPackageTarget3D, lpVtbl : IXpsDocumentPackageTarget3DVtbl* do
    GUID = LibC::GUID.new(0x60ba71b8_u32, 0x3101_u16, 0x4984_u16, StaticArray[0x91_u8, 0x99_u8, 0xf4_u8, 0xea_u8, 0x77_u8, 0x5f_u8, 0xf0_u8, 0x1d_u8])
    def query_interface(this : IXpsDocumentPackageTarget3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsDocumentPackageTarget3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsDocumentPackageTarget3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_xps_om_package_writer3_d(this : IXpsDocumentPackageTarget3D*, documentSequencePartName : Void*, discardControlPartName : Void*, modelPartName : Void*, modelData : Void*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xps_om_package_writer3_d.call(this, documentSequencePartName, discardControlPartName, modelPartName, modelData, packageWriter)
    end
    def get_xps_om_factory(this : IXpsDocumentPackageTarget3D*, xpsFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xps_om_factory.call(this, xpsFactory)
    end

  end

  @[Extern]
  record IXpsSigningOptionsVtbl,
    query_interface : Proc(IXpsSigningOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSigningOptions*, UInt32),
    release : Proc(IXpsSigningOptions*, UInt32),
    get_signature_id : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_signature_id : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signature_method : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_signature_method : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_digest_method : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_digest_method : Proc(IXpsSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signature_part_name : Proc(IXpsSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    set_signature_part_name : Proc(IXpsSigningOptions*, Void*, Win32cr::Foundation::HRESULT),
    get_policy : Proc(IXpsSigningOptions*, Win32cr::Storage::Xps::XPS_SIGN_POLICY*, Win32cr::Foundation::HRESULT),
    set_policy : Proc(IXpsSigningOptions*, Win32cr::Storage::Xps::XPS_SIGN_POLICY, Win32cr::Foundation::HRESULT),
    get_signing_time_format : Proc(IXpsSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*, Win32cr::Foundation::HRESULT),
    set_signing_time_format : Proc(IXpsSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT, Win32cr::Foundation::HRESULT),
    get_custom_objects : Proc(IXpsSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_references : Proc(IXpsSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_certificate_set : Proc(IXpsSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IXpsSigningOptions*, Win32cr::Storage::Xps::XPS_SIGN_FLAGS*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(IXpsSigningOptions*, Win32cr::Storage::Xps::XPS_SIGN_FLAGS, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSigningOptions, lpVtbl : IXpsSigningOptionsVtbl* do
    GUID = LibC::GUID.new(0x7718eae4_u32, 0x3215_u16, 0x49be_u16, StaticArray[0xaf_u8, 0x5b_u8, 0x59_u8, 0x4f_u8, 0xef_u8, 0x7f_u8, 0xcf_u8, 0xa6_u8])
    def query_interface(this : IXpsSigningOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSigningOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSigningOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_signature_id(this : IXpsSigningOptions*, signatureId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_id.call(this, signatureId)
    end
    def set_signature_id(this : IXpsSigningOptions*, signatureId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_id.call(this, signatureId)
    end
    def get_signature_method(this : IXpsSigningOptions*, signatureMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_method.call(this, signatureMethod)
    end
    def set_signature_method(this : IXpsSigningOptions*, signatureMethod : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_method.call(this, signatureMethod)
    end
    def get_digest_method(this : IXpsSigningOptions*, digestMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_method.call(this, digestMethod)
    end
    def set_digest_method(this : IXpsSigningOptions*, digestMethod : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_digest_method.call(this, digestMethod)
    end
    def get_signature_part_name(this : IXpsSigningOptions*, signaturePartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_name.call(this, signaturePartName)
    end
    def set_signature_part_name(this : IXpsSigningOptions*, signaturePartName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_part_name.call(this, signaturePartName)
    end
    def get_policy(this : IXpsSigningOptions*, policy : Win32cr::Storage::Xps::XPS_SIGN_POLICY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_policy.call(this, policy)
    end
    def set_policy(this : IXpsSigningOptions*, policy : Win32cr::Storage::Xps::XPS_SIGN_POLICY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_policy.call(this, policy)
    end
    def get_signing_time_format(this : IXpsSigningOptions*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_time_format.call(this, timeFormat)
    end
    def set_signing_time_format(this : IXpsSigningOptions*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signing_time_format.call(this, timeFormat)
    end
    def get_custom_objects(this : IXpsSigningOptions*, customObjectSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_objects.call(this, customObjectSet)
    end
    def get_custom_references(this : IXpsSigningOptions*, customReferenceSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_references.call(this, customReferenceSet)
    end
    def get_certificate_set(this : IXpsSigningOptions*, certificateSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_certificate_set.call(this, certificateSet)
    end
    def get_flags(this : IXpsSigningOptions*, flags : Win32cr::Storage::Xps::XPS_SIGN_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, flags)
    end
    def set_flags(this : IXpsSigningOptions*, flags : Win32cr::Storage::Xps::XPS_SIGN_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end

  end

  @[Extern]
  record IXpsSignatureCollectionVtbl,
    query_interface : Proc(IXpsSignatureCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureCollection*, UInt32),
    release : Proc(IXpsSignatureCollection*, UInt32),
    get_count : Proc(IXpsSignatureCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsSignatureCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsSignatureCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureCollection, lpVtbl : IXpsSignatureCollectionVtbl* do
    GUID = LibC::GUID.new(0xa2d1d95d_u32, 0xadd2_u16, 0x4dff_u16, StaticArray[0xab_u8, 0x27_u8, 0x6b_u8, 0x9c_u8, 0x64_u8, 0x5f_u8, 0xf3_u8, 0x22_u8])
    def query_interface(this : IXpsSignatureCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsSignatureCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsSignatureCollection*, index : UInt32, signature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, signature)
    end
    def remove_at(this : IXpsSignatureCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end

  end

  @[Extern]
  record IXpsSignatureVtbl,
    query_interface : Proc(IXpsSignature*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignature*, UInt32),
    release : Proc(IXpsSignature*, UInt32),
    get_signature_id : Proc(IXpsSignature*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_signature_value : Proc(IXpsSignature*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_certificate_enumerator : Proc(IXpsSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signing_time : Proc(IXpsSignature*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_signing_time_format : Proc(IXpsSignature*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*, Win32cr::Foundation::HRESULT),
    get_signature_part_name : Proc(IXpsSignature*, Void**, Win32cr::Foundation::HRESULT),
    verify : Proc(IXpsSignature*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Storage::Xps::XPS_SIGNATURE_STATUS*, Win32cr::Foundation::HRESULT),
    get_policy : Proc(IXpsSignature*, Win32cr::Storage::Xps::XPS_SIGN_POLICY*, Win32cr::Foundation::HRESULT),
    get_custom_object_enumerator : Proc(IXpsSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_reference_enumerator : Proc(IXpsSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_xml : Proc(IXpsSignature*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    set_signature_xml : Proc(IXpsSignature*, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignature, lpVtbl : IXpsSignatureVtbl* do
    GUID = LibC::GUID.new(0x6ae4c93e_u32, 0x1ade_u16, 0x42fb_u16, StaticArray[0x89_u8, 0x8b_u8, 0x3a_u8, 0x56_u8, 0x58_u8, 0x28_u8, 0x48_u8, 0x57_u8])
    def query_interface(this : IXpsSignature*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignature*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignature*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_signature_id(this : IXpsSignature*, sigId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_id.call(this, sigId)
    end
    def get_signature_value(this : IXpsSignature*, signatureHashValue : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_value.call(this, signatureHashValue, count)
    end
    def get_certificate_enumerator(this : IXpsSignature*, certificateEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_certificate_enumerator.call(this, certificateEnumerator)
    end
    def get_signing_time(this : IXpsSignature*, sigDateTimeString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_time.call(this, sigDateTimeString)
    end
    def get_signing_time_format(this : IXpsSignature*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_time_format.call(this, timeFormat)
    end
    def get_signature_part_name(this : IXpsSignature*, signaturePartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_name.call(this, signaturePartName)
    end
    def verify(this : IXpsSignature*, x509Certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*, sigStatus : Win32cr::Storage::Xps::XPS_SIGNATURE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.verify.call(this, x509Certificate, sigStatus)
    end
    def get_policy(this : IXpsSignature*, policy : Win32cr::Storage::Xps::XPS_SIGN_POLICY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_policy.call(this, policy)
    end
    def get_custom_object_enumerator(this : IXpsSignature*, customObjectEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_object_enumerator.call(this, customObjectEnumerator)
    end
    def get_custom_reference_enumerator(this : IXpsSignature*, customReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_reference_enumerator.call(this, customReferenceEnumerator)
    end
    def get_signature_xml(this : IXpsSignature*, signatureXml : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_xml.call(this, signatureXml, count)
    end
    def set_signature_xml(this : IXpsSignature*, signatureXml : UInt8*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_xml.call(this, signatureXml, count)
    end

  end

  @[Extern]
  record IXpsSignatureBlockCollectionVtbl,
    query_interface : Proc(IXpsSignatureBlockCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureBlockCollection*, UInt32),
    release : Proc(IXpsSignatureBlockCollection*, UInt32),
    get_count : Proc(IXpsSignatureBlockCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsSignatureBlockCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsSignatureBlockCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureBlockCollection, lpVtbl : IXpsSignatureBlockCollectionVtbl* do
    GUID = LibC::GUID.new(0x23397050_u32, 0xfe99_u16, 0x467a_u16, StaticArray[0x8d_u8, 0xce_u8, 0x92_u8, 0x37_u8, 0xf0_u8, 0x74_u8, 0xff_u8, 0xe4_u8])
    def query_interface(this : IXpsSignatureBlockCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureBlockCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureBlockCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsSignatureBlockCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsSignatureBlockCollection*, index : UInt32, signatureBlock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, signatureBlock)
    end
    def remove_at(this : IXpsSignatureBlockCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end

  end

  @[Extern]
  record IXpsSignatureBlockVtbl,
    query_interface : Proc(IXpsSignatureBlock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureBlock*, UInt32),
    release : Proc(IXpsSignatureBlock*, UInt32),
    get_requests : Proc(IXpsSignatureBlock*, Void**, Win32cr::Foundation::HRESULT),
    get_part_name : Proc(IXpsSignatureBlock*, Void**, Win32cr::Foundation::HRESULT),
    get_document_index : Proc(IXpsSignatureBlock*, UInt32*, Win32cr::Foundation::HRESULT),
    get_document_name : Proc(IXpsSignatureBlock*, Void**, Win32cr::Foundation::HRESULT),
    create_request : Proc(IXpsSignatureBlock*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureBlock, lpVtbl : IXpsSignatureBlockVtbl* do
    GUID = LibC::GUID.new(0x151fac09_u32, 0xb97_u16, 0x4ac6_u16, StaticArray[0xa3_u8, 0x23_u8, 0x5e_u8, 0x42_u8, 0x97_u8, 0xd4_u8, 0x32_u8, 0x2b_u8])
    def query_interface(this : IXpsSignatureBlock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureBlock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureBlock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_requests(this : IXpsSignatureBlock*, requests : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_requests.call(this, requests)
    end
    def get_part_name(this : IXpsSignatureBlock*, partName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partName)
    end
    def get_document_index(this : IXpsSignatureBlock*, fixedDocumentIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_index.call(this, fixedDocumentIndex)
    end
    def get_document_name(this : IXpsSignatureBlock*, fixedDocumentName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_name.call(this, fixedDocumentName)
    end
    def create_request(this : IXpsSignatureBlock*, requestId : Win32cr::Foundation::PWSTR, signatureRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_request.call(this, requestId, signatureRequest)
    end

  end

  @[Extern]
  record IXpsSignatureRequestCollectionVtbl,
    query_interface : Proc(IXpsSignatureRequestCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureRequestCollection*, UInt32),
    release : Proc(IXpsSignatureRequestCollection*, UInt32),
    get_count : Proc(IXpsSignatureRequestCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IXpsSignatureRequestCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IXpsSignatureRequestCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureRequestCollection, lpVtbl : IXpsSignatureRequestCollectionVtbl* do
    GUID = LibC::GUID.new(0xf0253e68_u32, 0x9f19_u16, 0x412e_u16, StaticArray[0x9b_u8, 0x4f_u8, 0x54_u8, 0xd3_u8, 0xb0_u8, 0xac_u8, 0x6c_u8, 0xd9_u8])
    def query_interface(this : IXpsSignatureRequestCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureRequestCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureRequestCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IXpsSignatureRequestCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_at(this : IXpsSignatureRequestCollection*, index : UInt32, signatureRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, signatureRequest)
    end
    def remove_at(this : IXpsSignatureRequestCollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end

  end

  @[Extern]
  record IXpsSignatureRequestVtbl,
    query_interface : Proc(IXpsSignatureRequest*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureRequest*, UInt32),
    release : Proc(IXpsSignatureRequest*, UInt32),
    get_intent : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_intent : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_requested_signer : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_requested_signer : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_request_sign_by_date : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_request_sign_by_date : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signing_locale : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_signing_locale : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_spot_location : Proc(IXpsSignatureRequest*, Int32*, Void**, Float32*, Float32*, Win32cr::Foundation::HRESULT),
    set_spot_location : Proc(IXpsSignatureRequest*, Int32, Float32, Float32, Win32cr::Foundation::HRESULT),
    get_request_id : Proc(IXpsSignatureRequest*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_signature : Proc(IXpsSignatureRequest*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureRequest, lpVtbl : IXpsSignatureRequestVtbl* do
    GUID = LibC::GUID.new(0xac58950b_u32, 0x7208_u16, 0x4b2d_u16, StaticArray[0xb2_u8, 0xc4_u8, 0x95_u8, 0x10_u8, 0x83_u8, 0xd3_u8, 0xb8_u8, 0xeb_u8])
    def query_interface(this : IXpsSignatureRequest*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureRequest*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureRequest*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_intent(this : IXpsSignatureRequest*, intent : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_intent.call(this, intent)
    end
    def set_intent(this : IXpsSignatureRequest*, intent : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_intent.call(this, intent)
    end
    def get_requested_signer(this : IXpsSignatureRequest*, signerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_requested_signer.call(this, signerName)
    end
    def set_requested_signer(this : IXpsSignatureRequest*, signerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_requested_signer.call(this, signerName)
    end
    def get_request_sign_by_date(this : IXpsSignatureRequest*, dateString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_request_sign_by_date.call(this, dateString)
    end
    def set_request_sign_by_date(this : IXpsSignatureRequest*, dateString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_request_sign_by_date.call(this, dateString)
    end
    def get_signing_locale(this : IXpsSignatureRequest*, place : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_locale.call(this, place)
    end
    def set_signing_locale(this : IXpsSignatureRequest*, place : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signing_locale.call(this, place)
    end
    def get_spot_location(this : IXpsSignatureRequest*, pageIndex : Int32*, pagePartName : Void**, x : Float32*, y : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spot_location.call(this, pageIndex, pagePartName, x, y)
    end
    def set_spot_location(this : IXpsSignatureRequest*, pageIndex : Int32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spot_location.call(this, pageIndex, x, y)
    end
    def get_request_id(this : IXpsSignatureRequest*, requestId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_request_id.call(this, requestId)
    end
    def get_signature(this : IXpsSignatureRequest*, signature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature.call(this, signature)
    end

  end

  @[Extern]
  record IXpsSignatureManagerVtbl,
    query_interface : Proc(IXpsSignatureManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsSignatureManager*, UInt32),
    release : Proc(IXpsSignatureManager*, UInt32),
    load_package_file : Proc(IXpsSignatureManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    load_package_stream : Proc(IXpsSignatureManager*, Void*, Win32cr::Foundation::HRESULT),
    sign : Proc(IXpsSignatureManager*, Void*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_origin_part_name : Proc(IXpsSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    set_signature_origin_part_name : Proc(IXpsSignatureManager*, Void*, Win32cr::Foundation::HRESULT),
    get_signatures : Proc(IXpsSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    add_signature_block : Proc(IXpsSignatureManager*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_signature_blocks : Proc(IXpsSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    create_signing_options : Proc(IXpsSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    save_package_to_file : Proc(IXpsSignatureManager*, Win32cr::Foundation::PWSTR, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::HRESULT),
    save_package_to_stream : Proc(IXpsSignatureManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsSignatureManager, lpVtbl : IXpsSignatureManagerVtbl* do
    GUID = LibC::GUID.new(0xd3e8d338_u32, 0xfdc4_u16, 0x4afc_u16, StaticArray[0x80_u8, 0xb5_u8, 0xd5_u8, 0x32_u8, 0xa1_u8, 0x78_u8, 0x2e_u8, 0xe1_u8])
    def query_interface(this : IXpsSignatureManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsSignatureManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsSignatureManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_package_file(this : IXpsSignatureManager*, fileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_package_file.call(this, fileName)
    end
    def load_package_stream(this : IXpsSignatureManager*, stream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_package_stream.call(this, stream)
    end
    def sign(this : IXpsSignatureManager*, signOptions : Void*, x509Certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*, signature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sign.call(this, signOptions, x509Certificate, signature)
    end
    def get_signature_origin_part_name(this : IXpsSignatureManager*, signatureOriginPartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_origin_part_name.call(this, signatureOriginPartName)
    end
    def set_signature_origin_part_name(this : IXpsSignatureManager*, signatureOriginPartName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_origin_part_name.call(this, signatureOriginPartName)
    end
    def get_signatures(this : IXpsSignatureManager*, signatures : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signatures.call(this, signatures)
    end
    def add_signature_block(this : IXpsSignatureManager*, partName : Void*, fixedDocumentIndex : UInt32, signatureBlock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_signature_block.call(this, partName, fixedDocumentIndex, signatureBlock)
    end
    def get_signature_blocks(this : IXpsSignatureManager*, signatureBlocks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_blocks.call(this, signatureBlocks)
    end
    def create_signing_options(this : IXpsSignatureManager*, signingOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_signing_options.call(this, signingOptions)
    end
    def save_package_to_file(this : IXpsSignatureManager*, fileName : Win32cr::Foundation::PWSTR, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flagsAndAttributes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_package_to_file.call(this, fileName, securityAttributes, flagsAndAttributes)
    end
    def save_package_to_stream(this : IXpsSignatureManager*, stream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_package_to_stream.call(this, stream)
    end

  end

  def deviceCapabilitiesA(pDevice : Win32cr::Foundation::PSTR, pPort : Win32cr::Foundation::PSTR, fwCapability : Win32cr::Storage::Xps::DEVICE_CAPABILITIES, pOutput : Win32cr::Foundation::PSTR, pDevMode : Win32cr::Graphics::Gdi::DEVMODEA*) : Int32
    C.DeviceCapabilitiesA(pDevice, pPort, fwCapability, pOutput, pDevMode)
  end

  def deviceCapabilitiesW(pDevice : Win32cr::Foundation::PWSTR, pPort : Win32cr::Foundation::PWSTR, fwCapability : Win32cr::Storage::Xps::DEVICE_CAPABILITIES, pOutput : Win32cr::Foundation::PWSTR, pDevMode : Win32cr::Graphics::Gdi::DEVMODEW*) : Int32
    C.DeviceCapabilitiesW(pDevice, pPort, fwCapability, pOutput, pDevMode)
  end

  def escape(hdc : Win32cr::Graphics::Gdi::HDC, iEscape : Int32, cjIn : Int32, pvIn : Win32cr::Foundation::PSTR, pvOut : Void*) : Int32
    C.Escape(hdc, iEscape, cjIn, pvIn, pvOut)
  end

  def extEscape(hdc : Win32cr::Graphics::Gdi::HDC, iEscape : Int32, cjInput : Int32, lpInData : Win32cr::Foundation::PSTR, cjOutput : Int32, lpOutData : Win32cr::Foundation::PSTR) : Int32
    C.ExtEscape(hdc, iEscape, cjInput, lpInData, cjOutput, lpOutData)
  end

  def startDocA(hdc : Win32cr::Graphics::Gdi::HDC, lpdi : Win32cr::Storage::Xps::DOCINFOA*) : Int32
    C.StartDocA(hdc, lpdi)
  end

  def startDocW(hdc : Win32cr::Graphics::Gdi::HDC, lpdi : Win32cr::Storage::Xps::DOCINFOW*) : Int32
    C.StartDocW(hdc, lpdi)
  end

  def endDoc(hdc : Win32cr::Graphics::Gdi::HDC) : Int32
    C.EndDoc(hdc)
  end

  def startPage(hdc : Win32cr::Graphics::Gdi::HDC) : Int32
    C.StartPage(hdc)
  end

  def endPage(hdc : Win32cr::Graphics::Gdi::HDC) : Int32
    C.EndPage(hdc)
  end

  def abortDoc(hdc : Win32cr::Graphics::Gdi::HDC) : Int32
    C.AbortDoc(hdc)
  end

  def setAbortProc(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::Storage::Xps::ABORTPROC) : Int32
    C.SetAbortProc(hdc, proc)
  end

  def printWindow(hwnd : Win32cr::Foundation::HWND, hdcBlt : Win32cr::Graphics::Gdi::HDC, nFlags : Win32cr::Storage::Xps::PRINT_WINDOW_FLAGS) : Win32cr::Foundation::BOOL
    C.PrintWindow(hwnd, hdcBlt, nFlags)
  end

  @[Link("winspool.drv")]
  @[Link("gdi32")]
  @[Link("user32")]
  lib C
    # :nodoc:
    fun DeviceCapabilitiesA(pDevice : Win32cr::Foundation::PSTR, pPort : Win32cr::Foundation::PSTR, fwCapability : Win32cr::Storage::Xps::DEVICE_CAPABILITIES, pOutput : Win32cr::Foundation::PSTR, pDevMode : Win32cr::Graphics::Gdi::DEVMODEA*) : Int32

    # :nodoc:
    fun DeviceCapabilitiesW(pDevice : Win32cr::Foundation::PWSTR, pPort : Win32cr::Foundation::PWSTR, fwCapability : Win32cr::Storage::Xps::DEVICE_CAPABILITIES, pOutput : Win32cr::Foundation::PWSTR, pDevMode : Win32cr::Graphics::Gdi::DEVMODEW*) : Int32

    # :nodoc:
    fun Escape(hdc : Win32cr::Graphics::Gdi::HDC, iEscape : Int32, cjIn : Int32, pvIn : Win32cr::Foundation::PSTR, pvOut : Void*) : Int32

    # :nodoc:
    fun ExtEscape(hdc : Win32cr::Graphics::Gdi::HDC, iEscape : Int32, cjInput : Int32, lpInData : Win32cr::Foundation::PSTR, cjOutput : Int32, lpOutData : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun StartDocA(hdc : Win32cr::Graphics::Gdi::HDC, lpdi : Win32cr::Storage::Xps::DOCINFOA*) : Int32

    # :nodoc:
    fun StartDocW(hdc : Win32cr::Graphics::Gdi::HDC, lpdi : Win32cr::Storage::Xps::DOCINFOW*) : Int32

    # :nodoc:
    fun EndDoc(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    # :nodoc:
    fun StartPage(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    # :nodoc:
    fun EndPage(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    # :nodoc:
    fun AbortDoc(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    # :nodoc:
    fun SetAbortProc(hdc : Win32cr::Graphics::Gdi::HDC, proc : Win32cr::Storage::Xps::ABORTPROC) : Int32

    # :nodoc:
    fun PrintWindow(hwnd : Win32cr::Foundation::HWND, hdcBlt : Win32cr::Graphics::Gdi::HDC, nFlags : Win32cr::Storage::Xps::PRINT_WINDOW_FLAGS) : Win32cr::Foundation::BOOL

  end
end