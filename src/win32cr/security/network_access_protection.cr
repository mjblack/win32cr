require "./../foundation.cr"

module Win32cr::Security::NetworkAccessProtection
  Maxsohattributecount = 100_u32
  Maxsohattributesize = 4000_u32
  Minnetworksohsize = 12_u32
  Maxnetworksohsize = 4000_u32
  Maxstringlength = 1024_u32
  Maxsystemhealthentitycount = 20_u32
  Maxenforcercount = 20_u32
  Maxprivatedatasize = 200_u32
  Maxconnectioncountperenforcer = 20_u32
  Freshsohrequest = 1_u32
  Shafixup = 1_u32
  Failurecategorycount = 5_u32
  ComponentTypeEnforcementClientSoH = 1_u32
  ComponentTypeEnforcementClientRp = 2_u32
  Percentagenotsupported = 101_u32

  enum IsolationState
    Isolationstatenotrestricted = 1_i32
    Isolationstateinprobation = 2_i32
    Isolationstaterestrictedaccess = 3_i32
  end
  enum ExtendedIsolationState
    Extendedisolationstatenodata = 0_i32
    Extendedisolationstatetransition = 1_i32
    Extendedisolationstateinfected = 2_i32
    Extendedisolationstateunknown = 3_i32
  end
  enum NapTracingLevel
    Tracinglevelundefined = 0_i32
    Tracinglevelbasic = 1_i32
    Tracingleveladvanced = 2_i32
    Tracingleveldebug = 3_i32
  end
  enum FailureCategory
    Failurecategorynone = 0_i32
    Failurecategoryother = 1_i32
    Failurecategoryclientcomponent = 2_i32
    Failurecategoryclientcommunication = 3_i32
    Failurecategoryservercomponent = 4_i32
    Failurecategoryservercommunication = 5_i32
  end
  enum FixupState
    Fixupstatesuccess = 0_i32
    Fixupstateinprogress = 1_i32
    Fixupstatecouldnotupdate = 2_i32
  end
  enum NapNotifyType
    Napnotifytypeunknown = 0_i32
    Napnotifytypeservicestate = 1_i32
    Napnotifytypequarstate = 2_i32
  end
  enum RemoteConfigurationType
    Remoteconfigtypemachine = 1_i32
    Remoteconfigtypeconfigblob = 2_i32
  end

  @[Extern]
  record CountedString,
    length : UInt16,
    string : Win32cr::Foundation::PWSTR

  @[Extern]
  record IsolationInfo,
    isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState,
    probEndTime : Win32cr::Foundation::FILETIME,
    failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString

  @[Extern]
  record IsolationInfoEx,
    isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState,
    extendedIsolationState : Win32cr::Security::NetworkAccessProtection::ExtendedIsolationState,
    probEndTime : Win32cr::Foundation::FILETIME,
    failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString

  @[Extern]
  record FailureCategoryMapping,
    mappingCompliance : Win32cr::Foundation::BOOL[5]

  @[Extern]
  record CorrelationId,
    connId : LibC::GUID,
    timeStamp : Win32cr::Foundation::FILETIME

  @[Extern]
  record ResultCodes,
    count : UInt16,
    results : Win32cr::Foundation::HRESULT*

  @[Extern]
  record Ipv4Address,
    addr : UInt8[4]

  @[Extern]
  record Ipv6Address,
    addr : UInt8[16]

  @[Extern]
  record FixupInfo,
    state : Win32cr::Security::NetworkAccessProtection::FixupState,
    percentage : UInt8,
    resultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes,
    fixupMsgId : UInt32

  @[Extern]
  record SystemHealthAgentState,
    id : UInt32,
    shaResultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes,
    failureCategory : Win32cr::Security::NetworkAccessProtection::FailureCategory,
    fixupInfo : Win32cr::Security::NetworkAccessProtection::FixupInfo

  @[Extern]
  record SoHAttribute,
    type__ : UInt16,
    size : UInt16,
    value : UInt8*

  @[Extern]
  record SoH,
    count : UInt16,
    attributes : Win32cr::Security::NetworkAccessProtection::SoHAttribute*

  @[Extern]
  record NetworkSoH,
    size : UInt16,
    data : UInt8*

  @[Extern]
  record PrivateData,
    size : UInt16,
    data : UInt8*

  @[Extern]
  record NapComponentRegistrationInfo,
    id : UInt32,
    friendlyName : Win32cr::Security::NetworkAccessProtection::CountedString,
    description : Win32cr::Security::NetworkAccessProtection::CountedString,
    version : Win32cr::Security::NetworkAccessProtection::CountedString,
    vendorName : Win32cr::Security::NetworkAccessProtection::CountedString,
    infoClsid : LibC::GUID,
    configClsid : LibC::GUID,
    registrationDate : Win32cr::Foundation::FILETIME,
    componentType : UInt32

end