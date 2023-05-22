require "../foundation.cr"
require "../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  WaaSAssessor = LibC::GUID.new(0x98ef871_u32, 0xfa9f_u16, 0x46af_u16, StaticArray[0x89_u8, 0x58_u8, 0xc0_u8, 0x83_u8, 0x51_u8, 0x5d_u8, 0x7c_u8, 0x9c_u8])


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
    query_interface : Proc(IWaaSAssessor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWaaSAssessor*, UInt32)
    release : Proc(IWaaSAssessor*, UInt32)
    get_os_update_assessment : Proc(IWaaSAssessor*, OSUpdateAssessment*, HRESULT)
  end

  struct IWaaSAssessor
    lpVtbl : IWaaSAssessorVTbl*
  end

end
