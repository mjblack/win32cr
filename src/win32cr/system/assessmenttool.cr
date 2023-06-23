require "../system/com.cr"
require "../foundation.cr"
require "../data/xml/msxml.cr"
require "../graphics/gdi.cr"
require "../ui/accessibility.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_CInitiateWinSAT = LibC::GUID.new(0x489331dc_u32, 0xf5e0_u16, 0x4528_u16, StaticArray[0x9f_u8, 0xda_u8, 0x45_u8, 0x33_u8, 0x1b_u8, 0xf4_u8, 0xa5_u8, 0x71_u8])
  CLSID_CQueryWinSAT = LibC::GUID.new(0xf3bdfad3_u32, 0xf276_u16, 0x49e9_u16, StaticArray[0x9b_u8, 0x17_u8, 0xc4_u8, 0x74_u8, 0xf4_u8, 0x8f_u8, 0x7_u8, 0x64_u8])
  CLSID_CQueryAllWinSAT = LibC::GUID.new(0x5df8d13_u32, 0xc355_u16, 0x47f4_u16, StaticArray[0xa1_u8, 0x1e_u8, 0x85_u8, 0x1b_u8, 0x33_u8, 0x8c_u8, 0xef_u8, 0xb8_u8])
  CLSID_CProvideWinSATVisuals = LibC::GUID.new(0x9f377d7e_u32, 0xe551_u16, 0x44f8_u16, StaticArray[0x9f_u8, 0x94_u8, 0x9d_u8, 0xb3_u8, 0x92_u8, 0xb0_u8, 0x3b_u8, 0x7b_u8])
  CLSID_CAccessiblityWinSAT = LibC::GUID.new(0x6e18f9c6_u32, 0xa3eb_u16, 0x495a_u16, StaticArray[0x89_u8, 0xb7_u8, 0x95_u8, 0x64_u8, 0x82_u8, 0xe1_u8, 0x9f_u8, 0x7a_u8])
  CLSID_CQueryOEMWinSATCustomization = LibC::GUID.new(0xc47a41b7_u32, 0xb729_u16, 0x424f_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x5c_u8, 0xb3_u8, 0x93_u8, 0x4f_u8, 0x2d_u8, 0xfa_u8])


  enum WINSAT_OEM_DATA_TYPE : Int32
    WINSAT_OEM_DATA_VALID = 0
    WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH = 1
    WINSAT_OEM_DATA_INVALID = 2
    WINSAT_OEM_NO_DATA_SUPPLIED = 3
  end

  enum WINSAT_ASSESSMENT_STATE : Int32
    WINSAT_ASSESSMENT_STATE_MIN = 0
    WINSAT_ASSESSMENT_STATE_UNKNOWN = 0
    WINSAT_ASSESSMENT_STATE_VALID = 1
    WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE = 2
    WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE = 3
    WINSAT_ASSESSMENT_STATE_INVALID = 4
    WINSAT_ASSESSMENT_STATE_MAX = 4
  end

  enum WINSAT_ASSESSMENT_TYPE : Int32
    WINSAT_ASSESSMENT_MEMORY = 0
    WINSAT_ASSESSMENT_CPU = 1
    WINSAT_ASSESSMENT_DISK = 2
    WINSAT_ASSESSMENT_D3D = 3
    WINSAT_ASSESSMENT_GRAPHICS = 4
  end

  enum WINSAT_BITMAP_SIZE : Int32
    WINSAT_BITMAP_SIZE_SMALL = 0
    WINSAT_BITMAP_SIZE_NORMAL = 1
  end


  struct IProvideWinSATAssessmentInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_score : UInt64
    get_title : UInt64
    get_description : UInt64
  end

  IProvideWinSATAssessmentInfo_GUID = "0cd1c380-52d3-4678-ac6f-e929e480be9e"
  IID_IProvideWinSATAssessmentInfo = LibC::GUID.new(0xcd1c380_u32, 0x52d3_u16, 0x4678_u16, StaticArray[0xac_u8, 0x6f_u8, 0xe9_u8, 0x29_u8, 0xe4_u8, 0x80_u8, 0xbe_u8, 0x9e_u8])
  struct IProvideWinSATAssessmentInfo
    lpVtbl : IProvideWinSATAssessmentInfoVTbl*
  end

  struct IProvideWinSATResultsInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_assessment_info : UInt64
    get_assessment_state : UInt64
    get_assessment_date_time : UInt64
    get_system_rating : UInt64
    get_rating_state_desc : UInt64
  end

  IProvideWinSATResultsInfo_GUID = "f8334d5d-568e-4075-875f-9df341506640"
  IID_IProvideWinSATResultsInfo = LibC::GUID.new(0xf8334d5d_u32, 0x568e_u16, 0x4075_u16, StaticArray[0x87_u8, 0x5f_u8, 0x9d_u8, 0xf3_u8, 0x41_u8, 0x50_u8, 0x66_u8, 0x40_u8])
  struct IProvideWinSATResultsInfo
    lpVtbl : IProvideWinSATResultsInfoVTbl*
  end

  struct IQueryRecentWinSATAssessmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_xml : UInt64
    get_info : UInt64
  end

  IQueryRecentWinSATAssessment_GUID = "f8ad5d1f-3b47-4bdc-9375-7c6b1da4eca7"
  IID_IQueryRecentWinSATAssessment = LibC::GUID.new(0xf8ad5d1f_u32, 0x3b47_u16, 0x4bdc_u16, StaticArray[0x93_u8, 0x75_u8, 0x7c_u8, 0x6b_u8, 0x1d_u8, 0xa4_u8, 0xec_u8, 0xa7_u8])
  struct IQueryRecentWinSATAssessment
    lpVtbl : IQueryRecentWinSATAssessmentVTbl*
  end

  struct IProvideWinSATVisualsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_bitmap : UInt64
  end

  IProvideWinSATVisuals_GUID = "a9f4ade0-871a-42a3-b813-3078d25162c9"
  IID_IProvideWinSATVisuals = LibC::GUID.new(0xa9f4ade0_u32, 0x871a_u16, 0x42a3_u16, StaticArray[0xb8_u8, 0x13_u8, 0x30_u8, 0x78_u8, 0xd2_u8, 0x51_u8, 0x62_u8, 0xc9_u8])
  struct IProvideWinSATVisuals
    lpVtbl : IProvideWinSATVisualsVTbl*
  end

  struct IQueryAllWinSATAssessmentsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_all_xml : UInt64
  end

  IQueryAllWinSATAssessments_GUID = "0b89ed1d-6398-4fea-87fc-567d8d19176f"
  IID_IQueryAllWinSATAssessments = LibC::GUID.new(0xb89ed1d_u32, 0x6398_u16, 0x4fea_u16, StaticArray[0x87_u8, 0xfc_u8, 0x56_u8, 0x7d_u8, 0x8d_u8, 0x19_u8, 0x17_u8, 0x6f_u8])
  struct IQueryAllWinSATAssessments
    lpVtbl : IQueryAllWinSATAssessmentsVTbl*
  end

  struct IWinSATInitiateEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    win_sat_complete : UInt64
    win_sat_update : UInt64
  end

  IWinSATInitiateEvents_GUID = "262a1918-ba0d-41d5-92c2-fab4633ee74f"
  IID_IWinSATInitiateEvents = LibC::GUID.new(0x262a1918_u32, 0xba0d_u16, 0x41d5_u16, StaticArray[0x92_u8, 0xc2_u8, 0xfa_u8, 0xb4_u8, 0x63_u8, 0x3e_u8, 0xe7_u8, 0x4f_u8])
  struct IWinSATInitiateEvents
    lpVtbl : IWinSATInitiateEventsVTbl*
  end

  struct IInitiateWinSATAssessmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initiate_assessment : UInt64
    initiate_formal_assessment : UInt64
    cancel_assessment : UInt64
  end

  IInitiateWinSATAssessment_GUID = "d983fc50-f5bf-49d5-b5ed-cccb18aa7fc1"
  IID_IInitiateWinSATAssessment = LibC::GUID.new(0xd983fc50_u32, 0xf5bf_u16, 0x49d5_u16, StaticArray[0xb5_u8, 0xed_u8, 0xcc_u8, 0xcb_u8, 0x18_u8, 0xaa_u8, 0x7f_u8, 0xc1_u8])
  struct IInitiateWinSATAssessment
    lpVtbl : IInitiateWinSATAssessmentVTbl*
  end

  struct IAccessibleWinSATVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_acc_parent : UInt64
    get_acc_child_count : UInt64
    get_acc_child : UInt64
    get_acc_name : UInt64
    get_acc_value : UInt64
    get_acc_description : UInt64
    get_acc_role : UInt64
    get_acc_state : UInt64
    get_acc_help : UInt64
    get_acc_help_topic : UInt64
    get_acc_keyboard_shortcut : UInt64
    get_acc_focus : UInt64
    get_acc_selection : UInt64
    get_acc_default_action : UInt64
    acc_select : UInt64
    acc_location : UInt64
    acc_navigate : UInt64
    acc_hit_test : UInt64
    acc_do_default_action : UInt64
    put_acc_name : UInt64
    put_acc_value : UInt64
    set_accessiblity_data : UInt64
  end

  IAccessibleWinSAT_GUID = "30e6018a-94a8-4ff8-a69a-71b67413f07b"
  IID_IAccessibleWinSAT = LibC::GUID.new(0x30e6018a_u32, 0x94a8_u16, 0x4ff8_u16, StaticArray[0xa6_u8, 0x9a_u8, 0x71_u8, 0xb6_u8, 0x74_u8, 0x13_u8, 0xf0_u8, 0x7b_u8])
  struct IAccessibleWinSAT
    lpVtbl : IAccessibleWinSATVTbl*
  end

  struct IQueryOEMWinSATCustomizationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_oem_pre_population_info : UInt64
  end

  IQueryOEMWinSATCustomization_GUID = "bc9a6a9f-ad4e-420e-9953-b34671e9df22"
  IID_IQueryOEMWinSATCustomization = LibC::GUID.new(0xbc9a6a9f_u32, 0xad4e_u16, 0x420e_u16, StaticArray[0x99_u8, 0x53_u8, 0xb3_u8, 0x46_u8, 0x71_u8, 0xe9_u8, 0xdf_u8, 0x22_u8])
  struct IQueryOEMWinSATCustomization
    lpVtbl : IQueryOEMWinSATCustomizationVTbl*
  end

