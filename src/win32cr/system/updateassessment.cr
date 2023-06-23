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
  CLSID_WaaSAssessor = LibC::GUID.new(0x98ef871_u32, 0xfa9f_u16, 0x46af_u16, StaticArray[0x89_u8, 0x58_u8, 0xc0_u8, 0x83_u8, 0x51_u8, 0x5d_u8, 0x7c_u8, 0x9c_u8])


  enum UpdateImpactLevel : Int32
    UpdateImpactLevel_None = 0
    UpdateImpactLevel_Low = 1
    UpdateImpactLevel_Medium = 2
    UpdateImpactLevel_High = 3
  end

  enum UpdateAssessmentStatus : Int32
    UpdateAssessmentStatus_Latest = 0
    UpdateAssessmentStatus_NotLatestSoftRestriction = 1
    UpdateAssessmentStatus_NotLatestHardRestriction = 2
    UpdateAssessmentStatus_NotLatestEndOfSupport = 3
    UpdateAssessmentStatus_NotLatestServicingTrain = 4
    UpdateAssessmentStatus_NotLatestDeferredFeature = 5
    UpdateAssessmentStatus_NotLatestDeferredQuality = 6
    UpdateAssessmentStatus_NotLatestPausedFeature = 7
    UpdateAssessmentStatus_NotLatestPausedQuality = 8
    UpdateAssessmentStatus_NotLatestManaged = 9
    UpdateAssessmentStatus_NotLatestUnknown = 10
    UpdateAssessmentStatus_NotLatestTargetedVersion = 11
  end

  struct UpdateAssessment
    status : UpdateAssessmentStatus
    impact : UpdateImpactLevel
    days_out_of_date : UInt32
  end
  struct OSUpdateAssessment
    is_end_of_support : LibC::BOOL
    assessment_for_current : UpdateAssessment
    assessment_for_up_to_date : UpdateAssessment
    security_status : UpdateAssessmentStatus
    assessment_time : FILETIME
    release_info_time : FILETIME
    current_os_build : LibC::LPWSTR
    current_os_release_time : FILETIME
    up_to_date_os_build : LibC::LPWSTR
    up_to_date_os_release_time : FILETIME
  end


  struct IWaaSAssessorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_os_update_assessment : UInt64
  end

  IWaaSAssessor_GUID = "2347bbef-1a3b-45a4-902d-3e09c269b45e"
  IID_IWaaSAssessor = LibC::GUID.new(0x2347bbef_u32, 0x1a3b_u16, 0x45a4_u16, StaticArray[0x90_u8, 0x2d_u8, 0x3e_u8, 0x9_u8, 0xc2_u8, 0x69_u8, 0xb4_u8, 0x5e_u8])
  struct IWaaSAssessor
    lpVtbl : IWaaSAssessorVTbl*
  end

end
struct LibWin32::IWaaSAssessor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_os_update_assessment(result : OSUpdateAssessment*) : HRESULT
    @lpVtbl.value.get_os_update_assessment.unsafe_as(Proc(OSUpdateAssessment*, HRESULT)).call(result)
  end
end
