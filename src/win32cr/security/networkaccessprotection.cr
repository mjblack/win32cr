require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  ComponentTypeEnforcementClientSoH = 1_u32
  ComponentTypeEnforcementClientRp = 2_u32


  enum IsolationState : Int32
    Isolationstatenotrestricted = 1
    Isolationstateinprobation = 2
    Isolationstaterestrictedaccess = 3
  end

  enum ExtendedIsolationState : Int32
    Extendedisolationstatenodata = 0
    Extendedisolationstatetransition = 1
    Extendedisolationstateinfected = 2
    Extendedisolationstateunknown = 3
  end

  enum NapTracingLevel : Int32
    Tracinglevelundefined = 0
    Tracinglevelbasic = 1
    Tracingleveladvanced = 2
    Tracingleveldebug = 3
  end

  enum FailureCategory : Int32
    Failurecategorynone = 0
    Failurecategoryother = 1
    Failurecategoryclientcomponent = 2
    Failurecategoryclientcommunication = 3
    Failurecategoryservercomponent = 4
    Failurecategoryservercommunication = 5
  end

  enum FixupState : Int32
    Fixupstatesuccess = 0
    Fixupstateinprogress = 1
    Fixupstatecouldnotupdate = 2
  end

  enum NapNotifyType : Int32
    Napnotifytypeunknown = 0
    Napnotifytypeservicestate = 1
    Napnotifytypequarstate = 2
  end

  enum RemoteConfigurationType : Int32
    Remoteconfigtypemachine = 1
    Remoteconfigtypeconfigblob = 2
  end

  struct CountedString
    length : UInt16
    string : LibC::LPWSTR
  end
  struct IsolationInfo
    isolation_state : IsolationState
    prob_end_time : FILETIME
    failure_url : CountedString
  end
  struct IsolationInfoEx
    isolation_state : IsolationState
    extended_isolation_state : ExtendedIsolationState
    prob_end_time : FILETIME
    failure_url : CountedString
  end
  struct FailureCategoryMapping
    mapping_compliance : LibC::BOOL[5]*
  end
  struct CorrelationId
    conn_id : Guid
    time_stamp : FILETIME
  end
  struct ResultCodes
    count : UInt16
    results : HRESULT*
  end
  struct Ipv4Address
    addr : UInt8[4]*
  end
  struct Ipv6Address
    addr : UInt8[16]*
  end
  struct FixupInfo
    state : FixupState
    percentage : UInt8
    result_codes : ResultCodes
    fixup_msg_id : UInt32
  end
  struct SystemHealthAgentState
    id : UInt32
    sha_result_codes : ResultCodes
    failure_category : FailureCategory
    fixup_info : FixupInfo
  end
  struct SoHAttribute
    type : UInt16
    size : UInt16
    value : UInt8*
  end
  struct SoH
    count : UInt16
    attributes : SoHAttribute*
  end
  struct NetworkSoH
    size : UInt16
    data : UInt8*
  end
  struct PrivateData
    size : UInt16
    data : UInt8*
  end
  struct NapComponentRegistrationInfo
    id : UInt32
    friendly_name : CountedString
    description : CountedString
    version : CountedString
    vendor_name : CountedString
    info_clsid : Guid
    config_clsid : Guid
    registration_date : FILETIME
    component_type : UInt32
  end

end
