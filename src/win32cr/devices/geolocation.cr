require "../system/com.cr"
require "../foundation.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"
require "../devices/sensors.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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


  enum LOCATION_REPORT_STATUS : Int32
    REPORT_NOT_SUPPORTED = 0
    REPORT_ERROR = 1
    REPORT_ACCESS_DENIED = 2
    REPORT_INITIALIZING = 3
    REPORT_RUNNING = 4
  end

  enum GNSS_DRIVERCOMMAND_TYPE : Int32
    GNSS_SetLocationServiceEnabled = 1
    GNSS_SetLocationNIRequestAllowed = 2
    GNSS_ForceSatelliteSystem = 3
    GNSS_ForceOperationMode = 4
    GNSS_ResetEngine = 9
    GNSS_ClearAgnssData = 10
    GNSS_SetSuplVersion = 12
    GNSS_SetNMEALogging = 13
    GNSS_SetUplServerAccessInterval = 14
    GNSS_SetNiTimeoutInterval = 15
    GNSS_ResetGeofencesTracking = 16
    GNSS_SetSuplVersion2 = 17
    GNSS_CustomCommand = 256
  end

  enum GNSS_FIXSESSIONTYPE : Int32
    GNSS_FixSession_SingleShot = 1
    GNSS_FixSession_DistanceTracking = 2
    GNSS_FixSession_ContinuousTracking = 3
    GNSS_FixSession_LKG = 4
  end

  enum GNSS_GEOREGIONTYPE : Int32
    GNSS_GeoRegion_Circle = 1
  end

  enum GNSS_GEOFENCE_STATE : Int32
    GNSS_GeofenceState_Unknown = 0
    GNSS_GeofenceState_Entered = 1
    GNSS_GeofenceState_Exited = 2
  end

  enum GNSS_EVENT_TYPE : Int32
    GNSS_Event_FixAvailable = 1
    GNSS_Event_RequireAgnss = 2
    GNSS_Event_Error = 3
    GNSS_Event_NiRequest = 12
    GNSS_Event_NmeaData = 13
    GNSS_Event_GeofenceAlertData = 14
    GNSS_Event_GeofencesTrackingStatus = 15
    GNSS_Event_DriverRequest = 16
    GNSS_Event_BreadcrumbAlertEvent = 17
    GNSS_Event_FixAvailable_2 = 18
    GNSS_Event_Custom = 32768
  end

  enum GNSS_AGNSS_REQUEST_TYPE : Int32
    GNSS_AGNSS_TimeInjection = 1
    GNSS_AGNSS_PositionInjection = 2
    GNSS_AGNSS_BlobInjection = 3
  end

  enum GNSS_NI_PLANE_TYPE : Int32
    GNSS_NI_SUPL = 1
    GNSS_NI_CP = 2
    GNSS_NI_V2UPL = 3
  end

  enum GNSS_NI_REQUEST_TYPE : Int32
    GNSS_NI_Request_SingleShot = 1
    GNSS_NI_Request_AreaTrigger = 2
  end

  enum GNSS_NI_NOTIFICATION_TYPE : Int32
    GNSS_NI_NoNotifyNoVerify = 1
    GNSS_NI_NotifyOnly = 2
    GNSS_NI_NotifyVerifyDefaultAllow = 3
    GNSS_NI_NotifyVerifyDefaultNotAllow = 4
    GNSS_NI_PrivacyOverride = 5
  end

  enum GNSS_DRIVER_REQUEST : Int32
    SUPL_CONFIG_DATA = 1
  end

  enum GNSS_SUPL_CERT_ACTION : Int32
    GNSS_Supl_Cert_Inject = 1
    GNSS_Supl_Cert_Delete = 2
    GNSS_Supl_Cert_Purge = 3
  end

  enum GNSS_NI_USER_RESPONSE : Int32
    GNSS_Ni_UserResponseAccept = 1
    GNSS_Ni_UserResponseDeny = 2
    GNSS_Ni_UserResponseTimeout = 3
  end

  union GNSS_FIXSESSION_PARAM_Anonymous_e__Union
    single_shot_param : GNSS_SINGLESHOT_PARAM
    distance_param : GNSS_DISTANCETRACKING_PARAM
    continuous_param : GNSS_CONTINUOUSTRACKING_PARAM
    lkg_fix_param : GNSS_LKGFIX_PARAM
    unused_param : UInt8[268]*
  end
  union GNSS_BREADCRUMB_LIST_Anonymous_e__Union
    v1 : GNSS_BREADCRUMB_V1[50]*
  end
  union GNSS_GEOREGION_Anonymous_e__Union
    circle : GNSS_GEOREGION_CIRCLE
    unused : UInt8[512]*
  end
  union GNSS_NI_REQUEST_PARAM_Anonymous_e__Union
    supl_ni_info : GNSS_SUPL_NI_INFO
    cp_ni_info : GNSS_CP_NI_INFO
    v2_upl_ni_info : GNSS_V2UPL_NI_INFO
  end
  union GNSS_EVENT_Anonymous_e__Union
    fix_data : GNSS_FIXDATA
    agnss_request : GNSS_AGNSS_REQUEST_PARAM
    ni_request : GNSS_NI_REQUEST_PARAM
    error_information : GNSS_ERRORINFO
    nmea_data : GNSS_NMEA_DATA
    geofence_alert_data : GNSS_GEOFENCE_ALERT_DATA
    breadcrumb_alert_data : GNSS_BREADCRUMBING_ALERT_DATA
    geofences_tracking_status : GNSS_GEOFENCES_TRACKINGSTATUS_DATA
    driver_request_data : GNSS_DRIVER_REQUEST_DATA
    custom_data : UInt8[0]*
  end
  union GNSS_EVENT_2_Anonymous_e__Union
    fix_data : GNSS_FIXDATA
    fix_data2 : GNSS_FIXDATA_2
    agnss_request : GNSS_AGNSS_REQUEST_PARAM
    ni_request : GNSS_NI_REQUEST_PARAM
    error_information : GNSS_ERRORINFO
    nmea_data : GNSS_NMEA_DATA
    geofence_alert_data : GNSS_GEOFENCE_ALERT_DATA
    breadcrumb_alert_data : GNSS_BREADCRUMBING_ALERT_DATA
    geofences_tracking_status : GNSS_GEOFENCES_TRACKINGSTATUS_DATA
    driver_request_data : GNSS_DRIVER_REQUEST_DATA
    custom_data : UInt8[0]*
  end
  union GNSS_AGNSS_INJECT_Anonymous_e__Union
    time : GNSS_AGNSS_INJECTTIME
    position : GNSS_AGNSS_INJECTPOSITION
    blob_data : GNSS_AGNSS_INJECTBLOB
  end

  struct GNSS_SUPL_VERSION
    major_version : UInt32
    minor_version : UInt32
  end
  struct GNSS_SUPL_VERSION_2
    major_version : UInt32
    minor_version : UInt32
    service_indicator : UInt32
  end
  struct GNSS_DEVICE_CAPABILITY
    size : UInt32
    version : UInt32
    support_multiple_fix_sessions : LibC::BOOL
    support_multiple_app_sessions : LibC::BOOL
    require_a_gnss_injection : LibC::BOOL
    agnss_format_supported : UInt32
    agnss_format_preferred : UInt32
    support_distance_tracking : LibC::BOOL
    support_continuous_tracking : LibC::BOOL
    reserved1 : UInt32
    reserved2 : LibC::BOOL
    reserved3 : LibC::BOOL
    reserved4 : LibC::BOOL
    reserved5 : LibC::BOOL
    geofencing_support : UInt32
    reserved6 : LibC::BOOL
    reserved7 : LibC::BOOL
    support_cp_location : LibC::BOOL
    support_upl_v2 : LibC::BOOL
    support_supl_v1 : LibC::BOOL
    support_supl_v2 : LibC::BOOL
    supported_supl_version : GNSS_SUPL_VERSION
    max_geofences_supported : UInt32
    support_multiple_supl_root_cert : LibC::BOOL
    gnss_bread_crumb_payload_version : UInt32
    max_gnss_bread_crumb_fixes : UInt32
    unused : UInt8[496]*
  end
  struct GNSS_PLATFORM_CAPABILITY
    size : UInt32
    version : UInt32
    support_agnss_injection : LibC::BOOL
    agnss_format_supported : UInt32
    unused : UInt8[516]*
  end
  struct GNSS_DRIVERCOMMAND_PARAM
    size : UInt32
    version : UInt32
    command_type : GNSS_DRIVERCOMMAND_TYPE
    reserved : UInt32
    command_data_size : UInt32
    unused : UInt8[512]*
    command_data : UInt8[0]*
  end
  struct GNSS_SINGLESHOT_PARAM
    size : UInt32
    version : UInt32
    response_time : UInt32
  end
  struct GNSS_DISTANCETRACKING_PARAM
    size : UInt32
    version : UInt32
    movement_threshold : UInt32
  end
  struct GNSS_CONTINUOUSTRACKING_PARAM
    size : UInt32
    version : UInt32
    preferred_interval : UInt32
  end
  struct GNSS_LKGFIX_PARAM
    size : UInt32
    version : UInt32
  end
  struct GNSS_FIXSESSION_PARAM
    size : UInt32
    version : UInt32
    fix_session_id : UInt32
    session_type : GNSS_FIXSESSIONTYPE
    horizontal_accuracy : UInt32
    horizontal_confidence : UInt32
    reserved : UInt32[9]*
    fix_level_of_details : UInt32
    anonymous : GNSS_FIXSESSION_PARAM_Anonymous_e__Union
    unused : UInt8[256]*
  end
  struct GNSS_STOPFIXSESSION_PARAM
    size : UInt32
    version : UInt32
    fix_session_id : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_FIXDATA_BASIC
    size : UInt32
    version : UInt32
    latitude : Float64
    longitude : Float64
    altitude : Float64
    speed : Float64
    heading : Float64
  end
  struct GNSS_FIXDATA_BASIC_2
    size : UInt32
    version : UInt32
    latitude : Float64
    longitude : Float64
    altitude : Float64
    speed : Float64
    heading : Float64
    altitude_ellipsoid : Float64
  end
  struct GNSS_FIXDATA_ACCURACY
    size : UInt32
    version : UInt32
    horizontal_accuracy : UInt32
    horizontal_error_major_axis : UInt32
    horizontal_error_minor_axis : UInt32
    horizontal_error_angle : UInt32
    heading_accuracy : UInt32
    altitude_accuracy : UInt32
    speed_accuracy : UInt32
    horizontal_confidence : UInt32
    heading_confidence : UInt32
    altitude_confidence : UInt32
    speed_confidence : UInt32
    position_dilution_of_precision : Float32
    horizontal_dilution_of_precision : Float32
    vertical_dilution_of_precision : Float32
  end
  struct GNSS_FIXDATA_ACCURACY_2
    size : UInt32
    version : UInt32
    horizontal_accuracy : Float64
    horizontal_error_major_axis : Float64
    horizontal_error_minor_axis : Float64
    horizontal_error_angle : Float64
    heading_accuracy : Float64
    altitude_accuracy : Float64
    speed_accuracy : Float64
    horizontal_confidence : UInt32
    heading_confidence : UInt32
    altitude_confidence : UInt32
    speed_confidence : UInt32
    position_dilution_of_precision : Float64
    horizontal_dilution_of_precision : Float64
    vertical_dilution_of_precision : Float64
    geometric_dilution_of_precision : Float64
    time_dilution_of_precision : Float64
  end
  struct GNSS_SATELLITEINFO
    satellite_id : UInt32
    used_in_positiong : LibC::BOOL
    elevation : Float64
    azimuth : Float64
    signal_to_noise_ratio : Float64
  end
  struct GNSS_FIXDATA_SATELLITE
    size : UInt32
    version : UInt32
    satellite_count : UInt32
    satellite_array : GNSS_SATELLITEINFO[64]*
  end
  struct GNSS_FIXDATA
    size : UInt32
    version : UInt32
    fix_session_id : UInt32
    fix_time_stamp : FILETIME
    is_final_fix : LibC::BOOL
    fix_status : NTSTATUS
    fix_level_of_details : UInt32
    basic_data : GNSS_FIXDATA_BASIC
    accuracy_data : GNSS_FIXDATA_ACCURACY
    satellite_data : GNSS_FIXDATA_SATELLITE
  end
  struct GNSS_FIXDATA_2
    size : UInt32
    version : UInt32
    fix_session_id : UInt32
    fix_time_stamp : FILETIME
    is_final_fix : LibC::BOOL
    fix_status : NTSTATUS
    fix_level_of_details : UInt32
    basic_data : GNSS_FIXDATA_BASIC_2
    accuracy_data : GNSS_FIXDATA_ACCURACY_2
    satellite_data : GNSS_FIXDATA_SATELLITE
  end
  struct GNSS_BREADCRUMBING_PARAM
    size : UInt32
    version : UInt32
    maximum_horizontal_uncertainty : UInt32
    min_distance_between_fixes : UInt32
    maximum_error_timeout_ms : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_BREADCRUMBING_ALERT_DATA
    size : UInt32
    version : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_BREADCRUMB_V1
    fix_time_stamp : FILETIME
    latitude : Float64
    longitude : Float64
    horizontal_accuracy : UInt32
    speed : UInt16
    speed_accuracy : UInt16
    altitude : Int16
    altitude_accuracy : UInt16
    heading : Int16
    heading_accuracy : UInt8
    fix_success : UInt8
  end
  struct GNSS_BREADCRUMB_LIST
    size : UInt32
    version : UInt32
    num_crumbs : UInt32
    anonymous : GNSS_BREADCRUMB_LIST_Anonymous_e__Union
  end
  struct GNSS_GEOREGION_CIRCLE
    latitude : Float64
    longitude : Float64
    radius_in_meters : Float64
  end
  struct GNSS_GEOREGION
    size : UInt32
    version : UInt32
    geo_region_type : GNSS_GEOREGIONTYPE
    anonymous : GNSS_GEOREGION_Anonymous_e__Union
  end
  struct GNSS_GEOFENCE_CREATE_PARAM
    size : UInt32
    version : UInt32
    alert_types : UInt32
    initial_state : GNSS_GEOFENCE_STATE
    boundary : GNSS_GEOREGION
    unused : UInt8[512]*
  end
  struct GNSS_GEOFENCE_CREATE_RESPONSE
    size : UInt32
    version : UInt32
    creation_status : NTSTATUS
    geofence_id : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_GEOFENCE_DELETE_PARAM
    size : UInt32
    version : UInt32
    geofence_id : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_GEOFENCE_ALERT_DATA
    size : UInt32
    version : UInt32
    geofence_id : UInt32
    geofence_state : GNSS_GEOFENCE_STATE
    fix_basic_data : GNSS_FIXDATA_BASIC
    fix_accuracy_data : GNSS_FIXDATA_ACCURACY
    unused : UInt8[512]*
  end
  struct GNSS_GEOFENCES_TRACKINGSTATUS_DATA
    size : UInt32
    version : UInt32
    status : NTSTATUS
    status_time_stamp : FILETIME
    unused : UInt8[512]*
  end
  struct GNSS_ERRORINFO
    size : UInt32
    version : UInt32
    error_code : UInt32
    is_recoverable : LibC::BOOL
    error_description : Char[256]*
    unused : UInt8[512]*
  end
  struct GNSS_NMEA_DATA
    size : UInt32
    version : UInt32
    nmea_sentences : CHAR[256]*
  end
  struct GNSS_AGNSS_REQUEST_PARAM
    size : UInt32
    version : UInt32
    request_type : GNSS_AGNSS_REQUEST_TYPE
    blob_format : UInt32
  end
  struct GNSS_SUPL_NI_INFO
    size : UInt32
    version : UInt32
    requestor_id : Char[260]*
    client_name : Char[260]*
    supl_ni_url : CHAR[260]*
  end
  struct GNSS_CP_NI_INFO
    size : UInt32
    version : UInt32
    requestor_id : Char[260]*
    notification_text : Char[260]*
  end
  struct GNSS_V2UPL_NI_INFO
    size : UInt32
    version : UInt32
    requestor_id : Char[260]*
  end
  struct GNSS_NI_REQUEST_PARAM
    size : UInt32
    version : UInt32
    request_id : UInt32
    request_type : GNSS_NI_REQUEST_TYPE
    notification_type : GNSS_NI_NOTIFICATION_TYPE
    request_plane_type : GNSS_NI_PLANE_TYPE
    anonymous : GNSS_NI_REQUEST_PARAM_Anonymous_e__Union
    response_time_in_sec : UInt32
    emergency_location : LibC::BOOL
  end
  struct GNSS_DRIVER_REQUEST_DATA
    size : UInt32
    version : UInt32
    request : GNSS_DRIVER_REQUEST
    request_flag : UInt32
  end
  struct GNSS_EVENT
    size : UInt32
    version : UInt32
    event_type : GNSS_EVENT_TYPE
    event_data_size : UInt32
    unused : UInt8[512]*
    anonymous : GNSS_EVENT_Anonymous_e__Union
  end
  struct GNSS_EVENT_2
    size : UInt32
    version : UInt32
    event_type : GNSS_EVENT_TYPE
    event_data_size : UInt32
    unused : UInt8[512]*
    anonymous : GNSS_EVENT_2_Anonymous_e__Union
  end
  struct GNSS_AGNSS_INJECTTIME
    size : UInt32
    version : UInt32
    utc_time : FILETIME
    time_uncertainty : UInt32
  end
  struct GNSS_AGNSS_INJECTPOSITION
    size : UInt32
    version : UInt32
    age : UInt32
    basic_data : GNSS_FIXDATA_BASIC
    accuracy_data : GNSS_FIXDATA_ACCURACY
  end
  struct GNSS_AGNSS_INJECTBLOB
    size : UInt32
    version : UInt32
    blob_oui : UInt32
    blob_version : UInt32
    agnss_format : UInt32
    blob_size : UInt32
    blob_data : UInt8[0]*
  end
  struct GNSS_AGNSS_INJECT
    size : UInt32
    version : UInt32
    injection_type : GNSS_AGNSS_REQUEST_TYPE
    injection_status : NTSTATUS
    injection_data_size : UInt32
    unused : UInt8[512]*
    anonymous : GNSS_AGNSS_INJECT_Anonymous_e__Union
  end
  struct GNSS_SUPL_HSLP_CONFIG
    size : UInt32
    version : UInt32
    supl_hslp : CHAR[260]*
    supl_hslp_from_imsi : CHAR[260]*
    reserved : UInt32
    unused : UInt8[512]*
  end
  struct GNSS_SUPL_CERT_CONFIG
    size : UInt32
    version : UInt32
    cert_action : GNSS_SUPL_CERT_ACTION
    supl_cert_name : CHAR[260]*
    cert_size : UInt32
    unused : UInt8[512]*
    cert_data : UInt8[0]*
  end
  struct GNSS_V2UPL_CONFIG
    size : UInt32
    version : UInt32
    mpc : CHAR[260]*
    pde : CHAR[260]*
    application_type_indicator_mr : UInt8
    unused : UInt8[512]*
  end
  struct GNSS_NI_RESPONSE
    size : UInt32
    version : UInt32
    request_id : UInt32
    user_response : GNSS_NI_USER_RESPONSE
  end
  struct GNSS_CWTESTDATA
    size : UInt32
    version : UInt32
    test_result_status : NTSTATUS
    signal_to_noise_ratio : Float64
    frequency : Float64
    unused : UInt8[512]*
  end
  struct GNSS_SELFTESTCONFIG
    size : UInt32
    version : UInt32
    test_type : UInt32
    unused : UInt8[512]*
    in_buf_len : UInt32
    in_buffer : UInt8[0]*
  end
  struct GNSS_SELFTESTRESULT
    size : UInt32
    version : UInt32
    test_result_status : NTSTATUS
    result : UInt32
    pin_failed_bit_mask : UInt32
    unused : UInt8[512]*
    out_buf_len : UInt32
    out_buffer : UInt8[0]*
  end
  struct GNSS_CHIPSETINFO
    size : UInt32
    version : UInt32
    manufacturer_id : Char[25]*
    hardware_id : Char[25]*
    firmware_version : Char[20]*
    unused : UInt8[512]*
  end


  struct ILocationReportVTbl
    query_interface : Proc(ILocationReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILocationReport*, UInt32)
    release : Proc(ILocationReport*, UInt32)
    get_sensor_id : Proc(ILocationReport*, Guid*, HRESULT)
    get_timestamp : Proc(ILocationReport*, SYSTEMTIME*, HRESULT)
    get_value : Proc(ILocationReport*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
  end

  ILocationReport_GUID = "c8b7f7ee-75d0-4db9-b62d-7a0f369ca456"
  IID_ILocationReport = LibC::GUID.new(0xc8b7f7ee_u32, 0x75d0_u16, 0x4db9_u16, StaticArray[0xb6_u8, 0x2d_u8, 0x7a_u8, 0xf_u8, 0x36_u8, 0x9c_u8, 0xa4_u8, 0x56_u8])
  struct ILocationReport
    lpVtbl : ILocationReportVTbl*
  end

  struct ILatLongReportVTbl
    query_interface : Proc(ILatLongReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILatLongReport*, UInt32)
    release : Proc(ILatLongReport*, UInt32)
    get_sensor_id : Proc(ILatLongReport*, Guid*, HRESULT)
    get_timestamp : Proc(ILatLongReport*, SYSTEMTIME*, HRESULT)
    get_value : Proc(ILatLongReport*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    get_latitude : Proc(ILatLongReport*, Float64*, HRESULT)
    get_longitude : Proc(ILatLongReport*, Float64*, HRESULT)
    get_error_radius : Proc(ILatLongReport*, Float64*, HRESULT)
    get_altitude : Proc(ILatLongReport*, Float64*, HRESULT)
    get_altitude_error : Proc(ILatLongReport*, Float64*, HRESULT)
  end

  ILatLongReport_GUID = "7fed806d-0ef8-4f07-80ac-36a0beae3134"
  IID_ILatLongReport = LibC::GUID.new(0x7fed806d_u32, 0xef8_u16, 0x4f07_u16, StaticArray[0x80_u8, 0xac_u8, 0x36_u8, 0xa0_u8, 0xbe_u8, 0xae_u8, 0x31_u8, 0x34_u8])
  struct ILatLongReport
    lpVtbl : ILatLongReportVTbl*
  end

  struct ICivicAddressReportVTbl
    query_interface : Proc(ICivicAddressReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICivicAddressReport*, UInt32)
    release : Proc(ICivicAddressReport*, UInt32)
    get_sensor_id : Proc(ICivicAddressReport*, Guid*, HRESULT)
    get_timestamp : Proc(ICivicAddressReport*, SYSTEMTIME*, HRESULT)
    get_value : Proc(ICivicAddressReport*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    get_address_line1 : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_address_line2 : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_city : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_state_province : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_postal_code : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_country_region : Proc(ICivicAddressReport*, UInt8**, HRESULT)
    get_detail_level : Proc(ICivicAddressReport*, UInt32*, HRESULT)
  end

  ICivicAddressReport_GUID = "c0b19f70-4adf-445d-87f2-cad8fd711792"
  IID_ICivicAddressReport = LibC::GUID.new(0xc0b19f70_u32, 0x4adf_u16, 0x445d_u16, StaticArray[0x87_u8, 0xf2_u8, 0xca_u8, 0xd8_u8, 0xfd_u8, 0x71_u8, 0x17_u8, 0x92_u8])
  struct ICivicAddressReport
    lpVtbl : ICivicAddressReportVTbl*
  end

  struct ILocationVTbl
    query_interface : Proc(ILocation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILocation*, UInt32)
    release : Proc(ILocation*, UInt32)
    register_for_report : Proc(ILocation*, ILocationEvents, Guid*, UInt32, HRESULT)
    unregister_for_report : Proc(ILocation*, Guid*, HRESULT)
    get_report : Proc(ILocation*, Guid*, ILocationReport*, HRESULT)
    get_report_status : Proc(ILocation*, Guid*, LOCATION_REPORT_STATUS*, HRESULT)
    get_report_interval : Proc(ILocation*, Guid*, UInt32*, HRESULT)
    set_report_interval : Proc(ILocation*, Guid*, UInt32, HRESULT)
    get_desired_accuracy : Proc(ILocation*, Guid*, LOCATION_DESIRED_ACCURACY*, HRESULT)
    set_desired_accuracy : Proc(ILocation*, Guid*, LOCATION_DESIRED_ACCURACY, HRESULT)
    request_permissions : Proc(ILocation*, LibC::HANDLE, Guid*, UInt32, LibC::BOOL, HRESULT)
  end

  ILocation_GUID = "ab2ece69-56d9-4f28-b525-de1b0ee44237"
  IID_ILocation = LibC::GUID.new(0xab2ece69_u32, 0x56d9_u16, 0x4f28_u16, StaticArray[0xb5_u8, 0x25_u8, 0xde_u8, 0x1b_u8, 0xe_u8, 0xe4_u8, 0x42_u8, 0x37_u8])
  struct ILocation
    lpVtbl : ILocationVTbl*
  end

  struct ILocationPowerVTbl
    query_interface : Proc(ILocationPower*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILocationPower*, UInt32)
    release : Proc(ILocationPower*, UInt32)
    connect : Proc(ILocationPower*, HRESULT)
    disconnect : Proc(ILocationPower*, HRESULT)
  end

  ILocationPower_GUID = "193e7729-ab6b-4b12-8617-7596e1bb191c"
  IID_ILocationPower = LibC::GUID.new(0x193e7729_u32, 0xab6b_u16, 0x4b12_u16, StaticArray[0x86_u8, 0x17_u8, 0x75_u8, 0x96_u8, 0xe1_u8, 0xbb_u8, 0x19_u8, 0x1c_u8])
  struct ILocationPower
    lpVtbl : ILocationPowerVTbl*
  end

  struct IDefaultLocationVTbl
    query_interface : Proc(IDefaultLocation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDefaultLocation*, UInt32)
    release : Proc(IDefaultLocation*, UInt32)
    set_report : Proc(IDefaultLocation*, Guid*, ILocationReport, HRESULT)
    get_report : Proc(IDefaultLocation*, Guid*, ILocationReport*, HRESULT)
  end

  IDefaultLocation_GUID = "a65af77e-969a-4a2e-8aca-33bb7cbb1235"
  IID_IDefaultLocation = LibC::GUID.new(0xa65af77e_u32, 0x969a_u16, 0x4a2e_u16, StaticArray[0x8a_u8, 0xca_u8, 0x33_u8, 0xbb_u8, 0x7c_u8, 0xbb_u8, 0x12_u8, 0x35_u8])
  struct IDefaultLocation
    lpVtbl : IDefaultLocationVTbl*
  end

  struct ILocationEventsVTbl
    query_interface : Proc(ILocationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILocationEvents*, UInt32)
    release : Proc(ILocationEvents*, UInt32)
    on_location_changed : Proc(ILocationEvents*, Guid*, ILocationReport, HRESULT)
    on_status_changed : Proc(ILocationEvents*, Guid*, LOCATION_REPORT_STATUS, HRESULT)
  end

  ILocationEvents_GUID = "cae02bbf-798b-4508-a207-35a7906dc73d"
  IID_ILocationEvents = LibC::GUID.new(0xcae02bbf_u32, 0x798b_u16, 0x4508_u16, StaticArray[0xa2_u8, 0x7_u8, 0x35_u8, 0xa7_u8, 0x90_u8, 0x6d_u8, 0xc7_u8, 0x3d_u8])
  struct ILocationEvents
    lpVtbl : ILocationEventsVTbl*
  end

  struct IDispLatLongReportVTbl
    query_interface : Proc(IDispLatLongReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDispLatLongReport*, UInt32)
    release : Proc(IDispLatLongReport*, UInt32)
    get_type_info_count : Proc(IDispLatLongReport*, UInt32*, HRESULT)
    get_type_info : Proc(IDispLatLongReport*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDispLatLongReport*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDispLatLongReport*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_latitude : Proc(IDispLatLongReport*, Float64*, HRESULT)
    get_longitude : Proc(IDispLatLongReport*, Float64*, HRESULT)
    get_error_radius : Proc(IDispLatLongReport*, Float64*, HRESULT)
    get_altitude : Proc(IDispLatLongReport*, Float64*, HRESULT)
    get_altitude_error : Proc(IDispLatLongReport*, Float64*, HRESULT)
    get_timestamp : Proc(IDispLatLongReport*, Float64*, HRESULT)
  end

  IDispLatLongReport_GUID = "8ae32723-389b-4a11-9957-5bdd48fc9617"
  IID_IDispLatLongReport = LibC::GUID.new(0x8ae32723_u32, 0x389b_u16, 0x4a11_u16, StaticArray[0x99_u8, 0x57_u8, 0x5b_u8, 0xdd_u8, 0x48_u8, 0xfc_u8, 0x96_u8, 0x17_u8])
  struct IDispLatLongReport
    lpVtbl : IDispLatLongReportVTbl*
  end

  struct IDispCivicAddressReportVTbl
    query_interface : Proc(IDispCivicAddressReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDispCivicAddressReport*, UInt32)
    release : Proc(IDispCivicAddressReport*, UInt32)
    get_type_info_count : Proc(IDispCivicAddressReport*, UInt32*, HRESULT)
    get_type_info : Proc(IDispCivicAddressReport*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDispCivicAddressReport*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDispCivicAddressReport*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_address_line1 : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_address_line2 : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_city : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_state_province : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_postal_code : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_country_region : Proc(IDispCivicAddressReport*, UInt8**, HRESULT)
    get_detail_level : Proc(IDispCivicAddressReport*, UInt32*, HRESULT)
    get_timestamp : Proc(IDispCivicAddressReport*, Float64*, HRESULT)
  end

  IDispCivicAddressReport_GUID = "16ff1a34-9e30-42c3-b44d-e22513b5767a"
  IID_IDispCivicAddressReport = LibC::GUID.new(0x16ff1a34_u32, 0x9e30_u16, 0x42c3_u16, StaticArray[0xb4_u8, 0x4d_u8, 0xe2_u8, 0x25_u8, 0x13_u8, 0xb5_u8, 0x76_u8, 0x7a_u8])
  struct IDispCivicAddressReport
    lpVtbl : IDispCivicAddressReportVTbl*
  end

  struct ILocationReportFactoryVTbl
    query_interface : Proc(ILocationReportFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILocationReportFactory*, UInt32)
    release : Proc(ILocationReportFactory*, UInt32)
    get_type_info_count : Proc(ILocationReportFactory*, UInt32*, HRESULT)
    get_type_info : Proc(ILocationReportFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ILocationReportFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ILocationReportFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    listen_for_reports : Proc(ILocationReportFactory*, UInt32, HRESULT)
    stop_listening_for_reports : Proc(ILocationReportFactory*, HRESULT)
    get_status : Proc(ILocationReportFactory*, UInt32*, HRESULT)
    get_report_interval : Proc(ILocationReportFactory*, UInt32*, HRESULT)
    put_report_interval : Proc(ILocationReportFactory*, UInt32, HRESULT)
    get_desired_accuracy : Proc(ILocationReportFactory*, UInt32*, HRESULT)
    put_desired_accuracy : Proc(ILocationReportFactory*, UInt32, HRESULT)
    request_permissions : Proc(ILocationReportFactory*, UInt32*, HRESULT)
  end

  ILocationReportFactory_GUID = "2daec322-90b2-47e4-bb08-0da841935a6b"
  IID_ILocationReportFactory = LibC::GUID.new(0x2daec322_u32, 0x90b2_u16, 0x47e4_u16, StaticArray[0xbb_u8, 0x8_u8, 0xd_u8, 0xa8_u8, 0x41_u8, 0x93_u8, 0x5a_u8, 0x6b_u8])
  struct ILocationReportFactory
    lpVtbl : ILocationReportFactoryVTbl*
  end

  struct ILatLongReportFactoryVTbl
    query_interface : Proc(ILatLongReportFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILatLongReportFactory*, UInt32)
    release : Proc(ILatLongReportFactory*, UInt32)
    get_type_info_count : Proc(ILatLongReportFactory*, UInt32*, HRESULT)
    get_type_info : Proc(ILatLongReportFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ILatLongReportFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ILatLongReportFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    listen_for_reports : Proc(ILatLongReportFactory*, UInt32, HRESULT)
    stop_listening_for_reports : Proc(ILatLongReportFactory*, HRESULT)
    get_status : Proc(ILatLongReportFactory*, UInt32*, HRESULT)
    get_report_interval : Proc(ILatLongReportFactory*, UInt32*, HRESULT)
    put_report_interval : Proc(ILatLongReportFactory*, UInt32, HRESULT)
    get_desired_accuracy : Proc(ILatLongReportFactory*, UInt32*, HRESULT)
    put_desired_accuracy : Proc(ILatLongReportFactory*, UInt32, HRESULT)
    request_permissions : Proc(ILatLongReportFactory*, UInt32*, HRESULT)
    get_lat_long_report : Proc(ILatLongReportFactory*, IDispLatLongReport*, HRESULT)
  end

  ILatLongReportFactory_GUID = "3f0804cb-b114-447d-83dd-390174ebb082"
  IID_ILatLongReportFactory = LibC::GUID.new(0x3f0804cb_u32, 0xb114_u16, 0x447d_u16, StaticArray[0x83_u8, 0xdd_u8, 0x39_u8, 0x1_u8, 0x74_u8, 0xeb_u8, 0xb0_u8, 0x82_u8])
  struct ILatLongReportFactory
    lpVtbl : ILatLongReportFactoryVTbl*
  end

  struct ICivicAddressReportFactoryVTbl
    query_interface : Proc(ICivicAddressReportFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICivicAddressReportFactory*, UInt32)
    release : Proc(ICivicAddressReportFactory*, UInt32)
    get_type_info_count : Proc(ICivicAddressReportFactory*, UInt32*, HRESULT)
    get_type_info : Proc(ICivicAddressReportFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICivicAddressReportFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICivicAddressReportFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    listen_for_reports : Proc(ICivicAddressReportFactory*, UInt32, HRESULT)
    stop_listening_for_reports : Proc(ICivicAddressReportFactory*, HRESULT)
    get_status : Proc(ICivicAddressReportFactory*, UInt32*, HRESULT)
    get_report_interval : Proc(ICivicAddressReportFactory*, UInt32*, HRESULT)
    put_report_interval : Proc(ICivicAddressReportFactory*, UInt32, HRESULT)
    get_desired_accuracy : Proc(ICivicAddressReportFactory*, UInt32*, HRESULT)
    put_desired_accuracy : Proc(ICivicAddressReportFactory*, UInt32, HRESULT)
    request_permissions : Proc(ICivicAddressReportFactory*, UInt32*, HRESULT)
    get_civic_address_report : Proc(ICivicAddressReportFactory*, IDispCivicAddressReport*, HRESULT)
  end

  ICivicAddressReportFactory_GUID = "bf773b93-c64f-4bee-beb2-67c0b8df66e0"
  IID_ICivicAddressReportFactory = LibC::GUID.new(0xbf773b93_u32, 0xc64f_u16, 0x4bee_u16, StaticArray[0xbe_u8, 0xb2_u8, 0x67_u8, 0xc0_u8, 0xb8_u8, 0xdf_u8, 0x66_u8, 0xe0_u8])
  struct ICivicAddressReportFactory
    lpVtbl : ICivicAddressReportFactoryVTbl*
  end

  struct IILatLongReportFactoryEventsVTbl
    query_interface : Proc(IILatLongReportFactoryEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IILatLongReportFactoryEvents*, UInt32)
    release : Proc(IILatLongReportFactoryEvents*, UInt32)
    get_type_info_count : Proc(IILatLongReportFactoryEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IILatLongReportFactoryEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IILatLongReportFactoryEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IILatLongReportFactoryEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IILatLongReportFactoryEvents_GUID = "16ee6cb7-ab3c-424b-849f-269be551fcbc"
  IID_IILatLongReportFactoryEvents = LibC::GUID.new(0x16ee6cb7_u32, 0xab3c_u16, 0x424b_u16, StaticArray[0x84_u8, 0x9f_u8, 0x26_u8, 0x9b_u8, 0xe5_u8, 0x51_u8, 0xfc_u8, 0xbc_u8])
  struct IILatLongReportFactoryEvents
    lpVtbl : IILatLongReportFactoryEventsVTbl*
  end

  struct IICivicAddressReportFactoryEventsVTbl
    query_interface : Proc(IICivicAddressReportFactoryEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IICivicAddressReportFactoryEvents*, UInt32)
    release : Proc(IICivicAddressReportFactoryEvents*, UInt32)
    get_type_info_count : Proc(IICivicAddressReportFactoryEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IICivicAddressReportFactoryEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IICivicAddressReportFactoryEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IICivicAddressReportFactoryEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IICivicAddressReportFactoryEvents_GUID = "c96039ff-72ec-4617-89bd-84d88bedc722"
  IID_IICivicAddressReportFactoryEvents = LibC::GUID.new(0xc96039ff_u32, 0x72ec_u16, 0x4617_u16, StaticArray[0x89_u8, 0xbd_u8, 0x84_u8, 0xd8_u8, 0x8b_u8, 0xed_u8, 0xc7_u8, 0x22_u8])
  struct IICivicAddressReportFactoryEvents
    lpVtbl : IICivicAddressReportFactoryEventsVTbl*
  end

end
struct LibWin32::ILocationReport
  def query_interface(this : ILocationReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILocationReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILocationReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sensor_id(this : ILocationReport*, psensorid : Guid*) : HRESULT
    @lpVtbl.value.get_sensor_id.call(this, psensorid)
  end
  def get_timestamp(this : ILocationReport*, pcreationtime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pcreationtime)
  end
  def get_value(this : ILocationReport*, pkey : PROPERTYKEY*, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, pkey, pvalue)
  end
end
struct LibWin32::ILatLongReport
  def query_interface(this : ILatLongReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILatLongReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILatLongReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sensor_id(this : ILatLongReport*, psensorid : Guid*) : HRESULT
    @lpVtbl.value.get_sensor_id.call(this, psensorid)
  end
  def get_timestamp(this : ILatLongReport*, pcreationtime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pcreationtime)
  end
  def get_value(this : ILatLongReport*, pkey : PROPERTYKEY*, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, pkey, pvalue)
  end
  def get_latitude(this : ILatLongReport*, platitude : Float64*) : HRESULT
    @lpVtbl.value.get_latitude.call(this, platitude)
  end
  def get_longitude(this : ILatLongReport*, plongitude : Float64*) : HRESULT
    @lpVtbl.value.get_longitude.call(this, plongitude)
  end
  def get_error_radius(this : ILatLongReport*, perrorradius : Float64*) : HRESULT
    @lpVtbl.value.get_error_radius.call(this, perrorradius)
  end
  def get_altitude(this : ILatLongReport*, paltitude : Float64*) : HRESULT
    @lpVtbl.value.get_altitude.call(this, paltitude)
  end
  def get_altitude_error(this : ILatLongReport*, paltitudeerror : Float64*) : HRESULT
    @lpVtbl.value.get_altitude_error.call(this, paltitudeerror)
  end
end
struct LibWin32::ICivicAddressReport
  def query_interface(this : ICivicAddressReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICivicAddressReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICivicAddressReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sensor_id(this : ICivicAddressReport*, psensorid : Guid*) : HRESULT
    @lpVtbl.value.get_sensor_id.call(this, psensorid)
  end
  def get_timestamp(this : ICivicAddressReport*, pcreationtime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pcreationtime)
  end
  def get_value(this : ICivicAddressReport*, pkey : PROPERTYKEY*, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, pkey, pvalue)
  end
  def get_address_line1(this : ICivicAddressReport*, pbstraddress1 : UInt8**) : HRESULT
    @lpVtbl.value.get_address_line1.call(this, pbstraddress1)
  end
  def get_address_line2(this : ICivicAddressReport*, pbstraddress2 : UInt8**) : HRESULT
    @lpVtbl.value.get_address_line2.call(this, pbstraddress2)
  end
  def get_city(this : ICivicAddressReport*, pbstrcity : UInt8**) : HRESULT
    @lpVtbl.value.get_city.call(this, pbstrcity)
  end
  def get_state_province(this : ICivicAddressReport*, pbstrstateprovince : UInt8**) : HRESULT
    @lpVtbl.value.get_state_province.call(this, pbstrstateprovince)
  end
  def get_postal_code(this : ICivicAddressReport*, pbstrpostalcode : UInt8**) : HRESULT
    @lpVtbl.value.get_postal_code.call(this, pbstrpostalcode)
  end
  def get_country_region(this : ICivicAddressReport*, pbstrcountryregion : UInt8**) : HRESULT
    @lpVtbl.value.get_country_region.call(this, pbstrcountryregion)
  end
  def get_detail_level(this : ICivicAddressReport*, pdetaillevel : UInt32*) : HRESULT
    @lpVtbl.value.get_detail_level.call(this, pdetaillevel)
  end
end
struct LibWin32::ILocation
  def query_interface(this : ILocation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILocation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILocation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_for_report(this : ILocation*, pevents : ILocationEvents, reporttype : Guid*, dwrequestedreportinterval : UInt32) : HRESULT
    @lpVtbl.value.register_for_report.call(this, pevents, reporttype, dwrequestedreportinterval)
  end
  def unregister_for_report(this : ILocation*, reporttype : Guid*) : HRESULT
    @lpVtbl.value.unregister_for_report.call(this, reporttype)
  end
  def get_report(this : ILocation*, reporttype : Guid*, pplocationreport : ILocationReport*) : HRESULT
    @lpVtbl.value.get_report.call(this, reporttype, pplocationreport)
  end
  def get_report_status(this : ILocation*, reporttype : Guid*, pstatus : LOCATION_REPORT_STATUS*) : HRESULT
    @lpVtbl.value.get_report_status.call(this, reporttype, pstatus)
  end
  def get_report_interval(this : ILocation*, reporttype : Guid*, pmilliseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_report_interval.call(this, reporttype, pmilliseconds)
  end
  def set_report_interval(this : ILocation*, reporttype : Guid*, millisecondsrequested : UInt32) : HRESULT
    @lpVtbl.value.set_report_interval.call(this, reporttype, millisecondsrequested)
  end
  def get_desired_accuracy(this : ILocation*, reporttype : Guid*, pdesiredaccuracy : LOCATION_DESIRED_ACCURACY*) : HRESULT
    @lpVtbl.value.get_desired_accuracy.call(this, reporttype, pdesiredaccuracy)
  end
  def set_desired_accuracy(this : ILocation*, reporttype : Guid*, desiredaccuracy : LOCATION_DESIRED_ACCURACY) : HRESULT
    @lpVtbl.value.set_desired_accuracy.call(this, reporttype, desiredaccuracy)
  end
  def request_permissions(this : ILocation*, hparent : LibC::HANDLE, preporttypes : Guid*, count : UInt32, fmodal : LibC::BOOL) : HRESULT
    @lpVtbl.value.request_permissions.call(this, hparent, preporttypes, count, fmodal)
  end
end
struct LibWin32::ILocationPower
  def query_interface(this : ILocationPower*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILocationPower*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILocationPower*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect(this : ILocationPower*) : HRESULT
    @lpVtbl.value.connect.call(this)
  end
  def disconnect(this : ILocationPower*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
end
struct LibWin32::IDefaultLocation
  def query_interface(this : IDefaultLocation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDefaultLocation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDefaultLocation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_report(this : IDefaultLocation*, reporttype : Guid*, plocationreport : ILocationReport) : HRESULT
    @lpVtbl.value.set_report.call(this, reporttype, plocationreport)
  end
  def get_report(this : IDefaultLocation*, reporttype : Guid*, pplocationreport : ILocationReport*) : HRESULT
    @lpVtbl.value.get_report.call(this, reporttype, pplocationreport)
  end
end
struct LibWin32::ILocationEvents
  def query_interface(this : ILocationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILocationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILocationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_location_changed(this : ILocationEvents*, reporttype : Guid*, plocationreport : ILocationReport) : HRESULT
    @lpVtbl.value.on_location_changed.call(this, reporttype, plocationreport)
  end
  def on_status_changed(this : ILocationEvents*, reporttype : Guid*, newstatus : LOCATION_REPORT_STATUS) : HRESULT
    @lpVtbl.value.on_status_changed.call(this, reporttype, newstatus)
  end
end
struct LibWin32::IDispLatLongReport
  def query_interface(this : IDispLatLongReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDispLatLongReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDispLatLongReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDispLatLongReport*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDispLatLongReport*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDispLatLongReport*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDispLatLongReport*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_latitude(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_latitude.call(this, pval)
  end
  def get_longitude(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_longitude.call(this, pval)
  end
  def get_error_radius(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_error_radius.call(this, pval)
  end
  def get_altitude(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_altitude.call(this, pval)
  end
  def get_altitude_error(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_altitude_error.call(this, pval)
  end
  def get_timestamp(this : IDispLatLongReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pval)
  end
end
struct LibWin32::IDispCivicAddressReport
  def query_interface(this : IDispCivicAddressReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDispCivicAddressReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDispCivicAddressReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDispCivicAddressReport*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDispCivicAddressReport*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDispCivicAddressReport*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDispCivicAddressReport*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_address_line1(this : IDispCivicAddressReport*, paddress1 : UInt8**) : HRESULT
    @lpVtbl.value.get_address_line1.call(this, paddress1)
  end
  def get_address_line2(this : IDispCivicAddressReport*, paddress2 : UInt8**) : HRESULT
    @lpVtbl.value.get_address_line2.call(this, paddress2)
  end
  def get_city(this : IDispCivicAddressReport*, pcity : UInt8**) : HRESULT
    @lpVtbl.value.get_city.call(this, pcity)
  end
  def get_state_province(this : IDispCivicAddressReport*, pstateprovince : UInt8**) : HRESULT
    @lpVtbl.value.get_state_province.call(this, pstateprovince)
  end
  def get_postal_code(this : IDispCivicAddressReport*, ppostalcode : UInt8**) : HRESULT
    @lpVtbl.value.get_postal_code.call(this, ppostalcode)
  end
  def get_country_region(this : IDispCivicAddressReport*, pcountryregion : UInt8**) : HRESULT
    @lpVtbl.value.get_country_region.call(this, pcountryregion)
  end
  def get_detail_level(this : IDispCivicAddressReport*, pdetaillevel : UInt32*) : HRESULT
    @lpVtbl.value.get_detail_level.call(this, pdetaillevel)
  end
  def get_timestamp(this : IDispCivicAddressReport*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pval)
  end
end
struct LibWin32::ILocationReportFactory
  def query_interface(this : ILocationReportFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILocationReportFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILocationReportFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ILocationReportFactory*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ILocationReportFactory*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ILocationReportFactory*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ILocationReportFactory*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def listen_for_reports(this : ILocationReportFactory*, requestedreportinterval : UInt32) : HRESULT
    @lpVtbl.value.listen_for_reports.call(this, requestedreportinterval)
  end
  def stop_listening_for_reports(this : ILocationReportFactory*) : HRESULT
    @lpVtbl.value.stop_listening_for_reports.call(this)
  end
  def get_status(this : ILocationReportFactory*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pval)
  end
  def get_report_interval(this : ILocationReportFactory*, pmilliseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_report_interval.call(this, pmilliseconds)
  end
  def put_report_interval(this : ILocationReportFactory*, millisecondsrequested : UInt32) : HRESULT
    @lpVtbl.value.put_report_interval.call(this, millisecondsrequested)
  end
  def get_desired_accuracy(this : ILocationReportFactory*, pdesiredaccuracy : UInt32*) : HRESULT
    @lpVtbl.value.get_desired_accuracy.call(this, pdesiredaccuracy)
  end
  def put_desired_accuracy(this : ILocationReportFactory*, desiredaccuracy : UInt32) : HRESULT
    @lpVtbl.value.put_desired_accuracy.call(this, desiredaccuracy)
  end
  def request_permissions(this : ILocationReportFactory*, hwnd : UInt32*) : HRESULT
    @lpVtbl.value.request_permissions.call(this, hwnd)
  end
end
struct LibWin32::ILatLongReportFactory
  def query_interface(this : ILatLongReportFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILatLongReportFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILatLongReportFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ILatLongReportFactory*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ILatLongReportFactory*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ILatLongReportFactory*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ILatLongReportFactory*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def listen_for_reports(this : ILatLongReportFactory*, requestedreportinterval : UInt32) : HRESULT
    @lpVtbl.value.listen_for_reports.call(this, requestedreportinterval)
  end
  def stop_listening_for_reports(this : ILatLongReportFactory*) : HRESULT
    @lpVtbl.value.stop_listening_for_reports.call(this)
  end
  def get_status(this : ILatLongReportFactory*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pval)
  end
  def get_report_interval(this : ILatLongReportFactory*, pmilliseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_report_interval.call(this, pmilliseconds)
  end
  def put_report_interval(this : ILatLongReportFactory*, millisecondsrequested : UInt32) : HRESULT
    @lpVtbl.value.put_report_interval.call(this, millisecondsrequested)
  end
  def get_desired_accuracy(this : ILatLongReportFactory*, pdesiredaccuracy : UInt32*) : HRESULT
    @lpVtbl.value.get_desired_accuracy.call(this, pdesiredaccuracy)
  end
  def put_desired_accuracy(this : ILatLongReportFactory*, desiredaccuracy : UInt32) : HRESULT
    @lpVtbl.value.put_desired_accuracy.call(this, desiredaccuracy)
  end
  def request_permissions(this : ILatLongReportFactory*, hwnd : UInt32*) : HRESULT
    @lpVtbl.value.request_permissions.call(this, hwnd)
  end
  def get_lat_long_report(this : ILatLongReportFactory*, pval : IDispLatLongReport*) : HRESULT
    @lpVtbl.value.get_lat_long_report.call(this, pval)
  end
end
struct LibWin32::ICivicAddressReportFactory
  def query_interface(this : ICivicAddressReportFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICivicAddressReportFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICivicAddressReportFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICivicAddressReportFactory*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICivicAddressReportFactory*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICivicAddressReportFactory*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICivicAddressReportFactory*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def listen_for_reports(this : ICivicAddressReportFactory*, requestedreportinterval : UInt32) : HRESULT
    @lpVtbl.value.listen_for_reports.call(this, requestedreportinterval)
  end
  def stop_listening_for_reports(this : ICivicAddressReportFactory*) : HRESULT
    @lpVtbl.value.stop_listening_for_reports.call(this)
  end
  def get_status(this : ICivicAddressReportFactory*, pval : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pval)
  end
  def get_report_interval(this : ICivicAddressReportFactory*, pmilliseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_report_interval.call(this, pmilliseconds)
  end
  def put_report_interval(this : ICivicAddressReportFactory*, millisecondsrequested : UInt32) : HRESULT
    @lpVtbl.value.put_report_interval.call(this, millisecondsrequested)
  end
  def get_desired_accuracy(this : ICivicAddressReportFactory*, pdesiredaccuracy : UInt32*) : HRESULT
    @lpVtbl.value.get_desired_accuracy.call(this, pdesiredaccuracy)
  end
  def put_desired_accuracy(this : ICivicAddressReportFactory*, desiredaccuracy : UInt32) : HRESULT
    @lpVtbl.value.put_desired_accuracy.call(this, desiredaccuracy)
  end
  def request_permissions(this : ICivicAddressReportFactory*, hwnd : UInt32*) : HRESULT
    @lpVtbl.value.request_permissions.call(this, hwnd)
  end
  def get_civic_address_report(this : ICivicAddressReportFactory*, pval : IDispCivicAddressReport*) : HRESULT
    @lpVtbl.value.get_civic_address_report.call(this, pval)
  end
end
struct LibWin32::IILatLongReportFactoryEvents
  def query_interface(this : IILatLongReportFactoryEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IILatLongReportFactoryEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IILatLongReportFactoryEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IILatLongReportFactoryEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IILatLongReportFactoryEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IILatLongReportFactoryEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IILatLongReportFactoryEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IICivicAddressReportFactoryEvents
  def query_interface(this : IICivicAddressReportFactoryEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IICivicAddressReportFactoryEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IICivicAddressReportFactoryEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IICivicAddressReportFactoryEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IICivicAddressReportFactoryEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IICivicAddressReportFactoryEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IICivicAddressReportFactoryEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
