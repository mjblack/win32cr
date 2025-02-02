require "./../foundation.cr"
require "./com.cr"

module Win32cr::System::UpdateAssessment
  extend self

  CLSID_WaaSAssessor = LibC::GUID.new(0x98ef871_u32, 0xfa9f_u16, 0x46af_u16, StaticArray[0x89_u8, 0x58_u8, 0xc0_u8, 0x83_u8, 0x51_u8, 0x5d_u8, 0x7c_u8, 0x9c_u8])

  enum UpdateImpactLevel
    UpdateImpactLevel_None = 0_i32
    UpdateImpactLevel_Low = 1_i32
    UpdateImpactLevel_Medium = 2_i32
    UpdateImpactLevel_High = 3_i32
  end
  enum UpdateAssessmentStatus
    UpdateAssessmentStatus_Latest = 0_i32
    UpdateAssessmentStatus_NotLatestSoftRestriction = 1_i32
    UpdateAssessmentStatus_NotLatestHardRestriction = 2_i32
    UpdateAssessmentStatus_NotLatestEndOfSupport = 3_i32
    UpdateAssessmentStatus_NotLatestServicingTrain = 4_i32
    UpdateAssessmentStatus_NotLatestDeferredFeature = 5_i32
    UpdateAssessmentStatus_NotLatestDeferredQuality = 6_i32
    UpdateAssessmentStatus_NotLatestPausedFeature = 7_i32
    UpdateAssessmentStatus_NotLatestPausedQuality = 8_i32
    UpdateAssessmentStatus_NotLatestManaged = 9_i32
    UpdateAssessmentStatus_NotLatestUnknown = 10_i32
    UpdateAssessmentStatus_NotLatestTargetedVersion = 11_i32
  end

  @[Extern]
  struct UpdateAssessment
    property status : Win32cr::System::UpdateAssessment::UpdateAssessmentStatus
    property impact : Win32cr::System::UpdateAssessment::UpdateImpactLevel
    property daysOutOfDate : UInt32
    def initialize(@status : Win32cr::System::UpdateAssessment::UpdateAssessmentStatus, @impact : Win32cr::System::UpdateAssessment::UpdateImpactLevel, @daysOutOfDate : UInt32)
    end
  end

  @[Extern]
  struct OSUpdateAssessment
    property isEndOfSupport : Win32cr::Foundation::BOOL
    property assessmentForCurrent : Win32cr::System::UpdateAssessment::UpdateAssessment
    property assessmentForUpToDate : Win32cr::System::UpdateAssessment::UpdateAssessment
    property securityStatus : Win32cr::System::UpdateAssessment::UpdateAssessmentStatus
    property assessmentTime : Win32cr::Foundation::FILETIME
    property releaseInfoTime : Win32cr::Foundation::FILETIME
    property currentOSBuild : Win32cr::Foundation::PWSTR
    property currentOSReleaseTime : Win32cr::Foundation::FILETIME
    property upToDateOSBuild : Win32cr::Foundation::PWSTR
    property upToDateOSReleaseTime : Win32cr::Foundation::FILETIME
    def initialize(@isEndOfSupport : Win32cr::Foundation::BOOL, @assessmentForCurrent : Win32cr::System::UpdateAssessment::UpdateAssessment, @assessmentForUpToDate : Win32cr::System::UpdateAssessment::UpdateAssessment, @securityStatus : Win32cr::System::UpdateAssessment::UpdateAssessmentStatus, @assessmentTime : Win32cr::Foundation::FILETIME, @releaseInfoTime : Win32cr::Foundation::FILETIME, @currentOSBuild : Win32cr::Foundation::PWSTR, @currentOSReleaseTime : Win32cr::Foundation::FILETIME, @upToDateOSBuild : Win32cr::Foundation::PWSTR, @upToDateOSReleaseTime : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  record IWaaSAssessorVtbl,
    query_interface : Proc(IWaaSAssessor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWaaSAssessor*, UInt32),
    release : Proc(IWaaSAssessor*, UInt32),
    get_os_update_assessment : Proc(IWaaSAssessor*, Win32cr::System::UpdateAssessment::OSUpdateAssessment*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWaaSAssessor, lpVtbl : IWaaSAssessorVtbl* do
    GUID = LibC::GUID.new(0x2347bbef_u32, 0x1a3b_u16, 0x45a4_u16, StaticArray[0x90_u8, 0x2d_u8, 0x3e_u8, 0x9_u8, 0xc2_u8, 0x69_u8, 0xb4_u8, 0x5e_u8])
    def query_interface(this : IWaaSAssessor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWaaSAssessor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWaaSAssessor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_os_update_assessment(this : IWaaSAssessor*, result : Win32cr::System::UpdateAssessment::OSUpdateAssessment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_os_update_assessment.call(this, result)
    end

  end

end