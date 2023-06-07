require "../foundation.cr"
require "../graphics/gdi.cr"
require "../system/com.cr"
require "../storage/packaging/opc.cr"
require "../security.cr"
require "../security/cryptography.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:winspool.dll")]
@[Link(ldflags: "/DELAYLOAD:gdi32.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("winspool")]
@[Link("gdi32")]
@[Link("user32")]
{% end %}
lib LibWin32
  alias HPTPROVIDER = LibC::IntPtrT

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
  XpsOMObjectFactory = LibC::GUID.new(0xe974d26d_u32, 0x3d9b_u16, 0x4d47_u16, StaticArray[0x88_u8, 0xcc_u8, 0x38_u8, 0x72_u8, 0xf2_u8, 0xdc_u8, 0x35_u8, 0x85_u8])
  XpsOMThumbnailGenerator = LibC::GUID.new(0x7e4a23e2_u32, 0xb969_u16, 0x4761_u16, StaticArray[0xbe_u8, 0x35_u8, 0x1a_u8, 0x8c_u8, 0xed_u8, 0x58_u8, 0xe3_u8, 0x23_u8])
  XpsSignatureManager = LibC::GUID.new(0xb0c43320_u32, 0x2315_u16, 0x44a2_u16, StaticArray[0xb7_u8, 0xa_u8, 0x9_u8, 0x43_u8, 0xa1_u8, 0x40_u8, 0xa8_u8, 0xee_u8])

  alias ABORTPROC = Proc(HDC, Int32, LibC::BOOL)


  enum PRINT_WINDOW_FLAGS : UInt32
    PW_CLIENTONLY = 1
  end

  enum DEVICE_CAPABILITIES : UInt32
    DC_BINNAMES = 12
    DC_BINS = 6
    DC_COLLATE = 22
    DC_COLORDEVICE = 32
    DC_COPIES = 18
    DC_DRIVER = 11
    DC_DUPLEX = 7
    DC_ENUMRESOLUTIONS = 13
    DC_EXTRA = 9
    DC_FIELDS = 1
    DC_FILEDEPENDENCIES = 14
    DC_MAXEXTENT = 5
    DC_MEDIAREADY = 29
    DC_MEDIATYPENAMES = 34
    DC_MEDIATYPES = 35
    DC_MINEXTENT = 4
    DC_ORIENTATION = 17
    DC_NUP = 33
    DC_PAPERNAMES = 16
    DC_PAPERS = 2
    DC_PAPERSIZE = 3
    DC_PERSONALITY = 25
    DC_PRINTERMEM = 28
    DC_PRINTRATE = 26
    DC_PRINTRATEPPM = 31
    DC_PRINTRATEUNIT = 27
    DC_SIZE = 8
    DC_STAPLE = 30
    DC_TRUETYPE = 15
    DC_VERSION = 10
  end

  enum PSINJECT_POINT : UInt16
    PSINJECT_BEGINSTREAM = 1
    PSINJECT_PSADOBE = 2
    PSINJECT_PAGESATEND = 3
    PSINJECT_PAGES = 4
    PSINJECT_DOCNEEDEDRES = 5
    PSINJECT_DOCSUPPLIEDRES = 6
    PSINJECT_PAGEORDER = 7
    PSINJECT_ORIENTATION = 8
    PSINJECT_BOUNDINGBOX = 9
    PSINJECT_DOCUMENTPROCESSCOLORS = 10
    PSINJECT_COMMENTS = 11
    PSINJECT_BEGINDEFAULTS = 12
    PSINJECT_ENDDEFAULTS = 13
    PSINJECT_BEGINPROLOG = 14
    PSINJECT_ENDPROLOG = 15
    PSINJECT_BEGINSETUP = 16
    PSINJECT_ENDSETUP = 17
    PSINJECT_TRAILER = 18
    PSINJECT_EOF = 19
    PSINJECT_ENDSTREAM = 20
    PSINJECT_DOCUMENTPROCESSCOLORSATEND = 21
    PSINJECT_PAGENUMBER = 100
    PSINJECT_BEGINPAGESETUP = 101
    PSINJECT_ENDPAGESETUP = 102
    PSINJECT_PAGETRAILER = 103
    PSINJECT_PLATECOLOR = 104
    PSINJECT_SHOWPAGE = 105
    PSINJECT_PAGEBBOX = 106
    PSINJECT_ENDPAGECOMMENTS = 107
    PSINJECT_VMSAVE = 200
    PSINJECT_VMRESTORE = 201
  end

  enum XPS_TILE_MODE : Int32
    XPS_TILE_MODE_NONE = 1
    XPS_TILE_MODE_TILE = 2
    XPS_TILE_MODE_FLIPX = 3
    XPS_TILE_MODE_FLIPY = 4
    XPS_TILE_MODE_FLIPXY = 5
  end

  enum XPS_COLOR_INTERPOLATION : Int32
    XPS_COLOR_INTERPOLATION_SCRGBLINEAR = 1
    XPS_COLOR_INTERPOLATION_SRGBLINEAR = 2
  end

  enum XPS_SPREAD_METHOD : Int32
    XPS_SPREAD_METHOD_PAD = 1
    XPS_SPREAD_METHOD_REFLECT = 2
    XPS_SPREAD_METHOD_REPEAT = 3
  end

  enum XPS_STYLE_SIMULATION : Int32
    XPS_STYLE_SIMULATION_NONE = 1
    XPS_STYLE_SIMULATION_ITALIC = 2
    XPS_STYLE_SIMULATION_BOLD = 3
    XPS_STYLE_SIMULATION_BOLDITALIC = 4
  end

  enum XPS_LINE_CAP : Int32
    XPS_LINE_CAP_FLAT = 1
    XPS_LINE_CAP_ROUND = 2
    XPS_LINE_CAP_SQUARE = 3
    XPS_LINE_CAP_TRIANGLE = 4
  end

  enum XPS_DASH_CAP : Int32
    XPS_DASH_CAP_FLAT = 1
    XPS_DASH_CAP_ROUND = 2
    XPS_DASH_CAP_SQUARE = 3
    XPS_DASH_CAP_TRIANGLE = 4
  end

  enum XPS_LINE_JOIN : Int32
    XPS_LINE_JOIN_MITER = 1
    XPS_LINE_JOIN_BEVEL = 2
    XPS_LINE_JOIN_ROUND = 3
  end

  enum XPS_IMAGE_TYPE : Int32
    XPS_IMAGE_TYPE_JPEG = 1
    XPS_IMAGE_TYPE_PNG = 2
    XPS_IMAGE_TYPE_TIFF = 3
    XPS_IMAGE_TYPE_WDP = 4
    XPS_IMAGE_TYPE_JXR = 5
  end

  enum XPS_COLOR_TYPE : Int32
    XPS_COLOR_TYPE_SRGB = 1
    XPS_COLOR_TYPE_SCRGB = 2
    XPS_COLOR_TYPE_CONTEXT = 3
  end

  enum XPS_FILL_RULE : Int32
    XPS_FILL_RULE_EVENODD = 1
    XPS_FILL_RULE_NONZERO = 2
  end

  enum XPS_SEGMENT_TYPE : Int32
    XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE = 1
    XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE = 2
    XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE = 3
    XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE = 4
    XPS_SEGMENT_TYPE_BEZIER = 5
    XPS_SEGMENT_TYPE_LINE = 6
    XPS_SEGMENT_TYPE_QUADRATIC_BEZIER = 7
  end

  enum XPS_SEGMENT_STROKE_PATTERN : Int32
    XPS_SEGMENT_STROKE_PATTERN_ALL = 1
    XPS_SEGMENT_STROKE_PATTERN_NONE = 2
    XPS_SEGMENT_STROKE_PATTERN_MIXED = 3
  end

  enum XPS_FONT_EMBEDDING : Int32
    XPS_FONT_EMBEDDING_NORMAL = 1
    XPS_FONT_EMBEDDING_OBFUSCATED = 2
    XPS_FONT_EMBEDDING_RESTRICTED = 3
    XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED = 4
  end

  enum XPS_OBJECT_TYPE : Int32
    XPS_OBJECT_TYPE_CANVAS = 1
    XPS_OBJECT_TYPE_GLYPHS = 2
    XPS_OBJECT_TYPE_PATH = 3
    XPS_OBJECT_TYPE_MATRIX_TRANSFORM = 4
    XPS_OBJECT_TYPE_GEOMETRY = 5
    XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH = 6
    XPS_OBJECT_TYPE_IMAGE_BRUSH = 7
    XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH = 8
    XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH = 9
    XPS_OBJECT_TYPE_VISUAL_BRUSH = 10
  end

  enum XPS_THUMBNAIL_SIZE : Int32
    XPS_THUMBNAIL_SIZE_VERYSMALL = 1
    XPS_THUMBNAIL_SIZE_SMALL = 2
    XPS_THUMBNAIL_SIZE_MEDIUM = 3
    XPS_THUMBNAIL_SIZE_LARGE = 4
  end

  enum XPS_INTERLEAVING : Int32
    XPS_INTERLEAVING_OFF = 1
    XPS_INTERLEAVING_ON = 2
  end

  enum XPS_DOCUMENT_TYPE : Int32
    XPS_DOCUMENT_TYPE_UNSPECIFIED = 1
    XPS_DOCUMENT_TYPE_XPS = 2
    XPS_DOCUMENT_TYPE_OPENXPS = 3
  end

  enum XPS_SIGNATURE_STATUS : Int32
    XPS_SIGNATURE_STATUS_INCOMPLIANT = 1
    XPS_SIGNATURE_STATUS_INCOMPLETE = 2
    XPS_SIGNATURE_STATUS_BROKEN = 3
    XPS_SIGNATURE_STATUS_QUESTIONABLE = 4
    XPS_SIGNATURE_STATUS_VALID = 5
  end

  enum XPS_SIGN_POLICY : Int32
    XPS_SIGN_POLICY_NONE = 0
    XPS_SIGN_POLICY_CORE_PROPERTIES = 1
    XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS = 2
    XPS_SIGN_POLICY_PRINT_TICKET = 4
    XPS_SIGN_POLICY_DISCARD_CONTROL = 8
    XPS_SIGN_POLICY_ALL = 15
  end

  enum XPS_SIGN_FLAGS : Int32
    XPS_SIGN_FLAGS_NONE = 0
    XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY = 1
  end

  union XPS_COLOR_XPS_COLOR_VALUE
    s_rgb : XPS_COLOR_XPS_COLOR_VALUE_sRGB_e__Struct
    sc_rgb : XPS_COLOR_XPS_COLOR_VALUE_scRGB_e__Struct
    context : XPS_COLOR_XPS_COLOR_VALUE_context_e__Struct
  end

  struct DRAWPATRECT
    pt_position : POINT
    pt_size : POINT
    w_style : UInt16
    w_pattern : UInt16
  end
  struct PSINJECTDATA
    data_bytes : UInt32
    injection_point : PSINJECT_POINT
    page_number : UInt16
  end
  struct PSFEATURE_OUTPUT
    b_page_independent : LibC::BOOL
    b_set_page_device : LibC::BOOL
  end
  struct PSFEATURE_CUSTPAPER
    l_orientation : Int32
    l_width : Int32
    l_height : Int32
    l_width_offset : Int32
    l_height_offset : Int32
  end
  struct DOCINFOA
    cb_size : Int32
    lpsz_doc_name : PSTR
    lpsz_output : PSTR
    lpsz_datatype : PSTR
    fw_type : UInt32
  end
  struct DOCINFOW
    cb_size : Int32
    lpsz_doc_name : LibC::LPWSTR
    lpsz_output : LibC::LPWSTR
    lpsz_datatype : LibC::LPWSTR
    fw_type : UInt32
  end
  struct XPS_POINT
    x : Float32
    y : Float32
  end
  struct XPS_SIZE
    width : Float32
    height : Float32
  end
  struct XPS_RECT
    x : Float32
    y : Float32
    width : Float32
    height : Float32
  end
  struct XPS_DASH
    length : Float32
    gap : Float32
  end
  struct XPS_GLYPH_INDEX
    index : Int32
    advance_width : Float32
    horizontal_offset : Float32
    vertical_offset : Float32
  end
  struct XPS_GLYPH_MAPPING
    unicode_string_start : UInt32
    unicode_string_length : UInt16
    glyph_indices_start : UInt32
    glyph_indices_length : UInt16
  end
  struct XPS_MATRIX
    m11 : Float32
    m12 : Float32
    m21 : Float32
    m22 : Float32
    m31 : Float32
    m32 : Float32
  end
  struct XPS_COLOR
    color_type : XPS_COLOR_TYPE
    value : XPS_COLOR_XPS_COLOR_VALUE
  end
  struct XPS_COLOR_XPS_COLOR_VALUE_scRGB_e__Struct
    alpha : Float32
    red : Float32
    green : Float32
    blue : Float32
  end
  struct XPS_COLOR_XPS_COLOR_VALUE_sRGB_e__Struct
    alpha : UInt8
    red : UInt8
    green : UInt8
    blue : UInt8
  end
  struct XPS_COLOR_XPS_COLOR_VALUE_context_e__Struct
    channel_count : UInt8
    channels : Float32[9]*
  end


  struct IXpsOMShareableVTbl
    query_interface : Proc(IXpsOMShareable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMShareable*, UInt32)
    release : Proc(IXpsOMShareable*, UInt32)
    get_owner : Proc(IXpsOMShareable*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMShareable*, XPS_OBJECT_TYPE*, HRESULT)
  end

  struct IXpsOMShareable
    lpVtbl : IXpsOMShareableVTbl*
  end

  struct IXpsOMVisualVTbl
    query_interface : Proc(IXpsOMVisual*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMVisual*, UInt32)
    release : Proc(IXpsOMVisual*, UInt32)
    get_owner : Proc(IXpsOMVisual*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMVisual*, XPS_OBJECT_TYPE*, HRESULT)
    get_transform : Proc(IXpsOMVisual*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMVisual*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMVisual*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR, HRESULT)
    get_clip_geometry : Proc(IXpsOMVisual*, IXpsOMGeometry*, HRESULT)
    get_clip_geometry_local : Proc(IXpsOMVisual*, IXpsOMGeometry*, HRESULT)
    set_clip_geometry_local : Proc(IXpsOMVisual*, IXpsOMGeometry, HRESULT)
    get_clip_geometry_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR*, HRESULT)
    set_clip_geometry_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR, HRESULT)
    get_opacity : Proc(IXpsOMVisual*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMVisual*, Float32, HRESULT)
    get_opacity_mask_brush : Proc(IXpsOMVisual*, IXpsOMBrush*, HRESULT)
    get_opacity_mask_brush_local : Proc(IXpsOMVisual*, IXpsOMBrush*, HRESULT)
    set_opacity_mask_brush_local : Proc(IXpsOMVisual*, IXpsOMBrush, HRESULT)
    get_opacity_mask_brush_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR*, HRESULT)
    set_opacity_mask_brush_lookup : Proc(IXpsOMVisual*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMVisual*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMVisual*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMVisual*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMVisual*, LibC::BOOL, HRESULT)
    get_hyperlink_navigate_uri : Proc(IXpsOMVisual*, IUri*, HRESULT)
    set_hyperlink_navigate_uri : Proc(IXpsOMVisual*, IUri, HRESULT)
    get_language : Proc(IXpsOMVisual*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMVisual*, LibC::LPWSTR, HRESULT)
  end

  struct IXpsOMVisual
    lpVtbl : IXpsOMVisualVTbl*
  end

  struct IXpsOMPartVTbl
    query_interface : Proc(IXpsOMPart*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPart*, UInt32)
    release : Proc(IXpsOMPart*, UInt32)
    get_part_name : Proc(IXpsOMPart*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMPart*, IOpcPartUri, HRESULT)
  end

  struct IXpsOMPart
    lpVtbl : IXpsOMPartVTbl*
  end

  struct IXpsOMGlyphsEditorVTbl
    query_interface : Proc(IXpsOMGlyphsEditor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGlyphsEditor*, UInt32)
    release : Proc(IXpsOMGlyphsEditor*, UInt32)
    apply_edits : Proc(IXpsOMGlyphsEditor*, HRESULT)
    get_unicode_string : Proc(IXpsOMGlyphsEditor*, LibC::LPWSTR*, HRESULT)
    set_unicode_string : Proc(IXpsOMGlyphsEditor*, LibC::LPWSTR, HRESULT)
    get_glyph_index_count : Proc(IXpsOMGlyphsEditor*, UInt32*, HRESULT)
    get_glyph_indices : Proc(IXpsOMGlyphsEditor*, UInt32*, XPS_GLYPH_INDEX*, HRESULT)
    set_glyph_indices : Proc(IXpsOMGlyphsEditor*, UInt32, XPS_GLYPH_INDEX*, HRESULT)
    get_glyph_mapping_count : Proc(IXpsOMGlyphsEditor*, UInt32*, HRESULT)
    get_glyph_mappings : Proc(IXpsOMGlyphsEditor*, UInt32*, XPS_GLYPH_MAPPING*, HRESULT)
    set_glyph_mappings : Proc(IXpsOMGlyphsEditor*, UInt32, XPS_GLYPH_MAPPING*, HRESULT)
    get_prohibited_caret_stop_count : Proc(IXpsOMGlyphsEditor*, UInt32*, HRESULT)
    get_prohibited_caret_stops : Proc(IXpsOMGlyphsEditor*, UInt32*, UInt32*, HRESULT)
    set_prohibited_caret_stops : Proc(IXpsOMGlyphsEditor*, UInt32, UInt32*, HRESULT)
    get_bidi_level : Proc(IXpsOMGlyphsEditor*, UInt32*, HRESULT)
    set_bidi_level : Proc(IXpsOMGlyphsEditor*, UInt32, HRESULT)
    get_is_sideways : Proc(IXpsOMGlyphsEditor*, LibC::BOOL*, HRESULT)
    set_is_sideways : Proc(IXpsOMGlyphsEditor*, LibC::BOOL, HRESULT)
    get_device_font_name : Proc(IXpsOMGlyphsEditor*, LibC::LPWSTR*, HRESULT)
    set_device_font_name : Proc(IXpsOMGlyphsEditor*, LibC::LPWSTR, HRESULT)
  end

  struct IXpsOMGlyphsEditor
    lpVtbl : IXpsOMGlyphsEditorVTbl*
  end

  struct IXpsOMGlyphsVTbl
    query_interface : Proc(IXpsOMGlyphs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGlyphs*, UInt32)
    release : Proc(IXpsOMGlyphs*, UInt32)
    get_owner : Proc(IXpsOMGlyphs*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMGlyphs*, XPS_OBJECT_TYPE*, HRESULT)
    get_transform : Proc(IXpsOMGlyphs*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMGlyphs*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMGlyphs*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_clip_geometry : Proc(IXpsOMGlyphs*, IXpsOMGeometry*, HRESULT)
    get_clip_geometry_local : Proc(IXpsOMGlyphs*, IXpsOMGeometry*, HRESULT)
    set_clip_geometry_local : Proc(IXpsOMGlyphs*, IXpsOMGeometry, HRESULT)
    get_clip_geometry_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_clip_geometry_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_opacity : Proc(IXpsOMGlyphs*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMGlyphs*, Float32, HRESULT)
    get_opacity_mask_brush : Proc(IXpsOMGlyphs*, IXpsOMBrush*, HRESULT)
    get_opacity_mask_brush_local : Proc(IXpsOMGlyphs*, IXpsOMBrush*, HRESULT)
    set_opacity_mask_brush_local : Proc(IXpsOMGlyphs*, IXpsOMBrush, HRESULT)
    get_opacity_mask_brush_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_opacity_mask_brush_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMGlyphs*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMGlyphs*, LibC::BOOL, HRESULT)
    get_hyperlink_navigate_uri : Proc(IXpsOMGlyphs*, IUri*, HRESULT)
    set_hyperlink_navigate_uri : Proc(IXpsOMGlyphs*, IUri, HRESULT)
    get_language : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_unicode_string : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    get_glyph_index_count : Proc(IXpsOMGlyphs*, UInt32*, HRESULT)
    get_glyph_indices : Proc(IXpsOMGlyphs*, UInt32*, XPS_GLYPH_INDEX*, HRESULT)
    get_glyph_mapping_count : Proc(IXpsOMGlyphs*, UInt32*, HRESULT)
    get_glyph_mappings : Proc(IXpsOMGlyphs*, UInt32*, XPS_GLYPH_MAPPING*, HRESULT)
    get_prohibited_caret_stop_count : Proc(IXpsOMGlyphs*, UInt32*, HRESULT)
    get_prohibited_caret_stops : Proc(IXpsOMGlyphs*, UInt32*, UInt32*, HRESULT)
    get_bidi_level : Proc(IXpsOMGlyphs*, UInt32*, HRESULT)
    get_is_sideways : Proc(IXpsOMGlyphs*, LibC::BOOL*, HRESULT)
    get_device_font_name : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    get_style_simulations : Proc(IXpsOMGlyphs*, XPS_STYLE_SIMULATION*, HRESULT)
    set_style_simulations : Proc(IXpsOMGlyphs*, XPS_STYLE_SIMULATION, HRESULT)
    get_origin : Proc(IXpsOMGlyphs*, XPS_POINT*, HRESULT)
    set_origin : Proc(IXpsOMGlyphs*, XPS_POINT*, HRESULT)
    get_font_rendering_em_size : Proc(IXpsOMGlyphs*, Float32*, HRESULT)
    set_font_rendering_em_size : Proc(IXpsOMGlyphs*, Float32, HRESULT)
    get_font_resource : Proc(IXpsOMGlyphs*, IXpsOMFontResource*, HRESULT)
    set_font_resource : Proc(IXpsOMGlyphs*, IXpsOMFontResource, HRESULT)
    get_font_face_index : Proc(IXpsOMGlyphs*, Int16*, HRESULT)
    set_font_face_index : Proc(IXpsOMGlyphs*, Int16, HRESULT)
    get_fill_brush : Proc(IXpsOMGlyphs*, IXpsOMBrush*, HRESULT)
    get_fill_brush_local : Proc(IXpsOMGlyphs*, IXpsOMBrush*, HRESULT)
    set_fill_brush_local : Proc(IXpsOMGlyphs*, IXpsOMBrush, HRESULT)
    get_fill_brush_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR*, HRESULT)
    set_fill_brush_lookup : Proc(IXpsOMGlyphs*, LibC::LPWSTR, HRESULT)
    get_glyphs_editor : Proc(IXpsOMGlyphs*, IXpsOMGlyphsEditor*, HRESULT)
    clone : Proc(IXpsOMGlyphs*, IXpsOMGlyphs*, HRESULT)
  end

  struct IXpsOMGlyphs
    lpVtbl : IXpsOMGlyphsVTbl*
  end

  struct IXpsOMDashCollectionVTbl
    query_interface : Proc(IXpsOMDashCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDashCollection*, UInt32)
    release : Proc(IXpsOMDashCollection*, UInt32)
    get_count : Proc(IXpsOMDashCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMDashCollection*, UInt32, XPS_DASH*, HRESULT)
    insert_at : Proc(IXpsOMDashCollection*, UInt32, XPS_DASH*, HRESULT)
    remove_at : Proc(IXpsOMDashCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMDashCollection*, UInt32, XPS_DASH*, HRESULT)
    append : Proc(IXpsOMDashCollection*, XPS_DASH*, HRESULT)
  end

  struct IXpsOMDashCollection
    lpVtbl : IXpsOMDashCollectionVTbl*
  end

  struct IXpsOMMatrixTransformVTbl
    query_interface : Proc(IXpsOMMatrixTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMMatrixTransform*, UInt32)
    release : Proc(IXpsOMMatrixTransform*, UInt32)
    get_owner : Proc(IXpsOMMatrixTransform*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMMatrixTransform*, XPS_OBJECT_TYPE*, HRESULT)
    get_matrix : Proc(IXpsOMMatrixTransform*, XPS_MATRIX*, HRESULT)
    set_matrix : Proc(IXpsOMMatrixTransform*, XPS_MATRIX*, HRESULT)
    clone : Proc(IXpsOMMatrixTransform*, IXpsOMMatrixTransform*, HRESULT)
  end

  struct IXpsOMMatrixTransform
    lpVtbl : IXpsOMMatrixTransformVTbl*
  end

  struct IXpsOMGeometryVTbl
    query_interface : Proc(IXpsOMGeometry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGeometry*, UInt32)
    release : Proc(IXpsOMGeometry*, UInt32)
    get_owner : Proc(IXpsOMGeometry*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMGeometry*, XPS_OBJECT_TYPE*, HRESULT)
    get_figures : Proc(IXpsOMGeometry*, IXpsOMGeometryFigureCollection*, HRESULT)
    get_fill_rule : Proc(IXpsOMGeometry*, XPS_FILL_RULE*, HRESULT)
    set_fill_rule : Proc(IXpsOMGeometry*, XPS_FILL_RULE, HRESULT)
    get_transform : Proc(IXpsOMGeometry*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMGeometry*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMGeometry*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMGeometry*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMGeometry*, LibC::LPWSTR, HRESULT)
    clone : Proc(IXpsOMGeometry*, IXpsOMGeometry*, HRESULT)
  end

  struct IXpsOMGeometry
    lpVtbl : IXpsOMGeometryVTbl*
  end

  struct IXpsOMGeometryFigureVTbl
    query_interface : Proc(IXpsOMGeometryFigure*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGeometryFigure*, UInt32)
    release : Proc(IXpsOMGeometryFigure*, UInt32)
    get_owner : Proc(IXpsOMGeometryFigure*, IXpsOMGeometry*, HRESULT)
    get_segment_data : Proc(IXpsOMGeometryFigure*, UInt32*, Float32*, HRESULT)
    get_segment_types : Proc(IXpsOMGeometryFigure*, UInt32*, XPS_SEGMENT_TYPE*, HRESULT)
    get_segment_strokes : Proc(IXpsOMGeometryFigure*, UInt32*, LibC::BOOL*, HRESULT)
    set_segments : Proc(IXpsOMGeometryFigure*, UInt32, UInt32, XPS_SEGMENT_TYPE*, Float32*, LibC::BOOL*, HRESULT)
    get_start_point : Proc(IXpsOMGeometryFigure*, XPS_POINT*, HRESULT)
    set_start_point : Proc(IXpsOMGeometryFigure*, XPS_POINT*, HRESULT)
    get_is_closed : Proc(IXpsOMGeometryFigure*, LibC::BOOL*, HRESULT)
    set_is_closed : Proc(IXpsOMGeometryFigure*, LibC::BOOL, HRESULT)
    get_is_filled : Proc(IXpsOMGeometryFigure*, LibC::BOOL*, HRESULT)
    set_is_filled : Proc(IXpsOMGeometryFigure*, LibC::BOOL, HRESULT)
    get_segment_count : Proc(IXpsOMGeometryFigure*, UInt32*, HRESULT)
    get_segment_data_count : Proc(IXpsOMGeometryFigure*, UInt32*, HRESULT)
    get_segment_stroke_pattern : Proc(IXpsOMGeometryFigure*, XPS_SEGMENT_STROKE_PATTERN*, HRESULT)
    clone : Proc(IXpsOMGeometryFigure*, IXpsOMGeometryFigure*, HRESULT)
  end

  struct IXpsOMGeometryFigure
    lpVtbl : IXpsOMGeometryFigureVTbl*
  end

  struct IXpsOMGeometryFigureCollectionVTbl
    query_interface : Proc(IXpsOMGeometryFigureCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGeometryFigureCollection*, UInt32)
    release : Proc(IXpsOMGeometryFigureCollection*, UInt32)
    get_count : Proc(IXpsOMGeometryFigureCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, IXpsOMGeometryFigure*, HRESULT)
    insert_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, IXpsOMGeometryFigure, HRESULT)
    remove_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMGeometryFigureCollection*, UInt32, IXpsOMGeometryFigure, HRESULT)
    append : Proc(IXpsOMGeometryFigureCollection*, IXpsOMGeometryFigure, HRESULT)
  end

  struct IXpsOMGeometryFigureCollection
    lpVtbl : IXpsOMGeometryFigureCollectionVTbl*
  end

  struct IXpsOMPathVTbl
    query_interface : Proc(IXpsOMPath*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPath*, UInt32)
    release : Proc(IXpsOMPath*, UInt32)
    get_owner : Proc(IXpsOMPath*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMPath*, XPS_OBJECT_TYPE*, HRESULT)
    get_transform : Proc(IXpsOMPath*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMPath*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMPath*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_clip_geometry : Proc(IXpsOMPath*, IXpsOMGeometry*, HRESULT)
    get_clip_geometry_local : Proc(IXpsOMPath*, IXpsOMGeometry*, HRESULT)
    set_clip_geometry_local : Proc(IXpsOMPath*, IXpsOMGeometry, HRESULT)
    get_clip_geometry_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_clip_geometry_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_opacity : Proc(IXpsOMPath*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMPath*, Float32, HRESULT)
    get_opacity_mask_brush : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    get_opacity_mask_brush_local : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    set_opacity_mask_brush_local : Proc(IXpsOMPath*, IXpsOMBrush, HRESULT)
    get_opacity_mask_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_opacity_mask_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMPath*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMPath*, LibC::BOOL, HRESULT)
    get_hyperlink_navigate_uri : Proc(IXpsOMPath*, IUri*, HRESULT)
    set_hyperlink_navigate_uri : Proc(IXpsOMPath*, IUri, HRESULT)
    get_language : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_geometry : Proc(IXpsOMPath*, IXpsOMGeometry*, HRESULT)
    get_geometry_local : Proc(IXpsOMPath*, IXpsOMGeometry*, HRESULT)
    set_geometry_local : Proc(IXpsOMPath*, IXpsOMGeometry, HRESULT)
    get_geometry_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_geometry_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_accessibility_short_description : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_accessibility_short_description : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_accessibility_long_description : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_accessibility_long_description : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_snaps_to_pixels : Proc(IXpsOMPath*, LibC::BOOL*, HRESULT)
    set_snaps_to_pixels : Proc(IXpsOMPath*, LibC::BOOL, HRESULT)
    get_stroke_brush : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    get_stroke_brush_local : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    set_stroke_brush_local : Proc(IXpsOMPath*, IXpsOMBrush, HRESULT)
    get_stroke_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_stroke_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    get_stroke_dashes : Proc(IXpsOMPath*, IXpsOMDashCollection*, HRESULT)
    get_stroke_dash_cap : Proc(IXpsOMPath*, XPS_DASH_CAP*, HRESULT)
    set_stroke_dash_cap : Proc(IXpsOMPath*, XPS_DASH_CAP, HRESULT)
    get_stroke_dash_offset : Proc(IXpsOMPath*, Float32*, HRESULT)
    set_stroke_dash_offset : Proc(IXpsOMPath*, Float32, HRESULT)
    get_stroke_start_line_cap : Proc(IXpsOMPath*, XPS_LINE_CAP*, HRESULT)
    set_stroke_start_line_cap : Proc(IXpsOMPath*, XPS_LINE_CAP, HRESULT)
    get_stroke_end_line_cap : Proc(IXpsOMPath*, XPS_LINE_CAP*, HRESULT)
    set_stroke_end_line_cap : Proc(IXpsOMPath*, XPS_LINE_CAP, HRESULT)
    get_stroke_line_join : Proc(IXpsOMPath*, XPS_LINE_JOIN*, HRESULT)
    set_stroke_line_join : Proc(IXpsOMPath*, XPS_LINE_JOIN, HRESULT)
    get_stroke_miter_limit : Proc(IXpsOMPath*, Float32*, HRESULT)
    set_stroke_miter_limit : Proc(IXpsOMPath*, Float32, HRESULT)
    get_stroke_thickness : Proc(IXpsOMPath*, Float32*, HRESULT)
    set_stroke_thickness : Proc(IXpsOMPath*, Float32, HRESULT)
    get_fill_brush : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    get_fill_brush_local : Proc(IXpsOMPath*, IXpsOMBrush*, HRESULT)
    set_fill_brush_local : Proc(IXpsOMPath*, IXpsOMBrush, HRESULT)
    get_fill_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR*, HRESULT)
    set_fill_brush_lookup : Proc(IXpsOMPath*, LibC::LPWSTR, HRESULT)
    clone : Proc(IXpsOMPath*, IXpsOMPath*, HRESULT)
  end

  struct IXpsOMPath
    lpVtbl : IXpsOMPathVTbl*
  end

  struct IXpsOMBrushVTbl
    query_interface : Proc(IXpsOMBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMBrush*, UInt32)
    release : Proc(IXpsOMBrush*, UInt32)
    get_owner : Proc(IXpsOMBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMBrush*, Float32, HRESULT)
  end

  struct IXpsOMBrush
    lpVtbl : IXpsOMBrushVTbl*
  end

  struct IXpsOMGradientStopCollectionVTbl
    query_interface : Proc(IXpsOMGradientStopCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGradientStopCollection*, UInt32)
    release : Proc(IXpsOMGradientStopCollection*, UInt32)
    get_count : Proc(IXpsOMGradientStopCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMGradientStopCollection*, UInt32, IXpsOMGradientStop*, HRESULT)
    insert_at : Proc(IXpsOMGradientStopCollection*, UInt32, IXpsOMGradientStop, HRESULT)
    remove_at : Proc(IXpsOMGradientStopCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMGradientStopCollection*, UInt32, IXpsOMGradientStop, HRESULT)
    append : Proc(IXpsOMGradientStopCollection*, IXpsOMGradientStop, HRESULT)
  end

  struct IXpsOMGradientStopCollection
    lpVtbl : IXpsOMGradientStopCollectionVTbl*
  end

  struct IXpsOMSolidColorBrushVTbl
    query_interface : Proc(IXpsOMSolidColorBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMSolidColorBrush*, UInt32)
    release : Proc(IXpsOMSolidColorBrush*, UInt32)
    get_owner : Proc(IXpsOMSolidColorBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMSolidColorBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMSolidColorBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMSolidColorBrush*, Float32, HRESULT)
    get_color : Proc(IXpsOMSolidColorBrush*, XPS_COLOR*, IXpsOMColorProfileResource*, HRESULT)
    set_color : Proc(IXpsOMSolidColorBrush*, XPS_COLOR*, IXpsOMColorProfileResource, HRESULT)
    clone : Proc(IXpsOMSolidColorBrush*, IXpsOMSolidColorBrush*, HRESULT)
  end

  struct IXpsOMSolidColorBrush
    lpVtbl : IXpsOMSolidColorBrushVTbl*
  end

  struct IXpsOMTileBrushVTbl
    query_interface : Proc(IXpsOMTileBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMTileBrush*, UInt32)
    release : Proc(IXpsOMTileBrush*, UInt32)
    get_owner : Proc(IXpsOMTileBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMTileBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMTileBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMTileBrush*, Float32, HRESULT)
    get_transform : Proc(IXpsOMTileBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMTileBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMTileBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMTileBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMTileBrush*, LibC::LPWSTR, HRESULT)
    get_viewbox : Proc(IXpsOMTileBrush*, XPS_RECT*, HRESULT)
    set_viewbox : Proc(IXpsOMTileBrush*, XPS_RECT*, HRESULT)
    get_viewport : Proc(IXpsOMTileBrush*, XPS_RECT*, HRESULT)
    set_viewport : Proc(IXpsOMTileBrush*, XPS_RECT*, HRESULT)
    get_tile_mode : Proc(IXpsOMTileBrush*, XPS_TILE_MODE*, HRESULT)
    set_tile_mode : Proc(IXpsOMTileBrush*, XPS_TILE_MODE, HRESULT)
  end

  struct IXpsOMTileBrush
    lpVtbl : IXpsOMTileBrushVTbl*
  end

  struct IXpsOMVisualBrushVTbl
    query_interface : Proc(IXpsOMVisualBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMVisualBrush*, UInt32)
    release : Proc(IXpsOMVisualBrush*, UInt32)
    get_owner : Proc(IXpsOMVisualBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMVisualBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMVisualBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMVisualBrush*, Float32, HRESULT)
    get_transform : Proc(IXpsOMVisualBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMVisualBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMVisualBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMVisualBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMVisualBrush*, LibC::LPWSTR, HRESULT)
    get_viewbox : Proc(IXpsOMVisualBrush*, XPS_RECT*, HRESULT)
    set_viewbox : Proc(IXpsOMVisualBrush*, XPS_RECT*, HRESULT)
    get_viewport : Proc(IXpsOMVisualBrush*, XPS_RECT*, HRESULT)
    set_viewport : Proc(IXpsOMVisualBrush*, XPS_RECT*, HRESULT)
    get_tile_mode : Proc(IXpsOMVisualBrush*, XPS_TILE_MODE*, HRESULT)
    set_tile_mode : Proc(IXpsOMVisualBrush*, XPS_TILE_MODE, HRESULT)
    get_visual : Proc(IXpsOMVisualBrush*, IXpsOMVisual*, HRESULT)
    get_visual_local : Proc(IXpsOMVisualBrush*, IXpsOMVisual*, HRESULT)
    set_visual_local : Proc(IXpsOMVisualBrush*, IXpsOMVisual, HRESULT)
    get_visual_lookup : Proc(IXpsOMVisualBrush*, LibC::LPWSTR*, HRESULT)
    set_visual_lookup : Proc(IXpsOMVisualBrush*, LibC::LPWSTR, HRESULT)
    clone : Proc(IXpsOMVisualBrush*, IXpsOMVisualBrush*, HRESULT)
  end

  struct IXpsOMVisualBrush
    lpVtbl : IXpsOMVisualBrushVTbl*
  end

  struct IXpsOMImageBrushVTbl
    query_interface : Proc(IXpsOMImageBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMImageBrush*, UInt32)
    release : Proc(IXpsOMImageBrush*, UInt32)
    get_owner : Proc(IXpsOMImageBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMImageBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMImageBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMImageBrush*, Float32, HRESULT)
    get_transform : Proc(IXpsOMImageBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMImageBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMImageBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMImageBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMImageBrush*, LibC::LPWSTR, HRESULT)
    get_viewbox : Proc(IXpsOMImageBrush*, XPS_RECT*, HRESULT)
    set_viewbox : Proc(IXpsOMImageBrush*, XPS_RECT*, HRESULT)
    get_viewport : Proc(IXpsOMImageBrush*, XPS_RECT*, HRESULT)
    set_viewport : Proc(IXpsOMImageBrush*, XPS_RECT*, HRESULT)
    get_tile_mode : Proc(IXpsOMImageBrush*, XPS_TILE_MODE*, HRESULT)
    set_tile_mode : Proc(IXpsOMImageBrush*, XPS_TILE_MODE, HRESULT)
    get_image_resource : Proc(IXpsOMImageBrush*, IXpsOMImageResource*, HRESULT)
    set_image_resource : Proc(IXpsOMImageBrush*, IXpsOMImageResource, HRESULT)
    get_color_profile_resource : Proc(IXpsOMImageBrush*, IXpsOMColorProfileResource*, HRESULT)
    set_color_profile_resource : Proc(IXpsOMImageBrush*, IXpsOMColorProfileResource, HRESULT)
    clone : Proc(IXpsOMImageBrush*, IXpsOMImageBrush*, HRESULT)
  end

  struct IXpsOMImageBrush
    lpVtbl : IXpsOMImageBrushVTbl*
  end

  struct IXpsOMGradientStopVTbl
    query_interface : Proc(IXpsOMGradientStop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGradientStop*, UInt32)
    release : Proc(IXpsOMGradientStop*, UInt32)
    get_owner : Proc(IXpsOMGradientStop*, IXpsOMGradientBrush*, HRESULT)
    get_offset : Proc(IXpsOMGradientStop*, Float32*, HRESULT)
    set_offset : Proc(IXpsOMGradientStop*, Float32, HRESULT)
    get_color : Proc(IXpsOMGradientStop*, XPS_COLOR*, IXpsOMColorProfileResource*, HRESULT)
    set_color : Proc(IXpsOMGradientStop*, XPS_COLOR*, IXpsOMColorProfileResource, HRESULT)
    clone : Proc(IXpsOMGradientStop*, IXpsOMGradientStop*, HRESULT)
  end

  struct IXpsOMGradientStop
    lpVtbl : IXpsOMGradientStopVTbl*
  end

  struct IXpsOMGradientBrushVTbl
    query_interface : Proc(IXpsOMGradientBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMGradientBrush*, UInt32)
    release : Proc(IXpsOMGradientBrush*, UInt32)
    get_owner : Proc(IXpsOMGradientBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMGradientBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMGradientBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMGradientBrush*, Float32, HRESULT)
    get_gradient_stops : Proc(IXpsOMGradientBrush*, IXpsOMGradientStopCollection*, HRESULT)
    get_transform : Proc(IXpsOMGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMGradientBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMGradientBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMGradientBrush*, LibC::LPWSTR, HRESULT)
    get_spread_method : Proc(IXpsOMGradientBrush*, XPS_SPREAD_METHOD*, HRESULT)
    set_spread_method : Proc(IXpsOMGradientBrush*, XPS_SPREAD_METHOD, HRESULT)
    get_color_interpolation_mode : Proc(IXpsOMGradientBrush*, XPS_COLOR_INTERPOLATION*, HRESULT)
    set_color_interpolation_mode : Proc(IXpsOMGradientBrush*, XPS_COLOR_INTERPOLATION, HRESULT)
  end

  struct IXpsOMGradientBrush
    lpVtbl : IXpsOMGradientBrushVTbl*
  end

  struct IXpsOMLinearGradientBrushVTbl
    query_interface : Proc(IXpsOMLinearGradientBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMLinearGradientBrush*, UInt32)
    release : Proc(IXpsOMLinearGradientBrush*, UInt32)
    get_owner : Proc(IXpsOMLinearGradientBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMLinearGradientBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMLinearGradientBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMLinearGradientBrush*, Float32, HRESULT)
    get_gradient_stops : Proc(IXpsOMLinearGradientBrush*, IXpsOMGradientStopCollection*, HRESULT)
    get_transform : Proc(IXpsOMLinearGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMLinearGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMLinearGradientBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMLinearGradientBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMLinearGradientBrush*, LibC::LPWSTR, HRESULT)
    get_spread_method : Proc(IXpsOMLinearGradientBrush*, XPS_SPREAD_METHOD*, HRESULT)
    set_spread_method : Proc(IXpsOMLinearGradientBrush*, XPS_SPREAD_METHOD, HRESULT)
    get_color_interpolation_mode : Proc(IXpsOMLinearGradientBrush*, XPS_COLOR_INTERPOLATION*, HRESULT)
    set_color_interpolation_mode : Proc(IXpsOMLinearGradientBrush*, XPS_COLOR_INTERPOLATION, HRESULT)
    get_start_point : Proc(IXpsOMLinearGradientBrush*, XPS_POINT*, HRESULT)
    set_start_point : Proc(IXpsOMLinearGradientBrush*, XPS_POINT*, HRESULT)
    get_end_point : Proc(IXpsOMLinearGradientBrush*, XPS_POINT*, HRESULT)
    set_end_point : Proc(IXpsOMLinearGradientBrush*, XPS_POINT*, HRESULT)
    clone : Proc(IXpsOMLinearGradientBrush*, IXpsOMLinearGradientBrush*, HRESULT)
  end

  struct IXpsOMLinearGradientBrush
    lpVtbl : IXpsOMLinearGradientBrushVTbl*
  end

  struct IXpsOMRadialGradientBrushVTbl
    query_interface : Proc(IXpsOMRadialGradientBrush*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMRadialGradientBrush*, UInt32)
    release : Proc(IXpsOMRadialGradientBrush*, UInt32)
    get_owner : Proc(IXpsOMRadialGradientBrush*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMRadialGradientBrush*, XPS_OBJECT_TYPE*, HRESULT)
    get_opacity : Proc(IXpsOMRadialGradientBrush*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMRadialGradientBrush*, Float32, HRESULT)
    get_gradient_stops : Proc(IXpsOMRadialGradientBrush*, IXpsOMGradientStopCollection*, HRESULT)
    get_transform : Proc(IXpsOMRadialGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMRadialGradientBrush*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMRadialGradientBrush*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMRadialGradientBrush*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMRadialGradientBrush*, LibC::LPWSTR, HRESULT)
    get_spread_method : Proc(IXpsOMRadialGradientBrush*, XPS_SPREAD_METHOD*, HRESULT)
    set_spread_method : Proc(IXpsOMRadialGradientBrush*, XPS_SPREAD_METHOD, HRESULT)
    get_color_interpolation_mode : Proc(IXpsOMRadialGradientBrush*, XPS_COLOR_INTERPOLATION*, HRESULT)
    set_color_interpolation_mode : Proc(IXpsOMRadialGradientBrush*, XPS_COLOR_INTERPOLATION, HRESULT)
    get_center : Proc(IXpsOMRadialGradientBrush*, XPS_POINT*, HRESULT)
    set_center : Proc(IXpsOMRadialGradientBrush*, XPS_POINT*, HRESULT)
    get_radii_sizes : Proc(IXpsOMRadialGradientBrush*, XPS_SIZE*, HRESULT)
    set_radii_sizes : Proc(IXpsOMRadialGradientBrush*, XPS_SIZE*, HRESULT)
    get_gradient_origin : Proc(IXpsOMRadialGradientBrush*, XPS_POINT*, HRESULT)
    set_gradient_origin : Proc(IXpsOMRadialGradientBrush*, XPS_POINT*, HRESULT)
    clone : Proc(IXpsOMRadialGradientBrush*, IXpsOMRadialGradientBrush*, HRESULT)
  end

  struct IXpsOMRadialGradientBrush
    lpVtbl : IXpsOMRadialGradientBrushVTbl*
  end

  struct IXpsOMResourceVTbl
    query_interface : Proc(IXpsOMResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMResource*, UInt32)
    release : Proc(IXpsOMResource*, UInt32)
    get_part_name : Proc(IXpsOMResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMResource*, IOpcPartUri, HRESULT)
  end

  struct IXpsOMResource
    lpVtbl : IXpsOMResourceVTbl*
  end

  struct IXpsOMPartResourcesVTbl
    query_interface : Proc(IXpsOMPartResources*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPartResources*, UInt32)
    release : Proc(IXpsOMPartResources*, UInt32)
    get_font_resources : Proc(IXpsOMPartResources*, IXpsOMFontResourceCollection*, HRESULT)
    get_image_resources : Proc(IXpsOMPartResources*, IXpsOMImageResourceCollection*, HRESULT)
    get_color_profile_resources : Proc(IXpsOMPartResources*, IXpsOMColorProfileResourceCollection*, HRESULT)
    get_remote_dictionary_resources : Proc(IXpsOMPartResources*, IXpsOMRemoteDictionaryResourceCollection*, HRESULT)
  end

  struct IXpsOMPartResources
    lpVtbl : IXpsOMPartResourcesVTbl*
  end

  struct IXpsOMDictionaryVTbl
    query_interface : Proc(IXpsOMDictionary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDictionary*, UInt32)
    release : Proc(IXpsOMDictionary*, UInt32)
    get_owner : Proc(IXpsOMDictionary*, IUnknown*, HRESULT)
    get_count : Proc(IXpsOMDictionary*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMDictionary*, UInt32, LibC::LPWSTR*, IXpsOMShareable*, HRESULT)
    get_by_key : Proc(IXpsOMDictionary*, LibC::LPWSTR, IXpsOMShareable, IXpsOMShareable*, HRESULT)
    get_index : Proc(IXpsOMDictionary*, IXpsOMShareable, UInt32*, HRESULT)
    append : Proc(IXpsOMDictionary*, LibC::LPWSTR, IXpsOMShareable, HRESULT)
    insert_at : Proc(IXpsOMDictionary*, UInt32, LibC::LPWSTR, IXpsOMShareable, HRESULT)
    remove_at : Proc(IXpsOMDictionary*, UInt32, HRESULT)
    set_at : Proc(IXpsOMDictionary*, UInt32, LibC::LPWSTR, IXpsOMShareable, HRESULT)
    clone : Proc(IXpsOMDictionary*, IXpsOMDictionary*, HRESULT)
  end

  struct IXpsOMDictionary
    lpVtbl : IXpsOMDictionaryVTbl*
  end

  struct IXpsOMFontResourceVTbl
    query_interface : Proc(IXpsOMFontResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMFontResource*, UInt32)
    release : Proc(IXpsOMFontResource*, UInt32)
    get_part_name : Proc(IXpsOMFontResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMFontResource*, IOpcPartUri, HRESULT)
    get_stream : Proc(IXpsOMFontResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMFontResource*, IStream, XPS_FONT_EMBEDDING, IOpcPartUri, HRESULT)
    get_embedding_option : Proc(IXpsOMFontResource*, XPS_FONT_EMBEDDING*, HRESULT)
  end

  struct IXpsOMFontResource
    lpVtbl : IXpsOMFontResourceVTbl*
  end

  struct IXpsOMFontResourceCollectionVTbl
    query_interface : Proc(IXpsOMFontResourceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMFontResourceCollection*, UInt32)
    release : Proc(IXpsOMFontResourceCollection*, UInt32)
    get_count : Proc(IXpsOMFontResourceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMFontResourceCollection*, UInt32, IXpsOMFontResource*, HRESULT)
    set_at : Proc(IXpsOMFontResourceCollection*, UInt32, IXpsOMFontResource, HRESULT)
    insert_at : Proc(IXpsOMFontResourceCollection*, UInt32, IXpsOMFontResource, HRESULT)
    append : Proc(IXpsOMFontResourceCollection*, IXpsOMFontResource, HRESULT)
    remove_at : Proc(IXpsOMFontResourceCollection*, UInt32, HRESULT)
    get_by_part_name : Proc(IXpsOMFontResourceCollection*, IOpcPartUri, IXpsOMFontResource*, HRESULT)
  end

  struct IXpsOMFontResourceCollection
    lpVtbl : IXpsOMFontResourceCollectionVTbl*
  end

  struct IXpsOMImageResourceVTbl
    query_interface : Proc(IXpsOMImageResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMImageResource*, UInt32)
    release : Proc(IXpsOMImageResource*, UInt32)
    get_part_name : Proc(IXpsOMImageResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMImageResource*, IOpcPartUri, HRESULT)
    get_stream : Proc(IXpsOMImageResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMImageResource*, IStream, XPS_IMAGE_TYPE, IOpcPartUri, HRESULT)
    get_image_type : Proc(IXpsOMImageResource*, XPS_IMAGE_TYPE*, HRESULT)
  end

  struct IXpsOMImageResource
    lpVtbl : IXpsOMImageResourceVTbl*
  end

  struct IXpsOMImageResourceCollectionVTbl
    query_interface : Proc(IXpsOMImageResourceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMImageResourceCollection*, UInt32)
    release : Proc(IXpsOMImageResourceCollection*, UInt32)
    get_count : Proc(IXpsOMImageResourceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMImageResourceCollection*, UInt32, IXpsOMImageResource*, HRESULT)
    insert_at : Proc(IXpsOMImageResourceCollection*, UInt32, IXpsOMImageResource, HRESULT)
    remove_at : Proc(IXpsOMImageResourceCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMImageResourceCollection*, UInt32, IXpsOMImageResource, HRESULT)
    append : Proc(IXpsOMImageResourceCollection*, IXpsOMImageResource, HRESULT)
    get_by_part_name : Proc(IXpsOMImageResourceCollection*, IOpcPartUri, IXpsOMImageResource*, HRESULT)
  end

  struct IXpsOMImageResourceCollection
    lpVtbl : IXpsOMImageResourceCollectionVTbl*
  end

  struct IXpsOMColorProfileResourceVTbl
    query_interface : Proc(IXpsOMColorProfileResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMColorProfileResource*, UInt32)
    release : Proc(IXpsOMColorProfileResource*, UInt32)
    get_part_name : Proc(IXpsOMColorProfileResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMColorProfileResource*, IOpcPartUri, HRESULT)
    get_stream : Proc(IXpsOMColorProfileResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMColorProfileResource*, IStream, IOpcPartUri, HRESULT)
  end

  struct IXpsOMColorProfileResource
    lpVtbl : IXpsOMColorProfileResourceVTbl*
  end

  struct IXpsOMColorProfileResourceCollectionVTbl
    query_interface : Proc(IXpsOMColorProfileResourceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMColorProfileResourceCollection*, UInt32)
    release : Proc(IXpsOMColorProfileResourceCollection*, UInt32)
    get_count : Proc(IXpsOMColorProfileResourceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, IXpsOMColorProfileResource*, HRESULT)
    insert_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, IXpsOMColorProfileResource, HRESULT)
    remove_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMColorProfileResourceCollection*, UInt32, IXpsOMColorProfileResource, HRESULT)
    append : Proc(IXpsOMColorProfileResourceCollection*, IXpsOMColorProfileResource, HRESULT)
    get_by_part_name : Proc(IXpsOMColorProfileResourceCollection*, IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)
  end

  struct IXpsOMColorProfileResourceCollection
    lpVtbl : IXpsOMColorProfileResourceCollectionVTbl*
  end

  struct IXpsOMPrintTicketResourceVTbl
    query_interface : Proc(IXpsOMPrintTicketResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPrintTicketResource*, UInt32)
    release : Proc(IXpsOMPrintTicketResource*, UInt32)
    get_part_name : Proc(IXpsOMPrintTicketResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMPrintTicketResource*, IOpcPartUri, HRESULT)
    get_stream : Proc(IXpsOMPrintTicketResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMPrintTicketResource*, IStream, IOpcPartUri, HRESULT)
  end

  struct IXpsOMPrintTicketResource
    lpVtbl : IXpsOMPrintTicketResourceVTbl*
  end

  struct IXpsOMRemoteDictionaryResourceVTbl
    query_interface : Proc(IXpsOMRemoteDictionaryResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMRemoteDictionaryResource*, UInt32)
    release : Proc(IXpsOMRemoteDictionaryResource*, UInt32)
    get_part_name : Proc(IXpsOMRemoteDictionaryResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMRemoteDictionaryResource*, IOpcPartUri, HRESULT)
    get_dictionary : Proc(IXpsOMRemoteDictionaryResource*, IXpsOMDictionary*, HRESULT)
    set_dictionary : Proc(IXpsOMRemoteDictionaryResource*, IXpsOMDictionary, HRESULT)
  end

  struct IXpsOMRemoteDictionaryResource
    lpVtbl : IXpsOMRemoteDictionaryResourceVTbl*
  end

  struct IXpsOMRemoteDictionaryResourceCollectionVTbl
    query_interface : Proc(IXpsOMRemoteDictionaryResourceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32)
    release : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32)
    get_count : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, IXpsOMRemoteDictionaryResource*, HRESULT)
    insert_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, IXpsOMRemoteDictionaryResource, HRESULT)
    remove_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMRemoteDictionaryResourceCollection*, UInt32, IXpsOMRemoteDictionaryResource, HRESULT)
    append : Proc(IXpsOMRemoteDictionaryResourceCollection*, IXpsOMRemoteDictionaryResource, HRESULT)
    get_by_part_name : Proc(IXpsOMRemoteDictionaryResourceCollection*, IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)
  end

  struct IXpsOMRemoteDictionaryResourceCollection
    lpVtbl : IXpsOMRemoteDictionaryResourceCollectionVTbl*
  end

  struct IXpsOMSignatureBlockResourceCollectionVTbl
    query_interface : Proc(IXpsOMSignatureBlockResourceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32)
    release : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32)
    get_count : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, IXpsOMSignatureBlockResource*, HRESULT)
    insert_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, IXpsOMSignatureBlockResource, HRESULT)
    remove_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMSignatureBlockResourceCollection*, UInt32, IXpsOMSignatureBlockResource, HRESULT)
    append : Proc(IXpsOMSignatureBlockResourceCollection*, IXpsOMSignatureBlockResource, HRESULT)
    get_by_part_name : Proc(IXpsOMSignatureBlockResourceCollection*, IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)
  end

  struct IXpsOMSignatureBlockResourceCollection
    lpVtbl : IXpsOMSignatureBlockResourceCollectionVTbl*
  end

  struct IXpsOMDocumentStructureResourceVTbl
    query_interface : Proc(IXpsOMDocumentStructureResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDocumentStructureResource*, UInt32)
    release : Proc(IXpsOMDocumentStructureResource*, UInt32)
    get_part_name : Proc(IXpsOMDocumentStructureResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMDocumentStructureResource*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMDocumentStructureResource*, IXpsOMDocument*, HRESULT)
    get_stream : Proc(IXpsOMDocumentStructureResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMDocumentStructureResource*, IStream, IOpcPartUri, HRESULT)
  end

  struct IXpsOMDocumentStructureResource
    lpVtbl : IXpsOMDocumentStructureResourceVTbl*
  end

  struct IXpsOMStoryFragmentsResourceVTbl
    query_interface : Proc(IXpsOMStoryFragmentsResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMStoryFragmentsResource*, UInt32)
    release : Proc(IXpsOMStoryFragmentsResource*, UInt32)
    get_part_name : Proc(IXpsOMStoryFragmentsResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMStoryFragmentsResource*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMStoryFragmentsResource*, IXpsOMPageReference*, HRESULT)
    get_stream : Proc(IXpsOMStoryFragmentsResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMStoryFragmentsResource*, IStream, IOpcPartUri, HRESULT)
  end

  struct IXpsOMStoryFragmentsResource
    lpVtbl : IXpsOMStoryFragmentsResourceVTbl*
  end

  struct IXpsOMSignatureBlockResourceVTbl
    query_interface : Proc(IXpsOMSignatureBlockResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMSignatureBlockResource*, UInt32)
    release : Proc(IXpsOMSignatureBlockResource*, UInt32)
    get_part_name : Proc(IXpsOMSignatureBlockResource*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMSignatureBlockResource*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMSignatureBlockResource*, IXpsOMDocument*, HRESULT)
    get_stream : Proc(IXpsOMSignatureBlockResource*, IStream*, HRESULT)
    set_content : Proc(IXpsOMSignatureBlockResource*, IStream, IOpcPartUri, HRESULT)
  end

  struct IXpsOMSignatureBlockResource
    lpVtbl : IXpsOMSignatureBlockResourceVTbl*
  end

  struct IXpsOMVisualCollectionVTbl
    query_interface : Proc(IXpsOMVisualCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMVisualCollection*, UInt32)
    release : Proc(IXpsOMVisualCollection*, UInt32)
    get_count : Proc(IXpsOMVisualCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMVisualCollection*, UInt32, IXpsOMVisual*, HRESULT)
    insert_at : Proc(IXpsOMVisualCollection*, UInt32, IXpsOMVisual, HRESULT)
    remove_at : Proc(IXpsOMVisualCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMVisualCollection*, UInt32, IXpsOMVisual, HRESULT)
    append : Proc(IXpsOMVisualCollection*, IXpsOMVisual, HRESULT)
  end

  struct IXpsOMVisualCollection
    lpVtbl : IXpsOMVisualCollectionVTbl*
  end

  struct IXpsOMCanvasVTbl
    query_interface : Proc(IXpsOMCanvas*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMCanvas*, UInt32)
    release : Proc(IXpsOMCanvas*, UInt32)
    get_owner : Proc(IXpsOMCanvas*, IUnknown*, HRESULT)
    get_type : Proc(IXpsOMCanvas*, XPS_OBJECT_TYPE*, HRESULT)
    get_transform : Proc(IXpsOMCanvas*, IXpsOMMatrixTransform*, HRESULT)
    get_transform_local : Proc(IXpsOMCanvas*, IXpsOMMatrixTransform*, HRESULT)
    set_transform_local : Proc(IXpsOMCanvas*, IXpsOMMatrixTransform, HRESULT)
    get_transform_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_transform_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_clip_geometry : Proc(IXpsOMCanvas*, IXpsOMGeometry*, HRESULT)
    get_clip_geometry_local : Proc(IXpsOMCanvas*, IXpsOMGeometry*, HRESULT)
    set_clip_geometry_local : Proc(IXpsOMCanvas*, IXpsOMGeometry, HRESULT)
    get_clip_geometry_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_clip_geometry_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_opacity : Proc(IXpsOMCanvas*, Float32*, HRESULT)
    set_opacity : Proc(IXpsOMCanvas*, Float32, HRESULT)
    get_opacity_mask_brush : Proc(IXpsOMCanvas*, IXpsOMBrush*, HRESULT)
    get_opacity_mask_brush_local : Proc(IXpsOMCanvas*, IXpsOMBrush*, HRESULT)
    set_opacity_mask_brush_local : Proc(IXpsOMCanvas*, IXpsOMBrush, HRESULT)
    get_opacity_mask_brush_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_opacity_mask_brush_lookup : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMCanvas*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMCanvas*, LibC::BOOL, HRESULT)
    get_hyperlink_navigate_uri : Proc(IXpsOMCanvas*, IUri*, HRESULT)
    set_hyperlink_navigate_uri : Proc(IXpsOMCanvas*, IUri, HRESULT)
    get_language : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_visuals : Proc(IXpsOMCanvas*, IXpsOMVisualCollection*, HRESULT)
    get_use_aliased_edge_mode : Proc(IXpsOMCanvas*, LibC::BOOL*, HRESULT)
    set_use_aliased_edge_mode : Proc(IXpsOMCanvas*, LibC::BOOL, HRESULT)
    get_accessibility_short_description : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_accessibility_short_description : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_accessibility_long_description : Proc(IXpsOMCanvas*, LibC::LPWSTR*, HRESULT)
    set_accessibility_long_description : Proc(IXpsOMCanvas*, LibC::LPWSTR, HRESULT)
    get_dictionary : Proc(IXpsOMCanvas*, IXpsOMDictionary*, HRESULT)
    get_dictionary_local : Proc(IXpsOMCanvas*, IXpsOMDictionary*, HRESULT)
    set_dictionary_local : Proc(IXpsOMCanvas*, IXpsOMDictionary, HRESULT)
    get_dictionary_resource : Proc(IXpsOMCanvas*, IXpsOMRemoteDictionaryResource*, HRESULT)
    set_dictionary_resource : Proc(IXpsOMCanvas*, IXpsOMRemoteDictionaryResource, HRESULT)
    clone : Proc(IXpsOMCanvas*, IXpsOMCanvas*, HRESULT)
  end

  struct IXpsOMCanvas
    lpVtbl : IXpsOMCanvasVTbl*
  end

  struct IXpsOMPageVTbl
    query_interface : Proc(IXpsOMPage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPage*, UInt32)
    release : Proc(IXpsOMPage*, UInt32)
    get_part_name : Proc(IXpsOMPage*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMPage*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMPage*, IXpsOMPageReference*, HRESULT)
    get_visuals : Proc(IXpsOMPage*, IXpsOMVisualCollection*, HRESULT)
    get_page_dimensions : Proc(IXpsOMPage*, XPS_SIZE*, HRESULT)
    set_page_dimensions : Proc(IXpsOMPage*, XPS_SIZE*, HRESULT)
    get_content_box : Proc(IXpsOMPage*, XPS_RECT*, HRESULT)
    set_content_box : Proc(IXpsOMPage*, XPS_RECT*, HRESULT)
    get_bleed_box : Proc(IXpsOMPage*, XPS_RECT*, HRESULT)
    set_bleed_box : Proc(IXpsOMPage*, XPS_RECT*, HRESULT)
    get_language : Proc(IXpsOMPage*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMPage*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMPage*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMPage*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMPage*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMPage*, LibC::BOOL, HRESULT)
    get_dictionary : Proc(IXpsOMPage*, IXpsOMDictionary*, HRESULT)
    get_dictionary_local : Proc(IXpsOMPage*, IXpsOMDictionary*, HRESULT)
    set_dictionary_local : Proc(IXpsOMPage*, IXpsOMDictionary, HRESULT)
    get_dictionary_resource : Proc(IXpsOMPage*, IXpsOMRemoteDictionaryResource*, HRESULT)
    set_dictionary_resource : Proc(IXpsOMPage*, IXpsOMRemoteDictionaryResource, HRESULT)
    write : Proc(IXpsOMPage*, ISequentialStream, LibC::BOOL, HRESULT)
    generate_unused_lookup_key : Proc(IXpsOMPage*, XPS_OBJECT_TYPE, LibC::LPWSTR*, HRESULT)
    clone : Proc(IXpsOMPage*, IXpsOMPage*, HRESULT)
  end

  struct IXpsOMPage
    lpVtbl : IXpsOMPageVTbl*
  end

  struct IXpsOMPageReferenceVTbl
    query_interface : Proc(IXpsOMPageReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPageReference*, UInt32)
    release : Proc(IXpsOMPageReference*, UInt32)
    get_owner : Proc(IXpsOMPageReference*, IXpsOMDocument*, HRESULT)
    get_page : Proc(IXpsOMPageReference*, IXpsOMPage*, HRESULT)
    set_page : Proc(IXpsOMPageReference*, IXpsOMPage, HRESULT)
    discard_page : Proc(IXpsOMPageReference*, HRESULT)
    is_page_loaded : Proc(IXpsOMPageReference*, LibC::BOOL*, HRESULT)
    get_advisory_page_dimensions : Proc(IXpsOMPageReference*, XPS_SIZE*, HRESULT)
    set_advisory_page_dimensions : Proc(IXpsOMPageReference*, XPS_SIZE*, HRESULT)
    get_story_fragments_resource : Proc(IXpsOMPageReference*, IXpsOMStoryFragmentsResource*, HRESULT)
    set_story_fragments_resource : Proc(IXpsOMPageReference*, IXpsOMStoryFragmentsResource, HRESULT)
    get_print_ticket_resource : Proc(IXpsOMPageReference*, IXpsOMPrintTicketResource*, HRESULT)
    set_print_ticket_resource : Proc(IXpsOMPageReference*, IXpsOMPrintTicketResource, HRESULT)
    get_thumbnail_resource : Proc(IXpsOMPageReference*, IXpsOMImageResource*, HRESULT)
    set_thumbnail_resource : Proc(IXpsOMPageReference*, IXpsOMImageResource, HRESULT)
    collect_link_targets : Proc(IXpsOMPageReference*, IXpsOMNameCollection*, HRESULT)
    collect_part_resources : Proc(IXpsOMPageReference*, IXpsOMPartResources*, HRESULT)
    has_restricted_fonts : Proc(IXpsOMPageReference*, LibC::BOOL*, HRESULT)
    clone : Proc(IXpsOMPageReference*, IXpsOMPageReference*, HRESULT)
  end

  struct IXpsOMPageReference
    lpVtbl : IXpsOMPageReferenceVTbl*
  end

  struct IXpsOMPageReferenceCollectionVTbl
    query_interface : Proc(IXpsOMPageReferenceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPageReferenceCollection*, UInt32)
    release : Proc(IXpsOMPageReferenceCollection*, UInt32)
    get_count : Proc(IXpsOMPageReferenceCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMPageReferenceCollection*, UInt32, IXpsOMPageReference*, HRESULT)
    insert_at : Proc(IXpsOMPageReferenceCollection*, UInt32, IXpsOMPageReference, HRESULT)
    remove_at : Proc(IXpsOMPageReferenceCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMPageReferenceCollection*, UInt32, IXpsOMPageReference, HRESULT)
    append : Proc(IXpsOMPageReferenceCollection*, IXpsOMPageReference, HRESULT)
  end

  struct IXpsOMPageReferenceCollection
    lpVtbl : IXpsOMPageReferenceCollectionVTbl*
  end

  struct IXpsOMDocumentVTbl
    query_interface : Proc(IXpsOMDocument*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDocument*, UInt32)
    release : Proc(IXpsOMDocument*, UInt32)
    get_part_name : Proc(IXpsOMDocument*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMDocument*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMDocument*, IXpsOMDocumentSequence*, HRESULT)
    get_page_references : Proc(IXpsOMDocument*, IXpsOMPageReferenceCollection*, HRESULT)
    get_print_ticket_resource : Proc(IXpsOMDocument*, IXpsOMPrintTicketResource*, HRESULT)
    set_print_ticket_resource : Proc(IXpsOMDocument*, IXpsOMPrintTicketResource, HRESULT)
    get_document_structure_resource : Proc(IXpsOMDocument*, IXpsOMDocumentStructureResource*, HRESULT)
    set_document_structure_resource : Proc(IXpsOMDocument*, IXpsOMDocumentStructureResource, HRESULT)
    get_signature_block_resources : Proc(IXpsOMDocument*, IXpsOMSignatureBlockResourceCollection*, HRESULT)
    clone : Proc(IXpsOMDocument*, IXpsOMDocument*, HRESULT)
  end

  struct IXpsOMDocument
    lpVtbl : IXpsOMDocumentVTbl*
  end

  struct IXpsOMDocumentCollectionVTbl
    query_interface : Proc(IXpsOMDocumentCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDocumentCollection*, UInt32)
    release : Proc(IXpsOMDocumentCollection*, UInt32)
    get_count : Proc(IXpsOMDocumentCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMDocumentCollection*, UInt32, IXpsOMDocument*, HRESULT)
    insert_at : Proc(IXpsOMDocumentCollection*, UInt32, IXpsOMDocument, HRESULT)
    remove_at : Proc(IXpsOMDocumentCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMDocumentCollection*, UInt32, IXpsOMDocument, HRESULT)
    append : Proc(IXpsOMDocumentCollection*, IXpsOMDocument, HRESULT)
  end

  struct IXpsOMDocumentCollection
    lpVtbl : IXpsOMDocumentCollectionVTbl*
  end

  struct IXpsOMDocumentSequenceVTbl
    query_interface : Proc(IXpsOMDocumentSequence*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMDocumentSequence*, UInt32)
    release : Proc(IXpsOMDocumentSequence*, UInt32)
    get_part_name : Proc(IXpsOMDocumentSequence*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMDocumentSequence*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMDocumentSequence*, IXpsOMPackage*, HRESULT)
    get_documents : Proc(IXpsOMDocumentSequence*, IXpsOMDocumentCollection*, HRESULT)
    get_print_ticket_resource : Proc(IXpsOMDocumentSequence*, IXpsOMPrintTicketResource*, HRESULT)
    set_print_ticket_resource : Proc(IXpsOMDocumentSequence*, IXpsOMPrintTicketResource, HRESULT)
  end

  struct IXpsOMDocumentSequence
    lpVtbl : IXpsOMDocumentSequenceVTbl*
  end

  struct IXpsOMCorePropertiesVTbl
    query_interface : Proc(IXpsOMCoreProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMCoreProperties*, UInt32)
    release : Proc(IXpsOMCoreProperties*, UInt32)
    get_part_name : Proc(IXpsOMCoreProperties*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMCoreProperties*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMCoreProperties*, IXpsOMPackage*, HRESULT)
    get_category : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_category : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_content_status : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_content_status : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_content_type : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_content_type : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_created : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    set_created : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    get_creator : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_creator : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_description : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_identifier : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_identifier : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_keywords : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_keywords : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_language : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_last_modified_by : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_last_modified_by : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_last_printed : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    set_last_printed : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    get_modified : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    set_modified : Proc(IXpsOMCoreProperties*, SYSTEMTIME*, HRESULT)
    get_revision : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_revision : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_subject : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_subject : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_title : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_title : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    get_version : Proc(IXpsOMCoreProperties*, LibC::LPWSTR*, HRESULT)
    set_version : Proc(IXpsOMCoreProperties*, LibC::LPWSTR, HRESULT)
    clone : Proc(IXpsOMCoreProperties*, IXpsOMCoreProperties*, HRESULT)
  end

  struct IXpsOMCoreProperties
    lpVtbl : IXpsOMCorePropertiesVTbl*
  end

  struct IXpsOMPackageVTbl
    query_interface : Proc(IXpsOMPackage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPackage*, UInt32)
    release : Proc(IXpsOMPackage*, UInt32)
    get_document_sequence : Proc(IXpsOMPackage*, IXpsOMDocumentSequence*, HRESULT)
    set_document_sequence : Proc(IXpsOMPackage*, IXpsOMDocumentSequence, HRESULT)
    get_core_properties : Proc(IXpsOMPackage*, IXpsOMCoreProperties*, HRESULT)
    set_core_properties : Proc(IXpsOMPackage*, IXpsOMCoreProperties, HRESULT)
    get_discard_control_part_name : Proc(IXpsOMPackage*, IOpcPartUri*, HRESULT)
    set_discard_control_part_name : Proc(IXpsOMPackage*, IOpcPartUri, HRESULT)
    get_thumbnail_resource : Proc(IXpsOMPackage*, IXpsOMImageResource*, HRESULT)
    set_thumbnail_resource : Proc(IXpsOMPackage*, IXpsOMImageResource, HRESULT)
    write_to_file : Proc(IXpsOMPackage*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, HRESULT)
    write_to_stream : Proc(IXpsOMPackage*, ISequentialStream, LibC::BOOL, HRESULT)
  end

  struct IXpsOMPackage
    lpVtbl : IXpsOMPackageVTbl*
  end

  struct IXpsOMObjectFactoryVTbl
    query_interface : Proc(IXpsOMObjectFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMObjectFactory*, UInt32)
    release : Proc(IXpsOMObjectFactory*, UInt32)
    create_package : Proc(IXpsOMObjectFactory*, IXpsOMPackage*, HRESULT)
    create_package_from_file : Proc(IXpsOMObjectFactory*, LibC::LPWSTR, LibC::BOOL, IXpsOMPackage*, HRESULT)
    create_package_from_stream : Proc(IXpsOMObjectFactory*, IStream, LibC::BOOL, IXpsOMPackage*, HRESULT)
    create_story_fragments_resource : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMStoryFragmentsResource*, HRESULT)
    create_document_structure_resource : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMDocumentStructureResource*, HRESULT)
    create_signature_block_resource : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)
    create_remote_dictionary_resource : Proc(IXpsOMObjectFactory*, IXpsOMDictionary, IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)
    create_remote_dictionary_resource_from_stream : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)
    create_part_resources : Proc(IXpsOMObjectFactory*, IXpsOMPartResources*, HRESULT)
    create_document_sequence : Proc(IXpsOMObjectFactory*, IOpcPartUri, IXpsOMDocumentSequence*, HRESULT)
    create_document : Proc(IXpsOMObjectFactory*, IOpcPartUri, IXpsOMDocument*, HRESULT)
    create_page_reference : Proc(IXpsOMObjectFactory*, XPS_SIZE*, IXpsOMPageReference*, HRESULT)
    create_page : Proc(IXpsOMObjectFactory*, XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage*, HRESULT)
    create_page_from_stream : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage*, HRESULT)
    create_canvas : Proc(IXpsOMObjectFactory*, IXpsOMCanvas*, HRESULT)
    create_glyphs : Proc(IXpsOMObjectFactory*, IXpsOMFontResource, IXpsOMGlyphs*, HRESULT)
    create_path : Proc(IXpsOMObjectFactory*, IXpsOMPath*, HRESULT)
    create_geometry : Proc(IXpsOMObjectFactory*, IXpsOMGeometry*, HRESULT)
    create_geometry_figure : Proc(IXpsOMObjectFactory*, XPS_POINT*, IXpsOMGeometryFigure*, HRESULT)
    create_matrix_transform : Proc(IXpsOMObjectFactory*, XPS_MATRIX*, IXpsOMMatrixTransform*, HRESULT)
    create_solid_color_brush : Proc(IXpsOMObjectFactory*, XPS_COLOR*, IXpsOMColorProfileResource, IXpsOMSolidColorBrush*, HRESULT)
    create_color_profile_resource : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)
    create_image_brush : Proc(IXpsOMObjectFactory*, IXpsOMImageResource, XPS_RECT*, XPS_RECT*, IXpsOMImageBrush*, HRESULT)
    create_visual_brush : Proc(IXpsOMObjectFactory*, XPS_RECT*, XPS_RECT*, IXpsOMVisualBrush*, HRESULT)
    create_image_resource : Proc(IXpsOMObjectFactory*, IStream, XPS_IMAGE_TYPE, IOpcPartUri, IXpsOMImageResource*, HRESULT)
    create_print_ticket_resource : Proc(IXpsOMObjectFactory*, IStream, IOpcPartUri, IXpsOMPrintTicketResource*, HRESULT)
    create_font_resource : Proc(IXpsOMObjectFactory*, IStream, XPS_FONT_EMBEDDING, IOpcPartUri, LibC::BOOL, IXpsOMFontResource*, HRESULT)
    create_gradient_stop : Proc(IXpsOMObjectFactory*, XPS_COLOR*, IXpsOMColorProfileResource, Float32, IXpsOMGradientStop*, HRESULT)
    create_linear_gradient_brush : Proc(IXpsOMObjectFactory*, IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, IXpsOMLinearGradientBrush*, HRESULT)
    create_radial_gradient_brush : Proc(IXpsOMObjectFactory*, IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, XPS_SIZE*, IXpsOMRadialGradientBrush*, HRESULT)
    create_core_properties : Proc(IXpsOMObjectFactory*, IOpcPartUri, IXpsOMCoreProperties*, HRESULT)
    create_dictionary : Proc(IXpsOMObjectFactory*, IXpsOMDictionary*, HRESULT)
    create_part_uri_collection : Proc(IXpsOMObjectFactory*, IXpsOMPartUriCollection*, HRESULT)
    create_package_writer_on_file : Proc(IXpsOMObjectFactory*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
    create_package_writer_on_stream : Proc(IXpsOMObjectFactory*, ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
    create_part_uri : Proc(IXpsOMObjectFactory*, LibC::LPWSTR, IOpcPartUri*, HRESULT)
    create_read_only_stream_on_file : Proc(IXpsOMObjectFactory*, LibC::LPWSTR, IStream*, HRESULT)
  end

  struct IXpsOMObjectFactory
    lpVtbl : IXpsOMObjectFactoryVTbl*
  end

  struct IXpsOMNameCollectionVTbl
    query_interface : Proc(IXpsOMNameCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMNameCollection*, UInt32)
    release : Proc(IXpsOMNameCollection*, UInt32)
    get_count : Proc(IXpsOMNameCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMNameCollection*, UInt32, LibC::LPWSTR*, HRESULT)
  end

  struct IXpsOMNameCollection
    lpVtbl : IXpsOMNameCollectionVTbl*
  end

  struct IXpsOMPartUriCollectionVTbl
    query_interface : Proc(IXpsOMPartUriCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPartUriCollection*, UInt32)
    release : Proc(IXpsOMPartUriCollection*, UInt32)
    get_count : Proc(IXpsOMPartUriCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsOMPartUriCollection*, UInt32, IOpcPartUri*, HRESULT)
    insert_at : Proc(IXpsOMPartUriCollection*, UInt32, IOpcPartUri, HRESULT)
    remove_at : Proc(IXpsOMPartUriCollection*, UInt32, HRESULT)
    set_at : Proc(IXpsOMPartUriCollection*, UInt32, IOpcPartUri, HRESULT)
    append : Proc(IXpsOMPartUriCollection*, IOpcPartUri, HRESULT)
  end

  struct IXpsOMPartUriCollection
    lpVtbl : IXpsOMPartUriCollectionVTbl*
  end

  struct IXpsOMPackageWriterVTbl
    query_interface : Proc(IXpsOMPackageWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPackageWriter*, UInt32)
    release : Proc(IXpsOMPackageWriter*, UInt32)
    start_new_document : Proc(IXpsOMPackageWriter*, IOpcPartUri, IXpsOMPrintTicketResource, IXpsOMDocumentStructureResource, IXpsOMSignatureBlockResourceCollection, IXpsOMPartUriCollection, HRESULT)
    add_page : Proc(IXpsOMPackageWriter*, IXpsOMPage, XPS_SIZE*, IXpsOMPartUriCollection, IXpsOMStoryFragmentsResource, IXpsOMPrintTicketResource, IXpsOMImageResource, HRESULT)
    add_resource : Proc(IXpsOMPackageWriter*, IXpsOMResource, HRESULT)
    close : Proc(IXpsOMPackageWriter*, HRESULT)
    is_closed : Proc(IXpsOMPackageWriter*, LibC::BOOL*, HRESULT)
  end

  struct IXpsOMPackageWriter
    lpVtbl : IXpsOMPackageWriterVTbl*
  end

  struct IXpsOMPackageTargetVTbl
    query_interface : Proc(IXpsOMPackageTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPackageTarget*, UInt32)
    release : Proc(IXpsOMPackageTarget*, UInt32)
    create_xps_om_package_writer : Proc(IXpsOMPackageTarget*, IOpcPartUri, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
  end

  struct IXpsOMPackageTarget
    lpVtbl : IXpsOMPackageTargetVTbl*
  end

  struct IXpsOMThumbnailGeneratorVTbl
    query_interface : Proc(IXpsOMThumbnailGenerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMThumbnailGenerator*, UInt32)
    release : Proc(IXpsOMThumbnailGenerator*, UInt32)
    generate_thumbnail : Proc(IXpsOMThumbnailGenerator*, IXpsOMPage, XPS_IMAGE_TYPE, XPS_THUMBNAIL_SIZE, IOpcPartUri, IXpsOMImageResource*, HRESULT)
  end

  struct IXpsOMThumbnailGenerator
    lpVtbl : IXpsOMThumbnailGeneratorVTbl*
  end

  struct IXpsOMObjectFactory1VTbl
    query_interface : Proc(IXpsOMObjectFactory1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMObjectFactory1*, UInt32)
    release : Proc(IXpsOMObjectFactory1*, UInt32)
    create_package : Proc(IXpsOMObjectFactory1*, IXpsOMPackage*, HRESULT)
    create_package_from_file : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, LibC::BOOL, IXpsOMPackage*, HRESULT)
    create_package_from_stream : Proc(IXpsOMObjectFactory1*, IStream, LibC::BOOL, IXpsOMPackage*, HRESULT)
    create_story_fragments_resource : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMStoryFragmentsResource*, HRESULT)
    create_document_structure_resource : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMDocumentStructureResource*, HRESULT)
    create_signature_block_resource : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)
    create_remote_dictionary_resource : Proc(IXpsOMObjectFactory1*, IXpsOMDictionary, IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)
    create_remote_dictionary_resource_from_stream : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)
    create_part_resources : Proc(IXpsOMObjectFactory1*, IXpsOMPartResources*, HRESULT)
    create_document_sequence : Proc(IXpsOMObjectFactory1*, IOpcPartUri, IXpsOMDocumentSequence*, HRESULT)
    create_document : Proc(IXpsOMObjectFactory1*, IOpcPartUri, IXpsOMDocument*, HRESULT)
    create_page_reference : Proc(IXpsOMObjectFactory1*, XPS_SIZE*, IXpsOMPageReference*, HRESULT)
    create_page : Proc(IXpsOMObjectFactory1*, XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage*, HRESULT)
    create_page_from_stream : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage*, HRESULT)
    create_canvas : Proc(IXpsOMObjectFactory1*, IXpsOMCanvas*, HRESULT)
    create_glyphs : Proc(IXpsOMObjectFactory1*, IXpsOMFontResource, IXpsOMGlyphs*, HRESULT)
    create_path : Proc(IXpsOMObjectFactory1*, IXpsOMPath*, HRESULT)
    create_geometry : Proc(IXpsOMObjectFactory1*, IXpsOMGeometry*, HRESULT)
    create_geometry_figure : Proc(IXpsOMObjectFactory1*, XPS_POINT*, IXpsOMGeometryFigure*, HRESULT)
    create_matrix_transform : Proc(IXpsOMObjectFactory1*, XPS_MATRIX*, IXpsOMMatrixTransform*, HRESULT)
    create_solid_color_brush : Proc(IXpsOMObjectFactory1*, XPS_COLOR*, IXpsOMColorProfileResource, IXpsOMSolidColorBrush*, HRESULT)
    create_color_profile_resource : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)
    create_image_brush : Proc(IXpsOMObjectFactory1*, IXpsOMImageResource, XPS_RECT*, XPS_RECT*, IXpsOMImageBrush*, HRESULT)
    create_visual_brush : Proc(IXpsOMObjectFactory1*, XPS_RECT*, XPS_RECT*, IXpsOMVisualBrush*, HRESULT)
    create_image_resource : Proc(IXpsOMObjectFactory1*, IStream, XPS_IMAGE_TYPE, IOpcPartUri, IXpsOMImageResource*, HRESULT)
    create_print_ticket_resource : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMPrintTicketResource*, HRESULT)
    create_font_resource : Proc(IXpsOMObjectFactory1*, IStream, XPS_FONT_EMBEDDING, IOpcPartUri, LibC::BOOL, IXpsOMFontResource*, HRESULT)
    create_gradient_stop : Proc(IXpsOMObjectFactory1*, XPS_COLOR*, IXpsOMColorProfileResource, Float32, IXpsOMGradientStop*, HRESULT)
    create_linear_gradient_brush : Proc(IXpsOMObjectFactory1*, IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, IXpsOMLinearGradientBrush*, HRESULT)
    create_radial_gradient_brush : Proc(IXpsOMObjectFactory1*, IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, XPS_SIZE*, IXpsOMRadialGradientBrush*, HRESULT)
    create_core_properties : Proc(IXpsOMObjectFactory1*, IOpcPartUri, IXpsOMCoreProperties*, HRESULT)
    create_dictionary : Proc(IXpsOMObjectFactory1*, IXpsOMDictionary*, HRESULT)
    create_part_uri_collection : Proc(IXpsOMObjectFactory1*, IXpsOMPartUriCollection*, HRESULT)
    create_package_writer_on_file : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
    create_package_writer_on_stream : Proc(IXpsOMObjectFactory1*, ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
    create_part_uri : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, IOpcPartUri*, HRESULT)
    create_read_only_stream_on_file : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, IStream*, HRESULT)
    get_document_type_from_file : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, XPS_DOCUMENT_TYPE*, HRESULT)
    get_document_type_from_stream : Proc(IXpsOMObjectFactory1*, IStream, XPS_DOCUMENT_TYPE*, HRESULT)
    convert_hd_photo_to_jpeg_xr : Proc(IXpsOMObjectFactory1*, IXpsOMImageResource, HRESULT)
    convert_jpeg_xr_to_hd_photo : Proc(IXpsOMObjectFactory1*, IXpsOMImageResource, HRESULT)
    create_package_writer_on_file1 : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*, HRESULT)
    create_package_writer_on_stream1 : Proc(IXpsOMObjectFactory1*, ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*, HRESULT)
    create_package1 : Proc(IXpsOMObjectFactory1*, IXpsOMPackage1*, HRESULT)
    create_package_from_stream1 : Proc(IXpsOMObjectFactory1*, IStream, LibC::BOOL, IXpsOMPackage1*, HRESULT)
    create_package_from_file1 : Proc(IXpsOMObjectFactory1*, LibC::LPWSTR, LibC::BOOL, IXpsOMPackage1*, HRESULT)
    create_page1 : Proc(IXpsOMObjectFactory1*, XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage1*, HRESULT)
    create_page_from_stream1 : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage1*, HRESULT)
    create_remote_dictionary_resource_from_stream1 : Proc(IXpsOMObjectFactory1*, IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)
  end

  struct IXpsOMObjectFactory1
    lpVtbl : IXpsOMObjectFactory1VTbl*
  end

  struct IXpsOMPackage1VTbl
    query_interface : Proc(IXpsOMPackage1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPackage1*, UInt32)
    release : Proc(IXpsOMPackage1*, UInt32)
    get_document_sequence : Proc(IXpsOMPackage1*, IXpsOMDocumentSequence*, HRESULT)
    set_document_sequence : Proc(IXpsOMPackage1*, IXpsOMDocumentSequence, HRESULT)
    get_core_properties : Proc(IXpsOMPackage1*, IXpsOMCoreProperties*, HRESULT)
    set_core_properties : Proc(IXpsOMPackage1*, IXpsOMCoreProperties, HRESULT)
    get_discard_control_part_name : Proc(IXpsOMPackage1*, IOpcPartUri*, HRESULT)
    set_discard_control_part_name : Proc(IXpsOMPackage1*, IOpcPartUri, HRESULT)
    get_thumbnail_resource : Proc(IXpsOMPackage1*, IXpsOMImageResource*, HRESULT)
    set_thumbnail_resource : Proc(IXpsOMPackage1*, IXpsOMImageResource, HRESULT)
    write_to_file : Proc(IXpsOMPackage1*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, HRESULT)
    write_to_stream : Proc(IXpsOMPackage1*, ISequentialStream, LibC::BOOL, HRESULT)
    get_document_type : Proc(IXpsOMPackage1*, XPS_DOCUMENT_TYPE*, HRESULT)
    write_to_file1 : Proc(IXpsOMPackage1*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)
    write_to_stream1 : Proc(IXpsOMPackage1*, ISequentialStream, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)
  end

  struct IXpsOMPackage1
    lpVtbl : IXpsOMPackage1VTbl*
  end

  struct IXpsOMPage1VTbl
    query_interface : Proc(IXpsOMPage1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPage1*, UInt32)
    release : Proc(IXpsOMPage1*, UInt32)
    get_part_name : Proc(IXpsOMPage1*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMPage1*, IOpcPartUri, HRESULT)
    get_owner : Proc(IXpsOMPage1*, IXpsOMPageReference*, HRESULT)
    get_visuals : Proc(IXpsOMPage1*, IXpsOMVisualCollection*, HRESULT)
    get_page_dimensions : Proc(IXpsOMPage1*, XPS_SIZE*, HRESULT)
    set_page_dimensions : Proc(IXpsOMPage1*, XPS_SIZE*, HRESULT)
    get_content_box : Proc(IXpsOMPage1*, XPS_RECT*, HRESULT)
    set_content_box : Proc(IXpsOMPage1*, XPS_RECT*, HRESULT)
    get_bleed_box : Proc(IXpsOMPage1*, XPS_RECT*, HRESULT)
    set_bleed_box : Proc(IXpsOMPage1*, XPS_RECT*, HRESULT)
    get_language : Proc(IXpsOMPage1*, LibC::LPWSTR*, HRESULT)
    set_language : Proc(IXpsOMPage1*, LibC::LPWSTR, HRESULT)
    get_name : Proc(IXpsOMPage1*, LibC::LPWSTR*, HRESULT)
    set_name : Proc(IXpsOMPage1*, LibC::LPWSTR, HRESULT)
    get_is_hyperlink_target : Proc(IXpsOMPage1*, LibC::BOOL*, HRESULT)
    set_is_hyperlink_target : Proc(IXpsOMPage1*, LibC::BOOL, HRESULT)
    get_dictionary : Proc(IXpsOMPage1*, IXpsOMDictionary*, HRESULT)
    get_dictionary_local : Proc(IXpsOMPage1*, IXpsOMDictionary*, HRESULT)
    set_dictionary_local : Proc(IXpsOMPage1*, IXpsOMDictionary, HRESULT)
    get_dictionary_resource : Proc(IXpsOMPage1*, IXpsOMRemoteDictionaryResource*, HRESULT)
    set_dictionary_resource : Proc(IXpsOMPage1*, IXpsOMRemoteDictionaryResource, HRESULT)
    write : Proc(IXpsOMPage1*, ISequentialStream, LibC::BOOL, HRESULT)
    generate_unused_lookup_key : Proc(IXpsOMPage1*, XPS_OBJECT_TYPE, LibC::LPWSTR*, HRESULT)
    clone : Proc(IXpsOMPage1*, IXpsOMPage*, HRESULT)
    get_document_type : Proc(IXpsOMPage1*, XPS_DOCUMENT_TYPE*, HRESULT)
    write1 : Proc(IXpsOMPage1*, ISequentialStream, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)
  end

  struct IXpsOMPage1
    lpVtbl : IXpsOMPage1VTbl*
  end

  struct IXpsDocumentPackageTargetVTbl
    query_interface : Proc(IXpsDocumentPackageTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsDocumentPackageTarget*, UInt32)
    release : Proc(IXpsDocumentPackageTarget*, UInt32)
    get_xps_om_package_writer : Proc(IXpsDocumentPackageTarget*, IOpcPartUri, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)
    get_xps_om_factory : Proc(IXpsDocumentPackageTarget*, IXpsOMObjectFactory*, HRESULT)
    get_xps_type : Proc(IXpsDocumentPackageTarget*, XPS_DOCUMENT_TYPE*, HRESULT)
  end

  struct IXpsDocumentPackageTarget
    lpVtbl : IXpsDocumentPackageTargetVTbl*
  end

  struct IXpsOMRemoteDictionaryResource1VTbl
    query_interface : Proc(IXpsOMRemoteDictionaryResource1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMRemoteDictionaryResource1*, UInt32)
    release : Proc(IXpsOMRemoteDictionaryResource1*, UInt32)
    get_part_name : Proc(IXpsOMRemoteDictionaryResource1*, IOpcPartUri*, HRESULT)
    set_part_name : Proc(IXpsOMRemoteDictionaryResource1*, IOpcPartUri, HRESULT)
    get_dictionary : Proc(IXpsOMRemoteDictionaryResource1*, IXpsOMDictionary*, HRESULT)
    set_dictionary : Proc(IXpsOMRemoteDictionaryResource1*, IXpsOMDictionary, HRESULT)
    get_document_type : Proc(IXpsOMRemoteDictionaryResource1*, XPS_DOCUMENT_TYPE*, HRESULT)
    write1 : Proc(IXpsOMRemoteDictionaryResource1*, ISequentialStream, XPS_DOCUMENT_TYPE, HRESULT)
  end

  struct IXpsOMRemoteDictionaryResource1
    lpVtbl : IXpsOMRemoteDictionaryResource1VTbl*
  end

  struct IXpsOMPackageWriter3DVTbl
    query_interface : Proc(IXpsOMPackageWriter3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsOMPackageWriter3D*, UInt32)
    release : Proc(IXpsOMPackageWriter3D*, UInt32)
    start_new_document : Proc(IXpsOMPackageWriter3D*, IOpcPartUri, IXpsOMPrintTicketResource, IXpsOMDocumentStructureResource, IXpsOMSignatureBlockResourceCollection, IXpsOMPartUriCollection, HRESULT)
    add_page : Proc(IXpsOMPackageWriter3D*, IXpsOMPage, XPS_SIZE*, IXpsOMPartUriCollection, IXpsOMStoryFragmentsResource, IXpsOMPrintTicketResource, IXpsOMImageResource, HRESULT)
    add_resource : Proc(IXpsOMPackageWriter3D*, IXpsOMResource, HRESULT)
    close : Proc(IXpsOMPackageWriter3D*, HRESULT)
    is_closed : Proc(IXpsOMPackageWriter3D*, LibC::BOOL*, HRESULT)
    add_model_texture : Proc(IXpsOMPackageWriter3D*, IOpcPartUri, IStream, HRESULT)
    set_model_print_ticket : Proc(IXpsOMPackageWriter3D*, IOpcPartUri, IStream, HRESULT)
  end

  struct IXpsOMPackageWriter3D
    lpVtbl : IXpsOMPackageWriter3DVTbl*
  end

  struct IXpsDocumentPackageTarget3DVTbl
    query_interface : Proc(IXpsDocumentPackageTarget3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsDocumentPackageTarget3D*, UInt32)
    release : Proc(IXpsDocumentPackageTarget3D*, UInt32)
    get_xps_om_package_writer3_d : Proc(IXpsDocumentPackageTarget3D*, IOpcPartUri, IOpcPartUri, IOpcPartUri, IStream, IXpsOMPackageWriter3D*, HRESULT)
    get_xps_om_factory : Proc(IXpsDocumentPackageTarget3D*, IXpsOMObjectFactory*, HRESULT)
  end

  struct IXpsDocumentPackageTarget3D
    lpVtbl : IXpsDocumentPackageTarget3DVTbl*
  end

  struct IXpsSigningOptionsVTbl
    query_interface : Proc(IXpsSigningOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSigningOptions*, UInt32)
    release : Proc(IXpsSigningOptions*, UInt32)
    get_signature_id : Proc(IXpsSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_signature_id : Proc(IXpsSigningOptions*, LibC::LPWSTR, HRESULT)
    get_signature_method : Proc(IXpsSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_signature_method : Proc(IXpsSigningOptions*, LibC::LPWSTR, HRESULT)
    get_digest_method : Proc(IXpsSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_digest_method : Proc(IXpsSigningOptions*, LibC::LPWSTR, HRESULT)
    get_signature_part_name : Proc(IXpsSigningOptions*, IOpcPartUri*, HRESULT)
    set_signature_part_name : Proc(IXpsSigningOptions*, IOpcPartUri, HRESULT)
    get_policy : Proc(IXpsSigningOptions*, XPS_SIGN_POLICY*, HRESULT)
    set_policy : Proc(IXpsSigningOptions*, XPS_SIGN_POLICY, HRESULT)
    get_signing_time_format : Proc(IXpsSigningOptions*, OPC_SIGNATURE_TIME_FORMAT*, HRESULT)
    set_signing_time_format : Proc(IXpsSigningOptions*, OPC_SIGNATURE_TIME_FORMAT, HRESULT)
    get_custom_objects : Proc(IXpsSigningOptions*, IOpcSignatureCustomObjectSet*, HRESULT)
    get_custom_references : Proc(IXpsSigningOptions*, IOpcSignatureReferenceSet*, HRESULT)
    get_certificate_set : Proc(IXpsSigningOptions*, IOpcCertificateSet*, HRESULT)
    get_flags : Proc(IXpsSigningOptions*, XPS_SIGN_FLAGS*, HRESULT)
    set_flags : Proc(IXpsSigningOptions*, XPS_SIGN_FLAGS, HRESULT)
  end

  struct IXpsSigningOptions
    lpVtbl : IXpsSigningOptionsVTbl*
  end

  struct IXpsSignatureCollectionVTbl
    query_interface : Proc(IXpsSignatureCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureCollection*, UInt32)
    release : Proc(IXpsSignatureCollection*, UInt32)
    get_count : Proc(IXpsSignatureCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsSignatureCollection*, UInt32, IXpsSignature*, HRESULT)
    remove_at : Proc(IXpsSignatureCollection*, UInt32, HRESULT)
  end

  struct IXpsSignatureCollection
    lpVtbl : IXpsSignatureCollectionVTbl*
  end

  struct IXpsSignatureVTbl
    query_interface : Proc(IXpsSignature*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignature*, UInt32)
    release : Proc(IXpsSignature*, UInt32)
    get_signature_id : Proc(IXpsSignature*, LibC::LPWSTR*, HRESULT)
    get_signature_value : Proc(IXpsSignature*, UInt8**, UInt32*, HRESULT)
    get_certificate_enumerator : Proc(IXpsSignature*, IOpcCertificateEnumerator*, HRESULT)
    get_signing_time : Proc(IXpsSignature*, LibC::LPWSTR*, HRESULT)
    get_signing_time_format : Proc(IXpsSignature*, OPC_SIGNATURE_TIME_FORMAT*, HRESULT)
    get_signature_part_name : Proc(IXpsSignature*, IOpcPartUri*, HRESULT)
    verify : Proc(IXpsSignature*, CERT_CONTEXT*, XPS_SIGNATURE_STATUS*, HRESULT)
    get_policy : Proc(IXpsSignature*, XPS_SIGN_POLICY*, HRESULT)
    get_custom_object_enumerator : Proc(IXpsSignature*, IOpcSignatureCustomObjectEnumerator*, HRESULT)
    get_custom_reference_enumerator : Proc(IXpsSignature*, IOpcSignatureReferenceEnumerator*, HRESULT)
    get_signature_xml : Proc(IXpsSignature*, UInt8**, UInt32*, HRESULT)
    set_signature_xml : Proc(IXpsSignature*, UInt8*, UInt32, HRESULT)
  end

  struct IXpsSignature
    lpVtbl : IXpsSignatureVTbl*
  end

  struct IXpsSignatureBlockCollectionVTbl
    query_interface : Proc(IXpsSignatureBlockCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureBlockCollection*, UInt32)
    release : Proc(IXpsSignatureBlockCollection*, UInt32)
    get_count : Proc(IXpsSignatureBlockCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsSignatureBlockCollection*, UInt32, IXpsSignatureBlock*, HRESULT)
    remove_at : Proc(IXpsSignatureBlockCollection*, UInt32, HRESULT)
  end

  struct IXpsSignatureBlockCollection
    lpVtbl : IXpsSignatureBlockCollectionVTbl*
  end

  struct IXpsSignatureBlockVTbl
    query_interface : Proc(IXpsSignatureBlock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureBlock*, UInt32)
    release : Proc(IXpsSignatureBlock*, UInt32)
    get_requests : Proc(IXpsSignatureBlock*, IXpsSignatureRequestCollection*, HRESULT)
    get_part_name : Proc(IXpsSignatureBlock*, IOpcPartUri*, HRESULT)
    get_document_index : Proc(IXpsSignatureBlock*, UInt32*, HRESULT)
    get_document_name : Proc(IXpsSignatureBlock*, IOpcPartUri*, HRESULT)
    create_request : Proc(IXpsSignatureBlock*, LibC::LPWSTR, IXpsSignatureRequest*, HRESULT)
  end

  struct IXpsSignatureBlock
    lpVtbl : IXpsSignatureBlockVTbl*
  end

  struct IXpsSignatureRequestCollectionVTbl
    query_interface : Proc(IXpsSignatureRequestCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureRequestCollection*, UInt32)
    release : Proc(IXpsSignatureRequestCollection*, UInt32)
    get_count : Proc(IXpsSignatureRequestCollection*, UInt32*, HRESULT)
    get_at : Proc(IXpsSignatureRequestCollection*, UInt32, IXpsSignatureRequest*, HRESULT)
    remove_at : Proc(IXpsSignatureRequestCollection*, UInt32, HRESULT)
  end

  struct IXpsSignatureRequestCollection
    lpVtbl : IXpsSignatureRequestCollectionVTbl*
  end

  struct IXpsSignatureRequestVTbl
    query_interface : Proc(IXpsSignatureRequest*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureRequest*, UInt32)
    release : Proc(IXpsSignatureRequest*, UInt32)
    get_intent : Proc(IXpsSignatureRequest*, LibC::LPWSTR*, HRESULT)
    set_intent : Proc(IXpsSignatureRequest*, LibC::LPWSTR, HRESULT)
    get_requested_signer : Proc(IXpsSignatureRequest*, LibC::LPWSTR*, HRESULT)
    set_requested_signer : Proc(IXpsSignatureRequest*, LibC::LPWSTR, HRESULT)
    get_request_sign_by_date : Proc(IXpsSignatureRequest*, LibC::LPWSTR*, HRESULT)
    set_request_sign_by_date : Proc(IXpsSignatureRequest*, LibC::LPWSTR, HRESULT)
    get_signing_locale : Proc(IXpsSignatureRequest*, LibC::LPWSTR*, HRESULT)
    set_signing_locale : Proc(IXpsSignatureRequest*, LibC::LPWSTR, HRESULT)
    get_spot_location : Proc(IXpsSignatureRequest*, Int32*, IOpcPartUri*, Float32*, Float32*, HRESULT)
    set_spot_location : Proc(IXpsSignatureRequest*, Int32, Float32, Float32, HRESULT)
    get_request_id : Proc(IXpsSignatureRequest*, LibC::LPWSTR*, HRESULT)
    get_signature : Proc(IXpsSignatureRequest*, IXpsSignature*, HRESULT)
  end

  struct IXpsSignatureRequest
    lpVtbl : IXpsSignatureRequestVTbl*
  end

  struct IXpsSignatureManagerVTbl
    query_interface : Proc(IXpsSignatureManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsSignatureManager*, UInt32)
    release : Proc(IXpsSignatureManager*, UInt32)
    load_package_file : Proc(IXpsSignatureManager*, LibC::LPWSTR, HRESULT)
    load_package_stream : Proc(IXpsSignatureManager*, IStream, HRESULT)
    sign : Proc(IXpsSignatureManager*, IXpsSigningOptions, CERT_CONTEXT*, IXpsSignature*, HRESULT)
    get_signature_origin_part_name : Proc(IXpsSignatureManager*, IOpcPartUri*, HRESULT)
    set_signature_origin_part_name : Proc(IXpsSignatureManager*, IOpcPartUri, HRESULT)
    get_signatures : Proc(IXpsSignatureManager*, IXpsSignatureCollection*, HRESULT)
    add_signature_block : Proc(IXpsSignatureManager*, IOpcPartUri, UInt32, IXpsSignatureBlock*, HRESULT)
    get_signature_blocks : Proc(IXpsSignatureManager*, IXpsSignatureBlockCollection*, HRESULT)
    create_signing_options : Proc(IXpsSignatureManager*, IXpsSigningOptions*, HRESULT)
    save_package_to_file : Proc(IXpsSignatureManager*, LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, HRESULT)
    save_package_to_stream : Proc(IXpsSignatureManager*, IStream, HRESULT)
  end

  struct IXpsSignatureManager
    lpVtbl : IXpsSignatureManagerVTbl*
  end


  # Params # pdevice : PSTR [In],pport : PSTR [In],fwcapability : DEVICE_CAPABILITIES [In],poutput : PSTR [In],pdevmode : DEVMODEA* [In]
  fun DeviceCapabilitiesA(pdevice : PSTR, pport : PSTR, fwcapability : DEVICE_CAPABILITIES, poutput : PSTR, pdevmode : DEVMODEA*) : Int32

  # Params # pdevice : LibC::LPWSTR [In],pport : LibC::LPWSTR [In],fwcapability : DEVICE_CAPABILITIES [In],poutput : LibC::LPWSTR [In],pdevmode : DEVMODEW* [In]
  fun DeviceCapabilitiesW(pdevice : LibC::LPWSTR, pport : LibC::LPWSTR, fwcapability : DEVICE_CAPABILITIES, poutput : LibC::LPWSTR, pdevmode : DEVMODEW*) : Int32

  # Params # hdc : HDC [In],iescape : Int32 [In],cjin : Int32 [In],pvin : PSTR [In],pvout : Void* [In]
  fun Escape(hdc : HDC, iescape : Int32, cjin : Int32, pvin : PSTR, pvout : Void*) : Int32

  # Params # hdc : HDC [In],iescape : Int32 [In],cjinput : Int32 [In],lpindata : PSTR [In],cjoutput : Int32 [In],lpoutdata : PSTR [In]
  fun ExtEscape(hdc : HDC, iescape : Int32, cjinput : Int32, lpindata : PSTR, cjoutput : Int32, lpoutdata : PSTR) : Int32

  # Params # hdc : HDC [In],lpdi : DOCINFOA* [In]
  fun StartDocA(hdc : HDC, lpdi : DOCINFOA*) : Int32

  # Params # hdc : HDC [In],lpdi : DOCINFOW* [In]
  fun StartDocW(hdc : HDC, lpdi : DOCINFOW*) : Int32

  # Params # hdc : HDC [In]
  fun EndDoc(hdc : HDC) : Int32

  # Params # hdc : HDC [In]
  fun StartPage(hdc : HDC) : Int32

  # Params # hdc : HDC [In]
  fun EndPage(hdc : HDC) : Int32

  # Params # hdc : HDC [In]
  fun AbortDoc(hdc : HDC) : Int32

  # Params # hdc : HDC [In],proc : ABORTPROC [In]
  fun SetAbortProc(hdc : HDC, proc : ABORTPROC) : Int32

  # Params # hwnd : LibC::HANDLE [In],hdcblt : HDC [In],nflags : PRINT_WINDOW_FLAGS [In]
  fun PrintWindow(hwnd : LibC::HANDLE, hdcblt : HDC, nflags : PRINT_WINDOW_FLAGS) : LibC::BOOL
end
