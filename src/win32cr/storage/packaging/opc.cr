require "../../system/com.cr"
require "../../foundation.cr"
require "../../security/cryptography.cr"
require "../../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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


  enum OPC_URI_TARGET_MODE : Int32
    OPC_URI_TARGET_MODE_INTERNAL = 0
    OPC_URI_TARGET_MODE_EXTERNAL = 1
  end

  enum OPC_COMPRESSION_OPTIONS : Int32
    OPC_COMPRESSION_NONE = -1
    OPC_COMPRESSION_NORMAL = 0
    OPC_COMPRESSION_MAXIMUM = 1
    OPC_COMPRESSION_FAST = 2
    OPC_COMPRESSION_SUPERFAST = 3
  end

  enum OPC_STREAM_IO_MODE : Int32
    OPC_STREAM_IO_READ = 1
    OPC_STREAM_IO_WRITE = 2
  end

  enum OPC_READ_FLAGS : UInt32
    OPC_READ_DEFAULT = 0
    OPC_VALIDATE_ON_LOAD = 1
    OPC_CACHE_ON_ACCESS = 2
  end

  enum OPC_WRITE_FLAGS : UInt32
    OPC_WRITE_DEFAULT = 0
    OPC_WRITE_FORCE_ZIP32 = 1
  end

  enum OPC_SIGNATURE_VALIDATION_RESULT : Int32
    OPC_SIGNATURE_VALID = 0
    OPC_SIGNATURE_INVALID = -1
  end

  enum OPC_CANONICALIZATION_METHOD : Int32
    OPC_CANONICALIZATION_NONE = 0
    OPC_CANONICALIZATION_C14N = 1
    OPC_CANONICALIZATION_C14N_WITH_COMMENTS = 2
  end

  enum OPC_RELATIONSHIP_SELECTOR : Int32
    OPC_RELATIONSHIP_SELECT_BY_ID = 0
    OPC_RELATIONSHIP_SELECT_BY_TYPE = 1
  end

  enum OPC_RELATIONSHIPS_SIGNING_OPTION : Int32
    OPC_RELATIONSHIP_SIGN_USING_SELECTORS = 0
    OPC_RELATIONSHIP_SIGN_PART = 1
  end

  enum OPC_CERTIFICATE_EMBEDDING_OPTION : Int32
    OPC_CERTIFICATE_IN_CERTIFICATE_PART = 0
    OPC_CERTIFICATE_IN_SIGNATURE_PART = 1
    OPC_CERTIFICATE_NOT_EMBEDDED = 2
  end

  enum OPC_SIGNATURE_TIME_FORMAT : Int32
    OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS = 0
    OPC_SIGNATURE_TIME_FORMAT_SECONDS = 1
    OPC_SIGNATURE_TIME_FORMAT_MINUTES = 2
    OPC_SIGNATURE_TIME_FORMAT_DAYS = 3
    OPC_SIGNATURE_TIME_FORMAT_MONTHS = 4
    OPC_SIGNATURE_TIME_FORMAT_YEARS = 5
  end


  struct IOpcUriVTbl
    query_interface : Proc(IOpcUri*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcUri*, UInt32)
    release : Proc(IOpcUri*, UInt32)
    get_property_bstr : Proc(IOpcUri*, Uri_PROPERTY, UInt8**, UInt32, HRESULT)
    get_property_length : Proc(IOpcUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    get_property_dword : Proc(IOpcUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    has_property : Proc(IOpcUri*, Uri_PROPERTY, LibC::BOOL*, HRESULT)
    get_absolute_uri : Proc(IOpcUri*, UInt8**, HRESULT)
    get_authority : Proc(IOpcUri*, UInt8**, HRESULT)
    get_display_uri : Proc(IOpcUri*, UInt8**, HRESULT)
    get_domain : Proc(IOpcUri*, UInt8**, HRESULT)
    get_extension : Proc(IOpcUri*, UInt8**, HRESULT)
    get_fragment : Proc(IOpcUri*, UInt8**, HRESULT)
    get_host : Proc(IOpcUri*, UInt8**, HRESULT)
    get_password : Proc(IOpcUri*, UInt8**, HRESULT)
    get_path : Proc(IOpcUri*, UInt8**, HRESULT)
    get_path_and_query : Proc(IOpcUri*, UInt8**, HRESULT)
    get_query : Proc(IOpcUri*, UInt8**, HRESULT)
    get_raw_uri : Proc(IOpcUri*, UInt8**, HRESULT)
    get_scheme_name : Proc(IOpcUri*, UInt8**, HRESULT)
    get_user_info : Proc(IOpcUri*, UInt8**, HRESULT)
    get_user_name : Proc(IOpcUri*, UInt8**, HRESULT)
    get_host_type : Proc(IOpcUri*, UInt32*, HRESULT)
    get_port : Proc(IOpcUri*, UInt32*, HRESULT)
    get_scheme : Proc(IOpcUri*, UInt32*, HRESULT)
    get_zone : Proc(IOpcUri*, UInt32*, HRESULT)
    get_properties : Proc(IOpcUri*, UInt32*, HRESULT)
    is_equal : Proc(IOpcUri*, IUri, LibC::BOOL*, HRESULT)
    get_relationships_part_uri : Proc(IOpcUri*, IOpcPartUri*, HRESULT)
    get_relative_uri : Proc(IOpcUri*, IOpcPartUri, IUri*, HRESULT)
    combine_part_uri : Proc(IOpcUri*, IUri, IOpcPartUri*, HRESULT)
  end

  IOpcUri_GUID = "bc9c1b9b-d62c-49eb-aef0-3b4e0b28ebed"
  IID_IOpcUri = LibC::GUID.new(0xbc9c1b9b_u32, 0xd62c_u16, 0x49eb_u16, StaticArray[0xae_u8, 0xf0_u8, 0x3b_u8, 0x4e_u8, 0xb_u8, 0x28_u8, 0xeb_u8, 0xed_u8])
  struct IOpcUri
    lpVtbl : IOpcUriVTbl*
  end

  struct IOpcPartUriVTbl
    query_interface : Proc(IOpcPartUri*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcPartUri*, UInt32)
    release : Proc(IOpcPartUri*, UInt32)
    get_property_bstr : Proc(IOpcPartUri*, Uri_PROPERTY, UInt8**, UInt32, HRESULT)
    get_property_length : Proc(IOpcPartUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    get_property_dword : Proc(IOpcPartUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    has_property : Proc(IOpcPartUri*, Uri_PROPERTY, LibC::BOOL*, HRESULT)
    get_absolute_uri : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_authority : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_display_uri : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_domain : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_extension : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_fragment : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_host : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_password : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_path : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_path_and_query : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_query : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_raw_uri : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_scheme_name : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_user_info : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_user_name : Proc(IOpcPartUri*, UInt8**, HRESULT)
    get_host_type : Proc(IOpcPartUri*, UInt32*, HRESULT)
    get_port : Proc(IOpcPartUri*, UInt32*, HRESULT)
    get_scheme : Proc(IOpcPartUri*, UInt32*, HRESULT)
    get_zone : Proc(IOpcPartUri*, UInt32*, HRESULT)
    get_properties : Proc(IOpcPartUri*, UInt32*, HRESULT)
    is_equal : Proc(IOpcPartUri*, IUri, LibC::BOOL*, HRESULT)
    get_relationships_part_uri : Proc(IOpcPartUri*, IOpcPartUri*, HRESULT)
    get_relative_uri : Proc(IOpcPartUri*, IOpcPartUri, IUri*, HRESULT)
    combine_part_uri : Proc(IOpcPartUri*, IUri, IOpcPartUri*, HRESULT)
    compare_part_uri : Proc(IOpcPartUri*, IOpcPartUri, Int32*, HRESULT)
    get_source_uri : Proc(IOpcPartUri*, IOpcUri*, HRESULT)
    is_relationships_part_uri : Proc(IOpcPartUri*, LibC::BOOL*, HRESULT)
  end

  IOpcPartUri_GUID = "7d3babe7-88b2-46ba-85cb-4203cb016c87"
  IID_IOpcPartUri = LibC::GUID.new(0x7d3babe7_u32, 0x88b2_u16, 0x46ba_u16, StaticArray[0x85_u8, 0xcb_u8, 0x42_u8, 0x3_u8, 0xcb_u8, 0x1_u8, 0x6c_u8, 0x87_u8])
  struct IOpcPartUri
    lpVtbl : IOpcPartUriVTbl*
  end

  struct IOpcPackageVTbl
    query_interface : Proc(IOpcPackage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcPackage*, UInt32)
    release : Proc(IOpcPackage*, UInt32)
    get_part_set : Proc(IOpcPackage*, IOpcPartSet*, HRESULT)
    get_relationship_set : Proc(IOpcPackage*, IOpcRelationshipSet*, HRESULT)
  end

  IOpcPackage_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee70"
  IID_IOpcPackage = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x70_u8])
  struct IOpcPackage
    lpVtbl : IOpcPackageVTbl*
  end

  struct IOpcPartVTbl
    query_interface : Proc(IOpcPart*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcPart*, UInt32)
    release : Proc(IOpcPart*, UInt32)
    get_relationship_set : Proc(IOpcPart*, IOpcRelationshipSet*, HRESULT)
    get_content_stream : Proc(IOpcPart*, IStream*, HRESULT)
    get_name : Proc(IOpcPart*, IOpcPartUri*, HRESULT)
    get_content_type : Proc(IOpcPart*, LibC::LPWSTR*, HRESULT)
    get_compression_options : Proc(IOpcPart*, OPC_COMPRESSION_OPTIONS*, HRESULT)
  end

  IOpcPart_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee71"
  IID_IOpcPart = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x71_u8])
  struct IOpcPart
    lpVtbl : IOpcPartVTbl*
  end

  struct IOpcRelationshipVTbl
    query_interface : Proc(IOpcRelationship*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationship*, UInt32)
    release : Proc(IOpcRelationship*, UInt32)
    get_id : Proc(IOpcRelationship*, LibC::LPWSTR*, HRESULT)
    get_relationship_type : Proc(IOpcRelationship*, LibC::LPWSTR*, HRESULT)
    get_source_uri : Proc(IOpcRelationship*, IOpcUri*, HRESULT)
    get_target_uri : Proc(IOpcRelationship*, IUri*, HRESULT)
    get_target_mode : Proc(IOpcRelationship*, OPC_URI_TARGET_MODE*, HRESULT)
  end

  IOpcRelationship_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee72"
  IID_IOpcRelationship = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x72_u8])
  struct IOpcRelationship
    lpVtbl : IOpcRelationshipVTbl*
  end

  struct IOpcPartSetVTbl
    query_interface : Proc(IOpcPartSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcPartSet*, UInt32)
    release : Proc(IOpcPartSet*, UInt32)
    get_part : Proc(IOpcPartSet*, IOpcPartUri, IOpcPart*, HRESULT)
    create_part : Proc(IOpcPartSet*, IOpcPartUri, LibC::LPWSTR, OPC_COMPRESSION_OPTIONS, IOpcPart*, HRESULT)
    delete_part : Proc(IOpcPartSet*, IOpcPartUri, HRESULT)
    part_exists : Proc(IOpcPartSet*, IOpcPartUri, LibC::BOOL*, HRESULT)
    get_enumerator : Proc(IOpcPartSet*, IOpcPartEnumerator*, HRESULT)
  end

  IOpcPartSet_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee73"
  IID_IOpcPartSet = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x73_u8])
  struct IOpcPartSet
    lpVtbl : IOpcPartSetVTbl*
  end

  struct IOpcRelationshipSetVTbl
    query_interface : Proc(IOpcRelationshipSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationshipSet*, UInt32)
    release : Proc(IOpcRelationshipSet*, UInt32)
    get_relationship : Proc(IOpcRelationshipSet*, LibC::LPWSTR, IOpcRelationship*, HRESULT)
    create_relationship : Proc(IOpcRelationshipSet*, LibC::LPWSTR, LibC::LPWSTR, IUri, OPC_URI_TARGET_MODE, IOpcRelationship*, HRESULT)
    delete_relationship : Proc(IOpcRelationshipSet*, LibC::LPWSTR, HRESULT)
    relationship_exists : Proc(IOpcRelationshipSet*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    get_enumerator : Proc(IOpcRelationshipSet*, IOpcRelationshipEnumerator*, HRESULT)
    get_enumerator_for_type : Proc(IOpcRelationshipSet*, LibC::LPWSTR, IOpcRelationshipEnumerator*, HRESULT)
    get_relationships_content_stream : Proc(IOpcRelationshipSet*, IStream*, HRESULT)
  end

  IOpcRelationshipSet_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee74"
  IID_IOpcRelationshipSet = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x74_u8])
  struct IOpcRelationshipSet
    lpVtbl : IOpcRelationshipSetVTbl*
  end

  struct IOpcPartEnumeratorVTbl
    query_interface : Proc(IOpcPartEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcPartEnumerator*, UInt32)
    release : Proc(IOpcPartEnumerator*, UInt32)
    move_next : Proc(IOpcPartEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcPartEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcPartEnumerator*, IOpcPart*, HRESULT)
    clone : Proc(IOpcPartEnumerator*, IOpcPartEnumerator*, HRESULT)
  end

  IOpcPartEnumerator_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee75"
  IID_IOpcPartEnumerator = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x75_u8])
  struct IOpcPartEnumerator
    lpVtbl : IOpcPartEnumeratorVTbl*
  end

  struct IOpcRelationshipEnumeratorVTbl
    query_interface : Proc(IOpcRelationshipEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationshipEnumerator*, UInt32)
    release : Proc(IOpcRelationshipEnumerator*, UInt32)
    move_next : Proc(IOpcRelationshipEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcRelationshipEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcRelationshipEnumerator*, IOpcRelationship*, HRESULT)
    clone : Proc(IOpcRelationshipEnumerator*, IOpcRelationshipEnumerator*, HRESULT)
  end

  IOpcRelationshipEnumerator_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee76"
  IID_IOpcRelationshipEnumerator = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x76_u8])
  struct IOpcRelationshipEnumerator
    lpVtbl : IOpcRelationshipEnumeratorVTbl*
  end

  struct IOpcSignaturePartReferenceVTbl
    query_interface : Proc(IOpcSignaturePartReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignaturePartReference*, UInt32)
    release : Proc(IOpcSignaturePartReference*, UInt32)
    get_part_name : Proc(IOpcSignaturePartReference*, IOpcPartUri*, HRESULT)
    get_content_type : Proc(IOpcSignaturePartReference*, LibC::LPWSTR*, HRESULT)
    get_digest_method : Proc(IOpcSignaturePartReference*, LibC::LPWSTR*, HRESULT)
    get_digest_value : Proc(IOpcSignaturePartReference*, UInt8**, UInt32*, HRESULT)
    get_transform_method : Proc(IOpcSignaturePartReference*, OPC_CANONICALIZATION_METHOD*, HRESULT)
  end

  IOpcSignaturePartReference_GUID = "e24231ca-59f4-484e-b64b-36eeda36072c"
  IID_IOpcSignaturePartReference = LibC::GUID.new(0xe24231ca_u32, 0x59f4_u16, 0x484e_u16, StaticArray[0xb6_u8, 0x4b_u8, 0x36_u8, 0xee_u8, 0xda_u8, 0x36_u8, 0x7_u8, 0x2c_u8])
  struct IOpcSignaturePartReference
    lpVtbl : IOpcSignaturePartReferenceVTbl*
  end

  struct IOpcSignatureRelationshipReferenceVTbl
    query_interface : Proc(IOpcSignatureRelationshipReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureRelationshipReference*, UInt32)
    release : Proc(IOpcSignatureRelationshipReference*, UInt32)
    get_source_uri : Proc(IOpcSignatureRelationshipReference*, IOpcUri*, HRESULT)
    get_digest_method : Proc(IOpcSignatureRelationshipReference*, LibC::LPWSTR*, HRESULT)
    get_digest_value : Proc(IOpcSignatureRelationshipReference*, UInt8**, UInt32*, HRESULT)
    get_transform_method : Proc(IOpcSignatureRelationshipReference*, OPC_CANONICALIZATION_METHOD*, HRESULT)
    get_relationship_signing_option : Proc(IOpcSignatureRelationshipReference*, OPC_RELATIONSHIPS_SIGNING_OPTION*, HRESULT)
    get_relationship_selector_enumerator : Proc(IOpcSignatureRelationshipReference*, IOpcRelationshipSelectorEnumerator*, HRESULT)
  end

  IOpcSignatureRelationshipReference_GUID = "57babac6-9d4a-4e50-8b86-e5d4051eae7c"
  IID_IOpcSignatureRelationshipReference = LibC::GUID.new(0x57babac6_u32, 0x9d4a_u16, 0x4e50_u16, StaticArray[0x8b_u8, 0x86_u8, 0xe5_u8, 0xd4_u8, 0x5_u8, 0x1e_u8, 0xae_u8, 0x7c_u8])
  struct IOpcSignatureRelationshipReference
    lpVtbl : IOpcSignatureRelationshipReferenceVTbl*
  end

  struct IOpcRelationshipSelectorVTbl
    query_interface : Proc(IOpcRelationshipSelector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationshipSelector*, UInt32)
    release : Proc(IOpcRelationshipSelector*, UInt32)
    get_selector_type : Proc(IOpcRelationshipSelector*, OPC_RELATIONSHIP_SELECTOR*, HRESULT)
    get_selection_criterion : Proc(IOpcRelationshipSelector*, LibC::LPWSTR*, HRESULT)
  end

  IOpcRelationshipSelector_GUID = "f8f26c7f-b28f-4899-84c8-5d5639ede75f"
  IID_IOpcRelationshipSelector = LibC::GUID.new(0xf8f26c7f_u32, 0xb28f_u16, 0x4899_u16, StaticArray[0x84_u8, 0xc8_u8, 0x5d_u8, 0x56_u8, 0x39_u8, 0xed_u8, 0xe7_u8, 0x5f_u8])
  struct IOpcRelationshipSelector
    lpVtbl : IOpcRelationshipSelectorVTbl*
  end

  struct IOpcSignatureReferenceVTbl
    query_interface : Proc(IOpcSignatureReference*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureReference*, UInt32)
    release : Proc(IOpcSignatureReference*, UInt32)
    get_id : Proc(IOpcSignatureReference*, LibC::LPWSTR*, HRESULT)
    get_uri : Proc(IOpcSignatureReference*, IUri*, HRESULT)
    get_type : Proc(IOpcSignatureReference*, LibC::LPWSTR*, HRESULT)
    get_transform_method : Proc(IOpcSignatureReference*, OPC_CANONICALIZATION_METHOD*, HRESULT)
    get_digest_method : Proc(IOpcSignatureReference*, LibC::LPWSTR*, HRESULT)
    get_digest_value : Proc(IOpcSignatureReference*, UInt8**, UInt32*, HRESULT)
  end

  IOpcSignatureReference_GUID = "1b47005e-3011-4edc-be6f-0f65e5ab0342"
  IID_IOpcSignatureReference = LibC::GUID.new(0x1b47005e_u32, 0x3011_u16, 0x4edc_u16, StaticArray[0xbe_u8, 0x6f_u8, 0xf_u8, 0x65_u8, 0xe5_u8, 0xab_u8, 0x3_u8, 0x42_u8])
  struct IOpcSignatureReference
    lpVtbl : IOpcSignatureReferenceVTbl*
  end

  struct IOpcSignatureCustomObjectVTbl
    query_interface : Proc(IOpcSignatureCustomObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureCustomObject*, UInt32)
    release : Proc(IOpcSignatureCustomObject*, UInt32)
    get_xml : Proc(IOpcSignatureCustomObject*, UInt8**, UInt32*, HRESULT)
  end

  IOpcSignatureCustomObject_GUID = "5d77a19e-62c1-44e7-becd-45da5ae51a56"
  IID_IOpcSignatureCustomObject = LibC::GUID.new(0x5d77a19e_u32, 0x62c1_u16, 0x44e7_u16, StaticArray[0xbe_u8, 0xcd_u8, 0x45_u8, 0xda_u8, 0x5a_u8, 0xe5_u8, 0x1a_u8, 0x56_u8])
  struct IOpcSignatureCustomObject
    lpVtbl : IOpcSignatureCustomObjectVTbl*
  end

  struct IOpcDigitalSignatureVTbl
    query_interface : Proc(IOpcDigitalSignature*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcDigitalSignature*, UInt32)
    release : Proc(IOpcDigitalSignature*, UInt32)
    get_namespaces : Proc(IOpcDigitalSignature*, LibC::LPWSTR**, LibC::LPWSTR**, UInt32*, HRESULT)
    get_signature_id : Proc(IOpcDigitalSignature*, LibC::LPWSTR*, HRESULT)
    get_signature_part_name : Proc(IOpcDigitalSignature*, IOpcPartUri*, HRESULT)
    get_signature_method : Proc(IOpcDigitalSignature*, LibC::LPWSTR*, HRESULT)
    get_canonicalization_method : Proc(IOpcDigitalSignature*, OPC_CANONICALIZATION_METHOD*, HRESULT)
    get_signature_value : Proc(IOpcDigitalSignature*, UInt8**, UInt32*, HRESULT)
    get_signature_part_reference_enumerator : Proc(IOpcDigitalSignature*, IOpcSignaturePartReferenceEnumerator*, HRESULT)
    get_signature_relationship_reference_enumerator : Proc(IOpcDigitalSignature*, IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)
    get_signing_time : Proc(IOpcDigitalSignature*, LibC::LPWSTR*, HRESULT)
    get_time_format : Proc(IOpcDigitalSignature*, OPC_SIGNATURE_TIME_FORMAT*, HRESULT)
    get_package_object_reference : Proc(IOpcDigitalSignature*, IOpcSignatureReference*, HRESULT)
    get_certificate_enumerator : Proc(IOpcDigitalSignature*, IOpcCertificateEnumerator*, HRESULT)
    get_custom_reference_enumerator : Proc(IOpcDigitalSignature*, IOpcSignatureReferenceEnumerator*, HRESULT)
    get_custom_object_enumerator : Proc(IOpcDigitalSignature*, IOpcSignatureCustomObjectEnumerator*, HRESULT)
    get_signature_xml : Proc(IOpcDigitalSignature*, UInt8**, UInt32*, HRESULT)
  end

  IOpcDigitalSignature_GUID = "52ab21dd-1cd0-4949-bc80-0c1232d00cb4"
  IID_IOpcDigitalSignature = LibC::GUID.new(0x52ab21dd_u32, 0x1cd0_u16, 0x4949_u16, StaticArray[0xbc_u8, 0x80_u8, 0xc_u8, 0x12_u8, 0x32_u8, 0xd0_u8, 0xc_u8, 0xb4_u8])
  struct IOpcDigitalSignature
    lpVtbl : IOpcDigitalSignatureVTbl*
  end

  struct IOpcSigningOptionsVTbl
    query_interface : Proc(IOpcSigningOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSigningOptions*, UInt32)
    release : Proc(IOpcSigningOptions*, UInt32)
    get_signature_id : Proc(IOpcSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_signature_id : Proc(IOpcSigningOptions*, LibC::LPWSTR, HRESULT)
    get_signature_method : Proc(IOpcSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_signature_method : Proc(IOpcSigningOptions*, LibC::LPWSTR, HRESULT)
    get_default_digest_method : Proc(IOpcSigningOptions*, LibC::LPWSTR*, HRESULT)
    set_default_digest_method : Proc(IOpcSigningOptions*, LibC::LPWSTR, HRESULT)
    get_certificate_embedding_option : Proc(IOpcSigningOptions*, OPC_CERTIFICATE_EMBEDDING_OPTION*, HRESULT)
    set_certificate_embedding_option : Proc(IOpcSigningOptions*, OPC_CERTIFICATE_EMBEDDING_OPTION, HRESULT)
    get_time_format : Proc(IOpcSigningOptions*, OPC_SIGNATURE_TIME_FORMAT*, HRESULT)
    set_time_format : Proc(IOpcSigningOptions*, OPC_SIGNATURE_TIME_FORMAT, HRESULT)
    get_signature_part_reference_set : Proc(IOpcSigningOptions*, IOpcSignaturePartReferenceSet*, HRESULT)
    get_signature_relationship_reference_set : Proc(IOpcSigningOptions*, IOpcSignatureRelationshipReferenceSet*, HRESULT)
    get_custom_object_set : Proc(IOpcSigningOptions*, IOpcSignatureCustomObjectSet*, HRESULT)
    get_custom_reference_set : Proc(IOpcSigningOptions*, IOpcSignatureReferenceSet*, HRESULT)
    get_certificate_set : Proc(IOpcSigningOptions*, IOpcCertificateSet*, HRESULT)
    get_signature_part_name : Proc(IOpcSigningOptions*, IOpcPartUri*, HRESULT)
    set_signature_part_name : Proc(IOpcSigningOptions*, IOpcPartUri, HRESULT)
  end

  IOpcSigningOptions_GUID = "50d2d6a5-7aeb-46c0-b241-43ab0e9b407e"
  IID_IOpcSigningOptions = LibC::GUID.new(0x50d2d6a5_u32, 0x7aeb_u16, 0x46c0_u16, StaticArray[0xb2_u8, 0x41_u8, 0x43_u8, 0xab_u8, 0xe_u8, 0x9b_u8, 0x40_u8, 0x7e_u8])
  struct IOpcSigningOptions
    lpVtbl : IOpcSigningOptionsVTbl*
  end

  struct IOpcDigitalSignatureManagerVTbl
    query_interface : Proc(IOpcDigitalSignatureManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcDigitalSignatureManager*, UInt32)
    release : Proc(IOpcDigitalSignatureManager*, UInt32)
    get_signature_origin_part_name : Proc(IOpcDigitalSignatureManager*, IOpcPartUri*, HRESULT)
    set_signature_origin_part_name : Proc(IOpcDigitalSignatureManager*, IOpcPartUri, HRESULT)
    get_signature_enumerator : Proc(IOpcDigitalSignatureManager*, IOpcDigitalSignatureEnumerator*, HRESULT)
    remove_signature : Proc(IOpcDigitalSignatureManager*, IOpcPartUri, HRESULT)
    create_signing_options : Proc(IOpcDigitalSignatureManager*, IOpcSigningOptions*, HRESULT)
    validate : Proc(IOpcDigitalSignatureManager*, IOpcDigitalSignature, CERT_CONTEXT*, OPC_SIGNATURE_VALIDATION_RESULT*, HRESULT)
    sign : Proc(IOpcDigitalSignatureManager*, CERT_CONTEXT*, IOpcSigningOptions, IOpcDigitalSignature*, HRESULT)
    replace_signature_xml : Proc(IOpcDigitalSignatureManager*, IOpcPartUri, UInt8*, UInt32, IOpcDigitalSignature*, HRESULT)
  end

  IOpcDigitalSignatureManager_GUID = "d5e62a0b-696d-462f-94df-72e33cef2659"
  IID_IOpcDigitalSignatureManager = LibC::GUID.new(0xd5e62a0b_u32, 0x696d_u16, 0x462f_u16, StaticArray[0x94_u8, 0xdf_u8, 0x72_u8, 0xe3_u8, 0x3c_u8, 0xef_u8, 0x26_u8, 0x59_u8])
  struct IOpcDigitalSignatureManager
    lpVtbl : IOpcDigitalSignatureManagerVTbl*
  end

  struct IOpcSignaturePartReferenceEnumeratorVTbl
    query_interface : Proc(IOpcSignaturePartReferenceEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignaturePartReferenceEnumerator*, UInt32)
    release : Proc(IOpcSignaturePartReferenceEnumerator*, UInt32)
    move_next : Proc(IOpcSignaturePartReferenceEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcSignaturePartReferenceEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcSignaturePartReferenceEnumerator*, IOpcSignaturePartReference*, HRESULT)
    clone : Proc(IOpcSignaturePartReferenceEnumerator*, IOpcSignaturePartReferenceEnumerator*, HRESULT)
  end

  IOpcSignaturePartReferenceEnumerator_GUID = "80eb1561-8c77-49cf-8266-459b356ee99a"
  IID_IOpcSignaturePartReferenceEnumerator = LibC::GUID.new(0x80eb1561_u32, 0x8c77_u16, 0x49cf_u16, StaticArray[0x82_u8, 0x66_u8, 0x45_u8, 0x9b_u8, 0x35_u8, 0x6e_u8, 0xe9_u8, 0x9a_u8])
  struct IOpcSignaturePartReferenceEnumerator
    lpVtbl : IOpcSignaturePartReferenceEnumeratorVTbl*
  end

  struct IOpcSignatureRelationshipReferenceEnumeratorVTbl
    query_interface : Proc(IOpcSignatureRelationshipReferenceEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureRelationshipReferenceEnumerator*, UInt32)
    release : Proc(IOpcSignatureRelationshipReferenceEnumerator*, UInt32)
    move_next : Proc(IOpcSignatureRelationshipReferenceEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcSignatureRelationshipReferenceEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcSignatureRelationshipReferenceEnumerator*, IOpcSignatureRelationshipReference*, HRESULT)
    clone : Proc(IOpcSignatureRelationshipReferenceEnumerator*, IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)
  end

  IOpcSignatureRelationshipReferenceEnumerator_GUID = "773ba3e4-f021-48e4-aa04-9816db5d3495"
  IID_IOpcSignatureRelationshipReferenceEnumerator = LibC::GUID.new(0x773ba3e4_u32, 0xf021_u16, 0x48e4_u16, StaticArray[0xaa_u8, 0x4_u8, 0x98_u8, 0x16_u8, 0xdb_u8, 0x5d_u8, 0x34_u8, 0x95_u8])
  struct IOpcSignatureRelationshipReferenceEnumerator
    lpVtbl : IOpcSignatureRelationshipReferenceEnumeratorVTbl*
  end

  struct IOpcRelationshipSelectorEnumeratorVTbl
    query_interface : Proc(IOpcRelationshipSelectorEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationshipSelectorEnumerator*, UInt32)
    release : Proc(IOpcRelationshipSelectorEnumerator*, UInt32)
    move_next : Proc(IOpcRelationshipSelectorEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcRelationshipSelectorEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcRelationshipSelectorEnumerator*, IOpcRelationshipSelector*, HRESULT)
    clone : Proc(IOpcRelationshipSelectorEnumerator*, IOpcRelationshipSelectorEnumerator*, HRESULT)
  end

  IOpcRelationshipSelectorEnumerator_GUID = "5e50a181-a91b-48ac-88d2-bca3d8f8c0b1"
  IID_IOpcRelationshipSelectorEnumerator = LibC::GUID.new(0x5e50a181_u32, 0xa91b_u16, 0x48ac_u16, StaticArray[0x88_u8, 0xd2_u8, 0xbc_u8, 0xa3_u8, 0xd8_u8, 0xf8_u8, 0xc0_u8, 0xb1_u8])
  struct IOpcRelationshipSelectorEnumerator
    lpVtbl : IOpcRelationshipSelectorEnumeratorVTbl*
  end

  struct IOpcSignatureReferenceEnumeratorVTbl
    query_interface : Proc(IOpcSignatureReferenceEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureReferenceEnumerator*, UInt32)
    release : Proc(IOpcSignatureReferenceEnumerator*, UInt32)
    move_next : Proc(IOpcSignatureReferenceEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcSignatureReferenceEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcSignatureReferenceEnumerator*, IOpcSignatureReference*, HRESULT)
    clone : Proc(IOpcSignatureReferenceEnumerator*, IOpcSignatureReferenceEnumerator*, HRESULT)
  end

  IOpcSignatureReferenceEnumerator_GUID = "cfa59a45-28b1-4868-969e-fa8097fdc12a"
  IID_IOpcSignatureReferenceEnumerator = LibC::GUID.new(0xcfa59a45_u32, 0x28b1_u16, 0x4868_u16, StaticArray[0x96_u8, 0x9e_u8, 0xfa_u8, 0x80_u8, 0x97_u8, 0xfd_u8, 0xc1_u8, 0x2a_u8])
  struct IOpcSignatureReferenceEnumerator
    lpVtbl : IOpcSignatureReferenceEnumeratorVTbl*
  end

  struct IOpcSignatureCustomObjectEnumeratorVTbl
    query_interface : Proc(IOpcSignatureCustomObjectEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureCustomObjectEnumerator*, UInt32)
    release : Proc(IOpcSignatureCustomObjectEnumerator*, UInt32)
    move_next : Proc(IOpcSignatureCustomObjectEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcSignatureCustomObjectEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcSignatureCustomObjectEnumerator*, IOpcSignatureCustomObject*, HRESULT)
    clone : Proc(IOpcSignatureCustomObjectEnumerator*, IOpcSignatureCustomObjectEnumerator*, HRESULT)
  end

  IOpcSignatureCustomObjectEnumerator_GUID = "5ee4fe1d-e1b0-4683-8079-7ea0fcf80b4c"
  IID_IOpcSignatureCustomObjectEnumerator = LibC::GUID.new(0x5ee4fe1d_u32, 0xe1b0_u16, 0x4683_u16, StaticArray[0x80_u8, 0x79_u8, 0x7e_u8, 0xa0_u8, 0xfc_u8, 0xf8_u8, 0xb_u8, 0x4c_u8])
  struct IOpcSignatureCustomObjectEnumerator
    lpVtbl : IOpcSignatureCustomObjectEnumeratorVTbl*
  end

  struct IOpcCertificateEnumeratorVTbl
    query_interface : Proc(IOpcCertificateEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcCertificateEnumerator*, UInt32)
    release : Proc(IOpcCertificateEnumerator*, UInt32)
    move_next : Proc(IOpcCertificateEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcCertificateEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcCertificateEnumerator*, CERT_CONTEXT**, HRESULT)
    clone : Proc(IOpcCertificateEnumerator*, IOpcCertificateEnumerator*, HRESULT)
  end

  IOpcCertificateEnumerator_GUID = "85131937-8f24-421f-b439-59ab24d140b8"
  IID_IOpcCertificateEnumerator = LibC::GUID.new(0x85131937_u32, 0x8f24_u16, 0x421f_u16, StaticArray[0xb4_u8, 0x39_u8, 0x59_u8, 0xab_u8, 0x24_u8, 0xd1_u8, 0x40_u8, 0xb8_u8])
  struct IOpcCertificateEnumerator
    lpVtbl : IOpcCertificateEnumeratorVTbl*
  end

  struct IOpcDigitalSignatureEnumeratorVTbl
    query_interface : Proc(IOpcDigitalSignatureEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcDigitalSignatureEnumerator*, UInt32)
    release : Proc(IOpcDigitalSignatureEnumerator*, UInt32)
    move_next : Proc(IOpcDigitalSignatureEnumerator*, LibC::BOOL*, HRESULT)
    move_previous : Proc(IOpcDigitalSignatureEnumerator*, LibC::BOOL*, HRESULT)
    get_current : Proc(IOpcDigitalSignatureEnumerator*, IOpcDigitalSignature*, HRESULT)
    clone : Proc(IOpcDigitalSignatureEnumerator*, IOpcDigitalSignatureEnumerator*, HRESULT)
  end

  IOpcDigitalSignatureEnumerator_GUID = "967b6882-0ba3-4358-b9e7-b64c75063c5e"
  IID_IOpcDigitalSignatureEnumerator = LibC::GUID.new(0x967b6882_u32, 0xba3_u16, 0x4358_u16, StaticArray[0xb9_u8, 0xe7_u8, 0xb6_u8, 0x4c_u8, 0x75_u8, 0x6_u8, 0x3c_u8, 0x5e_u8])
  struct IOpcDigitalSignatureEnumerator
    lpVtbl : IOpcDigitalSignatureEnumeratorVTbl*
  end

  struct IOpcSignaturePartReferenceSetVTbl
    query_interface : Proc(IOpcSignaturePartReferenceSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignaturePartReferenceSet*, UInt32)
    release : Proc(IOpcSignaturePartReferenceSet*, UInt32)
    create : Proc(IOpcSignaturePartReferenceSet*, IOpcPartUri, LibC::LPWSTR, OPC_CANONICALIZATION_METHOD, IOpcSignaturePartReference*, HRESULT)
    delete : Proc(IOpcSignaturePartReferenceSet*, IOpcSignaturePartReference, HRESULT)
    get_enumerator : Proc(IOpcSignaturePartReferenceSet*, IOpcSignaturePartReferenceEnumerator*, HRESULT)
  end

  IOpcSignaturePartReferenceSet_GUID = "6c9fe28c-ecd9-4b22-9d36-7fdde670fec0"
  IID_IOpcSignaturePartReferenceSet = LibC::GUID.new(0x6c9fe28c_u32, 0xecd9_u16, 0x4b22_u16, StaticArray[0x9d_u8, 0x36_u8, 0x7f_u8, 0xdd_u8, 0xe6_u8, 0x70_u8, 0xfe_u8, 0xc0_u8])
  struct IOpcSignaturePartReferenceSet
    lpVtbl : IOpcSignaturePartReferenceSetVTbl*
  end

  struct IOpcSignatureRelationshipReferenceSetVTbl
    query_interface : Proc(IOpcSignatureRelationshipReferenceSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureRelationshipReferenceSet*, UInt32)
    release : Proc(IOpcSignatureRelationshipReferenceSet*, UInt32)
    create : Proc(IOpcSignatureRelationshipReferenceSet*, IOpcUri, LibC::LPWSTR, OPC_RELATIONSHIPS_SIGNING_OPTION, IOpcRelationshipSelectorSet, OPC_CANONICALIZATION_METHOD, IOpcSignatureRelationshipReference*, HRESULT)
    create_relationship_selector_set : Proc(IOpcSignatureRelationshipReferenceSet*, IOpcRelationshipSelectorSet*, HRESULT)
    delete : Proc(IOpcSignatureRelationshipReferenceSet*, IOpcSignatureRelationshipReference, HRESULT)
    get_enumerator : Proc(IOpcSignatureRelationshipReferenceSet*, IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)
  end

  IOpcSignatureRelationshipReferenceSet_GUID = "9f863ca5-3631-404c-828d-807e0715069b"
  IID_IOpcSignatureRelationshipReferenceSet = LibC::GUID.new(0x9f863ca5_u32, 0x3631_u16, 0x404c_u16, StaticArray[0x82_u8, 0x8d_u8, 0x80_u8, 0x7e_u8, 0x7_u8, 0x15_u8, 0x6_u8, 0x9b_u8])
  struct IOpcSignatureRelationshipReferenceSet
    lpVtbl : IOpcSignatureRelationshipReferenceSetVTbl*
  end

  struct IOpcRelationshipSelectorSetVTbl
    query_interface : Proc(IOpcRelationshipSelectorSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcRelationshipSelectorSet*, UInt32)
    release : Proc(IOpcRelationshipSelectorSet*, UInt32)
    create : Proc(IOpcRelationshipSelectorSet*, OPC_RELATIONSHIP_SELECTOR, LibC::LPWSTR, IOpcRelationshipSelector*, HRESULT)
    delete : Proc(IOpcRelationshipSelectorSet*, IOpcRelationshipSelector, HRESULT)
    get_enumerator : Proc(IOpcRelationshipSelectorSet*, IOpcRelationshipSelectorEnumerator*, HRESULT)
  end

  IOpcRelationshipSelectorSet_GUID = "6e34c269-a4d3-47c0-b5c4-87ff2b3b6136"
  IID_IOpcRelationshipSelectorSet = LibC::GUID.new(0x6e34c269_u32, 0xa4d3_u16, 0x47c0_u16, StaticArray[0xb5_u8, 0xc4_u8, 0x87_u8, 0xff_u8, 0x2b_u8, 0x3b_u8, 0x61_u8, 0x36_u8])
  struct IOpcRelationshipSelectorSet
    lpVtbl : IOpcRelationshipSelectorSetVTbl*
  end

  struct IOpcSignatureReferenceSetVTbl
    query_interface : Proc(IOpcSignatureReferenceSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureReferenceSet*, UInt32)
    release : Proc(IOpcSignatureReferenceSet*, UInt32)
    create : Proc(IOpcSignatureReferenceSet*, IUri, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, OPC_CANONICALIZATION_METHOD, IOpcSignatureReference*, HRESULT)
    delete : Proc(IOpcSignatureReferenceSet*, IOpcSignatureReference, HRESULT)
    get_enumerator : Proc(IOpcSignatureReferenceSet*, IOpcSignatureReferenceEnumerator*, HRESULT)
  end

  IOpcSignatureReferenceSet_GUID = "f3b02d31-ab12-42dd-9e2f-2b16761c3c1e"
  IID_IOpcSignatureReferenceSet = LibC::GUID.new(0xf3b02d31_u32, 0xab12_u16, 0x42dd_u16, StaticArray[0x9e_u8, 0x2f_u8, 0x2b_u8, 0x16_u8, 0x76_u8, 0x1c_u8, 0x3c_u8, 0x1e_u8])
  struct IOpcSignatureReferenceSet
    lpVtbl : IOpcSignatureReferenceSetVTbl*
  end

  struct IOpcSignatureCustomObjectSetVTbl
    query_interface : Proc(IOpcSignatureCustomObjectSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcSignatureCustomObjectSet*, UInt32)
    release : Proc(IOpcSignatureCustomObjectSet*, UInt32)
    create : Proc(IOpcSignatureCustomObjectSet*, UInt8*, UInt32, IOpcSignatureCustomObject*, HRESULT)
    delete : Proc(IOpcSignatureCustomObjectSet*, IOpcSignatureCustomObject, HRESULT)
    get_enumerator : Proc(IOpcSignatureCustomObjectSet*, IOpcSignatureCustomObjectEnumerator*, HRESULT)
  end

  IOpcSignatureCustomObjectSet_GUID = "8f792ac5-7947-4e11-bc3d-2659ff046ae1"
  IID_IOpcSignatureCustomObjectSet = LibC::GUID.new(0x8f792ac5_u32, 0x7947_u16, 0x4e11_u16, StaticArray[0xbc_u8, 0x3d_u8, 0x26_u8, 0x59_u8, 0xff_u8, 0x4_u8, 0x6a_u8, 0xe1_u8])
  struct IOpcSignatureCustomObjectSet
    lpVtbl : IOpcSignatureCustomObjectSetVTbl*
  end

  struct IOpcCertificateSetVTbl
    query_interface : Proc(IOpcCertificateSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcCertificateSet*, UInt32)
    release : Proc(IOpcCertificateSet*, UInt32)
    add : Proc(IOpcCertificateSet*, CERT_CONTEXT*, HRESULT)
    remove : Proc(IOpcCertificateSet*, CERT_CONTEXT*, HRESULT)
    get_enumerator : Proc(IOpcCertificateSet*, IOpcCertificateEnumerator*, HRESULT)
  end

  IOpcCertificateSet_GUID = "56ea4325-8e2d-4167-b1a4-e486d24c8fa7"
  IID_IOpcCertificateSet = LibC::GUID.new(0x56ea4325_u32, 0x8e2d_u16, 0x4167_u16, StaticArray[0xb1_u8, 0xa4_u8, 0xe4_u8, 0x86_u8, 0xd2_u8, 0x4c_u8, 0x8f_u8, 0xa7_u8])
  struct IOpcCertificateSet
    lpVtbl : IOpcCertificateSetVTbl*
  end

  struct IOpcFactoryVTbl
    query_interface : Proc(IOpcFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOpcFactory*, UInt32)
    release : Proc(IOpcFactory*, UInt32)
    create_package_root_uri : Proc(IOpcFactory*, IOpcUri*, HRESULT)
    create_part_uri : Proc(IOpcFactory*, LibC::LPWSTR, IOpcPartUri*, HRESULT)
    create_stream_on_file : Proc(IOpcFactory*, LibC::LPWSTR, OPC_STREAM_IO_MODE, SECURITY_ATTRIBUTES*, UInt32, IStream*, HRESULT)
    create_package : Proc(IOpcFactory*, IOpcPackage*, HRESULT)
    read_package_from_stream : Proc(IOpcFactory*, IStream, OPC_READ_FLAGS, IOpcPackage*, HRESULT)
    write_package_to_stream : Proc(IOpcFactory*, IOpcPackage, OPC_WRITE_FLAGS, IStream, HRESULT)
    create_digital_signature_manager : Proc(IOpcFactory*, IOpcPackage, IOpcDigitalSignatureManager*, HRESULT)
  end

  IOpcFactory_GUID = "6d0b4446-cd73-4ab3-94f4-8ccdf6116154"
  IID_IOpcFactory = LibC::GUID.new(0x6d0b4446_u32, 0xcd73_u16, 0x4ab3_u16, StaticArray[0x94_u8, 0xf4_u8, 0x8c_u8, 0xcd_u8, 0xf6_u8, 0x11_u8, 0x61_u8, 0x54_u8])
  struct IOpcFactory
    lpVtbl : IOpcFactoryVTbl*
  end

end
struct LibWin32::IOpcUri
  def query_interface(this : IOpcUri*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcUri*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcUri*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property_bstr(this : IOpcUri*, uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.call(this, uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(this : IOpcUri*, uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.call(this, uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(this : IOpcUri*, uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.call(this, uriprop, pdwproperty, dwflags)
  end
  def has_property(this : IOpcUri*, uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.call(this, uriprop, pfhasproperty)
  end
  def get_absolute_uri(this : IOpcUri*, pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.call(this, pbstrabsoluteuri)
  end
  def get_authority(this : IOpcUri*, pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.call(this, pbstrauthority)
  end
  def get_display_uri(this : IOpcUri*, pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.call(this, pbstrdisplaystring)
  end
  def get_domain(this : IOpcUri*, pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pbstrdomain)
  end
  def get_extension(this : IOpcUri*, pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.call(this, pbstrextension)
  end
  def get_fragment(this : IOpcUri*, pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.call(this, pbstrfragment)
  end
  def get_host(this : IOpcUri*, pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.call(this, pbstrhost)
  end
  def get_password(this : IOpcUri*, pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.call(this, pbstrpassword)
  end
  def get_path(this : IOpcUri*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pbstrpath)
  end
  def get_path_and_query(this : IOpcUri*, pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.call(this, pbstrpathandquery)
  end
  def get_query(this : IOpcUri*, pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.call(this, pbstrquery)
  end
  def get_raw_uri(this : IOpcUri*, pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.call(this, pbstrrawuri)
  end
  def get_scheme_name(this : IOpcUri*, pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.call(this, pbstrschemename)
  end
  def get_user_info(this : IOpcUri*, pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.call(this, pbstruserinfo)
  end
  def get_user_name(this : IOpcUri*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pbstrusername)
  end
  def get_host_type(this : IOpcUri*, pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.call(this, pdwhosttype)
  end
  def get_port(this : IOpcUri*, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.call(this, pdwport)
  end
  def get_scheme(this : IOpcUri*, pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.call(this, pdwscheme)
  end
  def get_zone(this : IOpcUri*, pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.call(this, pdwzone)
  end
  def get_properties(this : IOpcUri*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.call(this, pdwflags)
  end
  def is_equal(this : IOpcUri*, puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.call(this, puri, pfequal)
  end
  def get_relationships_part_uri(this : IOpcUri*, relationshipparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_relationships_part_uri.call(this, relationshipparturi)
  end
  def get_relative_uri(this : IOpcUri*, targetparturi : IOpcPartUri, relativeuri : IUri*) : HRESULT
    @lpVtbl.value.get_relative_uri.call(this, targetparturi, relativeuri)
  end
  def combine_part_uri(this : IOpcUri*, relativeuri : IUri, combineduri : IOpcPartUri*) : HRESULT
    @lpVtbl.value.combine_part_uri.call(this, relativeuri, combineduri)
  end
end
struct LibWin32::IOpcPartUri
  def query_interface(this : IOpcPartUri*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcPartUri*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcPartUri*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property_bstr(this : IOpcPartUri*, uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.call(this, uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(this : IOpcPartUri*, uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.call(this, uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(this : IOpcPartUri*, uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.call(this, uriprop, pdwproperty, dwflags)
  end
  def has_property(this : IOpcPartUri*, uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.call(this, uriprop, pfhasproperty)
  end
  def get_absolute_uri(this : IOpcPartUri*, pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.call(this, pbstrabsoluteuri)
  end
  def get_authority(this : IOpcPartUri*, pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.call(this, pbstrauthority)
  end
  def get_display_uri(this : IOpcPartUri*, pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.call(this, pbstrdisplaystring)
  end
  def get_domain(this : IOpcPartUri*, pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pbstrdomain)
  end
  def get_extension(this : IOpcPartUri*, pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.call(this, pbstrextension)
  end
  def get_fragment(this : IOpcPartUri*, pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.call(this, pbstrfragment)
  end
  def get_host(this : IOpcPartUri*, pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.call(this, pbstrhost)
  end
  def get_password(this : IOpcPartUri*, pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.call(this, pbstrpassword)
  end
  def get_path(this : IOpcPartUri*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pbstrpath)
  end
  def get_path_and_query(this : IOpcPartUri*, pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.call(this, pbstrpathandquery)
  end
  def get_query(this : IOpcPartUri*, pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.call(this, pbstrquery)
  end
  def get_raw_uri(this : IOpcPartUri*, pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.call(this, pbstrrawuri)
  end
  def get_scheme_name(this : IOpcPartUri*, pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.call(this, pbstrschemename)
  end
  def get_user_info(this : IOpcPartUri*, pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.call(this, pbstruserinfo)
  end
  def get_user_name(this : IOpcPartUri*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pbstrusername)
  end
  def get_host_type(this : IOpcPartUri*, pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.call(this, pdwhosttype)
  end
  def get_port(this : IOpcPartUri*, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.call(this, pdwport)
  end
  def get_scheme(this : IOpcPartUri*, pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.call(this, pdwscheme)
  end
  def get_zone(this : IOpcPartUri*, pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.call(this, pdwzone)
  end
  def get_properties(this : IOpcPartUri*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.call(this, pdwflags)
  end
  def is_equal(this : IOpcPartUri*, puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.call(this, puri, pfequal)
  end
  def get_relationships_part_uri(this : IOpcPartUri*, relationshipparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_relationships_part_uri.call(this, relationshipparturi)
  end
  def get_relative_uri(this : IOpcPartUri*, targetparturi : IOpcPartUri, relativeuri : IUri*) : HRESULT
    @lpVtbl.value.get_relative_uri.call(this, targetparturi, relativeuri)
  end
  def combine_part_uri(this : IOpcPartUri*, relativeuri : IUri, combineduri : IOpcPartUri*) : HRESULT
    @lpVtbl.value.combine_part_uri.call(this, relativeuri, combineduri)
  end
  def compare_part_uri(this : IOpcPartUri*, parturi : IOpcPartUri, comparisonresult : Int32*) : HRESULT
    @lpVtbl.value.compare_part_uri.call(this, parturi, comparisonresult)
  end
  def get_source_uri(this : IOpcPartUri*, sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.call(this, sourceuri)
  end
  def is_relationships_part_uri(this : IOpcPartUri*, isrelationshipuri : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_relationships_part_uri.call(this, isrelationshipuri)
  end
end
struct LibWin32::IOpcPackage
  def query_interface(this : IOpcPackage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcPackage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcPackage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_part_set(this : IOpcPackage*, partset : IOpcPartSet*) : HRESULT
    @lpVtbl.value.get_part_set.call(this, partset)
  end
  def get_relationship_set(this : IOpcPackage*, relationshipset : IOpcRelationshipSet*) : HRESULT
    @lpVtbl.value.get_relationship_set.call(this, relationshipset)
  end
end
struct LibWin32::IOpcPart
  def query_interface(this : IOpcPart*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcPart*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcPart*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_relationship_set(this : IOpcPart*, relationshipset : IOpcRelationshipSet*) : HRESULT
    @lpVtbl.value.get_relationship_set.call(this, relationshipset)
  end
  def get_content_stream(this : IOpcPart*, stream : IStream*) : HRESULT
    @lpVtbl.value.get_content_stream.call(this, stream)
  end
  def get_name(this : IOpcPart*, name : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_content_type(this : IOpcPart*, contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.call(this, contenttype)
  end
  def get_compression_options(this : IOpcPart*, compressionoptions : OPC_COMPRESSION_OPTIONS*) : HRESULT
    @lpVtbl.value.get_compression_options.call(this, compressionoptions)
  end
end
struct LibWin32::IOpcRelationship
  def query_interface(this : IOpcRelationship*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationship*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationship*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_id(this : IOpcRelationship*, relationshipidentifier : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, relationshipidentifier)
  end
  def get_relationship_type(this : IOpcRelationship*, relationshiptype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relationship_type.call(this, relationshiptype)
  end
  def get_source_uri(this : IOpcRelationship*, sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.call(this, sourceuri)
  end
  def get_target_uri(this : IOpcRelationship*, targeturi : IUri*) : HRESULT
    @lpVtbl.value.get_target_uri.call(this, targeturi)
  end
  def get_target_mode(this : IOpcRelationship*, targetmode : OPC_URI_TARGET_MODE*) : HRESULT
    @lpVtbl.value.get_target_mode.call(this, targetmode)
  end
end
struct LibWin32::IOpcPartSet
  def query_interface(this : IOpcPartSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcPartSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcPartSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_part(this : IOpcPartSet*, name : IOpcPartUri, part : IOpcPart*) : HRESULT
    @lpVtbl.value.get_part.call(this, name, part)
  end
  def create_part(this : IOpcPartSet*, name : IOpcPartUri, contenttype : LibC::LPWSTR, compressionoptions : OPC_COMPRESSION_OPTIONS, part : IOpcPart*) : HRESULT
    @lpVtbl.value.create_part.call(this, name, contenttype, compressionoptions, part)
  end
  def delete_part(this : IOpcPartSet*, name : IOpcPartUri) : HRESULT
    @lpVtbl.value.delete_part.call(this, name)
  end
  def part_exists(this : IOpcPartSet*, name : IOpcPartUri, partexists : LibC::BOOL*) : HRESULT
    @lpVtbl.value.part_exists.call(this, name, partexists)
  end
  def get_enumerator(this : IOpcPartSet*, partenumerator : IOpcPartEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, partenumerator)
  end
end
struct LibWin32::IOpcRelationshipSet
  def query_interface(this : IOpcRelationshipSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationshipSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationshipSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_relationship(this : IOpcRelationshipSet*, relationshipidentifier : LibC::LPWSTR, relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.get_relationship.call(this, relationshipidentifier, relationship)
  end
  def create_relationship(this : IOpcRelationshipSet*, relationshipidentifier : LibC::LPWSTR, relationshiptype : LibC::LPWSTR, targeturi : IUri, targetmode : OPC_URI_TARGET_MODE, relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.create_relationship.call(this, relationshipidentifier, relationshiptype, targeturi, targetmode, relationship)
  end
  def delete_relationship(this : IOpcRelationshipSet*, relationshipidentifier : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_relationship.call(this, relationshipidentifier)
  end
  def relationship_exists(this : IOpcRelationshipSet*, relationshipidentifier : LibC::LPWSTR, relationshipexists : LibC::BOOL*) : HRESULT
    @lpVtbl.value.relationship_exists.call(this, relationshipidentifier, relationshipexists)
  end
  def get_enumerator(this : IOpcRelationshipSet*, relationshipenumerator : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, relationshipenumerator)
  end
  def get_enumerator_for_type(this : IOpcRelationshipSet*, relationshiptype : LibC::LPWSTR, relationshipenumerator : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator_for_type.call(this, relationshiptype, relationshipenumerator)
  end
  def get_relationships_content_stream(this : IOpcRelationshipSet*, contents : IStream*) : HRESULT
    @lpVtbl.value.get_relationships_content_stream.call(this, contents)
  end
end
struct LibWin32::IOpcPartEnumerator
  def query_interface(this : IOpcPartEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcPartEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcPartEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcPartEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcPartEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcPartEnumerator*, part : IOpcPart*) : HRESULT
    @lpVtbl.value.get_current.call(this, part)
  end
  def clone(this : IOpcPartEnumerator*, copy : IOpcPartEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcRelationshipEnumerator
  def query_interface(this : IOpcRelationshipEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationshipEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationshipEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcRelationshipEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcRelationshipEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcRelationshipEnumerator*, relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.get_current.call(this, relationship)
  end
  def clone(this : IOpcRelationshipEnumerator*, copy : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcSignaturePartReference
  def query_interface(this : IOpcSignaturePartReference*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignaturePartReference*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignaturePartReference*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_part_name(this : IOpcSignaturePartReference*, partname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.call(this, partname)
  end
  def get_content_type(this : IOpcSignaturePartReference*, contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.call(this, contenttype)
  end
  def get_digest_method(this : IOpcSignaturePartReference*, digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.call(this, digestmethod)
  end
  def get_digest_value(this : IOpcSignaturePartReference*, digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.call(this, digestvalue, count)
  end
  def get_transform_method(this : IOpcSignaturePartReference*, transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.call(this, transformmethod)
  end
end
struct LibWin32::IOpcSignatureRelationshipReference
  def query_interface(this : IOpcSignatureRelationshipReference*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureRelationshipReference*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureRelationshipReference*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_source_uri(this : IOpcSignatureRelationshipReference*, sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.call(this, sourceuri)
  end
  def get_digest_method(this : IOpcSignatureRelationshipReference*, digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.call(this, digestmethod)
  end
  def get_digest_value(this : IOpcSignatureRelationshipReference*, digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.call(this, digestvalue, count)
  end
  def get_transform_method(this : IOpcSignatureRelationshipReference*, transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.call(this, transformmethod)
  end
  def get_relationship_signing_option(this : IOpcSignatureRelationshipReference*, relationshipsigningoption : OPC_RELATIONSHIPS_SIGNING_OPTION*) : HRESULT
    @lpVtbl.value.get_relationship_signing_option.call(this, relationshipsigningoption)
  end
  def get_relationship_selector_enumerator(this : IOpcSignatureRelationshipReference*, selectorenumerator : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.get_relationship_selector_enumerator.call(this, selectorenumerator)
  end
end
struct LibWin32::IOpcRelationshipSelector
  def query_interface(this : IOpcRelationshipSelector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationshipSelector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationshipSelector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selector_type(this : IOpcRelationshipSelector*, selector : OPC_RELATIONSHIP_SELECTOR*) : HRESULT
    @lpVtbl.value.get_selector_type.call(this, selector)
  end
  def get_selection_criterion(this : IOpcRelationshipSelector*, selectioncriterion : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_selection_criterion.call(this, selectioncriterion)
  end
end
struct LibWin32::IOpcSignatureReference
  def query_interface(this : IOpcSignatureReference*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureReference*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureReference*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_id(this : IOpcSignatureReference*, referenceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, referenceid)
  end
  def get_uri(this : IOpcSignatureReference*, referenceuri : IUri*) : HRESULT
    @lpVtbl.value.get_uri.call(this, referenceuri)
  end
  def get_type(this : IOpcSignatureReference*, type : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def get_transform_method(this : IOpcSignatureReference*, transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.call(this, transformmethod)
  end
  def get_digest_method(this : IOpcSignatureReference*, digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.call(this, digestmethod)
  end
  def get_digest_value(this : IOpcSignatureReference*, digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.call(this, digestvalue, count)
  end
end
struct LibWin32::IOpcSignatureCustomObject
  def query_interface(this : IOpcSignatureCustomObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureCustomObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureCustomObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_xml(this : IOpcSignatureCustomObject*, xmlmarkup : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_xml.call(this, xmlmarkup, count)
  end
end
struct LibWin32::IOpcDigitalSignature
  def query_interface(this : IOpcDigitalSignature*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcDigitalSignature*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcDigitalSignature*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_namespaces(this : IOpcDigitalSignature*, prefixes : LibC::LPWSTR**, namespaces : LibC::LPWSTR**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_namespaces.call(this, prefixes, namespaces, count)
  end
  def get_signature_id(this : IOpcDigitalSignature*, signatureid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_id.call(this, signatureid)
  end
  def get_signature_part_name(this : IOpcDigitalSignature*, signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.call(this, signaturepartname)
  end
  def get_signature_method(this : IOpcDigitalSignature*, signaturemethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_method.call(this, signaturemethod)
  end
  def get_canonicalization_method(this : IOpcDigitalSignature*, canonicalizationmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_canonicalization_method.call(this, canonicalizationmethod)
  end
  def get_signature_value(this : IOpcDigitalSignature*, signaturevalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_value.call(this, signaturevalue, count)
  end
  def get_signature_part_reference_enumerator(this : IOpcDigitalSignature*, partreferenceenumerator : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_part_reference_enumerator.call(this, partreferenceenumerator)
  end
  def get_signature_relationship_reference_enumerator(this : IOpcDigitalSignature*, relationshipreferenceenumerator : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_relationship_reference_enumerator.call(this, relationshipreferenceenumerator)
  end
  def get_signing_time(this : IOpcDigitalSignature*, signingtime : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signing_time.call(this, signingtime)
  end
  def get_time_format(this : IOpcDigitalSignature*, timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_time_format.call(this, timeformat)
  end
  def get_package_object_reference(this : IOpcDigitalSignature*, packageobjectreference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.get_package_object_reference.call(this, packageobjectreference)
  end
  def get_certificate_enumerator(this : IOpcDigitalSignature*, certificateenumerator : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.get_certificate_enumerator.call(this, certificateenumerator)
  end
  def get_custom_reference_enumerator(this : IOpcDigitalSignature*, customreferenceenumerator : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_reference_enumerator.call(this, customreferenceenumerator)
  end
  def get_custom_object_enumerator(this : IOpcDigitalSignature*, customobjectenumerator : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_object_enumerator.call(this, customobjectenumerator)
  end
  def get_signature_xml(this : IOpcDigitalSignature*, signaturexml : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_xml.call(this, signaturexml, count)
  end
end
struct LibWin32::IOpcSigningOptions
  def query_interface(this : IOpcSigningOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSigningOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSigningOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_signature_id(this : IOpcSigningOptions*, signatureid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_id.call(this, signatureid)
  end
  def set_signature_id(this : IOpcSigningOptions*, signatureid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_signature_id.call(this, signatureid)
  end
  def get_signature_method(this : IOpcSigningOptions*, signaturemethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_method.call(this, signaturemethod)
  end
  def set_signature_method(this : IOpcSigningOptions*, signaturemethod : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_signature_method.call(this, signaturemethod)
  end
  def get_default_digest_method(this : IOpcSigningOptions*, digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_default_digest_method.call(this, digestmethod)
  end
  def set_default_digest_method(this : IOpcSigningOptions*, digestmethod : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_default_digest_method.call(this, digestmethod)
  end
  def get_certificate_embedding_option(this : IOpcSigningOptions*, embeddingoption : OPC_CERTIFICATE_EMBEDDING_OPTION*) : HRESULT
    @lpVtbl.value.get_certificate_embedding_option.call(this, embeddingoption)
  end
  def set_certificate_embedding_option(this : IOpcSigningOptions*, embeddingoption : OPC_CERTIFICATE_EMBEDDING_OPTION) : HRESULT
    @lpVtbl.value.set_certificate_embedding_option.call(this, embeddingoption)
  end
  def get_time_format(this : IOpcSigningOptions*, timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_time_format.call(this, timeformat)
  end
  def set_time_format(this : IOpcSigningOptions*, timeformat : OPC_SIGNATURE_TIME_FORMAT) : HRESULT
    @lpVtbl.value.set_time_format.call(this, timeformat)
  end
  def get_signature_part_reference_set(this : IOpcSigningOptions*, partreferenceset : IOpcSignaturePartReferenceSet*) : HRESULT
    @lpVtbl.value.get_signature_part_reference_set.call(this, partreferenceset)
  end
  def get_signature_relationship_reference_set(this : IOpcSigningOptions*, relationshipreferenceset : IOpcSignatureRelationshipReferenceSet*) : HRESULT
    @lpVtbl.value.get_signature_relationship_reference_set.call(this, relationshipreferenceset)
  end
  def get_custom_object_set(this : IOpcSigningOptions*, customobjectset : IOpcSignatureCustomObjectSet*) : HRESULT
    @lpVtbl.value.get_custom_object_set.call(this, customobjectset)
  end
  def get_custom_reference_set(this : IOpcSigningOptions*, customreferenceset : IOpcSignatureReferenceSet*) : HRESULT
    @lpVtbl.value.get_custom_reference_set.call(this, customreferenceset)
  end
  def get_certificate_set(this : IOpcSigningOptions*, certificateset : IOpcCertificateSet*) : HRESULT
    @lpVtbl.value.get_certificate_set.call(this, certificateset)
  end
  def get_signature_part_name(this : IOpcSigningOptions*, signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.call(this, signaturepartname)
  end
  def set_signature_part_name(this : IOpcSigningOptions*, signaturepartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_part_name.call(this, signaturepartname)
  end
end
struct LibWin32::IOpcDigitalSignatureManager
  def query_interface(this : IOpcDigitalSignatureManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcDigitalSignatureManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcDigitalSignatureManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_signature_origin_part_name(this : IOpcDigitalSignatureManager*, signatureoriginpartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_origin_part_name.call(this, signatureoriginpartname)
  end
  def set_signature_origin_part_name(this : IOpcDigitalSignatureManager*, signatureoriginpartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_origin_part_name.call(this, signatureoriginpartname)
  end
  def get_signature_enumerator(this : IOpcDigitalSignatureManager*, signatureenumerator : IOpcDigitalSignatureEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_enumerator.call(this, signatureenumerator)
  end
  def remove_signature(this : IOpcDigitalSignatureManager*, signaturepartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.remove_signature.call(this, signaturepartname)
  end
  def create_signing_options(this : IOpcDigitalSignatureManager*, signingoptions : IOpcSigningOptions*) : HRESULT
    @lpVtbl.value.create_signing_options.call(this, signingoptions)
  end
  def validate(this : IOpcDigitalSignatureManager*, signature : IOpcDigitalSignature, certificate : CERT_CONTEXT*, validationresult : OPC_SIGNATURE_VALIDATION_RESULT*) : HRESULT
    @lpVtbl.value.validate.call(this, signature, certificate, validationresult)
  end
  def sign(this : IOpcDigitalSignatureManager*, certificate : CERT_CONTEXT*, signingoptions : IOpcSigningOptions, digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.sign.call(this, certificate, signingoptions, digitalsignature)
  end
  def replace_signature_xml(this : IOpcDigitalSignatureManager*, signaturepartname : IOpcPartUri, newsignaturexml : UInt8*, count : UInt32, digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.replace_signature_xml.call(this, signaturepartname, newsignaturexml, count, digitalsignature)
  end
end
struct LibWin32::IOpcSignaturePartReferenceEnumerator
  def query_interface(this : IOpcSignaturePartReferenceEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignaturePartReferenceEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignaturePartReferenceEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcSignaturePartReferenceEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcSignaturePartReferenceEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcSignaturePartReferenceEnumerator*, partreference : IOpcSignaturePartReference*) : HRESULT
    @lpVtbl.value.get_current.call(this, partreference)
  end
  def clone(this : IOpcSignaturePartReferenceEnumerator*, copy : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcSignatureRelationshipReferenceEnumerator
  def query_interface(this : IOpcSignatureRelationshipReferenceEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureRelationshipReferenceEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureRelationshipReferenceEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcSignatureRelationshipReferenceEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcSignatureRelationshipReferenceEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcSignatureRelationshipReferenceEnumerator*, relationshipreference : IOpcSignatureRelationshipReference*) : HRESULT
    @lpVtbl.value.get_current.call(this, relationshipreference)
  end
  def clone(this : IOpcSignatureRelationshipReferenceEnumerator*, copy : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcRelationshipSelectorEnumerator
  def query_interface(this : IOpcRelationshipSelectorEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationshipSelectorEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationshipSelectorEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcRelationshipSelectorEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcRelationshipSelectorEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcRelationshipSelectorEnumerator*, relationshipselector : IOpcRelationshipSelector*) : HRESULT
    @lpVtbl.value.get_current.call(this, relationshipselector)
  end
  def clone(this : IOpcRelationshipSelectorEnumerator*, copy : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcSignatureReferenceEnumerator
  def query_interface(this : IOpcSignatureReferenceEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureReferenceEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureReferenceEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcSignatureReferenceEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcSignatureReferenceEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcSignatureReferenceEnumerator*, reference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.get_current.call(this, reference)
  end
  def clone(this : IOpcSignatureReferenceEnumerator*, copy : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcSignatureCustomObjectEnumerator
  def query_interface(this : IOpcSignatureCustomObjectEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureCustomObjectEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureCustomObjectEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcSignatureCustomObjectEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcSignatureCustomObjectEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcSignatureCustomObjectEnumerator*, customobject : IOpcSignatureCustomObject*) : HRESULT
    @lpVtbl.value.get_current.call(this, customobject)
  end
  def clone(this : IOpcSignatureCustomObjectEnumerator*, copy : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcCertificateEnumerator
  def query_interface(this : IOpcCertificateEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcCertificateEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcCertificateEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcCertificateEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcCertificateEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcCertificateEnumerator*, certificate : CERT_CONTEXT**) : HRESULT
    @lpVtbl.value.get_current.call(this, certificate)
  end
  def clone(this : IOpcCertificateEnumerator*, copy : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcDigitalSignatureEnumerator
  def query_interface(this : IOpcDigitalSignatureEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcDigitalSignatureEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcDigitalSignatureEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move_next(this : IOpcDigitalSignatureEnumerator*, hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, hasnext)
  end
  def move_previous(this : IOpcDigitalSignatureEnumerator*, hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.call(this, hasprevious)
  end
  def get_current(this : IOpcDigitalSignatureEnumerator*, digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.get_current.call(this, digitalsignature)
  end
  def clone(this : IOpcDigitalSignatureEnumerator*, copy : IOpcDigitalSignatureEnumerator*) : HRESULT
    @lpVtbl.value.clone.call(this, copy)
  end
end
struct LibWin32::IOpcSignaturePartReferenceSet
  def query_interface(this : IOpcSignaturePartReferenceSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignaturePartReferenceSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignaturePartReferenceSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IOpcSignaturePartReferenceSet*, parturi : IOpcPartUri, digestmethod : LibC::LPWSTR, transformmethod : OPC_CANONICALIZATION_METHOD, partreference : IOpcSignaturePartReference*) : HRESULT
    @lpVtbl.value.create.call(this, parturi, digestmethod, transformmethod, partreference)
  end
  def delete(this : IOpcSignaturePartReferenceSet*, partreference : IOpcSignaturePartReference) : HRESULT
    @lpVtbl.value.delete.call(this, partreference)
  end
  def get_enumerator(this : IOpcSignaturePartReferenceSet*, partreferenceenumerator : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, partreferenceenumerator)
  end
end
struct LibWin32::IOpcSignatureRelationshipReferenceSet
  def query_interface(this : IOpcSignatureRelationshipReferenceSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureRelationshipReferenceSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureRelationshipReferenceSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IOpcSignatureRelationshipReferenceSet*, sourceuri : IOpcUri, digestmethod : LibC::LPWSTR, relationshipsigningoption : OPC_RELATIONSHIPS_SIGNING_OPTION, selectorset : IOpcRelationshipSelectorSet, transformmethod : OPC_CANONICALIZATION_METHOD, relationshipreference : IOpcSignatureRelationshipReference*) : HRESULT
    @lpVtbl.value.create.call(this, sourceuri, digestmethod, relationshipsigningoption, selectorset, transformmethod, relationshipreference)
  end
  def create_relationship_selector_set(this : IOpcSignatureRelationshipReferenceSet*, selectorset : IOpcRelationshipSelectorSet*) : HRESULT
    @lpVtbl.value.create_relationship_selector_set.call(this, selectorset)
  end
  def delete(this : IOpcSignatureRelationshipReferenceSet*, relationshipreference : IOpcSignatureRelationshipReference) : HRESULT
    @lpVtbl.value.delete.call(this, relationshipreference)
  end
  def get_enumerator(this : IOpcSignatureRelationshipReferenceSet*, relationshipreferenceenumerator : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, relationshipreferenceenumerator)
  end
end
struct LibWin32::IOpcRelationshipSelectorSet
  def query_interface(this : IOpcRelationshipSelectorSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcRelationshipSelectorSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcRelationshipSelectorSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IOpcRelationshipSelectorSet*, selector : OPC_RELATIONSHIP_SELECTOR, selectioncriterion : LibC::LPWSTR, relationshipselector : IOpcRelationshipSelector*) : HRESULT
    @lpVtbl.value.create.call(this, selector, selectioncriterion, relationshipselector)
  end
  def delete(this : IOpcRelationshipSelectorSet*, relationshipselector : IOpcRelationshipSelector) : HRESULT
    @lpVtbl.value.delete.call(this, relationshipselector)
  end
  def get_enumerator(this : IOpcRelationshipSelectorSet*, relationshipselectorenumerator : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, relationshipselectorenumerator)
  end
end
struct LibWin32::IOpcSignatureReferenceSet
  def query_interface(this : IOpcSignatureReferenceSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureReferenceSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureReferenceSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IOpcSignatureReferenceSet*, referenceuri : IUri, referenceid : LibC::LPWSTR, type : LibC::LPWSTR, digestmethod : LibC::LPWSTR, transformmethod : OPC_CANONICALIZATION_METHOD, reference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.create.call(this, referenceuri, referenceid, type, digestmethod, transformmethod, reference)
  end
  def delete(this : IOpcSignatureReferenceSet*, reference : IOpcSignatureReference) : HRESULT
    @lpVtbl.value.delete.call(this, reference)
  end
  def get_enumerator(this : IOpcSignatureReferenceSet*, referenceenumerator : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, referenceenumerator)
  end
end
struct LibWin32::IOpcSignatureCustomObjectSet
  def query_interface(this : IOpcSignatureCustomObjectSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcSignatureCustomObjectSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcSignatureCustomObjectSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IOpcSignatureCustomObjectSet*, xmlmarkup : UInt8*, count : UInt32, customobject : IOpcSignatureCustomObject*) : HRESULT
    @lpVtbl.value.create.call(this, xmlmarkup, count, customobject)
  end
  def delete(this : IOpcSignatureCustomObjectSet*, customobject : IOpcSignatureCustomObject) : HRESULT
    @lpVtbl.value.delete.call(this, customobject)
  end
  def get_enumerator(this : IOpcSignatureCustomObjectSet*, customobjectenumerator : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, customobjectenumerator)
  end
end
struct LibWin32::IOpcCertificateSet
  def query_interface(this : IOpcCertificateSet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcCertificateSet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcCertificateSet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : IOpcCertificateSet*, certificate : CERT_CONTEXT*) : HRESULT
    @lpVtbl.value.add.call(this, certificate)
  end
  def remove(this : IOpcCertificateSet*, certificate : CERT_CONTEXT*) : HRESULT
    @lpVtbl.value.remove.call(this, certificate)
  end
  def get_enumerator(this : IOpcCertificateSet*, certificateenumerator : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, certificateenumerator)
  end
end
struct LibWin32::IOpcFactory
  def query_interface(this : IOpcFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOpcFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOpcFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_package_root_uri(this : IOpcFactory*, rooturi : IOpcUri*) : HRESULT
    @lpVtbl.value.create_package_root_uri.call(this, rooturi)
  end
  def create_part_uri(this : IOpcFactory*, pwzuri : LibC::LPWSTR, parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.create_part_uri.call(this, pwzuri, parturi)
  end
  def create_stream_on_file(this : IOpcFactory*, filename : LibC::LPWSTR, iomode : OPC_STREAM_IO_MODE, securityattributes : SECURITY_ATTRIBUTES*, dwflagsandattributes : UInt32, stream : IStream*) : HRESULT
    @lpVtbl.value.create_stream_on_file.call(this, filename, iomode, securityattributes, dwflagsandattributes, stream)
  end
  def create_package(this : IOpcFactory*, package : IOpcPackage*) : HRESULT
    @lpVtbl.value.create_package.call(this, package)
  end
  def read_package_from_stream(this : IOpcFactory*, stream : IStream, flags : OPC_READ_FLAGS, package : IOpcPackage*) : HRESULT
    @lpVtbl.value.read_package_from_stream.call(this, stream, flags, package)
  end
  def write_package_to_stream(this : IOpcFactory*, package : IOpcPackage, flags : OPC_WRITE_FLAGS, stream : IStream) : HRESULT
    @lpVtbl.value.write_package_to_stream.call(this, package, flags, stream)
  end
  def create_digital_signature_manager(this : IOpcFactory*, package : IOpcPackage, signaturemanager : IOpcDigitalSignatureManager*) : HRESULT
    @lpVtbl.value.create_digital_signature_manager.call(this, package, signaturemanager)
  end
end
