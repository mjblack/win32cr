require "../foundation.cr"
require "../security.cr"
require "../system/io.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:virtdisk.dll")]
{% else %}
@[Link("virtdisk")]
{% end %}
lib LibWin32
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


  enum OPEN_VIRTUAL_DISK_VERSION : Int32
    OPEN_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    OPEN_VIRTUAL_DISK_VERSION_1 = 1
    OPEN_VIRTUAL_DISK_VERSION_2 = 2
    OPEN_VIRTUAL_DISK_VERSION_3 = 3
  end

  enum VIRTUAL_DISK_ACCESS_MASK : UInt32
    VIRTUAL_DISK_ACCESS_NONE = 0
    VIRTUAL_DISK_ACCESS_ATTACH_RO = 65536
    VIRTUAL_DISK_ACCESS_ATTACH_RW = 131072
    VIRTUAL_DISK_ACCESS_DETACH = 262144
    VIRTUAL_DISK_ACCESS_GET_INFO = 524288
    VIRTUAL_DISK_ACCESS_CREATE = 1048576
    VIRTUAL_DISK_ACCESS_METAOPS = 2097152
    VIRTUAL_DISK_ACCESS_READ = 851968
    VIRTUAL_DISK_ACCESS_ALL = 4128768
    VIRTUAL_DISK_ACCESS_WRITABLE = 3276800
  end

  enum OPEN_VIRTUAL_DISK_FLAG : UInt32
    OPEN_VIRTUAL_DISK_FLAG_NONE = 0
    OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS = 1
    OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE = 2
    OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE = 4
    OPEN_VIRTUAL_DISK_FLAG_CACHED_IO = 8
    OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN = 16
    OPEN_VIRTUAL_DISK_FLAG_PARENT_CACHED_IO = 32
    OPEN_VIRTUAL_DISK_FLAG_VHDSET_FILE_ONLY = 64
    OPEN_VIRTUAL_DISK_FLAG_IGNORE_RELATIVE_PARENT_LOCATOR = 128
    OPEN_VIRTUAL_DISK_FLAG_NO_WRITE_HARDENING = 256
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 2048
  end

  enum CREATE_VIRTUAL_DISK_VERSION : Int32
    CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    CREATE_VIRTUAL_DISK_VERSION_1 = 1
    CREATE_VIRTUAL_DISK_VERSION_2 = 2
    CREATE_VIRTUAL_DISK_VERSION_3 = 3
    CREATE_VIRTUAL_DISK_VERSION_4 = 4
  end

  enum CREATE_VIRTUAL_DISK_FLAG : UInt32
    CREATE_VIRTUAL_DISK_FLAG_NONE = 0
    CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION = 1
    CREATE_VIRTUAL_DISK_FLAG_PREVENT_WRITES_TO_SOURCE_DISK = 2
    CREATE_VIRTUAL_DISK_FLAG_DO_NOT_COPY_METADATA_FROM_PARENT = 4
    CREATE_VIRTUAL_DISK_FLAG_CREATE_BACKING_STORAGE = 8
    CREATE_VIRTUAL_DISK_FLAG_USE_CHANGE_TRACKING_SOURCE_LIMIT = 16
    CREATE_VIRTUAL_DISK_FLAG_PRESERVE_PARENT_CHANGE_TRACKING_STATE = 32
    CREATE_VIRTUAL_DISK_FLAG_VHD_SET_USE_ORIGINAL_BACKING_STORAGE = 64
    CREATE_VIRTUAL_DISK_FLAG_SPARSE_FILE = 128
    CREATE_VIRTUAL_DISK_FLAG_PMEM_COMPATIBLE = 256
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024
  end

  enum ATTACH_VIRTUAL_DISK_VERSION : Int32
    ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    ATTACH_VIRTUAL_DISK_VERSION_1 = 1
    ATTACH_VIRTUAL_DISK_VERSION_2 = 2
  end

  enum ATTACH_VIRTUAL_DISK_FLAG : UInt32
    ATTACH_VIRTUAL_DISK_FLAG_NONE = 0
    ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY = 1
    ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER = 2
    ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME = 4
    ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST = 8
    ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR = 16
    ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY = 32
    ATTACH_VIRTUAL_DISK_FLAG_NON_PNP = 64
    ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE = 128
    ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION = 256
    ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME = 512
  end

  enum DETACH_VIRTUAL_DISK_FLAG : UInt32
    DETACH_VIRTUAL_DISK_FLAG_NONE = 0
  end

  enum DEPENDENT_DISK_FLAG : UInt32
    DEPENDENT_DISK_FLAG_NONE = 0
    DEPENDENT_DISK_FLAG_MULT_BACKING_FILES = 1
    DEPENDENT_DISK_FLAG_FULLY_ALLOCATED = 2
    DEPENDENT_DISK_FLAG_READ_ONLY = 4
    DEPENDENT_DISK_FLAG_REMOTE = 8
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME = 16
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT = 32
    DEPENDENT_DISK_FLAG_REMOVABLE = 64
    DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER = 128
    DEPENDENT_DISK_FLAG_PARENT = 256
    DEPENDENT_DISK_FLAG_NO_HOST_DISK = 512
    DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME = 1024
    DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 2048
    DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE = 4096
    DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 8192
  end

  enum STORAGE_DEPENDENCY_INFO_VERSION : Int32
    STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED = 0
    STORAGE_DEPENDENCY_INFO_VERSION_1 = 1
    STORAGE_DEPENDENCY_INFO_VERSION_2 = 2
  end

  enum GET_STORAGE_DEPENDENCY_FLAG : UInt32
    GET_STORAGE_DEPENDENCY_FLAG_NONE = 0
    GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES = 1
    GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE = 2
  end

  enum GET_VIRTUAL_DISK_INFO_VERSION : Int32
    GET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0
    GET_VIRTUAL_DISK_INFO_SIZE = 1
    GET_VIRTUAL_DISK_INFO_IDENTIFIER = 2
    GET_VIRTUAL_DISK_INFO_PARENT_LOCATION = 3
    GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER = 4
    GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP = 5
    GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE = 6
    GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE = 7
    GET_VIRTUAL_DISK_INFO_IS_4K_ALIGNED = 8
    GET_VIRTUAL_DISK_INFO_PHYSICAL_DISK = 9
    GET_VIRTUAL_DISK_INFO_VHD_PHYSICAL_SECTOR_SIZE = 10
    GET_VIRTUAL_DISK_INFO_SMALLEST_SAFE_VIRTUAL_SIZE = 11
    GET_VIRTUAL_DISK_INFO_FRAGMENTATION = 12
    GET_VIRTUAL_DISK_INFO_IS_LOADED = 13
    GET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 14
    GET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 15
  end

  enum SET_VIRTUAL_DISK_INFO_VERSION : Int32
    SET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0
    SET_VIRTUAL_DISK_INFO_PARENT_PATH = 1
    SET_VIRTUAL_DISK_INFO_IDENTIFIER = 2
    SET_VIRTUAL_DISK_INFO_PARENT_PATH_WITH_DEPTH = 3
    SET_VIRTUAL_DISK_INFO_PHYSICAL_SECTOR_SIZE = 4
    SET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 5
    SET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 6
    SET_VIRTUAL_DISK_INFO_PARENT_LOCATOR = 7
  end

  enum COMPACT_VIRTUAL_DISK_VERSION : Int32
    COMPACT_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    COMPACT_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum COMPACT_VIRTUAL_DISK_FLAG : UInt32
    COMPACT_VIRTUAL_DISK_FLAG_NONE = 0
    COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN = 1
    COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES = 2
  end

  enum MERGE_VIRTUAL_DISK_VERSION : Int32
    MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    MERGE_VIRTUAL_DISK_VERSION_1 = 1
    MERGE_VIRTUAL_DISK_VERSION_2 = 2
  end

  enum MERGE_VIRTUAL_DISK_FLAG : UInt32
    MERGE_VIRTUAL_DISK_FLAG_NONE = 0
  end

  enum EXPAND_VIRTUAL_DISK_VERSION : Int32
    EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    EXPAND_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum EXPAND_VIRTUAL_DISK_FLAG : UInt32
    EXPAND_VIRTUAL_DISK_FLAG_NONE = 0
    EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE = 1
  end

  enum RESIZE_VIRTUAL_DISK_VERSION : Int32
    RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    RESIZE_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum RESIZE_VIRTUAL_DISK_FLAG : UInt32
    RESIZE_VIRTUAL_DISK_FLAG_NONE = 0
    RESIZE_VIRTUAL_DISK_FLAG_ALLOW_UNSAFE_VIRTUAL_SIZE = 1
    RESIZE_VIRTUAL_DISK_FLAG_RESIZE_TO_SMALLEST_SAFE_VIRTUAL_SIZE = 2
  end

  enum MIRROR_VIRTUAL_DISK_VERSION : Int32
    MIRROR_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    MIRROR_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum MIRROR_VIRTUAL_DISK_FLAG : UInt32
    MIRROR_VIRTUAL_DISK_FLAG_NONE = 0
    MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1
    MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION = 2
    MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION = 4
    MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION = 8
  end

  enum QUERY_CHANGES_VIRTUAL_DISK_FLAG : UInt32
    QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE = 0
  end

  enum TAKE_SNAPSHOT_VHDSET_FLAG : UInt32
    TAKE_SNAPSHOT_VHDSET_FLAG_NONE = 0
    TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1
  end

  enum TAKE_SNAPSHOT_VHDSET_VERSION : Int32
    TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0
    TAKE_SNAPSHOT_VHDSET_VERSION_1 = 1
  end

  enum DELETE_SNAPSHOT_VHDSET_FLAG : UInt32
    DELETE_SNAPSHOT_VHDSET_FLAG_NONE = 0
    DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT = 1
  end

  enum DELETE_SNAPSHOT_VHDSET_VERSION : Int32
    DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0
    DELETE_SNAPSHOT_VHDSET_VERSION_1 = 1
  end

  enum MODIFY_VHDSET_VERSION : Int32
    MODIFY_VHDSET_UNSPECIFIED = 0
    MODIFY_VHDSET_SNAPSHOT_PATH = 1
    MODIFY_VHDSET_REMOVE_SNAPSHOT = 2
    MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH = 3
  end

  enum MODIFY_VHDSET_FLAG : UInt32
    MODIFY_VHDSET_FLAG_NONE = 0
    MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT = 1
  end

  enum APPLY_SNAPSHOT_VHDSET_FLAG : UInt32
    APPLY_SNAPSHOT_VHDSET_FLAG_NONE = 0
    APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1
  end

  enum APPLY_SNAPSHOT_VHDSET_VERSION : Int32
    APPLY_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0
    APPLY_SNAPSHOT_VHDSET_VERSION_1 = 1
  end

  enum RAW_SCSI_VIRTUAL_DISK_FLAG : UInt32
    RAW_SCSI_VIRTUAL_DISK_FLAG_NONE = 0
  end

  enum RAW_SCSI_VIRTUAL_DISK_VERSION : Int32
    RAW_SCSI_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    RAW_SCSI_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum FORK_VIRTUAL_DISK_VERSION : Int32
    FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0
    FORK_VIRTUAL_DISK_VERSION_1 = 1
  end

  enum FORK_VIRTUAL_DISK_FLAG : UInt32
    FORK_VIRTUAL_DISK_FLAG_NONE = 0
    FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1
  end

  union OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    version2 : OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    version3 : OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version3_e__Struct
  end
  union CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    version2 : CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    version3 : CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version3_e__Struct
    version4 : CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version4_e__Struct
  end
  union ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    version2 : ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
  end
  union STORAGE_DEPENDENCY_INFO_Anonymous_e__Union
    version1_entries : STORAGE_DEPENDENCY_INFO_TYPE_1[0]*
    version2_entries : STORAGE_DEPENDENCY_INFO_TYPE_2[0]*
  end
  union GET_VIRTUAL_DISK_INFO_Anonymous_e__Union
    size : GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_Size_e__Struct
    identifier : Guid
    parent_location : GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentLocation_e__Struct
    parent_identifier : Guid
    parent_timestamp : UInt32
    virtual_storage_type : VIRTUAL_STORAGE_TYPE
    provider_subtype : UInt32
    is4k_aligned : LibC::BOOL
    is_loaded : LibC::BOOL
    physical_disk : GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_PhysicalDisk_e__Struct
    vhd_physical_sector_size : UInt32
    smallest_safe_virtual_size : UInt64
    fragmentation_percentage : UInt32
    virtual_disk_id : Guid
    change_tracking_state : GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ChangeTrackingState_e__Struct
  end
  union SET_VIRTUAL_DISK_INFO_Anonymous_e__Union
    parent_file_path : LibC::LPWSTR
    unique_identifier : Guid
    parent_path_with_depth_info : SET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentPathWithDepthInfo_e__Struct
    vhd_physical_sector_size : UInt32
    virtual_disk_id : Guid
    change_tracking_enabled : LibC::BOOL
    parent_locator : SET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentLocator_e__Struct
  end
  union COMPACT_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : COMPACT_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    version2 : MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
  end
  union EXPAND_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : EXPAND_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union RESIZE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : RESIZE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union MIRROR_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : MIRROR_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union TAKE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
    version1 : TAKE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union DELETE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
    version1 : DELETE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union MODIFY_VHDSET_PARAMETERS_Anonymous_e__Union
    snapshot_path : MODIFY_VHDSET_PARAMETERS_Anonymous_e__Union_SnapshotPath_e__Struct
    snapshot_id : Guid
    default_file_path : LibC::LPWSTR
  end
  union APPLY_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
    version1 : APPLY_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union RAW_SCSI_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : RAW_SCSI_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end
  union RAW_SCSI_VIRTUAL_DISK_RESPONSE_Anonymous_e__Union
    version1 : RAW_SCSI_VIRTUAL_DISK_RESPONSE_Anonymous_e__Union_Version1_e__Struct
  end
  union FORK_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
    version1 : FORK_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
  end

  struct VIRTUAL_STORAGE_TYPE
    device_id : UInt32
    vendor_id : Guid
  end
  struct OPEN_VIRTUAL_DISK_PARAMETERS
    version : OPEN_VIRTUAL_DISK_VERSION
    anonymous : OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version3_e__Struct
    get_info_only : LibC::BOOL
    read_only : LibC::BOOL
    resiliency_guid : Guid
    snapshot_id : Guid
  end
  struct OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    rw_depth : UInt32
  end
  struct OPEN_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    get_info_only : LibC::BOOL
    read_only : LibC::BOOL
    resiliency_guid : Guid
  end
  struct CREATE_VIRTUAL_DISK_PARAMETERS
    version : CREATE_VIRTUAL_DISK_VERSION
    anonymous : CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version4_e__Struct
    unique_id : Guid
    maximum_size : UInt64
    block_size_in_bytes : UInt32
    sector_size_in_bytes : UInt32
    physical_sector_size_in_bytes : UInt32
    parent_path : LibC::LPWSTR
    source_path : LibC::LPWSTR
    open_flags : OPEN_VIRTUAL_DISK_FLAG
    parent_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    source_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    resiliency_guid : Guid
    source_limit_path : LibC::LPWSTR
    backing_storage_type : VIRTUAL_STORAGE_TYPE
    pmem_address_abstraction_type : Guid
    data_alignment : UInt64
  end
  struct CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    unique_id : Guid
    maximum_size : UInt64
    block_size_in_bytes : UInt32
    sector_size_in_bytes : UInt32
    physical_sector_size_in_bytes : UInt32
    parent_path : LibC::LPWSTR
    source_path : LibC::LPWSTR
    open_flags : OPEN_VIRTUAL_DISK_FLAG
    parent_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    source_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    resiliency_guid : Guid
  end
  struct CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version3_e__Struct
    unique_id : Guid
    maximum_size : UInt64
    block_size_in_bytes : UInt32
    sector_size_in_bytes : UInt32
    physical_sector_size_in_bytes : UInt32
    parent_path : LibC::LPWSTR
    source_path : LibC::LPWSTR
    open_flags : OPEN_VIRTUAL_DISK_FLAG
    parent_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    source_virtual_storage_type : VIRTUAL_STORAGE_TYPE
    resiliency_guid : Guid
    source_limit_path : LibC::LPWSTR
    backing_storage_type : VIRTUAL_STORAGE_TYPE
  end
  struct CREATE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    unique_id : Guid
    maximum_size : UInt64
    block_size_in_bytes : UInt32
    sector_size_in_bytes : UInt32
    parent_path : LibC::LPWSTR
    source_path : LibC::LPWSTR
  end
  struct ATTACH_VIRTUAL_DISK_PARAMETERS
    version : ATTACH_VIRTUAL_DISK_VERSION
    anonymous : ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    restricted_offset : UInt64
    restricted_length : UInt64
  end
  struct ATTACH_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    reserved : UInt32
  end
  struct STORAGE_DEPENDENCY_INFO_TYPE_1
    dependency_type_flags : DEPENDENT_DISK_FLAG
    provider_specific_flags : UInt32
    virtual_storage_type : VIRTUAL_STORAGE_TYPE
  end
  struct STORAGE_DEPENDENCY_INFO_TYPE_2
    dependency_type_flags : DEPENDENT_DISK_FLAG
    provider_specific_flags : UInt32
    virtual_storage_type : VIRTUAL_STORAGE_TYPE
    ancestor_level : UInt32
    dependency_device_name : LibC::LPWSTR
    host_volume_name : LibC::LPWSTR
    dependent_volume_name : LibC::LPWSTR
    dependent_volume_relative_path : LibC::LPWSTR
  end
  struct STORAGE_DEPENDENCY_INFO
    version : STORAGE_DEPENDENCY_INFO_VERSION
    number_entries : UInt32
    anonymous : STORAGE_DEPENDENCY_INFO_Anonymous_e__Union
  end
  struct GET_VIRTUAL_DISK_INFO
    version : GET_VIRTUAL_DISK_INFO_VERSION
    anonymous : GET_VIRTUAL_DISK_INFO_Anonymous_e__Union
  end
  struct GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_PhysicalDisk_e__Struct
    logical_sector_size : UInt32
    physical_sector_size : UInt32
    is_remote : LibC::BOOL
  end
  struct GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_Size_e__Struct
    virtual_size : UInt64
    physical_size : UInt64
    block_size : UInt32
    sector_size : UInt32
  end
  struct GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ChangeTrackingState_e__Struct
    enabled : LibC::BOOL
    newer_changes : LibC::BOOL
    most_recent_id : Char[0]*
  end
  struct GET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentLocation_e__Struct
    parent_resolved : LibC::BOOL
    parent_location_buffer : Char[0]*
  end
  struct SET_VIRTUAL_DISK_INFO
    version : SET_VIRTUAL_DISK_INFO_VERSION
    anonymous : SET_VIRTUAL_DISK_INFO_Anonymous_e__Union
  end
  struct SET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentPathWithDepthInfo_e__Struct
    child_depth : UInt32
    parent_file_path : LibC::LPWSTR
  end
  struct SET_VIRTUAL_DISK_INFO_Anonymous_e__Union_ParentLocator_e__Struct
    linkage_id : Guid
    parent_file_path : LibC::LPWSTR
  end
  struct VIRTUAL_DISK_PROGRESS
    operation_status : UInt32
    current_value : UInt64
    completion_value : UInt64
  end
  struct COMPACT_VIRTUAL_DISK_PARAMETERS
    version : COMPACT_VIRTUAL_DISK_VERSION
    anonymous : COMPACT_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct COMPACT_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    reserved : UInt32
  end
  struct MERGE_VIRTUAL_DISK_PARAMETERS
    version : MERGE_VIRTUAL_DISK_VERSION
    anonymous : MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version2_e__Struct
    merge_source_depth : UInt32
    merge_target_depth : UInt32
  end
  struct MERGE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    merge_depth : UInt32
  end
  struct EXPAND_VIRTUAL_DISK_PARAMETERS
    version : EXPAND_VIRTUAL_DISK_VERSION
    anonymous : EXPAND_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct EXPAND_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    new_size : UInt64
  end
  struct RESIZE_VIRTUAL_DISK_PARAMETERS
    version : RESIZE_VIRTUAL_DISK_VERSION
    anonymous : RESIZE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct RESIZE_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    new_size : UInt64
  end
  struct MIRROR_VIRTUAL_DISK_PARAMETERS
    version : MIRROR_VIRTUAL_DISK_VERSION
    anonymous : MIRROR_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct MIRROR_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    mirror_virtual_disk_path : LibC::LPWSTR
  end
  struct QUERY_CHANGES_VIRTUAL_DISK_RANGE
    byte_offset : UInt64
    byte_length : UInt64
    reserved : UInt64
  end
  struct TAKE_SNAPSHOT_VHDSET_PARAMETERS
    version : TAKE_SNAPSHOT_VHDSET_VERSION
    anonymous : TAKE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
  end
  struct TAKE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    snapshot_id : Guid
  end
  struct DELETE_SNAPSHOT_VHDSET_PARAMETERS
    version : DELETE_SNAPSHOT_VHDSET_VERSION
    anonymous : DELETE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
  end
  struct DELETE_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    snapshot_id : Guid
  end
  struct MODIFY_VHDSET_PARAMETERS
    version : MODIFY_VHDSET_VERSION
    anonymous : MODIFY_VHDSET_PARAMETERS_Anonymous_e__Union
  end
  struct MODIFY_VHDSET_PARAMETERS_Anonymous_e__Union_SnapshotPath_e__Struct
    snapshot_id : Guid
    snapshot_file_path : LibC::LPWSTR
  end
  struct APPLY_SNAPSHOT_VHDSET_PARAMETERS
    version : APPLY_SNAPSHOT_VHDSET_VERSION
    anonymous : APPLY_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union
  end
  struct APPLY_SNAPSHOT_VHDSET_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    snapshot_id : Guid
    leaf_snapshot_id : Guid
  end
  struct RAW_SCSI_VIRTUAL_DISK_PARAMETERS
    version : RAW_SCSI_VIRTUAL_DISK_VERSION
    anonymous : RAW_SCSI_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct RAW_SCSI_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    rsvd_handle : LibC::BOOL
    data_in : UInt8
    cdb_length : UInt8
    sense_info_length : UInt8
    srb_flags : UInt32
    data_transfer_length : UInt32
    data_buffer : Void*
    sense_info : UInt8*
    cdb : UInt8*
  end
  struct RAW_SCSI_VIRTUAL_DISK_RESPONSE
    version : RAW_SCSI_VIRTUAL_DISK_VERSION
    anonymous : RAW_SCSI_VIRTUAL_DISK_RESPONSE_Anonymous_e__Union
  end
  struct RAW_SCSI_VIRTUAL_DISK_RESPONSE_Anonymous_e__Union_Version1_e__Struct
    scsi_status : UInt8
    sense_info_length : UInt8
    data_transfer_length : UInt32
  end
  struct FORK_VIRTUAL_DISK_PARAMETERS
    version : FORK_VIRTUAL_DISK_VERSION
    anonymous : FORK_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union
  end
  struct FORK_VIRTUAL_DISK_PARAMETERS_Anonymous_e__Union_Version1_e__Struct
    forked_virtual_disk_path : LibC::LPWSTR
  end


  # Params # virtualstoragetype : VIRTUAL_STORAGE_TYPE* [In],path : LibC::LPWSTR [In],virtualdiskaccessmask : VIRTUAL_DISK_ACCESS_MASK [In],flags : OPEN_VIRTUAL_DISK_FLAG [In],parameters : OPEN_VIRTUAL_DISK_PARAMETERS* [In],handle : LibC::HANDLE* [In]
  fun OpenVirtualDisk(virtualstoragetype : VIRTUAL_STORAGE_TYPE*, path : LibC::LPWSTR, virtualdiskaccessmask : VIRTUAL_DISK_ACCESS_MASK, flags : OPEN_VIRTUAL_DISK_FLAG, parameters : OPEN_VIRTUAL_DISK_PARAMETERS*, handle : LibC::HANDLE*) : UInt32

  # Params # virtualstoragetype : VIRTUAL_STORAGE_TYPE* [In],path : LibC::LPWSTR [In],virtualdiskaccessmask : VIRTUAL_DISK_ACCESS_MASK [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],flags : CREATE_VIRTUAL_DISK_FLAG [In],providerspecificflags : UInt32 [In],parameters : CREATE_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In],handle : LibC::HANDLE* [In]
  fun CreateVirtualDisk(virtualstoragetype : VIRTUAL_STORAGE_TYPE*, path : LibC::LPWSTR, virtualdiskaccessmask : VIRTUAL_DISK_ACCESS_MASK, securitydescriptor : SECURITY_DESCRIPTOR*, flags : CREATE_VIRTUAL_DISK_FLAG, providerspecificflags : UInt32, parameters : CREATE_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*, handle : LibC::HANDLE*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],flags : ATTACH_VIRTUAL_DISK_FLAG [In],providerspecificflags : UInt32 [In],parameters : ATTACH_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun AttachVirtualDisk(virtualdiskhandle : LibC::HANDLE, securitydescriptor : SECURITY_DESCRIPTOR*, flags : ATTACH_VIRTUAL_DISK_FLAG, providerspecificflags : UInt32, parameters : ATTACH_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : DETACH_VIRTUAL_DISK_FLAG [In],providerspecificflags : UInt32 [In]
  fun DetachVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : DETACH_VIRTUAL_DISK_FLAG, providerspecificflags : UInt32) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],diskpathsizeinbytes : UInt32* [In],diskpath : LibC::LPWSTR [In]
  fun GetVirtualDiskPhysicalPath(virtualdiskhandle : LibC::HANDLE, diskpathsizeinbytes : UInt32*, diskpath : LibC::LPWSTR) : UInt32

  # Params # pathsbuffersizeinbytes : UInt32* [In],pathsbuffer : LibC::LPWSTR [In]
  fun GetAllAttachedVirtualDiskPhysicalPaths(pathsbuffersizeinbytes : UInt32*, pathsbuffer : LibC::LPWSTR) : UInt32

  # Params # objecthandle : LibC::HANDLE [In],flags : GET_STORAGE_DEPENDENCY_FLAG [In],storagedependencyinfosize : UInt32 [In],storagedependencyinfo : STORAGE_DEPENDENCY_INFO* [In],sizeused : UInt32* [In]
  fun GetStorageDependencyInformation(objecthandle : LibC::HANDLE, flags : GET_STORAGE_DEPENDENCY_FLAG, storagedependencyinfosize : UInt32, storagedependencyinfo : STORAGE_DEPENDENCY_INFO*, sizeused : UInt32*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],virtualdiskinfosize : UInt32* [In],virtualdiskinfo : GET_VIRTUAL_DISK_INFO* [In],sizeused : UInt32* [In]
  fun GetVirtualDiskInformation(virtualdiskhandle : LibC::HANDLE, virtualdiskinfosize : UInt32*, virtualdiskinfo : GET_VIRTUAL_DISK_INFO*, sizeused : UInt32*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],virtualdiskinfo : SET_VIRTUAL_DISK_INFO* [In]
  fun SetVirtualDiskInformation(virtualdiskhandle : LibC::HANDLE, virtualdiskinfo : SET_VIRTUAL_DISK_INFO*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],numberofitems : UInt32* [In],items : Guid* [In]
  fun EnumerateVirtualDiskMetadata(virtualdiskhandle : LibC::HANDLE, numberofitems : UInt32*, items : Guid*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],item : Guid* [In],metadatasize : UInt32* [In],metadata : Void* [In]
  fun GetVirtualDiskMetadata(virtualdiskhandle : LibC::HANDLE, item : Guid*, metadatasize : UInt32*, metadata : Void*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],item : Guid* [In],metadatasize : UInt32 [In],metadata : Void* [In]
  fun SetVirtualDiskMetadata(virtualdiskhandle : LibC::HANDLE, item : Guid*, metadatasize : UInt32, metadata : Void*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],item : Guid* [In]
  fun DeleteVirtualDiskMetadata(virtualdiskhandle : LibC::HANDLE, item : Guid*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],overlapped : OVERLAPPED* [In],progress : VIRTUAL_DISK_PROGRESS* [In]
  fun GetVirtualDiskOperationProgress(virtualdiskhandle : LibC::HANDLE, overlapped : OVERLAPPED*, progress : VIRTUAL_DISK_PROGRESS*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : COMPACT_VIRTUAL_DISK_FLAG [In],parameters : COMPACT_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun CompactVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : COMPACT_VIRTUAL_DISK_FLAG, parameters : COMPACT_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : MERGE_VIRTUAL_DISK_FLAG [In],parameters : MERGE_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun MergeVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : MERGE_VIRTUAL_DISK_FLAG, parameters : MERGE_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : EXPAND_VIRTUAL_DISK_FLAG [In],parameters : EXPAND_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun ExpandVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : EXPAND_VIRTUAL_DISK_FLAG, parameters : EXPAND_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : RESIZE_VIRTUAL_DISK_FLAG [In],parameters : RESIZE_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun ResizeVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : RESIZE_VIRTUAL_DISK_FLAG, parameters : RESIZE_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : MIRROR_VIRTUAL_DISK_FLAG [In],parameters : MIRROR_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun MirrorVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : MIRROR_VIRTUAL_DISK_FLAG, parameters : MIRROR_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In]
  fun BreakMirrorVirtualDisk(virtualdiskhandle : LibC::HANDLE) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parentpath : LibC::LPWSTR [In]
  fun AddVirtualDiskParent(virtualdiskhandle : LibC::HANDLE, parentpath : LibC::LPWSTR) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],changetrackingid : LibC::LPWSTR [In],byteoffset : UInt64 [In],bytelength : UInt64 [In],flags : QUERY_CHANGES_VIRTUAL_DISK_FLAG [In],ranges : QUERY_CHANGES_VIRTUAL_DISK_RANGE* [In],rangecount : UInt32* [In],processedlength : UInt64* [In]
  fun QueryChangesVirtualDisk(virtualdiskhandle : LibC::HANDLE, changetrackingid : LibC::LPWSTR, byteoffset : UInt64, bytelength : UInt64, flags : QUERY_CHANGES_VIRTUAL_DISK_FLAG, ranges : QUERY_CHANGES_VIRTUAL_DISK_RANGE*, rangecount : UInt32*, processedlength : UInt64*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parameters : TAKE_SNAPSHOT_VHDSET_PARAMETERS* [In],flags : TAKE_SNAPSHOT_VHDSET_FLAG [In]
  fun TakeSnapshotVhdSet(virtualdiskhandle : LibC::HANDLE, parameters : TAKE_SNAPSHOT_VHDSET_PARAMETERS*, flags : TAKE_SNAPSHOT_VHDSET_FLAG) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parameters : DELETE_SNAPSHOT_VHDSET_PARAMETERS* [In],flags : DELETE_SNAPSHOT_VHDSET_FLAG [In]
  fun DeleteSnapshotVhdSet(virtualdiskhandle : LibC::HANDLE, parameters : DELETE_SNAPSHOT_VHDSET_PARAMETERS*, flags : DELETE_SNAPSHOT_VHDSET_FLAG) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parameters : MODIFY_VHDSET_PARAMETERS* [In],flags : MODIFY_VHDSET_FLAG [In]
  fun ModifyVhdSet(virtualdiskhandle : LibC::HANDLE, parameters : MODIFY_VHDSET_PARAMETERS*, flags : MODIFY_VHDSET_FLAG) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parameters : APPLY_SNAPSHOT_VHDSET_PARAMETERS* [In],flags : APPLY_SNAPSHOT_VHDSET_FLAG [In]
  fun ApplySnapshotVhdSet(virtualdiskhandle : LibC::HANDLE, parameters : APPLY_SNAPSHOT_VHDSET_PARAMETERS*, flags : APPLY_SNAPSHOT_VHDSET_FLAG) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],parameters : RAW_SCSI_VIRTUAL_DISK_PARAMETERS* [In],flags : RAW_SCSI_VIRTUAL_DISK_FLAG [In],response : RAW_SCSI_VIRTUAL_DISK_RESPONSE* [In]
  fun RawSCSIVirtualDisk(virtualdiskhandle : LibC::HANDLE, parameters : RAW_SCSI_VIRTUAL_DISK_PARAMETERS*, flags : RAW_SCSI_VIRTUAL_DISK_FLAG, response : RAW_SCSI_VIRTUAL_DISK_RESPONSE*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In],flags : FORK_VIRTUAL_DISK_FLAG [In],parameters : FORK_VIRTUAL_DISK_PARAMETERS* [In],overlapped : OVERLAPPED* [In]
  fun ForkVirtualDisk(virtualdiskhandle : LibC::HANDLE, flags : FORK_VIRTUAL_DISK_FLAG, parameters : FORK_VIRTUAL_DISK_PARAMETERS*, overlapped : OVERLAPPED*) : UInt32

  # Params # virtualdiskhandle : LibC::HANDLE [In]
  fun CompleteForkVirtualDisk(virtualdiskhandle : LibC::HANDLE) : UInt32
end
