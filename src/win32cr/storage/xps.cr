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
  CLSID_XpsOMObjectFactory = LibC::GUID.new(0xe974d26d_u32, 0x3d9b_u16, 0x4d47_u16, StaticArray[0x88_u8, 0xcc_u8, 0x38_u8, 0x72_u8, 0xf2_u8, 0xdc_u8, 0x35_u8, 0x85_u8])
  CLSID_XpsOMThumbnailGenerator = LibC::GUID.new(0x7e4a23e2_u32, 0xb969_u16, 0x4761_u16, StaticArray[0xbe_u8, 0x35_u8, 0x1a_u8, 0x8c_u8, 0xed_u8, 0x58_u8, 0xe3_u8, 0x23_u8])
  CLSID_XpsSignatureManager = LibC::GUID.new(0xb0c43320_u32, 0x2315_u16, 0x44a2_u16, StaticArray[0xb7_u8, 0xa_u8, 0x9_u8, 0x43_u8, 0xa1_u8, 0x40_u8, 0xa8_u8, 0xee_u8])

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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
  end

  IXpsOMShareable_GUID = "7137398f-2fc1-454d-8c6a-2c3115a16ece"
  IID_IXpsOMShareable = LibC::GUID.new(0x7137398f_u32, 0x2fc1_u16, 0x454d_u16, StaticArray[0x8c_u8, 0x6a_u8, 0x2c_u8, 0x31_u8, 0x15_u8, 0xa1_u8, 0x6e_u8, 0xce_u8])
  struct IXpsOMShareable
    lpVtbl : IXpsOMShareableVTbl*
  end

  struct IXpsOMVisualVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_clip_geometry : UInt64
    get_clip_geometry_local : UInt64
    set_clip_geometry_local : UInt64
    get_clip_geometry_lookup : UInt64
    set_clip_geometry_lookup : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_opacity_mask_brush : UInt64
    get_opacity_mask_brush_local : UInt64
    set_opacity_mask_brush_local : UInt64
    get_opacity_mask_brush_lookup : UInt64
    set_opacity_mask_brush_lookup : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_hyperlink_navigate_uri : UInt64
    set_hyperlink_navigate_uri : UInt64
    get_language : UInt64
    set_language : UInt64
  end

  IXpsOMVisual_GUID = "bc3e7333-fb0b-4af3-a819-0b4eaad0d2fd"
  IID_IXpsOMVisual = LibC::GUID.new(0xbc3e7333_u32, 0xfb0b_u16, 0x4af3_u16, StaticArray[0xa8_u8, 0x19_u8, 0xb_u8, 0x4e_u8, 0xaa_u8, 0xd0_u8, 0xd2_u8, 0xfd_u8])
  struct IXpsOMVisual
    lpVtbl : IXpsOMVisualVTbl*
  end

  struct IXpsOMPartVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
  end

  IXpsOMPart_GUID = "74eb2f0b-a91e-4486-afac-0fabeca3dfc6"
  IID_IXpsOMPart = LibC::GUID.new(0x74eb2f0b_u32, 0xa91e_u16, 0x4486_u16, StaticArray[0xaf_u8, 0xac_u8, 0xf_u8, 0xab_u8, 0xec_u8, 0xa3_u8, 0xdf_u8, 0xc6_u8])
  struct IXpsOMPart
    lpVtbl : IXpsOMPartVTbl*
  end

  struct IXpsOMGlyphsEditorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    apply_edits : UInt64
    get_unicode_string : UInt64
    set_unicode_string : UInt64
    get_glyph_index_count : UInt64
    get_glyph_indices : UInt64
    set_glyph_indices : UInt64
    get_glyph_mapping_count : UInt64
    get_glyph_mappings : UInt64
    set_glyph_mappings : UInt64
    get_prohibited_caret_stop_count : UInt64
    get_prohibited_caret_stops : UInt64
    set_prohibited_caret_stops : UInt64
    get_bidi_level : UInt64
    set_bidi_level : UInt64
    get_is_sideways : UInt64
    set_is_sideways : UInt64
    get_device_font_name : UInt64
    set_device_font_name : UInt64
  end

  IXpsOMGlyphsEditor_GUID = "a5ab8616-5b16-4b9f-9629-89b323ed7909"
  IID_IXpsOMGlyphsEditor = LibC::GUID.new(0xa5ab8616_u32, 0x5b16_u16, 0x4b9f_u16, StaticArray[0x96_u8, 0x29_u8, 0x89_u8, 0xb3_u8, 0x23_u8, 0xed_u8, 0x79_u8, 0x9_u8])
  struct IXpsOMGlyphsEditor
    lpVtbl : IXpsOMGlyphsEditorVTbl*
  end

  struct IXpsOMGlyphsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_clip_geometry : UInt64
    get_clip_geometry_local : UInt64
    set_clip_geometry_local : UInt64
    get_clip_geometry_lookup : UInt64
    set_clip_geometry_lookup : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_opacity_mask_brush : UInt64
    get_opacity_mask_brush_local : UInt64
    set_opacity_mask_brush_local : UInt64
    get_opacity_mask_brush_lookup : UInt64
    set_opacity_mask_brush_lookup : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_hyperlink_navigate_uri : UInt64
    set_hyperlink_navigate_uri : UInt64
    get_language : UInt64
    set_language : UInt64
    get_unicode_string : UInt64
    get_glyph_index_count : UInt64
    get_glyph_indices : UInt64
    get_glyph_mapping_count : UInt64
    get_glyph_mappings : UInt64
    get_prohibited_caret_stop_count : UInt64
    get_prohibited_caret_stops : UInt64
    get_bidi_level : UInt64
    get_is_sideways : UInt64
    get_device_font_name : UInt64
    get_style_simulations : UInt64
    set_style_simulations : UInt64
    get_origin : UInt64
    set_origin : UInt64
    get_font_rendering_em_size : UInt64
    set_font_rendering_em_size : UInt64
    get_font_resource : UInt64
    set_font_resource : UInt64
    get_font_face_index : UInt64
    set_font_face_index : UInt64
    get_fill_brush : UInt64
    get_fill_brush_local : UInt64
    set_fill_brush_local : UInt64
    get_fill_brush_lookup : UInt64
    set_fill_brush_lookup : UInt64
    get_glyphs_editor : UInt64
    clone : UInt64
  end

  IXpsOMGlyphs_GUID = "819b3199-0a5a-4b64-bec7-a9e17e780de2"
  IID_IXpsOMGlyphs = LibC::GUID.new(0x819b3199_u32, 0xa5a_u16, 0x4b64_u16, StaticArray[0xbe_u8, 0xc7_u8, 0xa9_u8, 0xe1_u8, 0x7e_u8, 0x78_u8, 0xd_u8, 0xe2_u8])
  struct IXpsOMGlyphs
    lpVtbl : IXpsOMGlyphsVTbl*
  end

  struct IXpsOMDashCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMDashCollection_GUID = "081613f4-74eb-48f2-83b3-37a9ce2d7dc6"
  IID_IXpsOMDashCollection = LibC::GUID.new(0x81613f4_u32, 0x74eb_u16, 0x48f2_u16, StaticArray[0x83_u8, 0xb3_u8, 0x37_u8, 0xa9_u8, 0xce_u8, 0x2d_u8, 0x7d_u8, 0xc6_u8])
  struct IXpsOMDashCollection
    lpVtbl : IXpsOMDashCollectionVTbl*
  end

  struct IXpsOMMatrixTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_matrix : UInt64
    set_matrix : UInt64
    clone : UInt64
  end

  IXpsOMMatrixTransform_GUID = "b77330ff-bb37-4501-a93e-f1b1e50bfc46"
  IID_IXpsOMMatrixTransform = LibC::GUID.new(0xb77330ff_u32, 0xbb37_u16, 0x4501_u16, StaticArray[0xa9_u8, 0x3e_u8, 0xf1_u8, 0xb1_u8, 0xe5_u8, 0xb_u8, 0xfc_u8, 0x46_u8])
  struct IXpsOMMatrixTransform
    lpVtbl : IXpsOMMatrixTransformVTbl*
  end

  struct IXpsOMGeometryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_figures : UInt64
    get_fill_rule : UInt64
    set_fill_rule : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    clone : UInt64
  end

  IXpsOMGeometry_GUID = "64fcf3d7-4d58-44ba-ad73-a13af6492072"
  IID_IXpsOMGeometry = LibC::GUID.new(0x64fcf3d7_u32, 0x4d58_u16, 0x44ba_u16, StaticArray[0xad_u8, 0x73_u8, 0xa1_u8, 0x3a_u8, 0xf6_u8, 0x49_u8, 0x20_u8, 0x72_u8])
  struct IXpsOMGeometry
    lpVtbl : IXpsOMGeometryVTbl*
  end

  struct IXpsOMGeometryFigureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_segment_data : UInt64
    get_segment_types : UInt64
    get_segment_strokes : UInt64
    set_segments : UInt64
    get_start_point : UInt64
    set_start_point : UInt64
    get_is_closed : UInt64
    set_is_closed : UInt64
    get_is_filled : UInt64
    set_is_filled : UInt64
    get_segment_count : UInt64
    get_segment_data_count : UInt64
    get_segment_stroke_pattern : UInt64
    clone : UInt64
  end

  IXpsOMGeometryFigure_GUID = "d410dc83-908c-443e-8947-b1795d3c165a"
  IID_IXpsOMGeometryFigure = LibC::GUID.new(0xd410dc83_u32, 0x908c_u16, 0x443e_u16, StaticArray[0x89_u8, 0x47_u8, 0xb1_u8, 0x79_u8, 0x5d_u8, 0x3c_u8, 0x16_u8, 0x5a_u8])
  struct IXpsOMGeometryFigure
    lpVtbl : IXpsOMGeometryFigureVTbl*
  end

  struct IXpsOMGeometryFigureCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMGeometryFigureCollection_GUID = "fd48c3f3-a58e-4b5a-8826-1de54abe72b2"
  IID_IXpsOMGeometryFigureCollection = LibC::GUID.new(0xfd48c3f3_u32, 0xa58e_u16, 0x4b5a_u16, StaticArray[0x88_u8, 0x26_u8, 0x1d_u8, 0xe5_u8, 0x4a_u8, 0xbe_u8, 0x72_u8, 0xb2_u8])
  struct IXpsOMGeometryFigureCollection
    lpVtbl : IXpsOMGeometryFigureCollectionVTbl*
  end

  struct IXpsOMPathVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_clip_geometry : UInt64
    get_clip_geometry_local : UInt64
    set_clip_geometry_local : UInt64
    get_clip_geometry_lookup : UInt64
    set_clip_geometry_lookup : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_opacity_mask_brush : UInt64
    get_opacity_mask_brush_local : UInt64
    set_opacity_mask_brush_local : UInt64
    get_opacity_mask_brush_lookup : UInt64
    set_opacity_mask_brush_lookup : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_hyperlink_navigate_uri : UInt64
    set_hyperlink_navigate_uri : UInt64
    get_language : UInt64
    set_language : UInt64
    get_geometry : UInt64
    get_geometry_local : UInt64
    set_geometry_local : UInt64
    get_geometry_lookup : UInt64
    set_geometry_lookup : UInt64
    get_accessibility_short_description : UInt64
    set_accessibility_short_description : UInt64
    get_accessibility_long_description : UInt64
    set_accessibility_long_description : UInt64
    get_snaps_to_pixels : UInt64
    set_snaps_to_pixels : UInt64
    get_stroke_brush : UInt64
    get_stroke_brush_local : UInt64
    set_stroke_brush_local : UInt64
    get_stroke_brush_lookup : UInt64
    set_stroke_brush_lookup : UInt64
    get_stroke_dashes : UInt64
    get_stroke_dash_cap : UInt64
    set_stroke_dash_cap : UInt64
    get_stroke_dash_offset : UInt64
    set_stroke_dash_offset : UInt64
    get_stroke_start_line_cap : UInt64
    set_stroke_start_line_cap : UInt64
    get_stroke_end_line_cap : UInt64
    set_stroke_end_line_cap : UInt64
    get_stroke_line_join : UInt64
    set_stroke_line_join : UInt64
    get_stroke_miter_limit : UInt64
    set_stroke_miter_limit : UInt64
    get_stroke_thickness : UInt64
    set_stroke_thickness : UInt64
    get_fill_brush : UInt64
    get_fill_brush_local : UInt64
    set_fill_brush_local : UInt64
    get_fill_brush_lookup : UInt64
    set_fill_brush_lookup : UInt64
    clone : UInt64
  end

  IXpsOMPath_GUID = "37d38bb6-3ee9-4110-9312-14b194163337"
  IID_IXpsOMPath = LibC::GUID.new(0x37d38bb6_u32, 0x3ee9_u16, 0x4110_u16, StaticArray[0x93_u8, 0x12_u8, 0x14_u8, 0xb1_u8, 0x94_u8, 0x16_u8, 0x33_u8, 0x37_u8])
  struct IXpsOMPath
    lpVtbl : IXpsOMPathVTbl*
  end

  struct IXpsOMBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
  end

  IXpsOMBrush_GUID = "56a3f80c-ea4c-4187-a57b-a2a473b2b42b"
  IID_IXpsOMBrush = LibC::GUID.new(0x56a3f80c_u32, 0xea4c_u16, 0x4187_u16, StaticArray[0xa5_u8, 0x7b_u8, 0xa2_u8, 0xa4_u8, 0x73_u8, 0xb2_u8, 0xb4_u8, 0x2b_u8])
  struct IXpsOMBrush
    lpVtbl : IXpsOMBrushVTbl*
  end

  struct IXpsOMGradientStopCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMGradientStopCollection_GUID = "c9174c3a-3cd3-4319-bda4-11a39392ceef"
  IID_IXpsOMGradientStopCollection = LibC::GUID.new(0xc9174c3a_u32, 0x3cd3_u16, 0x4319_u16, StaticArray[0xbd_u8, 0xa4_u8, 0x11_u8, 0xa3_u8, 0x93_u8, 0x92_u8, 0xce_u8, 0xef_u8])
  struct IXpsOMGradientStopCollection
    lpVtbl : IXpsOMGradientStopCollectionVTbl*
  end

  struct IXpsOMSolidColorBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_color : UInt64
    set_color : UInt64
    clone : UInt64
  end

  IXpsOMSolidColorBrush_GUID = "a06f9f05-3be9-4763-98a8-094fc672e488"
  IID_IXpsOMSolidColorBrush = LibC::GUID.new(0xa06f9f05_u32, 0x3be9_u16, 0x4763_u16, StaticArray[0x98_u8, 0xa8_u8, 0x9_u8, 0x4f_u8, 0xc6_u8, 0x72_u8, 0xe4_u8, 0x88_u8])
  struct IXpsOMSolidColorBrush
    lpVtbl : IXpsOMSolidColorBrushVTbl*
  end

  struct IXpsOMTileBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_viewbox : UInt64
    set_viewbox : UInt64
    get_viewport : UInt64
    set_viewport : UInt64
    get_tile_mode : UInt64
    set_tile_mode : UInt64
  end

  IXpsOMTileBrush_GUID = "0fc2328d-d722-4a54-b2ec-be90218a789e"
  IID_IXpsOMTileBrush = LibC::GUID.new(0xfc2328d_u32, 0xd722_u16, 0x4a54_u16, StaticArray[0xb2_u8, 0xec_u8, 0xbe_u8, 0x90_u8, 0x21_u8, 0x8a_u8, 0x78_u8, 0x9e_u8])
  struct IXpsOMTileBrush
    lpVtbl : IXpsOMTileBrushVTbl*
  end

  struct IXpsOMVisualBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_viewbox : UInt64
    set_viewbox : UInt64
    get_viewport : UInt64
    set_viewport : UInt64
    get_tile_mode : UInt64
    set_tile_mode : UInt64
    get_visual : UInt64
    get_visual_local : UInt64
    set_visual_local : UInt64
    get_visual_lookup : UInt64
    set_visual_lookup : UInt64
    clone : UInt64
  end

  IXpsOMVisualBrush_GUID = "97e294af-5b37-46b4-8057-874d2f64119b"
  IID_IXpsOMVisualBrush = LibC::GUID.new(0x97e294af_u32, 0x5b37_u16, 0x46b4_u16, StaticArray[0x80_u8, 0x57_u8, 0x87_u8, 0x4d_u8, 0x2f_u8, 0x64_u8, 0x11_u8, 0x9b_u8])
  struct IXpsOMVisualBrush
    lpVtbl : IXpsOMVisualBrushVTbl*
  end

  struct IXpsOMImageBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_viewbox : UInt64
    set_viewbox : UInt64
    get_viewport : UInt64
    set_viewport : UInt64
    get_tile_mode : UInt64
    set_tile_mode : UInt64
    get_image_resource : UInt64
    set_image_resource : UInt64
    get_color_profile_resource : UInt64
    set_color_profile_resource : UInt64
    clone : UInt64
  end

  IXpsOMImageBrush_GUID = "3df0b466-d382-49ef-8550-dd94c80242e4"
  IID_IXpsOMImageBrush = LibC::GUID.new(0x3df0b466_u32, 0xd382_u16, 0x49ef_u16, StaticArray[0x85_u8, 0x50_u8, 0xdd_u8, 0x94_u8, 0xc8_u8, 0x2_u8, 0x42_u8, 0xe4_u8])
  struct IXpsOMImageBrush
    lpVtbl : IXpsOMImageBrushVTbl*
  end

  struct IXpsOMGradientStopVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_offset : UInt64
    set_offset : UInt64
    get_color : UInt64
    set_color : UInt64
    clone : UInt64
  end

  IXpsOMGradientStop_GUID = "5cf4f5cc-3969-49b5-a70a-5550b618fe49"
  IID_IXpsOMGradientStop = LibC::GUID.new(0x5cf4f5cc_u32, 0x3969_u16, 0x49b5_u16, StaticArray[0xa7_u8, 0xa_u8, 0x55_u8, 0x50_u8, 0xb6_u8, 0x18_u8, 0xfe_u8, 0x49_u8])
  struct IXpsOMGradientStop
    lpVtbl : IXpsOMGradientStopVTbl*
  end

  struct IXpsOMGradientBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_gradient_stops : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_spread_method : UInt64
    set_spread_method : UInt64
    get_color_interpolation_mode : UInt64
    set_color_interpolation_mode : UInt64
  end

  IXpsOMGradientBrush_GUID = "edb59622-61a2-42c3-bace-acf2286c06bf"
  IID_IXpsOMGradientBrush = LibC::GUID.new(0xedb59622_u32, 0x61a2_u16, 0x42c3_u16, StaticArray[0xba_u8, 0xce_u8, 0xac_u8, 0xf2_u8, 0x28_u8, 0x6c_u8, 0x6_u8, 0xbf_u8])
  struct IXpsOMGradientBrush
    lpVtbl : IXpsOMGradientBrushVTbl*
  end

  struct IXpsOMLinearGradientBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_gradient_stops : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_spread_method : UInt64
    set_spread_method : UInt64
    get_color_interpolation_mode : UInt64
    set_color_interpolation_mode : UInt64
    get_start_point : UInt64
    set_start_point : UInt64
    get_end_point : UInt64
    set_end_point : UInt64
    clone : UInt64
  end

  IXpsOMLinearGradientBrush_GUID = "005e279f-c30d-40ff-93ec-1950d3c528db"
  IID_IXpsOMLinearGradientBrush = LibC::GUID.new(0x5e279f_u32, 0xc30d_u16, 0x40ff_u16, StaticArray[0x93_u8, 0xec_u8, 0x19_u8, 0x50_u8, 0xd3_u8, 0xc5_u8, 0x28_u8, 0xdb_u8])
  struct IXpsOMLinearGradientBrush
    lpVtbl : IXpsOMLinearGradientBrushVTbl*
  end

  struct IXpsOMRadialGradientBrushVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_gradient_stops : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_spread_method : UInt64
    set_spread_method : UInt64
    get_color_interpolation_mode : UInt64
    set_color_interpolation_mode : UInt64
    get_center : UInt64
    set_center : UInt64
    get_radii_sizes : UInt64
    set_radii_sizes : UInt64
    get_gradient_origin : UInt64
    set_gradient_origin : UInt64
    clone : UInt64
  end

  IXpsOMRadialGradientBrush_GUID = "75f207e5-08bf-413c-96b1-b82b4064176b"
  IID_IXpsOMRadialGradientBrush = LibC::GUID.new(0x75f207e5_u32, 0x8bf_u16, 0x413c_u16, StaticArray[0x96_u8, 0xb1_u8, 0xb8_u8, 0x2b_u8, 0x40_u8, 0x64_u8, 0x17_u8, 0x6b_u8])
  struct IXpsOMRadialGradientBrush
    lpVtbl : IXpsOMRadialGradientBrushVTbl*
  end

  struct IXpsOMResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
  end

  IXpsOMResource_GUID = "da2ac0a2-73a2-4975-ad14-74097c3ff3a5"
  IID_IXpsOMResource = LibC::GUID.new(0xda2ac0a2_u32, 0x73a2_u16, 0x4975_u16, StaticArray[0xad_u8, 0x14_u8, 0x74_u8, 0x9_u8, 0x7c_u8, 0x3f_u8, 0xf3_u8, 0xa5_u8])
  struct IXpsOMResource
    lpVtbl : IXpsOMResourceVTbl*
  end

  struct IXpsOMPartResourcesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_font_resources : UInt64
    get_image_resources : UInt64
    get_color_profile_resources : UInt64
    get_remote_dictionary_resources : UInt64
  end

  IXpsOMPartResources_GUID = "f4cf7729-4864-4275-99b3-a8717163ecaf"
  IID_IXpsOMPartResources = LibC::GUID.new(0xf4cf7729_u32, 0x4864_u16, 0x4275_u16, StaticArray[0x99_u8, 0xb3_u8, 0xa8_u8, 0x71_u8, 0x71_u8, 0x63_u8, 0xec_u8, 0xaf_u8])
  struct IXpsOMPartResources
    lpVtbl : IXpsOMPartResourcesVTbl*
  end

  struct IXpsOMDictionaryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_count : UInt64
    get_at : UInt64
    get_by_key : UInt64
    get_index : UInt64
    append : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    clone : UInt64
  end

  IXpsOMDictionary_GUID = "897c86b8-8eaf-4ae3-bdde-56419fcf4236"
  IID_IXpsOMDictionary = LibC::GUID.new(0x897c86b8_u32, 0x8eaf_u16, 0x4ae3_u16, StaticArray[0xbd_u8, 0xde_u8, 0x56_u8, 0x41_u8, 0x9f_u8, 0xcf_u8, 0x42_u8, 0x36_u8])
  struct IXpsOMDictionary
    lpVtbl : IXpsOMDictionaryVTbl*
  end

  struct IXpsOMFontResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_stream : UInt64
    set_content : UInt64
    get_embedding_option : UInt64
  end

  IXpsOMFontResource_GUID = "a8c45708-47d9-4af4-8d20-33b48c9b8485"
  IID_IXpsOMFontResource = LibC::GUID.new(0xa8c45708_u32, 0x47d9_u16, 0x4af4_u16, StaticArray[0x8d_u8, 0x20_u8, 0x33_u8, 0xb4_u8, 0x8c_u8, 0x9b_u8, 0x84_u8, 0x85_u8])
  struct IXpsOMFontResource
    lpVtbl : IXpsOMFontResourceVTbl*
  end

  struct IXpsOMFontResourceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    set_at : UInt64
    insert_at : UInt64
    append : UInt64
    remove_at : UInt64
    get_by_part_name : UInt64
  end

  IXpsOMFontResourceCollection_GUID = "70b4a6bb-88d4-4fa8-aaf9-6d9c596fdbad"
  IID_IXpsOMFontResourceCollection = LibC::GUID.new(0x70b4a6bb_u32, 0x88d4_u16, 0x4fa8_u16, StaticArray[0xaa_u8, 0xf9_u8, 0x6d_u8, 0x9c_u8, 0x59_u8, 0x6f_u8, 0xdb_u8, 0xad_u8])
  struct IXpsOMFontResourceCollection
    lpVtbl : IXpsOMFontResourceCollectionVTbl*
  end

  struct IXpsOMImageResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_stream : UInt64
    set_content : UInt64
    get_image_type : UInt64
  end

  IXpsOMImageResource_GUID = "3db8417d-ae50-485e-9a44-d7758f78a23f"
  IID_IXpsOMImageResource = LibC::GUID.new(0x3db8417d_u32, 0xae50_u16, 0x485e_u16, StaticArray[0x9a_u8, 0x44_u8, 0xd7_u8, 0x75_u8, 0x8f_u8, 0x78_u8, 0xa2_u8, 0x3f_u8])
  struct IXpsOMImageResource
    lpVtbl : IXpsOMImageResourceVTbl*
  end

  struct IXpsOMImageResourceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
    get_by_part_name : UInt64
  end

  IXpsOMImageResourceCollection_GUID = "7a4a1a71-9cde-4b71-b33f-62de843eabfe"
  IID_IXpsOMImageResourceCollection = LibC::GUID.new(0x7a4a1a71_u32, 0x9cde_u16, 0x4b71_u16, StaticArray[0xb3_u8, 0x3f_u8, 0x62_u8, 0xde_u8, 0x84_u8, 0x3e_u8, 0xab_u8, 0xfe_u8])
  struct IXpsOMImageResourceCollection
    lpVtbl : IXpsOMImageResourceCollectionVTbl*
  end

  struct IXpsOMColorProfileResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_stream : UInt64
    set_content : UInt64
  end

  IXpsOMColorProfileResource_GUID = "67bd7d69-1eef-4bb1-b5e7-6f4f87be8abe"
  IID_IXpsOMColorProfileResource = LibC::GUID.new(0x67bd7d69_u32, 0x1eef_u16, 0x4bb1_u16, StaticArray[0xb5_u8, 0xe7_u8, 0x6f_u8, 0x4f_u8, 0x87_u8, 0xbe_u8, 0x8a_u8, 0xbe_u8])
  struct IXpsOMColorProfileResource
    lpVtbl : IXpsOMColorProfileResourceVTbl*
  end

  struct IXpsOMColorProfileResourceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
    get_by_part_name : UInt64
  end

  IXpsOMColorProfileResourceCollection_GUID = "12759630-5fba-4283-8f7d-cca849809edb"
  IID_IXpsOMColorProfileResourceCollection = LibC::GUID.new(0x12759630_u32, 0x5fba_u16, 0x4283_u16, StaticArray[0x8f_u8, 0x7d_u8, 0xcc_u8, 0xa8_u8, 0x49_u8, 0x80_u8, 0x9e_u8, 0xdb_u8])
  struct IXpsOMColorProfileResourceCollection
    lpVtbl : IXpsOMColorProfileResourceCollectionVTbl*
  end

  struct IXpsOMPrintTicketResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_stream : UInt64
    set_content : UInt64
  end

  IXpsOMPrintTicketResource_GUID = "e7ff32d2-34aa-499b-bbe9-9cd4ee6c59f7"
  IID_IXpsOMPrintTicketResource = LibC::GUID.new(0xe7ff32d2_u32, 0x34aa_u16, 0x499b_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x9c_u8, 0xd4_u8, 0xee_u8, 0x6c_u8, 0x59_u8, 0xf7_u8])
  struct IXpsOMPrintTicketResource
    lpVtbl : IXpsOMPrintTicketResourceVTbl*
  end

  struct IXpsOMRemoteDictionaryResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_dictionary : UInt64
    set_dictionary : UInt64
  end

  IXpsOMRemoteDictionaryResource_GUID = "c9bd7cd4-e16a-4bf8-8c84-c950af7a3061"
  IID_IXpsOMRemoteDictionaryResource = LibC::GUID.new(0xc9bd7cd4_u32, 0xe16a_u16, 0x4bf8_u16, StaticArray[0x8c_u8, 0x84_u8, 0xc9_u8, 0x50_u8, 0xaf_u8, 0x7a_u8, 0x30_u8, 0x61_u8])
  struct IXpsOMRemoteDictionaryResource
    lpVtbl : IXpsOMRemoteDictionaryResourceVTbl*
  end

  struct IXpsOMRemoteDictionaryResourceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
    get_by_part_name : UInt64
  end

  IXpsOMRemoteDictionaryResourceCollection_GUID = "5c38db61-7fec-464a-87bd-41e3bef018be"
  IID_IXpsOMRemoteDictionaryResourceCollection = LibC::GUID.new(0x5c38db61_u32, 0x7fec_u16, 0x464a_u16, StaticArray[0x87_u8, 0xbd_u8, 0x41_u8, 0xe3_u8, 0xbe_u8, 0xf0_u8, 0x18_u8, 0xbe_u8])
  struct IXpsOMRemoteDictionaryResourceCollection
    lpVtbl : IXpsOMRemoteDictionaryResourceCollectionVTbl*
  end

  struct IXpsOMSignatureBlockResourceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
    get_by_part_name : UInt64
  end

  IXpsOMSignatureBlockResourceCollection_GUID = "ab8f5d8e-351b-4d33-aaed-fa56f0022931"
  IID_IXpsOMSignatureBlockResourceCollection = LibC::GUID.new(0xab8f5d8e_u32, 0x351b_u16, 0x4d33_u16, StaticArray[0xaa_u8, 0xed_u8, 0xfa_u8, 0x56_u8, 0xf0_u8, 0x2_u8, 0x29_u8, 0x31_u8])
  struct IXpsOMSignatureBlockResourceCollection
    lpVtbl : IXpsOMSignatureBlockResourceCollectionVTbl*
  end

  struct IXpsOMDocumentStructureResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_stream : UInt64
    set_content : UInt64
  end

  IXpsOMDocumentStructureResource_GUID = "85febc8a-6b63-48a9-af07-7064e4ecff30"
  IID_IXpsOMDocumentStructureResource = LibC::GUID.new(0x85febc8a_u32, 0x6b63_u16, 0x48a9_u16, StaticArray[0xaf_u8, 0x7_u8, 0x70_u8, 0x64_u8, 0xe4_u8, 0xec_u8, 0xff_u8, 0x30_u8])
  struct IXpsOMDocumentStructureResource
    lpVtbl : IXpsOMDocumentStructureResourceVTbl*
  end

  struct IXpsOMStoryFragmentsResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_stream : UInt64
    set_content : UInt64
  end

  IXpsOMStoryFragmentsResource_GUID = "c2b3ca09-0473-4282-87ae-1780863223f0"
  IID_IXpsOMStoryFragmentsResource = LibC::GUID.new(0xc2b3ca09_u32, 0x473_u16, 0x4282_u16, StaticArray[0x87_u8, 0xae_u8, 0x17_u8, 0x80_u8, 0x86_u8, 0x32_u8, 0x23_u8, 0xf0_u8])
  struct IXpsOMStoryFragmentsResource
    lpVtbl : IXpsOMStoryFragmentsResourceVTbl*
  end

  struct IXpsOMSignatureBlockResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_stream : UInt64
    set_content : UInt64
  end

  IXpsOMSignatureBlockResource_GUID = "4776ad35-2e04-4357-8743-ebf6c171a905"
  IID_IXpsOMSignatureBlockResource = LibC::GUID.new(0x4776ad35_u32, 0x2e04_u16, 0x4357_u16, StaticArray[0x87_u8, 0x43_u8, 0xeb_u8, 0xf6_u8, 0xc1_u8, 0x71_u8, 0xa9_u8, 0x5_u8])
  struct IXpsOMSignatureBlockResource
    lpVtbl : IXpsOMSignatureBlockResourceVTbl*
  end

  struct IXpsOMVisualCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMVisualCollection_GUID = "94d8abde-ab91-46a8-82b7-f5b05ef01a96"
  IID_IXpsOMVisualCollection = LibC::GUID.new(0x94d8abde_u32, 0xab91_u16, 0x46a8_u16, StaticArray[0x82_u8, 0xb7_u8, 0xf5_u8, 0xb0_u8, 0x5e_u8, 0xf0_u8, 0x1a_u8, 0x96_u8])
  struct IXpsOMVisualCollection
    lpVtbl : IXpsOMVisualCollectionVTbl*
  end

  struct IXpsOMCanvasVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_type : UInt64
    get_transform : UInt64
    get_transform_local : UInt64
    set_transform_local : UInt64
    get_transform_lookup : UInt64
    set_transform_lookup : UInt64
    get_clip_geometry : UInt64
    get_clip_geometry_local : UInt64
    set_clip_geometry_local : UInt64
    get_clip_geometry_lookup : UInt64
    set_clip_geometry_lookup : UInt64
    get_opacity : UInt64
    set_opacity : UInt64
    get_opacity_mask_brush : UInt64
    get_opacity_mask_brush_local : UInt64
    set_opacity_mask_brush_local : UInt64
    get_opacity_mask_brush_lookup : UInt64
    set_opacity_mask_brush_lookup : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_hyperlink_navigate_uri : UInt64
    set_hyperlink_navigate_uri : UInt64
    get_language : UInt64
    set_language : UInt64
    get_visuals : UInt64
    get_use_aliased_edge_mode : UInt64
    set_use_aliased_edge_mode : UInt64
    get_accessibility_short_description : UInt64
    set_accessibility_short_description : UInt64
    get_accessibility_long_description : UInt64
    set_accessibility_long_description : UInt64
    get_dictionary : UInt64
    get_dictionary_local : UInt64
    set_dictionary_local : UInt64
    get_dictionary_resource : UInt64
    set_dictionary_resource : UInt64
    clone : UInt64
  end

  IXpsOMCanvas_GUID = "221d1452-331e-47c6-87e9-6ccefb9b5ba3"
  IID_IXpsOMCanvas = LibC::GUID.new(0x221d1452_u32, 0x331e_u16, 0x47c6_u16, StaticArray[0x87_u8, 0xe9_u8, 0x6c_u8, 0xce_u8, 0xfb_u8, 0x9b_u8, 0x5b_u8, 0xa3_u8])
  struct IXpsOMCanvas
    lpVtbl : IXpsOMCanvasVTbl*
  end

  struct IXpsOMPageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_visuals : UInt64
    get_page_dimensions : UInt64
    set_page_dimensions : UInt64
    get_content_box : UInt64
    set_content_box : UInt64
    get_bleed_box : UInt64
    set_bleed_box : UInt64
    get_language : UInt64
    set_language : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_dictionary : UInt64
    get_dictionary_local : UInt64
    set_dictionary_local : UInt64
    get_dictionary_resource : UInt64
    set_dictionary_resource : UInt64
    write : UInt64
    generate_unused_lookup_key : UInt64
    clone : UInt64
  end

  IXpsOMPage_GUID = "d3e18888-f120-4fee-8c68-35296eae91d4"
  IID_IXpsOMPage = LibC::GUID.new(0xd3e18888_u32, 0xf120_u16, 0x4fee_u16, StaticArray[0x8c_u8, 0x68_u8, 0x35_u8, 0x29_u8, 0x6e_u8, 0xae_u8, 0x91_u8, 0xd4_u8])
  struct IXpsOMPage
    lpVtbl : IXpsOMPageVTbl*
  end

  struct IXpsOMPageReferenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner : UInt64
    get_page : UInt64
    set_page : UInt64
    discard_page : UInt64
    is_page_loaded : UInt64
    get_advisory_page_dimensions : UInt64
    set_advisory_page_dimensions : UInt64
    get_story_fragments_resource : UInt64
    set_story_fragments_resource : UInt64
    get_print_ticket_resource : UInt64
    set_print_ticket_resource : UInt64
    get_thumbnail_resource : UInt64
    set_thumbnail_resource : UInt64
    collect_link_targets : UInt64
    collect_part_resources : UInt64
    has_restricted_fonts : UInt64
    clone : UInt64
  end

  IXpsOMPageReference_GUID = "ed360180-6f92-4998-890d-2f208531a0a0"
  IID_IXpsOMPageReference = LibC::GUID.new(0xed360180_u32, 0x6f92_u16, 0x4998_u16, StaticArray[0x89_u8, 0xd_u8, 0x2f_u8, 0x20_u8, 0x85_u8, 0x31_u8, 0xa0_u8, 0xa0_u8])
  struct IXpsOMPageReference
    lpVtbl : IXpsOMPageReferenceVTbl*
  end

  struct IXpsOMPageReferenceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMPageReferenceCollection_GUID = "ca16ba4d-e7b9-45c5-958b-f98022473745"
  IID_IXpsOMPageReferenceCollection = LibC::GUID.new(0xca16ba4d_u32, 0xe7b9_u16, 0x45c5_u16, StaticArray[0x95_u8, 0x8b_u8, 0xf9_u8, 0x80_u8, 0x22_u8, 0x47_u8, 0x37_u8, 0x45_u8])
  struct IXpsOMPageReferenceCollection
    lpVtbl : IXpsOMPageReferenceCollectionVTbl*
  end

  struct IXpsOMDocumentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_page_references : UInt64
    get_print_ticket_resource : UInt64
    set_print_ticket_resource : UInt64
    get_document_structure_resource : UInt64
    set_document_structure_resource : UInt64
    get_signature_block_resources : UInt64
    clone : UInt64
  end

  IXpsOMDocument_GUID = "2c2c94cb-ac5f-4254-8ee9-23948309d9f0"
  IID_IXpsOMDocument = LibC::GUID.new(0x2c2c94cb_u32, 0xac5f_u16, 0x4254_u16, StaticArray[0x8e_u8, 0xe9_u8, 0x23_u8, 0x94_u8, 0x83_u8, 0x9_u8, 0xd9_u8, 0xf0_u8])
  struct IXpsOMDocument
    lpVtbl : IXpsOMDocumentVTbl*
  end

  struct IXpsOMDocumentCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMDocumentCollection_GUID = "d1c87f0d-e947-4754-8a25-971478f7e83e"
  IID_IXpsOMDocumentCollection = LibC::GUID.new(0xd1c87f0d_u32, 0xe947_u16, 0x4754_u16, StaticArray[0x8a_u8, 0x25_u8, 0x97_u8, 0x14_u8, 0x78_u8, 0xf7_u8, 0xe8_u8, 0x3e_u8])
  struct IXpsOMDocumentCollection
    lpVtbl : IXpsOMDocumentCollectionVTbl*
  end

  struct IXpsOMDocumentSequenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_documents : UInt64
    get_print_ticket_resource : UInt64
    set_print_ticket_resource : UInt64
  end

  IXpsOMDocumentSequence_GUID = "56492eb4-d8d5-425e-8256-4c2b64ad0264"
  IID_IXpsOMDocumentSequence = LibC::GUID.new(0x56492eb4_u32, 0xd8d5_u16, 0x425e_u16, StaticArray[0x82_u8, 0x56_u8, 0x4c_u8, 0x2b_u8, 0x64_u8, 0xad_u8, 0x2_u8, 0x64_u8])
  struct IXpsOMDocumentSequence
    lpVtbl : IXpsOMDocumentSequenceVTbl*
  end

  struct IXpsOMCorePropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_category : UInt64
    set_category : UInt64
    get_content_status : UInt64
    set_content_status : UInt64
    get_content_type : UInt64
    set_content_type : UInt64
    get_created : UInt64
    set_created : UInt64
    get_creator : UInt64
    set_creator : UInt64
    get_description : UInt64
    set_description : UInt64
    get_identifier : UInt64
    set_identifier : UInt64
    get_keywords : UInt64
    set_keywords : UInt64
    get_language : UInt64
    set_language : UInt64
    get_last_modified_by : UInt64
    set_last_modified_by : UInt64
    get_last_printed : UInt64
    set_last_printed : UInt64
    get_modified : UInt64
    set_modified : UInt64
    get_revision : UInt64
    set_revision : UInt64
    get_subject : UInt64
    set_subject : UInt64
    get_title : UInt64
    set_title : UInt64
    get_version : UInt64
    set_version : UInt64
    clone : UInt64
  end

  IXpsOMCoreProperties_GUID = "3340fe8f-4027-4aa1-8f5f-d35ae45fe597"
  IID_IXpsOMCoreProperties = LibC::GUID.new(0x3340fe8f_u32, 0x4027_u16, 0x4aa1_u16, StaticArray[0x8f_u8, 0x5f_u8, 0xd3_u8, 0x5a_u8, 0xe4_u8, 0x5f_u8, 0xe5_u8, 0x97_u8])
  struct IXpsOMCoreProperties
    lpVtbl : IXpsOMCorePropertiesVTbl*
  end

  struct IXpsOMPackageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document_sequence : UInt64
    set_document_sequence : UInt64
    get_core_properties : UInt64
    set_core_properties : UInt64
    get_discard_control_part_name : UInt64
    set_discard_control_part_name : UInt64
    get_thumbnail_resource : UInt64
    set_thumbnail_resource : UInt64
    write_to_file : UInt64
    write_to_stream : UInt64
  end

  IXpsOMPackage_GUID = "18c3df65-81e1-4674-91dc-fc452f5a416f"
  IID_IXpsOMPackage = LibC::GUID.new(0x18c3df65_u32, 0x81e1_u16, 0x4674_u16, StaticArray[0x91_u8, 0xdc_u8, 0xfc_u8, 0x45_u8, 0x2f_u8, 0x5a_u8, 0x41_u8, 0x6f_u8])
  struct IXpsOMPackage
    lpVtbl : IXpsOMPackageVTbl*
  end

  struct IXpsOMObjectFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_package : UInt64
    create_package_from_file : UInt64
    create_package_from_stream : UInt64
    create_story_fragments_resource : UInt64
    create_document_structure_resource : UInt64
    create_signature_block_resource : UInt64
    create_remote_dictionary_resource : UInt64
    create_remote_dictionary_resource_from_stream : UInt64
    create_part_resources : UInt64
    create_document_sequence : UInt64
    create_document : UInt64
    create_page_reference : UInt64
    create_page : UInt64
    create_page_from_stream : UInt64
    create_canvas : UInt64
    create_glyphs : UInt64
    create_path : UInt64
    create_geometry : UInt64
    create_geometry_figure : UInt64
    create_matrix_transform : UInt64
    create_solid_color_brush : UInt64
    create_color_profile_resource : UInt64
    create_image_brush : UInt64
    create_visual_brush : UInt64
    create_image_resource : UInt64
    create_print_ticket_resource : UInt64
    create_font_resource : UInt64
    create_gradient_stop : UInt64
    create_linear_gradient_brush : UInt64
    create_radial_gradient_brush : UInt64
    create_core_properties : UInt64
    create_dictionary : UInt64
    create_part_uri_collection : UInt64
    create_package_writer_on_file : UInt64
    create_package_writer_on_stream : UInt64
    create_part_uri : UInt64
    create_read_only_stream_on_file : UInt64
  end

  IXpsOMObjectFactory_GUID = "f9b2a685-a50d-4fc2-b764-b56e093ea0ca"
  IID_IXpsOMObjectFactory = LibC::GUID.new(0xf9b2a685_u32, 0xa50d_u16, 0x4fc2_u16, StaticArray[0xb7_u8, 0x64_u8, 0xb5_u8, 0x6e_u8, 0x9_u8, 0x3e_u8, 0xa0_u8, 0xca_u8])
  struct IXpsOMObjectFactory
    lpVtbl : IXpsOMObjectFactoryVTbl*
  end

  struct IXpsOMNameCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
  end

  IXpsOMNameCollection_GUID = "4bddf8ec-c915-421b-a166-d173d25653d2"
  IID_IXpsOMNameCollection = LibC::GUID.new(0x4bddf8ec_u32, 0xc915_u16, 0x421b_u16, StaticArray[0xa1_u8, 0x66_u8, 0xd1_u8, 0x73_u8, 0xd2_u8, 0x56_u8, 0x53_u8, 0xd2_u8])
  struct IXpsOMNameCollection
    lpVtbl : IXpsOMNameCollectionVTbl*
  end

  struct IXpsOMPartUriCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    remove_at : UInt64
    set_at : UInt64
    append : UInt64
  end

  IXpsOMPartUriCollection_GUID = "57c650d4-067c-4893-8c33-f62a0633730f"
  IID_IXpsOMPartUriCollection = LibC::GUID.new(0x57c650d4_u32, 0x67c_u16, 0x4893_u16, StaticArray[0x8c_u8, 0x33_u8, 0xf6_u8, 0x2a_u8, 0x6_u8, 0x33_u8, 0x73_u8, 0xf_u8])
  struct IXpsOMPartUriCollection
    lpVtbl : IXpsOMPartUriCollectionVTbl*
  end

  struct IXpsOMPackageWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_new_document : UInt64
    add_page : UInt64
    add_resource : UInt64
    close : UInt64
    is_closed : UInt64
  end

  IXpsOMPackageWriter_GUID = "4e2aa182-a443-42c6-b41b-4f8e9de73ff9"
  IID_IXpsOMPackageWriter = LibC::GUID.new(0x4e2aa182_u32, 0xa443_u16, 0x42c6_u16, StaticArray[0xb4_u8, 0x1b_u8, 0x4f_u8, 0x8e_u8, 0x9d_u8, 0xe7_u8, 0x3f_u8, 0xf9_u8])
  struct IXpsOMPackageWriter
    lpVtbl : IXpsOMPackageWriterVTbl*
  end

  struct IXpsOMPackageTargetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_xps_om_package_writer : UInt64
  end

  IXpsOMPackageTarget_GUID = "219a9db0-4959-47d0-8034-b1ce84f41a4d"
  IID_IXpsOMPackageTarget = LibC::GUID.new(0x219a9db0_u32, 0x4959_u16, 0x47d0_u16, StaticArray[0x80_u8, 0x34_u8, 0xb1_u8, 0xce_u8, 0x84_u8, 0xf4_u8, 0x1a_u8, 0x4d_u8])
  struct IXpsOMPackageTarget
    lpVtbl : IXpsOMPackageTargetVTbl*
  end

  struct IXpsOMThumbnailGeneratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    generate_thumbnail : UInt64
  end

  IXpsOMThumbnailGenerator_GUID = "15b873d5-1971-41e8-83a3-6578403064c7"
  IID_IXpsOMThumbnailGenerator = LibC::GUID.new(0x15b873d5_u32, 0x1971_u16, 0x41e8_u16, StaticArray[0x83_u8, 0xa3_u8, 0x65_u8, 0x78_u8, 0x40_u8, 0x30_u8, 0x64_u8, 0xc7_u8])
  struct IXpsOMThumbnailGenerator
    lpVtbl : IXpsOMThumbnailGeneratorVTbl*
  end

  struct IXpsOMObjectFactory1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_package : UInt64
    create_package_from_file : UInt64
    create_package_from_stream : UInt64
    create_story_fragments_resource : UInt64
    create_document_structure_resource : UInt64
    create_signature_block_resource : UInt64
    create_remote_dictionary_resource : UInt64
    create_remote_dictionary_resource_from_stream : UInt64
    create_part_resources : UInt64
    create_document_sequence : UInt64
    create_document : UInt64
    create_page_reference : UInt64
    create_page : UInt64
    create_page_from_stream : UInt64
    create_canvas : UInt64
    create_glyphs : UInt64
    create_path : UInt64
    create_geometry : UInt64
    create_geometry_figure : UInt64
    create_matrix_transform : UInt64
    create_solid_color_brush : UInt64
    create_color_profile_resource : UInt64
    create_image_brush : UInt64
    create_visual_brush : UInt64
    create_image_resource : UInt64
    create_print_ticket_resource : UInt64
    create_font_resource : UInt64
    create_gradient_stop : UInt64
    create_linear_gradient_brush : UInt64
    create_radial_gradient_brush : UInt64
    create_core_properties : UInt64
    create_dictionary : UInt64
    create_part_uri_collection : UInt64
    create_package_writer_on_file : UInt64
    create_package_writer_on_stream : UInt64
    create_part_uri : UInt64
    create_read_only_stream_on_file : UInt64
    get_document_type_from_file : UInt64
    get_document_type_from_stream : UInt64
    convert_hd_photo_to_jpeg_xr : UInt64
    convert_jpeg_xr_to_hd_photo : UInt64
    create_package_writer_on_file1 : UInt64
    create_package_writer_on_stream1 : UInt64
    create_package1 : UInt64
    create_package_from_stream1 : UInt64
    create_package_from_file1 : UInt64
    create_page1 : UInt64
    create_page_from_stream1 : UInt64
    create_remote_dictionary_resource_from_stream1 : UInt64
  end

  IXpsOMObjectFactory1_GUID = "0a91b617-d612-4181-bf7c-be5824e9cc8f"
  IID_IXpsOMObjectFactory1 = LibC::GUID.new(0xa91b617_u32, 0xd612_u16, 0x4181_u16, StaticArray[0xbf_u8, 0x7c_u8, 0xbe_u8, 0x58_u8, 0x24_u8, 0xe9_u8, 0xcc_u8, 0x8f_u8])
  struct IXpsOMObjectFactory1
    lpVtbl : IXpsOMObjectFactory1VTbl*
  end

  struct IXpsOMPackage1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document_sequence : UInt64
    set_document_sequence : UInt64
    get_core_properties : UInt64
    set_core_properties : UInt64
    get_discard_control_part_name : UInt64
    set_discard_control_part_name : UInt64
    get_thumbnail_resource : UInt64
    set_thumbnail_resource : UInt64
    write_to_file : UInt64
    write_to_stream : UInt64
    get_document_type : UInt64
    write_to_file1 : UInt64
    write_to_stream1 : UInt64
  end

  IXpsOMPackage1_GUID = "95a9435e-12bb-461b-8e7f-c6adb04cd96a"
  IID_IXpsOMPackage1 = LibC::GUID.new(0x95a9435e_u32, 0x12bb_u16, 0x461b_u16, StaticArray[0x8e_u8, 0x7f_u8, 0xc6_u8, 0xad_u8, 0xb0_u8, 0x4c_u8, 0xd9_u8, 0x6a_u8])
  struct IXpsOMPackage1
    lpVtbl : IXpsOMPackage1VTbl*
  end

  struct IXpsOMPage1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_owner : UInt64
    get_visuals : UInt64
    get_page_dimensions : UInt64
    set_page_dimensions : UInt64
    get_content_box : UInt64
    set_content_box : UInt64
    get_bleed_box : UInt64
    set_bleed_box : UInt64
    get_language : UInt64
    set_language : UInt64
    get_name : UInt64
    set_name : UInt64
    get_is_hyperlink_target : UInt64
    set_is_hyperlink_target : UInt64
    get_dictionary : UInt64
    get_dictionary_local : UInt64
    set_dictionary_local : UInt64
    get_dictionary_resource : UInt64
    set_dictionary_resource : UInt64
    write : UInt64
    generate_unused_lookup_key : UInt64
    clone : UInt64
    get_document_type : UInt64
    write1 : UInt64
  end

  IXpsOMPage1_GUID = "305b60ef-6892-4dda-9cbb-3aa65974508a"
  IID_IXpsOMPage1 = LibC::GUID.new(0x305b60ef_u32, 0x6892_u16, 0x4dda_u16, StaticArray[0x9c_u8, 0xbb_u8, 0x3a_u8, 0xa6_u8, 0x59_u8, 0x74_u8, 0x50_u8, 0x8a_u8])
  struct IXpsOMPage1
    lpVtbl : IXpsOMPage1VTbl*
  end

  struct IXpsDocumentPackageTargetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_xps_om_package_writer : UInt64
    get_xps_om_factory : UInt64
    get_xps_type : UInt64
  end

  IXpsDocumentPackageTarget_GUID = "3b0b6d38-53ad-41da-b212-d37637a6714e"
  IID_IXpsDocumentPackageTarget = LibC::GUID.new(0x3b0b6d38_u32, 0x53ad_u16, 0x41da_u16, StaticArray[0xb2_u8, 0x12_u8, 0xd3_u8, 0x76_u8, 0x37_u8, 0xa6_u8, 0x71_u8, 0x4e_u8])
  struct IXpsDocumentPackageTarget
    lpVtbl : IXpsDocumentPackageTargetVTbl*
  end

  struct IXpsOMRemoteDictionaryResource1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    set_part_name : UInt64
    get_dictionary : UInt64
    set_dictionary : UInt64
    get_document_type : UInt64
    write1 : UInt64
  end

  IXpsOMRemoteDictionaryResource1_GUID = "bf8fc1d4-9d46-4141-ba5f-94bb9250d041"
  IID_IXpsOMRemoteDictionaryResource1 = LibC::GUID.new(0xbf8fc1d4_u32, 0x9d46_u16, 0x4141_u16, StaticArray[0xba_u8, 0x5f_u8, 0x94_u8, 0xbb_u8, 0x92_u8, 0x50_u8, 0xd0_u8, 0x41_u8])
  struct IXpsOMRemoteDictionaryResource1
    lpVtbl : IXpsOMRemoteDictionaryResource1VTbl*
  end

  struct IXpsOMPackageWriter3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_new_document : UInt64
    add_page : UInt64
    add_resource : UInt64
    close : UInt64
    is_closed : UInt64
    add_model_texture : UInt64
    set_model_print_ticket : UInt64
  end

  IXpsOMPackageWriter3D_GUID = "e8a45033-640e-43fa-9bdf-fddeaa31c6a0"
  IID_IXpsOMPackageWriter3D = LibC::GUID.new(0xe8a45033_u32, 0x640e_u16, 0x43fa_u16, StaticArray[0x9b_u8, 0xdf_u8, 0xfd_u8, 0xde_u8, 0xaa_u8, 0x31_u8, 0xc6_u8, 0xa0_u8])
  struct IXpsOMPackageWriter3D
    lpVtbl : IXpsOMPackageWriter3DVTbl*
  end

  struct IXpsDocumentPackageTarget3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_xps_om_package_writer3_d : UInt64
    get_xps_om_factory : UInt64
  end

  IXpsDocumentPackageTarget3D_GUID = "60ba71b8-3101-4984-9199-f4ea775ff01d"
  IID_IXpsDocumentPackageTarget3D = LibC::GUID.new(0x60ba71b8_u32, 0x3101_u16, 0x4984_u16, StaticArray[0x91_u8, 0x99_u8, 0xf4_u8, 0xea_u8, 0x77_u8, 0x5f_u8, 0xf0_u8, 0x1d_u8])
  struct IXpsDocumentPackageTarget3D
    lpVtbl : IXpsDocumentPackageTarget3DVTbl*
  end

  struct IXpsSigningOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_signature_id : UInt64
    set_signature_id : UInt64
    get_signature_method : UInt64
    set_signature_method : UInt64
    get_digest_method : UInt64
    set_digest_method : UInt64
    get_signature_part_name : UInt64
    set_signature_part_name : UInt64
    get_policy : UInt64
    set_policy : UInt64
    get_signing_time_format : UInt64
    set_signing_time_format : UInt64
    get_custom_objects : UInt64
    get_custom_references : UInt64
    get_certificate_set : UInt64
    get_flags : UInt64
    set_flags : UInt64
  end

  IXpsSigningOptions_GUID = "7718eae4-3215-49be-af5b-594fef7fcfa6"
  IID_IXpsSigningOptions = LibC::GUID.new(0x7718eae4_u32, 0x3215_u16, 0x49be_u16, StaticArray[0xaf_u8, 0x5b_u8, 0x59_u8, 0x4f_u8, 0xef_u8, 0x7f_u8, 0xcf_u8, 0xa6_u8])
  struct IXpsSigningOptions
    lpVtbl : IXpsSigningOptionsVTbl*
  end

  struct IXpsSignatureCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    remove_at : UInt64
  end

  IXpsSignatureCollection_GUID = "a2d1d95d-add2-4dff-ab27-6b9c645ff322"
  IID_IXpsSignatureCollection = LibC::GUID.new(0xa2d1d95d_u32, 0xadd2_u16, 0x4dff_u16, StaticArray[0xab_u8, 0x27_u8, 0x6b_u8, 0x9c_u8, 0x64_u8, 0x5f_u8, 0xf3_u8, 0x22_u8])
  struct IXpsSignatureCollection
    lpVtbl : IXpsSignatureCollectionVTbl*
  end

  struct IXpsSignatureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_signature_id : UInt64
    get_signature_value : UInt64
    get_certificate_enumerator : UInt64
    get_signing_time : UInt64
    get_signing_time_format : UInt64
    get_signature_part_name : UInt64
    verify : UInt64
    get_policy : UInt64
    get_custom_object_enumerator : UInt64
    get_custom_reference_enumerator : UInt64
    get_signature_xml : UInt64
    set_signature_xml : UInt64
  end

  IXpsSignature_GUID = "6ae4c93e-1ade-42fb-898b-3a5658284857"
  IID_IXpsSignature = LibC::GUID.new(0x6ae4c93e_u32, 0x1ade_u16, 0x42fb_u16, StaticArray[0x89_u8, 0x8b_u8, 0x3a_u8, 0x56_u8, 0x58_u8, 0x28_u8, 0x48_u8, 0x57_u8])
  struct IXpsSignature
    lpVtbl : IXpsSignatureVTbl*
  end

  struct IXpsSignatureBlockCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    remove_at : UInt64
  end

  IXpsSignatureBlockCollection_GUID = "23397050-fe99-467a-8dce-9237f074ffe4"
  IID_IXpsSignatureBlockCollection = LibC::GUID.new(0x23397050_u32, 0xfe99_u16, 0x467a_u16, StaticArray[0x8d_u8, 0xce_u8, 0x92_u8, 0x37_u8, 0xf0_u8, 0x74_u8, 0xff_u8, 0xe4_u8])
  struct IXpsSignatureBlockCollection
    lpVtbl : IXpsSignatureBlockCollectionVTbl*
  end

  struct IXpsSignatureBlockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_requests : UInt64
    get_part_name : UInt64
    get_document_index : UInt64
    get_document_name : UInt64
    create_request : UInt64
  end

  IXpsSignatureBlock_GUID = "151fac09-0b97-4ac6-a323-5e4297d4322b"
  IID_IXpsSignatureBlock = LibC::GUID.new(0x151fac09_u32, 0xb97_u16, 0x4ac6_u16, StaticArray[0xa3_u8, 0x23_u8, 0x5e_u8, 0x42_u8, 0x97_u8, 0xd4_u8, 0x32_u8, 0x2b_u8])
  struct IXpsSignatureBlock
    lpVtbl : IXpsSignatureBlockVTbl*
  end

  struct IXpsSignatureRequestCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    remove_at : UInt64
  end

  IXpsSignatureRequestCollection_GUID = "f0253e68-9f19-412e-9b4f-54d3b0ac6cd9"
  IID_IXpsSignatureRequestCollection = LibC::GUID.new(0xf0253e68_u32, 0x9f19_u16, 0x412e_u16, StaticArray[0x9b_u8, 0x4f_u8, 0x54_u8, 0xd3_u8, 0xb0_u8, 0xac_u8, 0x6c_u8, 0xd9_u8])
  struct IXpsSignatureRequestCollection
    lpVtbl : IXpsSignatureRequestCollectionVTbl*
  end

  struct IXpsSignatureRequestVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_intent : UInt64
    set_intent : UInt64
    get_requested_signer : UInt64
    set_requested_signer : UInt64
    get_request_sign_by_date : UInt64
    set_request_sign_by_date : UInt64
    get_signing_locale : UInt64
    set_signing_locale : UInt64
    get_spot_location : UInt64
    set_spot_location : UInt64
    get_request_id : UInt64
    get_signature : UInt64
  end

  IXpsSignatureRequest_GUID = "ac58950b-7208-4b2d-b2c4-951083d3b8eb"
  IID_IXpsSignatureRequest = LibC::GUID.new(0xac58950b_u32, 0x7208_u16, 0x4b2d_u16, StaticArray[0xb2_u8, 0xc4_u8, 0x95_u8, 0x10_u8, 0x83_u8, 0xd3_u8, 0xb8_u8, 0xeb_u8])
  struct IXpsSignatureRequest
    lpVtbl : IXpsSignatureRequestVTbl*
  end

  struct IXpsSignatureManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_package_file : UInt64
    load_package_stream : UInt64
    sign : UInt64
    get_signature_origin_part_name : UInt64
    set_signature_origin_part_name : UInt64
    get_signatures : UInt64
    add_signature_block : UInt64
    get_signature_blocks : UInt64
    create_signing_options : UInt64
    save_package_to_file : UInt64
    save_package_to_stream : UInt64
  end

  IXpsSignatureManager_GUID = "d3e8d338-fdc4-4afc-80b5-d532a1782ee1"
  IID_IXpsSignatureManager = LibC::GUID.new(0xd3e8d338_u32, 0xfdc4_u16, 0x4afc_u16, StaticArray[0x80_u8, 0xb5_u8, 0xd5_u8, 0x32_u8, 0xa1_u8, 0x78_u8, 0x2e_u8, 0xe1_u8])
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
struct LibWin32::IXpsOMShareable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
end
struct LibWin32::IXpsOMVisual
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_transform(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def get_transform_local(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def set_transform_local(matrixtransform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(matrixtransform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_clip_geometry(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_local(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def set_clip_geometry_local(clipgeometry : IXpsOMGeometry) : HRESULT
    @lpVtbl.value.set_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_clip_geometry_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_opacity_mask_brush(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def set_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_opacity_mask_brush_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlink : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlink)
  end
  def set_is_hyperlink_target(ishyperlink : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlink)
  end
  def get_hyperlink_navigate_uri(hyperlinkuri : IUri*) : HRESULT
    @lpVtbl.value.get_hyperlink_navigate_uri.unsafe_as(Proc(IUri*, HRESULT)).call(hyperlinkuri)
  end
  def set_hyperlink_navigate_uri(hyperlinkuri : IUri) : HRESULT
    @lpVtbl.value.set_hyperlink_navigate_uri.unsafe_as(Proc(IUri, HRESULT)).call(hyperlinkuri)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
end
struct LibWin32::IXpsOMPart
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
end
struct LibWin32::IXpsOMGlyphsEditor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def apply_edits : HRESULT
    @lpVtbl.value.apply_edits.unsafe_as(Proc(HRESULT)).call
  end
  def get_unicode_string(unicodestring : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_unicode_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(unicodestring)
  end
  def set_unicode_string(unicodestring : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_unicode_string.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(unicodestring)
  end
  def get_glyph_index_count(indexcount : UInt32*) : HRESULT
    @lpVtbl.value.get_glyph_index_count.unsafe_as(Proc(UInt32*, HRESULT)).call(indexcount)
  end
  def get_glyph_indices(indexcount : UInt32*, glyphindices : XPS_GLYPH_INDEX*) : HRESULT
    @lpVtbl.value.get_glyph_indices.unsafe_as(Proc(UInt32*, XPS_GLYPH_INDEX*, HRESULT)).call(indexcount, glyphindices)
  end
  def set_glyph_indices(indexcount : UInt32, glyphindices : XPS_GLYPH_INDEX*) : HRESULT
    @lpVtbl.value.set_glyph_indices.unsafe_as(Proc(UInt32, XPS_GLYPH_INDEX*, HRESULT)).call(indexcount, glyphindices)
  end
  def get_glyph_mapping_count(glyphmappingcount : UInt32*) : HRESULT
    @lpVtbl.value.get_glyph_mapping_count.unsafe_as(Proc(UInt32*, HRESULT)).call(glyphmappingcount)
  end
  def get_glyph_mappings(glyphmappingcount : UInt32*, glyphmappings : XPS_GLYPH_MAPPING*) : HRESULT
    @lpVtbl.value.get_glyph_mappings.unsafe_as(Proc(UInt32*, XPS_GLYPH_MAPPING*, HRESULT)).call(glyphmappingcount, glyphmappings)
  end
  def set_glyph_mappings(glyphmappingcount : UInt32, glyphmappings : XPS_GLYPH_MAPPING*) : HRESULT
    @lpVtbl.value.set_glyph_mappings.unsafe_as(Proc(UInt32, XPS_GLYPH_MAPPING*, HRESULT)).call(glyphmappingcount, glyphmappings)
  end
  def get_prohibited_caret_stop_count(prohibitedcaretstopcount : UInt32*) : HRESULT
    @lpVtbl.value.get_prohibited_caret_stop_count.unsafe_as(Proc(UInt32*, HRESULT)).call(prohibitedcaretstopcount)
  end
  def get_prohibited_caret_stops(count : UInt32*, prohibitedcaretstops : UInt32*) : HRESULT
    @lpVtbl.value.get_prohibited_caret_stops.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(count, prohibitedcaretstops)
  end
  def set_prohibited_caret_stops(count : UInt32, prohibitedcaretstops : UInt32*) : HRESULT
    @lpVtbl.value.set_prohibited_caret_stops.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(count, prohibitedcaretstops)
  end
  def get_bidi_level(bidilevel : UInt32*) : HRESULT
    @lpVtbl.value.get_bidi_level.unsafe_as(Proc(UInt32*, HRESULT)).call(bidilevel)
  end
  def set_bidi_level(bidilevel : UInt32) : HRESULT
    @lpVtbl.value.set_bidi_level.unsafe_as(Proc(UInt32, HRESULT)).call(bidilevel)
  end
  def get_is_sideways(issideways : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_sideways.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(issideways)
  end
  def set_is_sideways(issideways : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_sideways.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(issideways)
  end
  def get_device_font_name(devicefontname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_device_font_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(devicefontname)
  end
  def set_device_font_name(devicefontname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_device_font_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(devicefontname)
  end
end
struct LibWin32::IXpsOMGlyphs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_transform(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def get_transform_local(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def set_transform_local(matrixtransform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(matrixtransform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_clip_geometry(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_local(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def set_clip_geometry_local(clipgeometry : IXpsOMGeometry) : HRESULT
    @lpVtbl.value.set_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_clip_geometry_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_opacity_mask_brush(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def set_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_opacity_mask_brush_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlink : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlink)
  end
  def set_is_hyperlink_target(ishyperlink : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlink)
  end
  def get_hyperlink_navigate_uri(hyperlinkuri : IUri*) : HRESULT
    @lpVtbl.value.get_hyperlink_navigate_uri.unsafe_as(Proc(IUri*, HRESULT)).call(hyperlinkuri)
  end
  def set_hyperlink_navigate_uri(hyperlinkuri : IUri) : HRESULT
    @lpVtbl.value.set_hyperlink_navigate_uri.unsafe_as(Proc(IUri, HRESULT)).call(hyperlinkuri)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_unicode_string(unicodestring : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_unicode_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(unicodestring)
  end
  def get_glyph_index_count(indexcount : UInt32*) : HRESULT
    @lpVtbl.value.get_glyph_index_count.unsafe_as(Proc(UInt32*, HRESULT)).call(indexcount)
  end
  def get_glyph_indices(indexcount : UInt32*, glyphindices : XPS_GLYPH_INDEX*) : HRESULT
    @lpVtbl.value.get_glyph_indices.unsafe_as(Proc(UInt32*, XPS_GLYPH_INDEX*, HRESULT)).call(indexcount, glyphindices)
  end
  def get_glyph_mapping_count(glyphmappingcount : UInt32*) : HRESULT
    @lpVtbl.value.get_glyph_mapping_count.unsafe_as(Proc(UInt32*, HRESULT)).call(glyphmappingcount)
  end
  def get_glyph_mappings(glyphmappingcount : UInt32*, glyphmappings : XPS_GLYPH_MAPPING*) : HRESULT
    @lpVtbl.value.get_glyph_mappings.unsafe_as(Proc(UInt32*, XPS_GLYPH_MAPPING*, HRESULT)).call(glyphmappingcount, glyphmappings)
  end
  def get_prohibited_caret_stop_count(prohibitedcaretstopcount : UInt32*) : HRESULT
    @lpVtbl.value.get_prohibited_caret_stop_count.unsafe_as(Proc(UInt32*, HRESULT)).call(prohibitedcaretstopcount)
  end
  def get_prohibited_caret_stops(prohibitedcaretstopcount : UInt32*, prohibitedcaretstops : UInt32*) : HRESULT
    @lpVtbl.value.get_prohibited_caret_stops.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(prohibitedcaretstopcount, prohibitedcaretstops)
  end
  def get_bidi_level(bidilevel : UInt32*) : HRESULT
    @lpVtbl.value.get_bidi_level.unsafe_as(Proc(UInt32*, HRESULT)).call(bidilevel)
  end
  def get_is_sideways(issideways : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_sideways.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(issideways)
  end
  def get_device_font_name(devicefontname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_device_font_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(devicefontname)
  end
  def get_style_simulations(stylesimulations : XPS_STYLE_SIMULATION*) : HRESULT
    @lpVtbl.value.get_style_simulations.unsafe_as(Proc(XPS_STYLE_SIMULATION*, HRESULT)).call(stylesimulations)
  end
  def set_style_simulations(stylesimulations : XPS_STYLE_SIMULATION) : HRESULT
    @lpVtbl.value.set_style_simulations.unsafe_as(Proc(XPS_STYLE_SIMULATION, HRESULT)).call(stylesimulations)
  end
  def get_origin(origin : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_origin.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(origin)
  end
  def set_origin(origin : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_origin.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(origin)
  end
  def get_font_rendering_em_size(fontrenderingemsize : Float32*) : HRESULT
    @lpVtbl.value.get_font_rendering_em_size.unsafe_as(Proc(Float32*, HRESULT)).call(fontrenderingemsize)
  end
  def set_font_rendering_em_size(fontrenderingemsize : Float32) : HRESULT
    @lpVtbl.value.set_font_rendering_em_size.unsafe_as(Proc(Float32, HRESULT)).call(fontrenderingemsize)
  end
  def get_font_resource(fontresource : IXpsOMFontResource*) : HRESULT
    @lpVtbl.value.get_font_resource.unsafe_as(Proc(IXpsOMFontResource*, HRESULT)).call(fontresource)
  end
  def set_font_resource(fontresource : IXpsOMFontResource) : HRESULT
    @lpVtbl.value.set_font_resource.unsafe_as(Proc(IXpsOMFontResource, HRESULT)).call(fontresource)
  end
  def get_font_face_index(fontfaceindex : Int16*) : HRESULT
    @lpVtbl.value.get_font_face_index.unsafe_as(Proc(Int16*, HRESULT)).call(fontfaceindex)
  end
  def set_font_face_index(fontfaceindex : Int16) : HRESULT
    @lpVtbl.value.set_font_face_index.unsafe_as(Proc(Int16, HRESULT)).call(fontfaceindex)
  end
  def get_fill_brush(fillbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_fill_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(fillbrush)
  end
  def get_fill_brush_local(fillbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_fill_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(fillbrush)
  end
  def set_fill_brush_local(fillbrush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_fill_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(fillbrush)
  end
  def get_fill_brush_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_fill_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_fill_brush_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_fill_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_glyphs_editor(editor : IXpsOMGlyphsEditor*) : HRESULT
    @lpVtbl.value.get_glyphs_editor.unsafe_as(Proc(IXpsOMGlyphsEditor*, HRESULT)).call(editor)
  end
  def clone(glyphs : IXpsOMGlyphs*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMGlyphs*, HRESULT)).call(glyphs)
  end
end
struct LibWin32::IXpsOMDashCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, dash : XPS_DASH*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, XPS_DASH*, HRESULT)).call(index, dash)
  end
  def insert_at(index : UInt32, dash : XPS_DASH*) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, XPS_DASH*, HRESULT)).call(index, dash)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, dash : XPS_DASH*) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, XPS_DASH*, HRESULT)).call(index, dash)
  end
  def append(dash : XPS_DASH*) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(XPS_DASH*, HRESULT)).call(dash)
  end
end
struct LibWin32::IXpsOMMatrixTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_matrix(matrix : XPS_MATRIX*) : HRESULT
    @lpVtbl.value.get_matrix.unsafe_as(Proc(XPS_MATRIX*, HRESULT)).call(matrix)
  end
  def set_matrix(matrix : XPS_MATRIX*) : HRESULT
    @lpVtbl.value.set_matrix.unsafe_as(Proc(XPS_MATRIX*, HRESULT)).call(matrix)
  end
  def clone(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
end
struct LibWin32::IXpsOMGeometry
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_figures(figures : IXpsOMGeometryFigureCollection*) : HRESULT
    @lpVtbl.value.get_figures.unsafe_as(Proc(IXpsOMGeometryFigureCollection*, HRESULT)).call(figures)
  end
  def get_fill_rule(fillrule : XPS_FILL_RULE*) : HRESULT
    @lpVtbl.value.get_fill_rule.unsafe_as(Proc(XPS_FILL_RULE*, HRESULT)).call(fillrule)
  end
  def set_fill_rule(fillrule : XPS_FILL_RULE) : HRESULT
    @lpVtbl.value.set_fill_rule.unsafe_as(Proc(XPS_FILL_RULE, HRESULT)).call(fillrule)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(lookup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lookup)
  end
  def set_transform_lookup(lookup : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lookup)
  end
  def clone(geometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(geometry)
  end
end
struct LibWin32::IXpsOMGeometryFigure
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(owner)
  end
  def get_segment_data(datacount : UInt32*, segmentdata : Float32*) : HRESULT
    @lpVtbl.value.get_segment_data.unsafe_as(Proc(UInt32*, Float32*, HRESULT)).call(datacount, segmentdata)
  end
  def get_segment_types(segmentcount : UInt32*, segmenttypes : XPS_SEGMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_segment_types.unsafe_as(Proc(UInt32*, XPS_SEGMENT_TYPE*, HRESULT)).call(segmentcount, segmenttypes)
  end
  def get_segment_strokes(segmentcount : UInt32*, segmentstrokes : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_segment_strokes.unsafe_as(Proc(UInt32*, LibC::BOOL*, HRESULT)).call(segmentcount, segmentstrokes)
  end
  def set_segments(segmentcount : UInt32, segmentdatacount : UInt32, segmenttypes : XPS_SEGMENT_TYPE*, segmentdata : Float32*, segmentstrokes : LibC::BOOL*) : HRESULT
    @lpVtbl.value.set_segments.unsafe_as(Proc(UInt32, UInt32, XPS_SEGMENT_TYPE*, Float32*, LibC::BOOL*, HRESULT)).call(segmentcount, segmentdatacount, segmenttypes, segmentdata, segmentstrokes)
  end
  def get_start_point(startpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_start_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(startpoint)
  end
  def set_start_point(startpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_start_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(startpoint)
  end
  def get_is_closed(isclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_closed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isclosed)
  end
  def set_is_closed(isclosed : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_closed.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(isclosed)
  end
  def get_is_filled(isfilled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_filled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isfilled)
  end
  def set_is_filled(isfilled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_filled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(isfilled)
  end
  def get_segment_count(segmentcount : UInt32*) : HRESULT
    @lpVtbl.value.get_segment_count.unsafe_as(Proc(UInt32*, HRESULT)).call(segmentcount)
  end
  def get_segment_data_count(segmentdatacount : UInt32*) : HRESULT
    @lpVtbl.value.get_segment_data_count.unsafe_as(Proc(UInt32*, HRESULT)).call(segmentdatacount)
  end
  def get_segment_stroke_pattern(segmentstrokepattern : XPS_SEGMENT_STROKE_PATTERN*) : HRESULT
    @lpVtbl.value.get_segment_stroke_pattern.unsafe_as(Proc(XPS_SEGMENT_STROKE_PATTERN*, HRESULT)).call(segmentstrokepattern)
  end
  def clone(geometryfigure : IXpsOMGeometryFigure*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMGeometryFigure*, HRESULT)).call(geometryfigure)
  end
end
struct LibWin32::IXpsOMGeometryFigureCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, geometryfigure : IXpsOMGeometryFigure*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMGeometryFigure*, HRESULT)).call(index, geometryfigure)
  end
  def insert_at(index : UInt32, geometryfigure : IXpsOMGeometryFigure) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMGeometryFigure, HRESULT)).call(index, geometryfigure)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, geometryfigure : IXpsOMGeometryFigure) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMGeometryFigure, HRESULT)).call(index, geometryfigure)
  end
  def append(geometryfigure : IXpsOMGeometryFigure) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMGeometryFigure, HRESULT)).call(geometryfigure)
  end
end
struct LibWin32::IXpsOMPath
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_transform(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def get_transform_local(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def set_transform_local(matrixtransform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(matrixtransform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_clip_geometry(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_local(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def set_clip_geometry_local(clipgeometry : IXpsOMGeometry) : HRESULT
    @lpVtbl.value.set_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_clip_geometry_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_opacity_mask_brush(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def set_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_opacity_mask_brush_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlink : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlink)
  end
  def set_is_hyperlink_target(ishyperlink : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlink)
  end
  def get_hyperlink_navigate_uri(hyperlinkuri : IUri*) : HRESULT
    @lpVtbl.value.get_hyperlink_navigate_uri.unsafe_as(Proc(IUri*, HRESULT)).call(hyperlinkuri)
  end
  def set_hyperlink_navigate_uri(hyperlinkuri : IUri) : HRESULT
    @lpVtbl.value.set_hyperlink_navigate_uri.unsafe_as(Proc(IUri, HRESULT)).call(hyperlinkuri)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_geometry(geometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(geometry)
  end
  def get_geometry_local(geometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_geometry_local.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(geometry)
  end
  def set_geometry_local(geometry : IXpsOMGeometry) : HRESULT
    @lpVtbl.value.set_geometry_local.unsafe_as(Proc(IXpsOMGeometry, HRESULT)).call(geometry)
  end
  def get_geometry_lookup(lookup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lookup)
  end
  def set_geometry_lookup(lookup : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lookup)
  end
  def get_accessibility_short_description(shortdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_accessibility_short_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(shortdescription)
  end
  def set_accessibility_short_description(shortdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_accessibility_short_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(shortdescription)
  end
  def get_accessibility_long_description(longdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_accessibility_long_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(longdescription)
  end
  def set_accessibility_long_description(longdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_accessibility_long_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(longdescription)
  end
  def get_snaps_to_pixels(snapstopixels : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_snaps_to_pixels.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(snapstopixels)
  end
  def set_snaps_to_pixels(snapstopixels : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_snaps_to_pixels.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(snapstopixels)
  end
  def get_stroke_brush(brush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_stroke_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(brush)
  end
  def get_stroke_brush_local(brush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_stroke_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(brush)
  end
  def set_stroke_brush_local(brush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_stroke_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(brush)
  end
  def get_stroke_brush_lookup(lookup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_stroke_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lookup)
  end
  def set_stroke_brush_lookup(lookup : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stroke_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lookup)
  end
  def get_stroke_dashes(strokedashes : IXpsOMDashCollection*) : HRESULT
    @lpVtbl.value.get_stroke_dashes.unsafe_as(Proc(IXpsOMDashCollection*, HRESULT)).call(strokedashes)
  end
  def get_stroke_dash_cap(strokedashcap : XPS_DASH_CAP*) : HRESULT
    @lpVtbl.value.get_stroke_dash_cap.unsafe_as(Proc(XPS_DASH_CAP*, HRESULT)).call(strokedashcap)
  end
  def set_stroke_dash_cap(strokedashcap : XPS_DASH_CAP) : HRESULT
    @lpVtbl.value.set_stroke_dash_cap.unsafe_as(Proc(XPS_DASH_CAP, HRESULT)).call(strokedashcap)
  end
  def get_stroke_dash_offset(strokedashoffset : Float32*) : HRESULT
    @lpVtbl.value.get_stroke_dash_offset.unsafe_as(Proc(Float32*, HRESULT)).call(strokedashoffset)
  end
  def set_stroke_dash_offset(strokedashoffset : Float32) : HRESULT
    @lpVtbl.value.set_stroke_dash_offset.unsafe_as(Proc(Float32, HRESULT)).call(strokedashoffset)
  end
  def get_stroke_start_line_cap(strokestartlinecap : XPS_LINE_CAP*) : HRESULT
    @lpVtbl.value.get_stroke_start_line_cap.unsafe_as(Proc(XPS_LINE_CAP*, HRESULT)).call(strokestartlinecap)
  end
  def set_stroke_start_line_cap(strokestartlinecap : XPS_LINE_CAP) : HRESULT
    @lpVtbl.value.set_stroke_start_line_cap.unsafe_as(Proc(XPS_LINE_CAP, HRESULT)).call(strokestartlinecap)
  end
  def get_stroke_end_line_cap(strokeendlinecap : XPS_LINE_CAP*) : HRESULT
    @lpVtbl.value.get_stroke_end_line_cap.unsafe_as(Proc(XPS_LINE_CAP*, HRESULT)).call(strokeendlinecap)
  end
  def set_stroke_end_line_cap(strokeendlinecap : XPS_LINE_CAP) : HRESULT
    @lpVtbl.value.set_stroke_end_line_cap.unsafe_as(Proc(XPS_LINE_CAP, HRESULT)).call(strokeendlinecap)
  end
  def get_stroke_line_join(strokelinejoin : XPS_LINE_JOIN*) : HRESULT
    @lpVtbl.value.get_stroke_line_join.unsafe_as(Proc(XPS_LINE_JOIN*, HRESULT)).call(strokelinejoin)
  end
  def set_stroke_line_join(strokelinejoin : XPS_LINE_JOIN) : HRESULT
    @lpVtbl.value.set_stroke_line_join.unsafe_as(Proc(XPS_LINE_JOIN, HRESULT)).call(strokelinejoin)
  end
  def get_stroke_miter_limit(strokemiterlimit : Float32*) : HRESULT
    @lpVtbl.value.get_stroke_miter_limit.unsafe_as(Proc(Float32*, HRESULT)).call(strokemiterlimit)
  end
  def set_stroke_miter_limit(strokemiterlimit : Float32) : HRESULT
    @lpVtbl.value.set_stroke_miter_limit.unsafe_as(Proc(Float32, HRESULT)).call(strokemiterlimit)
  end
  def get_stroke_thickness(strokethickness : Float32*) : HRESULT
    @lpVtbl.value.get_stroke_thickness.unsafe_as(Proc(Float32*, HRESULT)).call(strokethickness)
  end
  def set_stroke_thickness(strokethickness : Float32) : HRESULT
    @lpVtbl.value.set_stroke_thickness.unsafe_as(Proc(Float32, HRESULT)).call(strokethickness)
  end
  def get_fill_brush(brush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_fill_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(brush)
  end
  def get_fill_brush_local(brush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_fill_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(brush)
  end
  def set_fill_brush_local(brush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_fill_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(brush)
  end
  def get_fill_brush_lookup(lookup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_fill_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lookup)
  end
  def set_fill_brush_lookup(lookup : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_fill_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lookup)
  end
  def clone(path : IXpsOMPath*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMPath*, HRESULT)).call(path)
  end
end
struct LibWin32::IXpsOMBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
end
struct LibWin32::IXpsOMGradientStopCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, stop : IXpsOMGradientStop*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMGradientStop*, HRESULT)).call(index, stop)
  end
  def insert_at(index : UInt32, stop : IXpsOMGradientStop) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMGradientStop, HRESULT)).call(index, stop)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, stop : IXpsOMGradientStop) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMGradientStop, HRESULT)).call(index, stop)
  end
  def append(stop : IXpsOMGradientStop) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMGradientStop, HRESULT)).call(stop)
  end
end
struct LibWin32::IXpsOMSolidColorBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_color(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource*, HRESULT)).call(color, colorprofile)
  end
  def set_color(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.set_color.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, HRESULT)).call(color, colorprofile)
  end
  def clone(solidcolorbrush : IXpsOMSolidColorBrush*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMSolidColorBrush*, HRESULT)).call(solidcolorbrush)
  end
end
struct LibWin32::IXpsOMTileBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def set_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def get_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def set_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def get_tile_mode(tilemode : XPS_TILE_MODE*) : HRESULT
    @lpVtbl.value.get_tile_mode.unsafe_as(Proc(XPS_TILE_MODE*, HRESULT)).call(tilemode)
  end
  def set_tile_mode(tilemode : XPS_TILE_MODE) : HRESULT
    @lpVtbl.value.set_tile_mode.unsafe_as(Proc(XPS_TILE_MODE, HRESULT)).call(tilemode)
  end
end
struct LibWin32::IXpsOMVisualBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def set_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def get_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def set_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def get_tile_mode(tilemode : XPS_TILE_MODE*) : HRESULT
    @lpVtbl.value.get_tile_mode.unsafe_as(Proc(XPS_TILE_MODE*, HRESULT)).call(tilemode)
  end
  def set_tile_mode(tilemode : XPS_TILE_MODE) : HRESULT
    @lpVtbl.value.set_tile_mode.unsafe_as(Proc(XPS_TILE_MODE, HRESULT)).call(tilemode)
  end
  def get_visual(visual : IXpsOMVisual*) : HRESULT
    @lpVtbl.value.get_visual.unsafe_as(Proc(IXpsOMVisual*, HRESULT)).call(visual)
  end
  def get_visual_local(visual : IXpsOMVisual*) : HRESULT
    @lpVtbl.value.get_visual_local.unsafe_as(Proc(IXpsOMVisual*, HRESULT)).call(visual)
  end
  def set_visual_local(visual : IXpsOMVisual) : HRESULT
    @lpVtbl.value.set_visual_local.unsafe_as(Proc(IXpsOMVisual, HRESULT)).call(visual)
  end
  def get_visual_lookup(lookup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_visual_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lookup)
  end
  def set_visual_lookup(lookup : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_visual_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lookup)
  end
  def clone(visualbrush : IXpsOMVisualBrush*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMVisualBrush*, HRESULT)).call(visualbrush)
  end
end
struct LibWin32::IXpsOMImageBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def set_viewbox(viewbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewbox.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewbox)
  end
  def get_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def set_viewport(viewport : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_viewport.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(viewport)
  end
  def get_tile_mode(tilemode : XPS_TILE_MODE*) : HRESULT
    @lpVtbl.value.get_tile_mode.unsafe_as(Proc(XPS_TILE_MODE*, HRESULT)).call(tilemode)
  end
  def set_tile_mode(tilemode : XPS_TILE_MODE) : HRESULT
    @lpVtbl.value.set_tile_mode.unsafe_as(Proc(XPS_TILE_MODE, HRESULT)).call(tilemode)
  end
  def get_image_resource(imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_image_resource.unsafe_as(Proc(IXpsOMImageResource*, HRESULT)).call(imageresource)
  end
  def set_image_resource(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.set_image_resource.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def get_color_profile_resource(colorprofileresource : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.get_color_profile_resource.unsafe_as(Proc(IXpsOMColorProfileResource*, HRESULT)).call(colorprofileresource)
  end
  def set_color_profile_resource(colorprofileresource : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.set_color_profile_resource.unsafe_as(Proc(IXpsOMColorProfileResource, HRESULT)).call(colorprofileresource)
  end
  def clone(imagebrush : IXpsOMImageBrush*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMImageBrush*, HRESULT)).call(imagebrush)
  end
end
struct LibWin32::IXpsOMGradientStop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IXpsOMGradientBrush*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMGradientBrush*, HRESULT)).call(owner)
  end
  def get_offset(offset : Float32*) : HRESULT
    @lpVtbl.value.get_offset.unsafe_as(Proc(Float32*, HRESULT)).call(offset)
  end
  def set_offset(offset : Float32) : HRESULT
    @lpVtbl.value.set_offset.unsafe_as(Proc(Float32, HRESULT)).call(offset)
  end
  def get_color(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource*, HRESULT)).call(color, colorprofile)
  end
  def set_color(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.set_color.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, HRESULT)).call(color, colorprofile)
  end
  def clone(gradientstop : IXpsOMGradientStop*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMGradientStop*, HRESULT)).call(gradientstop)
  end
end
struct LibWin32::IXpsOMGradientBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_gradient_stops(gradientstops : IXpsOMGradientStopCollection*) : HRESULT
    @lpVtbl.value.get_gradient_stops.unsafe_as(Proc(IXpsOMGradientStopCollection*, HRESULT)).call(gradientstops)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_spread_method(spreadmethod : XPS_SPREAD_METHOD*) : HRESULT
    @lpVtbl.value.get_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD*, HRESULT)).call(spreadmethod)
  end
  def set_spread_method(spreadmethod : XPS_SPREAD_METHOD) : HRESULT
    @lpVtbl.value.set_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD, HRESULT)).call(spreadmethod)
  end
  def get_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION*) : HRESULT
    @lpVtbl.value.get_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION*, HRESULT)).call(colorinterpolationmode)
  end
  def set_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION) : HRESULT
    @lpVtbl.value.set_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION, HRESULT)).call(colorinterpolationmode)
  end
end
struct LibWin32::IXpsOMLinearGradientBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_gradient_stops(gradientstops : IXpsOMGradientStopCollection*) : HRESULT
    @lpVtbl.value.get_gradient_stops.unsafe_as(Proc(IXpsOMGradientStopCollection*, HRESULT)).call(gradientstops)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_spread_method(spreadmethod : XPS_SPREAD_METHOD*) : HRESULT
    @lpVtbl.value.get_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD*, HRESULT)).call(spreadmethod)
  end
  def set_spread_method(spreadmethod : XPS_SPREAD_METHOD) : HRESULT
    @lpVtbl.value.set_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD, HRESULT)).call(spreadmethod)
  end
  def get_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION*) : HRESULT
    @lpVtbl.value.get_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION*, HRESULT)).call(colorinterpolationmode)
  end
  def set_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION) : HRESULT
    @lpVtbl.value.set_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION, HRESULT)).call(colorinterpolationmode)
  end
  def get_start_point(startpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_start_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(startpoint)
  end
  def set_start_point(startpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_start_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(startpoint)
  end
  def get_end_point(endpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_end_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(endpoint)
  end
  def set_end_point(endpoint : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_end_point.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(endpoint)
  end
  def clone(lineargradientbrush : IXpsOMLinearGradientBrush*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMLinearGradientBrush*, HRESULT)).call(lineargradientbrush)
  end
end
struct LibWin32::IXpsOMRadialGradientBrush
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_gradient_stops(gradientstops : IXpsOMGradientStopCollection*) : HRESULT
    @lpVtbl.value.get_gradient_stops.unsafe_as(Proc(IXpsOMGradientStopCollection*, HRESULT)).call(gradientstops)
  end
  def get_transform(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def get_transform_local(transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(transform)
  end
  def set_transform_local(transform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(transform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_spread_method(spreadmethod : XPS_SPREAD_METHOD*) : HRESULT
    @lpVtbl.value.get_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD*, HRESULT)).call(spreadmethod)
  end
  def set_spread_method(spreadmethod : XPS_SPREAD_METHOD) : HRESULT
    @lpVtbl.value.set_spread_method.unsafe_as(Proc(XPS_SPREAD_METHOD, HRESULT)).call(spreadmethod)
  end
  def get_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION*) : HRESULT
    @lpVtbl.value.get_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION*, HRESULT)).call(colorinterpolationmode)
  end
  def set_color_interpolation_mode(colorinterpolationmode : XPS_COLOR_INTERPOLATION) : HRESULT
    @lpVtbl.value.set_color_interpolation_mode.unsafe_as(Proc(XPS_COLOR_INTERPOLATION, HRESULT)).call(colorinterpolationmode)
  end
  def get_center(center : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_center.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(center)
  end
  def set_center(center : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_center.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(center)
  end
  def get_radii_sizes(radiisizes : XPS_SIZE*) : HRESULT
    @lpVtbl.value.get_radii_sizes.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(radiisizes)
  end
  def set_radii_sizes(radiisizes : XPS_SIZE*) : HRESULT
    @lpVtbl.value.set_radii_sizes.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(radiisizes)
  end
  def get_gradient_origin(origin : XPS_POINT*) : HRESULT
    @lpVtbl.value.get_gradient_origin.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(origin)
  end
  def set_gradient_origin(origin : XPS_POINT*) : HRESULT
    @lpVtbl.value.set_gradient_origin.unsafe_as(Proc(XPS_POINT*, HRESULT)).call(origin)
  end
  def clone(radialgradientbrush : IXpsOMRadialGradientBrush*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMRadialGradientBrush*, HRESULT)).call(radialgradientbrush)
  end
end
struct LibWin32::IXpsOMResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
end
struct LibWin32::IXpsOMPartResources
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_font_resources(fontresources : IXpsOMFontResourceCollection*) : HRESULT
    @lpVtbl.value.get_font_resources.unsafe_as(Proc(IXpsOMFontResourceCollection*, HRESULT)).call(fontresources)
  end
  def get_image_resources(imageresources : IXpsOMImageResourceCollection*) : HRESULT
    @lpVtbl.value.get_image_resources.unsafe_as(Proc(IXpsOMImageResourceCollection*, HRESULT)).call(imageresources)
  end
  def get_color_profile_resources(colorprofileresources : IXpsOMColorProfileResourceCollection*) : HRESULT
    @lpVtbl.value.get_color_profile_resources.unsafe_as(Proc(IXpsOMColorProfileResourceCollection*, HRESULT)).call(colorprofileresources)
  end
  def get_remote_dictionary_resources(dictionaryresources : IXpsOMRemoteDictionaryResourceCollection*) : HRESULT
    @lpVtbl.value.get_remote_dictionary_resources.unsafe_as(Proc(IXpsOMRemoteDictionaryResourceCollection*, HRESULT)).call(dictionaryresources)
  end
end
struct LibWin32::IXpsOMDictionary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, key : LibC::LPWSTR*, entry : IXpsOMShareable*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, LibC::LPWSTR*, IXpsOMShareable*, HRESULT)).call(index, key, entry)
  end
  def get_by_key(key : LibC::LPWSTR, beforeentry : IXpsOMShareable, entry : IXpsOMShareable*) : HRESULT
    @lpVtbl.value.get_by_key.unsafe_as(Proc(LibC::LPWSTR, IXpsOMShareable, IXpsOMShareable*, HRESULT)).call(key, beforeentry, entry)
  end
  def get_index(entry : IXpsOMShareable, index : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(IXpsOMShareable, UInt32*, HRESULT)).call(entry, index)
  end
  def append(key : LibC::LPWSTR, entry : IXpsOMShareable) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(LibC::LPWSTR, IXpsOMShareable, HRESULT)).call(key, entry)
  end
  def insert_at(index : UInt32, key : LibC::LPWSTR, entry : IXpsOMShareable) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, LibC::LPWSTR, IXpsOMShareable, HRESULT)).call(index, key, entry)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, key : LibC::LPWSTR, entry : IXpsOMShareable) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, LibC::LPWSTR, IXpsOMShareable, HRESULT)).call(index, key, entry)
  end
  def clone(dictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(dictionary)
  end
end
struct LibWin32::IXpsOMFontResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_stream(readerstream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(readerstream)
  end
  def set_content(sourcestream : IStream, embeddingoption : XPS_FONT_EMBEDDING, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, XPS_FONT_EMBEDDING, IOpcPartUri, HRESULT)).call(sourcestream, embeddingoption, partname)
  end
  def get_embedding_option(embeddingoption : XPS_FONT_EMBEDDING*) : HRESULT
    @lpVtbl.value.get_embedding_option.unsafe_as(Proc(XPS_FONT_EMBEDDING*, HRESULT)).call(embeddingoption)
  end
end
struct LibWin32::IXpsOMFontResourceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, value : IXpsOMFontResource*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMFontResource*, HRESULT)).call(index, value)
  end
  def set_at(index : UInt32, value : IXpsOMFontResource) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMFontResource, HRESULT)).call(index, value)
  end
  def insert_at(index : UInt32, value : IXpsOMFontResource) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMFontResource, HRESULT)).call(index, value)
  end
  def append(value : IXpsOMFontResource) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMFontResource, HRESULT)).call(value)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def get_by_part_name(partname : IOpcPartUri, part : IXpsOMFontResource*) : HRESULT
    @lpVtbl.value.get_by_part_name.unsafe_as(Proc(IOpcPartUri, IXpsOMFontResource*, HRESULT)).call(partname, part)
  end
