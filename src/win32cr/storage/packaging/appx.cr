require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::Storage::Packaging::Appx
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

  enum APPX_COMPRESSION_OPTION
    APPX_COMPRESSION_OPTION_NONE = 0_i32
    APPX_COMPRESSION_OPTION_NORMAL = 1_i32
    APPX_COMPRESSION_OPTION_MAXIMUM = 2_i32
    APPX_COMPRESSION_OPTION_FAST = 3_i32
    APPX_COMPRESSION_OPTION_SUPERFAST = 4_i32
  end
  enum APPX_FOOTPRINT_FILE_TYPE
    APPX_FOOTPRINT_FILE_TYPE_MANIFEST = 0_i32
    APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1_i32
    APPX_FOOTPRINT_FILE_TYPE_SIGNATURE = 2_i32
    APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY = 3_i32
    APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP = 4_i32
  end
  enum APPX_BUNDLE_FOOTPRINT_FILE_TYPE
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST = 0_i32
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST = 0_i32
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1_i32
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE = 2_i32
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST = 2_i32
  end
  @[Flags]
  enum APPX_CAPABILITIES : UInt32
    APPX_CAPABILITY_INTERNET_CLIENT = 1_u32
    APPX_CAPABILITY_INTERNET_CLIENT_SERVER = 2_u32
    APPX_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER = 4_u32
    APPX_CAPABILITY_DOCUMENTS_LIBRARY = 8_u32
    APPX_CAPABILITY_PICTURES_LIBRARY = 16_u32
    APPX_CAPABILITY_VIDEOS_LIBRARY = 32_u32
    APPX_CAPABILITY_MUSIC_LIBRARY = 64_u32
    APPX_CAPABILITY_ENTERPRISE_AUTHENTICATION = 128_u32
    APPX_CAPABILITY_SHARED_USER_CERTIFICATES = 256_u32
    APPX_CAPABILITY_REMOVABLE_STORAGE = 512_u32
    APPX_CAPABILITY_APPOINTMENTS = 1024_u32
    APPX_CAPABILITY_CONTACTS = 2048_u32
  end
  enum APPX_PACKAGE_ARCHITECTURE
    APPX_PACKAGE_ARCHITECTURE_X86 = 0_i32
    APPX_PACKAGE_ARCHITECTURE_ARM = 5_i32
    APPX_PACKAGE_ARCHITECTURE_X64 = 9_i32
    APPX_PACKAGE_ARCHITECTURE_NEUTRAL = 11_i32
    APPX_PACKAGE_ARCHITECTURE_ARM64 = 12_i32
  end
  enum APPX_PACKAGE_ARCHITECTURE2
    APPX_PACKAGE_ARCHITECTURE2_X86 = 0_i32
    APPX_PACKAGE_ARCHITECTURE2_ARM = 5_i32
    APPX_PACKAGE_ARCHITECTURE2_X64 = 9_i32
    APPX_PACKAGE_ARCHITECTURE2_NEUTRAL = 11_i32
    APPX_PACKAGE_ARCHITECTURE2_ARM64 = 12_i32
    APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64 = 14_i32
    APPX_PACKAGE_ARCHITECTURE2_UNKNOWN = 65535_i32
  end
  enum APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_APPLICATION = 0_i32
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_RESOURCE = 1_i32
  end
  enum DX_FEATURE_LEVEL
    DX_FEATURE_LEVEL_UNSPECIFIED = 0_i32
    DX_FEATURE_LEVEL_9 = 1_i32
    DX_FEATURE_LEVEL_10 = 2_i32
    DX_FEATURE_LEVEL_11 = 3_i32
  end
  enum APPX_CAPABILITY_CLASS_TYPE
    APPX_CAPABILITY_CLASS_DEFAULT = 0_i32
    APPX_CAPABILITY_CLASS_GENERAL = 1_i32
    APPX_CAPABILITY_CLASS_RESTRICTED = 2_i32
    APPX_CAPABILITY_CLASS_WINDOWS = 4_i32
    APPX_CAPABILITY_CLASS_ALL = 7_i32
    APPX_CAPABILITY_CLASS_CUSTOM = 8_i32
  end
  enum APPX_PACKAGING_CONTEXT_CHANGE_TYPE
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START = 0_i32
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE = 1_i32
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS = 2_i32
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END = 3_i32
  end
  @[Flags]
  enum APPX_ENCRYPTED_PACKAGE_OPTIONS : UInt32
    APPX_ENCRYPTED_PACKAGE_OPTION_NONE = 0_u32
    APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION = 1_u32
    APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING = 2_u32
  end
  enum APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA = 0_i32
  end
  @[Flags]
  enum APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS : UInt32
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_NONE = 0_u32
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_SKIP_VALIDATION = 1_u32
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_LOCALIZED = 2_u32
  end
  enum PackagePathType
    PackagePathType_Install = 0_i32
    PackagePathType_Mutable = 1_i32
    PackagePathType_Effective = 2_i32
    PackagePathType_MachineExternal = 3_i32
    PackagePathType_UserExternal = 4_i32
    PackagePathType_EffectiveExternal = 5_i32
  end
  enum PackageOrigin
    PackageOrigin_Unknown = 0_i32
    PackageOrigin_Unsigned = 1_i32
    PackageOrigin_Inbox = 2_i32
    PackageOrigin_Store = 3_i32
    PackageOrigin_DeveloperUnsigned = 4_i32
    PackageOrigin_DeveloperSigned = 5_i32
    PackageOrigin_LineOfBusiness = 6_i32
  end
  enum CreatePackageDependencyOptions
    CreatePackageDependencyOptions_None = 0_i32
    CreatePackageDependencyOptions_DoNotVerifyDependencyResolution = 1_i32
    CreatePackageDependencyOptions_ScopeIsSystem = 2_i32
  end
  enum PackageDependencyLifetimeKind
    PackageDependencyLifetimeKind_Process = 0_i32
    PackageDependencyLifetimeKind_FilePath = 1_i32
    PackageDependencyLifetimeKind_RegistryKey = 2_i32
  end
  enum AddPackageDependencyOptions
    AddPackageDependencyOptions_None = 0_i32
    AddPackageDependencyOptions_PrependIfRankCollision = 1_i32
  end
  enum PackageDependencyProcessorArchitectures
    PackageDependencyProcessorArchitectures_None = 0_i32
    PackageDependencyProcessorArchitectures_Neutral = 1_i32
    PackageDependencyProcessorArchitectures_X86 = 2_i32
    PackageDependencyProcessorArchitectures_X64 = 4_i32
    PackageDependencyProcessorArchitectures_Arm = 8_i32
    PackageDependencyProcessorArchitectures_Arm64 = 16_i32
    PackageDependencyProcessorArchitectures_X86A64 = 32_i32
  end
  enum AppPolicyLifecycleManagement
    AppPolicyLifecycleManagement_Unmanaged = 0_i32
    AppPolicyLifecycleManagement_Managed = 1_i32
  end
  enum AppPolicyWindowingModel
    AppPolicyWindowingModel_None = 0_i32
    AppPolicyWindowingModel_Universal = 1_i32
    AppPolicyWindowingModel_ClassicDesktop = 2_i32
    AppPolicyWindowingModel_ClassicPhone = 3_i32
  end
  enum AppPolicyMediaFoundationCodecLoading
    AppPolicyMediaFoundationCodecLoading_All = 0_i32
    AppPolicyMediaFoundationCodecLoading_InboxOnly = 1_i32
  end
  enum AppPolicyClrCompat
    AppPolicyClrCompat_Other = 0_i32
    AppPolicyClrCompat_ClassicDesktop = 1_i32
    AppPolicyClrCompat_Universal = 2_i32
    AppPolicyClrCompat_PackagedDesktop = 3_i32
  end
  enum AppPolicyThreadInitializationType
    AppPolicyThreadInitializationType_None = 0_i32
    AppPolicyThreadInitializationType_InitializeWinRT = 1_i32
  end
  enum AppPolicyShowDeveloperDiagnostic
    AppPolicyShowDeveloperDiagnostic_None = 0_i32
    AppPolicyShowDeveloperDiagnostic_ShowUI = 1_i32
  end
  enum AppPolicyProcessTerminationMethod
    AppPolicyProcessTerminationMethod_ExitProcess = 0_i32
    AppPolicyProcessTerminationMethod_TerminateProcess = 1_i32
  end
  enum AppPolicyCreateFileAccess
    AppPolicyCreateFileAccess_Full = 0_i32
    AppPolicyCreateFileAccess_Limited = 1_i32
  end

  @[Extern]
  record APPX_PACKAGE_SETTINGS,
    forceZip32 : Win32cr::Foundation::BOOL,
    hashMethod : Void*

  @[Extern]
  record APPX_PACKAGE_WRITER_PAYLOAD_STREAM,
    inputStream : Void*,
    fileName : Win32cr::Foundation::PWSTR,
    contentType : Win32cr::Foundation::PWSTR,
    compressionOption : Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION

  @[Extern]
  record APPX_ENCRYPTED_PACKAGE_SETTINGS,
    keyLength : UInt32,
    encryptionAlgorithm : Win32cr::Foundation::PWSTR,
    useDiffusion : Win32cr::Foundation::BOOL,
    blockMapHashAlgorithm : Void*

  @[Extern]
  record APPX_ENCRYPTED_PACKAGE_SETTINGS2,
    keyLength : UInt32,
    encryptionAlgorithm : Win32cr::Foundation::PWSTR,
    blockMapHashAlgorithm : Void*,
    options : UInt32

  @[Extern]
  record APPX_KEY_INFO,
    keyLength : UInt32,
    keyIdLength : UInt32,
    key : UInt8*,
    keyId : UInt8*

  @[Extern]
  record APPX_ENCRYPTED_EXEMPTIONS,
    count : UInt32,
    plainTextFiles : Win32cr::Foundation::PWSTR*

  @[Extern]
  record PACKAGE_VERSION,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      version : UInt64,
      anonymous : Anonymous_e__Struct do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        revision : UInt16,
        build : UInt16,
        minor : UInt16,
        major : UInt16

    end

  end

  @[Extern]
  record PACKAGE_ID,
    reserved : UInt32,
    processorArchitecture : UInt32,
    version : Win32cr::Storage::Packaging::Appx::PACKAGE_VERSION,
    name : Win32cr::Foundation::PWSTR,
    publisher : Win32cr::Foundation::PWSTR,
    resourceId : Win32cr::Foundation::PWSTR,
    publisherId : Win32cr::Foundation::PWSTR

  @[Extern]
  record PACKAGE_INFO_REFERENCE,
    reserved : Void*

  @[Extern]
  record PACKAGE_INFO,
    reserved : UInt32,
    flags : UInt32,
    path : Win32cr::Foundation::PWSTR,
    packageFullName : Win32cr::Foundation::PWSTR,
    packageFamilyName : Win32cr::Foundation::PWSTR,
    packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID

  @[Extern]
  record PACKAGEDEPENDENCY_CONTEXT__,
    unused : Int32

  @[Extern]
  record PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__,
    unused : Int32

  @[Extern]
  record IAppxFactoryVtbl,
    query_interface : Proc(IAppxFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxFactory*, UInt32),
    release : Proc(IAppxFactory*, UInt32),
    create_package_writer : Proc(IAppxFactory*, Void*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_SETTINGS*, Void**, Win32cr::Foundation::HRESULT),
    create_package_reader : Proc(IAppxFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_manifest_reader : Proc(IAppxFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_block_map_reader : Proc(IAppxFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_validated_block_map_reader : Proc(IAppxFactory*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("beb94909-e451-438b-b5a7-d79e767b75d8")]
  record IAppxFactory, lpVtbl : IAppxFactoryVtbl* do
    GUID = LibC::GUID.new(0xbeb94909_u32, 0xe451_u16, 0x438b_u16, StaticArray[0xb5_u8, 0xa7_u8, 0xd7_u8, 0x9e_u8, 0x76_u8, 0x7b_u8, 0x75_u8, 0xd8_u8])
    def query_interface(this : IAppxFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_package_writer(this : IAppxFactory*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_SETTINGS*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_writer.call(this, outputStream, settings, packageWriter)
    end
    def create_package_reader(this : IAppxFactory*, inputStream : Void*, packageReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_package_reader.call(this, inputStream, packageReader)
    end
    def create_manifest_reader(this : IAppxFactory*, inputStream : Void*, manifestReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_manifest_reader.call(this, inputStream, manifestReader)
    end
    def create_block_map_reader(this : IAppxFactory*, inputStream : Void*, blockMapReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_block_map_reader.call(this, inputStream, blockMapReader)
    end
    def create_validated_block_map_reader(this : IAppxFactory*, blockMapStream : Void*, signatureFileName : Win32cr::Foundation::PWSTR, blockMapReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_validated_block_map_reader.call(this, blockMapStream, signatureFileName, blockMapReader)
    end

  end

  @[Extern]
  record IAppxFactory2Vtbl,
    query_interface : Proc(IAppxFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxFactory2*, UInt32),
    release : Proc(IAppxFactory2*, UInt32),
    create_content_group_map_reader : Proc(IAppxFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_source_content_group_map_reader : Proc(IAppxFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_content_group_map_writer : Proc(IAppxFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f1346df2-c282-4e22-b918-743a929a8d55")]
  record IAppxFactory2, lpVtbl : IAppxFactory2Vtbl* do
    GUID = LibC::GUID.new(0xf1346df2_u32, 0xc282_u16, 0x4e22_u16, StaticArray[0xb9_u8, 0x18_u8, 0x74_u8, 0x3a_u8, 0x92_u8, 0x9a_u8, 0x8d_u8, 0x55_u8])
    def query_interface(this : IAppxFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_content_group_map_reader(this : IAppxFactory2*, inputStream : Void*, contentGroupMapReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_content_group_map_reader.call(this, inputStream, contentGroupMapReader)
    end
    def create_source_content_group_map_reader(this : IAppxFactory2*, inputStream : Void*, reader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_source_content_group_map_reader.call(this, inputStream, reader)
    end
    def create_content_group_map_writer(this : IAppxFactory2*, stream : Void*, contentGroupMapWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_content_group_map_writer.call(this, stream, contentGroupMapWriter)
    end

  end

  @[Extern]
  record IAppxPackageReaderVtbl,
    query_interface : Proc(IAppxPackageReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackageReader*, UInt32),
    release : Proc(IAppxPackageReader*, UInt32),
    get_block_map : Proc(IAppxPackageReader*, Void**, Win32cr::Foundation::HRESULT),
    get_footprint_file : Proc(IAppxPackageReader*, Win32cr::Storage::Packaging::Appx::APPX_FOOTPRINT_FILE_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_payload_file : Proc(IAppxPackageReader*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_payload_files : Proc(IAppxPackageReader*, Void**, Win32cr::Foundation::HRESULT),
    get_manifest : Proc(IAppxPackageReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b5c49650-99bc-481c-9a34-3d53a4106708")]
  record IAppxPackageReader, lpVtbl : IAppxPackageReaderVtbl* do
    GUID = LibC::GUID.new(0xb5c49650_u32, 0x99bc_u16, 0x481c_u16, StaticArray[0x9a_u8, 0x34_u8, 0x3d_u8, 0x53_u8, 0xa4_u8, 0x10_u8, 0x67_u8, 0x8_u8])
    def query_interface(this : IAppxPackageReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackageReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackageReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_block_map(this : IAppxPackageReader*, blockMapReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_block_map.call(this, blockMapReader)
    end
    def get_footprint_file(this : IAppxPackageReader*, type__ : Win32cr::Storage::Packaging::Appx::APPX_FOOTPRINT_FILE_TYPE, file : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_footprint_file.call(this, type__, file)
    end
    def get_payload_file(this : IAppxPackageReader*, fileName : Win32cr::Foundation::PWSTR, file : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_payload_file.call(this, fileName, file)
    end
    def get_payload_files(this : IAppxPackageReader*, filesEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_payload_files.call(this, filesEnumerator)
    end
    def get_manifest(this : IAppxPackageReader*, manifestReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manifest.call(this, manifestReader)
    end

  end

  @[Extern]
  record IAppxPackageWriterVtbl,
    query_interface : Proc(IAppxPackageWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackageWriter*, UInt32),
    release : Proc(IAppxPackageWriter*, UInt32),
    add_payload_file : Proc(IAppxPackageWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxPackageWriter*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9099e33b-246f-41e4-881a-008eb613f858")]
  record IAppxPackageWriter, lpVtbl : IAppxPackageWriterVtbl* do
    GUID = LibC::GUID.new(0x9099e33b_u32, 0x246f_u16, 0x41e4_u16, StaticArray[0x88_u8, 0x1a_u8, 0x0_u8, 0x8e_u8, 0xb6_u8, 0x13_u8, 0xf8_u8, 0x58_u8])
    def query_interface(this : IAppxPackageWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackageWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackageWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_file(this : IAppxPackageWriter*, fileName : Win32cr::Foundation::PWSTR, contentType : Win32cr::Foundation::PWSTR, compressionOption : Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION, inputStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_file.call(this, fileName, contentType, compressionOption, inputStream)
    end
    def close(this : IAppxPackageWriter*, manifest : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this, manifest)
    end

  end

  @[Extern]
  record IAppxPackageWriter2Vtbl,
    query_interface : Proc(IAppxPackageWriter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackageWriter2*, UInt32),
    release : Proc(IAppxPackageWriter2*, UInt32),
    close : Proc(IAppxPackageWriter2*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8")]
  record IAppxPackageWriter2, lpVtbl : IAppxPackageWriter2Vtbl* do
    GUID = LibC::GUID.new(0x2cf5c4fd_u32, 0xe54c_u16, 0x4ea5_u16, StaticArray[0xba_u8, 0x4e_u8, 0xf8_u8, 0xc4_u8, 0xb1_u8, 0x5_u8, 0xa8_u8, 0xc8_u8])
    def query_interface(this : IAppxPackageWriter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackageWriter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackageWriter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close(this : IAppxPackageWriter2*, manifest : Void*, contentGroupMap : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this, manifest, contentGroupMap)
    end

  end

  @[Extern]
  record IAppxPackageWriter3Vtbl,
    query_interface : Proc(IAppxPackageWriter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackageWriter3*, UInt32),
    release : Proc(IAppxPackageWriter3*, UInt32),
    add_payload_files : Proc(IAppxPackageWriter3*, UInt32, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a83aacd3-41c0-4501-b8a3-74164f50b2fd")]
  record IAppxPackageWriter3, lpVtbl : IAppxPackageWriter3Vtbl* do
    GUID = LibC::GUID.new(0xa83aacd3_u32, 0x41c0_u16, 0x4501_u16, StaticArray[0xb8_u8, 0xa3_u8, 0x74_u8, 0x16_u8, 0x4f_u8, 0x50_u8, 0xb2_u8, 0xfd_u8])
    def query_interface(this : IAppxPackageWriter3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackageWriter3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackageWriter3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_files(this : IAppxPackageWriter3*, fileCount : UInt32, payloadFiles : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, memoryLimit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_files.call(this, fileCount, payloadFiles, memoryLimit)
    end

  end

  @[Extern]
  record IAppxFileVtbl,
    query_interface : Proc(IAppxFile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxFile*, UInt32),
    release : Proc(IAppxFile*, UInt32),
    get_compression_option : Proc(IAppxFile*, Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION*, Win32cr::Foundation::HRESULT),
    get_content_type : Proc(IAppxFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IAppxFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IAppxFile*, UInt64*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxFile*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("91df827b-94fd-468f-827b-57f41b2f6f2e")]
  record IAppxFile, lpVtbl : IAppxFileVtbl* do
    GUID = LibC::GUID.new(0x91df827b_u32, 0x94fd_u16, 0x468f_u16, StaticArray[0x82_u8, 0x7b_u8, 0x57_u8, 0xf4_u8, 0x1b_u8, 0x2f_u8, 0x6f_u8, 0x2e_u8])
    def query_interface(this : IAppxFile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxFile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxFile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_compression_option(this : IAppxFile*, compressionOption : Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_compression_option.call(this, compressionOption)
    end
    def get_content_type(this : IAppxFile*, contentType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_type.call(this, contentType)
    end
    def get_name(this : IAppxFile*, fileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, fileName)
    end
    def get_size(this : IAppxFile*, size : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, size)
    end
    def get_stream(this : IAppxFile*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, stream)
    end

  end

  @[Extern]
  record IAppxFilesEnumeratorVtbl,
    query_interface : Proc(IAppxFilesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxFilesEnumerator*, UInt32),
    release : Proc(IAppxFilesEnumerator*, UInt32),
    get_current : Proc(IAppxFilesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f007eeaf-9831-411c-9847-917cdc62d1fe")]
  record IAppxFilesEnumerator, lpVtbl : IAppxFilesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xf007eeaf_u32, 0x9831_u16, 0x411c_u16, StaticArray[0x98_u8, 0x47_u8, 0x91_u8, 0x7c_u8, 0xdc_u8, 0x62_u8, 0xd1_u8, 0xfe_u8])
    def query_interface(this : IAppxFilesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxFilesEnumerator*, file : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, file)
    end
    def get_has_current(this : IAppxFilesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxFilesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxBlockMapReaderVtbl,
    query_interface : Proc(IAppxBlockMapReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBlockMapReader*, UInt32),
    release : Proc(IAppxBlockMapReader*, UInt32),
    get_file : Proc(IAppxBlockMapReader*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_files : Proc(IAppxBlockMapReader*, Void**, Win32cr::Foundation::HRESULT),
    get_hash_method : Proc(IAppxBlockMapReader*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxBlockMapReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5efec991-bca3-42d1-9ec2-e92d609ec22a")]
  record IAppxBlockMapReader, lpVtbl : IAppxBlockMapReaderVtbl* do
    GUID = LibC::GUID.new(0x5efec991_u32, 0xbca3_u16, 0x42d1_u16, StaticArray[0x9e_u8, 0xc2_u8, 0xe9_u8, 0x2d_u8, 0x60_u8, 0x9e_u8, 0xc2_u8, 0x2a_u8])
    def query_interface(this : IAppxBlockMapReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBlockMapReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBlockMapReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_file(this : IAppxBlockMapReader*, filename : Win32cr::Foundation::PWSTR, file : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file.call(this, filename, file)
    end
    def get_files(this : IAppxBlockMapReader*, enumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_files.call(this, enumerator)
    end
    def get_hash_method(this : IAppxBlockMapReader*, hashMethod : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_method.call(this, hashMethod)
    end
    def get_stream(this : IAppxBlockMapReader*, blockMapStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, blockMapStream)
    end

  end

  @[Extern]
  record IAppxBlockMapFileVtbl,
    query_interface : Proc(IAppxBlockMapFile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBlockMapFile*, UInt32),
    release : Proc(IAppxBlockMapFile*, UInt32),
    get_blocks : Proc(IAppxBlockMapFile*, Void**, Win32cr::Foundation::HRESULT),
    get_local_file_header_size : Proc(IAppxBlockMapFile*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IAppxBlockMapFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_uncompressed_size : Proc(IAppxBlockMapFile*, UInt64*, Win32cr::Foundation::HRESULT),
    validate_file_hash : Proc(IAppxBlockMapFile*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("277672ac-4f63-42c1-8abc-beae3600eb59")]
  record IAppxBlockMapFile, lpVtbl : IAppxBlockMapFileVtbl* do
    GUID = LibC::GUID.new(0x277672ac_u32, 0x4f63_u16, 0x42c1_u16, StaticArray[0x8a_u8, 0xbc_u8, 0xbe_u8, 0xae_u8, 0x36_u8, 0x0_u8, 0xeb_u8, 0x59_u8])
    def query_interface(this : IAppxBlockMapFile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBlockMapFile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBlockMapFile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_blocks(this : IAppxBlockMapFile*, blocks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blocks.call(this, blocks)
    end
    def get_local_file_header_size(this : IAppxBlockMapFile*, lfhSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_file_header_size.call(this, lfhSize)
    end
    def get_name(this : IAppxBlockMapFile*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_uncompressed_size(this : IAppxBlockMapFile*, size : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_uncompressed_size.call(this, size)
    end
    def validate_file_hash(this : IAppxBlockMapFile*, fileStream : Void*, isValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_file_hash.call(this, fileStream, isValid)
    end

  end

  @[Extern]
  record IAppxBlockMapFilesEnumeratorVtbl,
    query_interface : Proc(IAppxBlockMapFilesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBlockMapFilesEnumerator*, UInt32),
    release : Proc(IAppxBlockMapFilesEnumerator*, UInt32),
    get_current : Proc(IAppxBlockMapFilesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxBlockMapFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxBlockMapFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("02b856a2-4262-4070-bacb-1a8cbbc42305")]
  record IAppxBlockMapFilesEnumerator, lpVtbl : IAppxBlockMapFilesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x2b856a2_u32, 0x4262_u16, 0x4070_u16, StaticArray[0xba_u8, 0xcb_u8, 0x1a_u8, 0x8c_u8, 0xbb_u8, 0xc4_u8, 0x23_u8, 0x5_u8])
    def query_interface(this : IAppxBlockMapFilesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBlockMapFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBlockMapFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxBlockMapFilesEnumerator*, file : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, file)
    end
    def get_has_current(this : IAppxBlockMapFilesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxBlockMapFilesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasCurrent)
    end

  end

  @[Extern]
  record IAppxBlockMapBlockVtbl,
    query_interface : Proc(IAppxBlockMapBlock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBlockMapBlock*, UInt32),
    release : Proc(IAppxBlockMapBlock*, UInt32),
    get_hash : Proc(IAppxBlockMapBlock*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_compressed_size : Proc(IAppxBlockMapBlock*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("75cf3930-3244-4fe0-a8c8-e0bcb270b889")]
  record IAppxBlockMapBlock, lpVtbl : IAppxBlockMapBlockVtbl* do
    GUID = LibC::GUID.new(0x75cf3930_u32, 0x3244_u16, 0x4fe0_u16, StaticArray[0xa8_u8, 0xc8_u8, 0xe0_u8, 0xbc_u8, 0xb2_u8, 0x70_u8, 0xb8_u8, 0x89_u8])
    def query_interface(this : IAppxBlockMapBlock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBlockMapBlock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBlockMapBlock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_hash(this : IAppxBlockMapBlock*, bufferSize : UInt32*, buffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash.call(this, bufferSize, buffer)
    end
    def get_compressed_size(this : IAppxBlockMapBlock*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_compressed_size.call(this, size)
    end

  end

  @[Extern]
  record IAppxBlockMapBlocksEnumeratorVtbl,
    query_interface : Proc(IAppxBlockMapBlocksEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBlockMapBlocksEnumerator*, UInt32),
    release : Proc(IAppxBlockMapBlocksEnumerator*, UInt32),
    get_current : Proc(IAppxBlockMapBlocksEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxBlockMapBlocksEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxBlockMapBlocksEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6b429b5b-36ef-479e-b9eb-0c1482b49e16")]
  record IAppxBlockMapBlocksEnumerator, lpVtbl : IAppxBlockMapBlocksEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x6b429b5b_u32, 0x36ef_u16, 0x479e_u16, StaticArray[0xb9_u8, 0xeb_u8, 0xc_u8, 0x14_u8, 0x82_u8, 0xb4_u8, 0x9e_u8, 0x16_u8])
    def query_interface(this : IAppxBlockMapBlocksEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBlockMapBlocksEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBlockMapBlocksEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxBlockMapBlocksEnumerator*, block : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, block)
    end
    def get_has_current(this : IAppxBlockMapBlocksEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxBlockMapBlocksEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestReaderVtbl,
    query_interface : Proc(IAppxManifestReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader*, UInt32),
    release : Proc(IAppxManifestReader*, UInt32),
    get_package_id : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_package_dependencies : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IAppxManifestReader*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    get_resources : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_device_capabilities : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite : Proc(IAppxManifestReader*, Win32cr::Foundation::PWSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_applications : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxManifestReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4e1bd148-55a0-4480-a3d1-15544710637c")]
  record IAppxManifestReader, lpVtbl : IAppxManifestReaderVtbl* do
    GUID = LibC::GUID.new(0x4e1bd148_u32, 0x55a0_u16, 0x4480_u16, StaticArray[0xa3_u8, 0xd1_u8, 0x15_u8, 0x54_u8, 0x47_u8, 0x10_u8, 0x63_u8, 0x7c_u8])
    def query_interface(this : IAppxManifestReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxManifestReader*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_properties(this : IAppxManifestReader*, packageProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, packageProperties)
    end
    def get_package_dependencies(this : IAppxManifestReader*, dependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_dependencies.call(this, dependencies)
    end
    def get_capabilities(this : IAppxManifestReader*, capabilities : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, capabilities)
    end
    def get_resources(this : IAppxManifestReader*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resources.call(this, resources)
    end
    def get_device_capabilities(this : IAppxManifestReader*, deviceCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_capabilities.call(this, deviceCapabilities)
    end
    def get_prerequisite(this : IAppxManifestReader*, name : Win32cr::Foundation::PWSTR, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite.call(this, name, value)
    end
    def get_applications(this : IAppxManifestReader*, applications : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applications.call(this, applications)
    end
    def get_stream(this : IAppxManifestReader*, manifestStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, manifestStream)
    end

  end

  @[Extern]
  record IAppxManifestReader2Vtbl,
    query_interface : Proc(IAppxManifestReader2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader2*, UInt32),
    release : Proc(IAppxManifestReader2*, UInt32),
    get_package_id : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_package_dependencies : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IAppxManifestReader2*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    get_resources : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_device_capabilities : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite : Proc(IAppxManifestReader2*, Win32cr::Foundation::PWSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_applications : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT),
    get_qualified_resources : Proc(IAppxManifestReader2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d06f67bc-b31d-4eba-a8af-638e73e77b4d")]
  record IAppxManifestReader2, lpVtbl : IAppxManifestReader2Vtbl* do
    GUID = LibC::GUID.new(0xd06f67bc_u32, 0xb31d_u16, 0x4eba_u16, StaticArray[0xa8_u8, 0xaf_u8, 0x63_u8, 0x8e_u8, 0x73_u8, 0xe7_u8, 0x7b_u8, 0x4d_u8])
    def query_interface(this : IAppxManifestReader2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxManifestReader2*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_properties(this : IAppxManifestReader2*, packageProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, packageProperties)
    end
    def get_package_dependencies(this : IAppxManifestReader2*, dependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_dependencies.call(this, dependencies)
    end
    def get_capabilities(this : IAppxManifestReader2*, capabilities : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, capabilities)
    end
    def get_resources(this : IAppxManifestReader2*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resources.call(this, resources)
    end
    def get_device_capabilities(this : IAppxManifestReader2*, deviceCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_capabilities.call(this, deviceCapabilities)
    end
    def get_prerequisite(this : IAppxManifestReader2*, name : Win32cr::Foundation::PWSTR, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite.call(this, name, value)
    end
    def get_applications(this : IAppxManifestReader2*, applications : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applications.call(this, applications)
    end
    def get_stream(this : IAppxManifestReader2*, manifestStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, manifestStream)
    end
    def get_qualified_resources(this : IAppxManifestReader2*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_qualified_resources.call(this, resources)
    end

  end

  @[Extern]
  record IAppxManifestReader3Vtbl,
    query_interface : Proc(IAppxManifestReader3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader3*, UInt32),
    release : Proc(IAppxManifestReader3*, UInt32),
    get_package_id : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_package_dependencies : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IAppxManifestReader3*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    get_resources : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_device_capabilities : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite : Proc(IAppxManifestReader3*, Win32cr::Foundation::PWSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_applications : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_qualified_resources : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities_by_capability_class : Proc(IAppxManifestReader3*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITY_CLASS_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_target_device_families : Proc(IAppxManifestReader3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c43825ab-69b7-400a-9709-cc37f5a72d24")]
  record IAppxManifestReader3, lpVtbl : IAppxManifestReader3Vtbl* do
    GUID = LibC::GUID.new(0xc43825ab_u32, 0x69b7_u16, 0x400a_u16, StaticArray[0x97_u8, 0x9_u8, 0xcc_u8, 0x37_u8, 0xf5_u8, 0xa7_u8, 0x2d_u8, 0x24_u8])
    def query_interface(this : IAppxManifestReader3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxManifestReader3*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_properties(this : IAppxManifestReader3*, packageProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, packageProperties)
    end
    def get_package_dependencies(this : IAppxManifestReader3*, dependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_dependencies.call(this, dependencies)
    end
    def get_capabilities(this : IAppxManifestReader3*, capabilities : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, capabilities)
    end
    def get_resources(this : IAppxManifestReader3*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resources.call(this, resources)
    end
    def get_device_capabilities(this : IAppxManifestReader3*, deviceCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_capabilities.call(this, deviceCapabilities)
    end
    def get_prerequisite(this : IAppxManifestReader3*, name : Win32cr::Foundation::PWSTR, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite.call(this, name, value)
    end
    def get_applications(this : IAppxManifestReader3*, applications : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applications.call(this, applications)
    end
    def get_stream(this : IAppxManifestReader3*, manifestStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, manifestStream)
    end
    def get_qualified_resources(this : IAppxManifestReader3*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_qualified_resources.call(this, resources)
    end
    def get_capabilities_by_capability_class(this : IAppxManifestReader3*, capabilityClass : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITY_CLASS_TYPE, capabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities_by_capability_class.call(this, capabilityClass, capabilities)
    end
    def get_target_device_families(this : IAppxManifestReader3*, targetDeviceFamilies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_device_families.call(this, targetDeviceFamilies)
    end

  end

  @[Extern]
  record IAppxManifestReader4Vtbl,
    query_interface : Proc(IAppxManifestReader4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader4*, UInt32),
    release : Proc(IAppxManifestReader4*, UInt32),
    get_package_id : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_package_dependencies : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IAppxManifestReader4*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    get_resources : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_device_capabilities : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite : Proc(IAppxManifestReader4*, Win32cr::Foundation::PWSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_applications : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_qualified_resources : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_capabilities_by_capability_class : Proc(IAppxManifestReader4*, Win32cr::Storage::Packaging::Appx::APPX_CAPABILITY_CLASS_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_target_device_families : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT),
    get_optional_package_info : Proc(IAppxManifestReader4*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4579bb7c-741d-4161-b5a1-47bd3b78ad9b")]
  record IAppxManifestReader4, lpVtbl : IAppxManifestReader4Vtbl* do
    GUID = LibC::GUID.new(0x4579bb7c_u32, 0x741d_u16, 0x4161_u16, StaticArray[0xb5_u8, 0xa1_u8, 0x47_u8, 0xbd_u8, 0x3b_u8, 0x78_u8, 0xad_u8, 0x9b_u8])
    def query_interface(this : IAppxManifestReader4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxManifestReader4*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_properties(this : IAppxManifestReader4*, packageProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, packageProperties)
    end
    def get_package_dependencies(this : IAppxManifestReader4*, dependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_dependencies.call(this, dependencies)
    end
    def get_capabilities(this : IAppxManifestReader4*, capabilities : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, capabilities)
    end
    def get_resources(this : IAppxManifestReader4*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resources.call(this, resources)
    end
    def get_device_capabilities(this : IAppxManifestReader4*, deviceCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_capabilities.call(this, deviceCapabilities)
    end
    def get_prerequisite(this : IAppxManifestReader4*, name : Win32cr::Foundation::PWSTR, value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite.call(this, name, value)
    end
    def get_applications(this : IAppxManifestReader4*, applications : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applications.call(this, applications)
    end
    def get_stream(this : IAppxManifestReader4*, manifestStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, manifestStream)
    end
    def get_qualified_resources(this : IAppxManifestReader4*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_qualified_resources.call(this, resources)
    end
    def get_capabilities_by_capability_class(this : IAppxManifestReader4*, capabilityClass : Win32cr::Storage::Packaging::Appx::APPX_CAPABILITY_CLASS_TYPE, capabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities_by_capability_class.call(this, capabilityClass, capabilities)
    end
    def get_target_device_families(this : IAppxManifestReader4*, targetDeviceFamilies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_device_families.call(this, targetDeviceFamilies)
    end
    def get_optional_package_info(this : IAppxManifestReader4*, optionalPackageInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optional_package_info.call(this, optionalPackageInfo)
    end

  end

  @[Extern]
  record IAppxManifestReader5Vtbl,
    query_interface : Proc(IAppxManifestReader5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader5*, UInt32),
    release : Proc(IAppxManifestReader5*, UInt32),
    get_main_package_dependencies : Proc(IAppxManifestReader5*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8d7ae132-a690-4c00-b75a-6aae1feaac80")]
  record IAppxManifestReader5, lpVtbl : IAppxManifestReader5Vtbl* do
    GUID = LibC::GUID.new(0x8d7ae132_u32, 0xa690_u16, 0x4c00_u16, StaticArray[0xb7_u8, 0x5a_u8, 0x6a_u8, 0xae_u8, 0x1f_u8, 0xea_u8, 0xac_u8, 0x80_u8])
    def query_interface(this : IAppxManifestReader5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_main_package_dependencies(this : IAppxManifestReader5*, mainPackageDependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_package_dependencies.call(this, mainPackageDependencies)
    end

  end

  @[Extern]
  record IAppxManifestReader6Vtbl,
    query_interface : Proc(IAppxManifestReader6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader6*, UInt32),
    release : Proc(IAppxManifestReader6*, UInt32),
    get_is_non_qualified_resource_package : Proc(IAppxManifestReader6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("34deaca4-d3c0-4e3e-b312-e42625e3807e")]
  record IAppxManifestReader6, lpVtbl : IAppxManifestReader6Vtbl* do
    GUID = LibC::GUID.new(0x34deaca4_u32, 0xd3c0_u16, 0x4e3e_u16, StaticArray[0xb3_u8, 0x12_u8, 0xe4_u8, 0x26_u8, 0x25_u8, 0xe3_u8, 0x80_u8, 0x7e_u8])
    def query_interface(this : IAppxManifestReader6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_is_non_qualified_resource_package(this : IAppxManifestReader6*, isNonQualifiedResourcePackage : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_non_qualified_resource_package.call(this, isNonQualifiedResourcePackage)
    end

  end

  @[Extern]
  record IAppxManifestReader7Vtbl,
    query_interface : Proc(IAppxManifestReader7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestReader7*, UInt32),
    release : Proc(IAppxManifestReader7*, UInt32),
    get_driver_dependencies : Proc(IAppxManifestReader7*, Void**, Win32cr::Foundation::HRESULT),
    get_os_package_dependencies : Proc(IAppxManifestReader7*, Void**, Win32cr::Foundation::HRESULT),
    get_host_runtime_dependencies : Proc(IAppxManifestReader7*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8efe6f27-0ce0-4988-b32d-738eb63db3b7")]
  record IAppxManifestReader7, lpVtbl : IAppxManifestReader7Vtbl* do
    GUID = LibC::GUID.new(0x8efe6f27_u32, 0xce0_u16, 0x4988_u16, StaticArray[0xb3_u8, 0x2d_u8, 0x73_u8, 0x8e_u8, 0xb6_u8, 0x3d_u8, 0xb3_u8, 0xb7_u8])
    def query_interface(this : IAppxManifestReader7*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestReader7*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestReader7*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_driver_dependencies(this : IAppxManifestReader7*, driverDependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_driver_dependencies.call(this, driverDependencies)
    end
    def get_os_package_dependencies(this : IAppxManifestReader7*, osPackageDependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_os_package_dependencies.call(this, osPackageDependencies)
    end
    def get_host_runtime_dependencies(this : IAppxManifestReader7*, hostRuntimeDependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_runtime_dependencies.call(this, hostRuntimeDependencies)
    end

  end

  @[Extern]
  record IAppxManifestDriverDependenciesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestDriverDependenciesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestDriverDependenciesEnumerator*, UInt32),
    release : Proc(IAppxManifestDriverDependenciesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestDriverDependenciesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestDriverDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestDriverDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fe039db2-467f-4755-8404-8f5eb6865b33")]
  record IAppxManifestDriverDependenciesEnumerator, lpVtbl : IAppxManifestDriverDependenciesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xfe039db2_u32, 0x467f_u16, 0x4755_u16, StaticArray[0x84_u8, 0x4_u8, 0x8f_u8, 0x5e_u8, 0xb6_u8, 0x86_u8, 0x5b_u8, 0x33_u8])
    def query_interface(this : IAppxManifestDriverDependenciesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestDriverDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestDriverDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestDriverDependenciesEnumerator*, driverDependency : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, driverDependency)
    end
    def get_has_current(this : IAppxManifestDriverDependenciesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestDriverDependenciesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestDriverDependencyVtbl,
    query_interface : Proc(IAppxManifestDriverDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestDriverDependency*, UInt32),
    release : Proc(IAppxManifestDriverDependency*, UInt32),
    get_driver_constraints : Proc(IAppxManifestDriverDependency*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1210cb94-5a92-4602-be24-79f318af4af9")]
  record IAppxManifestDriverDependency, lpVtbl : IAppxManifestDriverDependencyVtbl* do
    GUID = LibC::GUID.new(0x1210cb94_u32, 0x5a92_u16, 0x4602_u16, StaticArray[0xbe_u8, 0x24_u8, 0x79_u8, 0xf3_u8, 0x18_u8, 0xaf_u8, 0x4a_u8, 0xf9_u8])
    def query_interface(this : IAppxManifestDriverDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestDriverDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestDriverDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_driver_constraints(this : IAppxManifestDriverDependency*, driverConstraints : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_driver_constraints.call(this, driverConstraints)
    end

  end

  @[Extern]
  record IAppxManifestDriverConstraintsEnumeratorVtbl,
    query_interface : Proc(IAppxManifestDriverConstraintsEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestDriverConstraintsEnumerator*, UInt32),
    release : Proc(IAppxManifestDriverConstraintsEnumerator*, UInt32),
    get_current : Proc(IAppxManifestDriverConstraintsEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestDriverConstraintsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestDriverConstraintsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d402b2d1-f600-49e0-95e6-975d8da13d89")]
  record IAppxManifestDriverConstraintsEnumerator, lpVtbl : IAppxManifestDriverConstraintsEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xd402b2d1_u32, 0xf600_u16, 0x49e0_u16, StaticArray[0x95_u8, 0xe6_u8, 0x97_u8, 0x5d_u8, 0x8d_u8, 0xa1_u8, 0x3d_u8, 0x89_u8])
    def query_interface(this : IAppxManifestDriverConstraintsEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestDriverConstraintsEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestDriverConstraintsEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestDriverConstraintsEnumerator*, driverConstraint : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, driverConstraint)
    end
    def get_has_current(this : IAppxManifestDriverConstraintsEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestDriverConstraintsEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestDriverConstraintVtbl,
    query_interface : Proc(IAppxManifestDriverConstraint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestDriverConstraint*, UInt32),
    release : Proc(IAppxManifestDriverConstraint*, UInt32),
    get_name : Proc(IAppxManifestDriverConstraint*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_min_version : Proc(IAppxManifestDriverConstraint*, UInt64*, Win32cr::Foundation::HRESULT),
    get_min_date : Proc(IAppxManifestDriverConstraint*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c031bee4-bbcc-48ea-a237-c34045c80a07")]
  record IAppxManifestDriverConstraint, lpVtbl : IAppxManifestDriverConstraintVtbl* do
    GUID = LibC::GUID.new(0xc031bee4_u32, 0xbbcc_u16, 0x48ea_u16, StaticArray[0xa2_u8, 0x37_u8, 0xc3_u8, 0x40_u8, 0x45_u8, 0xc8_u8, 0xa_u8, 0x7_u8])
    def query_interface(this : IAppxManifestDriverConstraint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestDriverConstraint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestDriverConstraint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestDriverConstraint*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_min_version(this : IAppxManifestDriverConstraint*, minVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_version.call(this, minVersion)
    end
    def get_min_date(this : IAppxManifestDriverConstraint*, minDate : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_date.call(this, minDate)
    end

  end

  @[Extern]
  record IAppxManifestOSPackageDependenciesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestOSPackageDependenciesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestOSPackageDependenciesEnumerator*, UInt32),
    release : Proc(IAppxManifestOSPackageDependenciesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestOSPackageDependenciesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestOSPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestOSPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b84e2fc3-f8ec-4bc1-8ae2-156346f5ffea")]
  record IAppxManifestOSPackageDependenciesEnumerator, lpVtbl : IAppxManifestOSPackageDependenciesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xb84e2fc3_u32, 0xf8ec_u16, 0x4bc1_u16, StaticArray[0x8a_u8, 0xe2_u8, 0x15_u8, 0x63_u8, 0x46_u8, 0xf5_u8, 0xff_u8, 0xea_u8])
    def query_interface(this : IAppxManifestOSPackageDependenciesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestOSPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestOSPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestOSPackageDependenciesEnumerator*, osPackageDependency : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, osPackageDependency)
    end
    def get_has_current(this : IAppxManifestOSPackageDependenciesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestOSPackageDependenciesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestOSPackageDependencyVtbl,
    query_interface : Proc(IAppxManifestOSPackageDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestOSPackageDependency*, UInt32),
    release : Proc(IAppxManifestOSPackageDependency*, UInt32),
    get_name : Proc(IAppxManifestOSPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IAppxManifestOSPackageDependency*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("154995ee-54a6-4f14-ac97-d8cf0519644b")]
  record IAppxManifestOSPackageDependency, lpVtbl : IAppxManifestOSPackageDependencyVtbl* do
    GUID = LibC::GUID.new(0x154995ee_u32, 0x54a6_u16, 0x4f14_u16, StaticArray[0xac_u8, 0x97_u8, 0xd8_u8, 0xcf_u8, 0x5_u8, 0x19_u8, 0x64_u8, 0x4b_u8])
    def query_interface(this : IAppxManifestOSPackageDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestOSPackageDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestOSPackageDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestOSPackageDependency*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_version(this : IAppxManifestOSPackageDependency*, version : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, version)
    end

  end

  @[Extern]
  record IAppxManifestHostRuntimeDependenciesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, UInt32),
    release : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestHostRuntimeDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6427a646-7f49-433e-b1a6-0da309f6885a")]
  record IAppxManifestHostRuntimeDependenciesEnumerator, lpVtbl : IAppxManifestHostRuntimeDependenciesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x6427a646_u32, 0x7f49_u16, 0x433e_u16, StaticArray[0xb1_u8, 0xa6_u8, 0xd_u8, 0xa3_u8, 0x9_u8, 0xf6_u8, 0x88_u8, 0x5a_u8])
    def query_interface(this : IAppxManifestHostRuntimeDependenciesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestHostRuntimeDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestHostRuntimeDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestHostRuntimeDependenciesEnumerator*, hostRuntimeDependency : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, hostRuntimeDependency)
    end
    def get_has_current(this : IAppxManifestHostRuntimeDependenciesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestHostRuntimeDependenciesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestHostRuntimeDependencyVtbl,
    query_interface : Proc(IAppxManifestHostRuntimeDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestHostRuntimeDependency*, UInt32),
    release : Proc(IAppxManifestHostRuntimeDependency*, UInt32),
    get_name : Proc(IAppxManifestHostRuntimeDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestHostRuntimeDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_min_version : Proc(IAppxManifestHostRuntimeDependency*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3455d234-8414-410d-95c7-7b35255b8391")]
  record IAppxManifestHostRuntimeDependency, lpVtbl : IAppxManifestHostRuntimeDependencyVtbl* do
    GUID = LibC::GUID.new(0x3455d234_u32, 0x8414_u16, 0x410d_u16, StaticArray[0x95_u8, 0xc7_u8, 0x7b_u8, 0x35_u8, 0x25_u8, 0x5b_u8, 0x83_u8, 0x91_u8])
    def query_interface(this : IAppxManifestHostRuntimeDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestHostRuntimeDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestHostRuntimeDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestHostRuntimeDependency*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_publisher(this : IAppxManifestHostRuntimeDependency*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_min_version(this : IAppxManifestHostRuntimeDependency*, minVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_version.call(this, minVersion)
    end

  end

  @[Extern]
  record IAppxManifestHostRuntimeDependency2Vtbl,
    query_interface : Proc(IAppxManifestHostRuntimeDependency2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestHostRuntimeDependency2*, UInt32),
    release : Proc(IAppxManifestHostRuntimeDependency2*, UInt32),
    get_package_family_name : Proc(IAppxManifestHostRuntimeDependency2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c26f23a8-ee10-4ad6-b898-2b4d7aebfe6a")]
  record IAppxManifestHostRuntimeDependency2, lpVtbl : IAppxManifestHostRuntimeDependency2Vtbl* do
    GUID = LibC::GUID.new(0xc26f23a8_u32, 0xee10_u16, 0x4ad6_u16, StaticArray[0xb8_u8, 0x98_u8, 0x2b_u8, 0x4d_u8, 0x7a_u8, 0xeb_u8, 0xfe_u8, 0x6a_u8])
    def query_interface(this : IAppxManifestHostRuntimeDependency2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestHostRuntimeDependency2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestHostRuntimeDependency2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_family_name(this : IAppxManifestHostRuntimeDependency2*, packageFamilyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_family_name.call(this, packageFamilyName)
    end

  end

  @[Extern]
  record IAppxManifestOptionalPackageInfoVtbl,
    query_interface : Proc(IAppxManifestOptionalPackageInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestOptionalPackageInfo*, UInt32),
    release : Proc(IAppxManifestOptionalPackageInfo*, UInt32),
    get_is_optional_package : Proc(IAppxManifestOptionalPackageInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_main_package_name : Proc(IAppxManifestOptionalPackageInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2634847d-5b5d-4fe5-a243-002ff95edc7e")]
  record IAppxManifestOptionalPackageInfo, lpVtbl : IAppxManifestOptionalPackageInfoVtbl* do
    GUID = LibC::GUID.new(0x2634847d_u32, 0x5b5d_u16, 0x4fe5_u16, StaticArray[0xa2_u8, 0x43_u8, 0x0_u8, 0x2f_u8, 0xf9_u8, 0x5e_u8, 0xdc_u8, 0x7e_u8])
    def query_interface(this : IAppxManifestOptionalPackageInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestOptionalPackageInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestOptionalPackageInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_is_optional_package(this : IAppxManifestOptionalPackageInfo*, isOptionalPackage : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_optional_package.call(this, isOptionalPackage)
    end
    def get_main_package_name(this : IAppxManifestOptionalPackageInfo*, mainPackageName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_package_name.call(this, mainPackageName)
    end

  end

  @[Extern]
  record IAppxManifestMainPackageDependenciesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestMainPackageDependenciesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestMainPackageDependenciesEnumerator*, UInt32),
    release : Proc(IAppxManifestMainPackageDependenciesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestMainPackageDependenciesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestMainPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestMainPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a99c4f00-51d2-4f0f-ba46-7ed5255ebdff")]
  record IAppxManifestMainPackageDependenciesEnumerator, lpVtbl : IAppxManifestMainPackageDependenciesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xa99c4f00_u32, 0x51d2_u16, 0x4f0f_u16, StaticArray[0xba_u8, 0x46_u8, 0x7e_u8, 0xd5_u8, 0x25_u8, 0x5e_u8, 0xbd_u8, 0xff_u8])
    def query_interface(this : IAppxManifestMainPackageDependenciesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestMainPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestMainPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestMainPackageDependenciesEnumerator*, mainPackageDependency : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, mainPackageDependency)
    end
    def get_has_current(this : IAppxManifestMainPackageDependenciesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestMainPackageDependenciesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestMainPackageDependencyVtbl,
    query_interface : Proc(IAppxManifestMainPackageDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestMainPackageDependency*, UInt32),
    release : Proc(IAppxManifestMainPackageDependency*, UInt32),
    get_name : Proc(IAppxManifestMainPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestMainPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_package_family_name : Proc(IAppxManifestMainPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("05d0611c-bc29-46d5-97e2-84b9c79bd8ae")]
  record IAppxManifestMainPackageDependency, lpVtbl : IAppxManifestMainPackageDependencyVtbl* do
    GUID = LibC::GUID.new(0x5d0611c_u32, 0xbc29_u16, 0x46d5_u16, StaticArray[0x97_u8, 0xe2_u8, 0x84_u8, 0xb9_u8, 0xc7_u8, 0x9b_u8, 0xd8_u8, 0xae_u8])
    def query_interface(this : IAppxManifestMainPackageDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestMainPackageDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestMainPackageDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestMainPackageDependency*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_publisher(this : IAppxManifestMainPackageDependency*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_package_family_name(this : IAppxManifestMainPackageDependency*, packageFamilyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_family_name.call(this, packageFamilyName)
    end

  end

  @[Extern]
  record IAppxManifestPackageIdVtbl,
    query_interface : Proc(IAppxManifestPackageId*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageId*, UInt32),
    release : Proc(IAppxManifestPackageId*, UInt32),
    get_name : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_architecture : Proc(IAppxManifestPackageId*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IAppxManifestPackageId*, UInt64*, Win32cr::Foundation::HRESULT),
    get_resource_id : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    compare_publisher : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_package_full_name : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_package_family_name : Proc(IAppxManifestPackageId*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("283ce2d7-7153-4a91-9649-7a0f7240945f")]
  record IAppxManifestPackageId, lpVtbl : IAppxManifestPackageIdVtbl* do
    GUID = LibC::GUID.new(0x283ce2d7_u32, 0x7153_u16, 0x4a91_u16, StaticArray[0x96_u8, 0x49_u8, 0x7a_u8, 0xf_u8, 0x72_u8, 0x40_u8, 0x94_u8, 0x5f_u8])
    def query_interface(this : IAppxManifestPackageId*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageId*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageId*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestPackageId*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_architecture(this : IAppxManifestPackageId*, architecture : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_architecture.call(this, architecture)
    end
    def get_publisher(this : IAppxManifestPackageId*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_version(this : IAppxManifestPackageId*, packageVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, packageVersion)
    end
    def get_resource_id(this : IAppxManifestPackageId*, resourceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_id.call(this, resourceId)
    end
    def compare_publisher(this : IAppxManifestPackageId*, other : Win32cr::Foundation::PWSTR, isSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_publisher.call(this, other, isSame)
    end
    def get_package_full_name(this : IAppxManifestPackageId*, packageFullName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_full_name.call(this, packageFullName)
    end
    def get_package_family_name(this : IAppxManifestPackageId*, packageFamilyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_family_name.call(this, packageFamilyName)
    end

  end

  @[Extern]
  record IAppxManifestPackageId2Vtbl,
    query_interface : Proc(IAppxManifestPackageId2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageId2*, UInt32),
    release : Proc(IAppxManifestPackageId2*, UInt32),
    get_name : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_architecture : Proc(IAppxManifestPackageId2*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IAppxManifestPackageId2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_resource_id : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    compare_publisher : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_package_full_name : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_package_family_name : Proc(IAppxManifestPackageId2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_architecture2 : Proc(IAppxManifestPackageId2*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2256999d-d617-42f1-880e-0ba4542319d5")]
  record IAppxManifestPackageId2, lpVtbl : IAppxManifestPackageId2Vtbl* do
    GUID = LibC::GUID.new(0x2256999d_u32, 0xd617_u16, 0x42f1_u16, StaticArray[0x88_u8, 0xe_u8, 0xb_u8, 0xa4_u8, 0x54_u8, 0x23_u8, 0x19_u8, 0xd5_u8])
    def query_interface(this : IAppxManifestPackageId2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageId2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageId2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestPackageId2*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_architecture(this : IAppxManifestPackageId2*, architecture : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_architecture.call(this, architecture)
    end
    def get_publisher(this : IAppxManifestPackageId2*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_version(this : IAppxManifestPackageId2*, packageVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, packageVersion)
    end
    def get_resource_id(this : IAppxManifestPackageId2*, resourceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_id.call(this, resourceId)
    end
    def compare_publisher(this : IAppxManifestPackageId2*, other : Win32cr::Foundation::PWSTR, isSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_publisher.call(this, other, isSame)
    end
    def get_package_full_name(this : IAppxManifestPackageId2*, packageFullName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_full_name.call(this, packageFullName)
    end
    def get_package_family_name(this : IAppxManifestPackageId2*, packageFamilyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_family_name.call(this, packageFamilyName)
    end
    def get_architecture2(this : IAppxManifestPackageId2*, architecture : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_ARCHITECTURE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_architecture2.call(this, architecture)
    end

  end

  @[Extern]
  record IAppxManifestPropertiesVtbl,
    query_interface : Proc(IAppxManifestProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestProperties*, UInt32),
    release : Proc(IAppxManifestProperties*, UInt32),
    get_bool_value : Proc(IAppxManifestProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(IAppxManifestProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("03faf64d-f26f-4b2c-aaf7-8fe7789b8bca")]
  record IAppxManifestProperties, lpVtbl : IAppxManifestPropertiesVtbl* do
    GUID = LibC::GUID.new(0x3faf64d_u32, 0xf26f_u16, 0x4b2c_u16, StaticArray[0xaa_u8, 0xf7_u8, 0x8f_u8, 0xe7_u8, 0x78_u8, 0x9b_u8, 0x8b_u8, 0xca_u8])
    def query_interface(this : IAppxManifestProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_bool_value(this : IAppxManifestProperties*, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bool_value.call(this, name, value)
    end
    def get_string_value(this : IAppxManifestProperties*, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, name, value)
    end

  end

  @[Extern]
  record IAppxManifestTargetDeviceFamiliesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, UInt32),
    release : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestTargetDeviceFamiliesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("36537f36-27a4-4788-88c0-733819575017")]
  record IAppxManifestTargetDeviceFamiliesEnumerator, lpVtbl : IAppxManifestTargetDeviceFamiliesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x36537f36_u32, 0x27a4_u16, 0x4788_u16, StaticArray[0x88_u8, 0xc0_u8, 0x73_u8, 0x38_u8, 0x19_u8, 0x57_u8, 0x50_u8, 0x17_u8])
    def query_interface(this : IAppxManifestTargetDeviceFamiliesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestTargetDeviceFamiliesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestTargetDeviceFamiliesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestTargetDeviceFamiliesEnumerator*, targetDeviceFamily : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, targetDeviceFamily)
    end
    def get_has_current(this : IAppxManifestTargetDeviceFamiliesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestTargetDeviceFamiliesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestTargetDeviceFamilyVtbl,
    query_interface : Proc(IAppxManifestTargetDeviceFamily*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestTargetDeviceFamily*, UInt32),
    release : Proc(IAppxManifestTargetDeviceFamily*, UInt32),
    get_name : Proc(IAppxManifestTargetDeviceFamily*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_min_version : Proc(IAppxManifestTargetDeviceFamily*, UInt64*, Win32cr::Foundation::HRESULT),
    get_max_version_tested : Proc(IAppxManifestTargetDeviceFamily*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9091b09b-c8d5-4f31-8687-a338259faefb")]
  record IAppxManifestTargetDeviceFamily, lpVtbl : IAppxManifestTargetDeviceFamilyVtbl* do
    GUID = LibC::GUID.new(0x9091b09b_u32, 0xc8d5_u16, 0x4f31_u16, StaticArray[0x86_u8, 0x87_u8, 0xa3_u8, 0x38_u8, 0x25_u8, 0x9f_u8, 0xae_u8, 0xfb_u8])
    def query_interface(this : IAppxManifestTargetDeviceFamily*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestTargetDeviceFamily*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestTargetDeviceFamily*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestTargetDeviceFamily*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_min_version(this : IAppxManifestTargetDeviceFamily*, minVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_version.call(this, minVersion)
    end
    def get_max_version_tested(this : IAppxManifestTargetDeviceFamily*, maxVersionTested : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_version_tested.call(this, maxVersionTested)
    end

  end

  @[Extern]
  record IAppxManifestPackageDependenciesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestPackageDependenciesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageDependenciesEnumerator*, UInt32),
    release : Proc(IAppxManifestPackageDependenciesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestPackageDependenciesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestPackageDependenciesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b43bbcf9-65a6-42dd-bac0-8c6741e7f5a4")]
  record IAppxManifestPackageDependenciesEnumerator, lpVtbl : IAppxManifestPackageDependenciesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xb43bbcf9_u32, 0x65a6_u16, 0x42dd_u16, StaticArray[0xba_u8, 0xc0_u8, 0x8c_u8, 0x67_u8, 0x41_u8, 0xe7_u8, 0xf5_u8, 0xa4_u8])
    def query_interface(this : IAppxManifestPackageDependenciesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageDependenciesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestPackageDependenciesEnumerator*, dependency : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, dependency)
    end
    def get_has_current(this : IAppxManifestPackageDependenciesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestPackageDependenciesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestPackageDependencyVtbl,
    query_interface : Proc(IAppxManifestPackageDependency*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageDependency*, UInt32),
    release : Proc(IAppxManifestPackageDependency*, UInt32),
    get_name : Proc(IAppxManifestPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestPackageDependency*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_min_version : Proc(IAppxManifestPackageDependency*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e4946b59-733e-43f0-a724-3bde4c1285a0")]
  record IAppxManifestPackageDependency, lpVtbl : IAppxManifestPackageDependencyVtbl* do
    GUID = LibC::GUID.new(0xe4946b59_u32, 0x733e_u16, 0x43f0_u16, StaticArray[0xa7_u8, 0x24_u8, 0x3b_u8, 0xde_u8, 0x4c_u8, 0x12_u8, 0x85_u8, 0xa0_u8])
    def query_interface(this : IAppxManifestPackageDependency*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageDependency*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageDependency*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestPackageDependency*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_publisher(this : IAppxManifestPackageDependency*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_min_version(this : IAppxManifestPackageDependency*, minVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_version.call(this, minVersion)
    end

  end

  @[Extern]
  record IAppxManifestPackageDependency2Vtbl,
    query_interface : Proc(IAppxManifestPackageDependency2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageDependency2*, UInt32),
    release : Proc(IAppxManifestPackageDependency2*, UInt32),
    get_name : Proc(IAppxManifestPackageDependency2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_publisher : Proc(IAppxManifestPackageDependency2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_min_version : Proc(IAppxManifestPackageDependency2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_max_major_version_tested : Proc(IAppxManifestPackageDependency2*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dda0b713-f3ff-49d3-898a-2786780c5d98")]
  record IAppxManifestPackageDependency2, lpVtbl : IAppxManifestPackageDependency2Vtbl* do
    GUID = LibC::GUID.new(0xdda0b713_u32, 0xf3ff_u16, 0x49d3_u16, StaticArray[0x89_u8, 0x8a_u8, 0x27_u8, 0x86_u8, 0x78_u8, 0xc_u8, 0x5d_u8, 0x98_u8])
    def query_interface(this : IAppxManifestPackageDependency2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageDependency2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageDependency2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxManifestPackageDependency2*, name : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_publisher(this : IAppxManifestPackageDependency2*, publisher : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher.call(this, publisher)
    end
    def get_min_version(this : IAppxManifestPackageDependency2*, minVersion : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_version.call(this, minVersion)
    end
    def get_max_major_version_tested(this : IAppxManifestPackageDependency2*, maxMajorVersionTested : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_major_version_tested.call(this, maxMajorVersionTested)
    end

  end

  @[Extern]
  record IAppxManifestPackageDependency3Vtbl,
    query_interface : Proc(IAppxManifestPackageDependency3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestPackageDependency3*, UInt32),
    release : Proc(IAppxManifestPackageDependency3*, UInt32),
    get_is_optional : Proc(IAppxManifestPackageDependency3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1ac56374-6198-4d6b-92e4-749d5ab8a895")]
  record IAppxManifestPackageDependency3, lpVtbl : IAppxManifestPackageDependency3Vtbl* do
    GUID = LibC::GUID.new(0x1ac56374_u32, 0x6198_u16, 0x4d6b_u16, StaticArray[0x92_u8, 0xe4_u8, 0x74_u8, 0x9d_u8, 0x5a_u8, 0xb8_u8, 0xa8_u8, 0x95_u8])
    def query_interface(this : IAppxManifestPackageDependency3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestPackageDependency3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestPackageDependency3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_is_optional(this : IAppxManifestPackageDependency3*, isOptional : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_optional.call(this, isOptional)
    end

  end

  @[Extern]
  record IAppxManifestResourcesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestResourcesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestResourcesEnumerator*, UInt32),
    release : Proc(IAppxManifestResourcesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestResourcesEnumerator*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestResourcesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestResourcesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("de4dfbbd-881a-48bb-858c-d6f2baeae6ed")]
  record IAppxManifestResourcesEnumerator, lpVtbl : IAppxManifestResourcesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xde4dfbbd_u32, 0x881a_u16, 0x48bb_u16, StaticArray[0x85_u8, 0x8c_u8, 0xd6_u8, 0xf2_u8, 0xba_u8, 0xea_u8, 0xe6_u8, 0xed_u8])
    def query_interface(this : IAppxManifestResourcesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestResourcesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestResourcesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestResourcesEnumerator*, resource : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, resource)
    end
    def get_has_current(this : IAppxManifestResourcesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestResourcesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestDeviceCapabilitiesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, UInt32),
    release : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestDeviceCapabilitiesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30204541-427b-4a1c-bacf-655bf463a540")]
  record IAppxManifestDeviceCapabilitiesEnumerator, lpVtbl : IAppxManifestDeviceCapabilitiesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x30204541_u32, 0x427b_u16, 0x4a1c_u16, StaticArray[0xba_u8, 0xcf_u8, 0x65_u8, 0x5b_u8, 0xf4_u8, 0x63_u8, 0xa5_u8, 0x40_u8])
    def query_interface(this : IAppxManifestDeviceCapabilitiesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestDeviceCapabilitiesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestDeviceCapabilitiesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestDeviceCapabilitiesEnumerator*, deviceCapability : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, deviceCapability)
    end
    def get_has_current(this : IAppxManifestDeviceCapabilitiesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestDeviceCapabilitiesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestCapabilitiesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestCapabilitiesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestCapabilitiesEnumerator*, UInt32),
    release : Proc(IAppxManifestCapabilitiesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestCapabilitiesEnumerator*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestCapabilitiesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestCapabilitiesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("11d22258-f470-42c1-b291-8361c5437e41")]
  record IAppxManifestCapabilitiesEnumerator, lpVtbl : IAppxManifestCapabilitiesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x11d22258_u32, 0xf470_u16, 0x42c1_u16, StaticArray[0xb2_u8, 0x91_u8, 0x83_u8, 0x61_u8, 0xc5_u8, 0x43_u8, 0x7e_u8, 0x41_u8])
    def query_interface(this : IAppxManifestCapabilitiesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestCapabilitiesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestCapabilitiesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestCapabilitiesEnumerator*, capability : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, capability)
    end
    def get_has_current(this : IAppxManifestCapabilitiesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestCapabilitiesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestApplicationsEnumeratorVtbl,
    query_interface : Proc(IAppxManifestApplicationsEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestApplicationsEnumerator*, UInt32),
    release : Proc(IAppxManifestApplicationsEnumerator*, UInt32),
    get_current : Proc(IAppxManifestApplicationsEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestApplicationsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestApplicationsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9eb8a55a-f04b-4d0d-808d-686185d4847a")]
  record IAppxManifestApplicationsEnumerator, lpVtbl : IAppxManifestApplicationsEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x9eb8a55a_u32, 0xf04b_u16, 0x4d0d_u16, StaticArray[0x80_u8, 0x8d_u8, 0x68_u8, 0x61_u8, 0x85_u8, 0xd4_u8, 0x84_u8, 0x7a_u8])
    def query_interface(this : IAppxManifestApplicationsEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestApplicationsEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestApplicationsEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestApplicationsEnumerator*, application : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, application)
    end
    def get_has_current(this : IAppxManifestApplicationsEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestApplicationsEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestApplicationVtbl,
    query_interface : Proc(IAppxManifestApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestApplication*, UInt32),
    release : Proc(IAppxManifestApplication*, UInt32),
    get_string_value : Proc(IAppxManifestApplication*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_app_user_model_id : Proc(IAppxManifestApplication*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5da89bf4-3773-46be-b650-7e744863b7e8")]
  record IAppxManifestApplication, lpVtbl : IAppxManifestApplicationVtbl* do
    GUID = LibC::GUID.new(0x5da89bf4_u32, 0x3773_u16, 0x46be_u16, StaticArray[0xb6_u8, 0x50_u8, 0x7e_u8, 0x74_u8, 0x48_u8, 0x63_u8, 0xb7_u8, 0xe8_u8])
    def query_interface(this : IAppxManifestApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string_value(this : IAppxManifestApplication*, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, name, value)
    end
    def get_app_user_model_id(this : IAppxManifestApplication*, appUserModelId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_user_model_id.call(this, appUserModelId)
    end

  end

  @[Extern]
  record IAppxManifestQualifiedResourcesEnumeratorVtbl,
    query_interface : Proc(IAppxManifestQualifiedResourcesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestQualifiedResourcesEnumerator*, UInt32),
    release : Proc(IAppxManifestQualifiedResourcesEnumerator*, UInt32),
    get_current : Proc(IAppxManifestQualifiedResourcesEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxManifestQualifiedResourcesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxManifestQualifiedResourcesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8ef6adfe-3762-4a8f-9373-2fc5d444c8d2")]
  record IAppxManifestQualifiedResourcesEnumerator, lpVtbl : IAppxManifestQualifiedResourcesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x8ef6adfe_u32, 0x3762_u16, 0x4a8f_u16, StaticArray[0x93_u8, 0x73_u8, 0x2f_u8, 0xc5_u8, 0xd4_u8, 0x44_u8, 0xc8_u8, 0xd2_u8])
    def query_interface(this : IAppxManifestQualifiedResourcesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestQualifiedResourcesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestQualifiedResourcesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxManifestQualifiedResourcesEnumerator*, resource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, resource)
    end
    def get_has_current(this : IAppxManifestQualifiedResourcesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxManifestQualifiedResourcesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxManifestQualifiedResourceVtbl,
    query_interface : Proc(IAppxManifestQualifiedResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxManifestQualifiedResource*, UInt32),
    release : Proc(IAppxManifestQualifiedResource*, UInt32),
    get_language : Proc(IAppxManifestQualifiedResource*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_scale : Proc(IAppxManifestQualifiedResource*, UInt32*, Win32cr::Foundation::HRESULT),
    get_dx_feature_level : Proc(IAppxManifestQualifiedResource*, Win32cr::Storage::Packaging::Appx::DX_FEATURE_LEVEL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4")]
  record IAppxManifestQualifiedResource, lpVtbl : IAppxManifestQualifiedResourceVtbl* do
    GUID = LibC::GUID.new(0x3b53a497_u32, 0x3c5c_u16, 0x48d1_u16, StaticArray[0x9e_u8, 0xa3_u8, 0xbb_u8, 0x7e_u8, 0xac_u8, 0x8c_u8, 0xd7_u8, 0xd4_u8])
    def query_interface(this : IAppxManifestQualifiedResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxManifestQualifiedResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxManifestQualifiedResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_language(this : IAppxManifestQualifiedResource*, language : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, language)
    end
    def get_scale(this : IAppxManifestQualifiedResource*, scale : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scale.call(this, scale)
    end
    def get_dx_feature_level(this : IAppxManifestQualifiedResource*, dxFeatureLevel : Win32cr::Storage::Packaging::Appx::DX_FEATURE_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dx_feature_level.call(this, dxFeatureLevel)
    end

  end

  @[Extern]
  record IAppxBundleFactoryVtbl,
    query_interface : Proc(IAppxBundleFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleFactory*, UInt32),
    release : Proc(IAppxBundleFactory*, UInt32),
    create_bundle_writer : Proc(IAppxBundleFactory*, Void*, UInt64, Void**, Win32cr::Foundation::HRESULT),
    create_bundle_reader : Proc(IAppxBundleFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_bundle_manifest_reader : Proc(IAppxBundleFactory*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bba65864-965f-4a5f-855f-f074bdbf3a7b")]
  record IAppxBundleFactory, lpVtbl : IAppxBundleFactoryVtbl* do
    GUID = LibC::GUID.new(0xbba65864_u32, 0x965f_u16, 0x4a5f_u16, StaticArray[0x85_u8, 0x5f_u8, 0xf0_u8, 0x74_u8, 0xbd_u8, 0xbf_u8, 0x3a_u8, 0x7b_u8])
    def query_interface(this : IAppxBundleFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_bundle_writer(this : IAppxBundleFactory*, outputStream : Void*, bundleVersion : UInt64, bundleWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bundle_writer.call(this, outputStream, bundleVersion, bundleWriter)
    end
    def create_bundle_reader(this : IAppxBundleFactory*, inputStream : Void*, bundleReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bundle_reader.call(this, inputStream, bundleReader)
    end
    def create_bundle_manifest_reader(this : IAppxBundleFactory*, inputStream : Void*, manifestReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bundle_manifest_reader.call(this, inputStream, manifestReader)
    end

  end

  @[Extern]
  record IAppxBundleWriterVtbl,
    query_interface : Proc(IAppxBundleWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleWriter*, UInt32),
    release : Proc(IAppxBundleWriter*, UInt32),
    add_payload_package : Proc(IAppxBundleWriter*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxBundleWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ec446fe8-bfec-4c64-ab4f-49f038f0c6d2")]
  record IAppxBundleWriter, lpVtbl : IAppxBundleWriterVtbl* do
    GUID = LibC::GUID.new(0xec446fe8_u32, 0xbfec_u16, 0x4c64_u16, StaticArray[0xab_u8, 0x4f_u8, 0x49_u8, 0xf0_u8, 0x38_u8, 0xf0_u8, 0xc6_u8, 0xd2_u8])
    def query_interface(this : IAppxBundleWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_package(this : IAppxBundleWriter*, fileName : Win32cr::Foundation::PWSTR, packageStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_package.call(this, fileName, packageStream)
    end
    def close(this : IAppxBundleWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IAppxBundleWriter2Vtbl,
    query_interface : Proc(IAppxBundleWriter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleWriter2*, UInt32),
    release : Proc(IAppxBundleWriter2*, UInt32),
    add_external_package_reference : Proc(IAppxBundleWriter2*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6d8fe971-01cc-49a0-b685-233851279962")]
  record IAppxBundleWriter2, lpVtbl : IAppxBundleWriter2Vtbl* do
    GUID = LibC::GUID.new(0x6d8fe971_u32, 0x1cc_u16, 0x49a0_u16, StaticArray[0xb6_u8, 0x85_u8, 0x23_u8, 0x38_u8, 0x51_u8, 0x27_u8, 0x99_u8, 0x62_u8])
    def query_interface(this : IAppxBundleWriter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleWriter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleWriter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_external_package_reference(this : IAppxBundleWriter2*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_external_package_reference.call(this, fileName, inputStream)
    end

  end

  @[Extern]
  record IAppxBundleWriter3Vtbl,
    query_interface : Proc(IAppxBundleWriter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleWriter3*, UInt32),
    release : Proc(IAppxBundleWriter3*, UInt32),
    add_package_reference : Proc(IAppxBundleWriter3*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxBundleWriter3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ad711152-f969-4193-82d5-9ddf2786d21a")]
  record IAppxBundleWriter3, lpVtbl : IAppxBundleWriter3Vtbl* do
    GUID = LibC::GUID.new(0xad711152_u32, 0xf969_u16, 0x4193_u16, StaticArray[0x82_u8, 0xd5_u8, 0x9d_u8, 0xdf_u8, 0x27_u8, 0x86_u8, 0xd2_u8, 0x1a_u8])
    def query_interface(this : IAppxBundleWriter3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleWriter3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleWriter3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_package_reference(this : IAppxBundleWriter3*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_package_reference.call(this, fileName, inputStream)
    end
    def close(this : IAppxBundleWriter3*, hashMethodString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this, hashMethodString)
    end

  end

  @[Extern]
  record IAppxBundleWriter4Vtbl,
    query_interface : Proc(IAppxBundleWriter4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleWriter4*, UInt32),
    release : Proc(IAppxBundleWriter4*, UInt32),
    add_payload_package : Proc(IAppxBundleWriter4*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_package_reference : Proc(IAppxBundleWriter4*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_external_package_reference : Proc(IAppxBundleWriter4*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9cd9d523-5009-4c01-9882-dc029fbd47a3")]
  record IAppxBundleWriter4, lpVtbl : IAppxBundleWriter4Vtbl* do
    GUID = LibC::GUID.new(0x9cd9d523_u32, 0x5009_u16, 0x4c01_u16, StaticArray[0x98_u8, 0x82_u8, 0xdc_u8, 0x2_u8, 0x9f_u8, 0xbd_u8, 0x47_u8, 0xa3_u8])
    def query_interface(this : IAppxBundleWriter4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleWriter4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleWriter4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_package(this : IAppxBundleWriter4*, fileName : Win32cr::Foundation::PWSTR, packageStream : Void*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_package.call(this, fileName, packageStream, isDefaultApplicablePackage)
    end
    def add_package_reference(this : IAppxBundleWriter4*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_package_reference.call(this, fileName, inputStream, isDefaultApplicablePackage)
    end
    def add_external_package_reference(this : IAppxBundleWriter4*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_external_package_reference.call(this, fileName, inputStream, isDefaultApplicablePackage)
    end

  end

  @[Extern]
  record IAppxBundleReaderVtbl,
    query_interface : Proc(IAppxBundleReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleReader*, UInt32),
    release : Proc(IAppxBundleReader*, UInt32),
    get_footprint_file : Proc(IAppxBundleReader*, Win32cr::Storage::Packaging::Appx::APPX_BUNDLE_FOOTPRINT_FILE_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_block_map : Proc(IAppxBundleReader*, Void**, Win32cr::Foundation::HRESULT),
    get_manifest : Proc(IAppxBundleReader*, Void**, Win32cr::Foundation::HRESULT),
    get_payload_packages : Proc(IAppxBundleReader*, Void**, Win32cr::Foundation::HRESULT),
    get_payload_package : Proc(IAppxBundleReader*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8")]
  record IAppxBundleReader, lpVtbl : IAppxBundleReaderVtbl* do
    GUID = LibC::GUID.new(0xdd75b8c0_u32, 0xba76_u16, 0x43b0_u16, StaticArray[0xae_u8, 0xf_u8, 0x68_u8, 0x65_u8, 0x6a_u8, 0x1d_u8, 0xc5_u8, 0xc8_u8])
    def query_interface(this : IAppxBundleReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_footprint_file(this : IAppxBundleReader*, fileType : Win32cr::Storage::Packaging::Appx::APPX_BUNDLE_FOOTPRINT_FILE_TYPE, footprintFile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_footprint_file.call(this, fileType, footprintFile)
    end
    def get_block_map(this : IAppxBundleReader*, blockMapReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_block_map.call(this, blockMapReader)
    end
    def get_manifest(this : IAppxBundleReader*, manifestReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manifest.call(this, manifestReader)
    end
    def get_payload_packages(this : IAppxBundleReader*, payloadPackages : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_payload_packages.call(this, payloadPackages)
    end
    def get_payload_package(this : IAppxBundleReader*, fileName : Win32cr::Foundation::PWSTR, payloadPackage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_payload_package.call(this, fileName, payloadPackage)
    end

  end

  @[Extern]
  record IAppxBundleManifestReaderVtbl,
    query_interface : Proc(IAppxBundleManifestReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestReader*, UInt32),
    release : Proc(IAppxBundleManifestReader*, UInt32),
    get_package_id : Proc(IAppxBundleManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_package_info_items : Proc(IAppxBundleManifestReader*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IAppxBundleManifestReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cf0ebbc1-cc99-4106-91eb-e67462e04fb0")]
  record IAppxBundleManifestReader, lpVtbl : IAppxBundleManifestReaderVtbl* do
    GUID = LibC::GUID.new(0xcf0ebbc1_u32, 0xcc99_u16, 0x4106_u16, StaticArray[0x91_u8, 0xeb_u8, 0xe6_u8, 0x74_u8, 0x62_u8, 0xe0_u8, 0x4f_u8, 0xb0_u8])
    def query_interface(this : IAppxBundleManifestReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxBundleManifestReader*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_package_info_items(this : IAppxBundleManifestReader*, packageInfoItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_info_items.call(this, packageInfoItems)
    end
    def get_stream(this : IAppxBundleManifestReader*, manifestStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, manifestStream)
    end

  end

  @[Extern]
  record IAppxBundleManifestReader2Vtbl,
    query_interface : Proc(IAppxBundleManifestReader2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestReader2*, UInt32),
    release : Proc(IAppxBundleManifestReader2*, UInt32),
    get_optional_bundles : Proc(IAppxBundleManifestReader2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5517df70-033f-4af2-8213-87d766805c02")]
  record IAppxBundleManifestReader2, lpVtbl : IAppxBundleManifestReader2Vtbl* do
    GUID = LibC::GUID.new(0x5517df70_u32, 0x33f_u16, 0x4af2_u16, StaticArray[0x82_u8, 0x13_u8, 0x87_u8, 0xd7_u8, 0x66_u8, 0x80_u8, 0x5c_u8, 0x2_u8])
    def query_interface(this : IAppxBundleManifestReader2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestReader2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestReader2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_optional_bundles(this : IAppxBundleManifestReader2*, optionalBundles : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optional_bundles.call(this, optionalBundles)
    end

  end

  @[Extern]
  record IAppxBundleManifestPackageInfoEnumeratorVtbl,
    query_interface : Proc(IAppxBundleManifestPackageInfoEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestPackageInfoEnumerator*, UInt32),
    release : Proc(IAppxBundleManifestPackageInfoEnumerator*, UInt32),
    get_current : Proc(IAppxBundleManifestPackageInfoEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxBundleManifestPackageInfoEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxBundleManifestPackageInfoEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f9b856ee-49a6-4e19-b2b0-6a2406d63a32")]
  record IAppxBundleManifestPackageInfoEnumerator, lpVtbl : IAppxBundleManifestPackageInfoEnumeratorVtbl* do
    GUID = LibC::GUID.new(0xf9b856ee_u32, 0x49a6_u16, 0x4e19_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x24_u8, 0x6_u8, 0xd6_u8, 0x3a_u8, 0x32_u8])
    def query_interface(this : IAppxBundleManifestPackageInfoEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestPackageInfoEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestPackageInfoEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxBundleManifestPackageInfoEnumerator*, packageInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, packageInfo)
    end
    def get_has_current(this : IAppxBundleManifestPackageInfoEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxBundleManifestPackageInfoEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxBundleManifestPackageInfoVtbl,
    query_interface : Proc(IAppxBundleManifestPackageInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestPackageInfo*, UInt32),
    release : Proc(IAppxBundleManifestPackageInfo*, UInt32),
    get_package_type : Proc(IAppxBundleManifestPackageInfo*, Win32cr::Storage::Packaging::Appx::APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*, Win32cr::Foundation::HRESULT),
    get_package_id : Proc(IAppxBundleManifestPackageInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_file_name : Proc(IAppxBundleManifestPackageInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_offset : Proc(IAppxBundleManifestPackageInfo*, UInt64*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IAppxBundleManifestPackageInfo*, UInt64*, Win32cr::Foundation::HRESULT),
    get_resources : Proc(IAppxBundleManifestPackageInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("54cd06c1-268f-40bb-8ed2-757a9ebaec8d")]
  record IAppxBundleManifestPackageInfo, lpVtbl : IAppxBundleManifestPackageInfoVtbl* do
    GUID = LibC::GUID.new(0x54cd06c1_u32, 0x268f_u16, 0x40bb_u16, StaticArray[0x8e_u8, 0xd2_u8, 0x75_u8, 0x7a_u8, 0x9e_u8, 0xba_u8, 0xec_u8, 0x8d_u8])
    def query_interface(this : IAppxBundleManifestPackageInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestPackageInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestPackageInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_type(this : IAppxBundleManifestPackageInfo*, packageType : Win32cr::Storage::Packaging::Appx::APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_type.call(this, packageType)
    end
    def get_package_id(this : IAppxBundleManifestPackageInfo*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_file_name(this : IAppxBundleManifestPackageInfo*, fileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_name.call(this, fileName)
    end
    def get_offset(this : IAppxBundleManifestPackageInfo*, offset : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_offset.call(this, offset)
    end
    def get_size(this : IAppxBundleManifestPackageInfo*, size : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, size)
    end
    def get_resources(this : IAppxBundleManifestPackageInfo*, resources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resources.call(this, resources)
    end

  end

  @[Extern]
  record IAppxBundleManifestPackageInfo2Vtbl,
    query_interface : Proc(IAppxBundleManifestPackageInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestPackageInfo2*, UInt32),
    release : Proc(IAppxBundleManifestPackageInfo2*, UInt32),
    get_is_package_reference : Proc(IAppxBundleManifestPackageInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_is_non_qualified_resource_package : Proc(IAppxBundleManifestPackageInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_is_default_applicable_package : Proc(IAppxBundleManifestPackageInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e")]
  record IAppxBundleManifestPackageInfo2, lpVtbl : IAppxBundleManifestPackageInfo2Vtbl* do
    GUID = LibC::GUID.new(0x44c2acbc_u32, 0xb2cf_u16, 0x4ccb_u16, StaticArray[0xbb_u8, 0xdb_u8, 0x9c_u8, 0x6d_u8, 0xa8_u8, 0xc3_u8, 0xbc_u8, 0x9e_u8])
    def query_interface(this : IAppxBundleManifestPackageInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestPackageInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestPackageInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_is_package_reference(this : IAppxBundleManifestPackageInfo2*, isPackageReference : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_package_reference.call(this, isPackageReference)
    end
    def get_is_non_qualified_resource_package(this : IAppxBundleManifestPackageInfo2*, isNonQualifiedResourcePackage : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_non_qualified_resource_package.call(this, isNonQualifiedResourcePackage)
    end
    def get_is_default_applicable_package(this : IAppxBundleManifestPackageInfo2*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_default_applicable_package.call(this, isDefaultApplicablePackage)
    end

  end

  @[Extern]
  record IAppxBundleManifestPackageInfo3Vtbl,
    query_interface : Proc(IAppxBundleManifestPackageInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestPackageInfo3*, UInt32),
    release : Proc(IAppxBundleManifestPackageInfo3*, UInt32),
    get_target_device_families : Proc(IAppxBundleManifestPackageInfo3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6ba74b98-bb74-4296-80d0-5f4256a99675")]
  record IAppxBundleManifestPackageInfo3, lpVtbl : IAppxBundleManifestPackageInfo3Vtbl* do
    GUID = LibC::GUID.new(0x6ba74b98_u32, 0xbb74_u16, 0x4296_u16, StaticArray[0x80_u8, 0xd0_u8, 0x5f_u8, 0x42_u8, 0x56_u8, 0xa9_u8, 0x96_u8, 0x75_u8])
    def query_interface(this : IAppxBundleManifestPackageInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestPackageInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestPackageInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_target_device_families(this : IAppxBundleManifestPackageInfo3*, targetDeviceFamilies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_device_families.call(this, targetDeviceFamilies)
    end

  end

  @[Extern]
  record IAppxBundleManifestPackageInfo4Vtbl,
    query_interface : Proc(IAppxBundleManifestPackageInfo4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestPackageInfo4*, UInt32),
    release : Proc(IAppxBundleManifestPackageInfo4*, UInt32),
    get_is_stub : Proc(IAppxBundleManifestPackageInfo4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5da6f13d-a8a7-4532-857c-1393d659371d")]
  record IAppxBundleManifestPackageInfo4, lpVtbl : IAppxBundleManifestPackageInfo4Vtbl* do
    GUID = LibC::GUID.new(0x5da6f13d_u32, 0xa8a7_u16, 0x4532_u16, StaticArray[0x85_u8, 0x7c_u8, 0x13_u8, 0x93_u8, 0xd6_u8, 0x59_u8, 0x37_u8, 0x1d_u8])
    def query_interface(this : IAppxBundleManifestPackageInfo4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestPackageInfo4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestPackageInfo4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_is_stub(this : IAppxBundleManifestPackageInfo4*, isStub : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_stub.call(this, isStub)
    end

  end

  @[Extern]
  record IAppxBundleManifestOptionalBundleInfoEnumeratorVtbl,
    query_interface : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, UInt32),
    release : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, UInt32),
    get_current : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxBundleManifestOptionalBundleInfoEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9a178793-f97e-46ac-aaca-dd5ba4c177c8")]
  record IAppxBundleManifestOptionalBundleInfoEnumerator, lpVtbl : IAppxBundleManifestOptionalBundleInfoEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x9a178793_u32, 0xf97e_u16, 0x46ac_u16, StaticArray[0xaa_u8, 0xca_u8, 0xdd_u8, 0x5b_u8, 0xa4_u8, 0xc1_u8, 0x77_u8, 0xc8_u8])
    def query_interface(this : IAppxBundleManifestOptionalBundleInfoEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestOptionalBundleInfoEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestOptionalBundleInfoEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxBundleManifestOptionalBundleInfoEnumerator*, optionalBundle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, optionalBundle)
    end
    def get_has_current(this : IAppxBundleManifestOptionalBundleInfoEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxBundleManifestOptionalBundleInfoEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxBundleManifestOptionalBundleInfoVtbl,
    query_interface : Proc(IAppxBundleManifestOptionalBundleInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxBundleManifestOptionalBundleInfo*, UInt32),
    release : Proc(IAppxBundleManifestOptionalBundleInfo*, UInt32),
    get_package_id : Proc(IAppxBundleManifestOptionalBundleInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_file_name : Proc(IAppxBundleManifestOptionalBundleInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_package_info_items : Proc(IAppxBundleManifestOptionalBundleInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("515bf2e8-bcb0-4d69-8c48-e383147b6e12")]
  record IAppxBundleManifestOptionalBundleInfo, lpVtbl : IAppxBundleManifestOptionalBundleInfoVtbl* do
    GUID = LibC::GUID.new(0x515bf2e8_u32, 0xbcb0_u16, 0x4d69_u16, StaticArray[0x8c_u8, 0x48_u8, 0xe3_u8, 0x83_u8, 0x14_u8, 0x7b_u8, 0x6e_u8, 0x12_u8])
    def query_interface(this : IAppxBundleManifestOptionalBundleInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxBundleManifestOptionalBundleInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxBundleManifestOptionalBundleInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_id(this : IAppxBundleManifestOptionalBundleInfo*, packageId : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_id.call(this, packageId)
    end
    def get_file_name(this : IAppxBundleManifestOptionalBundleInfo*, fileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_name.call(this, fileName)
    end
    def get_package_info_items(this : IAppxBundleManifestOptionalBundleInfo*, packageInfoItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_info_items.call(this, packageInfoItems)
    end

  end

  @[Extern]
  record IAppxContentGroupFilesEnumeratorVtbl,
    query_interface : Proc(IAppxContentGroupFilesEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxContentGroupFilesEnumerator*, UInt32),
    release : Proc(IAppxContentGroupFilesEnumerator*, UInt32),
    get_current : Proc(IAppxContentGroupFilesEnumerator*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxContentGroupFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxContentGroupFilesEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1a09a2fd-7440-44eb-8c84-848205a6a1cc")]
  record IAppxContentGroupFilesEnumerator, lpVtbl : IAppxContentGroupFilesEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x1a09a2fd_u32, 0x7440_u16, 0x44eb_u16, StaticArray[0x8c_u8, 0x84_u8, 0x84_u8, 0x82_u8, 0x5_u8, 0xa6_u8, 0xa1_u8, 0xcc_u8])
    def query_interface(this : IAppxContentGroupFilesEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxContentGroupFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxContentGroupFilesEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxContentGroupFilesEnumerator*, file : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, file)
    end
    def get_has_current(this : IAppxContentGroupFilesEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxContentGroupFilesEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxContentGroupVtbl,
    query_interface : Proc(IAppxContentGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxContentGroup*, UInt32),
    release : Proc(IAppxContentGroup*, UInt32),
    get_name : Proc(IAppxContentGroup*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_files : Proc(IAppxContentGroup*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("328f6468-c04f-4e3c-b6fa-6b8d27f3003a")]
  record IAppxContentGroup, lpVtbl : IAppxContentGroupVtbl* do
    GUID = LibC::GUID.new(0x328f6468_u32, 0xc04f_u16, 0x4e3c_u16, StaticArray[0xb6_u8, 0xfa_u8, 0x6b_u8, 0x8d_u8, 0x27_u8, 0xf3_u8, 0x0_u8, 0x3a_u8])
    def query_interface(this : IAppxContentGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxContentGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxContentGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IAppxContentGroup*, groupName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, groupName)
    end
    def get_files(this : IAppxContentGroup*, enumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_files.call(this, enumerator)
    end

  end

  @[Extern]
  record IAppxContentGroupsEnumeratorVtbl,
    query_interface : Proc(IAppxContentGroupsEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxContentGroupsEnumerator*, UInt32),
    release : Proc(IAppxContentGroupsEnumerator*, UInt32),
    get_current : Proc(IAppxContentGroupsEnumerator*, Void**, Win32cr::Foundation::HRESULT),
    get_has_current : Proc(IAppxContentGroupsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IAppxContentGroupsEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3264e477-16d1-4d63-823e-7d2984696634")]
  record IAppxContentGroupsEnumerator, lpVtbl : IAppxContentGroupsEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x3264e477_u32, 0x16d1_u16, 0x4d63_u16, StaticArray[0x82_u8, 0x3e_u8, 0x7d_u8, 0x29_u8, 0x84_u8, 0x69_u8, 0x66_u8, 0x34_u8])
    def query_interface(this : IAppxContentGroupsEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxContentGroupsEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxContentGroupsEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IAppxContentGroupsEnumerator*, stream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, stream)
    end
    def get_has_current(this : IAppxContentGroupsEnumerator*, hasCurrent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_has_current.call(this, hasCurrent)
    end
    def move_next(this : IAppxContentGroupsEnumerator*, hasNext : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, hasNext)
    end

  end

  @[Extern]
  record IAppxContentGroupMapReaderVtbl,
    query_interface : Proc(IAppxContentGroupMapReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxContentGroupMapReader*, UInt32),
    release : Proc(IAppxContentGroupMapReader*, UInt32),
    get_required_group : Proc(IAppxContentGroupMapReader*, Void**, Win32cr::Foundation::HRESULT),
    get_automatic_groups : Proc(IAppxContentGroupMapReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("418726d8-dd99-4f5d-9886-157add20de01")]
  record IAppxContentGroupMapReader, lpVtbl : IAppxContentGroupMapReaderVtbl* do
    GUID = LibC::GUID.new(0x418726d8_u32, 0xdd99_u16, 0x4f5d_u16, StaticArray[0x98_u8, 0x86_u8, 0x15_u8, 0x7a_u8, 0xdd_u8, 0x20_u8, 0xde_u8, 0x1_u8])
    def query_interface(this : IAppxContentGroupMapReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxContentGroupMapReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxContentGroupMapReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_required_group(this : IAppxContentGroupMapReader*, requiredGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_required_group.call(this, requiredGroup)
    end
    def get_automatic_groups(this : IAppxContentGroupMapReader*, automaticGroupsEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_automatic_groups.call(this, automaticGroupsEnumerator)
    end

  end

  @[Extern]
  record IAppxSourceContentGroupMapReaderVtbl,
    query_interface : Proc(IAppxSourceContentGroupMapReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxSourceContentGroupMapReader*, UInt32),
    release : Proc(IAppxSourceContentGroupMapReader*, UInt32),
    get_required_group : Proc(IAppxSourceContentGroupMapReader*, Void**, Win32cr::Foundation::HRESULT),
    get_automatic_groups : Proc(IAppxSourceContentGroupMapReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f329791d-540b-4a9f-bc75-3282b7d73193")]
  record IAppxSourceContentGroupMapReader, lpVtbl : IAppxSourceContentGroupMapReaderVtbl* do
    GUID = LibC::GUID.new(0xf329791d_u32, 0x540b_u16, 0x4a9f_u16, StaticArray[0xbc_u8, 0x75_u8, 0x32_u8, 0x82_u8, 0xb7_u8, 0xd7_u8, 0x31_u8, 0x93_u8])
    def query_interface(this : IAppxSourceContentGroupMapReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxSourceContentGroupMapReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxSourceContentGroupMapReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_required_group(this : IAppxSourceContentGroupMapReader*, requiredGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_required_group.call(this, requiredGroup)
    end
    def get_automatic_groups(this : IAppxSourceContentGroupMapReader*, automaticGroupsEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_automatic_groups.call(this, automaticGroupsEnumerator)
    end

  end

  @[Extern]
  record IAppxContentGroupMapWriterVtbl,
    query_interface : Proc(IAppxContentGroupMapWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxContentGroupMapWriter*, UInt32),
    release : Proc(IAppxContentGroupMapWriter*, UInt32),
    add_automatic_group : Proc(IAppxContentGroupMapWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_automatic_file : Proc(IAppxContentGroupMapWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxContentGroupMapWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d07ab776-a9de-4798-8c14-3db31e687c78")]
  record IAppxContentGroupMapWriter, lpVtbl : IAppxContentGroupMapWriterVtbl* do
    GUID = LibC::GUID.new(0xd07ab776_u32, 0xa9de_u16, 0x4798_u16, StaticArray[0x8c_u8, 0x14_u8, 0x3d_u8, 0xb3_u8, 0x1e_u8, 0x68_u8, 0x7c_u8, 0x78_u8])
    def query_interface(this : IAppxContentGroupMapWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxContentGroupMapWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxContentGroupMapWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_automatic_group(this : IAppxContentGroupMapWriter*, groupName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automatic_group.call(this, groupName)
    end
    def add_automatic_file(this : IAppxContentGroupMapWriter*, fileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automatic_file.call(this, fileName)
    end
    def close(this : IAppxContentGroupMapWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IAppxPackagingDiagnosticEventSinkVtbl,
    query_interface : Proc(IAppxPackagingDiagnosticEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackagingDiagnosticEventSink*, UInt32),
    release : Proc(IAppxPackagingDiagnosticEventSink*, UInt32),
    report_context_change : Proc(IAppxPackagingDiagnosticEventSink*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGING_CONTEXT_CHANGE_TYPE, Int32, Win32cr::Foundation::PSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    report_error : Proc(IAppxPackagingDiagnosticEventSink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17239d47-6adb-45d2-80f6-f9cbc3bf059d")]
  record IAppxPackagingDiagnosticEventSink, lpVtbl : IAppxPackagingDiagnosticEventSinkVtbl* do
    GUID = LibC::GUID.new(0x17239d47_u32, 0x6adb_u16, 0x45d2_u16, StaticArray[0x80_u8, 0xf6_u8, 0xf9_u8, 0xcb_u8, 0xc3_u8, 0xbf_u8, 0x5_u8, 0x9d_u8])
    def query_interface(this : IAppxPackagingDiagnosticEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackagingDiagnosticEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackagingDiagnosticEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def report_context_change(this : IAppxPackagingDiagnosticEventSink*, changeType : Win32cr::Storage::Packaging::Appx::APPX_PACKAGING_CONTEXT_CHANGE_TYPE, contextId : Int32, contextName : Win32cr::Foundation::PSTR, contextMessage : Win32cr::Foundation::PWSTR, detailsMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_context_change.call(this, changeType, contextId, contextName, contextMessage, detailsMessage)
    end
    def report_error(this : IAppxPackagingDiagnosticEventSink*, errorMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_error.call(this, errorMessage)
    end

  end

  @[Extern]
  record IAppxPackagingDiagnosticEventSinkManagerVtbl,
    query_interface : Proc(IAppxPackagingDiagnosticEventSinkManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackagingDiagnosticEventSinkManager*, UInt32),
    release : Proc(IAppxPackagingDiagnosticEventSinkManager*, UInt32),
    set_sink_for_process : Proc(IAppxPackagingDiagnosticEventSinkManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("369648fa-a7eb-4909-a15d-6954a078f18a")]
  record IAppxPackagingDiagnosticEventSinkManager, lpVtbl : IAppxPackagingDiagnosticEventSinkManagerVtbl* do
    GUID = LibC::GUID.new(0x369648fa_u32, 0xa7eb_u16, 0x4909_u16, StaticArray[0xa1_u8, 0x5d_u8, 0x69_u8, 0x54_u8, 0xa0_u8, 0x78_u8, 0xf1_u8, 0x8a_u8])
    def query_interface(this : IAppxPackagingDiagnosticEventSinkManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackagingDiagnosticEventSinkManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackagingDiagnosticEventSinkManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_sink_for_process(this : IAppxPackagingDiagnosticEventSinkManager*, sink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sink_for_process.call(this, sink)
    end

  end

  @[Extern]
  record IAppxEncryptionFactoryVtbl,
    query_interface : Proc(IAppxEncryptionFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptionFactory*, UInt32),
    release : Proc(IAppxEncryptionFactory*, UInt32),
    encrypt_package : Proc(IAppxEncryptionFactory*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Win32cr::Foundation::HRESULT),
    decrypt_package : Proc(IAppxEncryptionFactory*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Foundation::HRESULT),
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Void**, Win32cr::Foundation::HRESULT),
    create_encrypted_package_reader : Proc(IAppxEncryptionFactory*, Void*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Void**, Win32cr::Foundation::HRESULT),
    encrypt_bundle : Proc(IAppxEncryptionFactory*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Win32cr::Foundation::HRESULT),
    decrypt_bundle : Proc(IAppxEncryptionFactory*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Foundation::HRESULT),
    create_encrypted_bundle_writer : Proc(IAppxEncryptionFactory*, Void*, UInt64, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Void**, Win32cr::Foundation::HRESULT),
    create_encrypted_bundle_reader : Proc(IAppxEncryptionFactory*, Void*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80e8e04d-8c88-44ae-a011-7cadf6fb2e72")]
  record IAppxEncryptionFactory, lpVtbl : IAppxEncryptionFactoryVtbl* do
    GUID = LibC::GUID.new(0x80e8e04d_u32, 0x8c88_u16, 0x44ae_u16, StaticArray[0xa0_u8, 0x11_u8, 0x7c_u8, 0xad_u8, 0xf6_u8, 0xfb_u8, 0x2e_u8, 0x72_u8])
    def query_interface(this : IAppxEncryptionFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptionFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptionFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def encrypt_package(this : IAppxEncryptionFactory*, inputStream : Void*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt_package.call(this, inputStream, outputStream, settings, keyInfo, exemptedFiles)
    end
    def decrypt_package(this : IAppxEncryptionFactory*, inputStream : Void*, outputStream : Void*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.decrypt_package.call(this, inputStream, outputStream, keyInfo)
    end
    def create_encrypted_package_writer(this : IAppxEncryptionFactory*, outputStream : Void*, manifestStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_package_writer.call(this, outputStream, manifestStream, settings, keyInfo, exemptedFiles, packageWriter)
    end
    def create_encrypted_package_reader(this : IAppxEncryptionFactory*, inputStream : Void*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, packageReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_package_reader.call(this, inputStream, keyInfo, packageReader)
    end
    def encrypt_bundle(this : IAppxEncryptionFactory*, inputStream : Void*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt_bundle.call(this, inputStream, outputStream, settings, keyInfo, exemptedFiles)
    end
    def decrypt_bundle(this : IAppxEncryptionFactory*, inputStream : Void*, outputStream : Void*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.decrypt_bundle.call(this, inputStream, outputStream, keyInfo)
    end
    def create_encrypted_bundle_writer(this : IAppxEncryptionFactory*, outputStream : Void*, bundleVersion : UInt64, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, bundleWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_bundle_writer.call(this, outputStream, bundleVersion, settings, keyInfo, exemptedFiles, bundleWriter)
    end
    def create_encrypted_bundle_reader(this : IAppxEncryptionFactory*, inputStream : Void*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, bundleReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_bundle_reader.call(this, inputStream, keyInfo, bundleReader)
    end

  end

  @[Extern]
  record IAppxEncryptionFactory2Vtbl,
    query_interface : Proc(IAppxEncryptionFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptionFactory2*, UInt32),
    release : Proc(IAppxEncryptionFactory2*, UInt32),
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory2*, Void*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f")]
  record IAppxEncryptionFactory2, lpVtbl : IAppxEncryptionFactory2Vtbl* do
    GUID = LibC::GUID.new(0xc1b11eee_u32, 0xc4ba_u16, 0x4ab2_u16, StaticArray[0xa5_u8, 0x5d_u8, 0xd0_u8, 0x15_u8, 0xfe_u8, 0x8f_u8, 0xf6_u8, 0x4f_u8])
    def query_interface(this : IAppxEncryptionFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptionFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptionFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_encrypted_package_writer(this : IAppxEncryptionFactory2*, outputStream : Void*, manifestStream : Void*, contentGroupMapStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_package_writer.call(this, outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles, packageWriter)
    end

  end

  @[Extern]
  record IAppxEncryptionFactory3Vtbl,
    query_interface : Proc(IAppxEncryptionFactory3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptionFactory3*, UInt32),
    release : Proc(IAppxEncryptionFactory3*, UInt32),
    encrypt_package : Proc(IAppxEncryptionFactory3*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Win32cr::Foundation::HRESULT),
    create_encrypted_package_writer : Proc(IAppxEncryptionFactory3*, Void*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Void**, Win32cr::Foundation::HRESULT),
    encrypt_bundle : Proc(IAppxEncryptionFactory3*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Win32cr::Foundation::HRESULT),
    create_encrypted_bundle_writer : Proc(IAppxEncryptionFactory3*, Void*, UInt64, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("09edca37-cd64-47d6-b7e8-1cb11d4f7e05")]
  record IAppxEncryptionFactory3, lpVtbl : IAppxEncryptionFactory3Vtbl* do
    GUID = LibC::GUID.new(0x9edca37_u32, 0xcd64_u16, 0x47d6_u16, StaticArray[0xb7_u8, 0xe8_u8, 0x1c_u8, 0xb1_u8, 0x1d_u8, 0x4f_u8, 0x7e_u8, 0x5_u8])
    def query_interface(this : IAppxEncryptionFactory3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptionFactory3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptionFactory3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def encrypt_package(this : IAppxEncryptionFactory3*, inputStream : Void*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt_package.call(this, inputStream, outputStream, settings, keyInfo, exemptedFiles)
    end
    def create_encrypted_package_writer(this : IAppxEncryptionFactory3*, outputStream : Void*, manifestStream : Void*, contentGroupMapStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, packageWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_package_writer.call(this, outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles, packageWriter)
    end
    def encrypt_bundle(this : IAppxEncryptionFactory3*, inputStream : Void*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt_bundle.call(this, inputStream, outputStream, settings, keyInfo, exemptedFiles)
    end
    def create_encrypted_bundle_writer(this : IAppxEncryptionFactory3*, outputStream : Void*, bundleVersion : UInt64, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, bundleWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encrypted_bundle_writer.call(this, outputStream, bundleVersion, settings, keyInfo, exemptedFiles, bundleWriter)
    end

  end

  @[Extern]
  record IAppxEncryptionFactory4Vtbl,
    query_interface : Proc(IAppxEncryptionFactory4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptionFactory4*, UInt32),
    release : Proc(IAppxEncryptionFactory4*, UInt32),
    encrypt_package : Proc(IAppxEncryptionFactory4*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a879611f-12fd-41fe-85d5-06ae779bbaf5")]
  record IAppxEncryptionFactory4, lpVtbl : IAppxEncryptionFactory4Vtbl* do
    GUID = LibC::GUID.new(0xa879611f_u32, 0x12fd_u16, 0x41fe_u16, StaticArray[0x85_u8, 0xd5_u8, 0x6_u8, 0xae_u8, 0x77_u8, 0x9b_u8, 0xba_u8, 0xf5_u8])
    def query_interface(this : IAppxEncryptionFactory4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptionFactory4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptionFactory4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def encrypt_package(this : IAppxEncryptionFactory4*, inputStream : Void*, outputStream : Void*, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, exemptedFiles : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_EXEMPTIONS*, memoryLimit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encrypt_package.call(this, inputStream, outputStream, settings, keyInfo, exemptedFiles, memoryLimit)
    end

  end

  @[Extern]
  record IAppxEncryptedPackageWriterVtbl,
    query_interface : Proc(IAppxEncryptedPackageWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptedPackageWriter*, UInt32),
    release : Proc(IAppxEncryptedPackageWriter*, UInt32),
    add_payload_file_encrypted : Proc(IAppxEncryptedPackageWriter*, Win32cr::Foundation::PWSTR, Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxEncryptedPackageWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f43d0b0b-1379-40e2-9b29-682ea2bf42af")]
  record IAppxEncryptedPackageWriter, lpVtbl : IAppxEncryptedPackageWriterVtbl* do
    GUID = LibC::GUID.new(0xf43d0b0b_u32, 0x1379_u16, 0x40e2_u16, StaticArray[0x9b_u8, 0x29_u8, 0x68_u8, 0x2e_u8, 0xa2_u8, 0xbf_u8, 0x42_u8, 0xaf_u8])
    def query_interface(this : IAppxEncryptedPackageWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptedPackageWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptedPackageWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_file_encrypted(this : IAppxEncryptedPackageWriter*, fileName : Win32cr::Foundation::PWSTR, compressionOption : Win32cr::Storage::Packaging::Appx::APPX_COMPRESSION_OPTION, inputStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_file_encrypted.call(this, fileName, compressionOption, inputStream)
    end
    def close(this : IAppxEncryptedPackageWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IAppxEncryptedPackageWriter2Vtbl,
    query_interface : Proc(IAppxEncryptedPackageWriter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptedPackageWriter2*, UInt32),
    release : Proc(IAppxEncryptedPackageWriter2*, UInt32),
    add_payload_files_encrypted : Proc(IAppxEncryptedPackageWriter2*, UInt32, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3e475447-3a25-40b5-8ad2-f953ae50c92d")]
  record IAppxEncryptedPackageWriter2, lpVtbl : IAppxEncryptedPackageWriter2Vtbl* do
    GUID = LibC::GUID.new(0x3e475447_u32, 0x3a25_u16, 0x40b5_u16, StaticArray[0x8a_u8, 0xd2_u8, 0xf9_u8, 0x53_u8, 0xae_u8, 0x50_u8, 0xc9_u8, 0x2d_u8])
    def query_interface(this : IAppxEncryptedPackageWriter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptedPackageWriter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptedPackageWriter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_files_encrypted(this : IAppxEncryptedPackageWriter2*, fileCount : UInt32, payloadFiles : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, memoryLimit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_files_encrypted.call(this, fileCount, payloadFiles, memoryLimit)
    end

  end

  @[Extern]
  record IAppxEncryptedBundleWriterVtbl,
    query_interface : Proc(IAppxEncryptedBundleWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptedBundleWriter*, UInt32),
    release : Proc(IAppxEncryptedBundleWriter*, UInt32),
    add_payload_package_encrypted : Proc(IAppxEncryptedBundleWriter*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IAppxEncryptedBundleWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80b0902f-7bf0-4117-b8c6-4279ef81ee77")]
  record IAppxEncryptedBundleWriter, lpVtbl : IAppxEncryptedBundleWriterVtbl* do
    GUID = LibC::GUID.new(0x80b0902f_u32, 0x7bf0_u16, 0x4117_u16, StaticArray[0xb8_u8, 0xc6_u8, 0x42_u8, 0x79_u8, 0xef_u8, 0x81_u8, 0xee_u8, 0x77_u8])
    def query_interface(this : IAppxEncryptedBundleWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptedBundleWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptedBundleWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_package_encrypted(this : IAppxEncryptedBundleWriter*, fileName : Win32cr::Foundation::PWSTR, packageStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_package_encrypted.call(this, fileName, packageStream)
    end
    def close(this : IAppxEncryptedBundleWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IAppxEncryptedBundleWriter2Vtbl,
    query_interface : Proc(IAppxEncryptedBundleWriter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptedBundleWriter2*, UInt32),
    release : Proc(IAppxEncryptedBundleWriter2*, UInt32),
    add_external_package_reference : Proc(IAppxEncryptedBundleWriter2*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e644be82-f0fa-42b8-a956-8d1cb48ee379")]
  record IAppxEncryptedBundleWriter2, lpVtbl : IAppxEncryptedBundleWriter2Vtbl* do
    GUID = LibC::GUID.new(0xe644be82_u32, 0xf0fa_u16, 0x42b8_u16, StaticArray[0xa9_u8, 0x56_u8, 0x8d_u8, 0x1c_u8, 0xb4_u8, 0x8e_u8, 0xe3_u8, 0x79_u8])
    def query_interface(this : IAppxEncryptedBundleWriter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptedBundleWriter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptedBundleWriter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_external_package_reference(this : IAppxEncryptedBundleWriter2*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_external_package_reference.call(this, fileName, inputStream)
    end

  end

  @[Extern]
  record IAppxEncryptedBundleWriter3Vtbl,
    query_interface : Proc(IAppxEncryptedBundleWriter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxEncryptedBundleWriter3*, UInt32),
    release : Proc(IAppxEncryptedBundleWriter3*, UInt32),
    add_payload_package_encrypted : Proc(IAppxEncryptedBundleWriter3*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_external_package_reference : Proc(IAppxEncryptedBundleWriter3*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0d34deb3-5cae-4dd3-977c-504932a51d31")]
  record IAppxEncryptedBundleWriter3, lpVtbl : IAppxEncryptedBundleWriter3Vtbl* do
    GUID = LibC::GUID.new(0xd34deb3_u32, 0x5cae_u16, 0x4dd3_u16, StaticArray[0x97_u8, 0x7c_u8, 0x50_u8, 0x49_u8, 0x32_u8, 0xa5_u8, 0x1d_u8, 0x31_u8])
    def query_interface(this : IAppxEncryptedBundleWriter3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxEncryptedBundleWriter3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxEncryptedBundleWriter3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_payload_package_encrypted(this : IAppxEncryptedBundleWriter3*, fileName : Win32cr::Foundation::PWSTR, packageStream : Void*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_payload_package_encrypted.call(this, fileName, packageStream, isDefaultApplicablePackage)
    end
    def add_external_package_reference(this : IAppxEncryptedBundleWriter3*, fileName : Win32cr::Foundation::PWSTR, inputStream : Void*, isDefaultApplicablePackage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_external_package_reference.call(this, fileName, inputStream, isDefaultApplicablePackage)
    end

  end

  @[Extern]
  record IAppxPackageEditorVtbl,
    query_interface : Proc(IAppxPackageEditor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppxPackageEditor*, UInt32),
    release : Proc(IAppxPackageEditor*, UInt32),
    set_working_directory : Proc(IAppxPackageEditor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    create_delta_package : Proc(IAppxPackageEditor*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    create_delta_package_using_baseline_block_map : Proc(IAppxPackageEditor*, Void*, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    update_package : Proc(IAppxPackageEditor*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, Win32cr::Foundation::HRESULT),
    update_encrypted_package : Proc(IAppxPackageEditor*, Void*, Void*, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*, Win32cr::Foundation::HRESULT),
    update_package_manifest : Proc(IAppxPackageEditor*, Void*, Void*, Win32cr::Foundation::BOOL, Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e2adb6dc-5e71-4416-86b6-86e5f5291a6b")]
  record IAppxPackageEditor, lpVtbl : IAppxPackageEditorVtbl* do
    GUID = LibC::GUID.new(0xe2adb6dc_u32, 0x5e71_u16, 0x4416_u16, StaticArray[0x86_u8, 0xb6_u8, 0x86_u8, 0xe5_u8, 0xf5_u8, 0x29_u8, 0x1a_u8, 0x6b_u8])
    def query_interface(this : IAppxPackageEditor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppxPackageEditor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppxPackageEditor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_working_directory(this : IAppxPackageEditor*, workingDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_working_directory.call(this, workingDirectory)
    end
    def create_delta_package(this : IAppxPackageEditor*, updatedPackageStream : Void*, baselinePackageStream : Void*, deltaPackageStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_delta_package.call(this, updatedPackageStream, baselinePackageStream, deltaPackageStream)
    end
    def create_delta_package_using_baseline_block_map(this : IAppxPackageEditor*, updatedPackageStream : Void*, baselineBlockMapStream : Void*, baselinePackageFullName : Win32cr::Foundation::PWSTR, deltaPackageStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_delta_package_using_baseline_block_map.call(this, updatedPackageStream, baselineBlockMapStream, baselinePackageFullName, deltaPackageStream)
    end
    def update_package(this : IAppxPackageEditor*, baselinePackageStream : Void*, deltaPackageStream : Void*, updateOption : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_package.call(this, baselinePackageStream, deltaPackageStream, updateOption)
    end
    def update_encrypted_package(this : IAppxPackageEditor*, baselineEncryptedPackageStream : Void*, deltaPackageStream : Void*, updateOption : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, settings : Win32cr::Storage::Packaging::Appx::APPX_ENCRYPTED_PACKAGE_SETTINGS2*, keyInfo : Win32cr::Storage::Packaging::Appx::APPX_KEY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_encrypted_package.call(this, baselineEncryptedPackageStream, deltaPackageStream, updateOption, settings, keyInfo)
    end
    def update_package_manifest(this : IAppxPackageEditor*, packageStream : Void*, updatedManifestStream : Void*, isPackageEncrypted : Win32cr::Foundation::BOOL, options : Win32cr::Storage::Packaging::Appx::APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_package_manifest.call(this, packageStream, updatedManifestStream, isPackageEncrypted, options)
    end

  end

  @[Link("kernel32")]
  @[Link("api-ms-win-appmodel-runtime-l1-1-1")]
  @[Link("api-ms-win-appmodel-runtime-l1-1-3")]
  @[Link("kernelbase")]
  lib C
    fun GetCurrentPackageId(bufferLength : UInt32*, buffer : UInt8*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackageFullName(packageFullNameLength : UInt32*, packageFullName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackageFamilyName(packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackagePath(pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageId(hProcess : Win32cr::Foundation::HANDLE, bufferLength : UInt32*, buffer : UInt8*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageFullName(hProcess : Win32cr::Foundation::HANDLE, packageFullNameLength : UInt32*, packageFullName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageFullNameFromToken(token : Win32cr::Foundation::HANDLE, packageFullNameLength : UInt32*, packageFullName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageFamilyName(hProcess : Win32cr::Foundation::HANDLE, packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageFamilyNameFromToken(token : Win32cr::Foundation::HANDLE, packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackagePath(packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID*, reserved : UInt32, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackagePathByFullName(packageFullName : Win32cr::Foundation::PWSTR, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetStagedPackagePathByFullName(packageFullName : Win32cr::Foundation::PWSTR, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackagePathByFullName2(packageFullName : Win32cr::Foundation::PWSTR, packagePathType : Win32cr::Storage::Packaging::Appx::PackagePathType, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetStagedPackagePathByFullName2(packageFullName : Win32cr::Foundation::PWSTR, packagePathType : Win32cr::Storage::Packaging::Appx::PackagePathType, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackageInfo2(flags : UInt32, packagePathType : Win32cr::Storage::Packaging::Appx::PackagePathType, bufferLength : UInt32*, buffer : UInt8*, count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackagePath2(packagePathType : Win32cr::Storage::Packaging::Appx::PackagePathType, pathLength : UInt32*, path : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentApplicationUserModelId(applicationUserModelIdLength : UInt32*, applicationUserModelId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetApplicationUserModelId(hProcess : Win32cr::Foundation::HANDLE, applicationUserModelIdLength : UInt32*, applicationUserModelId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetApplicationUserModelIdFromToken(token : Win32cr::Foundation::HANDLE, applicationUserModelIdLength : UInt32*, applicationUserModelId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun VerifyPackageFullName(packageFullName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun VerifyPackageFamilyName(packageFamilyName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun VerifyPackageId(packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID*) : Win32cr::Foundation::WIN32_ERROR

    fun VerifyApplicationUserModelId(applicationUserModelId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun VerifyPackageRelativeApplicationId(packageRelativeApplicationId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun PackageIdFromFullName(packageFullName : Win32cr::Foundation::PWSTR, flags : UInt32, bufferLength : UInt32*, buffer : UInt8*) : Win32cr::Foundation::WIN32_ERROR

    fun PackageFullNameFromId(packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID*, packageFullNameLength : UInt32*, packageFullName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun PackageFamilyNameFromId(packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID*, packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun PackageFamilyNameFromFullName(packageFullName : Win32cr::Foundation::PWSTR, packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun PackageNameAndPublisherIdFromFamilyName(packageFamilyName : Win32cr::Foundation::PWSTR, packageNameLength : UInt32*, packageName : UInt16*, packagePublisherIdLength : UInt32*, packagePublisherId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun FormatApplicationUserModelId(packageFamilyName : Win32cr::Foundation::PWSTR, packageRelativeApplicationId : Win32cr::Foundation::PWSTR, applicationUserModelIdLength : UInt32*, applicationUserModelId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun ParseApplicationUserModelId(applicationUserModelId : Win32cr::Foundation::PWSTR, packageFamilyNameLength : UInt32*, packageFamilyName : UInt16*, packageRelativeApplicationIdLength : UInt32*, packageRelativeApplicationId : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackagesByPackageFamily(packageFamilyName : Win32cr::Foundation::PWSTR, count : UInt32*, packageFullNames : Win32cr::Foundation::PWSTR*, bufferLength : UInt32*, buffer : UInt16*) : Win32cr::Foundation::WIN32_ERROR

    fun FindPackagesByPackageFamily(packageFamilyName : Win32cr::Foundation::PWSTR, packageFilters : UInt32, count : UInt32*, packageFullNames : Win32cr::Foundation::PWSTR*, bufferLength : UInt32*, buffer : UInt16*, packageProperties : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetStagedPackageOrigin(packageFullName : Win32cr::Foundation::PWSTR, origin : Win32cr::Storage::Packaging::Appx::PackageOrigin*) : Win32cr::Foundation::WIN32_ERROR

    fun GetCurrentPackageInfo(flags : UInt32, bufferLength : UInt32*, buffer : UInt8*, count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun OpenPackageInfoByFullName(packageFullName : Win32cr::Foundation::PWSTR, reserved : UInt32, packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE**) : Win32cr::Foundation::WIN32_ERROR

    fun OpenPackageInfoByFullNameForUser(userSid : Win32cr::Foundation::PSID, packageFullName : Win32cr::Foundation::PWSTR, reserved : UInt32, packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE**) : Win32cr::Foundation::WIN32_ERROR

    fun ClosePackageInfo(packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageInfo(packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE*, flags : UInt32, bufferLength : UInt32*, buffer : UInt8*, count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageApplicationIds(packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE*, bufferLength : UInt32*, buffer : UInt8*, count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetPackageInfo2(packageInfoReference : Win32cr::Storage::Packaging::Appx::PACKAGE_INFO_REFERENCE*, flags : UInt32, packagePathType : Win32cr::Storage::Packaging::Appx::PackagePathType, bufferLength : UInt32*, buffer : UInt8*, count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun CheckIsMSIXPackage(packageFullName : Win32cr::Foundation::PWSTR, isMSIXPackage : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun TryCreatePackageDependency(user : Win32cr::Foundation::PSID, packageFamilyName : Win32cr::Foundation::PWSTR, minVersion : Win32cr::Storage::Packaging::Appx::PACKAGE_VERSION, packageDependencyProcessorArchitectures : Win32cr::Storage::Packaging::Appx::PackageDependencyProcessorArchitectures, lifetimeKind : Win32cr::Storage::Packaging::Appx::PackageDependencyLifetimeKind, lifetimeArtifact : Win32cr::Foundation::PWSTR, options : Win32cr::Storage::Packaging::Appx::CreatePackageDependencyOptions, packageDependencyId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun DeletePackageDependency(packageDependencyId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun AddPackageDependency(packageDependencyId : Win32cr::Foundation::PWSTR, rank : Int32, options : Win32cr::Storage::Packaging::Appx::AddPackageDependencyOptions, packageDependencyContext : Win32cr::Storage::Packaging::Appx::PACKAGEDEPENDENCY_CONTEXT__**, packageFullName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun RemovePackageDependency(packageDependencyContext : Win32cr::Storage::Packaging::Appx::PACKAGEDEPENDENCY_CONTEXT__*) : Win32cr::Foundation::HRESULT

    fun GetResolvedPackageFullNameForPackageDependency(packageDependencyId : Win32cr::Foundation::PWSTR, packageFullName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun GetIdForPackageDependencyContext(packageDependencyContext : Win32cr::Storage::Packaging::Appx::PACKAGEDEPENDENCY_CONTEXT__*, packageDependencyId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun AppPolicyGetLifecycleManagement(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyLifecycleManagement*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetWindowingModel(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyWindowingModel*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetMediaFoundationCodecLoading(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyMediaFoundationCodecLoading*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetClrCompat(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyClrCompat*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetThreadInitializationType(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyThreadInitializationType*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetShowDeveloperDiagnostic(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyShowDeveloperDiagnostic*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetProcessTerminationMethod(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyProcessTerminationMethod*) : Win32cr::Foundation::WIN32_ERROR

    fun AppPolicyGetCreateFileAccess(processToken : Win32cr::Foundation::HANDLE, policy : Win32cr::Storage::Packaging::Appx::AppPolicyCreateFileAccess*) : Win32cr::Foundation::WIN32_ERROR

    fun CreatePackageVirtualizationContext(packageFamilyName : Win32cr::Foundation::PWSTR, context : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**) : Win32cr::Foundation::HRESULT

    fun ActivatePackageVirtualizationContext(context : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, cookie : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun ReleasePackageVirtualizationContext(context : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*) : Void

    fun DeactivatePackageVirtualizationContext(cookie : LibC::UIntPtrT) : Void

    fun DuplicatePackageVirtualizationContext(sourceContext : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, destContext : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**) : Win32cr::Foundation::HRESULT

    fun GetCurrentPackageVirtualizationContext : Win32cr::Storage::Packaging::Appx::PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*

    fun GetProcessesInVirtualizationContext(packageFamilyName : Win32cr::Foundation::PWSTR, count : UInt32*, processes : Win32cr::Foundation::HANDLE**) : Win32cr::Foundation::HRESULT

  end
end