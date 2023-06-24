require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:projectedfslib.dll")]
{% else %}
@[Link("projectedfslib")]
{% end %}
lib LibWin32
  alias PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT = LibC::IntPtrT
  alias PRJ_DIR_ENTRY_BUFFER_HANDLE = LibC::IntPtrT

  alias PRJ_START_DIRECTORY_ENUMERATION_CB = Proc(PRJ_CALLBACK_DATA*, Guid*, HRESULT)
  alias PRJ_GET_DIRECTORY_ENUMERATION_CB = Proc(PRJ_CALLBACK_DATA*, Guid*, LibC::LPWSTR, PRJ_DIR_ENTRY_BUFFER_HANDLE, HRESULT)
  alias PRJ_END_DIRECTORY_ENUMERATION_CB = Proc(PRJ_CALLBACK_DATA*, Guid*, HRESULT)
  alias PRJ_GET_PLACEHOLDER_INFO_CB = Proc(PRJ_CALLBACK_DATA*, HRESULT)
  alias PRJ_GET_FILE_DATA_CB = Proc(PRJ_CALLBACK_DATA*, UInt64, UInt32, HRESULT)
  alias PRJ_QUERY_FILE_NAME_CB = Proc(PRJ_CALLBACK_DATA*, HRESULT)
  alias PRJ_NOTIFICATION_CB = Proc(PRJ_CALLBACK_DATA*, BOOLEAN, PRJ_NOTIFICATION, LibC::LPWSTR, PRJ_NOTIFICATION_PARAMETERS*, HRESULT)
  alias PRJ_CANCEL_COMMAND_CB = Proc(PRJ_CALLBACK_DATA*, Void)


  enum PRJ_NOTIFY_TYPES : UInt32
    PRJ_NOTIFY_NONE = 0
    PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS = 1
    PRJ_NOTIFY_FILE_OPENED = 2
    PRJ_NOTIFY_NEW_FILE_CREATED = 4
    PRJ_NOTIFY_FILE_OVERWRITTEN = 8
    PRJ_NOTIFY_PRE_DELETE = 16
    PRJ_NOTIFY_PRE_RENAME = 32
    PRJ_NOTIFY_PRE_SET_HARDLINK = 64
    PRJ_NOTIFY_FILE_RENAMED = 128
    PRJ_NOTIFY_HARDLINK_CREATED = 256
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED = 2048
    PRJ_NOTIFY_FILE_PRE_CONVERT_TO_FULL = 4096
    PRJ_NOTIFY_USE_EXISTING_MASK = 4294967295
  end

  enum PRJ_NOTIFICATION : Int32
    PRJ_NOTIFICATION_FILE_OPENED = 2
    PRJ_NOTIFICATION_NEW_FILE_CREATED = 4
    PRJ_NOTIFICATION_FILE_OVERWRITTEN = 8
    PRJ_NOTIFICATION_PRE_DELETE = 16
    PRJ_NOTIFICATION_PRE_RENAME = 32
    PRJ_NOTIFICATION_PRE_SET_HARDLINK = 64
    PRJ_NOTIFICATION_FILE_RENAMED = 128
    PRJ_NOTIFICATION_HARDLINK_CREATED = 256
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED = 2048
    PRJ_NOTIFICATION_FILE_PRE_CONVERT_TO_FULL = 4096
  end

  enum PRJ_EXT_INFO_TYPE : Int32
    PRJ_EXT_INFO_TYPE_SYMLINK = 1
  end

  enum PRJ_STARTVIRTUALIZING_FLAGS : UInt32
    PRJ_FLAG_NONE = 0
    PRJ_FLAG_USE_NEGATIVE_PATH_CACHE = 1
  end

  enum PRJ_PLACEHOLDER_ID : Int32
    PRJ_PLACEHOLDER_ID_LENGTH = 128
  end

  enum PRJ_UPDATE_TYPES : UInt32
    PRJ_UPDATE_NONE = 0
    PRJ_UPDATE_ALLOW_DIRTY_METADATA = 1
    PRJ_UPDATE_ALLOW_DIRTY_DATA = 2
    PRJ_UPDATE_ALLOW_TOMBSTONE = 4
    PRJ_UPDATE_RESERVED1 = 8
    PRJ_UPDATE_RESERVED2 = 16
    PRJ_UPDATE_ALLOW_READ_ONLY = 32
    PRJ_UPDATE_MAX_VAL = 64
  end

  enum PRJ_UPDATE_FAILURE_CAUSES : UInt32
    PRJ_UPDATE_FAILURE_CAUSE_NONE = 0
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_METADATA = 1
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_DATA = 2
    PRJ_UPDATE_FAILURE_CAUSE_TOMBSTONE = 4
    PRJ_UPDATE_FAILURE_CAUSE_READ_ONLY = 8
  end

  enum PRJ_FILE_STATE : UInt32
    PRJ_FILE_STATE_PLACEHOLDER = 1
    PRJ_FILE_STATE_HYDRATED_PLACEHOLDER = 2
    PRJ_FILE_STATE_DIRTY_PLACEHOLDER = 4
    PRJ_FILE_STATE_FULL = 8
    PRJ_FILE_STATE_TOMBSTONE = 16
  end

  enum PRJ_CALLBACK_DATA_FLAGS : Int32
    PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN = 1
    PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY = 2
  end

  enum PRJ_COMPLETE_COMMAND_TYPE : Int32
    PRJ_COMPLETE_COMMAND_TYPE_NOTIFICATION = 1
    PRJ_COMPLETE_COMMAND_TYPE_ENUMERATION = 2
  end

  union PRJ_EXTENDED_INFO_Anonymous_e__Union
    symlink : PRJ_EXTENDED_INFO_Anonymous_e__Union_Symlink_e__Struct
  end
  union PRJ_NOTIFICATION_PARAMETERS
    post_create : PRJ_NOTIFICATION_PARAMETERS_PostCreate_e__Struct
    file_renamed : PRJ_NOTIFICATION_PARAMETERS_FileRenamed_e__Struct
    file_deleted_on_handle_close : PRJ_NOTIFICATION_PARAMETERS_FileDeletedOnHandleClose_e__Struct
  end
  union PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union
    notification : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union_Notification_e__Struct
    enumeration : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union_Enumeration_e__Struct
  end

  struct PRJ_EXTENDED_INFO
    info_type : PRJ_EXT_INFO_TYPE
    next_info_offset : UInt32
    anonymous : PRJ_EXTENDED_INFO_Anonymous_e__Union
  end
  struct PRJ_EXTENDED_INFO_Anonymous_e__Union_Symlink_e__Struct
    target_name : LibC::LPWSTR
  end
  struct PRJ_NOTIFICATION_MAPPING
    notification_bit_mask : PRJ_NOTIFY_TYPES
    notification_root : LibC::LPWSTR
  end
  struct PRJ_STARTVIRTUALIZING_OPTIONS
    flags : PRJ_STARTVIRTUALIZING_FLAGS
    pool_thread_count : UInt32
    concurrent_thread_count : UInt32
    notification_mappings : PRJ_NOTIFICATION_MAPPING*
    notification_mappings_count : UInt32
  end
  struct PRJ_VIRTUALIZATION_INSTANCE_INFO
    instance_id : Guid
    write_alignment : UInt32
  end
  struct PRJ_PLACEHOLDER_VERSION_INFO
    provider_id : UInt8[128]*
    content_id : UInt8[128]*
  end
  struct PRJ_FILE_BASIC_INFO
    is_directory : BOOLEAN
    file_size : Int64
    creation_time : LARGE_INTEGER
    last_access_time : LARGE_INTEGER
    last_write_time : LARGE_INTEGER
    change_time : LARGE_INTEGER
    file_attributes : UInt32
  end
  struct PRJ_PLACEHOLDER_INFO
    file_basic_info : PRJ_FILE_BASIC_INFO
    ea_information : PRJ_PLACEHOLDER_INFO_EaInformation_e__Struct
    security_information : PRJ_PLACEHOLDER_INFO_SecurityInformation_e__Struct
    streams_information : PRJ_PLACEHOLDER_INFO_StreamsInformation_e__Struct
    version_info : PRJ_PLACEHOLDER_VERSION_INFO
    variable_data : UInt8[0]*
  end
  struct PRJ_PLACEHOLDER_INFO_StreamsInformation_e__Struct
    streams_info_buffer_size : UInt32
    offset_to_first_stream_info : UInt32
  end
  struct PRJ_PLACEHOLDER_INFO_EaInformation_e__Struct
    ea_buffer_size : UInt32
    offset_to_first_ea : UInt32
  end
  struct PRJ_PLACEHOLDER_INFO_SecurityInformation_e__Struct
    security_buffer_size : UInt32
    offset_to_security_descriptor : UInt32
  end
  struct PRJ_CALLBACK_DATA
    size : UInt32
    flags : PRJ_CALLBACK_DATA_FLAGS
    namespace_virtualization_context : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT
    command_id : Int32
    file_id : Guid
    data_stream_id : Guid
    file_path_name : LibC::LPWSTR
    version_info : PRJ_PLACEHOLDER_VERSION_INFO*
    triggering_process_id : UInt32
    triggering_process_image_file_name : LibC::LPWSTR
    instance_context : Void*
  end
  struct PRJ_NOTIFICATION_PARAMETERS_FileRenamed_e__Struct
    notification_mask : PRJ_NOTIFY_TYPES
  end
  struct PRJ_NOTIFICATION_PARAMETERS_FileDeletedOnHandleClose_e__Struct
    is_file_modified : BOOLEAN
  end
  struct PRJ_NOTIFICATION_PARAMETERS_PostCreate_e__Struct
    notification_mask : PRJ_NOTIFY_TYPES
  end
  struct PRJ_CALLBACKS
    start_directory_enumeration_callback : PRJ_START_DIRECTORY_ENUMERATION_CB
    end_directory_enumeration_callback : PRJ_END_DIRECTORY_ENUMERATION_CB
    get_directory_enumeration_callback : PRJ_GET_DIRECTORY_ENUMERATION_CB
    get_placeholder_info_callback : PRJ_GET_PLACEHOLDER_INFO_CB
    get_file_data_callback : PRJ_GET_FILE_DATA_CB
    query_file_name_callback : PRJ_QUERY_FILE_NAME_CB
    notification_callback : PRJ_NOTIFICATION_CB
    cancel_command_callback : PRJ_CANCEL_COMMAND_CB
  end
  struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS
    command_type : PRJ_COMPLETE_COMMAND_TYPE
    anonymous : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union
  end
  struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union_Enumeration_e__Struct
    dir_entry_buffer_handle : PRJ_DIR_ENTRY_BUFFER_HANDLE
  end
  struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS_Anonymous_e__Union_Notification_e__Struct
    notification_mask : PRJ_NOTIFY_TYPES
  end


  # Params # virtualizationrootpath : LibC::LPWSTR [In],callbacks : PRJ_CALLBACKS* [In],instancecontext : Void* [In],options : PRJ_STARTVIRTUALIZING_OPTIONS* [In],namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT* [In]
  fun PrjStartVirtualizing(virtualizationrootpath : LibC::LPWSTR, callbacks : PRJ_CALLBACKS*, instancecontext : Void*, options : PRJ_STARTVIRTUALIZING_OPTIONS*, namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In]
  fun PrjStopVirtualizing(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT) : Void

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],totalentrynumber : UInt32* [In]
  fun PrjClearNegativePathCache(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, totalentrynumber : UInt32*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],virtualizationinstanceinfo : PRJ_VIRTUALIZATION_INSTANCE_INFO* [In]
  fun PrjGetVirtualizationInstanceInfo(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, virtualizationinstanceinfo : PRJ_VIRTUALIZATION_INSTANCE_INFO*) : HRESULT

  # Params # rootpathname : LibC::LPWSTR [In],targetpathname : LibC::LPWSTR [In],versioninfo : PRJ_PLACEHOLDER_VERSION_INFO* [In],virtualizationinstanceid : Guid* [In]
  fun PrjMarkDirectoryAsPlaceholder(rootpathname : LibC::LPWSTR, targetpathname : LibC::LPWSTR, versioninfo : PRJ_PLACEHOLDER_VERSION_INFO*, virtualizationinstanceid : Guid*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],destinationfilename : LibC::LPWSTR [In],placeholderinfo : PRJ_PLACEHOLDER_INFO* [In],placeholderinfosize : UInt32 [In]
  fun PrjWritePlaceholderInfo(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationfilename : LibC::LPWSTR, placeholderinfo : PRJ_PLACEHOLDER_INFO*, placeholderinfosize : UInt32) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],destinationfilename : LibC::LPWSTR [In],placeholderinfo : PRJ_PLACEHOLDER_INFO* [In],placeholderinfosize : UInt32 [In],extendedinfo : PRJ_EXTENDED_INFO* [In]
  fun PrjWritePlaceholderInfo2(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationfilename : LibC::LPWSTR, placeholderinfo : PRJ_PLACEHOLDER_INFO*, placeholderinfosize : UInt32, extendedinfo : PRJ_EXTENDED_INFO*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],destinationfilename : LibC::LPWSTR [In],placeholderinfo : PRJ_PLACEHOLDER_INFO* [In],placeholderinfosize : UInt32 [In],updateflags : PRJ_UPDATE_TYPES [In],failurereason : PRJ_UPDATE_FAILURE_CAUSES* [In]
  fun PrjUpdateFileIfNeeded(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationfilename : LibC::LPWSTR, placeholderinfo : PRJ_PLACEHOLDER_INFO*, placeholderinfosize : UInt32, updateflags : PRJ_UPDATE_TYPES, failurereason : PRJ_UPDATE_FAILURE_CAUSES*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],destinationfilename : LibC::LPWSTR [In],updateflags : PRJ_UPDATE_TYPES [In],failurereason : PRJ_UPDATE_FAILURE_CAUSES* [In]
  fun PrjDeleteFile(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, destinationfilename : LibC::LPWSTR, updateflags : PRJ_UPDATE_TYPES, failurereason : PRJ_UPDATE_FAILURE_CAUSES*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],datastreamid : Guid* [In],buffer : Void* [In],byteoffset : UInt64 [In],length : UInt32 [In]
  fun PrjWriteFileData(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, datastreamid : Guid*, buffer : Void*, byteoffset : UInt64, length : UInt32) : HRESULT

  # Params # destinationfilename : LibC::LPWSTR [In],filestate : PRJ_FILE_STATE* [In]
  fun PrjGetOnDiskFileState(destinationfilename : LibC::LPWSTR, filestate : PRJ_FILE_STATE*) : HRESULT

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],size : LibC::UINT_PTR [In]
  fun PrjAllocateAlignedBuffer(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, size : LibC::UINT_PTR) : Void*

  # Params # buffer : Void* [In]
  fun PrjFreeAlignedBuffer(buffer : Void*) : Void

  # Params # namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT [In],commandid : Int32 [In],completionresult : HRESULT [In],extendedparameters : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS* [In]
  fun PrjCompleteCommand(namespacevirtualizationcontext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, commandid : Int32, completionresult : HRESULT, extendedparameters : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS*) : HRESULT

  # Params # filename : LibC::LPWSTR [In],filebasicinfo : PRJ_FILE_BASIC_INFO* [In],direntrybufferhandle : PRJ_DIR_ENTRY_BUFFER_HANDLE [In]
  fun PrjFillDirEntryBuffer(filename : LibC::LPWSTR, filebasicinfo : PRJ_FILE_BASIC_INFO*, direntrybufferhandle : PRJ_DIR_ENTRY_BUFFER_HANDLE) : HRESULT

  # Params # direntrybufferhandle : PRJ_DIR_ENTRY_BUFFER_HANDLE [In],filename : LibC::LPWSTR [In],filebasicinfo : PRJ_FILE_BASIC_INFO* [In],extendedinfo : PRJ_EXTENDED_INFO* [In]
  fun PrjFillDirEntryBuffer2(direntrybufferhandle : PRJ_DIR_ENTRY_BUFFER_HANDLE, filename : LibC::LPWSTR, filebasicinfo : PRJ_FILE_BASIC_INFO*, extendedinfo : PRJ_EXTENDED_INFO*) : HRESULT

  # Params # filenametocheck : LibC::LPWSTR [In],pattern : LibC::LPWSTR [In]
  fun PrjFileNameMatch(filenametocheck : LibC::LPWSTR, pattern : LibC::LPWSTR) : BOOLEAN

  # Params # filename1 : LibC::LPWSTR [In],filename2 : LibC::LPWSTR [In]
  fun PrjFileNameCompare(filename1 : LibC::LPWSTR, filename2 : LibC::LPWSTR) : Int32

  # Params # filename : LibC::LPWSTR [In]
  fun PrjDoesNameContainWildCards(filename : LibC::LPWSTR) : BOOLEAN
end
