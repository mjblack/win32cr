require "./../foundation.cr"

module Win32cr::Security::NetworkAccessProtection
  extend self
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
  struct CountedString
    property length : UInt16
    property string : Win32cr::Foundation::PWSTR
    def initialize(@length : UInt16, @string : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct IsolationInfo
    property isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState
    property probEndTime : Win32cr::Foundation::FILETIME
    property failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString
    def initialize(@isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState, @probEndTime : Win32cr::Foundation::FILETIME, @failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString)
    end
  end

  @[Extern]
  struct IsolationInfoEx
    property isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState
    property extendedIsolationState : Win32cr::Security::NetworkAccessProtection::ExtendedIsolationState
    property probEndTime : Win32cr::Foundation::FILETIME
    property failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString
    def initialize(@isolationState : Win32cr::Security::NetworkAccessProtection::IsolationState, @extendedIsolationState : Win32cr::Security::NetworkAccessProtection::ExtendedIsolationState, @probEndTime : Win32cr::Foundation::FILETIME, @failureUrl : Win32cr::Security::NetworkAccessProtection::CountedString)
    end
  end

  @[Extern]
  struct FailureCategoryMapping
    property mappingCompliance : Win32cr::Foundation::BOOL[5]
    def initialize(@mappingCompliance : Win32cr::Foundation::BOOL[5])
    end
  end

  @[Extern]
  struct CorrelationId
    property connId : LibC::GUID
    property timeStamp : Win32cr::Foundation::FILETIME
    def initialize(@connId : LibC::GUID, @timeStamp : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct ResultCodes
    property count : UInt16
    property results : Win32cr::Foundation::HRESULT*
    def initialize(@count : UInt16, @results : Win32cr::Foundation::HRESULT*)
    end
  end

  @[Extern]
  struct Ipv4Address
    property addr : UInt8[4]
    def initialize(@addr : UInt8[4])
    end
  end

  @[Extern]
  struct Ipv6Address
    property addr : UInt8[16]
    def initialize(@addr : UInt8[16])
    end
  end

  @[Extern]
  struct FixupInfo
    property state : Win32cr::Security::NetworkAccessProtection::FixupState
    property percentage : UInt8
    property resultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes
    property fixupMsgId : UInt32
    def initialize(@state : Win32cr::Security::NetworkAccessProtection::FixupState, @percentage : UInt8, @resultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes, @fixupMsgId : UInt32)
    end
  end

  @[Extern]
  struct SystemHealthAgentState
    property id : UInt32
    property shaResultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes
    property failureCategory : Win32cr::Security::NetworkAccessProtection::FailureCategory
    property fixupInfo : Win32cr::Security::NetworkAccessProtection::FixupInfo
    def initialize(@id : UInt32, @shaResultCodes : Win32cr::Security::NetworkAccessProtection::ResultCodes, @failureCategory : Win32cr::Security::NetworkAccessProtection::FailureCategory, @fixupInfo : Win32cr::Security::NetworkAccessProtection::FixupInfo)
    end
  end

  @[Extern]
  struct SoHAttribute
    property type__ : UInt16
    property size : UInt16
    property value : UInt8*
    def initialize(@type__ : UInt16, @size : UInt16, @value : UInt8*)
    end
  end

  @[Extern]
  struct SoH
    property count : UInt16
    property attributes : Win32cr::Security::NetworkAccessProtection::SoHAttribute*
    def initialize(@count : UInt16, @attributes : Win32cr::Security::NetworkAccessProtection::SoHAttribute*)
    end
  end

  @[Extern]
  struct NetworkSoH
    property size : UInt16
    property data : UInt8*
    def initialize(@size : UInt16, @data : UInt8*)
    end
  end

  @[Extern]
  struct PrivateData
    property size : UInt16
    property data : UInt8*
    def initialize(@size : UInt16, @data : UInt8*)
    end
  end

  @[Extern]
  struct NapComponentRegistrationInfo
    property id : UInt32
    property friendlyName : Win32cr::Security::NetworkAccessProtection::CountedString
    property description : Win32cr::Security::NetworkAccessProtection::CountedString
    property version : Win32cr::Security::NetworkAccessProtection::CountedString
    property vendorName : Win32cr::Security::NetworkAccessProtection::CountedString
    property infoClsid : LibC::GUID
    property configClsid : LibC::GUID
    property registrationDate : Win32cr::Foundation::FILETIME
    property componentType : UInt32
    def initialize(@id : UInt32, @friendlyName : Win32cr::Security::NetworkAccessProtection::CountedString, @description : Win32cr::Security::NetworkAccessProtection::CountedString, @version : Win32cr::Security::NetworkAccessProtection::CountedString, @vendorName : Win32cr::Security::NetworkAccessProtection::CountedString, @infoClsid : LibC::GUID, @configClsid : LibC::GUID, @registrationDate : Win32cr::Foundation::FILETIME, @componentType : UInt32)
    end
  end

end