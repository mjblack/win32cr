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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_bstr : UInt64
    get_property_length : UInt64
    get_property_dword : UInt64
    has_property : UInt64
    get_absolute_uri : UInt64
    get_authority : UInt64
    get_display_uri : UInt64
    get_domain : UInt64
    get_extension : UInt64
    get_fragment : UInt64
    get_host : UInt64
    get_password : UInt64
    get_path : UInt64
    get_path_and_query : UInt64
    get_query : UInt64
    get_raw_uri : UInt64
    get_scheme_name : UInt64
    get_user_info : UInt64
    get_user_name : UInt64
    get_host_type : UInt64
    get_port : UInt64
    get_scheme : UInt64
    get_zone : UInt64
    get_properties : UInt64
    is_equal : UInt64
    get_relationships_part_uri : UInt64
    get_relative_uri : UInt64
    combine_part_uri : UInt64
  end

  IOpcUri_GUID = "bc9c1b9b-d62c-49eb-aef0-3b4e0b28ebed"
  IID_IOpcUri = LibC::GUID.new(0xbc9c1b9b_u32, 0xd62c_u16, 0x49eb_u16, StaticArray[0xae_u8, 0xf0_u8, 0x3b_u8, 0x4e_u8, 0xb_u8, 0x28_u8, 0xeb_u8, 0xed_u8])
  struct IOpcUri
    lpVtbl : IOpcUriVTbl*
  end

  struct IOpcPartUriVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_bstr : UInt64
    get_property_length : UInt64
    get_property_dword : UInt64
    has_property : UInt64
    get_absolute_uri : UInt64
    get_authority : UInt64
    get_display_uri : UInt64
    get_domain : UInt64
    get_extension : UInt64
    get_fragment : UInt64
    get_host : UInt64
    get_password : UInt64
    get_path : UInt64
    get_path_and_query : UInt64
    get_query : UInt64
    get_raw_uri : UInt64
    get_scheme_name : UInt64
    get_user_info : UInt64
    get_user_name : UInt64
    get_host_type : UInt64
    get_port : UInt64
    get_scheme : UInt64
    get_zone : UInt64
    get_properties : UInt64
    is_equal : UInt64
    get_relationships_part_uri : UInt64
    get_relative_uri : UInt64
    combine_part_uri : UInt64
    compare_part_uri : UInt64
    get_source_uri : UInt64
    is_relationships_part_uri : UInt64
  end

  IOpcPartUri_GUID = "7d3babe7-88b2-46ba-85cb-4203cb016c87"
  IID_IOpcPartUri = LibC::GUID.new(0x7d3babe7_u32, 0x88b2_u16, 0x46ba_u16, StaticArray[0x85_u8, 0xcb_u8, 0x42_u8, 0x3_u8, 0xcb_u8, 0x1_u8, 0x6c_u8, 0x87_u8])
  struct IOpcPartUri
    lpVtbl : IOpcPartUriVTbl*
  end

  struct IOpcPackageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_set : UInt64
    get_relationship_set : UInt64
  end

  IOpcPackage_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee70"
  IID_IOpcPackage = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x70_u8])
  struct IOpcPackage
    lpVtbl : IOpcPackageVTbl*
  end

  struct IOpcPartVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_relationship_set : UInt64
    get_content_stream : UInt64
    get_name : UInt64
    get_content_type : UInt64
    get_compression_options : UInt64
  end

  IOpcPart_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee71"
  IID_IOpcPart = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x71_u8])
  struct IOpcPart
    lpVtbl : IOpcPartVTbl*
  end

  struct IOpcRelationshipVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id : UInt64
    get_relationship_type : UInt64
    get_source_uri : UInt64
    get_target_uri : UInt64
    get_target_mode : UInt64
  end

  IOpcRelationship_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee72"
  IID_IOpcRelationship = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x72_u8])
  struct IOpcRelationship
    lpVtbl : IOpcRelationshipVTbl*
  end

  struct IOpcPartSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part : UInt64
    create_part : UInt64
    delete_part : UInt64
    part_exists : UInt64
    get_enumerator : UInt64
  end

  IOpcPartSet_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee73"
  IID_IOpcPartSet = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x73_u8])
  struct IOpcPartSet
    lpVtbl : IOpcPartSetVTbl*
  end

  struct IOpcRelationshipSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_relationship : UInt64
    create_relationship : UInt64
    delete_relationship : UInt64
    relationship_exists : UInt64
    get_enumerator : UInt64
    get_enumerator_for_type : UInt64
    get_relationships_content_stream : UInt64
  end

  IOpcRelationshipSet_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee74"
  IID_IOpcRelationshipSet = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x74_u8])
  struct IOpcRelationshipSet
    lpVtbl : IOpcRelationshipSetVTbl*
  end

  struct IOpcPartEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcPartEnumerator_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee75"
  IID_IOpcPartEnumerator = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x75_u8])
  struct IOpcPartEnumerator
    lpVtbl : IOpcPartEnumeratorVTbl*
  end

  struct IOpcRelationshipEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcRelationshipEnumerator_GUID = "42195949-3b79-4fc8-89c6-fc7fb979ee76"
  IID_IOpcRelationshipEnumerator = LibC::GUID.new(0x42195949_u32, 0x3b79_u16, 0x4fc8_u16, StaticArray[0x89_u8, 0xc6_u8, 0xfc_u8, 0x7f_u8, 0xb9_u8, 0x79_u8, 0xee_u8, 0x76_u8])
  struct IOpcRelationshipEnumerator
    lpVtbl : IOpcRelationshipEnumeratorVTbl*
  end

  struct IOpcSignaturePartReferenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_part_name : UInt64
    get_content_type : UInt64
    get_digest_method : UInt64
    get_digest_value : UInt64
    get_transform_method : UInt64
  end

  IOpcSignaturePartReference_GUID = "e24231ca-59f4-484e-b64b-36eeda36072c"
  IID_IOpcSignaturePartReference = LibC::GUID.new(0xe24231ca_u32, 0x59f4_u16, 0x484e_u16, StaticArray[0xb6_u8, 0x4b_u8, 0x36_u8, 0xee_u8, 0xda_u8, 0x36_u8, 0x7_u8, 0x2c_u8])
  struct IOpcSignaturePartReference
    lpVtbl : IOpcSignaturePartReferenceVTbl*
  end

  struct IOpcSignatureRelationshipReferenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_source_uri : UInt64
    get_digest_method : UInt64
    get_digest_value : UInt64
    get_transform_method : UInt64
    get_relationship_signing_option : UInt64
    get_relationship_selector_enumerator : UInt64
  end

  IOpcSignatureRelationshipReference_GUID = "57babac6-9d4a-4e50-8b86-e5d4051eae7c"
  IID_IOpcSignatureRelationshipReference = LibC::GUID.new(0x57babac6_u32, 0x9d4a_u16, 0x4e50_u16, StaticArray[0x8b_u8, 0x86_u8, 0xe5_u8, 0xd4_u8, 0x5_u8, 0x1e_u8, 0xae_u8, 0x7c_u8])
  struct IOpcSignatureRelationshipReference
    lpVtbl : IOpcSignatureRelationshipReferenceVTbl*
  end

  struct IOpcRelationshipSelectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selector_type : UInt64
    get_selection_criterion : UInt64
  end

  IOpcRelationshipSelector_GUID = "f8f26c7f-b28f-4899-84c8-5d5639ede75f"
  IID_IOpcRelationshipSelector = LibC::GUID.new(0xf8f26c7f_u32, 0xb28f_u16, 0x4899_u16, StaticArray[0x84_u8, 0xc8_u8, 0x5d_u8, 0x56_u8, 0x39_u8, 0xed_u8, 0xe7_u8, 0x5f_u8])
  struct IOpcRelationshipSelector
    lpVtbl : IOpcRelationshipSelectorVTbl*
  end

  struct IOpcSignatureReferenceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id : UInt64
    get_uri : UInt64
    get_type : UInt64
    get_transform_method : UInt64
    get_digest_method : UInt64
    get_digest_value : UInt64
  end

  IOpcSignatureReference_GUID = "1b47005e-3011-4edc-be6f-0f65e5ab0342"
  IID_IOpcSignatureReference = LibC::GUID.new(0x1b47005e_u32, 0x3011_u16, 0x4edc_u16, StaticArray[0xbe_u8, 0x6f_u8, 0xf_u8, 0x65_u8, 0xe5_u8, 0xab_u8, 0x3_u8, 0x42_u8])
  struct IOpcSignatureReference
    lpVtbl : IOpcSignatureReferenceVTbl*
  end

  struct IOpcSignatureCustomObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_xml : UInt64
  end

  IOpcSignatureCustomObject_GUID = "5d77a19e-62c1-44e7-becd-45da5ae51a56"
  IID_IOpcSignatureCustomObject = LibC::GUID.new(0x5d77a19e_u32, 0x62c1_u16, 0x44e7_u16, StaticArray[0xbe_u8, 0xcd_u8, 0x45_u8, 0xda_u8, 0x5a_u8, 0xe5_u8, 0x1a_u8, 0x56_u8])
  struct IOpcSignatureCustomObject
    lpVtbl : IOpcSignatureCustomObjectVTbl*
  end

  struct IOpcDigitalSignatureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_namespaces : UInt64
    get_signature_id : UInt64
    get_signature_part_name : UInt64
    get_signature_method : UInt64
    get_canonicalization_method : UInt64
    get_signature_value : UInt64
    get_signature_part_reference_enumerator : UInt64
    get_signature_relationship_reference_enumerator : UInt64
    get_signing_time : UInt64
    get_time_format : UInt64
    get_package_object_reference : UInt64
    get_certificate_enumerator : UInt64
    get_custom_reference_enumerator : UInt64
    get_custom_object_enumerator : UInt64
    get_signature_xml : UInt64
  end

  IOpcDigitalSignature_GUID = "52ab21dd-1cd0-4949-bc80-0c1232d00cb4"
  IID_IOpcDigitalSignature = LibC::GUID.new(0x52ab21dd_u32, 0x1cd0_u16, 0x4949_u16, StaticArray[0xbc_u8, 0x80_u8, 0xc_u8, 0x12_u8, 0x32_u8, 0xd0_u8, 0xc_u8, 0xb4_u8])
  struct IOpcDigitalSignature
    lpVtbl : IOpcDigitalSignatureVTbl*
  end

  struct IOpcSigningOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_signature_id : UInt64
    set_signature_id : UInt64
    get_signature_method : UInt64
    set_signature_method : UInt64
    get_default_digest_method : UInt64
    set_default_digest_method : UInt64
    get_certificate_embedding_option : UInt64
    set_certificate_embedding_option : UInt64
    get_time_format : UInt64
    set_time_format : UInt64
    get_signature_part_reference_set : UInt64
    get_signature_relationship_reference_set : UInt64
    get_custom_object_set : UInt64
    get_custom_reference_set : UInt64
    get_certificate_set : UInt64
    get_signature_part_name : UInt64
    set_signature_part_name : UInt64
  end

  IOpcSigningOptions_GUID = "50d2d6a5-7aeb-46c0-b241-43ab0e9b407e"
  IID_IOpcSigningOptions = LibC::GUID.new(0x50d2d6a5_u32, 0x7aeb_u16, 0x46c0_u16, StaticArray[0xb2_u8, 0x41_u8, 0x43_u8, 0xab_u8, 0xe_u8, 0x9b_u8, 0x40_u8, 0x7e_u8])
  struct IOpcSigningOptions
    lpVtbl : IOpcSigningOptionsVTbl*
  end

  struct IOpcDigitalSignatureManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_signature_origin_part_name : UInt64
    set_signature_origin_part_name : UInt64
    get_signature_enumerator : UInt64
    remove_signature : UInt64
    create_signing_options : UInt64
    validate : UInt64
    sign : UInt64
    replace_signature_xml : UInt64
  end

  IOpcDigitalSignatureManager_GUID = "d5e62a0b-696d-462f-94df-72e33cef2659"
  IID_IOpcDigitalSignatureManager = LibC::GUID.new(0xd5e62a0b_u32, 0x696d_u16, 0x462f_u16, StaticArray[0x94_u8, 0xdf_u8, 0x72_u8, 0xe3_u8, 0x3c_u8, 0xef_u8, 0x26_u8, 0x59_u8])
  struct IOpcDigitalSignatureManager
    lpVtbl : IOpcDigitalSignatureManagerVTbl*
  end

  struct IOpcSignaturePartReferenceEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcSignaturePartReferenceEnumerator_GUID = "80eb1561-8c77-49cf-8266-459b356ee99a"
  IID_IOpcSignaturePartReferenceEnumerator = LibC::GUID.new(0x80eb1561_u32, 0x8c77_u16, 0x49cf_u16, StaticArray[0x82_u8, 0x66_u8, 0x45_u8, 0x9b_u8, 0x35_u8, 0x6e_u8, 0xe9_u8, 0x9a_u8])
  struct IOpcSignaturePartReferenceEnumerator
    lpVtbl : IOpcSignaturePartReferenceEnumeratorVTbl*
  end

  struct IOpcSignatureRelationshipReferenceEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcSignatureRelationshipReferenceEnumerator_GUID = "773ba3e4-f021-48e4-aa04-9816db5d3495"
  IID_IOpcSignatureRelationshipReferenceEnumerator = LibC::GUID.new(0x773ba3e4_u32, 0xf021_u16, 0x48e4_u16, StaticArray[0xaa_u8, 0x4_u8, 0x98_u8, 0x16_u8, 0xdb_u8, 0x5d_u8, 0x34_u8, 0x95_u8])
  struct IOpcSignatureRelationshipReferenceEnumerator
    lpVtbl : IOpcSignatureRelationshipReferenceEnumeratorVTbl*
  end

  struct IOpcRelationshipSelectorEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcRelationshipSelectorEnumerator_GUID = "5e50a181-a91b-48ac-88d2-bca3d8f8c0b1"
  IID_IOpcRelationshipSelectorEnumerator = LibC::GUID.new(0x5e50a181_u32, 0xa91b_u16, 0x48ac_u16, StaticArray[0x88_u8, 0xd2_u8, 0xbc_u8, 0xa3_u8, 0xd8_u8, 0xf8_u8, 0xc0_u8, 0xb1_u8])
  struct IOpcRelationshipSelectorEnumerator
    lpVtbl : IOpcRelationshipSelectorEnumeratorVTbl*
  end

  struct IOpcSignatureReferenceEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcSignatureReferenceEnumerator_GUID = "cfa59a45-28b1-4868-969e-fa8097fdc12a"
  IID_IOpcSignatureReferenceEnumerator = LibC::GUID.new(0xcfa59a45_u32, 0x28b1_u16, 0x4868_u16, StaticArray[0x96_u8, 0x9e_u8, 0xfa_u8, 0x80_u8, 0x97_u8, 0xfd_u8, 0xc1_u8, 0x2a_u8])
  struct IOpcSignatureReferenceEnumerator
    lpVtbl : IOpcSignatureReferenceEnumeratorVTbl*
  end

  struct IOpcSignatureCustomObjectEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcSignatureCustomObjectEnumerator_GUID = "5ee4fe1d-e1b0-4683-8079-7ea0fcf80b4c"
  IID_IOpcSignatureCustomObjectEnumerator = LibC::GUID.new(0x5ee4fe1d_u32, 0xe1b0_u16, 0x4683_u16, StaticArray[0x80_u8, 0x79_u8, 0x7e_u8, 0xa0_u8, 0xfc_u8, 0xf8_u8, 0xb_u8, 0x4c_u8])
  struct IOpcSignatureCustomObjectEnumerator
    lpVtbl : IOpcSignatureCustomObjectEnumeratorVTbl*
  end

  struct IOpcCertificateEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcCertificateEnumerator_GUID = "85131937-8f24-421f-b439-59ab24d140b8"
  IID_IOpcCertificateEnumerator = LibC::GUID.new(0x85131937_u32, 0x8f24_u16, 0x421f_u16, StaticArray[0xb4_u8, 0x39_u8, 0x59_u8, 0xab_u8, 0x24_u8, 0xd1_u8, 0x40_u8, 0xb8_u8])
  struct IOpcCertificateEnumerator
    lpVtbl : IOpcCertificateEnumeratorVTbl*
  end

  struct IOpcDigitalSignatureEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move_next : UInt64
    move_previous : UInt64
    get_current : UInt64
    clone : UInt64
  end

  IOpcDigitalSignatureEnumerator_GUID = "967b6882-0ba3-4358-b9e7-b64c75063c5e"
  IID_IOpcDigitalSignatureEnumerator = LibC::GUID.new(0x967b6882_u32, 0xba3_u16, 0x4358_u16, StaticArray[0xb9_u8, 0xe7_u8, 0xb6_u8, 0x4c_u8, 0x75_u8, 0x6_u8, 0x3c_u8, 0x5e_u8])
  struct IOpcDigitalSignatureEnumerator
    lpVtbl : IOpcDigitalSignatureEnumeratorVTbl*
  end

  struct IOpcSignaturePartReferenceSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    delete : UInt64
    get_enumerator : UInt64
  end

  IOpcSignaturePartReferenceSet_GUID = "6c9fe28c-ecd9-4b22-9d36-7fdde670fec0"
  IID_IOpcSignaturePartReferenceSet = LibC::GUID.new(0x6c9fe28c_u32, 0xecd9_u16, 0x4b22_u16, StaticArray[0x9d_u8, 0x36_u8, 0x7f_u8, 0xdd_u8, 0xe6_u8, 0x70_u8, 0xfe_u8, 0xc0_u8])
  struct IOpcSignaturePartReferenceSet
    lpVtbl : IOpcSignaturePartReferenceSetVTbl*
  end

  struct IOpcSignatureRelationshipReferenceSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    create_relationship_selector_set : UInt64
    delete : UInt64
    get_enumerator : UInt64
  end

  IOpcSignatureRelationshipReferenceSet_GUID = "9f863ca5-3631-404c-828d-807e0715069b"
  IID_IOpcSignatureRelationshipReferenceSet = LibC::GUID.new(0x9f863ca5_u32, 0x3631_u16, 0x404c_u16, StaticArray[0x82_u8, 0x8d_u8, 0x80_u8, 0x7e_u8, 0x7_u8, 0x15_u8, 0x6_u8, 0x9b_u8])
  struct IOpcSignatureRelationshipReferenceSet
    lpVtbl : IOpcSignatureRelationshipReferenceSetVTbl*
  end

  struct IOpcRelationshipSelectorSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    delete : UInt64
    get_enumerator : UInt64
  end

  IOpcRelationshipSelectorSet_GUID = "6e34c269-a4d3-47c0-b5c4-87ff2b3b6136"
  IID_IOpcRelationshipSelectorSet = LibC::GUID.new(0x6e34c269_u32, 0xa4d3_u16, 0x47c0_u16, StaticArray[0xb5_u8, 0xc4_u8, 0x87_u8, 0xff_u8, 0x2b_u8, 0x3b_u8, 0x61_u8, 0x36_u8])
  struct IOpcRelationshipSelectorSet
    lpVtbl : IOpcRelationshipSelectorSetVTbl*
  end

  struct IOpcSignatureReferenceSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    delete : UInt64
    get_enumerator : UInt64
  end

  IOpcSignatureReferenceSet_GUID = "f3b02d31-ab12-42dd-9e2f-2b16761c3c1e"
  IID_IOpcSignatureReferenceSet = LibC::GUID.new(0xf3b02d31_u32, 0xab12_u16, 0x42dd_u16, StaticArray[0x9e_u8, 0x2f_u8, 0x2b_u8, 0x16_u8, 0x76_u8, 0x1c_u8, 0x3c_u8, 0x1e_u8])
  struct IOpcSignatureReferenceSet
    lpVtbl : IOpcSignatureReferenceSetVTbl*
  end

  struct IOpcSignatureCustomObjectSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    delete : UInt64
    get_enumerator : UInt64
  end

  IOpcSignatureCustomObjectSet_GUID = "8f792ac5-7947-4e11-bc3d-2659ff046ae1"
  IID_IOpcSignatureCustomObjectSet = LibC::GUID.new(0x8f792ac5_u32, 0x7947_u16, 0x4e11_u16, StaticArray[0xbc_u8, 0x3d_u8, 0x26_u8, 0x59_u8, 0xff_u8, 0x4_u8, 0x6a_u8, 0xe1_u8])
  struct IOpcSignatureCustomObjectSet
    lpVtbl : IOpcSignatureCustomObjectSetVTbl*
  end

  struct IOpcCertificateSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    remove : UInt64
    get_enumerator : UInt64
  end

  IOpcCertificateSet_GUID = "56ea4325-8e2d-4167-b1a4-e486d24c8fa7"
  IID_IOpcCertificateSet = LibC::GUID.new(0x56ea4325_u32, 0x8e2d_u16, 0x4167_u16, StaticArray[0xb1_u8, 0xa4_u8, 0xe4_u8, 0x86_u8, 0xd2_u8, 0x4c_u8, 0x8f_u8, 0xa7_u8])
  struct IOpcCertificateSet
    lpVtbl : IOpcCertificateSetVTbl*
  end

  struct IOpcFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_package_root_uri : UInt64
    create_part_uri : UInt64
    create_stream_on_file : UInt64
    create_package : UInt64
    read_package_from_stream : UInt64
    write_package_to_stream : UInt64
    create_digital_signature_manager : UInt64
  end

  IOpcFactory_GUID = "6d0b4446-cd73-4ab3-94f4-8ccdf6116154"
  IID_IOpcFactory = LibC::GUID.new(0x6d0b4446_u32, 0xcd73_u16, 0x4ab3_u16, StaticArray[0x94_u8, 0xf4_u8, 0x8c_u8, 0xcd_u8, 0xf6_u8, 0x11_u8, 0x61_u8, 0x54_u8])
  struct IOpcFactory
    lpVtbl : IOpcFactoryVTbl*
  end

