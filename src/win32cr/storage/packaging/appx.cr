require "../../foundation.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:kernel.appcore.dll")]
{% else %}
@[Link("kernel.appcore")]
{% end %}
lib LibWin32
  PACKAGE_PROPERTY_FRAMEWORK = 1_u32
  PACKAGE_PROPERTY_RESOURCE = 2_u32
  PACKAGE_PROPERTY_BUNDLE = 4_u32
  PACKAGE_PROPERTY_OPTIONAL = 8_u32
  PACKAGE_FILTER_HEAD = 16_u32
  PACKAGE_FILTER_DIRECT = 32_u32
  PACKAGE_FILTER_RESOURCE = 64_u32
  PACKAGE_FILTER_BUNDLE = 128_u32
  PACKAGE_INFORMATION_BASIC = 0_u32
  PACKAGE_INFORMATION_FULL = 256_u32
  PACKAGE_PROPERTY_DEVELOPMENT_MODE = 65536_u32
  PACKAGE_FILTER_OPTIONAL = 131072_u32
  PACKAGE_PROPERTY_IS_IN_RELATED_SET = 262144_u32
  PACKAGE_FILTER_IS_IN_RELATED_SET = 262144_u32
  PACKAGE_PROPERTY_STATIC = 524288_u32
  PACKAGE_FILTER_STATIC = 524288_u32
  PACKAGE_PROPERTY_DYNAMIC = 1048576_u32
  PACKAGE_FILTER_DYNAMIC = 1048576_u32
  PACKAGE_PROPERTY_HOSTRUNTIME = 2097152_u32
  PACKAGE_FILTER_HOSTRUNTIME = 2097152_u32
  PACKAGE_FILTER_ALL_LOADED = 0_u32
  PACKAGE_DEPENDENCY_RANK_DEFAULT = 0_u32
  CLSID_AppxFactory = LibC::GUID.new(0x5842a140_u32, 0xff9f_u16, 0x4166_u16, StaticArray[0x8f_u8, 0x5c_u8, 0x62_u8, 0xf5_u8, 0xb7_u8, 0xb0_u8, 0xc7_u8, 0x81_u8])
  CLSID_AppxBundleFactory = LibC::GUID.new(0x378e0446_u32, 0x5384_u16, 0x43b7_u16, StaticArray[0x88_u8, 0x77_u8, 0xe7_u8, 0xdb_u8, 0xdd_u8, 0x88_u8, 0x34_u8, 0x46_u8])
  CLSID_AppxPackagingDiagnosticEventSinkManager = LibC::GUID.new(0x50ca0a46_u32, 0x1588_u16, 0x4161_u16, StaticArray[0x8e_u8, 0xd2_u8, 0xef_u8, 0x9e_u8, 0x46_u8, 0x9c_u8, 0xed_u8, 0x5d_u8])
  CLSID_AppxEncryptionFactory = LibC::GUID.new(0xdc664fdd_u32, 0xd868_u16, 0x46ee_u16, StaticArray[0x87_u8, 0x80_u8, 0x8d_u8, 0x19_u8, 0x6c_u8, 0xb7_u8, 0x39_u8, 0xf7_u8])
  CLSID_AppxPackageEditor = LibC::GUID.new(0xf004f2ca_u32, 0xaebc_u16, 0x4b0d_u16, StaticArray[0xbf_u8, 0x58_u8, 0xe5_u8, 0x16_u8, 0xd5_u8, 0xbc_u8, 0xc0_u8, 0xab_u8])


  enum APPX_COMPRESSION_OPTION : Int32
    APPX_COMPRESSION_OPTION_NONE = 0
    APPX_COMPRESSION_OPTION_NORMAL = 1
    APPX_COMPRESSION_OPTION_MAXIMUM = 2
    APPX_COMPRESSION_OPTION_FAST = 3
    APPX_COMPRESSION_OPTION_SUPERFAST = 4
  end

  enum APPX_FOOTPRINT_FILE_TYPE : Int32
    APPX_FOOTPRINT_FILE_TYPE_MANIFEST = 0
    APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1
    APPX_FOOTPRINT_FILE_TYPE_SIGNATURE = 2
    APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY = 3
    APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP = 4
  end

  enum APPX_BUNDLE_FOOTPRINT_FILE_TYPE : Int32
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST = 0
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST = 0
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE = 2
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST = 2
  end

  enum APPX_CAPABILITIES : UInt32
    APPX_CAPABILITY_INTERNET_CLIENT = 1
    APPX_CAPABILITY_INTERNET_CLIENT_SERVER = 2
    APPX_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER = 4
    APPX_CAPABILITY_DOCUMENTS_LIBRARY = 8
    APPX_CAPABILITY_PICTURES_LIBRARY = 16
    APPX_CAPABILITY_VIDEOS_LIBRARY = 32
    APPX_CAPABILITY_MUSIC_LIBRARY = 64
    APPX_CAPABILITY_ENTERPRISE_AUTHENTICATION = 128
    APPX_CAPABILITY_SHARED_USER_CERTIFICATES = 256
    APPX_CAPABILITY_REMOVABLE_STORAGE = 512
    APPX_CAPABILITY_APPOINTMENTS = 1024
    APPX_CAPABILITY_CONTACTS = 2048
  end

  enum APPX_PACKAGE_ARCHITECTURE : Int32
    APPX_PACKAGE_ARCHITECTURE_X86 = 0
    APPX_PACKAGE_ARCHITECTURE_ARM = 5
    APPX_PACKAGE_ARCHITECTURE_X64 = 9
    APPX_PACKAGE_ARCHITECTURE_NEUTRAL = 11
    APPX_PACKAGE_ARCHITECTURE_ARM64 = 12
  end

  enum APPX_PACKAGE_ARCHITECTURE2 : Int32
    APPX_PACKAGE_ARCHITECTURE2_X86 = 0
    APPX_PACKAGE_ARCHITECTURE2_ARM = 5
    APPX_PACKAGE_ARCHITECTURE2_X64 = 9
    APPX_PACKAGE_ARCHITECTURE2_NEUTRAL = 11
    APPX_PACKAGE_ARCHITECTURE2_ARM64 = 12
    APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64 = 14
    APPX_PACKAGE_ARCHITECTURE2_UNKNOWN = 65535
  end

  enum APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE : Int32
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_APPLICATION = 0
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_RESOURCE = 1
  end

  enum DX_FEATURE_LEVEL : Int32
    DX_FEATURE_LEVEL_UNSPECIFIED = 0
    DX_FEATURE_LEVEL_9 = 1
    DX_FEATURE_LEVEL_10 = 2
    DX_FEATURE_LEVEL_11 = 3
  end

  enum APPX_CAPABILITY_CLASS_TYPE : Int32
    APPX_CAPABILITY_CLASS_DEFAULT = 0
    APPX_CAPABILITY_CLASS_GENERAL = 1
    APPX_CAPABILITY_CLASS_RESTRICTED = 2
    APPX_CAPABILITY_CLASS_WINDOWS = 4
    APPX_CAPABILITY_CLASS_ALL = 7
    APPX_CAPABILITY_CLASS_CUSTOM = 8
  end

  enum APPX_PACKAGING_CONTEXT_CHANGE_TYPE : Int32
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START = 0
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE = 1
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS = 2
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END = 3
  end

  enum APPX_ENCRYPTED_PACKAGE_OPTIONS : UInt32
    APPX_ENCRYPTED_PACKAGE_OPTION_NONE = 0
    APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION = 1
    APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING = 2
  end

  enum APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION : Int32
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA = 0
  end

  enum APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS : UInt32
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_NONE = 0
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_SKIP_VALIDATION = 1
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_LOCALIZED = 2
  end

  enum PackagePathType : Int32
    PackagePathType_Install = 0
    PackagePathType_Mutable = 1
    PackagePathType_Effective = 2
    PackagePathType_MachineExternal = 3
    PackagePathType_UserExternal = 4
    PackagePathType_EffectiveExternal = 5
  end

  enum PackageOrigin : Int32
    PackageOrigin_Unknown = 0
    PackageOrigin_Unsigned = 1
    PackageOrigin_Inbox = 2
    PackageOrigin_Store = 3
    PackageOrigin_DeveloperUnsigned = 4
    PackageOrigin_DeveloperSigned = 5
    PackageOrigin_LineOfBusiness = 6
  end

  enum CreatePackageDependencyOptions : Int32
    CreatePackageDependencyOptions_None = 0
    CreatePackageDependencyOptions_DoNotVerifyDependencyResolution = 1
    CreatePackageDependencyOptions_ScopeIsSystem = 2
  end

  enum PackageDependencyLifetimeKind : Int32
    PackageDependencyLifetimeKind_Process = 0
    PackageDependencyLifetimeKind_FilePath = 1
    PackageDependencyLifetimeKind_RegistryKey = 2
  end

  enum AddPackageDependencyOptions : Int32
    AddPackageDependencyOptions_None = 0
    AddPackageDependencyOptions_PrependIfRankCollision = 1
  end

  enum PackageDependencyProcessorArchitectures : Int32
    PackageDependencyProcessorArchitectures_None = 0
    PackageDependencyProcessorArchitectures_Neutral = 1
    PackageDependencyProcessorArchitectures_X86 = 2
    PackageDependencyProcessorArchitectures_X64 = 4
    PackageDependencyProcessorArchitectures_Arm = 8
    PackageDependencyProcessorArchitectures_Arm64 = 16
    PackageDependencyProcessorArchitectures_X86A64 = 32
  end

  enum AppPolicyLifecycleManagement : Int32
    AppPolicyLifecycleManagement_Unmanaged = 0
    AppPolicyLifecycleManagement_Managed = 1
  end

  enum AppPolicyWindowingModel : Int32
    AppPolicyWindowingModel_None = 0
    AppPolicyWindowingModel_Universal = 1
    AppPolicyWindowingModel_ClassicDesktop = 2
    AppPolicyWindowingModel_ClassicPhone = 3
  end

  enum AppPolicyMediaFoundationCodecLoading : Int32
    AppPolicyMediaFoundationCodecLoading_All = 0
    AppPolicyMediaFoundationCodecLoading_InboxOnly = 1
  end

  enum AppPolicyClrCompat : Int32
    AppPolicyClrCompat_Other = 0
    AppPolicyClrCompat_ClassicDesktop = 1
    AppPolicyClrCompat_Universal = 2
    AppPolicyClrCompat_PackagedDesktop = 3
  end

  enum AppPolicyThreadInitializationType : Int32
    AppPolicyThreadInitializationType_None = 0
    AppPolicyThreadInitializationType_InitializeWinRT = 1
  end

  enum AppPolicyShowDeveloperDiagnostic : Int32
    AppPolicyShowDeveloperDiagnostic_None = 0
    AppPolicyShowDeveloperDiagnostic_ShowUI = 1
  end

  enum AppPolicyProcessTerminationMethod : Int32
    AppPolicyProcessTerminationMethod_ExitProcess = 0
    AppPolicyProcessTerminationMethod_TerminateProcess = 1
  end

  enum AppPolicyCreateFileAccess : Int32
    AppPolicyCreateFileAccess_Full = 0
    AppPolicyCreateFileAccess_Limited = 1
  end

  union PACKAGE_VERSION_Anonymous_e__Union
    version : UInt64
    anonymous : PACKAGE_VERSION_Anonymous_e__Union_Anonymous_e__Struct
  end

  struct APPX_PACKAGE_SETTINGS
    force_zip32 : LibC::BOOL
    hash_method : IUri
  end
  struct APPX_PACKAGE_WRITER_PAYLOAD_STREAM
    input_stream : IStream
    file_name : LibC::LPWSTR
    content_type : LibC::LPWSTR
    compression_option : APPX_COMPRESSION_OPTION
  end
  struct APPX_ENCRYPTED_PACKAGE_SETTINGS
    key_length : UInt32
    encryption_algorithm : LibC::LPWSTR
    use_diffusion : LibC::BOOL
    block_map_hash_algorithm : IUri
  end
  struct APPX_ENCRYPTED_PACKAGE_SETTINGS2
    key_length : UInt32
    encryption_algorithm : LibC::LPWSTR
    block_map_hash_algorithm : IUri
    options : UInt32
  end
  struct APPX_KEY_INFO
    key_length : UInt32
    key_id_length : UInt32
    key : UInt8*
    key_id : UInt8*
  end
  struct APPX_ENCRYPTED_EXEMPTIONS
    count : UInt32
    plain_text_files : LibC::LPWSTR*
  end
  struct PACKAGE_VERSION
    anonymous : PACKAGE_VERSION_Anonymous_e__Union
  end
  struct PACKAGE_VERSION_Anonymous_e__Union_Anonymous_e__Struct
    revision : UInt16
    build : UInt16
    minor : UInt16
    major : UInt16
  end
  struct PACKAGE_ID
    reserved : UInt32
    processor_architecture : UInt32
    version : PACKAGE_VERSION
    name : LibC::LPWSTR
    publisher : LibC::LPWSTR
    resource_id : LibC::LPWSTR
    publisher_id : LibC::LPWSTR
  end
  struct PACKAGE_INFO_REFERENCE
    reserved : Void*
  end
  struct PACKAGE_INFO
    reserved : UInt32
    flags : UInt32
    path : LibC::LPWSTR
    package_full_name : LibC::LPWSTR
    package_family_name : LibC::LPWSTR
    package_id : PACKAGE_ID
  end
  struct PACKAGEDEPENDENCY_CONTEXT__
    unused : Int32
  end
  struct PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__
    unused : Int32
  end


  struct IAppxFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_package_writer : UInt64
    create_package_reader : UInt64
    create_manifest_reader : UInt64
    create_block_map_reader : UInt64
    create_validated_block_map_reader : UInt64
  end

  IAppxFactory_GUID = "beb94909-e451-438b-b5a7-d79e767b75d8"
  IID_IAppxFactory = LibC::GUID.new(0xbeb94909_u32, 0xe451_u16, 0x438b_u16, StaticArray[0xb5_u8, 0xa7_u8, 0xd7_u8, 0x9e_u8, 0x76_u8, 0x7b_u8, 0x75_u8, 0xd8_u8])
  struct IAppxFactory
    lpVtbl : IAppxFactoryVTbl*
  end

  struct IAppxFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_content_group_map_reader : UInt64
    create_source_content_group_map_reader : UInt64
    create_content_group_map_writer : UInt64
  end

  IAppxFactory2_GUID = "f1346df2-c282-4e22-b918-743a929a8d55"
  IID_IAppxFactory2 = LibC::GUID.new(0xf1346df2_u32, 0xc282_u16, 0x4e22_u16, StaticArray[0xb9_u8, 0x18_u8, 0x74_u8, 0x3a_u8, 0x92_u8, 0x9a_u8, 0x8d_u8, 0x55_u8])
  struct IAppxFactory2
    lpVtbl : IAppxFactory2VTbl*
  end

  struct IAppxPackageReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_block_map : UInt64
    get_footprint_file : UInt64
    get_payload_file : UInt64
    get_payload_files : UInt64
    get_manifest : UInt64
  end

  IAppxPackageReader_GUID = "b5c49650-99bc-481c-9a34-3d53a4106708"
  IID_IAppxPackageReader = LibC::GUID.new(0xb5c49650_u32, 0x99bc_u16, 0x481c_u16, StaticArray[0x9a_u8, 0x34_u8, 0x3d_u8, 0x53_u8, 0xa4_u8, 0x10_u8, 0x67_u8, 0x8_u8])
  struct IAppxPackageReader
    lpVtbl : IAppxPackageReaderVTbl*
  end

  struct IAppxPackageWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_file : UInt64
    close : UInt64
  end

  IAppxPackageWriter_GUID = "9099e33b-246f-41e4-881a-008eb613f858"
  IID_IAppxPackageWriter = LibC::GUID.new(0x9099e33b_u32, 0x246f_u16, 0x41e4_u16, StaticArray[0x88_u8, 0x1a_u8, 0x0_u8, 0x8e_u8, 0xb6_u8, 0x13_u8, 0xf8_u8, 0x58_u8])
  struct IAppxPackageWriter
    lpVtbl : IAppxPackageWriterVTbl*
  end

  struct IAppxPackageWriter2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    close : UInt64
  end

  IAppxPackageWriter2_GUID = "2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8"
  IID_IAppxPackageWriter2 = LibC::GUID.new(0x2cf5c4fd_u32, 0xe54c_u16, 0x4ea5_u16, StaticArray[0xba_u8, 0x4e_u8, 0xf8_u8, 0xc4_u8, 0xb1_u8, 0x5_u8, 0xa8_u8, 0xc8_u8])
  struct IAppxPackageWriter2
    lpVtbl : IAppxPackageWriter2VTbl*
  end

  struct IAppxPackageWriter3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_files : UInt64
  end

  IAppxPackageWriter3_GUID = "a83aacd3-41c0-4501-b8a3-74164f50b2fd"
  IID_IAppxPackageWriter3 = LibC::GUID.new(0xa83aacd3_u32, 0x41c0_u16, 0x4501_u16, StaticArray[0xb8_u8, 0xa3_u8, 0x74_u8, 0x16_u8, 0x4f_u8, 0x50_u8, 0xb2_u8, 0xfd_u8])
  struct IAppxPackageWriter3
    lpVtbl : IAppxPackageWriter3VTbl*
  end

  struct IAppxFileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_compression_option : UInt64
    get_content_type : UInt64
    get_name : UInt64
    get_size : UInt64
    get_stream : UInt64
  end

  IAppxFile_GUID = "91df827b-94fd-468f-827b-57f41b2f6f2e"
  IID_IAppxFile = LibC::GUID.new(0x91df827b_u32, 0x94fd_u16, 0x468f_u16, StaticArray[0x82_u8, 0x7b_u8, 0x57_u8, 0xf4_u8, 0x1b_u8, 0x2f_u8, 0x6f_u8, 0x2e_u8])
  struct IAppxFile
    lpVtbl : IAppxFileVTbl*
  end

  struct IAppxFilesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxFilesEnumerator_GUID = "f007eeaf-9831-411c-9847-917cdc62d1fe"
  IID_IAppxFilesEnumerator = LibC::GUID.new(0xf007eeaf_u32, 0x9831_u16, 0x411c_u16, StaticArray[0x98_u8, 0x47_u8, 0x91_u8, 0x7c_u8, 0xdc_u8, 0x62_u8, 0xd1_u8, 0xfe_u8])
  struct IAppxFilesEnumerator
    lpVtbl : IAppxFilesEnumeratorVTbl*
  end

  struct IAppxBlockMapReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_file : UInt64
    get_files : UInt64
    get_hash_method : UInt64
    get_stream : UInt64
  end

  IAppxBlockMapReader_GUID = "5efec991-bca3-42d1-9ec2-e92d609ec22a"
  IID_IAppxBlockMapReader = LibC::GUID.new(0x5efec991_u32, 0xbca3_u16, 0x42d1_u16, StaticArray[0x9e_u8, 0xc2_u8, 0xe9_u8, 0x2d_u8, 0x60_u8, 0x9e_u8, 0xc2_u8, 0x2a_u8])
  struct IAppxBlockMapReader
    lpVtbl : IAppxBlockMapReaderVTbl*
  end

  struct IAppxBlockMapFileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_blocks : UInt64
    get_local_file_header_size : UInt64
    get_name : UInt64
    get_uncompressed_size : UInt64
    validate_file_hash : UInt64
  end

  IAppxBlockMapFile_GUID = "277672ac-4f63-42c1-8abc-beae3600eb59"
  IID_IAppxBlockMapFile = LibC::GUID.new(0x277672ac_u32, 0x4f63_u16, 0x42c1_u16, StaticArray[0x8a_u8, 0xbc_u8, 0xbe_u8, 0xae_u8, 0x36_u8, 0x0_u8, 0xeb_u8, 0x59_u8])
  struct IAppxBlockMapFile
    lpVtbl : IAppxBlockMapFileVTbl*
  end

  struct IAppxBlockMapFilesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxBlockMapFilesEnumerator_GUID = "02b856a2-4262-4070-bacb-1a8cbbc42305"
  IID_IAppxBlockMapFilesEnumerator = LibC::GUID.new(0x2b856a2_u32, 0x4262_u16, 0x4070_u16, StaticArray[0xba_u8, 0xcb_u8, 0x1a_u8, 0x8c_u8, 0xbb_u8, 0xc4_u8, 0x23_u8, 0x5_u8])
  struct IAppxBlockMapFilesEnumerator
    lpVtbl : IAppxBlockMapFilesEnumeratorVTbl*
  end

  struct IAppxBlockMapBlockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_hash : UInt64
    get_compressed_size : UInt64
  end

  IAppxBlockMapBlock_GUID = "75cf3930-3244-4fe0-a8c8-e0bcb270b889"
  IID_IAppxBlockMapBlock = LibC::GUID.new(0x75cf3930_u32, 0x3244_u16, 0x4fe0_u16, StaticArray[0xa8_u8, 0xc8_u8, 0xe0_u8, 0xbc_u8, 0xb2_u8, 0x70_u8, 0xb8_u8, 0x89_u8])
  struct IAppxBlockMapBlock
    lpVtbl : IAppxBlockMapBlockVTbl*
  end

  struct IAppxBlockMapBlocksEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxBlockMapBlocksEnumerator_GUID = "6b429b5b-36ef-479e-b9eb-0c1482b49e16"
  IID_IAppxBlockMapBlocksEnumerator = LibC::GUID.new(0x6b429b5b_u32, 0x36ef_u16, 0x479e_u16, StaticArray[0xb9_u8, 0xeb_u8, 0xc_u8, 0x14_u8, 0x82_u8, 0xb4_u8, 0x9e_u8, 0x16_u8])
  struct IAppxBlockMapBlocksEnumerator
    lpVtbl : IAppxBlockMapBlocksEnumeratorVTbl*
  end

  struct IAppxManifestReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_properties : UInt64
    get_package_dependencies : UInt64
    get_capabilities : UInt64
    get_resources : UInt64
    get_device_capabilities : UInt64
    get_prerequisite : UInt64
    get_applications : UInt64
    get_stream : UInt64
  end

  IAppxManifestReader_GUID = "4e1bd148-55a0-4480-a3d1-15544710637c"
  IID_IAppxManifestReader = LibC::GUID.new(0x4e1bd148_u32, 0x55a0_u16, 0x4480_u16, StaticArray[0xa3_u8, 0xd1_u8, 0x15_u8, 0x54_u8, 0x47_u8, 0x10_u8, 0x63_u8, 0x7c_u8])
  struct IAppxManifestReader
    lpVtbl : IAppxManifestReaderVTbl*
  end

  struct IAppxManifestReader2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_properties : UInt64
    get_package_dependencies : UInt64
    get_capabilities : UInt64
    get_resources : UInt64
    get_device_capabilities : UInt64
    get_prerequisite : UInt64
    get_applications : UInt64
    get_stream : UInt64
    get_qualified_resources : UInt64
  end

  IAppxManifestReader2_GUID = "d06f67bc-b31d-4eba-a8af-638e73e77b4d"
  IID_IAppxManifestReader2 = LibC::GUID.new(0xd06f67bc_u32, 0xb31d_u16, 0x4eba_u16, StaticArray[0xa8_u8, 0xaf_u8, 0x63_u8, 0x8e_u8, 0x73_u8, 0xe7_u8, 0x7b_u8, 0x4d_u8])
  struct IAppxManifestReader2
    lpVtbl : IAppxManifestReader2VTbl*
  end

  struct IAppxManifestReader3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_properties : UInt64
    get_package_dependencies : UInt64
    get_capabilities : UInt64
    get_resources : UInt64
    get_device_capabilities : UInt64
    get_prerequisite : UInt64
    get_applications : UInt64
    get_stream : UInt64
    get_qualified_resources : UInt64
    get_capabilities_by_capability_class : UInt64
    get_target_device_families : UInt64
  end

  IAppxManifestReader3_GUID = "c43825ab-69b7-400a-9709-cc37f5a72d24"
  IID_IAppxManifestReader3 = LibC::GUID.new(0xc43825ab_u32, 0x69b7_u16, 0x400a_u16, StaticArray[0x97_u8, 0x9_u8, 0xcc_u8, 0x37_u8, 0xf5_u8, 0xa7_u8, 0x2d_u8, 0x24_u8])
  struct IAppxManifestReader3
    lpVtbl : IAppxManifestReader3VTbl*
  end

  struct IAppxManifestReader4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_properties : UInt64
    get_package_dependencies : UInt64
    get_capabilities : UInt64
    get_resources : UInt64
    get_device_capabilities : UInt64
    get_prerequisite : UInt64
    get_applications : UInt64
    get_stream : UInt64
    get_qualified_resources : UInt64
    get_capabilities_by_capability_class : UInt64
    get_target_device_families : UInt64
    get_optional_package_info : UInt64
  end

  IAppxManifestReader4_GUID = "4579bb7c-741d-4161-b5a1-47bd3b78ad9b"
  IID_IAppxManifestReader4 = LibC::GUID.new(0x4579bb7c_u32, 0x741d_u16, 0x4161_u16, StaticArray[0xb5_u8, 0xa1_u8, 0x47_u8, 0xbd_u8, 0x3b_u8, 0x78_u8, 0xad_u8, 0x9b_u8])
  struct IAppxManifestReader4
    lpVtbl : IAppxManifestReader4VTbl*
  end

  struct IAppxManifestReader5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_main_package_dependencies : UInt64
  end

  IAppxManifestReader5_GUID = "8d7ae132-a690-4c00-b75a-6aae1feaac80"
  IID_IAppxManifestReader5 = LibC::GUID.new(0x8d7ae132_u32, 0xa690_u16, 0x4c00_u16, StaticArray[0xb7_u8, 0x5a_u8, 0x6a_u8, 0xae_u8, 0x1f_u8, 0xea_u8, 0xac_u8, 0x80_u8])
  struct IAppxManifestReader5
    lpVtbl : IAppxManifestReader5VTbl*
  end

  struct IAppxManifestReader6VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_non_qualified_resource_package : UInt64
  end

  IAppxManifestReader6_GUID = "34deaca4-d3c0-4e3e-b312-e42625e3807e"
  IID_IAppxManifestReader6 = LibC::GUID.new(0x34deaca4_u32, 0xd3c0_u16, 0x4e3e_u16, StaticArray[0xb3_u8, 0x12_u8, 0xe4_u8, 0x26_u8, 0x25_u8, 0xe3_u8, 0x80_u8, 0x7e_u8])
  struct IAppxManifestReader6
    lpVtbl : IAppxManifestReader6VTbl*
  end

  struct IAppxManifestReader7VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_driver_dependencies : UInt64
    get_os_package_dependencies : UInt64
    get_host_runtime_dependencies : UInt64
  end

  IAppxManifestReader7_GUID = "8efe6f27-0ce0-4988-b32d-738eb63db3b7"
  IID_IAppxManifestReader7 = LibC::GUID.new(0x8efe6f27_u32, 0xce0_u16, 0x4988_u16, StaticArray[0xb3_u8, 0x2d_u8, 0x73_u8, 0x8e_u8, 0xb6_u8, 0x3d_u8, 0xb3_u8, 0xb7_u8])
  struct IAppxManifestReader7
    lpVtbl : IAppxManifestReader7VTbl*
  end

  struct IAppxManifestDriverDependenciesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestDriverDependenciesEnumerator_GUID = "fe039db2-467f-4755-8404-8f5eb6865b33"
  IID_IAppxManifestDriverDependenciesEnumerator = LibC::GUID.new(0xfe039db2_u32, 0x467f_u16, 0x4755_u16, StaticArray[0x84_u8, 0x4_u8, 0x8f_u8, 0x5e_u8, 0xb6_u8, 0x86_u8, 0x5b_u8, 0x33_u8])
  struct IAppxManifestDriverDependenciesEnumerator
    lpVtbl : IAppxManifestDriverDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestDriverDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_driver_constraints : UInt64
  end

  IAppxManifestDriverDependency_GUID = "1210cb94-5a92-4602-be24-79f318af4af9"
  IID_IAppxManifestDriverDependency = LibC::GUID.new(0x1210cb94_u32, 0x5a92_u16, 0x4602_u16, StaticArray[0xbe_u8, 0x24_u8, 0x79_u8, 0xf3_u8, 0x18_u8, 0xaf_u8, 0x4a_u8, 0xf9_u8])
  struct IAppxManifestDriverDependency
    lpVtbl : IAppxManifestDriverDependencyVTbl*
  end

  struct IAppxManifestDriverConstraintsEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestDriverConstraintsEnumerator_GUID = "d402b2d1-f600-49e0-95e6-975d8da13d89"
  IID_IAppxManifestDriverConstraintsEnumerator = LibC::GUID.new(0xd402b2d1_u32, 0xf600_u16, 0x49e0_u16, StaticArray[0x95_u8, 0xe6_u8, 0x97_u8, 0x5d_u8, 0x8d_u8, 0xa1_u8, 0x3d_u8, 0x89_u8])
  struct IAppxManifestDriverConstraintsEnumerator
    lpVtbl : IAppxManifestDriverConstraintsEnumeratorVTbl*
  end

  struct IAppxManifestDriverConstraintVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_min_version : UInt64
    get_min_date : UInt64
  end

  IAppxManifestDriverConstraint_GUID = "c031bee4-bbcc-48ea-a237-c34045c80a07"
  IID_IAppxManifestDriverConstraint = LibC::GUID.new(0xc031bee4_u32, 0xbbcc_u16, 0x48ea_u16, StaticArray[0xa2_u8, 0x37_u8, 0xc3_u8, 0x40_u8, 0x45_u8, 0xc8_u8, 0xa_u8, 0x7_u8])
  struct IAppxManifestDriverConstraint
    lpVtbl : IAppxManifestDriverConstraintVTbl*
  end

  struct IAppxManifestOSPackageDependenciesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestOSPackageDependenciesEnumerator_GUID = "b84e2fc3-f8ec-4bc1-8ae2-156346f5ffea"
  IID_IAppxManifestOSPackageDependenciesEnumerator = LibC::GUID.new(0xb84e2fc3_u32, 0xf8ec_u16, 0x4bc1_u16, StaticArray[0x8a_u8, 0xe2_u8, 0x15_u8, 0x63_u8, 0x46_u8, 0xf5_u8, 0xff_u8, 0xea_u8])
  struct IAppxManifestOSPackageDependenciesEnumerator
    lpVtbl : IAppxManifestOSPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestOSPackageDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_version : UInt64
  end

  IAppxManifestOSPackageDependency_GUID = "154995ee-54a6-4f14-ac97-d8cf0519644b"
  IID_IAppxManifestOSPackageDependency = LibC::GUID.new(0x154995ee_u32, 0x54a6_u16, 0x4f14_u16, StaticArray[0xac_u8, 0x97_u8, 0xd8_u8, 0xcf_u8, 0x5_u8, 0x19_u8, 0x64_u8, 0x4b_u8])
  struct IAppxManifestOSPackageDependency
    lpVtbl : IAppxManifestOSPackageDependencyVTbl*
  end

  struct IAppxManifestHostRuntimeDependenciesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestHostRuntimeDependenciesEnumerator_GUID = "6427a646-7f49-433e-b1a6-0da309f6885a"
  IID_IAppxManifestHostRuntimeDependenciesEnumerator = LibC::GUID.new(0x6427a646_u32, 0x7f49_u16, 0x433e_u16, StaticArray[0xb1_u8, 0xa6_u8, 0xd_u8, 0xa3_u8, 0x9_u8, 0xf6_u8, 0x88_u8, 0x5a_u8])
  struct IAppxManifestHostRuntimeDependenciesEnumerator
    lpVtbl : IAppxManifestHostRuntimeDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestHostRuntimeDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_publisher : UInt64
    get_min_version : UInt64
  end

  IAppxManifestHostRuntimeDependency_GUID = "3455d234-8414-410d-95c7-7b35255b8391"
  IID_IAppxManifestHostRuntimeDependency = LibC::GUID.new(0x3455d234_u32, 0x8414_u16, 0x410d_u16, StaticArray[0x95_u8, 0xc7_u8, 0x7b_u8, 0x35_u8, 0x25_u8, 0x5b_u8, 0x83_u8, 0x91_u8])
  struct IAppxManifestHostRuntimeDependency
    lpVtbl : IAppxManifestHostRuntimeDependencyVTbl*
  end

  struct IAppxManifestHostRuntimeDependency2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_family_name : UInt64
  end

  IAppxManifestHostRuntimeDependency2_GUID = "c26f23a8-ee10-4ad6-b898-2b4d7aebfe6a"
  IID_IAppxManifestHostRuntimeDependency2 = LibC::GUID.new(0xc26f23a8_u32, 0xee10_u16, 0x4ad6_u16, StaticArray[0xb8_u8, 0x98_u8, 0x2b_u8, 0x4d_u8, 0x7a_u8, 0xeb_u8, 0xfe_u8, 0x6a_u8])
  struct IAppxManifestHostRuntimeDependency2
    lpVtbl : IAppxManifestHostRuntimeDependency2VTbl*
  end

  struct IAppxManifestOptionalPackageInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_optional_package : UInt64
    get_main_package_name : UInt64
  end

  IAppxManifestOptionalPackageInfo_GUID = "2634847d-5b5d-4fe5-a243-002ff95edc7e"
  IID_IAppxManifestOptionalPackageInfo = LibC::GUID.new(0x2634847d_u32, 0x5b5d_u16, 0x4fe5_u16, StaticArray[0xa2_u8, 0x43_u8, 0x0_u8, 0x2f_u8, 0xf9_u8, 0x5e_u8, 0xdc_u8, 0x7e_u8])
  struct IAppxManifestOptionalPackageInfo
    lpVtbl : IAppxManifestOptionalPackageInfoVTbl*
  end

  struct IAppxManifestMainPackageDependenciesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestMainPackageDependenciesEnumerator_GUID = "a99c4f00-51d2-4f0f-ba46-7ed5255ebdff"
  IID_IAppxManifestMainPackageDependenciesEnumerator = LibC::GUID.new(0xa99c4f00_u32, 0x51d2_u16, 0x4f0f_u16, StaticArray[0xba_u8, 0x46_u8, 0x7e_u8, 0xd5_u8, 0x25_u8, 0x5e_u8, 0xbd_u8, 0xff_u8])
  struct IAppxManifestMainPackageDependenciesEnumerator
    lpVtbl : IAppxManifestMainPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestMainPackageDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_publisher : UInt64
    get_package_family_name : UInt64
  end

  IAppxManifestMainPackageDependency_GUID = "05d0611c-bc29-46d5-97e2-84b9c79bd8ae"
  IID_IAppxManifestMainPackageDependency = LibC::GUID.new(0x5d0611c_u32, 0xbc29_u16, 0x46d5_u16, StaticArray[0x97_u8, 0xe2_u8, 0x84_u8, 0xb9_u8, 0xc7_u8, 0x9b_u8, 0xd8_u8, 0xae_u8])
  struct IAppxManifestMainPackageDependency
    lpVtbl : IAppxManifestMainPackageDependencyVTbl*
  end

  struct IAppxManifestPackageIdVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_architecture : UInt64
    get_publisher : UInt64
    get_version : UInt64
    get_resource_id : UInt64
    compare_publisher : UInt64
    get_package_full_name : UInt64
    get_package_family_name : UInt64
  end

  IAppxManifestPackageId_GUID = "283ce2d7-7153-4a91-9649-7a0f7240945f"
  IID_IAppxManifestPackageId = LibC::GUID.new(0x283ce2d7_u32, 0x7153_u16, 0x4a91_u16, StaticArray[0x96_u8, 0x49_u8, 0x7a_u8, 0xf_u8, 0x72_u8, 0x40_u8, 0x94_u8, 0x5f_u8])
  struct IAppxManifestPackageId
    lpVtbl : IAppxManifestPackageIdVTbl*
  end

  struct IAppxManifestPackageId2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_architecture : UInt64
    get_publisher : UInt64
    get_version : UInt64
    get_resource_id : UInt64
    compare_publisher : UInt64
    get_package_full_name : UInt64
    get_package_family_name : UInt64
    get_architecture2 : UInt64
  end

  IAppxManifestPackageId2_GUID = "2256999d-d617-42f1-880e-0ba4542319d5"
  IID_IAppxManifestPackageId2 = LibC::GUID.new(0x2256999d_u32, 0xd617_u16, 0x42f1_u16, StaticArray[0x88_u8, 0xe_u8, 0xb_u8, 0xa4_u8, 0x54_u8, 0x23_u8, 0x19_u8, 0xd5_u8])
  struct IAppxManifestPackageId2
    lpVtbl : IAppxManifestPackageId2VTbl*
  end

  struct IAppxManifestPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_bool_value : UInt64
    get_string_value : UInt64
  end

  IAppxManifestProperties_GUID = "03faf64d-f26f-4b2c-aaf7-8fe7789b8bca"
  IID_IAppxManifestProperties = LibC::GUID.new(0x3faf64d_u32, 0xf26f_u16, 0x4b2c_u16, StaticArray[0xaa_u8, 0xf7_u8, 0x8f_u8, 0xe7_u8, 0x78_u8, 0x9b_u8, 0x8b_u8, 0xca_u8])
  struct IAppxManifestProperties
    lpVtbl : IAppxManifestPropertiesVTbl*
  end

  struct IAppxManifestTargetDeviceFamiliesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestTargetDeviceFamiliesEnumerator_GUID = "36537f36-27a4-4788-88c0-733819575017"
  IID_IAppxManifestTargetDeviceFamiliesEnumerator = LibC::GUID.new(0x36537f36_u32, 0x27a4_u16, 0x4788_u16, StaticArray[0x88_u8, 0xc0_u8, 0x73_u8, 0x38_u8, 0x19_u8, 0x57_u8, 0x50_u8, 0x17_u8])
  struct IAppxManifestTargetDeviceFamiliesEnumerator
    lpVtbl : IAppxManifestTargetDeviceFamiliesEnumeratorVTbl*
  end

  struct IAppxManifestTargetDeviceFamilyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_min_version : UInt64
    get_max_version_tested : UInt64
  end

  IAppxManifestTargetDeviceFamily_GUID = "9091b09b-c8d5-4f31-8687-a338259faefb"
  IID_IAppxManifestTargetDeviceFamily = LibC::GUID.new(0x9091b09b_u32, 0xc8d5_u16, 0x4f31_u16, StaticArray[0x86_u8, 0x87_u8, 0xa3_u8, 0x38_u8, 0x25_u8, 0x9f_u8, 0xae_u8, 0xfb_u8])
  struct IAppxManifestTargetDeviceFamily
    lpVtbl : IAppxManifestTargetDeviceFamilyVTbl*
  end

  struct IAppxManifestPackageDependenciesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestPackageDependenciesEnumerator_GUID = "b43bbcf9-65a6-42dd-bac0-8c6741e7f5a4"
  IID_IAppxManifestPackageDependenciesEnumerator = LibC::GUID.new(0xb43bbcf9_u32, 0x65a6_u16, 0x42dd_u16, StaticArray[0xba_u8, 0xc0_u8, 0x8c_u8, 0x67_u8, 0x41_u8, 0xe7_u8, 0xf5_u8, 0xa4_u8])
  struct IAppxManifestPackageDependenciesEnumerator
    lpVtbl : IAppxManifestPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestPackageDependencyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_publisher : UInt64
    get_min_version : UInt64
  end

  IAppxManifestPackageDependency_GUID = "e4946b59-733e-43f0-a724-3bde4c1285a0"
  IID_IAppxManifestPackageDependency = LibC::GUID.new(0xe4946b59_u32, 0x733e_u16, 0x43f0_u16, StaticArray[0xa7_u8, 0x24_u8, 0x3b_u8, 0xde_u8, 0x4c_u8, 0x12_u8, 0x85_u8, 0xa0_u8])
  struct IAppxManifestPackageDependency
    lpVtbl : IAppxManifestPackageDependencyVTbl*
  end

  struct IAppxManifestPackageDependency2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_publisher : UInt64
    get_min_version : UInt64
    get_max_major_version_tested : UInt64
  end

  IAppxManifestPackageDependency2_GUID = "dda0b713-f3ff-49d3-898a-2786780c5d98"
  IID_IAppxManifestPackageDependency2 = LibC::GUID.new(0xdda0b713_u32, 0xf3ff_u16, 0x49d3_u16, StaticArray[0x89_u8, 0x8a_u8, 0x27_u8, 0x86_u8, 0x78_u8, 0xc_u8, 0x5d_u8, 0x98_u8])
  struct IAppxManifestPackageDependency2
    lpVtbl : IAppxManifestPackageDependency2VTbl*
  end

  struct IAppxManifestPackageDependency3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_optional : UInt64
  end

  IAppxManifestPackageDependency3_GUID = "1ac56374-6198-4d6b-92e4-749d5ab8a895"
  IID_IAppxManifestPackageDependency3 = LibC::GUID.new(0x1ac56374_u32, 0x6198_u16, 0x4d6b_u16, StaticArray[0x92_u8, 0xe4_u8, 0x74_u8, 0x9d_u8, 0x5a_u8, 0xb8_u8, 0xa8_u8, 0x95_u8])
  struct IAppxManifestPackageDependency3
    lpVtbl : IAppxManifestPackageDependency3VTbl*
  end

  struct IAppxManifestResourcesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestResourcesEnumerator_GUID = "de4dfbbd-881a-48bb-858c-d6f2baeae6ed"
  IID_IAppxManifestResourcesEnumerator = LibC::GUID.new(0xde4dfbbd_u32, 0x881a_u16, 0x48bb_u16, StaticArray[0x85_u8, 0x8c_u8, 0xd6_u8, 0xf2_u8, 0xba_u8, 0xea_u8, 0xe6_u8, 0xed_u8])
  struct IAppxManifestResourcesEnumerator
    lpVtbl : IAppxManifestResourcesEnumeratorVTbl*
  end

  struct IAppxManifestDeviceCapabilitiesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestDeviceCapabilitiesEnumerator_GUID = "30204541-427b-4a1c-bacf-655bf463a540"
  IID_IAppxManifestDeviceCapabilitiesEnumerator = LibC::GUID.new(0x30204541_u32, 0x427b_u16, 0x4a1c_u16, StaticArray[0xba_u8, 0xcf_u8, 0x65_u8, 0x5b_u8, 0xf4_u8, 0x63_u8, 0xa5_u8, 0x40_u8])
  struct IAppxManifestDeviceCapabilitiesEnumerator
    lpVtbl : IAppxManifestDeviceCapabilitiesEnumeratorVTbl*
  end

  struct IAppxManifestCapabilitiesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestCapabilitiesEnumerator_GUID = "11d22258-f470-42c1-b291-8361c5437e41"
  IID_IAppxManifestCapabilitiesEnumerator = LibC::GUID.new(0x11d22258_u32, 0xf470_u16, 0x42c1_u16, StaticArray[0xb2_u8, 0x91_u8, 0x83_u8, 0x61_u8, 0xc5_u8, 0x43_u8, 0x7e_u8, 0x41_u8])
  struct IAppxManifestCapabilitiesEnumerator
    lpVtbl : IAppxManifestCapabilitiesEnumeratorVTbl*
  end

  struct IAppxManifestApplicationsEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestApplicationsEnumerator_GUID = "9eb8a55a-f04b-4d0d-808d-686185d4847a"
  IID_IAppxManifestApplicationsEnumerator = LibC::GUID.new(0x9eb8a55a_u32, 0xf04b_u16, 0x4d0d_u16, StaticArray[0x80_u8, 0x8d_u8, 0x68_u8, 0x61_u8, 0x85_u8, 0xd4_u8, 0x84_u8, 0x7a_u8])
  struct IAppxManifestApplicationsEnumerator
    lpVtbl : IAppxManifestApplicationsEnumeratorVTbl*
  end

  struct IAppxManifestApplicationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_string_value : UInt64
    get_app_user_model_id : UInt64
  end

  IAppxManifestApplication_GUID = "5da89bf4-3773-46be-b650-7e744863b7e8"
  IID_IAppxManifestApplication = LibC::GUID.new(0x5da89bf4_u32, 0x3773_u16, 0x46be_u16, StaticArray[0xb6_u8, 0x50_u8, 0x7e_u8, 0x74_u8, 0x48_u8, 0x63_u8, 0xb7_u8, 0xe8_u8])
  struct IAppxManifestApplication
    lpVtbl : IAppxManifestApplicationVTbl*
  end

  struct IAppxManifestQualifiedResourcesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxManifestQualifiedResourcesEnumerator_GUID = "8ef6adfe-3762-4a8f-9373-2fc5d444c8d2"
  IID_IAppxManifestQualifiedResourcesEnumerator = LibC::GUID.new(0x8ef6adfe_u32, 0x3762_u16, 0x4a8f_u16, StaticArray[0x93_u8, 0x73_u8, 0x2f_u8, 0xc5_u8, 0xd4_u8, 0x44_u8, 0xc8_u8, 0xd2_u8])
  struct IAppxManifestQualifiedResourcesEnumerator
    lpVtbl : IAppxManifestQualifiedResourcesEnumeratorVTbl*
  end

  struct IAppxManifestQualifiedResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_language : UInt64
    get_scale : UInt64
    get_dx_feature_level : UInt64
  end

  IAppxManifestQualifiedResource_GUID = "3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4"
  IID_IAppxManifestQualifiedResource = LibC::GUID.new(0x3b53a497_u32, 0x3c5c_u16, 0x48d1_u16, StaticArray[0x9e_u8, 0xa3_u8, 0xbb_u8, 0x7e_u8, 0xac_u8, 0x8c_u8, 0xd7_u8, 0xd4_u8])
  struct IAppxManifestQualifiedResource
    lpVtbl : IAppxManifestQualifiedResourceVTbl*
  end

  struct IAppxBundleFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_bundle_writer : UInt64
    create_bundle_reader : UInt64
    create_bundle_manifest_reader : UInt64
  end

  IAppxBundleFactory_GUID = "bba65864-965f-4a5f-855f-f074bdbf3a7b"
  IID_IAppxBundleFactory = LibC::GUID.new(0xbba65864_u32, 0x965f_u16, 0x4a5f_u16, StaticArray[0x85_u8, 0x5f_u8, 0xf0_u8, 0x74_u8, 0xbd_u8, 0xbf_u8, 0x3a_u8, 0x7b_u8])
  struct IAppxBundleFactory
    lpVtbl : IAppxBundleFactoryVTbl*
  end

  struct IAppxBundleWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_package : UInt64
    close : UInt64
  end

  IAppxBundleWriter_GUID = "ec446fe8-bfec-4c64-ab4f-49f038f0c6d2"
  IID_IAppxBundleWriter = LibC::GUID.new(0xec446fe8_u32, 0xbfec_u16, 0x4c64_u16, StaticArray[0xab_u8, 0x4f_u8, 0x49_u8, 0xf0_u8, 0x38_u8, 0xf0_u8, 0xc6_u8, 0xd2_u8])
  struct IAppxBundleWriter
    lpVtbl : IAppxBundleWriterVTbl*
  end

  struct IAppxBundleWriter2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_external_package_reference : UInt64
  end

  IAppxBundleWriter2_GUID = "6d8fe971-01cc-49a0-b685-233851279962"
  IID_IAppxBundleWriter2 = LibC::GUID.new(0x6d8fe971_u32, 0x1cc_u16, 0x49a0_u16, StaticArray[0xb6_u8, 0x85_u8, 0x23_u8, 0x38_u8, 0x51_u8, 0x27_u8, 0x99_u8, 0x62_u8])
  struct IAppxBundleWriter2
    lpVtbl : IAppxBundleWriter2VTbl*
  end

  struct IAppxBundleWriter3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_package_reference : UInt64
    close : UInt64
  end

  IAppxBundleWriter3_GUID = "ad711152-f969-4193-82d5-9ddf2786d21a"
  IID_IAppxBundleWriter3 = LibC::GUID.new(0xad711152_u32, 0xf969_u16, 0x4193_u16, StaticArray[0x82_u8, 0xd5_u8, 0x9d_u8, 0xdf_u8, 0x27_u8, 0x86_u8, 0xd2_u8, 0x1a_u8])
  struct IAppxBundleWriter3
    lpVtbl : IAppxBundleWriter3VTbl*
  end

  struct IAppxBundleWriter4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_package : UInt64
    add_package_reference : UInt64
    add_external_package_reference : UInt64
  end

  IAppxBundleWriter4_GUID = "9cd9d523-5009-4c01-9882-dc029fbd47a3"
  IID_IAppxBundleWriter4 = LibC::GUID.new(0x9cd9d523_u32, 0x5009_u16, 0x4c01_u16, StaticArray[0x98_u8, 0x82_u8, 0xdc_u8, 0x2_u8, 0x9f_u8, 0xbd_u8, 0x47_u8, 0xa3_u8])
  struct IAppxBundleWriter4
    lpVtbl : IAppxBundleWriter4VTbl*
  end

  struct IAppxBundleReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_footprint_file : UInt64
    get_block_map : UInt64
    get_manifest : UInt64
    get_payload_packages : UInt64
    get_payload_package : UInt64
  end

  IAppxBundleReader_GUID = "dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8"
  IID_IAppxBundleReader = LibC::GUID.new(0xdd75b8c0_u32, 0xba76_u16, 0x43b0_u16, StaticArray[0xae_u8, 0xf_u8, 0x68_u8, 0x65_u8, 0x6a_u8, 0x1d_u8, 0xc5_u8, 0xc8_u8])
  struct IAppxBundleReader
    lpVtbl : IAppxBundleReaderVTbl*
  end

  struct IAppxBundleManifestReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_package_info_items : UInt64
    get_stream : UInt64
  end

  IAppxBundleManifestReader_GUID = "cf0ebbc1-cc99-4106-91eb-e67462e04fb0"
  IID_IAppxBundleManifestReader = LibC::GUID.new(0xcf0ebbc1_u32, 0xcc99_u16, 0x4106_u16, StaticArray[0x91_u8, 0xeb_u8, 0xe6_u8, 0x74_u8, 0x62_u8, 0xe0_u8, 0x4f_u8, 0xb0_u8])
  struct IAppxBundleManifestReader
    lpVtbl : IAppxBundleManifestReaderVTbl*
  end

  struct IAppxBundleManifestReader2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_optional_bundles : UInt64
  end

  IAppxBundleManifestReader2_GUID = "5517df70-033f-4af2-8213-87d766805c02"
  IID_IAppxBundleManifestReader2 = LibC::GUID.new(0x5517df70_u32, 0x33f_u16, 0x4af2_u16, StaticArray[0x82_u8, 0x13_u8, 0x87_u8, 0xd7_u8, 0x66_u8, 0x80_u8, 0x5c_u8, 0x2_u8])
  struct IAppxBundleManifestReader2
    lpVtbl : IAppxBundleManifestReader2VTbl*
  end

  struct IAppxBundleManifestPackageInfoEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxBundleManifestPackageInfoEnumerator_GUID = "f9b856ee-49a6-4e19-b2b0-6a2406d63a32"
  IID_IAppxBundleManifestPackageInfoEnumerator = LibC::GUID.new(0xf9b856ee_u32, 0x49a6_u16, 0x4e19_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x24_u8, 0x6_u8, 0xd6_u8, 0x3a_u8, 0x32_u8])
  struct IAppxBundleManifestPackageInfoEnumerator
    lpVtbl : IAppxBundleManifestPackageInfoEnumeratorVTbl*
  end

  struct IAppxBundleManifestPackageInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_type : UInt64
    get_package_id : UInt64
    get_file_name : UInt64
    get_offset : UInt64
    get_size : UInt64
    get_resources : UInt64
  end

  IAppxBundleManifestPackageInfo_GUID = "54cd06c1-268f-40bb-8ed2-757a9ebaec8d"
  IID_IAppxBundleManifestPackageInfo = LibC::GUID.new(0x54cd06c1_u32, 0x268f_u16, 0x40bb_u16, StaticArray[0x8e_u8, 0xd2_u8, 0x75_u8, 0x7a_u8, 0x9e_u8, 0xba_u8, 0xec_u8, 0x8d_u8])
  struct IAppxBundleManifestPackageInfo
    lpVtbl : IAppxBundleManifestPackageInfoVTbl*
  end

  struct IAppxBundleManifestPackageInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_package_reference : UInt64
    get_is_non_qualified_resource_package : UInt64
    get_is_default_applicable_package : UInt64
  end

  IAppxBundleManifestPackageInfo2_GUID = "44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e"
  IID_IAppxBundleManifestPackageInfo2 = LibC::GUID.new(0x44c2acbc_u32, 0xb2cf_u16, 0x4ccb_u16, StaticArray[0xbb_u8, 0xdb_u8, 0x9c_u8, 0x6d_u8, 0xa8_u8, 0xc3_u8, 0xbc_u8, 0x9e_u8])
  struct IAppxBundleManifestPackageInfo2
    lpVtbl : IAppxBundleManifestPackageInfo2VTbl*
  end

  struct IAppxBundleManifestPackageInfo3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_target_device_families : UInt64
  end

  IAppxBundleManifestPackageInfo3_GUID = "6ba74b98-bb74-4296-80d0-5f4256a99675"
  IID_IAppxBundleManifestPackageInfo3 = LibC::GUID.new(0x6ba74b98_u32, 0xbb74_u16, 0x4296_u16, StaticArray[0x80_u8, 0xd0_u8, 0x5f_u8, 0x42_u8, 0x56_u8, 0xa9_u8, 0x96_u8, 0x75_u8])
  struct IAppxBundleManifestPackageInfo3
    lpVtbl : IAppxBundleManifestPackageInfo3VTbl*
  end

  struct IAppxBundleManifestPackageInfo4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_stub : UInt64
  end

  IAppxBundleManifestPackageInfo4_GUID = "5da6f13d-a8a7-4532-857c-1393d659371d"
  IID_IAppxBundleManifestPackageInfo4 = LibC::GUID.new(0x5da6f13d_u32, 0xa8a7_u16, 0x4532_u16, StaticArray[0x85_u8, 0x7c_u8, 0x13_u8, 0x93_u8, 0xd6_u8, 0x59_u8, 0x37_u8, 0x1d_u8])
  struct IAppxBundleManifestPackageInfo4
    lpVtbl : IAppxBundleManifestPackageInfo4VTbl*
  end

  struct IAppxBundleManifestOptionalBundleInfoEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxBundleManifestOptionalBundleInfoEnumerator_GUID = "9a178793-f97e-46ac-aaca-dd5ba4c177c8"
  IID_IAppxBundleManifestOptionalBundleInfoEnumerator = LibC::GUID.new(0x9a178793_u32, 0xf97e_u16, 0x46ac_u16, StaticArray[0xaa_u8, 0xca_u8, 0xdd_u8, 0x5b_u8, 0xa4_u8, 0xc1_u8, 0x77_u8, 0xc8_u8])
  struct IAppxBundleManifestOptionalBundleInfoEnumerator
    lpVtbl : IAppxBundleManifestOptionalBundleInfoEnumeratorVTbl*
  end

  struct IAppxBundleManifestOptionalBundleInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_id : UInt64
    get_file_name : UInt64
    get_package_info_items : UInt64
  end

  IAppxBundleManifestOptionalBundleInfo_GUID = "515bf2e8-bcb0-4d69-8c48-e383147b6e12"
  IID_IAppxBundleManifestOptionalBundleInfo = LibC::GUID.new(0x515bf2e8_u32, 0xbcb0_u16, 0x4d69_u16, StaticArray[0x8c_u8, 0x48_u8, 0xe3_u8, 0x83_u8, 0x14_u8, 0x7b_u8, 0x6e_u8, 0x12_u8])
  struct IAppxBundleManifestOptionalBundleInfo
    lpVtbl : IAppxBundleManifestOptionalBundleInfoVTbl*
  end

  struct IAppxContentGroupFilesEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxContentGroupFilesEnumerator_GUID = "1a09a2fd-7440-44eb-8c84-848205a6a1cc"
  IID_IAppxContentGroupFilesEnumerator = LibC::GUID.new(0x1a09a2fd_u32, 0x7440_u16, 0x44eb_u16, StaticArray[0x8c_u8, 0x84_u8, 0x84_u8, 0x82_u8, 0x5_u8, 0xa6_u8, 0xa1_u8, 0xcc_u8])
  struct IAppxContentGroupFilesEnumerator
    lpVtbl : IAppxContentGroupFilesEnumeratorVTbl*
  end

  struct IAppxContentGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_files : UInt64
  end

  IAppxContentGroup_GUID = "328f6468-c04f-4e3c-b6fa-6b8d27f3003a"
  IID_IAppxContentGroup = LibC::GUID.new(0x328f6468_u32, 0xc04f_u16, 0x4e3c_u16, StaticArray[0xb6_u8, 0xfa_u8, 0x6b_u8, 0x8d_u8, 0x27_u8, 0xf3_u8, 0x0_u8, 0x3a_u8])
  struct IAppxContentGroup
    lpVtbl : IAppxContentGroupVTbl*
  end

  struct IAppxContentGroupsEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current : UInt64
    get_has_current : UInt64
    move_next : UInt64
  end

  IAppxContentGroupsEnumerator_GUID = "3264e477-16d1-4d63-823e-7d2984696634"
  IID_IAppxContentGroupsEnumerator = LibC::GUID.new(0x3264e477_u32, 0x16d1_u16, 0x4d63_u16, StaticArray[0x82_u8, 0x3e_u8, 0x7d_u8, 0x29_u8, 0x84_u8, 0x69_u8, 0x66_u8, 0x34_u8])
  struct IAppxContentGroupsEnumerator
    lpVtbl : IAppxContentGroupsEnumeratorVTbl*
  end

  struct IAppxContentGroupMapReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_required_group : UInt64
    get_automatic_groups : UInt64
  end

  IAppxContentGroupMapReader_GUID = "418726d8-dd99-4f5d-9886-157add20de01"
  IID_IAppxContentGroupMapReader = LibC::GUID.new(0x418726d8_u32, 0xdd99_u16, 0x4f5d_u16, StaticArray[0x98_u8, 0x86_u8, 0x15_u8, 0x7a_u8, 0xdd_u8, 0x20_u8, 0xde_u8, 0x1_u8])
  struct IAppxContentGroupMapReader
    lpVtbl : IAppxContentGroupMapReaderVTbl*
  end

  struct IAppxSourceContentGroupMapReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_required_group : UInt64
    get_automatic_groups : UInt64
  end

  IAppxSourceContentGroupMapReader_GUID = "f329791d-540b-4a9f-bc75-3282b7d73193"
  IID_IAppxSourceContentGroupMapReader = LibC::GUID.new(0xf329791d_u32, 0x540b_u16, 0x4a9f_u16, StaticArray[0xbc_u8, 0x75_u8, 0x32_u8, 0x82_u8, 0xb7_u8, 0xd7_u8, 0x31_u8, 0x93_u8])
  struct IAppxSourceContentGroupMapReader
    lpVtbl : IAppxSourceContentGroupMapReaderVTbl*
  end

  struct IAppxContentGroupMapWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_automatic_group : UInt64
    add_automatic_file : UInt64
    close : UInt64
  end

  IAppxContentGroupMapWriter_GUID = "d07ab776-a9de-4798-8c14-3db31e687c78"
  IID_IAppxContentGroupMapWriter = LibC::GUID.new(0xd07ab776_u32, 0xa9de_u16, 0x4798_u16, StaticArray[0x8c_u8, 0x14_u8, 0x3d_u8, 0xb3_u8, 0x1e_u8, 0x68_u8, 0x7c_u8, 0x78_u8])
  struct IAppxContentGroupMapWriter
    lpVtbl : IAppxContentGroupMapWriterVTbl*
  end

  struct IAppxPackagingDiagnosticEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    report_context_change : UInt64
    report_error : UInt64
  end

  IAppxPackagingDiagnosticEventSink_GUID = "17239d47-6adb-45d2-80f6-f9cbc3bf059d"
  IID_IAppxPackagingDiagnosticEventSink = LibC::GUID.new(0x17239d47_u32, 0x6adb_u16, 0x45d2_u16, StaticArray[0x80_u8, 0xf6_u8, 0xf9_u8, 0xcb_u8, 0xc3_u8, 0xbf_u8, 0x5_u8, 0x9d_u8])
  struct IAppxPackagingDiagnosticEventSink
    lpVtbl : IAppxPackagingDiagnosticEventSinkVTbl*
  end

  struct IAppxPackagingDiagnosticEventSinkManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_sink_for_process : UInt64
  end

  IAppxPackagingDiagnosticEventSinkManager_GUID = "369648fa-a7eb-4909-a15d-6954a078f18a"
  IID_IAppxPackagingDiagnosticEventSinkManager = LibC::GUID.new(0x369648fa_u32, 0xa7eb_u16, 0x4909_u16, StaticArray[0xa1_u8, 0x5d_u8, 0x69_u8, 0x54_u8, 0xa0_u8, 0x78_u8, 0xf1_u8, 0x8a_u8])
  struct IAppxPackagingDiagnosticEventSinkManager
    lpVtbl : IAppxPackagingDiagnosticEventSinkManagerVTbl*
  end

  struct IAppxEncryptionFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    encrypt_package : UInt64
    decrypt_package : UInt64
    create_encrypted_package_writer : UInt64
    create_encrypted_package_reader : UInt64
    encrypt_bundle : UInt64
    decrypt_bundle : UInt64
    create_encrypted_bundle_writer : UInt64
    create_encrypted_bundle_reader : UInt64
  end

  IAppxEncryptionFactory_GUID = "80e8e04d-8c88-44ae-a011-7cadf6fb2e72"
  IID_IAppxEncryptionFactory = LibC::GUID.new(0x80e8e04d_u32, 0x8c88_u16, 0x44ae_u16, StaticArray[0xa0_u8, 0x11_u8, 0x7c_u8, 0xad_u8, 0xf6_u8, 0xfb_u8, 0x2e_u8, 0x72_u8])
  struct IAppxEncryptionFactory
    lpVtbl : IAppxEncryptionFactoryVTbl*
  end

  struct IAppxEncryptionFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_encrypted_package_writer : UInt64
  end

  IAppxEncryptionFactory2_GUID = "c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f"
  IID_IAppxEncryptionFactory2 = LibC::GUID.new(0xc1b11eee_u32, 0xc4ba_u16, 0x4ab2_u16, StaticArray[0xa5_u8, 0x5d_u8, 0xd0_u8, 0x15_u8, 0xfe_u8, 0x8f_u8, 0xf6_u8, 0x4f_u8])
  struct IAppxEncryptionFactory2
    lpVtbl : IAppxEncryptionFactory2VTbl*
  end

  struct IAppxEncryptionFactory3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    encrypt_package : UInt64
    create_encrypted_package_writer : UInt64
    encrypt_bundle : UInt64
    create_encrypted_bundle_writer : UInt64
  end

  IAppxEncryptionFactory3_GUID = "09edca37-cd64-47d6-b7e8-1cb11d4f7e05"
  IID_IAppxEncryptionFactory3 = LibC::GUID.new(0x9edca37_u32, 0xcd64_u16, 0x47d6_u16, StaticArray[0xb7_u8, 0xe8_u8, 0x1c_u8, 0xb1_u8, 0x1d_u8, 0x4f_u8, 0x7e_u8, 0x5_u8])
  struct IAppxEncryptionFactory3
    lpVtbl : IAppxEncryptionFactory3VTbl*
  end

  struct IAppxEncryptionFactory4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    encrypt_package : UInt64
  end

  IAppxEncryptionFactory4_GUID = "a879611f-12fd-41fe-85d5-06ae779bbaf5"
  IID_IAppxEncryptionFactory4 = LibC::GUID.new(0xa879611f_u32, 0x12fd_u16, 0x41fe_u16, StaticArray[0x85_u8, 0xd5_u8, 0x6_u8, 0xae_u8, 0x77_u8, 0x9b_u8, 0xba_u8, 0xf5_u8])
  struct IAppxEncryptionFactory4
    lpVtbl : IAppxEncryptionFactory4VTbl*
  end

  struct IAppxEncryptedPackageWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_file_encrypted : UInt64
    close : UInt64
  end

  IAppxEncryptedPackageWriter_GUID = "f43d0b0b-1379-40e2-9b29-682ea2bf42af"
  IID_IAppxEncryptedPackageWriter = LibC::GUID.new(0xf43d0b0b_u32, 0x1379_u16, 0x40e2_u16, StaticArray[0x9b_u8, 0x29_u8, 0x68_u8, 0x2e_u8, 0xa2_u8, 0xbf_u8, 0x42_u8, 0xaf_u8])
  struct IAppxEncryptedPackageWriter
    lpVtbl : IAppxEncryptedPackageWriterVTbl*
  end

  struct IAppxEncryptedPackageWriter2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_files_encrypted : UInt64
  end

  IAppxEncryptedPackageWriter2_GUID = "3e475447-3a25-40b5-8ad2-f953ae50c92d"
  IID_IAppxEncryptedPackageWriter2 = LibC::GUID.new(0x3e475447_u32, 0x3a25_u16, 0x40b5_u16, StaticArray[0x8a_u8, 0xd2_u8, 0xf9_u8, 0x53_u8, 0xae_u8, 0x50_u8, 0xc9_u8, 0x2d_u8])
  struct IAppxEncryptedPackageWriter2
    lpVtbl : IAppxEncryptedPackageWriter2VTbl*
  end

  struct IAppxEncryptedBundleWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_package_encrypted : UInt64
    close : UInt64
  end

  IAppxEncryptedBundleWriter_GUID = "80b0902f-7bf0-4117-b8c6-4279ef81ee77"
  IID_IAppxEncryptedBundleWriter = LibC::GUID.new(0x80b0902f_u32, 0x7bf0_u16, 0x4117_u16, StaticArray[0xb8_u8, 0xc6_u8, 0x42_u8, 0x79_u8, 0xef_u8, 0x81_u8, 0xee_u8, 0x77_u8])
  struct IAppxEncryptedBundleWriter
    lpVtbl : IAppxEncryptedBundleWriterVTbl*
  end

  struct IAppxEncryptedBundleWriter2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_external_package_reference : UInt64
  end

  IAppxEncryptedBundleWriter2_GUID = "e644be82-f0fa-42b8-a956-8d1cb48ee379"
  IID_IAppxEncryptedBundleWriter2 = LibC::GUID.new(0xe644be82_u32, 0xf0fa_u16, 0x42b8_u16, StaticArray[0xa9_u8, 0x56_u8, 0x8d_u8, 0x1c_u8, 0xb4_u8, 0x8e_u8, 0xe3_u8, 0x79_u8])
  struct IAppxEncryptedBundleWriter2
    lpVtbl : IAppxEncryptedBundleWriter2VTbl*
  end

  struct IAppxEncryptedBundleWriter3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_payload_package_encrypted : UInt64
    add_external_package_reference : UInt64
  end

  IAppxEncryptedBundleWriter3_GUID = "0d34deb3-5cae-4dd3-977c-504932a51d31"
  IID_IAppxEncryptedBundleWriter3 = LibC::GUID.new(0xd34deb3_u32, 0x5cae_u16, 0x4dd3_u16, StaticArray[0x97_u8, 0x7c_u8, 0x50_u8, 0x49_u8, 0x32_u8, 0xa5_u8, 0x1d_u8, 0x31_u8])
  struct IAppxEncryptedBundleWriter3
    lpVtbl : IAppxEncryptedBundleWriter3VTbl*
  end

  struct IAppxPackageEditorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_working_directory : UInt64
    create_delta_package : UInt64
    create_delta_package_using_baseline_block_map : UInt64
    update_package : UInt64
    update_encrypted_package : UInt64
    update_package_manifest : UInt64
  end

  IAppxPackageEditor_GUID = "e2adb6dc-5e71-4416-86b6-86e5f5291a6b"
  IID_IAppxPackageEditor = LibC::GUID.new(0xe2adb6dc_u32, 0x5e71_u16, 0x4416_u16, StaticArray[0x86_u8, 0xb6_u8, 0x86_u8, 0xe5_u8, 0xf5_u8, 0x29_u8, 0x1a_u8, 0x6b_u8])
  struct IAppxPackageEditor
    lpVtbl : IAppxPackageEditorVTbl*
  end


  # Params # bufferlength : UInt32* [In],buffer : UInt8* [In]
  fun GetCurrentPackageId(bufferlength : UInt32*, buffer : UInt8*) : Int32

  # Params # packagefullnamelength : UInt32* [In],packagefullname : Char* [In]
  fun GetCurrentPackageFullName(packagefullnamelength : UInt32*, packagefullname : Char*) : Int32

  # Params # packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In]
  fun GetCurrentPackageFamilyName(packagefamilynamelength : UInt32*, packagefamilyname : Char*) : Int32

  # Params # pathlength : UInt32* [In],path : Char* [In]
  fun GetCurrentPackagePath(pathlength : UInt32*, path : Char*) : Int32

  # Params # hprocess : LibC::HANDLE [In],bufferlength : UInt32* [In],buffer : UInt8* [In]
  fun GetPackageId(hprocess : LibC::HANDLE, bufferlength : UInt32*, buffer : UInt8*) : Int32

  # Params # hprocess : LibC::HANDLE [In],packagefullnamelength : UInt32* [In],packagefullname : Char* [In]
  fun GetPackageFullName(hprocess : LibC::HANDLE, packagefullnamelength : UInt32*, packagefullname : Char*) : Int32

  # Params # token : LibC::HANDLE [In],packagefullnamelength : UInt32* [In],packagefullname : Char* [In]
  fun GetPackageFullNameFromToken(token : LibC::HANDLE, packagefullnamelength : UInt32*, packagefullname : Char*) : Int32

  # Params # hprocess : LibC::HANDLE [In],packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In]
  fun GetPackageFamilyName(hprocess : LibC::HANDLE, packagefamilynamelength : UInt32*, packagefamilyname : Char*) : Int32

  # Params # token : LibC::HANDLE [In],packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In]
  fun GetPackageFamilyNameFromToken(token : LibC::HANDLE, packagefamilynamelength : UInt32*, packagefamilyname : Char*) : Int32

  # Params # packageid : PACKAGE_ID* [In],reserved : UInt32 [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetPackagePath(packageid : PACKAGE_ID*, reserved : UInt32, pathlength : UInt32*, path : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetPackagePathByFullName(packagefullname : LibC::LPWSTR, pathlength : UInt32*, path : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetStagedPackagePathByFullName(packagefullname : LibC::LPWSTR, pathlength : UInt32*, path : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],packagepathtype : PackagePathType [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetPackagePathByFullName2(packagefullname : LibC::LPWSTR, packagepathtype : PackagePathType, pathlength : UInt32*, path : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],packagepathtype : PackagePathType [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetStagedPackagePathByFullName2(packagefullname : LibC::LPWSTR, packagepathtype : PackagePathType, pathlength : UInt32*, path : Char*) : Int32

  # Params # flags : UInt32 [In],packagepathtype : PackagePathType [In],bufferlength : UInt32* [In],buffer : UInt8* [In],count : UInt32* [In]
  fun GetCurrentPackageInfo2(flags : UInt32, packagepathtype : PackagePathType, bufferlength : UInt32*, buffer : UInt8*, count : UInt32*) : Int32

  # Params # packagepathtype : PackagePathType [In],pathlength : UInt32* [In],path : Char* [In]
  fun GetCurrentPackagePath2(packagepathtype : PackagePathType, pathlength : UInt32*, path : Char*) : Int32

  # Params # applicationusermodelidlength : UInt32* [In],applicationusermodelid : Char* [In]
  fun GetCurrentApplicationUserModelId(applicationusermodelidlength : UInt32*, applicationusermodelid : Char*) : Int32

  # Params # hprocess : LibC::HANDLE [In],applicationusermodelidlength : UInt32* [In],applicationusermodelid : Char* [In]
  fun GetApplicationUserModelId(hprocess : LibC::HANDLE, applicationusermodelidlength : UInt32*, applicationusermodelid : Char*) : Int32

  # Params # token : LibC::HANDLE [In],applicationusermodelidlength : UInt32* [In],applicationusermodelid : Char* [In]
  fun GetApplicationUserModelIdFromToken(token : LibC::HANDLE, applicationusermodelidlength : UInt32*, applicationusermodelid : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In]
  fun VerifyPackageFullName(packagefullname : LibC::LPWSTR) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In]
  fun VerifyPackageFamilyName(packagefamilyname : LibC::LPWSTR) : Int32

  # Params # packageid : PACKAGE_ID* [In]
  fun VerifyPackageId(packageid : PACKAGE_ID*) : Int32

  # Params # applicationusermodelid : LibC::LPWSTR [In]
  fun VerifyApplicationUserModelId(applicationusermodelid : LibC::LPWSTR) : Int32

  # Params # packagerelativeapplicationid : LibC::LPWSTR [In]
  fun VerifyPackageRelativeApplicationId(packagerelativeapplicationid : LibC::LPWSTR) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],flags : UInt32 [In],bufferlength : UInt32* [In],buffer : UInt8* [In]
  fun PackageIdFromFullName(packagefullname : LibC::LPWSTR, flags : UInt32, bufferlength : UInt32*, buffer : UInt8*) : Int32

  # Params # packageid : PACKAGE_ID* [In],packagefullnamelength : UInt32* [In],packagefullname : Char* [In]
  fun PackageFullNameFromId(packageid : PACKAGE_ID*, packagefullnamelength : UInt32*, packagefullname : Char*) : Int32

  # Params # packageid : PACKAGE_ID* [In],packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In]
  fun PackageFamilyNameFromId(packageid : PACKAGE_ID*, packagefamilynamelength : UInt32*, packagefamilyname : Char*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In]
  fun PackageFamilyNameFromFullName(packagefullname : LibC::LPWSTR, packagefamilynamelength : UInt32*, packagefamilyname : Char*) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In],packagenamelength : UInt32* [In],packagename : Char* [In],packagepublisheridlength : UInt32* [In],packagepublisherid : Char* [In]
  fun PackageNameAndPublisherIdFromFamilyName(packagefamilyname : LibC::LPWSTR, packagenamelength : UInt32*, packagename : Char*, packagepublisheridlength : UInt32*, packagepublisherid : Char*) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In],packagerelativeapplicationid : LibC::LPWSTR [In],applicationusermodelidlength : UInt32* [In],applicationusermodelid : Char* [In]
  fun FormatApplicationUserModelId(packagefamilyname : LibC::LPWSTR, packagerelativeapplicationid : LibC::LPWSTR, applicationusermodelidlength : UInt32*, applicationusermodelid : Char*) : Int32

  # Params # applicationusermodelid : LibC::LPWSTR [In],packagefamilynamelength : UInt32* [In],packagefamilyname : Char* [In],packagerelativeapplicationidlength : UInt32* [In],packagerelativeapplicationid : Char* [In]
  fun ParseApplicationUserModelId(applicationusermodelid : LibC::LPWSTR, packagefamilynamelength : UInt32*, packagefamilyname : Char*, packagerelativeapplicationidlength : UInt32*, packagerelativeapplicationid : Char*) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In],count : UInt32* [In],packagefullnames : LibC::LPWSTR* [In],bufferlength : UInt32* [In],buffer : Char* [In]
  fun GetPackagesByPackageFamily(packagefamilyname : LibC::LPWSTR, count : UInt32*, packagefullnames : LibC::LPWSTR*, bufferlength : UInt32*, buffer : Char*) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In],packagefilters : UInt32 [In],count : UInt32* [In],packagefullnames : LibC::LPWSTR* [In],bufferlength : UInt32* [In],buffer : Char* [In],packageproperties : UInt32* [In]
  fun FindPackagesByPackageFamily(packagefamilyname : LibC::LPWSTR, packagefilters : UInt32, count : UInt32*, packagefullnames : LibC::LPWSTR*, bufferlength : UInt32*, buffer : Char*, packageproperties : UInt32*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],origin : PackageOrigin* [In]
  fun GetStagedPackageOrigin(packagefullname : LibC::LPWSTR, origin : PackageOrigin*) : Int32

  # Params # flags : UInt32 [In],bufferlength : UInt32* [In],buffer : UInt8* [In],count : UInt32* [In]
  fun GetCurrentPackageInfo(flags : UInt32, bufferlength : UInt32*, buffer : UInt8*, count : UInt32*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],reserved : UInt32 [In],packageinforeference : PACKAGE_INFO_REFERENCE** [In]
  fun OpenPackageInfoByFullName(packagefullname : LibC::LPWSTR, reserved : UInt32, packageinforeference : PACKAGE_INFO_REFERENCE**) : Int32

  # Params # usersid : PSID [In],packagefullname : LibC::LPWSTR [In],reserved : UInt32 [In],packageinforeference : PACKAGE_INFO_REFERENCE** [In]
  fun OpenPackageInfoByFullNameForUser(usersid : PSID, packagefullname : LibC::LPWSTR, reserved : UInt32, packageinforeference : PACKAGE_INFO_REFERENCE**) : Int32

  # Params # packageinforeference : PACKAGE_INFO_REFERENCE* [In]
  fun ClosePackageInfo(packageinforeference : PACKAGE_INFO_REFERENCE*) : Int32

  # Params # packageinforeference : PACKAGE_INFO_REFERENCE* [In],flags : UInt32 [In],bufferlength : UInt32* [In],buffer : UInt8* [In],count : UInt32* [In]
  fun GetPackageInfo(packageinforeference : PACKAGE_INFO_REFERENCE*, flags : UInt32, bufferlength : UInt32*, buffer : UInt8*, count : UInt32*) : Int32

  # Params # packageinforeference : PACKAGE_INFO_REFERENCE* [In],bufferlength : UInt32* [In],buffer : UInt8* [In],count : UInt32* [In]
  fun GetPackageApplicationIds(packageinforeference : PACKAGE_INFO_REFERENCE*, bufferlength : UInt32*, buffer : UInt8*, count : UInt32*) : Int32

  # Params # packageinforeference : PACKAGE_INFO_REFERENCE* [In],flags : UInt32 [In],packagepathtype : PackagePathType [In],bufferlength : UInt32* [In],buffer : UInt8* [In],count : UInt32* [In]
  fun GetPackageInfo2(packageinforeference : PACKAGE_INFO_REFERENCE*, flags : UInt32, packagepathtype : PackagePathType, bufferlength : UInt32*, buffer : UInt8*, count : UInt32*) : Int32

  # Params # packagefullname : LibC::LPWSTR [In],ismsixpackage : LibC::BOOL* [In]
  fun CheckIsMSIXPackage(packagefullname : LibC::LPWSTR, ismsixpackage : LibC::BOOL*) : HRESULT

  # Params # user : PSID [In],packagefamilyname : LibC::LPWSTR [In],minversion : PACKAGE_VERSION [In],packagedependencyprocessorarchitectures : PackageDependencyProcessorArchitectures [In],lifetimekind : PackageDependencyLifetimeKind [In],lifetimeartifact : LibC::LPWSTR [In],options : CreatePackageDependencyOptions [In],packagedependencyid : LibC::LPWSTR* [In]
  fun TryCreatePackageDependency(user : PSID, packagefamilyname : LibC::LPWSTR, minversion : PACKAGE_VERSION, packagedependencyprocessorarchitectures : PackageDependencyProcessorArchitectures, lifetimekind : PackageDependencyLifetimeKind, lifetimeartifact : LibC::LPWSTR, options : CreatePackageDependencyOptions, packagedependencyid : LibC::LPWSTR*) : HRESULT

  # Params # packagedependencyid : LibC::LPWSTR [In]
  fun DeletePackageDependency(packagedependencyid : LibC::LPWSTR) : HRESULT

  # Params # packagedependencyid : LibC::LPWSTR [In],rank : Int32 [In],options : AddPackageDependencyOptions [In],packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__** [In],packagefullname : LibC::LPWSTR* [In]
  fun AddPackageDependency(packagedependencyid : LibC::LPWSTR, rank : Int32, options : AddPackageDependencyOptions, packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__**, packagefullname : LibC::LPWSTR*) : HRESULT

  # Params # packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__* [In]
  fun RemovePackageDependency(packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__*) : HRESULT

  # Params # packagedependencyid : LibC::LPWSTR [In],packagefullname : LibC::LPWSTR* [In]
  fun GetResolvedPackageFullNameForPackageDependency(packagedependencyid : LibC::LPWSTR, packagefullname : LibC::LPWSTR*) : HRESULT

  # Params # packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__* [In],packagedependencyid : LibC::LPWSTR* [In]
  fun GetIdForPackageDependencyContext(packagedependencycontext : PACKAGEDEPENDENCY_CONTEXT__*, packagedependencyid : LibC::LPWSTR*) : HRESULT

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyLifecycleManagement* [In]
  fun AppPolicyGetLifecycleManagement(processtoken : LibC::HANDLE, policy : AppPolicyLifecycleManagement*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyWindowingModel* [In]
  fun AppPolicyGetWindowingModel(processtoken : LibC::HANDLE, policy : AppPolicyWindowingModel*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyMediaFoundationCodecLoading* [In]
  fun AppPolicyGetMediaFoundationCodecLoading(processtoken : LibC::HANDLE, policy : AppPolicyMediaFoundationCodecLoading*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyClrCompat* [In]
  fun AppPolicyGetClrCompat(processtoken : LibC::HANDLE, policy : AppPolicyClrCompat*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyThreadInitializationType* [In]
  fun AppPolicyGetThreadInitializationType(processtoken : LibC::HANDLE, policy : AppPolicyThreadInitializationType*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyShowDeveloperDiagnostic* [In]
  fun AppPolicyGetShowDeveloperDiagnostic(processtoken : LibC::HANDLE, policy : AppPolicyShowDeveloperDiagnostic*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyProcessTerminationMethod* [In]
  fun AppPolicyGetProcessTerminationMethod(processtoken : LibC::HANDLE, policy : AppPolicyProcessTerminationMethod*) : Int32

  # Params # processtoken : LibC::HANDLE [In],policy : AppPolicyCreateFileAccess* [In]
  fun AppPolicyGetCreateFileAccess(processtoken : LibC::HANDLE, policy : AppPolicyCreateFileAccess*) : Int32

  # Params # packagefamilyname : LibC::LPWSTR [In],context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__** [In]
  fun CreatePackageVirtualizationContext(packagefamilyname : LibC::LPWSTR, context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**) : HRESULT

  # Params # context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__* [In],cookie : LibC::UINT_PTR* [In]
  fun ActivatePackageVirtualizationContext(context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, cookie : LibC::UINT_PTR*) : HRESULT

  # Params # context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__* [In]
  fun ReleasePackageVirtualizationContext(context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*) : Void

  # Params # cookie : LibC::UINT_PTR [In]
  fun DeactivatePackageVirtualizationContext(cookie : LibC::UINT_PTR) : Void

  # Params # sourcecontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__* [In],destcontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__** [In]
  fun DuplicatePackageVirtualizationContext(sourcecontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, destcontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**) : HRESULT

  # Params # 
  fun GetCurrentPackageVirtualizationContext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*

  # Params # packagefamilyname : LibC::LPWSTR [In],count : UInt32* [In],processes : LibC::HANDLE** [In]
  fun GetProcessesInVirtualizationContext(packagefamilyname : LibC::LPWSTR, count : UInt32*, processes : LibC::HANDLE**) : HRESULT
end
struct LibWin32::IAppxFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_package_writer(outputstream : IStream, settings : APPX_PACKAGE_SETTINGS*, packagewriter : IAppxPackageWriter*) : HRESULT
    @lpVtbl.value.create_package_writer.unsafe_as(Proc(IStream, APPX_PACKAGE_SETTINGS*, IAppxPackageWriter*, HRESULT)).call(outputstream, settings, packagewriter)
  end
  def create_package_reader(inputstream : IStream, packagereader : IAppxPackageReader*) : HRESULT
    @lpVtbl.value.create_package_reader.unsafe_as(Proc(IStream, IAppxPackageReader*, HRESULT)).call(inputstream, packagereader)
  end
  def create_manifest_reader(inputstream : IStream, manifestreader : IAppxManifestReader*) : HRESULT
    @lpVtbl.value.create_manifest_reader.unsafe_as(Proc(IStream, IAppxManifestReader*, HRESULT)).call(inputstream, manifestreader)
  end
  def create_block_map_reader(inputstream : IStream, blockmapreader : IAppxBlockMapReader*) : HRESULT
    @lpVtbl.value.create_block_map_reader.unsafe_as(Proc(IStream, IAppxBlockMapReader*, HRESULT)).call(inputstream, blockmapreader)
  end
  def create_validated_block_map_reader(blockmapstream : IStream, signaturefilename : LibC::LPWSTR, blockmapreader : IAppxBlockMapReader*) : HRESULT
    @lpVtbl.value.create_validated_block_map_reader.unsafe_as(Proc(IStream, LibC::LPWSTR, IAppxBlockMapReader*, HRESULT)).call(blockmapstream, signaturefilename, blockmapreader)
  end
end
struct LibWin32::IAppxFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_content_group_map_reader(inputstream : IStream, contentgroupmapreader : IAppxContentGroupMapReader*) : HRESULT
    @lpVtbl.value.create_content_group_map_reader.unsafe_as(Proc(IStream, IAppxContentGroupMapReader*, HRESULT)).call(inputstream, contentgroupmapreader)
  end
  def create_source_content_group_map_reader(inputstream : IStream, reader : IAppxSourceContentGroupMapReader*) : HRESULT
    @lpVtbl.value.create_source_content_group_map_reader.unsafe_as(Proc(IStream, IAppxSourceContentGroupMapReader*, HRESULT)).call(inputstream, reader)
  end
  def create_content_group_map_writer(stream : IStream, contentgroupmapwriter : IAppxContentGroupMapWriter*) : HRESULT
    @lpVtbl.value.create_content_group_map_writer.unsafe_as(Proc(IStream, IAppxContentGroupMapWriter*, HRESULT)).call(stream, contentgroupmapwriter)
  end
end
struct LibWin32::IAppxPackageReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_block_map(blockmapreader : IAppxBlockMapReader*) : HRESULT
    @lpVtbl.value.get_block_map.unsafe_as(Proc(IAppxBlockMapReader*, HRESULT)).call(blockmapreader)
  end
  def get_footprint_file(type : APPX_FOOTPRINT_FILE_TYPE, file : IAppxFile*) : HRESULT
    @lpVtbl.value.get_footprint_file.unsafe_as(Proc(APPX_FOOTPRINT_FILE_TYPE, IAppxFile*, HRESULT)).call(type, file)
  end
  def get_payload_file(filename : LibC::LPWSTR, file : IAppxFile*) : HRESULT
    @lpVtbl.value.get_payload_file.unsafe_as(Proc(LibC::LPWSTR, IAppxFile*, HRESULT)).call(filename, file)
  end
  def get_payload_files(filesenumerator : IAppxFilesEnumerator*) : HRESULT
    @lpVtbl.value.get_payload_files.unsafe_as(Proc(IAppxFilesEnumerator*, HRESULT)).call(filesenumerator)
  end
  def get_manifest(manifestreader : IAppxManifestReader*) : HRESULT
    @lpVtbl.value.get_manifest.unsafe_as(Proc(IAppxManifestReader*, HRESULT)).call(manifestreader)
  end
end
struct LibWin32::IAppxPackageWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_file(filename : LibC::LPWSTR, contenttype : LibC::LPWSTR, compressionoption : APPX_COMPRESSION_OPTION, inputstream : IStream) : HRESULT
    @lpVtbl.value.add_payload_file.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, APPX_COMPRESSION_OPTION, IStream, HRESULT)).call(filename, contenttype, compressionoption, inputstream)
  end
  def close(manifest : IStream) : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(IStream, HRESULT)).call(manifest)
  end
end
struct LibWin32::IAppxPackageWriter2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def close(manifest : IStream, contentgroupmap : IStream) : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(IStream, IStream, HRESULT)).call(manifest, contentgroupmap)
  end
end
struct LibWin32::IAppxPackageWriter3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_files(filecount : UInt32, payloadfiles : APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, memorylimit : UInt64) : HRESULT
    @lpVtbl.value.add_payload_files.unsafe_as(Proc(UInt32, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, HRESULT)).call(filecount, payloadfiles, memorylimit)
  end
end
struct LibWin32::IAppxFile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_compression_option(compressionoption : APPX_COMPRESSION_OPTION*) : HRESULT
    @lpVtbl.value.get_compression_option.unsafe_as(Proc(APPX_COMPRESSION_OPTION*, HRESULT)).call(compressionoption)
  end
  def get_content_type(contenttype : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_content_type.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(contenttype)
  end
  def get_name(filename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(filename)
  end
  def get_size(size : UInt64*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt64*, HRESULT)).call(size)
  end
  def get_stream(stream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(stream)
  end
end
struct LibWin32::IAppxFilesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(file : IAppxFile*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxFile*, HRESULT)).call(file)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxBlockMapReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_file(filename : LibC::LPWSTR, file : IAppxBlockMapFile*) : HRESULT
    @lpVtbl.value.get_file.unsafe_as(Proc(LibC::LPWSTR, IAppxBlockMapFile*, HRESULT)).call(filename, file)
  end
  def get_files(enumerator : IAppxBlockMapFilesEnumerator*) : HRESULT
    @lpVtbl.value.get_files.unsafe_as(Proc(IAppxBlockMapFilesEnumerator*, HRESULT)).call(enumerator)
  end
  def get_hash_method(hashmethod : IUri*) : HRESULT
    @lpVtbl.value.get_hash_method.unsafe_as(Proc(IUri*, HRESULT)).call(hashmethod)
  end
  def get_stream(blockmapstream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(blockmapstream)
  end
end
struct LibWin32::IAppxBlockMapFile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_blocks(blocks : IAppxBlockMapBlocksEnumerator*) : HRESULT
    @lpVtbl.value.get_blocks.unsafe_as(Proc(IAppxBlockMapBlocksEnumerator*, HRESULT)).call(blocks)
  end
  def get_local_file_header_size(lfhsize : UInt32*) : HRESULT
    @lpVtbl.value.get_local_file_header_size.unsafe_as(Proc(UInt32*, HRESULT)).call(lfhsize)
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_uncompressed_size(size : UInt64*) : HRESULT
    @lpVtbl.value.get_uncompressed_size.unsafe_as(Proc(UInt64*, HRESULT)).call(size)
  end
  def validate_file_hash(filestream : IStream, isvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.validate_file_hash.unsafe_as(Proc(IStream, LibC::BOOL*, HRESULT)).call(filestream, isvalid)
  end
end
struct LibWin32::IAppxBlockMapFilesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(file : IAppxBlockMapFile*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxBlockMapFile*, HRESULT)).call(file)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
end
struct LibWin32::IAppxBlockMapBlock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_hash(buffersize : UInt32*, buffer : UInt8**) : HRESULT
    @lpVtbl.value.get_hash.unsafe_as(Proc(UInt32*, UInt8**, HRESULT)).call(buffersize, buffer)
  end
  def get_compressed_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_compressed_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
end
struct LibWin32::IAppxBlockMapBlocksEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(block : IAppxBlockMapBlock*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxBlockMapBlock*, HRESULT)).call(block)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_properties(packageproperties : IAppxManifestProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IAppxManifestProperties*, HRESULT)).call(packageproperties)
  end
  def get_package_dependencies(dependencies : IAppxManifestPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_package_dependencies.unsafe_as(Proc(IAppxManifestPackageDependenciesEnumerator*, HRESULT)).call(dependencies)
  end
  def get_capabilities(capabilities : APPX_CAPABILITIES*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(APPX_CAPABILITIES*, HRESULT)).call(capabilities)
  end
  def get_resources(resources : IAppxManifestResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_resources.unsafe_as(Proc(IAppxManifestResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_device_capabilities(devicecapabilities : IAppxManifestDeviceCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_device_capabilities.unsafe_as(Proc(IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)).call(devicecapabilities)
  end
  def get_prerequisite(name : LibC::LPWSTR, value : UInt64*) : HRESULT
    @lpVtbl.value.get_prerequisite.unsafe_as(Proc(LibC::LPWSTR, UInt64*, HRESULT)).call(name, value)
  end
  def get_applications(applications : IAppxManifestApplicationsEnumerator*) : HRESULT
    @lpVtbl.value.get_applications.unsafe_as(Proc(IAppxManifestApplicationsEnumerator*, HRESULT)).call(applications)
  end
  def get_stream(manifeststream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(manifeststream)
  end
end
struct LibWin32::IAppxManifestReader2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_properties(packageproperties : IAppxManifestProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IAppxManifestProperties*, HRESULT)).call(packageproperties)
  end
  def get_package_dependencies(dependencies : IAppxManifestPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_package_dependencies.unsafe_as(Proc(IAppxManifestPackageDependenciesEnumerator*, HRESULT)).call(dependencies)
  end
  def get_capabilities(capabilities : APPX_CAPABILITIES*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(APPX_CAPABILITIES*, HRESULT)).call(capabilities)
  end
  def get_resources(resources : IAppxManifestResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_resources.unsafe_as(Proc(IAppxManifestResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_device_capabilities(devicecapabilities : IAppxManifestDeviceCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_device_capabilities.unsafe_as(Proc(IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)).call(devicecapabilities)
  end
  def get_prerequisite(name : LibC::LPWSTR, value : UInt64*) : HRESULT
    @lpVtbl.value.get_prerequisite.unsafe_as(Proc(LibC::LPWSTR, UInt64*, HRESULT)).call(name, value)
  end
  def get_applications(applications : IAppxManifestApplicationsEnumerator*) : HRESULT
    @lpVtbl.value.get_applications.unsafe_as(Proc(IAppxManifestApplicationsEnumerator*, HRESULT)).call(applications)
  end
  def get_stream(manifeststream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(manifeststream)
  end
  def get_qualified_resources(resources : IAppxManifestQualifiedResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_qualified_resources.unsafe_as(Proc(IAppxManifestQualifiedResourcesEnumerator*, HRESULT)).call(resources)
  end
end
struct LibWin32::IAppxManifestReader3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_properties(packageproperties : IAppxManifestProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IAppxManifestProperties*, HRESULT)).call(packageproperties)
  end
  def get_package_dependencies(dependencies : IAppxManifestPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_package_dependencies.unsafe_as(Proc(IAppxManifestPackageDependenciesEnumerator*, HRESULT)).call(dependencies)
  end
  def get_capabilities(capabilities : APPX_CAPABILITIES*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(APPX_CAPABILITIES*, HRESULT)).call(capabilities)
  end
  def get_resources(resources : IAppxManifestResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_resources.unsafe_as(Proc(IAppxManifestResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_device_capabilities(devicecapabilities : IAppxManifestDeviceCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_device_capabilities.unsafe_as(Proc(IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)).call(devicecapabilities)
  end
  def get_prerequisite(name : LibC::LPWSTR, value : UInt64*) : HRESULT
    @lpVtbl.value.get_prerequisite.unsafe_as(Proc(LibC::LPWSTR, UInt64*, HRESULT)).call(name, value)
  end
  def get_applications(applications : IAppxManifestApplicationsEnumerator*) : HRESULT
    @lpVtbl.value.get_applications.unsafe_as(Proc(IAppxManifestApplicationsEnumerator*, HRESULT)).call(applications)
  end
  def get_stream(manifeststream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(manifeststream)
  end
  def get_qualified_resources(resources : IAppxManifestQualifiedResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_qualified_resources.unsafe_as(Proc(IAppxManifestQualifiedResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_capabilities_by_capability_class(capabilityclass : APPX_CAPABILITY_CLASS_TYPE, capabilities : IAppxManifestCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_capabilities_by_capability_class.unsafe_as(Proc(APPX_CAPABILITY_CLASS_TYPE, IAppxManifestCapabilitiesEnumerator*, HRESULT)).call(capabilityclass, capabilities)
  end
  def get_target_device_families(targetdevicefamilies : IAppxManifestTargetDeviceFamiliesEnumerator*) : HRESULT
    @lpVtbl.value.get_target_device_families.unsafe_as(Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)).call(targetdevicefamilies)
  end
end
struct LibWin32::IAppxManifestReader4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_properties(packageproperties : IAppxManifestProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IAppxManifestProperties*, HRESULT)).call(packageproperties)
  end
  def get_package_dependencies(dependencies : IAppxManifestPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_package_dependencies.unsafe_as(Proc(IAppxManifestPackageDependenciesEnumerator*, HRESULT)).call(dependencies)
  end
  def get_capabilities(capabilities : APPX_CAPABILITIES*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(APPX_CAPABILITIES*, HRESULT)).call(capabilities)
  end
  def get_resources(resources : IAppxManifestResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_resources.unsafe_as(Proc(IAppxManifestResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_device_capabilities(devicecapabilities : IAppxManifestDeviceCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_device_capabilities.unsafe_as(Proc(IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)).call(devicecapabilities)
  end
  def get_prerequisite(name : LibC::LPWSTR, value : UInt64*) : HRESULT
    @lpVtbl.value.get_prerequisite.unsafe_as(Proc(LibC::LPWSTR, UInt64*, HRESULT)).call(name, value)
  end
  def get_applications(applications : IAppxManifestApplicationsEnumerator*) : HRESULT
    @lpVtbl.value.get_applications.unsafe_as(Proc(IAppxManifestApplicationsEnumerator*, HRESULT)).call(applications)
  end
  def get_stream(manifeststream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(manifeststream)
  end
  def get_qualified_resources(resources : IAppxManifestQualifiedResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_qualified_resources.unsafe_as(Proc(IAppxManifestQualifiedResourcesEnumerator*, HRESULT)).call(resources)
  end
  def get_capabilities_by_capability_class(capabilityclass : APPX_CAPABILITY_CLASS_TYPE, capabilities : IAppxManifestCapabilitiesEnumerator*) : HRESULT
    @lpVtbl.value.get_capabilities_by_capability_class.unsafe_as(Proc(APPX_CAPABILITY_CLASS_TYPE, IAppxManifestCapabilitiesEnumerator*, HRESULT)).call(capabilityclass, capabilities)
  end
  def get_target_device_families(targetdevicefamilies : IAppxManifestTargetDeviceFamiliesEnumerator*) : HRESULT
    @lpVtbl.value.get_target_device_families.unsafe_as(Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)).call(targetdevicefamilies)
  end
  def get_optional_package_info(optionalpackageinfo : IAppxManifestOptionalPackageInfo*) : HRESULT
    @lpVtbl.value.get_optional_package_info.unsafe_as(Proc(IAppxManifestOptionalPackageInfo*, HRESULT)).call(optionalpackageinfo)
  end
end
struct LibWin32::IAppxManifestReader5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_main_package_dependencies(mainpackagedependencies : IAppxManifestMainPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_main_package_dependencies.unsafe_as(Proc(IAppxManifestMainPackageDependenciesEnumerator*, HRESULT)).call(mainpackagedependencies)
  end
end
struct LibWin32::IAppxManifestReader6
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_non_qualified_resource_package(isnonqualifiedresourcepackage : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_non_qualified_resource_package.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isnonqualifiedresourcepackage)
  end
end
struct LibWin32::IAppxManifestReader7
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_driver_dependencies(driverdependencies : IAppxManifestDriverDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_driver_dependencies.unsafe_as(Proc(IAppxManifestDriverDependenciesEnumerator*, HRESULT)).call(driverdependencies)
  end
  def get_os_package_dependencies(ospackagedependencies : IAppxManifestOSPackageDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_os_package_dependencies.unsafe_as(Proc(IAppxManifestOSPackageDependenciesEnumerator*, HRESULT)).call(ospackagedependencies)
  end
  def get_host_runtime_dependencies(hostruntimedependencies : IAppxManifestHostRuntimeDependenciesEnumerator*) : HRESULT
    @lpVtbl.value.get_host_runtime_dependencies.unsafe_as(Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, HRESULT)).call(hostruntimedependencies)
  end
end
struct LibWin32::IAppxManifestDriverDependenciesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(driverdependency : IAppxManifestDriverDependency*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestDriverDependency*, HRESULT)).call(driverdependency)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestDriverDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_driver_constraints(driverconstraints : IAppxManifestDriverConstraintsEnumerator*) : HRESULT
    @lpVtbl.value.get_driver_constraints.unsafe_as(Proc(IAppxManifestDriverConstraintsEnumerator*, HRESULT)).call(driverconstraints)
  end
end
struct LibWin32::IAppxManifestDriverConstraintsEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(driverconstraint : IAppxManifestDriverConstraint*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestDriverConstraint*, HRESULT)).call(driverconstraint)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestDriverConstraint
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_min_version(minversion : UInt64*) : HRESULT
    @lpVtbl.value.get_min_version.unsafe_as(Proc(UInt64*, HRESULT)).call(minversion)
  end
  def get_min_date(mindate : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_min_date.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(mindate)
  end
end
struct LibWin32::IAppxManifestOSPackageDependenciesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(ospackagedependency : IAppxManifestOSPackageDependency*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestOSPackageDependency*, HRESULT)).call(ospackagedependency)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestOSPackageDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_version(version : UInt64*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt64*, HRESULT)).call(version)
  end
end
struct LibWin32::IAppxManifestHostRuntimeDependenciesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(hostruntimedependency : IAppxManifestHostRuntimeDependency*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestHostRuntimeDependency*, HRESULT)).call(hostruntimedependency)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestHostRuntimeDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_min_version(minversion : UInt64*) : HRESULT
    @lpVtbl.value.get_min_version.unsafe_as(Proc(UInt64*, HRESULT)).call(minversion)
  end
end
struct LibWin32::IAppxManifestHostRuntimeDependency2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_family_name(packagefamilyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_family_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefamilyname)
  end
end
struct LibWin32::IAppxManifestOptionalPackageInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_optional_package(isoptionalpackage : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_optional_package.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isoptionalpackage)
  end
  def get_main_package_name(mainpackagename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_main_package_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(mainpackagename)
  end
end
struct LibWin32::IAppxManifestMainPackageDependenciesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(mainpackagedependency : IAppxManifestMainPackageDependency*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestMainPackageDependency*, HRESULT)).call(mainpackagedependency)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestMainPackageDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_package_family_name(packagefamilyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_family_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefamilyname)
  end
end
struct LibWin32::IAppxManifestPackageId
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_architecture(architecture : APPX_PACKAGE_ARCHITECTURE*) : HRESULT
    @lpVtbl.value.get_architecture.unsafe_as(Proc(APPX_PACKAGE_ARCHITECTURE*, HRESULT)).call(architecture)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_version(packageversion : UInt64*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt64*, HRESULT)).call(packageversion)
  end
  def get_resource_id(resourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_resource_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(resourceid)
  end
  def compare_publisher(other : LibC::LPWSTR, issame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_publisher.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(other, issame)
  end
  def get_package_full_name(packagefullname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_full_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefullname)
  end
  def get_package_family_name(packagefamilyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_family_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefamilyname)
  end
end
struct LibWin32::IAppxManifestPackageId2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_architecture(architecture : APPX_PACKAGE_ARCHITECTURE*) : HRESULT
    @lpVtbl.value.get_architecture.unsafe_as(Proc(APPX_PACKAGE_ARCHITECTURE*, HRESULT)).call(architecture)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_version(packageversion : UInt64*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt64*, HRESULT)).call(packageversion)
  end
  def get_resource_id(resourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_resource_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(resourceid)
  end
  def compare_publisher(other : LibC::LPWSTR, issame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_publisher.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(other, issame)
  end
  def get_package_full_name(packagefullname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_full_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefullname)
  end
  def get_package_family_name(packagefamilyname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_package_family_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(packagefamilyname)
  end
  def get_architecture2(architecture : APPX_PACKAGE_ARCHITECTURE2*) : HRESULT
    @lpVtbl.value.get_architecture2.unsafe_as(Proc(APPX_PACKAGE_ARCHITECTURE2*, HRESULT)).call(architecture)
  end
end
struct LibWin32::IAppxManifestProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_bool_value(name : LibC::LPWSTR, value : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_bool_value.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(name, value)
  end
  def get_string_value(name : LibC::LPWSTR, value : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(name, value)
  end
end
struct LibWin32::IAppxManifestTargetDeviceFamiliesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(targetdevicefamily : IAppxManifestTargetDeviceFamily*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestTargetDeviceFamily*, HRESULT)).call(targetdevicefamily)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestTargetDeviceFamily
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_min_version(minversion : UInt64*) : HRESULT
    @lpVtbl.value.get_min_version.unsafe_as(Proc(UInt64*, HRESULT)).call(minversion)
  end
  def get_max_version_tested(maxversiontested : UInt64*) : HRESULT
    @lpVtbl.value.get_max_version_tested.unsafe_as(Proc(UInt64*, HRESULT)).call(maxversiontested)
  end
end
struct LibWin32::IAppxManifestPackageDependenciesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(dependency : IAppxManifestPackageDependency*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestPackageDependency*, HRESULT)).call(dependency)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestPackageDependency
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_min_version(minversion : UInt64*) : HRESULT
    @lpVtbl.value.get_min_version.unsafe_as(Proc(UInt64*, HRESULT)).call(minversion)
  end
end
struct LibWin32::IAppxManifestPackageDependency2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(name)
  end
  def get_publisher(publisher : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_publisher.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(publisher)
  end
  def get_min_version(minversion : UInt64*) : HRESULT
    @lpVtbl.value.get_min_version.unsafe_as(Proc(UInt64*, HRESULT)).call(minversion)
  end
  def get_max_major_version_tested(maxmajorversiontested : UInt16*) : HRESULT
    @lpVtbl.value.get_max_major_version_tested.unsafe_as(Proc(UInt16*, HRESULT)).call(maxmajorversiontested)
  end
end
struct LibWin32::IAppxManifestPackageDependency3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_optional(isoptional : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_optional.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isoptional)
  end
end
struct LibWin32::IAppxManifestResourcesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(resource : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(resource)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestDeviceCapabilitiesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(devicecapability : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(devicecapability)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestCapabilitiesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(capability : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(capability)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestApplicationsEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(application : IAppxManifestApplication*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestApplication*, HRESULT)).call(application)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestApplication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_string_value(name : LibC::LPWSTR, value : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(name, value)
  end
  def get_app_user_model_id(appusermodelid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_app_user_model_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(appusermodelid)
  end
end
struct LibWin32::IAppxManifestQualifiedResourcesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(resource : IAppxManifestQualifiedResource*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxManifestQualifiedResource*, HRESULT)).call(resource)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxManifestQualifiedResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_language(language : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(language)
  end
  def get_scale(scale : UInt32*) : HRESULT
    @lpVtbl.value.get_scale.unsafe_as(Proc(UInt32*, HRESULT)).call(scale)
  end
  def get_dx_feature_level(dxfeaturelevel : DX_FEATURE_LEVEL*) : HRESULT
    @lpVtbl.value.get_dx_feature_level.unsafe_as(Proc(DX_FEATURE_LEVEL*, HRESULT)).call(dxfeaturelevel)
  end
end
struct LibWin32::IAppxBundleFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_bundle_writer(outputstream : IStream, bundleversion : UInt64, bundlewriter : IAppxBundleWriter*) : HRESULT
    @lpVtbl.value.create_bundle_writer.unsafe_as(Proc(IStream, UInt64, IAppxBundleWriter*, HRESULT)).call(outputstream, bundleversion, bundlewriter)
  end
  def create_bundle_reader(inputstream : IStream, bundlereader : IAppxBundleReader*) : HRESULT
    @lpVtbl.value.create_bundle_reader.unsafe_as(Proc(IStream, IAppxBundleReader*, HRESULT)).call(inputstream, bundlereader)
  end
  def create_bundle_manifest_reader(inputstream : IStream, manifestreader : IAppxBundleManifestReader*) : HRESULT
    @lpVtbl.value.create_bundle_manifest_reader.unsafe_as(Proc(IStream, IAppxBundleManifestReader*, HRESULT)).call(inputstream, manifestreader)
  end
end
struct LibWin32::IAppxBundleWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_package(filename : LibC::LPWSTR, packagestream : IStream) : HRESULT
    @lpVtbl.value.add_payload_package.unsafe_as(Proc(LibC::LPWSTR, IStream, HRESULT)).call(filename, packagestream)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAppxBundleWriter2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_external_package_reference(filename : LibC::LPWSTR, inputstream : IStream) : HRESULT
    @lpVtbl.value.add_external_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, HRESULT)).call(filename, inputstream)
  end
end
struct LibWin32::IAppxBundleWriter3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_package_reference(filename : LibC::LPWSTR, inputstream : IStream) : HRESULT
    @lpVtbl.value.add_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, HRESULT)).call(filename, inputstream)
  end
  def close(hashmethodstring : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(hashmethodstring)
  end
end
struct LibWin32::IAppxBundleWriter4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_package(filename : LibC::LPWSTR, packagestream : IStream, isdefaultapplicablepackage : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_payload_package.unsafe_as(Proc(LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)).call(filename, packagestream, isdefaultapplicablepackage)
  end
  def add_package_reference(filename : LibC::LPWSTR, inputstream : IStream, isdefaultapplicablepackage : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)).call(filename, inputstream, isdefaultapplicablepackage)
  end
  def add_external_package_reference(filename : LibC::LPWSTR, inputstream : IStream, isdefaultapplicablepackage : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_external_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)).call(filename, inputstream, isdefaultapplicablepackage)
  end
end
struct LibWin32::IAppxBundleReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_footprint_file(filetype : APPX_BUNDLE_FOOTPRINT_FILE_TYPE, footprintfile : IAppxFile*) : HRESULT
    @lpVtbl.value.get_footprint_file.unsafe_as(Proc(APPX_BUNDLE_FOOTPRINT_FILE_TYPE, IAppxFile*, HRESULT)).call(filetype, footprintfile)
  end
  def get_block_map(blockmapreader : IAppxBlockMapReader*) : HRESULT
    @lpVtbl.value.get_block_map.unsafe_as(Proc(IAppxBlockMapReader*, HRESULT)).call(blockmapreader)
  end
  def get_manifest(manifestreader : IAppxBundleManifestReader*) : HRESULT
    @lpVtbl.value.get_manifest.unsafe_as(Proc(IAppxBundleManifestReader*, HRESULT)).call(manifestreader)
  end
  def get_payload_packages(payloadpackages : IAppxFilesEnumerator*) : HRESULT
    @lpVtbl.value.get_payload_packages.unsafe_as(Proc(IAppxFilesEnumerator*, HRESULT)).call(payloadpackages)
  end
  def get_payload_package(filename : LibC::LPWSTR, payloadpackage : IAppxFile*) : HRESULT
    @lpVtbl.value.get_payload_package.unsafe_as(Proc(LibC::LPWSTR, IAppxFile*, HRESULT)).call(filename, payloadpackage)
  end
end
struct LibWin32::IAppxBundleManifestReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_package_info_items(packageinfoitems : IAppxBundleManifestPackageInfoEnumerator*) : HRESULT
    @lpVtbl.value.get_package_info_items.unsafe_as(Proc(IAppxBundleManifestPackageInfoEnumerator*, HRESULT)).call(packageinfoitems)
  end
  def get_stream(manifeststream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(manifeststream)
  end
end
struct LibWin32::IAppxBundleManifestReader2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_optional_bundles(optionalbundles : IAppxBundleManifestOptionalBundleInfoEnumerator*) : HRESULT
    @lpVtbl.value.get_optional_bundles.unsafe_as(Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, HRESULT)).call(optionalbundles)
  end
end
struct LibWin32::IAppxBundleManifestPackageInfoEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(packageinfo : IAppxBundleManifestPackageInfo*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxBundleManifestPackageInfo*, HRESULT)).call(packageinfo)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxBundleManifestPackageInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_type(packagetype : APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*) : HRESULT
    @lpVtbl.value.get_package_type.unsafe_as(Proc(APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*, HRESULT)).call(packagetype)
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_file_name(filename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(filename)
  end
  def get_offset(offset : UInt64*) : HRESULT
    @lpVtbl.value.get_offset.unsafe_as(Proc(UInt64*, HRESULT)).call(offset)
  end
  def get_size(size : UInt64*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt64*, HRESULT)).call(size)
  end
  def get_resources(resources : IAppxManifestQualifiedResourcesEnumerator*) : HRESULT
    @lpVtbl.value.get_resources.unsafe_as(Proc(IAppxManifestQualifiedResourcesEnumerator*, HRESULT)).call(resources)
  end
end
struct LibWin32::IAppxBundleManifestPackageInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_package_reference(ispackagereference : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_package_reference.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(ispackagereference)
  end
  def get_is_non_qualified_resource_package(isnonqualifiedresourcepackage : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_non_qualified_resource_package.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isnonqualifiedresourcepackage)
  end
  def get_is_default_applicable_package(isdefaultapplicablepackage : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_default_applicable_package.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isdefaultapplicablepackage)
  end
end
struct LibWin32::IAppxBundleManifestPackageInfo3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_target_device_families(targetdevicefamilies : IAppxManifestTargetDeviceFamiliesEnumerator*) : HRESULT
    @lpVtbl.value.get_target_device_families.unsafe_as(Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)).call(targetdevicefamilies)
  end
end
struct LibWin32::IAppxBundleManifestPackageInfo4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_stub(isstub : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_stub.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isstub)
  end
end
struct LibWin32::IAppxBundleManifestOptionalBundleInfoEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(optionalbundle : IAppxBundleManifestOptionalBundleInfo*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxBundleManifestOptionalBundleInfo*, HRESULT)).call(optionalbundle)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxBundleManifestOptionalBundleInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_id(packageid : IAppxManifestPackageId*) : HRESULT
    @lpVtbl.value.get_package_id.unsafe_as(Proc(IAppxManifestPackageId*, HRESULT)).call(packageid)
  end
  def get_file_name(filename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(filename)
  end
  def get_package_info_items(packageinfoitems : IAppxBundleManifestPackageInfoEnumerator*) : HRESULT
    @lpVtbl.value.get_package_info_items.unsafe_as(Proc(IAppxBundleManifestPackageInfoEnumerator*, HRESULT)).call(packageinfoitems)
  end
end
struct LibWin32::IAppxContentGroupFilesEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(file : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(file)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxContentGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(groupname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(groupname)
  end
  def get_files(enumerator : IAppxContentGroupFilesEnumerator*) : HRESULT
    @lpVtbl.value.get_files.unsafe_as(Proc(IAppxContentGroupFilesEnumerator*, HRESULT)).call(enumerator)
  end
end
struct LibWin32::IAppxContentGroupsEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current(stream : IAppxContentGroup*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IAppxContentGroup*, HRESULT)).call(stream)
  end
  def get_has_current(hascurrent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_has_current.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hascurrent)
  end
  def move_next(hasnext : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hasnext)
  end
end
struct LibWin32::IAppxContentGroupMapReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_required_group(requiredgroup : IAppxContentGroup*) : HRESULT
    @lpVtbl.value.get_required_group.unsafe_as(Proc(IAppxContentGroup*, HRESULT)).call(requiredgroup)
  end
  def get_automatic_groups(automaticgroupsenumerator : IAppxContentGroupsEnumerator*) : HRESULT
    @lpVtbl.value.get_automatic_groups.unsafe_as(Proc(IAppxContentGroupsEnumerator*, HRESULT)).call(automaticgroupsenumerator)
  end
end
struct LibWin32::IAppxSourceContentGroupMapReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_required_group(requiredgroup : IAppxContentGroup*) : HRESULT
    @lpVtbl.value.get_required_group.unsafe_as(Proc(IAppxContentGroup*, HRESULT)).call(requiredgroup)
  end
  def get_automatic_groups(automaticgroupsenumerator : IAppxContentGroupsEnumerator*) : HRESULT
    @lpVtbl.value.get_automatic_groups.unsafe_as(Proc(IAppxContentGroupsEnumerator*, HRESULT)).call(automaticgroupsenumerator)
  end
end
struct LibWin32::IAppxContentGroupMapWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_automatic_group(groupname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_automatic_group.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(groupname)
  end
  def add_automatic_file(filename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_automatic_file.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(filename)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAppxPackagingDiagnosticEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def report_context_change(changetype : APPX_PACKAGING_CONTEXT_CHANGE_TYPE, contextid : Int32, contextname : PSTR, contextmessage : LibC::LPWSTR, detailsmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.report_context_change.unsafe_as(Proc(APPX_PACKAGING_CONTEXT_CHANGE_TYPE, Int32, PSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(changetype, contextid, contextname, contextmessage, detailsmessage)
  end
  def report_error(errormessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.report_error.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(errormessage)
  end
end
struct LibWin32::IAppxPackagingDiagnosticEventSinkManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_sink_for_process(sink : IAppxPackagingDiagnosticEventSink) : HRESULT
    @lpVtbl.value.set_sink_for_process.unsafe_as(Proc(IAppxPackagingDiagnosticEventSink, HRESULT)).call(sink)
  end
end
struct LibWin32::IAppxEncryptionFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def encrypt_package(inputstream : IStream, outputstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*) : HRESULT
    @lpVtbl.value.encrypt_package.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)).call(inputstream, outputstream, settings, keyinfo, exemptedfiles)
  end
  def decrypt_package(inputstream : IStream, outputstream : IStream, keyinfo : APPX_KEY_INFO*) : HRESULT
    @lpVtbl.value.decrypt_package.unsafe_as(Proc(IStream, IStream, APPX_KEY_INFO*, HRESULT)).call(inputstream, outputstream, keyinfo)
  end
  def create_encrypted_package_writer(outputstream : IStream, manifeststream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, packagewriter : IAppxEncryptedPackageWriter*) : HRESULT
    @lpVtbl.value.create_encrypted_package_writer.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)).call(outputstream, manifeststream, settings, keyinfo, exemptedfiles, packagewriter)
  end
  def create_encrypted_package_reader(inputstream : IStream, keyinfo : APPX_KEY_INFO*, packagereader : IAppxPackageReader*) : HRESULT
    @lpVtbl.value.create_encrypted_package_reader.unsafe_as(Proc(IStream, APPX_KEY_INFO*, IAppxPackageReader*, HRESULT)).call(inputstream, keyinfo, packagereader)
  end
  def encrypt_bundle(inputstream : IStream, outputstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*) : HRESULT
    @lpVtbl.value.encrypt_bundle.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)).call(inputstream, outputstream, settings, keyinfo, exemptedfiles)
  end
  def decrypt_bundle(inputstream : IStream, outputstream : IStream, keyinfo : APPX_KEY_INFO*) : HRESULT
    @lpVtbl.value.decrypt_bundle.unsafe_as(Proc(IStream, IStream, APPX_KEY_INFO*, HRESULT)).call(inputstream, outputstream, keyinfo)
  end
  def create_encrypted_bundle_writer(outputstream : IStream, bundleversion : UInt64, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, bundlewriter : IAppxEncryptedBundleWriter*) : HRESULT
    @lpVtbl.value.create_encrypted_bundle_writer.unsafe_as(Proc(IStream, UInt64, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedBundleWriter*, HRESULT)).call(outputstream, bundleversion, settings, keyinfo, exemptedfiles, bundlewriter)
  end
  def create_encrypted_bundle_reader(inputstream : IStream, keyinfo : APPX_KEY_INFO*, bundlereader : IAppxBundleReader*) : HRESULT
    @lpVtbl.value.create_encrypted_bundle_reader.unsafe_as(Proc(IStream, APPX_KEY_INFO*, IAppxBundleReader*, HRESULT)).call(inputstream, keyinfo, bundlereader)
  end
end
struct LibWin32::IAppxEncryptionFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_encrypted_package_writer(outputstream : IStream, manifeststream : IStream, contentgroupmapstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, packagewriter : IAppxEncryptedPackageWriter*) : HRESULT
    @lpVtbl.value.create_encrypted_package_writer.unsafe_as(Proc(IStream, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)).call(outputstream, manifeststream, contentgroupmapstream, settings, keyinfo, exemptedfiles, packagewriter)
  end
end
struct LibWin32::IAppxEncryptionFactory3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def encrypt_package(inputstream : IStream, outputstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*) : HRESULT
    @lpVtbl.value.encrypt_package.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)).call(inputstream, outputstream, settings, keyinfo, exemptedfiles)
  end
  def create_encrypted_package_writer(outputstream : IStream, manifeststream : IStream, contentgroupmapstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, packagewriter : IAppxEncryptedPackageWriter*) : HRESULT
    @lpVtbl.value.create_encrypted_package_writer.unsafe_as(Proc(IStream, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)).call(outputstream, manifeststream, contentgroupmapstream, settings, keyinfo, exemptedfiles, packagewriter)
  end
  def encrypt_bundle(inputstream : IStream, outputstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*) : HRESULT
    @lpVtbl.value.encrypt_bundle.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)).call(inputstream, outputstream, settings, keyinfo, exemptedfiles)
  end
  def create_encrypted_bundle_writer(outputstream : IStream, bundleversion : UInt64, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, bundlewriter : IAppxEncryptedBundleWriter*) : HRESULT
    @lpVtbl.value.create_encrypted_bundle_writer.unsafe_as(Proc(IStream, UInt64, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedBundleWriter*, HRESULT)).call(outputstream, bundleversion, settings, keyinfo, exemptedfiles, bundlewriter)
  end
end
struct LibWin32::IAppxEncryptionFactory4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def encrypt_package(inputstream : IStream, outputstream : IStream, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*, exemptedfiles : APPX_ENCRYPTED_EXEMPTIONS*, memorylimit : UInt64) : HRESULT
    @lpVtbl.value.encrypt_package.unsafe_as(Proc(IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, UInt64, HRESULT)).call(inputstream, outputstream, settings, keyinfo, exemptedfiles, memorylimit)
  end
end
struct LibWin32::IAppxEncryptedPackageWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_file_encrypted(filename : LibC::LPWSTR, compressionoption : APPX_COMPRESSION_OPTION, inputstream : IStream) : HRESULT
    @lpVtbl.value.add_payload_file_encrypted.unsafe_as(Proc(LibC::LPWSTR, APPX_COMPRESSION_OPTION, IStream, HRESULT)).call(filename, compressionoption, inputstream)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAppxEncryptedPackageWriter2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_files_encrypted(filecount : UInt32, payloadfiles : APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, memorylimit : UInt64) : HRESULT
    @lpVtbl.value.add_payload_files_encrypted.unsafe_as(Proc(UInt32, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, HRESULT)).call(filecount, payloadfiles, memorylimit)
  end
end
struct LibWin32::IAppxEncryptedBundleWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_package_encrypted(filename : LibC::LPWSTR, packagestream : IStream) : HRESULT
    @lpVtbl.value.add_payload_package_encrypted.unsafe_as(Proc(LibC::LPWSTR, IStream, HRESULT)).call(filename, packagestream)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAppxEncryptedBundleWriter2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_external_package_reference(filename : LibC::LPWSTR, inputstream : IStream) : HRESULT
    @lpVtbl.value.add_external_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, HRESULT)).call(filename, inputstream)
  end
end
struct LibWin32::IAppxEncryptedBundleWriter3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_payload_package_encrypted(filename : LibC::LPWSTR, packagestream : IStream, isdefaultapplicablepackage : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_payload_package_encrypted.unsafe_as(Proc(LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)).call(filename, packagestream, isdefaultapplicablepackage)
  end
  def add_external_package_reference(filename : LibC::LPWSTR, inputstream : IStream, isdefaultapplicablepackage : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_external_package_reference.unsafe_as(Proc(LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)).call(filename, inputstream, isdefaultapplicablepackage)
  end
end
struct LibWin32::IAppxPackageEditor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_working_directory(workingdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_working_directory.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(workingdirectory)
  end
  def create_delta_package(updatedpackagestream : IStream, baselinepackagestream : IStream, deltapackagestream : IStream) : HRESULT
    @lpVtbl.value.create_delta_package.unsafe_as(Proc(IStream, IStream, IStream, HRESULT)).call(updatedpackagestream, baselinepackagestream, deltapackagestream)
  end
  def create_delta_package_using_baseline_block_map(updatedpackagestream : IStream, baselineblockmapstream : IStream, baselinepackagefullname : LibC::LPWSTR, deltapackagestream : IStream) : HRESULT
    @lpVtbl.value.create_delta_package_using_baseline_block_map.unsafe_as(Proc(IStream, IStream, LibC::LPWSTR, IStream, HRESULT)).call(updatedpackagestream, baselineblockmapstream, baselinepackagefullname, deltapackagestream)
  end
  def update_package(baselinepackagestream : IStream, deltapackagestream : IStream, updateoption : APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION) : HRESULT
    @lpVtbl.value.update_package.unsafe_as(Proc(IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, HRESULT)).call(baselinepackagestream, deltapackagestream, updateoption)
  end
  def update_encrypted_package(baselineencryptedpackagestream : IStream, deltapackagestream : IStream, updateoption : APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, settings : APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyinfo : APPX_KEY_INFO*) : HRESULT
    @lpVtbl.value.update_encrypted_package.unsafe_as(Proc(IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, HRESULT)).call(baselineencryptedpackagestream, deltapackagestream, updateoption, settings, keyinfo)
  end
  def update_package_manifest(packagestream : IStream, updatedmanifeststream : IStream, ispackageencrypted : LibC::BOOL, options : APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS) : HRESULT
    @lpVtbl.value.update_package_manifest.unsafe_as(Proc(IStream, IStream, LibC::BOOL, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS, HRESULT)).call(packagestream, updatedmanifeststream, ispackageencrypted, options)
  end
end