end
struct LibWin32::IProvideWinSATAssessmentInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_score(score : Float32*) : HRESULT
    @lpVtbl.value.get_score.unsafe_as(Proc(Float32*, HRESULT)).call(score)
  end
  def get_title(title : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(title)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
end
struct LibWin32::IProvideWinSATResultsInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_assessment_info(assessment : WINSAT_ASSESSMENT_TYPE, ppinfo : IProvideWinSATAssessmentInfo*) : HRESULT
    @lpVtbl.value.get_assessment_info.unsafe_as(Proc(WINSAT_ASSESSMENT_TYPE, IProvideWinSATAssessmentInfo*, HRESULT)).call(assessment, ppinfo)
  end
  def get_assessment_state(state : WINSAT_ASSESSMENT_STATE*) : HRESULT
    @lpVtbl.value.get_assessment_state.unsafe_as(Proc(WINSAT_ASSESSMENT_STATE*, HRESULT)).call(state)
  end
  def get_assessment_date_time(filetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_assessment_date_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(filetime)
  end
  def get_system_rating(level : Float32*) : HRESULT
    @lpVtbl.value.get_system_rating.unsafe_as(Proc(Float32*, HRESULT)).call(level)
  end
  def get_rating_state_desc(description : UInt8**) : HRESULT
    @lpVtbl.value.get_rating_state_desc.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
end
struct LibWin32::IQueryRecentWinSATAssessment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_xml(xpath : UInt8*, namespaces : UInt8*, ppdomnodelist : IXMLDOMNodeList*) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8*, UInt8*, IXMLDOMNodeList*, HRESULT)).call(xpath, namespaces, ppdomnodelist)
  end
  def get_info(ppwinsatassessmentinfo : IProvideWinSATResultsInfo*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(IProvideWinSATResultsInfo*, HRESULT)).call(ppwinsatassessmentinfo)
  end
