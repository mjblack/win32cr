require "./../foundation.cr"
require "./../security.cr"
require "./../system/io.cr"

module Win32cr::Storage::Vhd
  VIRTUAL_STORAGE_TYPE_VENDOR_UNKNOWN = "00000000-0000-0000-0000-000000000000"
  VIRTUAL_STORAGE_TYPE_VENDOR_MICROSOFT = "ec984aec-a0f9-47e9-901f-71415a66345b"
  VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN = 0_u32
  VIRTUAL_STORAGE_TYPE_DEVICE_ISO = 1_u32
  VIRTUAL_STORAGE_TYPE_DEVICE_VHD = 2_u32
  VIRTUAL_STORAGE_TYPE_DEVICE_VHDX = 3_u32
  VIRTUAL_STORAGE_TYPE_DEVICE_VHDSET = 4_u32
  OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT = 1_u32
  CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE = 0_u32
  CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE = 0_u32
  VIRTUAL_DISK_MAXIMUM_CHANGE_TRACKING_ID_LENGTH = 256_u32
  MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH = 1_u32

  enum OPEN_VIRTUAL_DISK_VERSION
    OPEN_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    OPEN_VIRTUAL_DISK_VERSION_1 = 1_i32
    OPEN_VIRTUAL_DISK_VERSION_2 = 2_i32
    OPEN_VIRTUAL_DISK_VERSION_3 = 3_i32
  end
  @[Flags]
  enum VIRTUAL_DISK_ACCESS_MASK : UInt32
    VIRTUAL_DISK_ACCESS_NONE = 0_u32
    VIRTUAL_DISK_ACCESS_ATTACH_RO = 65536_u32
    VIRTUAL_DISK_ACCESS_ATTACH_RW = 131072_u32
    VIRTUAL_DISK_ACCESS_DETACH = 262144_u32
    VIRTUAL_DISK_ACCESS_GET_INFO = 524288_u32
    VIRTUAL_DISK_ACCESS_CREATE = 1048576_u32
    VIRTUAL_DISK_ACCESS_METAOPS = 2097152_u32
    VIRTUAL_DISK_ACCESS_READ = 851968_u32
    VIRTUAL_DISK_ACCESS_ALL = 4128768_u32
    VIRTUAL_DISK_ACCESS_WRITABLE = 3276800_u32
  end
  @[Flags]
  enum OPEN_VIRTUAL_DISK_FLAG : UInt32
    OPEN_VIRTUAL_DISK_FLAG_NONE = 0_u32
    OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS = 1_u32
    OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE = 2_u32
    OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE = 4_u32
    OPEN_VIRTUAL_DISK_FLAG_CACHED_IO = 8_u32
    OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN = 16_u32
    OPEN_VIRTUAL_DISK_FLAG_PARENT_CACHED_IO = 32_u32
    OPEN_VIRTUAL_DISK_FLAG_VHDSET_FILE_ONLY = 64_u32
    OPEN_VIRTUAL_DISK_FLAG_IGNORE_RELATIVE_PARENT_LOCATOR = 128_u32
    OPEN_VIRTUAL_DISK_FLAG_NO_WRITE_HARDENING = 256_u32
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512_u32
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024_u32
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 2048_u32
  end
  enum CREATE_VIRTUAL_DISK_VERSION
    CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    CREATE_VIRTUAL_DISK_VERSION_1 = 1_i32
    CREATE_VIRTUAL_DISK_VERSION_2 = 2_i32
    CREATE_VIRTUAL_DISK_VERSION_3 = 3_i32
    CREATE_VIRTUAL_DISK_VERSION_4 = 4_i32
  end
  @[Flags]
  enum CREATE_VIRTUAL_DISK_FLAG : UInt32
    CREATE_VIRTUAL_DISK_FLAG_NONE = 0_u32
    CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION = 1_u32
    CREATE_VIRTUAL_DISK_FLAG_PREVENT_WRITES_TO_SOURCE_DISK = 2_u32
    CREATE_VIRTUAL_DISK_FLAG_DO_NOT_COPY_METADATA_FROM_PARENT = 4_u32
    CREATE_VIRTUAL_DISK_FLAG_CREATE_BACKING_STORAGE = 8_u32
    CREATE_VIRTUAL_DISK_FLAG_USE_CHANGE_TRACKING_SOURCE_LIMIT = 16_u32
    CREATE_VIRTUAL_DISK_FLAG_PRESERVE_PARENT_CHANGE_TRACKING_STATE = 32_u32
    CREATE_VIRTUAL_DISK_FLAG_VHD_SET_USE_ORIGINAL_BACKING_STORAGE = 64_u32
    CREATE_VIRTUAL_DISK_FLAG_SPARSE_FILE = 128_u32
    CREATE_VIRTUAL_DISK_FLAG_PMEM_COMPATIBLE = 256_u32
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512_u32
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024_u32
  end
  enum ATTACH_VIRTUAL_DISK_VERSION
    ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    ATTACH_VIRTUAL_DISK_VERSION_1 = 1_i32
    ATTACH_VIRTUAL_DISK_VERSION_2 = 2_i32
  end
  @[Flags]
  enum ATTACH_VIRTUAL_DISK_FLAG : UInt32
    ATTACH_VIRTUAL_DISK_FLAG_NONE = 0_u32
    ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY = 1_u32
    ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER = 2_u32
    ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME = 4_u32
    ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST = 8_u32
    ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR = 16_u32
    ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY = 32_u32
    ATTACH_VIRTUAL_DISK_FLAG_NON_PNP = 64_u32
    ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE = 128_u32
    ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION = 256_u32
    ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME = 512_u32
  end
  @[Flags]
  enum DETACH_VIRTUAL_DISK_FLAG : UInt32
    DETACH_VIRTUAL_DISK_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum DEPENDENT_DISK_FLAG : UInt32
    DEPENDENT_DISK_FLAG_NONE = 0_u32
    DEPENDENT_DISK_FLAG_MULT_BACKING_FILES = 1_u32
    DEPENDENT_DISK_FLAG_FULLY_ALLOCATED = 2_u32
    DEPENDENT_DISK_FLAG_READ_ONLY = 4_u32
    DEPENDENT_DISK_FLAG_REMOTE = 8_u32
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME = 16_u32
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT = 32_u32
    DEPENDENT_DISK_FLAG_REMOVABLE = 64_u32
    DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER = 128_u32
    DEPENDENT_DISK_FLAG_PARENT = 256_u32
    DEPENDENT_DISK_FLAG_NO_HOST_DISK = 512_u32
    DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME = 1024_u32
    DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 2048_u32
    DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE = 4096_u32
    DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 8192_u32
  end
  enum STORAGE_DEPENDENCY_INFO_VERSION
    STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED = 0_i32
    STORAGE_DEPENDENCY_INFO_VERSION_1 = 1_i32
    STORAGE_DEPENDENCY_INFO_VERSION_2 = 2_i32
  end
  @[Flags]
  enum GET_STORAGE_DEPENDENCY_FLAG : UInt32
    GET_STORAGE_DEPENDENCY_FLAG_NONE = 0_u32
    GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES = 1_u32
    GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE = 2_u32
  end
  enum GET_VIRTUAL_DISK_INFO_VERSION
    GET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0_i32
    GET_VIRTUAL_DISK_INFO_SIZE = 1_i32
    GET_VIRTUAL_DISK_INFO_IDENTIFIER = 2_i32
    GET_VIRTUAL_DISK_INFO_PARENT_LOCATION = 3_i32
    GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER = 4_i32
    GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP = 5_i32
    GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE = 6_i32
    GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE = 7_i32
    GET_VIRTUAL_DISK_INFO_IS_4K_ALIGNED = 8_i32
    GET_VIRTUAL_DISK_INFO_PHYSICAL_DISK = 9_i32
    GET_VIRTUAL_DISK_INFO_VHD_PHYSICAL_SECTOR_SIZE = 10_i32
    GET_VIRTUAL_DISK_INFO_SMALLEST_SAFE_VIRTUAL_SIZE = 11_i32
    GET_VIRTUAL_DISK_INFO_FRAGMENTATION = 12_i32
    GET_VIRTUAL_DISK_INFO_IS_LOADED = 13_i32
    GET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 14_i32
    GET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 15_i32
  end
  enum SET_VIRTUAL_DISK_INFO_VERSION
    SET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0_i32
    SET_VIRTUAL_DISK_INFO_PARENT_PATH = 1_i32
    SET_VIRTUAL_DISK_INFO_IDENTIFIER = 2_i32
    SET_VIRTUAL_DISK_INFO_PARENT_PATH_WITH_DEPTH = 3_i32
    SET_VIRTUAL_DISK_INFO_PHYSICAL_SECTOR_SIZE = 4_i32
    SET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 5_i32
    SET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 6_i32
    SET_VIRTUAL_DISK_INFO_PARENT_LOCATOR = 7_i32
  end
  enum COMPACT_VIRTUAL_DISK_VERSION
    COMPACT_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    COMPACT_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  @[Flags]
  enum COMPACT_VIRTUAL_DISK_FLAG : UInt32
    COMPACT_VIRTUAL_DISK_FLAG_NONE = 0_u32
    COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN = 1_u32
    COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES = 2_u32
  end
  enum MERGE_VIRTUAL_DISK_VERSION
    MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    MERGE_VIRTUAL_DISK_VERSION_1 = 1_i32
    MERGE_VIRTUAL_DISK_VERSION_2 = 2_i32
  end
  @[Flags]
  enum MERGE_VIRTUAL_DISK_FLAG : UInt32
    MERGE_VIRTUAL_DISK_FLAG_NONE = 0_u32
  end
  enum EXPAND_VIRTUAL_DISK_VERSION
    EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    EXPAND_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  @[Flags]
  enum EXPAND_VIRTUAL_DISK_FLAG : UInt32
    EXPAND_VIRTUAL_DISK_FLAG_NONE = 0_u32
    EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE = 1_u32
  end
  enum RESIZE_VIRTUAL_DISK_VERSION
    RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    RESIZE_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  @[Flags]
  enum RESIZE_VIRTUAL_DISK_FLAG : UInt32
    RESIZE_VIRTUAL_DISK_FLAG_NONE = 0_u32
    RESIZE_VIRTUAL_DISK_FLAG_ALLOW_UNSAFE_VIRTUAL_SIZE = 1_u32
    RESIZE_VIRTUAL_DISK_FLAG_RESIZE_TO_SMALLEST_SAFE_VIRTUAL_SIZE = 2_u32
  end
  enum MIRROR_VIRTUAL_DISK_VERSION
    MIRROR_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    MIRROR_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  @[Flags]
  enum MIRROR_VIRTUAL_DISK_FLAG : UInt32
    MIRROR_VIRTUAL_DISK_FLAG_NONE = 0_u32
    MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1_u32
    MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION = 2_u32
    MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION = 4_u32
    MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION = 8_u32
  end
  @[Flags]
  enum QUERY_CHANGES_VIRTUAL_DISK_FLAG : UInt32
    QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum TAKE_SNAPSHOT_VHDSET_FLAG : UInt32
    TAKE_SNAPSHOT_VHDSET_FLAG_NONE = 0_u32
    TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1_u32
  end
  enum TAKE_SNAPSHOT_VHDSET_VERSION
    TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0_i32
    TAKE_SNAPSHOT_VHDSET_VERSION_1 = 1_i32
  end
  @[Flags]
  enum DELETE_SNAPSHOT_VHDSET_FLAG : UInt32
    DELETE_SNAPSHOT_VHDSET_FLAG_NONE = 0_u32
    DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT = 1_u32
  end
  enum DELETE_SNAPSHOT_VHDSET_VERSION
    DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0_i32
    DELETE_SNAPSHOT_VHDSET_VERSION_1 = 1_i32
  end
  enum MODIFY_VHDSET_VERSION
    MODIFY_VHDSET_UNSPECIFIED = 0_i32
    MODIFY_VHDSET_SNAPSHOT_PATH = 1_i32
    MODIFY_VHDSET_REMOVE_SNAPSHOT = 2_i32
    MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH = 3_i32
  end
  @[Flags]
  enum MODIFY_VHDSET_FLAG : UInt32
    MODIFY_VHDSET_FLAG_NONE = 0_u32
    MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT = 1_u32
  end
  @[Flags]
  enum APPLY_SNAPSHOT_VHDSET_FLAG : UInt32
    APPLY_SNAPSHOT_VHDSET_FLAG_NONE = 0_u32
    APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1_u32
  end
  enum APPLY_SNAPSHOT_VHDSET_VERSION
    APPLY_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0_i32
    APPLY_SNAPSHOT_VHDSET_VERSION_1 = 1_i32
  end
  @[Flags]
  enum RAW_SCSI_VIRTUAL_DISK_FLAG : UInt32
    RAW_SCSI_VIRTUAL_DISK_FLAG_NONE = 0_u32
  end
  enum RAW_SCSI_VIRTUAL_DISK_VERSION
    RAW_SCSI_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    RAW_SCSI_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  enum FORK_VIRTUAL_DISK_VERSION
    FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0_i32
    FORK_VIRTUAL_DISK_VERSION_1 = 1_i32
  end
  @[Flags]
  enum FORK_VIRTUAL_DISK_FLAG : UInt32
    FORK_VIRTUAL_DISK_FLAG_NONE = 0_u32
    FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1_u32
  end

  @[Extern]
  struct VIRTUAL_STORAGE_TYPE
    property device_id : UInt32
    property vendor_id : LibC::GUID
    def initialize(@device_id : UInt32, @vendor_id : LibC::GUID)
    end
  end

  @[Extern]
  struct OPEN_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_
    property version2 : Version2_e__Struct_
    property version3 : Version3_e__Struct_

      # Nested Type Version3_e__Struct_
      @[Extern]
      struct Version3_e__Struct_
    property get_info_only : Win32cr::Foundation::BOOL
    property read_only : Win32cr::Foundation::BOOL
    property resiliency_guid : LibC::GUID
    property snapshot_id : LibC::GUID
    def initialize(@get_info_only : Win32cr::Foundation::BOOL, @read_only : Win32cr::Foundation::BOOL, @resiliency_guid : LibC::GUID, @snapshot_id : LibC::GUID)
    end
      end


      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property rw_depth : UInt32
    def initialize(@rw_depth : UInt32)
    end
      end


      # Nested Type Version2_e__Struct_
      @[Extern]
      struct Version2_e__Struct_
    property get_info_only : Win32cr::Foundation::BOOL
    property read_only : Win32cr::Foundation::BOOL
    property resiliency_guid : LibC::GUID
    def initialize(@get_info_only : Win32cr::Foundation::BOOL, @read_only : Win32cr::Foundation::BOOL, @resiliency_guid : LibC::GUID)
    end
      end

    def initialize(@version1 : Version1_e__Struct_, @version2 : Version2_e__Struct_, @version3 : Version3_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CREATE_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::CREATE_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_
    property version2 : Version2_e__Struct_
    property version3 : Version3_e__Struct_
    property version4 : Version4_e__Struct_

      # Nested Type Version4_e__Struct_
      @[Extern]
      struct Version4_e__Struct_
    property unique_id : LibC::GUID
    property maximum_size : UInt64
    property block_size_in_bytes : UInt32
    property sector_size_in_bytes : UInt32
    property physical_sector_size_in_bytes : UInt32
    property parent_path : Win32cr::Foundation::PWSTR
    property source_path : Win32cr::Foundation::PWSTR
    property open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG
    property parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property resiliency_guid : LibC::GUID
    property source_limit_path : Win32cr::Foundation::PWSTR
    property backing_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property pmem_address_abstraction_type : LibC::GUID
    property data_alignment : UInt64
    def initialize(@unique_id : LibC::GUID, @maximum_size : UInt64, @block_size_in_bytes : UInt32, @sector_size_in_bytes : UInt32, @physical_sector_size_in_bytes : UInt32, @parent_path : Win32cr::Foundation::PWSTR, @source_path : Win32cr::Foundation::PWSTR, @open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG, @parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @resiliency_guid : LibC::GUID, @source_limit_path : Win32cr::Foundation::PWSTR, @backing_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @pmem_address_abstraction_type : LibC::GUID, @data_alignment : UInt64)
    end
      end


      # Nested Type Version2_e__Struct_
      @[Extern]
      struct Version2_e__Struct_
    property unique_id : LibC::GUID
    property maximum_size : UInt64
    property block_size_in_bytes : UInt32
    property sector_size_in_bytes : UInt32
    property physical_sector_size_in_bytes : UInt32
    property parent_path : Win32cr::Foundation::PWSTR
    property source_path : Win32cr::Foundation::PWSTR
    property open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG
    property parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property resiliency_guid : LibC::GUID
    def initialize(@unique_id : LibC::GUID, @maximum_size : UInt64, @block_size_in_bytes : UInt32, @sector_size_in_bytes : UInt32, @physical_sector_size_in_bytes : UInt32, @parent_path : Win32cr::Foundation::PWSTR, @source_path : Win32cr::Foundation::PWSTR, @open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG, @parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @resiliency_guid : LibC::GUID)
    end
      end


      # Nested Type Version3_e__Struct_
      @[Extern]
      struct Version3_e__Struct_
    property unique_id : LibC::GUID
    property maximum_size : UInt64
    property block_size_in_bytes : UInt32
    property sector_size_in_bytes : UInt32
    property physical_sector_size_in_bytes : UInt32
    property parent_path : Win32cr::Foundation::PWSTR
    property source_path : Win32cr::Foundation::PWSTR
    property open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG
    property parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property resiliency_guid : LibC::GUID
    property source_limit_path : Win32cr::Foundation::PWSTR
    property backing_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    def initialize(@unique_id : LibC::GUID, @maximum_size : UInt64, @block_size_in_bytes : UInt32, @sector_size_in_bytes : UInt32, @physical_sector_size_in_bytes : UInt32, @parent_path : Win32cr::Foundation::PWSTR, @source_path : Win32cr::Foundation::PWSTR, @open_flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG, @parent_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @source_virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @resiliency_guid : LibC::GUID, @source_limit_path : Win32cr::Foundation::PWSTR, @backing_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE)
    end
      end


      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property unique_id : LibC::GUID
    property maximum_size : UInt64
    property block_size_in_bytes : UInt32
    property sector_size_in_bytes : UInt32
    property parent_path : Win32cr::Foundation::PWSTR
    property source_path : Win32cr::Foundation::PWSTR
    def initialize(@unique_id : LibC::GUID, @maximum_size : UInt64, @block_size_in_bytes : UInt32, @sector_size_in_bytes : UInt32, @parent_path : Win32cr::Foundation::PWSTR, @source_path : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@version1 : Version1_e__Struct_, @version2 : Version2_e__Struct_, @version3 : Version3_e__Struct_, @version4 : Version4_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::CREATE_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct ATTACH_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::ATTACH_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_
    property version2 : Version2_e__Struct_

      # Nested Type Version2_e__Struct_
      @[Extern]
      struct Version2_e__Struct_
    property restricted_offset : UInt64
    property restricted_length : UInt64
    def initialize(@restricted_offset : UInt64, @restricted_length : UInt64)
    end
      end


      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property reserved : UInt32
    def initialize(@reserved : UInt32)
    end
      end

    def initialize(@version1 : Version1_e__Struct_, @version2 : Version2_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::ATTACH_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct STORAGE_DEPENDENCY_INFO_TYPE_1
    property dependency_type_flags : Win32cr::Storage::Vhd::DEPENDENT_DISK_FLAG
    property provider_specific_flags : UInt32
    property virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    def initialize(@dependency_type_flags : Win32cr::Storage::Vhd::DEPENDENT_DISK_FLAG, @provider_specific_flags : UInt32, @virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE)
    end
  end

  @[Extern]
  struct STORAGE_DEPENDENCY_INFO_TYPE_2
    property dependency_type_flags : Win32cr::Storage::Vhd::DEPENDENT_DISK_FLAG
    property provider_specific_flags : UInt32
    property virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property ancestor_level : UInt32
    property dependency_device_name : Win32cr::Foundation::PWSTR
    property host_volume_name : Win32cr::Foundation::PWSTR
    property dependent_volume_name : Win32cr::Foundation::PWSTR
    property dependent_volume_relative_path : Win32cr::Foundation::PWSTR
    def initialize(@dependency_type_flags : Win32cr::Storage::Vhd::DEPENDENT_DISK_FLAG, @provider_specific_flags : UInt32, @virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @ancestor_level : UInt32, @dependency_device_name : Win32cr::Foundation::PWSTR, @host_volume_name : Win32cr::Foundation::PWSTR, @dependent_volume_name : Win32cr::Foundation::PWSTR, @dependent_volume_relative_path : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct STORAGE_DEPENDENCY_INFO
    property version : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_VERSION
    property number_entries : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1_entries : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_TYPE_1*
    property version2_entries : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_TYPE_2*
    def initialize(@version1_entries : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_TYPE_1*, @version2_entries : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_TYPE_2*)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO_VERSION, @number_entries : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct GET_VIRTUAL_DISK_INFO
    property version : Win32cr::Storage::Vhd::GET_VIRTUAL_DISK_INFO_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property size : Size_e__Struct_
    property identifier : LibC::GUID
    property parent_location : ParentLocation_e__Struct_
    property parent_identifier : LibC::GUID
    property parent_timestamp : UInt32
    property virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE
    property provider_subtype : UInt32
    property is4k_aligned : Win32cr::Foundation::BOOL
    property is_loaded : Win32cr::Foundation::BOOL
    property physical_disk : PhysicalDisk_e__Struct_
    property vhd_physical_sector_size : UInt32
    property smallest_safe_virtual_size : UInt64
    property fragmentation_percentage : UInt32
    property virtual_disk_id : LibC::GUID
    property change_tracking_state : ChangeTrackingState_e__Struct_

      # Nested Type PhysicalDisk_e__Struct_
      @[Extern]
      struct PhysicalDisk_e__Struct_
    property logical_sector_size : UInt32
    property physical_sector_size : UInt32
    property is_remote : Win32cr::Foundation::BOOL
    def initialize(@logical_sector_size : UInt32, @physical_sector_size : UInt32, @is_remote : Win32cr::Foundation::BOOL)
    end
      end


      # Nested Type Size_e__Struct_
      @[Extern]
      struct Size_e__Struct_
    property virtual_size : UInt64
    property physical_size : UInt64
    property block_size : UInt32
    property sector_size : UInt32
    def initialize(@virtual_size : UInt64, @physical_size : UInt64, @block_size : UInt32, @sector_size : UInt32)
    end
      end


      # Nested Type ChangeTrackingState_e__Struct_
      @[Extern]
      struct ChangeTrackingState_e__Struct_
    property enabled : Win32cr::Foundation::BOOL
    property newer_changes : Win32cr::Foundation::BOOL
    property most_recent_id : UInt16*
    def initialize(@enabled : Win32cr::Foundation::BOOL, @newer_changes : Win32cr::Foundation::BOOL, @most_recent_id : UInt16*)
    end
      end


      # Nested Type ParentLocation_e__Struct_
      @[Extern]
      struct ParentLocation_e__Struct_
    property parent_resolved : Win32cr::Foundation::BOOL
    property parent_location_buffer : UInt16*
    def initialize(@parent_resolved : Win32cr::Foundation::BOOL, @parent_location_buffer : UInt16*)
    end
      end

    def initialize(@size : Size_e__Struct_, @identifier : LibC::GUID, @parent_location : ParentLocation_e__Struct_, @parent_identifier : LibC::GUID, @parent_timestamp : UInt32, @virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE, @provider_subtype : UInt32, @is4k_aligned : Win32cr::Foundation::BOOL, @is_loaded : Win32cr::Foundation::BOOL, @physical_disk : PhysicalDisk_e__Struct_, @vhd_physical_sector_size : UInt32, @smallest_safe_virtual_size : UInt64, @fragmentation_percentage : UInt32, @virtual_disk_id : LibC::GUID, @change_tracking_state : ChangeTrackingState_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::GET_VIRTUAL_DISK_INFO_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SET_VIRTUAL_DISK_INFO
    property version : Win32cr::Storage::Vhd::SET_VIRTUAL_DISK_INFO_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property parent_file_path : Win32cr::Foundation::PWSTR
    property unique_identifier : LibC::GUID
    property parent_path_with_depth_info : ParentPathWithDepthInfo_e__Struct_
    property vhd_physical_sector_size : UInt32
    property virtual_disk_id : LibC::GUID
    property change_tracking_enabled : Win32cr::Foundation::BOOL
    property parent_locator : ParentLocator_e__Struct_

      # Nested Type ParentPathWithDepthInfo_e__Struct_
      @[Extern]
      struct ParentPathWithDepthInfo_e__Struct_
    property child_depth : UInt32
    property parent_file_path : Win32cr::Foundation::PWSTR
    def initialize(@child_depth : UInt32, @parent_file_path : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type ParentLocator_e__Struct_
      @[Extern]
      struct ParentLocator_e__Struct_
    property linkage_id : LibC::GUID
    property parent_file_path : Win32cr::Foundation::PWSTR
    def initialize(@linkage_id : LibC::GUID, @parent_file_path : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@parent_file_path : Win32cr::Foundation::PWSTR, @unique_identifier : LibC::GUID, @parent_path_with_depth_info : ParentPathWithDepthInfo_e__Struct_, @vhd_physical_sector_size : UInt32, @virtual_disk_id : LibC::GUID, @change_tracking_enabled : Win32cr::Foundation::BOOL, @parent_locator : ParentLocator_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::SET_VIRTUAL_DISK_INFO_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct VIRTUAL_DISK_PROGRESS
    property operation_status : UInt32
    property current_value : UInt64
    property completion_value : UInt64
    def initialize(@operation_status : UInt32, @current_value : UInt64, @completion_value : UInt64)
    end
  end

  @[Extern]
  struct COMPACT_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::COMPACT_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property reserved : UInt32
    def initialize(@reserved : UInt32)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::COMPACT_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MERGE_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::MERGE_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_
    property version2 : Version2_e__Struct_

      # Nested Type Version2_e__Struct_
      @[Extern]
      struct Version2_e__Struct_
    property merge_source_depth : UInt32
    property merge_target_depth : UInt32
    def initialize(@merge_source_depth : UInt32, @merge_target_depth : UInt32)
    end
      end


      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property merge_depth : UInt32
    def initialize(@merge_depth : UInt32)
    end
      end

    def initialize(@version1 : Version1_e__Struct_, @version2 : Version2_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::MERGE_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct EXPAND_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::EXPAND_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property new_size : UInt64
    def initialize(@new_size : UInt64)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::EXPAND_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RESIZE_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::RESIZE_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property new_size : UInt64
    def initialize(@new_size : UInt64)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::RESIZE_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MIRROR_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::MIRROR_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property mirror_virtual_disk_path : Win32cr::Foundation::PWSTR
    def initialize(@mirror_virtual_disk_path : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::MIRROR_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct QUERY_CHANGES_VIRTUAL_DISK_RANGE
    property byte_offset : UInt64
    property byte_length : UInt64
    property reserved : UInt64
    def initialize(@byte_offset : UInt64, @byte_length : UInt64, @reserved : UInt64)
    end
  end

  @[Extern]
  struct TAKE_SNAPSHOT_VHDSET_PARAMETERS
    property version : Win32cr::Storage::Vhd::TAKE_SNAPSHOT_VHDSET_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property snapshot_id : LibC::GUID
    def initialize(@snapshot_id : LibC::GUID)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::TAKE_SNAPSHOT_VHDSET_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DELETE_SNAPSHOT_VHDSET_PARAMETERS
    property version : Win32cr::Storage::Vhd::DELETE_SNAPSHOT_VHDSET_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property snapshot_id : LibC::GUID
    def initialize(@snapshot_id : LibC::GUID)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::DELETE_SNAPSHOT_VHDSET_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MODIFY_VHDSET_PARAMETERS
    property version : Win32cr::Storage::Vhd::MODIFY_VHDSET_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property snapshot_path : SnapshotPath_e__Struct_
    property snapshot_id : LibC::GUID
    property default_file_path : Win32cr::Foundation::PWSTR

      # Nested Type SnapshotPath_e__Struct_
      @[Extern]
      struct SnapshotPath_e__Struct_
    property snapshot_id : LibC::GUID
    property snapshot_file_path : Win32cr::Foundation::PWSTR
    def initialize(@snapshot_id : LibC::GUID, @snapshot_file_path : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@snapshot_path : SnapshotPath_e__Struct_, @snapshot_id : LibC::GUID, @default_file_path : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::MODIFY_VHDSET_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct APPLY_SNAPSHOT_VHDSET_PARAMETERS
    property version : Win32cr::Storage::Vhd::APPLY_SNAPSHOT_VHDSET_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property snapshot_id : LibC::GUID
    property leaf_snapshot_id : LibC::GUID
    def initialize(@snapshot_id : LibC::GUID, @leaf_snapshot_id : LibC::GUID)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::APPLY_SNAPSHOT_VHDSET_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RAW_SCSI_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property rsvd_handle : Win32cr::Foundation::BOOL
    property data_in : UInt8
    property cdb_length : UInt8
    property sense_info_length : UInt8
    property srb_flags : UInt32
    property data_transfer_length : UInt32
    property data_buffer : Void*
    property sense_info : UInt8*
    property cdb : UInt8*
    def initialize(@rsvd_handle : Win32cr::Foundation::BOOL, @data_in : UInt8, @cdb_length : UInt8, @sense_info_length : UInt8, @srb_flags : UInt32, @data_transfer_length : UInt32, @data_buffer : Void*, @sense_info : UInt8*, @cdb : UInt8*)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RAW_SCSI_VIRTUAL_DISK_RESPONSE
    property version : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property scsi_status : UInt8
    property sense_info_length : UInt8
    property data_transfer_length : UInt32
    def initialize(@scsi_status : UInt8, @sense_info_length : UInt8, @data_transfer_length : UInt32)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct FORK_VIRTUAL_DISK_PARAMETERS
    property version : Win32cr::Storage::Vhd::FORK_VIRTUAL_DISK_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property version1 : Version1_e__Struct_

      # Nested Type Version1_e__Struct_
      @[Extern]
      struct Version1_e__Struct_
    property forked_virtual_disk_path : Win32cr::Foundation::PWSTR
    def initialize(@forked_virtual_disk_path : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@version1 : Version1_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Storage::Vhd::FORK_VIRTUAL_DISK_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Link("virtdisk")]
  lib C
    fun OpenVirtualDisk(virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE*, path : Win32cr::Foundation::PWSTR, virtual_disk_access_mask : Win32cr::Storage::Vhd::VIRTUAL_DISK_ACCESS_MASK, flags : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::OPEN_VIRTUAL_DISK_PARAMETERS*, handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::WIN32_ERROR

    fun CreateVirtualDisk(virtual_storage_type : Win32cr::Storage::Vhd::VIRTUAL_STORAGE_TYPE*, path : Win32cr::Foundation::PWSTR, virtual_disk_access_mask : Win32cr::Storage::Vhd::VIRTUAL_DISK_ACCESS_MASK, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, flags : Win32cr::Storage::Vhd::CREATE_VIRTUAL_DISK_FLAG, provider_specific_flags : UInt32, parameters : Win32cr::Storage::Vhd::CREATE_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*, handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::WIN32_ERROR

    fun AttachVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, flags : Win32cr::Storage::Vhd::ATTACH_VIRTUAL_DISK_FLAG, provider_specific_flags : UInt32, parameters : Win32cr::Storage::Vhd::ATTACH_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun DetachVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::DETACH_VIRTUAL_DISK_FLAG, provider_specific_flags : UInt32) : Win32cr::Foundation::WIN32_ERROR

    fun GetVirtualDiskPhysicalPath(virtual_disk_handle : Win32cr::Foundation::HANDLE, disk_path_size_in_bytes : UInt32*, disk_path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun GetAllAttachedVirtualDiskPhysicalPaths(paths_buffer_size_in_bytes : UInt32*, paths_buffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun GetStorageDependencyInformation(object_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::GET_STORAGE_DEPENDENCY_FLAG, storage_dependency_info_size : UInt32, storage_dependency_info : Win32cr::Storage::Vhd::STORAGE_DEPENDENCY_INFO*, size_used : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun GetVirtualDiskInformation(virtual_disk_handle : Win32cr::Foundation::HANDLE, virtual_disk_info_size : UInt32*, virtual_disk_info : Win32cr::Storage::Vhd::GET_VIRTUAL_DISK_INFO*, size_used : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    fun SetVirtualDiskInformation(virtual_disk_handle : Win32cr::Foundation::HANDLE, virtual_disk_info : Win32cr::Storage::Vhd::SET_VIRTUAL_DISK_INFO*) : Win32cr::Foundation::WIN32_ERROR

    fun EnumerateVirtualDiskMetadata(virtual_disk_handle : Win32cr::Foundation::HANDLE, number_of_items : UInt32*, items : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    fun GetVirtualDiskMetadata(virtual_disk_handle : Win32cr::Foundation::HANDLE, item : LibC::GUID*, meta_data_size : UInt32*, meta_data : Void*) : Win32cr::Foundation::WIN32_ERROR

    fun SetVirtualDiskMetadata(virtual_disk_handle : Win32cr::Foundation::HANDLE, item : LibC::GUID*, meta_data_size : UInt32, meta_data : Void*) : Win32cr::Foundation::WIN32_ERROR

    fun DeleteVirtualDiskMetadata(virtual_disk_handle : Win32cr::Foundation::HANDLE, item : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    fun GetVirtualDiskOperationProgress(virtual_disk_handle : Win32cr::Foundation::HANDLE, overlapped : Win32cr::System::IO::OVERLAPPED*, progress : Win32cr::Storage::Vhd::VIRTUAL_DISK_PROGRESS*) : Win32cr::Foundation::WIN32_ERROR

    fun CompactVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::COMPACT_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::COMPACT_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun MergeVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::MERGE_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::MERGE_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun ExpandVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::EXPAND_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::EXPAND_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun ResizeVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::RESIZE_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::RESIZE_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun MirrorVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::MIRROR_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::MIRROR_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun BreakMirrorVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::WIN32_ERROR

    fun AddVirtualDiskParent(virtual_disk_handle : Win32cr::Foundation::HANDLE, parent_path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::WIN32_ERROR

    fun QueryChangesVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, change_tracking_id : Win32cr::Foundation::PWSTR, byte_offset : UInt64, byte_length : UInt64, flags : Win32cr::Storage::Vhd::QUERY_CHANGES_VIRTUAL_DISK_FLAG, ranges : Win32cr::Storage::Vhd::QUERY_CHANGES_VIRTUAL_DISK_RANGE*, range_count : UInt32*, processed_length : UInt64*) : Win32cr::Foundation::WIN32_ERROR

    fun TakeSnapshotVhdSet(virtual_disk_handle : Win32cr::Foundation::HANDLE, parameters : Win32cr::Storage::Vhd::TAKE_SNAPSHOT_VHDSET_PARAMETERS*, flags : Win32cr::Storage::Vhd::TAKE_SNAPSHOT_VHDSET_FLAG) : Win32cr::Foundation::WIN32_ERROR

    fun DeleteSnapshotVhdSet(virtual_disk_handle : Win32cr::Foundation::HANDLE, parameters : Win32cr::Storage::Vhd::DELETE_SNAPSHOT_VHDSET_PARAMETERS*, flags : Win32cr::Storage::Vhd::DELETE_SNAPSHOT_VHDSET_FLAG) : Win32cr::Foundation::WIN32_ERROR

    fun ModifyVhdSet(virtual_disk_handle : Win32cr::Foundation::HANDLE, parameters : Win32cr::Storage::Vhd::MODIFY_VHDSET_PARAMETERS*, flags : Win32cr::Storage::Vhd::MODIFY_VHDSET_FLAG) : Win32cr::Foundation::WIN32_ERROR

    fun ApplySnapshotVhdSet(virtual_disk_handle : Win32cr::Foundation::HANDLE, parameters : Win32cr::Storage::Vhd::APPLY_SNAPSHOT_VHDSET_PARAMETERS*, flags : Win32cr::Storage::Vhd::APPLY_SNAPSHOT_VHDSET_FLAG) : Win32cr::Foundation::WIN32_ERROR

    fun RawSCSIVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, parameters : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_PARAMETERS*, flags : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_FLAG, response : Win32cr::Storage::Vhd::RAW_SCSI_VIRTUAL_DISK_RESPONSE*) : Win32cr::Foundation::WIN32_ERROR

    fun ForkVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE, flags : Win32cr::Storage::Vhd::FORK_VIRTUAL_DISK_FLAG, parameters : Win32cr::Storage::Vhd::FORK_VIRTUAL_DISK_PARAMETERS*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::WIN32_ERROR

    fun CompleteForkVirtualDisk(virtual_disk_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::WIN32_ERROR

  end
end