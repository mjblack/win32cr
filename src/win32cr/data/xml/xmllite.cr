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
  IID_IXmlReader = "7279fc81-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlWriter = "7279fc88-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlResolver = "7279fc82-709d-4095-b63d-69fe4b0d9030"


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    get_property : UInt64
    set_property : UInt64
    read : UInt64
    get_node_type : UInt64
    move_to_first_attribute : UInt64
    move_to_next_attribute : UInt64
    move_to_attribute_by_name : UInt64
    move_to_element : UInt64
    get_qualified_name : UInt64
    get_namespace_uri : UInt64
    get_local_name : UInt64
    get_prefix : UInt64
    get_value : UInt64
    read_value_chunk : UInt64
    get_base_uri : UInt64
    is_default : UInt64
    is_empty_element : UInt64
    get_line_number : UInt64
    get_line_position : UInt64
    get_attribute_count : UInt64
    get_depth : UInt64
    is_eof : UInt64
  end

  IXmlReader_GUID = "7279fc81-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlReader = LibC::GUID.new(0x7279fc81_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlReader
    lpVtbl : IXmlReaderVTbl*
  end

  struct IXmlResolverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    resolve_uri : UInt64
  end

  IXmlResolver_GUID = "7279fc82-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlResolver = LibC::GUID.new(0x7279fc82_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlResolver
    lpVtbl : IXmlResolverVTbl*
  end

  struct IXmlWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_output : UInt64
    get_property : UInt64
    set_property : UInt64
    write_attributes : UInt64
    write_attribute_string : UInt64
    write_c_data : UInt64
    write_char_entity : UInt64
    write_chars : UInt64
    write_comment : UInt64
    write_doc_type : UInt64
    write_element_string : UInt64
    write_end_document : UInt64
    write_end_element : UInt64
    write_entity_ref : UInt64
    write_full_end_element : UInt64
    write_name : UInt64
    write_nm_token : UInt64
    write_node : UInt64
    write_node_shallow : UInt64
    write_processing_instruction : UInt64
    write_qualified_name : UInt64
    write_raw : UInt64
    write_raw_chars : UInt64
    write_start_document : UInt64
    write_start_element : UInt64
    write_string : UInt64
    write_surrogate_char_entity : UInt64
    write_whitespace : UInt64
    flush : UInt64
  end

  IXmlWriter_GUID = "7279fc88-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlWriter = LibC::GUID.new(0x7279fc88_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
  struct IXmlWriter
    lpVtbl : IXmlWriterVTbl*
  end

  struct IXmlWriterLiteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_output : UInt64
    get_property : UInt64
    set_property : UInt64
    write_attributes : UInt64
    write_attribute_string : UInt64
    write_c_data : UInt64
    write_char_entity : UInt64
    write_chars : UInt64
    write_comment : UInt64
    write_doc_type : UInt64
    write_element_string : UInt64
    write_end_document : UInt64
    write_end_element : UInt64
    write_entity_ref : UInt64
    write_full_end_element : UInt64
    write_name : UInt64
    write_nm_token : UInt64
    write_node : UInt64
    write_node_shallow : UInt64
    write_processing_instruction : UInt64
    write_raw : UInt64
    write_raw_chars : UInt64
    write_start_document : UInt64
    write_start_element : UInt64
    write_string : UInt64
    write_surrogate_char_entity : UInt64
    write_whitespace : UInt64
    flush : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(pinput : IUnknown) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(IUnknown, HRESULT)).call(pinput)
  end
  def get_property(nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt32, LibC::IntPtrT*, HRESULT)).call(nproperty, ppvalue)
  end
  def set_property(nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt32, LibC::IntPtrT, HRESULT)).call(nproperty, pvalue)
  end
  def read(pnodetype : XmlNodeType*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(XmlNodeType*, HRESULT)).call(pnodetype)
  end
  def get_node_type(pnodetype : XmlNodeType*) : HRESULT
    @lpVtbl.value.get_node_type.unsafe_as(Proc(XmlNodeType*, HRESULT)).call(pnodetype)
  end
  def move_to_first_attribute : HRESULT
    @lpVtbl.value.move_to_first_attribute.unsafe_as(Proc(HRESULT)).call
  end
  def move_to_next_attribute : HRESULT
    @lpVtbl.value.move_to_next_attribute.unsafe_as(Proc(HRESULT)).call
  end
  def move_to_attribute_by_name(pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.move_to_attribute_by_name.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszlocalname, pwsznamespaceuri)
  end
  def move_to_element : HRESULT
    @lpVtbl.value.move_to_element.unsafe_as(Proc(HRESULT)).call
  end
  def get_qualified_name(ppwszqualifiedname : LibC::LPWSTR*, pcwchqualifiedname : UInt32*) : HRESULT
    @lpVtbl.value.get_qualified_name.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszqualifiedname, pcwchqualifiedname)
  end
  def get_namespace_uri(ppwsznamespaceuri : LibC::LPWSTR*, pcwchnamespaceuri : UInt32*) : HRESULT
    @lpVtbl.value.get_namespace_uri.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwsznamespaceuri, pcwchnamespaceuri)
  end
  def get_local_name(ppwszlocalname : LibC::LPWSTR*, pcwchlocalname : UInt32*) : HRESULT
    @lpVtbl.value.get_local_name.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszlocalname, pcwchlocalname)
  end
  def get_prefix(ppwszprefix : LibC::LPWSTR*, pcwchprefix : UInt32*) : HRESULT
    @lpVtbl.value.get_prefix.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszprefix, pcwchprefix)
  end
  def get_value(ppwszvalue : LibC::LPWSTR*, pcwchvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszvalue, pcwchvalue)
  end
  def read_value_chunk(pwchbuffer : Char*, cwchchunksize : UInt32, pcwchread : UInt32*) : HRESULT
    @lpVtbl.value.read_value_chunk.unsafe_as(Proc(Char*, UInt32, UInt32*, HRESULT)).call(pwchbuffer, cwchchunksize, pcwchread)
  end
  def get_base_uri(ppwszbaseuri : LibC::LPWSTR*, pcwchbaseuri : UInt32*) : HRESULT
    @lpVtbl.value.get_base_uri.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszbaseuri, pcwchbaseuri)
  end
  def is_default : LibC::BOOL
    @lpVtbl.value.is_default.unsafe_as(Proc(LibC::BOOL)).call
  end
  def is_empty_element : LibC::BOOL
    @lpVtbl.value.is_empty_element.unsafe_as(Proc(LibC::BOOL)).call
  end
  def get_line_number(pnlinenumber : UInt32*) : HRESULT
    @lpVtbl.value.get_line_number.unsafe_as(Proc(UInt32*, HRESULT)).call(pnlinenumber)
  end
  def get_line_position(pnlineposition : UInt32*) : HRESULT
    @lpVtbl.value.get_line_position.unsafe_as(Proc(UInt32*, HRESULT)).call(pnlineposition)
  end
  def get_attribute_count(pnattributecount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnattributecount)
  end
  def get_depth(pndepth : UInt32*) : HRESULT
    @lpVtbl.value.get_depth.unsafe_as(Proc(UInt32*, HRESULT)).call(pndepth)
  end
  def is_eof : LibC::BOOL
    @lpVtbl.value.is_eof.unsafe_as(Proc(LibC::BOOL)).call
  end
