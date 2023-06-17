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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
    query_interface : Proc(IProvideWinSATAssessmentInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideWinSATAssessmentInfo*, UInt32)
    release : Proc(IProvideWinSATAssessmentInfo*, UInt32)
    get_type_info_count : Proc(IProvideWinSATAssessmentInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IProvideWinSATAssessmentInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IProvideWinSATAssessmentInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IProvideWinSATAssessmentInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_score : Proc(IProvideWinSATAssessmentInfo*, Float32*, HRESULT)
    get_title : Proc(IProvideWinSATAssessmentInfo*, UInt8**, HRESULT)
    get_description : Proc(IProvideWinSATAssessmentInfo*, UInt8**, HRESULT)
  end

  IProvideWinSATAssessmentInfo_GUID = "0cd1c380-52d3-4678-ac6f-e929e480be9e"
  IID_IProvideWinSATAssessmentInfo = LibC::GUID.new(0xcd1c380_u32, 0x52d3_u16, 0x4678_u16, StaticArray[0xac_u8, 0x6f_u8, 0xe9_u8, 0x29_u8, 0xe4_u8, 0x80_u8, 0xbe_u8, 0x9e_u8])
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
    get_rating_state_desc : Proc(IProvideWinSATResultsInfo*, UInt8**, HRESULT)
  end

  IProvideWinSATResultsInfo_GUID = "f8334d5d-568e-4075-875f-9df341506640"
  IID_IProvideWinSATResultsInfo = LibC::GUID.new(0xf8334d5d_u32, 0x568e_u16, 0x4075_u16, StaticArray[0x87_u8, 0x5f_u8, 0x9d_u8, 0xf3_u8, 0x41_u8, 0x50_u8, 0x66_u8, 0x40_u8])
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
    get_xml : Proc(IQueryRecentWinSATAssessment*, UInt8*, UInt8*, IXMLDOMNodeList*, HRESULT)
    get_info : Proc(IQueryRecentWinSATAssessment*, IProvideWinSATResultsInfo*, HRESULT)
  end

  IQueryRecentWinSATAssessment_GUID = "f8ad5d1f-3b47-4bdc-9375-7c6b1da4eca7"
  IID_IQueryRecentWinSATAssessment = LibC::GUID.new(0xf8ad5d1f_u32, 0x3b47_u16, 0x4bdc_u16, StaticArray[0x93_u8, 0x75_u8, 0x7c_u8, 0x6b_u8, 0x1d_u8, 0xa4_u8, 0xec_u8, 0xa7_u8])
  struct IQueryRecentWinSATAssessment
    lpVtbl : IQueryRecentWinSATAssessmentVTbl*
  end

  struct IProvideWinSATVisualsVTbl
    query_interface : Proc(IProvideWinSATVisuals*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideWinSATVisuals*, UInt32)
    release : Proc(IProvideWinSATVisuals*, UInt32)
    get_bitmap : Proc(IProvideWinSATVisuals*, WINSAT_BITMAP_SIZE, WINSAT_ASSESSMENT_STATE, Float32, HBITMAP*, HRESULT)
  end

  IProvideWinSATVisuals_GUID = "a9f4ade0-871a-42a3-b813-3078d25162c9"
  IID_IProvideWinSATVisuals = LibC::GUID.new(0xa9f4ade0_u32, 0x871a_u16, 0x42a3_u16, StaticArray[0xb8_u8, 0x13_u8, 0x30_u8, 0x78_u8, 0xd2_u8, 0x51_u8, 0x62_u8, 0xc9_u8])
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
    get_all_xml : Proc(IQueryAllWinSATAssessments*, UInt8*, UInt8*, IXMLDOMNodeList*, HRESULT)
  end

  IQueryAllWinSATAssessments_GUID = "0b89ed1d-6398-4fea-87fc-567d8d19176f"
  IID_IQueryAllWinSATAssessments = LibC::GUID.new(0xb89ed1d_u32, 0x6398_u16, 0x4fea_u16, StaticArray[0x87_u8, 0xfc_u8, 0x56_u8, 0x7d_u8, 0x8d_u8, 0x19_u8, 0x17_u8, 0x6f_u8])
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

  IWinSATInitiateEvents_GUID = "262a1918-ba0d-41d5-92c2-fab4633ee74f"
  IID_IWinSATInitiateEvents = LibC::GUID.new(0x262a1918_u32, 0xba0d_u16, 0x41d5_u16, StaticArray[0x92_u8, 0xc2_u8, 0xfa_u8, 0xb4_u8, 0x63_u8, 0x3e_u8, 0xe7_u8, 0x4f_u8])
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

  IInitiateWinSATAssessment_GUID = "d983fc50-f5bf-49d5-b5ed-cccb18aa7fc1"
  IID_IInitiateWinSATAssessment = LibC::GUID.new(0xd983fc50_u32, 0xf5bf_u16, 0x49d5_u16, StaticArray[0xb5_u8, 0xed_u8, 0xcc_u8, 0xcb_u8, 0x18_u8, 0xaa_u8, 0x7f_u8, 0xc1_u8])
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
    get_acc_name : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    get_acc_value : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    get_acc_description : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    get_acc_role : Proc(IAccessibleWinSAT*, VARIANT, VARIANT*, HRESULT)
    get_acc_state : Proc(IAccessibleWinSAT*, VARIANT, VARIANT*, HRESULT)
    get_acc_help : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    get_acc_help_topic : Proc(IAccessibleWinSAT*, UInt8**, VARIANT, Int32*, HRESULT)
    get_acc_keyboard_shortcut : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    get_acc_focus : Proc(IAccessibleWinSAT*, VARIANT*, HRESULT)
    get_acc_selection : Proc(IAccessibleWinSAT*, VARIANT*, HRESULT)
    get_acc_default_action : Proc(IAccessibleWinSAT*, VARIANT, UInt8**, HRESULT)
    acc_select : Proc(IAccessibleWinSAT*, Int32, VARIANT, HRESULT)
    acc_location : Proc(IAccessibleWinSAT*, Int32*, Int32*, Int32*, Int32*, VARIANT, HRESULT)
    acc_navigate : Proc(IAccessibleWinSAT*, Int32, VARIANT, VARIANT*, HRESULT)
    acc_hit_test : Proc(IAccessibleWinSAT*, Int32, Int32, VARIANT*, HRESULT)
    acc_do_default_action : Proc(IAccessibleWinSAT*, VARIANT, HRESULT)
    put_acc_name : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    put_acc_value : Proc(IAccessibleWinSAT*, VARIANT, UInt8*, HRESULT)
    set_accessiblity_data : Proc(IAccessibleWinSAT*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IAccessibleWinSAT_GUID = "30e6018a-94a8-4ff8-a69a-71b67413f07b"
  IID_IAccessibleWinSAT = LibC::GUID.new(0x30e6018a_u32, 0x94a8_u16, 0x4ff8_u16, StaticArray[0xa6_u8, 0x9a_u8, 0x71_u8, 0xb6_u8, 0x74_u8, 0x13_u8, 0xf0_u8, 0x7b_u8])
  struct IAccessibleWinSAT
    lpVtbl : IAccessibleWinSATVTbl*
  end

  struct IQueryOEMWinSATCustomizationVTbl
    query_interface : Proc(IQueryOEMWinSATCustomization*, Guid*, Void**, HRESULT)
    add_ref : Proc(IQueryOEMWinSATCustomization*, UInt32)
    release : Proc(IQueryOEMWinSATCustomization*, UInt32)
    get_oem_pre_population_info : Proc(IQueryOEMWinSATCustomization*, WINSAT_OEM_DATA_TYPE*, HRESULT)
  end

  IQueryOEMWinSATCustomization_GUID = "bc9a6a9f-ad4e-420e-9953-b34671e9df22"
  IID_IQueryOEMWinSATCustomization = LibC::GUID.new(0xbc9a6a9f_u32, 0xad4e_u16, 0x420e_u16, StaticArray[0x99_u8, 0x53_u8, 0xb3_u8, 0x46_u8, 0x71_u8, 0xe9_u8, 0xdf_u8, 0x22_u8])
  struct IQueryOEMWinSATCustomization
    lpVtbl : IQueryOEMWinSATCustomizationVTbl*
  end

end
