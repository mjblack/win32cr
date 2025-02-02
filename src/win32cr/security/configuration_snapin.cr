require "./../foundation.cr"
require "./../system/com.cr"

module Win32cr::Security::ConfigurationSnapin
  extend self
  alias PFSCE_QUERY_INFO = Proc(Void*, Win32cr::Security::ConfigurationSnapin::SCESVC_INFO_TYPE, Int8*, Win32cr::Foundation::BOOL, Void**, UInt32*, UInt32)

  alias PFSCE_SET_INFO = Proc(Void*, Win32cr::Security::ConfigurationSnapin::SCESVC_INFO_TYPE, Int8*, Win32cr::Foundation::BOOL, Void*, UInt32)

  alias PFSCE_FREE_INFO = Proc(Void*, UInt32)

  alias PFSCE_LOG_INFO = Proc(Win32cr::Security::ConfigurationSnapin::SCE_LOG_ERR_LEVEL, UInt32, Int8*, UInt32)

  alias PF_ConfigAnalyzeService = Proc(Win32cr::Security::ConfigurationSnapin::SCESVC_CALLBACK_INFO*, UInt32)

  alias PF_UpdateService = Proc(Win32cr::Security::ConfigurationSnapin::SCESVC_CALLBACK_INFO*, Win32cr::Security::ConfigurationSnapin::SCESVC_CONFIGURATION_INFO*, UInt32)

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
  SCE_ROOT_PATH = "Software\\Microsoft\\Windows NT\\CurrentVersion\\SeCEdit"
  SCESVC_ENUMERATION_MAX = 100_i32
  Struuidnodetypescetemplateservices = "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"
  Lstruuidnodetypescetemplateservices = "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"
  Struuidnodetypesceanalysisservices = "{678050c7-1ff8-11d1-affb-00c04fb984f9}"
  Lstruuidnodetypesceanalysisservices = "{678050c7-1ff8-11d1-affb-00c04fb984f9}"
  Struuidnodetypesceeventlog = "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"
  Lstruuidnodetypesceeventlog = "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"
  CCF_SCESVC_ATTACHMENT = "CCF_SCESVC_ATTACHMENT"
  CCF_SCESVC_ATTACHMENT_DATA = "CCF_SCESVC_ATTACHMENT_DATA"

  enum SCE_LOG_ERR_LEVEL : UInt32
    SCE_LOG_LEVEL_ALWAYS = 0_u32
    SCE_LOG_LEVEL_ERROR = 1_u32
    SCE_LOG_LEVEL_DETAIL = 2_u32
    SCE_LOG_LEVEL_DEBUG = 3_u32
  end
  enum SCESVC_INFO_TYPE
    SceSvcConfigurationInfo = 0_i32
    SceSvcMergedPolicyInfo = 1_i32
    SceSvcAnalysisInfo = 2_i32
    SceSvcInternalUse = 3_i32
  end

  @[Extern]
  struct SCESVC_CONFIGURATION_LINE
    property key : Int8*
    property value : Int8*
    property value_len : UInt32
    def initialize(@key : Int8*, @value : Int8*, @value_len : UInt32)
    end
  end

  @[Extern]
  struct SCESVC_CONFIGURATION_INFO
    property count : UInt32
    property lines : Win32cr::Security::ConfigurationSnapin::SCESVC_CONFIGURATION_LINE*
    def initialize(@count : UInt32, @lines : Win32cr::Security::ConfigurationSnapin::SCESVC_CONFIGURATION_LINE*)
    end
  end

  @[Extern]
  struct SCESVC_ANALYSIS_LINE
    property key : Int8*
    property value : UInt8*
    property value_len : UInt32
    def initialize(@key : Int8*, @value : UInt8*, @value_len : UInt32)
    end
  end

  @[Extern]
  struct SCESVC_ANALYSIS_INFO
    property count : UInt32
    property lines : Win32cr::Security::ConfigurationSnapin::SCESVC_ANALYSIS_LINE*
    def initialize(@count : UInt32, @lines : Win32cr::Security::ConfigurationSnapin::SCESVC_ANALYSIS_LINE*)
    end
  end

  @[Extern]
  struct SCESVC_CALLBACK_INFO
    property sceHandle : Void*
    property pfQueryInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_QUERY_INFO
    property pfSetInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_SET_INFO
    property pfFreeInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_FREE_INFO
    property pfLogInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_LOG_INFO
    def initialize(@sceHandle : Void*, @pfQueryInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_QUERY_INFO, @pfSetInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_SET_INFO, @pfFreeInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_FREE_INFO, @pfLogInfo : Win32cr::Security::ConfigurationSnapin::PFSCE_LOG_INFO)
    end
  end

  @[Extern]
  record ISceSvcAttachmentPersistInfoVtbl,
    query_interface : Proc(ISceSvcAttachmentPersistInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISceSvcAttachmentPersistInfo*, UInt32),
    release : Proc(ISceSvcAttachmentPersistInfo*, UInt32),
    save : Proc(ISceSvcAttachmentPersistInfo*, Int8*, Void**, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(ISceSvcAttachmentPersistInfo*, Int8*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(ISceSvcAttachmentPersistInfo*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISceSvcAttachmentPersistInfo, lpVtbl : ISceSvcAttachmentPersistInfoVtbl* do
    GUID = LibC::GUID.new(0x6d90e0d0_u32, 0x200d_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xfb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x84_u8, 0xf9_u8])
    def query_interface(this : ISceSvcAttachmentPersistInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISceSvcAttachmentPersistInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISceSvcAttachmentPersistInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def save(this : ISceSvcAttachmentPersistInfo*, lpTemplateName : Int8*, scesvcHandle : Void**, ppvData : Void**, pbOverwriteAll : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, lpTemplateName, scesvcHandle, ppvData, pbOverwriteAll)
    end
    def is_dirty(this : ISceSvcAttachmentPersistInfo*, lpTemplateName : Int8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this, lpTemplateName)
    end
    def free_buffer(this : ISceSvcAttachmentPersistInfo*, pvData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pvData)
    end

  end

  @[Extern]
  record ISceSvcAttachmentDataVtbl,
    query_interface : Proc(ISceSvcAttachmentData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISceSvcAttachmentData*, UInt32),
    release : Proc(ISceSvcAttachmentData*, UInt32),
    get_data : Proc(ISceSvcAttachmentData*, Void*, Win32cr::Security::ConfigurationSnapin::SCESVC_INFO_TYPE, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(ISceSvcAttachmentData*, Int8*, Int8*, Void*, Void**, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(ISceSvcAttachmentData*, Void*, Win32cr::Foundation::HRESULT),
    close_handle : Proc(ISceSvcAttachmentData*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISceSvcAttachmentData, lpVtbl : ISceSvcAttachmentDataVtbl* do
    GUID = LibC::GUID.new(0x17c35fde_u32, 0x200d_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xfb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x84_u8, 0xf9_u8])
    def query_interface(this : ISceSvcAttachmentData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISceSvcAttachmentData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISceSvcAttachmentData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_data(this : ISceSvcAttachmentData*, scesvcHandle : Void*, sceType : Win32cr::Security::ConfigurationSnapin::SCESVC_INFO_TYPE, ppvData : Void**, psceEnumHandle : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, scesvcHandle, sceType, ppvData, psceEnumHandle)
    end
    def initialize__(this : ISceSvcAttachmentData*, lpServiceName : Int8*, lpTemplateName : Int8*, lpSceSvcPersistInfo : Void*, pscesvcHandle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lpServiceName, lpTemplateName, lpSceSvcPersistInfo, pscesvcHandle)
    end
    def free_buffer(this : ISceSvcAttachmentData*, pvData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pvData)
    end
    def close_handle(this : ISceSvcAttachmentData*, scesvcHandle : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_handle.call(this, scesvcHandle)
    end

  end

end