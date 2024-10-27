require "./../system/com.cr"
require "./../foundation.cr"
require "./../ui/shell/properties_system.cr"
require "./../system/com/structured_storage.cr"
require "./sensors.cr"

module Win32cr::Devices::Geolocation
  GNSS_DRIVER_VERSION_1 = 1_u32
  GNSS_DRIVER_VERSION_2 = 2_u32
  GNSS_DRIVER_VERSION_3 = 3_u32
  GNSS_DRIVER_VERSION_4 = 4_u32
  GNSS_DRIVER_VERSION_5 = 5_u32
  GNSS_DRIVER_VERSION_6 = 6_u32
  IOCTL_GNSS_SEND_PLATFORM_CAPABILITY = 2228228_u32
  IOCTL_GNSS_GET_DEVICE_CAPABILITY = 2228232_u32
  IOCTL_GNSS_SEND_DRIVERCOMMAND = 2228236_u32
  IOCTL_GNSS_START_FIXSESSION = 2228288_u32
  IOCTL_GNSS_MODIFY_FIXSESSION = 2228292_u32
  IOCTL_GNSS_STOP_FIXSESSION = 2228296_u32
  IOCTL_GNSS_GET_FIXDATA = 2228300_u32
  IOCTL_GNSS_INJECT_AGNSS = 2228352_u32
  IOCTL_GNSS_LISTEN_AGNSS = 2228416_u32
  IOCTL_GNSS_LISTEN_ERROR = 2228420_u32
  IOCTL_GNSS_LISTEN_NI = 2228480_u32
  IOCTL_GNSS_SET_SUPL_HSLP = 2228484_u32
  IOCTL_GNSS_CONFIG_SUPL_CERT = 2228488_u32
  IOCTL_GNSS_RESPOND_NI = 2228492_u32
  IOCTL_GNSS_EXECUTE_CWTEST = 2228496_u32
  IOCTL_GNSS_EXECUTE_SELFTEST = 2228500_u32
  IOCTL_GNSS_GET_CHIPSETINFO = 2228504_u32
  IOCTL_GNSS_LISTEN_NMEA = 2228508_u32
  IOCTL_GNSS_SET_V2UPL_CONFIG = 2228512_u32
  IOCTL_GNSS_CREATE_GEOFENCE = 2228544_u32
  IOCTL_GNSS_DELETE_GEOFENCE = 2228548_u32
  IOCTL_GNSS_LISTEN_GEOFENCE_ALERT = 2228552_u32
  IOCTL_GNSS_LISTEN_GEOFENCES_TRACKINGSTATUS = 2228556_u32
  IOCTL_GNSS_LISTEN_DRIVER_REQUEST = 2228608_u32
  IOCTL_GNSS_START_BREADCRUMBING = 2228672_u32
  IOCTL_GNSS_STOP_BREADCRUMBING = 2228676_u32
  IOCTL_GNSS_LISTEN_BREADCRUMBING_ALERT = 2228680_u32
  IOCTL_GNSS_POP_BREADCRUMBS = 2228684_u32
  GNSS_AGNSSFORMAT_XTRA1 = 1_u32
  GNSS_AGNSSFORMAT_XTRA2 = 2_u32
  GNSS_AGNSSFORMAT_LTO = 4_u32
  GNSS_AGNSSFORMAT_XTRA3 = 8_u32
  GNSS_AGNSSFORMAT_XTRA3_1 = 16_u32
  GNSS_AGNSSFORMAT_XTRA3_2 = 32_u32
  GNSS_AGNSSFORMAT_XTRA_INT = 64_u32
  MAX_SERVER_URL_NAME = 260_u32
  MIN_GEOFENCES_REQUIRED = 100_u32
  BREADCRUMBING_UNSUPPORTED = 0_u32
  BREADCRUMBING_VERSION_1 = 1_u32
  MIN_BREADCRUMBS_SUPPORTED = 120_u32
  GNSS_SATELLITE_ANY = 0_u32
  GNSS_SATELLITE_GPS = 1_u32
  GNSS_SATELLITE_GLONASS = 2_u32
  GNSS_SATELLITE_BEIDOU = 4_u32
  GNSS_SATELLITE_GALILEO = 8_u32
  GNSS_OPERMODE_ANY = 0_u32
  GNSS_OPERMODE_MSA = 1_u32
  GNSS_OPERMODE_MSB = 2_u32
  GNSS_OPERMODE_MSS = 4_u32
  GNSS_OPERMODE_CELLID = 8_u32
  GNSS_OPERMODE_AFLT = 16_u32
  GNSS_OPERMODE_OTDOA = 32_u32
  GNSS_NMEALOGGING_NONE = 0_u32
  GNSS_NMEALOGGING_ALL = 255_u32
  GNSS_FIXDETAIL_BASIC = 1_u32
  GNSS_FIXDETAIL_ACCURACY = 2_u32
  GNSS_FIXDETAIL_SATELLITE = 4_u32
  GNSS_MAXSATELLITE = 64_u32
  GNSS_GEOFENCESUPPORT_SUPPORTED = 1_u32
  GNSS_GEOFENCESUPPORT_CIRCLE = 2_u32
  LOCATION_API_VERSION = 1_u32
  GUID_DEVINTERFACE_GNSS = "3336e5e4-018a-4669-84c5-bd05f3bd368b"

  CLSID_Location = LibC::GUID.new(0xe5b8e079_u32, 0xee6d_u16, 0x4e33_u16, StaticArray[0xa4_u8, 0x38_u8, 0xc8_u8, 0x7f_u8, 0x2e_u8, 0x95_u8, 0x92_u8, 0x54_u8])

  CLSID_DefaultLocation = LibC::GUID.new(0x8b7fbfe0_u32, 0x5cd7_u16, 0x494a_u16, StaticArray[0xaf_u8, 0x8c_u8, 0x28_u8, 0x3a_u8, 0x65_u8, 0x70_u8, 0x75_u8, 0x6_u8])

  CLSID_LatLongReport = LibC::GUID.new(0xed81c073_u32, 0x1f84_u16, 0x4ca8_u16, StaticArray[0xa1_u8, 0x61_u8, 0x18_u8, 0x3c_u8, 0x77_u8, 0x6b_u8, 0xc6_u8, 0x51_u8])

  CLSID_CivicAddressReport = LibC::GUID.new(0xd39e7bdd_u32, 0x7d05_u16, 0x46b8_u16, StaticArray[0x87_u8, 0x21_u8, 0x80_u8, 0xcf_u8, 0x3_u8, 0x5f_u8, 0x57_u8, 0xd7_u8])

  CLSID_LatLongReportFactory = LibC::GUID.new(0x9dcc3cc8_u32, 0x8609_u16, 0x4863_u16, StaticArray[0xba_u8, 0xd4_u8, 0x3_u8, 0x60_u8, 0x1f_u8, 0x4c_u8, 0x65_u8, 0xe8_u8])

  CLSID_CivicAddressReportFactory = LibC::GUID.new(0x2a11f42c_u32, 0x3e81_u16, 0x4ad4_u16, StaticArray[0x9c_u8, 0xbe_u8, 0x45_u8, 0x57_u8, 0x9d_u8, 0x89_u8, 0x67_u8, 0x1a_u8])

  CLSID_DispLatLongReport = LibC::GUID.new(0x7a7c3277_u32, 0x8f84_u16, 0x4636_u16, StaticArray[0x95_u8, 0xb2_u8, 0xeb_u8, 0xb5_u8, 0x50_u8, 0x7f_u8, 0xf7_u8, 0x7e_u8])

  CLSID_DispCivicAddressReport = LibC::GUID.new(0x4c596aec_u32, 0x8544_u16, 0x4082_u16, StaticArray[0xba_u8, 0x9f_u8, 0xeb_u8, 0xa_u8, 0x7d_u8, 0x8e_u8, 0x65_u8, 0xc6_u8])

  enum LOCATION_REPORT_STATUS
    REPORT_NOT_SUPPORTED = 0_i32
    REPORT_ERROR = 1_i32
    REPORT_ACCESS_DENIED = 2_i32
    REPORT_INITIALIZING = 3_i32
    REPORT_RUNNING = 4_i32
  end
  enum GNSS_DRIVERCOMMAND_TYPE
    GNSS_SetLocationServiceEnabled = 1_i32
    GNSS_SetLocationNIRequestAllowed = 2_i32
    GNSS_ForceSatelliteSystem = 3_i32
    GNSS_ForceOperationMode = 4_i32
    GNSS_ResetEngine = 9_i32
    GNSS_ClearAgnssData = 10_i32
    GNSS_SetSuplVersion = 12_i32
    GNSS_SetNMEALogging = 13_i32
    GNSS_SetUplServerAccessInterval = 14_i32
    GNSS_SetNiTimeoutInterval = 15_i32
    GNSS_ResetGeofencesTracking = 16_i32
    GNSS_SetSuplVersion2 = 17_i32
    GNSS_CustomCommand = 256_i32
  end
  enum GNSS_FIXSESSIONTYPE
    GNSS_FixSession_SingleShot = 1_i32
    GNSS_FixSession_DistanceTracking = 2_i32
    GNSS_FixSession_ContinuousTracking = 3_i32
    GNSS_FixSession_LKG = 4_i32
  end
  enum GNSS_GEOREGIONTYPE
    GNSS_GeoRegion_Circle = 1_i32
  end
  enum GNSS_GEOFENCE_STATE
    GNSS_GeofenceState_Unknown = 0_i32
    GNSS_GeofenceState_Entered = 1_i32
    GNSS_GeofenceState_Exited = 2_i32
  end
  enum GNSS_EVENT_TYPE
    GNSS_Event_FixAvailable = 1_i32
    GNSS_Event_RequireAgnss = 2_i32
    GNSS_Event_Error = 3_i32
    GNSS_Event_NiRequest = 12_i32
    GNSS_Event_NmeaData = 13_i32
    GNSS_Event_GeofenceAlertData = 14_i32
    GNSS_Event_GeofencesTrackingStatus = 15_i32
    GNSS_Event_DriverRequest = 16_i32
    GNSS_Event_BreadcrumbAlertEvent = 17_i32
    GNSS_Event_FixAvailable_2 = 18_i32
    GNSS_Event_Custom = 32768_i32
  end
  enum GNSS_AGNSS_REQUEST_TYPE
    GNSS_AGNSS_TimeInjection = 1_i32
    GNSS_AGNSS_PositionInjection = 2_i32
    GNSS_AGNSS_BlobInjection = 3_i32
  end
  enum GNSS_NI_PLANE_TYPE
    GNSS_NI_SUPL = 1_i32
    GNSS_NI_CP = 2_i32
    GNSS_NI_V2UPL = 3_i32
  end
  enum GNSS_NI_REQUEST_TYPE
    GNSS_NI_Request_SingleShot = 1_i32
    GNSS_NI_Request_AreaTrigger = 2_i32
  end
  enum GNSS_NI_NOTIFICATION_TYPE
    GNSS_NI_NoNotifyNoVerify = 1_i32
    GNSS_NI_NotifyOnly = 2_i32
    GNSS_NI_NotifyVerifyDefaultAllow = 3_i32
    GNSS_NI_NotifyVerifyDefaultNotAllow = 4_i32
    GNSS_NI_PrivacyOverride = 5_i32
  end
  enum GNSS_DRIVER_REQUEST
    SUPL_CONFIG_DATA = 1_i32
  end
  enum GNSS_SUPL_CERT_ACTION
    GNSS_Supl_Cert_Inject = 1_i32
    GNSS_Supl_Cert_Delete = 2_i32
    GNSS_Supl_Cert_Purge = 3_i32
  end
  enum GNSS_NI_USER_RESPONSE
    GNSS_Ni_UserResponseAccept = 1_i32
    GNSS_Ni_UserResponseDeny = 2_i32
    GNSS_Ni_UserResponseTimeout = 3_i32
  end

  @[Extern]
  record GNSS_SUPL_VERSION,
    major_version : UInt32,
    minor_version : UInt32

  @[Extern]
  record GNSS_SUPL_VERSION_2,
    major_version : UInt32,
    minor_version : UInt32,
    service_indicator : UInt32

  @[Extern]
  record GNSS_DEVICE_CAPABILITY,
    size : UInt32,
    version : UInt32,
    support_multiple_fix_sessions : Win32cr::Foundation::BOOL,
    support_multiple_app_sessions : Win32cr::Foundation::BOOL,
    require_a_gnss_injection : Win32cr::Foundation::BOOL,
    agnss_format_supported : UInt32,
    agnss_format_preferred : UInt32,
    support_distance_tracking : Win32cr::Foundation::BOOL,
    support_continuous_tracking : Win32cr::Foundation::BOOL,
    reserved1 : UInt32,
    reserved2 : Win32cr::Foundation::BOOL,
    reserved3 : Win32cr::Foundation::BOOL,
    reserved4 : Win32cr::Foundation::BOOL,
    reserved5 : Win32cr::Foundation::BOOL,
    geofencing_support : UInt32,
    reserved6 : Win32cr::Foundation::BOOL,
    reserved7 : Win32cr::Foundation::BOOL,
    support_cp_location : Win32cr::Foundation::BOOL,
    support_upl_v2 : Win32cr::Foundation::BOOL,
    support_supl_v1 : Win32cr::Foundation::BOOL,
    support_supl_v2 : Win32cr::Foundation::BOOL,
    supported_supl_version : Win32cr::Devices::Geolocation::GNSS_SUPL_VERSION,
    max_geofences_supported : UInt32,
    support_multiple_supl_root_cert : Win32cr::Foundation::BOOL,
    gnss_bread_crumb_payload_version : UInt32,
    max_gnss_bread_crumb_fixes : UInt32,
    unused : UInt8[496]

  @[Extern]
  record GNSS_PLATFORM_CAPABILITY,
    size : UInt32,
    version : UInt32,
    support_agnss_injection : Win32cr::Foundation::BOOL,
    agnss_format_supported : UInt32,
    unused : UInt8[516]

  @[Extern]
  record GNSS_DRIVERCOMMAND_PARAM,
    size : UInt32,
    version : UInt32,
    command_type : Win32cr::Devices::Geolocation::GNSS_DRIVERCOMMAND_TYPE,
    reserved : UInt32,
    command_data_size : UInt32,
    unused : UInt8[512],
    command_data : UInt8*

  @[Extern]
  record GNSS_SINGLESHOT_PARAM,
    size : UInt32,
    version : UInt32,
    response_time : UInt32

  @[Extern]
  record GNSS_DISTANCETRACKING_PARAM,
    size : UInt32,
    version : UInt32,
    movement_threshold : UInt32

  @[Extern]
  record GNSS_CONTINUOUSTRACKING_PARAM,
    size : UInt32,
    version : UInt32,
    preferred_interval : UInt32

  @[Extern]
  record GNSS_LKGFIX_PARAM,
    size : UInt32,
    version : UInt32

  @[Extern]
  record GNSS_FIXSESSION_PARAM,
    size : UInt32,
    version : UInt32,
    fix_session_id : UInt32,
    session_type : Win32cr::Devices::Geolocation::GNSS_FIXSESSIONTYPE,
    horizontal_accuracy : UInt32,
    horizontal_confidence : UInt32,
    reserved : UInt32[9],
    fix_level_of_details : UInt32,
    anonymous : Anonymous_e__Union,
    unused : UInt8[256] do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      single_shot_param : Win32cr::Devices::Geolocation::GNSS_SINGLESHOT_PARAM,
      distance_param : Win32cr::Devices::Geolocation::GNSS_DISTANCETRACKING_PARAM,
      continuous_param : Win32cr::Devices::Geolocation::GNSS_CONTINUOUSTRACKING_PARAM,
      lkg_fix_param : Win32cr::Devices::Geolocation::GNSS_LKGFIX_PARAM,
      unused_param : UInt8[268]

  end

  @[Extern]
  record GNSS_STOPFIXSESSION_PARAM,
    size : UInt32,
    version : UInt32,
    fix_session_id : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_FIXDATA_BASIC,
    size : UInt32,
    version : UInt32,
    latitude : Float64,
    longitude : Float64,
    altitude : Float64,
    speed : Float64,
    heading : Float64

  @[Extern]
  record GNSS_FIXDATA_BASIC_2,
    size : UInt32,
    version : UInt32,
    latitude : Float64,
    longitude : Float64,
    altitude : Float64,
    speed : Float64,
    heading : Float64,
    altitude_ellipsoid : Float64

  @[Extern]
  record GNSS_FIXDATA_ACCURACY,
    size : UInt32,
    version : UInt32,
    horizontal_accuracy : UInt32,
    horizontal_error_major_axis : UInt32,
    horizontal_error_minor_axis : UInt32,
    horizontal_error_angle : UInt32,
    heading_accuracy : UInt32,
    altitude_accuracy : UInt32,
    speed_accuracy : UInt32,
    horizontal_confidence : UInt32,
    heading_confidence : UInt32,
    altitude_confidence : UInt32,
    speed_confidence : UInt32,
    position_dilution_of_precision : Float32,
    horizontal_dilution_of_precision : Float32,
    vertical_dilution_of_precision : Float32

  @[Extern]
  record GNSS_FIXDATA_ACCURACY_2,
    size : UInt32,
    version : UInt32,
    horizontal_accuracy : Float64,
    horizontal_error_major_axis : Float64,
    horizontal_error_minor_axis : Float64,
    horizontal_error_angle : Float64,
    heading_accuracy : Float64,
    altitude_accuracy : Float64,
    speed_accuracy : Float64,
    horizontal_confidence : UInt32,
    heading_confidence : UInt32,
    altitude_confidence : UInt32,
    speed_confidence : UInt32,
    position_dilution_of_precision : Float64,
    horizontal_dilution_of_precision : Float64,
    vertical_dilution_of_precision : Float64,
    geometric_dilution_of_precision : Float64,
    time_dilution_of_precision : Float64

  @[Extern]
  record GNSS_SATELLITEINFO,
    satellite_id : UInt32,
    used_in_positiong : Win32cr::Foundation::BOOL,
    elevation : Float64,
    azimuth : Float64,
    signal_to_noise_ratio : Float64

  @[Extern]
  record GNSS_FIXDATA_SATELLITE,
    size : UInt32,
    version : UInt32,
    satellite_count : UInt32,
    satellite_array : Win32cr::Devices::Geolocation::GNSS_SATELLITEINFO[64]

  @[Extern]
  record GNSS_FIXDATA,
    size : UInt32,
    version : UInt32,
    fix_session_id : UInt32,
    fix_time_stamp : Win32cr::Foundation::FILETIME,
    is_final_fix : Win32cr::Foundation::BOOL,
    fix_status : Win32cr::Foundation::NTSTATUS,
    fix_level_of_details : UInt32,
    basic_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_BASIC,
    accuracy_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_ACCURACY,
    satellite_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_SATELLITE

  @[Extern]
  record GNSS_FIXDATA_2,
    size : UInt32,
    version : UInt32,
    fix_session_id : UInt32,
    fix_time_stamp : Win32cr::Foundation::FILETIME,
    is_final_fix : Win32cr::Foundation::BOOL,
    fix_status : Win32cr::Foundation::NTSTATUS,
    fix_level_of_details : UInt32,
    basic_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_BASIC_2,
    accuracy_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_ACCURACY_2,
    satellite_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_SATELLITE

  @[Extern]
  record GNSS_BREADCRUMBING_PARAM,
    size : UInt32,
    version : UInt32,
    maximum_horizontal_uncertainty : UInt32,
    min_distance_between_fixes : UInt32,
    maximum_error_timeout_ms : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_BREADCRUMBING_ALERT_DATA,
    size : UInt32,
    version : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_BREADCRUMB_V1,
    fix_time_stamp : Win32cr::Foundation::FILETIME,
    latitude : Float64,
    longitude : Float64,
    horizontal_accuracy : UInt32,
    speed : UInt16,
    speed_accuracy : UInt16,
    altitude : Int16,
    altitude_accuracy : UInt16,
    heading : Int16,
    heading_accuracy : UInt8,
    fix_success : UInt8

  @[Extern]
  record GNSS_BREADCRUMB_LIST,
    size : UInt32,
    version : UInt32,
    num_crumbs : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      v1 : Win32cr::Devices::Geolocation::GNSS_BREADCRUMB_V1[50]

  end

  @[Extern]
  record GNSS_GEOREGION_CIRCLE,
    latitude : Float64,
    longitude : Float64,
    radius_in_meters : Float64

  @[Extern]
  record GNSS_GEOREGION,
    size : UInt32,
    version : UInt32,
    geo_region_type : Win32cr::Devices::Geolocation::GNSS_GEOREGIONTYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      circle : Win32cr::Devices::Geolocation::GNSS_GEOREGION_CIRCLE,
      unused : UInt8[512]

  end

  @[Extern]
  record GNSS_GEOFENCE_CREATE_PARAM,
    size : UInt32,
    version : UInt32,
    alert_types : UInt32,
    initial_state : Win32cr::Devices::Geolocation::GNSS_GEOFENCE_STATE,
    boundary : Win32cr::Devices::Geolocation::GNSS_GEOREGION,
    unused : UInt8[512]

  @[Extern]
  record GNSS_GEOFENCE_CREATE_RESPONSE,
    size : UInt32,
    version : UInt32,
    creation_status : Win32cr::Foundation::NTSTATUS,
    geofence_id : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_GEOFENCE_DELETE_PARAM,
    size : UInt32,
    version : UInt32,
    geofence_id : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_GEOFENCE_ALERT_DATA,
    size : UInt32,
    version : UInt32,
    geofence_id : UInt32,
    geofence_state : Win32cr::Devices::Geolocation::GNSS_GEOFENCE_STATE,
    fix_basic_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_BASIC,
    fix_accuracy_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_ACCURACY,
    unused : UInt8[512]

  @[Extern]
  record GNSS_GEOFENCES_TRACKINGSTATUS_DATA,
    size : UInt32,
    version : UInt32,
    status : Win32cr::Foundation::NTSTATUS,
    status_time_stamp : Win32cr::Foundation::FILETIME,
    unused : UInt8[512]

  @[Extern]
  record GNSS_ERRORINFO,
    size : UInt32,
    version : UInt32,
    error_code : UInt32,
    is_recoverable : Win32cr::Foundation::BOOL,
    error_description : UInt16[256],
    unused : UInt8[512]

  @[Extern]
  record GNSS_NMEA_DATA,
    size : UInt32,
    version : UInt32,
    nmea_sentences : Win32cr::Foundation::CHAR[256]

  @[Extern]
  record GNSS_AGNSS_REQUEST_PARAM,
    size : UInt32,
    version : UInt32,
    request_type : Win32cr::Devices::Geolocation::GNSS_AGNSS_REQUEST_TYPE,
    blob_format : UInt32

  @[Extern]
  record GNSS_SUPL_NI_INFO,
    size : UInt32,
    version : UInt32,
    requestor_id : UInt16[260],
    client_name : UInt16[260],
    supl_ni_url : Win32cr::Foundation::CHAR[260]

  @[Extern]
  record GNSS_CP_NI_INFO,
    size : UInt32,
    version : UInt32,
    requestor_id : UInt16[260],
    notification_text : UInt16[260]

  @[Extern]
  record GNSS_V2UPL_NI_INFO,
    size : UInt32,
    version : UInt32,
    requestor_id : UInt16[260]

  @[Extern]
  record GNSS_NI_REQUEST_PARAM,
    size : UInt32,
    version : UInt32,
    request_id : UInt32,
    request_type : Win32cr::Devices::Geolocation::GNSS_NI_REQUEST_TYPE,
    notification_type : Win32cr::Devices::Geolocation::GNSS_NI_NOTIFICATION_TYPE,
    request_plane_type : Win32cr::Devices::Geolocation::GNSS_NI_PLANE_TYPE,
    anonymous : Anonymous_e__Union,
    response_time_in_sec : UInt32,
    emergency_location : Win32cr::Foundation::BOOL do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      supl_ni_info : Win32cr::Devices::Geolocation::GNSS_SUPL_NI_INFO,
      cp_ni_info : Win32cr::Devices::Geolocation::GNSS_CP_NI_INFO,
      v2_upl_ni_info : Win32cr::Devices::Geolocation::GNSS_V2UPL_NI_INFO

  end

  @[Extern]
  record GNSS_DRIVER_REQUEST_DATA,
    size : UInt32,
    version : UInt32,
    request : Win32cr::Devices::Geolocation::GNSS_DRIVER_REQUEST,
    request_flag : UInt32

  @[Extern]
  record GNSS_EVENT,
    size : UInt32,
    version : UInt32,
    event_type : Win32cr::Devices::Geolocation::GNSS_EVENT_TYPE,
    event_data_size : UInt32,
    unused : UInt8[512],
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      fix_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA,
      agnss_request : Win32cr::Devices::Geolocation::GNSS_AGNSS_REQUEST_PARAM,
      ni_request : Win32cr::Devices::Geolocation::GNSS_NI_REQUEST_PARAM,
      error_information : Win32cr::Devices::Geolocation::GNSS_ERRORINFO,
      nmea_data : Win32cr::Devices::Geolocation::GNSS_NMEA_DATA,
      geofence_alert_data : Win32cr::Devices::Geolocation::GNSS_GEOFENCE_ALERT_DATA,
      breadcrumb_alert_data : Win32cr::Devices::Geolocation::GNSS_BREADCRUMBING_ALERT_DATA,
      geofences_tracking_status : Win32cr::Devices::Geolocation::GNSS_GEOFENCES_TRACKINGSTATUS_DATA,
      driver_request_data : Win32cr::Devices::Geolocation::GNSS_DRIVER_REQUEST_DATA,
      custom_data : UInt8*

  end

  @[Extern]
  record GNSS_EVENT_2,
    size : UInt32,
    version : UInt32,
    event_type : Win32cr::Devices::Geolocation::GNSS_EVENT_TYPE,
    event_data_size : UInt32,
    unused : UInt8[512],
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      fix_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA,
      fix_data2 : Win32cr::Devices::Geolocation::GNSS_FIXDATA_2,
      agnss_request : Win32cr::Devices::Geolocation::GNSS_AGNSS_REQUEST_PARAM,
      ni_request : Win32cr::Devices::Geolocation::GNSS_NI_REQUEST_PARAM,
      error_information : Win32cr::Devices::Geolocation::GNSS_ERRORINFO,
      nmea_data : Win32cr::Devices::Geolocation::GNSS_NMEA_DATA,
      geofence_alert_data : Win32cr::Devices::Geolocation::GNSS_GEOFENCE_ALERT_DATA,
      breadcrumb_alert_data : Win32cr::Devices::Geolocation::GNSS_BREADCRUMBING_ALERT_DATA,
      geofences_tracking_status : Win32cr::Devices::Geolocation::GNSS_GEOFENCES_TRACKINGSTATUS_DATA,
      driver_request_data : Win32cr::Devices::Geolocation::GNSS_DRIVER_REQUEST_DATA,
      custom_data : UInt8*

  end

  @[Extern]
  record GNSS_AGNSS_INJECTTIME,
    size : UInt32,
    version : UInt32,
    utc_time : Win32cr::Foundation::FILETIME,
    time_uncertainty : UInt32

  @[Extern]
  record GNSS_AGNSS_INJECTPOSITION,
    size : UInt32,
    version : UInt32,
    age : UInt32,
    basic_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_BASIC,
    accuracy_data : Win32cr::Devices::Geolocation::GNSS_FIXDATA_ACCURACY

  @[Extern]
  record GNSS_AGNSS_INJECTBLOB,
    size : UInt32,
    version : UInt32,
    blob_oui : UInt32,
    blob_version : UInt32,
    agnss_format : UInt32,
    blob_size : UInt32,
    blob_data : UInt8*

  @[Extern]
  record GNSS_AGNSS_INJECT,
    size : UInt32,
    version : UInt32,
    injection_type : Win32cr::Devices::Geolocation::GNSS_AGNSS_REQUEST_TYPE,
    injection_status : Win32cr::Foundation::NTSTATUS,
    injection_data_size : UInt32,
    unused : UInt8[512],
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      time : Win32cr::Devices::Geolocation::GNSS_AGNSS_INJECTTIME,
      position : Win32cr::Devices::Geolocation::GNSS_AGNSS_INJECTPOSITION,
      blob_data : Win32cr::Devices::Geolocation::GNSS_AGNSS_INJECTBLOB

  end

  @[Extern]
  record GNSS_SUPL_HSLP_CONFIG,
    size : UInt32,
    version : UInt32,
    supl_hslp : Win32cr::Foundation::CHAR[260],
    supl_hslp_from_imsi : Win32cr::Foundation::CHAR[260],
    reserved : UInt32,
    unused : UInt8[512]

  @[Extern]
  record GNSS_SUPL_CERT_CONFIG,
    size : UInt32,
    version : UInt32,
    cert_action : Win32cr::Devices::Geolocation::GNSS_SUPL_CERT_ACTION,
    supl_cert_name : Win32cr::Foundation::CHAR[260],
    cert_size : UInt32,
    unused : UInt8[512],
    cert_data : UInt8*

  @[Extern]
  record GNSS_V2UPL_CONFIG,
    size : UInt32,
    version : UInt32,
    mpc : Win32cr::Foundation::CHAR[260],
    pde : Win32cr::Foundation::CHAR[260],
    application_type_indicator_mr : UInt8,
    unused : UInt8[512]

  @[Extern]
  record GNSS_NI_RESPONSE,
    size : UInt32,
    version : UInt32,
    request_id : UInt32,
    user_response : Win32cr::Devices::Geolocation::GNSS_NI_USER_RESPONSE

  @[Extern]
  record GNSS_CWTESTDATA,
    size : UInt32,
    version : UInt32,
    test_result_status : Win32cr::Foundation::NTSTATUS,
    signal_to_noise_ratio : Float64,
    frequency : Float64,
    unused : UInt8[512]

  @[Extern]
  record GNSS_SELFTESTCONFIG,
    size : UInt32,
    version : UInt32,
    test_type : UInt32,
    unused : UInt8[512],
    in_buf_len : UInt32,
    in_buffer : UInt8*

  @[Extern]
  record GNSS_SELFTESTRESULT,
    size : UInt32,
    version : UInt32,
    test_result_status : Win32cr::Foundation::NTSTATUS,
    result : UInt32,
    pin_failed_bit_mask : UInt32,
    unused : UInt8[512],
    out_buf_len : UInt32,
    out_buffer : UInt8*

  @[Extern]
  record GNSS_CHIPSETINFO,
    size : UInt32,
    version : UInt32,
    manufacturer_id : UInt16[25],
    hardware_id : UInt16[25],
    firmware_version : UInt16[20],
    unused : UInt8[512]

  @[Extern]
  record ILocationReportVtbl,
    query_interface : Proc(ILocationReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationReport*, UInt32),
    release : Proc(ILocationReport*, UInt32),
    get_sensor_id : Proc(ILocationReport*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_timestamp : Proc(ILocationReport*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ILocationReport*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c8b7f7ee-75d0-4db9-b62d-7a0f369ca456")]
  record ILocationReport, lpVtbl : ILocationReportVtbl* do
    GUID = LibC::GUID.new(0xc8b7f7ee_u32, 0x75d0_u16, 0x4db9_u16, StaticArray[0xb6_u8, 0x2d_u8, 0x7a_u8, 0xf_u8, 0x36_u8, 0x9c_u8, 0xa4_u8, 0x56_u8])
    def query_interface(this : ILocationReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocationReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocationReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sensor_id(this : ILocationReport*, pSensorID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_id.call(this, pSensorID)
    end
    def get_timestamp(this : ILocationReport*, pCreationTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timestamp.call(this, pCreationTime)
    end
    def get_value(this : ILocationReport*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pKey, pValue)
    end

  end

  @[Extern]
  record ILatLongReportVtbl,
    query_interface : Proc(ILatLongReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILatLongReport*, UInt32),
    release : Proc(ILatLongReport*, UInt32),
    get_sensor_id : Proc(ILatLongReport*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_timestamp : Proc(ILatLongReport*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ILatLongReport*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_latitude : Proc(ILatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_longitude : Proc(ILatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_error_radius : Proc(ILatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_altitude : Proc(ILatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_altitude_error : Proc(ILatLongReport*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7fed806d-0ef8-4f07-80ac-36a0beae3134")]
  record ILatLongReport, lpVtbl : ILatLongReportVtbl* do
    GUID = LibC::GUID.new(0x7fed806d_u32, 0xef8_u16, 0x4f07_u16, StaticArray[0x80_u8, 0xac_u8, 0x36_u8, 0xa0_u8, 0xbe_u8, 0xae_u8, 0x31_u8, 0x34_u8])
    def query_interface(this : ILatLongReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILatLongReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILatLongReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sensor_id(this : ILatLongReport*, pSensorID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_id.call(this, pSensorID)
    end
    def get_timestamp(this : ILatLongReport*, pCreationTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timestamp.call(this, pCreationTime)
    end
    def get_value(this : ILatLongReport*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pKey, pValue)
    end
    def get_latitude(this : ILatLongReport*, pLatitude : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_latitude.call(this, pLatitude)
    end
    def get_longitude(this : ILatLongReport*, pLongitude : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_longitude.call(this, pLongitude)
    end
    def get_error_radius(this : ILatLongReport*, pErrorRadius : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_radius.call(this, pErrorRadius)
    end
    def get_altitude(this : ILatLongReport*, pAltitude : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_altitude.call(this, pAltitude)
    end
    def get_altitude_error(this : ILatLongReport*, pAltitudeError : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_altitude_error.call(this, pAltitudeError)
    end

  end

  @[Extern]
  record ICivicAddressReportVtbl,
    query_interface : Proc(ICivicAddressReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICivicAddressReport*, UInt32),
    release : Proc(ICivicAddressReport*, UInt32),
    get_sensor_id : Proc(ICivicAddressReport*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_timestamp : Proc(ICivicAddressReport*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ICivicAddressReport*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_address_line1 : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_address_line2 : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_city : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_state_province : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_postal_code : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_country_region : Proc(ICivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_detail_level : Proc(ICivicAddressReport*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c0b19f70-4adf-445d-87f2-cad8fd711792")]
  record ICivicAddressReport, lpVtbl : ICivicAddressReportVtbl* do
    GUID = LibC::GUID.new(0xc0b19f70_u32, 0x4adf_u16, 0x445d_u16, StaticArray[0x87_u8, 0xf2_u8, 0xca_u8, 0xd8_u8, 0xfd_u8, 0x71_u8, 0x17_u8, 0x92_u8])
    def query_interface(this : ICivicAddressReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICivicAddressReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICivicAddressReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sensor_id(this : ICivicAddressReport*, pSensorID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_id.call(this, pSensorID)
    end
    def get_timestamp(this : ICivicAddressReport*, pCreationTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timestamp.call(this, pCreationTime)
    end
    def get_value(this : ICivicAddressReport*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pKey, pValue)
    end
    def get_address_line1(this : ICivicAddressReport*, pbstrAddress1 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_address_line1.call(this, pbstrAddress1)
    end
    def get_address_line2(this : ICivicAddressReport*, pbstrAddress2 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_address_line2.call(this, pbstrAddress2)
    end
    def get_city(this : ICivicAddressReport*, pbstrCity : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_city.call(this, pbstrCity)
    end
    def get_state_province(this : ICivicAddressReport*, pbstrStateProvince : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state_province.call(this, pbstrStateProvince)
    end
    def get_postal_code(this : ICivicAddressReport*, pbstrPostalCode : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_postal_code.call(this, pbstrPostalCode)
    end
    def get_country_region(this : ICivicAddressReport*, pbstrCountryRegion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_country_region.call(this, pbstrCountryRegion)
    end
    def get_detail_level(this : ICivicAddressReport*, pDetailLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_detail_level.call(this, pDetailLevel)
    end

  end

  @[Extern]
  record ILocationVtbl,
    query_interface : Proc(ILocation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocation*, UInt32),
    release : Proc(ILocation*, UInt32),
    register_for_report : Proc(ILocation*, Void*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    unregister_for_report : Proc(ILocation*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_report : Proc(ILocation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_report_status : Proc(ILocation*, LibC::GUID*, Win32cr::Devices::Geolocation::LOCATION_REPORT_STATUS*, Win32cr::Foundation::HRESULT),
    get_report_interval : Proc(ILocation*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    set_report_interval : Proc(ILocation*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    get_desired_accuracy : Proc(ILocation*, LibC::GUID*, Win32cr::Devices::Sensors::LOCATION_DESIRED_ACCURACY*, Win32cr::Foundation::HRESULT),
    set_desired_accuracy : Proc(ILocation*, LibC::GUID*, Win32cr::Devices::Sensors::LOCATION_DESIRED_ACCURACY, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ILocation*, Win32cr::Foundation::HWND, LibC::GUID*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ab2ece69-56d9-4f28-b525-de1b0ee44237")]
  record ILocation, lpVtbl : ILocationVtbl* do
    GUID = LibC::GUID.new(0xab2ece69_u32, 0x56d9_u16, 0x4f28_u16, StaticArray[0xb5_u8, 0x25_u8, 0xde_u8, 0x1b_u8, 0xe_u8, 0xe4_u8, 0x42_u8, 0x37_u8])
    def query_interface(this : ILocation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_for_report(this : ILocation*, pEvents : Void*, reportType : LibC::GUID*, dwRequestedReportInterval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_for_report.call(this, pEvents, reportType, dwRequestedReportInterval)
    end
    def unregister_for_report(this : ILocation*, reportType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_for_report.call(this, reportType)
    end
    def get_report(this : ILocation*, reportType : LibC::GUID*, ppLocationReport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report.call(this, reportType, ppLocationReport)
    end
    def get_report_status(this : ILocation*, reportType : LibC::GUID*, pStatus : Win32cr::Devices::Geolocation::LOCATION_REPORT_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report_status.call(this, reportType, pStatus)
    end
    def get_report_interval(this : ILocation*, reportType : LibC::GUID*, pMilliseconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report_interval.call(this, reportType, pMilliseconds)
    end
    def set_report_interval(this : ILocation*, reportType : LibC::GUID*, millisecondsRequested : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_report_interval.call(this, reportType, millisecondsRequested)
    end
    def get_desired_accuracy(this : ILocation*, reportType : LibC::GUID*, pDesiredAccuracy : Win32cr::Devices::Sensors::LOCATION_DESIRED_ACCURACY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desired_accuracy.call(this, reportType, pDesiredAccuracy)
    end
    def set_desired_accuracy(this : ILocation*, reportType : LibC::GUID*, desiredAccuracy : Win32cr::Devices::Sensors::LOCATION_DESIRED_ACCURACY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desired_accuracy.call(this, reportType, desiredAccuracy)
    end
    def request_permissions(this : ILocation*, hParent : Win32cr::Foundation::HWND, pReportTypes : LibC::GUID*, count : UInt32, fModal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_permissions.call(this, hParent, pReportTypes, count, fModal)
    end

  end

  @[Extern]
  record ILocationPowerVtbl,
    query_interface : Proc(ILocationPower*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationPower*, UInt32),
    release : Proc(ILocationPower*, UInt32),
    connect : Proc(ILocationPower*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(ILocationPower*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("193e7729-ab6b-4b12-8617-7596e1bb191c")]
  record ILocationPower, lpVtbl : ILocationPowerVtbl* do
    GUID = LibC::GUID.new(0x193e7729_u32, 0xab6b_u16, 0x4b12_u16, StaticArray[0x86_u8, 0x17_u8, 0x75_u8, 0x96_u8, 0xe1_u8, 0xbb_u8, 0x19_u8, 0x1c_u8])
    def query_interface(this : ILocationPower*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocationPower*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocationPower*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect(this : ILocationPower*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this)
    end
    def disconnect(this : ILocationPower*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end

  end

  @[Extern]
  record IDefaultLocationVtbl,
    query_interface : Proc(IDefaultLocation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDefaultLocation*, UInt32),
    release : Proc(IDefaultLocation*, UInt32),
    set_report : Proc(IDefaultLocation*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_report : Proc(IDefaultLocation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a65af77e-969a-4a2e-8aca-33bb7cbb1235")]
  record IDefaultLocation, lpVtbl : IDefaultLocationVtbl* do
    GUID = LibC::GUID.new(0xa65af77e_u32, 0x969a_u16, 0x4a2e_u16, StaticArray[0x8a_u8, 0xca_u8, 0x33_u8, 0xbb_u8, 0x7c_u8, 0xbb_u8, 0x12_u8, 0x35_u8])
    def query_interface(this : IDefaultLocation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDefaultLocation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDefaultLocation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_report(this : IDefaultLocation*, reportType : LibC::GUID*, pLocationReport : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_report.call(this, reportType, pLocationReport)
    end
    def get_report(this : IDefaultLocation*, reportType : LibC::GUID*, ppLocationReport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report.call(this, reportType, ppLocationReport)
    end

  end

  @[Extern]
  record ILocationEventsVtbl,
    query_interface : Proc(ILocationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationEvents*, UInt32),
    release : Proc(ILocationEvents*, UInt32),
    on_location_changed : Proc(ILocationEvents*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    on_status_changed : Proc(ILocationEvents*, LibC::GUID*, Win32cr::Devices::Geolocation::LOCATION_REPORT_STATUS, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cae02bbf-798b-4508-a207-35a7906dc73d")]
  record ILocationEvents, lpVtbl : ILocationEventsVtbl* do
    GUID = LibC::GUID.new(0xcae02bbf_u32, 0x798b_u16, 0x4508_u16, StaticArray[0xa2_u8, 0x7_u8, 0x35_u8, 0xa7_u8, 0x90_u8, 0x6d_u8, 0xc7_u8, 0x3d_u8])
    def query_interface(this : ILocationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_location_changed(this : ILocationEvents*, reportType : LibC::GUID*, pLocationReport : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_location_changed.call(this, reportType, pLocationReport)
    end
    def on_status_changed(this : ILocationEvents*, reportType : LibC::GUID*, newStatus : Win32cr::Devices::Geolocation::LOCATION_REPORT_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_changed.call(this, reportType, newStatus)
    end

  end

  @[Extern]
  record IDispLatLongReportVtbl,
    query_interface : Proc(IDispLatLongReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDispLatLongReport*, UInt32),
    release : Proc(IDispLatLongReport*, UInt32),
    get_type_info_count : Proc(IDispLatLongReport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDispLatLongReport*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDispLatLongReport*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDispLatLongReport*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Latitude : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_Longitude : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_ErrorRadius : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_Altitude : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_AltitudeError : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT),
    get_Timestamp : Proc(IDispLatLongReport*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8ae32723-389b-4a11-9957-5bdd48fc9617")]
  record IDispLatLongReport, lpVtbl : IDispLatLongReportVtbl* do
    GUID = LibC::GUID.new(0x8ae32723_u32, 0x389b_u16, 0x4a11_u16, StaticArray[0x99_u8, 0x57_u8, 0x5b_u8, 0xdd_u8, 0x48_u8, 0xfc_u8, 0x96_u8, 0x17_u8])
    def query_interface(this : IDispLatLongReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDispLatLongReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDispLatLongReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDispLatLongReport*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDispLatLongReport*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDispLatLongReport*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDispLatLongReport*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Latitude(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Latitude.call(this, pVal)
    end
    def get_Longitude(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Longitude.call(this, pVal)
    end
    def get_ErrorRadius(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ErrorRadius.call(this, pVal)
    end
    def get_Altitude(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Altitude.call(this, pVal)
    end
    def get_AltitudeError(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AltitudeError.call(this, pVal)
    end
    def get_Timestamp(this : IDispLatLongReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timestamp.call(this, pVal)
    end

  end

  @[Extern]
  record IDispCivicAddressReportVtbl,
    query_interface : Proc(IDispCivicAddressReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDispCivicAddressReport*, UInt32),
    release : Proc(IDispCivicAddressReport*, UInt32),
    get_type_info_count : Proc(IDispCivicAddressReport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDispCivicAddressReport*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDispCivicAddressReport*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDispCivicAddressReport*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AddressLine1 : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AddressLine2 : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_City : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_StateProvince : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PostalCode : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CountryRegion : Proc(IDispCivicAddressReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DetailLevel : Proc(IDispCivicAddressReport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Timestamp : Proc(IDispCivicAddressReport*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("16ff1a34-9e30-42c3-b44d-e22513b5767a")]
  record IDispCivicAddressReport, lpVtbl : IDispCivicAddressReportVtbl* do
    GUID = LibC::GUID.new(0x16ff1a34_u32, 0x9e30_u16, 0x42c3_u16, StaticArray[0xb4_u8, 0x4d_u8, 0xe2_u8, 0x25_u8, 0x13_u8, 0xb5_u8, 0x76_u8, 0x7a_u8])
    def query_interface(this : IDispCivicAddressReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDispCivicAddressReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDispCivicAddressReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDispCivicAddressReport*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDispCivicAddressReport*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDispCivicAddressReport*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDispCivicAddressReport*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AddressLine1(this : IDispCivicAddressReport*, pAddress1 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AddressLine1.call(this, pAddress1)
    end
    def get_AddressLine2(this : IDispCivicAddressReport*, pAddress2 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AddressLine2.call(this, pAddress2)
    end
    def get_City(this : IDispCivicAddressReport*, pCity : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_City.call(this, pCity)
    end
    def get_StateProvince(this : IDispCivicAddressReport*, pStateProvince : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StateProvince.call(this, pStateProvince)
    end
    def get_PostalCode(this : IDispCivicAddressReport*, pPostalCode : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PostalCode.call(this, pPostalCode)
    end
    def get_CountryRegion(this : IDispCivicAddressReport*, pCountryRegion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CountryRegion.call(this, pCountryRegion)
    end
    def get_DetailLevel(this : IDispCivicAddressReport*, pDetailLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DetailLevel.call(this, pDetailLevel)
    end
    def get_Timestamp(this : IDispCivicAddressReport*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timestamp.call(this, pVal)
    end

  end

  @[Extern]
  record ILocationReportFactoryVtbl,
    query_interface : Proc(ILocationReportFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationReportFactory*, UInt32),
    release : Proc(ILocationReportFactory*, UInt32),
    get_type_info_count : Proc(ILocationReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILocationReportFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILocationReportFactory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ILocationReportFactory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    listen_for_reports : Proc(ILocationReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    stop_listening_for_reports : Proc(ILocationReportFactory*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ILocationReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ReportInterval : Proc(ILocationReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ReportInterval : Proc(ILocationReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    get_DesiredAccuracy : Proc(ILocationReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_DesiredAccuracy : Proc(ILocationReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ILocationReportFactory*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2daec322-90b2-47e4-bb08-0da841935a6b")]
  record ILocationReportFactory, lpVtbl : ILocationReportFactoryVtbl* do
    GUID = LibC::GUID.new(0x2daec322_u32, 0x90b2_u16, 0x47e4_u16, StaticArray[0xbb_u8, 0x8_u8, 0xd_u8, 0xa8_u8, 0x41_u8, 0x93_u8, 0x5a_u8, 0x6b_u8])
    def query_interface(this : ILocationReportFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocationReportFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocationReportFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILocationReportFactory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILocationReportFactory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILocationReportFactory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ILocationReportFactory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def listen_for_reports(this : ILocationReportFactory*, requestedReportInterval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_for_reports.call(this, requestedReportInterval)
    end
    def stop_listening_for_reports(this : ILocationReportFactory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listening_for_reports.call(this)
    end
    def get_Status(this : ILocationReportFactory*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pVal)
    end
    def get_ReportInterval(this : ILocationReportFactory*, pMilliseconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportInterval.call(this, pMilliseconds)
    end
    def put_ReportInterval(this : ILocationReportFactory*, millisecondsRequested : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportInterval.call(this, millisecondsRequested)
    end
    def get_DesiredAccuracy(this : ILocationReportFactory*, pDesiredAccuracy : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredAccuracy.call(this, pDesiredAccuracy)
    end
    def put_DesiredAccuracy(this : ILocationReportFactory*, desiredAccuracy : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredAccuracy.call(this, desiredAccuracy)
    end
    def request_permissions(this : ILocationReportFactory*, hWnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_permissions.call(this, hWnd)
    end

  end

  @[Extern]
  record ILatLongReportFactoryVtbl,
    query_interface : Proc(ILatLongReportFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILatLongReportFactory*, UInt32),
    release : Proc(ILatLongReportFactory*, UInt32),
    get_type_info_count : Proc(ILatLongReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILatLongReportFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILatLongReportFactory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ILatLongReportFactory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    listen_for_reports : Proc(ILatLongReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    stop_listening_for_reports : Proc(ILatLongReportFactory*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ILatLongReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ReportInterval : Proc(ILatLongReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ReportInterval : Proc(ILatLongReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    get_DesiredAccuracy : Proc(ILatLongReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_DesiredAccuracy : Proc(ILatLongReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ILatLongReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LatLongReport : Proc(ILatLongReportFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3f0804cb-b114-447d-83dd-390174ebb082")]
  record ILatLongReportFactory, lpVtbl : ILatLongReportFactoryVtbl* do
    GUID = LibC::GUID.new(0x3f0804cb_u32, 0xb114_u16, 0x447d_u16, StaticArray[0x83_u8, 0xdd_u8, 0x39_u8, 0x1_u8, 0x74_u8, 0xeb_u8, 0xb0_u8, 0x82_u8])
    def query_interface(this : ILatLongReportFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILatLongReportFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILatLongReportFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILatLongReportFactory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILatLongReportFactory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILatLongReportFactory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ILatLongReportFactory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def listen_for_reports(this : ILatLongReportFactory*, requestedReportInterval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_for_reports.call(this, requestedReportInterval)
    end
    def stop_listening_for_reports(this : ILatLongReportFactory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listening_for_reports.call(this)
    end
    def get_Status(this : ILatLongReportFactory*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pVal)
    end
    def get_ReportInterval(this : ILatLongReportFactory*, pMilliseconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportInterval.call(this, pMilliseconds)
    end
    def put_ReportInterval(this : ILatLongReportFactory*, millisecondsRequested : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportInterval.call(this, millisecondsRequested)
    end
    def get_DesiredAccuracy(this : ILatLongReportFactory*, pDesiredAccuracy : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredAccuracy.call(this, pDesiredAccuracy)
    end
    def put_DesiredAccuracy(this : ILatLongReportFactory*, desiredAccuracy : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredAccuracy.call(this, desiredAccuracy)
    end
    def request_permissions(this : ILatLongReportFactory*, hWnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_permissions.call(this, hWnd)
    end
    def get_LatLongReport(this : ILatLongReportFactory*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatLongReport.call(this, pVal)
    end

  end

  @[Extern]
  record ICivicAddressReportFactoryVtbl,
    query_interface : Proc(ICivicAddressReportFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICivicAddressReportFactory*, UInt32),
    release : Proc(ICivicAddressReportFactory*, UInt32),
    get_type_info_count : Proc(ICivicAddressReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICivicAddressReportFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICivicAddressReportFactory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICivicAddressReportFactory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    listen_for_reports : Proc(ICivicAddressReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    stop_listening_for_reports : Proc(ICivicAddressReportFactory*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(ICivicAddressReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ReportInterval : Proc(ICivicAddressReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ReportInterval : Proc(ICivicAddressReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    get_DesiredAccuracy : Proc(ICivicAddressReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    put_DesiredAccuracy : Proc(ICivicAddressReportFactory*, UInt32, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ICivicAddressReportFactory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CivicAddressReport : Proc(ICivicAddressReportFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bf773b93-c64f-4bee-beb2-67c0b8df66e0")]
  record ICivicAddressReportFactory, lpVtbl : ICivicAddressReportFactoryVtbl* do
    GUID = LibC::GUID.new(0xbf773b93_u32, 0xc64f_u16, 0x4bee_u16, StaticArray[0xbe_u8, 0xb2_u8, 0x67_u8, 0xc0_u8, 0xb8_u8, 0xdf_u8, 0x66_u8, 0xe0_u8])
    def query_interface(this : ICivicAddressReportFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICivicAddressReportFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICivicAddressReportFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICivicAddressReportFactory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICivicAddressReportFactory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICivicAddressReportFactory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICivicAddressReportFactory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def listen_for_reports(this : ICivicAddressReportFactory*, requestedReportInterval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_for_reports.call(this, requestedReportInterval)
    end
    def stop_listening_for_reports(this : ICivicAddressReportFactory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_listening_for_reports.call(this)
    end
    def get_Status(this : ICivicAddressReportFactory*, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pVal)
    end
    def get_ReportInterval(this : ICivicAddressReportFactory*, pMilliseconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportInterval.call(this, pMilliseconds)
    end
    def put_ReportInterval(this : ICivicAddressReportFactory*, millisecondsRequested : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportInterval.call(this, millisecondsRequested)
    end
    def get_DesiredAccuracy(this : ICivicAddressReportFactory*, pDesiredAccuracy : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredAccuracy.call(this, pDesiredAccuracy)
    end
    def put_DesiredAccuracy(this : ICivicAddressReportFactory*, desiredAccuracy : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredAccuracy.call(this, desiredAccuracy)
    end
    def request_permissions(this : ICivicAddressReportFactory*, hWnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_permissions.call(this, hWnd)
    end
    def get_CivicAddressReport(this : ICivicAddressReportFactory*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CivicAddressReport.call(this, pVal)
    end

  end

  @[Extern]
  record ILatLongReportFactoryEventsVtbl,
    query_interface : Proc(ILatLongReportFactoryEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILatLongReportFactoryEvents*, UInt32),
    release : Proc(ILatLongReportFactoryEvents*, UInt32),
    get_type_info_count : Proc(ILatLongReportFactoryEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILatLongReportFactoryEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILatLongReportFactoryEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ILatLongReportFactoryEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("16ee6cb7-ab3c-424b-849f-269be551fcbc")]
  record ILatLongReportFactoryEvents, lpVtbl : ILatLongReportFactoryEventsVtbl* do
    GUID = LibC::GUID.new(0x16ee6cb7_u32, 0xab3c_u16, 0x424b_u16, StaticArray[0x84_u8, 0x9f_u8, 0x26_u8, 0x9b_u8, 0xe5_u8, 0x51_u8, 0xfc_u8, 0xbc_u8])
    def query_interface(this : ILatLongReportFactoryEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILatLongReportFactoryEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILatLongReportFactoryEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILatLongReportFactoryEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILatLongReportFactoryEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILatLongReportFactoryEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ILatLongReportFactoryEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ICivicAddressReportFactoryEventsVtbl,
    query_interface : Proc(ICivicAddressReportFactoryEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICivicAddressReportFactoryEvents*, UInt32),
    release : Proc(ICivicAddressReportFactoryEvents*, UInt32),
    get_type_info_count : Proc(ICivicAddressReportFactoryEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICivicAddressReportFactoryEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICivicAddressReportFactoryEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICivicAddressReportFactoryEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c96039ff-72ec-4617-89bd-84d88bedc722")]
  record ICivicAddressReportFactoryEvents, lpVtbl : ICivicAddressReportFactoryEventsVtbl* do
    GUID = LibC::GUID.new(0xc96039ff_u32, 0x72ec_u16, 0x4617_u16, StaticArray[0x89_u8, 0xbd_u8, 0x84_u8, 0xd8_u8, 0x8b_u8, 0xed_u8, 0xc7_u8, 0x22_u8])
    def query_interface(this : ICivicAddressReportFactoryEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICivicAddressReportFactoryEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICivicAddressReportFactoryEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICivicAddressReportFactoryEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICivicAddressReportFactoryEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICivicAddressReportFactoryEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICivicAddressReportFactoryEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

end