end
struct LibWin32::IXpsOMImageResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_stream(readerstream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(readerstream)
  end
  def set_content(sourcestream : IStream, imagetype : XPS_IMAGE_TYPE, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, XPS_IMAGE_TYPE, IOpcPartUri, HRESULT)).call(sourcestream, imagetype, partname)
  end
  def get_image_type(imagetype : XPS_IMAGE_TYPE*) : HRESULT
    @lpVtbl.value.get_image_type.unsafe_as(Proc(XPS_IMAGE_TYPE*, HRESULT)).call(imagetype)
  end
end
struct LibWin32::IXpsOMImageResourceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, object : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMImageResource*, HRESULT)).call(index, object)
  end
  def insert_at(index : UInt32, object : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMImageResource, HRESULT)).call(index, object)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, object : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMImageResource, HRESULT)).call(index, object)
  end
  def append(object : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(object)
  end
  def get_by_part_name(partname : IOpcPartUri, part : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_by_part_name.unsafe_as(Proc(IOpcPartUri, IXpsOMImageResource*, HRESULT)).call(partname, part)
  end
end
struct LibWin32::IXpsOMColorProfileResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def set_content(sourcestream : IStream, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, IOpcPartUri, HRESULT)).call(sourcestream, partname)
  end
end
struct LibWin32::IXpsOMColorProfileResourceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, object : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMColorProfileResource*, HRESULT)).call(index, object)
  end
  def insert_at(index : UInt32, object : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMColorProfileResource, HRESULT)).call(index, object)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, object : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMColorProfileResource, HRESULT)).call(index, object)
  end
  def append(object : IXpsOMColorProfileResource) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMColorProfileResource, HRESULT)).call(object)
  end
  def get_by_part_name(partname : IOpcPartUri, part : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.get_by_part_name.unsafe_as(Proc(IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)).call(partname, part)
  end
end
struct LibWin32::IXpsOMPrintTicketResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def set_content(sourcestream : IStream, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, IOpcPartUri, HRESULT)).call(sourcestream, partname)
  end
