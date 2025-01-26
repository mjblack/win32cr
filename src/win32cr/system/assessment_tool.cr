require "./com.cr"
require "./../foundation.cr"
require "./../data/xml/ms_xml.cr"
require "./../graphics/gdi.cr"
require "./../ui/accessibility.cr"

module Win32cr::System::AssessmentTool

  CLSID_CInitiateWinSAT = LibC::GUID.new(0x489331dc_u32, 0xf5e0_u16, 0x4528_u16, StaticArray[0x9f_u8, 0xda_u8, 0x45_u8, 0x33_u8, 0x1b_u8, 0xf4_u8, 0xa5_u8, 0x71_u8])

  CLSID_CQueryWinSAT = LibC::GUID.new(0xf3bdfad3_u32, 0xf276_u16, 0x49e9_u16, StaticArray[0x9b_u8, 0x17_u8, 0xc4_u8, 0x74_u8, 0xf4_u8, 0x8f_u8, 0x7_u8, 0x64_u8])

  CLSID_CQueryAllWinSAT = LibC::GUID.new(0x5df8d13_u32, 0xc355_u16, 0x47f4_u16, StaticArray[0xa1_u8, 0x1e_u8, 0x85_u8, 0x1b_u8, 0x33_u8, 0x8c_u8, 0xef_u8, 0xb8_u8])

  CLSID_CProvideWinSATVisuals = LibC::GUID.new(0x9f377d7e_u32, 0xe551_u16, 0x44f8_u16, StaticArray[0x9f_u8, 0x94_u8, 0x9d_u8, 0xb3_u8, 0x92_u8, 0xb0_u8, 0x3b_u8, 0x7b_u8])

  CLSID_CAccessiblityWinSAT = LibC::GUID.new(0x6e18f9c6_u32, 0xa3eb_u16, 0x495a_u16, StaticArray[0x89_u8, 0xb7_u8, 0x95_u8, 0x64_u8, 0x82_u8, 0xe1_u8, 0x9f_u8, 0x7a_u8])

  CLSID_CQueryOEMWinSATCustomization = LibC::GUID.new(0xc47a41b7_u32, 0xb729_u16, 0x424f_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x5c_u8, 0xb3_u8, 0x93_u8, 0x4f_u8, 0x2d_u8, 0xfa_u8])

  enum WINSAT_OEM_DATA_TYPE
    WINSAT_OEM_DATA_VALID = 0_i32
    WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH = 1_i32
    WINSAT_OEM_DATA_INVALID = 2_i32
    WINSAT_OEM_NO_DATA_SUPPLIED = 3_i32
  end
  enum WINSAT_ASSESSMENT_STATE
    WINSAT_ASSESSMENT_STATE_MIN = 0_i32
    WINSAT_ASSESSMENT_STATE_UNKNOWN = 0_i32
    WINSAT_ASSESSMENT_STATE_VALID = 1_i32
    WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE = 2_i32
    WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE = 3_i32
    WINSAT_ASSESSMENT_STATE_INVALID = 4_i32
    WINSAT_ASSESSMENT_STATE_MAX = 4_i32
  end
  enum WINSAT_ASSESSMENT_TYPE
    WINSAT_ASSESSMENT_MEMORY = 0_i32
    WINSAT_ASSESSMENT_CPU = 1_i32
    WINSAT_ASSESSMENT_DISK = 2_i32
    WINSAT_ASSESSMENT_D3D = 3_i32
    WINSAT_ASSESSMENT_GRAPHICS = 4_i32
  end
  enum WINSAT_BITMAP_SIZE
    WINSAT_BITMAP_SIZE_SMALL = 0_i32
    WINSAT_BITMAP_SIZE_NORMAL = 1_i32
  end

  @[Extern]
  record IProvideWinSATAssessmentInfoVtbl,
    query_interface : Proc(IProvideWinSATAssessmentInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProvideWinSATAssessmentInfo*, UInt32),
    release : Proc(IProvideWinSATAssessmentInfo*, UInt32),
    get_type_info_count : Proc(IProvideWinSATAssessmentInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IProvideWinSATAssessmentInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IProvideWinSATAssessmentInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IProvideWinSATAssessmentInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Score : Proc(IProvideWinSATAssessmentInfo*, Float32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IProvideWinSATAssessmentInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IProvideWinSATAssessmentInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProvideWinSATAssessmentInfo, lpVtbl : IProvideWinSATAssessmentInfoVtbl* do
    GUID = LibC::GUID.new(0xcd1c380_u32, 0x52d3_u16, 0x4678_u16, StaticArray[0xac_u8, 0x6f_u8, 0xe9_u8, 0x29_u8, 0xe4_u8, 0x80_u8, 0xbe_u8, 0x9e_u8])
    def query_interface(this : IProvideWinSATAssessmentInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProvideWinSATAssessmentInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProvideWinSATAssessmentInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IProvideWinSATAssessmentInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IProvideWinSATAssessmentInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IProvideWinSATAssessmentInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IProvideWinSATAssessmentInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Score(this : IProvideWinSATAssessmentInfo*, score : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Score.call(this, score)
    end
    def get_Title(this : IProvideWinSATAssessmentInfo*, title : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, title)
    end
    def get_Description(this : IProvideWinSATAssessmentInfo*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end

  end

  @[Extern]
  record IProvideWinSATResultsInfoVtbl,
    query_interface : Proc(IProvideWinSATResultsInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProvideWinSATResultsInfo*, UInt32),
    release : Proc(IProvideWinSATResultsInfo*, UInt32),
    get_type_info_count : Proc(IProvideWinSATResultsInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IProvideWinSATResultsInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IProvideWinSATResultsInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IProvideWinSATResultsInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_assessment_info : Proc(IProvideWinSATResultsInfo*, Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get_AssessmentState : Proc(IProvideWinSATResultsInfo*, Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_STATE*, Win32cr::Foundation::HRESULT),
    get_AssessmentDateTime : Proc(IProvideWinSATResultsInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SystemRating : Proc(IProvideWinSATResultsInfo*, Float32*, Win32cr::Foundation::HRESULT),
    get_RatingStateDesc : Proc(IProvideWinSATResultsInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProvideWinSATResultsInfo, lpVtbl : IProvideWinSATResultsInfoVtbl* do
    GUID = LibC::GUID.new(0xf8334d5d_u32, 0x568e_u16, 0x4075_u16, StaticArray[0x87_u8, 0x5f_u8, 0x9d_u8, 0xf3_u8, 0x41_u8, 0x50_u8, 0x66_u8, 0x40_u8])
    def query_interface(this : IProvideWinSATResultsInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProvideWinSATResultsInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProvideWinSATResultsInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IProvideWinSATResultsInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IProvideWinSATResultsInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IProvideWinSATResultsInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IProvideWinSATResultsInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_assessment_info(this : IProvideWinSATResultsInfo*, assessment : Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_TYPE, ppinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assessment_info.call(this, assessment, ppinfo)
    end
    def get_AssessmentState(this : IProvideWinSATResultsInfo*, state : Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AssessmentState.call(this, state)
    end
    def get_AssessmentDateTime(this : IProvideWinSATResultsInfo*, fileTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AssessmentDateTime.call(this, fileTime)
    end
    def get_SystemRating(this : IProvideWinSATResultsInfo*, level : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SystemRating.call(this, level)
    end
    def get_RatingStateDesc(this : IProvideWinSATResultsInfo*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RatingStateDesc.call(this, description)
    end

  end

  @[Extern]
  record IQueryRecentWinSATAssessmentVtbl,
    query_interface : Proc(IQueryRecentWinSATAssessment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IQueryRecentWinSATAssessment*, UInt32),
    release : Proc(IQueryRecentWinSATAssessment*, UInt32),
    get_type_info_count : Proc(IQueryRecentWinSATAssessment*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IQueryRecentWinSATAssessment*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IQueryRecentWinSATAssessment*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IQueryRecentWinSATAssessment*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_XML : Proc(IQueryRecentWinSATAssessment*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Info : Proc(IQueryRecentWinSATAssessment*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IQueryRecentWinSATAssessment, lpVtbl : IQueryRecentWinSATAssessmentVtbl* do
    GUID = LibC::GUID.new(0xf8ad5d1f_u32, 0x3b47_u16, 0x4bdc_u16, StaticArray[0x93_u8, 0x75_u8, 0x7c_u8, 0x6b_u8, 0x1d_u8, 0xa4_u8, 0xec_u8, 0xa7_u8])
    def query_interface(this : IQueryRecentWinSATAssessment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IQueryRecentWinSATAssessment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IQueryRecentWinSATAssessment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IQueryRecentWinSATAssessment*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IQueryRecentWinSATAssessment*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IQueryRecentWinSATAssessment*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IQueryRecentWinSATAssessment*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_XML(this : IQueryRecentWinSATAssessment*, xPath : Win32cr::Foundation::BSTR, namespaces : Win32cr::Foundation::BSTR, ppDomNodeList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XML.call(this, xPath, namespaces, ppDomNodeList)
    end
    def get_Info(this : IQueryRecentWinSATAssessment*, ppWinSATAssessmentInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Info.call(this, ppWinSATAssessmentInfo)
    end

  end

  @[Extern]
  record IProvideWinSATVisualsVtbl,
    query_interface : Proc(IProvideWinSATVisuals*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProvideWinSATVisuals*, UInt32),
    release : Proc(IProvideWinSATVisuals*, UInt32),
    get_Bitmap : Proc(IProvideWinSATVisuals*, Win32cr::System::AssessmentTool::WINSAT_BITMAP_SIZE, Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_STATE, Float32, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProvideWinSATVisuals, lpVtbl : IProvideWinSATVisualsVtbl* do
    GUID = LibC::GUID.new(0xa9f4ade0_u32, 0x871a_u16, 0x42a3_u16, StaticArray[0xb8_u8, 0x13_u8, 0x30_u8, 0x78_u8, 0xd2_u8, 0x51_u8, 0x62_u8, 0xc9_u8])
    def query_interface(this : IProvideWinSATVisuals*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProvideWinSATVisuals*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProvideWinSATVisuals*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Bitmap(this : IProvideWinSATVisuals*, bitmapSize : Win32cr::System::AssessmentTool::WINSAT_BITMAP_SIZE, state : Win32cr::System::AssessmentTool::WINSAT_ASSESSMENT_STATE, rating : Float32, pBitmap : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bitmap.call(this, bitmapSize, state, rating, pBitmap)
    end

  end

  @[Extern]
  record IQueryAllWinSATAssessmentsVtbl,
    query_interface : Proc(IQueryAllWinSATAssessments*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IQueryAllWinSATAssessments*, UInt32),
    release : Proc(IQueryAllWinSATAssessments*, UInt32),
    get_type_info_count : Proc(IQueryAllWinSATAssessments*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IQueryAllWinSATAssessments*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IQueryAllWinSATAssessments*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IQueryAllWinSATAssessments*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AllXML : Proc(IQueryAllWinSATAssessments*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IQueryAllWinSATAssessments, lpVtbl : IQueryAllWinSATAssessmentsVtbl* do
    GUID = LibC::GUID.new(0xb89ed1d_u32, 0x6398_u16, 0x4fea_u16, StaticArray[0x87_u8, 0xfc_u8, 0x56_u8, 0x7d_u8, 0x8d_u8, 0x19_u8, 0x17_u8, 0x6f_u8])
    def query_interface(this : IQueryAllWinSATAssessments*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IQueryAllWinSATAssessments*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IQueryAllWinSATAssessments*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IQueryAllWinSATAssessments*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IQueryAllWinSATAssessments*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IQueryAllWinSATAssessments*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IQueryAllWinSATAssessments*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AllXML(this : IQueryAllWinSATAssessments*, xPath : Win32cr::Foundation::BSTR, namespaces : Win32cr::Foundation::BSTR, ppDomNodeList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllXML.call(this, xPath, namespaces, ppDomNodeList)
    end

  end

  @[Extern]
  record IWinSATInitiateEventsVtbl,
    query_interface : Proc(IWinSATInitiateEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWinSATInitiateEvents*, UInt32),
    release : Proc(IWinSATInitiateEvents*, UInt32),
    win_sat_complete : Proc(IWinSATInitiateEvents*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    win_sat_update : Proc(IWinSATInitiateEvents*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWinSATInitiateEvents, lpVtbl : IWinSATInitiateEventsVtbl* do
    GUID = LibC::GUID.new(0x262a1918_u32, 0xba0d_u16, 0x41d5_u16, StaticArray[0x92_u8, 0xc2_u8, 0xfa_u8, 0xb4_u8, 0x63_u8, 0x3e_u8, 0xe7_u8, 0x4f_u8])
    def query_interface(this : IWinSATInitiateEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWinSATInitiateEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWinSATInitiateEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def win_sat_complete(this : IWinSATInitiateEvents*, hresult : Win32cr::Foundation::HRESULT, strDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.win_sat_complete.call(this, hresult, strDescription)
    end
    def win_sat_update(this : IWinSATInitiateEvents*, uCurrentTick : UInt32, uTickTotal : UInt32, strCurrentState : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.win_sat_update.call(this, uCurrentTick, uTickTotal, strCurrentState)
    end

  end

  @[Extern]
  record IInitiateWinSATAssessmentVtbl,
    query_interface : Proc(IInitiateWinSATAssessment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInitiateWinSATAssessment*, UInt32),
    release : Proc(IInitiateWinSATAssessment*, UInt32),
    initiate_assessment : Proc(IInitiateWinSATAssessment*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    initiate_formal_assessment : Proc(IInitiateWinSATAssessment*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    cancel_assessment : Proc(IInitiateWinSATAssessment*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInitiateWinSATAssessment, lpVtbl : IInitiateWinSATAssessmentVtbl* do
    GUID = LibC::GUID.new(0xd983fc50_u32, 0xf5bf_u16, 0x49d5_u16, StaticArray[0xb5_u8, 0xed_u8, 0xcc_u8, 0xcb_u8, 0x18_u8, 0xaa_u8, 0x7f_u8, 0xc1_u8])
    def query_interface(this : IInitiateWinSATAssessment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInitiateWinSATAssessment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInitiateWinSATAssessment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initiate_assessment(this : IInitiateWinSATAssessment*, cmdLine : Win32cr::Foundation::PWSTR, pCallbacks : Void*, callerHwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initiate_assessment.call(this, cmdLine, pCallbacks, callerHwnd)
    end
    def initiate_formal_assessment(this : IInitiateWinSATAssessment*, pCallbacks : Void*, callerHwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initiate_formal_assessment.call(this, pCallbacks, callerHwnd)
    end
    def cancel_assessment(this : IInitiateWinSATAssessment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_assessment.call(this)
    end

  end

  @[Extern]
  record IAccessibleWinSATVtbl,
    query_interface : Proc(IAccessibleWinSAT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessibleWinSAT*, UInt32),
    release : Proc(IAccessibleWinSAT*, UInt32),
    get_type_info_count : Proc(IAccessibleWinSAT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAccessibleWinSAT*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAccessibleWinSAT*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAccessibleWinSAT*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_accParent : Proc(IAccessibleWinSAT*, Void**, Win32cr::Foundation::HRESULT),
    get_accChildCount : Proc(IAccessibleWinSAT*, Int32*, Win32cr::Foundation::HRESULT),
    get_accChild : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_accName : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accValue : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accDescription : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accRole : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accState : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accHelp : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accHelpTopic : Proc(IAccessibleWinSAT*, Win32cr::Foundation::BSTR*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    get_accKeyboardShortcut : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accFocus : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accSelection : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accDefaultAction : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    accSelect : Proc(IAccessibleWinSAT*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    accLocation : Proc(IAccessibleWinSAT*, Int32*, Int32*, Int32*, Int32*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    accNavigate : Proc(IAccessibleWinSAT*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    accHitTest : Proc(IAccessibleWinSAT*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    accDoDefaultAction : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    put_accName : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_accValue : Proc(IAccessibleWinSAT*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_accessiblity_data : Proc(IAccessibleWinSAT*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessibleWinSAT, lpVtbl : IAccessibleWinSATVtbl* do
    GUID = LibC::GUID.new(0x30e6018a_u32, 0x94a8_u16, 0x4ff8_u16, StaticArray[0xa6_u8, 0x9a_u8, 0x71_u8, 0xb6_u8, 0x74_u8, 0x13_u8, 0xf0_u8, 0x7b_u8])
    def query_interface(this : IAccessibleWinSAT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessibleWinSAT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessibleWinSAT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAccessibleWinSAT*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAccessibleWinSAT*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAccessibleWinSAT*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAccessibleWinSAT*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_accParent(this : IAccessibleWinSAT*, ppdispParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accParent.call(this, ppdispParent)
    end
    def get_accChildCount(this : IAccessibleWinSAT*, pcountChildren : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accChildCount.call(this, pcountChildren)
    end
    def get_accChild(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, ppdispChild : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accChild.call(this, varChild, ppdispChild)
    end
    def get_accName(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accName.call(this, varChild, pszName)
    end
    def get_accValue(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accValue.call(this, varChild, pszValue)
    end
    def get_accDescription(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accDescription.call(this, varChild, pszDescription)
    end
    def get_accRole(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pvarRole : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accRole.call(this, varChild, pvarRole)
    end
    def get_accState(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pvarState : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accState.call(this, varChild, pvarState)
    end
    def get_accHelp(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszHelp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accHelp.call(this, varChild, pszHelp)
    end
    def get_accHelpTopic(this : IAccessibleWinSAT*, pszHelpFile : Win32cr::Foundation::BSTR*, varChild : Win32cr::System::Com::VARIANT, pidTopic : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accHelpTopic.call(this, pszHelpFile, varChild, pidTopic)
    end
    def get_accKeyboardShortcut(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszKeyboardShortcut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accKeyboardShortcut.call(this, varChild, pszKeyboardShortcut)
    end
    def get_accFocus(this : IAccessibleWinSAT*, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accFocus.call(this, pvarChild)
    end
    def get_accSelection(this : IAccessibleWinSAT*, pvarChildren : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accSelection.call(this, pvarChildren)
    end
    def get_accDefaultAction(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, pszDefaultAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accDefaultAction.call(this, varChild, pszDefaultAction)
    end
    def accSelect(this : IAccessibleWinSAT*, flagsSelect : Int32, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accSelect.call(this, flagsSelect, varChild)
    end
    def accLocation(this : IAccessibleWinSAT*, pxLeft : Int32*, pyTop : Int32*, pcxWidth : Int32*, pcyHeight : Int32*, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accLocation.call(this, pxLeft, pyTop, pcxWidth, pcyHeight, varChild)
    end
    def accNavigate(this : IAccessibleWinSAT*, navDir : Int32, varStart : Win32cr::System::Com::VARIANT, pvarEndUpAt : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accNavigate.call(this, navDir, varStart, pvarEndUpAt)
    end
    def accHitTest(this : IAccessibleWinSAT*, xLeft : Int32, yTop : Int32, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accHitTest.call(this, xLeft, yTop, pvarChild)
    end
    def accDoDefaultAction(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accDoDefaultAction.call(this, varChild)
    end
    def put_accName(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, szName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_accName.call(this, varChild, szName)
    end
    def put_accValue(this : IAccessibleWinSAT*, varChild : Win32cr::System::Com::VARIANT, szValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_accValue.call(this, varChild, szValue)
    end
    def set_accessiblity_data(this : IAccessibleWinSAT*, wsName : Win32cr::Foundation::PWSTR, wsValue : Win32cr::Foundation::PWSTR, wsDesc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accessiblity_data.call(this, wsName, wsValue, wsDesc)
    end

  end

  @[Extern]
  record IQueryOEMWinSATCustomizationVtbl,
    query_interface : Proc(IQueryOEMWinSATCustomization*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IQueryOEMWinSATCustomization*, UInt32),
    release : Proc(IQueryOEMWinSATCustomization*, UInt32),
    get_oem_pre_population_info : Proc(IQueryOEMWinSATCustomization*, Win32cr::System::AssessmentTool::WINSAT_OEM_DATA_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IQueryOEMWinSATCustomization, lpVtbl : IQueryOEMWinSATCustomizationVtbl* do
    GUID = LibC::GUID.new(0xbc9a6a9f_u32, 0xad4e_u16, 0x420e_u16, StaticArray[0x99_u8, 0x53_u8, 0xb3_u8, 0x46_u8, 0x71_u8, 0xe9_u8, 0xdf_u8, 0x22_u8])
    def query_interface(this : IQueryOEMWinSATCustomization*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IQueryOEMWinSATCustomization*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IQueryOEMWinSATCustomization*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_oem_pre_population_info(this : IQueryOEMWinSATCustomization*, state : Win32cr::System::AssessmentTool::WINSAT_OEM_DATA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_oem_pre_population_info.call(this, state)
    end

  end

end