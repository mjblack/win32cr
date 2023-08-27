require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:xmllite.dll")]
{% else %}
@[Link("xmllite")]
{% end %}
lib LibWin32

  enum XmlNodeType : Int32
    XmlNodeType_None = 0
    XmlNodeType_Element = 1
    XmlNodeType_Attribute = 2
    XmlNodeType_Text = 3
    XmlNodeType_CDATA = 4
    XmlNodeType_ProcessingInstruction = 7
    XmlNodeType_Comment = 8
    XmlNodeType_DocumentType = 10
    XmlNodeType_Whitespace = 13
    XmlNodeType_EndElement = 15
    XmlNodeType_XmlDeclaration = 17
    XmlNodeType_Last = 17
  end

  enum XmlConformanceLevel : Int32
    XmlConformanceLevel_Auto = 0
    XmlConformanceLevel_Fragment = 1
    XmlConformanceLevel_Document = 2
    XmlConformanceLevel_Last = 2
  end

  enum DtdProcessing : Int32
    DtdProcessing_Prohibit = 0
    DtdProcessing_Parse = 1
    DtdProcessing_Last = 1
  end

  enum XmlReadState : Int32
    XmlReadState_Initial = 0
    XmlReadState_Interactive = 1
    XmlReadState_Error = 2
    XmlReadState_EndOfFile = 3
    XmlReadState_Closed = 4
  end

  enum XmlReaderProperty : Int32
    XmlReaderProperty_MultiLanguage = 0
    XmlReaderProperty_ConformanceLevel = 1
    XmlReaderProperty_RandomAccess = 2
    XmlReaderProperty_XmlResolver = 3
    XmlReaderProperty_DtdProcessing = 4
    XmlReaderProperty_ReadState = 5
    XmlReaderProperty_MaxElementDepth = 6
    XmlReaderProperty_MaxEntityExpansion = 7
    XmlReaderProperty_Last = 7
  end

  enum XmlError : Int32
    MX_E_MX = -1072894464
    MX_E_INPUTEND = -1072894463
    MX_E_ENCODING = -1072894462
    MX_E_ENCODINGSWITCH = -1072894461
    MX_E_ENCODINGSIGNATURE = -1072894460
    WC_E_WC = -1072894432
    WC_E_WHITESPACE = -1072894431
    WC_E_SEMICOLON = -1072894430
    WC_E_GREATERTHAN = -1072894429
    WC_E_QUOTE = -1072894428
    WC_E_EQUAL = -1072894427
    WC_E_LESSTHAN = -1072894426
    WC_E_HEXDIGIT = -1072894425
    WC_E_DIGIT = -1072894424
    WC_E_LEFTBRACKET = -1072894423
    WC_E_LEFTPAREN = -1072894422
    WC_E_XMLCHARACTER = -1072894421
    WC_E_NAMECHARACTER = -1072894420
    WC_E_SYNTAX = -1072894419
    WC_E_CDSECT = -1072894418
    WC_E_COMMENT = -1072894417
    WC_E_CONDSECT = -1072894416
    WC_E_DECLATTLIST = -1072894415
    WC_E_DECLDOCTYPE = -1072894414
    WC_E_DECLELEMENT = -1072894413
    WC_E_DECLENTITY = -1072894412
    WC_E_DECLNOTATION = -1072894411
    WC_E_NDATA = -1072894410
    WC_E_PUBLIC = -1072894409
    WC_E_SYSTEM = -1072894408
    WC_E_NAME = -1072894407
    WC_E_ROOTELEMENT = -1072894406
    WC_E_ELEMENTMATCH = -1072894405
    WC_E_UNIQUEATTRIBUTE = -1072894404
    WC_E_TEXTXMLDECL = -1072894403
    WC_E_LEADINGXML = -1072894402
    WC_E_TEXTDECL = -1072894401
    WC_E_XMLDECL = -1072894400
    WC_E_ENCNAME = -1072894399
    WC_E_PUBLICID = -1072894398
    WC_E_PESINTERNALSUBSET = -1072894397
    WC_E_PESBETWEENDECLS = -1072894396
    WC_E_NORECURSION = -1072894395
    WC_E_ENTITYCONTENT = -1072894394
    WC_E_UNDECLAREDENTITY = -1072894393
    WC_E_PARSEDENTITY = -1072894392
    WC_E_NOEXTERNALENTITYREF = -1072894391
    WC_E_PI = -1072894390
    WC_E_SYSTEMID = -1072894389
    WC_E_QUESTIONMARK = -1072894388
    WC_E_CDSECTEND = -1072894387
    WC_E_MOREDATA = -1072894386
    WC_E_DTDPROHIBITED = -1072894385
    WC_E_INVALIDXMLSPACE = -1072894384
    NC_E_NC = -1072894368
    NC_E_QNAMECHARACTER = -1072894367
    NC_E_QNAMECOLON = -1072894366
    NC_E_NAMECOLON = -1072894365
    NC_E_DECLAREDPREFIX = -1072894364
    NC_E_UNDECLAREDPREFIX = -1072894363
    NC_E_EMPTYURI = -1072894362
    NC_E_XMLPREFIXRESERVED = -1072894361
    NC_E_XMLNSPREFIXRESERVED = -1072894360
    NC_E_XMLURIRESERVED = -1072894359
    NC_E_XMLNSURIRESERVED = -1072894358
    SC_E_SC = -1072894336
    SC_E_MAXELEMENTDEPTH = -1072894335
    SC_E_MAXENTITYEXPANSION = -1072894334
    WR_E_WR = -1072894208
    WR_E_NONWHITESPACE = -1072894207
    WR_E_NSPREFIXDECLARED = -1072894206
    WR_E_NSPREFIXWITHEMPTYNSURI = -1072894205
    WR_E_DUPLICATEATTRIBUTE = -1072894204
    WR_E_XMLNSPREFIXDECLARATION = -1072894203
    WR_E_XMLPREFIXDECLARATION = -1072894202
    WR_E_XMLURIDECLARATION = -1072894201
    WR_E_XMLNSURIDECLARATION = -1072894200
    WR_E_NAMESPACEUNDECLARED = -1072894199
    WR_E_INVALIDXMLSPACE = -1072894198
    WR_E_INVALIDACTION = -1072894197
    WR_E_INVALIDSURROGATEPAIR = -1072894196
    XML_E_INVALID_DECIMAL = -1072898019
    XML_E_INVALID_HEXIDECIMAL = -1072898018
    XML_E_INVALID_UNICODE = -1072898017
    XML_E_INVALIDENCODING = -1072897938
  end

  enum XmlStandalone : Int32
    XmlStandalone_Omit = 0
    XmlStandalone_Yes = 1
    XmlStandalone_No = 2
    XmlStandalone_Last = 2
  end

  enum XmlWriterProperty : Int32
    XmlWriterProperty_MultiLanguage = 0
    XmlWriterProperty_Indent = 1
    XmlWriterProperty_ByteOrderMark = 2
    XmlWriterProperty_OmitXmlDeclaration = 3
    XmlWriterProperty_ConformanceLevel = 4
    XmlWriterProperty_CompactEmptyElement = 5
    XmlWriterProperty_Last = 5
  end


  struct IXmlReaderVTbl
    query_interface : Proc(IXmlReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXmlReader*, UInt32)
    release : Proc(IXmlReader*, UInt32)
    set_input : Proc(IXmlReader*, IUnknown, HRESULT)
    get_property : Proc(IXmlReader*, UInt32, LibC::IntPtrT*, HRESULT)
    set_property : Proc(IXmlReader*, UInt32, LibC::IntPtrT, HRESULT)
    read : Proc(IXmlReader*, XmlNodeType*, HRESULT)
    get_node_type : Proc(IXmlReader*, XmlNodeType*, HRESULT)
    move_to_first_attribute : Proc(IXmlReader*, HRESULT)
    move_to_next_attribute : Proc(IXmlReader*, HRESULT)
    move_to_attribute_by_name : Proc(IXmlReader*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    move_to_element : Proc(IXmlReader*, HRESULT)
    get_qualified_name : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_namespace_uri : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_local_name : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_prefix : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_value : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    read_value_chunk : Proc(IXmlReader*, Char*, UInt32, UInt32*, HRESULT)
    get_base_uri : Proc(IXmlReader*, LibC::LPWSTR*, UInt32*, HRESULT)
    is_default : Proc(IXmlReader*, LibC::BOOL)
    is_empty_element : Proc(IXmlReader*, LibC::BOOL)
    get_line_number : Proc(IXmlReader*, UInt32*, HRESULT)
    get_line_position : Proc(IXmlReader*, UInt32*, HRESULT)
    get_attribute_count : Proc(IXmlReader*, UInt32*, HRESULT)
    get_depth : Proc(IXmlReader*, UInt32*, HRESULT)
    is_eof : Proc(IXmlReader*, LibC::BOOL)
  end

  IXmlReader_GUID = "7279fc81-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlReader = LibC::GUID.new(0x7279fc81_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlReader
    lpVtbl : IXmlReaderVTbl*
  end

  struct IXmlResolverVTbl
    query_interface : Proc(IXmlResolver*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXmlResolver*, UInt32)
    release : Proc(IXmlResolver*, UInt32)
    resolve_uri : Proc(IXmlResolver*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, IUnknown*, HRESULT)
  end

  IXmlResolver_GUID = "7279fc82-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlResolver = LibC::GUID.new(0x7279fc82_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlResolver
    lpVtbl : IXmlResolverVTbl*
  end

  struct IXmlWriterVTbl
    query_interface : Proc(IXmlWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXmlWriter*, UInt32)
    release : Proc(IXmlWriter*, UInt32)
    set_output : Proc(IXmlWriter*, IUnknown, HRESULT)
    get_property : Proc(IXmlWriter*, UInt32, LibC::IntPtrT*, HRESULT)
    set_property : Proc(IXmlWriter*, UInt32, LibC::IntPtrT, HRESULT)
    write_attributes : Proc(IXmlWriter*, IXmlReader, LibC::BOOL, HRESULT)
    write_attribute_string : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_c_data : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_char_entity : Proc(IXmlWriter*, Char, HRESULT)
    write_chars : Proc(IXmlWriter*, Char*, UInt32, HRESULT)
    write_comment : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_doc_type : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_element_string : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_end_document : Proc(IXmlWriter*, HRESULT)
    write_end_element : Proc(IXmlWriter*, HRESULT)
    write_entity_ref : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_full_end_element : Proc(IXmlWriter*, HRESULT)
    write_name : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_nm_token : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_node : Proc(IXmlWriter*, IXmlReader, LibC::BOOL, HRESULT)
    write_node_shallow : Proc(IXmlWriter*, IXmlReader, LibC::BOOL, HRESULT)
    write_processing_instruction : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_qualified_name : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_raw : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_raw_chars : Proc(IXmlWriter*, Char*, UInt32, HRESULT)
    write_start_document : Proc(IXmlWriter*, XmlStandalone, HRESULT)
    write_start_element : Proc(IXmlWriter*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_string : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    write_surrogate_char_entity : Proc(IXmlWriter*, Char, Char, HRESULT)
    write_whitespace : Proc(IXmlWriter*, LibC::LPWSTR, HRESULT)
    flush : Proc(IXmlWriter*, HRESULT)
  end

  IXmlWriter_GUID = "7279fc88-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlWriter = LibC::GUID.new(0x7279fc88_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlWriter
    lpVtbl : IXmlWriterVTbl*
  end

  struct IXmlWriterLiteVTbl
    query_interface : Proc(IXmlWriterLite*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXmlWriterLite*, UInt32)
    release : Proc(IXmlWriterLite*, UInt32)
    set_output : Proc(IXmlWriterLite*, IUnknown, HRESULT)
    get_property : Proc(IXmlWriterLite*, UInt32, LibC::IntPtrT*, HRESULT)
    set_property : Proc(IXmlWriterLite*, UInt32, LibC::IntPtrT, HRESULT)
    write_attributes : Proc(IXmlWriterLite*, IXmlReader, LibC::BOOL, HRESULT)
    write_attribute_string : Proc(IXmlWriterLite*, Char*, UInt32, Char*, UInt32, HRESULT)
    write_c_data : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_char_entity : Proc(IXmlWriterLite*, Char, HRESULT)
    write_chars : Proc(IXmlWriterLite*, Char*, UInt32, HRESULT)
    write_comment : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_doc_type : Proc(IXmlWriterLite*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_element_string : Proc(IXmlWriterLite*, Char*, UInt32, LibC::LPWSTR, HRESULT)
    write_end_document : Proc(IXmlWriterLite*, HRESULT)
    write_end_element : Proc(IXmlWriterLite*, Char*, UInt32, HRESULT)
    write_entity_ref : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_full_end_element : Proc(IXmlWriterLite*, Char*, UInt32, HRESULT)
    write_name : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_nm_token : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_node : Proc(IXmlWriterLite*, IXmlReader, LibC::BOOL, HRESULT)
    write_node_shallow : Proc(IXmlWriterLite*, IXmlReader, LibC::BOOL, HRESULT)
    write_processing_instruction : Proc(IXmlWriterLite*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    write_raw : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_raw_chars : Proc(IXmlWriterLite*, Char*, UInt32, HRESULT)
    write_start_document : Proc(IXmlWriterLite*, XmlStandalone, HRESULT)
    write_start_element : Proc(IXmlWriterLite*, Char*, UInt32, HRESULT)
    write_string : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    write_surrogate_char_entity : Proc(IXmlWriterLite*, Char, Char, HRESULT)
    write_whitespace : Proc(IXmlWriterLite*, LibC::LPWSTR, HRESULT)
    flush : Proc(IXmlWriterLite*, HRESULT)
  end

  IXmlWriterLite_GUID = "862494c6-1310-4aad-b3cd-2dbeebf670d3"
  IID_IXmlWriterLite = LibC::GUID.new(0x862494c6_u32, 0x1310_u16, 0x4aad_u16, StaticArray[0xb3_u8, 0xcd_u8, 0x2d_u8, 0xbe_u8, 0xeb_u8, 0xf6_u8, 0x70_u8, 0xd3_u8])
  struct IXmlWriterLite
    lpVtbl : IXmlWriterLiteVTbl*
  end


  # Params # riid : Guid* [In],ppvobject : Void** [In],pmalloc : IMalloc [In]
  fun CreateXmlReader(riid : Guid*, ppvobject : Void**, pmalloc : IMalloc) : HRESULT

  # Params # pinputstream : IUnknown [In],pmalloc : IMalloc [In],nencodingcodepage : UInt32 [In],fencodinghint : LibC::BOOL [In],pwszbaseuri : LibC::LPWSTR [In],ppinput : IUnknown* [In]
  fun CreateXmlReaderInputWithEncodingCodePage(pinputstream : IUnknown, pmalloc : IMalloc, nencodingcodepage : UInt32, fencodinghint : LibC::BOOL, pwszbaseuri : LibC::LPWSTR, ppinput : IUnknown*) : HRESULT

  # Params # pinputstream : IUnknown [In],pmalloc : IMalloc [In],pwszencodingname : LibC::LPWSTR [In],fencodinghint : LibC::BOOL [In],pwszbaseuri : LibC::LPWSTR [In],ppinput : IUnknown* [In]
  fun CreateXmlReaderInputWithEncodingName(pinputstream : IUnknown, pmalloc : IMalloc, pwszencodingname : LibC::LPWSTR, fencodinghint : LibC::BOOL, pwszbaseuri : LibC::LPWSTR, ppinput : IUnknown*) : HRESULT

  # Params # riid : Guid* [In],ppvobject : Void** [In],pmalloc : IMalloc [In]
  fun CreateXmlWriter(riid : Guid*, ppvobject : Void**, pmalloc : IMalloc) : HRESULT

  # Params # poutputstream : IUnknown [In],pmalloc : IMalloc [In],nencodingcodepage : UInt32 [In],ppoutput : IUnknown* [In]
  fun CreateXmlWriterOutputWithEncodingCodePage(poutputstream : IUnknown, pmalloc : IMalloc, nencodingcodepage : UInt32, ppoutput : IUnknown*) : HRESULT

  # Params # poutputstream : IUnknown [In],pmalloc : IMalloc [In],pwszencodingname : LibC::LPWSTR [In],ppoutput : IUnknown* [In]
  fun CreateXmlWriterOutputWithEncodingName(poutputstream : IUnknown, pmalloc : IMalloc, pwszencodingname : LibC::LPWSTR, ppoutput : IUnknown*) : HRESULT
end
struct LibWin32::IXmlReader
  def query_interface(this : IXmlReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXmlReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXmlReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IXmlReader*, pinput : IUnknown) : HRESULT
    @lpVtbl.value.set_input.call(this, pinput)
  end
  def get_property(this : IXmlReader*, nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.call(this, nproperty, ppvalue)
  end
  def set_property(this : IXmlReader*, nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.call(this, nproperty, pvalue)
  end
  def read(this : IXmlReader*, pnodetype : XmlNodeType*) : HRESULT
    @lpVtbl.value.read.call(this, pnodetype)
  end
  def get_node_type(this : IXmlReader*, pnodetype : XmlNodeType*) : HRESULT
    @lpVtbl.value.get_node_type.call(this, pnodetype)
  end
  def move_to_first_attribute(this : IXmlReader*) : HRESULT
    @lpVtbl.value.move_to_first_attribute.call(this)
  end
  def move_to_next_attribute(this : IXmlReader*) : HRESULT
    @lpVtbl.value.move_to_next_attribute.call(this)
  end
  def move_to_attribute_by_name(this : IXmlReader*, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.move_to_attribute_by_name.call(this, pwszlocalname, pwsznamespaceuri)
  end
  def move_to_element(this : IXmlReader*) : HRESULT
    @lpVtbl.value.move_to_element.call(this)
  end
  def get_qualified_name(this : IXmlReader*, ppwszqualifiedname : LibC::LPWSTR*, pcwchqualifiedname : UInt32*) : HRESULT
    @lpVtbl.value.get_qualified_name.call(this, ppwszqualifiedname, pcwchqualifiedname)
  end
  def get_namespace_uri(this : IXmlReader*, ppwsznamespaceuri : LibC::LPWSTR*, pcwchnamespaceuri : UInt32*) : HRESULT
    @lpVtbl.value.get_namespace_uri.call(this, ppwsznamespaceuri, pcwchnamespaceuri)
  end
  def get_local_name(this : IXmlReader*, ppwszlocalname : LibC::LPWSTR*, pcwchlocalname : UInt32*) : HRESULT
    @lpVtbl.value.get_local_name.call(this, ppwszlocalname, pcwchlocalname)
  end
  def get_prefix(this : IXmlReader*, ppwszprefix : LibC::LPWSTR*, pcwchprefix : UInt32*) : HRESULT
    @lpVtbl.value.get_prefix.call(this, ppwszprefix, pcwchprefix)
  end
  def get_value(this : IXmlReader*, ppwszvalue : LibC::LPWSTR*, pcwchvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_value.call(this, ppwszvalue, pcwchvalue)
  end
  def read_value_chunk(this : IXmlReader*, pwchbuffer : Char*, cwchchunksize : UInt32, pcwchread : UInt32*) : HRESULT
    @lpVtbl.value.read_value_chunk.call(this, pwchbuffer, cwchchunksize, pcwchread)
  end
  def get_base_uri(this : IXmlReader*, ppwszbaseuri : LibC::LPWSTR*, pcwchbaseuri : UInt32*) : HRESULT
    @lpVtbl.value.get_base_uri.call(this, ppwszbaseuri, pcwchbaseuri)
  end
  def is_default(this : IXmlReader*) : LibC::BOOL
    @lpVtbl.value.is_default.call(this)
  end
  def is_empty_element(this : IXmlReader*) : LibC::BOOL
    @lpVtbl.value.is_empty_element.call(this)
  end
  def get_line_number(this : IXmlReader*, pnlinenumber : UInt32*) : HRESULT
    @lpVtbl.value.get_line_number.call(this, pnlinenumber)
  end
  def get_line_position(this : IXmlReader*, pnlineposition : UInt32*) : HRESULT
    @lpVtbl.value.get_line_position.call(this, pnlineposition)
  end
  def get_attribute_count(this : IXmlReader*, pnattributecount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_count.call(this, pnattributecount)
  end
  def get_depth(this : IXmlReader*, pndepth : UInt32*) : HRESULT
    @lpVtbl.value.get_depth.call(this, pndepth)
  end
  def is_eof(this : IXmlReader*) : LibC::BOOL
    @lpVtbl.value.is_eof.call(this)
  end
end
struct LibWin32::IXmlResolver
  def query_interface(this : IXmlResolver*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXmlResolver*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXmlResolver*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def resolve_uri(this : IXmlResolver*, pwszbaseuri : LibC::LPWSTR, pwszpublicidentifier : LibC::LPWSTR, pwszsystemidentifier : LibC::LPWSTR, ppresolvedinput : IUnknown*) : HRESULT
    @lpVtbl.value.resolve_uri.call(this, pwszbaseuri, pwszpublicidentifier, pwszsystemidentifier, ppresolvedinput)
  end
end
struct LibWin32::IXmlWriter
  def query_interface(this : IXmlWriter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXmlWriter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXmlWriter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_output(this : IXmlWriter*, poutput : IUnknown) : HRESULT
    @lpVtbl.value.set_output.call(this, poutput)
  end
  def get_property(this : IXmlWriter*, nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.call(this, nproperty, ppvalue)
  end
  def set_property(this : IXmlWriter*, nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.call(this, nproperty, pvalue)
  end
  def write_attributes(this : IXmlWriter*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_attributes.call(this, preader, fwritedefaultattributes)
  end
  def write_attribute_string(this : IXmlWriter*, pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_attribute_string.call(this, pwszprefix, pwszlocalname, pwsznamespaceuri, pwszvalue)
  end
  def write_c_data(this : IXmlWriter*, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_c_data.call(this, pwsztext)
  end
  def write_char_entity(this : IXmlWriter*, wch : Char) : HRESULT
    @lpVtbl.value.write_char_entity.call(this, wch)
  end
  def write_chars(this : IXmlWriter*, pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_chars.call(this, pwch, cwch)
  end
  def write_comment(this : IXmlWriter*, pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_comment.call(this, pwszcomment)
  end
  def write_doc_type(this : IXmlWriter*, pwszname : LibC::LPWSTR, pwszpublicid : LibC::LPWSTR, pwszsystemid : LibC::LPWSTR, pwszsubset : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_doc_type.call(this, pwszname, pwszpublicid, pwszsystemid, pwszsubset)
  end
  def write_element_string(this : IXmlWriter*, pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_element_string.call(this, pwszprefix, pwszlocalname, pwsznamespaceuri, pwszvalue)
  end
  def write_end_document(this : IXmlWriter*) : HRESULT
    @lpVtbl.value.write_end_document.call(this)
  end
  def write_end_element(this : IXmlWriter*) : HRESULT
    @lpVtbl.value.write_end_element.call(this)
  end
  def write_entity_ref(this : IXmlWriter*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_entity_ref.call(this, pwszname)
  end
  def write_full_end_element(this : IXmlWriter*) : HRESULT
    @lpVtbl.value.write_full_end_element.call(this)
  end
  def write_name(this : IXmlWriter*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_name.call(this, pwszname)
  end
  def write_nm_token(this : IXmlWriter*, pwsznmtoken : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_nm_token.call(this, pwsznmtoken)
  end
  def write_node(this : IXmlWriter*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node.call(this, preader, fwritedefaultattributes)
  end
  def write_node_shallow(this : IXmlWriter*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node_shallow.call(this, preader, fwritedefaultattributes)
  end
  def write_processing_instruction(this : IXmlWriter*, pwszname : LibC::LPWSTR, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_processing_instruction.call(this, pwszname, pwsztext)
  end
  def write_qualified_name(this : IXmlWriter*, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_qualified_name.call(this, pwszlocalname, pwsznamespaceuri)
  end
  def write_raw(this : IXmlWriter*, pwszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_raw.call(this, pwszdata)
  end
  def write_raw_chars(this : IXmlWriter*, pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_raw_chars.call(this, pwch, cwch)
  end
  def write_start_document(this : IXmlWriter*, standalone : XmlStandalone) : HRESULT
    @lpVtbl.value.write_start_document.call(this, standalone)
  end
  def write_start_element(this : IXmlWriter*, pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_start_element.call(this, pwszprefix, pwszlocalname, pwsznamespaceuri)
  end
  def write_string(this : IXmlWriter*, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_string.call(this, pwsztext)
  end
  def write_surrogate_char_entity(this : IXmlWriter*, wchlow : Char, wchhigh : Char) : HRESULT
    @lpVtbl.value.write_surrogate_char_entity.call(this, wchlow, wchhigh)
  end
  def write_whitespace(this : IXmlWriter*, pwszwhitespace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_whitespace.call(this, pwszwhitespace)
  end
  def flush(this : IXmlWriter*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
end
struct LibWin32::IXmlWriterLite
  def query_interface(this : IXmlWriterLite*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXmlWriterLite*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXmlWriterLite*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_output(this : IXmlWriterLite*, poutput : IUnknown) : HRESULT
    @lpVtbl.value.set_output.call(this, poutput)
  end
  def get_property(this : IXmlWriterLite*, nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.call(this, nproperty, ppvalue)
  end
  def set_property(this : IXmlWriterLite*, nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.call(this, nproperty, pvalue)
  end
  def write_attributes(this : IXmlWriterLite*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_attributes.call(this, preader, fwritedefaultattributes)
  end
  def write_attribute_string(this : IXmlWriterLite*, pwszqname : Char*, cwszqname : UInt32, pwszvalue : Char*, cwszvalue : UInt32) : HRESULT
    @lpVtbl.value.write_attribute_string.call(this, pwszqname, cwszqname, pwszvalue, cwszvalue)
  end
  def write_c_data(this : IXmlWriterLite*, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_c_data.call(this, pwsztext)
  end
  def write_char_entity(this : IXmlWriterLite*, wch : Char) : HRESULT
    @lpVtbl.value.write_char_entity.call(this, wch)
  end
  def write_chars(this : IXmlWriterLite*, pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_chars.call(this, pwch, cwch)
  end
  def write_comment(this : IXmlWriterLite*, pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_comment.call(this, pwszcomment)
  end
  def write_doc_type(this : IXmlWriterLite*, pwszname : LibC::LPWSTR, pwszpublicid : LibC::LPWSTR, pwszsystemid : LibC::LPWSTR, pwszsubset : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_doc_type.call(this, pwszname, pwszpublicid, pwszsystemid, pwszsubset)
  end
  def write_element_string(this : IXmlWriterLite*, pwszqname : Char*, cwszqname : UInt32, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_element_string.call(this, pwszqname, cwszqname, pwszvalue)
  end
  def write_end_document(this : IXmlWriterLite*) : HRESULT
    @lpVtbl.value.write_end_document.call(this)
  end
  def write_end_element(this : IXmlWriterLite*, pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_end_element.call(this, pwszqname, cwszqname)
  end
  def write_entity_ref(this : IXmlWriterLite*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_entity_ref.call(this, pwszname)
  end
  def write_full_end_element(this : IXmlWriterLite*, pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_full_end_element.call(this, pwszqname, cwszqname)
  end
  def write_name(this : IXmlWriterLite*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_name.call(this, pwszname)
  end
  def write_nm_token(this : IXmlWriterLite*, pwsznmtoken : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_nm_token.call(this, pwsznmtoken)
  end
  def write_node(this : IXmlWriterLite*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node.call(this, preader, fwritedefaultattributes)
  end
  def write_node_shallow(this : IXmlWriterLite*, preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node_shallow.call(this, preader, fwritedefaultattributes)
  end
  def write_processing_instruction(this : IXmlWriterLite*, pwszname : LibC::LPWSTR, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_processing_instruction.call(this, pwszname, pwsztext)
  end
  def write_raw(this : IXmlWriterLite*, pwszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_raw.call(this, pwszdata)
  end
  def write_raw_chars(this : IXmlWriterLite*, pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_raw_chars.call(this, pwch, cwch)
  end
  def write_start_document(this : IXmlWriterLite*, standalone : XmlStandalone) : HRESULT
    @lpVtbl.value.write_start_document.call(this, standalone)
  end
  def write_start_element(this : IXmlWriterLite*, pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_start_element.call(this, pwszqname, cwszqname)
  end
  def write_string(this : IXmlWriterLite*, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_string.call(this, pwsztext)
  end
  def write_surrogate_char_entity(this : IXmlWriterLite*, wchlow : Char, wchhigh : Char) : HRESULT
    @lpVtbl.value.write_surrogate_char_entity.call(this, wchlow, wchhigh)
  end
  def write_whitespace(this : IXmlWriterLite*, pwszwhitespace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_whitespace.call(this, pwszwhitespace)
  end
  def flush(this : IXmlWriterLite*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
end