end
struct LibWin32::IOpcUri
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_bstr(uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.unsafe_as(Proc(Uri_PROPERTY, UInt8**, UInt32, HRESULT)).call(uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pdwproperty, dwflags)
  end
  def has_property(uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.unsafe_as(Proc(Uri_PROPERTY, LibC::BOOL*, HRESULT)).call(uriprop, pfhasproperty)
  end
  def get_absolute_uri(pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrabsoluteuri)
  end
  def get_authority(pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthority)
  end
  def get_display_uri(pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdisplaystring)
  end
  def get_domain(pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdomain)
  end
  def get_extension(pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextension)
  end
  def get_fragment(pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfragment)
  end
  def get_host(pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrhost)
  end
  def get_password(pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpassword)
  end
  def get_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_path_and_query(pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathandquery)
  end
  def get_query(pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrquery)
  end
  def get_raw_uri(pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrawuri)
  end
  def get_scheme_name(pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrschemename)
  end
  def get_user_info(pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruserinfo)
  end
  def get_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def get_host_type(pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhosttype)
  end
  def get_port(pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwport)
  end
  def get_scheme(pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscheme)
  end
  def get_zone(pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwzone)
  end
  def get_properties(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def is_equal(puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(IUri, LibC::BOOL*, HRESULT)).call(puri, pfequal)
  end
  def get_relationships_part_uri(relationshipparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_relationships_part_uri.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(relationshipparturi)
  end
  def get_relative_uri(targetparturi : IOpcPartUri, relativeuri : IUri*) : HRESULT
    @lpVtbl.value.get_relative_uri.unsafe_as(Proc(IOpcPartUri, IUri*, HRESULT)).call(targetparturi, relativeuri)
  end
  def combine_part_uri(relativeuri : IUri, combineduri : IOpcPartUri*) : HRESULT
    @lpVtbl.value.combine_part_uri.unsafe_as(Proc(IUri, IOpcPartUri*, HRESULT)).call(relativeuri, combineduri)
  end
end
struct LibWin32::IOpcPartUri
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_bstr(uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.unsafe_as(Proc(Uri_PROPERTY, UInt8**, UInt32, HRESULT)).call(uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pdwproperty, dwflags)
  end
  def has_property(uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.unsafe_as(Proc(Uri_PROPERTY, LibC::BOOL*, HRESULT)).call(uriprop, pfhasproperty)
  end
  def get_absolute_uri(pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrabsoluteuri)
  end
  def get_authority(pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthority)
  end
  def get_display_uri(pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdisplaystring)
  end
  def get_domain(pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdomain)
  end
  def get_extension(pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextension)
  end
  def get_fragment(pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfragment)
  end
  def get_host(pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrhost)
  end
  def get_password(pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpassword)
  end
  def get_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_path_and_query(pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathandquery)
  end
  def get_query(pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrquery)
  end
  def get_raw_uri(pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrawuri)
  end
  def get_scheme_name(pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrschemename)
  end
  def get_user_info(pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruserinfo)
  end
  def get_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def get_host_type(pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhosttype)
  end
  def get_port(pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwport)
  end
  def get_scheme(pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscheme)
  end
  def get_zone(pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwzone)
  end
  def get_properties(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def is_equal(puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(IUri, LibC::BOOL*, HRESULT)).call(puri, pfequal)
  end
  def get_relationships_part_uri(relationshipparturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_relationships_part_uri.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(relationshipparturi)
  end
  def get_relative_uri(targetparturi : IOpcPartUri, relativeuri : IUri*) : HRESULT
    @lpVtbl.value.get_relative_uri.unsafe_as(Proc(IOpcPartUri, IUri*, HRESULT)).call(targetparturi, relativeuri)
  end
  def combine_part_uri(relativeuri : IUri, combineduri : IOpcPartUri*) : HRESULT
    @lpVtbl.value.combine_part_uri.unsafe_as(Proc(IUri, IOpcPartUri*, HRESULT)).call(relativeuri, combineduri)
  end
  def compare_part_uri(parturi : IOpcPartUri, comparisonresult : Int32*) : HRESULT
    @lpVtbl.value.compare_part_uri.unsafe_as(Proc(IOpcPartUri, Int32*, HRESULT)).call(parturi, comparisonresult)
  end
  def get_source_uri(sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.unsafe_as(Proc(IOpcUri*, HRESULT)).call(sourceuri)
  end
  def is_relationships_part_uri(isrelationshipuri : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_relationships_part_uri.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isrelationshipuri)
  end
end
struct LibWin32::IOpcPackage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_set(partset : IOpcPartSet*) : HRESULT
    @lpVtbl.value.get_part_set.unsafe_as(Proc(IOpcPartSet*, HRESULT)).call(partset)
  end
  def get_relationship_set(relationshipset : IOpcRelationshipSet*) : HRESULT
    @lpVtbl.value.get_relationship_set.unsafe_as(Proc(IOpcRelationshipSet*, HRESULT)).call(relationshipset)
  end
end
struct LibWin32::IOpcPart
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_relationship_set(relationshipset : IOpcRelationshipSet*) : HRESULT
    @lpVtbl.value.get_relationship_set.unsafe_as(Proc(IOpcRelationshipSet*, HRESULT)).call(relationshipset)
  end
  def get_content_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_content_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
  def get_name(name : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(name)
  end
  def get_content_type(contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(contenttype)
  end
  def get_compression_options(compressionoptions : OPC_COMPRESSION_OPTIONS*) : HRESULT
    @lpVtbl.value.get_compression_options.unsafe_as(Proc(OPC_COMPRESSION_OPTIONS*, HRESULT)).call(compressionoptions)
  end
end
struct LibWin32::IOpcRelationship
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id(relationshipidentifier : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(relationshipidentifier)
  end
  def get_relationship_type(relationshiptype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relationship_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(relationshiptype)
  end
  def get_source_uri(sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.unsafe_as(Proc(IOpcUri*, HRESULT)).call(sourceuri)
  end
  def get_target_uri(targeturi : IUri*) : HRESULT
    @lpVtbl.value.get_target_uri.unsafe_as(Proc(IUri*, HRESULT)).call(targeturi)
  end
  def get_target_mode(targetmode : OPC_URI_TARGET_MODE*) : HRESULT
    @lpVtbl.value.get_target_mode.unsafe_as(Proc(OPC_URI_TARGET_MODE*, HRESULT)).call(targetmode)
  end
end
struct LibWin32::IOpcPartSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part(name : IOpcPartUri, part : IOpcPart*) : HRESULT
    @lpVtbl.value.get_part.unsafe_as(Proc(IOpcPartUri, IOpcPart*, HRESULT)).call(name, part)
  end
  def create_part(name : IOpcPartUri, contenttype : LibC::LPWSTR, compressionoptions : OPC_COMPRESSION_OPTIONS, part : IOpcPart*) : HRESULT
    @lpVtbl.value.create_part.unsafe_as(Proc(IOpcPartUri, LibC::LPWSTR, OPC_COMPRESSION_OPTIONS, IOpcPart*, HRESULT)).call(name, contenttype, compressionoptions, part)
  end
  def delete_part(name : IOpcPartUri) : HRESULT
    @lpVtbl.value.delete_part.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(name)
  end
  def part_exists(name : IOpcPartUri, partexists : LibC::BOOL*) : HRESULT
    @lpVtbl.value.part_exists.unsafe_as(Proc(IOpcPartUri, LibC::BOOL*, HRESULT)).call(name, partexists)
  end
  def get_enumerator(partenumerator : IOpcPartEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcPartEnumerator*, HRESULT)).call(partenumerator)
  end
end
struct LibWin32::IOpcRelationshipSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_relationship(relationshipidentifier : LibC::LPWSTR, relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.get_relationship.unsafe_as(Proc(LibC::LPWSTR, IOpcRelationship*, HRESULT)).call(relationshipidentifier, relationship)
  end
  def create_relationship(relationshipidentifier : LibC::LPWSTR, relationshiptype : LibC::LPWSTR, targeturi : IUri, targetmode : OPC_URI_TARGET_MODE, relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.create_relationship.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, IUri, OPC_URI_TARGET_MODE, IOpcRelationship*, HRESULT)).call(relationshipidentifier, relationshiptype, targeturi, targetmode, relationship)
  end
  def delete_relationship(relationshipidentifier : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete_relationship.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(relationshipidentifier)
  end
  def relationship_exists(relationshipidentifier : LibC::LPWSTR, relationshipexists : LibC::BOOL*) : HRESULT
    @lpVtbl.value.relationship_exists.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(relationshipidentifier, relationshipexists)
  end
  def get_enumerator(relationshipenumerator : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcRelationshipEnumerator*, HRESULT)).call(relationshipenumerator)
  end
  def get_enumerator_for_type(relationshiptype : LibC::LPWSTR, relationshipenumerator : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator_for_type.unsafe_as(Proc(LibC::LPWSTR, IOpcRelationshipEnumerator*, HRESULT)).call(relationshiptype, relationshipenumerator)
  end
  def get_relationships_content_stream(contents : IStream*) : HRESULT
    @lpVtbl.value.get_relationships_content_stream.unsafe_as(Proc(IStream*, HRESULT)).call(contents)
  end
end
struct LibWin32::IOpcPartEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(part : IOpcPart*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcPart*, HRESULT)).call(part)
  end
  def clone(copy : IOpcPartEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcPartEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcRelationshipEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(relationship : IOpcRelationship*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcRelationship*, HRESULT)).call(relationship)
  end
  def clone(copy : IOpcRelationshipEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcRelationshipEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcSignaturePartReference
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_part_name(partname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(partname)
  end
  def get_content_type(contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(contenttype)
  end
  def get_digest_method(digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(digestmethod)
  end
  def get_digest_value(digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(digestvalue, count)
  end
  def get_transform_method(transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.unsafe_as(Proc(OPC_CANONICALIZATION_METHOD*, HRESULT)).call(transformmethod)
  end
end
struct LibWin32::IOpcSignatureRelationshipReference
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_source_uri(sourceuri : IOpcUri*) : HRESULT
    @lpVtbl.value.get_source_uri.unsafe_as(Proc(IOpcUri*, HRESULT)).call(sourceuri)
  end
  def get_digest_method(digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(digestmethod)
  end
  def get_digest_value(digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(digestvalue, count)
  end
  def get_transform_method(transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.unsafe_as(Proc(OPC_CANONICALIZATION_METHOD*, HRESULT)).call(transformmethod)
  end
  def get_relationship_signing_option(relationshipsigningoption : OPC_RELATIONSHIPS_SIGNING_OPTION*) : HRESULT
    @lpVtbl.value.get_relationship_signing_option.unsafe_as(Proc(OPC_RELATIONSHIPS_SIGNING_OPTION*, HRESULT)).call(relationshipsigningoption)
  end
  def get_relationship_selector_enumerator(selectorenumerator : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.get_relationship_selector_enumerator.unsafe_as(Proc(IOpcRelationshipSelectorEnumerator*, HRESULT)).call(selectorenumerator)
  end
end
struct LibWin32::IOpcRelationshipSelector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selector_type(selector : OPC_RELATIONSHIP_SELECTOR*) : HRESULT
    @lpVtbl.value.get_selector_type.unsafe_as(Proc(OPC_RELATIONSHIP_SELECTOR*, HRESULT)).call(selector)
  end
  def get_selection_criterion(selectioncriterion : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_selection_criterion.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(selectioncriterion)
  end
end
struct LibWin32::IOpcSignatureReference
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id(referenceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(referenceid)
  end
  def get_uri(referenceuri : IUri*) : HRESULT
    @lpVtbl.value.get_uri.unsafe_as(Proc(IUri*, HRESULT)).call(referenceuri)
  end
  def get_type(type : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(type)
  end
  def get_transform_method(transformmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_transform_method.unsafe_as(Proc(OPC_CANONICALIZATION_METHOD*, HRESULT)).call(transformmethod)
  end
  def get_digest_method(digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_digest_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(digestmethod)
  end
  def get_digest_value(digestvalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_digest_value.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(digestvalue, count)
  end
end
struct LibWin32::IOpcSignatureCustomObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_xml(xmlmarkup : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(xmlmarkup, count)
  end
end
struct LibWin32::IOpcDigitalSignature
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_namespaces(prefixes : LibC::LPWSTR**, namespaces : LibC::LPWSTR**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_namespaces.unsafe_as(Proc(LibC::LPWSTR**, LibC::LPWSTR**, UInt32*, HRESULT)).call(prefixes, namespaces, count)
  end
  def get_signature_id(signatureid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signatureid)
  end
  def get_signature_part_name(signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signaturepartname)
  end
  def get_signature_method(signaturemethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signaturemethod)
  end
  def get_canonicalization_method(canonicalizationmethod : OPC_CANONICALIZATION_METHOD*) : HRESULT
    @lpVtbl.value.get_canonicalization_method.unsafe_as(Proc(OPC_CANONICALIZATION_METHOD*, HRESULT)).call(canonicalizationmethod)
  end
  def get_signature_value(signaturevalue : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_value.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(signaturevalue, count)
  end
  def get_signature_part_reference_enumerator(partreferenceenumerator : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_part_reference_enumerator.unsafe_as(Proc(IOpcSignaturePartReferenceEnumerator*, HRESULT)).call(partreferenceenumerator)
  end
  def get_signature_relationship_reference_enumerator(relationshipreferenceenumerator : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_relationship_reference_enumerator.unsafe_as(Proc(IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)).call(relationshipreferenceenumerator)
  end
  def get_signing_time(signingtime : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signing_time.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(signingtime)
  end
  def get_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT*, HRESULT)).call(timeformat)
  end
  def get_package_object_reference(packageobjectreference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.get_package_object_reference.unsafe_as(Proc(IOpcSignatureReference*, HRESULT)).call(packageobjectreference)
  end
  def get_certificate_enumerator(certificateenumerator : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.get_certificate_enumerator.unsafe_as(Proc(IOpcCertificateEnumerator*, HRESULT)).call(certificateenumerator)
  end
  def get_custom_reference_enumerator(customreferenceenumerator : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_reference_enumerator.unsafe_as(Proc(IOpcSignatureReferenceEnumerator*, HRESULT)).call(customreferenceenumerator)
  end
  def get_custom_object_enumerator(customobjectenumerator : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.get_custom_object_enumerator.unsafe_as(Proc(IOpcSignatureCustomObjectEnumerator*, HRESULT)).call(customobjectenumerator)
  end
  def get_signature_xml(signaturexml : UInt8**, count : UInt32*) : HRESULT
    @lpVtbl.value.get_signature_xml.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(signaturexml, count)
  end
end
struct LibWin32::IOpcSigningOptions
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
  def get_default_digest_method(digestmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_default_digest_method.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(digestmethod)
  end
  def set_default_digest_method(digestmethod : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_default_digest_method.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(digestmethod)
  end
  def get_certificate_embedding_option(embeddingoption : OPC_CERTIFICATE_EMBEDDING_OPTION*) : HRESULT
    @lpVtbl.value.get_certificate_embedding_option.unsafe_as(Proc(OPC_CERTIFICATE_EMBEDDING_OPTION*, HRESULT)).call(embeddingoption)
  end
  def set_certificate_embedding_option(embeddingoption : OPC_CERTIFICATE_EMBEDDING_OPTION) : HRESULT
    @lpVtbl.value.set_certificate_embedding_option.unsafe_as(Proc(OPC_CERTIFICATE_EMBEDDING_OPTION, HRESULT)).call(embeddingoption)
  end
  def get_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT*) : HRESULT
    @lpVtbl.value.get_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT*, HRESULT)).call(timeformat)
  end
  def set_time_format(timeformat : OPC_SIGNATURE_TIME_FORMAT) : HRESULT
    @lpVtbl.value.set_time_format.unsafe_as(Proc(OPC_SIGNATURE_TIME_FORMAT, HRESULT)).call(timeformat)
  end
  def get_signature_part_reference_set(partreferenceset : IOpcSignaturePartReferenceSet*) : HRESULT
    @lpVtbl.value.get_signature_part_reference_set.unsafe_as(Proc(IOpcSignaturePartReferenceSet*, HRESULT)).call(partreferenceset)
  end
  def get_signature_relationship_reference_set(relationshipreferenceset : IOpcSignatureRelationshipReferenceSet*) : HRESULT
    @lpVtbl.value.get_signature_relationship_reference_set.unsafe_as(Proc(IOpcSignatureRelationshipReferenceSet*, HRESULT)).call(relationshipreferenceset)
  end
  def get_custom_object_set(customobjectset : IOpcSignatureCustomObjectSet*) : HRESULT
    @lpVtbl.value.get_custom_object_set.unsafe_as(Proc(IOpcSignatureCustomObjectSet*, HRESULT)).call(customobjectset)
  end
  def get_custom_reference_set(customreferenceset : IOpcSignatureReferenceSet*) : HRESULT
    @lpVtbl.value.get_custom_reference_set.unsafe_as(Proc(IOpcSignatureReferenceSet*, HRESULT)).call(customreferenceset)
  end
  def get_certificate_set(certificateset : IOpcCertificateSet*) : HRESULT
    @lpVtbl.value.get_certificate_set.unsafe_as(Proc(IOpcCertificateSet*, HRESULT)).call(certificateset)
  end
  def get_signature_part_name(signaturepartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signaturepartname)
  end
  def set_signature_part_name(signaturepartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(signaturepartname)
  end
end
struct LibWin32::IOpcDigitalSignatureManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_signature_origin_part_name(signatureoriginpartname : IOpcPartUri*) : HRESULT
    @lpVtbl.value.get_signature_origin_part_name.unsafe_as(Proc(IOpcPartUri*, HRESULT)).call(signatureoriginpartname)
  end
  def set_signature_origin_part_name(signatureoriginpartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.set_signature_origin_part_name.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(signatureoriginpartname)
  end
  def get_signature_enumerator(signatureenumerator : IOpcDigitalSignatureEnumerator*) : HRESULT
    @lpVtbl.value.get_signature_enumerator.unsafe_as(Proc(IOpcDigitalSignatureEnumerator*, HRESULT)).call(signatureenumerator)
  end
  def remove_signature(signaturepartname : IOpcPartUri) : HRESULT
    @lpVtbl.value.remove_signature.unsafe_as(Proc(IOpcPartUri, HRESULT)).call(signaturepartname)
  end
  def create_signing_options(signingoptions : IOpcSigningOptions*) : HRESULT
    @lpVtbl.value.create_signing_options.unsafe_as(Proc(IOpcSigningOptions*, HRESULT)).call(signingoptions)
  end
  def validate(signature : IOpcDigitalSignature, certificate : CERT_CONTEXT*, validationresult : OPC_SIGNATURE_VALIDATION_RESULT*) : HRESULT
    @lpVtbl.value.validate.unsafe_as(Proc(IOpcDigitalSignature, CERT_CONTEXT*, OPC_SIGNATURE_VALIDATION_RESULT*, HRESULT)).call(signature, certificate, validationresult)
  end
  def sign(certificate : CERT_CONTEXT*, signingoptions : IOpcSigningOptions, digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.sign.unsafe_as(Proc(CERT_CONTEXT*, IOpcSigningOptions, IOpcDigitalSignature*, HRESULT)).call(certificate, signingoptions, digitalsignature)
  end
  def replace_signature_xml(signaturepartname : IOpcPartUri, newsignaturexml : UInt8*, count : UInt32, digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.replace_signature_xml.unsafe_as(Proc(IOpcPartUri, UInt8*, UInt32, IOpcDigitalSignature*, HRESULT)).call(signaturepartname, newsignaturexml, count, digitalsignature)
  end
end
struct LibWin32::IOpcSignaturePartReferenceEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(partreference : IOpcSignaturePartReference*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcSignaturePartReference*, HRESULT)).call(partreference)
  end
  def clone(copy : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcSignaturePartReferenceEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcSignatureRelationshipReferenceEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(relationshipreference : IOpcSignatureRelationshipReference*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcSignatureRelationshipReference*, HRESULT)).call(relationshipreference)
  end
  def clone(copy : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcRelationshipSelectorEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(relationshipselector : IOpcRelationshipSelector*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcRelationshipSelector*, HRESULT)).call(relationshipselector)
  end
  def clone(copy : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcRelationshipSelectorEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcSignatureReferenceEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(reference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcSignatureReference*, HRESULT)).call(reference)
  end
  def clone(copy : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcSignatureReferenceEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcSignatureCustomObjectEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(customobject : IOpcSignatureCustomObject*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcSignatureCustomObject*, HRESULT)).call(customobject)
  end
  def clone(copy : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcSignatureCustomObjectEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcCertificateEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(certificate : CERT_CONTEXT**) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(CERT_CONTEXT**, HRESULT)).call(certificate)
  end
  def clone(copy : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcCertificateEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcDigitalSignatureEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
  def move_previous(hasprevious : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_previous.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasprevious)
  end
  def get_current(digitalsignature : IOpcDigitalSignature*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IOpcDigitalSignature*, HRESULT)).call(digitalsignature)
  end
  def clone(copy : IOpcDigitalSignatureEnumerator*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IOpcDigitalSignatureEnumerator*, HRESULT)).call(copy)
  end
end
struct LibWin32::IOpcSignaturePartReferenceSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(parturi : IOpcPartUri, digestmethod : LibC::LPWSTR, transformmethod : OPC_CANONICALIZATION_METHOD, partreference : IOpcSignaturePartReference*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(IOpcPartUri, LibC::LPWSTR, OPC_CANONICALIZATION_METHOD, IOpcSignaturePartReference*, HRESULT)).call(parturi, digestmethod, transformmethod, partreference)
  end
  def delete(partreference : IOpcSignaturePartReference) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(IOpcSignaturePartReference, HRESULT)).call(partreference)
  end
  def get_enumerator(partreferenceenumerator : IOpcSignaturePartReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcSignaturePartReferenceEnumerator*, HRESULT)).call(partreferenceenumerator)
  end
end
struct LibWin32::IOpcSignatureRelationshipReferenceSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(sourceuri : IOpcUri, digestmethod : LibC::LPWSTR, relationshipsigningoption : OPC_RELATIONSHIPS_SIGNING_OPTION, selectorset : IOpcRelationshipSelectorSet, transformmethod : OPC_CANONICALIZATION_METHOD, relationshipreference : IOpcSignatureRelationshipReference*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(IOpcUri, LibC::LPWSTR, OPC_RELATIONSHIPS_SIGNING_OPTION, IOpcRelationshipSelectorSet, OPC_CANONICALIZATION_METHOD, IOpcSignatureRelationshipReference*, HRESULT)).call(sourceuri, digestmethod, relationshipsigningoption, selectorset, transformmethod, relationshipreference)
  end
  def create_relationship_selector_set(selectorset : IOpcRelationshipSelectorSet*) : HRESULT
    @lpVtbl.value.create_relationship_selector_set.unsafe_as(Proc(IOpcRelationshipSelectorSet*, HRESULT)).call(selectorset)
  end
  def delete(relationshipreference : IOpcSignatureRelationshipReference) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(IOpcSignatureRelationshipReference, HRESULT)).call(relationshipreference)
  end
  def get_enumerator(relationshipreferenceenumerator : IOpcSignatureRelationshipReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcSignatureRelationshipReferenceEnumerator*, HRESULT)).call(relationshipreferenceenumerator)
  end
end
struct LibWin32::IOpcRelationshipSelectorSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(selector : OPC_RELATIONSHIP_SELECTOR, selectioncriterion : LibC::LPWSTR, relationshipselector : IOpcRelationshipSelector*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(OPC_RELATIONSHIP_SELECTOR, LibC::LPWSTR, IOpcRelationshipSelector*, HRESULT)).call(selector, selectioncriterion, relationshipselector)
  end
  def delete(relationshipselector : IOpcRelationshipSelector) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(IOpcRelationshipSelector, HRESULT)).call(relationshipselector)
  end
  def get_enumerator(relationshipselectorenumerator : IOpcRelationshipSelectorEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcRelationshipSelectorEnumerator*, HRESULT)).call(relationshipselectorenumerator)
  end
end
struct LibWin32::IOpcSignatureReferenceSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(referenceuri : IUri, referenceid : LibC::LPWSTR, type : LibC::LPWSTR, digestmethod : LibC::LPWSTR, transformmethod : OPC_CANONICALIZATION_METHOD, reference : IOpcSignatureReference*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(IUri, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, OPC_CANONICALIZATION_METHOD, IOpcSignatureReference*, HRESULT)).call(referenceuri, referenceid, type, digestmethod, transformmethod, reference)
  end
  def delete(reference : IOpcSignatureReference) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(IOpcSignatureReference, HRESULT)).call(reference)
  end
  def get_enumerator(referenceenumerator : IOpcSignatureReferenceEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcSignatureReferenceEnumerator*, HRESULT)).call(referenceenumerator)
  end
end
struct LibWin32::IOpcSignatureCustomObjectSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(xmlmarkup : UInt8*, count : UInt32, customobject : IOpcSignatureCustomObject*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt8*, UInt32, IOpcSignatureCustomObject*, HRESULT)).call(xmlmarkup, count, customobject)
  end
  def delete(customobject : IOpcSignatureCustomObject) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(IOpcSignatureCustomObject, HRESULT)).call(customobject)
  end
  def get_enumerator(customobjectenumerator : IOpcSignatureCustomObjectEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcSignatureCustomObjectEnumerator*, HRESULT)).call(customobjectenumerator)
  end
end
struct LibWin32::IOpcCertificateSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(certificate : CERT_CONTEXT*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(CERT_CONTEXT*, HRESULT)).call(certificate)
  end
  def remove(certificate : CERT_CONTEXT*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(CERT_CONTEXT*, HRESULT)).call(certificate)
  end
  def get_enumerator(certificateenumerator : IOpcCertificateEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IOpcCertificateEnumerator*, HRESULT)).call(certificateenumerator)
  end
end
struct LibWin32::IOpcFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_package_root_uri(rooturi : IOpcUri*) : HRESULT
    @lpVtbl.value.create_package_root_uri.unsafe_as(Proc(IOpcUri*, HRESULT)).call(rooturi)
  end
  def create_part_uri(pwzuri : LibC::LPWSTR, parturi : IOpcPartUri*) : HRESULT
    @lpVtbl.value.create_part_uri.unsafe_as(Proc(LibC::LPWSTR, IOpcPartUri*, HRESULT)).call(pwzuri, parturi)
  end
  def create_stream_on_file(filename : LibC::LPWSTR, iomode : OPC_STREAM_IO_MODE, securityattributes : SECURITY_ATTRIBUTES*, dwflagsandattributes : UInt32, stream : IStream*) : HRESULT
    @lpVtbl.value.create_stream_on_file.unsafe_as(Proc(LibC::LPWSTR, OPC_STREAM_IO_MODE, SECURITY_ATTRIBUTES*, UInt32, IStream*, HRESULT)).call(filename, iomode, securityattributes, dwflagsandattributes, stream)
  end
  def create_package(package : IOpcPackage*) : HRESULT
    @lpVtbl.value.create_package.unsafe_as(Proc(IOpcPackage*, HRESULT)).call(package)
  end
  def read_package_from_stream(stream : IStream, flags : OPC_READ_FLAGS, package : IOpcPackage*) : HRESULT
    @lpVtbl.value.read_package_from_stream.unsafe_as(Proc(IStream, OPC_READ_FLAGS, IOpcPackage*, HRESULT)).call(stream, flags, package)
  end
  def write_package_to_stream(package : IOpcPackage, flags : OPC_WRITE_FLAGS, stream : IStream) : HRESULT
    @lpVtbl.value.write_package_to_stream.unsafe_as(Proc(IOpcPackage, OPC_WRITE_FLAGS, IStream, HRESULT)).call(package, flags, stream)
  end
  def create_digital_signature_manager(package : IOpcPackage, signaturemanager : IOpcDigitalSignatureManager*) : HRESULT
    @lpVtbl.value.create_digital_signature_manager.unsafe_as(Proc(IOpcPackage, IOpcDigitalSignatureManager*, HRESULT)).call(package, signaturemanager)
  end
end