end
struct LibWin32::IXpsOMRemoteDictionaryResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_dictionary(dictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(dictionary)
  end
  def set_dictionary(dictionary : IXpsOMDictionary) : HRESULT
    @lpVtbl.value.set_dictionary.unsafe_as(Proc(IXpsOMDictionary, HRESULT)).call(dictionary)
  end
end
struct LibWin32::IXpsOMRemoteDictionaryResourceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, object : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMRemoteDictionaryResource*, HRESULT)).call(index, object)
  end
  def insert_at(index : UInt32, object : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMRemoteDictionaryResource, HRESULT)).call(index, object)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, object : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMRemoteDictionaryResource, HRESULT)).call(index, object)
  end
  def append(object : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMRemoteDictionaryResource, HRESULT)).call(object)
  end
  def get_by_part_name(partname : IOpcPartUri, remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.get_by_part_name.unsafe_as(Proc(IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)).call(partname, remotedictionaryresource)
  end
end
struct LibWin32::IXpsOMSignatureBlockResourceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, signatureblockresource : IXpsOMSignatureBlockResource*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMSignatureBlockResource*, HRESULT)).call(index, signatureblockresource)
  end
  def insert_at(index : UInt32, signatureblockresource : IXpsOMSignatureBlockResource) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMSignatureBlockResource, HRESULT)).call(index, signatureblockresource)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, signatureblockresource : IXpsOMSignatureBlockResource) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMSignatureBlockResource, HRESULT)).call(index, signatureblockresource)
  end
  def append(signatureblockresource : IXpsOMSignatureBlockResource) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMSignatureBlockResource, HRESULT)).call(signatureblockresource)
  end
  def get_by_part_name(partname : IOpcPartUri, signatureblockresource : IXpsOMSignatureBlockResource*) : HRESULT
    @lpVtbl.value.get_by_part_name.unsafe_as(Proc(IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)).call(partname, signatureblockresource)
  end
