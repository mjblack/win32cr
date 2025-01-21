require "./../foundation.cr"

module Win32cr::System::EventLog
  alias EventLogHandle = LibC::IntPtrT
  alias EventSourceHandle = LibC::IntPtrT
  alias EVT_SUBSCRIBE_CALLBACK = Proc(Win32cr::System::EventLog::EVT_SUBSCRIBE_NOTIFY_ACTION, Void*, LibC::IntPtrT, UInt32)*

  EVT_VARIANT_TYPE_MASK = 127_u32
  EVT_VARIANT_TYPE_ARRAY = 128_u32
  EVT_READ_ACCESS = 1_u32
  EVT_WRITE_ACCESS = 2_u32
  EVT_CLEAR_ACCESS = 4_u32
  EVT_ALL_ACCESS = 7_u32

  enum REPORT_EVENT_TYPE : UInt16
    EVENTLOG_SUCCESS = 0_u16
    EVENTLOG_AUDIT_FAILURE = 16_u16
    EVENTLOG_AUDIT_SUCCESS = 8_u16
    EVENTLOG_ERROR_TYPE = 1_u16
    EVENTLOG_INFORMATION_TYPE = 4_u16
    EVENTLOG_WARNING_TYPE = 2_u16
  end
  enum READ_EVENT_LOG_READ_FLAGS : UInt32
    EVENTLOG_SEEK_READ = 2_u32
    EVENTLOG_SEQUENTIAL_READ = 1_u32
  end
  enum EVT_VARIANT_TYPE
    EvtVarTypeNull = 0_i32
    EvtVarTypeString = 1_i32
    EvtVarTypeAnsiString = 2_i32
    EvtVarTypeSByte = 3_i32
    EvtVarTypeByte = 4_i32
    EvtVarTypeInt16 = 5_i32
    EvtVarTypeUInt16 = 6_i32
    EvtVarTypeInt32 = 7_i32
    EvtVarTypeUInt32 = 8_i32
    EvtVarTypeInt64 = 9_i32
    EvtVarTypeUInt64 = 10_i32
    EvtVarTypeSingle = 11_i32
    EvtVarTypeDouble = 12_i32
    EvtVarTypeBoolean = 13_i32
    EvtVarTypeBinary = 14_i32
    EvtVarTypeGuid = 15_i32
    EvtVarTypeSizeT = 16_i32
    EvtVarTypeFileTime = 17_i32
    EvtVarTypeSysTime = 18_i32
    EvtVarTypeSid = 19_i32
    EvtVarTypeHexInt32 = 20_i32
    EvtVarTypeHexInt64 = 21_i32
    EvtVarTypeEvtHandle = 32_i32
    EvtVarTypeEvtXml = 35_i32
  end
  enum EVT_LOGIN_CLASS
    EvtRpcLogin = 1_i32
  end
  enum EVT_RPC_LOGIN_FLAGS
    EvtRpcLoginAuthDefault = 0_i32
    EvtRpcLoginAuthNegotiate = 1_i32
    EvtRpcLoginAuthKerberos = 2_i32
    EvtRpcLoginAuthNTLM = 3_i32
  end
  enum EVT_QUERY_FLAGS
    EvtQueryChannelPath = 1_i32
    EvtQueryFilePath = 2_i32
    EvtQueryForwardDirection = 256_i32
    EvtQueryReverseDirection = 512_i32
    EvtQueryTolerateQueryErrors = 4096_i32
  end
  enum EVT_SEEK_FLAGS
    EvtSeekRelativeToFirst = 1_i32
    EvtSeekRelativeToLast = 2_i32
    EvtSeekRelativeToCurrent = 3_i32
    EvtSeekRelativeToBookmark = 4_i32
    EvtSeekOriginMask = 7_i32
    EvtSeekStrict = 65536_i32
  end
  enum EVT_SUBSCRIBE_FLAGS
    EvtSubscribeToFutureEvents = 1_i32
    EvtSubscribeStartAtOldestRecord = 2_i32
    EvtSubscribeStartAfterBookmark = 3_i32
    EvtSubscribeOriginMask = 3_i32
    EvtSubscribeTolerateQueryErrors = 4096_i32
    EvtSubscribeStrict = 65536_i32
  end
  enum EVT_SUBSCRIBE_NOTIFY_ACTION
    EvtSubscribeActionError = 0_i32
    EvtSubscribeActionDeliver = 1_i32
  end
  enum EVT_SYSTEM_PROPERTY_ID
    EvtSystemProviderName = 0_i32
    EvtSystemProviderGuid = 1_i32
    EvtSystemEventID = 2_i32
    EvtSystemQualifiers = 3_i32
    EvtSystemLevel = 4_i32
    EvtSystemTask = 5_i32
    EvtSystemOpcode = 6_i32
    EvtSystemKeywords = 7_i32
    EvtSystemTimeCreated = 8_i32
    EvtSystemEventRecordId = 9_i32
    EvtSystemActivityID = 10_i32
    EvtSystemRelatedActivityID = 11_i32
    EvtSystemProcessID = 12_i32
    EvtSystemThreadID = 13_i32
    EvtSystemChannel = 14_i32
    EvtSystemComputer = 15_i32
    EvtSystemUserID = 16_i32
    EvtSystemVersion = 17_i32
    EvtSystemPropertyIdEND = 18_i32
  end
  enum EVT_RENDER_CONTEXT_FLAGS
    EvtRenderContextValues = 0_i32
    EvtRenderContextSystem = 1_i32
    EvtRenderContextUser = 2_i32
  end
  enum EVT_RENDER_FLAGS
    EvtRenderEventValues = 0_i32
    EvtRenderEventXml = 1_i32
    EvtRenderBookmark = 2_i32
  end
  enum EVT_FORMAT_MESSAGE_FLAGS
    EvtFormatMessageEvent = 1_i32
    EvtFormatMessageLevel = 2_i32
    EvtFormatMessageTask = 3_i32
    EvtFormatMessageOpcode = 4_i32
    EvtFormatMessageKeyword = 5_i32
    EvtFormatMessageChannel = 6_i32
    EvtFormatMessageProvider = 7_i32
    EvtFormatMessageId = 8_i32
    EvtFormatMessageXml = 9_i32
  end
  enum EVT_OPEN_LOG_FLAGS
    EvtOpenChannelPath = 1_i32
    EvtOpenFilePath = 2_i32
  end
  enum EVT_LOG_PROPERTY_ID
    EvtLogCreationTime = 0_i32
    EvtLogLastAccessTime = 1_i32
    EvtLogLastWriteTime = 2_i32
    EvtLogFileSize = 3_i32
    EvtLogAttributes = 4_i32
    EvtLogNumberOfLogRecords = 5_i32
    EvtLogOldestRecordNumber = 6_i32
    EvtLogFull = 7_i32
  end
  enum EVT_EXPORTLOG_FLAGS
    EvtExportLogChannelPath = 1_i32
    EvtExportLogFilePath = 2_i32
    EvtExportLogTolerateQueryErrors = 4096_i32
    EvtExportLogOverwrite = 8192_i32
  end
  enum EVT_CHANNEL_CONFIG_PROPERTY_ID
    EvtChannelConfigEnabled = 0_i32
    EvtChannelConfigIsolation = 1_i32
    EvtChannelConfigType = 2_i32
    EvtChannelConfigOwningPublisher = 3_i32
    EvtChannelConfigClassicEventlog = 4_i32
    EvtChannelConfigAccess = 5_i32
    EvtChannelLoggingConfigRetention = 6_i32
    EvtChannelLoggingConfigAutoBackup = 7_i32
    EvtChannelLoggingConfigMaxSize = 8_i32
    EvtChannelLoggingConfigLogFilePath = 9_i32
    EvtChannelPublishingConfigLevel = 10_i32
    EvtChannelPublishingConfigKeywords = 11_i32
    EvtChannelPublishingConfigControlGuid = 12_i32
    EvtChannelPublishingConfigBufferSize = 13_i32
    EvtChannelPublishingConfigMinBuffers = 14_i32
    EvtChannelPublishingConfigMaxBuffers = 15_i32
    EvtChannelPublishingConfigLatency = 16_i32
    EvtChannelPublishingConfigClockType = 17_i32
    EvtChannelPublishingConfigSidType = 18_i32
    EvtChannelPublisherList = 19_i32
    EvtChannelPublishingConfigFileMax = 20_i32
    EvtChannelConfigPropertyIdEND = 21_i32
  end
  enum EVT_CHANNEL_TYPE
    EvtChannelTypeAdmin = 0_i32
    EvtChannelTypeOperational = 1_i32
    EvtChannelTypeAnalytic = 2_i32
    EvtChannelTypeDebug = 3_i32
  end
  enum EVT_CHANNEL_ISOLATION_TYPE
    EvtChannelIsolationTypeApplication = 0_i32
    EvtChannelIsolationTypeSystem = 1_i32
    EvtChannelIsolationTypeCustom = 2_i32
  end
  enum EVT_CHANNEL_CLOCK_TYPE
    EvtChannelClockTypeSystemTime = 0_i32
    EvtChannelClockTypeQPC = 1_i32
  end
  enum EVT_CHANNEL_SID_TYPE
    EvtChannelSidTypeNone = 0_i32
    EvtChannelSidTypePublishing = 1_i32
  end
  enum EVT_CHANNEL_REFERENCE_FLAGS
    EvtChannelReferenceImported = 1_i32
  end
  enum EVT_PUBLISHER_METADATA_PROPERTY_ID
    EvtPublisherMetadataPublisherGuid = 0_i32
    EvtPublisherMetadataResourceFilePath = 1_i32
    EvtPublisherMetadataParameterFilePath = 2_i32
    EvtPublisherMetadataMessageFilePath = 3_i32
    EvtPublisherMetadataHelpLink = 4_i32
    EvtPublisherMetadataPublisherMessageID = 5_i32
    EvtPublisherMetadataChannelReferences = 6_i32
    EvtPublisherMetadataChannelReferencePath = 7_i32
    EvtPublisherMetadataChannelReferenceIndex = 8_i32
    EvtPublisherMetadataChannelReferenceID = 9_i32
    EvtPublisherMetadataChannelReferenceFlags = 10_i32
    EvtPublisherMetadataChannelReferenceMessageID = 11_i32
    EvtPublisherMetadataLevels = 12_i32
    EvtPublisherMetadataLevelName = 13_i32
    EvtPublisherMetadataLevelValue = 14_i32
    EvtPublisherMetadataLevelMessageID = 15_i32
    EvtPublisherMetadataTasks = 16_i32
    EvtPublisherMetadataTaskName = 17_i32
    EvtPublisherMetadataTaskEventGuid = 18_i32
    EvtPublisherMetadataTaskValue = 19_i32
    EvtPublisherMetadataTaskMessageID = 20_i32
    EvtPublisherMetadataOpcodes = 21_i32
    EvtPublisherMetadataOpcodeName = 22_i32
    EvtPublisherMetadataOpcodeValue = 23_i32
    EvtPublisherMetadataOpcodeMessageID = 24_i32
    EvtPublisherMetadataKeywords = 25_i32
    EvtPublisherMetadataKeywordName = 26_i32
    EvtPublisherMetadataKeywordValue = 27_i32
    EvtPublisherMetadataKeywordMessageID = 28_i32
    EvtPublisherMetadataPropertyIdEND = 29_i32
  end
  enum EVT_EVENT_METADATA_PROPERTY_ID
    EventMetadataEventID = 0_i32
    EventMetadataEventVersion = 1_i32
    EventMetadataEventChannel = 2_i32
    EventMetadataEventLevel = 3_i32
    EventMetadataEventOpcode = 4_i32
    EventMetadataEventTask = 5_i32
    EventMetadataEventKeyword = 6_i32
    EventMetadataEventMessageID = 7_i32
    EventMetadataEventTemplate = 8_i32
    EvtEventMetadataPropertyIdEND = 9_i32
  end
  enum EVT_QUERY_PROPERTY_ID
    EvtQueryNames = 0_i32
    EvtQueryStatuses = 1_i32
    EvtQueryPropertyIdEND = 2_i32
  end
  enum EVT_EVENT_PROPERTY_ID
    EvtEventQueryIDs = 0_i32
    EvtEventPath = 1_i32
    EvtEventPropertyIdEND = 2_i32
  end

  @[Extern]
  record EVT_VARIANT,
    anonymous : Anonymous_e__Union_,
    count : UInt32,
    type__ : UInt32 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      boolean_val : Win32cr::Foundation::BOOL,
      s_byte_val : Int8,
      int16_val : Int16,
      int32_val : Int32,
      int64_val : Int64,
      byte_val : UInt8,
      u_int16_val : UInt16,
      u_int32_val : UInt32,
      u_int64_val : UInt64,
      single_val : Float32,
      double_val : Float64,
      file_time_val : UInt64,
      sys_time_val : Win32cr::Foundation::SYSTEMTIME*,
      guid_val : LibC::GUID*,
      string_val : Win32cr::Foundation::PWSTR,
      ansi_string_val : Win32cr::Foundation::PSTR,
      binary_val : UInt8*,
      sid_val : Win32cr::Foundation::PSID,
      size_t_val : LibC::UIntPtrT,
      boolean_arr : Win32cr::Foundation::BOOL*,
      s_byte_arr : Int8*,
      int16_arr : Int16*,
      int32_arr : Int32*,
      int64_arr : Int64*,
      byte_arr : UInt8*,
      u_int16_arr : UInt16*,
      u_int32_arr : UInt32*,
      u_int64_arr : UInt64*,
      single_arr : Float32*,
      double_arr : Float64*,
      file_time_arr : Win32cr::Foundation::FILETIME*,
      sys_time_arr : Win32cr::Foundation::SYSTEMTIME*,
      guid_arr : LibC::GUID*,
      string_arr : Win32cr::Foundation::PWSTR*,
      ansi_string_arr : Win32cr::Foundation::PSTR*,
      sid_arr : Win32cr::Foundation::PSID*,
      size_t_arr : LibC::UIntPtrT*,
      evt_handle_val : LibC::IntPtrT,
      xml_val : Win32cr::Foundation::PWSTR,
      xml_val_arr : Win32cr::Foundation::PWSTR*

  end

  @[Extern]
  record EVT_RPC_LOGIN,
    server : Win32cr::Foundation::PWSTR,
    user : Win32cr::Foundation::PWSTR,
    domain : Win32cr::Foundation::PWSTR,
    password : Win32cr::Foundation::PWSTR,
    flags : UInt32

  @[Extern]
  record EVENTLOGRECORD,
    length : UInt32,
    reserved : UInt32,
    record_number : UInt32,
    time_generated : UInt32,
    time_written : UInt32,
    event_id : UInt32,
    event_type : Win32cr::System::EventLog::REPORT_EVENT_TYPE,
    num_strings : UInt16,
    event_category : UInt16,
    reserved_flags : UInt16,
    closing_record_number : UInt32,
    string_offset : UInt32,
    user_sid_length : UInt32,
    user_sid_offset : UInt32,
    data_length : UInt32,
    data_offset : UInt32

  @[Extern]
  record EVENTSFORLOGFILE,
    ulSize : UInt32,
    szLogicalLogFile : UInt16[256],
    ulNumRecords : UInt32,
    pEventLogRecords : Win32cr::System::EventLog::EVENTLOGRECORD*

  @[Extern]
  record EVENTLOG_FULL_INFORMATION,
    dwFull : UInt32

  @[Link("wevtapi")]
  @[Link("advapi32")]
  lib C
    fun EvtOpenSession(login_class : Win32cr::System::EventLog::EVT_LOGIN_CLASS, login : Void*, timeout : UInt32, flags : UInt32) : LibC::IntPtrT

    fun EvtClose(object : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EvtCancel(object : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EvtGetExtendedStatus(buffer_size : UInt32, buffer : UInt16*, buffer_used : UInt32*) : UInt32

    fun EvtQuery(session : LibC::IntPtrT, path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, flags : UInt32) : LibC::IntPtrT

    fun EvtNext(result_set : LibC::IntPtrT, events_size : UInt32, events : LibC::IntPtrT*, timeout : UInt32, flags : UInt32, returned : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtSeek(result_set : LibC::IntPtrT, position : Int64, bookmark : LibC::IntPtrT, timeout : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EvtSubscribe(session : LibC::IntPtrT, signal_event : Win32cr::Foundation::HANDLE, channel_path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, bookmark : LibC::IntPtrT, context : Void*, callback : Win32cr::System::EventLog::EVT_SUBSCRIBE_CALLBACK, flags : UInt32) : LibC::IntPtrT

    fun EvtCreateRenderContext(value_paths_count : UInt32, value_paths : Win32cr::Foundation::PWSTR*, flags : UInt32) : LibC::IntPtrT

    fun EvtRender(context : LibC::IntPtrT, fragment : LibC::IntPtrT, flags : UInt32, buffer_size : UInt32, buffer : Void*, buffer_used : UInt32*, property_count : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtFormatMessage(publisher_metadata : LibC::IntPtrT, event : LibC::IntPtrT, message_id : UInt32, value_count : UInt32, values : Win32cr::System::EventLog::EVT_VARIANT*, flags : UInt32, buffer_size : UInt32, buffer : UInt16*, buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtOpenLog(session : LibC::IntPtrT, path : Win32cr::Foundation::PWSTR, flags : UInt32) : LibC::IntPtrT

    fun EvtGetLogInfo(log : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_LOG_PROPERTY_ID, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventLog::EVT_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtClearLog(session : LibC::IntPtrT, channel_path : Win32cr::Foundation::PWSTR, target_file_path : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EvtExportLog(session : LibC::IntPtrT, path : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, target_file_path : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EvtArchiveExportedLog(session : LibC::IntPtrT, log_file_path : Win32cr::Foundation::PWSTR, locale : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EvtOpenChannelEnum(session : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

    fun EvtNextChannelPath(channel_enum : LibC::IntPtrT, channel_path_buffer_size : UInt32, channel_path_buffer : UInt16*, channel_path_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtOpenChannelConfig(session : LibC::IntPtrT, channel_path : Win32cr::Foundation::PWSTR, flags : UInt32) : LibC::IntPtrT

    fun EvtSaveChannelConfig(channel_config : LibC::IntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EvtSetChannelConfigProperty(channel_config : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_CHANNEL_CONFIG_PROPERTY_ID, flags : UInt32, property_value : Win32cr::System::EventLog::EVT_VARIANT*) : Win32cr::Foundation::BOOL

    fun EvtGetChannelConfigProperty(channel_config : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_CHANNEL_CONFIG_PROPERTY_ID, flags : UInt32, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventLog::EVT_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtOpenPublisherEnum(session : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

    fun EvtNextPublisherId(publisher_enum : LibC::IntPtrT, publisher_id_buffer_size : UInt32, publisher_id_buffer : UInt16*, publisher_id_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtOpenPublisherMetadata(session : LibC::IntPtrT, publisher_id : Win32cr::Foundation::PWSTR, log_file_path : Win32cr::Foundation::PWSTR, locale : UInt32, flags : UInt32) : LibC::IntPtrT

    fun EvtGetPublisherMetadataProperty(publisher_metadata : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_PUBLISHER_METADATA_PROPERTY_ID, flags : UInt32, publisher_metadata_property_buffer_size : UInt32, publisher_metadata_property_buffer : Win32cr::System::EventLog::EVT_VARIANT*, publisher_metadata_property_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtOpenEventMetadataEnum(publisher_metadata : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

    fun EvtNextEventMetadata(event_metadata_enum : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

    fun EvtGetEventMetadataProperty(event_metadata : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_EVENT_METADATA_PROPERTY_ID, flags : UInt32, event_metadata_property_buffer_size : UInt32, event_metadata_property_buffer : Win32cr::System::EventLog::EVT_VARIANT*, event_metadata_property_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtGetObjectArraySize(object_array : LibC::IntPtrT, object_array_size : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtGetObjectArrayProperty(object_array : LibC::IntPtrT, property_id : UInt32, array_index : UInt32, flags : UInt32, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventLog::EVT_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtGetQueryInfo(query_or_subscription : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_QUERY_PROPERTY_ID, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventLog::EVT_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EvtCreateBookmark(bookmark_xml : Win32cr::Foundation::PWSTR) : LibC::IntPtrT

    fun EvtUpdateBookmark(bookmark : LibC::IntPtrT, event : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EvtGetEventInfo(event : LibC::IntPtrT, property_id : Win32cr::System::EventLog::EVT_EVENT_PROPERTY_ID, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventLog::EVT_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun ClearEventLogA(hEventLog : Win32cr::System::EventLog::EventLogHandle, lpBackupFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun ClearEventLogW(hEventLog : Win32cr::System::EventLog::EventLogHandle, lpBackupFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun BackupEventLogA(hEventLog : Win32cr::System::EventLog::EventLogHandle, lpBackupFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun BackupEventLogW(hEventLog : Win32cr::System::EventLog::EventLogHandle, lpBackupFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun CloseEventLog(hEventLog : Win32cr::System::EventLog::EventLogHandle) : Win32cr::Foundation::BOOL

    fun DeregisterEventSource(hEventLog : Win32cr::System::EventLog::EventSourceHandle) : Win32cr::Foundation::BOOL

    fun NotifyChangeEventLog(hEventLog : Win32cr::System::EventLog::EventLogHandle, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun GetNumberOfEventLogRecords(hEventLog : Win32cr::System::EventLog::EventLogHandle, number_of_records : UInt32*) : Win32cr::Foundation::BOOL

    fun GetOldestEventLogRecord(hEventLog : Win32cr::System::EventLog::EventLogHandle, oldest_record : UInt32*) : Win32cr::Foundation::BOOL

    fun OpenEventLogA(lpUNCServerName : Win32cr::Foundation::PSTR, lpSourceName : Win32cr::Foundation::PSTR) : Win32cr::System::EventLog::EventLogHandle

    fun OpenEventLogW(lpUNCServerName : Win32cr::Foundation::PWSTR, lpSourceName : Win32cr::Foundation::PWSTR) : Win32cr::System::EventLog::EventLogHandle

    fun RegisterEventSourceA(lpUNCServerName : Win32cr::Foundation::PSTR, lpSourceName : Win32cr::Foundation::PSTR) : Win32cr::System::EventLog::EventSourceHandle

    fun RegisterEventSourceW(lpUNCServerName : Win32cr::Foundation::PWSTR, lpSourceName : Win32cr::Foundation::PWSTR) : Win32cr::System::EventLog::EventSourceHandle

    fun OpenBackupEventLogA(lpUNCServerName : Win32cr::Foundation::PSTR, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::System::EventLog::EventLogHandle

    fun OpenBackupEventLogW(lpUNCServerName : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::System::EventLog::EventLogHandle

    fun ReadEventLogA(hEventLog : Win32cr::System::EventLog::EventLogHandle, dwReadFlags : Win32cr::System::EventLog::READ_EVENT_LOG_READ_FLAGS, dwRecordOffset : UInt32, lpBuffer : Void*, nNumberOfBytesToRead : UInt32, pnBytesRead : UInt32*, pnMinNumberOfBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun ReadEventLogW(hEventLog : Win32cr::System::EventLog::EventLogHandle, dwReadFlags : Win32cr::System::EventLog::READ_EVENT_LOG_READ_FLAGS, dwRecordOffset : UInt32, lpBuffer : Void*, nNumberOfBytesToRead : UInt32, pnBytesRead : UInt32*, pnMinNumberOfBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun ReportEventA(hEventLog : Win32cr::System::EventLog::EventSourceHandle, wType : Win32cr::System::EventLog::REPORT_EVENT_TYPE, wCategory : UInt16, dwEventID : UInt32, lpUserSid : Win32cr::Foundation::PSID, wNumStrings : UInt16, dwDataSize : UInt32, lpStrings : Win32cr::Foundation::PSTR*, lpRawData : Void*) : Win32cr::Foundation::BOOL

    fun ReportEventW(hEventLog : Win32cr::System::EventLog::EventSourceHandle, wType : Win32cr::System::EventLog::REPORT_EVENT_TYPE, wCategory : UInt16, dwEventID : UInt32, lpUserSid : Win32cr::Foundation::PSID, wNumStrings : UInt16, dwDataSize : UInt32, lpStrings : Win32cr::Foundation::PWSTR*, lpRawData : Void*) : Win32cr::Foundation::BOOL

    fun GetEventLogInformation(hEventLog : Win32cr::System::EventLog::EventLogHandle, dwInfoLevel : UInt32, lpBuffer : Void*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

  end
end