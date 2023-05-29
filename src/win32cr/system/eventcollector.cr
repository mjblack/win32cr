require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wecapi.dll")]
lib LibWin32
  EC_VARIANT_TYPE_MASK = 127_u32
  EC_VARIANT_TYPE_ARRAY = 128_u32
  EC_READ_ACCESS = 1_u32
  EC_WRITE_ACCESS = 2_u32
  EC_OPEN_ALWAYS = 0_u32
  EC_CREATE_NEW = 1_u32
  EC_OPEN_EXISTING = 2_u32


  enum EC_SUBSCRIPTION_PROPERTY_ID : Int32
    EcSubscriptionEnabled = 0
    EcSubscriptionEventSources = 1
    EcSubscriptionEventSourceAddress = 2
    EcSubscriptionEventSourceEnabled = 3
    EcSubscriptionEventSourceUserName = 4
    EcSubscriptionEventSourcePassword = 5
    EcSubscriptionDescription = 6
    EcSubscriptionURI = 7
    EcSubscriptionConfigurationMode = 8
    EcSubscriptionExpires = 9
    EcSubscriptionQuery = 10
    EcSubscriptionTransportName = 11
    EcSubscriptionTransportPort = 12
    EcSubscriptionDeliveryMode = 13
    EcSubscriptionDeliveryMaxItems = 14
    EcSubscriptionDeliveryMaxLatencyTime = 15
    EcSubscriptionHeartbeatInterval = 16
    EcSubscriptionLocale = 17
    EcSubscriptionContentFormat = 18
    EcSubscriptionLogFile = 19
    EcSubscriptionPublisherName = 20
    EcSubscriptionCredentialsType = 21
    EcSubscriptionCommonUserName = 22
    EcSubscriptionCommonPassword = 23
    EcSubscriptionHostName = 24
    EcSubscriptionReadExistingEvents = 25
    EcSubscriptionDialect = 26
    EcSubscriptionType = 27
    EcSubscriptionAllowedIssuerCAs = 28
    EcSubscriptionAllowedSubjects = 29
    EcSubscriptionDeniedSubjects = 30
    EcSubscriptionAllowedSourceDomainComputers = 31
    EcSubscriptionPropertyIdEND = 32
  end

  enum EC_SUBSCRIPTION_CREDENTIALS_TYPE : Int32
    EcSubscriptionCredDefault = 0
    EcSubscriptionCredNegotiate = 1
    EcSubscriptionCredDigest = 2
    EcSubscriptionCredBasic = 3
    EcSubscriptionCredLocalMachine = 4
  end

  enum EC_SUBSCRIPTION_TYPE : Int32
    EcSubscriptionTypeSourceInitiated = 0
    EcSubscriptionTypeCollectorInitiated = 1
  end

  enum EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID : Int32
    EcSubscriptionRunTimeStatusActive = 0
    EcSubscriptionRunTimeStatusLastError = 1
    EcSubscriptionRunTimeStatusLastErrorMessage = 2
    EcSubscriptionRunTimeStatusLastErrorTime = 3
    EcSubscriptionRunTimeStatusNextRetryTime = 4
    EcSubscriptionRunTimeStatusEventSources = 5
    EcSubscriptionRunTimeStatusLastHeartbeatTime = 6
    EcSubscriptionRunTimeStatusInfoIdEND = 7
  end

  enum EC_VARIANT_TYPE : Int32
    EcVarTypeNull = 0
    EcVarTypeBoolean = 1
    EcVarTypeUInt32 = 2
    EcVarTypeDateTime = 3
    EcVarTypeString = 4
    EcVarObjectArrayPropertyHandle = 5
  end

  enum EC_SUBSCRIPTION_CONFIGURATION_MODE : Int32
    EcConfigurationModeNormal = 0
    EcConfigurationModeCustom = 1
    EcConfigurationModeMinLatency = 2
    EcConfigurationModeMinBandwidth = 3
  end

  enum EC_SUBSCRIPTION_DELIVERY_MODE : Int32
    EcDeliveryModePull = 1
    EcDeliveryModePush = 2
  end

  enum EC_SUBSCRIPTION_CONTENT_FORMAT : Int32
    EcContentFormatEvents = 1
    EcContentFormatRenderedText = 2
  end

  enum EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS : Int32
    EcRuntimeStatusActiveStatusDisabled = 1
    EcRuntimeStatusActiveStatusActive = 2
    EcRuntimeStatusActiveStatusInactive = 3
    EcRuntimeStatusActiveStatusTrying = 4
  end

  union EC_VARIANT_Anonymous_e__Union
    boolean_val : LibC::BOOL
    u_int32_val : UInt32
    date_time_val : UInt64
    string_val : LibC::LPWSTR
    binary_val : UInt8*
    boolean_arr : LibC::BOOL*
    int32_arr : Int32*
    string_arr : LibC::LPWSTR*
    property_handle_val : LibC::IntPtrT
  end

  struct EC_VARIANT
    anonymous : EC_VARIANT_Anonymous_e__Union
    count : UInt32
    type : UInt32
  end


  # Params # flags : UInt32 [In]
  fun EcOpenSubscriptionEnum(flags : UInt32) : LibC::IntPtrT

  # Params # subscriptionenum : LibC::IntPtrT [In],subscriptionnamebuffersize : UInt32 [In],subscriptionnamebuffer : Char* [In],subscriptionnamebufferused : UInt32* [In]
  fun EcEnumNextSubscription(subscriptionenum : LibC::IntPtrT, subscriptionnamebuffersize : UInt32, subscriptionnamebuffer : Char*, subscriptionnamebufferused : UInt32*) : LibC::BOOL

  # Params # subscriptionname : LibC::LPWSTR [In],accessmask : UInt32 [In],flags : UInt32 [In]
  fun EcOpenSubscription(subscriptionname : LibC::LPWSTR, accessmask : UInt32, flags : UInt32) : LibC::IntPtrT

  # Params # subscription : LibC::IntPtrT [In],propertyid : EC_SUBSCRIPTION_PROPERTY_ID [In],flags : UInt32 [In],propertyvalue : EC_VARIANT* [In]
  fun EcSetSubscriptionProperty(subscription : LibC::IntPtrT, propertyid : EC_SUBSCRIPTION_PROPERTY_ID, flags : UInt32, propertyvalue : EC_VARIANT*) : LibC::BOOL

  # Params # subscription : LibC::IntPtrT [In],propertyid : EC_SUBSCRIPTION_PROPERTY_ID [In],flags : UInt32 [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EC_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EcGetSubscriptionProperty(subscription : LibC::IntPtrT, propertyid : EC_SUBSCRIPTION_PROPERTY_ID, flags : UInt32, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EC_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # subscription : LibC::IntPtrT [In],flags : UInt32 [In]
  fun EcSaveSubscription(subscription : LibC::IntPtrT, flags : UInt32) : LibC::BOOL

  # Params # subscriptionname : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EcDeleteSubscription(subscriptionname : LibC::LPWSTR, flags : UInt32) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],objectarraysize : UInt32* [In]
  fun EcGetObjectArraySize(objectarray : LibC::IntPtrT, objectarraysize : UInt32*) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],propertyid : EC_SUBSCRIPTION_PROPERTY_ID [In],arrayindex : UInt32 [In],flags : UInt32 [In],propertyvalue : EC_VARIANT* [In]
  fun EcSetObjectArrayProperty(objectarray : LibC::IntPtrT, propertyid : EC_SUBSCRIPTION_PROPERTY_ID, arrayindex : UInt32, flags : UInt32, propertyvalue : EC_VARIANT*) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],propertyid : EC_SUBSCRIPTION_PROPERTY_ID [In],arrayindex : UInt32 [In],flags : UInt32 [In],propertyvaluebuffersize : UInt32 [In],propertyvaluebuffer : EC_VARIANT* [In],propertyvaluebufferused : UInt32* [In]
  fun EcGetObjectArrayProperty(objectarray : LibC::IntPtrT, propertyid : EC_SUBSCRIPTION_PROPERTY_ID, arrayindex : UInt32, flags : UInt32, propertyvaluebuffersize : UInt32, propertyvaluebuffer : EC_VARIANT*, propertyvaluebufferused : UInt32*) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],arrayindex : UInt32 [In]
  fun EcInsertObjectArrayElement(objectarray : LibC::IntPtrT, arrayindex : UInt32) : LibC::BOOL

  # Params # objectarray : LibC::IntPtrT [In],arrayindex : UInt32 [In]
  fun EcRemoveObjectArrayElement(objectarray : LibC::IntPtrT, arrayindex : UInt32) : LibC::BOOL

  # Params # subscriptionname : LibC::LPWSTR [In],statusinfoid : EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID [In],eventsourcename : LibC::LPWSTR [In],flags : UInt32 [In],statusvaluebuffersize : UInt32 [In],statusvaluebuffer : EC_VARIANT* [In],statusvaluebufferused : UInt32* [In]
  fun EcGetSubscriptionRunTimeStatus(subscriptionname : LibC::LPWSTR, statusinfoid : EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID, eventsourcename : LibC::LPWSTR, flags : UInt32, statusvaluebuffersize : UInt32, statusvaluebuffer : EC_VARIANT*, statusvaluebufferused : UInt32*) : LibC::BOOL

  # Params # subscriptionname : LibC::LPWSTR [In],eventsourcename : LibC::LPWSTR [In],flags : UInt32 [In]
  fun EcRetrySubscription(subscriptionname : LibC::LPWSTR, eventsourcename : LibC::LPWSTR, flags : UInt32) : LibC::BOOL

  # Params # object : LibC::IntPtrT [In]
  fun EcClose(object : LibC::IntPtrT) : LibC::BOOL
end
