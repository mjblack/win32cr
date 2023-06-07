require "../foundation.cr"
require "../system/com.cr"
require "../networking/winsock.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ndfapi.dll")]
{% else %}
@[Link("ndfapi")]
{% end %}
lib LibWin32
  NDF_ERROR_START = 63744_u32
  NDF_E_LENGTH_EXCEEDED = -2146895616_i32
  NDF_E_NOHELPERCLASS = -2146895615_i32
  NDF_E_CANCELLED = -2146895614_i32
  NDF_E_DISABLED = -2146895612_i32
  NDF_E_BAD_PARAM = -2146895611_i32
  NDF_E_VALIDATION = -2146895610_i32
  NDF_E_UNKNOWN = -2146895609_i32
  NDF_E_PROBLEM_PRESENT = -2146895608_i32
  RF_WORKAROUND = 536870912_u32
  RF_USER_ACTION = 268435456_u32
  RF_USER_CONFIRMATION = 134217728_u32
  RF_INFORMATION_ONLY = 33554432_u32
  RF_UI_ONLY = 16777216_u32
  RF_SHOW_EVENTS = 8388608_u32
  RF_VALIDATE_HELPTOPIC = 4194304_u32
  RF_REPRO = 2097152_u32
  RF_CONTACT_ADMIN = 131072_u32
  RF_RESERVED = 1073741824_u32
  RF_RESERVED_CA = 2147483648_u32
  RF_RESERVED_LNI = 65536_u32
  RCF_ISLEAF = 1_u32
  RCF_ISCONFIRMED = 2_u32
  RCF_ISTHIRDPARTY = 4_u32
  DF_IMPERSONATION = 2147483648_u32
  DF_TRACELESS = 1073741824_u32
  NDF_INBOUND_FLAG_EDGETRAVERSAL = 1_u32
  NDF_INBOUND_FLAG_HEALTHCHECK = 2_u32
  NDF_ADD_CAPTURE_TRACE = 1_u32
  NDF_APPLY_INCLUSION_LIST_FILTER = 2_u32


  enum ATTRIBUTE_TYPE : Int32
    AT_INVALID = 0
    AT_BOOLEAN = 1
    AT_INT8 = 2
    AT_UINT8 = 3
    AT_INT16 = 4
    AT_UINT16 = 5
    AT_INT32 = 6
    AT_UINT32 = 7
    AT_INT64 = 8
    AT_UINT64 = 9
    AT_STRING = 10
    AT_GUID = 11
    AT_LIFE_TIME = 12
    AT_SOCKADDR = 13
    AT_OCTET_STRING = 14
  end

  enum REPAIR_SCOPE : Int32
    RS_SYSTEM = 0
    RS_USER = 1
    RS_APPLICATION = 2
    RS_PROCESS = 3
  end

  enum REPAIR_RISK : Int32
    RR_NOROLLBACK = 0
    RR_ROLLBACK = 1
    RR_NORISK = 2
  end

  enum UI_INFO_TYPE : Int32
    UIT_INVALID = 0
    UIT_NONE = 1
    UIT_SHELL_COMMAND = 2
    UIT_HELP_PANE = 3
    UIT_DUI = 4
  end

  enum DIAGNOSIS_STATUS : Int32
    DS_NOT_IMPLEMENTED = 0
    DS_CONFIRMED = 1
    DS_REJECTED = 2
    DS_INDETERMINATE = 3
    DS_DEFERRED = 4
    DS_PASSTHROUGH = 5
  end

  enum REPAIR_STATUS : Int32
    RS_NOT_IMPLEMENTED = 0
    RS_REPAIRED = 1
    RS_UNREPAIRED = 2
    RS_DEFERRED = 3
    RS_USER_ACTION = 4
  end

  enum PROBLEM_TYPE : Int32
    PT_INVALID = 0
    PT_LOW_HEALTH = 1
    PT_LOWER_HEALTH = 2
    PT_DOWN_STREAM_HEALTH = 4
    PT_HIGH_UTILIZATION = 8
    PT_HIGHER_UTILIZATION = 16
    PT_UP_STREAM_UTILIZATION = 32
  end

  union HELPER_ATTRIBUTE_Anonymous_e__Union
    boolean : LibC::BOOL
    char : UInt8
    byte : UInt8
    short : Int16
    word : UInt16
    int : Int32
    d_word : UInt32
    int64 : Int64
    u_int64 : UInt64
    pw_str : LibC::LPWSTR
    guid : Guid
    life_time : LIFE_TIME
    address : DIAG_SOCKADDR
    octet_string : OCTET_STRING
  end
  union UiInfo_Anonymous_e__Union
    pwz_null : LibC::LPWSTR
    shell_info : ShellCommandInfo
    pwz_help_url : LibC::LPWSTR
    pwz_dui : LibC::LPWSTR
  end

  struct OCTET_STRING
    dw_length : UInt32
    lp_value : UInt8*
  end
  struct LIFE_TIME
    start_time : FILETIME
    end_time : FILETIME
  end
  struct DIAG_SOCKADDR
    family : UInt16
    data : CHAR[126]*
  end
  struct HELPER_ATTRIBUTE
    pwsz_name : LibC::LPWSTR
    type : ATTRIBUTE_TYPE
    anonymous : HELPER_ATTRIBUTE_Anonymous_e__Union
  end
  struct ShellCommandInfo
    pwsz_operation : LibC::LPWSTR
    pwsz_file : LibC::LPWSTR
    pwsz_parameters : LibC::LPWSTR
    pwsz_directory : LibC::LPWSTR
    n_show_cmd : UInt32
  end
  struct UiInfo
    type : UI_INFO_TYPE
    anonymous : UiInfo_Anonymous_e__Union
  end
  struct RepairInfo
    guid : Guid
    pwsz_class_name : LibC::LPWSTR
    pwsz_description : LibC::LPWSTR
    sid_type : UInt32
    cost : Int32
    flags : UInt32
    scope : REPAIR_SCOPE
    risk : REPAIR_RISK
    ui_info : UiInfo
    root_cause_index : Int32
  end
  struct RepairInfoEx
    repair : RepairInfo
    repair_rank : UInt16
  end
  struct RootCauseInfo
    pwsz_description : LibC::LPWSTR
    root_cause_id : Guid
    root_cause_flags : UInt32
    network_interface_id : Guid
    p_repairs : RepairInfoEx*
    repair_count : UInt16
  end
  struct HYPOTHESIS
    pwsz_class_name : LibC::LPWSTR
    pwsz_description : LibC::LPWSTR
    celt : UInt32
    rg_attributes : HELPER_ATTRIBUTE*
  end
  struct HelperAttributeInfo
    pwsz_name : LibC::LPWSTR
    type : ATTRIBUTE_TYPE
  end
  struct DiagnosticsInfo
    cost : Int32
    flags : UInt32
  end
  struct HypothesisResult
    hypothesis : HYPOTHESIS
    path_status : DIAGNOSIS_STATUS
  end


  struct INetDiagHelperVTbl
    query_interface : Proc(INetDiagHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetDiagHelper*, UInt32)
    release : Proc(INetDiagHelper*, UInt32)
    initialize : Proc(INetDiagHelper*, UInt32, HELPER_ATTRIBUTE*, HRESULT)
    get_diagnostics_info : Proc(INetDiagHelper*, DiagnosticsInfo**, HRESULT)
    get_key_attributes : Proc(INetDiagHelper*, UInt32*, HELPER_ATTRIBUTE**, HRESULT)
    low_health : Proc(INetDiagHelper*, LibC::LPWSTR, LibC::LPWSTR*, Int32*, DIAGNOSIS_STATUS*, HRESULT)
    high_utilization : Proc(INetDiagHelper*, LibC::LPWSTR, LibC::LPWSTR*, Int32*, DIAGNOSIS_STATUS*, HRESULT)
    get_lower_hypotheses : Proc(INetDiagHelper*, UInt32*, HYPOTHESIS**, HRESULT)
    get_down_stream_hypotheses : Proc(INetDiagHelper*, UInt32*, HYPOTHESIS**, HRESULT)
    get_higher_hypotheses : Proc(INetDiagHelper*, UInt32*, HYPOTHESIS**, HRESULT)
    get_up_stream_hypotheses : Proc(INetDiagHelper*, UInt32*, HYPOTHESIS**, HRESULT)
    repair : Proc(INetDiagHelper*, RepairInfo*, Int32*, REPAIR_STATUS*, HRESULT)
    validate : Proc(INetDiagHelper*, PROBLEM_TYPE, Int32*, REPAIR_STATUS*, HRESULT)
    get_repair_info : Proc(INetDiagHelper*, PROBLEM_TYPE, UInt32*, RepairInfo**, HRESULT)
    get_life_time : Proc(INetDiagHelper*, LIFE_TIME*, HRESULT)
    set_life_time : Proc(INetDiagHelper*, LIFE_TIME, HRESULT)
    get_cache_time : Proc(INetDiagHelper*, FILETIME*, HRESULT)
    get_attributes : Proc(INetDiagHelper*, UInt32*, HELPER_ATTRIBUTE**, HRESULT)
    cancel : Proc(INetDiagHelper*, HRESULT)
    cleanup : Proc(INetDiagHelper*, HRESULT)
  end

  struct INetDiagHelper
    lpVtbl : INetDiagHelperVTbl*
  end

  struct INetDiagHelperUtilFactoryVTbl
    query_interface : Proc(INetDiagHelperUtilFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetDiagHelperUtilFactory*, UInt32)
    release : Proc(INetDiagHelperUtilFactory*, UInt32)
    create_utility_instance : Proc(INetDiagHelperUtilFactory*, Guid*, Void**, HRESULT)
  end

  struct INetDiagHelperUtilFactory
    lpVtbl : INetDiagHelperUtilFactoryVTbl*
  end

  struct INetDiagHelperExVTbl
    query_interface : Proc(INetDiagHelperEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetDiagHelperEx*, UInt32)
    release : Proc(INetDiagHelperEx*, UInt32)
    reconfirm_low_health : Proc(INetDiagHelperEx*, UInt32, HypothesisResult*, LibC::LPWSTR*, DIAGNOSIS_STATUS*, HRESULT)
    set_utilities : Proc(INetDiagHelperEx*, INetDiagHelperUtilFactory, HRESULT)
    reproduce_failure : Proc(INetDiagHelperEx*, HRESULT)
  end

  struct INetDiagHelperEx
    lpVtbl : INetDiagHelperExVTbl*
  end

  struct INetDiagHelperInfoVTbl
    query_interface : Proc(INetDiagHelperInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetDiagHelperInfo*, UInt32)
    release : Proc(INetDiagHelperInfo*, UInt32)
    get_attribute_info : Proc(INetDiagHelperInfo*, UInt32*, HelperAttributeInfo**, HRESULT)
  end

  struct INetDiagHelperInfo
    lpVtbl : INetDiagHelperInfoVTbl*
  end

  struct INetDiagExtensibleHelperVTbl
    query_interface : Proc(INetDiagExtensibleHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetDiagExtensibleHelper*, UInt32)
    release : Proc(INetDiagExtensibleHelper*, UInt32)
    resolve_attributes : Proc(INetDiagExtensibleHelper*, UInt32, HELPER_ATTRIBUTE*, UInt32*, HELPER_ATTRIBUTE**, HRESULT)
  end

  struct INetDiagExtensibleHelper
    lpVtbl : INetDiagExtensibleHelperVTbl*
  end


  # Params # helperclassname : LibC::LPWSTR [In],celt : UInt32 [In],attributes : HELPER_ATTRIBUTE* [In],handle : Void** [In]
  fun NdfCreateIncident(helperclassname : LibC::LPWSTR, celt : UInt32, attributes : HELPER_ATTRIBUTE*, handle : Void**) : HRESULT

  # Params # sock : SOCKET [In],host : LibC::LPWSTR [In],port : UInt16 [In],appid : LibC::LPWSTR [In],userid : SID* [In],handle : Void** [In]
  fun NdfCreateWinSockIncident(sock : SOCKET, host : LibC::LPWSTR, port : UInt16, appid : LibC::LPWSTR, userid : SID*, handle : Void**) : HRESULT

  # Params # url : LibC::LPWSTR [In],handle : Void** [In]
  fun NdfCreateWebIncident(url : LibC::LPWSTR, handle : Void**) : HRESULT

  # Params # url : LibC::LPWSTR [In],usewinhttp : LibC::BOOL [In],modulename : LibC::LPWSTR [In],handle : Void** [In]
  fun NdfCreateWebIncidentEx(url : LibC::LPWSTR, usewinhttp : LibC::BOOL, modulename : LibC::LPWSTR, handle : Void**) : HRESULT

  # Params # uncpath : LibC::LPWSTR [In],handle : Void** [In]
  fun NdfCreateSharingIncident(uncpath : LibC::LPWSTR, handle : Void**) : HRESULT

  # Params # hostname : LibC::LPWSTR [In],querytype : UInt16 [In],handle : Void** [In]
  fun NdfCreateDNSIncident(hostname : LibC::LPWSTR, querytype : UInt16, handle : Void**) : HRESULT

  # Params # handle : Void** [In]
  fun NdfCreateConnectivityIncident(handle : Void**) : HRESULT

  # Params # handle : Void** [In],id : Guid [In]
  fun NdfCreateNetConnectionIncident(handle : Void**, id : Guid) : HRESULT

  # Params # cloudname : LibC::LPWSTR [In],peername : LibC::LPWSTR [In],diagnosepublish : LibC::BOOL [In],appid : LibC::LPWSTR [In],handle : Void** [In]
  fun NdfCreatePnrpIncident(cloudname : LibC::LPWSTR, peername : LibC::LPWSTR, diagnosepublish : LibC::BOOL, appid : LibC::LPWSTR, handle : Void**) : HRESULT

  # Params # cloudname : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],identity : LibC::LPWSTR [In],invitation : LibC::LPWSTR [In],addresses : SOCKET_ADDRESS_LIST* [In],appid : LibC::LPWSTR [In],handle : Void** [In]
  fun NdfCreateGroupingIncident(cloudname : LibC::LPWSTR, groupname : LibC::LPWSTR, identity : LibC::LPWSTR, invitation : LibC::LPWSTR, addresses : SOCKET_ADDRESS_LIST*, appid : LibC::LPWSTR, handle : Void**) : HRESULT

  # Params # handle : Void* [In],hwnd : LibC::HANDLE [In]
  fun NdfExecuteDiagnosis(handle : Void*, hwnd : LibC::HANDLE) : HRESULT

  # Params # handle : Void* [In]
  fun NdfCloseIncident(handle : Void*) : HRESULT

  # Params # handle : Void* [In],rootcausecount : UInt32* [In],rootcauses : RootCauseInfo** [In],dwwait : UInt32 [In],dwflags : UInt32 [In]
  fun NdfDiagnoseIncident(handle : Void*, rootcausecount : UInt32*, rootcauses : RootCauseInfo**, dwwait : UInt32, dwflags : UInt32) : HRESULT

  # Params # handle : Void* [In],repairex : RepairInfoEx* [In],dwwait : UInt32 [In]
  fun NdfRepairIncident(handle : Void*, repairex : RepairInfoEx*, dwwait : UInt32) : HRESULT

  # Params # handle : Void* [In]
  fun NdfCancelIncident(handle : Void*) : HRESULT

  # Params # handle : Void* [In],tracefilelocation : LibC::LPWSTR* [In]
  fun NdfGetTraceFile(handle : Void*, tracefilelocation : LibC::LPWSTR*) : HRESULT
end
