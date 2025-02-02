require "./../foundation.cr"
require "./../system/com.cr"
require "./../networking/win_sock.cr"
require "./../security.cr"

module Win32cr::NetworkManagement::NetworkDiagnosticsFramework
  extend self
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

  enum ATTRIBUTE_TYPE
    AT_INVALID = 0_i32
    AT_BOOLEAN = 1_i32
    AT_INT8 = 2_i32
    AT_UINT8 = 3_i32
    AT_INT16 = 4_i32
    AT_UINT16 = 5_i32
    AT_INT32 = 6_i32
    AT_UINT32 = 7_i32
    AT_INT64 = 8_i32
    AT_UINT64 = 9_i32
    AT_STRING = 10_i32
    AT_GUID = 11_i32
    AT_LIFE_TIME = 12_i32
    AT_SOCKADDR = 13_i32
    AT_OCTET_STRING = 14_i32
  end
  enum REPAIR_SCOPE
    RS_SYSTEM = 0_i32
    RS_USER = 1_i32
    RS_APPLICATION = 2_i32
    RS_PROCESS = 3_i32
  end
  enum REPAIR_RISK
    RR_NOROLLBACK = 0_i32
    RR_ROLLBACK = 1_i32
    RR_NORISK = 2_i32
  end
  enum UI_INFO_TYPE
    UIT_INVALID = 0_i32
    UIT_NONE = 1_i32
    UIT_SHELL_COMMAND = 2_i32
    UIT_HELP_PANE = 3_i32
    UIT_DUI = 4_i32
  end
  enum DIAGNOSIS_STATUS
    DS_NOT_IMPLEMENTED = 0_i32
    DS_CONFIRMED = 1_i32
    DS_REJECTED = 2_i32
    DS_INDETERMINATE = 3_i32
    DS_DEFERRED = 4_i32
    DS_PASSTHROUGH = 5_i32
  end
  enum REPAIR_STATUS
    RS_NOT_IMPLEMENTED = 0_i32
    RS_REPAIRED = 1_i32
    RS_UNREPAIRED = 2_i32
    RS_DEFERRED = 3_i32
    RS_USER_ACTION = 4_i32
  end
  enum PROBLEM_TYPE
    PT_INVALID = 0_i32
    PT_LOW_HEALTH = 1_i32
    PT_LOWER_HEALTH = 2_i32
    PT_DOWN_STREAM_HEALTH = 4_i32
    PT_HIGH_UTILIZATION = 8_i32
    PT_HIGHER_UTILIZATION = 16_i32
    PT_UP_STREAM_UTILIZATION = 32_i32
  end

  @[Extern]
  struct OCTET_STRING
    property dwLength : UInt32
    property lpValue : UInt8*
    def initialize(@dwLength : UInt32, @lpValue : UInt8*)
    end
  end

  @[Extern]
  struct LIFE_TIME
    property startTime : Win32cr::Foundation::FILETIME
    property endTime : Win32cr::Foundation::FILETIME
    def initialize(@startTime : Win32cr::Foundation::FILETIME, @endTime : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct DIAG_SOCKADDR
    property family : UInt16
    property data : Win32cr::Foundation::CHAR[126]
    def initialize(@family : UInt16, @data : Win32cr::Foundation::CHAR[126])
    end
  end

  @[Extern]
  struct HELPER_ATTRIBUTE
    property pwszName : Win32cr::Foundation::PWSTR
    property type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ATTRIBUTE_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property boolean : Win32cr::Foundation::BOOL
    property char : UInt8
    property byte : UInt8
    property short : Int16
    property word : UInt16
    property int : Int32
    property d_word : UInt32
    property int64 : Int64
    property u_int64 : UInt64
    property pw_str : Win32cr::Foundation::PWSTR
    property guid : LibC::GUID
    property life_time : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME
    property address : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAG_SOCKADDR
    property octet_string : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::OCTET_STRING
    def initialize(@boolean : Win32cr::Foundation::BOOL, @char : UInt8, @byte : UInt8, @short : Int16, @word : UInt16, @int : Int32, @d_word : UInt32, @int64 : Int64, @u_int64 : UInt64, @pw_str : Win32cr::Foundation::PWSTR, @guid : LibC::GUID, @life_time : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME, @address : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAG_SOCKADDR, @octet_string : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::OCTET_STRING)
    end
    end

    def initialize(@pwszName : Win32cr::Foundation::PWSTR, @type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ATTRIBUTE_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct ShellCommandInfo
    property pwszOperation : Win32cr::Foundation::PWSTR
    property pwszFile : Win32cr::Foundation::PWSTR
    property pwszParameters : Win32cr::Foundation::PWSTR
    property pwszDirectory : Win32cr::Foundation::PWSTR
    property nShowCmd : UInt32
    def initialize(@pwszOperation : Win32cr::Foundation::PWSTR, @pwszFile : Win32cr::Foundation::PWSTR, @pwszParameters : Win32cr::Foundation::PWSTR, @pwszDirectory : Win32cr::Foundation::PWSTR, @nShowCmd : UInt32)
    end
  end

  @[Extern]
  struct UiInfo
    property type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::UI_INFO_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pwzNull : Win32cr::Foundation::PWSTR
    property shell_info : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ShellCommandInfo
    property pwzHelpUrl : Win32cr::Foundation::PWSTR
    property pwzDui : Win32cr::Foundation::PWSTR
    def initialize(@pwzNull : Win32cr::Foundation::PWSTR, @shell_info : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ShellCommandInfo, @pwzHelpUrl : Win32cr::Foundation::PWSTR, @pwzDui : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::UI_INFO_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct RepairInfo
    property guid : LibC::GUID
    property pwszClassName : Win32cr::Foundation::PWSTR
    property pwszDescription : Win32cr::Foundation::PWSTR
    property sidType : UInt32
    property cost : Int32
    property flags : UInt32
    property scope : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_SCOPE
    property risk : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_RISK
    property ui_info : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::UiInfo
    property rootCauseIndex : Int32
    def initialize(@guid : LibC::GUID, @pwszClassName : Win32cr::Foundation::PWSTR, @pwszDescription : Win32cr::Foundation::PWSTR, @sidType : UInt32, @cost : Int32, @flags : UInt32, @scope : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_SCOPE, @risk : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_RISK, @ui_info : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::UiInfo, @rootCauseIndex : Int32)
    end
  end

  @[Extern]
  struct RepairInfoEx
    property repair : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo
    property repairRank : UInt16
    def initialize(@repair : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo, @repairRank : UInt16)
    end
  end

  @[Extern]
  struct RootCauseInfo
    property pwszDescription : Win32cr::Foundation::PWSTR
    property rootCauseID : LibC::GUID
    property rootCauseFlags : UInt32
    property networkInterfaceID : LibC::GUID
    property pRepairs : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfoEx*
    property repairCount : UInt16
    def initialize(@pwszDescription : Win32cr::Foundation::PWSTR, @rootCauseID : LibC::GUID, @rootCauseFlags : UInt32, @networkInterfaceID : LibC::GUID, @pRepairs : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfoEx*, @repairCount : UInt16)
    end
  end

  @[Extern]
  struct HYPOTHESIS
    property pwszClassName : Win32cr::Foundation::PWSTR
    property pwszDescription : Win32cr::Foundation::PWSTR
    property celt : UInt32
    property rgAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*
    def initialize(@pwszClassName : Win32cr::Foundation::PWSTR, @pwszDescription : Win32cr::Foundation::PWSTR, @celt : UInt32, @rgAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*)
    end
  end

  @[Extern]
  struct HelperAttributeInfo
    property pwszName : Win32cr::Foundation::PWSTR
    property type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ATTRIBUTE_TYPE
    def initialize(@pwszName : Win32cr::Foundation::PWSTR, @type__ : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::ATTRIBUTE_TYPE)
    end
  end

  @[Extern]
  struct DiagnosticsInfo
    property cost : Int32
    property flags : UInt32
    def initialize(@cost : Int32, @flags : UInt32)
    end
  end

  @[Extern]
  struct HypothesisResult
    property hypothesis : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS
    property pathStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS
    def initialize(@hypothesis : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS, @pathStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS)
    end
  end

  @[Extern]
  record INetDiagHelperVtbl,
    query_interface : Proc(INetDiagHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetDiagHelper*, UInt32),
    release : Proc(INetDiagHelper*, UInt32),
    initialize__ : Proc(INetDiagHelper*, UInt32, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*, Win32cr::Foundation::HRESULT),
    get_diagnostics_info : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DiagnosticsInfo**, Win32cr::Foundation::HRESULT),
    get_key_attributes : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**, Win32cr::Foundation::HRESULT),
    low_health : Proc(INetDiagHelper*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Int32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*, Win32cr::Foundation::HRESULT),
    high_utilization : Proc(INetDiagHelper*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Int32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*, Win32cr::Foundation::HRESULT),
    get_lower_hypotheses : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**, Win32cr::Foundation::HRESULT),
    get_down_stream_hypotheses : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**, Win32cr::Foundation::HRESULT),
    get_higher_hypotheses : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**, Win32cr::Foundation::HRESULT),
    get_up_stream_hypotheses : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**, Win32cr::Foundation::HRESULT),
    repair : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo*, Int32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_STATUS*, Win32cr::Foundation::HRESULT),
    validate : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::PROBLEM_TYPE, Int32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_STATUS*, Win32cr::Foundation::HRESULT),
    get_repair_info : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::PROBLEM_TYPE, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo**, Win32cr::Foundation::HRESULT),
    get_life_time : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME*, Win32cr::Foundation::HRESULT),
    set_life_time : Proc(INetDiagHelper*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME, Win32cr::Foundation::HRESULT),
    get_cache_time : Proc(INetDiagHelper*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(INetDiagHelper*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**, Win32cr::Foundation::HRESULT),
    cancel : Proc(INetDiagHelper*, Win32cr::Foundation::HRESULT),
    cleanup : Proc(INetDiagHelper*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetDiagHelper, lpVtbl : INetDiagHelperVtbl* do
    GUID = LibC::GUID.new(0xc0b35746_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : INetDiagHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetDiagHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetDiagHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : INetDiagHelper*, celt : UInt32, rgAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, celt, rgAttributes)
    end
    def get_diagnostics_info(this : INetDiagHelper*, ppInfo : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DiagnosticsInfo**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_diagnostics_info.call(this, ppInfo)
    end
    def get_key_attributes(this : INetDiagHelper*, pcelt : UInt32*, pprgAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_key_attributes.call(this, pcelt, pprgAttributes)
    end
    def low_health(this : INetDiagHelper*, pwszInstanceDescription : Win32cr::Foundation::PWSTR, ppwszDescription : Win32cr::Foundation::PWSTR*, pDeferredTime : Int32*, pStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.low_health.call(this, pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus)
    end
    def high_utilization(this : INetDiagHelper*, pwszInstanceDescription : Win32cr::Foundation::PWSTR, ppwszDescription : Win32cr::Foundation::PWSTR*, pDeferredTime : Int32*, pStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.high_utilization.call(this, pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus)
    end
    def get_lower_hypotheses(this : INetDiagHelper*, pcelt : UInt32*, pprgHypotheses : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lower_hypotheses.call(this, pcelt, pprgHypotheses)
    end
    def get_down_stream_hypotheses(this : INetDiagHelper*, pcelt : UInt32*, pprgHypotheses : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_down_stream_hypotheses.call(this, pcelt, pprgHypotheses)
    end
    def get_higher_hypotheses(this : INetDiagHelper*, pcelt : UInt32*, pprgHypotheses : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_higher_hypotheses.call(this, pcelt, pprgHypotheses)
    end
    def get_up_stream_hypotheses(this : INetDiagHelper*, pcelt : UInt32*, pprgHypotheses : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HYPOTHESIS**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_up_stream_hypotheses.call(this, pcelt, pprgHypotheses)
    end
    def repair(this : INetDiagHelper*, pInfo : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo*, pDeferredTime : Int32*, pStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.repair.call(this, pInfo, pDeferredTime, pStatus)
    end
    def validate(this : INetDiagHelper*, problem : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::PROBLEM_TYPE, pDeferredTime : Int32*, pStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::REPAIR_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, problem, pDeferredTime, pStatus)
    end
    def get_repair_info(this : INetDiagHelper*, problem : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::PROBLEM_TYPE, pcelt : UInt32*, ppInfo : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfo**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_repair_info.call(this, problem, pcelt, ppInfo)
    end
    def get_life_time(this : INetDiagHelper*, pLifeTime : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_life_time.call(this, pLifeTime)
    end
    def set_life_time(this : INetDiagHelper*, lifeTime : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::LIFE_TIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_life_time.call(this, lifeTime)
    end
    def get_cache_time(this : INetDiagHelper*, pCacheTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cache_time.call(this, pCacheTime)
    end
    def get_attributes(this : INetDiagHelper*, pcelt : UInt32*, pprgAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pcelt, pprgAttributes)
    end
    def cancel(this : INetDiagHelper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def cleanup(this : INetDiagHelper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cleanup.call(this)
    end

  end

  @[Extern]
  record INetDiagHelperUtilFactoryVtbl,
    query_interface : Proc(INetDiagHelperUtilFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetDiagHelperUtilFactory*, UInt32),
    release : Proc(INetDiagHelperUtilFactory*, UInt32),
    create_utility_instance : Proc(INetDiagHelperUtilFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetDiagHelperUtilFactory, lpVtbl : INetDiagHelperUtilFactoryVtbl* do
    GUID = LibC::GUID.new(0x104613fb_u32, 0xbc57_u16, 0x4178_u16, StaticArray[0x95_u8, 0xba_u8, 0x88_u8, 0x80_u8, 0x96_u8, 0x98_u8, 0x35_u8, 0x4a_u8])
    def query_interface(this : INetDiagHelperUtilFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetDiagHelperUtilFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetDiagHelperUtilFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_utility_instance(this : INetDiagHelperUtilFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_utility_instance.call(this, riid, ppvObject)
    end

  end

  @[Extern]
  record INetDiagHelperExVtbl,
    query_interface : Proc(INetDiagHelperEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetDiagHelperEx*, UInt32),
    release : Proc(INetDiagHelperEx*, UInt32),
    reconfirm_low_health : Proc(INetDiagHelperEx*, UInt32, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HypothesisResult*, Win32cr::Foundation::PWSTR*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*, Win32cr::Foundation::HRESULT),
    set_utilities : Proc(INetDiagHelperEx*, Void*, Win32cr::Foundation::HRESULT),
    reproduce_failure : Proc(INetDiagHelperEx*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetDiagHelperEx, lpVtbl : INetDiagHelperExVtbl* do
    GUID = LibC::GUID.new(0x972dab4d_u32, 0xe4e3_u16, 0x4fc6_u16, StaticArray[0xae_u8, 0x54_u8, 0x5f_u8, 0x65_u8, 0xcc_u8, 0xde_u8, 0x4a_u8, 0x15_u8])
    def query_interface(this : INetDiagHelperEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetDiagHelperEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetDiagHelperEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reconfirm_low_health(this : INetDiagHelperEx*, celt : UInt32, pResults : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HypothesisResult*, ppwszUpdatedDescription : Win32cr::Foundation::PWSTR*, pUpdatedStatus : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::DIAGNOSIS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconfirm_low_health.call(this, celt, pResults, ppwszUpdatedDescription, pUpdatedStatus)
    end
    def set_utilities(this : INetDiagHelperEx*, pUtilities : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_utilities.call(this, pUtilities)
    end
    def reproduce_failure(this : INetDiagHelperEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reproduce_failure.call(this)
    end

  end

  @[Extern]
  record INetDiagHelperInfoVtbl,
    query_interface : Proc(INetDiagHelperInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetDiagHelperInfo*, UInt32),
    release : Proc(INetDiagHelperInfo*, UInt32),
    get_attribute_info : Proc(INetDiagHelperInfo*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HelperAttributeInfo**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetDiagHelperInfo, lpVtbl : INetDiagHelperInfoVtbl* do
    GUID = LibC::GUID.new(0xc0b35747_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : INetDiagHelperInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetDiagHelperInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetDiagHelperInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_info(this : INetDiagHelperInfo*, pcelt : UInt32*, pprgAttributeInfos : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HelperAttributeInfo**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_info.call(this, pcelt, pprgAttributeInfos)
    end

  end

  @[Extern]
  record INetDiagExtensibleHelperVtbl,
    query_interface : Proc(INetDiagExtensibleHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetDiagExtensibleHelper*, UInt32),
    release : Proc(INetDiagExtensibleHelper*, UInt32),
    resolve_attributes : Proc(INetDiagExtensibleHelper*, UInt32, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*, UInt32*, Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetDiagExtensibleHelper, lpVtbl : INetDiagExtensibleHelperVtbl* do
    GUID = LibC::GUID.new(0xc0b35748_u32, 0xebf5_u16, 0x11d8_u16, StaticArray[0xbb_u8, 0xe9_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : INetDiagExtensibleHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetDiagExtensibleHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetDiagExtensibleHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resolve_attributes(this : INetDiagExtensibleHelper*, celt : UInt32, rgKeyAttributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*, pcelt : UInt32*, prgMatchValues : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_attributes.call(this, celt, rgKeyAttributes, pcelt, prgMatchValues)
    end

  end

  def ndfCreateIncident(helperClassName : Win32cr::Foundation::PWSTR, celt : UInt32, attributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateIncident(helperClassName, celt, attributes, handle)
  end

  def ndfCreateWinSockIncident(sock : Win32cr::Networking::WinSock::SOCKET, host : Win32cr::Foundation::PWSTR, port : UInt16, appId : Win32cr::Foundation::PWSTR, userId : Win32cr::Security::SID*, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateWinSockIncident(sock, host, port, appId, userId, handle)
  end

  def ndfCreateWebIncident(url : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateWebIncident(url, handle)
  end

  def ndfCreateWebIncidentEx(url : Win32cr::Foundation::PWSTR, useWinHTTP : Win32cr::Foundation::BOOL, moduleName : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateWebIncidentEx(url, useWinHTTP, moduleName, handle)
  end

  def ndfCreateSharingIncident(unc_path : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateSharingIncident(unc_path, handle)
  end

  def ndfCreateDNSIncident(hostname : Win32cr::Foundation::PWSTR, queryType : UInt16, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateDNSIncident(hostname, queryType, handle)
  end

  def ndfCreateConnectivityIncident(handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateConnectivityIncident(handle)
  end

  def ndfCreateNetConnectionIncident(handle : Void**, id : LibC::GUID) : Win32cr::Foundation::HRESULT
    C.NdfCreateNetConnectionIncident(handle, id)
  end

  def ndfCreatePnrpIncident(cloudname : Win32cr::Foundation::PWSTR, peername : Win32cr::Foundation::PWSTR, diagnosePublish : Win32cr::Foundation::BOOL, appId : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreatePnrpIncident(cloudname, peername, diagnosePublish, appId, handle)
  end

  def ndfCreateGroupingIncident(cloud_name : Win32cr::Foundation::PWSTR, group_name : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::PWSTR, invitation : Win32cr::Foundation::PWSTR, addresses : Win32cr::Networking::WinSock::SOCKET_ADDRESS_LIST*, appId : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT
    C.NdfCreateGroupingIncident(cloud_name, group_name, identity, invitation, addresses, appId, handle)
  end

  def ndfExecuteDiagnosis(handle : Void*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.NdfExecuteDiagnosis(handle, hwnd)
  end

  def ndfCloseIncident(handle : Void*) : Win32cr::Foundation::HRESULT
    C.NdfCloseIncident(handle)
  end

  def ndfDiagnoseIncident(handle : Void*, root_cause_count : UInt32*, root_causes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RootCauseInfo**, dwWait : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.NdfDiagnoseIncident(handle, root_cause_count, root_causes, dwWait, dwFlags)
  end

  def ndfRepairIncident(handle : Void*, repair_ex : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfoEx*, dwWait : UInt32) : Win32cr::Foundation::HRESULT
    C.NdfRepairIncident(handle, repair_ex, dwWait)
  end

  def ndfCancelIncident(handle : Void*) : Win32cr::Foundation::HRESULT
    C.NdfCancelIncident(handle)
  end

  def ndfGetTraceFile(handle : Void*, trace_file_location : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.NdfGetTraceFile(handle, trace_file_location)
  end

  @[Link("ndfapi")]
  lib C
    # :nodoc:
    fun NdfCreateIncident(helperClassName : Win32cr::Foundation::PWSTR, celt : UInt32, attributes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::HELPER_ATTRIBUTE*, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateWinSockIncident(sock : Win32cr::Networking::WinSock::SOCKET, host : Win32cr::Foundation::PWSTR, port : UInt16, appId : Win32cr::Foundation::PWSTR, userId : Win32cr::Security::SID*, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateWebIncident(url : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateWebIncidentEx(url : Win32cr::Foundation::PWSTR, useWinHTTP : Win32cr::Foundation::BOOL, moduleName : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateSharingIncident(unc_path : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateDNSIncident(hostname : Win32cr::Foundation::PWSTR, queryType : UInt16, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateConnectivityIncident(handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateNetConnectionIncident(handle : Void**, id : LibC::GUID) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreatePnrpIncident(cloudname : Win32cr::Foundation::PWSTR, peername : Win32cr::Foundation::PWSTR, diagnosePublish : Win32cr::Foundation::BOOL, appId : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCreateGroupingIncident(cloud_name : Win32cr::Foundation::PWSTR, group_name : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::PWSTR, invitation : Win32cr::Foundation::PWSTR, addresses : Win32cr::Networking::WinSock::SOCKET_ADDRESS_LIST*, appId : Win32cr::Foundation::PWSTR, handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfExecuteDiagnosis(handle : Void*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCloseIncident(handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfDiagnoseIncident(handle : Void*, root_cause_count : UInt32*, root_causes : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RootCauseInfo**, dwWait : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfRepairIncident(handle : Void*, repair_ex : Win32cr::NetworkManagement::NetworkDiagnosticsFramework::RepairInfoEx*, dwWait : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfCancelIncident(handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdfGetTraceFile(handle : Void*, trace_file_location : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

  end
end