require "./../../system/com.cr"
require "./../../foundation.cr"

module Win32cr::Data::Xml::XmlLite
  IID_IXmlReader = "7279fc81-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlWriter = "7279fc88-709d-4095-b63d-69fe4b0d9030"
  IID_IXmlResolver = "7279fc82-709d-4095-b63d-69fe4b0d9030"

  enum XmlNodeType
    XmlNodeType_None = 0_i32
    XmlNodeType_Element = 1_i32
    XmlNodeType_Attribute = 2_i32
    XmlNodeType_Text = 3_i32
    XmlNodeType_CDATA = 4_i32
    XmlNodeType_ProcessingInstruction = 7_i32
    XmlNodeType_Comment = 8_i32
    XmlNodeType_DocumentType = 10_i32
    XmlNodeType_Whitespace = 13_i32
    XmlNodeType_EndElement = 15_i32
    XmlNodeType_XmlDeclaration = 17_i32
    XmlNodeType_Last = 17_i32
  end
  enum XmlConformanceLevel
    XmlConformanceLevel_Auto = 0_i32
    XmlConformanceLevel_Fragment = 1_i32
    XmlConformanceLevel_Document = 2_i32
    XmlConformanceLevel_Last = 2_i32
  end
  enum DtdProcessing
    DtdProcessing_Prohibit = 0_i32
    DtdProcessing_Parse = 1_i32
    DtdProcessing_Last = 1_i32
  end
  enum XmlReadState
    XmlReadState_Initial = 0_i32
    XmlReadState_Interactive = 1_i32
    XmlReadState_Error = 2_i32
    XmlReadState_EndOfFile = 3_i32
    XmlReadState_Closed = 4_i32
  end
  enum XmlReaderProperty
    XmlReaderProperty_MultiLanguage = 0_i32
    XmlReaderProperty_ConformanceLevel = 1_i32
    XmlReaderProperty_RandomAccess = 2_i32
    XmlReaderProperty_XmlResolver = 3_i32
    XmlReaderProperty_DtdProcessing = 4_i32
    XmlReaderProperty_ReadState = 5_i32
    XmlReaderProperty_MaxElementDepth = 6_i32
    XmlReaderProperty_MaxEntityExpansion = 7_i32
    XmlReaderProperty_Last = 7_i32
  end
  enum XmlError
    MX_E_MX = -1072894464_i32
    MX_E_INPUTEND = -1072894463_i32
    MX_E_ENCODING = -1072894462_i32
    MX_E_ENCODINGSWITCH = -1072894461_i32
    MX_E_ENCODINGSIGNATURE = -1072894460_i32
    WC_E_WC = -1072894432_i32
    WC_E_WHITESPACE = -1072894431_i32
    WC_E_SEMICOLON = -1072894430_i32
    WC_E_GREATERTHAN = -1072894429_i32
    WC_E_QUOTE = -1072894428_i32
    WC_E_EQUAL = -1072894427_i32
    WC_E_LESSTHAN = -1072894426_i32
    WC_E_HEXDIGIT = -1072894425_i32
    WC_E_DIGIT = -1072894424_i32
    WC_E_LEFTBRACKET = -1072894423_i32
    WC_E_LEFTPAREN = -1072894422_i32
    WC_E_XMLCHARACTER = -1072894421_i32
    WC_E_NAMECHARACTER = -1072894420_i32
    WC_E_SYNTAX = -1072894419_i32
    WC_E_CDSECT = -1072894418_i32
    WC_E_COMMENT = -1072894417_i32
    WC_E_CONDSECT = -1072894416_i32
    WC_E_DECLATTLIST = -1072894415_i32
    WC_E_DECLDOCTYPE = -1072894414_i32
    WC_E_DECLELEMENT = -1072894413_i32
    WC_E_DECLENTITY = -1072894412_i32
    WC_E_DECLNOTATION = -1072894411_i32
    WC_E_NDATA = -1072894410_i32
    WC_E_PUBLIC = -1072894409_i32
    WC_E_SYSTEM = -1072894408_i32
    WC_E_NAME = -1072894407_i32
    WC_E_ROOTELEMENT = -1072894406_i32
    WC_E_ELEMENTMATCH = -1072894405_i32
    WC_E_UNIQUEATTRIBUTE = -1072894404_i32
    WC_E_TEXTXMLDECL = -1072894403_i32
    WC_E_LEADINGXML = -1072894402_i32
    WC_E_TEXTDECL = -1072894401_i32
    WC_E_XMLDECL = -1072894400_i32
    WC_E_ENCNAME = -1072894399_i32
    WC_E_PUBLICID = -1072894398_i32
    WC_E_PESINTERNALSUBSET = -1072894397_i32
    WC_E_PESBETWEENDECLS = -1072894396_i32
    WC_E_NORECURSION = -1072894395_i32
    WC_E_ENTITYCONTENT = -1072894394_i32
    WC_E_UNDECLAREDENTITY = -1072894393_i32
    WC_E_PARSEDENTITY = -1072894392_i32
    WC_E_NOEXTERNALENTITYREF = -1072894391_i32
    WC_E_PI = -1072894390_i32
    WC_E_SYSTEMID = -1072894389_i32
    WC_E_QUESTIONMARK = -1072894388_i32
    WC_E_CDSECTEND = -1072894387_i32
    WC_E_MOREDATA = -1072894386_i32
    WC_E_DTDPROHIBITED = -1072894385_i32
    WC_E_INVALIDXMLSPACE = -1072894384_i32
    NC_E_NC = -1072894368_i32
    NC_E_QNAMECHARACTER = -1072894367_i32
    NC_E_QNAMECOLON = -1072894366_i32
    NC_E_NAMECOLON = -1072894365_i32
    NC_E_DECLAREDPREFIX = -1072894364_i32
    NC_E_UNDECLAREDPREFIX = -1072894363_i32
    NC_E_EMPTYURI = -1072894362_i32
    NC_E_XMLPREFIXRESERVED = -1072894361_i32
    NC_E_XMLNSPREFIXRESERVED = -1072894360_i32
    NC_E_XMLURIRESERVED = -1072894359_i32
    NC_E_XMLNSURIRESERVED = -1072894358_i32
    SC_E_SC = -1072894336_i32
    SC_E_MAXELEMENTDEPTH = -1072894335_i32
    SC_E_MAXENTITYEXPANSION = -1072894334_i32
    WR_E_WR = -1072894208_i32
    WR_E_NONWHITESPACE = -1072894207_i32
    WR_E_NSPREFIXDECLARED = -1072894206_i32
    WR_E_NSPREFIXWITHEMPTYNSURI = -1072894205_i32
    WR_E_DUPLICATEATTRIBUTE = -1072894204_i32
    WR_E_XMLNSPREFIXDECLARATION = -1072894203_i32
    WR_E_XMLPREFIXDECLARATION = -1072894202_i32
    WR_E_XMLURIDECLARATION = -1072894201_i32
    WR_E_XMLNSURIDECLARATION = -1072894200_i32
    WR_E_NAMESPACEUNDECLARED = -1072894199_i32
    WR_E_INVALIDXMLSPACE = -1072894198_i32
    WR_E_INVALIDACTION = -1072894197_i32
    WR_E_INVALIDSURROGATEPAIR = -1072894196_i32
    XML_E_INVALID_DECIMAL = -1072898019_i32
    XML_E_INVALID_HEXIDECIMAL = -1072898018_i32
    XML_E_INVALID_UNICODE = -1072898017_i32
    XML_E_INVALIDENCODING = -1072897938_i32
  end
  enum XmlStandalone
    XmlStandalone_Omit = 0_i32
    XmlStandalone_Yes = 1_i32
    XmlStandalone_No = 2_i32
    XmlStandalone_Last = 2_i32
  end
  enum XmlWriterProperty
    XmlWriterProperty_MultiLanguage = 0_i32
    XmlWriterProperty_Indent = 1_i32
    XmlWriterProperty_ByteOrderMark = 2_i32
    XmlWriterProperty_OmitXmlDeclaration = 3_i32
    XmlWriterProperty_ConformanceLevel = 4_i32
    XmlWriterProperty_CompactEmptyElement = 5_i32
    XmlWriterProperty_Last = 5_i32
  end

  @[Extern]
  record IXmlReaderVtbl,
    query_interface : Proc(IXmlReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXmlReader*, UInt32),
    release : Proc(IXmlReader*, UInt32),
    set_input : Proc(IXmlReader*, Void*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IXmlReader*, UInt32, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IXmlReader*, UInt32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    read : Proc(IXmlReader*, Win32cr::Data::Xml::XmlLite::XmlNodeType*, Win32cr::Foundation::HRESULT),
    get_node_type : Proc(IXmlReader*, Win32cr::Data::Xml::XmlLite::XmlNodeType*, Win32cr::Foundation::HRESULT),
    move_to_first_attribute : Proc(IXmlReader*, Win32cr::Foundation::HRESULT),
    move_to_next_attribute : Proc(IXmlReader*, Win32cr::Foundation::HRESULT),
    move_to_attribute_by_name : Proc(IXmlReader*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    move_to_element : Proc(IXmlReader*, Win32cr::Foundation::HRESULT),
    get_qualified_name : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_namespace_uri : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_local_name : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prefix : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    read_value_chunk : Proc(IXmlReader*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_base_uri : Proc(IXmlReader*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    is_default : Proc(IXmlReader*, Win32cr::Foundation::BOOL),
    is_empty_element : Proc(IXmlReader*, Win32cr::Foundation::BOOL),
    get_line_number : Proc(IXmlReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_line_position : Proc(IXmlReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute_count : Proc(IXmlReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_depth : Proc(IXmlReader*, UInt32*, Win32cr::Foundation::HRESULT),
    is_eof : Proc(IXmlReader*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("7279fc81-709d-4095-b63d-69fe4b0d9030")]
  record IXmlReader, lpVtbl : IXmlReaderVtbl* do
    GUID = LibC::GUID.new(0x7279fc81_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
    def query_interface(this : IXmlReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXmlReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXmlReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IXmlReader*, pInput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, pInput)
    end
    def get_property(this : IXmlReader*, nProperty : UInt32, ppValue : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, nProperty, ppValue)
    end
    def set_property(this : IXmlReader*, nProperty : UInt32, pValue : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, nProperty, pValue)
    end
    def read(this : IXmlReader*, pNodeType : Win32cr::Data::Xml::XmlLite::XmlNodeType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pNodeType)
    end
    def get_node_type(this : IXmlReader*, pNodeType : Win32cr::Data::Xml::XmlLite::XmlNodeType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_node_type.call(this, pNodeType)
    end
    def move_to_first_attribute(this : IXmlReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_first_attribute.call(this)
    end
    def move_to_next_attribute(this : IXmlReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_next_attribute.call(this)
    end
    def move_to_attribute_by_name(this : IXmlReader*, pwszLocalName : Win32cr::Foundation::PWSTR, pwszNamespaceUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_attribute_by_name.call(this, pwszLocalName, pwszNamespaceUri)
    end
    def move_to_element(this : IXmlReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_element.call(this)
    end
    def get_qualified_name(this : IXmlReader*, ppwszQualifiedName : Win32cr::Foundation::PWSTR*, pcwchQualifiedName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_qualified_name.call(this, ppwszQualifiedName, pcwchQualifiedName)
    end
    def get_namespace_uri(this : IXmlReader*, ppwszNamespaceUri : Win32cr::Foundation::PWSTR*, pcwchNamespaceUri : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespace_uri.call(this, ppwszNamespaceUri, pcwchNamespaceUri)
    end
    def get_local_name(this : IXmlReader*, ppwszLocalName : Win32cr::Foundation::PWSTR*, pcwchLocalName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_name.call(this, ppwszLocalName, pcwchLocalName)
    end
    def get_prefix(this : IXmlReader*, ppwszPrefix : Win32cr::Foundation::PWSTR*, pcwchPrefix : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prefix.call(this, ppwszPrefix, pcwchPrefix)
    end
    def get_value(this : IXmlReader*, ppwszValue : Win32cr::Foundation::PWSTR*, pcwchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, ppwszValue, pcwchValue)
    end
    def read_value_chunk(this : IXmlReader*, pwchBuffer : UInt16*, cwchChunkSize : UInt32, pcwchRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_value_chunk.call(this, pwchBuffer, cwchChunkSize, pcwchRead)
    end
    def get_base_uri(this : IXmlReader*, ppwszBaseUri : Win32cr::Foundation::PWSTR*, pcwchBaseUri : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_base_uri.call(this, ppwszBaseUri, pcwchBaseUri)
    end
    def is_default(this : IXmlReader*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_default.call(this)
    end
    def is_empty_element(this : IXmlReader*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_empty_element.call(this)
    end
    def get_line_number(this : IXmlReader*, pnLineNumber : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_number.call(this, pnLineNumber)
    end
    def get_line_position(this : IXmlReader*, pnLinePosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_position.call(this, pnLinePosition)
    end
    def get_attribute_count(this : IXmlReader*, pnAttributeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count.call(this, pnAttributeCount)
    end
    def get_depth(this : IXmlReader*, pnDepth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_depth.call(this, pnDepth)
    end
    def is_eof(this : IXmlReader*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_eof.call(this)
    end

  end

  @[Extern]
  record IXmlResolverVtbl,
    query_interface : Proc(IXmlResolver*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXmlResolver*, UInt32),
    release : Proc(IXmlResolver*, UInt32),
    resolve_uri : Proc(IXmlResolver*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7279fc82-709d-4095-b63d-69fe4b0d9030")]
  record IXmlResolver, lpVtbl : IXmlResolverVtbl* do
    GUID = LibC::GUID.new(0x7279fc82_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
    def query_interface(this : IXmlResolver*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXmlResolver*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXmlResolver*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resolve_uri(this : IXmlResolver*, pwszBaseUri : Win32cr::Foundation::PWSTR, pwszPublicIdentifier : Win32cr::Foundation::PWSTR, pwszSystemIdentifier : Win32cr::Foundation::PWSTR, ppResolvedInput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_uri.call(this, pwszBaseUri, pwszPublicIdentifier, pwszSystemIdentifier, ppResolvedInput)
    end

  end

  @[Extern]
  record IXmlWriterVtbl,
    query_interface : Proc(IXmlWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXmlWriter*, UInt32),
    release : Proc(IXmlWriter*, UInt32),
    set_output : Proc(IXmlWriter*, Void*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IXmlWriter*, UInt32, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IXmlWriter*, UInt32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    write_attributes : Proc(IXmlWriter*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_attribute_string : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_c_data : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_char_entity : Proc(IXmlWriter*, UInt16, Win32cr::Foundation::HRESULT),
    write_chars : Proc(IXmlWriter*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_comment : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_doc_type : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_element_string : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_end_document : Proc(IXmlWriter*, Win32cr::Foundation::HRESULT),
    write_end_element : Proc(IXmlWriter*, Win32cr::Foundation::HRESULT),
    write_entity_ref : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_full_end_element : Proc(IXmlWriter*, Win32cr::Foundation::HRESULT),
    write_name : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_nm_token : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_node : Proc(IXmlWriter*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_node_shallow : Proc(IXmlWriter*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_processing_instruction : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_qualified_name : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_raw : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_raw_chars : Proc(IXmlWriter*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_start_document : Proc(IXmlWriter*, Win32cr::Data::Xml::XmlLite::XmlStandalone, Win32cr::Foundation::HRESULT),
    write_start_element : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_string : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_surrogate_char_entity : Proc(IXmlWriter*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    write_whitespace : Proc(IXmlWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    flush : Proc(IXmlWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7279fc88-709d-4095-b63d-69fe4b0d9030")]
  record IXmlWriter, lpVtbl : IXmlWriterVtbl* do
    GUID = LibC::GUID.new(0x7279fc88_u32, 0x709d_u16, 0x4095_u16, StaticArray[0xb6_u8, 0x3d_u8, 0x69_u8, 0xfe_u8, 0x4b_u8, 0xd_u8, 0x90_u8, 0x30_u8])
    def query_interface(this : IXmlWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXmlWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXmlWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_output(this : IXmlWriter*, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output.call(this, pOutput)
    end
    def get_property(this : IXmlWriter*, nProperty : UInt32, ppValue : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, nProperty, ppValue)
    end
    def set_property(this : IXmlWriter*, nProperty : UInt32, pValue : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, nProperty, pValue)
    end
    def write_attributes(this : IXmlWriter*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_attributes.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_attribute_string(this : IXmlWriter*, pwszPrefix : Win32cr::Foundation::PWSTR, pwszLocalName : Win32cr::Foundation::PWSTR, pwszNamespaceUri : Win32cr::Foundation::PWSTR, pwszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_attribute_string.call(this, pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue)
    end
    def write_c_data(this : IXmlWriter*, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_c_data.call(this, pwszText)
    end
    def write_char_entity(this : IXmlWriter*, wch : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_char_entity.call(this, wch)
    end
    def write_chars(this : IXmlWriter*, pwch : UInt16*, cwch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_chars.call(this, pwch, cwch)
    end
    def write_comment(this : IXmlWriter*, pwszComment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_comment.call(this, pwszComment)
    end
    def write_doc_type(this : IXmlWriter*, pwszName : Win32cr::Foundation::PWSTR, pwszPublicId : Win32cr::Foundation::PWSTR, pwszSystemId : Win32cr::Foundation::PWSTR, pwszSubset : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_doc_type.call(this, pwszName, pwszPublicId, pwszSystemId, pwszSubset)
    end
    def write_element_string(this : IXmlWriter*, pwszPrefix : Win32cr::Foundation::PWSTR, pwszLocalName : Win32cr::Foundation::PWSTR, pwszNamespaceUri : Win32cr::Foundation::PWSTR, pwszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_element_string.call(this, pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue)
    end
    def write_end_document(this : IXmlWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_end_document.call(this)
    end
    def write_end_element(this : IXmlWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_end_element.call(this)
    end
    def write_entity_ref(this : IXmlWriter*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_entity_ref.call(this, pwszName)
    end
    def write_full_end_element(this : IXmlWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_full_end_element.call(this)
    end
    def write_name(this : IXmlWriter*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_name.call(this, pwszName)
    end
    def write_nm_token(this : IXmlWriter*, pwszNmToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_nm_token.call(this, pwszNmToken)
    end
    def write_node(this : IXmlWriter*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_node.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_node_shallow(this : IXmlWriter*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_node_shallow.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_processing_instruction(this : IXmlWriter*, pwszName : Win32cr::Foundation::PWSTR, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_processing_instruction.call(this, pwszName, pwszText)
    end
    def write_qualified_name(this : IXmlWriter*, pwszLocalName : Win32cr::Foundation::PWSTR, pwszNamespaceUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_qualified_name.call(this, pwszLocalName, pwszNamespaceUri)
    end
    def write_raw(this : IXmlWriter*, pwszData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_raw.call(this, pwszData)
    end
    def write_raw_chars(this : IXmlWriter*, pwch : UInt16*, cwch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_raw_chars.call(this, pwch, cwch)
    end
    def write_start_document(this : IXmlWriter*, standalone : Win32cr::Data::Xml::XmlLite::XmlStandalone) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_start_document.call(this, standalone)
    end
    def write_start_element(this : IXmlWriter*, pwszPrefix : Win32cr::Foundation::PWSTR, pwszLocalName : Win32cr::Foundation::PWSTR, pwszNamespaceUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_start_element.call(this, pwszPrefix, pwszLocalName, pwszNamespaceUri)
    end
    def write_string(this : IXmlWriter*, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_string.call(this, pwszText)
    end
    def write_surrogate_char_entity(this : IXmlWriter*, wchLow : UInt16, wchHigh : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_surrogate_char_entity.call(this, wchLow, wchHigh)
    end
    def write_whitespace(this : IXmlWriter*, pwszWhitespace : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_whitespace.call(this, pwszWhitespace)
    end
    def flush(this : IXmlWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

  @[Extern]
  record IXmlWriterLiteVtbl,
    query_interface : Proc(IXmlWriterLite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXmlWriterLite*, UInt32),
    release : Proc(IXmlWriterLite*, UInt32),
    set_output : Proc(IXmlWriterLite*, Void*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IXmlWriterLite*, UInt32, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IXmlWriterLite*, UInt32, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    write_attributes : Proc(IXmlWriterLite*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_attribute_string : Proc(IXmlWriterLite*, UInt16*, UInt32, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_c_data : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_char_entity : Proc(IXmlWriterLite*, UInt16, Win32cr::Foundation::HRESULT),
    write_chars : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_comment : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_doc_type : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_element_string : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_end_document : Proc(IXmlWriterLite*, Win32cr::Foundation::HRESULT),
    write_end_element : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_entity_ref : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_full_end_element : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_name : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_nm_token : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_node : Proc(IXmlWriterLite*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_node_shallow : Proc(IXmlWriterLite*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    write_processing_instruction : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_raw : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_raw_chars : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_start_document : Proc(IXmlWriterLite*, Win32cr::Data::Xml::XmlLite::XmlStandalone, Win32cr::Foundation::HRESULT),
    write_start_element : Proc(IXmlWriterLite*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    write_string : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    write_surrogate_char_entity : Proc(IXmlWriterLite*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    write_whitespace : Proc(IXmlWriterLite*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    flush : Proc(IXmlWriterLite*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("862494c6-1310-4aad-b3cd-2dbeebf670d3")]
  record IXmlWriterLite, lpVtbl : IXmlWriterLiteVtbl* do
    GUID = LibC::GUID.new(0x862494c6_u32, 0x1310_u16, 0x4aad_u16, StaticArray[0xb3_u8, 0xcd_u8, 0x2d_u8, 0xbe_u8, 0xeb_u8, 0xf6_u8, 0x70_u8, 0xd3_u8])
    def query_interface(this : IXmlWriterLite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXmlWriterLite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXmlWriterLite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_output(this : IXmlWriterLite*, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output.call(this, pOutput)
    end
    def get_property(this : IXmlWriterLite*, nProperty : UInt32, ppValue : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, nProperty, ppValue)
    end
    def set_property(this : IXmlWriterLite*, nProperty : UInt32, pValue : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, nProperty, pValue)
    end
    def write_attributes(this : IXmlWriterLite*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_attributes.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_attribute_string(this : IXmlWriterLite*, pwszQName : UInt16*, cwszQName : UInt32, pwszValue : UInt16*, cwszValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_attribute_string.call(this, pwszQName, cwszQName, pwszValue, cwszValue)
    end
    def write_c_data(this : IXmlWriterLite*, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_c_data.call(this, pwszText)
    end
    def write_char_entity(this : IXmlWriterLite*, wch : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_char_entity.call(this, wch)
    end
    def write_chars(this : IXmlWriterLite*, pwch : UInt16*, cwch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_chars.call(this, pwch, cwch)
    end
    def write_comment(this : IXmlWriterLite*, pwszComment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_comment.call(this, pwszComment)
    end
    def write_doc_type(this : IXmlWriterLite*, pwszName : Win32cr::Foundation::PWSTR, pwszPublicId : Win32cr::Foundation::PWSTR, pwszSystemId : Win32cr::Foundation::PWSTR, pwszSubset : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_doc_type.call(this, pwszName, pwszPublicId, pwszSystemId, pwszSubset)
    end
    def write_element_string(this : IXmlWriterLite*, pwszQName : UInt16*, cwszQName : UInt32, pwszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_element_string.call(this, pwszQName, cwszQName, pwszValue)
    end
    def write_end_document(this : IXmlWriterLite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_end_document.call(this)
    end
    def write_end_element(this : IXmlWriterLite*, pwszQName : UInt16*, cwszQName : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_end_element.call(this, pwszQName, cwszQName)
    end
    def write_entity_ref(this : IXmlWriterLite*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_entity_ref.call(this, pwszName)
    end
    def write_full_end_element(this : IXmlWriterLite*, pwszQName : UInt16*, cwszQName : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_full_end_element.call(this, pwszQName, cwszQName)
    end
    def write_name(this : IXmlWriterLite*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_name.call(this, pwszName)
    end
    def write_nm_token(this : IXmlWriterLite*, pwszNmToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_nm_token.call(this, pwszNmToken)
    end
    def write_node(this : IXmlWriterLite*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_node.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_node_shallow(this : IXmlWriterLite*, pReader : Void*, fWriteDefaultAttributes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_node_shallow.call(this, pReader, fWriteDefaultAttributes)
    end
    def write_processing_instruction(this : IXmlWriterLite*, pwszName : Win32cr::Foundation::PWSTR, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_processing_instruction.call(this, pwszName, pwszText)
    end
    def write_raw(this : IXmlWriterLite*, pwszData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_raw.call(this, pwszData)
    end
    def write_raw_chars(this : IXmlWriterLite*, pwch : UInt16*, cwch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_raw_chars.call(this, pwch, cwch)
    end
    def write_start_document(this : IXmlWriterLite*, standalone : Win32cr::Data::Xml::XmlLite::XmlStandalone) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_start_document.call(this, standalone)
    end
    def write_start_element(this : IXmlWriterLite*, pwszQName : UInt16*, cwszQName : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_start_element.call(this, pwszQName, cwszQName)
    end
    def write_string(this : IXmlWriterLite*, pwszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_string.call(this, pwszText)
    end
    def write_surrogate_char_entity(this : IXmlWriterLite*, wchLow : UInt16, wchHigh : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_surrogate_char_entity.call(this, wchLow, wchHigh)
    end
    def write_whitespace(this : IXmlWriterLite*, pwszWhitespace : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_whitespace.call(this, pwszWhitespace)
    end
    def flush(this : IXmlWriterLite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

  @[Link("xmllite")]
  lib C
    fun CreateXmlReader(riid : LibC::GUID*, ppvObject : Void**, pMalloc : Void*) : Win32cr::Foundation::HRESULT

    fun CreateXmlReaderInputWithEncodingCodePage(pInputStream : Void*, pMalloc : Void*, nEncodingCodePage : UInt32, fEncodingHint : Win32cr::Foundation::BOOL, pwszBaseUri : Win32cr::Foundation::PWSTR, ppInput : Void**) : Win32cr::Foundation::HRESULT

    fun CreateXmlReaderInputWithEncodingName(pInputStream : Void*, pMalloc : Void*, pwszEncodingName : Win32cr::Foundation::PWSTR, fEncodingHint : Win32cr::Foundation::BOOL, pwszBaseUri : Win32cr::Foundation::PWSTR, ppInput : Void**) : Win32cr::Foundation::HRESULT

    fun CreateXmlWriter(riid : LibC::GUID*, ppvObject : Void**, pMalloc : Void*) : Win32cr::Foundation::HRESULT

    fun CreateXmlWriterOutputWithEncodingCodePage(pOutputStream : Void*, pMalloc : Void*, nEncodingCodePage : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT

    fun CreateXmlWriterOutputWithEncodingName(pOutputStream : Void*, pMalloc : Void*, pwszEncodingName : Win32cr::Foundation::PWSTR, ppOutput : Void**) : Win32cr::Foundation::HRESULT

  end
end