end
struct LibWin32::IProvideWinSATVisuals
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_bitmap(bitmapsize : WINSAT_BITMAP_SIZE, state : WINSAT_ASSESSMENT_STATE, rating : Float32, pbitmap : HBITMAP*) : HRESULT
    @lpVtbl.value.get_bitmap.unsafe_as(Proc(WINSAT_BITMAP_SIZE, WINSAT_ASSESSMENT_STATE, Float32, HBITMAP*, HRESULT)).call(bitmapsize, state, rating, pbitmap)
  end
end
struct LibWin32::IQueryAllWinSATAssessments
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_all_xml(xpath : UInt8*, namespaces : UInt8*, ppdomnodelist : IXMLDOMNodeList*) : HRESULT
    @lpVtbl.value.get_all_xml.unsafe_as(Proc(UInt8*, UInt8*, IXMLDOMNodeList*, HRESULT)).call(xpath, namespaces, ppdomnodelist)
  end
end
struct LibWin32::IWinSATInitiateEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def win_sat_complete(hresult : HRESULT, strdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.win_sat_complete.unsafe_as(Proc(HRESULT, LibC::LPWSTR, HRESULT)).call(hresult, strdescription)
  end
  def win_sat_update(ucurrenttick : UInt32, uticktotal : UInt32, strcurrentstate : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.win_sat_update.unsafe_as(Proc(UInt32, UInt32, LibC::LPWSTR, HRESULT)).call(ucurrenttick, uticktotal, strcurrentstate)
  end
end
struct LibWin32::IInitiateWinSATAssessment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initiate_assessment(cmdline : LibC::LPWSTR, pcallbacks : IWinSATInitiateEvents, callerhwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.initiate_assessment.unsafe_as(Proc(LibC::LPWSTR, IWinSATInitiateEvents, LibC::HANDLE, HRESULT)).call(cmdline, pcallbacks, callerhwnd)
  end
  def initiate_formal_assessment(pcallbacks : IWinSATInitiateEvents, callerhwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.initiate_formal_assessment.unsafe_as(Proc(IWinSATInitiateEvents, LibC::HANDLE, HRESULT)).call(pcallbacks, callerhwnd)
  end
  def cancel_assessment : HRESULT
    @lpVtbl.value.cancel_assessment.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAccessibleWinSAT
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_acc_parent(ppdispparent : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_parent.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdispparent)
  end
  def get_acc_child_count(pcountchildren : Int32*) : HRESULT
    @lpVtbl.value.get_acc_child_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcountchildren)
  end
  def get_acc_child(varchild : VARIANT, ppdispchild : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_child.unsafe_as(Proc(VARIANT, IDispatch*, HRESULT)).call(varchild, ppdispchild)
  end
  def get_acc_name(varchild : VARIANT, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_name.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszname)
  end
  def get_acc_value(varchild : VARIANT, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_value.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszvalue)
  end
  def get_acc_description(varchild : VARIANT, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_description.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszdescription)
  end
  def get_acc_role(varchild : VARIANT, pvarrole : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_role.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(varchild, pvarrole)
  end
  def get_acc_state(varchild : VARIANT, pvarstate : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_state.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(varchild, pvarstate)
  end
  def get_acc_help(varchild : VARIANT, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_help.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszhelp)
  end
  def get_acc_help_topic(pszhelpfile : UInt8**, varchild : VARIANT, pidtopic : Int32*) : HRESULT
    @lpVtbl.value.get_acc_help_topic.unsafe_as(Proc(UInt8**, VARIANT, Int32*, HRESULT)).call(pszhelpfile, varchild, pidtopic)
  end
  def get_acc_keyboard_shortcut(varchild : VARIANT, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_keyboard_shortcut.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszkeyboardshortcut)
  end
  def get_acc_focus(pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_focus.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarchild)
  end
  def get_acc_selection(pvarchildren : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_selection.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarchildren)
  end
  def get_acc_default_action(varchild : VARIANT, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_default_action.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszdefaultaction)
  end
  def acc_select(flagsselect : Int32, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_select.unsafe_as(Proc(Int32, VARIANT, HRESULT)).call(flagsselect, varchild)
  end
  def acc_location(pxleft : Int32*, pytop : Int32*, pcxwidth : Int32*, pcyheight : Int32*, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_location.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, VARIANT, HRESULT)).call(pxleft, pytop, pcxwidth, pcyheight, varchild)
  end
  def acc_navigate(navdir : Int32, varstart : VARIANT, pvarendupat : VARIANT*) : HRESULT
    @lpVtbl.value.acc_navigate.unsafe_as(Proc(Int32, VARIANT, VARIANT*, HRESULT)).call(navdir, varstart, pvarendupat)
  end
  def acc_hit_test(xleft : Int32, ytop : Int32, pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.acc_hit_test.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(xleft, ytop, pvarchild)
  end
  def acc_do_default_action(varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_do_default_action.unsafe_as(Proc(VARIANT, HRESULT)).call(varchild)
  end
  def put_acc_name(varchild : VARIANT, szname : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_name.unsafe_as(Proc(VARIANT, UInt8*, HRESULT)).call(varchild, szname)
  end
  def put_acc_value(varchild : VARIANT, szvalue : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_value.unsafe_as(Proc(VARIANT, UInt8*, HRESULT)).call(varchild, szvalue)
  end
  def set_accessiblity_data(wsname : LibC::LPWSTR, wsvalue : LibC::LPWSTR, wsdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_accessiblity_data.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wsname, wsvalue, wsdesc)
  end
end
struct LibWin32::IQueryOEMWinSATCustomization
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_oem_pre_population_info(state : WINSAT_OEM_DATA_TYPE*) : HRESULT
    @lpVtbl.value.get_oem_pre_population_info.unsafe_as(Proc(WINSAT_OEM_DATA_TYPE*, HRESULT)).call(state)
  end
end
