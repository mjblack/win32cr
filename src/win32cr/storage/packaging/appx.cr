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
  AppxFactory = LibC::GUID.new(0x5842a140_u32, 0xff9f_u16, 0x4166_u16, StaticArray[0x8f_u8, 0x5c_u8, 0x62_u8, 0xf5_u8, 0xb7_u8, 0xb0_u8, 0xc7_u8, 0x81_u8])
  AppxBundleFactory = LibC::GUID.new(0x378e0446_u32, 0x5384_u16, 0x43b7_u16, StaticArray[0x88_u8, 0x77_u8, 0xe7_u8, 0xdb_u8, 0xdd_u8, 0x88_u8, 0x34_u8, 0x46_u8])
  AppxPackagingDiagnosticEventSinkManager = LibC::GUID.new(0x50ca0a46_u32, 0x1588_u16, 0x4161_u16, StaticArray[0x8e_u8, 0xd2_u8, 0xef_u8, 0x9e_u8, 0x46_u8, 0x9c_u8, 0xed_u8, 0x5d_u8])
  AppxEncryptionFactory = LibC::GUID.new(0xdc664fdd_u32, 0xd868_u16, 0x46ee_u16, StaticArray[0x87_u8, 0x80_u8, 0x8d_u8, 0x19_u8, 0x6c_u8, 0xb7_u8, 0x39_u8, 0xf7_u8])
  AppxPackageEditor = LibC::GUID.new(0xf004f2ca_u32, 0xaebc_u16, 0x4b0d_u16, StaticArray[0xbf_u8, 0x58_u8, 0xe5_u8, 0x16_u8, 0xd5_u8, 0xbc_u8, 0xc0_u8, 0xab_u8])


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
    query_interface : Proc(IAppxFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxFactory*, UInt32)
    release : Proc(IAppxFactory*, UInt32)
    create_package_writer : Proc(IAppxFactory*, IStream, APPX_PACKAGE_SETTINGS*, IAppxPackageWriter*, HRESULT)
    create_package_reader : Proc(IAppxFactory*, IStream, IAppxPackageReader*, HRESULT)
    create_manifest_reader : Proc(IAppxFactory*, IStream, IAppxManifestReader*, HRESULT)
    create_block_map_reader : Proc(IAppxFactory*, IStream, IAppxBlockMapReader*, HRESULT)
    create_validated_block_map_reader : Proc(IAppxFactory*, IStream, LibC::LPWSTR, IAppxBlockMapReader*, HRESULT)
  end

  IAppxFactory_GUID = LibC::GUID.new("beb94909-e451-438b-b5a7-d79e767b75d8")
  CLSID_IAppxFactory = "beb94909-e451-438b-b5a7-d79e767b75d8"
  struct IAppxFactory
    lpVtbl : IAppxFactoryVTbl*
  end

  struct IAppxFactory2VTbl
    query_interface : Proc(IAppxFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxFactory2*, UInt32)
    release : Proc(IAppxFactory2*, UInt32)
    create_content_group_map_reader : Proc(IAppxFactory2*, IStream, IAppxContentGroupMapReader*, HRESULT)
    create_source_content_group_map_reader : Proc(IAppxFactory2*, IStream, IAppxSourceContentGroupMapReader*, HRESULT)
    create_content_group_map_writer : Proc(IAppxFactory2*, IStream, IAppxContentGroupMapWriter*, HRESULT)
  end

  IAppxFactory2_GUID = LibC::GUID.new("f1346df2-c282-4e22-b918-743a929a8d55")
  CLSID_IAppxFactory2 = "f1346df2-c282-4e22-b918-743a929a8d55"
  struct IAppxFactory2
    lpVtbl : IAppxFactory2VTbl*
  end

  struct IAppxPackageReaderVTbl
    query_interface : Proc(IAppxPackageReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackageReader*, UInt32)
    release : Proc(IAppxPackageReader*, UInt32)
    get_block_map : Proc(IAppxPackageReader*, IAppxBlockMapReader*, HRESULT)
    get_footprint_file : Proc(IAppxPackageReader*, APPX_FOOTPRINT_FILE_TYPE, IAppxFile*, HRESULT)
    get_payload_file : Proc(IAppxPackageReader*, LibC::LPWSTR, IAppxFile*, HRESULT)
    get_payload_files : Proc(IAppxPackageReader*, IAppxFilesEnumerator*, HRESULT)
    get_manifest : Proc(IAppxPackageReader*, IAppxManifestReader*, HRESULT)
  end

  IAppxPackageReader_GUID = LibC::GUID.new("b5c49650-99bc-481c-9a34-3d53a4106708")
  CLSID_IAppxPackageReader = "b5c49650-99bc-481c-9a34-3d53a4106708"
  struct IAppxPackageReader
    lpVtbl : IAppxPackageReaderVTbl*
  end

  struct IAppxPackageWriterVTbl
    query_interface : Proc(IAppxPackageWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackageWriter*, UInt32)
    release : Proc(IAppxPackageWriter*, UInt32)
    add_payload_file : Proc(IAppxPackageWriter*, LibC::LPWSTR, LibC::LPWSTR, APPX_COMPRESSION_OPTION, IStream, HRESULT)
    close : Proc(IAppxPackageWriter*, IStream, HRESULT)
  end

  IAppxPackageWriter_GUID = LibC::GUID.new("9099e33b-246f-41e4-881a-008eb613f858")
  CLSID_IAppxPackageWriter = "9099e33b-246f-41e4-881a-008eb613f858"
  struct IAppxPackageWriter
    lpVtbl : IAppxPackageWriterVTbl*
  end

  struct IAppxPackageWriter2VTbl
    query_interface : Proc(IAppxPackageWriter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackageWriter2*, UInt32)
    release : Proc(IAppxPackageWriter2*, UInt32)
    close : Proc(IAppxPackageWriter2*, IStream, IStream, HRESULT)
  end

  IAppxPackageWriter2_GUID = LibC::GUID.new("2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8")
  CLSID_IAppxPackageWriter2 = "2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8"
  struct IAppxPackageWriter2
    lpVtbl : IAppxPackageWriter2VTbl*
  end

  struct IAppxPackageWriter3VTbl
    query_interface : Proc(IAppxPackageWriter3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackageWriter3*, UInt32)
    release : Proc(IAppxPackageWriter3*, UInt32)
    add_payload_files : Proc(IAppxPackageWriter3*, UInt32, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, HRESULT)
  end

  IAppxPackageWriter3_GUID = LibC::GUID.new("a83aacd3-41c0-4501-b8a3-74164f50b2fd")
  CLSID_IAppxPackageWriter3 = "a83aacd3-41c0-4501-b8a3-74164f50b2fd"
  struct IAppxPackageWriter3
    lpVtbl : IAppxPackageWriter3VTbl*
  end

  struct IAppxFileVTbl
    query_interface : Proc(IAppxFile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxFile*, UInt32)
    release : Proc(IAppxFile*, UInt32)
    get_compression_option : Proc(IAppxFile*, APPX_COMPRESSION_OPTION*, HRESULT)
    get_content_type : Proc(IAppxFile*, LibC::LPWSTR*, HRESULT)
    get_name : Proc(IAppxFile*, LibC::LPWSTR*, HRESULT)
    get_size : Proc(IAppxFile*, UInt64*, HRESULT)
    get_stream : Proc(IAppxFile*, IStream*, HRESULT)
  end

  IAppxFile_GUID = LibC::GUID.new("91df827b-94fd-468f-827b-57f41b2f6f2e")
  CLSID_IAppxFile = "91df827b-94fd-468f-827b-57f41b2f6f2e"
  struct IAppxFile
    lpVtbl : IAppxFileVTbl*
  end

  struct IAppxFilesEnumeratorVTbl
    query_interface : Proc(IAppxFilesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxFilesEnumerator*, UInt32)
    release : Proc(IAppxFilesEnumerator*, UInt32)
    get_current : Proc(IAppxFilesEnumerator*, IAppxFile*, HRESULT)
    get_has_current : Proc(IAppxFilesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxFilesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxFilesEnumerator_GUID = LibC::GUID.new("f007eeaf-9831-411c-9847-917cdc62d1fe")
  CLSID_IAppxFilesEnumerator = "f007eeaf-9831-411c-9847-917cdc62d1fe"
  struct IAppxFilesEnumerator
    lpVtbl : IAppxFilesEnumeratorVTbl*
  end

  struct IAppxBlockMapReaderVTbl
    query_interface : Proc(IAppxBlockMapReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBlockMapReader*, UInt32)
    release : Proc(IAppxBlockMapReader*, UInt32)
    get_file : Proc(IAppxBlockMapReader*, LibC::LPWSTR, IAppxBlockMapFile*, HRESULT)
    get_files : Proc(IAppxBlockMapReader*, IAppxBlockMapFilesEnumerator*, HRESULT)
    get_hash_method : Proc(IAppxBlockMapReader*, IUri*, HRESULT)
    get_stream : Proc(IAppxBlockMapReader*, IStream*, HRESULT)
  end

  IAppxBlockMapReader_GUID = LibC::GUID.new("5efec991-bca3-42d1-9ec2-e92d609ec22a")
  CLSID_IAppxBlockMapReader = "5efec991-bca3-42d1-9ec2-e92d609ec22a"
  struct IAppxBlockMapReader
    lpVtbl : IAppxBlockMapReaderVTbl*
  end

  struct IAppxBlockMapFileVTbl
    query_interface : Proc(IAppxBlockMapFile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBlockMapFile*, UInt32)
    release : Proc(IAppxBlockMapFile*, UInt32)
    get_blocks : Proc(IAppxBlockMapFile*, IAppxBlockMapBlocksEnumerator*, HRESULT)
    get_local_file_header_size : Proc(IAppxBlockMapFile*, UInt32*, HRESULT)
    get_name : Proc(IAppxBlockMapFile*, LibC::LPWSTR*, HRESULT)
    get_uncompressed_size : Proc(IAppxBlockMapFile*, UInt64*, HRESULT)
    validate_file_hash : Proc(IAppxBlockMapFile*, IStream, LibC::BOOL*, HRESULT)
  end

  IAppxBlockMapFile_GUID = LibC::GUID.new("277672ac-4f63-42c1-8abc-beae3600eb59")
  CLSID_IAppxBlockMapFile = "277672ac-4f63-42c1-8abc-beae3600eb59"
  struct IAppxBlockMapFile
    lpVtbl : IAppxBlockMapFileVTbl*
  end

  struct IAppxBlockMapFilesEnumeratorVTbl
    query_interface : Proc(IAppxBlockMapFilesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBlockMapFilesEnumerator*, UInt32)
    release : Proc(IAppxBlockMapFilesEnumerator*, UInt32)
    get_current : Proc(IAppxBlockMapFilesEnumerator*, IAppxBlockMapFile*, HRESULT)
    get_has_current : Proc(IAppxBlockMapFilesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxBlockMapFilesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxBlockMapFilesEnumerator_GUID = LibC::GUID.new("02b856a2-4262-4070-bacb-1a8cbbc42305")
  CLSID_IAppxBlockMapFilesEnumerator = "02b856a2-4262-4070-bacb-1a8cbbc42305"
  struct IAppxBlockMapFilesEnumerator
    lpVtbl : IAppxBlockMapFilesEnumeratorVTbl*
  end

  struct IAppxBlockMapBlockVTbl
    query_interface : Proc(IAppxBlockMapBlock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBlockMapBlock*, UInt32)
    release : Proc(IAppxBlockMapBlock*, UInt32)
    get_hash : Proc(IAppxBlockMapBlock*, UInt32*, UInt8**, HRESULT)
    get_compressed_size : Proc(IAppxBlockMapBlock*, UInt32*, HRESULT)
  end

  IAppxBlockMapBlock_GUID = LibC::GUID.new("75cf3930-3244-4fe0-a8c8-e0bcb270b889")
  CLSID_IAppxBlockMapBlock = "75cf3930-3244-4fe0-a8c8-e0bcb270b889"
  struct IAppxBlockMapBlock
    lpVtbl : IAppxBlockMapBlockVTbl*
  end

  struct IAppxBlockMapBlocksEnumeratorVTbl
    query_interface : Proc(IAppxBlockMapBlocksEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBlockMapBlocksEnumerator*, UInt32)
    release : Proc(IAppxBlockMapBlocksEnumerator*, UInt32)
    get_current : Proc(IAppxBlockMapBlocksEnumerator*, IAppxBlockMapBlock*, HRESULT)
    get_has_current : Proc(IAppxBlockMapBlocksEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxBlockMapBlocksEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxBlockMapBlocksEnumerator_GUID = LibC::GUID.new("6b429b5b-36ef-479e-b9eb-0c1482b49e16")
  CLSID_IAppxBlockMapBlocksEnumerator = "6b429b5b-36ef-479e-b9eb-0c1482b49e16"
  struct IAppxBlockMapBlocksEnumerator
    lpVtbl : IAppxBlockMapBlocksEnumeratorVTbl*
  end

  struct IAppxManifestReaderVTbl
    query_interface : Proc(IAppxManifestReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader*, UInt32)
    release : Proc(IAppxManifestReader*, UInt32)
    get_package_id : Proc(IAppxManifestReader*, IAppxManifestPackageId*, HRESULT)
    get_properties : Proc(IAppxManifestReader*, IAppxManifestProperties*, HRESULT)
    get_package_dependencies : Proc(IAppxManifestReader*, IAppxManifestPackageDependenciesEnumerator*, HRESULT)
    get_capabilities : Proc(IAppxManifestReader*, APPX_CAPABILITIES*, HRESULT)
    get_resources : Proc(IAppxManifestReader*, IAppxManifestResourcesEnumerator*, HRESULT)
    get_device_capabilities : Proc(IAppxManifestReader*, IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)
    get_prerequisite : Proc(IAppxManifestReader*, LibC::LPWSTR, UInt64*, HRESULT)
    get_applications : Proc(IAppxManifestReader*, IAppxManifestApplicationsEnumerator*, HRESULT)
    get_stream : Proc(IAppxManifestReader*, IStream*, HRESULT)
  end

  IAppxManifestReader_GUID = LibC::GUID.new("4e1bd148-55a0-4480-a3d1-15544710637c")
  CLSID_IAppxManifestReader = "4e1bd148-55a0-4480-a3d1-15544710637c"
  struct IAppxManifestReader
    lpVtbl : IAppxManifestReaderVTbl*
  end

  struct IAppxManifestReader2VTbl
    query_interface : Proc(IAppxManifestReader2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader2*, UInt32)
    release : Proc(IAppxManifestReader2*, UInt32)
    get_package_id : Proc(IAppxManifestReader2*, IAppxManifestPackageId*, HRESULT)
    get_properties : Proc(IAppxManifestReader2*, IAppxManifestProperties*, HRESULT)
    get_package_dependencies : Proc(IAppxManifestReader2*, IAppxManifestPackageDependenciesEnumerator*, HRESULT)
    get_capabilities : Proc(IAppxManifestReader2*, APPX_CAPABILITIES*, HRESULT)
    get_resources : Proc(IAppxManifestReader2*, IAppxManifestResourcesEnumerator*, HRESULT)
    get_device_capabilities : Proc(IAppxManifestReader2*, IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)
    get_prerequisite : Proc(IAppxManifestReader2*, LibC::LPWSTR, UInt64*, HRESULT)
    get_applications : Proc(IAppxManifestReader2*, IAppxManifestApplicationsEnumerator*, HRESULT)
    get_stream : Proc(IAppxManifestReader2*, IStream*, HRESULT)
    get_qualified_resources : Proc(IAppxManifestReader2*, IAppxManifestQualifiedResourcesEnumerator*, HRESULT)
  end

  IAppxManifestReader2_GUID = LibC::GUID.new("d06f67bc-b31d-4eba-a8af-638e73e77b4d")
  CLSID_IAppxManifestReader2 = "d06f67bc-b31d-4eba-a8af-638e73e77b4d"
  struct IAppxManifestReader2
    lpVtbl : IAppxManifestReader2VTbl*
  end

  struct IAppxManifestReader3VTbl
    query_interface : Proc(IAppxManifestReader3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader3*, UInt32)
    release : Proc(IAppxManifestReader3*, UInt32)
    get_package_id : Proc(IAppxManifestReader3*, IAppxManifestPackageId*, HRESULT)
    get_properties : Proc(IAppxManifestReader3*, IAppxManifestProperties*, HRESULT)
    get_package_dependencies : Proc(IAppxManifestReader3*, IAppxManifestPackageDependenciesEnumerator*, HRESULT)
    get_capabilities : Proc(IAppxManifestReader3*, APPX_CAPABILITIES*, HRESULT)
    get_resources : Proc(IAppxManifestReader3*, IAppxManifestResourcesEnumerator*, HRESULT)
    get_device_capabilities : Proc(IAppxManifestReader3*, IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)
    get_prerequisite : Proc(IAppxManifestReader3*, LibC::LPWSTR, UInt64*, HRESULT)
    get_applications : Proc(IAppxManifestReader3*, IAppxManifestApplicationsEnumerator*, HRESULT)
    get_stream : Proc(IAppxManifestReader3*, IStream*, HRESULT)
    get_qualified_resources : Proc(IAppxManifestReader3*, IAppxManifestQualifiedResourcesEnumerator*, HRESULT)
    get_capabilities_by_capability_class : Proc(IAppxManifestReader3*, APPX_CAPABILITY_CLASS_TYPE, IAppxManifestCapabilitiesEnumerator*, HRESULT)
    get_target_device_families : Proc(IAppxManifestReader3*, IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)
  end

  IAppxManifestReader3_GUID = LibC::GUID.new("c43825ab-69b7-400a-9709-cc37f5a72d24")
  CLSID_IAppxManifestReader3 = "c43825ab-69b7-400a-9709-cc37f5a72d24"
  struct IAppxManifestReader3
    lpVtbl : IAppxManifestReader3VTbl*
  end

  struct IAppxManifestReader4VTbl
    query_interface : Proc(IAppxManifestReader4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader4*, UInt32)
    release : Proc(IAppxManifestReader4*, UInt32)
    get_package_id : Proc(IAppxManifestReader4*, IAppxManifestPackageId*, HRESULT)
    get_properties : Proc(IAppxManifestReader4*, IAppxManifestProperties*, HRESULT)
    get_package_dependencies : Proc(IAppxManifestReader4*, IAppxManifestPackageDependenciesEnumerator*, HRESULT)
    get_capabilities : Proc(IAppxManifestReader4*, APPX_CAPABILITIES*, HRESULT)
    get_resources : Proc(IAppxManifestReader4*, IAppxManifestResourcesEnumerator*, HRESULT)
    get_device_capabilities : Proc(IAppxManifestReader4*, IAppxManifestDeviceCapabilitiesEnumerator*, HRESULT)
    get_prerequisite : Proc(IAppxManifestReader4*, LibC::LPWSTR, UInt64*, HRESULT)
    get_applications : Proc(IAppxManifestReader4*, IAppxManifestApplicationsEnumerator*, HRESULT)
    get_stream : Proc(IAppxManifestReader4*, IStream*, HRESULT)
    get_qualified_resources : Proc(IAppxManifestReader4*, IAppxManifestQualifiedResourcesEnumerator*, HRESULT)
    get_capabilities_by_capability_class : Proc(IAppxManifestReader4*, APPX_CAPABILITY_CLASS_TYPE, IAppxManifestCapabilitiesEnumerator*, HRESULT)
    get_target_device_families : Proc(IAppxManifestReader4*, IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)
    get_optional_package_info : Proc(IAppxManifestReader4*, IAppxManifestOptionalPackageInfo*, HRESULT)
  end

  IAppxManifestReader4_GUID = LibC::GUID.new("4579bb7c-741d-4161-b5a1-47bd3b78ad9b")
  CLSID_IAppxManifestReader4 = "4579bb7c-741d-4161-b5a1-47bd3b78ad9b"
  struct IAppxManifestReader4
    lpVtbl : IAppxManifestReader4VTbl*
  end

  struct IAppxManifestReader5VTbl
    query_interface : Proc(IAppxManifestReader5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader5*, UInt32)
    release : Proc(IAppxManifestReader5*, UInt32)
    get_main_package_dependencies : Proc(IAppxManifestReader5*, IAppxManifestMainPackageDependenciesEnumerator*, HRESULT)
  end

  IAppxManifestReader5_GUID = LibC::GUID.new("8d7ae132-a690-4c00-b75a-6aae1feaac80")
  CLSID_IAppxManifestReader5 = "8d7ae132-a690-4c00-b75a-6aae1feaac80"
  struct IAppxManifestReader5
    lpVtbl : IAppxManifestReader5VTbl*
  end

  struct IAppxManifestReader6VTbl
    query_interface : Proc(IAppxManifestReader6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader6*, UInt32)
    release : Proc(IAppxManifestReader6*, UInt32)
    get_is_non_qualified_resource_package : Proc(IAppxManifestReader6*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestReader6_GUID = LibC::GUID.new("34deaca4-d3c0-4e3e-b312-e42625e3807e")
  CLSID_IAppxManifestReader6 = "34deaca4-d3c0-4e3e-b312-e42625e3807e"
  struct IAppxManifestReader6
    lpVtbl : IAppxManifestReader6VTbl*
  end

  struct IAppxManifestReader7VTbl
    query_interface : Proc(IAppxManifestReader7*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestReader7*, UInt32)
    release : Proc(IAppxManifestReader7*, UInt32)
    get_driver_dependencies : Proc(IAppxManifestReader7*, IAppxManifestDriverDependenciesEnumerator*, HRESULT)
    get_os_package_dependencies : Proc(IAppxManifestReader7*, IAppxManifestOSPackageDependenciesEnumerator*, HRESULT)
    get_host_runtime_dependencies : Proc(IAppxManifestReader7*, IAppxManifestHostRuntimeDependenciesEnumerator*, HRESULT)
  end

  IAppxManifestReader7_GUID = LibC::GUID.new("8efe6f27-0ce0-4988-b32d-738eb63db3b7")
  CLSID_IAppxManifestReader7 = "8efe6f27-0ce0-4988-b32d-738eb63db3b7"
  struct IAppxManifestReader7
    lpVtbl : IAppxManifestReader7VTbl*
  end

  struct IAppxManifestDriverDependenciesEnumeratorVTbl
    query_interface : Proc(IAppxManifestDriverDependenciesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestDriverDependenciesEnumerator*, UInt32)
    release : Proc(IAppxManifestDriverDependenciesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestDriverDependenciesEnumerator*, IAppxManifestDriverDependency*, HRESULT)
    get_has_current : Proc(IAppxManifestDriverDependenciesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestDriverDependenciesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestDriverDependenciesEnumerator_GUID = LibC::GUID.new("fe039db2-467f-4755-8404-8f5eb6865b33")
  CLSID_IAppxManifestDriverDependenciesEnumerator = "fe039db2-467f-4755-8404-8f5eb6865b33"
  struct IAppxManifestDriverDependenciesEnumerator
    lpVtbl : IAppxManifestDriverDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestDriverDependencyVTbl
    query_interface : Proc(IAppxManifestDriverDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestDriverDependency*, UInt32)
    release : Proc(IAppxManifestDriverDependency*, UInt32)
    get_driver_constraints : Proc(IAppxManifestDriverDependency*, IAppxManifestDriverConstraintsEnumerator*, HRESULT)
  end

  IAppxManifestDriverDependency_GUID = LibC::GUID.new("1210cb94-5a92-4602-be24-79f318af4af9")
  CLSID_IAppxManifestDriverDependency = "1210cb94-5a92-4602-be24-79f318af4af9"
  struct IAppxManifestDriverDependency
    lpVtbl : IAppxManifestDriverDependencyVTbl*
  end

  struct IAppxManifestDriverConstraintsEnumeratorVTbl
    query_interface : Proc(IAppxManifestDriverConstraintsEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestDriverConstraintsEnumerator*, UInt32)
    release : Proc(IAppxManifestDriverConstraintsEnumerator*, UInt32)
    get_current : Proc(IAppxManifestDriverConstraintsEnumerator*, IAppxManifestDriverConstraint*, HRESULT)
    get_has_current : Proc(IAppxManifestDriverConstraintsEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestDriverConstraintsEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestDriverConstraintsEnumerator_GUID = LibC::GUID.new("d402b2d1-f600-49e0-95e6-975d8da13d89")
  CLSID_IAppxManifestDriverConstraintsEnumerator = "d402b2d1-f600-49e0-95e6-975d8da13d89"
  struct IAppxManifestDriverConstraintsEnumerator
    lpVtbl : IAppxManifestDriverConstraintsEnumeratorVTbl*
  end

  struct IAppxManifestDriverConstraintVTbl
    query_interface : Proc(IAppxManifestDriverConstraint*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestDriverConstraint*, UInt32)
    release : Proc(IAppxManifestDriverConstraint*, UInt32)
    get_name : Proc(IAppxManifestDriverConstraint*, LibC::LPWSTR*, HRESULT)
    get_min_version : Proc(IAppxManifestDriverConstraint*, UInt64*, HRESULT)
    get_min_date : Proc(IAppxManifestDriverConstraint*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestDriverConstraint_GUID = LibC::GUID.new("c031bee4-bbcc-48ea-a237-c34045c80a07")
  CLSID_IAppxManifestDriverConstraint = "c031bee4-bbcc-48ea-a237-c34045c80a07"
  struct IAppxManifestDriverConstraint
    lpVtbl : IAppxManifestDriverConstraintVTbl*
  end

  struct IAppxManifestOSPackageDependenciesEnumeratorVTbl
    query_interface : Proc(IAppxManifestOSPackageDependenciesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestOSPackageDependenciesEnumerator*, UInt32)
    release : Proc(IAppxManifestOSPackageDependenciesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestOSPackageDependenciesEnumerator*, IAppxManifestOSPackageDependency*, HRESULT)
    get_has_current : Proc(IAppxManifestOSPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestOSPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestOSPackageDependenciesEnumerator_GUID = LibC::GUID.new("b84e2fc3-f8ec-4bc1-8ae2-156346f5ffea")
  CLSID_IAppxManifestOSPackageDependenciesEnumerator = "b84e2fc3-f8ec-4bc1-8ae2-156346f5ffea"
  struct IAppxManifestOSPackageDependenciesEnumerator
    lpVtbl : IAppxManifestOSPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestOSPackageDependencyVTbl
    query_interface : Proc(IAppxManifestOSPackageDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestOSPackageDependency*, UInt32)
    release : Proc(IAppxManifestOSPackageDependency*, UInt32)
    get_name : Proc(IAppxManifestOSPackageDependency*, LibC::LPWSTR*, HRESULT)
    get_version : Proc(IAppxManifestOSPackageDependency*, UInt64*, HRESULT)
  end

  IAppxManifestOSPackageDependency_GUID = LibC::GUID.new("154995ee-54a6-4f14-ac97-d8cf0519644b")
  CLSID_IAppxManifestOSPackageDependency = "154995ee-54a6-4f14-ac97-d8cf0519644b"
  struct IAppxManifestOSPackageDependency
    lpVtbl : IAppxManifestOSPackageDependencyVTbl*
  end

  struct IAppxManifestHostRuntimeDependenciesEnumeratorVTbl
    query_interface : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, UInt32)
    release : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, IAppxManifestHostRuntimeDependency*, HRESULT)
    get_has_current : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestHostRuntimeDependenciesEnumerator_GUID = LibC::GUID.new("6427a646-7f49-433e-b1a6-0da309f6885a")
  CLSID_IAppxManifestHostRuntimeDependenciesEnumerator = "6427a646-7f49-433e-b1a6-0da309f6885a"
  struct IAppxManifestHostRuntimeDependenciesEnumerator
    lpVtbl : IAppxManifestHostRuntimeDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestHostRuntimeDependencyVTbl
    query_interface : Proc(IAppxManifestHostRuntimeDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestHostRuntimeDependency*, UInt32)
    release : Proc(IAppxManifestHostRuntimeDependency*, UInt32)
    get_name : Proc(IAppxManifestHostRuntimeDependency*, LibC::LPWSTR*, HRESULT)
    get_publisher : Proc(IAppxManifestHostRuntimeDependency*, LibC::LPWSTR*, HRESULT)
    get_min_version : Proc(IAppxManifestHostRuntimeDependency*, UInt64*, HRESULT)
  end

  IAppxManifestHostRuntimeDependency_GUID = LibC::GUID.new("3455d234-8414-410d-95c7-7b35255b8391")
  CLSID_IAppxManifestHostRuntimeDependency = "3455d234-8414-410d-95c7-7b35255b8391"
  struct IAppxManifestHostRuntimeDependency
    lpVtbl : IAppxManifestHostRuntimeDependencyVTbl*
  end

  struct IAppxManifestHostRuntimeDependency2VTbl
    query_interface : Proc(IAppxManifestHostRuntimeDependency2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestHostRuntimeDependency2*, UInt32)
    release : Proc(IAppxManifestHostRuntimeDependency2*, UInt32)
    get_package_family_name : Proc(IAppxManifestHostRuntimeDependency2*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestHostRuntimeDependency2_GUID = LibC::GUID.new("c26f23a8-ee10-4ad6-b898-2b4d7aebfe6a")
  CLSID_IAppxManifestHostRuntimeDependency2 = "c26f23a8-ee10-4ad6-b898-2b4d7aebfe6a"
  struct IAppxManifestHostRuntimeDependency2
    lpVtbl : IAppxManifestHostRuntimeDependency2VTbl*
  end

  struct IAppxManifestOptionalPackageInfoVTbl
    query_interface : Proc(IAppxManifestOptionalPackageInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestOptionalPackageInfo*, UInt32)
    release : Proc(IAppxManifestOptionalPackageInfo*, UInt32)
    get_is_optional_package : Proc(IAppxManifestOptionalPackageInfo*, LibC::BOOL*, HRESULT)
    get_main_package_name : Proc(IAppxManifestOptionalPackageInfo*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestOptionalPackageInfo_GUID = LibC::GUID.new("2634847d-5b5d-4fe5-a243-002ff95edc7e")
  CLSID_IAppxManifestOptionalPackageInfo = "2634847d-5b5d-4fe5-a243-002ff95edc7e"
  struct IAppxManifestOptionalPackageInfo
    lpVtbl : IAppxManifestOptionalPackageInfoVTbl*
  end

  struct IAppxManifestMainPackageDependenciesEnumeratorVTbl
    query_interface : Proc(IAppxManifestMainPackageDependenciesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestMainPackageDependenciesEnumerator*, UInt32)
    release : Proc(IAppxManifestMainPackageDependenciesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestMainPackageDependenciesEnumerator*, IAppxManifestMainPackageDependency*, HRESULT)
    get_has_current : Proc(IAppxManifestMainPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestMainPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestMainPackageDependenciesEnumerator_GUID = LibC::GUID.new("a99c4f00-51d2-4f0f-ba46-7ed5255ebdff")
  CLSID_IAppxManifestMainPackageDependenciesEnumerator = "a99c4f00-51d2-4f0f-ba46-7ed5255ebdff"
  struct IAppxManifestMainPackageDependenciesEnumerator
    lpVtbl : IAppxManifestMainPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestMainPackageDependencyVTbl
    query_interface : Proc(IAppxManifestMainPackageDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestMainPackageDependency*, UInt32)
    release : Proc(IAppxManifestMainPackageDependency*, UInt32)
    get_name : Proc(IAppxManifestMainPackageDependency*, LibC::LPWSTR*, HRESULT)
    get_publisher : Proc(IAppxManifestMainPackageDependency*, LibC::LPWSTR*, HRESULT)
    get_package_family_name : Proc(IAppxManifestMainPackageDependency*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestMainPackageDependency_GUID = LibC::GUID.new("05d0611c-bc29-46d5-97e2-84b9c79bd8ae")
  CLSID_IAppxManifestMainPackageDependency = "05d0611c-bc29-46d5-97e2-84b9c79bd8ae"
  struct IAppxManifestMainPackageDependency
    lpVtbl : IAppxManifestMainPackageDependencyVTbl*
  end

  struct IAppxManifestPackageIdVTbl
    query_interface : Proc(IAppxManifestPackageId*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageId*, UInt32)
    release : Proc(IAppxManifestPackageId*, UInt32)
    get_name : Proc(IAppxManifestPackageId*, LibC::LPWSTR*, HRESULT)
    get_architecture : Proc(IAppxManifestPackageId*, APPX_PACKAGE_ARCHITECTURE*, HRESULT)
    get_publisher : Proc(IAppxManifestPackageId*, LibC::LPWSTR*, HRESULT)
    get_version : Proc(IAppxManifestPackageId*, UInt64*, HRESULT)
    get_resource_id : Proc(IAppxManifestPackageId*, LibC::LPWSTR*, HRESULT)
    compare_publisher : Proc(IAppxManifestPackageId*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    get_package_full_name : Proc(IAppxManifestPackageId*, LibC::LPWSTR*, HRESULT)
    get_package_family_name : Proc(IAppxManifestPackageId*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestPackageId_GUID = LibC::GUID.new("283ce2d7-7153-4a91-9649-7a0f7240945f")
  CLSID_IAppxManifestPackageId = "283ce2d7-7153-4a91-9649-7a0f7240945f"
  struct IAppxManifestPackageId
    lpVtbl : IAppxManifestPackageIdVTbl*
  end

  struct IAppxManifestPackageId2VTbl
    query_interface : Proc(IAppxManifestPackageId2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageId2*, UInt32)
    release : Proc(IAppxManifestPackageId2*, UInt32)
    get_name : Proc(IAppxManifestPackageId2*, LibC::LPWSTR*, HRESULT)
    get_architecture : Proc(IAppxManifestPackageId2*, APPX_PACKAGE_ARCHITECTURE*, HRESULT)
    get_publisher : Proc(IAppxManifestPackageId2*, LibC::LPWSTR*, HRESULT)
    get_version : Proc(IAppxManifestPackageId2*, UInt64*, HRESULT)
    get_resource_id : Proc(IAppxManifestPackageId2*, LibC::LPWSTR*, HRESULT)
    compare_publisher : Proc(IAppxManifestPackageId2*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    get_package_full_name : Proc(IAppxManifestPackageId2*, LibC::LPWSTR*, HRESULT)
    get_package_family_name : Proc(IAppxManifestPackageId2*, LibC::LPWSTR*, HRESULT)
    get_architecture2 : Proc(IAppxManifestPackageId2*, APPX_PACKAGE_ARCHITECTURE2*, HRESULT)
  end

  IAppxManifestPackageId2_GUID = LibC::GUID.new("2256999d-d617-42f1-880e-0ba4542319d5")
  CLSID_IAppxManifestPackageId2 = "2256999d-d617-42f1-880e-0ba4542319d5"
  struct IAppxManifestPackageId2
    lpVtbl : IAppxManifestPackageId2VTbl*
  end

  struct IAppxManifestPropertiesVTbl
    query_interface : Proc(IAppxManifestProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestProperties*, UInt32)
    release : Proc(IAppxManifestProperties*, UInt32)
    get_bool_value : Proc(IAppxManifestProperties*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    get_string_value : Proc(IAppxManifestProperties*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestProperties_GUID = LibC::GUID.new("03faf64d-f26f-4b2c-aaf7-8fe7789b8bca")
  CLSID_IAppxManifestProperties = "03faf64d-f26f-4b2c-aaf7-8fe7789b8bca"
  struct IAppxManifestProperties
    lpVtbl : IAppxManifestPropertiesVTbl*
  end

  struct IAppxManifestTargetDeviceFamiliesEnumeratorVTbl
    query_interface : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, UInt32)
    release : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, IAppxManifestTargetDeviceFamily*, HRESULT)
    get_has_current : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestTargetDeviceFamiliesEnumerator_GUID = LibC::GUID.new("36537f36-27a4-4788-88c0-733819575017")
  CLSID_IAppxManifestTargetDeviceFamiliesEnumerator = "36537f36-27a4-4788-88c0-733819575017"
  struct IAppxManifestTargetDeviceFamiliesEnumerator
    lpVtbl : IAppxManifestTargetDeviceFamiliesEnumeratorVTbl*
  end

  struct IAppxManifestTargetDeviceFamilyVTbl
    query_interface : Proc(IAppxManifestTargetDeviceFamily*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestTargetDeviceFamily*, UInt32)
    release : Proc(IAppxManifestTargetDeviceFamily*, UInt32)
    get_name : Proc(IAppxManifestTargetDeviceFamily*, LibC::LPWSTR*, HRESULT)
    get_min_version : Proc(IAppxManifestTargetDeviceFamily*, UInt64*, HRESULT)
    get_max_version_tested : Proc(IAppxManifestTargetDeviceFamily*, UInt64*, HRESULT)
  end

  IAppxManifestTargetDeviceFamily_GUID = LibC::GUID.new("9091b09b-c8d5-4f31-8687-a338259faefb")
  CLSID_IAppxManifestTargetDeviceFamily = "9091b09b-c8d5-4f31-8687-a338259faefb"
  struct IAppxManifestTargetDeviceFamily
    lpVtbl : IAppxManifestTargetDeviceFamilyVTbl*
  end

  struct IAppxManifestPackageDependenciesEnumeratorVTbl
    query_interface : Proc(IAppxManifestPackageDependenciesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageDependenciesEnumerator*, UInt32)
    release : Proc(IAppxManifestPackageDependenciesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestPackageDependenciesEnumerator*, IAppxManifestPackageDependency*, HRESULT)
    get_has_current : Proc(IAppxManifestPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestPackageDependenciesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestPackageDependenciesEnumerator_GUID = LibC::GUID.new("b43bbcf9-65a6-42dd-bac0-8c6741e7f5a4")
  CLSID_IAppxManifestPackageDependenciesEnumerator = "b43bbcf9-65a6-42dd-bac0-8c6741e7f5a4"
  struct IAppxManifestPackageDependenciesEnumerator
    lpVtbl : IAppxManifestPackageDependenciesEnumeratorVTbl*
  end

  struct IAppxManifestPackageDependencyVTbl
    query_interface : Proc(IAppxManifestPackageDependency*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageDependency*, UInt32)
    release : Proc(IAppxManifestPackageDependency*, UInt32)
    get_name : Proc(IAppxManifestPackageDependency*, LibC::LPWSTR*, HRESULT)
    get_publisher : Proc(IAppxManifestPackageDependency*, LibC::LPWSTR*, HRESULT)
    get_min_version : Proc(IAppxManifestPackageDependency*, UInt64*, HRESULT)
  end

  IAppxManifestPackageDependency_GUID = LibC::GUID.new("e4946b59-733e-43f0-a724-3bde4c1285a0")
  CLSID_IAppxManifestPackageDependency = "e4946b59-733e-43f0-a724-3bde4c1285a0"
  struct IAppxManifestPackageDependency
    lpVtbl : IAppxManifestPackageDependencyVTbl*
  end

  struct IAppxManifestPackageDependency2VTbl
    query_interface : Proc(IAppxManifestPackageDependency2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageDependency2*, UInt32)
    release : Proc(IAppxManifestPackageDependency2*, UInt32)
    get_name : Proc(IAppxManifestPackageDependency2*, LibC::LPWSTR*, HRESULT)
    get_publisher : Proc(IAppxManifestPackageDependency2*, LibC::LPWSTR*, HRESULT)
    get_min_version : Proc(IAppxManifestPackageDependency2*, UInt64*, HRESULT)
    get_max_major_version_tested : Proc(IAppxManifestPackageDependency2*, UInt16*, HRESULT)
  end

  IAppxManifestPackageDependency2_GUID = LibC::GUID.new("dda0b713-f3ff-49d3-898a-2786780c5d98")
  CLSID_IAppxManifestPackageDependency2 = "dda0b713-f3ff-49d3-898a-2786780c5d98"
  struct IAppxManifestPackageDependency2
    lpVtbl : IAppxManifestPackageDependency2VTbl*
  end

  struct IAppxManifestPackageDependency3VTbl
    query_interface : Proc(IAppxManifestPackageDependency3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestPackageDependency3*, UInt32)
    release : Proc(IAppxManifestPackageDependency3*, UInt32)
    get_is_optional : Proc(IAppxManifestPackageDependency3*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestPackageDependency3_GUID = LibC::GUID.new("1ac56374-6198-4d6b-92e4-749d5ab8a895")
  CLSID_IAppxManifestPackageDependency3 = "1ac56374-6198-4d6b-92e4-749d5ab8a895"
  struct IAppxManifestPackageDependency3
    lpVtbl : IAppxManifestPackageDependency3VTbl*
  end

  struct IAppxManifestResourcesEnumeratorVTbl
    query_interface : Proc(IAppxManifestResourcesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestResourcesEnumerator*, UInt32)
    release : Proc(IAppxManifestResourcesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestResourcesEnumerator*, LibC::LPWSTR*, HRESULT)
    get_has_current : Proc(IAppxManifestResourcesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestResourcesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestResourcesEnumerator_GUID = LibC::GUID.new("de4dfbbd-881a-48bb-858c-d6f2baeae6ed")
  CLSID_IAppxManifestResourcesEnumerator = "de4dfbbd-881a-48bb-858c-d6f2baeae6ed"
  struct IAppxManifestResourcesEnumerator
    lpVtbl : IAppxManifestResourcesEnumeratorVTbl*
  end

  struct IAppxManifestDeviceCapabilitiesEnumeratorVTbl
    query_interface : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, UInt32)
    release : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, LibC::LPWSTR*, HRESULT)
    get_has_current : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestDeviceCapabilitiesEnumerator_GUID = LibC::GUID.new("30204541-427b-4a1c-bacf-655bf463a540")
  CLSID_IAppxManifestDeviceCapabilitiesEnumerator = "30204541-427b-4a1c-bacf-655bf463a540"
  struct IAppxManifestDeviceCapabilitiesEnumerator
    lpVtbl : IAppxManifestDeviceCapabilitiesEnumeratorVTbl*
  end

  struct IAppxManifestCapabilitiesEnumeratorVTbl
    query_interface : Proc(IAppxManifestCapabilitiesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestCapabilitiesEnumerator*, UInt32)
    release : Proc(IAppxManifestCapabilitiesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestCapabilitiesEnumerator*, LibC::LPWSTR*, HRESULT)
    get_has_current : Proc(IAppxManifestCapabilitiesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestCapabilitiesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestCapabilitiesEnumerator_GUID = LibC::GUID.new("11d22258-f470-42c1-b291-8361c5437e41")
  CLSID_IAppxManifestCapabilitiesEnumerator = "11d22258-f470-42c1-b291-8361c5437e41"
  struct IAppxManifestCapabilitiesEnumerator
    lpVtbl : IAppxManifestCapabilitiesEnumeratorVTbl*
  end

  struct IAppxManifestApplicationsEnumeratorVTbl
    query_interface : Proc(IAppxManifestApplicationsEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestApplicationsEnumerator*, UInt32)
    release : Proc(IAppxManifestApplicationsEnumerator*, UInt32)
    get_current : Proc(IAppxManifestApplicationsEnumerator*, IAppxManifestApplication*, HRESULT)
    get_has_current : Proc(IAppxManifestApplicationsEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestApplicationsEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestApplicationsEnumerator_GUID = LibC::GUID.new("9eb8a55a-f04b-4d0d-808d-686185d4847a")
  CLSID_IAppxManifestApplicationsEnumerator = "9eb8a55a-f04b-4d0d-808d-686185d4847a"
  struct IAppxManifestApplicationsEnumerator
    lpVtbl : IAppxManifestApplicationsEnumeratorVTbl*
  end

  struct IAppxManifestApplicationVTbl
    query_interface : Proc(IAppxManifestApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestApplication*, UInt32)
    release : Proc(IAppxManifestApplication*, UInt32)
    get_string_value : Proc(IAppxManifestApplication*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    get_app_user_model_id : Proc(IAppxManifestApplication*, LibC::LPWSTR*, HRESULT)
  end

  IAppxManifestApplication_GUID = LibC::GUID.new("5da89bf4-3773-46be-b650-7e744863b7e8")
  CLSID_IAppxManifestApplication = "5da89bf4-3773-46be-b650-7e744863b7e8"
  struct IAppxManifestApplication
    lpVtbl : IAppxManifestApplicationVTbl*
  end

  struct IAppxManifestQualifiedResourcesEnumeratorVTbl
    query_interface : Proc(IAppxManifestQualifiedResourcesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestQualifiedResourcesEnumerator*, UInt32)
    release : Proc(IAppxManifestQualifiedResourcesEnumerator*, UInt32)
    get_current : Proc(IAppxManifestQualifiedResourcesEnumerator*, IAppxManifestQualifiedResource*, HRESULT)
    get_has_current : Proc(IAppxManifestQualifiedResourcesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxManifestQualifiedResourcesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxManifestQualifiedResourcesEnumerator_GUID = LibC::GUID.new("8ef6adfe-3762-4a8f-9373-2fc5d444c8d2")
  CLSID_IAppxManifestQualifiedResourcesEnumerator = "8ef6adfe-3762-4a8f-9373-2fc5d444c8d2"
  struct IAppxManifestQualifiedResourcesEnumerator
    lpVtbl : IAppxManifestQualifiedResourcesEnumeratorVTbl*
  end

  struct IAppxManifestQualifiedResourceVTbl
    query_interface : Proc(IAppxManifestQualifiedResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxManifestQualifiedResource*, UInt32)
    release : Proc(IAppxManifestQualifiedResource*, UInt32)
    get_language : Proc(IAppxManifestQualifiedResource*, LibC::LPWSTR*, HRESULT)
    get_scale : Proc(IAppxManifestQualifiedResource*, UInt32*, HRESULT)
    get_dx_feature_level : Proc(IAppxManifestQualifiedResource*, DX_FEATURE_LEVEL*, HRESULT)
  end

  IAppxManifestQualifiedResource_GUID = LibC::GUID.new("3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4")
  CLSID_IAppxManifestQualifiedResource = "3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4"
  struct IAppxManifestQualifiedResource
    lpVtbl : IAppxManifestQualifiedResourceVTbl*
  end

  struct IAppxBundleFactoryVTbl
    query_interface : Proc(IAppxBundleFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleFactory*, UInt32)
    release : Proc(IAppxBundleFactory*, UInt32)
    create_bundle_writer : Proc(IAppxBundleFactory*, IStream, UInt64, IAppxBundleWriter*, HRESULT)
    create_bundle_reader : Proc(IAppxBundleFactory*, IStream, IAppxBundleReader*, HRESULT)
    create_bundle_manifest_reader : Proc(IAppxBundleFactory*, IStream, IAppxBundleManifestReader*, HRESULT)
  end

  IAppxBundleFactory_GUID = LibC::GUID.new("bba65864-965f-4a5f-855f-f074bdbf3a7b")
  CLSID_IAppxBundleFactory = "bba65864-965f-4a5f-855f-f074bdbf3a7b"
  struct IAppxBundleFactory
    lpVtbl : IAppxBundleFactoryVTbl*
  end

  struct IAppxBundleWriterVTbl
    query_interface : Proc(IAppxBundleWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleWriter*, UInt32)
    release : Proc(IAppxBundleWriter*, UInt32)
    add_payload_package : Proc(IAppxBundleWriter*, LibC::LPWSTR, IStream, HRESULT)
    close : Proc(IAppxBundleWriter*, HRESULT)
  end

  IAppxBundleWriter_GUID = LibC::GUID.new("ec446fe8-bfec-4c64-ab4f-49f038f0c6d2")
  CLSID_IAppxBundleWriter = "ec446fe8-bfec-4c64-ab4f-49f038f0c6d2"
  struct IAppxBundleWriter
    lpVtbl : IAppxBundleWriterVTbl*
  end

  struct IAppxBundleWriter2VTbl
    query_interface : Proc(IAppxBundleWriter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleWriter2*, UInt32)
    release : Proc(IAppxBundleWriter2*, UInt32)
    add_external_package_reference : Proc(IAppxBundleWriter2*, LibC::LPWSTR, IStream, HRESULT)
  end

  IAppxBundleWriter2_GUID = LibC::GUID.new("6d8fe971-01cc-49a0-b685-233851279962")
  CLSID_IAppxBundleWriter2 = "6d8fe971-01cc-49a0-b685-233851279962"
  struct IAppxBundleWriter2
    lpVtbl : IAppxBundleWriter2VTbl*
  end

  struct IAppxBundleWriter3VTbl
    query_interface : Proc(IAppxBundleWriter3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleWriter3*, UInt32)
    release : Proc(IAppxBundleWriter3*, UInt32)
    add_package_reference : Proc(IAppxBundleWriter3*, LibC::LPWSTR, IStream, HRESULT)
    close : Proc(IAppxBundleWriter3*, LibC::LPWSTR, HRESULT)
  end

  IAppxBundleWriter3_GUID = LibC::GUID.new("ad711152-f969-4193-82d5-9ddf2786d21a")
  CLSID_IAppxBundleWriter3 = "ad711152-f969-4193-82d5-9ddf2786d21a"
  struct IAppxBundleWriter3
    lpVtbl : IAppxBundleWriter3VTbl*
  end

  struct IAppxBundleWriter4VTbl
    query_interface : Proc(IAppxBundleWriter4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleWriter4*, UInt32)
    release : Proc(IAppxBundleWriter4*, UInt32)
    add_payload_package : Proc(IAppxBundleWriter4*, LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)
    add_package_reference : Proc(IAppxBundleWriter4*, LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)
    add_external_package_reference : Proc(IAppxBundleWriter4*, LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)
  end

  IAppxBundleWriter4_GUID = LibC::GUID.new("9cd9d523-5009-4c01-9882-dc029fbd47a3")
  CLSID_IAppxBundleWriter4 = "9cd9d523-5009-4c01-9882-dc029fbd47a3"
  struct IAppxBundleWriter4
    lpVtbl : IAppxBundleWriter4VTbl*
  end

  struct IAppxBundleReaderVTbl
    query_interface : Proc(IAppxBundleReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleReader*, UInt32)
    release : Proc(IAppxBundleReader*, UInt32)
    get_footprint_file : Proc(IAppxBundleReader*, APPX_BUNDLE_FOOTPRINT_FILE_TYPE, IAppxFile*, HRESULT)
    get_block_map : Proc(IAppxBundleReader*, IAppxBlockMapReader*, HRESULT)
    get_manifest : Proc(IAppxBundleReader*, IAppxBundleManifestReader*, HRESULT)
    get_payload_packages : Proc(IAppxBundleReader*, IAppxFilesEnumerator*, HRESULT)
    get_payload_package : Proc(IAppxBundleReader*, LibC::LPWSTR, IAppxFile*, HRESULT)
  end

  IAppxBundleReader_GUID = LibC::GUID.new("dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8")
  CLSID_IAppxBundleReader = "dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8"
  struct IAppxBundleReader
    lpVtbl : IAppxBundleReaderVTbl*
  end

  struct IAppxBundleManifestReaderVTbl
    query_interface : Proc(IAppxBundleManifestReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestReader*, UInt32)
    release : Proc(IAppxBundleManifestReader*, UInt32)
    get_package_id : Proc(IAppxBundleManifestReader*, IAppxManifestPackageId*, HRESULT)
    get_package_info_items : Proc(IAppxBundleManifestReader*, IAppxBundleManifestPackageInfoEnumerator*, HRESULT)
    get_stream : Proc(IAppxBundleManifestReader*, IStream*, HRESULT)
  end

  IAppxBundleManifestReader_GUID = LibC::GUID.new("cf0ebbc1-cc99-4106-91eb-e67462e04fb0")
  CLSID_IAppxBundleManifestReader = "cf0ebbc1-cc99-4106-91eb-e67462e04fb0"
  struct IAppxBundleManifestReader
    lpVtbl : IAppxBundleManifestReaderVTbl*
  end

  struct IAppxBundleManifestReader2VTbl
    query_interface : Proc(IAppxBundleManifestReader2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestReader2*, UInt32)
    release : Proc(IAppxBundleManifestReader2*, UInt32)
    get_optional_bundles : Proc(IAppxBundleManifestReader2*, IAppxBundleManifestOptionalBundleInfoEnumerator*, HRESULT)
  end

  IAppxBundleManifestReader2_GUID = LibC::GUID.new("5517df70-033f-4af2-8213-87d766805c02")
  CLSID_IAppxBundleManifestReader2 = "5517df70-033f-4af2-8213-87d766805c02"
  struct IAppxBundleManifestReader2
    lpVtbl : IAppxBundleManifestReader2VTbl*
  end

  struct IAppxBundleManifestPackageInfoEnumeratorVTbl
    query_interface : Proc(IAppxBundleManifestPackageInfoEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestPackageInfoEnumerator*, UInt32)
    release : Proc(IAppxBundleManifestPackageInfoEnumerator*, UInt32)
    get_current : Proc(IAppxBundleManifestPackageInfoEnumerator*, IAppxBundleManifestPackageInfo*, HRESULT)
    get_has_current : Proc(IAppxBundleManifestPackageInfoEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxBundleManifestPackageInfoEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxBundleManifestPackageInfoEnumerator_GUID = LibC::GUID.new("f9b856ee-49a6-4e19-b2b0-6a2406d63a32")
  CLSID_IAppxBundleManifestPackageInfoEnumerator = "f9b856ee-49a6-4e19-b2b0-6a2406d63a32"
  struct IAppxBundleManifestPackageInfoEnumerator
    lpVtbl : IAppxBundleManifestPackageInfoEnumeratorVTbl*
  end

  struct IAppxBundleManifestPackageInfoVTbl
    query_interface : Proc(IAppxBundleManifestPackageInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestPackageInfo*, UInt32)
    release : Proc(IAppxBundleManifestPackageInfo*, UInt32)
    get_package_type : Proc(IAppxBundleManifestPackageInfo*, APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*, HRESULT)
    get_package_id : Proc(IAppxBundleManifestPackageInfo*, IAppxManifestPackageId*, HRESULT)
    get_file_name : Proc(IAppxBundleManifestPackageInfo*, LibC::LPWSTR*, HRESULT)
    get_offset : Proc(IAppxBundleManifestPackageInfo*, UInt64*, HRESULT)
    get_size : Proc(IAppxBundleManifestPackageInfo*, UInt64*, HRESULT)
    get_resources : Proc(IAppxBundleManifestPackageInfo*, IAppxManifestQualifiedResourcesEnumerator*, HRESULT)
  end

  IAppxBundleManifestPackageInfo_GUID = LibC::GUID.new("54cd06c1-268f-40bb-8ed2-757a9ebaec8d")
  CLSID_IAppxBundleManifestPackageInfo = "54cd06c1-268f-40bb-8ed2-757a9ebaec8d"
  struct IAppxBundleManifestPackageInfo
    lpVtbl : IAppxBundleManifestPackageInfoVTbl*
  end

  struct IAppxBundleManifestPackageInfo2VTbl
    query_interface : Proc(IAppxBundleManifestPackageInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestPackageInfo2*, UInt32)
    release : Proc(IAppxBundleManifestPackageInfo2*, UInt32)
    get_is_package_reference : Proc(IAppxBundleManifestPackageInfo2*, LibC::BOOL*, HRESULT)
    get_is_non_qualified_resource_package : Proc(IAppxBundleManifestPackageInfo2*, LibC::BOOL*, HRESULT)
    get_is_default_applicable_package : Proc(IAppxBundleManifestPackageInfo2*, LibC::BOOL*, HRESULT)
  end

  IAppxBundleManifestPackageInfo2_GUID = LibC::GUID.new("44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e")
  CLSID_IAppxBundleManifestPackageInfo2 = "44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e"
  struct IAppxBundleManifestPackageInfo2
    lpVtbl : IAppxBundleManifestPackageInfo2VTbl*
  end

  struct IAppxBundleManifestPackageInfo3VTbl
    query_interface : Proc(IAppxBundleManifestPackageInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestPackageInfo3*, UInt32)
    release : Proc(IAppxBundleManifestPackageInfo3*, UInt32)
    get_target_device_families : Proc(IAppxBundleManifestPackageInfo3*, IAppxManifestTargetDeviceFamiliesEnumerator*, HRESULT)
  end

  IAppxBundleManifestPackageInfo3_GUID = LibC::GUID.new("6ba74b98-bb74-4296-80d0-5f4256a99675")
  CLSID_IAppxBundleManifestPackageInfo3 = "6ba74b98-bb74-4296-80d0-5f4256a99675"
  struct IAppxBundleManifestPackageInfo3
    lpVtbl : IAppxBundleManifestPackageInfo3VTbl*
  end

  struct IAppxBundleManifestPackageInfo4VTbl
    query_interface : Proc(IAppxBundleManifestPackageInfo4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestPackageInfo4*, UInt32)
    release : Proc(IAppxBundleManifestPackageInfo4*, UInt32)
    get_is_stub : Proc(IAppxBundleManifestPackageInfo4*, LibC::BOOL*, HRESULT)
  end

  IAppxBundleManifestPackageInfo4_GUID = LibC::GUID.new("5da6f13d-a8a7-4532-857c-1393d659371d")
  CLSID_IAppxBundleManifestPackageInfo4 = "5da6f13d-a8a7-4532-857c-1393d659371d"
  struct IAppxBundleManifestPackageInfo4
    lpVtbl : IAppxBundleManifestPackageInfo4VTbl*
  end

  struct IAppxBundleManifestOptionalBundleInfoEnumeratorVTbl
    query_interface : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, UInt32)
    release : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, UInt32)
    get_current : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, IAppxBundleManifestOptionalBundleInfo*, HRESULT)
    get_has_current : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxBundleManifestOptionalBundleInfoEnumerator_GUID = LibC::GUID.new("9a178793-f97e-46ac-aaca-dd5ba4c177c8")
  CLSID_IAppxBundleManifestOptionalBundleInfoEnumerator = "9a178793-f97e-46ac-aaca-dd5ba4c177c8"
  struct IAppxBundleManifestOptionalBundleInfoEnumerator
    lpVtbl : IAppxBundleManifestOptionalBundleInfoEnumeratorVTbl*
  end

  struct IAppxBundleManifestOptionalBundleInfoVTbl
    query_interface : Proc(IAppxBundleManifestOptionalBundleInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxBundleManifestOptionalBundleInfo*, UInt32)
    release : Proc(IAppxBundleManifestOptionalBundleInfo*, UInt32)
    get_package_id : Proc(IAppxBundleManifestOptionalBundleInfo*, IAppxManifestPackageId*, HRESULT)
    get_file_name : Proc(IAppxBundleManifestOptionalBundleInfo*, LibC::LPWSTR*, HRESULT)
    get_package_info_items : Proc(IAppxBundleManifestOptionalBundleInfo*, IAppxBundleManifestPackageInfoEnumerator*, HRESULT)
  end

  IAppxBundleManifestOptionalBundleInfo_GUID = LibC::GUID.new("515bf2e8-bcb0-4d69-8c48-e383147b6e12")
  CLSID_IAppxBundleManifestOptionalBundleInfo = "515bf2e8-bcb0-4d69-8c48-e383147b6e12"
  struct IAppxBundleManifestOptionalBundleInfo
    lpVtbl : IAppxBundleManifestOptionalBundleInfoVTbl*
  end

  struct IAppxContentGroupFilesEnumeratorVTbl
    query_interface : Proc(IAppxContentGroupFilesEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxContentGroupFilesEnumerator*, UInt32)
    release : Proc(IAppxContentGroupFilesEnumerator*, UInt32)
    get_current : Proc(IAppxContentGroupFilesEnumerator*, LibC::LPWSTR*, HRESULT)
    get_has_current : Proc(IAppxContentGroupFilesEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxContentGroupFilesEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxContentGroupFilesEnumerator_GUID = LibC::GUID.new("1a09a2fd-7440-44eb-8c84-848205a6a1cc")
  CLSID_IAppxContentGroupFilesEnumerator = "1a09a2fd-7440-44eb-8c84-848205a6a1cc"
  struct IAppxContentGroupFilesEnumerator
    lpVtbl : IAppxContentGroupFilesEnumeratorVTbl*
  end

  struct IAppxContentGroupVTbl
    query_interface : Proc(IAppxContentGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxContentGroup*, UInt32)
    release : Proc(IAppxContentGroup*, UInt32)
    get_name : Proc(IAppxContentGroup*, LibC::LPWSTR*, HRESULT)
    get_files : Proc(IAppxContentGroup*, IAppxContentGroupFilesEnumerator*, HRESULT)
  end

  IAppxContentGroup_GUID = LibC::GUID.new("328f6468-c04f-4e3c-b6fa-6b8d27f3003a")
  CLSID_IAppxContentGroup = "328f6468-c04f-4e3c-b6fa-6b8d27f3003a"
  struct IAppxContentGroup
    lpVtbl : IAppxContentGroupVTbl*
  end

  struct IAppxContentGroupsEnumeratorVTbl
    query_interface : Proc(IAppxContentGroupsEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxContentGroupsEnumerator*, UInt32)
    release : Proc(IAppxContentGroupsEnumerator*, UInt32)
    get_current : Proc(IAppxContentGroupsEnumerator*, IAppxContentGroup*, HRESULT)
    get_has_current : Proc(IAppxContentGroupsEnumerator*, LibC::BOOL*, HRESULT)
    move_next : Proc(IAppxContentGroupsEnumerator*, LibC::BOOL*, HRESULT)
  end

  IAppxContentGroupsEnumerator_GUID = LibC::GUID.new("3264e477-16d1-4d63-823e-7d2984696634")
  CLSID_IAppxContentGroupsEnumerator = "3264e477-16d1-4d63-823e-7d2984696634"
  struct IAppxContentGroupsEnumerator
    lpVtbl : IAppxContentGroupsEnumeratorVTbl*
  end

  struct IAppxContentGroupMapReaderVTbl
    query_interface : Proc(IAppxContentGroupMapReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxContentGroupMapReader*, UInt32)
    release : Proc(IAppxContentGroupMapReader*, UInt32)
    get_required_group : Proc(IAppxContentGroupMapReader*, IAppxContentGroup*, HRESULT)
    get_automatic_groups : Proc(IAppxContentGroupMapReader*, IAppxContentGroupsEnumerator*, HRESULT)
  end

  IAppxContentGroupMapReader_GUID = LibC::GUID.new("418726d8-dd99-4f5d-9886-157add20de01")
  CLSID_IAppxContentGroupMapReader = "418726d8-dd99-4f5d-9886-157add20de01"
  struct IAppxContentGroupMapReader
    lpVtbl : IAppxContentGroupMapReaderVTbl*
  end

  struct IAppxSourceContentGroupMapReaderVTbl
    query_interface : Proc(IAppxSourceContentGroupMapReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxSourceContentGroupMapReader*, UInt32)
    release : Proc(IAppxSourceContentGroupMapReader*, UInt32)
    get_required_group : Proc(IAppxSourceContentGroupMapReader*, IAppxContentGroup*, HRESULT)
    get_automatic_groups : Proc(IAppxSourceContentGroupMapReader*, IAppxContentGroupsEnumerator*, HRESULT)
  end

  IAppxSourceContentGroupMapReader_GUID = LibC::GUID.new("f329791d-540b-4a9f-bc75-3282b7d73193")
  CLSID_IAppxSourceContentGroupMapReader = "f329791d-540b-4a9f-bc75-3282b7d73193"
  struct IAppxSourceContentGroupMapReader
    lpVtbl : IAppxSourceContentGroupMapReaderVTbl*
  end

  struct IAppxContentGroupMapWriterVTbl
    query_interface : Proc(IAppxContentGroupMapWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxContentGroupMapWriter*, UInt32)
    release : Proc(IAppxContentGroupMapWriter*, UInt32)
    add_automatic_group : Proc(IAppxContentGroupMapWriter*, LibC::LPWSTR, HRESULT)
    add_automatic_file : Proc(IAppxContentGroupMapWriter*, LibC::LPWSTR, HRESULT)
    close : Proc(IAppxContentGroupMapWriter*, HRESULT)
  end

  IAppxContentGroupMapWriter_GUID = LibC::GUID.new("d07ab776-a9de-4798-8c14-3db31e687c78")
  CLSID_IAppxContentGroupMapWriter = "d07ab776-a9de-4798-8c14-3db31e687c78"
  struct IAppxContentGroupMapWriter
    lpVtbl : IAppxContentGroupMapWriterVTbl*
  end

  struct IAppxPackagingDiagnosticEventSinkVTbl
    query_interface : Proc(IAppxPackagingDiagnosticEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackagingDiagnosticEventSink*, UInt32)
    release : Proc(IAppxPackagingDiagnosticEventSink*, UInt32)
    report_context_change : Proc(IAppxPackagingDiagnosticEventSink*, APPX_PACKAGING_CONTEXT_CHANGE_TYPE, Int32, PSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    report_error : Proc(IAppxPackagingDiagnosticEventSink*, LibC::LPWSTR, HRESULT)
  end

  IAppxPackagingDiagnosticEventSink_GUID = LibC::GUID.new("17239d47-6adb-45d2-80f6-f9cbc3bf059d")
  CLSID_IAppxPackagingDiagnosticEventSink = "17239d47-6adb-45d2-80f6-f9cbc3bf059d"
  struct IAppxPackagingDiagnosticEventSink
    lpVtbl : IAppxPackagingDiagnosticEventSinkVTbl*
  end

  struct IAppxPackagingDiagnosticEventSinkManagerVTbl
    query_interface : Proc(IAppxPackagingDiagnosticEventSinkManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackagingDiagnosticEventSinkManager*, UInt32)
    release : Proc(IAppxPackagingDiagnosticEventSinkManager*, UInt32)
    set_sink_for_process : Proc(IAppxPackagingDiagnosticEventSinkManager*, IAppxPackagingDiagnosticEventSink, HRESULT)
  end

  IAppxPackagingDiagnosticEventSinkManager_GUID = LibC::GUID.new("369648fa-a7eb-4909-a15d-6954a078f18a")
  CLSID_IAppxPackagingDiagnosticEventSinkManager = "369648fa-a7eb-4909-a15d-6954a078f18a"
  struct IAppxPackagingDiagnosticEventSinkManager
    lpVtbl : IAppxPackagingDiagnosticEventSinkManagerVTbl*
  end

  struct IAppxEncryptionFactoryVTbl
    query_interface : Proc(IAppxEncryptionFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptionFactory*, UInt32)
    release : Proc(IAppxEncryptionFactory*, UInt32)
    encrypt_package : Proc(IAppxEncryptionFactory*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)
    decrypt_package : Proc(IAppxEncryptionFactory*, IStream, IStream, APPX_KEY_INFO*, HRESULT)
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)
    create_encrypted_package_reader : Proc(IAppxEncryptionFactory*, IStream, APPX_KEY_INFO*, IAppxPackageReader*, HRESULT)
    encrypt_bundle : Proc(IAppxEncryptionFactory*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)
    decrypt_bundle : Proc(IAppxEncryptionFactory*, IStream, IStream, APPX_KEY_INFO*, HRESULT)
    create_encrypted_bundle_writer : Proc(IAppxEncryptionFactory*, IStream, UInt64, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedBundleWriter*, HRESULT)
    create_encrypted_bundle_reader : Proc(IAppxEncryptionFactory*, IStream, APPX_KEY_INFO*, IAppxBundleReader*, HRESULT)
  end

  IAppxEncryptionFactory_GUID = LibC::GUID.new("80e8e04d-8c88-44ae-a011-7cadf6fb2e72")
  CLSID_IAppxEncryptionFactory = "80e8e04d-8c88-44ae-a011-7cadf6fb2e72"
  struct IAppxEncryptionFactory
    lpVtbl : IAppxEncryptionFactoryVTbl*
  end

  struct IAppxEncryptionFactory2VTbl
    query_interface : Proc(IAppxEncryptionFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptionFactory2*, UInt32)
    release : Proc(IAppxEncryptionFactory2*, UInt32)
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory2*, IStream, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)
  end

  IAppxEncryptionFactory2_GUID = LibC::GUID.new("c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f")
  CLSID_IAppxEncryptionFactory2 = "c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f"
  struct IAppxEncryptionFactory2
    lpVtbl : IAppxEncryptionFactory2VTbl*
  end

  struct IAppxEncryptionFactory3VTbl
    query_interface : Proc(IAppxEncryptionFactory3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptionFactory3*, UInt32)
    release : Proc(IAppxEncryptionFactory3*, UInt32)
    encrypt_package : Proc(IAppxEncryptionFactory3*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory3*, IStream, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedPackageWriter*, HRESULT)
    encrypt_bundle : Proc(IAppxEncryptionFactory3*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, HRESULT)
    create_encrypted_bundle_writer : Proc(IAppxEncryptionFactory3*, IStream, UInt64, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, IAppxEncryptedBundleWriter*, HRESULT)
  end

  IAppxEncryptionFactory3_GUID = LibC::GUID.new("09edca37-cd64-47d6-b7e8-1cb11d4f7e05")
  CLSID_IAppxEncryptionFactory3 = "09edca37-cd64-47d6-b7e8-1cb11d4f7e05"
  struct IAppxEncryptionFactory3
    lpVtbl : IAppxEncryptionFactory3VTbl*
  end

  struct IAppxEncryptionFactory4VTbl
    query_interface : Proc(IAppxEncryptionFactory4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptionFactory4*, UInt32)
    release : Proc(IAppxEncryptionFactory4*, UInt32)
    encrypt_package : Proc(IAppxEncryptionFactory4*, IStream, IStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, APPX_ENCRYPTED_EXEMPTIONS*, UInt64, HRESULT)
  end

  IAppxEncryptionFactory4_GUID = LibC::GUID.new("a879611f-12fd-41fe-85d5-06ae779bbaf5")
  CLSID_IAppxEncryptionFactory4 = "a879611f-12fd-41fe-85d5-06ae779bbaf5"
  struct IAppxEncryptionFactory4
    lpVtbl : IAppxEncryptionFactory4VTbl*
  end

  struct IAppxEncryptedPackageWriterVTbl
    query_interface : Proc(IAppxEncryptedPackageWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptedPackageWriter*, UInt32)
    release : Proc(IAppxEncryptedPackageWriter*, UInt32)
    add_payload_file_encrypted : Proc(IAppxEncryptedPackageWriter*, LibC::LPWSTR, APPX_COMPRESSION_OPTION, IStream, HRESULT)
    close : Proc(IAppxEncryptedPackageWriter*, HRESULT)
  end

  IAppxEncryptedPackageWriter_GUID = LibC::GUID.new("f43d0b0b-1379-40e2-9b29-682ea2bf42af")
  CLSID_IAppxEncryptedPackageWriter = "f43d0b0b-1379-40e2-9b29-682ea2bf42af"
  struct IAppxEncryptedPackageWriter
    lpVtbl : IAppxEncryptedPackageWriterVTbl*
  end

  struct IAppxEncryptedPackageWriter2VTbl
    query_interface : Proc(IAppxEncryptedPackageWriter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptedPackageWriter2*, UInt32)
    release : Proc(IAppxEncryptedPackageWriter2*, UInt32)
    add_payload_files_encrypted : Proc(IAppxEncryptedPackageWriter2*, UInt32, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, HRESULT)
  end

  IAppxEncryptedPackageWriter2_GUID = LibC::GUID.new("3e475447-3a25-40b5-8ad2-f953ae50c92d")
  CLSID_IAppxEncryptedPackageWriter2 = "3e475447-3a25-40b5-8ad2-f953ae50c92d"
  struct IAppxEncryptedPackageWriter2
    lpVtbl : IAppxEncryptedPackageWriter2VTbl*
  end

  struct IAppxEncryptedBundleWriterVTbl
    query_interface : Proc(IAppxEncryptedBundleWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptedBundleWriter*, UInt32)
    release : Proc(IAppxEncryptedBundleWriter*, UInt32)
    add_payload_package_encrypted : Proc(IAppxEncryptedBundleWriter*, LibC::LPWSTR, IStream, HRESULT)
    close : Proc(IAppxEncryptedBundleWriter*, HRESULT)
  end

  IAppxEncryptedBundleWriter_GUID = LibC::GUID.new("80b0902f-7bf0-4117-b8c6-4279ef81ee77")
  CLSID_IAppxEncryptedBundleWriter = "80b0902f-7bf0-4117-b8c6-4279ef81ee77"
  struct IAppxEncryptedBundleWriter
    lpVtbl : IAppxEncryptedBundleWriterVTbl*
  end

  struct IAppxEncryptedBundleWriter2VTbl
    query_interface : Proc(IAppxEncryptedBundleWriter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptedBundleWriter2*, UInt32)
    release : Proc(IAppxEncryptedBundleWriter2*, UInt32)
    add_external_package_reference : Proc(IAppxEncryptedBundleWriter2*, LibC::LPWSTR, IStream, HRESULT)
  end

  IAppxEncryptedBundleWriter2_GUID = LibC::GUID.new("e644be82-f0fa-42b8-a956-8d1cb48ee379")
  CLSID_IAppxEncryptedBundleWriter2 = "e644be82-f0fa-42b8-a956-8d1cb48ee379"
  struct IAppxEncryptedBundleWriter2
    lpVtbl : IAppxEncryptedBundleWriter2VTbl*
  end

  struct IAppxEncryptedBundleWriter3VTbl
    query_interface : Proc(IAppxEncryptedBundleWriter3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxEncryptedBundleWriter3*, UInt32)
    release : Proc(IAppxEncryptedBundleWriter3*, UInt32)
    add_payload_package_encrypted : Proc(IAppxEncryptedBundleWriter3*, LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)
    add_external_package_reference : Proc(IAppxEncryptedBundleWriter3*, LibC::LPWSTR, IStream, LibC::BOOL, HRESULT)
  end

  IAppxEncryptedBundleWriter3_GUID = LibC::GUID.new("0d34deb3-5cae-4dd3-977c-504932a51d31")
  CLSID_IAppxEncryptedBundleWriter3 = "0d34deb3-5cae-4dd3-977c-504932a51d31"
  struct IAppxEncryptedBundleWriter3
    lpVtbl : IAppxEncryptedBundleWriter3VTbl*
  end

  struct IAppxPackageEditorVTbl
    query_interface : Proc(IAppxPackageEditor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppxPackageEditor*, UInt32)
    release : Proc(IAppxPackageEditor*, UInt32)
    set_working_directory : Proc(IAppxPackageEditor*, LibC::LPWSTR, HRESULT)
    create_delta_package : Proc(IAppxPackageEditor*, IStream, IStream, IStream, HRESULT)
    create_delta_package_using_baseline_block_map : Proc(IAppxPackageEditor*, IStream, IStream, LibC::LPWSTR, IStream, HRESULT)
    update_package : Proc(IAppxPackageEditor*, IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, HRESULT)
    update_encrypted_package : Proc(IAppxPackageEditor*, IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, APPX_ENCRYPTED_PACKAGE_SETTINGS2*, APPX_KEY_INFO*, HRESULT)
    update_package_manifest : Proc(IAppxPackageEditor*, IStream, IStream, LibC::BOOL, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS, HRESULT)
  end

  IAppxPackageEditor_GUID = LibC::GUID.new("e2adb6dc-5e71-4416-86b6-86e5f5291a6b")
  CLSID_IAppxPackageEditor = "e2adb6dc-5e71-4416-86b6-86e5f5291a6b"
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
  fun ReleasePackageVirtualizationContext(context : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*)

  # Params # cookie : LibC::UINT_PTR [In]
  fun DeactivatePackageVirtualizationContext(cookie : LibC::UINT_PTR)

  # Params # sourcecontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__* [In],destcontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__** [In]
  fun DuplicatePackageVirtualizationContext(sourcecontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, destcontext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**) : HRESULT

  # Params # 
  fun GetCurrentPackageVirtualizationContext : PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*

  # Params # packagefamilyname : LibC::LPWSTR [In],count : UInt32* [In],processes : LibC::HANDLE** [In]
  fun GetProcessesInVirtualizationContext(packagefamilyname : LibC::LPWSTR, count : UInt32*, processes : LibC::HANDLE**) : HRESULT
end
