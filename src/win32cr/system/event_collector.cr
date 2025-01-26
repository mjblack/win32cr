require "./../foundation.cr"

module Win32cr::System::EventCollector
  EC_VARIANT_TYPE_MASK = 127_u32
  EC_VARIANT_TYPE_ARRAY = 128_u32
  EC_READ_ACCESS = 1_u32
  EC_WRITE_ACCESS = 2_u32
  EC_OPEN_ALWAYS = 0_u32
  EC_CREATE_NEW = 1_u32
  EC_OPEN_EXISTING = 2_u32

  enum EC_SUBSCRIPTION_PROPERTY_ID
    EcSubscriptionEnabled = 0_i32
    EcSubscriptionEventSources = 1_i32
    EcSubscriptionEventSourceAddress = 2_i32
    EcSubscriptionEventSourceEnabled = 3_i32
    EcSubscriptionEventSourceUserName = 4_i32
    EcSubscriptionEventSourcePassword = 5_i32
    EcSubscriptionDescription = 6_i32
    EcSubscriptionURI = 7_i32
    EcSubscriptionConfigurationMode = 8_i32
    EcSubscriptionExpires = 9_i32
    EcSubscriptionQuery = 10_i32
    EcSubscriptionTransportName = 11_i32
    EcSubscriptionTransportPort = 12_i32
    EcSubscriptionDeliveryMode = 13_i32
    EcSubscriptionDeliveryMaxItems = 14_i32
    EcSubscriptionDeliveryMaxLatencyTime = 15_i32
    EcSubscriptionHeartbeatInterval = 16_i32
    EcSubscriptionLocale = 17_i32
    EcSubscriptionContentFormat = 18_i32
    EcSubscriptionLogFile = 19_i32
    EcSubscriptionPublisherName = 20_i32
    EcSubscriptionCredentialsType = 21_i32
    EcSubscriptionCommonUserName = 22_i32
    EcSubscriptionCommonPassword = 23_i32
    EcSubscriptionHostName = 24_i32
    EcSubscriptionReadExistingEvents = 25_i32
    EcSubscriptionDialect = 26_i32
    EcSubscriptionType = 27_i32
    EcSubscriptionAllowedIssuerCAs = 28_i32
    EcSubscriptionAllowedSubjects = 29_i32
    EcSubscriptionDeniedSubjects = 30_i32
    EcSubscriptionAllowedSourceDomainComputers = 31_i32
    EcSubscriptionPropertyIdEND = 32_i32
  end
  enum EC_SUBSCRIPTION_CREDENTIALS_TYPE
    EcSubscriptionCredDefault = 0_i32
    EcSubscriptionCredNegotiate = 1_i32
    EcSubscriptionCredDigest = 2_i32
    EcSubscriptionCredBasic = 3_i32
    EcSubscriptionCredLocalMachine = 4_i32
  end
  enum EC_SUBSCRIPTION_TYPE
    EcSubscriptionTypeSourceInitiated = 0_i32
    EcSubscriptionTypeCollectorInitiated = 1_i32
  end
  enum EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID
    EcSubscriptionRunTimeStatusActive = 0_i32
    EcSubscriptionRunTimeStatusLastError = 1_i32
    EcSubscriptionRunTimeStatusLastErrorMessage = 2_i32
    EcSubscriptionRunTimeStatusLastErrorTime = 3_i32
    EcSubscriptionRunTimeStatusNextRetryTime = 4_i32
    EcSubscriptionRunTimeStatusEventSources = 5_i32
    EcSubscriptionRunTimeStatusLastHeartbeatTime = 6_i32
    EcSubscriptionRunTimeStatusInfoIdEND = 7_i32
  end
  enum EC_VARIANT_TYPE
    EcVarTypeNull = 0_i32
    EcVarTypeBoolean = 1_i32
    EcVarTypeUInt32 = 2_i32
    EcVarTypeDateTime = 3_i32
    EcVarTypeString = 4_i32
    EcVarObjectArrayPropertyHandle = 5_i32
  end
  enum EC_SUBSCRIPTION_CONFIGURATION_MODE
    EcConfigurationModeNormal = 0_i32
    EcConfigurationModeCustom = 1_i32
    EcConfigurationModeMinLatency = 2_i32
    EcConfigurationModeMinBandwidth = 3_i32
  end
  enum EC_SUBSCRIPTION_DELIVERY_MODE
    EcDeliveryModePull = 1_i32
    EcDeliveryModePush = 2_i32
  end
  enum EC_SUBSCRIPTION_CONTENT_FORMAT
    EcContentFormatEvents = 1_i32
    EcContentFormatRenderedText = 2_i32
  end
  enum EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS
    EcRuntimeStatusActiveStatusDisabled = 1_i32
    EcRuntimeStatusActiveStatusActive = 2_i32
    EcRuntimeStatusActiveStatusInactive = 3_i32
    EcRuntimeStatusActiveStatusTrying = 4_i32
  end

  @[Extern]
  struct EC_VARIANT
    property anonymous : Anonymous_e__Union_
    property count : UInt32
    property type__ : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property boolean_val : Win32cr::Foundation::BOOL
    property u_int32_val : UInt32
    property date_time_val : UInt64
    property string_val : Win32cr::Foundation::PWSTR
    property binary_val : UInt8*
    property boolean_arr : Win32cr::Foundation::BOOL*
    property int32_arr : Int32*
    property string_arr : Win32cr::Foundation::PWSTR*
    property property_handle_val : LibC::IntPtrT
    def initialize(@boolean_val : Win32cr::Foundation::BOOL, @u_int32_val : UInt32, @date_time_val : UInt64, @string_val : Win32cr::Foundation::PWSTR, @binary_val : UInt8*, @boolean_arr : Win32cr::Foundation::BOOL*, @int32_arr : Int32*, @string_arr : Win32cr::Foundation::PWSTR*, @property_handle_val : LibC::IntPtrT)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @count : UInt32, @type__ : UInt32)
    end
  end

  @[Link("wecapi")]
  lib C
    fun EcOpenSubscriptionEnum(flags : UInt32) : LibC::IntPtrT

    fun EcEnumNextSubscription(subscription_enum : LibC::IntPtrT, subscription_name_buffer_size : UInt32, subscription_name_buffer : UInt16*, subscription_name_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EcOpenSubscription(subscription_name : Win32cr::Foundation::PWSTR, access_mask : UInt32, flags : UInt32) : LibC::IntPtrT

    fun EcSetSubscriptionProperty(subscription : LibC::IntPtrT, property_id : Win32cr::System::EventCollector::EC_SUBSCRIPTION_PROPERTY_ID, flags : UInt32, property_value : Win32cr::System::EventCollector::EC_VARIANT*) : Win32cr::Foundation::BOOL

    fun EcGetSubscriptionProperty(subscription : LibC::IntPtrT, property_id : Win32cr::System::EventCollector::EC_SUBSCRIPTION_PROPERTY_ID, flags : UInt32, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventCollector::EC_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EcSaveSubscription(subscription : LibC::IntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EcDeleteSubscription(subscription_name : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EcGetObjectArraySize(object_array : LibC::IntPtrT, object_array_size : UInt32*) : Win32cr::Foundation::BOOL

    fun EcSetObjectArrayProperty(object_array : LibC::IntPtrT, property_id : Win32cr::System::EventCollector::EC_SUBSCRIPTION_PROPERTY_ID, array_index : UInt32, flags : UInt32, property_value : Win32cr::System::EventCollector::EC_VARIANT*) : Win32cr::Foundation::BOOL

    fun EcGetObjectArrayProperty(object_array : LibC::IntPtrT, property_id : Win32cr::System::EventCollector::EC_SUBSCRIPTION_PROPERTY_ID, array_index : UInt32, flags : UInt32, property_value_buffer_size : UInt32, property_value_buffer : Win32cr::System::EventCollector::EC_VARIANT*, property_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EcInsertObjectArrayElement(object_array : LibC::IntPtrT, array_index : UInt32) : Win32cr::Foundation::BOOL

    fun EcRemoveObjectArrayElement(object_array : LibC::IntPtrT, array_index : UInt32) : Win32cr::Foundation::BOOL

    fun EcGetSubscriptionRunTimeStatus(subscription_name : Win32cr::Foundation::PWSTR, status_info_id : Win32cr::System::EventCollector::EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID, event_source_name : Win32cr::Foundation::PWSTR, flags : UInt32, status_value_buffer_size : UInt32, status_value_buffer : Win32cr::System::EventCollector::EC_VARIANT*, status_value_buffer_used : UInt32*) : Win32cr::Foundation::BOOL

    fun EcRetrySubscription(subscription_name : Win32cr::Foundation::PWSTR, event_source_name : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::Foundation::BOOL

    fun EcClose(object : LibC::IntPtrT) : Win32cr::Foundation::BOOL

  end
end