end
struct LibWin32::IXpsOMDocumentStructureResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(owner : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMDocument*, HRESULT)).call(owner)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def set_content(sourcestream : IStream, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, IOpcPartUri, HRESULT)).call(sourcestream, partname)
  end
end
struct LibWin32::IXpsOMStoryFragmentsResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(owner : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMPageReference*, HRESULT)).call(owner)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def set_content(sourcestream : IStream, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, IOpcPartUri, HRESULT)).call(sourcestream, partname)
  end
end
struct LibWin32::IXpsOMSignatureBlockResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(owner : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMDocument*, HRESULT)).call(owner)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def set_content(sourcestream : IStream, partname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IStream, IOpcPartUri, HRESULT)).call(sourcestream, partname)
  end
end
struct LibWin32::IXpsOMVisualCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, object : IXpsOMVisual*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMVisual*, HRESULT)).call(index, object)
  end
  def insert_at(index : UInt32, object : IXpsOMVisual) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMVisual, HRESULT)).call(index, object)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, object : IXpsOMVisual) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMVisual, HRESULT)).call(index, object)
  end
  def append(object : IXpsOMVisual) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMVisual, HRESULT)).call(object)
  end
end
struct LibWin32::IXpsOMCanvas
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(owner : IUnknown*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IUnknown*, HRESULT)).call(owner)
  end
  def get_type(type : XPS_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(XPS_OBJECT_TYPE*, HRESULT)).call(type)
  end
  def get_transform(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def get_transform_local(matrixtransform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.get_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def set_transform_local(matrixtransform : IXpsOMMatrixTransform) : HRESULT
    @lpVtbl.value.set_transform_local.unsafe_as(Proc(IXpsOMMatrixTransform, HRESULT)).call(matrixtransform)
  end
  def get_transform_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_transform_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_transform_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_transform_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_clip_geometry(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_local(clipgeometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.get_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(clipgeometry)
  end
  def set_clip_geometry_local(clipgeometry : IXpsOMGeometry) : HRESULT
    @lpVtbl.value.set_clip_geometry_local.unsafe_as(Proc(IXpsOMGeometry, HRESULT)).call(clipgeometry)
  end
  def get_clip_geometry_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_clip_geometry_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_clip_geometry_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_opacity(opacity : Float32*) : HRESULT
    @lpVtbl.value.get_opacity.unsafe_as(Proc(Float32*, HRESULT)).call(opacity)
  end
  def set_opacity(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def get_opacity_mask_brush(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush*, HRESULT)).call(opacitymaskbrush)
  end
  def set_opacity_mask_brush_local(opacitymaskbrush : IXpsOMBrush) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_local.unsafe_as(Proc(IXpsOMBrush, HRESULT)).call(opacitymaskbrush)
  end
  def get_opacity_mask_brush_lookup(key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(key)
  end
  def set_opacity_mask_brush_lookup(key : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_opacity_mask_brush_lookup.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(key)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlink : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlink)
  end
  def set_is_hyperlink_target(ishyperlink : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlink)
  end
  def get_hyperlink_navigate_uri(hyperlinkuri : IUri*) : HRESULT
    @lpVtbl.value.get_hyperlink_navigate_uri.unsafe_as(Proc(IUri*, HRESULT)).call(hyperlinkuri)
  end
  def set_hyperlink_navigate_uri(hyperlinkuri : IUri) : HRESULT
    @lpVtbl.value.set_hyperlink_navigate_uri.unsafe_as(Proc(IUri, HRESULT)).call(hyperlinkuri)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_visuals(visuals : IXpsOMVisualCollection*) : HRESULT
    @lpVtbl.value.get_visuals.unsafe_as(Proc(IXpsOMVisualCollection*, HRESULT)).call(visuals)
  end
  def get_use_aliased_edge_mode(usealiasededgemode : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_use_aliased_edge_mode.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(usealiasededgemode)
  end
  def set_use_aliased_edge_mode(usealiasededgemode : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_use_aliased_edge_mode.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(usealiasededgemode)
  end
  def get_accessibility_short_description(shortdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_accessibility_short_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(shortdescription)
  end
  def set_accessibility_short_description(shortdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_accessibility_short_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(shortdescription)
  end
  def get_accessibility_long_description(longdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_accessibility_long_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(longdescription)
  end
  def set_accessibility_long_description(longdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_accessibility_long_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(longdescription)
  end
  def get_dictionary(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_local(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary_local.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def set_dictionary_local(resourcedictionary : IXpsOMDictionary) : HRESULT
    @lpVtbl.value.set_dictionary_local.unsafe_as(Proc(IXpsOMDictionary, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.get_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource*, HRESULT)).call(remotedictionaryresource)
  end
  def set_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.set_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource, HRESULT)).call(remotedictionaryresource)
  end
  def clone(canvas : IXpsOMCanvas*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMCanvas*, HRESULT)).call(canvas)
  end
end
struct LibWin32::IXpsOMPage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMPageReference*, HRESULT)).call(pagereference)
  end
  def get_visuals(visuals : IXpsOMVisualCollection*) : HRESULT
    @lpVtbl.value.get_visuals.unsafe_as(Proc(IXpsOMVisualCollection*, HRESULT)).call(visuals)
  end
  def get_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.get_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def set_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.set_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def get_content_box(contentbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_content_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(contentbox)
  end
  def set_content_box(contentbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_content_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(contentbox)
  end
  def get_bleed_box(bleedbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_bleed_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(bleedbox)
  end
  def set_bleed_box(bleedbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_bleed_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(bleedbox)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlinktarget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlinktarget)
  end
  def set_is_hyperlink_target(ishyperlinktarget : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlinktarget)
  end
  def get_dictionary(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_local(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary_local.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def set_dictionary_local(resourcedictionary : IXpsOMDictionary) : HRESULT
    @lpVtbl.value.set_dictionary_local.unsafe_as(Proc(IXpsOMDictionary, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.get_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource*, HRESULT)).call(remotedictionaryresource)
  end
  def set_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.set_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource, HRESULT)).call(remotedictionaryresource)
  end
  def write(stream : ISequentialStream, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(ISequentialStream, LibC::BOOL, HRESULT)).call(stream, optimizemarkupsize)
  end
  def generate_unused_lookup_key(type : XPS_OBJECT_TYPE, key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.generate_unused_lookup_key.unsafe_as(Proc(XPS_OBJECT_TYPE, LibC::LPWSTR*, HRESULT)).call(type, key)
  end
  def clone(page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMPage*, HRESULT)).call(page)
  end
end
struct LibWin32::IXpsOMPageReference
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner(document : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMDocument*, HRESULT)).call(document)
  end
  def get_page(page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.get_page.unsafe_as(Proc(IXpsOMPage*, HRESULT)).call(page)
  end
  def set_page(page : IXpsOMPage) : HRESULT
    @lpVtbl.value.set_page.unsafe_as(Proc(IXpsOMPage, HRESULT)).call(page)
  end
  def discard_page : HRESULT
    @lpVtbl.value.discard_page.unsafe_as(Proc(HRESULT)).call
  end
  def is_page_loaded(ispageloaded : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_page_loaded.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ispageloaded)
  end
  def get_advisory_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.get_advisory_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def set_advisory_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.set_advisory_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def get_story_fragments_resource(storyfragmentsresource : IXpsOMStoryFragmentsResource*) : HRESULT
    @lpVtbl.value.get_story_fragments_resource.unsafe_as(Proc(IXpsOMStoryFragmentsResource*, HRESULT)).call(storyfragmentsresource)
  end
  def set_story_fragments_resource(storyfragmentsresource : IXpsOMStoryFragmentsResource) : HRESULT
    @lpVtbl.value.set_story_fragments_resource.unsafe_as(Proc(IXpsOMStoryFragmentsResource, HRESULT)).call(storyfragmentsresource)
  end
  def get_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource*) : HRESULT
    @lpVtbl.value.get_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource*, HRESULT)).call(printticketresource)
  end
  def set_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource) : HRESULT
    @lpVtbl.value.set_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource, HRESULT)).call(printticketresource)
  end
  def get_thumbnail_resource(imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource*, HRESULT)).call(imageresource)
  end
  def set_thumbnail_resource(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.set_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def collect_link_targets(linktargets : IXpsOMNameCollection*) : HRESULT
    @lpVtbl.value.collect_link_targets.unsafe_as(Proc(IXpsOMNameCollection*, HRESULT)).call(linktargets)
  end
  def collect_part_resources(partresources : IXpsOMPartResources*) : HRESULT
    @lpVtbl.value.collect_part_resources.unsafe_as(Proc(IXpsOMPartResources*, HRESULT)).call(partresources)
  end
  def has_restricted_fonts(restrictedfonts : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_restricted_fonts.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(restrictedfonts)
  end
  def clone(pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMPageReference*, HRESULT)).call(pagereference)
  end
end
struct LibWin32::IXpsOMPageReferenceCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMPageReference*, HRESULT)).call(index, pagereference)
  end
  def insert_at(index : UInt32, pagereference : IXpsOMPageReference) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMPageReference, HRESULT)).call(index, pagereference)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, pagereference : IXpsOMPageReference) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMPageReference, HRESULT)).call(index, pagereference)
  end
  def append(pagereference : IXpsOMPageReference) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMPageReference, HRESULT)).call(pagereference)
  end