end
struct LibWin32::IXmlResolver
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def resolve_uri(pwszbaseuri : LibC::LPWSTR, pwszpublicidentifier : LibC::LPWSTR, pwszsystemidentifier : LibC::LPWSTR, ppresolvedinput : IUnknown*) : HRESULT
    @lpVtbl.value.resolve_uri.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, IUnknown*, HRESULT)).call(pwszbaseuri, pwszpublicidentifier, pwszsystemidentifier, ppresolvedinput)
  end
end
struct LibWin32::IXmlWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_output(poutput : IUnknown) : HRESULT
    @lpVtbl.value.set_output.unsafe_as(Proc(IUnknown, HRESULT)).call(poutput)
  end
  def get_property(nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt32, LibC::IntPtrT*, HRESULT)).call(nproperty, ppvalue)
  end
  def set_property(nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt32, LibC::IntPtrT, HRESULT)).call(nproperty, pvalue)
  end
  def write_attributes(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_attributes.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_attribute_string(pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_attribute_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprefix, pwszlocalname, pwsznamespaceuri, pwszvalue)
  end
  def write_c_data(pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_c_data.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsztext)
  end
  def write_char_entity(wch : Char) : HRESULT
    @lpVtbl.value.write_char_entity.unsafe_as(Proc(Char, HRESULT)).call(wch)
  end
  def write_chars(pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_chars.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwch, cwch)
  end
  def write_comment(pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_comment.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcomment)
  end
  def write_doc_type(pwszname : LibC::LPWSTR, pwszpublicid : LibC::LPWSTR, pwszsystemid : LibC::LPWSTR, pwszsubset : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_doc_type.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszname, pwszpublicid, pwszsystemid, pwszsubset)
  end
  def write_element_string(pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_element_string.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprefix, pwszlocalname, pwsznamespaceuri, pwszvalue)
  end
  def write_end_document : HRESULT
    @lpVtbl.value.write_end_document.unsafe_as(Proc(HRESULT)).call
  end
  def write_end_element : HRESULT
    @lpVtbl.value.write_end_element.unsafe_as(Proc(HRESULT)).call
  end
  def write_entity_ref(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_entity_ref.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def write_full_end_element : HRESULT
    @lpVtbl.value.write_full_end_element.unsafe_as(Proc(HRESULT)).call
  end
  def write_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def write_nm_token(pwsznmtoken : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_nm_token.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsznmtoken)
  end
  def write_node(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_node_shallow(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node_shallow.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_processing_instruction(pwszname : LibC::LPWSTR, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_processing_instruction.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszname, pwsztext)
  end
  def write_qualified_name(pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_qualified_name.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszlocalname, pwsznamespaceuri)
  end
  def write_raw(pwszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_raw.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdata)
  end
  def write_raw_chars(pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_raw_chars.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwch, cwch)
  end
  def write_start_document(standalone : XmlStandalone) : HRESULT
    @lpVtbl.value.write_start_document.unsafe_as(Proc(XmlStandalone, HRESULT)).call(standalone)
  end
  def write_start_element(pwszprefix : LibC::LPWSTR, pwszlocalname : LibC::LPWSTR, pwsznamespaceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_start_element.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprefix, pwszlocalname, pwsznamespaceuri)
  end
  def write_string(pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_string.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsztext)
  end
  def write_surrogate_char_entity(wchlow : Char, wchhigh : Char) : HRESULT
    @lpVtbl.value.write_surrogate_char_entity.unsafe_as(Proc(Char, Char, HRESULT)).call(wchlow, wchhigh)
  end
  def write_whitespace(pwszwhitespace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_whitespace.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszwhitespace)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IXmlWriterLite
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_output(poutput : IUnknown) : HRESULT
    @lpVtbl.value.set_output.unsafe_as(Proc(IUnknown, HRESULT)).call(poutput)
  end
  def get_property(nproperty : UInt32, ppvalue : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt32, LibC::IntPtrT*, HRESULT)).call(nproperty, ppvalue)
  end
  def set_property(nproperty : UInt32, pvalue : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt32, LibC::IntPtrT, HRESULT)).call(nproperty, pvalue)
  end
  def write_attributes(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_attributes.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_attribute_string(pwszqname : Char*, cwszqname : UInt32, pwszvalue : Char*, cwszvalue : UInt32) : HRESULT
    @lpVtbl.value.write_attribute_string.unsafe_as(Proc(Char*, UInt32, Char*, UInt32, HRESULT)).call(pwszqname, cwszqname, pwszvalue, cwszvalue)
  end
  def write_c_data(pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_c_data.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsztext)
  end
  def write_char_entity(wch : Char) : HRESULT
    @lpVtbl.value.write_char_entity.unsafe_as(Proc(Char, HRESULT)).call(wch)
  end
  def write_chars(pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_chars.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwch, cwch)
  end
  def write_comment(pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_comment.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcomment)
  end
  def write_doc_type(pwszname : LibC::LPWSTR, pwszpublicid : LibC::LPWSTR, pwszsystemid : LibC::LPWSTR, pwszsubset : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_doc_type.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszname, pwszpublicid, pwszsystemid, pwszsubset)
  end
  def write_element_string(pwszqname : Char*, cwszqname : UInt32, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_element_string.unsafe_as(Proc(Char*, UInt32, LibC::LPWSTR, HRESULT)).call(pwszqname, cwszqname, pwszvalue)
  end
  def write_end_document : HRESULT
    @lpVtbl.value.write_end_document.unsafe_as(Proc(HRESULT)).call
  end
  def write_end_element(pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_end_element.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszqname, cwszqname)
  end
  def write_entity_ref(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_entity_ref.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def write_full_end_element(pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_full_end_element.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszqname, cwszqname)
  end
  def write_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def write_nm_token(pwsznmtoken : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_nm_token.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsznmtoken)
  end
  def write_node(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_node_shallow(preader : IXmlReader, fwritedefaultattributes : LibC::BOOL) : HRESULT
    @lpVtbl.value.write_node_shallow.unsafe_as(Proc(IXmlReader, LibC::BOOL, HRESULT)).call(preader, fwritedefaultattributes)
  end
  def write_processing_instruction(pwszname : LibC::LPWSTR, pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_processing_instruction.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszname, pwsztext)
  end
  def write_raw(pwszdata : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_raw.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdata)
  end
  def write_raw_chars(pwch : Char*, cwch : UInt32) : HRESULT
    @lpVtbl.value.write_raw_chars.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwch, cwch)
  end
  def write_start_document(standalone : XmlStandalone) : HRESULT
    @lpVtbl.value.write_start_document.unsafe_as(Proc(XmlStandalone, HRESULT)).call(standalone)
  end
  def write_start_element(pwszqname : Char*, cwszqname : UInt32) : HRESULT
    @lpVtbl.value.write_start_element.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszqname, cwszqname)
  end
  def write_string(pwsztext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_string.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwsztext)
  end
  def write_surrogate_char_entity(wchlow : Char, wchhigh : Char) : HRESULT
    @lpVtbl.value.write_surrogate_char_entity.unsafe_as(Proc(Char, Char, HRESULT)).call(wchlow, wchhigh)
  end
  def write_whitespace(pwszwhitespace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.write_whitespace.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszwhitespace)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
