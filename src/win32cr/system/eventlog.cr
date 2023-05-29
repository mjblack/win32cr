require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wevtapi.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
lib LibWin32
  alias EventLogHandle = LibC::IntPtrT
  alias EventSourceHandle = LibC::IntPtrT

  EVT_VARIANT_TYPE_MASK = 127_u32
  EVT_VARIANT_TYPE_ARRAY = 128_u32
  EVT_READ_ACCESS = 1_u32
  EVT_WRITE_ACCESS = 2_u32
  EVT_CLEAR_ACCESS = 4_u32
  EVT_ALL_ACCESS = 7_u32

  alias EVT_SUBSCRIBE_CALLBACK = Proc(EVT_SUBSCRIBE_NOTIFY_ACTION, Void*, LibC::IntPtrT, UInt32)


  enum REPORT_EVENT_TYPE : UInt16
    EVENTLOG_SUCCESS = 0
    EVENTLOG_AUDIT_FAILURE = 16
    EVENTLOG_AUDIT_SUCCESS = 8
    EVENTLOG_ERROR_TYPE = 1
    EVENTLOG_INFORMATION_TYPE = 4
    EVENTLOG_WARNING_TYPE = 2
  end

  enum READ_EVENT_LOG_READ_FLAGS : UInt32
    EVENTLOG_SEEK_READ = 2
    EVENTLOG_SEQUENTIAL_READ = 1
  end

  enum EVT_VARIANT_TYPE : Int32
    EvtVarTypeNull = 0
    EvtVarTypeString = 1
    EvtVarTypeAnsiString = 2
    EvtVarTypeSByte = 3
    EvtVarTypeByte = 4
    EvtVarTypeInt16 = 5
    EvtVarTypeUInt16 = 6
    EvtVarTypeInt32 = 7
    EvtVarTypeUInt32 = 8
    EvtVarTypeInt64 = 9
    EvtVarTypeUInt64 = 10
    EvtVarTypeSingle = 11
    EvtVarTypeDouble = 12
    EvtVarTypeBoolean = 13
    EvtVarTypeBinary = 14
    EvtVarTypeGuid = 15
    EvtVarTypeSizeT = 16
    EvtVarTypeFileTime = 17
    EvtVarTypeSysTime = 18
    EvtVarTypeSid = 19
    EvtVarTypeHexInt32 = 20
    EvtVarTypeHexInt64 = 21
    EvtVarTypeEvtHandle = 32
    EvtVarTypeEvtXml = 35
  end

  enum EVT_LOGIN_CLASS : Int32
    EvtRpcLogin = 1
  end

  enum EVT_RPC_LOGIN_FLAGS : Int32
    EvtRpcLoginAuthDefault = 0
    EvtRpcLoginAuthNegotiate = 1
    EvtRpcLoginAuthKerberos = 2
    EvtRpcLoginAuthNTLM = 3
  end

  enum EVT_QUERY_FLAGS : Int32
    EvtQueryChannelPath = 1
    EvtQueryFilePath = 2
    EvtQueryForwardDirection = 256
    EvtQueryReverseDirection = 512
    EvtQueryTolerateQueryErrors = 4096
  end

  enum EVT_SEEK_FLAGS : Int32
    EvtSeekRelativeToFirst = 1
    EvtSeekRelativeToLast = 2
    EvtSeekRelativeToCurrent = 3
    EvtSeekRelativeToBookmark = 4
    EvtSeekOriginMask = 7
    EvtSeekStrict = 65536
  end

  enum EVT_SUBSCRIBE_FLAGS : Int32
    EvtSubscribeToFutureEvents = 1
    EvtSubscribeStartAtOldestRecord = 2
    EvtSubscribeStartAfterBookmark = 3
    EvtSubscribeOriginMask = 3
    EvtSubscribeTolerateQueryErrors = 4096
    EvtSubscribeStrict = 65536
  end

  enum EVT_SUBSCRIBE_NOTIFY_ACTION : Int32
    EvtSubscribeActionError = 0
    EvtSubscribeActionDeliver = 1
  end

  enum EVT_SYSTEM_PROPERTY_ID : Int32
    EvtSystemProviderName = 0
    EvtSystemProviderGuid = 1
    EvtSystemEventID = 2
    EvtSystemQualifiers = 3
    EvtSystemLevel = 4
    EvtSystemTask = 5
    EvtSystemOpcode = 6
    EvtSystemKeywords = 7
    EvtSystemTimeCreated = 8
    EvtSystemEventRecordId = 9
    EvtSystemActivityID = 10
    EvtSystemRelatedActivityID = 11
    EvtSystemProcessID = 12
    EvtSystemThreadID = 13
    EvtSystemChannel = 14
    EvtSystemComputer = 15
    EvtSystemUserID = 16
    EvtSystemVersion = 17
    EvtSystemPropertyIdEND = 18
  end

  enum EVT_RENDER_CONTEXT_FLAGS : Int32
    EvtRenderContextValues = 0
    EvtRenderContextSystem = 1
    EvtRenderContextUser = 2
  end

  enum EVT_RENDER_FLAGS : Int32
    EvtRenderEventValues = 0
    EvtRenderEventXml = 1
    EvtRenderBookmark = 2
  end

  enum EVT_FORMAT_MESSAGE_FLAGS : Int32
    EvtFormatMessageEvent = 1
    EvtFormatMessageLevel = 2
    EvtFormatMessageTask = 3
    EvtFormatMessageOpcode = 4
    EvtFormatMessageKeyword = 5
    EvtFormatMessageChannel = 6
    EvtFormatMessageProvider = 7
    EvtFormatMessageId = 8
    EvtFormatMessageXml = 9
  end

  enum EVT_OPEN_LOG_FLAGS : Int32
    EvtOpenChannelPath = 1
    EvtOpenFilePath = 2
  end

  enum EVT_LOG_PROPERTY_ID : Int32
    EvtLogCreationTime = 0
    EvtLogLastAccessTime = 1
    EvtLogLastWriteTime = 2
    EvtLogFileSize = 3
    EvtLogAttributes = 4
    EvtLogNumberOfLogRecords = 5
    EvtLogOldestRecordNumber = 6
    EvtLogFull = 7
  end

  enum EVT_EXPORTLOG_FLAGS : Int32
    EvtExportLogChannelPath = 1
    EvtExportLogFilePath = 2
    EvtExportLogTolerateQueryErrors = 4096
    EvtExportLogOverwrite = 8192
  end

  enum EVT_CHANNEL_CONFIG_PROPERTY_ID : Int32
    EvtChannelConfigEnabled = 0
    EvtChannelConfigIsolation = 1
    EvtChannelConfigType = 2
    EvtChannelConfigOwningPublisher = 3
    EvtChannelConfigClassicEventlog = 4
    EvtChannelConfigAccess = 5
    EvtChannelLoggingConfigRetention = 6
    EvtChannelLoggingConfigAutoBackup = 7
    EvtChannelLoggingConfigMaxSize = 8
    EvtChannelLoggingConfigLogFilePath = 9
    EvtChannelPublishingConfigLevel = 10
    EvtChannelPublishingConfigKeywords = 11
    EvtChannelPublishingConfigControlGuid = 12
    EvtChannelPublishingConfigBufferSize = 13
    EvtChannelPublishingConfigMinBuffers = 14
    EvtChannelPublishingConfigMaxBuffers = 15
    EvtChannelPublishingConfigLatency = 16
    EvtChannelPublishingConfigClockType = 17
    EvtChannelPublishingConfigSidType = 18
    EvtChannelPublisherList = 19
    EvtChannelPublishingConfigFileMax = 20
    EvtChannelConfigPropertyIdEND = 21
  end

  enum EVT_CHANNEL_TYPE : Int32
    EvtChannelTypeAdmin = 0
    EvtChannelTypeOperational = 1
    EvtChannelTypeAnalytic = 2
    EvtChannelTypeDebug = 3
  end

  enum EVT_CHANNEL_ISOLATION_TYPE : Int32
    EvtChannelIsolationTypeApplication = 0
    EvtChannelIsolationTypeSystem = 1
    EvtChannelIsolationTypeCustom = 2
  end

  enum EVT_CHANNEL_CLOCK_TYPE : Int32
    EvtChannelClockTypeSystemTime = 0
    EvtChannelClockTypeQPC = 1
  end

  enum EVT_CHANNEL_SID_TYPE : Int32
    EvtChannelSidTypeNone = 0
    EvtChannelSidTypePublishing = 1
  end

  enum EVT_CHANNEL_REFERENCE_FLAGS : Int32
    EvtChannelReferenceImported = 1
  end

  enum EVT_PUBLISHER_METADATA_PROPERTY_ID : Int32
    EvtPublisherMetadataPublisherGuid = 0
    EvtPublisherMetadataResourceFilePath = 1
    EvtPublisherMetadataParameterFilePath = 2
    EvtPublisherMetadataMessageFilePath = 3
    EvtPublisherMetadataHelpLink = 4
    EvtPublisherMetadataPublisherMessageID = 5
    EvtPublisherMetadataChannelReferences = 6
    EvtPublisherMetadataChannelReferencePath = 7
    EvtPublisherMetadataChannelReferenceIndex = 8
    EvtPublisherMetadataChannelReferenceID = 9
    EvtPublisherMetadataChannelReferenceFlags = 10
    EvtPublisherMetadataChannelReferenceMessageID = 11
    EvtPublisherMetadataLevels = 12
    EvtPublisherMetadataLevelName = 13
    EvtPublisherMetadataLevelValue = 14
    EvtPublisherMetadataLevelMessageID = 15
    EvtPublisherMetadataTasks = 16
    EvtPublisherMetadataTaskName = 17
    EvtPublisherMetadataTaskEventGuid = 18
    EvtPublisherMetadataTaskValue = 19
    EvtPublisherMetadataTaskMessageID = 20
    EvtPublisherMetadataOpcodes = 21
    EvtPublisherMetadataOpcodeName = 22
    EvtPublisherMetadataOpcodeValue = 23
    EvtPublisherMetadataOpcodeMessageID = 24
    EvtPublisherMetadataKeywords = 25
    EvtPublisherMetadataKeywordName = 26
    EvtPublisherMetadataKeywordValue = 27
    EvtPublisherMetadataKeywordMessageID = 28
    EvtPublisherMetadataPropertyIdEND = 29
  end

  enum EVT_EVENT_METADATA_PROPERTY_ID : Int32
    EventMetadataEventID = 0
    EventMetadataEventVersion = 1
    EventMetadataEventChannel = 2
    EventMetadataEventLevel = 3
    EventMetadataEventOpcode = 4
    EventMetadataEventTask = 5
    EventMetadataEventKeyword = 6
    EventMetadataEventMessageID = 7
    EventMetadataEventTemplate = 8
    EvtEventMetadataPropertyIdEND = 9
  end

  enum EVT_QUERY_PROPERTY_ID : Int32
    EvtQueryNames = 0
    EvtQueryStatuses = 1
    EvtQueryPropertyIdEND = 2
  end

  enum EVT_EVENT_PROPERTY_ID : Int32
    EvtEventQueryIDs = 0
    EvtEventPath = 1
    EvtEventPropertyIdEND = 2
  end

  union EVT_VARIANT_Anonymous_e__Union
    boolean_val : LibC::BOOL
    s_byte_val : Int8
    int16_val : Int16
    int32_val : Int32
    int64_val : Int64
    byte_val : UInt8
    u_int16_val : UInt16
    u_int32_val : UInt32
    u_int64_val : UInt64
    single_val : Float32
    double_val : Float64
    file_time_val : UInt64
    sys_time_val : SYSTEMTIME*
    guid_val : Guid*
    string_val : LibC::LPWSTR
    ansi_string_val : PSTR
    binary_val : UInt8*
    sid_val : PSID
    size_t_val : LibC::UINT_PTR
    boolean_arr : LibC::BOOL*
    s_byte_arr : Int8*
    int16_arr : Int16*
    int32_arr : Int32*
    int64_arr : Int64*
    byte_arr : UInt8*
    u_int16_arr : UInt16*
    u_int32_arr : UInt32*
    u_int64_arr : UInt64*
    single_arr : Float32*
    double_arr : Float64*
    file_time_arr : FILETIME*
    sys_time_arr : SYSTEMTIME*
    guid_arr : Guid*
    string_arr : LibC::LPWSTR*
    ansi_string_arr : PSTR*
    sid_arr : PSID*
    size_t_arr : LibC::UINT_PTR*
    evt_handle_val : LibC::IntPtrT
    xml_val : LibC::LPWSTR
    xml_val_arr : LibC::LPWSTR*
  end

  struct EVT_VARIANT
    anonymous : EVT_VARIANT_Anonymous_e__Union
    count : UInt32
    type : UInt32
  end
  struct EVT_RPC_LOGIN
    server : LibC::LPWSTR
    user : LibC::LPWSTR
    domain : LibC::LPWSTR
    password : LibC::LPWSTR
    flags : UInt32
  end
  struct EVENTLOGRECORD
    length : UInt32
    reserved : UInt32
    record_number : UInt32
    time_generated : UInt32
    time_written : UInt32
    event_id : UInt32
    event_type : REPORT_EVENT_TYPE
    num_strings : UInt16
    event_category : UInt16
    reserved_flags : UInt16
    closing_record_number : UInt32
    string_offset : UInt32
    user_sid_length : UInt32
    user_sid_offset : UInt32
    data_length : UInt32
    data_offset : UInt32
  end
  struct EVENTSFORLOGFILE
    ul_size : UInt32
    sz_logical_log_file : Char[256]*
    ul_num_records : UInt32
    p_event_log_records : EVENTLOGRECORD[0]*
  end
  struct EVENTLOG_FULL_INFORMATION
    dw_full : UInt32
  end


  # Params # loginclass : EVT_LOGIN_CLASS [In],login : Void* [In],timeout : UInt32 [In],flags : UInt32 [In]
  fun EvtOpenSession(loginclass : EVT_LOGIN_CLASS, login : Void*, timeout : UInt32, flags : UInt32) : LibC::IntPtrT

  # Params # object : LibC::IntPtrT [In]
  fun EvtClose(object : LibC::IntPtrT) : LibC::BOOL

  # Params # object : LibC::IntPtrT [In]
  fun EvtCancel(object : LibC::IntPtrT) : LibC::BOOL

  # Params # buffersize : UInt32 [In],buffer : Char* [In],bufferused : UInt32* [In]
  fun EvtGetExtendedStatus(buffersize : UInt32, buffer : Char*, bufferused : UInt32*) : UInt32

  # Params # session : LibC::IntPtrT [In],path : LibC::LPWSTR [In],query : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EvtQuery(session : LibC::IntPtrT, path : LibC::LPWSTR, query : LibC::LPWSTR, flags : UInt32) : LibC::IntPtrT

  # Params # resultset : LibC::IntPtrT [In],eventssize : UInt32 [In],events : LibC::IntPtrT* [In],timeout : UInt32 [In],flags : UInt32 [In],returned : UInt32* [In]
  fun EvtNext(resultset : LibC::IntPtrT, eventssize : UInt32, events : LibC::IntPtrT*, timeout : UInt32, flags : UInt32, returned : UInt32*) : LibC::BOOL

  # Params # resultset : LibC::IntPtrT [In],position : Int64 [In],bookmark : LibC::IntPtrT [In],timeout : UInt32 [In],flags : UInt32 [In]
  fun EvtSeek(resultset : LibC::IntPtrT, position : Int64, bookmark : LibC::IntPtrT, timeout : UInt32, flags : UInt32) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],signalevent : LibC::HANDLE [In],channelpath : LibC::LPWSTR [In],query : LibC::LPWSTR [In],bookmark : LibC::IntPtrT [In],context : Void* [In],callback : EVT_SUBSCRIBE_CALLBACK [In],flags : UInt32 [In]
  fun EvtSubscribe(session : LibC::IntPtrT, signalevent : LibC::HANDLE, channelpath : LibC::LPWSTR, query : LibC::LPWSTR, bookmark : LibC::IntPtrT, context : Void*, callback : EVT_SUBSCRIBE_CALLBACK, flags : UInt32) : LibC::IntPtrT

  # Params # valuepathscount : UInt32 [In],valuepaths : LibC::LPWSTR* [In],flags : UInt32 [In]
  fun EvtCreateRenderContext(valuepathscount : UInt32, valuepaths : LibC::LPWSTR*, flags : UInt32) : LibC::IntPtrT

  # Params # context : LibC::IntPtrT [In],fragment : LibC::IntPtrT [In],flags : UInt32 [In],buffersize : UInt32 [In],buffer : Void* [In],bufferused : UInt32* [In],propertycount : UInt32* [In]
  fun EvtRender(context : LibC::IntPtrT, fragment : LibC::IntPtrT, flags : UInt32, buffersize : UInt32, buffer : Void*, bufferused : UInt32*, propertycount : UInt32*) : LibC::BOOL

  # Params # publishermetadata : LibC::IntPtrT [In],event : LibC::IntPtrT [In],messageid : UInt32 [In],valuecount : UInt32 [In],values : EVT_VARIANT* [In],flags : UInt32 [In],buffersize : UInt32 [In],buffer : Char* [In],bufferused : UInt32* [In]
  fun EvtFormatMessage(publishermetadata : LibC::IntPtrT, event : LibC::IntPtrT, messageid : UInt32, valuecount : UInt32, values : EVT_VARIANT*, flags : UInt32, buffersize : UInt32, buffer : Char*, bufferused : UInt32*) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],path : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EvtOpenLog(session : LibC::IntPtrT, path : LibC::LPWSTR, flags : UInt32) : LibC::IntPtrT

  # Params # log : LibC::IntPtrT [In],propertyid : EVT_LOG_PROPERTY_ID [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EVT_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EvtGetLogInfo(log : LibC::IntPtrT, propertyid : EVT_LOG_PROPERTY_ID, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EVT_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],channelpath : LibC::LPWSTR [In],targetfilepath : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EvtClearLog(session : LibC::IntPtrT, channelpath : LibC::LPWSTR, targetfilepath : LibC::LPWSTR, flags : UInt32) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],path : LibC::LPWSTR [In],query : LibC::LPWSTR [In],targetfilepath : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EvtExportLog(session : LibC::IntPtrT, path : LibC::LPWSTR, query : LibC::LPWSTR, targetfilepath : LibC::LPWSTR, flags : UInt32) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],logfilepath : LibC::LPWSTR [In],locale : UInt32 [In],flags : UInt32 [In]
  fun EvtArchiveExportedLog(session : LibC::IntPtrT, logfilepath : LibC::LPWSTR, locale : UInt32, flags : UInt32) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EvtOpenChannelEnum(session : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

  # Params # channelenum : LibC::IntPtrT [In],channelpathbuffersize : UInt32 [In],channelpathbuffer : Char* [In],channelpathbufferused : UInt32* [In]
  fun EvtNextChannelPath(channelenum : LibC::IntPtrT, channelpathbuffersize : UInt32, channelpathbuffer : Char*, channelpathbufferused : UInt32*) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],channelpath : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EvtOpenChannelConfig(session : LibC::IntPtrT, channelpath : LibC::LPWSTR, flags : UInt32) : LibC::IntPtrT

  # Params # channelconfig : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EvtSaveChannelConfig(channelconfig : LibC::IntPtrT, flags : UInt32) : LibC::BOOL

  # Params # channelconfig : LibC::IntPtrT [In],propertyid : EVT_CHANNEL_CONFIG_PROPERTY_ID [In],flags : UInt32 [In],propertyvalue : EVT_VARIANT* [In]
  fun EvtSetChannelConfigProperty(channelconfig : LibC::IntPtrT, propertyid : EVT_CHANNEL_CONFIG_PROPERTY_ID, flags : UInt32, propertyvalue : EVT_VARIANT*) : LibC::BOOL

  # Params # channelconfig : LibC::IntPtrT [In],propertyid : EVT_CHANNEL_CONFIG_PROPERTY_ID [In],flags : UInt32 [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EVT_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EvtGetChannelConfigProperty(channelconfig : LibC::IntPtrT, propertyid : EVT_CHANNEL_CONFIG_PROPERTY_ID, flags : UInt32, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EVT_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EvtOpenPublisherEnum(session : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

  # Params # publisherenum : LibC::IntPtrT [In],publisheridbuffersize : UInt32 [In],publisheridbuffer : Char* [In],publisheridbufferused : UInt32* [In]
  fun EvtNextPublisherId(publisherenum : LibC::IntPtrT, publisheridbuffersize : UInt32, publisheridbuffer : Char*, publisheridbufferused : UInt32*) : LibC::BOOL

  # Params # session : LibC::IntPtrT [In],publisherid : LibC::LPWSTR [In],logfilepath : LibC::LPWSTR [In],locale : UInt32 [In],flags : UInt32 [In]
  fun EvtOpenPublisherMetadata(session : LibC::IntPtrT, publisherid : LibC::LPWSTR, logfilepath : LibC::LPWSTR, locale : UInt32, flags : UInt32) : LibC::IntPtrT

  # Params # publishermetadata : LibC::IntPtrT [In],propertyid : EVT_PUBLISHER_METADATA_PROPERTY_ID [In],flags : UInt32 [In],publishermetadatapropertybuffersize : UInt32 [In],publishermetadatapropertybuffer : EVT_VARIANT* [In],publishermetadatapropertybufferused : UInt32* [In]
  fun EvtGetPublisherMetadataProperty(publishermetadata : LibC::IntPtrT, propertyid : EVT_PUBLISHER_METADATA_PROPERTY_ID, flags : UInt32, publishermetadatapropertybuffersize : UInt32, publishermetadatapropertybuffer : EVT_VARIANT*, publishermetadatapropertybufferused : UInt32*) : LibC::BOOL

  # Params # publishermetadata : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EvtOpenEventMetadataEnum(publishermetadata : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

  # Params # eventmetadataenum : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EvtNextEventMetadata(eventmetadataenum : LibC::IntPtrT, flags : UInt32) : LibC::IntPtrT

  # Params # eventmetadata : LibC::IntPtrT [In],propertyid : EVT_EVENT_METADATA_PROPERTY_ID [In],flags : UInt32 [In],eventmetadatapropertybuffersize : UInt32 [In],eventmetadatapropertybuffer : EVT_VARIANT* [In],eventmetadatapropertybufferused : UInt32* [In]
  fun EvtGetEventMetadataProperty(eventmetadata : LibC::IntPtrT, propertyid : EVT_EVENT_METADATA_PROPERTY_ID, flags : UInt32, eventmetadatapropertybuffersize : UInt32, eventmetadatapropertybuffer : EVT_VARIANT*, eventmetadatapropertybufferused : UInt32*) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],objectarraysize : UInt32* [In]
  fun EvtGetObjectArraySize(objectarray : LibC::IntPtrT, objectarraysize : UInt32*) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],propertyid : UInt32 [In],arrayindex : UInt32 [In],flags : UInt32 [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EVT_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EvtGetObjectArrayProperty(objectarray : LibC::IntPtrT, propertyid : UInt32, arrayindex : UInt32, flags : UInt32, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EVT_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # queryorsubscription : LibC::IntPtrT [In],propertyid : EVT_QUERY_PROPERTY_ID [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EVT_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EvtGetQueryInfo(queryorsubscription : LibC::IntPtrT, propertyid : EVT_QUERY_PROPERTY_ID, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EVT_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # bookmarkxml : LibC::LPWSTR [In]
  fun EvtCreateBookmark(bookmarkxml : LibC::LPWSTR) : LibC::IntPtrT

  # Params # bookmark : LibC::IntPtrT [In],event : LibC::IntPtrT [In]
  fun EvtUpdateBookmark(bookmark : LibC::IntPtrT, event : LibC::IntPtrT) : LibC::BOOL

  # Params # event : LibC::IntPtrT [In],propertyid : EVT_EVENT_PROPERTY_ID [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EVT_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EvtGetEventInfo(event : LibC::IntPtrT, propertyid : EVT_EVENT_PROPERTY_ID, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EVT_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],lpbackupfilename : PSTR [In]
  fun ClearEventLogA(heventlog : LibC::HANDLE, lpbackupfilename : PSTR) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],lpbackupfilename : LibC::LPWSTR [In]
  fun ClearEventLogW(heventlog : LibC::HANDLE, lpbackupfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],lpbackupfilename : PSTR [In]
  fun BackupEventLogA(heventlog : LibC::HANDLE, lpbackupfilename : PSTR) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],lpbackupfilename : LibC::LPWSTR [In]
  fun BackupEventLogW(heventlog : LibC::HANDLE, lpbackupfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # heventlog : EventLogHandle [In]
  fun CloseEventLog(heventlog : EventLogHandle) : LibC::BOOL

  # Params # heventlog : EventSourceHandle [In]
  fun DeregisterEventSource(heventlog : EventSourceHandle) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],hevent : LibC::HANDLE [In]
  fun NotifyChangeEventLog(heventlog : LibC::HANDLE, hevent : LibC::HANDLE) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],numberofrecords : UInt32* [In]
  fun GetNumberOfEventLogRecords(heventlog : LibC::HANDLE, numberofrecords : UInt32*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],oldestrecord : UInt32* [In]
  fun GetOldestEventLogRecord(heventlog : LibC::HANDLE, oldestrecord : UInt32*) : LibC::BOOL

  # Params # lpuncservername : PSTR [In],lpsourcename : PSTR [In]
  fun OpenEventLogA(lpuncservername : PSTR, lpsourcename : PSTR) : EventLogHandle

  # Params # lpuncservername : LibC::LPWSTR [In],lpsourcename : LibC::LPWSTR [In]
  fun OpenEventLogW(lpuncservername : LibC::LPWSTR, lpsourcename : LibC::LPWSTR) : EventLogHandle

  # Params # lpuncservername : PSTR [In],lpsourcename : PSTR [In]
  fun RegisterEventSourceA(lpuncservername : PSTR, lpsourcename : PSTR) : EventSourceHandle

  # Params # lpuncservername : LibC::LPWSTR [In],lpsourcename : LibC::LPWSTR [In]
  fun RegisterEventSourceW(lpuncservername : LibC::LPWSTR, lpsourcename : LibC::LPWSTR) : EventSourceHandle

  # Params # lpuncservername : PSTR [In],lpfilename : PSTR [In]
  fun OpenBackupEventLogA(lpuncservername : PSTR, lpfilename : PSTR) : EventLogHandle

  # Params # lpuncservername : LibC::LPWSTR [In],lpfilename : LibC::LPWSTR [In]
  fun OpenBackupEventLogW(lpuncservername : LibC::LPWSTR, lpfilename : LibC::LPWSTR) : EventLogHandle

  # Params # heventlog : LibC::HANDLE [In],dwreadflags : READ_EVENT_LOG_READ_FLAGS [In],dwrecordoffset : UInt32 [In],lpbuffer : Void* [In],nnumberofbytestoread : UInt32 [In],pnbytesread : UInt32* [In],pnminnumberofbytesneeded : UInt32* [In]
  fun ReadEventLogA(heventlog : LibC::HANDLE, dwreadflags : READ_EVENT_LOG_READ_FLAGS, dwrecordoffset : UInt32, lpbuffer : Void*, nnumberofbytestoread : UInt32, pnbytesread : UInt32*, pnminnumberofbytesneeded : UInt32*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],dwreadflags : READ_EVENT_LOG_READ_FLAGS [In],dwrecordoffset : UInt32 [In],lpbuffer : Void* [In],nnumberofbytestoread : UInt32 [In],pnbytesread : UInt32* [In],pnminnumberofbytesneeded : UInt32* [In]
  fun ReadEventLogW(heventlog : LibC::HANDLE, dwreadflags : READ_EVENT_LOG_READ_FLAGS, dwrecordoffset : UInt32, lpbuffer : Void*, nnumberofbytestoread : UInt32, pnbytesread : UInt32*, pnminnumberofbytesneeded : UInt32*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],wtype : REPORT_EVENT_TYPE [In],wcategory : UInt16 [In],dweventid : UInt32 [In],lpusersid : PSID [In],wnumstrings : UInt16 [In],dwdatasize : UInt32 [In],lpstrings : PSTR* [In],lprawdata : Void* [In]
  fun ReportEventA(heventlog : LibC::HANDLE, wtype : REPORT_EVENT_TYPE, wcategory : UInt16, dweventid : UInt32, lpusersid : PSID, wnumstrings : UInt16, dwdatasize : UInt32, lpstrings : PSTR*, lprawdata : Void*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],wtype : REPORT_EVENT_TYPE [In],wcategory : UInt16 [In],dweventid : UInt32 [In],lpusersid : PSID [In],wnumstrings : UInt16 [In],dwdatasize : UInt32 [In],lpstrings : LibC::LPWSTR* [In],lprawdata : Void* [In]
  fun ReportEventW(heventlog : LibC::HANDLE, wtype : REPORT_EVENT_TYPE, wcategory : UInt16, dweventid : UInt32, lpusersid : PSID, wnumstrings : UInt16, dwdatasize : UInt32, lpstrings : LibC::LPWSTR*, lprawdata : Void*) : LibC::BOOL

  # Params # heventlog : LibC::HANDLE [In],dwinfolevel : UInt32 [In],lpbuffer : Void* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun GetEventLogInformation(heventlog : LibC::HANDLE, dwinfolevel : UInt32, lpbuffer : Void*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL
end