end
struct LibWin32::IXpsOMDocument
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(documentsequence : IXpsOMDocumentSequence*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMDocumentSequence*, HRESULT)).call(documentsequence)
  end
  def get_page_references(pagereferences : IXpsOMPageReferenceCollection*) : HRESULT
    @lpVtbl.value.get_page_references.unsafe_as(Proc(IXpsOMPageReferenceCollection*, HRESULT)).call(pagereferences)
  end
  def get_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource*) : HRESULT
    @lpVtbl.value.get_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource*, HRESULT)).call(printticketresource)
  end
  def set_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource) : HRESULT
    @lpVtbl.value.set_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource, HRESULT)).call(printticketresource)
  end
  def get_document_structure_resource(documentstructureresource : IXpsOMDocumentStructureResource*) : HRESULT
    @lpVtbl.value.get_document_structure_resource.unsafe_as(Proc(IXpsOMDocumentStructureResource*, HRESULT)).call(documentstructureresource)
  end
  def set_document_structure_resource(documentstructureresource : IXpsOMDocumentStructureResource) : HRESULT
    @lpVtbl.value.set_document_structure_resource.unsafe_as(Proc(IXpsOMDocumentStructureResource, HRESULT)).call(documentstructureresource)
  end
  def get_signature_block_resources(signatureblockresources : IXpsOMSignatureBlockResourceCollection*) : HRESULT
    @lpVtbl.value.get_signature_block_resources.unsafe_as(Proc(IXpsOMSignatureBlockResourceCollection*, HRESULT)).call(signatureblockresources)
  end
  def clone(document : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMDocument*, HRESULT)).call(document)
  end
