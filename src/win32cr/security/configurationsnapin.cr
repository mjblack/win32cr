require "../foundation.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    save : UInt64
    is_dirty : UInt64
    free_buffer : UInt64
  end

  ISceSvcAttachmentPersistInfo_GUID = "6d90e0d0-200d-11d1-affb-00c04fb984f9"
  IID_ISceSvcAttachmentPersistInfo = LibC::GUID.new(0x6d90e0d0_u32, 0x200d_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xfb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x84_u8, 0xf9_u8])
  struct ISceSvcAttachmentPersistInfo
    lpVtbl : ISceSvcAttachmentPersistInfoVTbl*
  end

  struct ISceSvcAttachmentDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_data : UInt64
    initialize : UInt64
    free_buffer : UInt64
    close_handle : UInt64
  end

  ISceSvcAttachmentData_GUID = "17c35fde-200d-11d1-affb-00c04fb984f9"
  IID_ISceSvcAttachmentData = LibC::GUID.new(0x17c35fde_u32, 0x200d_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xfb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x84_u8, 0xf9_u8])
  struct ISceSvcAttachmentData
    lpVtbl : ISceSvcAttachmentDataVTbl*
  end

end
struct LibWin32::ISceSvcAttachmentPersistInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def save(lptemplatename : Int8*, scesvchandle : Void**, ppvdata : Void**, pboverwriteall : LibC::BOOL*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(Int8*, Void**, Void**, LibC::BOOL*, HRESULT)).call(lptemplatename, scesvchandle, ppvdata, pboverwriteall)
  end
  def is_dirty(lptemplatename : Int8*) : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(Int8*, HRESULT)).call(lptemplatename)
  end
  def free_buffer(pvdata : Void*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(Void*, HRESULT)).call(pvdata)
  end
end
struct LibWin32::ISceSvcAttachmentData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_data(scesvchandle : Void*, scetype : SCESVC_INFO_TYPE, ppvdata : Void**, psceenumhandle : UInt32*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(Void*, SCESVC_INFO_TYPE, Void**, UInt32*, HRESULT)).call(scesvchandle, scetype, ppvdata, psceenumhandle)
  end
  def initialize(lpservicename : Int8*, lptemplatename : Int8*, lpscesvcpersistinfo : ISceSvcAttachmentPersistInfo, pscesvchandle : Void**) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Int8*, Int8*, ISceSvcAttachmentPersistInfo, Void**, HRESULT)).call(lpservicename, lptemplatename, lpscesvcpersistinfo, pscesvchandle)
  end
  def free_buffer(pvdata : Void*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(Void*, HRESULT)).call(pvdata)
  end
  def close_handle(scesvchandle : Void*) : HRESULT
    @lpVtbl.value.close_handle.unsafe_as(Proc(Void*, HRESULT)).call(scesvchandle)
  end
end
