require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:diagnosticdataquery.dll")]
{% else %}
@[Link("diagnosticdataquery")]
{% end %}
lib LibWin32

  enum DdqAccessLevel : Int32
    NoData = 0
    CurrentUserData = 1
    AllUserData = 2
  end

  struct DIAGNOSTIC_DATA_RECORD
    row_id : Int64
    timestamp : UInt64
    event_keywords : UInt64
    full_event_name : LibC::LPWSTR
    provider_group_guid : LibC::LPWSTR
    producer_name : LibC::LPWSTR
    privacy_tags : Int32*
    privacy_tag_count : UInt32
    category_ids : Int32*
    category_id_count : UInt32
    is_core_data : LibC::BOOL
    extra1 : LibC::LPWSTR
    extra2 : LibC::LPWSTR
    extra3 : LibC::LPWSTR
  end
  struct DIAGNOSTIC_DATA_SEARCH_CRITERIA
    producer_names : LibC::LPWSTR*
    producer_name_count : UInt32
    text_to_match : LibC::LPWSTR
    category_ids : Int32*
    category_id_count : UInt32
    privacy_tags : Int32*
    privacy_tag_count : UInt32
    core_data_only : LibC::BOOL
  end
  struct DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION
    privacy_tag : Int32
    name : LibC::LPWSTR
    description : LibC::LPWSTR
  end
  struct DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION
    name : LibC::LPWSTR
  end
  struct DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION
    id : Int32
    name : LibC::LPWSTR
  end
  struct DIAGNOSTIC_DATA_EVENT_TAG_STATS
    privacy_tag : Int32
    event_count : UInt32
  end
  struct DIAGNOSTIC_DATA_EVENT_BINARY_STATS
    module_name : LibC::LPWSTR
    friendly_module_name : LibC::LPWSTR
    event_count : UInt32
    upload_size_bytes : UInt64
  end
  struct DIAGNOSTIC_DATA_GENERAL_STATS
    opt_in_level : UInt32
    transcript_size_bytes : UInt64
    oldest_event_timestamp : UInt64
    total_event_count_last24_hours : UInt32
    average_daily_events : Float32
  end
  struct DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION
    hours_of_history_to_keep : UInt32
    max_store_megabytes : UInt32
    requested_max_store_megabytes : UInt32
  end
  struct DIAGNOSTIC_REPORT_PARAMETER
    name : Char[129]*
    value : Char[260]*
  end
  struct DIAGNOSTIC_REPORT_SIGNATURE
    event_name : Char[65]*
    parameters : DIAGNOSTIC_REPORT_PARAMETER[10]*
  end
  struct DIAGNOSTIC_REPORT_DATA
    signature : DIAGNOSTIC_REPORT_SIGNATURE
    bucket_id : Guid
    report_id : Guid
    creation_time : FILETIME
    size_in_bytes : UInt64
    cab_id : LibC::LPWSTR
    report_status : UInt32
    report_integrator_id : Guid
    file_names : LibC::LPWSTR*
    file_count : UInt32
    friendly_event_name : LibC::LPWSTR
    application_name : LibC::LPWSTR
    application_path : LibC::LPWSTR
    description : LibC::LPWSTR
    bucket_id_string : LibC::LPWSTR
    legacy_bucket_id : UInt64
    report_key : LibC::LPWSTR
  end


  # Params # accesslevel : DdqAccessLevel [In],hsession : HDIAGNOSTIC_DATA_QUERY_SESSION* [In]
  fun DdqCreateSession(accesslevel : DdqAccessLevel, hsession : HDIAGNOSTIC_DATA_QUERY_SESSION*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In]
  fun DdqCloseSession(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],accesslevel : DdqAccessLevel* [In]
  fun DdqGetSessionAccessLevel(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, accesslevel : DdqAccessLevel*) : HRESULT

  # Params # accesslevel : DdqAccessLevel* [In]
  fun DdqGetDiagnosticDataAccessLevelAllowed(accesslevel : DdqAccessLevel*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],searchcriteria : DIAGNOSTIC_DATA_SEARCH_CRITERIA* [In],recordcount : UInt32* [In],minrowid : Int64* [In],maxrowid : Int64* [In]
  fun DdqGetDiagnosticRecordStats(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, searchcriteria : DIAGNOSTIC_DATA_SEARCH_CRITERIA*, recordcount : UInt32*, minrowid : Int64*, maxrowid : Int64*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],rowid : Int64 [In],payload : LibC::LPWSTR* [In]
  fun DdqGetDiagnosticRecordPayload(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, rowid : Int64, payload : LibC::LPWSTR*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],locale : LibC::LPWSTR [In],htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordLocaleTags(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, locale : LibC::LPWSTR, htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION*) : HRESULT

  # Params # htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION [In]
  fun DdqFreeDiagnosticRecordLocaleTags(htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION) : HRESULT

  # Params # htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION [In],index : UInt32 [In],tagdescription : DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordLocaleTagAtIndex(htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, index : UInt32, tagdescription : DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION*) : HRESULT

  # Params # htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION [In],tagdescriptioncount : UInt32* [In]
  fun DdqGetDiagnosticRecordLocaleTagCount(htagdescription : HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, tagdescriptioncount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordProducers(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION*) : HRESULT

  # Params # hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION [In]
  fun DdqFreeDiagnosticRecordProducers(hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION) : HRESULT

  # Params # hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION [In],index : UInt32 [In],producerdescription : DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordProducerAtIndex(hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, index : UInt32, producerdescription : DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION*) : HRESULT

  # Params # hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION [In],producerdescriptioncount : UInt32* [In]
  fun DdqGetDiagnosticRecordProducerCount(hproducerdescription : HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, producerdescriptioncount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],producername : LibC::LPWSTR [In],hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordProducerCategories(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, producername : LibC::LPWSTR, hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION*) : HRESULT

  # Params # hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION [In]
  fun DdqFreeDiagnosticRecordProducerCategories(hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION) : HRESULT

  # Params # hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION [In],index : UInt32 [In],categorydescription : DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION* [In]
  fun DdqGetDiagnosticRecordCategoryAtIndex(hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, index : UInt32, categorydescription : DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION*) : HRESULT

  # Params # hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION [In],categorydescriptioncount : UInt32* [In]
  fun DdqGetDiagnosticRecordCategoryCount(hcategorydescription : HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, categorydescriptioncount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],providergroup : Guid* [In],providerid : Guid* [In],providername : LibC::LPWSTR [In],eventid : UInt32* [In],eventname : LibC::LPWSTR [In],eventversion : UInt32* [In],eventkeywords : UInt64* [In],issampledin : LibC::BOOL* [In]
  fun DdqIsDiagnosticRecordSampledIn(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, providergroup : Guid*, providerid : Guid*, providername : LibC::LPWSTR, eventid : UInt32*, eventname : LibC::LPWSTR, eventversion : UInt32*, eventkeywords : UInt64*, issampledin : LibC::BOOL*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],searchcriteria : DIAGNOSTIC_DATA_SEARCH_CRITERIA* [In],offset : UInt32 [In],pagerecordcount : UInt32 [In],baserowid : Int64 [In],hrecord : HDIAGNOSTIC_RECORD* [In]
  fun DdqGetDiagnosticRecordPage(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, searchcriteria : DIAGNOSTIC_DATA_SEARCH_CRITERIA*, offset : UInt32, pagerecordcount : UInt32, baserowid : Int64, hrecord : HDIAGNOSTIC_RECORD*) : HRESULT

  # Params # hrecord : HDIAGNOSTIC_RECORD [In]
  fun DdqFreeDiagnosticRecordPage(hrecord : HDIAGNOSTIC_RECORD) : HRESULT

  # Params # hrecord : HDIAGNOSTIC_RECORD [In],index : UInt32 [In],record : DIAGNOSTIC_DATA_RECORD* [In]
  fun DdqGetDiagnosticRecordAtIndex(hrecord : HDIAGNOSTIC_RECORD, index : UInt32, record : DIAGNOSTIC_DATA_RECORD*) : HRESULT

  # Params # hrecord : HDIAGNOSTIC_RECORD [In],recordcount : UInt32* [In]
  fun DdqGetDiagnosticRecordCount(hrecord : HDIAGNOSTIC_RECORD, recordcount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],reportstoretype : UInt32 [In],reportcount : UInt32* [In]
  fun DdqGetDiagnosticReportStoreReportCount(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, reportstoretype : UInt32, reportcount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In]
  fun DdqCancelDiagnosticRecordOperation(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],reportstoretype : UInt32 [In],hreport : HDIAGNOSTIC_REPORT* [In]
  fun DdqGetDiagnosticReport(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, reportstoretype : UInt32, hreport : HDIAGNOSTIC_REPORT*) : HRESULT

  # Params # hreport : HDIAGNOSTIC_REPORT [In]
  fun DdqFreeDiagnosticReport(hreport : HDIAGNOSTIC_REPORT) : HRESULT

  # Params # hreport : HDIAGNOSTIC_REPORT [In],index : UInt32 [In],report : DIAGNOSTIC_REPORT_DATA* [In]
  fun DdqGetDiagnosticReportAtIndex(hreport : HDIAGNOSTIC_REPORT, index : UInt32, report : DIAGNOSTIC_REPORT_DATA*) : HRESULT

  # Params # hreport : HDIAGNOSTIC_REPORT [In],reportcount : UInt32* [In]
  fun DdqGetDiagnosticReportCount(hreport : HDIAGNOSTIC_REPORT, reportcount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],reportstoretype : UInt32 [In],reportkey : LibC::LPWSTR [In],destinationpath : LibC::LPWSTR [In]
  fun DdqExtractDiagnosticReport(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, reportstoretype : UInt32, reportkey : LibC::LPWSTR, destinationpath : LibC::LPWSTR) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],producernames : LibC::LPWSTR* [In],producernamecount : UInt32 [In],tagstats : DIAGNOSTIC_DATA_EVENT_TAG_STATS** [In],statcount : UInt32* [In]
  fun DdqGetDiagnosticRecordTagDistribution(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, producernames : LibC::LPWSTR*, producernamecount : UInt32, tagstats : DIAGNOSTIC_DATA_EVENT_TAG_STATS**, statcount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],producernames : LibC::LPWSTR* [In],producernamecount : UInt32 [In],topnbinaries : UInt32 [In],binarystats : DIAGNOSTIC_DATA_EVENT_BINARY_STATS** [In],statcount : UInt32* [In]
  fun DdqGetDiagnosticRecordBinaryDistribution(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, producernames : LibC::LPWSTR*, producernamecount : UInt32, topnbinaries : UInt32, binarystats : DIAGNOSTIC_DATA_EVENT_BINARY_STATS**, statcount : UInt32*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],producernames : LibC::LPWSTR* [In],producernamecount : UInt32 [In],generalstats : DIAGNOSTIC_DATA_GENERAL_STATS* [In]
  fun DdqGetDiagnosticRecordSummary(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, producernames : LibC::LPWSTR*, producernamecount : UInt32, generalstats : DIAGNOSTIC_DATA_GENERAL_STATS*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],desiredconfig : DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION* [In]
  fun DdqSetTranscriptConfiguration(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, desiredconfig : DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : HRESULT

  # Params # hsession : HDIAGNOSTIC_DATA_QUERY_SESSION [In],currentconfig : DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION* [In]
  fun DdqGetTranscriptConfiguration(hsession : HDIAGNOSTIC_DATA_QUERY_SESSION, currentconfig : DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*) : HRESULT
end
