require "../foundation.cr"
require "../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  Cnodetypescetemplateservices = "24a7f717-1f0c-11d1-affb-00c04fb984f9"
  Cnodetypesceanalysisservices = "678050c7-1ff8-11d1-affb-00c04fb984f9"
  Cnodetypesceeventlog = "2ce06698-4bf3-11d1-8c30-00c04fb984f9"
  SCESTATUS_SUCCESS = 0_i32
  SCESTATUS_INVALID_PARAMETER = 1_i32
  SCESTATUS_RECORD_NOT_FOUND = 2_i32
  SCESTATUS_INVALID_DATA = 3_i32
  SCESTATUS_OBJECT_EXIST = 4_i32
  SCESTATUS_BUFFER_TOO_SMALL = 5_i32
  SCESTATUS_PROFILE_NOT_FOUND = 6_i32
  SCESTATUS_BAD_FORMAT = 7_i32
  SCESTATUS_NOT_ENOUGH_RESOURCE = 8_i32
  SCESTATUS_ACCESS_DENIED = 9_i32
  SCESTATUS_CANT_DELETE = 10_i32
  SCESTATUS_PREFIX_OVERFLOW = 11_i32
  SCESTATUS_OTHER_ERROR = 12_i32
  SCESTATUS_ALREADY_RUNNING = 13_i32
  SCESTATUS_SERVICE_NOT_SUPPORT = 14_i32
  SCESTATUS_MOD_NOT_FOUND = 15_i32
  SCESTATUS_EXCEPTION_IN_SERVER = 16_i32
  SCESTATUS_NO_TEMPLATE_GIVEN = 17_i32
  SCESTATUS_NO_MAPPING = 18_i32
  SCESTATUS_TRUST_FAIL = 19_i32
  SCESVC_ENUMERATION_MAX = 100_i32

  alias PFSCE_QUERY_INFO = Proc(Void*, SCESVC_INFO_TYPE, Int8*, LibC::BOOL, Void**, UInt32*, UInt32)
  alias PFSCE_SET_INFO = Proc(Void*, SCESVC_INFO_TYPE, Int8*, LibC::BOOL, Void*, UInt32)
  alias PFSCE_FREE_INFO = Proc(Void*, UInt32)
  alias PFSCE_LOG_INFO = Proc(SCE_LOG_ERR_LEVEL, UInt32, Int8*, UInt32)
  alias PF_ConfigAnalyzeService = Proc(SCESVC_CALLBACK_INFO*, UInt32)
  alias PF_UpdateService = Proc(SCESVC_CALLBACK_INFO*, SCESVC_CONFIGURATION_INFO*, UInt32)


  enum SCE_LOG_ERR_LEVEL : UInt32
    SCE_LOG_LEVEL_ALWAYS = 0
    SCE_LOG_LEVEL_ERROR = 1
    SCE_LOG_LEVEL_DETAIL = 2
    SCE_LOG_LEVEL_DEBUG = 3
  end

  enum SCESVC_INFO_TYPE : Int32
    SceSvcConfigurationInfo = 0
    SceSvcMergedPolicyInfo = 1
    SceSvcAnalysisInfo = 2
    SceSvcInternalUse = 3
  end

  struct SCESVC_CONFIGURATION_LINE
    key : Int8*
    value : Int8*
    value_len : UInt32
  end
  struct SCESVC_CONFIGURATION_INFO
    count : UInt32
    lines : SCESVC_CONFIGURATION_LINE*
  end
  struct SCESVC_ANALYSIS_LINE
    key : Int8*
    value : UInt8*
    value_len : UInt32
  end
  struct SCESVC_ANALYSIS_INFO
    count : UInt32
    lines : SCESVC_ANALYSIS_LINE*
  end
  struct SCESVC_CALLBACK_INFO
    sce_handle : Void*
    pf_query_info : PFSCE_QUERY_INFO
    pf_set_info : PFSCE_SET_INFO
    pf_free_info : PFSCE_FREE_INFO
    pf_log_info : PFSCE_LOG_INFO
  end


  struct ISceSvcAttachmentPersistInfoVTbl
    query_interface : Proc(ISceSvcAttachmentPersistInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISceSvcAttachmentPersistInfo*, UInt32)
    release : Proc(ISceSvcAttachmentPersistInfo*, UInt32)
    save : Proc(ISceSvcAttachmentPersistInfo*, Int8*, Void**, Void**, LibC::BOOL*, HRESULT)
    is_dirty : Proc(ISceSvcAttachmentPersistInfo*, Int8*, HRESULT)
    free_buffer : Proc(ISceSvcAttachmentPersistInfo*, Void*, HRESULT)
  end

  struct ISceSvcAttachmentPersistInfo
    lpVtbl : ISceSvcAttachmentPersistInfoVTbl*
  end

  struct ISceSvcAttachmentDataVTbl
    query_interface : Proc(ISceSvcAttachmentData*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISceSvcAttachmentData*, UInt32)
    release : Proc(ISceSvcAttachmentData*, UInt32)
    get_data : Proc(ISceSvcAttachmentData*, Void*, SCESVC_INFO_TYPE, Void**, UInt32*, HRESULT)
    initialize : Proc(ISceSvcAttachmentData*, Int8*, Int8*, ISceSvcAttachmentPersistInfo, Void**, HRESULT)
    free_buffer : Proc(ISceSvcAttachmentData*, Void*, HRESULT)
    close_handle : Proc(ISceSvcAttachmentData*, Void*, HRESULT)
  end

  struct ISceSvcAttachmentData
    lpVtbl : ISceSvcAttachmentDataVTbl*
  end

end
