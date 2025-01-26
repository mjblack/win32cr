require "./file_system.cr"
require "./../foundation.cr"
require "./../system/correlation_vector.cr"
require "./../system/io.cr"

module Win32cr::Storage::CloudFilters
  alias CF_CONNECTION_KEY = LibC::IntPtrT
  alias CF_CALLBACK = Proc(Win32cr::Storage::CloudFilters::CF_CALLBACK_INFO*, Win32cr::Storage::CloudFilters::CF_CALLBACK_PARAMETERS*, Void)

  CF_REQUEST_KEY_DEFAULT = 0_u32
  CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH = 4096_u32
  CF_MAX_PRIORITY_HINT = 15_u32
  CF_MAX_PROVIDER_NAME_LENGTH = 255_u32
  CF_MAX_PROVIDER_VERSION_LENGTH = 255_u32

  @[Flags]
  enum CF_PLACEHOLDER_CREATE_FLAGS : UInt32
    CF_PLACEHOLDER_CREATE_FLAG_NONE = 0_u32
    CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 1_u32
    CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC = 2_u32
    CF_PLACEHOLDER_CREATE_FLAG_SUPERSEDE = 4_u32
    CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL = 8_u32
  end
  @[Flags]
  enum CF_SYNC_PROVIDER_STATUS : UInt32
    CF_PROVIDER_STATUS_DISCONNECTED = 0_u32
    CF_PROVIDER_STATUS_IDLE = 1_u32
    CF_PROVIDER_STATUS_POPULATE_NAMESPACE = 2_u32
    CF_PROVIDER_STATUS_POPULATE_METADATA = 4_u32
    CF_PROVIDER_STATUS_POPULATE_CONTENT = 8_u32
    CF_PROVIDER_STATUS_SYNC_INCREMENTAL = 16_u32
    CF_PROVIDER_STATUS_SYNC_FULL = 32_u32
    CF_PROVIDER_STATUS_CONNECTIVITY_LOST = 64_u32
    CF_PROVIDER_STATUS_CLEAR_FLAGS = 2147483648_u32
    CF_PROVIDER_STATUS_TERMINATED = 3221225473_u32
    CF_PROVIDER_STATUS_ERROR = 3221225474_u32
  end
  @[Flags]
  enum CF_REGISTER_FLAGS : UInt32
    CF_REGISTER_FLAG_NONE = 0_u32
    CF_REGISTER_FLAG_UPDATE = 1_u32
    CF_REGISTER_FLAG_DISABLE_ON_DEMAND_POPULATION_ON_ROOT = 2_u32
    CF_REGISTER_FLAG_MARK_IN_SYNC_ON_ROOT = 4_u32
  end
  enum CF_HYDRATION_POLICY_PRIMARY : UInt16
    CF_HYDRATION_POLICY_PARTIAL = 0_u16
    CF_HYDRATION_POLICY_PROGRESSIVE = 1_u16
    CF_HYDRATION_POLICY_FULL = 2_u16
    CF_HYDRATION_POLICY_ALWAYS_FULL = 3_u16
  end
  @[Flags]
  enum CF_HYDRATION_POLICY_MODIFIER : UInt16
    CF_HYDRATION_POLICY_MODIFIER_NONE = 0_u16
    CF_HYDRATION_POLICY_MODIFIER_VALIDATION_REQUIRED = 1_u16
    CF_HYDRATION_POLICY_MODIFIER_STREAMING_ALLOWED = 2_u16
    CF_HYDRATION_POLICY_MODIFIER_AUTO_DEHYDRATION_ALLOWED = 4_u16
    CF_HYDRATION_POLICY_MODIFIER_ALLOW_FULL_RESTART_HYDRATION = 8_u16
  end
  enum CF_POPULATION_POLICY_PRIMARY : UInt16
    CF_POPULATION_POLICY_PARTIAL = 0_u16
    CF_POPULATION_POLICY_FULL = 2_u16
    CF_POPULATION_POLICY_ALWAYS_FULL = 3_u16
  end
  @[Flags]
  enum CF_POPULATION_POLICY_MODIFIER : UInt16
    CF_POPULATION_POLICY_MODIFIER_NONE = 0_u16
  end
  enum CF_PLACEHOLDER_MANAGEMENT_POLICY
    CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT = 0_i32
    CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED = 1_i32
    CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED = 2_i32
    CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED = 4_i32
  end
  @[Flags]
  enum CF_INSYNC_POLICY : UInt32
    CF_INSYNC_POLICY_NONE = 0_u32
    CF_INSYNC_POLICY_TRACK_FILE_CREATION_TIME = 1_u32
    CF_INSYNC_POLICY_TRACK_FILE_READONLY_ATTRIBUTE = 2_u32
    CF_INSYNC_POLICY_TRACK_FILE_HIDDEN_ATTRIBUTE = 4_u32
    CF_INSYNC_POLICY_TRACK_FILE_SYSTEM_ATTRIBUTE = 8_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_CREATION_TIME = 16_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_READONLY_ATTRIBUTE = 32_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_HIDDEN_ATTRIBUTE = 64_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_SYSTEM_ATTRIBUTE = 128_u32
    CF_INSYNC_POLICY_TRACK_FILE_LAST_WRITE_TIME = 256_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_LAST_WRITE_TIME = 512_u32
    CF_INSYNC_POLICY_TRACK_FILE_ALL = 5592335_u32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_ALL = 11184880_u32
    CF_INSYNC_POLICY_TRACK_ALL = 16777215_u32
    CF_INSYNC_POLICY_PRESERVE_INSYNC_FOR_SYNC_ENGINE = 2147483648_u32
  end
  @[Flags]
  enum CF_HARDLINK_POLICY : UInt32
    CF_HARDLINK_POLICY_NONE = 0_u32
    CF_HARDLINK_POLICY_ALLOWED = 1_u32
  end
  @[Flags]
  enum CF_CALLBACK_CANCEL_FLAGS : UInt32
    CF_CALLBACK_CANCEL_FLAG_NONE = 0_u32
    CF_CALLBACK_CANCEL_FLAG_IO_TIMEOUT = 1_u32
    CF_CALLBACK_CANCEL_FLAG_IO_ABORTED = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_FETCH_DATA_FLAGS : UInt32
    CF_CALLBACK_FETCH_DATA_FLAG_NONE = 0_u32
    CF_CALLBACK_FETCH_DATA_FLAG_RECOVERY = 1_u32
    CF_CALLBACK_FETCH_DATA_FLAG_EXPLICIT_HYDRATION = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_VALIDATE_DATA_FLAGS : UInt32
    CF_CALLBACK_VALIDATE_DATA_FLAG_NONE = 0_u32
    CF_CALLBACK_VALIDATE_DATA_FLAG_EXPLICIT_HYDRATION = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS : UInt32
    CF_CALLBACK_FETCH_PLACEHOLDERS_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_CALLBACK_OPEN_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE = 0_u32
    CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN = 1_u32
    CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_CLOSE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_CLOSE_COMPLETION_FLAG_NONE = 0_u32
    CF_CALLBACK_CLOSE_COMPLETION_FLAG_DELETED = 1_u32
  end
  @[Flags]
  enum CF_CALLBACK_DEHYDRATE_FLAGS : UInt32
    CF_CALLBACK_DEHYDRATE_FLAG_NONE = 0_u32
    CF_CALLBACK_DEHYDRATE_FLAG_BACKGROUND = 1_u32
  end
  @[Flags]
  enum CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_NONE = 0_u32
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_BACKGROUND = 1_u32
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_DEHYDRATED = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_DELETE_FLAGS : UInt32
    CF_CALLBACK_DELETE_FLAG_NONE = 0_u32
    CF_CALLBACK_DELETE_FLAG_IS_DIRECTORY = 1_u32
    CF_CALLBACK_DELETE_FLAG_IS_UNDELETE = 2_u32
  end
  @[Flags]
  enum CF_CALLBACK_DELETE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_DELETE_COMPLETION_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_CALLBACK_RENAME_FLAGS : UInt32
    CF_CALLBACK_RENAME_FLAG_NONE = 0_u32
    CF_CALLBACK_RENAME_FLAG_IS_DIRECTORY = 1_u32
    CF_CALLBACK_RENAME_FLAG_SOURCE_IN_SCOPE = 2_u32
    CF_CALLBACK_RENAME_FLAG_TARGET_IN_SCOPE = 4_u32
  end
  @[Flags]
  enum CF_CALLBACK_RENAME_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_RENAME_COMPLETION_FLAG_NONE = 0_u32
  end
  enum CF_CALLBACK_DEHYDRATION_REASON
    CF_CALLBACK_DEHYDRATION_REASON_NONE = 0_i32
    CF_CALLBACK_DEHYDRATION_REASON_USER_MANUAL = 1_i32
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_LOW_SPACE = 2_i32
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_INACTIVITY = 3_i32
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_OS_UPGRADE = 4_i32
  end
  enum CF_CALLBACK_TYPE
    CF_CALLBACK_TYPE_FETCH_DATA = 0_i32
    CF_CALLBACK_TYPE_VALIDATE_DATA = 1_i32
    CF_CALLBACK_TYPE_CANCEL_FETCH_DATA = 2_i32
    CF_CALLBACK_TYPE_FETCH_PLACEHOLDERS = 3_i32
    CF_CALLBACK_TYPE_CANCEL_FETCH_PLACEHOLDERS = 4_i32
    CF_CALLBACK_TYPE_NOTIFY_FILE_OPEN_COMPLETION = 5_i32
    CF_CALLBACK_TYPE_NOTIFY_FILE_CLOSE_COMPLETION = 6_i32
    CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE = 7_i32
    CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE_COMPLETION = 8_i32
    CF_CALLBACK_TYPE_NOTIFY_DELETE = 9_i32
    CF_CALLBACK_TYPE_NOTIFY_DELETE_COMPLETION = 10_i32
    CF_CALLBACK_TYPE_NOTIFY_RENAME = 11_i32
    CF_CALLBACK_TYPE_NOTIFY_RENAME_COMPLETION = 12_i32
    CF_CALLBACK_TYPE_NONE = -1_i32
  end
  @[Flags]
  enum CF_CONNECT_FLAGS : UInt32
    CF_CONNECT_FLAG_NONE = 0_u32
    CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO = 2_u32
    CF_CONNECT_FLAG_REQUIRE_FULL_FILE_PATH = 4_u32
    CF_CONNECT_FLAG_BLOCK_SELF_IMPLICIT_HYDRATION = 8_u32
  end
  enum CF_OPERATION_TYPE
    CF_OPERATION_TYPE_TRANSFER_DATA = 0_i32
    CF_OPERATION_TYPE_RETRIEVE_DATA = 1_i32
    CF_OPERATION_TYPE_ACK_DATA = 2_i32
    CF_OPERATION_TYPE_RESTART_HYDRATION = 3_i32
    CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS = 4_i32
    CF_OPERATION_TYPE_ACK_DEHYDRATE = 5_i32
    CF_OPERATION_TYPE_ACK_DELETE = 6_i32
    CF_OPERATION_TYPE_ACK_RENAME = 7_i32
  end
  @[Flags]
  enum CF_OPERATION_TRANSFER_DATA_FLAGS : UInt32
    CF_OPERATION_TRANSFER_DATA_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_OPERATION_RETRIEVE_DATA_FLAGS : UInt32
    CF_OPERATION_RETRIEVE_DATA_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_OPERATION_ACK_DATA_FLAGS : UInt32
    CF_OPERATION_ACK_DATA_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_OPERATION_RESTART_HYDRATION_FLAGS : UInt32
    CF_OPERATION_RESTART_HYDRATION_FLAG_NONE = 0_u32
    CF_OPERATION_RESTART_HYDRATION_FLAG_MARK_IN_SYNC = 1_u32
  end
  @[Flags]
  enum CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS : UInt32
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_NONE = 0_u32
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_STOP_ON_ERROR = 1_u32
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION = 2_u32
  end
  @[Flags]
  enum CF_OPERATION_ACK_DEHYDRATE_FLAGS : UInt32
    CF_OPERATION_ACK_DEHYDRATE_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_OPERATION_ACK_RENAME_FLAGS : UInt32
    CF_OPERATION_ACK_RENAME_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_OPERATION_ACK_DELETE_FLAGS : UInt32
    CF_OPERATION_ACK_DELETE_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_CREATE_FLAGS : UInt32
    CF_CREATE_FLAG_NONE = 0_u32
    CF_CREATE_FLAG_STOP_ON_ERROR = 1_u32
  end
  @[Flags]
  enum CF_OPEN_FILE_FLAGS : UInt32
    CF_OPEN_FILE_FLAG_NONE = 0_u32
    CF_OPEN_FILE_FLAG_EXCLUSIVE = 1_u32
    CF_OPEN_FILE_FLAG_WRITE_ACCESS = 2_u32
    CF_OPEN_FILE_FLAG_DELETE_ACCESS = 4_u32
    CF_OPEN_FILE_FLAG_FOREGROUND = 8_u32
  end
  @[Flags]
  enum CF_CONVERT_FLAGS : UInt32
    CF_CONVERT_FLAG_NONE = 0_u32
    CF_CONVERT_FLAG_MARK_IN_SYNC = 1_u32
    CF_CONVERT_FLAG_DEHYDRATE = 2_u32
    CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION = 4_u32
    CF_CONVERT_FLAG_ALWAYS_FULL = 8_u32
    CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE = 16_u32
  end
  @[Flags]
  enum CF_UPDATE_FLAGS : UInt32
    CF_UPDATE_FLAG_NONE = 0_u32
    CF_UPDATE_FLAG_VERIFY_IN_SYNC = 1_u32
    CF_UPDATE_FLAG_MARK_IN_SYNC = 2_u32
    CF_UPDATE_FLAG_DEHYDRATE = 4_u32
    CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION = 8_u32
    CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 16_u32
    CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY = 32_u32
    CF_UPDATE_FLAG_CLEAR_IN_SYNC = 64_u32
    CF_UPDATE_FLAG_REMOVE_PROPERTY = 128_u32
    CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA = 256_u32
    CF_UPDATE_FLAG_ALWAYS_FULL = 512_u32
    CF_UPDATE_FLAG_ALLOW_PARTIAL = 1024_u32
  end
  @[Flags]
  enum CF_REVERT_FLAGS : UInt32
    CF_REVERT_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_HYDRATE_FLAGS : UInt32
    CF_HYDRATE_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_DEHYDRATE_FLAGS : UInt32
    CF_DEHYDRATE_FLAG_NONE = 0_u32
    CF_DEHYDRATE_FLAG_BACKGROUND = 1_u32
  end
  enum CF_PIN_STATE
    CF_PIN_STATE_UNSPECIFIED = 0_i32
    CF_PIN_STATE_PINNED = 1_i32
    CF_PIN_STATE_UNPINNED = 2_i32
    CF_PIN_STATE_EXCLUDED = 3_i32
    CF_PIN_STATE_INHERIT = 4_i32
  end
  @[Flags]
  enum CF_SET_PIN_FLAGS : UInt32
    CF_SET_PIN_FLAG_NONE = 0_u32
    CF_SET_PIN_FLAG_RECURSE = 1_u32
    CF_SET_PIN_FLAG_RECURSE_ONLY = 2_u32
    CF_SET_PIN_FLAG_RECURSE_STOP_ON_ERROR = 4_u32
  end
  enum CF_IN_SYNC_STATE
    CF_IN_SYNC_STATE_NOT_IN_SYNC = 0_i32
    CF_IN_SYNC_STATE_IN_SYNC = 1_i32
  end
  @[Flags]
  enum CF_SET_IN_SYNC_FLAGS : UInt32
    CF_SET_IN_SYNC_FLAG_NONE = 0_u32
  end
  @[Flags]
  enum CF_PLACEHOLDER_STATE : UInt32
    CF_PLACEHOLDER_STATE_NO_STATES = 0_u32
    CF_PLACEHOLDER_STATE_PLACEHOLDER = 1_u32
    CF_PLACEHOLDER_STATE_SYNC_ROOT = 2_u32
    CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT = 4_u32
    CF_PLACEHOLDER_STATE_IN_SYNC = 8_u32
    CF_PLACEHOLDER_STATE_PARTIAL = 16_u32
    CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK = 32_u32
    CF_PLACEHOLDER_STATE_INVALID = 4294967295_u32
  end
  enum CF_PLACEHOLDER_INFO_CLASS
    CF_PLACEHOLDER_INFO_BASIC = 0_i32
    CF_PLACEHOLDER_INFO_STANDARD = 1_i32
  end
  enum CF_SYNC_ROOT_INFO_CLASS
    CF_SYNC_ROOT_INFO_BASIC = 0_i32
    CF_SYNC_ROOT_INFO_STANDARD = 1_i32
    CF_SYNC_ROOT_INFO_PROVIDER = 2_i32
  end
  enum CF_PLACEHOLDER_RANGE_INFO_CLASS
    CF_PLACEHOLDER_RANGE_INFO_ONDISK = 1_i32
    CF_PLACEHOLDER_RANGE_INFO_VALIDATED = 2_i32
    CF_PLACEHOLDER_RANGE_INFO_MODIFIED = 3_i32
  end

  @[Extern]
  struct CF_FS_METADATA
    property basic_info : Win32cr::Storage::FileSystem::FILE_BASIC_INFO
    property file_size : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@basic_info : Win32cr::Storage::FileSystem::FILE_BASIC_INFO, @file_size : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CF_PLACEHOLDER_CREATE_INFO
    property relative_file_name : Win32cr::Foundation::PWSTR
    property fs_metadata : Win32cr::Storage::CloudFilters::CF_FS_METADATA
    property file_identity : Void*
    property file_identity_length : UInt32
    property flags : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_CREATE_FLAGS
    property result : Win32cr::Foundation::HRESULT
    property create_usn : Int64
    def initialize(@relative_file_name : Win32cr::Foundation::PWSTR, @fs_metadata : Win32cr::Storage::CloudFilters::CF_FS_METADATA, @file_identity : Void*, @file_identity_length : UInt32, @flags : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_CREATE_FLAGS, @result : Win32cr::Foundation::HRESULT, @create_usn : Int64)
    end
  end

  @[Extern]
  struct CF_PROCESS_INFO
    property struct_size : UInt32
    property process_id : UInt32
    property image_path : Win32cr::Foundation::PWSTR
    property package_name : Win32cr::Foundation::PWSTR
    property application_id : Win32cr::Foundation::PWSTR
    property command_line : Win32cr::Foundation::PWSTR
    property session_id : UInt32
    def initialize(@struct_size : UInt32, @process_id : UInt32, @image_path : Win32cr::Foundation::PWSTR, @package_name : Win32cr::Foundation::PWSTR, @application_id : Win32cr::Foundation::PWSTR, @command_line : Win32cr::Foundation::PWSTR, @session_id : UInt32)
    end
  end

  @[Extern]
  struct CF_PLATFORM_INFO
    property build_number : UInt32
    property revision_number : UInt32
    property integration_number : UInt32
    def initialize(@build_number : UInt32, @revision_number : UInt32, @integration_number : UInt32)
    end
  end

  @[Extern]
  struct CF_HYDRATION_POLICY_PRIMARY_USHORT
    property us : UInt16
    def initialize(@us : UInt16)
    end
  end

  @[Extern]
  struct CF_HYDRATION_POLICY_MODIFIER_USHORT
    property us : UInt16
    def initialize(@us : UInt16)
    end
  end

  @[Extern]
  struct CF_HYDRATION_POLICY
    property primary : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY_PRIMARY_USHORT
    property modifier : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY_MODIFIER_USHORT
    def initialize(@primary : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY_PRIMARY_USHORT, @modifier : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY_MODIFIER_USHORT)
    end
  end

  @[Extern]
  struct CF_POPULATION_POLICY_PRIMARY_USHORT
    property us : UInt16
    def initialize(@us : UInt16)
    end
  end

  @[Extern]
  struct CF_POPULATION_POLICY_MODIFIER_USHORT
    property us : UInt16
    def initialize(@us : UInt16)
    end
  end

  @[Extern]
  struct CF_POPULATION_POLICY
    property primary : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY_PRIMARY_USHORT
    property modifier : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY_MODIFIER_USHORT
    def initialize(@primary : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY_PRIMARY_USHORT, @modifier : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY_MODIFIER_USHORT)
    end
  end

  @[Extern]
  struct CF_SYNC_POLICIES
    property struct_size : UInt32
    property hydration : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY
    property population : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY
    property in_sync : Win32cr::Storage::CloudFilters::CF_INSYNC_POLICY
    property hard_link : Win32cr::Storage::CloudFilters::CF_HARDLINK_POLICY
    property placeholder_management : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_MANAGEMENT_POLICY
    def initialize(@struct_size : UInt32, @hydration : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY, @population : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY, @in_sync : Win32cr::Storage::CloudFilters::CF_INSYNC_POLICY, @hard_link : Win32cr::Storage::CloudFilters::CF_HARDLINK_POLICY, @placeholder_management : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_MANAGEMENT_POLICY)
    end
  end

  @[Extern]
  struct CF_SYNC_REGISTRATION
    property struct_size : UInt32
    property provider_name : Win32cr::Foundation::PWSTR
    property provider_version : Win32cr::Foundation::PWSTR
    property sync_root_identity : Void*
    property sync_root_identity_length : UInt32
    property file_identity : Void*
    property file_identity_length : UInt32
    property provider_id : LibC::GUID
    def initialize(@struct_size : UInt32, @provider_name : Win32cr::Foundation::PWSTR, @provider_version : Win32cr::Foundation::PWSTR, @sync_root_identity : Void*, @sync_root_identity_length : UInt32, @file_identity : Void*, @file_identity_length : UInt32, @provider_id : LibC::GUID)
    end
  end

  @[Extern]
  struct CF_CALLBACK_INFO
    property struct_size : UInt32
    property connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY
    property callback_context : Void*
    property volume_guid_name : Win32cr::Foundation::PWSTR
    property volume_dos_name : Win32cr::Foundation::PWSTR
    property volume_serial_number : UInt32
    property sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER
    property sync_root_identity : Void*
    property sync_root_identity_length : UInt32
    property file_id : Win32cr::Foundation::LARGE_INTEGER
    property file_size : Win32cr::Foundation::LARGE_INTEGER
    property file_identity : Void*
    property file_identity_length : UInt32
    property normalized_path : Win32cr::Foundation::PWSTR
    property transfer_key : Win32cr::Foundation::LARGE_INTEGER
    property priority_hint : UInt8
    property correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*
    property process_info : Win32cr::Storage::CloudFilters::CF_PROCESS_INFO*
    property request_key : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@struct_size : UInt32, @connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, @callback_context : Void*, @volume_guid_name : Win32cr::Foundation::PWSTR, @volume_dos_name : Win32cr::Foundation::PWSTR, @volume_serial_number : UInt32, @sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER, @sync_root_identity : Void*, @sync_root_identity_length : UInt32, @file_id : Win32cr::Foundation::LARGE_INTEGER, @file_size : Win32cr::Foundation::LARGE_INTEGER, @file_identity : Void*, @file_identity_length : UInt32, @normalized_path : Win32cr::Foundation::PWSTR, @transfer_key : Win32cr::Foundation::LARGE_INTEGER, @priority_hint : UInt8, @correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*, @process_info : Win32cr::Storage::CloudFilters::CF_PROCESS_INFO*, @request_key : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CF_CALLBACK_PARAMETERS
    property param_size : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property cancel : Cancel_e__Struct_
    property fetch_data : FetchData_e__Struct_
    property validate_data : ValidateData_e__Struct_
    property fetch_placeholders : FetchPlaceholders_e__Struct_
    property open_completion : OpenCompletion_e__Struct_
    property close_completion : CloseCompletion_e__Struct_
    property dehydrate : Dehydrate_e__Struct_
    property dehydrate_completion : DehydrateCompletion_e__Struct_
    property delete : Delete_e__Struct_
    property delete_completion : DeleteCompletion_e__Struct_
    property rename : Rename_e__Struct_
    property rename_completion : RenameCompletion_e__Struct_

      # Nested Type Rename_e__Struct_
      @[Extern]
      struct Rename_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_RENAME_FLAGS
    property target_path : Win32cr::Foundation::PWSTR
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_RENAME_FLAGS, @target_path : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type Delete_e__Struct_
      @[Extern]
      struct Delete_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DELETE_FLAGS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DELETE_FLAGS)
    end
      end


      # Nested Type Dehydrate_e__Struct_
      @[Extern]
      struct Dehydrate_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATE_FLAGS
    property reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATE_FLAGS, @reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON)
    end
      end


      # Nested Type OpenCompletion_e__Struct_
      @[Extern]
      struct OpenCompletion_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_OPEN_COMPLETION_FLAGS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_OPEN_COMPLETION_FLAGS)
    end
      end


      # Nested Type ValidateData_e__Struct_
      @[Extern]
      struct ValidateData_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_VALIDATE_DATA_FLAGS
    property required_file_offset : Win32cr::Foundation::LARGE_INTEGER
    property required_length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_VALIDATE_DATA_FLAGS, @required_file_offset : Win32cr::Foundation::LARGE_INTEGER, @required_length : Win32cr::Foundation::LARGE_INTEGER)
    end
      end


      # Nested Type Cancel_e__Struct_
      @[Extern]
      struct Cancel_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_CANCEL_FLAGS
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property fetch_data : FetchData_e__Struct_

          # Nested Type FetchData_e__Struct_
          @[Extern]
          struct FetchData_e__Struct_
    property file_offset : Win32cr::Foundation::LARGE_INTEGER
    property length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@file_offset : Win32cr::Foundation::LARGE_INTEGER, @length : Win32cr::Foundation::LARGE_INTEGER)
    end
          end

    def initialize(@fetch_data : FetchData_e__Struct_)
    end
        end

    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_CANCEL_FLAGS, @anonymous : Anonymous_e__Union_)
    end
      end


      # Nested Type RenameCompletion_e__Struct_
      @[Extern]
      struct RenameCompletion_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_RENAME_COMPLETION_FLAGS
    property source_path : Win32cr::Foundation::PWSTR
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_RENAME_COMPLETION_FLAGS, @source_path : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type DehydrateCompletion_e__Struct_
      @[Extern]
      struct DehydrateCompletion_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS
    property reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS, @reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON)
    end
      end


      # Nested Type FetchPlaceholders_e__Struct_
      @[Extern]
      struct FetchPlaceholders_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS
    property pattern : Win32cr::Foundation::PWSTR
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS, @pattern : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type DeleteCompletion_e__Struct_
      @[Extern]
      struct DeleteCompletion_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DELETE_COMPLETION_FLAGS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_DELETE_COMPLETION_FLAGS)
    end
      end


      # Nested Type FetchData_e__Struct_
      @[Extern]
      struct FetchData_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_FETCH_DATA_FLAGS
    property required_file_offset : Win32cr::Foundation::LARGE_INTEGER
    property required_length : Win32cr::Foundation::LARGE_INTEGER
    property optional_file_offset : Win32cr::Foundation::LARGE_INTEGER
    property optional_length : Win32cr::Foundation::LARGE_INTEGER
    property last_dehydration_time : Win32cr::Foundation::LARGE_INTEGER
    property last_dehydration_reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_FETCH_DATA_FLAGS, @required_file_offset : Win32cr::Foundation::LARGE_INTEGER, @required_length : Win32cr::Foundation::LARGE_INTEGER, @optional_file_offset : Win32cr::Foundation::LARGE_INTEGER, @optional_length : Win32cr::Foundation::LARGE_INTEGER, @last_dehydration_time : Win32cr::Foundation::LARGE_INTEGER, @last_dehydration_reason : Win32cr::Storage::CloudFilters::CF_CALLBACK_DEHYDRATION_REASON)
    end
      end


      # Nested Type CloseCompletion_e__Struct_
      @[Extern]
      struct CloseCompletion_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_CLOSE_COMPLETION_FLAGS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_CALLBACK_CLOSE_COMPLETION_FLAGS)
    end
      end

    def initialize(@cancel : Cancel_e__Struct_, @fetch_data : FetchData_e__Struct_, @validate_data : ValidateData_e__Struct_, @fetch_placeholders : FetchPlaceholders_e__Struct_, @open_completion : OpenCompletion_e__Struct_, @close_completion : CloseCompletion_e__Struct_, @dehydrate : Dehydrate_e__Struct_, @dehydrate_completion : DehydrateCompletion_e__Struct_, @delete : Delete_e__Struct_, @delete_completion : DeleteCompletion_e__Struct_, @rename : Rename_e__Struct_, @rename_completion : RenameCompletion_e__Struct_)
    end
    end

    def initialize(@param_size : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CF_CALLBACK_REGISTRATION
    property type__ : Win32cr::Storage::CloudFilters::CF_CALLBACK_TYPE
    property callback : Win32cr::Storage::CloudFilters::CF_CALLBACK
    def initialize(@type__ : Win32cr::Storage::CloudFilters::CF_CALLBACK_TYPE, @callback : Win32cr::Storage::CloudFilters::CF_CALLBACK)
    end
  end

  @[Extern]
  struct CF_SYNC_STATUS
    property struct_size : UInt32
    property code : UInt32
    property description_offset : UInt32
    property description_length : UInt32
    property device_id_offset : UInt32
    property device_id_length : UInt32
    def initialize(@struct_size : UInt32, @code : UInt32, @description_offset : UInt32, @description_length : UInt32, @device_id_offset : UInt32, @device_id_length : UInt32)
    end
  end

  @[Extern]
  struct CF_OPERATION_INFO
    property struct_size : UInt32
    property type__ : Win32cr::Storage::CloudFilters::CF_OPERATION_TYPE
    property connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY
    property transfer_key : Win32cr::Foundation::LARGE_INTEGER
    property correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*
    property sync_status : Win32cr::Storage::CloudFilters::CF_SYNC_STATUS*
    property request_key : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@struct_size : UInt32, @type__ : Win32cr::Storage::CloudFilters::CF_OPERATION_TYPE, @connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, @transfer_key : Win32cr::Foundation::LARGE_INTEGER, @correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*, @sync_status : Win32cr::Storage::CloudFilters::CF_SYNC_STATUS*, @request_key : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CF_OPERATION_PARAMETERS
    property param_size : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property transfer_data : TransferData_e__Struct_
    property retrieve_data : RetrieveData_e__Struct_
    property ack_data : AckData_e__Struct_
    property restart_hydration : RestartHydration_e__Struct_
    property transfer_placeholders : TransferPlaceholders_e__Struct_
    property ack_dehydrate : AckDehydrate_e__Struct_
    property ack_rename : AckRename_e__Struct_
    property ack_delete : AckDelete_e__Struct_

      # Nested Type AckRename_e__Struct_
      @[Extern]
      struct AckRename_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_RENAME_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_RENAME_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS)
    end
      end


      # Nested Type TransferPlaceholders_e__Struct_
      @[Extern]
      struct TransferPlaceholders_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    property placeholder_total_count : Win32cr::Foundation::LARGE_INTEGER
    property placeholder_array : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_CREATE_INFO*
    property placeholder_count : UInt32
    property entries_processed : UInt32
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS, @placeholder_total_count : Win32cr::Foundation::LARGE_INTEGER, @placeholder_array : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_CREATE_INFO*, @placeholder_count : UInt32, @entries_processed : UInt32)
    end
      end


      # Nested Type AckData_e__Struct_
      @[Extern]
      struct AckData_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DATA_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    property offset : Win32cr::Foundation::LARGE_INTEGER
    property length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DATA_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS, @offset : Win32cr::Foundation::LARGE_INTEGER, @length : Win32cr::Foundation::LARGE_INTEGER)
    end
      end


      # Nested Type TransferData_e__Struct_
      @[Extern]
      struct TransferData_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_TRANSFER_DATA_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    property buffer : Void*
    property offset : Win32cr::Foundation::LARGE_INTEGER
    property length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_TRANSFER_DATA_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS, @buffer : Void*, @offset : Win32cr::Foundation::LARGE_INTEGER, @length : Win32cr::Foundation::LARGE_INTEGER)
    end
      end


      # Nested Type AckDelete_e__Struct_
      @[Extern]
      struct AckDelete_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DELETE_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DELETE_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS)
    end
      end


      # Nested Type RestartHydration_e__Struct_
      @[Extern]
      struct RestartHydration_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_RESTART_HYDRATION_FLAGS
    property fs_metadata : Win32cr::Storage::CloudFilters::CF_FS_METADATA*
    property file_identity : Void*
    property file_identity_length : UInt32
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_RESTART_HYDRATION_FLAGS, @fs_metadata : Win32cr::Storage::CloudFilters::CF_FS_METADATA*, @file_identity : Void*, @file_identity_length : UInt32)
    end
      end


      # Nested Type AckDehydrate_e__Struct_
      @[Extern]
      struct AckDehydrate_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DEHYDRATE_FLAGS
    property completion_status : Win32cr::Foundation::NTSTATUS
    property file_identity : Void*
    property file_identity_length : UInt32
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_ACK_DEHYDRATE_FLAGS, @completion_status : Win32cr::Foundation::NTSTATUS, @file_identity : Void*, @file_identity_length : UInt32)
    end
      end


      # Nested Type RetrieveData_e__Struct_
      @[Extern]
      struct RetrieveData_e__Struct_
    property flags : Win32cr::Storage::CloudFilters::CF_OPERATION_RETRIEVE_DATA_FLAGS
    property buffer : Void*
    property offset : Win32cr::Foundation::LARGE_INTEGER
    property length : Win32cr::Foundation::LARGE_INTEGER
    property returned_length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@flags : Win32cr::Storage::CloudFilters::CF_OPERATION_RETRIEVE_DATA_FLAGS, @buffer : Void*, @offset : Win32cr::Foundation::LARGE_INTEGER, @length : Win32cr::Foundation::LARGE_INTEGER, @returned_length : Win32cr::Foundation::LARGE_INTEGER)
    end
      end

    def initialize(@transfer_data : TransferData_e__Struct_, @retrieve_data : RetrieveData_e__Struct_, @ack_data : AckData_e__Struct_, @restart_hydration : RestartHydration_e__Struct_, @transfer_placeholders : TransferPlaceholders_e__Struct_, @ack_dehydrate : AckDehydrate_e__Struct_, @ack_rename : AckRename_e__Struct_, @ack_delete : AckDelete_e__Struct_)
    end
    end

    def initialize(@param_size : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CF_FILE_RANGE
    property starting_offset : Win32cr::Foundation::LARGE_INTEGER
    property length : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@starting_offset : Win32cr::Foundation::LARGE_INTEGER, @length : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CF_PLACEHOLDER_BASIC_INFO
    property pin_state : Win32cr::Storage::CloudFilters::CF_PIN_STATE
    property in_sync_state : Win32cr::Storage::CloudFilters::CF_IN_SYNC_STATE
    property file_id : Win32cr::Foundation::LARGE_INTEGER
    property sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER
    property file_identity_length : UInt32
    property file_identity : UInt8*
    def initialize(@pin_state : Win32cr::Storage::CloudFilters::CF_PIN_STATE, @in_sync_state : Win32cr::Storage::CloudFilters::CF_IN_SYNC_STATE, @file_id : Win32cr::Foundation::LARGE_INTEGER, @sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER, @file_identity_length : UInt32, @file_identity : UInt8*)
    end
  end

  @[Extern]
  struct CF_PLACEHOLDER_STANDARD_INFO
    property on_disk_data_size : Win32cr::Foundation::LARGE_INTEGER
    property validated_data_size : Win32cr::Foundation::LARGE_INTEGER
    property modified_data_size : Win32cr::Foundation::LARGE_INTEGER
    property properties_size : Win32cr::Foundation::LARGE_INTEGER
    property pin_state : Win32cr::Storage::CloudFilters::CF_PIN_STATE
    property in_sync_state : Win32cr::Storage::CloudFilters::CF_IN_SYNC_STATE
    property file_id : Win32cr::Foundation::LARGE_INTEGER
    property sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER
    property file_identity_length : UInt32
    property file_identity : UInt8*
    def initialize(@on_disk_data_size : Win32cr::Foundation::LARGE_INTEGER, @validated_data_size : Win32cr::Foundation::LARGE_INTEGER, @modified_data_size : Win32cr::Foundation::LARGE_INTEGER, @properties_size : Win32cr::Foundation::LARGE_INTEGER, @pin_state : Win32cr::Storage::CloudFilters::CF_PIN_STATE, @in_sync_state : Win32cr::Storage::CloudFilters::CF_IN_SYNC_STATE, @file_id : Win32cr::Foundation::LARGE_INTEGER, @sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER, @file_identity_length : UInt32, @file_identity : UInt8*)
    end
  end

  @[Extern]
  struct CF_SYNC_ROOT_BASIC_INFO
    property sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CF_SYNC_ROOT_PROVIDER_INFO
    property provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS
    property provider_name : UInt16[256]
    property provider_version : UInt16[256]
    def initialize(@provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS, @provider_name : UInt16[256], @provider_version : UInt16[256])
    end
  end

  @[Extern]
  struct CF_SYNC_ROOT_STANDARD_INFO
    property sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER
    property hydration_policy : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY
    property population_policy : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY
    property in_sync_policy : Win32cr::Storage::CloudFilters::CF_INSYNC_POLICY
    property hard_link_policy : Win32cr::Storage::CloudFilters::CF_HARDLINK_POLICY
    property provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS
    property provider_name : UInt16[256]
    property provider_version : UInt16[256]
    property sync_root_identity_length : UInt32
    property sync_root_identity : UInt8*
    def initialize(@sync_root_file_id : Win32cr::Foundation::LARGE_INTEGER, @hydration_policy : Win32cr::Storage::CloudFilters::CF_HYDRATION_POLICY, @population_policy : Win32cr::Storage::CloudFilters::CF_POPULATION_POLICY, @in_sync_policy : Win32cr::Storage::CloudFilters::CF_INSYNC_POLICY, @hard_link_policy : Win32cr::Storage::CloudFilters::CF_HARDLINK_POLICY, @provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS, @provider_name : UInt16[256], @provider_version : UInt16[256], @sync_root_identity_length : UInt32, @sync_root_identity : UInt8*)
    end
  end

  @[Link("cldapi")]
  lib C
    fun CfGetPlatformInfo(platform_version : Win32cr::Storage::CloudFilters::CF_PLATFORM_INFO*) : Win32cr::Foundation::HRESULT

    fun CfRegisterSyncRoot(sync_root_path : Win32cr::Foundation::PWSTR, registration : Win32cr::Storage::CloudFilters::CF_SYNC_REGISTRATION*, policies : Win32cr::Storage::CloudFilters::CF_SYNC_POLICIES*, register_flags : Win32cr::Storage::CloudFilters::CF_REGISTER_FLAGS) : Win32cr::Foundation::HRESULT

    fun CfUnregisterSyncRoot(sync_root_path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun CfConnectSyncRoot(sync_root_path : Win32cr::Foundation::PWSTR, callback_table : Win32cr::Storage::CloudFilters::CF_CALLBACK_REGISTRATION*, callback_context : Void*, connect_flags : Win32cr::Storage::CloudFilters::CF_CONNECT_FLAGS, connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY*) : Win32cr::Foundation::HRESULT

    fun CfDisconnectSyncRoot(connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY) : Win32cr::Foundation::HRESULT

    fun CfGetTransferKey(file_handle : Win32cr::Foundation::HANDLE, transfer_key : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun CfReleaseTransferKey(file_handle : Win32cr::Foundation::HANDLE, transfer_key : Win32cr::Foundation::LARGE_INTEGER*) : Void

    fun CfExecute(op_info : Win32cr::Storage::CloudFilters::CF_OPERATION_INFO*, op_params : Win32cr::Storage::CloudFilters::CF_OPERATION_PARAMETERS*) : Win32cr::Foundation::HRESULT

    fun CfUpdateSyncProviderStatus(connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS) : Win32cr::Foundation::HRESULT

    fun CfQuerySyncProviderStatus(connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, provider_status : Win32cr::Storage::CloudFilters::CF_SYNC_PROVIDER_STATUS*) : Win32cr::Foundation::HRESULT

    fun CfReportSyncStatus(sync_root_path : Win32cr::Foundation::PWSTR, sync_status : Win32cr::Storage::CloudFilters::CF_SYNC_STATUS*) : Win32cr::Foundation::HRESULT

    fun CfCreatePlaceholders(base_directory_path : Win32cr::Foundation::PWSTR, placeholder_array : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_CREATE_INFO*, placeholder_count : UInt32, create_flags : Win32cr::Storage::CloudFilters::CF_CREATE_FLAGS, entries_processed : UInt32*) : Win32cr::Foundation::HRESULT

    fun CfOpenFileWithOplock(file_path : Win32cr::Foundation::PWSTR, flags : Win32cr::Storage::CloudFilters::CF_OPEN_FILE_FLAGS, protected_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun CfReferenceProtectedHandle(protected_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOLEAN

    fun CfGetWin32HandleFromProtectedHandle(protected_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE

    fun CfReleaseProtectedHandle(protected_handle : Win32cr::Foundation::HANDLE) : Void

    fun CfCloseHandle(file_handle : Win32cr::Foundation::HANDLE) : Void

    fun CfConvertToPlaceholder(file_handle : Win32cr::Foundation::HANDLE, file_identity : Void*, file_identity_length : UInt32, convert_flags : Win32cr::Storage::CloudFilters::CF_CONVERT_FLAGS, convert_usn : Int64*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfUpdatePlaceholder(file_handle : Win32cr::Foundation::HANDLE, fs_metadata : Win32cr::Storage::CloudFilters::CF_FS_METADATA*, file_identity : Void*, file_identity_length : UInt32, dehydrate_range_array : Win32cr::Storage::CloudFilters::CF_FILE_RANGE*, dehydrate_range_count : UInt32, update_flags : Win32cr::Storage::CloudFilters::CF_UPDATE_FLAGS, update_usn : Int64*, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfRevertPlaceholder(file_handle : Win32cr::Foundation::HANDLE, revert_flags : Win32cr::Storage::CloudFilters::CF_REVERT_FLAGS, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfHydratePlaceholder(file_handle : Win32cr::Foundation::HANDLE, starting_offset : Win32cr::Foundation::LARGE_INTEGER, length : Win32cr::Foundation::LARGE_INTEGER, hydrate_flags : Win32cr::Storage::CloudFilters::CF_HYDRATE_FLAGS, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfDehydratePlaceholder(file_handle : Win32cr::Foundation::HANDLE, starting_offset : Win32cr::Foundation::LARGE_INTEGER, length : Win32cr::Foundation::LARGE_INTEGER, dehydrate_flags : Win32cr::Storage::CloudFilters::CF_DEHYDRATE_FLAGS, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfSetPinState(file_handle : Win32cr::Foundation::HANDLE, pin_state : Win32cr::Storage::CloudFilters::CF_PIN_STATE, pin_flags : Win32cr::Storage::CloudFilters::CF_SET_PIN_FLAGS, overlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun CfSetInSyncState(file_handle : Win32cr::Foundation::HANDLE, in_sync_state : Win32cr::Storage::CloudFilters::CF_IN_SYNC_STATE, in_sync_flags : Win32cr::Storage::CloudFilters::CF_SET_IN_SYNC_FLAGS, in_sync_usn : Int64*) : Win32cr::Foundation::HRESULT

    fun CfSetCorrelationVector(file_handle : Win32cr::Foundation::HANDLE, correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : Win32cr::Foundation::HRESULT

    fun CfGetCorrelationVector(file_handle : Win32cr::Foundation::HANDLE, correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : Win32cr::Foundation::HRESULT

    fun CfGetPlaceholderStateFromAttributeTag(file_attributes : UInt32, reparse_tag : UInt32) : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_STATE

    fun CfGetPlaceholderStateFromFileInfo(info_buffer : Void*, info_class : Win32cr::Storage::FileSystem::FILE_INFO_BY_HANDLE_CLASS) : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_STATE

    fun CfGetPlaceholderStateFromFindData(find_data : Win32cr::Storage::FileSystem::WIN32_FIND_DATAA*) : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_STATE

    fun CfGetPlaceholderInfo(file_handle : Win32cr::Foundation::HANDLE, info_class : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_INFO_CLASS, info_buffer : Void*, info_buffer_length : UInt32, returned_length : UInt32*) : Win32cr::Foundation::HRESULT

    fun CfGetSyncRootInfoByPath(file_path : Win32cr::Foundation::PWSTR, info_class : Win32cr::Storage::CloudFilters::CF_SYNC_ROOT_INFO_CLASS, info_buffer : Void*, info_buffer_length : UInt32, returned_length : UInt32*) : Win32cr::Foundation::HRESULT

    fun CfGetSyncRootInfoByHandle(file_handle : Win32cr::Foundation::HANDLE, info_class : Win32cr::Storage::CloudFilters::CF_SYNC_ROOT_INFO_CLASS, info_buffer : Void*, info_buffer_length : UInt32, returned_length : UInt32*) : Win32cr::Foundation::HRESULT

    fun CfGetPlaceholderRangeInfo(file_handle : Win32cr::Foundation::HANDLE, info_class : Win32cr::Storage::CloudFilters::CF_PLACEHOLDER_RANGE_INFO_CLASS, starting_offset : Win32cr::Foundation::LARGE_INTEGER, length : Win32cr::Foundation::LARGE_INTEGER, info_buffer : Void*, info_buffer_length : UInt32, returned_length : UInt32*) : Win32cr::Foundation::HRESULT

    fun CfReportProviderProgress(connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, transfer_key : Win32cr::Foundation::LARGE_INTEGER, provider_progress_total : Win32cr::Foundation::LARGE_INTEGER, provider_progress_completed : Win32cr::Foundation::LARGE_INTEGER) : Win32cr::Foundation::HRESULT

    fun CfReportProviderProgress2(connection_key : Win32cr::Storage::CloudFilters::CF_CONNECTION_KEY, transfer_key : Win32cr::Foundation::LARGE_INTEGER, request_key : Win32cr::Foundation::LARGE_INTEGER, provider_progress_total : Win32cr::Foundation::LARGE_INTEGER, provider_progress_completed : Win32cr::Foundation::LARGE_INTEGER, target_session_id : UInt32) : Win32cr::Foundation::HRESULT

  end
end