require "../storage/filesystem.cr"
require "../foundation.cr"
require "../system/correlationvector.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:cldapi.dll")]
lib LibWin32
  alias CF_CONNECTION_KEY = LibC::IntPtrT

  CF_REQUEST_KEY_DEFAULT = 0_u32
  CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH = 4096_u32
  CF_MAX_PRIORITY_HINT = 15_u32
  CF_MAX_PROVIDER_NAME_LENGTH = 255_u32
  CF_MAX_PROVIDER_VERSION_LENGTH = 255_u32

  alias CF_CALLBACK = Proc(CF_CALLBACK_INFO*, CF_CALLBACK_PARAMETERS*, Void)


  enum CF_PLACEHOLDER_CREATE_FLAGS : UInt32
    CF_PLACEHOLDER_CREATE_FLAG_NONE = 0
    CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 1
    CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC = 2
    CF_PLACEHOLDER_CREATE_FLAG_SUPERSEDE = 4
    CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL = 8
  end

  enum CF_SYNC_PROVIDER_STATUS : UInt32
    CF_PROVIDER_STATUS_DISCONNECTED = 0
    CF_PROVIDER_STATUS_IDLE = 1
    CF_PROVIDER_STATUS_POPULATE_NAMESPACE = 2
    CF_PROVIDER_STATUS_POPULATE_METADATA = 4
    CF_PROVIDER_STATUS_POPULATE_CONTENT = 8
    CF_PROVIDER_STATUS_SYNC_INCREMENTAL = 16
    CF_PROVIDER_STATUS_SYNC_FULL = 32
    CF_PROVIDER_STATUS_CONNECTIVITY_LOST = 64
    CF_PROVIDER_STATUS_CLEAR_FLAGS = 2147483648
    CF_PROVIDER_STATUS_TERMINATED = 3221225473
    CF_PROVIDER_STATUS_ERROR = 3221225474
  end

  enum CF_REGISTER_FLAGS : UInt32
    CF_REGISTER_FLAG_NONE = 0
    CF_REGISTER_FLAG_UPDATE = 1
    CF_REGISTER_FLAG_DISABLE_ON_DEMAND_POPULATION_ON_ROOT = 2
    CF_REGISTER_FLAG_MARK_IN_SYNC_ON_ROOT = 4
  end

  enum CF_HYDRATION_POLICY_PRIMARY : UInt16
    CF_HYDRATION_POLICY_PARTIAL = 0
    CF_HYDRATION_POLICY_PROGRESSIVE = 1
    CF_HYDRATION_POLICY_FULL = 2
    CF_HYDRATION_POLICY_ALWAYS_FULL = 3
  end

  enum CF_HYDRATION_POLICY_MODIFIER : UInt16
    CF_HYDRATION_POLICY_MODIFIER_NONE = 0
    CF_HYDRATION_POLICY_MODIFIER_VALIDATION_REQUIRED = 1
    CF_HYDRATION_POLICY_MODIFIER_STREAMING_ALLOWED = 2
    CF_HYDRATION_POLICY_MODIFIER_AUTO_DEHYDRATION_ALLOWED = 4
    CF_HYDRATION_POLICY_MODIFIER_ALLOW_FULL_RESTART_HYDRATION = 8
  end

  enum CF_POPULATION_POLICY_PRIMARY : UInt16
    CF_POPULATION_POLICY_PARTIAL = 0
    CF_POPULATION_POLICY_FULL = 2
    CF_POPULATION_POLICY_ALWAYS_FULL = 3
  end

  enum CF_POPULATION_POLICY_MODIFIER : UInt16
    CF_POPULATION_POLICY_MODIFIER_NONE = 0
  end

  enum CF_PLACEHOLDER_MANAGEMENT_POLICY : Int32
    CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT = 0
    CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED = 1
    CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED = 2
    CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED = 4
  end

  enum CF_INSYNC_POLICY : UInt32
    CF_INSYNC_POLICY_NONE = 0
    CF_INSYNC_POLICY_TRACK_FILE_CREATION_TIME = 1
    CF_INSYNC_POLICY_TRACK_FILE_READONLY_ATTRIBUTE = 2
    CF_INSYNC_POLICY_TRACK_FILE_HIDDEN_ATTRIBUTE = 4
    CF_INSYNC_POLICY_TRACK_FILE_SYSTEM_ATTRIBUTE = 8
    CF_INSYNC_POLICY_TRACK_DIRECTORY_CREATION_TIME = 16
    CF_INSYNC_POLICY_TRACK_DIRECTORY_READONLY_ATTRIBUTE = 32
    CF_INSYNC_POLICY_TRACK_DIRECTORY_HIDDEN_ATTRIBUTE = 64
    CF_INSYNC_POLICY_TRACK_DIRECTORY_SYSTEM_ATTRIBUTE = 128
    CF_INSYNC_POLICY_TRACK_FILE_LAST_WRITE_TIME = 256
    CF_INSYNC_POLICY_TRACK_DIRECTORY_LAST_WRITE_TIME = 512
    CF_INSYNC_POLICY_TRACK_FILE_ALL = 5592335
    CF_INSYNC_POLICY_TRACK_DIRECTORY_ALL = 11184880
    CF_INSYNC_POLICY_TRACK_ALL = 16777215
    CF_INSYNC_POLICY_PRESERVE_INSYNC_FOR_SYNC_ENGINE = 2147483648
  end

  enum CF_HARDLINK_POLICY : UInt32
    CF_HARDLINK_POLICY_NONE = 0
    CF_HARDLINK_POLICY_ALLOWED = 1
  end

  enum CF_CALLBACK_CANCEL_FLAGS : UInt32
    CF_CALLBACK_CANCEL_FLAG_NONE = 0
    CF_CALLBACK_CANCEL_FLAG_IO_TIMEOUT = 1
    CF_CALLBACK_CANCEL_FLAG_IO_ABORTED = 2
  end

  enum CF_CALLBACK_FETCH_DATA_FLAGS : UInt32
    CF_CALLBACK_FETCH_DATA_FLAG_NONE = 0
    CF_CALLBACK_FETCH_DATA_FLAG_RECOVERY = 1
    CF_CALLBACK_FETCH_DATA_FLAG_EXPLICIT_HYDRATION = 2
  end

  enum CF_CALLBACK_VALIDATE_DATA_FLAGS : UInt32
    CF_CALLBACK_VALIDATE_DATA_FLAG_NONE = 0
    CF_CALLBACK_VALIDATE_DATA_FLAG_EXPLICIT_HYDRATION = 2
  end

  enum CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS : UInt32
    CF_CALLBACK_FETCH_PLACEHOLDERS_FLAG_NONE = 0
  end

  enum CF_CALLBACK_OPEN_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE = 0
    CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN = 1
    CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED = 2
  end

  enum CF_CALLBACK_CLOSE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_CLOSE_COMPLETION_FLAG_NONE = 0
    CF_CALLBACK_CLOSE_COMPLETION_FLAG_DELETED = 1
  end

  enum CF_CALLBACK_DEHYDRATE_FLAGS : UInt32
    CF_CALLBACK_DEHYDRATE_FLAG_NONE = 0
    CF_CALLBACK_DEHYDRATE_FLAG_BACKGROUND = 1
  end

  enum CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_NONE = 0
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_BACKGROUND = 1
    CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_DEHYDRATED = 2
  end

  enum CF_CALLBACK_DELETE_FLAGS : UInt32
    CF_CALLBACK_DELETE_FLAG_NONE = 0
    CF_CALLBACK_DELETE_FLAG_IS_DIRECTORY = 1
    CF_CALLBACK_DELETE_FLAG_IS_UNDELETE = 2
  end

  enum CF_CALLBACK_DELETE_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_DELETE_COMPLETION_FLAG_NONE = 0
  end

  enum CF_CALLBACK_RENAME_FLAGS : UInt32
    CF_CALLBACK_RENAME_FLAG_NONE = 0
    CF_CALLBACK_RENAME_FLAG_IS_DIRECTORY = 1
    CF_CALLBACK_RENAME_FLAG_SOURCE_IN_SCOPE = 2
    CF_CALLBACK_RENAME_FLAG_TARGET_IN_SCOPE = 4
  end

  enum CF_CALLBACK_RENAME_COMPLETION_FLAGS : UInt32
    CF_CALLBACK_RENAME_COMPLETION_FLAG_NONE = 0
  end

  enum CF_CALLBACK_DEHYDRATION_REASON : Int32
    CF_CALLBACK_DEHYDRATION_REASON_NONE = 0
    CF_CALLBACK_DEHYDRATION_REASON_USER_MANUAL = 1
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_LOW_SPACE = 2
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_INACTIVITY = 3
    CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_OS_UPGRADE = 4
  end

  enum CF_CALLBACK_TYPE : Int32
    CF_CALLBACK_TYPE_FETCH_DATA = 0
    CF_CALLBACK_TYPE_VALIDATE_DATA = 1
    CF_CALLBACK_TYPE_CANCEL_FETCH_DATA = 2
    CF_CALLBACK_TYPE_FETCH_PLACEHOLDERS = 3
    CF_CALLBACK_TYPE_CANCEL_FETCH_PLACEHOLDERS = 4
    CF_CALLBACK_TYPE_NOTIFY_FILE_OPEN_COMPLETION = 5
    CF_CALLBACK_TYPE_NOTIFY_FILE_CLOSE_COMPLETION = 6
    CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE = 7
    CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE_COMPLETION = 8
    CF_CALLBACK_TYPE_NOTIFY_DELETE = 9
    CF_CALLBACK_TYPE_NOTIFY_DELETE_COMPLETION = 10
    CF_CALLBACK_TYPE_NOTIFY_RENAME = 11
    CF_CALLBACK_TYPE_NOTIFY_RENAME_COMPLETION = 12
    CF_CALLBACK_TYPE_NONE = -1
  end

  enum CF_CONNECT_FLAGS : UInt32
    CF_CONNECT_FLAG_NONE = 0
    CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO = 2
    CF_CONNECT_FLAG_REQUIRE_FULL_FILE_PATH = 4
    CF_CONNECT_FLAG_BLOCK_SELF_IMPLICIT_HYDRATION = 8
  end

  enum CF_OPERATION_TYPE : Int32
    CF_OPERATION_TYPE_TRANSFER_DATA = 0
    CF_OPERATION_TYPE_RETRIEVE_DATA = 1
    CF_OPERATION_TYPE_ACK_DATA = 2
    CF_OPERATION_TYPE_RESTART_HYDRATION = 3
    CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS = 4
    CF_OPERATION_TYPE_ACK_DEHYDRATE = 5
    CF_OPERATION_TYPE_ACK_DELETE = 6
    CF_OPERATION_TYPE_ACK_RENAME = 7
  end

  enum CF_OPERATION_TRANSFER_DATA_FLAGS : UInt32
    CF_OPERATION_TRANSFER_DATA_FLAG_NONE = 0
  end

  enum CF_OPERATION_RETRIEVE_DATA_FLAGS : UInt32
    CF_OPERATION_RETRIEVE_DATA_FLAG_NONE = 0
  end

  enum CF_OPERATION_ACK_DATA_FLAGS : UInt32
    CF_OPERATION_ACK_DATA_FLAG_NONE = 0
  end

  enum CF_OPERATION_RESTART_HYDRATION_FLAGS : UInt32
    CF_OPERATION_RESTART_HYDRATION_FLAG_NONE = 0
    CF_OPERATION_RESTART_HYDRATION_FLAG_MARK_IN_SYNC = 1
  end

  enum CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS : UInt32
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_NONE = 0
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_STOP_ON_ERROR = 1
    CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION = 2
  end

  enum CF_OPERATION_ACK_DEHYDRATE_FLAGS : UInt32
    CF_OPERATION_ACK_DEHYDRATE_FLAG_NONE = 0
  end

  enum CF_OPERATION_ACK_RENAME_FLAGS : UInt32
    CF_OPERATION_ACK_RENAME_FLAG_NONE = 0
  end

  enum CF_OPERATION_ACK_DELETE_FLAGS : UInt32
    CF_OPERATION_ACK_DELETE_FLAG_NONE = 0
  end

  enum CF_CREATE_FLAGS : UInt32
    CF_CREATE_FLAG_NONE = 0
    CF_CREATE_FLAG_STOP_ON_ERROR = 1
  end

  enum CF_OPEN_FILE_FLAGS : UInt32
    CF_OPEN_FILE_FLAG_NONE = 0
    CF_OPEN_FILE_FLAG_EXCLUSIVE = 1
    CF_OPEN_FILE_FLAG_WRITE_ACCESS = 2
    CF_OPEN_FILE_FLAG_DELETE_ACCESS = 4
    CF_OPEN_FILE_FLAG_FOREGROUND = 8
  end

  enum CF_CONVERT_FLAGS : UInt32
    CF_CONVERT_FLAG_NONE = 0
    CF_CONVERT_FLAG_MARK_IN_SYNC = 1
    CF_CONVERT_FLAG_DEHYDRATE = 2
    CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION = 4
    CF_CONVERT_FLAG_ALWAYS_FULL = 8
    CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE = 16
  end

  enum CF_UPDATE_FLAGS : UInt32
    CF_UPDATE_FLAG_NONE = 0
    CF_UPDATE_FLAG_VERIFY_IN_SYNC = 1
    CF_UPDATE_FLAG_MARK_IN_SYNC = 2
    CF_UPDATE_FLAG_DEHYDRATE = 4
    CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION = 8
    CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 16
    CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY = 32
    CF_UPDATE_FLAG_CLEAR_IN_SYNC = 64
    CF_UPDATE_FLAG_REMOVE_PROPERTY = 128
    CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA = 256
    CF_UPDATE_FLAG_ALWAYS_FULL = 512
    CF_UPDATE_FLAG_ALLOW_PARTIAL = 1024
  end

  enum CF_REVERT_FLAGS : UInt32
    CF_REVERT_FLAG_NONE = 0
  end

  enum CF_HYDRATE_FLAGS : UInt32
    CF_HYDRATE_FLAG_NONE = 0
  end

  enum CF_DEHYDRATE_FLAGS : UInt32
    CF_DEHYDRATE_FLAG_NONE = 0
    CF_DEHYDRATE_FLAG_BACKGROUND = 1
  end

  enum CF_PIN_STATE : Int32
    CF_PIN_STATE_UNSPECIFIED = 0
    CF_PIN_STATE_PINNED = 1
    CF_PIN_STATE_UNPINNED = 2
    CF_PIN_STATE_EXCLUDED = 3
    CF_PIN_STATE_INHERIT = 4
  end

  enum CF_SET_PIN_FLAGS : UInt32
    CF_SET_PIN_FLAG_NONE = 0
    CF_SET_PIN_FLAG_RECURSE = 1
    CF_SET_PIN_FLAG_RECURSE_ONLY = 2
    CF_SET_PIN_FLAG_RECURSE_STOP_ON_ERROR = 4
  end

  enum CF_IN_SYNC_STATE : Int32
    CF_IN_SYNC_STATE_NOT_IN_SYNC = 0
    CF_IN_SYNC_STATE_IN_SYNC = 1
  end

  enum CF_SET_IN_SYNC_FLAGS : UInt32
    CF_SET_IN_SYNC_FLAG_NONE = 0
  end

  enum CF_PLACEHOLDER_STATE : UInt32
    CF_PLACEHOLDER_STATE_NO_STATES = 0
    CF_PLACEHOLDER_STATE_PLACEHOLDER = 1
    CF_PLACEHOLDER_STATE_SYNC_ROOT = 2
    CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT = 4
    CF_PLACEHOLDER_STATE_IN_SYNC = 8
    CF_PLACEHOLDER_STATE_PARTIAL = 16
    CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK = 32
    CF_PLACEHOLDER_STATE_INVALID = 4294967295
  end

  enum CF_PLACEHOLDER_INFO_CLASS : Int32
    CF_PLACEHOLDER_INFO_BASIC = 0
    CF_PLACEHOLDER_INFO_STANDARD = 1
  end

  enum CF_SYNC_ROOT_INFO_CLASS : Int32
    CF_SYNC_ROOT_INFO_BASIC = 0
    CF_SYNC_ROOT_INFO_STANDARD = 1
    CF_SYNC_ROOT_INFO_PROVIDER = 2
  end

  enum CF_PLACEHOLDER_RANGE_INFO_CLASS : Int32
    CF_PLACEHOLDER_RANGE_INFO_ONDISK = 1
    CF_PLACEHOLDER_RANGE_INFO_VALIDATED = 2
    CF_PLACEHOLDER_RANGE_INFO_MODIFIED = 3
  end

  union CF_CALLBACK_PARAMETERS_Anonymous_e__Union
    cancel : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct
    fetch_data : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_FetchData_e__Struct
    validate_data : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_ValidateData_e__Struct
    fetch_placeholders : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_FetchPlaceholders_e__Struct
    open_completion : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_OpenCompletion_e__Struct
    close_completion : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_CloseCompletion_e__Struct
    dehydrate : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Dehydrate_e__Struct
    dehydrate_completion : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_DehydrateCompletion_e__Struct
    delete : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Delete_e__Struct
    delete_completion : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_DeleteCompletion_e__Struct
    rename : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Rename_e__Struct
    rename_completion : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_RenameCompletion_e__Struct
  end
  union CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct_Anonymous_e__Union
    fetch_data : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct_Anonymous_e__Union_FetchData_e__Struct
  end
  union CF_OPERATION_PARAMETERS_Anonymous_e__Union
    transfer_data : CF_OPERATION_PARAMETERS_Anonymous_e__Union_TransferData_e__Struct
    retrieve_data : CF_OPERATION_PARAMETERS_Anonymous_e__Union_RetrieveData_e__Struct
    ack_data : CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckData_e__Struct
    restart_hydration : CF_OPERATION_PARAMETERS_Anonymous_e__Union_RestartHydration_e__Struct
    transfer_placeholders : CF_OPERATION_PARAMETERS_Anonymous_e__Union_TransferPlaceholders_e__Struct
    ack_dehydrate : CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckDehydrate_e__Struct
    ack_rename : CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckRename_e__Struct
    ack_delete : CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckDelete_e__Struct
  end

  struct CF_FS_METADATA
    basic_info : FILE_BASIC_INFO
    file_size : LARGE_INTEGER
  end
  struct CF_PLACEHOLDER_CREATE_INFO
    relative_file_name : LibC::LPWSTR
    fs_metadata : CF_FS_METADATA
    file_identity : Void*
    file_identity_length : UInt32
    flags : CF_PLACEHOLDER_CREATE_FLAGS
    result : HRESULT
    create_usn : Int64
  end
  struct CF_PROCESS_INFO
    struct_size : UInt32
    process_id : UInt32
    image_path : LibC::LPWSTR
    package_name : LibC::LPWSTR
    application_id : LibC::LPWSTR
    command_line : LibC::LPWSTR
    session_id : UInt32
  end
  struct CF_PLATFORM_INFO
    build_number : UInt32
    revision_number : UInt32
    integration_number : UInt32
  end
  struct CF_HYDRATION_POLICY_PRIMARY_USHORT
    us : UInt16
  end
  struct CF_HYDRATION_POLICY_MODIFIER_USHORT
    us : UInt16
  end
  struct CF_HYDRATION_POLICY
    primary : CF_HYDRATION_POLICY_PRIMARY_USHORT
    modifier : CF_HYDRATION_POLICY_MODIFIER_USHORT
  end
  struct CF_POPULATION_POLICY_PRIMARY_USHORT
    us : UInt16
  end
  struct CF_POPULATION_POLICY_MODIFIER_USHORT
    us : UInt16
  end
  struct CF_POPULATION_POLICY
    primary : CF_POPULATION_POLICY_PRIMARY_USHORT
    modifier : CF_POPULATION_POLICY_MODIFIER_USHORT
  end
  struct CF_SYNC_POLICIES
    struct_size : UInt32
    hydration : CF_HYDRATION_POLICY
    population : CF_POPULATION_POLICY
    in_sync : CF_INSYNC_POLICY
    hard_link : CF_HARDLINK_POLICY
    placeholder_management : CF_PLACEHOLDER_MANAGEMENT_POLICY
  end
  struct CF_SYNC_REGISTRATION
    struct_size : UInt32
    provider_name : LibC::LPWSTR
    provider_version : LibC::LPWSTR
    sync_root_identity : Void*
    sync_root_identity_length : UInt32
    file_identity : Void*
    file_identity_length : UInt32
    provider_id : Guid
  end
  struct CF_CALLBACK_INFO
    struct_size : UInt32
    connection_key : CF_CONNECTION_KEY
    callback_context : Void*
    volume_guid_name : LibC::LPWSTR
    volume_dos_name : LibC::LPWSTR
    volume_serial_number : UInt32
    sync_root_file_id : LARGE_INTEGER
    sync_root_identity : Void*
    sync_root_identity_length : UInt32
    file_id : LARGE_INTEGER
    file_size : LARGE_INTEGER
    file_identity : Void*
    file_identity_length : UInt32
    normalized_path : LibC::LPWSTR
    transfer_key : LARGE_INTEGER
    priority_hint : UInt8
    correlation_vector : CORRELATION_VECTOR*
    process_info : CF_PROCESS_INFO*
    request_key : LARGE_INTEGER
  end
  struct CF_CALLBACK_PARAMETERS
    param_size : UInt32
    anonymous : CF_CALLBACK_PARAMETERS_Anonymous_e__Union
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Rename_e__Struct
    flags : CF_CALLBACK_RENAME_FLAGS
    target_path : LibC::LPWSTR
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Delete_e__Struct
    flags : CF_CALLBACK_DELETE_FLAGS
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Dehydrate_e__Struct
    flags : CF_CALLBACK_DEHYDRATE_FLAGS
    reason : CF_CALLBACK_DEHYDRATION_REASON
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_OpenCompletion_e__Struct
    flags : CF_CALLBACK_OPEN_COMPLETION_FLAGS
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_ValidateData_e__Struct
    flags : CF_CALLBACK_VALIDATE_DATA_FLAGS
    required_file_offset : LARGE_INTEGER
    required_length : LARGE_INTEGER
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct
    flags : CF_CALLBACK_CANCEL_FLAGS
    anonymous : CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct_Anonymous_e__Union
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_Cancel_e__Struct_Anonymous_e__Union_FetchData_e__Struct
    file_offset : LARGE_INTEGER
    length : LARGE_INTEGER
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_RenameCompletion_e__Struct
    flags : CF_CALLBACK_RENAME_COMPLETION_FLAGS
    source_path : LibC::LPWSTR
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_DehydrateCompletion_e__Struct
    flags : CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS
    reason : CF_CALLBACK_DEHYDRATION_REASON
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_FetchPlaceholders_e__Struct
    flags : CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS
    pattern : LibC::LPWSTR
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_DeleteCompletion_e__Struct
    flags : CF_CALLBACK_DELETE_COMPLETION_FLAGS
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_FetchData_e__Struct
    flags : CF_CALLBACK_FETCH_DATA_FLAGS
    required_file_offset : LARGE_INTEGER
    required_length : LARGE_INTEGER
    optional_file_offset : LARGE_INTEGER
    optional_length : LARGE_INTEGER
    last_dehydration_time : LARGE_INTEGER
    last_dehydration_reason : CF_CALLBACK_DEHYDRATION_REASON
  end
  struct CF_CALLBACK_PARAMETERS_Anonymous_e__Union_CloseCompletion_e__Struct
    flags : CF_CALLBACK_CLOSE_COMPLETION_FLAGS
  end
  struct CF_CALLBACK_REGISTRATION
    type : CF_CALLBACK_TYPE
    callback : CF_CALLBACK
  end
  struct CF_SYNC_STATUS
    struct_size : UInt32
    code : UInt32
    description_offset : UInt32
    description_length : UInt32
    device_id_offset : UInt32
    device_id_length : UInt32
  end
  struct CF_OPERATION_INFO
    struct_size : UInt32
    type : CF_OPERATION_TYPE
    connection_key : CF_CONNECTION_KEY
    transfer_key : LARGE_INTEGER
    correlation_vector : CORRELATION_VECTOR*
    sync_status : CF_SYNC_STATUS*
    request_key : LARGE_INTEGER
  end
  struct CF_OPERATION_PARAMETERS
    param_size : UInt32
    anonymous : CF_OPERATION_PARAMETERS_Anonymous_e__Union
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckRename_e__Struct
    flags : CF_OPERATION_ACK_RENAME_FLAGS
    completion_status : NTSTATUS
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_TransferPlaceholders_e__Struct
    flags : CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS
    completion_status : NTSTATUS
    placeholder_total_count : LARGE_INTEGER
    placeholder_array : CF_PLACEHOLDER_CREATE_INFO*
    placeholder_count : UInt32
    entries_processed : UInt32
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckData_e__Struct
    flags : CF_OPERATION_ACK_DATA_FLAGS
    completion_status : NTSTATUS
    offset : LARGE_INTEGER
    length : LARGE_INTEGER
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_TransferData_e__Struct
    flags : CF_OPERATION_TRANSFER_DATA_FLAGS
    completion_status : NTSTATUS
    buffer : Void*
    offset : LARGE_INTEGER
    length : LARGE_INTEGER
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckDelete_e__Struct
    flags : CF_OPERATION_ACK_DELETE_FLAGS
    completion_status : NTSTATUS
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_RestartHydration_e__Struct
    flags : CF_OPERATION_RESTART_HYDRATION_FLAGS
    fs_metadata : CF_FS_METADATA*
    file_identity : Void*
    file_identity_length : UInt32
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_AckDehydrate_e__Struct
    flags : CF_OPERATION_ACK_DEHYDRATE_FLAGS
    completion_status : NTSTATUS
    file_identity : Void*
    file_identity_length : UInt32
  end
  struct CF_OPERATION_PARAMETERS_Anonymous_e__Union_RetrieveData_e__Struct
    flags : CF_OPERATION_RETRIEVE_DATA_FLAGS
    buffer : Void*
    offset : LARGE_INTEGER
    length : LARGE_INTEGER
    returned_length : LARGE_INTEGER
  end
  struct CF_FILE_RANGE
    starting_offset : LARGE_INTEGER
    length : LARGE_INTEGER
  end
  struct CF_PLACEHOLDER_BASIC_INFO
    pin_state : CF_PIN_STATE
    in_sync_state : CF_IN_SYNC_STATE
    file_id : LARGE_INTEGER
    sync_root_file_id : LARGE_INTEGER
    file_identity_length : UInt32
    file_identity : UInt8[0]*
  end
  struct CF_PLACEHOLDER_STANDARD_INFO
    on_disk_data_size : LARGE_INTEGER
    validated_data_size : LARGE_INTEGER
    modified_data_size : LARGE_INTEGER
    properties_size : LARGE_INTEGER
    pin_state : CF_PIN_STATE
    in_sync_state : CF_IN_SYNC_STATE
    file_id : LARGE_INTEGER
    sync_root_file_id : LARGE_INTEGER
    file_identity_length : UInt32
    file_identity : UInt8[0]*
  end
  struct CF_SYNC_ROOT_BASIC_INFO
    sync_root_file_id : LARGE_INTEGER
  end
  struct CF_SYNC_ROOT_PROVIDER_INFO
    provider_status : CF_SYNC_PROVIDER_STATUS
    provider_name : Char[256]*
    provider_version : Char[256]*
  end
  struct CF_SYNC_ROOT_STANDARD_INFO
    sync_root_file_id : LARGE_INTEGER
    hydration_policy : CF_HYDRATION_POLICY
    population_policy : CF_POPULATION_POLICY
    in_sync_policy : CF_INSYNC_POLICY
    hard_link_policy : CF_HARDLINK_POLICY
    provider_status : CF_SYNC_PROVIDER_STATUS
    provider_name : Char[256]*
    provider_version : Char[256]*
    sync_root_identity_length : UInt32
    sync_root_identity : UInt8[0]*
  end


  # Params # platformversion : CF_PLATFORM_INFO* [In]
  fun CfGetPlatformInfo(platformversion : CF_PLATFORM_INFO*) : HRESULT

  # Params # syncrootpath : LibC::LPWSTR [In],registration : CF_SYNC_REGISTRATION* [In],policies : CF_SYNC_POLICIES* [In],registerflags : CF_REGISTER_FLAGS [In]
  fun CfRegisterSyncRoot(syncrootpath : LibC::LPWSTR, registration : CF_SYNC_REGISTRATION*, policies : CF_SYNC_POLICIES*, registerflags : CF_REGISTER_FLAGS) : HRESULT

  # Params # syncrootpath : LibC::LPWSTR [In]
  fun CfUnregisterSyncRoot(syncrootpath : LibC::LPWSTR) : HRESULT

  # Params # syncrootpath : LibC::LPWSTR [In],callbacktable : CF_CALLBACK_REGISTRATION* [In],callbackcontext : Void* [In],connectflags : CF_CONNECT_FLAGS [In],connectionkey : CF_CONNECTION_KEY* [In]
  fun CfConnectSyncRoot(syncrootpath : LibC::LPWSTR, callbacktable : CF_CALLBACK_REGISTRATION*, callbackcontext : Void*, connectflags : CF_CONNECT_FLAGS, connectionkey : CF_CONNECTION_KEY*) : HRESULT

  # Params # connectionkey : CF_CONNECTION_KEY [In]
  fun CfDisconnectSyncRoot(connectionkey : CF_CONNECTION_KEY) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],transferkey : LARGE_INTEGER* [In]
  fun CfGetTransferKey(filehandle : LibC::HANDLE, transferkey : LARGE_INTEGER*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],transferkey : LARGE_INTEGER* [In]
  fun CfReleaseTransferKey(filehandle : LibC::HANDLE, transferkey : LARGE_INTEGER*)

  # Params # opinfo : CF_OPERATION_INFO* [In],opparams : CF_OPERATION_PARAMETERS* [In]
  fun CfExecute(opinfo : CF_OPERATION_INFO*, opparams : CF_OPERATION_PARAMETERS*) : HRESULT

  # Params # connectionkey : CF_CONNECTION_KEY [In],providerstatus : CF_SYNC_PROVIDER_STATUS [In]
  fun CfUpdateSyncProviderStatus(connectionkey : CF_CONNECTION_KEY, providerstatus : CF_SYNC_PROVIDER_STATUS) : HRESULT

  # Params # connectionkey : CF_CONNECTION_KEY [In],providerstatus : CF_SYNC_PROVIDER_STATUS* [In]
  fun CfQuerySyncProviderStatus(connectionkey : CF_CONNECTION_KEY, providerstatus : CF_SYNC_PROVIDER_STATUS*) : HRESULT

  # Params # syncrootpath : LibC::LPWSTR [In],syncstatus : CF_SYNC_STATUS* [In]
  fun CfReportSyncStatus(syncrootpath : LibC::LPWSTR, syncstatus : CF_SYNC_STATUS*) : HRESULT

  # Params # basedirectorypath : LibC::LPWSTR [In],placeholderarray : CF_PLACEHOLDER_CREATE_INFO* [In],placeholdercount : UInt32 [In],createflags : CF_CREATE_FLAGS [In],entriesprocessed : UInt32* [In]
  fun CfCreatePlaceholders(basedirectorypath : LibC::LPWSTR, placeholderarray : CF_PLACEHOLDER_CREATE_INFO*, placeholdercount : UInt32, createflags : CF_CREATE_FLAGS, entriesprocessed : UInt32*) : HRESULT

  # Params # filepath : LibC::LPWSTR [In],flags : CF_OPEN_FILE_FLAGS [In],protectedhandle : LibC::HANDLE* [In]
  fun CfOpenFileWithOplock(filepath : LibC::LPWSTR, flags : CF_OPEN_FILE_FLAGS, protectedhandle : LibC::HANDLE*) : HRESULT

  # Params # protectedhandle : LibC::HANDLE [In]
  fun CfReferenceProtectedHandle(protectedhandle : LibC::HANDLE) : BOOLEAN

  # Params # protectedhandle : LibC::HANDLE [In]
  fun CfGetWin32HandleFromProtectedHandle(protectedhandle : LibC::HANDLE) : LibC::HANDLE

  # Params # protectedhandle : LibC::HANDLE [In]
  fun CfReleaseProtectedHandle(protectedhandle : LibC::HANDLE)

  # Params # filehandle : LibC::HANDLE [In]
  fun CfCloseHandle(filehandle : LibC::HANDLE)

  # Params # filehandle : LibC::HANDLE [In],fileidentity : Void* [In],fileidentitylength : UInt32 [In],convertflags : CF_CONVERT_FLAGS [In],convertusn : Int64* [In],overlapped : OVERLAPPED* [In]
  fun CfConvertToPlaceholder(filehandle : LibC::HANDLE, fileidentity : Void*, fileidentitylength : UInt32, convertflags : CF_CONVERT_FLAGS, convertusn : Int64*, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],fsmetadata : CF_FS_METADATA* [In],fileidentity : Void* [In],fileidentitylength : UInt32 [In],dehydraterangearray : CF_FILE_RANGE* [In],dehydraterangecount : UInt32 [In],updateflags : CF_UPDATE_FLAGS [In],updateusn : Int64* [In],overlapped : OVERLAPPED* [In]
  fun CfUpdatePlaceholder(filehandle : LibC::HANDLE, fsmetadata : CF_FS_METADATA*, fileidentity : Void*, fileidentitylength : UInt32, dehydraterangearray : CF_FILE_RANGE*, dehydraterangecount : UInt32, updateflags : CF_UPDATE_FLAGS, updateusn : Int64*, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],revertflags : CF_REVERT_FLAGS [In],overlapped : OVERLAPPED* [In]
  fun CfRevertPlaceholder(filehandle : LibC::HANDLE, revertflags : CF_REVERT_FLAGS, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],startingoffset : LARGE_INTEGER [In],length : LARGE_INTEGER [In],hydrateflags : CF_HYDRATE_FLAGS [In],overlapped : OVERLAPPED* [In]
  fun CfHydratePlaceholder(filehandle : LibC::HANDLE, startingoffset : LARGE_INTEGER, length : LARGE_INTEGER, hydrateflags : CF_HYDRATE_FLAGS, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],startingoffset : LARGE_INTEGER [In],length : LARGE_INTEGER [In],dehydrateflags : CF_DEHYDRATE_FLAGS [In],overlapped : OVERLAPPED* [In]
  fun CfDehydratePlaceholder(filehandle : LibC::HANDLE, startingoffset : LARGE_INTEGER, length : LARGE_INTEGER, dehydrateflags : CF_DEHYDRATE_FLAGS, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],pinstate : CF_PIN_STATE [In],pinflags : CF_SET_PIN_FLAGS [In],overlapped : OVERLAPPED* [In]
  fun CfSetPinState(filehandle : LibC::HANDLE, pinstate : CF_PIN_STATE, pinflags : CF_SET_PIN_FLAGS, overlapped : OVERLAPPED*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],insyncstate : CF_IN_SYNC_STATE [In],insyncflags : CF_SET_IN_SYNC_FLAGS [In],insyncusn : Int64* [In]
  fun CfSetInSyncState(filehandle : LibC::HANDLE, insyncstate : CF_IN_SYNC_STATE, insyncflags : CF_SET_IN_SYNC_FLAGS, insyncusn : Int64*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],correlationvector : CORRELATION_VECTOR* [In]
  fun CfSetCorrelationVector(filehandle : LibC::HANDLE, correlationvector : CORRELATION_VECTOR*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],correlationvector : CORRELATION_VECTOR* [In]
  fun CfGetCorrelationVector(filehandle : LibC::HANDLE, correlationvector : CORRELATION_VECTOR*) : HRESULT

  # Params # fileattributes : UInt32 [In],reparsetag : UInt32 [In]
  fun CfGetPlaceholderStateFromAttributeTag(fileattributes : UInt32, reparsetag : UInt32) : CF_PLACEHOLDER_STATE

  # Params # infobuffer : Void* [In],infoclass : FILE_INFO_BY_HANDLE_CLASS [In]
  fun CfGetPlaceholderStateFromFileInfo(infobuffer : Void*, infoclass : FILE_INFO_BY_HANDLE_CLASS) : CF_PLACEHOLDER_STATE

  # Params # finddata : WIN32_FIND_DATAA* [In]
  fun CfGetPlaceholderStateFromFindData(finddata : WIN32_FIND_DATAA*) : CF_PLACEHOLDER_STATE

  # Params # filehandle : LibC::HANDLE [In],infoclass : CF_PLACEHOLDER_INFO_CLASS [In],infobuffer : Void* [In],infobufferlength : UInt32 [In],returnedlength : UInt32* [In]
  fun CfGetPlaceholderInfo(filehandle : LibC::HANDLE, infoclass : CF_PLACEHOLDER_INFO_CLASS, infobuffer : Void*, infobufferlength : UInt32, returnedlength : UInt32*) : HRESULT

  # Params # filepath : LibC::LPWSTR [In],infoclass : CF_SYNC_ROOT_INFO_CLASS [In],infobuffer : Void* [In],infobufferlength : UInt32 [In],returnedlength : UInt32* [In]
  fun CfGetSyncRootInfoByPath(filepath : LibC::LPWSTR, infoclass : CF_SYNC_ROOT_INFO_CLASS, infobuffer : Void*, infobufferlength : UInt32, returnedlength : UInt32*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],infoclass : CF_SYNC_ROOT_INFO_CLASS [In],infobuffer : Void* [In],infobufferlength : UInt32 [In],returnedlength : UInt32* [In]
  fun CfGetSyncRootInfoByHandle(filehandle : LibC::HANDLE, infoclass : CF_SYNC_ROOT_INFO_CLASS, infobuffer : Void*, infobufferlength : UInt32, returnedlength : UInt32*) : HRESULT

  # Params # filehandle : LibC::HANDLE [In],infoclass : CF_PLACEHOLDER_RANGE_INFO_CLASS [In],startingoffset : LARGE_INTEGER [In],length : LARGE_INTEGER [In],infobuffer : Void* [In],infobufferlength : UInt32 [In],returnedlength : UInt32* [In]
  fun CfGetPlaceholderRangeInfo(filehandle : LibC::HANDLE, infoclass : CF_PLACEHOLDER_RANGE_INFO_CLASS, startingoffset : LARGE_INTEGER, length : LARGE_INTEGER, infobuffer : Void*, infobufferlength : UInt32, returnedlength : UInt32*) : HRESULT

  # Params # connectionkey : CF_CONNECTION_KEY [In],transferkey : LARGE_INTEGER [In],providerprogresstotal : LARGE_INTEGER [In],providerprogresscompleted : LARGE_INTEGER [In]
  fun CfReportProviderProgress(connectionkey : CF_CONNECTION_KEY, transferkey : LARGE_INTEGER, providerprogresstotal : LARGE_INTEGER, providerprogresscompleted : LARGE_INTEGER) : HRESULT

  # Params # connectionkey : CF_CONNECTION_KEY [In],transferkey : LARGE_INTEGER [In],requestkey : LARGE_INTEGER [In],providerprogresstotal : LARGE_INTEGER [In],providerprogresscompleted : LARGE_INTEGER [In],targetsessionid : UInt32 [In]
  fun CfReportProviderProgress2(connectionkey : CF_CONNECTION_KEY, transferkey : LARGE_INTEGER, requestkey : LARGE_INTEGER, providerprogresstotal : LARGE_INTEGER, providerprogresscompleted : LARGE_INTEGER, targetsessionid : UInt32) : HRESULT
end
