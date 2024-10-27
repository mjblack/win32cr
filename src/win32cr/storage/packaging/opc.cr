require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../../security/cryptography.cr"
require "./../../security.cr"

module Win32cr::Storage::Packaging::Opc
  OPC_E_NONCONFORMING_URI = -2142175231_i32
  OPC_E_RELATIVE_URI_REQUIRED = -2142175230_i32
  OPC_E_RELATIONSHIP_URI_REQUIRED = -2142175229_i32
  OPC_E_PART_CANNOT_BE_DIRECTORY = -2142175228_i32
  OPC_E_UNEXPECTED_CONTENT_TYPE = -2142175227_i32
  OPC_E_INVALID_CONTENT_TYPE_XML = -2142175226_i32
  OPC_E_MISSING_CONTENT_TYPES = -2142175225_i32
  OPC_E_NONCONFORMING_CONTENT_TYPES_XML = -2142175224_i32
  OPC_E_NONCONFORMING_RELS_XML = -2142175223_i32
  OPC_E_INVALID_RELS_XML = -2142175222_i32
  OPC_E_DUPLICATE_PART = -2142175221_i32
  OPC_E_INVALID_OVERRIDE_PART_NAME = -2142175220_i32
  OPC_E_DUPLICATE_OVERRIDE_PART = -2142175219_i32
  OPC_E_INVALID_DEFAULT_EXTENSION = -2142175218_i32
  OPC_E_DUPLICATE_DEFAULT_EXTENSION = -2142175217_i32
  OPC_E_INVALID_RELATIONSHIP_ID = -2142175216_i32
  OPC_E_INVALID_RELATIONSHIP_TYPE = -2142175215_i32
  OPC_E_INVALID_RELATIONSHIP_TARGET = -2142175214_i32
  OPC_E_DUPLICATE_RELATIONSHIP = -2142175213_i32
  OPC_E_CONFLICTING_SETTINGS = -2142175212_i32
  OPC_E_DUPLICATE_PIECE = -2142175211_i32
  OPC_E_INVALID_PIECE = -2142175210_i32
  OPC_E_MISSING_PIECE = -2142175209_i32
  OPC_E_NO_SUCH_PART = -2142175208_i32
  OPC_E_DS_SIGNATURE_CORRUPT = -2142175207_i32
  OPC_E_DS_DIGEST_VALUE_ERROR = -2142175206_i32
  OPC_E_DS_DUPLICATE_SIGNATURE_ORIGIN_RELATIONSHIP = -2142175205_i32
  OPC_E_DS_INVALID_SIGNATURE_ORIGIN_RELATIONSHIP = -2142175204_i32
  OPC_E_DS_INVALID_CERTIFICATE_RELATIONSHIP = -2142175203_i32
  OPC_E_DS_EXTERNAL_SIGNATURE = -2142175202_i32
  OPC_E_DS_MISSING_SIGNATURE_ORIGIN_PART = -2142175201_i32
  OPC_E_DS_MISSING_SIGNATURE_PART = -2142175200_i32
  OPC_E_DS_INVALID_RELATIONSHIP_TRANSFORM_XML = -2142175199_i32
  OPC_E_DS_INVALID_CANONICALIZATION_METHOD = -2142175198_i32
  OPC_E_DS_INVALID_RELATIONSHIPS_SIGNING_OPTION = -2142175197_i32
  OPC_E_DS_INVALID_OPC_SIGNATURE_TIME_FORMAT = -2142175196_i32
  OPC_E_DS_PACKAGE_REFERENCE_URI_RESERVED = -2142175195_i32
  OPC_E_DS_MISSING_SIGNATURE_PROPERTIES_ELEMENT = -2142175194_i32
  OPC_E_DS_MISSING_SIGNATURE_PROPERTY_ELEMENT = -2142175193_i32
  OPC_E_DS_DUPLICATE_SIGNATURE_PROPERTY_ELEMENT = -2142175192_i32
  OPC_E_DS_MISSING_SIGNATURE_TIME_PROPERTY = -2142175191_i32
  OPC_E_DS_INVALID_SIGNATURE_XML = -2142175190_i32
  OPC_E_DS_INVALID_SIGNATURE_COUNT = -2142175189_i32
  OPC_E_DS_MISSING_SIGNATURE_ALGORITHM = -2142175188_i32
  OPC_E_DS_DUPLICATE_PACKAGE_OBJECT_REFERENCES = -2142175187_i32
  OPC_E_DS_MISSING_PACKAGE_OBJECT_REFERENCE = -2142175186_i32
  OPC_E_DS_EXTERNAL_SIGNATURE_REFERENCE = -2142175185_i32
  OPC_E_DS_REFERENCE_MISSING_CONTENT_TYPE = -2142175184_i32
  OPC_E_DS_MULTIPLE_RELATIONSHIP_TRANSFORMS = -2142175183_i32
  OPC_E_DS_MISSING_CANONICALIZATION_TRANSFORM = -2142175182_i32
  OPC_E_MC_UNEXPECTED_ELEMENT = -2142175181_i32
  OPC_E_MC_UNEXPECTED_REQUIRES_ATTR = -2142175180_i32
  OPC_E_MC_MISSING_REQUIRES_ATTR = -2142175179_i32
  OPC_E_MC_UNEXPECTED_ATTR = -2142175178_i32
  OPC_E_MC_INVALID_PREFIX_LIST = -2142175177_i32
  OPC_E_MC_INVALID_QNAME_LIST = -2142175176_i32
  OPC_E_MC_NESTED_ALTERNATE_CONTENT = -2142175175_i32
  OPC_E_MC_UNEXPECTED_CHOICE = -2142175174_i32
  OPC_E_MC_MISSING_CHOICE = -2142175173_i32
  OPC_E_MC_INVALID_ENUM_TYPE = -2142175172_i32
  OPC_E_MC_UNKNOWN_NAMESPACE = -2142175170_i32
  OPC_E_MC_UNKNOWN_PREFIX = -2142175169_i32
  OPC_E_MC_INVALID_ATTRIBUTES_ON_IGNORABLE_ELEMENT = -2142175168_i32
  OPC_E_MC_INVALID_XMLNS_ATTRIBUTE = -2142175167_i32
  OPC_E_INVALID_XML_ENCODING = -2142175166_i32
  OPC_E_DS_SIGNATURE_REFERENCE_MISSING_URI = -2142175165_i32
  OPC_E_INVALID_CONTENT_TYPE = -2142175164_i32
  OPC_E_DS_SIGNATURE_PROPERTY_MISSING_TARGET = -2142175163_i32
  OPC_E_DS_SIGNATURE_METHOD_NOT_SET = -2142175162_i32
  OPC_E_DS_DEFAULT_DIGEST_METHOD_NOT_SET = -2142175161_i32
  OPC_E_NO_SUCH_RELATIONSHIP = -2142175160_i32
  OPC_E_MC_MULTIPLE_FALLBACK_ELEMENTS = -2142175159_i32
  OPC_E_MC_INCONSISTENT_PROCESS_CONTENT = -2142175158_i32
  OPC_E_MC_INCONSISTENT_PRESERVE_ATTRIBUTES = -2142175157_i32
  OPC_E_MC_INCONSISTENT_PRESERVE_ELEMENTS = -2142175156_i32
  OPC_E_INVALID_RELATIONSHIP_TARGET_MODE = -2142175155_i32
  OPC_E_COULD_NOT_RECOVER = -2142175154_i32
  OPC_E_UNSUPPORTED_PACKAGE = -2142175153_i32
  OPC_E_ENUM_COLLECTION_CHANGED = -2142175152_i32
  OPC_E_ENUM_CANNOT_MOVE_NEXT = -2142175151_i32
  OPC_E_ENUM_CANNOT_MOVE_PREVIOUS = -2142175150_i32
  OPC_E_ENUM_INVALID_POSITION = -2142175149_i32
  OPC_E_DS_SIGNATURE_ORIGIN_EXISTS = -2142175148_i32
  OPC_E_DS_UNSIGNED_PACKAGE = -2142175147_i32
  OPC_E_DS_MISSING_CERTIFICATE_PART = -2142175146_i32
  OPC_E_NO_SUCH_SETTINGS = -2142175145_i32
  OPC_E_ZIP_INCORRECT_DATA_SIZE = -2142171135_i32
  OPC_E_ZIP_CORRUPTED_ARCHIVE = -2142171134_i32
  OPC_E_ZIP_COMPRESSION_FAILED = -2142171133_i32
  OPC_E_ZIP_DECOMPRESSION_FAILED = -2142171132_i32
  OPC_E_ZIP_INCONSISTENT_FILEITEM = -2142171131_i32
  OPC_E_ZIP_INCONSISTENT_DIRECTORY = -2142171130_i32
  OPC_E_ZIP_MISSING_DATA_DESCRIPTOR = -2142171129_i32
  OPC_E_ZIP_UNSUPPORTEDARCHIVE = -2142171128_i32
  OPC_E_ZIP_CENTRAL_DIRECTORY_TOO_LARGE = -2142171127_i32
  OPC_E_ZIP_NAME_TOO_LARGE = -2142171126_i32
  OPC_E_ZIP_DUPLICATE_NAME = -2142171125_i32
  OPC_E_ZIP_COMMENT_TOO_LARGE = -2142171124_i32
  OPC_E_ZIP_EXTRA_FIELDS_TOO_LARGE = -2142171123_i32
  OPC_E_ZIP_FILE_HEADER_TOO_LARGE = -2142171122_i32
  OPC_E_ZIP_MISSING_END_OF_CENTRAL_DIRECTORY = -2142171121_i32
  OPC_E_ZIP_REQUIRES_64_BIT = -2142171120_i32

  CLSID_OpcFactory = LibC::GUID.new(0x6b2d6ba0_u32, 0x9f3e_u16, 0x4f27_u16, StaticArray[0x92_u8, 0xb_u8, 0x31_u8, 0x3c_u8, 0xc4_u8, 0x26_u8, 0xa3_u8, 0x9e_u8])

  enum OPC_URI_TARGET_MODE
    OPC_URI_TARGET_MODE_INTERNAL = 0_i32
    OPC_URI_TARGET_MODE_EXTERNAL = 1_i32
  end
  enum OPC_COMPRESSION_OPTIONS
    OPC_COMPRESSION_NONE = -1_i32
    OPC_COMPRESSION_NORMAL = 0_i32
    OPC_COMPRESSION_MAXIMUM = 1_i32
    OPC_COMPRESSION_FAST = 2_i32
    OPC_COMPRESSION_SUPERFAST = 3_i32
  end
  enum OPC_STREAM_IO_MODE
    OPC_STREAM_IO_READ = 1_i32
    OPC_STREAM_IO_WRITE = 2_i32
  end
  @[Flags]
  enum OPC_READ_FLAGS : UInt32
    OPC_READ_DEFAULT = 0_u32
    OPC_VALIDATE_ON_LOAD = 1_u32
    OPC_CACHE_ON_ACCESS = 2_u32
  end
  @[Flags]
  enum OPC_WRITE_FLAGS : UInt32
    OPC_WRITE_DEFAULT = 0_u32
    OPC_WRITE_FORCE_ZIP32 = 1_u32
  end
  enum OPC_SIGNATURE_VALIDATION_RESULT
    OPC_SIGNATURE_VALID = 0_i32
    OPC_SIGNATURE_INVALID = -1_i32
  end
  enum OPC_CANONICALIZATION_METHOD
    OPC_CANONICALIZATION_NONE = 0_i32
    OPC_CANONICALIZATION_C14N = 1_i32
    OPC_CANONICALIZATION_C14N_WITH_COMMENTS = 2_i32
  end
  enum OPC_RELATIONSHIP_SELECTOR
    OPC_RELATIONSHIP_SELECT_BY_ID = 0_i32
    OPC_RELATIONSHIP_SELECT_BY_TYPE = 1_i32
  end
  enum OPC_RELATIONSHIPS_SIGNING_OPTION
    OPC_RELATIONSHIP_SIGN_USING_SELECTORS = 0_i32
    OPC_RELATIONSHIP_SIGN_PART = 1_i32
  end
  enum OPC_CERTIFICATE_EMBEDDING_OPTION
    OPC_CERTIFICATE_IN_CERTIFICATE_PART = 0_i32
    OPC_CERTIFICATE_IN_SIGNATURE_PART = 1_i32
    OPC_CERTIFICATE_NOT_EMBEDDED = 2_i32
  end
  enum OPC_SIGNATURE_TIME_FORMAT
    OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS = 0_i32
    OPC_SIGNATURE_TIME_FORMAT_SECONDS = 1_i32
    OPC_SIGNATURE_TIME_FORMAT_MINUTES = 2_i32
    OPC_SIGNATURE_TIME_FORMAT_DAYS = 3_i32
    OPC_SIGNATURE_TIME_FORMAT_MONTHS = 4_i32
    OPC_SIGNATURE_TIME_FORMAT_YEARS = 5_i32
  end

  @[Extern]
  record IOpcUriVtbl,
    query_interface : Proc(IOpcUri*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcUri*, UInt32),
    release : Proc(IOpcUri*, UInt32),
    get_property_bstr : Proc(IOpcUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_length : Proc(IOpcUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_dword : Proc(IOpcUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    has_property : Proc(IOpcUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_absolute_uri : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_authority : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_uri : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_domain : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_extension : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_fragment : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_password : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path_and_query : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_query : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_raw_uri : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_scheme_name : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_info : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_name : Proc(IOpcUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host_type : Proc(IOpcUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_port : Proc(IOpcUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_scheme : Proc(IOpcUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_zone : Proc(IOpcUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IOpcUri*, UInt32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IOpcUri*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_relationships_part_uri : Proc(IOpcUri*, Void**, Win32cr::Foundation::HRESULT),
    get_relative_uri : Proc(IOpcUri*, Void*, Void**, Win32cr::Foundation::HRESULT),
    combine_part_uri : Proc(IOpcUri*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bc9c1b9b-d62c-49eb-aef0-3b4e0b28ebed")]
  record IOpcUri, lpVtbl : IOpcUriVtbl* do
    GUID = LibC::GUID.new(0xbc9c1b9b_u32, 0xd62c_u16, 0x49eb_u16, StaticArray[0xae_u8, 0xf0_u8, 0x3b_u8, 0x4e_u8, 0xb_u8, 0x28_u8, 0xeb_u8, 0xed_u8])
    def query_interface(this : IOpcUri*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcUri*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcUri*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_bstr(this : IOpcUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_bstr.call(this, uriProp, pbstrProperty, dwFlags)
    end
    def get_property_length(this : IOpcUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pcchProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_length.call(this, uriProp, pcchProperty, dwFlags)
    end
    def get_property_dword(this : IOpcUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pdwProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_dword.call(this, uriProp, pdwProperty, dwFlags)
    end
    def has_property(this : IOpcUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pfHasProperty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_property.call(this, uriProp, pfHasProperty)
    end
    def get_absolute_uri(this : IOpcUri*, pbstrAbsoluteUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_absolute_uri.call(this, pbstrAbsoluteUri)
    end
    def get_authority(this : IOpcUri*, pbstrAuthority : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authority.call(this, pbstrAuthority)
    end
    def get_display_uri(this : IOpcUri*, pbstrDisplayString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_uri.call(this, pbstrDisplayString)
    end
    def get_domain(this : IOpcUri*, pbstrDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain.call(this, pbstrDomain)
    end
    def get_extension(this : IOpcUri*, pbstrExtension : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension.call(this, pbstrExtension)
    end
    def get_fragment(this : IOpcUri*, pbstrFragment : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fragment.call(this, pbstrFragment)
    end
    def get_host(this : IOpcUri*, pbstrHost : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host.call(this, pbstrHost)
    end
    def get_password(this : IOpcUri*, pbstrPassword : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_password.call(this, pbstrPassword)
    end
    def get_path(this : IOpcUri*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pbstrPath)
    end
    def get_path_and_query(this : IOpcUri*, pbstrPathAndQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_and_query.call(this, pbstrPathAndQuery)
    end
    def get_query(this : IOpcUri*, pbstrQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query.call(this, pbstrQuery)
    end
    def get_raw_uri(this : IOpcUri*, pbstrRawUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_uri.call(this, pbstrRawUri)
    end
    def get_scheme_name(this : IOpcUri*, pbstrSchemeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme_name.call(this, pbstrSchemeName)
    end
    def get_user_info(this : IOpcUri*, pbstrUserInfo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_info.call(this, pbstrUserInfo)
    end
    def get_user_name(this : IOpcUri*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_name.call(this, pbstrUserName)
    end
    def get_host_type(this : IOpcUri*, pdwHostType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_type.call(this, pdwHostType)
    end
    def get_port(this : IOpcUri*, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pdwPort)
    end
    def get_scheme(this : IOpcUri*, pdwScheme : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme.call(this, pdwScheme)
    end
    def get_zone(this : IOpcUri*, pdwZone : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_zone.call(this, pdwZone)
    end
    def get_properties(this : IOpcUri*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, pdwFlags)
    end
    def is_equal(this : IOpcUri*, pUri : Void*, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pUri, pfEqual)
    end
    def get_relationships_part_uri(this : IOpcUri*, relationshipPartUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationships_part_uri.call(this, relationshipPartUri)
    end
    def get_relative_uri(this : IOpcUri*, targetPartUri : Void*, relativeUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_uri.call(this, targetPartUri, relativeUri)
    end
    def combine_part_uri(this : IOpcUri*, relativeUri : Void*, combinedUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.combine_part_uri.call(this, relativeUri, combinedUri)
    end

  end

  @[Extern]
  record IOpcPartUriVtbl,
    query_interface : Proc(IOpcPartUri*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcPartUri*, UInt32),
    release : Proc(IOpcPartUri*, UInt32),
    get_property_bstr : Proc(IOpcPartUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_length : Proc(IOpcPartUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_dword : Proc(IOpcPartUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    has_property : Proc(IOpcPartUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_absolute_uri : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_authority : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_uri : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_domain : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_extension : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_fragment : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_password : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path_and_query : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_query : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_raw_uri : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_scheme_name : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_info : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_name : Proc(IOpcPartUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host_type : Proc(IOpcPartUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_port : Proc(IOpcPartUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_scheme : Proc(IOpcPartUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_zone : Proc(IOpcPartUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IOpcPartUri*, UInt32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IOpcPartUri*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_relationships_part_uri : Proc(IOpcPartUri*, Void**, Win32cr::Foundation::HRESULT),
    get_relative_uri : Proc(IOpcPartUri*, Void*, Void**, Win32cr::Foundation::HRESULT),
    combine_part_uri : Proc(IOpcPartUri*, Void*, Void**, Win32cr::Foundation::HRESULT),
    compare_part_uri : Proc(IOpcPartUri*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    get_source_uri : Proc(IOpcPartUri*, Void**, Win32cr::Foundation::HRESULT),
    is_relationships_part_uri : Proc(IOpcPartUri*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7d3babe7-88b2-46ba-85cb-4203cb016c87")]
  record IOpcPartUri, lpVtbl : IOpcPartUriVtbl* do
    GUID = LibC::GUID.new(0x7d3babe7_u32, 0x88b2_u16, 0x46ba_u16, StaticArray[0x85_u8, 0xcb_u8, 0x42_u8, 0x3_u8, 0xcb_u8, 0x1_u8, 0x6c_u8, 0x87_u8])
    def query_interface(this : IOpcPartUri*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcPartUri*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcPartUri*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_bstr(this : IOpcPartUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_bstr.call(this, uriProp, pbstrProperty, dwFlags)
    end
    def get_property_length(this : IOpcPartUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pcchProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_length.call(this, uriProp, pcchProperty, dwFlags)
    end
    def get_property_dword(this : IOpcPartUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pdwProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_dword.call(this, uriProp, pdwProperty, dwFlags)
    end
    def has_property(this : IOpcPartUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pfHasProperty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_property.call(this, uriProp, pfHasProperty)
    end
    def get_absolute_uri(this : IOpcPartUri*, pbstrAbsoluteUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_absolute_uri.call(this, pbstrAbsoluteUri)
    end
    def get_authority(this : IOpcPartUri*, pbstrAuthority : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authority.call(this, pbstrAuthority)
    end
    def get_display_uri(this : IOpcPartUri*, pbstrDisplayString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_uri.call(this, pbstrDisplayString)
    end
    def get_domain(this : IOpcPartUri*, pbstrDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain.call(this, pbstrDomain)
    end
    def get_extension(this : IOpcPartUri*, pbstrExtension : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension.call(this, pbstrExtension)
    end
    def get_fragment(this : IOpcPartUri*, pbstrFragment : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fragment.call(this, pbstrFragment)
    end
    def get_host(this : IOpcPartUri*, pbstrHost : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host.call(this, pbstrHost)
    end
    def get_password(this : IOpcPartUri*, pbstrPassword : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_password.call(this, pbstrPassword)
    end
    def get_path(this : IOpcPartUri*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pbstrPath)
    end
    def get_path_and_query(this : IOpcPartUri*, pbstrPathAndQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_and_query.call(this, pbstrPathAndQuery)
    end
    def get_query(this : IOpcPartUri*, pbstrQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query.call(this, pbstrQuery)
    end
    def get_raw_uri(this : IOpcPartUri*, pbstrRawUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_uri.call(this, pbstrRawUri)
    end
    def get_scheme_name(this : IOpcPartUri*, pbstrSchemeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme_name.call(this, pbstrSchemeName)
    end
    def get_user_info(this : IOpcPartUri*, pbstrUserInfo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_info.call(this, pbstrUserInfo)
    end
    def get_user_name(this : IOpcPartUri*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_name.call(this, pbstrUserName)
    end
    def get_host_type(this : IOpcPartUri*, pdwHostType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_type.call(this, pdwHostType)
    end
    def get_port(this : IOpcPartUri*, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pdwPort)
    end
    def get_scheme(this : IOpcPartUri*, pdwScheme : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme.call(this, pdwScheme)
    end
    def get_zone(this : IOpcPartUri*, pdwZone : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_zone.call(this, pdwZone)
    end
    def get_properties(this : IOpcPartUri*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, pdwFlags)
    end
    def is_equal(this : IOpcPartUri*, pUri : Void*, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pUri, pfEqual)
    end
    def get_relationships_part_uri(this : IOpcPartUri*, relationshipPartUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationships_part_uri.call(this, relationshipPartUri)
    end
    def get_relative_uri(this : IOpcPartUri*, targetPartUri : Void*, relativeUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_uri.call(this, targetPartUri, relativeUri)
    end
    def combine_part_uri(this : IOpcPartUri*, relativeUri : Void*, combinedUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.combine_part_uri.call(this, relativeUri, combinedUri)
    end
    def compare_part_uri(this : IOpcPartUri*, partUri : Void*, comparisonResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_part_uri.call(this, partUri, comparisonResult)
    end
    def get_source_uri(this : IOpcPartUri*, sourceUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_uri.call(this, sourceUri)
    end
    def is_relationships_part_uri(this : IOpcPartUri*, isRelationshipUri : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_relationships_part_uri.call(this, isRelationshipUri)
    end

  end

  @[Extern]
  record IOpcPackageVtbl,
    query_interface : Proc(IOpcPackage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcPackage*, UInt32),
    release : Proc(IOpcPackage*, UInt32),
    get_part_set : Proc(IOpcPackage*, Void**, Win32cr::Foundation::HRESULT),
    get_relationship_set : Proc(IOpcPackage*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee70")]
  record IOpcPackage, lpVtbl : IOpcPackageVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x70_u8])
    def query_interface(this : IOpcPackage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcPackage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcPackage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_set(this : IOpcPackage*, partSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_set.call(this, partSet)
    end
    def get_relationship_set(this : IOpcPackage*, relationshipSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship_set.call(this, relationshipSet)
    end

  end

  @[Extern]
  record IOpcPartVtbl,
    query_interface : Proc(IOpcPart*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcPart*, UInt32),
    release : Proc(IOpcPart*, UInt32),
    get_relationship_set : Proc(IOpcPart*, Void**, Win32cr::Foundation::HRESULT),
    get_content_stream : Proc(IOpcPart*, Void**, Win32cr::Foundation::HRESULT),
    get_name : Proc(IOpcPart*, Void**, Win32cr::Foundation::HRESULT),
    get_content_type : Proc(IOpcPart*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_compression_options : Proc(IOpcPart*, Win32cr::Storage::Packaging::Opc::OPC_COMPRESSION_OPTIONS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee71")]
  record IOpcPart, lpVtbl : IOpcPartVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x71_u8])
    def query_interface(this : IOpcPart*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcPart*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcPart*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_relationship_set(this : IOpcPart*, relationshipSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship_set.call(this, relationshipSet)
    end
    def get_content_stream(this : IOpcPart*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_stream.call(this, stream)
    end
    def get_name(this : IOpcPart*, name : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_content_type(this : IOpcPart*, contentType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_type.call(this, contentType)
    end
    def get_compression_options(this : IOpcPart*, compressionOptions : Win32cr::Storage::Packaging::Opc::OPC_COMPRESSION_OPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_compression_options.call(this, compressionOptions)
    end

  end

  @[Extern]
  record IOpcRelationshipVtbl,
    query_interface : Proc(IOpcRelationship*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationship*, UInt32),
    release : Proc(IOpcRelationship*, UInt32),
    get_id : Proc(IOpcRelationship*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_relationship_type : Proc(IOpcRelationship*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_source_uri : Proc(IOpcRelationship*, Void**, Win32cr::Foundation::HRESULT),
    get_target_uri : Proc(IOpcRelationship*, Void**, Win32cr::Foundation::HRESULT),
    get_target_mode : Proc(IOpcRelationship*, Win32cr::Storage::Packaging::Opc::OPC_URI_TARGET_MODE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee72")]
  record IOpcRelationship, lpVtbl : IOpcRelationshipVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x72_u8])
    def query_interface(this : IOpcRelationship*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationship*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationship*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id(this : IOpcRelationship*, relationshipIdentifier : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, relationshipIdentifier)
    end
    def get_relationship_type(this : IOpcRelationship*, relationshipType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship_type.call(this, relationshipType)
    end
    def get_source_uri(this : IOpcRelationship*, sourceUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_uri.call(this, sourceUri)
    end
    def get_target_uri(this : IOpcRelationship*, targetUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_uri.call(this, targetUri)
    end
    def get_target_mode(this : IOpcRelationship*, targetMode : Win32cr::Storage::Packaging::Opc::OPC_URI_TARGET_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_mode.call(this, targetMode)
    end

  end

  @[Extern]
  record IOpcPartSetVtbl,
    query_interface : Proc(IOpcPartSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcPartSet*, UInt32),
    release : Proc(IOpcPartSet*, UInt32),
    get_part : Proc(IOpcPartSet*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_part : Proc(IOpcPartSet*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Opc::OPC_COMPRESSION_OPTIONS, Void**, Win32cr::Foundation::HRESULT),
    delete_part : Proc(IOpcPartSet*, Void*, Win32cr::Foundation::HRESULT),
    part_exists : Proc(IOpcPartSet*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcPartSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee73")]
  record IOpcPartSet, lpVtbl : IOpcPartSetVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x73_u8])
    def query_interface(this : IOpcPartSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcPartSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcPartSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part(this : IOpcPartSet*, name : Void*, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part.call(this, name, part)
    end
    def create_part(this : IOpcPartSet*, name : Void*, contentType : Win32cr::Foundation::PWSTR, compressionOptions : Win32cr::Storage::Packaging::Opc::OPC_COMPRESSION_OPTIONS, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part.call(this, name, contentType, compressionOptions, part)
    end
    def delete_part(this : IOpcPartSet*, name : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_part.call(this, name)
    end
    def part_exists(this : IOpcPartSet*, name : Void*, partExists : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.part_exists.call(this, name, partExists)
    end
    def get_enumerator(this : IOpcPartSet*, partEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, partEnumerator)
    end

  end

  @[Extern]
  record IOpcRelationshipSetVtbl,
    query_interface : Proc(IOpcRelationshipSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationshipSet*, UInt32),
    release : Proc(IOpcRelationshipSet*, UInt32),
    get_relationship : Proc(IOpcRelationshipSet*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_relationship : Proc(IOpcRelationshipSet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Storage::Packaging::Opc::OPC_URI_TARGET_MODE, Void**, Win32cr::Foundation::HRESULT),
    delete_relationship : Proc(IOpcRelationshipSet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    relationship_exists : Proc(IOpcRelationshipSet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcRelationshipSet*, Void**, Win32cr::Foundation::HRESULT),
    get_enumerator_for_type : Proc(IOpcRelationshipSet*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_relationships_content_stream : Proc(IOpcRelationshipSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee74")]
  record IOpcRelationshipSet, lpVtbl : IOpcRelationshipSetVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x74_u8])
    def query_interface(this : IOpcRelationshipSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationshipSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationshipSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_relationship(this : IOpcRelationshipSet*, relationshipIdentifier : Win32cr::Foundation::PWSTR, relationship : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship.call(this, relationshipIdentifier, relationship)
    end
    def create_relationship(this : IOpcRelationshipSet*, relationshipIdentifier : Win32cr::Foundation::PWSTR, relationshipType : Win32cr::Foundation::PWSTR, targetUri : Void*, targetMode : Win32cr::Storage::Packaging::Opc::OPC_URI_TARGET_MODE, relationship : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_relationship.call(this, relationshipIdentifier, relationshipType, targetUri, targetMode, relationship)
    end
    def delete_relationship(this : IOpcRelationshipSet*, relationshipIdentifier : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_relationship.call(this, relationshipIdentifier)
    end
    def relationship_exists(this : IOpcRelationshipSet*, relationshipIdentifier : Win32cr::Foundation::PWSTR, relationshipExists : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.relationship_exists.call(this, relationshipIdentifier, relationshipExists)
    end
    def get_enumerator(this : IOpcRelationshipSet*, relationshipEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, relationshipEnumerator)
    end
    def get_enumerator_for_type(this : IOpcRelationshipSet*, relationshipType : Win32cr::Foundation::PWSTR, relationshipEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator_for_type.call(this, relationshipType, relationshipEnumerator)
    end
    def get_relationships_content_stream(this : IOpcRelationshipSet*, contents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationships_content_stream.call(this, contents)
    end

  end

  @[Extern]
  record IOpcPartEnumeratorVtbl,
    query_interface : Proc(IOpcPartEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcPartEnumerator*, UInt32),
    release : Proc(IOpcPartEnumerator*, UInt32),
    move_next : Proc(IOpcPartEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcPartEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcPartEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcPartEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee75")]
  record IOpcPartEnumerator, lpVtbl : IOpcPartEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x75_u8])
    def query_interface(this : IOpcPartEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcPartEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcPartEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcPartEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcPartEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcPartEnumerator*, part : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, part)
    end
    def clone(this : IOpcPartEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcRelationshipEnumeratorVtbl,
    query_interface : Proc(IOpcRelationshipEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationshipEnumerator*, UInt32),
    release : Proc(IOpcRelationshipEnumerator*, UInt32),
    move_next : Proc(IOpcRelationshipEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcRelationshipEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcRelationshipEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcRelationshipEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42195949-3b79-4fc8-89c6-fc7fb979ee76")]
  record IOpcRelationshipEnumerator, lpVtbl : IOpcRelationshipEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x76_u8])
    def query_interface(this : IOpcRelationshipEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationshipEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationshipEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcRelationshipEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcRelationshipEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcRelationshipEnumerator*, relationship : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, relationship)
    end
    def clone(this : IOpcRelationshipEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcSignaturePartReferenceVtbl,
    query_interface : Proc(IOpcSignaturePartReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignaturePartReference*, UInt32),
    release : Proc(IOpcSignaturePartReference*, UInt32),
    get_part_name : Proc(IOpcSignaturePartReference*, Void**, Win32cr::Foundation::HRESULT),
    get_content_type : Proc(IOpcSignaturePartReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_digest_method : Proc(IOpcSignaturePartReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_digest_value : Proc(IOpcSignaturePartReference*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_transform_method : Proc(IOpcSignaturePartReference*, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e24231ca-59f4-484e-b64b-36eeda36072c")]
  record IOpcSignaturePartReference, lpVtbl : IOpcSignaturePartReferenceVtbl* do
    GUID = LibC::GUID.new(0xe24231ca_u32, 0x59f4_u16, 0x484e_u16, StaticArray[0xb6_u8, 0x4b_u8, 0x36_u8, 0xee_u8, 0xda_u8, 0x36_u8, 0x7_u8, 0x2c_u8])
    def query_interface(this : IOpcSignaturePartReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignaturePartReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignaturePartReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_part_name(this : IOpcSignaturePartReference*, partName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_name.call(this, partName)
    end
    def get_content_type(this : IOpcSignaturePartReference*, contentType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_type.call(this, contentType)
    end
    def get_digest_method(this : IOpcSignaturePartReference*, digestMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_method.call(this, digestMethod)
    end
    def get_digest_value(this : IOpcSignaturePartReference*, digestValue : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_value.call(this, digestValue, count)
    end
    def get_transform_method(this : IOpcSignaturePartReference*, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_method.call(this, transformMethod)
    end

  end

  @[Extern]
  record IOpcSignatureRelationshipReferenceVtbl,
    query_interface : Proc(IOpcSignatureRelationshipReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureRelationshipReference*, UInt32),
    release : Proc(IOpcSignatureRelationshipReference*, UInt32),
    get_source_uri : Proc(IOpcSignatureRelationshipReference*, Void**, Win32cr::Foundation::HRESULT),
    get_digest_method : Proc(IOpcSignatureRelationshipReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_digest_value : Proc(IOpcSignatureRelationshipReference*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_transform_method : Proc(IOpcSignatureRelationshipReference*, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*, Win32cr::Foundation::HRESULT),
    get_relationship_signing_option : Proc(IOpcSignatureRelationshipReference*, Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIPS_SIGNING_OPTION*, Win32cr::Foundation::HRESULT),
    get_relationship_selector_enumerator : Proc(IOpcSignatureRelationshipReference*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("57babac6-9d4a-4e50-8b86-e5d4051eae7c")]
  record IOpcSignatureRelationshipReference, lpVtbl : IOpcSignatureRelationshipReferenceVtbl* do
    GUID = LibC::GUID.new(0x57babac6_u32, 0x9d4a_u16, 0x4e50_u16, StaticArray[0x8b_u8, 0x86_u8, 0xe5_u8, 0xd4_u8, 0x5_u8, 0x1e_u8, 0xae_u8, 0x7c_u8])
    def query_interface(this : IOpcSignatureRelationshipReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureRelationshipReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureRelationshipReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_source_uri(this : IOpcSignatureRelationshipReference*, sourceUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_uri.call(this, sourceUri)
    end
    def get_digest_method(this : IOpcSignatureRelationshipReference*, digestMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_method.call(this, digestMethod)
    end
    def get_digest_value(this : IOpcSignatureRelationshipReference*, digestValue : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_value.call(this, digestValue, count)
    end
    def get_transform_method(this : IOpcSignatureRelationshipReference*, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_method.call(this, transformMethod)
    end
    def get_relationship_signing_option(this : IOpcSignatureRelationshipReference*, relationshipSigningOption : Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIPS_SIGNING_OPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship_signing_option.call(this, relationshipSigningOption)
    end
    def get_relationship_selector_enumerator(this : IOpcSignatureRelationshipReference*, selectorEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relationship_selector_enumerator.call(this, selectorEnumerator)
    end

  end

  @[Extern]
  record IOpcRelationshipSelectorVtbl,
    query_interface : Proc(IOpcRelationshipSelector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationshipSelector*, UInt32),
    release : Proc(IOpcRelationshipSelector*, UInt32),
    get_selector_type : Proc(IOpcRelationshipSelector*, Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIP_SELECTOR*, Win32cr::Foundation::HRESULT),
    get_selection_criterion : Proc(IOpcRelationshipSelector*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f8f26c7f-b28f-4899-84c8-5d5639ede75f")]
  record IOpcRelationshipSelector, lpVtbl : IOpcRelationshipSelectorVtbl* do
    GUID = LibC::GUID.new(0xf8f26c7f_u32, 0xb28f_u16, 0x4899_u16, StaticArray[0x84_u8, 0xc8_u8, 0x5d_u8, 0x56_u8, 0x39_u8, 0xed_u8, 0xe7_u8, 0x5f_u8])
    def query_interface(this : IOpcRelationshipSelector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationshipSelector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationshipSelector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selector_type(this : IOpcRelationshipSelector*, selector : Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIP_SELECTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selector_type.call(this, selector)
    end
    def get_selection_criterion(this : IOpcRelationshipSelector*, selectionCriterion : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection_criterion.call(this, selectionCriterion)
    end

  end

  @[Extern]
  record IOpcSignatureReferenceVtbl,
    query_interface : Proc(IOpcSignatureReference*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureReference*, UInt32),
    release : Proc(IOpcSignatureReference*, UInt32),
    get_id : Proc(IOpcSignatureReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_uri : Proc(IOpcSignatureReference*, Void**, Win32cr::Foundation::HRESULT),
    get_type : Proc(IOpcSignatureReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_transform_method : Proc(IOpcSignatureReference*, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*, Win32cr::Foundation::HRESULT),
    get_digest_method : Proc(IOpcSignatureReference*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_digest_value : Proc(IOpcSignatureReference*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1b47005e-3011-4edc-be6f-0f65e5ab0342")]
  record IOpcSignatureReference, lpVtbl : IOpcSignatureReferenceVtbl* do
    GUID = LibC::GUID.new(0x1b47005e_u32, 0x3011_u16, 0x4edc_u16, StaticArray[0xbe_u8, 0x6f_u8, 0xf_u8, 0x65_u8, 0xe5_u8, 0xab_u8, 0x3_u8, 0x42_u8])
    def query_interface(this : IOpcSignatureReference*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureReference*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureReference*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id(this : IOpcSignatureReference*, referenceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, referenceId)
    end
    def get_uri(this : IOpcSignatureReference*, referenceUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_uri.call(this, referenceUri)
    end
    def get_type(this : IOpcSignatureReference*, type__ : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, type__)
    end
    def get_transform_method(this : IOpcSignatureReference*, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform_method.call(this, transformMethod)
    end
    def get_digest_method(this : IOpcSignatureReference*, digestMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_method.call(this, digestMethod)
    end
    def get_digest_value(this : IOpcSignatureReference*, digestValue : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_digest_value.call(this, digestValue, count)
    end

  end

  @[Extern]
  record IOpcSignatureCustomObjectVtbl,
    query_interface : Proc(IOpcSignatureCustomObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureCustomObject*, UInt32),
    release : Proc(IOpcSignatureCustomObject*, UInt32),
    get_xml : Proc(IOpcSignatureCustomObject*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d77a19e-62c1-44e7-becd-45da5ae51a56")]
  record IOpcSignatureCustomObject, lpVtbl : IOpcSignatureCustomObjectVtbl* do
    GUID = LibC::GUID.new(0x5d77a19e_u32, 0x62c1_u16, 0x44e7_u16, StaticArray[0xbe_u8, 0xcd_u8, 0x45_u8, 0xda_u8, 0x5a_u8, 0xe5_u8, 0x1a_u8, 0x56_u8])
    def query_interface(this : IOpcSignatureCustomObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureCustomObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureCustomObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_xml(this : IOpcSignatureCustomObject*, xmlMarkup : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml.call(this, xmlMarkup, count)
    end

  end

  @[Extern]
  record IOpcDigitalSignatureVtbl,
    query_interface : Proc(IOpcDigitalSignature*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcDigitalSignature*, UInt32),
    release : Proc(IOpcDigitalSignature*, UInt32),
    get_namespaces : Proc(IOpcDigitalSignature*, Win32cr::Foundation::PWSTR**, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    get_signature_id : Proc(IOpcDigitalSignature*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_signature_part_name : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_method : Proc(IOpcDigitalSignature*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_canonicalization_method : Proc(IOpcDigitalSignature*, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*, Win32cr::Foundation::HRESULT),
    get_signature_value : Proc(IOpcDigitalSignature*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_signature_part_reference_enumerator : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_relationship_reference_enumerator : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signing_time : Proc(IOpcDigitalSignature*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_time_format : Proc(IOpcDigitalSignature*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*, Win32cr::Foundation::HRESULT),
    get_package_object_reference : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_certificate_enumerator : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_reference_enumerator : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_object_enumerator : Proc(IOpcDigitalSignature*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_xml : Proc(IOpcDigitalSignature*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("52ab21dd-1cd0-4949-bc80-0c1232d00cb4")]
  record IOpcDigitalSignature, lpVtbl : IOpcDigitalSignatureVtbl* do
    GUID = LibC::GUID.new(0x52ab21dd_u32, 0x1cd0_u16, 0x4949_u16, StaticArray[0xbc_u8, 0x80_u8, 0xc_u8, 0x12_u8, 0x32_u8, 0xd0_u8, 0xc_u8, 0xb4_u8])
    def query_interface(this : IOpcDigitalSignature*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcDigitalSignature*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcDigitalSignature*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_namespaces(this : IOpcDigitalSignature*, prefixes : Win32cr::Foundation::PWSTR**, namespaces : Win32cr::Foundation::PWSTR**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespaces.call(this, prefixes, namespaces, count)
    end
    def get_signature_id(this : IOpcDigitalSignature*, signatureId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_id.call(this, signatureId)
    end
    def get_signature_part_name(this : IOpcDigitalSignature*, signaturePartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_name.call(this, signaturePartName)
    end
    def get_signature_method(this : IOpcDigitalSignature*, signatureMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_method.call(this, signatureMethod)
    end
    def get_canonicalization_method(this : IOpcDigitalSignature*, canonicalizationMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonicalization_method.call(this, canonicalizationMethod)
    end
    def get_signature_value(this : IOpcDigitalSignature*, signatureValue : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_value.call(this, signatureValue, count)
    end
    def get_signature_part_reference_enumerator(this : IOpcDigitalSignature*, partReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_reference_enumerator.call(this, partReferenceEnumerator)
    end
    def get_signature_relationship_reference_enumerator(this : IOpcDigitalSignature*, relationshipReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_relationship_reference_enumerator.call(this, relationshipReferenceEnumerator)
    end
    def get_signing_time(this : IOpcDigitalSignature*, signingTime : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_time.call(this, signingTime)
    end
    def get_time_format(this : IOpcDigitalSignature*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_format.call(this, timeFormat)
    end
    def get_package_object_reference(this : IOpcDigitalSignature*, packageObjectReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_object_reference.call(this, packageObjectReference)
    end
    def get_certificate_enumerator(this : IOpcDigitalSignature*, certificateEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_certificate_enumerator.call(this, certificateEnumerator)
    end
    def get_custom_reference_enumerator(this : IOpcDigitalSignature*, customReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_reference_enumerator.call(this, customReferenceEnumerator)
    end
    def get_custom_object_enumerator(this : IOpcDigitalSignature*, customObjectEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_object_enumerator.call(this, customObjectEnumerator)
    end
    def get_signature_xml(this : IOpcDigitalSignature*, signatureXml : UInt8**, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_xml.call(this, signatureXml, count)
    end

  end

  @[Extern]
  record IOpcSigningOptionsVtbl,
    query_interface : Proc(IOpcSigningOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSigningOptions*, UInt32),
    release : Proc(IOpcSigningOptions*, UInt32),
    get_signature_id : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_signature_id : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signature_method : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_signature_method : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_default_digest_method : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_default_digest_method : Proc(IOpcSigningOptions*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_certificate_embedding_option : Proc(IOpcSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_CERTIFICATE_EMBEDDING_OPTION*, Win32cr::Foundation::HRESULT),
    set_certificate_embedding_option : Proc(IOpcSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_CERTIFICATE_EMBEDDING_OPTION, Win32cr::Foundation::HRESULT),
    get_time_format : Proc(IOpcSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*, Win32cr::Foundation::HRESULT),
    set_time_format : Proc(IOpcSigningOptions*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT, Win32cr::Foundation::HRESULT),
    get_signature_part_reference_set : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_relationship_reference_set : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_object_set : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_custom_reference_set : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_certificate_set : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_signature_part_name : Proc(IOpcSigningOptions*, Void**, Win32cr::Foundation::HRESULT),
    set_signature_part_name : Proc(IOpcSigningOptions*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("50d2d6a5-7aeb-46c0-b241-43ab0e9b407e")]
  record IOpcSigningOptions, lpVtbl : IOpcSigningOptionsVtbl* do
    GUID = LibC::GUID.new(0x50d2d6a5_u32, 0x7aeb_u16, 0x46c0_u16, StaticArray[0xb2_u8, 0x41_u8, 0x43_u8, 0xab_u8, 0xe_u8, 0x9b_u8, 0x40_u8, 0x7e_u8])
    def query_interface(this : IOpcSigningOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSigningOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSigningOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_signature_id(this : IOpcSigningOptions*, signatureId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_id.call(this, signatureId)
    end
    def set_signature_id(this : IOpcSigningOptions*, signatureId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_id.call(this, signatureId)
    end
    def get_signature_method(this : IOpcSigningOptions*, signatureMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_method.call(this, signatureMethod)
    end
    def set_signature_method(this : IOpcSigningOptions*, signatureMethod : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_method.call(this, signatureMethod)
    end
    def get_default_digest_method(this : IOpcSigningOptions*, digestMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_digest_method.call(this, digestMethod)
    end
    def set_default_digest_method(this : IOpcSigningOptions*, digestMethod : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_digest_method.call(this, digestMethod)
    end
    def get_certificate_embedding_option(this : IOpcSigningOptions*, embeddingOption : Win32cr::Storage::Packaging::Opc::OPC_CERTIFICATE_EMBEDDING_OPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_certificate_embedding_option.call(this, embeddingOption)
    end
    def set_certificate_embedding_option(this : IOpcSigningOptions*, embeddingOption : Win32cr::Storage::Packaging::Opc::OPC_CERTIFICATE_EMBEDDING_OPTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_certificate_embedding_option.call(this, embeddingOption)
    end
    def get_time_format(this : IOpcSigningOptions*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_format.call(this, timeFormat)
    end
    def set_time_format(this : IOpcSigningOptions*, timeFormat : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_TIME_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_time_format.call(this, timeFormat)
    end
    def get_signature_part_reference_set(this : IOpcSigningOptions*, partReferenceSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_reference_set.call(this, partReferenceSet)
    end
    def get_signature_relationship_reference_set(this : IOpcSigningOptions*, relationshipReferenceSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_relationship_reference_set.call(this, relationshipReferenceSet)
    end
    def get_custom_object_set(this : IOpcSigningOptions*, customObjectSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_object_set.call(this, customObjectSet)
    end
    def get_custom_reference_set(this : IOpcSigningOptions*, customReferenceSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_reference_set.call(this, customReferenceSet)
    end
    def get_certificate_set(this : IOpcSigningOptions*, certificateSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_certificate_set.call(this, certificateSet)
    end
    def get_signature_part_name(this : IOpcSigningOptions*, signaturePartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_part_name.call(this, signaturePartName)
    end
    def set_signature_part_name(this : IOpcSigningOptions*, signaturePartName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_part_name.call(this, signaturePartName)
    end

  end

  @[Extern]
  record IOpcDigitalSignatureManagerVtbl,
    query_interface : Proc(IOpcDigitalSignatureManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcDigitalSignatureManager*, UInt32),
    release : Proc(IOpcDigitalSignatureManager*, UInt32),
    get_signature_origin_part_name : Proc(IOpcDigitalSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    set_signature_origin_part_name : Proc(IOpcDigitalSignatureManager*, Void*, Win32cr::Foundation::HRESULT),
    get_signature_enumerator : Proc(IOpcDigitalSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    remove_signature : Proc(IOpcDigitalSignatureManager*, Void*, Win32cr::Foundation::HRESULT),
    create_signing_options : Proc(IOpcDigitalSignatureManager*, Void**, Win32cr::Foundation::HRESULT),
    validate : Proc(IOpcDigitalSignatureManager*, Void*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_VALIDATION_RESULT*, Win32cr::Foundation::HRESULT),
    sign : Proc(IOpcDigitalSignatureManager*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Void*, Void**, Win32cr::Foundation::HRESULT),
    replace_signature_xml : Proc(IOpcDigitalSignatureManager*, Void*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d5e62a0b-696d-462f-94df-72e33cef2659")]
  record IOpcDigitalSignatureManager, lpVtbl : IOpcDigitalSignatureManagerVtbl* do
    GUID = LibC::GUID.new(0xd5e62a0b_u32, 0x696d_u16, 0x462f_u16, StaticArray[0x94_u8, 0xdf_u8, 0x72_u8, 0xe3_u8, 0x3c_u8, 0xef_u8, 0x26_u8, 0x59_u8])
    def query_interface(this : IOpcDigitalSignatureManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcDigitalSignatureManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcDigitalSignatureManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_signature_origin_part_name(this : IOpcDigitalSignatureManager*, signatureOriginPartName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_origin_part_name.call(this, signatureOriginPartName)
    end
    def set_signature_origin_part_name(this : IOpcDigitalSignatureManager*, signatureOriginPartName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature_origin_part_name.call(this, signatureOriginPartName)
    end
    def get_signature_enumerator(this : IOpcDigitalSignatureManager*, signatureEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature_enumerator.call(this, signatureEnumerator)
    end
    def remove_signature(this : IOpcDigitalSignatureManager*, signaturePartName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_signature.call(this, signaturePartName)
    end
    def create_signing_options(this : IOpcDigitalSignatureManager*, signingOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_signing_options.call(this, signingOptions)
    end
    def validate(this : IOpcDigitalSignatureManager*, signature : Void*, certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*, validationResult : Win32cr::Storage::Packaging::Opc::OPC_SIGNATURE_VALIDATION_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, signature, certificate, validationResult)
    end
    def sign(this : IOpcDigitalSignatureManager*, certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*, signingOptions : Void*, digitalSignature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sign.call(this, certificate, signingOptions, digitalSignature)
    end
    def replace_signature_xml(this : IOpcDigitalSignatureManager*, signaturePartName : Void*, newSignatureXml : UInt8*, count : UInt32, digitalSignature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_signature_xml.call(this, signaturePartName, newSignatureXml, count, digitalSignature)
    end

  end

  @[Extern]
  record IOpcSignaturePartReferenceEnumeratorVtbl,
    query_interface : Proc(IOpcSignaturePartReferenceEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignaturePartReferenceEnumerator*, UInt32),
    release : Proc(IOpcSignaturePartReferenceEnumerator*, UInt32),
    move_next : Proc(IOpcSignaturePartReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcSignaturePartReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcSignaturePartReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcSignaturePartReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80eb1561-8c77-49cf-8266-459b356ee99a")]
  record IOpcSignaturePartReferenceEnumerator, lpVtbl : IOpcSignaturePartReferenceEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x80eb1561_u32, 0x8c77_u16, 0x49cf_u16, StaticArray[0x82_u8, 0x66_u8, 0x45_u8, 0x9b_u8, 0x35_u8, 0x6e_u8, 0xe9_u8, 0x9a_u8])
    def query_interface(this : IOpcSignaturePartReferenceEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignaturePartReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignaturePartReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcSignaturePartReferenceEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcSignaturePartReferenceEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcSignaturePartReferenceEnumerator*, partReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, partReference)
    end
    def clone(this : IOpcSignaturePartReferenceEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcSignatureRelationshipReferenceEnumeratorVtbl,
    query_interface : Proc(IOpcSignatureRelationshipReferenceEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureRelationshipReferenceEnumerator*, UInt32),
    release : Proc(IOpcSignatureRelationshipReferenceEnumerator*, UInt32),
    move_next : Proc(IOpcSignatureRelationshipReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcSignatureRelationshipReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcSignatureRelationshipReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcSignatureRelationshipReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("773ba3e4-f021-48e4-aa04-9816db5d3495")]
  record IOpcSignatureRelationshipReferenceEnumerator, lpVtbl : IOpcSignatureRelationshipReferenceEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x773ba3e4_u32, 0xf021_u16, 0x48e4_u16, StaticArray[0xaa_u8, 0x4_u8, 0x98_u8, 0x16_u8, 0xdb_u8, 0x5d_u8, 0x34_u8, 0x95_u8])
    def query_interface(this : IOpcSignatureRelationshipReferenceEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureRelationshipReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureRelationshipReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcSignatureRelationshipReferenceEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcSignatureRelationshipReferenceEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcSignatureRelationshipReferenceEnumerator*, relationshipReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, relationshipReference)
    end
    def clone(this : IOpcSignatureRelationshipReferenceEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcRelationshipSelectorEnumeratorVtbl,
    query_interface : Proc(IOpcRelationshipSelectorEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationshipSelectorEnumerator*, UInt32),
    release : Proc(IOpcRelationshipSelectorEnumerator*, UInt32),
    move_next : Proc(IOpcRelationshipSelectorEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcRelationshipSelectorEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcRelationshipSelectorEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcRelationshipSelectorEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5e50a181-a91b-48ac-88d2-bca3d8f8c0b1")]
  record IOpcRelationshipSelectorEnumerator, lpVtbl : IOpcRelationshipSelectorEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x5e50a181_u32, 0xa91b_u16, 0x48ac_u16, StaticArray[0x88_u8, 0xd2_u8, 0xbc_u8, 0xa3_u8, 0xd8_u8, 0xf8_u8, 0xc0_u8, 0xb1_u8])
    def query_interface(this : IOpcRelationshipSelectorEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationshipSelectorEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationshipSelectorEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcRelationshipSelectorEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcRelationshipSelectorEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcRelationshipSelectorEnumerator*, relationshipSelector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, relationshipSelector)
    end
    def clone(this : IOpcRelationshipSelectorEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcSignatureReferenceEnumeratorVtbl,
    query_interface : Proc(IOpcSignatureReferenceEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureReferenceEnumerator*, UInt32),
    release : Proc(IOpcSignatureReferenceEnumerator*, UInt32),
    move_next : Proc(IOpcSignatureReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcSignatureReferenceEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcSignatureReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcSignatureReferenceEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cfa59a45-28b1-4868-969e-fa8097fdc12a")]
  record IOpcSignatureReferenceEnumerator, lpVtbl : IOpcSignatureReferenceEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xcfa59a45_u32, 0x28b1_u16, 0x4868_u16, StaticArray[0x96_u8, 0x9e_u8, 0xfa_u8, 0x80_u8, 0x97_u8, 0xfd_u8, 0xc1_u8, 0x2a_u8])
    def query_interface(this : IOpcSignatureReferenceEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureReferenceEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcSignatureReferenceEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcSignatureReferenceEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcSignatureReferenceEnumerator*, reference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, reference)
    end
    def clone(this : IOpcSignatureReferenceEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcSignatureCustomObjectEnumeratorVtbl,
    query_interface : Proc(IOpcSignatureCustomObjectEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureCustomObjectEnumerator*, UInt32),
    release : Proc(IOpcSignatureCustomObjectEnumerator*, UInt32),
    move_next : Proc(IOpcSignatureCustomObjectEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcSignatureCustomObjectEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcSignatureCustomObjectEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcSignatureCustomObjectEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5ee4fe1d-e1b0-4683-8079-7ea0fcf80b4c")]
  record IOpcSignatureCustomObjectEnumerator, lpVtbl : IOpcSignatureCustomObjectEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x5ee4fe1d_u32, 0xe1b0_u16, 0x4683_u16, StaticArray[0x80_u8, 0x79_u8, 0x7e_u8, 0xa0_u8, 0xfc_u8, 0xf8_u8, 0xb_u8, 0x4c_u8])
    def query_interface(this : IOpcSignatureCustomObjectEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureCustomObjectEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureCustomObjectEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcSignatureCustomObjectEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcSignatureCustomObjectEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcSignatureCustomObjectEnumerator*, customObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, customObject)
    end
    def clone(this : IOpcSignatureCustomObjectEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcCertificateEnumeratorVtbl,
    query_interface : Proc(IOpcCertificateEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcCertificateEnumerator*, UInt32),
    release : Proc(IOpcCertificateEnumerator*, UInt32),
    move_next : Proc(IOpcCertificateEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcCertificateEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcCertificateEnumerator*, Win32cr::Security::Cryptography::CERT_CONTEXT**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcCertificateEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85131937-8f24-421f-b439-59ab24d140b8")]
  record IOpcCertificateEnumerator, lpVtbl : IOpcCertificateEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x85131937_u32, 0x8f24_u16, 0x421f_u16, StaticArray[0xb4_u8, 0x39_u8, 0x59_u8, 0xab_u8, 0x24_u8, 0xd1_u8, 0x40_u8, 0xb8_u8])
    def query_interface(this : IOpcCertificateEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcCertificateEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcCertificateEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcCertificateEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcCertificateEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcCertificateEnumerator*, certificate : Win32cr::Security::Cryptography::CERT_CONTEXT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, certificate)
    end
    def clone(this : IOpcCertificateEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcDigitalSignatureEnumeratorVtbl,
    query_interface : Proc(IOpcDigitalSignatureEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcDigitalSignatureEnumerator*, UInt32),
    release : Proc(IOpcDigitalSignatureEnumerator*, UInt32),
    move_next : Proc(IOpcDigitalSignatureEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_previous : Proc(IOpcDigitalSignatureEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IOpcDigitalSignatureEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IOpcDigitalSignatureEnumerator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("967b6882-0ba3-4358-b9e7-b64c75063c5e")]
  record IOpcDigitalSignatureEnumerator, lpVtbl : IOpcDigitalSignatureEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x967b6882_u32, 0xba3_u16, 0x4358_u16, StaticArray[0xb9_u8, 0xe7_u8, 0xb6_u8, 0x4c_u8, 0x75_u8, 0x6_u8, 0x3c_u8, 0x5e_u8])
    def query_interface(this : IOpcDigitalSignatureEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcDigitalSignatureEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcDigitalSignatureEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_next(this : IOpcDigitalSignatureEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end
    def move_previous(this : IOpcDigitalSignatureEnumerator*, hasPrevious : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_previous.call(this, hasPrevious)
    end
    def get_current(this : IOpcDigitalSignatureEnumerator*, digitalSignature : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, digitalSignature)
    end
    def clone(this : IOpcDigitalSignatureEnumerator*, copy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, copy)
    end

  end

  @[Extern]
  record IOpcSignaturePartReferenceSetVtbl,
    query_interface : Proc(IOpcSignaturePartReferenceSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignaturePartReferenceSet*, UInt32),
    release : Proc(IOpcSignaturePartReferenceSet*, UInt32),
    create : Proc(IOpcSignaturePartReferenceSet*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IOpcSignaturePartReferenceSet*, Void*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcSignaturePartReferenceSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6c9fe28c-ecd9-4b22-9d36-7fdde670fec0")]
  record IOpcSignaturePartReferenceSet, lpVtbl : IOpcSignaturePartReferenceSetVtbl* do
    GUID = LibC::GUID.new(0x6c9fe28c_u32, 0xecd9_u16, 0x4b22_u16, StaticArray[0x9d_u8, 0x36_u8, 0x7f_u8, 0xdd_u8, 0xe6_u8, 0x70_u8, 0xfe_u8, 0xc0_u8])
    def query_interface(this : IOpcSignaturePartReferenceSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignaturePartReferenceSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignaturePartReferenceSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IOpcSignaturePartReferenceSet*, partUri : Void*, digestMethod : Win32cr::Foundation::PWSTR, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, partReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, partUri, digestMethod, transformMethod, partReference)
    end
    def delete(this : IOpcSignaturePartReferenceSet*, partReference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, partReference)
    end
    def get_enumerator(this : IOpcSignaturePartReferenceSet*, partReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, partReferenceEnumerator)
    end

  end

  @[Extern]
  record IOpcSignatureRelationshipReferenceSetVtbl,
    query_interface : Proc(IOpcSignatureRelationshipReferenceSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureRelationshipReferenceSet*, UInt32),
    release : Proc(IOpcSignatureRelationshipReferenceSet*, UInt32),
    create : Proc(IOpcSignatureRelationshipReferenceSet*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIPS_SIGNING_OPTION, Void*, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, Void**, Win32cr::Foundation::HRESULT),
    create_relationship_selector_set : Proc(IOpcSignatureRelationshipReferenceSet*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IOpcSignatureRelationshipReferenceSet*, Void*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcSignatureRelationshipReferenceSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f863ca5-3631-404c-828d-807e0715069b")]
  record IOpcSignatureRelationshipReferenceSet, lpVtbl : IOpcSignatureRelationshipReferenceSetVtbl* do
    GUID = LibC::GUID.new(0x9f863ca5_u32, 0x3631_u16, 0x404c_u16, StaticArray[0x82_u8, 0x8d_u8, 0x80_u8, 0x7e_u8, 0x7_u8, 0x15_u8, 0x6_u8, 0x9b_u8])
    def query_interface(this : IOpcSignatureRelationshipReferenceSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureRelationshipReferenceSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureRelationshipReferenceSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IOpcSignatureRelationshipReferenceSet*, sourceUri : Void*, digestMethod : Win32cr::Foundation::PWSTR, relationshipSigningOption : Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIPS_SIGNING_OPTION, selectorSet : Void*, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, relationshipReference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, sourceUri, digestMethod, relationshipSigningOption, selectorSet, transformMethod, relationshipReference)
    end
    def create_relationship_selector_set(this : IOpcSignatureRelationshipReferenceSet*, selectorSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_relationship_selector_set.call(this, selectorSet)
    end
    def delete(this : IOpcSignatureRelationshipReferenceSet*, relationshipReference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, relationshipReference)
    end
    def get_enumerator(this : IOpcSignatureRelationshipReferenceSet*, relationshipReferenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, relationshipReferenceEnumerator)
    end

  end

  @[Extern]
  record IOpcRelationshipSelectorSetVtbl,
    query_interface : Proc(IOpcRelationshipSelectorSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcRelationshipSelectorSet*, UInt32),
    release : Proc(IOpcRelationshipSelectorSet*, UInt32),
    create : Proc(IOpcRelationshipSelectorSet*, Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIP_SELECTOR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IOpcRelationshipSelectorSet*, Void*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcRelationshipSelectorSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6e34c269-a4d3-47c0-b5c4-87ff2b3b6136")]
  record IOpcRelationshipSelectorSet, lpVtbl : IOpcRelationshipSelectorSetVtbl* do
    GUID = LibC::GUID.new(0x6e34c269_u32, 0xa4d3_u16, 0x47c0_u16, StaticArray[0xb5_u8, 0xc4_u8, 0x87_u8, 0xff_u8, 0x2b_u8, 0x3b_u8, 0x61_u8, 0x36_u8])
    def query_interface(this : IOpcRelationshipSelectorSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcRelationshipSelectorSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcRelationshipSelectorSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IOpcRelationshipSelectorSet*, selector : Win32cr::Storage::Packaging::Opc::OPC_RELATIONSHIP_SELECTOR, selectionCriterion : Win32cr::Foundation::PWSTR, relationshipSelector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, selector, selectionCriterion, relationshipSelector)
    end
    def delete(this : IOpcRelationshipSelectorSet*, relationshipSelector : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, relationshipSelector)
    end
    def get_enumerator(this : IOpcRelationshipSelectorSet*, relationshipSelectorEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, relationshipSelectorEnumerator)
    end

  end

  @[Extern]
  record IOpcSignatureReferenceSetVtbl,
    query_interface : Proc(IOpcSignatureReferenceSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureReferenceSet*, UInt32),
    release : Proc(IOpcSignatureReferenceSet*, UInt32),
    create : Proc(IOpcSignatureReferenceSet*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IOpcSignatureReferenceSet*, Void*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcSignatureReferenceSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f3b02d31-ab12-42dd-9e2f-2b16761c3c1e")]
  record IOpcSignatureReferenceSet, lpVtbl : IOpcSignatureReferenceSetVtbl* do
    GUID = LibC::GUID.new(0xf3b02d31_u32, 0xab12_u16, 0x42dd_u16, StaticArray[0x9e_u8, 0x2f_u8, 0x2b_u8, 0x16_u8, 0x76_u8, 0x1c_u8, 0x3c_u8, 0x1e_u8])
    def query_interface(this : IOpcSignatureReferenceSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureReferenceSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureReferenceSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IOpcSignatureReferenceSet*, referenceUri : Void*, referenceId : Win32cr::Foundation::PWSTR, type__ : Win32cr::Foundation::PWSTR, digestMethod : Win32cr::Foundation::PWSTR, transformMethod : Win32cr::Storage::Packaging::Opc::OPC_CANONICALIZATION_METHOD, reference : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, referenceUri, referenceId, type__, digestMethod, transformMethod, reference)
    end
    def delete(this : IOpcSignatureReferenceSet*, reference : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, reference)
    end
    def get_enumerator(this : IOpcSignatureReferenceSet*, referenceEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, referenceEnumerator)
    end

  end

  @[Extern]
  record IOpcSignatureCustomObjectSetVtbl,
    query_interface : Proc(IOpcSignatureCustomObjectSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcSignatureCustomObjectSet*, UInt32),
    release : Proc(IOpcSignatureCustomObjectSet*, UInt32),
    create : Proc(IOpcSignatureCustomObjectSet*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IOpcSignatureCustomObjectSet*, Void*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcSignatureCustomObjectSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8f792ac5-7947-4e11-bc3d-2659ff046ae1")]
  record IOpcSignatureCustomObjectSet, lpVtbl : IOpcSignatureCustomObjectSetVtbl* do
    GUID = LibC::GUID.new(0x8f792ac5_u32, 0x7947_u16, 0x4e11_u16, StaticArray[0xbc_u8, 0x3d_u8, 0x26_u8, 0x59_u8, 0xff_u8, 0x4_u8, 0x6a_u8, 0xe1_u8])
    def query_interface(this : IOpcSignatureCustomObjectSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcSignatureCustomObjectSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcSignatureCustomObjectSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IOpcSignatureCustomObjectSet*, xmlMarkup : UInt8*, count : UInt32, customObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, xmlMarkup, count, customObject)
    end
    def delete(this : IOpcSignatureCustomObjectSet*, customObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, customObject)
    end
    def get_enumerator(this : IOpcSignatureCustomObjectSet*, customObjectEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, customObjectEnumerator)
    end

  end

  @[Extern]
  record IOpcCertificateSetVtbl,
    query_interface : Proc(IOpcCertificateSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcCertificateSet*, UInt32),
    release : Proc(IOpcCertificateSet*, UInt32),
    add : Proc(IOpcCertificateSet*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::HRESULT),
    remove : Proc(IOpcCertificateSet*, Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IOpcCertificateSet*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56ea4325-8e2d-4167-b1a4-e486d24c8fa7")]
  record IOpcCertificateSet, lpVtbl : IOpcCertificateSetVtbl* do
    GUID = LibC::GUID.new(0x56ea4325_u32, 0x8e2d_u16, 0x4167_u16, StaticArray[0xb1_u8, 0xa4_u8, 0xe4_u8, 0x86_u8, 0xd2_u8, 0x4c_u8, 0x8f_u8, 0xa7_u8])
    def query_interface(this : IOpcCertificateSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcCertificateSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcCertificateSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : IOpcCertificateSet*, certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, certificate)
    end
    def remove(this : IOpcCertificateSet*, certificate : Win32cr::Security::Cryptography::CERT_CONTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, certificate)
    end
    def get_enumerator(this : IOpcCertificateSet*, certificateEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, certificateEnumerator)
    end

  end

  @[Extern]
  record IOpcFactoryVtbl,
    query_interface : Proc(IOpcFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOpcFactory*, UInt32),
    release : Proc(IOpcFactory*, UInt32),
    create_package_root_uri : Proc(IOpcFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_part_uri : Proc(IOpcFactory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_stream_on_file : Proc(IOpcFactory*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Opc::OPC_STREAM_IO_MODE, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_package : Proc(IOpcFactory*, Void**, Win32cr::Foundation::HRESULT),
    read_package_from_stream : Proc(IOpcFactory*, Void*, Win32cr::Storage::Packaging::Opc::OPC_READ_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    write_package_to_stream : Proc(IOpcFactory*, Void*, Win32cr::Storage::Packaging::Opc::OPC_WRITE_FLAGS, Void*, Win32cr::Foundation::HRESULT),
    create_digital_signature_manager : Proc(IOpcFactory*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6d0b4446-cd73-4ab3-94f4-8ccdf6116154")]
  record IOpcFactory, lpVtbl : IOpcFactoryVtbl* do
    GUID = LibC::GUID.new(0x6d0b4446_u32, 0xcd73_u16, 0x4ab3_u16, StaticArray[0x94_u8, 0xf4_u8, 0x8c_u8, 0xcd_u8, 0xf6_u8, 0x11_u8, 0x61_u8, 0x54_u8])
    def query_interface(this : IOpcFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOpcFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOpcFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_package_root_uri(this : IOpcFactory*, rootUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_root_uri.call(this, rootUri)
    end
    def create_part_uri(this : IOpcFactory*, pwzUri : Win32cr::Foundation::PWSTR, partUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_part_uri.call(this, pwzUri, partUri)
    end
    def create_stream_on_file(this : IOpcFactory*, filename : Win32cr::Foundation::PWSTR, ioMode : Win32cr::Storage::Packaging::Opc::OPC_STREAM_IO_MODE, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwFlagsAndAttributes : UInt32, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream_on_file.call(this, filename, ioMode, securityAttributes, dwFlagsAndAttributes, stream)
    end
    def create_package(this : IOpcFactory*, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package.call(this, package)
    end
    def read_package_from_stream(this : IOpcFactory*, stream : Void*, flags : Win32cr::Storage::Packaging::Opc::OPC_READ_FLAGS, package : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_package_from_stream.call(this, stream, flags, package)
    end
    def write_package_to_stream(this : IOpcFactory*, package : Void*, flags : Win32cr::Storage::Packaging::Opc::OPC_WRITE_FLAGS, stream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_package_to_stream.call(this, package, flags, stream)
    end
    def create_digital_signature_manager(this : IOpcFactory*, package : Void*, signatureManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_digital_signature_manager.call(this, package, signatureManager)
    end

  end

end