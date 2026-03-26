require "./../foundation.cr"
require "./../security.cr"

module Win32cr::Security::DiagnosticDataQuery
  extend self

  enum DdqAccessLevel
    NoData = 0_i32
    CurrentUserData = 1_i32
    AllUserData = 2_i32
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_RECORD
    property rowId : Int64
    property timestamp : UInt64
    property eventKeywords : UInt64
    property fullEventName : Win32cr::Foundation::PWSTR
    property providerGroupGuid : Win32cr::Foundation::PWSTR
    property producerName : Win32cr::Foundation::PWSTR
    property privacyTags : Int32*
    property privacyTagCount : UInt32
    property categoryIds : Int32*
    property categoryIdCount : UInt32
    property isCoreData : Win32cr::Foundation::BOOL
    property extra1 : Win32cr::Foundation::PWSTR
    property extra2 : Win32cr::Foundation::PWSTR
    property extra3 : Win32cr::Foundation::PWSTR
    def initialize(@rowId : Int64, @timestamp : UInt64, @eventKeywords : UInt64, @fullEventName : Win32cr::Foundation::PWSTR, @providerGroupGuid : Win32cr::Foundation::PWSTR, @producerName : Win32cr::Foundation::PWSTR, @privacyTags : Int32*, @privacyTagCount : UInt32, @categoryIds : Int32*, @categoryIdCount : UInt32, @isCoreData : Win32cr::Foundation::BOOL, @extra1 : Win32cr::Foundation::PWSTR, @extra2 : Win32cr::Foundation::PWSTR, @extra3 : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_SEARCH_CRITERIA
    property producerNames : Win32cr::Foundation::PWSTR*
    property producerNameCount : UInt32
    property textToMatch : Win32cr::Foundation::PWSTR
    property categoryIds : Int32*
    property categoryIdCount : UInt32
    property privacyTags : Int32*
    property privacyTagCount : UInt32
    property coreDataOnly : Win32cr::Foundation::BOOL
    def initialize(@producerNames : Win32cr::Foundation::PWSTR*, @producerNameCount : UInt32, @textToMatch : Win32cr::Foundation::PWSTR, @categoryIds : Int32*, @categoryIdCount : UInt32, @privacyTags : Int32*, @privacyTagCount : UInt32, @coreDataOnly : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION
    property privacyTag : Int32
    property name : Win32cr::Foundation::PWSTR
    property description : Win32cr::Foundation::PWSTR
    def initialize(@privacyTag : Int32, @name : Win32cr::Foundation::PWSTR, @description : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION
    property name : Win32cr::Foundation::PWSTR
    def initialize(@name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION
    property id : Int32
    property name : Win32cr::Foundation::PWSTR
    def initialize(@id : Int32, @name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_TAG_STATS
    property privacyTag : Int32
    property eventCount : UInt32
    def initialize(@privacyTag : Int32, @eventCount : UInt32)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_BINARY_STATS
    property moduleName : Win32cr::Foundation::PWSTR
    property friendlyModuleName : Win32cr::Foundation::PWSTR
    property eventCount : UInt32
    property uploadSizeBytes : UInt64
    def initialize(@moduleName : Win32cr::Foundation::PWSTR, @friendlyModuleName : Win32cr::Foundation::PWSTR, @eventCount : UInt32, @uploadSizeBytes : UInt64)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_GENERAL_STATS
    property optInLevel : UInt32
    property transcriptSizeBytes : UInt64
    property oldestEventTimestamp : UInt64
    property totalEventCountLast24Hours : UInt32
    property averageDailyEvents : Float32
    def initialize(@optInLevel : UInt32, @transcriptSizeBytes : UInt64, @oldestEventTimestamp : UInt64, @totalEventCountLast24Hours : UInt32, @averageDailyEvents : Float32)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION
    property hoursOfHistoryToKeep : UInt32
    property maxStoreMegabytes : UInt32
    property requestedMaxStoreMegabytes : UInt32
    def initialize(@hoursOfHistoryToKeep : UInt32, @maxStoreMegabytes : UInt32, @requestedMaxStoreMegabytes : UInt32)
    end
  end

  @[Extern]
  struct DIAGNOSTIC_REPORT_PARAMETER
    property name : UInt16[129]
    property value : UInt16[260]
    def initialize(@name : UInt16[129], @value : UInt16[260])
    end
  end

  @[Extern]
  struct DIAGNOSTIC_REPORT_SIGNATURE
    property eventName : UInt16[65]
    property parameters : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_PARAMETER[10]
    def initialize(@eventName : UInt16[65], @parameters : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_PARAMETER[10])
    end
  end

  @[Extern]
  struct DIAGNOSTIC_REPORT_DATA
    property signature : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_SIGNATURE
    property bucketId : LibC::GUID
    property reportId : LibC::GUID
    property creationTime : Win32cr::Foundation::FILETIME
    property sizeInBytes : UInt64
    property cabId : Win32cr::Foundation::PWSTR
    property reportStatus : UInt32
    property reportIntegratorId : LibC::GUID
    property fileNames : Win32cr::Foundation::PWSTR*
    property fileCount : UInt32
    property friendlyEventName : Win32cr::Foundation::PWSTR
    property applicationName : Win32cr::Foundation::PWSTR
    property applicationPath : Win32cr::Foundation::PWSTR
    property description : Win32cr::Foundation::PWSTR
    property bucketIdString : Win32cr::Foundation::PWSTR
    property legacyBucketId : UInt64
    property reportKey : Win32cr::Foundation::PWSTR
    def initialize(@signature : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_SIGNATURE, @bucketId : LibC::GUID, @reportId : LibC::GUID, @creationTime : Win32cr::Foundation::FILETIME, @sizeInBytes : UInt64, @cabId : Win32cr::Foundation::PWSTR, @reportStatus : UInt32, @reportIntegratorId : LibC::GUID, @fileNames : Win32cr::Foundation::PWSTR*, @fileCount : UInt32, @friendlyEventName : Win32cr::Foundation::PWSTR, @applicationName : Win32cr::Foundation::PWSTR, @applicationPath : Win32cr::Foundation::PWSTR, @description : Win32cr::Foundation::PWSTR, @bucketIdString : Win32cr::Foundation::PWSTR, @legacyBucketId : UInt64, @reportKey : Win32cr::Foundation::PWSTR)
    end
  end

  def ddqCreateSession(accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel, hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqCreateSession(accessLevel, hSession)
    {% end %}
  end

  def ddqCloseSession(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqCloseSession(hSession)
    {% end %}
  end

  def ddqGetSessionAccessLevel(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetSessionAccessLevel(hSession, accessLevel)
    {% end %}
  end

  def ddqGetDiagnosticDataAccessLevelAllowed(accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticDataAccessLevelAllowed(accessLevel)
    {% end %}
  end

  def ddqGetDiagnosticRecordStats(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, searchCriteria : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_SEARCH_CRITERIA*, recordCount : UInt32*, minRowId : Int64*, maxRowId : Int64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordStats(hSession, searchCriteria, recordCount, minRowId, maxRowId)
    {% end %}
  end

  def ddqGetDiagnosticRecordPayload(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, rowId : Int64, payload : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordPayload(hSession, rowId, payload)
    {% end %}
  end

  def ddqGetDiagnosticRecordLocaleTags(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, locale : Win32cr::Foundation::PWSTR, hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordLocaleTags(hSession, locale, hTagDescription)
    {% end %}
  end

  def ddqFreeDiagnosticRecordLocaleTags(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqFreeDiagnosticRecordLocaleTags(hTagDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordLocaleTagAtIndex(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, index : UInt32, tagDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordLocaleTagAtIndex(hTagDescription, index, tagDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordLocaleTagCount(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, tagDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordLocaleTagCount(hTagDescription, tagDescriptionCount)
    {% end %}
  end

  def ddqGetDiagnosticRecordProducers(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordProducers(hSession, hProducerDescription)
    {% end %}
  end

  def ddqFreeDiagnosticRecordProducers(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqFreeDiagnosticRecordProducers(hProducerDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordProducerAtIndex(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, index : UInt32, producerDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordProducerAtIndex(hProducerDescription, index, producerDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordProducerCount(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, producerDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordProducerCount(hProducerDescription, producerDescriptionCount)
    {% end %}
  end

  def ddqGetDiagnosticRecordProducerCategories(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerName : Win32cr::Foundation::PWSTR, hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordProducerCategories(hSession, producerName, hCategoryDescription)
    {% end %}
  end

  def ddqFreeDiagnosticRecordProducerCategories(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqFreeDiagnosticRecordProducerCategories(hCategoryDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordCategoryAtIndex(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, index : UInt32, categoryDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordCategoryAtIndex(hCategoryDescription, index, categoryDescription)
    {% end %}
  end

  def ddqGetDiagnosticRecordCategoryCount(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, categoryDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordCategoryCount(hCategoryDescription, categoryDescriptionCount)
    {% end %}
  end

  def ddqIsDiagnosticRecordSampledIn(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, providerGroup : LibC::GUID*, providerId : LibC::GUID*, providerName : Win32cr::Foundation::PWSTR, eventId : UInt32*, eventName : Win32cr::Foundation::PWSTR, eventVersion : UInt32*, eventKeywords : UInt64*, isSampledIn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqIsDiagnosticRecordSampledIn(hSession, providerGroup, providerId, providerName, eventId, eventName, eventVersion, eventKeywords, isSampledIn)
    {% end %}
  end

  def ddqGetDiagnosticRecordPage(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, searchCriteria : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_SEARCH_CRITERIA*, offset : UInt32, pageRecordCount : UInt32, baseRowId : Int64, hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordPage(hSession, searchCriteria, offset, pageRecordCount, baseRowId, hRecord)
    {% end %}
  end

  def ddqFreeDiagnosticRecordPage(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqFreeDiagnosticRecordPage(hRecord)
    {% end %}
  end

  def ddqGetDiagnosticRecordAtIndex(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD, index : UInt32, record : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_RECORD*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordAtIndex(hRecord, index, record)
    {% end %}
  end

  def ddqGetDiagnosticRecordCount(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD, recordCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordCount(hRecord, recordCount)
    {% end %}
  end

  def ddqGetDiagnosticReportStoreReportCount(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, reportCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticReportStoreReportCount(hSession, reportStoreType, reportCount)
    {% end %}
  end

  def ddqCancelDiagnosticRecordOperation(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqCancelDiagnosticRecordOperation(hSession)
    {% end %}
  end

  def ddqGetDiagnosticReport(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, hReport : Win32cr::Security::HDIAGNOSTIC_REPORT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticReport(hSession, reportStoreType, hReport)
    {% end %}
  end

  def ddqFreeDiagnosticReport(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqFreeDiagnosticReport(hReport)
    {% end %}
  end

  def ddqGetDiagnosticReportAtIndex(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT, index : UInt32, report : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_DATA*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticReportAtIndex(hReport, index, report)
    {% end %}
  end

  def ddqGetDiagnosticReportCount(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT, reportCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticReportCount(hReport, reportCount)
    {% end %}
  end

  def ddqExtractDiagnosticReport(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, reportKey : Win32cr::Foundation::PWSTR, destinationPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqExtractDiagnosticReport(hSession, reportStoreType, reportKey, destinationPath)
    {% end %}
  end

  def ddqGetDiagnosticRecordTagDistribution(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, tagStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TAG_STATS**, statCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordTagDistribution(hSession, producerNames, producerNameCount, tagStats, statCount)
    {% end %}
  end

  def ddqGetDiagnosticRecordBinaryDistribution(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, topNBinaries : UInt32, binaryStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_BINARY_STATS**, statCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordBinaryDistribution(hSession, producerNames, producerNameCount, topNBinaries, binaryStats, statCount)
    {% end %}
  end

  def ddqGetDiagnosticRecordSummary(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, generalStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_GENERAL_STATS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetDiagnosticRecordSummary(hSession, producerNames, producerNameCount, generalStats)
    {% end %}
  end

  def ddqSetTranscriptConfiguration(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, desiredConfig : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqSetTranscriptConfiguration(hSession, desiredConfig)
    {% end %}
  end

  def ddqGetTranscriptConfiguration(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, currentConfig : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DdqGetTranscriptConfiguration(hSession, currentConfig)
    {% end %}
  end

  @[Link("diagnosticdataquery.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun DdqCreateSession(accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel, hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqCloseSession(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetSessionAccessLevel(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticDataAccessLevelAllowed(accessLevel : Win32cr::Security::DiagnosticDataQuery::DdqAccessLevel*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordStats(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, searchCriteria : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_SEARCH_CRITERIA*, recordCount : UInt32*, minRowId : Int64*, maxRowId : Int64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordPayload(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, rowId : Int64, payload : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordLocaleTags(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, locale : Win32cr::Foundation::PWSTR, hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqFreeDiagnosticRecordLocaleTags(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordLocaleTagAtIndex(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, index : UInt32, tagDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordLocaleTagCount(hTagDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, tagDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordProducers(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqFreeDiagnosticRecordProducers(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordProducerAtIndex(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, index : UInt32, producerDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordProducerCount(hProducerDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, producerDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordProducerCategories(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerName : Win32cr::Foundation::PWSTR, hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqFreeDiagnosticRecordProducerCategories(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordCategoryAtIndex(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, index : UInt32, categoryDescription : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordCategoryCount(hCategoryDescription : Win32cr::Security::HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, categoryDescriptionCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqIsDiagnosticRecordSampledIn(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, providerGroup : LibC::GUID*, providerId : LibC::GUID*, providerName : Win32cr::Foundation::PWSTR, eventId : UInt32*, eventName : Win32cr::Foundation::PWSTR, eventVersion : UInt32*, eventKeywords : UInt64*, isSampledIn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordPage(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, searchCriteria : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_SEARCH_CRITERIA*, offset : UInt32, pageRecordCount : UInt32, baseRowId : Int64, hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqFreeDiagnosticRecordPage(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordAtIndex(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD, index : UInt32, record : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_RECORD*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordCount(hRecord : Win32cr::Security::HDIAGNOSTIC_RECORD, recordCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticReportStoreReportCount(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, reportCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqCancelDiagnosticRecordOperation(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticReport(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, hReport : Win32cr::Security::HDIAGNOSTIC_REPORT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqFreeDiagnosticReport(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticReportAtIndex(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT, index : UInt32, report : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_REPORT_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticReportCount(hReport : Win32cr::Security::HDIAGNOSTIC_REPORT, reportCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqExtractDiagnosticReport(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, reportStoreType : UInt32, reportKey : Win32cr::Foundation::PWSTR, destinationPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordTagDistribution(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, tagStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TAG_STATS**, statCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordBinaryDistribution(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, topNBinaries : UInt32, binaryStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_BINARY_STATS**, statCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetDiagnosticRecordSummary(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, producerNames : Win32cr::Foundation::PWSTR*, producerNameCount : UInt32, generalStats : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_GENERAL_STATS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqSetTranscriptConfiguration(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, desiredConfig : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DdqGetTranscriptConfiguration(hSession : Win32cr::Security::HDIAGNOSTIC_DATA_QUERY_SESSION, currentConfig : Win32cr::Security::DiagnosticDataQuery::DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end