require "../system/com.cr"
require "../foundation.cr"
require "../data/xml/msxml.cr"
require "../graphics/gdi.cr"
require "../ui/accessibility.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  CInitiateWinSAT = LibC::GUID.new(0x489331dc_u32, 0xf5e0_u16, 0x4528_u16, StaticArray[0x9f_u8, 0xda_u8, 0x45_u8, 0x33_u8, 0x1b_u8, 0xf4_u8, 0xa5_u8, 0x71_u8])
  CQueryWinSAT = LibC::GUID.new(0xf3bdfad3_u32, 0xf276_u16, 0x49e9_u16, StaticArray[0x9b_u8, 0x17_u8, 0xc4_u8, 0x74_u8, 0xf4_u8, 0x8f_u8, 0x7_u8, 0x64_u8])
  CQueryAllWinSAT = LibC::GUID.new(0x5df8d13_u32, 0xc355_u16, 0x47f4_u16, StaticArray[0xa1_u8, 0x1e_u8, 0x85_u8, 0x1b_u8, 0x33_u8, 0x8c_u8, 0xef_u8, 0xb8_u8])
  CProvideWinSATVisuals = LibC::GUID.new(0x9f377d7e_u32, 0xe551_u16, 0x44f8_u16, StaticArray[0x9f_u8, 0x94_u8, 0x9d_u8, 0xb3_u8, 0x92_u8, 0xb0_u8, 0x3b_u8, 0x7b_u8])
  CAccessiblityWinSAT = LibC::GUID.new(0x6e18f9c6_u32, 0xa3eb_u16, 0x495a_u16, StaticArray[0x89_u8, 0xb7_u8, 0x95_u8, 0x64_u8, 0x82_u8, 0xe1_u8, 0x9f_u8, 0x7a_u8])
  CQueryOEMWinSATCustomization = LibC::GUID.new(0xc47a41b7_u32, 0xb729_u16, 0x424f_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x5c_u8, 0xb3_u8, 0x93_u8, 0x4f_u8, 0x2d_u8, 0xfa_u8])


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
    query_interface : Proc(IProvideWinSATAssessmentInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideWinSATAssessmentInfo*, UInt32)
    release : Proc(IProvideWinSATAssessmentInfo*, UInt32)
    get_type_info_count : Proc(IProvideWinSATAssessmentInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IProvideWinSATAssessmentInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IProvideWinSATAssessmentInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IProvideWinSATAssessmentInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_score : Proc(IProvideWinSATAssessmentInfo*, Float32*, HRESULT)
    get_title : Proc(IProvideWinSATAssessmentInfo*, UInt8*, HRESULT)
    get_description : Proc(IProvideWinSATAssessmentInfo*, UInt8*, HRESULT)
  end

  struct IProvideWinSATAssessmentInfo
    lpVtbl : IProvideWinSATAssessmentInfoVTbl*
  end

  struct IProvideWinSATResultsInfoVTbl
    query_interface : Proc(IProvideWinSATResultsInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideWinSATResultsInfo*, UInt32)
    release : Proc(IProvideWinSATResultsInfo*, UInt32)
    get_type_info_count : Proc(IProvideWinSATResultsInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IProvideWinSATResultsInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IProvideWinSATResultsInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IProvideWinSATResultsInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_assessment_info : Proc(IProvideWinSATResultsInfo*, WINSAT_ASSESSMENT_TYPE, IProvideWinSATAssessmentInfo*, HRESULT)
    get_assessment_state : Proc(IProvideWinSATResultsInfo*, WINSAT_ASSESSMENT_STATE*, HRESULT)
    get_assessment_date_time : Proc(IProvideWinSATResultsInfo*, VARIANT*, HRESULT)
    get_system_rating : Proc(IProvideWinSATResultsInfo*, Float32*, HRESULT)
    get_rating_state_desc : Proc(IProvideWinSATResultsInfo*, UInt8*, HRESULT)
  end

  struct IProvideWinSATResultsInfo
    lpVtbl : IProvideWinSATResultsInfoVTbl*
  end

  struct IQueryRecentWinSATAssessmentVTbl
    query_interface : Proc(IQueryRecentWinSATAssessment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IQueryRecentWinSATAssessment*, UInt32)
    release : Proc(IQueryRecentWinSATAssessment*, UInt32)
    get_type_info_count : Proc(IQueryRecentWinSATAssessment*, UInt32*, HRESULT)
    get_type_info : Proc(IQueryRecentWinSATAssessment*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IQueryRecentWinSATAssessment*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IQueryRecentWinSATAssessment*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_xml : Proc(IQueryRecentWinSATAssessment*, UInt8, UInt8, IXMLDOMNodeList*, HRESULT)
    get_info : Proc(IQueryRecentWinSATAssessment*, IProvideWinSATResultsInfo*, HRESULT)
  end

  struct IQueryRecentWinSATAssessment
    lpVtbl : IQueryRecentWinSATAssessmentVTbl*
  end

  struct IProvideWinSATVisualsVTbl
    query_interface : Proc(IProvideWinSATVisuals*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideWinSATVisuals*, UInt32)
    release : Proc(IProvideWinSATVisuals*, UInt32)
    get_bitmap : Proc(IProvideWinSATVisuals*, WINSAT_BITMAP_SIZE, WINSAT_ASSESSMENT_STATE, Float32, HBITMAP*, HRESULT)
  end

  struct IProvideWinSATVisuals
    lpVtbl : IProvideWinSATVisualsVTbl*
  end

  struct IQueryAllWinSATAssessmentsVTbl
    query_interface : Proc(IQueryAllWinSATAssessments*, Guid*, Void**, HRESULT)
    add_ref : Proc(IQueryAllWinSATAssessments*, UInt32)
    release : Proc(IQueryAllWinSATAssessments*, UInt32)
    get_type_info_count : Proc(IQueryAllWinSATAssessments*, UInt32*, HRESULT)
    get_type_info : Proc(IQueryAllWinSATAssessments*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IQueryAllWinSATAssessments*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IQueryAllWinSATAssessments*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_all_xml : Proc(IQueryAllWinSATAssessments*, UInt8, UInt8, IXMLDOMNodeList*, HRESULT)
  end

  struct IQueryAllWinSATAssessments
    lpVtbl : IQueryAllWinSATAssessmentsVTbl*
  end

  struct IWinSATInitiateEventsVTbl
    query_interface : Proc(IWinSATInitiateEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWinSATInitiateEvents*, UInt32)
    release : Proc(IWinSATInitiateEvents*, UInt32)
    win_sat_complete : Proc(IWinSATInitiateEvents*, HRESULT, LibC::LPWSTR, HRESULT)
    win_sat_update : Proc(IWinSATInitiateEvents*, UInt32, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct IWinSATInitiateEvents
    lpVtbl : IWinSATInitiateEventsVTbl*
  end

  struct IInitiateWinSATAssessmentVTbl
    query_interface : Proc(IInitiateWinSATAssessment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInitiateWinSATAssessment*, UInt32)
    release : Proc(IInitiateWinSATAssessment*, UInt32)
    initiate_assessment : Proc(IInitiateWinSATAssessment*, LibC::LPWSTR, IWinSATInitiateEvents, LibC::HANDLE, HRESULT)
    initiate_formal_assessment : Proc(IInitiateWinSATAssessment*, IWinSATInitiateEvents, LibC::HANDLE, HRESULT)
    cancel_assessment : Proc(IInitiateWinSATAssessment*, HRESULT)
  end

  struct IInitiateWinSATAssessment
    lpVtbl : IInitiateWinSATAssessmentVTbl*
  end

  struct IAccessibleWinSATVTbl
    query_interface : Proc(IAccessibleWinSAT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleWinSAT*, UInt32)
    release : Proc(IAccessibleWinSAT*, UInt32)
    get_type_info_count : Proc(IAccessibleWinSAT*, UInt32*, HRESULT)
    get_type_info : Proc(IAccessibleWinSAT*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAccessibleWinSAT*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAccessibleWinSAT*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_acc_parent : Proc(IAccessibleWinSAT*, IDispatch*, HRESULT)
    get_acc_child_count : Proc(IAccessibleWinSAT*, Int32*, HRESULT)
    get_acc_child : Proc(IAccessibleWinSAT*, VARIANT, IDispatch*, HRESULT)
    get_acc_name : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    get_acc_value : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    get_acc_description : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    get_acc_role : Proc(IAccessibleWinSAT*, VARIANT, VARIANT*, HRESULT)
    get_acc_state : Proc(IAccessibleWinSAT*, VARIANT, VARIANT*, HRESULT)
    get_acc_help : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    get_acc_help_topic : Proc(IAccessibleWinSAT*, UInt8*, VARIANT, Int32*, HRESULT)
    get_acc_keyboard_shortcut : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    get_acc_focus : Proc(IAccessibleWinSAT*, VARIANT*, HRESULT)
    get_acc_selection : Proc(IAccessibleWinSAT*, VARIANT*, HRESULT)
    get_acc_default_action : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    acc_select : Proc(IAccessibleWinSAT*, Int32, VARIANT, HRESULT)
    acc_location : Proc(IAccessibleWinSAT*, Int32*, Int32*, Int32*, Int32*, VARIANT, HRESULT)
    acc_navigate : Proc(IAccessibleWinSAT*, Int32, VARIANT, VARIANT*, HRESULT)
    acc_hit_test : Proc(IAccessibleWinSAT*, Int32, Int32, VARIANT*, HRESULT)
    acc_do_default_action : Proc(IAccessibleWinSAT*, VARIANT, HRESULT)
    put_acc_name : Proc(IAccessibleWinSAT*, VARIANT, UInt8, HRESULT)
    put_acc_value : Proc(IAccessibleWinSAT*, VARIANT, UInt8, HRESULT)
    set_accessiblity_data : Proc(IAccessibleWinSAT*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  struct IAccessibleWinSAT
    lpVtbl : IAccessibleWinSATVTbl*
  end

  struct IQueryOEMWinSATCustomizationVTbl
    query_interface : Proc(IQueryOEMWinSATCustomization*, Guid*, Void**, HRESULT)
    add_ref : Proc(IQueryOEMWinSATCustomization*, UInt32)
    release : Proc(IQueryOEMWinSATCustomization*, UInt32)
    get_oem_pre_population_info : Proc(IQueryOEMWinSATCustomization*, WINSAT_OEM_DATA_TYPE*, HRESULT)
  end

  struct IQueryOEMWinSATCustomization
    lpVtbl : IQueryOEMWinSATCustomizationVTbl*
  end

end