end
struct LibWin32::IXpsOMDocumentCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, document : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsOMDocument*, HRESULT)).call(index, document)
  end
  def insert_at(index : UInt32, document : IXpsOMDocument) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IXpsOMDocument, HRESULT)).call(index, document)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, document : IXpsOMDocument) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IXpsOMDocument, HRESULT)).call(index, document)
  end
  def append(document : IXpsOMDocument) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IXpsOMDocument, HRESULT)).call(document)
  end
end
struct LibWin32::IXpsOMDocumentSequence
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMPackage*, HRESULT)).call(package)
  end
  def get_documents(documents : IXpsOMDocumentCollection*) : HRESULT
    @lpVtbl.value.get_documents.unsafe_as(Proc(IXpsOMDocumentCollection*, HRESULT)).call(documents)
  end
  def get_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource*) : HRESULT
    @lpVtbl.value.get_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource*, HRESULT)).call(printticketresource)
  end
  def set_print_ticket_resource(printticketresource : IXpsOMPrintTicketResource) : HRESULT
    @lpVtbl.value.set_print_ticket_resource.unsafe_as(Proc(IXpsOMPrintTicketResource, HRESULT)).call(printticketresource)
  end
end
struct LibWin32::IXpsOMCoreProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMPackage*, HRESULT)).call(package)
  end
  def get_category(category : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_category.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(category)
  end
  def set_category(category : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_category.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(category)
  end
  def get_content_status(contentstatus : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_status.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(contentstatus)
  end
  def set_content_status(contentstatus : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_content_status.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(contentstatus)
  end
  def get_content_type(contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(contenttype)
  end
  def set_content_type(contenttype : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_content_type.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(contenttype)
  end
  def get_created(created : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_created.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(created)
  end
  def set_created(created : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.set_created.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(created)
  end
  def get_creator(creator : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_creator.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(creator)
  end
  def set_creator(creator : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_creator.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(creator)
  end
  def get_description(description : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(description)
  end
  def set_description(description : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(description)
  end
  def get_identifier(identifier : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_identifier.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(identifier)
  end
  def set_identifier(identifier : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_identifier.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(identifier)
  end
  def get_keywords(keywords : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_keywords.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(keywords)
  end
  def set_keywords(keywords : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_keywords.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(keywords)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_last_modified_by(lastmodifiedby : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_last_modified_by.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lastmodifiedby)
  end
  def set_last_modified_by(lastmodifiedby : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_last_modified_by.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lastmodifiedby)
  end
  def get_last_printed(lastprinted : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_last_printed.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(lastprinted)
  end
  def set_last_printed(lastprinted : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.set_last_printed.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(lastprinted)
  end
  def get_modified(modified : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_modified.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(modified)
  end
  def set_modified(modified : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.set_modified.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(modified)
  end
  def get_revision(revision : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_revision.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(revision)
  end
  def set_revision(revision : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_revision.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(revision)
  end
  def get_subject(subject : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(subject)
  end
  def set_subject(subject : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_subject.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(subject)
  end
  def get_title(title : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(title)
  end
  def set_title(title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_title.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(title)
  end
  def get_version(version : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(version)
  end
  def set_version(version : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_version.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(version)
  end
  def clone(coreproperties : IXpsOMCoreProperties*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMCoreProperties*, HRESULT)).call(coreproperties)
  end
end
struct LibWin32::IXpsOMPackage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document_sequence(documentsequence : IXpsOMDocumentSequence*) : HRESULT
    @lpVtbl.value.get_document_sequence.unsafe_as(Proc(IXpsOMDocumentSequence*, HRESULT)).call(documentsequence)
  end
  def set_document_sequence(documentsequence : IXpsOMDocumentSequence) : HRESULT
    @lpVtbl.value.set_document_sequence.unsafe_as(Proc(IXpsOMDocumentSequence, HRESULT)).call(documentsequence)
  end
  def get_core_properties(coreproperties : IXpsOMCoreProperties*) : HRESULT
    @lpVtbl.value.get_core_properties.unsafe_as(Proc(IXpsOMCoreProperties*, HRESULT)).call(coreproperties)
  end
  def set_core_properties(coreproperties : IXpsOMCoreProperties) : HRESULT
    @lpVtbl.value.set_core_properties.unsafe_as(Proc(IXpsOMCoreProperties, HRESULT)).call(coreproperties)
  end
  def get_discard_control_part_name(discardcontrolparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_discard_control_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(discardcontrolparturi)
  end
  def set_discard_control_part_name(discardcontrolparturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_discard_control_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(discardcontrolparturi)
  end
  def get_thumbnail_resource(imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource*, HRESULT)).call(imageresource)
  end
  def set_thumbnail_resource(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.set_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def write_to_file(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_to_file.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize)
  end
  def write_to_stream(stream : ISequentialStream, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_to_stream.unsafe_as(Proc(ISequentialStream, LibC::BOOL, HRESULT)).call(stream, optimizemarkupsize)
  end
end
struct LibWin32::IXpsOMObjectFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_package(package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package.unsafe_as(Proc(IXpsOMPackage*, HRESULT)).call(package)
  end
  def create_package_from_file(filename : LibC::LPWSTR, reuseobjects : LibC::BOOL, package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package_from_file.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, IXpsOMPackage*, HRESULT)).call(filename, reuseobjects, package)
  end
  def create_package_from_stream(stream : IStream, reuseobjects : LibC::BOOL, package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package_from_stream.unsafe_as(Proc(IStream, LibC::BOOL, IXpsOMPackage*, HRESULT)).call(stream, reuseobjects, package)
  end
  def create_story_fragments_resource(acquiredstream : IStream, parturi : IOpcPartUri, storyfragmentsresource : IXpsOMStoryFragmentsResource*) : HRESULT
    @lpVtbl.value.create_story_fragments_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMStoryFragmentsResource*, HRESULT)).call(acquiredstream, parturi, storyfragmentsresource)
  end
  def create_document_structure_resource(acquiredstream : IStream, parturi : IOpcPartUri, documentstructureresource : IXpsOMDocumentStructureResource*) : HRESULT
    @lpVtbl.value.create_document_structure_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMDocumentStructureResource*, HRESULT)).call(acquiredstream, parturi, documentstructureresource)
  end
  def create_signature_block_resource(acquiredstream : IStream, parturi : IOpcPartUri, signatureblockresource : IXpsOMSignatureBlockResource*) : HRESULT
    @lpVtbl.value.create_signature_block_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)).call(acquiredstream, parturi, signatureblockresource)
  end
  def create_remote_dictionary_resource(dictionary : IXpsOMDictionary, parturi : IOpcPartUri, remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.create_remote_dictionary_resource.unsafe_as(Proc(IXpsOMDictionary, IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)).call(dictionary, parturi, remotedictionaryresource)
  end
  def create_remote_dictionary_resource_from_stream(dictionarymarkupstream : IStream, dictionaryparturi : IOpcPartUri, resources : IXpsOMPartResources, dictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.create_remote_dictionary_resource_from_stream.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)).call(dictionarymarkupstream, dictionaryparturi, resources, dictionaryresource)
  end
  def create_part_resources(partresources : IXpsOMPartResources*) : HRESULT
    @lpVtbl.value.create_part_resources.unsafe_as(Proc(IXpsOMPartResources*, HRESULT)).call(partresources)
  end
  def create_document_sequence(parturi : IOpcPartUri, documentsequence : IXpsOMDocumentSequence*) : HRESULT
    @lpVtbl.value.create_document_sequence.unsafe_as(Proc(IOpcPartUri, IXpsOMDocumentSequence*, HRESULT)).call(parturi, documentsequence)
  end
  def create_document(parturi : IOpcPartUri, document : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.create_document.unsafe_as(Proc(IOpcPartUri, IXpsOMDocument*, HRESULT)).call(parturi, document)
  end
  def create_page_reference(advisorypagedimensions : XPS_SIZE*, pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.create_page_reference.unsafe_as(Proc(XPS_SIZE*, IXpsOMPageReference*, HRESULT)).call(advisorypagedimensions, pagereference)
  end
  def create_page(pagedimensions : XPS_SIZE*, language : LibC::LPWSTR, parturi : IOpcPartUri, page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.create_page.unsafe_as(Proc(XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage*, HRESULT)).call(pagedimensions, language, parturi, page)
  end
  def create_page_from_stream(pagemarkupstream : IStream, parturi : IOpcPartUri, resources : IXpsOMPartResources, reuseobjects : LibC::BOOL, page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.create_page_from_stream.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage*, HRESULT)).call(pagemarkupstream, parturi, resources, reuseobjects, page)
  end
  def create_canvas(canvas : IXpsOMCanvas*) : HRESULT
    @lpVtbl.value.create_canvas.unsafe_as(Proc(IXpsOMCanvas*, HRESULT)).call(canvas)
  end
  def create_glyphs(fontresource : IXpsOMFontResource, glyphs : IXpsOMGlyphs*) : HRESULT
    @lpVtbl.value.create_glyphs.unsafe_as(Proc(IXpsOMFontResource, IXpsOMGlyphs*, HRESULT)).call(fontresource, glyphs)
  end
  def create_path(path : IXpsOMPath*) : HRESULT
    @lpVtbl.value.create_path.unsafe_as(Proc(IXpsOMPath*, HRESULT)).call(path)
  end
  def create_geometry(geometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.create_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(geometry)
  end
  def create_geometry_figure(startpoint : XPS_POINT*, figure : IXpsOMGeometryFigure*) : HRESULT
    @lpVtbl.value.create_geometry_figure.unsafe_as(Proc(XPS_POINT*, IXpsOMGeometryFigure*, HRESULT)).call(startpoint, figure)
  end
  def create_matrix_transform(matrix : XPS_MATRIX*, transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(XPS_MATRIX*, IXpsOMMatrixTransform*, HRESULT)).call(matrix, transform)
  end
  def create_solid_color_brush(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource, solidcolorbrush : IXpsOMSolidColorBrush*) : HRESULT
    @lpVtbl.value.create_solid_color_brush.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, IXpsOMSolidColorBrush*, HRESULT)).call(color, colorprofile, solidcolorbrush)
  end
  def create_color_profile_resource(acquiredstream : IStream, parturi : IOpcPartUri, colorprofileresource : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.create_color_profile_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)).call(acquiredstream, parturi, colorprofileresource)
  end
  def create_image_brush(image : IXpsOMImageResource, viewbox : XPS_RECT*, viewport : XPS_RECT*, imagebrush : IXpsOMImageBrush*) : HRESULT
    @lpVtbl.value.create_image_brush.unsafe_as(Proc(IXpsOMImageResource, XPS_RECT*, XPS_RECT*, IXpsOMImageBrush*, HRESULT)).call(image, viewbox, viewport, imagebrush)
  end
  def create_visual_brush(viewbox : XPS_RECT*, viewport : XPS_RECT*, visualbrush : IXpsOMVisualBrush*) : HRESULT
    @lpVtbl.value.create_visual_brush.unsafe_as(Proc(XPS_RECT*, XPS_RECT*, IXpsOMVisualBrush*, HRESULT)).call(viewbox, viewport, visualbrush)
  end
  def create_image_resource(acquiredstream : IStream, contenttype : XPS_IMAGE_TYPE, parturi : IOpcPartUri, imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.create_image_resource.unsafe_as(Proc(IStream, XPS_IMAGE_TYPE, IOpcPartUri, IXpsOMImageResource*, HRESULT)).call(acquiredstream, contenttype, parturi, imageresource)
  end
  def create_print_ticket_resource(acquiredstream : IStream, parturi : IOpcPartUri, printticketresource : IXpsOMPrintTicketResource*) : HRESULT
    @lpVtbl.value.create_print_ticket_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPrintTicketResource*, HRESULT)).call(acquiredstream, parturi, printticketresource)
  end
  def create_font_resource(acquiredstream : IStream, fontembedding : XPS_FONT_EMBEDDING, parturi : IOpcPartUri, isobfsourcestream : LibC::BOOL, fontresource : IXpsOMFontResource*) : HRESULT
    @lpVtbl.value.create_font_resource.unsafe_as(Proc(IStream, XPS_FONT_EMBEDDING, IOpcPartUri, LibC::BOOL, IXpsOMFontResource*, HRESULT)).call(acquiredstream, fontembedding, parturi, isobfsourcestream, fontresource)
  end
  def create_gradient_stop(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource, offset : Float32, gradientstop : IXpsOMGradientStop*) : HRESULT
    @lpVtbl.value.create_gradient_stop.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, Float32, IXpsOMGradientStop*, HRESULT)).call(color, colorprofile, offset, gradientstop)
  end
  def create_linear_gradient_brush(gradstop1 : IXpsOMGradientStop, gradstop2 : IXpsOMGradientStop, startpoint : XPS_POINT*, endpoint : XPS_POINT*, lineargradientbrush : IXpsOMLinearGradientBrush*) : HRESULT
    @lpVtbl.value.create_linear_gradient_brush.unsafe_as(Proc(IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, IXpsOMLinearGradientBrush*, HRESULT)).call(gradstop1, gradstop2, startpoint, endpoint, lineargradientbrush)
  end
  def create_radial_gradient_brush(gradstop1 : IXpsOMGradientStop, gradstop2 : IXpsOMGradientStop, centerpoint : XPS_POINT*, gradientorigin : XPS_POINT*, radiisizes : XPS_SIZE*, radialgradientbrush : IXpsOMRadialGradientBrush*) : HRESULT
    @lpVtbl.value.create_radial_gradient_brush.unsafe_as(Proc(IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, XPS_SIZE*, IXpsOMRadialGradientBrush*, HRESULT)).call(gradstop1, gradstop2, centerpoint, gradientorigin, radiisizes, radialgradientbrush)
  end
  def create_core_properties(parturi : IOpcPartUri, coreproperties : IXpsOMCoreProperties*) : HRESULT
    @lpVtbl.value.create_core_properties.unsafe_as(Proc(IOpcPartUri, IXpsOMCoreProperties*, HRESULT)).call(parturi, coreproperties)
  end
  def create_dictionary(dictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.create_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(dictionary)
  end
  def create_part_uri_collection(parturicollection : IXpsOMPartUriCollection*) : HRESULT
    @lpVtbl.value.create_part_uri_collection.unsafe_as(Proc(IXpsOMPartUriCollection*, HRESULT)).call(parturicollection)
  end
  def create_package_writer_on_file(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_file.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, packagewriter)
  end
  def create_package_writer_on_stream(outputstream : ISequentialStream, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_stream.unsafe_as(Proc(ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(outputstream, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, packagewriter)
  end
  def create_part_uri(uri : LibC::LPWSTR, parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.create_part_uri.unsafe_as(Proc(LibC::LPWSTR, IOpcPartUri*, HRESULT)).call(uri, parturi)
  end
  def create_read_only_stream_on_file(filename : LibC::LPWSTR, stream : IStream*) : HRESULT
    @lpVtbl.value.create_read_only_stream_on_file.unsafe_as(Proc(LibC::LPWSTR, IStream*, HRESULT)).call(filename, stream)
  end
end
struct LibWin32::IXpsOMNameCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(index, name)
  end
end
struct LibWin32::IXpsOMPartUriCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IOpcPartUri*, HRESULT)).call(index, parturi)
  end
  def insert_at(index : UInt32, parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IOpcPartUri, HRESULT)).call(index, parturi)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def set_at(index : UInt32, parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_at.unsafe_as(Proc(UInt32, IOpcPartUri, HRESULT)).call(index, parturi)
  end
  def append(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
end
struct LibWin32::IXpsOMPackageWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_new_document(documentpartname : IOpcPartUri, documentprintticket : IXpsOMPrintTicketResource, documentstructure : IXpsOMDocumentStructureResource, signatureblockresources : IXpsOMSignatureBlockResourceCollection, restrictedfonts : IXpsOMPartUriCollection) : HRESULT
    @lpVtbl.value.start_new_document.unsafe_as(Proc(IOpcPartUri, IXpsOMPrintTicketResource, IXpsOMDocumentStructureResource, IXpsOMSignatureBlockResourceCollection, IXpsOMPartUriCollection, HRESULT)).call(documentpartname, documentprintticket, documentstructure, signatureblockresources, restrictedfonts)
  end
  def add_page(page : IXpsOMPage, advisorypagedimensions : XPS_SIZE*, discardableresourceparts : IXpsOMPartUriCollection, storyfragments : IXpsOMStoryFragmentsResource, pageprintticket : IXpsOMPrintTicketResource, pagethumbnail : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.add_page.unsafe_as(Proc(IXpsOMPage, XPS_SIZE*, IXpsOMPartUriCollection, IXpsOMStoryFragmentsResource, IXpsOMPrintTicketResource, IXpsOMImageResource, HRESULT)).call(page, advisorypagedimensions, discardableresourceparts, storyfragments, pageprintticket, pagethumbnail)
  end
  def add_resource(resource : IXpsOMResource) : HRESULT
    @lpVtbl.value.add_resource.unsafe_as(Proc(IXpsOMResource, HRESULT)).call(resource)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def is_closed(isclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isclosed)
  end
end
struct LibWin32::IXpsOMPackageTarget
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_xps_om_package_writer(documentsequencepartname : IOpcPartUri, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_xps_om_package_writer.unsafe_as(Proc(IOpcPartUri, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(documentsequencepartname, documentsequenceprintticket, discardcontrolpartname, packagewriter)
  end
end
struct LibWin32::IXpsOMThumbnailGenerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def generate_thumbnail(page : IXpsOMPage, thumbnailtype : XPS_IMAGE_TYPE, thumbnailsize : XPS_THUMBNAIL_SIZE, imageresourcepartname : IOpcPartUri, imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.generate_thumbnail.unsafe_as(Proc(IXpsOMPage, XPS_IMAGE_TYPE, XPS_THUMBNAIL_SIZE, IOpcPartUri, IXpsOMImageResource*, HRESULT)).call(page, thumbnailtype, thumbnailsize, imageresourcepartname, imageresource)
  end
end
struct LibWin32::IXpsOMObjectFactory1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_package(package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package.unsafe_as(Proc(IXpsOMPackage*, HRESULT)).call(package)
  end
  def create_package_from_file(filename : LibC::LPWSTR, reuseobjects : LibC::BOOL, package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package_from_file.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, IXpsOMPackage*, HRESULT)).call(filename, reuseobjects, package)
  end
  def create_package_from_stream(stream : IStream, reuseobjects : LibC::BOOL, package : IXpsOMPackage*) : HRESULT
    @lpVtbl.value.create_package_from_stream.unsafe_as(Proc(IStream, LibC::BOOL, IXpsOMPackage*, HRESULT)).call(stream, reuseobjects, package)
  end
  def create_story_fragments_resource(acquiredstream : IStream, parturi : IOpcPartUri, storyfragmentsresource : IXpsOMStoryFragmentsResource*) : HRESULT
    @lpVtbl.value.create_story_fragments_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMStoryFragmentsResource*, HRESULT)).call(acquiredstream, parturi, storyfragmentsresource)
  end
  def create_document_structure_resource(acquiredstream : IStream, parturi : IOpcPartUri, documentstructureresource : IXpsOMDocumentStructureResource*) : HRESULT
    @lpVtbl.value.create_document_structure_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMDocumentStructureResource*, HRESULT)).call(acquiredstream, parturi, documentstructureresource)
  end
  def create_signature_block_resource(acquiredstream : IStream, parturi : IOpcPartUri, signatureblockresource : IXpsOMSignatureBlockResource*) : HRESULT
    @lpVtbl.value.create_signature_block_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMSignatureBlockResource*, HRESULT)).call(acquiredstream, parturi, signatureblockresource)
  end
  def create_remote_dictionary_resource(dictionary : IXpsOMDictionary, parturi : IOpcPartUri, remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.create_remote_dictionary_resource.unsafe_as(Proc(IXpsOMDictionary, IOpcPartUri, IXpsOMRemoteDictionaryResource*, HRESULT)).call(dictionary, parturi, remotedictionaryresource)
  end
  def create_remote_dictionary_resource_from_stream(dictionarymarkupstream : IStream, dictionaryparturi : IOpcPartUri, resources : IXpsOMPartResources, dictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.create_remote_dictionary_resource_from_stream.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)).call(dictionarymarkupstream, dictionaryparturi, resources, dictionaryresource)
  end
  def create_part_resources(partresources : IXpsOMPartResources*) : HRESULT
    @lpVtbl.value.create_part_resources.unsafe_as(Proc(IXpsOMPartResources*, HRESULT)).call(partresources)
  end
  def create_document_sequence(parturi : IOpcPartUri, documentsequence : IXpsOMDocumentSequence*) : HRESULT
    @lpVtbl.value.create_document_sequence.unsafe_as(Proc(IOpcPartUri, IXpsOMDocumentSequence*, HRESULT)).call(parturi, documentsequence)
  end
  def create_document(parturi : IOpcPartUri, document : IXpsOMDocument*) : HRESULT
    @lpVtbl.value.create_document.unsafe_as(Proc(IOpcPartUri, IXpsOMDocument*, HRESULT)).call(parturi, document)
  end
  def create_page_reference(advisorypagedimensions : XPS_SIZE*, pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.create_page_reference.unsafe_as(Proc(XPS_SIZE*, IXpsOMPageReference*, HRESULT)).call(advisorypagedimensions, pagereference)
  end
  def create_page(pagedimensions : XPS_SIZE*, language : LibC::LPWSTR, parturi : IOpcPartUri, page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.create_page.unsafe_as(Proc(XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage*, HRESULT)).call(pagedimensions, language, parturi, page)
  end
  def create_page_from_stream(pagemarkupstream : IStream, parturi : IOpcPartUri, resources : IXpsOMPartResources, reuseobjects : LibC::BOOL, page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.create_page_from_stream.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage*, HRESULT)).call(pagemarkupstream, parturi, resources, reuseobjects, page)
  end
  def create_canvas(canvas : IXpsOMCanvas*) : HRESULT
    @lpVtbl.value.create_canvas.unsafe_as(Proc(IXpsOMCanvas*, HRESULT)).call(canvas)
  end
  def create_glyphs(fontresource : IXpsOMFontResource, glyphs : IXpsOMGlyphs*) : HRESULT
    @lpVtbl.value.create_glyphs.unsafe_as(Proc(IXpsOMFontResource, IXpsOMGlyphs*, HRESULT)).call(fontresource, glyphs)
  end
  def create_path(path : IXpsOMPath*) : HRESULT
    @lpVtbl.value.create_path.unsafe_as(Proc(IXpsOMPath*, HRESULT)).call(path)
  end
  def create_geometry(geometry : IXpsOMGeometry*) : HRESULT
    @lpVtbl.value.create_geometry.unsafe_as(Proc(IXpsOMGeometry*, HRESULT)).call(geometry)
  end
  def create_geometry_figure(startpoint : XPS_POINT*, figure : IXpsOMGeometryFigure*) : HRESULT
    @lpVtbl.value.create_geometry_figure.unsafe_as(Proc(XPS_POINT*, IXpsOMGeometryFigure*, HRESULT)).call(startpoint, figure)
  end
  def create_matrix_transform(matrix : XPS_MATRIX*, transform : IXpsOMMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(XPS_MATRIX*, IXpsOMMatrixTransform*, HRESULT)).call(matrix, transform)
  end
  def create_solid_color_brush(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource, solidcolorbrush : IXpsOMSolidColorBrush*) : HRESULT
    @lpVtbl.value.create_solid_color_brush.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, IXpsOMSolidColorBrush*, HRESULT)).call(color, colorprofile, solidcolorbrush)
  end
  def create_color_profile_resource(acquiredstream : IStream, parturi : IOpcPartUri, colorprofileresource : IXpsOMColorProfileResource*) : HRESULT
    @lpVtbl.value.create_color_profile_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMColorProfileResource*, HRESULT)).call(acquiredstream, parturi, colorprofileresource)
  end
  def create_image_brush(image : IXpsOMImageResource, viewbox : XPS_RECT*, viewport : XPS_RECT*, imagebrush : IXpsOMImageBrush*) : HRESULT
    @lpVtbl.value.create_image_brush.unsafe_as(Proc(IXpsOMImageResource, XPS_RECT*, XPS_RECT*, IXpsOMImageBrush*, HRESULT)).call(image, viewbox, viewport, imagebrush)
  end
  def create_visual_brush(viewbox : XPS_RECT*, viewport : XPS_RECT*, visualbrush : IXpsOMVisualBrush*) : HRESULT
    @lpVtbl.value.create_visual_brush.unsafe_as(Proc(XPS_RECT*, XPS_RECT*, IXpsOMVisualBrush*, HRESULT)).call(viewbox, viewport, visualbrush)
  end
  def create_image_resource(acquiredstream : IStream, contenttype : XPS_IMAGE_TYPE, parturi : IOpcPartUri, imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.create_image_resource.unsafe_as(Proc(IStream, XPS_IMAGE_TYPE, IOpcPartUri, IXpsOMImageResource*, HRESULT)).call(acquiredstream, contenttype, parturi, imageresource)
  end
  def create_print_ticket_resource(acquiredstream : IStream, parturi : IOpcPartUri, printticketresource : IXpsOMPrintTicketResource*) : HRESULT
    @lpVtbl.value.create_print_ticket_resource.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPrintTicketResource*, HRESULT)).call(acquiredstream, parturi, printticketresource)
  end
  def create_font_resource(acquiredstream : IStream, fontembedding : XPS_FONT_EMBEDDING, parturi : IOpcPartUri, isobfsourcestream : LibC::BOOL, fontresource : IXpsOMFontResource*) : HRESULT
    @lpVtbl.value.create_font_resource.unsafe_as(Proc(IStream, XPS_FONT_EMBEDDING, IOpcPartUri, LibC::BOOL, IXpsOMFontResource*, HRESULT)).call(acquiredstream, fontembedding, parturi, isobfsourcestream, fontresource)
  end
  def create_gradient_stop(color : XPS_COLOR*, colorprofile : IXpsOMColorProfileResource, offset : Float32, gradientstop : IXpsOMGradientStop*) : HRESULT
    @lpVtbl.value.create_gradient_stop.unsafe_as(Proc(XPS_COLOR*, IXpsOMColorProfileResource, Float32, IXpsOMGradientStop*, HRESULT)).call(color, colorprofile, offset, gradientstop)
  end
  def create_linear_gradient_brush(gradstop1 : IXpsOMGradientStop, gradstop2 : IXpsOMGradientStop, startpoint : XPS_POINT*, endpoint : XPS_POINT*, lineargradientbrush : IXpsOMLinearGradientBrush*) : HRESULT
    @lpVtbl.value.create_linear_gradient_brush.unsafe_as(Proc(IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, IXpsOMLinearGradientBrush*, HRESULT)).call(gradstop1, gradstop2, startpoint, endpoint, lineargradientbrush)
  end
  def create_radial_gradient_brush(gradstop1 : IXpsOMGradientStop, gradstop2 : IXpsOMGradientStop, centerpoint : XPS_POINT*, gradientorigin : XPS_POINT*, radiisizes : XPS_SIZE*, radialgradientbrush : IXpsOMRadialGradientBrush*) : HRESULT
    @lpVtbl.value.create_radial_gradient_brush.unsafe_as(Proc(IXpsOMGradientStop, IXpsOMGradientStop, XPS_POINT*, XPS_POINT*, XPS_SIZE*, IXpsOMRadialGradientBrush*, HRESULT)).call(gradstop1, gradstop2, centerpoint, gradientorigin, radiisizes, radialgradientbrush)
  end
  def create_core_properties(parturi : IOpcPartUri, coreproperties : IXpsOMCoreProperties*) : HRESULT
    @lpVtbl.value.create_core_properties.unsafe_as(Proc(IOpcPartUri, IXpsOMCoreProperties*, HRESULT)).call(parturi, coreproperties)
  end
  def create_dictionary(dictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.create_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(dictionary)
  end
  def create_part_uri_collection(parturicollection : IXpsOMPartUriCollection*) : HRESULT
    @lpVtbl.value.create_part_uri_collection.unsafe_as(Proc(IXpsOMPartUriCollection*, HRESULT)).call(parturicollection)
  end
  def create_package_writer_on_file(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_file.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, packagewriter)
  end
  def create_package_writer_on_stream(outputstream : ISequentialStream, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_stream.unsafe_as(Proc(ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(outputstream, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, packagewriter)
  end
  def create_part_uri(uri : LibC::LPWSTR, parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.create_part_uri.unsafe_as(Proc(LibC::LPWSTR, IOpcPartUri*, HRESULT)).call(uri, parturi)
  end
  def create_read_only_stream_on_file(filename : LibC::LPWSTR, stream : IStream*) : HRESULT
    @lpVtbl.value.create_read_only_stream_on_file.unsafe_as(Proc(LibC::LPWSTR, IStream*, HRESULT)).call(filename, stream)
  end
  def get_document_type_from_file(filename : LibC::LPWSTR, documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_document_type_from_file.unsafe_as(Proc(LibC::LPWSTR, XPS_DOCUMENT_TYPE*, HRESULT)).call(filename, documenttype)
  end
  def get_document_type_from_stream(xpsdocumentstream : IStream, documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_document_type_from_stream.unsafe_as(Proc(IStream, XPS_DOCUMENT_TYPE*, HRESULT)).call(xpsdocumentstream, documenttype)
  end
  def convert_hd_photo_to_jpeg_xr(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.convert_hd_photo_to_jpeg_xr.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def convert_jpeg_xr_to_hd_photo(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.convert_jpeg_xr_to_hd_photo.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def create_package_writer_on_file1(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, documenttype : XPS_DOCUMENT_TYPE, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_file1.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, documenttype, packagewriter)
  end
  def create_package_writer_on_stream1(outputstream : ISequentialStream, optimizemarkupsize : LibC::BOOL, interleaving : XPS_INTERLEAVING, documentsequencepartname : IOpcPartUri, coreproperties : IXpsOMCoreProperties, packagethumbnail : IXpsOMImageResource, documentsequenceprintticket : IXpsOMPrintTicketResource, discardcontrolpartname : IOpcPartUri, documenttype : XPS_DOCUMENT_TYPE, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer_on_stream1.unsafe_as(Proc(ISequentialStream, LibC::BOOL, XPS_INTERLEAVING, IOpcPartUri, IXpsOMCoreProperties, IXpsOMImageResource, IXpsOMPrintTicketResource, IOpcPartUri, XPS_DOCUMENT_TYPE, IXpsOMPackageWriter*, HRESULT)).call(outputstream, optimizemarkupsize, interleaving, documentsequencepartname, coreproperties, packagethumbnail, documentsequenceprintticket, discardcontrolpartname, documenttype, packagewriter)
  end
  def create_package1(package : IXpsOMPackage1*) : HRESULT
    @lpVtbl.value.create_package1.unsafe_as(Proc(IXpsOMPackage1*, HRESULT)).call(package)
  end
  def create_package_from_stream1(stream : IStream, reuseobjects : LibC::BOOL, package : IXpsOMPackage1*) : HRESULT
    @lpVtbl.value.create_package_from_stream1.unsafe_as(Proc(IStream, LibC::BOOL, IXpsOMPackage1*, HRESULT)).call(stream, reuseobjects, package)
  end
  def create_package_from_file1(filename : LibC::LPWSTR, reuseobjects : LibC::BOOL, package : IXpsOMPackage1*) : HRESULT
    @lpVtbl.value.create_package_from_file1.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, IXpsOMPackage1*, HRESULT)).call(filename, reuseobjects, package)
  end
  def create_page1(pagedimensions : XPS_SIZE*, language : LibC::LPWSTR, parturi : IOpcPartUri, page : IXpsOMPage1*) : HRESULT
    @lpVtbl.value.create_page1.unsafe_as(Proc(XPS_SIZE*, LibC::LPWSTR, IOpcPartUri, IXpsOMPage1*, HRESULT)).call(pagedimensions, language, parturi, page)
  end
  def create_page_from_stream1(pagemarkupstream : IStream, parturi : IOpcPartUri, resources : IXpsOMPartResources, reuseobjects : LibC::BOOL, page : IXpsOMPage1*) : HRESULT
    @lpVtbl.value.create_page_from_stream1.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, LibC::BOOL, IXpsOMPage1*, HRESULT)).call(pagemarkupstream, parturi, resources, reuseobjects, page)
  end
  def create_remote_dictionary_resource_from_stream1(dictionarymarkupstream : IStream, parturi : IOpcPartUri, resources : IXpsOMPartResources, dictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.create_remote_dictionary_resource_from_stream1.unsafe_as(Proc(IStream, IOpcPartUri, IXpsOMPartResources, IXpsOMRemoteDictionaryResource*, HRESULT)).call(dictionarymarkupstream, parturi, resources, dictionaryresource)
  end
end
struct LibWin32::IXpsOMPackage1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document_sequence(documentsequence : IXpsOMDocumentSequence*) : HRESULT
    @lpVtbl.value.get_document_sequence.unsafe_as(Proc(IXpsOMDocumentSequence*, HRESULT)).call(documentsequence)
  end
  def set_document_sequence(documentsequence : IXpsOMDocumentSequence) : HRESULT
    @lpVtbl.value.set_document_sequence.unsafe_as(Proc(IXpsOMDocumentSequence, HRESULT)).call(documentsequence)
  end
  def get_core_properties(coreproperties : IXpsOMCoreProperties*) : HRESULT
    @lpVtbl.value.get_core_properties.unsafe_as(Proc(IXpsOMCoreProperties*, HRESULT)).call(coreproperties)
  end
  def set_core_properties(coreproperties : IXpsOMCoreProperties) : HRESULT
    @lpVtbl.value.set_core_properties.unsafe_as(Proc(IXpsOMCoreProperties, HRESULT)).call(coreproperties)
  end
  def get_discard_control_part_name(discardcontrolparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_discard_control_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(discardcontrolparturi)
  end
  def set_discard_control_part_name(discardcontrolparturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_discard_control_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(discardcontrolparturi)
  end
  def get_thumbnail_resource(imageresource : IXpsOMImageResource*) : HRESULT
    @lpVtbl.value.get_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource*, HRESULT)).call(imageresource)
  end
  def set_thumbnail_resource(imageresource : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.set_thumbnail_resource.unsafe_as(Proc(IXpsOMImageResource, HRESULT)).call(imageresource)
  end
  def write_to_file(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_to_file.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize)
  end
  def write_to_stream(stream : ISequentialStream, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_to_stream.unsafe_as(Proc(ISequentialStream, LibC::BOOL, HRESULT)).call(stream, optimizemarkupsize)
  end
  def get_document_type(documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_document_type.unsafe_as(Proc(XPS_DOCUMENT_TYPE*, HRESULT)).call(documenttype)
  end
  def write_to_file1(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32, optimizemarkupsize : LibC::BOOL, documenttype : XPS_DOCUMENT_TYPE) : HRESULT
    @lpVtbl.value.write_to_file1.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)).call(filename, securityattributes, flagsandattributes, optimizemarkupsize, documenttype)
  end
  def write_to_stream1(outputstream : ISequentialStream, optimizemarkupsize : LibC::BOOL, documenttype : XPS_DOCUMENT_TYPE) : HRESULT
    @lpVtbl.value.write_to_stream1.unsafe_as(Proc(ISequentialStream, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)).call(outputstream, optimizemarkupsize, documenttype)
  end
end
struct LibWin32::IXpsOMPage1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_owner(pagereference : IXpsOMPageReference*) : HRESULT
    @lpVtbl.value.get_owner.unsafe_as(Proc(IXpsOMPageReference*, HRESULT)).call(pagereference)
  end
  def get_visuals(visuals : IXpsOMVisualCollection*) : HRESULT
    @lpVtbl.value.get_visuals.unsafe_as(Proc(IXpsOMVisualCollection*, HRESULT)).call(visuals)
  end
  def get_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.get_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def set_page_dimensions(pagedimensions : XPS_SIZE*) : HRESULT
    @lpVtbl.value.set_page_dimensions.unsafe_as(Proc(XPS_SIZE*, HRESULT)).call(pagedimensions)
  end
  def get_content_box(contentbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_content_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(contentbox)
  end
  def set_content_box(contentbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_content_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(contentbox)
  end
  def get_bleed_box(bleedbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.get_bleed_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(bleedbox)
  end
  def set_bleed_box(bleedbox : XPS_RECT*) : HRESULT
    @lpVtbl.value.set_bleed_box.unsafe_as(Proc(XPS_RECT*, HRESULT)).call(bleedbox)
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def set_language(language : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(language)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_is_hyperlink_target(ishyperlinktarget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ishyperlinktarget)
  end
  def set_is_hyperlink_target(ishyperlinktarget : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_is_hyperlink_target.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ishyperlinktarget)
  end
  def get_dictionary(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_local(resourcedictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary_local.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(resourcedictionary)
  end
  def set_dictionary_local(resourcedictionary : IXpsOMDictionary) : HRESULT
    @lpVtbl.value.set_dictionary_local.unsafe_as(Proc(IXpsOMDictionary, HRESULT)).call(resourcedictionary)
  end
  def get_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource*) : HRESULT
    @lpVtbl.value.get_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource*, HRESULT)).call(remotedictionaryresource)
  end
  def set_dictionary_resource(remotedictionaryresource : IXpsOMRemoteDictionaryResource) : HRESULT
    @lpVtbl.value.set_dictionary_resource.unsafe_as(Proc(IXpsOMRemoteDictionaryResource, HRESULT)).call(remotedictionaryresource)
  end
  def write(stream : ISequentialStream, optimizemarkupsize : LibC::BOOL) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(ISequentialStream, LibC::BOOL, HRESULT)).call(stream, optimizemarkupsize)
  end
  def generate_unused_lookup_key(type : XPS_OBJECT_TYPE, key : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.generate_unused_lookup_key.unsafe_as(Proc(XPS_OBJECT_TYPE, LibC::LPWSTR*, HRESULT)).call(type, key)
  end
  def clone(page : IXpsOMPage*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IXpsOMPage*, HRESULT)).call(page)
  end
  def get_document_type(documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_document_type.unsafe_as(Proc(XPS_DOCUMENT_TYPE*, HRESULT)).call(documenttype)
  end
  def write1(stream : ISequentialStream, optimizemarkupsize : LibC::BOOL, documenttype : XPS_DOCUMENT_TYPE) : HRESULT
    @lpVtbl.value.write1.unsafe_as(Proc(ISequentialStream, LibC::BOOL, XPS_DOCUMENT_TYPE, HRESULT)).call(stream, optimizemarkupsize, documenttype)
  end
end
struct LibWin32::IXpsDocumentPackageTarget
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_xps_om_package_writer(documentsequencepartname : IOpcPartUri, discardcontrolpartname : IOpcPartUri, packagewriter : IXpsOMPackageWriter*) : HRESULT
    @lpVtbl.value.get_xps_om_package_writer.unsafe_as(Proc(IOpcPartUri, IOpcPartUri, IXpsOMPackageWriter*, HRESULT)).call(documentsequencepartname, discardcontrolpartname, packagewriter)
  end
  def get_xps_om_factory(xpsfactory : IXpsOMObjectFactory*) : HRESULT
    @lpVtbl.value.get_xps_om_factory.unsafe_as(Proc(IXpsOMObjectFactory*, HRESULT)).call(xpsfactory)
  end
  def get_xps_type(documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_xps_type.unsafe_as(Proc(XPS_DOCUMENT_TYPE*, HRESULT)).call(documenttype)
  end
end
struct LibWin32::IXpsOMRemoteDictionaryResource1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(parturi)
  end
  def set_part_name(parturi : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(parturi)
  end
  def get_dictionary(dictionary : IXpsOMDictionary*) : HRESULT
    @lpVtbl.value.get_dictionary.unsafe_as(Proc(IXpsOMDictionary*, HRESULT)).call(dictionary)
  end
  def set_dictionary(dictionary : IXpsOMDictionary) : HRESULT
    @lpVtbl.value.set_dictionary.unsafe_as(Proc(IXpsOMDictionary, HRESULT)).call(dictionary)
  end
  def get_document_type(documenttype : XPS_DOCUMENT_TYPE*) : HRESULT
    @lpVtbl.value.get_document_type.unsafe_as(Proc(XPS_DOCUMENT_TYPE*, HRESULT)).call(documenttype)
  end
  def write1(stream : ISequentialStream, documenttype : XPS_DOCUMENT_TYPE) : HRESULT
    @lpVtbl.value.write1.unsafe_as(Proc(ISequentialStream, XPS_DOCUMENT_TYPE, HRESULT)).call(stream, documenttype)
  end
end
struct LibWin32::IXpsOMPackageWriter3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_new_document(documentpartname : IOpcPartUri, documentprintticket : IXpsOMPrintTicketResource, documentstructure : IXpsOMDocumentStructureResource, signatureblockresources : IXpsOMSignatureBlockResourceCollection, restrictedfonts : IXpsOMPartUriCollection) : HRESULT
    @lpVtbl.value.start_new_document.unsafe_as(Proc(IOpcPartUri, IXpsOMPrintTicketResource, IXpsOMDocumentStructureResource, IXpsOMSignatureBlockResourceCollection, IXpsOMPartUriCollection, HRESULT)).call(documentpartname, documentprintticket, documentstructure, signatureblockresources, restrictedfonts)
  end
  def add_page(page : IXpsOMPage, advisorypagedimensions : XPS_SIZE*, discardableresourceparts : IXpsOMPartUriCollection, storyfragments : IXpsOMStoryFragmentsResource, pageprintticket : IXpsOMPrintTicketResource, pagethumbnail : IXpsOMImageResource) : HRESULT
    @lpVtbl.value.add_page.unsafe_as(Proc(IXpsOMPage, XPS_SIZE*, IXpsOMPartUriCollection, IXpsOMStoryFragmentsResource, IXpsOMPrintTicketResource, IXpsOMImageResource, HRESULT)).call(page, advisorypagedimensions, discardableresourceparts, storyfragments, pageprintticket, pagethumbnail)
  end
  def add_resource(resource : IXpsOMResource) : HRESULT
    @lpVtbl.value.add_resource.unsafe_as(Proc(IXpsOMResource, HRESULT)).call(resource)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def is_closed(isclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isclosed)
  end
  def add_model_texture(texturepartname : IOpcPartUri, texturedata : IStream) : HRESULT
    @lpVtbl.value.add_model_texture.unsafe_as(Proc(IOpcPartUri, IStream, HRESULT)).call(texturepartname, texturedata)
  end
  def set_model_print_ticket(printticketpartname : IOpcPartUri, printticketdata : IStream) : HRESULT
    @lpVtbl.value.set_model_print_ticket.unsafe_as(Proc(IOpcPartUri, IStream, HRESULT)).call(printticketpartname, printticketdata)
  end
end
struct LibWin32::IXpsDocumentPackageTarget3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_xps_om_package_writer3_d(documentsequencepartname : IOpcPartUri, discardcontrolpartname : IOpcPartUri, modelpartname : IOpcPartUri, modeldata : IStream, packagewriter : IXpsOMPackageWriter3D*) : HRESULT
    @lpVtbl.value.get_xps_om_package_writer3_d.unsafe_as(Proc(IOpcPartUri, IOpcPartUri, IOpcPartUri, IStream, IXpsOMPackageWriter3D*, HRESULT)).call(documentsequencepartname, discardcontrolpartname, modelpartname, modeldata, packagewriter)
  end
  def get_xps_om_factory(xpsfactory : IXpsOMObjectFactory*) : HRESULT
    @lpVtbl.value.get_xps_om_factory.unsafe_as(Proc(IXpsOMObjectFactory*, HRESULT)).call(xpsfactory)
  end
end
struct LibWin32::IXpsSigningOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_signature_id(signatureid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signatureid)
  end
  def set_signature_id(signatureid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_signature_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(signatureid)
  end
  def get_signature_method(signaturemethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signaturemethod)
  end
  def set_signature_method(signaturemethod : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_signature_method.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(signaturemethod)
  end
  def get_digest_method(digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(digestmethod)
  end
  def set_digest_method(digestmethod : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_digest_method.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(digestmethod)
  end
  def get_signature_part_name(signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signaturepartname)
  end
  def set_signature_part_name(signaturepartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(signaturepartname)
  end
  def get_policy(policy : XPS_SIGN_POLICY*) : HRESULT
    @lpVtbl.value.get_policy.unsafe_as(Proc(XPS_SIGN_POLICY*, HRESULT)).call(policy)
  end
  def set_policy(policy : XPS_SIGN_POLICY) : HRESULT
    @lpVtbl.value.set_policy.unsafe_as(Proc(XPS_SIGN_POLICY, HRESULT)).call(policy)
  end
  def get_signing_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_signing_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT*, HRESULT)).call(timeformat)
  end
  def set_signing_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT) : HRESULT
    @lpVtbl.value.set_signing_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT, HRESULT)).call(timeformat)
  end
  def get_custom_objects(customobjectset : IOpcSignatureCustomObjectSet*) : HRESULT
    @lpVtbl.value.get_custom_objects.unsafe_as(Proc(IOpcSignatureCustomObjectSet*, HRESULT)).call(customobjectset)
  end
  def get_custom_references(customreferenceset : IOpcSignatureReferenceSet*) : HRESULT
    @lpVtbl.value.get_custom_references.unsafe_as(Proc(IOpcSignatureReferenceSet*, HRESULT)).call(customreferenceset)
  end
  def get_certificate_set(certificateset : IOpcCertificateSet*) : HRESULT
    @lpVtbl.value.get_certificate_set.unsafe_as(Proc(IOpcCertificateSet*, HRESULT)).call(certificateset)
  end
  def get_flags(flags : XPS_SIGN_FLAGS*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(XPS_SIGN_FLAGS*, HRESULT)).call(flags)
  end
  def set_flags(flags : XPS_SIGN_FLAGS) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(XPS_SIGN_FLAGS, HRESULT)).call(flags)
  end
end
struct LibWin32::IXpsSignatureCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, signature : IXpsSignature*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsSignature*, HRESULT)).call(index, signature)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
end
struct LibWin32::IXpsSignature
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_signature_id(sigid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(sigid)
  end
  def get_signature_value(signaturehashvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_value.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(signaturehashvalue, count)
  end
  def get_certificate_enumerator(certificateenumerator : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.get_certificate_enumerator.unsafe_as(Proc(IOpcCertificateEnumerator*, HRESULT)).call(certificateenumerator)
  end
  def get_signing_time(sigdatetimestring : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signing_time.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(sigdatetimestring)
  end
  def get_signing_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_signing_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT*, HRESULT)).call(timeformat)
  end
  def get_signature_part_name(signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signaturepartname)
  end
  def verify(x509certificate : CERT_CONTEXT*, sigstatus : XPS_SIGNATURE_STATUS*) : HRESULT
    @lpVtbl.value.verify.unsafe_as(Proc(CERT_CONTEXT*, XPS_SIGNATURE_STATUS*, HRESULT)).call(x509certificate, sigstatus)
  end
  def get_policy(policy : XPS_SIGN_POLICY*) : HRESULT
    @lpVtbl.value.get_policy.unsafe_as(Proc(XPS_SIGN_POLICY*, HRESULT)).call(policy)
  end
  def get_custom_object_enumerator(customobjectenumerator : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_object_enumerator.unsafe_as(Proc(IOpcSignatureCustomObjectEnumerator*, HRESULT)).call(customobjectenumerator)
  end
  def get_custom_reference_enumerator(customreferenceenumerator : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_reference_enumerator.unsafe_as(Proc(IOpcSignatureReferenceEnumerator*, HRESULT)).call(customreferenceenumerator)
  end
  def get_signature_xml(signaturexml : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_xml.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(signaturexml, count)
  end
  def set_signature_xml(signaturexml : UInt8*, count : UInt32) : HRESULT
    @lpVtbl.value.set_signature_xml.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(signaturexml, count)
  end
end
struct LibWin32::IXpsSignatureBlockCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, signatureblock : IXpsSignatureBlock*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsSignatureBlock*, HRESULT)).call(index, signatureblock)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
end
struct LibWin32::IXpsSignatureBlock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_requests(requests : IXpsSignatureRequestCollection*) : HRESULT
    @lpVtbl.value.get_requests.unsafe_as(Proc(IXpsSignatureRequestCollection*, HRESULT)).call(requests)
  end
  def get_part_name(partname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(partname)
  end
  def get_document_index(fixeddocumentindex : UInt32*) : HRESULT
    @lpVtbl.value.get_document_index.unsafe_as(Proc(UInt32*, HRESULT)).call(fixeddocumentindex)
  end
  def get_document_name(fixeddocumentname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_document_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(fixeddocumentname)
  end
  def create_request(requestid : LibC::LPWSTR, signaturerequest : IXpsSignatureRequest*) : HRESULT
    @lpVtbl.value.create_request.unsafe_as(Proc(LibC::LPWSTR, IXpsSignatureRequest*, HRESULT)).call(requestid, signaturerequest)
  end
end
struct LibWin32::IXpsSignatureRequestCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_at(index : UInt32, signaturerequest : IXpsSignatureRequest*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, IXpsSignatureRequest*, HRESULT)).call(index, signaturerequest)
  end
  def remove_at(index : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
end
struct LibWin32::IXpsSignatureRequest
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_intent(intent : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_intent.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(intent)
  end
  def set_intent(intent : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_intent.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(intent)
  end
  def get_requested_signer(signername : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_requested_signer.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signername)
  end
  def set_requested_signer(signername : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_requested_signer.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(signername)
  end
  def get_request_sign_by_date(datestring : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_request_sign_by_date.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(datestring)
  end
  def set_request_sign_by_date(datestring : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_request_sign_by_date.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(datestring)
  end
  def get_signing_locale(place : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signing_locale.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(place)
  end
  def set_signing_locale(place : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_signing_locale.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(place)
  end
  def get_spot_location(pageindex : Int32*, pagepartname : IOpcPartUri*, x : Float32*, y : Float32*) : HRESULT
    @lpVtbl.value.get_spot_location.unsafe_as(Proc(Int32*, IOpcPartUri*, Float32*, Float32*, HRESULT)).call(pageindex, pagepartname, x, y)
  end
  def set_spot_location(pageindex : Int32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.set_spot_location.unsafe_as(Proc(Int32, Float32, Float32, HRESULT)).call(pageindex, x, y)
  end
  def get_request_id(requestid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_request_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(requestid)
  end
  def get_signature(signature : IXpsSignature*) : HRESULT
    @lpVtbl.value.get_signature.unsafe_as(Proc(IXpsSignature*, HRESULT)).call(signature)
  end
end
struct LibWin32::IXpsSignatureManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_package_file(filename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.load_package_file.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(filename)
  end
  def load_package_stream(stream : IStream) : HRESULT
    @lpVtbl.value.load_package_stream.unsafe_as(Proc(IStream, HRESULT)).call(stream)
  end
  def sign(signoptions : IXpsSigningOptions, x509certificate : CERT_CONTEXT*, signature : IXpsSignature*) : HRESULT
    @lpVtbl.value.sign.unsafe_as(Proc(IXpsSigningOptions, CERT_CONTEXT*, IXpsSignature*, HRESULT)).call(signoptions, x509certificate, signature)
  end
  def get_signature_origin_part_name(signatureoriginpartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_origin_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signatureoriginpartname)
  end
  def set_signature_origin_part_name(signatureoriginpartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_origin_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(signatureoriginpartname)
  end
  def get_signatures(signatures : IXpsSignatureCollection*) : HRESULT
    @lpVtbl.value.get_signatures.unsafe_as(Proc(IXpsSignatureCollection*, HRESULT)).call(signatures)
  end
  def add_signature_block(partname : IOpcPartUri, fixeddocumentindex : UInt32, signatureblock : IXpsSignatureBlock*) : HRESULT
    @lpVtbl.value.add_signature_block.unsafe_as(Proc(IOpcPartUri, UInt32, IXpsSignatureBlock*, HRESULT)).call(partname, fixeddocumentindex, signatureblock)
  end
  def get_signature_blocks(signatureblocks : IXpsSignatureBlockCollection*) : HRESULT
    @lpVtbl.value.get_signature_blocks.unsafe_as(Proc(IXpsSignatureBlockCollection*, HRESULT)).call(signatureblocks)
  end
  def create_signing_options(signingoptions : IXpsSigningOptions*) : HRESULT
    @lpVtbl.value.create_signing_options.unsafe_as(Proc(IXpsSigningOptions*, HRESULT)).call(signingoptions)
  end
  def save_package_to_file(filename : LibC::LPWSTR, securityattributes : SECURITY_ATTRIBUTES*, flagsandattributes : UInt32) : HRESULT
    @lpVtbl.value.save_package_to_file.unsafe_as(Proc(LibC::LPWSTR, SECURITY_ATTRIBUTES*, UInt32, HRESULT)).call(filename, securityattributes, flagsandattributes)
  end
  def save_package_to_stream(stream : IStream) : HRESULT
    @lpVtbl.value.save_package_to_stream.unsafe_as(Proc(IStream, HRESULT)).call(stream)
  end
end
