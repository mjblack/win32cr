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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_diagnostics_info : UInt64
    get_key_attributes : UInt64
    low_health : UInt64
    high_utilization : UInt64
    get_lower_hypotheses : UInt64
    get_down_stream_hypotheses : UInt64
    get_higher_hypotheses : UInt64
    get_up_stream_hypotheses : UInt64
    repair : UInt64
    validate : UInt64
    get_repair_info : UInt64
    get_life_time : UInt64
    set_life_time : UInt64
    get_cache_time : UInt64
    get_attributes : UInt64
    cancel : UInt64
    cleanup : UInt64
  end

  INetDiagHelper_GUID = "c0b35746-ebf5-11d8-bbe9-505054503030"
  IID_INetDiagHelper = LibC::GUID.new(0xc0b35746_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct INetDiagHelper
    lpVtbl : INetDiagHelperVTbl*
  end

  struct INetDiagHelperUtilFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_utility_instance : UInt64
  end

  INetDiagHelperUtilFactory_GUID = "104613fb-bc57-4178-95ba-88809698354a"
  IID_INetDiagHelperUtilFactory = LibC::GUID.new(0x104613fb_u32, 0xbc57_u16, 0x4178_u16, StaticArray[0x95_u8, 0xba_u8, 0x88_u8, 0x80_u8, 0x96_u8, 0x98_u8, 0x35_u8, 0x4a_u8])
  struct INetDiagHelperUtilFactory
    lpVtbl : INetDiagHelperUtilFactoryVTbl*
  end

  struct INetDiagHelperExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reconfirm_low_health : UInt64
    set_utilities : UInt64
    reproduce_failure : UInt64
  end

  INetDiagHelperEx_GUID = "972dab4d-e4e3-4fc6-ae54-5f65ccde4a15"
  IID_INetDiagHelperEx = LibC::GUID.new(0x972dab4d_u32, 0xe4e3_u16, 0x4fc6_u16, StaticArray[0xae_u8, 0x54_u8, 0x5f_u8, 0x65_u8, 0xcc_u8, 0xde_u8, 0x4a_u8, 0x15_u8])
  struct INetDiagHelperEx
    lpVtbl : INetDiagHelperExVTbl*
  end

  struct INetDiagHelperInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_info : UInt64
  end

  INetDiagHelperInfo_GUID = "c0b35747-ebf5-11d8-bbe9-505054503030"
  IID_INetDiagHelperInfo = LibC::GUID.new(0xc0b35747_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct INetDiagHelperInfo
    lpVtbl : INetDiagHelperInfoVTbl*
  end

  struct INetDiagExtensibleHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    resolve_attributes : UInt64
  end

  INetDiagExtensibleHelper_GUID = "c0b35748-ebf5-11d8-bbe9-505054503030"
  IID_INetDiagExtensibleHelper = LibC::GUID.new(0xc0b35748_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
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
struct LibWin32::INetDiagHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(celt : UInt32, rgattributes : HELPER_ATTRIBUTE*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt32, HELPER_ATTRIBUTE*, HRESULT)).call(celt, rgattributes)
  end
  def get_diagnostics_info(ppinfo : DiagnosticsInfo**) : HRESULT
    @lpVtbl.value.get_diagnostics_info.unsafe_as(Proc(DiagnosticsInfo**, HRESULT)).call(ppinfo)
  end
  def get_key_attributes(pcelt : UInt32*, pprgattributes : HELPER_ATTRIBUTE**) : HRESULT
    @lpVtbl.value.get_key_attributes.unsafe_as(Proc(UInt32*, HELPER_ATTRIBUTE**, HRESULT)).call(pcelt, pprgattributes)
  end
  def low_health(pwszinstancedescription : LibC::LPWSTR, ppwszdescription : LibC::LPWSTR*, pdeferredtime : Int32*, pstatus : DIAGNOSIS_STATUS*) : HRESULT
    @lpVtbl.value.low_health.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, Int32*, DIAGNOSIS_STATUS*, HRESULT)).call(pwszinstancedescription, ppwszdescription, pdeferredtime, pstatus)
  end
  def high_utilization(pwszinstancedescription : LibC::LPWSTR, ppwszdescription : LibC::LPWSTR*, pdeferredtime : Int32*, pstatus : DIAGNOSIS_STATUS*) : HRESULT
    @lpVtbl.value.high_utilization.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, Int32*, DIAGNOSIS_STATUS*, HRESULT)).call(pwszinstancedescription, ppwszdescription, pdeferredtime, pstatus)
  end
  def get_lower_hypotheses(pcelt : UInt32*, pprghypotheses : HYPOTHESIS**) : HRESULT
    @lpVtbl.value.get_lower_hypotheses.unsafe_as(Proc(UInt32*, HYPOTHESIS**, HRESULT)).call(pcelt, pprghypotheses)
  end
  def get_down_stream_hypotheses(pcelt : UInt32*, pprghypotheses : HYPOTHESIS**) : HRESULT
    @lpVtbl.value.get_down_stream_hypotheses.unsafe_as(Proc(UInt32*, HYPOTHESIS**, HRESULT)).call(pcelt, pprghypotheses)
  end
  def get_higher_hypotheses(pcelt : UInt32*, pprghypotheses : HYPOTHESIS**) : HRESULT
    @lpVtbl.value.get_higher_hypotheses.unsafe_as(Proc(UInt32*, HYPOTHESIS**, HRESULT)).call(pcelt, pprghypotheses)
  end
  def get_up_stream_hypotheses(pcelt : UInt32*, pprghypotheses : HYPOTHESIS**) : HRESULT
    @lpVtbl.value.get_up_stream_hypotheses.unsafe_as(Proc(UInt32*, HYPOTHESIS**, HRESULT)).call(pcelt, pprghypotheses)
  end
  def repair(pinfo : RepairInfo*, pdeferredtime : Int32*, pstatus : REPAIR_STATUS*) : HRESULT
    @lpVtbl.value.repair.unsafe_as(Proc(RepairInfo*, Int32*, REPAIR_STATUS*, HRESULT)).call(pinfo, pdeferredtime, pstatus)
  end
  def validate(problem : PROBLEM_TYPE, pdeferredtime : Int32*, pstatus : REPAIR_STATUS*) : HRESULT
    @lpVtbl.value.validate.unsafe_as(Proc(PROBLEM_TYPE, Int32*, REPAIR_STATUS*, HRESULT)).call(problem, pdeferredtime, pstatus)
  end
  def get_repair_info(problem : PROBLEM_TYPE, pcelt : UInt32*, ppinfo : RepairInfo**) : HRESULT
    @lpVtbl.value.get_repair_info.unsafe_as(Proc(PROBLEM_TYPE, UInt32*, RepairInfo**, HRESULT)).call(problem, pcelt, ppinfo)
  end
  def get_life_time(plifetime : LIFE_TIME*) : HRESULT
    @lpVtbl.value.get_life_time.unsafe_as(Proc(LIFE_TIME*, HRESULT)).call(plifetime)
  end
  def set_life_time(lifetime : LIFE_TIME) : HRESULT
    @lpVtbl.value.set_life_time.unsafe_as(Proc(LIFE_TIME, HRESULT)).call(lifetime)
  end
  def get_cache_time(pcachetime : FILETIME*) : HRESULT
    @lpVtbl.value.get_cache_time.unsafe_as(Proc(FILETIME*, HRESULT)).call(pcachetime)
  end
  def get_attributes(pcelt : UInt32*, pprgattributes : HELPER_ATTRIBUTE**) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, HELPER_ATTRIBUTE**, HRESULT)).call(pcelt, pprgattributes)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def cleanup : HRESULT
    @lpVtbl.value.cleanup.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::INetDiagHelperUtilFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_utility_instance(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.create_utility_instance.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
end
struct LibWin32::INetDiagHelperEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reconfirm_low_health(celt : UInt32, presults : HypothesisResult*, ppwszupdateddescription : LibC::LPWSTR*, pupdatedstatus : DIAGNOSIS_STATUS*) : HRESULT
    @lpVtbl.value.reconfirm_low_health.unsafe_as(Proc(UInt32, HypothesisResult*, LibC::LPWSTR*, DIAGNOSIS_STATUS*, HRESULT)).call(celt, presults, ppwszupdateddescription, pupdatedstatus)
  end
  def set_utilities(putilities : INetDiagHelperUtilFactory) : HRESULT
    @lpVtbl.value.set_utilities.unsafe_as(Proc(INetDiagHelperUtilFactory, HRESULT)).call(putilities)
  end
  def reproduce_failure : HRESULT
    @lpVtbl.value.reproduce_failure.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::INetDiagHelperInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_info(pcelt : UInt32*, pprgattributeinfos : HelperAttributeInfo**) : HRESULT
    @lpVtbl.value.get_attribute_info.unsafe_as(Proc(UInt32*, HelperAttributeInfo**, HRESULT)).call(pcelt, pprgattributeinfos)
  end
end
struct LibWin32::INetDiagExtensibleHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def resolve_attributes(celt : UInt32, rgkeyattributes : HELPER_ATTRIBUTE*, pcelt : UInt32*, prgmatchvalues : HELPER_ATTRIBUTE**) : HRESULT
    @lpVtbl.value.resolve_attributes.unsafe_as(Proc(UInt32, HELPER_ATTRIBUTE*, UInt32*, HELPER_ATTRIBUTE**, HRESULT)).call(celt, rgkeyattributes, pcelt, prgmatchvalues)
  end
end
