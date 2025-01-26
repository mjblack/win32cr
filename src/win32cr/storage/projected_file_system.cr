require "./../foundation.cr"

module Win32cr::Storage::ProjectedFileSystem
  alias PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT = LibC::IntPtrT
  alias PRJ_DIR_ENTRY_BUFFER_HANDLE = LibC::IntPtrT
  alias PRJ_START_DIRECTORY_ENUMERATION_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, LibC::GUID*, Win32cr::Foundation::HRESULT)

  alias PRJ_GET_DIRECTORY_ENUMERATION_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Storage::ProjectedFileSystem::PRJ_DIR_ENTRY_BUFFER_HANDLE, Win32cr::Foundation::HRESULT)

  alias PRJ_END_DIRECTORY_ENUMERATION_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, LibC::GUID*, Win32cr::Foundation::HRESULT)

  alias PRJ_GET_PLACEHOLDER_INFO_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, Win32cr::Foundation::HRESULT)

  alias PRJ_GET_FILE_DATA_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, UInt64, UInt32, Win32cr::Foundation::HRESULT)

  alias PRJ_QUERY_FILE_NAME_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, Win32cr::Foundation::HRESULT)

  alias PRJ_NOTIFICATION_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, Win32cr::Foundation::BOOLEAN, Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION, Win32cr::Foundation::PWSTR, Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION_PARAMETERS*, Win32cr::Foundation::HRESULT)

  alias PRJ_CANCEL_COMMAND_CB = Proc(Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA*, Void)


  @[Flags]
  enum PRJ_NOTIFY_TYPES : UInt32
    PRJ_NOTIFY_NONE = 0_u32
    PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS = 1_u32
    PRJ_NOTIFY_FILE_OPENED = 2_u32
    PRJ_NOTIFY_NEW_FILE_CREATED = 4_u32
    PRJ_NOTIFY_FILE_OVERWRITTEN = 8_u32
    PRJ_NOTIFY_PRE_DELETE = 16_u32
    PRJ_NOTIFY_PRE_RENAME = 32_u32
    PRJ_NOTIFY_PRE_SET_HARDLINK = 64_u32
    PRJ_NOTIFY_FILE_RENAMED = 128_u32
    PRJ_NOTIFY_HARDLINK_CREATED = 256_u32
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512_u32
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024_u32
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED = 2048_u32
    PRJ_NOTIFY_FILE_PRE_CONVERT_TO_FULL = 4096_u32
    PRJ_NOTIFY_USE_EXISTING_MASK = 4294967295_u32
  end
  enum PRJ_NOTIFICATION
    PRJ_NOTIFICATION_FILE_OPENED = 2_i32
    PRJ_NOTIFICATION_NEW_FILE_CREATED = 4_i32
    PRJ_NOTIFICATION_FILE_OVERWRITTEN = 8_i32
    PRJ_NOTIFICATION_PRE_DELETE = 16_i32
    PRJ_NOTIFICATION_PRE_RENAME = 32_i32
    PRJ_NOTIFICATION_PRE_SET_HARDLINK = 64_i32
    PRJ_NOTIFICATION_FILE_RENAMED = 128_i32
    PRJ_NOTIFICATION_HARDLINK_CREATED = 256_i32
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512_i32
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024_i32
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED = 2048_i32
    PRJ_NOTIFICATION_FILE_PRE_CONVERT_TO_FULL = 4096_i32
  end
  enum PRJ_EXT_INFO_TYPE
    PRJ_EXT_INFO_TYPE_SYMLINK = 1_i32
  end
  @[Flags]
  enum PRJ_STARTVIRTUALIZING_FLAGS : UInt32
    PRJ_FLAG_NONE = 0_u32
    PRJ_FLAG_USE_NEGATIVE_PATH_CACHE = 1_u32
  end
  enum PRJ_PLACEHOLDER_ID
    PRJ_PLACEHOLDER_ID_LENGTH = 128_i32
  end
  @[Flags]
  enum PRJ_UPDATE_TYPES : UInt32
    PRJ_UPDATE_NONE = 0_u32
    PRJ_UPDATE_ALLOW_DIRTY_METADATA = 1_u32
    PRJ_UPDATE_ALLOW_DIRTY_DATA = 2_u32
    PRJ_UPDATE_ALLOW_TOMBSTONE = 4_u32
    PRJ_UPDATE_RESERVED1 = 8_u32
    PRJ_UPDATE_RESERVED2 = 16_u32
    PRJ_UPDATE_ALLOW_READ_ONLY = 32_u32
    PRJ_UPDATE_MAX_VAL = 64_u32
  end
  @[Flags]
  enum PRJ_UPDATE_FAILURE_CAUSES : UInt32
    PRJ_UPDATE_FAILURE_CAUSE_NONE = 0_u32
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_METADATA = 1_u32
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_DATA = 2_u32
    PRJ_UPDATE_FAILURE_CAUSE_TOMBSTONE = 4_u32
    PRJ_UPDATE_FAILURE_CAUSE_READ_ONLY = 8_u32
  end
  @[Flags]
  enum PRJ_FILE_STATE : UInt32
    PRJ_FILE_STATE_PLACEHOLDER = 1_u32
    PRJ_FILE_STATE_HYDRATED_PLACEHOLDER = 2_u32
    PRJ_FILE_STATE_DIRTY_PLACEHOLDER = 4_u32
    PRJ_FILE_STATE_FULL = 8_u32
    PRJ_FILE_STATE_TOMBSTONE = 16_u32
  end
  enum PRJ_CALLBACK_DATA_FLAGS
    PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN = 1_i32
    PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY = 2_i32
  end
  enum PRJ_COMPLETE_COMMAND_TYPE
    PRJ_COMPLETE_COMMAND_TYPE_NOTIFICATION = 1_i32
    PRJ_COMPLETE_COMMAND_TYPE_ENUMERATION = 2_i32
  end

  @[Extern]
  struct PRJ_EXTENDED_INFO
    property info_type : Win32cr::Storage::ProjectedFileSystem::PRJ_EXT_INFO_TYPE
    property next_info_offset : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property symlink : Symlink_e__Struct_

      # Nested Type Symlink_e__Struct_
      @[Extern]
      struct Symlink_e__Struct_
    property target_name : Win32cr::Foundation::PWSTR
    def initialize(@target_name : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@symlink : Symlink_e__Struct_)
    end
    end

    def initialize(@info_type : Win32cr::Storage::ProjectedFileSystem::PRJ_EXT_INFO_TYPE, @next_info_offset : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PRJ_NOTIFICATION_MAPPING
    property notification_bit_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES
    property notification_root : Win32cr::Foundation::PWSTR
    def initialize(@notification_bit_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES, @notification_root : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PRJ_STARTVIRTUALIZING_OPTIONS
    property flags : Win32cr::Storage::ProjectedFileSystem::PRJ_STARTVIRTUALIZING_FLAGS
    property pool_thread_count : UInt32
    property concurrent_thread_count : UInt32
    property notification_mappings : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION_MAPPING*
    property notification_mappings_count : UInt32
    def initialize(@flags : Win32cr::Storage::ProjectedFileSystem::PRJ_STARTVIRTUALIZING_FLAGS, @pool_thread_count : UInt32, @concurrent_thread_count : UInt32, @notification_mappings : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION_MAPPING*, @notification_mappings_count : UInt32)
    end
  end

  @[Extern]
  struct PRJ_VIRTUALIZATION_INSTANCE_INFO
    property instance_id : LibC::GUID
    property write_alignment : UInt32
    def initialize(@instance_id : LibC::GUID, @write_alignment : UInt32)
    end
  end

  @[Extern]
  struct PRJ_PLACEHOLDER_VERSION_INFO
    property provider_id : UInt8[128]
    property content_id : UInt8[128]
    def initialize(@provider_id : UInt8[128], @content_id : UInt8[128])
    end
  end

  @[Extern]
  struct PRJ_FILE_BASIC_INFO
    property is_directory : Win32cr::Foundation::BOOLEAN
    property file_size : Int64
    property creation_time : Win32cr::Foundation::LARGE_INTEGER
    property last_access_time : Win32cr::Foundation::LARGE_INTEGER
    property last_write_time : Win32cr::Foundation::LARGE_INTEGER
    property change_time : Win32cr::Foundation::LARGE_INTEGER
    property file_attributes : UInt32
    def initialize(@is_directory : Win32cr::Foundation::BOOLEAN, @file_size : Int64, @creation_time : Win32cr::Foundation::LARGE_INTEGER, @last_access_time : Win32cr::Foundation::LARGE_INTEGER, @last_write_time : Win32cr::Foundation::LARGE_INTEGER, @change_time : Win32cr::Foundation::LARGE_INTEGER, @file_attributes : UInt32)
    end
  end

  @[Extern]
  struct PRJ_PLACEHOLDER_INFO
    property file_basic_info : Win32cr::Storage::ProjectedFileSystem::PRJ_FILE_BASIC_INFO
    property ea_information : EaInformation_e__Struct_
    property security_information : SecurityInformation_e__Struct_
    property streams_information : StreamsInformation_e__Struct_
    property version_info : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_VERSION_INFO
    property variable_data : UInt8*

    # Nested Type StreamsInformation_e__Struct_
    @[Extern]
    struct StreamsInformation_e__Struct_
    property streams_info_buffer_size : UInt32
    property offset_to_first_stream_info : UInt32
    def initialize(@streams_info_buffer_size : UInt32, @offset_to_first_stream_info : UInt32)
    end
    end


    # Nested Type EaInformation_e__Struct_
    @[Extern]
    struct EaInformation_e__Struct_
    property ea_buffer_size : UInt32
    property offset_to_first_ea : UInt32
    def initialize(@ea_buffer_size : UInt32, @offset_to_first_ea : UInt32)
    end
    end


    # Nested Type SecurityInformation_e__Struct_
    @[Extern]
    struct SecurityInformation_e__Struct_
    property security_buffer_size : UInt32
    property offset_to_security_descriptor : UInt32
    def initialize(@security_buffer_size : UInt32, @offset_to_security_descriptor : UInt32)
    end
    end

    def initialize(@file_basic_info : Win32cr::Storage::ProjectedFileSystem::PRJ_FILE_BASIC_INFO, @ea_information : EaInformation_e__Struct_, @security_information : SecurityInformation_e__Struct_, @streams_information : StreamsInformation_e__Struct_, @version_info : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_VERSION_INFO, @variable_data : UInt8*)
    end
  end

  @[Extern]
  struct PRJ_CALLBACK_DATA
    property size : UInt32
    property flags : Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA_FLAGS
    property namespace_virtualization_context : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT
    property command_id : Int32
    property file_id : LibC::GUID
    property data_stream_id : LibC::GUID
    property file_path_name : Win32cr::Foundation::PWSTR
    property version_info : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_VERSION_INFO*
    property triggering_process_id : UInt32
    property triggering_process_image_file_name : Win32cr::Foundation::PWSTR
    property instance_context : Void*
    def initialize(@size : UInt32, @flags : Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACK_DATA_FLAGS, @namespace_virtualization_context : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, @command_id : Int32, @file_id : LibC::GUID, @data_stream_id : LibC::GUID, @file_path_name : Win32cr::Foundation::PWSTR, @version_info : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_VERSION_INFO*, @triggering_process_id : UInt32, @triggering_process_image_file_name : Win32cr::Foundation::PWSTR, @instance_context : Void*)
    end
  end

  @[Extern(union: true)]
  struct PRJ_NOTIFICATION_PARAMETERS
    property post_create : PostCreate_e__Struct_
    property file_renamed : FileRenamed_e__Struct_
    property file_deleted_on_handle_close : FileDeletedOnHandleClose_e__Struct_

    # Nested Type FileRenamed_e__Struct_
    @[Extern]
    struct FileRenamed_e__Struct_
    property notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES
    def initialize(@notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES)
    end
    end


    # Nested Type FileDeletedOnHandleClose_e__Struct_
    @[Extern]
    struct FileDeletedOnHandleClose_e__Struct_
    property is_file_modified : Win32cr::Foundation::BOOLEAN
    def initialize(@is_file_modified : Win32cr::Foundation::BOOLEAN)
    end
    end


    # Nested Type PostCreate_e__Struct_
    @[Extern]
    struct PostCreate_e__Struct_
    property notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES
    def initialize(@notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES)
    end
    end

    def initialize(@post_create : PostCreate_e__Struct_, @file_renamed : FileRenamed_e__Struct_, @file_deleted_on_handle_close : FileDeletedOnHandleClose_e__Struct_)
    end
  end

  @[Extern]
  struct PRJ_CALLBACKS
    property start_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_START_DIRECTORY_ENUMERATION_CB
    property end_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_END_DIRECTORY_ENUMERATION_CB
    property get_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_DIRECTORY_ENUMERATION_CB
    property get_placeholder_info_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_PLACEHOLDER_INFO_CB
    property get_file_data_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_FILE_DATA_CB
    property query_file_name_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_QUERY_FILE_NAME_CB
    property notification_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION_CB
    property cancel_command_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_CANCEL_COMMAND_CB
    def initialize(@start_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_START_DIRECTORY_ENUMERATION_CB, @end_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_END_DIRECTORY_ENUMERATION_CB, @get_directory_enumeration_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_DIRECTORY_ENUMERATION_CB, @get_placeholder_info_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_PLACEHOLDER_INFO_CB, @get_file_data_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_GET_FILE_DATA_CB, @query_file_name_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_QUERY_FILE_NAME_CB, @notification_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFICATION_CB, @cancel_command_callback : Win32cr::Storage::ProjectedFileSystem::PRJ_CANCEL_COMMAND_CB)
    end
  end

  @[Extern]
  struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS
    property command_type : Win32cr::Storage::ProjectedFileSystem::PRJ_COMPLETE_COMMAND_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property notification : Notification_e__Struct_
    property enumeration : Enumeration_e__Struct_

      # Nested Type Enumeration_e__Struct_
      @[Extern]
      struct Enumeration_e__Struct_
    property dir_entry_buffer_handle : Win32cr::Storage::ProjectedFileSystem::PRJ_DIR_ENTRY_BUFFER_HANDLE
    def initialize(@dir_entry_buffer_handle : Win32cr::Storage::ProjectedFileSystem::PRJ_DIR_ENTRY_BUFFER_HANDLE)
    end
      end


      # Nested Type Notification_e__Struct_
      @[Extern]
      struct Notification_e__Struct_
    property notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES
    def initialize(@notification_mask : Win32cr::Storage::ProjectedFileSystem::PRJ_NOTIFY_TYPES)
    end
      end

    def initialize(@notification : Notification_e__Struct_, @enumeration : Enumeration_e__Struct_)
    end
    end

    def initialize(@command_type : Win32cr::Storage::ProjectedFileSystem::PRJ_COMPLETE_COMMAND_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Link("projectedfslib")]
  lib C
    fun PrjStartVirtualizing(virtualizationRootPath : Win32cr::Foundation::PWSTR, callbacks : Win32cr::Storage::ProjectedFileSystem::PRJ_CALLBACKS*, instanceContext : Void*, options : Win32cr::Storage::ProjectedFileSystem::PRJ_STARTVIRTUALIZING_OPTIONS*, namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT*) : Win32cr::Foundation::HRESULT

    fun PrjStopVirtualizing(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT) : Void

    fun PrjClearNegativePathCache(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, totalEntryNumber : UInt32*) : Win32cr::Foundation::HRESULT

    fun PrjGetVirtualizationInstanceInfo(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, virtualizationInstanceInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_VIRTUALIZATION_INSTANCE_INFO*) : Win32cr::Foundation::HRESULT

    fun PrjMarkDirectoryAsPlaceholder(rootPathName : Win32cr::Foundation::PWSTR, targetPathName : Win32cr::Foundation::PWSTR, versionInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_VERSION_INFO*, virtualizationInstanceID : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PrjWritePlaceholderInfo(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationFileName : Win32cr::Foundation::PWSTR, placeholderInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_INFO*, placeholderInfoSize : UInt32) : Win32cr::Foundation::HRESULT

    fun PrjWritePlaceholderInfo2(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationFileName : Win32cr::Foundation::PWSTR, placeholderInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_INFO*, placeholderInfoSize : UInt32, extended_info : Win32cr::Storage::ProjectedFileSystem::PRJ_EXTENDED_INFO*) : Win32cr::Foundation::HRESULT

    fun PrjUpdateFileIfNeeded(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationFileName : Win32cr::Foundation::PWSTR, placeholderInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_PLACEHOLDER_INFO*, placeholderInfoSize : UInt32, updateFlags : Win32cr::Storage::ProjectedFileSystem::PRJ_UPDATE_TYPES, failureReason : Win32cr::Storage::ProjectedFileSystem::PRJ_UPDATE_FAILURE_CAUSES*) : Win32cr::Foundation::HRESULT

    fun PrjDeleteFile(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationFileName : Win32cr::Foundation::PWSTR, updateFlags : Win32cr::Storage::ProjectedFileSystem::PRJ_UPDATE_TYPES, failureReason : Win32cr::Storage::ProjectedFileSystem::PRJ_UPDATE_FAILURE_CAUSES*) : Win32cr::Foundation::HRESULT

    fun PrjWriteFileData(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, dataStreamId : LibC::GUID*, buffer : Void*, byteOffset : UInt64, length : UInt32) : Win32cr::Foundation::HRESULT

    fun PrjGetOnDiskFileState(destinationFileName : Win32cr::Foundation::PWSTR, fileState : Win32cr::Storage::ProjectedFileSystem::PRJ_FILE_STATE*) : Win32cr::Foundation::HRESULT

    fun PrjAllocateAlignedBuffer(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, size : LibC::UIntPtrT) : Void*

    fun PrjFreeAlignedBuffer(buffer : Void*) : Void

    fun PrjCompleteCommand(namespaceVirtualizationContext : Win32cr::Storage::ProjectedFileSystem::PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, commandId : Int32, completionResult : Win32cr::Foundation::HRESULT, extendedParameters : Win32cr::Storage::ProjectedFileSystem::PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS*) : Win32cr::Foundation::HRESULT

    fun PrjFillDirEntryBuffer(fileName : Win32cr::Foundation::PWSTR, fileBasicInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_FILE_BASIC_INFO*, dirEntryBufferHandle : Win32cr::Storage::ProjectedFileSystem::PRJ_DIR_ENTRY_BUFFER_HANDLE) : Win32cr::Foundation::HRESULT

    fun PrjFillDirEntryBuffer2(dirEntryBufferHandle : Win32cr::Storage::ProjectedFileSystem::PRJ_DIR_ENTRY_BUFFER_HANDLE, fileName : Win32cr::Foundation::PWSTR, fileBasicInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_FILE_BASIC_INFO*, extendedInfo : Win32cr::Storage::ProjectedFileSystem::PRJ_EXTENDED_INFO*) : Win32cr::Foundation::HRESULT

    fun PrjFileNameMatch(fileNameToCheck : Win32cr::Foundation::PWSTR, pattern : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOLEAN

    fun PrjFileNameCompare(fileName1 : Win32cr::Foundation::PWSTR, fileName2 : Win32cr::Foundation::PWSTR) : Int32

    fun PrjDoesNameContainWildCards(fileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOLEAN

  end
end